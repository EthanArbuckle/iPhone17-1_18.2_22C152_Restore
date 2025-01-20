@interface AAUIViewServiceRootViewController
- (AAUIRemoteViewController)aauiRemoteViewController;
- (void)loadView;
- (void)notifyFlowCompletionWithCancellation;
- (void)setAauiRemoteViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AAUIViewServiceRootViewController

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(AAUIViewServiceRootViewController *)self setView:v3];

  id v5 = +[UIColor clearColor];
  v4 = [(AAUIViewServiceRootViewController *)self view];
  [v4 setBackgroundColor:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIViewServiceRootViewController;
  [(AAUIViewServiceRootViewController *)&v3 viewDidLoad];
  [(AAUIRemoteViewController *)self->_aauiRemoteViewController prepareViewServiceForPresentation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIViewServiceRootViewController;
  [(AAUIViewServiceRootViewController *)&v4 viewDidAppear:a3];
  [(AAUIViewServiceRootViewController *)self presentViewController:self->_aauiRemoteViewController animated:0 completion:0];
}

- (void)notifyFlowCompletionWithCancellation
{
}

- (AAUIRemoteViewController)aauiRemoteViewController
{
  return self->_aauiRemoteViewController;
}

- (void)setAauiRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end