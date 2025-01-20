@interface SiriUSCardSnippetViewController
- (SiriUSCardSnippetViewController)initWithUniversalSearchCard:(id)a3 snippet:(id)a4;
- (double)desiredHeightForWidth:(double)a3;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation SiriUSCardSnippetViewController

- (SiriUSCardSnippetViewController)initWithUniversalSearchCard:(id)a3 snippet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriUSCardSnippetViewController;
  v8 = [(SiriUSCardSnippetViewController *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[SearchUI cardViewControllerForCard:v6 feedbackDelegate:0];
    cardViewController = v8->_cardViewController;
    v8->_cardViewController = (UIViewController *)v9;

    [(SiriUSCardSnippetViewController *)v8 setSnippet:v7];
    -[SiriUSCardSnippetViewController setDefaultViewInsets:](v8, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(SiriUSCardSnippetViewController *)v8 setIsTransparent:1];
  }

  return v8;
}

- (double)desiredHeightForWidth:(double)a3
{
  [(UIViewController *)self->_cardViewController preferredContentSize];
  return v3;
}

- (void)loadView
{
  id v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(SiriUSCardSnippetViewController *)self setView:v4];
  [(SiriUSCardSnippetViewController *)self addChildViewController:self->_cardViewController];
  double v3 = [(UIViewController *)self->_cardViewController view];
  [v4 addSubview:v3];

  [(UIViewController *)self->_cardViewController didMoveToParentViewController:self];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUSCardSnippetViewController;
  [(SiriUSCardSnippetViewController *)&v5 viewWillLayoutSubviews];
  double v3 = [(UIViewController *)self->_cardViewController view];
  id v4 = [(SiriUSCardSnippetViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void).cxx_destruct
{
}

@end