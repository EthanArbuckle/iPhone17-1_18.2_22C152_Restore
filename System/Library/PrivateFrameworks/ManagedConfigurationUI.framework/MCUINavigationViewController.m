@interface MCUINavigationViewController
- (BOOL)shouldAutorotate;
- (id)showViewControllerCompletionBlock;
- (unint64_t)supportedInterfaceOrientations;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)setShowViewControllerCompletionBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCUINavigationViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MCUINavigationViewController;
  [(MCUINavigationViewController *)&v4 viewDidLoad];
  if (MCUIForPairedDevice())
  {
    v3 = [(MCUINavigationViewController *)self navigationBar];
    BPSApplyStyleToNavBar();
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)MCUINavigationViewController;
  -[MCUINavigationViewController didShowViewController:animated:](&v7, sel_didShowViewController_animated_, a3);
  v6 = [(MCUINavigationViewController *)self showViewControllerCompletionBlock];
  [(MCUINavigationViewController *)self setShowViewControllerCompletionBlock:0];
  if (v6) {
    v6[2](v6, v4);
  }
}

- (id)showViewControllerCompletionBlock
{
  return self->_showViewControllerCompletionBlock;
}

- (void)setShowViewControllerCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end