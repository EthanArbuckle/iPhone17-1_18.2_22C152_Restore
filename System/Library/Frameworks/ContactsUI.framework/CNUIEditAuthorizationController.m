@interface CNUIEditAuthorizationController
- (BOOL)animated;
- (CNUIEditAuthorizationControllerDelegate)delegate;
- (UIViewController)guardedViewController;
- (id)sender;
- (void)dealloc;
- (void)didAutorize;
- (void)didNotAuthorize;
- (void)lockoutRestrictionsPINControllerDidFinish:(id)a3;
- (void)presentAuthorizationUI;
- (void)setAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGuardedViewController:(id)a3;
- (void)setSender:(id)a3;
- (void)userDidEnterPasswordCorrectly:(BOOL)a3;
@end

@implementation CNUIEditAuthorizationController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_guardedViewController);
  objc_destroyWeak(&self->_sender);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setGuardedViewController:(id)a3
{
}

- (UIViewController)guardedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guardedViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setSender:(id)a3
{
}

- (id)sender
{
  id WeakRetained = objc_loadWeakRetained(&self->_sender);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNUIEditAuthorizationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNUIEditAuthorizationControllerDelegate *)WeakRetained;
}

- (void)didNotAuthorize
{
  id v3 = [(CNUIEditAuthorizationController *)self delegate];
  [v3 editAuthorizationController:self authorizationDidFinishWithResult:1];
}

- (void)didAutorize
{
  id v3 = [(CNUIEditAuthorizationController *)self delegate];
  [v3 editAuthorizationController:self authorizationDidFinishWithResult:2];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNUIEditAuthorizationController;
  [(CNUIEditAuthorizationController *)&v4 dealloc];
}

- (void)userDidEnterPasswordCorrectly:(BOOL)a3
{
  if (a3) {
    [(CNUIEditAuthorizationController *)self didAutorize];
  }
  else {
    [(CNUIEditAuthorizationController *)self didNotAuthorize];
  }
}

- (void)lockoutRestrictionsPINControllerDidFinish:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = getSTNotificationKeyPINSuccess[0]();
  id v6 = [v4 objectForKeyedSubscript:v5];

  -[CNUIEditAuthorizationController userDidEnterPasswordCorrectly:](self, "userDidEnterPasswordCorrectly:", [v6 BOOLValue]);
}

- (void)presentAuthorizationUI
{
  [(Class)getSTRemotePasscodeControllerClass[0]() activateRemotePINUI];
  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = getSTRestrictionsPINControllerDidFinishNotification[0]();
  [v4 addObserver:self selector:sel_lockoutRestrictionsPINControllerDidFinish_ name:v3 object:0];
}

@end