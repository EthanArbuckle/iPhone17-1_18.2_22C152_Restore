@interface ServicePINEntryViewController
- (BOOL)_usesModalPresentation;
- (BOOL)pinControllerShown;
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (BSAction)didAcceptPINAction;
- (DevicePINController)pinController;
- (int64_t)preferredStatusBarStyle;
- (void)_dismiss;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)setDidAcceptPINAction:(id)a3;
- (void)setPinController:(id)a3;
- (void)setPinControllerShown:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ServicePINEntryViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v9 = (void (**)(void))a4;
  v6 = [a3 actions];
  v7 = [v6 allObjects];
  v8 = [v7 firstObject];
  [(ServicePINEntryViewController *)self setDidAcceptPINAction:v8];

  v9[2]();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ServicePINEntryViewController;
  [(ServicePINEntryViewController *)&v5 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(ServicePINEntryViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ServicePINEntryViewController;
  [(ServicePINEntryViewController *)&v8 viewDidAppear:a3];
  if (![(ServicePINEntryViewController *)self pinControllerShown])
  {
    id v4 = objc_alloc_init((Class)DevicePINController);
    id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
    id v6 = objc_alloc_init((Class)PSSpecifier);
    [v6 setEditPaneClass:objc_opt_class()];
    [v6 setProperty:&off_100050B80 forKey:@"mode"];
    [v4 setSpecifier:v6];
    [v4 setPinDelegate:self];
    if ([(ServicePINEntryViewController *)self _usesModalPresentation])
    {
      [v5 setModalPresentationStyle:7];
      v7 = [v5 popoverPresentationController];
      [v7 setDelegate:self];
      [v7 setPermittedArrowDirections:0];
      [v7 setSourceView:0];
      [v7 _setCentersPopoverIfSourceViewNotSet:1];
    }
    else
    {
      [v5 setModalPresentationStyle:0];
    }
    [(ServicePINEntryViewController *)self setPinController:v4];
    [(ServicePINEntryViewController *)self presentViewController:v5 animated:1 completion:0];
    [(ServicePINEntryViewController *)self setPinControllerShown:1];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v9 = a3;
  id v4 = [(ServicePINEntryViewController *)self didAcceptPINAction];
  unsigned int v5 = [v4 canSendResponse];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)BSMutableSettings);
    [v6 setObject:v9 forSetting:1];
    v7 = [(ServicePINEntryViewController *)self didAcceptPINAction];
    objc_super v8 = +[BSActionResponse responseWithInfo:v6];
    [v7 sendResponse:v8];
  }
  [(ServicePINEntryViewController *)self _dismiss];
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return ![(ServicePINEntryViewController *)self _usesModalPresentation];
}

- (BOOL)_usesModalPresentation
{
  return _PSIsiPad(self, a2);
}

- (void)_dismiss
{
  v3 = [(ServicePINEntryViewController *)self _remoteViewControllerProxy];
  id v4 = [(ServicePINEntryViewController *)self pinController];

  if (v4)
  {
    unsigned int v5 = [(ServicePINEntryViewController *)self pinController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000DB18;
    v6[3] = &unk_10004CEB0;
    id v7 = v3;
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    [v3 dismiss];
  }
}

- (DevicePINController)pinController
{
  return self->_pinController;
}

- (void)setPinController:(id)a3
{
}

- (BOOL)pinControllerShown
{
  return self->_pinControllerShown;
}

- (void)setPinControllerShown:(BOOL)a3
{
  self->_pinControllerShown = a3;
}

- (BSAction)didAcceptPINAction
{
  return self->_didAcceptPINAction;
}

- (void)setDidAcceptPINAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didAcceptPINAction, 0);

  objc_storeStrong((id *)&self->_pinController, 0);
}

@end