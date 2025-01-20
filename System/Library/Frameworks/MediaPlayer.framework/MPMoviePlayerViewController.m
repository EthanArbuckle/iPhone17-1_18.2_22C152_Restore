@interface MPMoviePlayerViewController
- (MPMoviePlayerController)moviePlayer;
- (MPMoviePlayerViewController)initWithCoder:(id)a3;
- (MPMoviePlayerViewController)initWithContentURL:(NSURL *)contentURL;
- (MPMoviePlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation MPMoviePlayerViewController

- (void).cxx_destruct
{
}

- (MPMoviePlayerController)moviePlayer
{
  return self->_moviePlayer;
}

- (void)loadView
{
  id v3 = [(MPMoviePlayerController *)self->_moviePlayer view];
  [(MPMoviePlayerViewController *)self setView:v3];
}

- (MPMoviePlayerViewController)initWithContentURL:(NSURL *)contentURL
{
  v4 = contentURL;
  v9.receiver = self;
  v9.super_class = (Class)MPMoviePlayerViewController;
  v5 = [(MPMoviePlayerViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = [[MPMoviePlayerController alloc] initWithContentURL:v4];
    moviePlayer = v5->_moviePlayer;
    v5->_moviePlayer = v6;

    [(MPMoviePlayerController *)v5->_moviePlayer setHostingViewController:v5];
  }

  return v5;
}

- (MPMoviePlayerViewController)initWithCoder:(id)a3
{
  return [(MPMoviePlayerViewController *)self initWithContentURL:0];
}

- (MPMoviePlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MPMoviePlayerViewController initWithContentURL:](self, "initWithContentURL:", 0, a4);
}

@end