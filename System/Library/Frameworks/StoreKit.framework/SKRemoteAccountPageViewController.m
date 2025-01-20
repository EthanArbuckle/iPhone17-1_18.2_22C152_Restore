@interface SKRemoteAccountPageViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SKAccountPageViewController)accountPageViewController;
- (id)disconnect;
- (void)didFinishLoading;
- (void)didPrepareWithResult:(id)a3 error:(id)a4;
- (void)dismissBridgedViewController;
- (void)dismissViewControllerWithResult:(id)a3 error:(id)a4;
- (void)financeInterruptionResolved:(BOOL)a3;
- (void)overrideCreditCardPresentationWithCompletion:(id)a3;
- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4;
- (void)overrideRedeemCameraWithCompletion:(id)a3;
- (void)popBridgedViewControllersToIndex:(unint64_t)a3;
- (void)presentBridgedViewController;
- (void)pushBridgedViewControllerAnimated:(BOOL)a3 options:(id)a4;
- (void)setAccountPageViewController:(id)a3;
- (void)setBridgedNavigationItemWithOptions:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SKRemoteAccountPageViewController

+ (id)exportedInterface
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08DCB18];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  getSKUIRedeemClass();
  v7[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_overrideRedeemCameraWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)serviceViewControllerInterface
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F1668];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  getSKUIRedeemClass();
  v7[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_performRedeemOperationWithCode_cameraRecognized_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  p_accountPageViewController = &self->_accountPageViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  [WeakRetained _dismissViewControllerWithResult:0 error:v4];
}

- (void)didPrepareWithResult:(id)a3 error:(id)a4
{
  p_accountPageViewController = &self->_accountPageViewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  uint64_t v8 = [v7 BOOLValue];

  [WeakRetained _didPrepareWithResult:v8 error:v6];
}

- (void)didFinishLoading
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  [WeakRetained _didFinishLoading];
}

- (void)dismissViewControllerWithResult:(id)a3 error:(id)a4
{
  p_accountPageViewController = &self->_accountPageViewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  uint64_t v8 = [v7 BOOLValue];

  [WeakRetained _dismissViewControllerWithResult:v8 error:v6];
}

- (void)financeInterruptionResolved:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  [WeakRetained _financeInterruptionResolved:v3];
}

- (void)overrideCreditCardPresentationWithCompletion:(id)a3
{
  p_accountPageViewController = &self->_accountPageViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  [WeakRetained _overrideCreditCardPresentationWithCompletion:v4];
}

- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4
{
  p_accountPageViewController = &self->_accountPageViewController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  [WeakRetained _overrideRedeemCameraPerformAction:a3 withObject:v6];
}

- (void)overrideRedeemCameraWithCompletion:(id)a3
{
  p_accountPageViewController = &self->_accountPageViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  [WeakRetained _overrideRedeemCameraWithCompletion:v4];
}

- (void)setBridgedNavigationItemWithOptions:(id)a3
{
  p_accountPageViewController = &self->_accountPageViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  [WeakRetained _setBridgedNavigationItemWithOptions:v4];
}

- (void)pushBridgedViewControllerAnimated:(BOOL)a3 options:(id)a4
{
  BOOL v4 = a3;
  p_accountPageViewController = &self->_accountPageViewController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  [WeakRetained _pushBridgedViewControllerAnimated:v4 options:v6];
}

- (void)popBridgedViewControllersToIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  [WeakRetained _popBridgedViewControllersToIndex:a3];
}

- (void)presentBridgedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  [WeakRetained _presentBridgedViewController];
}

- (void)dismissBridgedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  [WeakRetained _dismissBridgedViewController];
}

- (id)disconnect
{
  BOOL v3 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v3 dismissPresentingBridgedViewController];
  v6.receiver = self;
  v6.super_class = (Class)SKRemoteAccountPageViewController;
  BOOL v4 = [(_UIRemoteViewController *)&v6 disconnect];

  return v4;
}

- (SKAccountPageViewController)accountPageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);

  return (SKAccountPageViewController *)WeakRetained;
}

- (void)setAccountPageViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end