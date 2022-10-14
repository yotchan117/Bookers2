class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @bookshow = Book.find(params[:id])
    @user = @bookshow.user
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
    @bookshow = Book.find(params[:id])
    @bookshow.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
