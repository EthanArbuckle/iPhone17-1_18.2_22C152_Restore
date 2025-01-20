@interface AKAuthorizationContainerViewController
- (AKAuthorizationContainerViewController)init;
- (AKAuthorizationContainerViewController)initWithCoder:(id)a3;
- (AKAuthorizationContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AKAuthorizationContainerViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4;
- (AKAuthorizationContainerViewControllerDelegate)delegate;
- (AKAuthorizationPaneViewControllerDelegate)paneDelegate;
- (AKAuthorizationPresentationContext)presentationContext;
- (UIViewController)rootViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)_clearPaneDelegateForViewController:(id)a3;
- (void)_setPaneDelegate:(id)a3 forViewController:(id)a4;
- (void)_setPaneDelegateForTopViewController;
- (void)_setPaneDelegateForViewController:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setPaneDelegate:(id)a3;
- (void)setRootViewController:(id)a3;
@end

@implementation AKAuthorizationContainerViewController

- (AKAuthorizationContainerViewController)init
{
  return [(AKAuthorizationContainerViewController *)self initWithRootViewController:0 authorizationContext:0];
}

- (AKAuthorizationContainerViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    v13 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    if (v14 == 1) {
      v15 = AKAuthorizationContaineriPadViewController;
    }
    else {
      v15 = AKAuthorizationContaineriPhoneViewController;
    }
    v12 = (AKAuthorizationContainerViewController *)[[v15 alloc] initWithRootViewController:v7 authorizationContext:v8];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)AKAuthorizationContainerViewController;
    v10 = [(AKAuthorizationContainerViewController *)&v18 initWithNibName:0 bundle:0];
    p_isa = (id *)&v10->super.super.super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_rootViewController, a3);
      objc_storeStrong(p_isa + 123, a4);
    }
    v12 = p_isa;
    self = v12;
  }
  v16 = v12;

  return v16;
}

- (AKAuthorizationContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (AKAuthorizationContainerViewController)initWithCoder:(id)a3
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)setPaneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_paneDelegate, a3);

  [(AKAuthorizationContainerViewController *)self _setPaneDelegateForTopViewController];
}

- (void)_setPaneDelegateForTopViewController
{
  uint64_t v3 = [(AKAuthorizationContainerViewController *)self rootViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(AKAuthorizationContainerViewController *)self rootViewController];
    v5 = [v6 topViewController];
    [(AKAuthorizationContainerViewController *)self _setPaneDelegateForViewController:v5];
  }
}

- (void)_setPaneDelegateForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAuthorizationContainerViewController *)self paneDelegate];
  [(AKAuthorizationContainerViewController *)self _setPaneDelegate:v5 forViewController:v4];
}

- (void)_clearPaneDelegateForViewController:(id)a3
{
}

- (void)_setPaneDelegate:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setPaneDelegate:v6];
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a4;
  id v7 = [a3 topViewController];
  [(AKAuthorizationContainerViewController *)self _clearPaneDelegateForViewController:v7];

  [(AKAuthorizationContainerViewController *)self _setPaneDelegateForViewController:v8];
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (AKAuthorizationContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAuthorizationContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAuthorizationPaneViewControllerDelegate)paneDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paneDelegate);

  return (AKAuthorizationPaneViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_paneDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationContext, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end