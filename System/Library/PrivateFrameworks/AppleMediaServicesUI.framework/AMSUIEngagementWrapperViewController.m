@interface AMSUIEngagementWrapperViewController
- (AMSUIEngagementWrapperViewController)initWithViewController:(id)a3;
- (BOOL)isInViewServiceProcess;
- (UIViewController)viewController;
- (id)dismissBlock;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)dealloc;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDismissBlock:(id)a3;
- (void)updateContentOverlayInsetsOnTraitCollectionChange;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUIEngagementWrapperViewController

- (AMSUIEngagementWrapperViewController)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIEngagementWrapperViewController;
  v6 = [(AMSUIEngagementWrapperViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewController, a3);
    [(AMSUIEngagementWrapperViewController *)v7 _setup];
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(AMSUIEngagementWrapperViewController *)self dismissBlock];

  if (v3)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v4)
    {
      v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEBUG, "dismissing via dealloc", buf, 2u);
    }

    v6 = [(AMSUIEngagementWrapperViewController *)self dismissBlock];
    v6[2]();

    [(AMSUIEngagementWrapperViewController *)self setDismissBlock:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)AMSUIEngagementWrapperViewController;
  [(AMSUICommonViewController *)&v7 dealloc];
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ([(AMSUIEngagementWrapperViewController *)self isInViewServiceProcess]
    && ([(AMSUIEngagementWrapperViewController *)self traitCollection],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 verticalSizeClass],
        v8,
        v9 == 1))
  {
    if (left >= right) {
      double v10 = left;
    }
    else {
      double v10 = right;
    }
    -[AMSUIEngagementWrapperViewController _setContentOverlayInsets:](&v12, sel__setContentOverlayInsets_, 0.0, v10, bottom, v10, v11.receiver, v11.super_class, self, AMSUIEngagementWrapperViewController);
  }
  else
  {
    -[AMSUIEngagementWrapperViewController _setContentOverlayInsets:](&v11, sel__setContentOverlayInsets_, top, left, bottom, right, self, AMSUIEngagementWrapperViewController, v12.receiver, v12.super_class);
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUIEngagementWrapperViewController;
  [(AMSUICommonViewController *)&v5 loadView];
  v3 = [(AMSUIEngagementWrapperViewController *)self viewController];
  v4.receiver = self;
  v4.super_class = (Class)AMSUIEngagementWrapperViewController;
  [(AMSUICommonViewController *)&v4 setChildViewController:v3];

  [(AMSUIEngagementWrapperViewController *)self updateContentOverlayInsetsOnTraitCollectionChange];
}

- (void)updateContentOverlayInsetsOnTraitCollectionChange
{
  v7[1] = *MEMORY[0x263EF8340];
  if ([(AMSUIEngagementWrapperViewController *)self isInViewServiceProcess])
  {
    v3 = [(AMSUICommonViewController *)self view];
    v7[0] = objc_opt_class();
    objc_super v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __89__AMSUIEngagementWrapperViewController_updateContentOverlayInsetsOnTraitCollectionChange__block_invoke;
    v6[3] = &unk_2643E3BB8;
    v6[4] = self;
    id v5 = (id)[v3 registerForTraitChanges:v4 withHandler:v6];
  }
}

uint64_t __89__AMSUIEngagementWrapperViewController_updateContentOverlayInsetsOnTraitCollectionChange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _contentOverlayInsets];
  return objc_msgSend(v1, "_setContentOverlayInsets:");
}

- (BOOL)isInViewServiceProcess
{
  v2 = [MEMORY[0x263F27E08] currentProcess];
  v3 = [v2 executableName];
  char v4 = [v3 isEqual:@"AMSEngagementViewService"];

  return v4;
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementWrapperViewController;
  [(AMSUIEngagementWrapperViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(AMSUIEngagementWrapperViewController *)self viewController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIEngagementWrapperViewController;
  [(AMSUIEngagementWrapperViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIEngagementWrapperViewController;
  [(AMSUIEngagementWrapperViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v5 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v5)
  {
    double v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v22 = [(AMSUIEngagementWrapperViewController *)self isBeingDismissed];
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEBUG, "dismissal isBeingDismissed %d", buf, 8u);
  }

  double v7 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v7)
  {
    double v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    double v9 = [(AMSUIEngagementWrapperViewController *)self navigationController];
    int v10 = [v9 isBeingDismissed];
    *(_DWORD *)buf = 67109120;
    int v22 = v10;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEBUG, "dismissal navigationController isBeingDismissed %d", buf, 8u);
  }
  double v11 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v11)
  {
    double v11 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  objc_super v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = [(AMSUIEngagementWrapperViewController *)self isMovingFromParentViewController];
    *(_DWORD *)buf = 67109120;
    int v22 = v13;
    _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEBUG, "dismissal isMovingFromParentViewController %d", buf, 8u);
  }

  if (([(AMSUIEngagementWrapperViewController *)self isBeingDismissed] & 1) == 0)
  {
    objc_super v14 = [(AMSUIEngagementWrapperViewController *)self navigationController];
    if ([v14 isBeingDismissed])
    {
    }
    else
    {
      int v15 = [(AMSUIEngagementWrapperViewController *)self isMovingFromParentViewController];

      if (!v15) {
        goto LABEL_23;
      }
    }
  }
  v16 = [(AMSUIEngagementWrapperViewController *)self dismissBlock];

  if (v16)
  {
    v17 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v17)
    {
      v17 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C134000, v18, OS_LOG_TYPE_DEBUG, "dismissing from view did disappear", buf, 2u);
    }

    v19 = [(AMSUIEngagementWrapperViewController *)self dismissBlock];
    v19[2]();

    [(AMSUIEngagementWrapperViewController *)self setDismissBlock:0];
  }
LABEL_23:
  v20.receiver = self;
  v20.super_class = (Class)AMSUIEngagementWrapperViewController;
  [(AMSUIEngagementWrapperViewController *)&v20 viewDidDisappear:v3];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  double v4 = [(AMSUIEngagementWrapperViewController *)self dismissBlock];

  if (v4)
  {
    double v5 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v5)
    {
      double v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEBUG, "dismissing from presentation controller did dismiss.", v8, 2u);
    }

    double v7 = [(AMSUIEngagementWrapperViewController *)self dismissBlock];
    v7[2]();

    [(AMSUIEngagementWrapperViewController *)self setDismissBlock:0];
  }
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
}

@end