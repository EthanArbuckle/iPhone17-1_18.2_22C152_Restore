@interface AMSUIEngagementCardWrapperViewController
- (AMSUIEngagementCardWrapperViewController)initWithViewController:(id)a3;
- (BOOL)allowsPullToDismiss;
- (UINavigationController)childNavigationController;
- (UIViewController)viewController;
- (int64_t)presentationStyle;
- (void)setChildNavigationController:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUIEngagementCardWrapperViewController

- (AMSUIEngagementCardWrapperViewController)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIEngagementCardWrapperViewController;
  v6 = [(AMSUIEngagementCardWrapperViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AMSUIEngagementCardWrapperViewController;
  [(AMSUIEngagementCardWrapperViewController *)&v8 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F829B8]);
  v4 = [(AMSUIEngagementCardWrapperViewController *)self viewController];
  id v5 = (void *)[v3 initWithRootViewController:v4];

  v6 = [v5 navigationBar];
  [v6 setRequestedContentSize:3];

  [(AMSUIEngagementCardWrapperViewController *)self setChildNavigationController:v5];
  v7 = [(AMSUIEngagementCardWrapperViewController *)self childNavigationController];
  [(AMSUICommonViewController *)self setChildViewController:v7];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementCardWrapperViewController;
  [(AMSUIEngagementCardWrapperViewController *)&v14 viewWillLayoutSubviews];
  id v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMSUIEngagementCardWrapperViewController *)self childNavigationController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
  if (a3 == 5)
  {
    PRXIsPad();
    PRXExpectedCardWidthForStyle();
  }
  else
  {
    if (a3 != 4) {
      return;
    }
    PRXCardDefaultSize();
  }
  -[AMSUIEngagementCardWrapperViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)allowsPullToDismiss
{
  return 1;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UINavigationController)childNavigationController
{
  return self->_childNavigationController;
}

- (void)setChildNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNavigationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end