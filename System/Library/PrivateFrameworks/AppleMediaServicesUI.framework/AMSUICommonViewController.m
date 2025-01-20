@interface AMSUICommonViewController
- (AMSUICommonView)view;
- (AMSUICommonViewController)init;
- (void)dealloc;
- (void)loadView;
- (void)setChildViewController:(id)a3;
- (void)setView:(id)a3;
- (void)unsetChildViewController:(id)a3;
@end

@implementation AMSUICommonViewController

- (AMSUICommonViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonViewController;
  return [(AMSUICommonViewController *)&v3 initWithNibName:0 bundle:0];
}

- (void)dealloc
{
  [(AMSUICommonViewController *)self _unregisterNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonViewController;
  [(AMSUICommonViewController *)&v3 dealloc];
}

- (AMSUICommonView)view
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUICommonViewController;
  v2 = [(AMSUICommonViewController *)&v4 view];
  return (AMSUICommonView *)v2;
}

- (void)setView:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonViewController;
  [(AMSUICommonViewController *)&v3 setView:a3];
}

- (void)setChildViewController:(id)a3
{
  id v16 = a3;
  [(AMSUICommonViewController *)self addChildViewController:v16];
  objc_super v4 = [(AMSUICommonViewController *)self view];
  v5 = [v16 view];
  [v4 addSubview:v5];

  v6 = [(AMSUICommonViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v16 view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  [v16 didMoveToParentViewController:self];
}

- (void)unsetChildViewController:(id)a3
{
  id v4 = a3;
  [v4 willMoveToParentViewController:0];
  objc_super v3 = [v4 view];
  [v3 removeFromSuperview];

  [v4 removeFromParentViewController];
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(AMSUICommonView);
  [(AMSUICommonViewController *)self setView:v3];
}

@end