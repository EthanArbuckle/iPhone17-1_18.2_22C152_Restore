@interface SiriGKImageDetailViewController
- (SiriGKImageDetailViewController)initWithImageViewSnippet:(id)a3;
- (double)desiredHeightForWidth:(double)a3;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragItem;
- (id)navigationTitle;
- (void)loadView;
- (void)setAceObject:(id)a3;
- (void)siriGeneralKnowledgeImageDetailViewImageTapped:(id)a3;
@end

@implementation SiriGKImageDetailViewController

- (SiriGKImageDetailViewController)initWithImageViewSnippet:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriGKImageDetailViewController;
  v5 = [(SiriGKImageDetailViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(SiriGKImageDetailViewController *)v5 setAceObject:v4];
  }

  return v6;
}

- (void)setAceObject:(id)a3
{
  v5 = (SAUIImageView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriGKImageDetailViewController;
  [(SiriGKImageDetailViewController *)&v8 setAceObject:v5];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SiriGKImageDetailViewController.m" lineNumber:41 description:@"Expected SAUIImageView"];
  }
  imageViewSnippet = self->_imageViewSnippet;
  self->_imageViewSnippet = v5;
}

- (void)siriGeneralKnowledgeImageDetailViewImageTapped:(id)a3
{
  id v4 = [(SAUIImageView *)self->_imageViewSnippet commands];

  id v8 = [(SiriGKImageDetailViewController *)self delegate];
  imageViewSnippet = self->_imageViewSnippet;
  if (v4)
  {
    v6 = [(SAUIImageView *)imageViewSnippet commands];
    [v8 siriViewController:self performAceCommands:v6];
  }
  else
  {
    v6 = [(SAUIImageView *)imageViewSnippet image];
    v7 = [v6 resourceUrl];
    [v8 siriViewController:self openURL:v7 completion:0];
  }
}

- (void)loadView
{
  v3 = [(SiriGKImageDetailViewController *)self delegate];
  [v3 siriViewControllerExpectedWidth:self];
  double v5 = v4;

  v6 = [[SiriGKImageDetailView alloc] initWithAceImageView:self->_imageViewSnippet expectedWidth:v5];
  imageDetailView = self->_imageDetailView;
  self->_imageDetailView = v6;

  [(SiriGKImageDetailView *)self->_imageDetailView setDelegate:self];
  id v8 = self->_imageDetailView;

  [(SiriGKImageDetailViewController *)self setView:v8];
}

- (double)desiredHeightForWidth:(double)a3
{
  double v4 = [(SiriGKImageDetailViewController *)self delegate];
  [v4 siriViewControllerVisibleContentArea:self];
  double v6 = v5;

  return v6;
}

- (id)navigationTitle
{
  return 0;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  double v4 = [(SiriGKImageDetailViewController *)self dragItem];
  v7 = v4;
  double v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return v5;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double v5 = [(SiriGKImageDetailViewController *)self dragItem];
  id v8 = v5;
  double v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return v6;
}

- (id)dragItem
{
  id v3 = objc_alloc((Class)NSItemProvider);
  double v4 = [(SiriGKImageDetailView *)self->_imageDetailView displayedImage];
  id v5 = [v3 initWithObject:v4];

  id v6 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDetailView, 0);

  objc_storeStrong((id *)&self->_imageViewSnippet, 0);
}

@end