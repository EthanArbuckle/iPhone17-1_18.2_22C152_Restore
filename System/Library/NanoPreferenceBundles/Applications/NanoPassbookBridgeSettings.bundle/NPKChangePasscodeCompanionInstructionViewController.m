@interface NPKChangePasscodeCompanionInstructionViewController
- (BOOL)hidesCancelButton;
- (BOOL)isViewVisible;
- (NPKChangePasscodeCompanionInstructionViewController)initWithHidesCancelButton:(BOOL)a3;
- (NPKChangePasscodeCompanionInstructionViewControllerDelegate)delegate;
- (id)_errorAcknowledgeButtonTitle;
- (id)_instructionMessage;
- (id)_instructionTitle;
- (id)_unlockRequiredMessage;
- (id)_unlockRequiredTitle;
- (void)didMoveToParentViewController:(id)a3;
- (void)handleChangePasscodeUnlockRequired;
- (void)setDelegate:(id)a3;
- (void)setHidesCancelButton:(BOOL)a3;
- (void)setIsViewVisible:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NPKChangePasscodeCompanionInstructionViewController

- (NPKChangePasscodeCompanionInstructionViewController)initWithHidesCancelButton:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKChangePasscodeCompanionInstructionViewController;
  result = [(NPKChangePasscodeCompanionInstructionViewController *)&v5 init];
  if (result) {
    result->_hidesCancelButton = a3;
  }
  return result;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NPKChangePasscodeCompanionInstructionViewController;
  [(NPKBridgeInstructionViewController *)&v4 viewDidLoad];
  if ([(NPKChangePasscodeCompanionInstructionViewController *)self hidesCancelButton])
  {
    v3 = [(NPKChangePasscodeCompanionInstructionViewController *)self navigationItem];
    [v3 setLeftBarButtonItem:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKChangePasscodeCompanionInstructionViewController;
  [(NPKChangePasscodeCompanionInstructionViewController *)&v4 viewWillAppear:a3];
  if (![(NPKChangePasscodeCompanionInstructionViewController *)self isViewVisible]) {
    [(NPKChangePasscodeCompanionInstructionViewController *)self setIsViewVisible:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKChangePasscodeCompanionInstructionViewController;
  [(NPKChangePasscodeCompanionInstructionViewController *)&v4 viewDidDisappear:a3];
  if ([(NPKChangePasscodeCompanionInstructionViewController *)self isViewVisible]) {
    [(NPKChangePasscodeCompanionInstructionViewController *)self setIsViewVisible:0];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NPKChangePasscodeCompanionInstructionViewController;
  -[NPKChangePasscodeCompanionInstructionViewController didMoveToParentViewController:](&v6, "didMoveToParentViewController:");
  if (!a3)
  {
    objc_super v5 = [(NPKBridgeInstructionViewController *)self cancellationHandler];
    [(NPKBridgeInstructionViewController *)self setCancellationHandler:0];
    if (v5) {
      v5[2](v5);
    }
  }
}

- (void)setIsViewVisible:(BOOL)a3
{
  if (self->_isViewVisible != a3)
  {
    BOOL v3 = a3;
    self->_isViewVisible = a3;
    id v5 = [(NPKChangePasscodeCompanionInstructionViewController *)self delegate];
    [v5 changePasscodeCompanionInstructionViewController:self didChangeVisibilityWithIsVisible:v3];
  }
}

- (id)_instructionTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"CHANGE_PASSCODE_TITLE_COMPANION" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings"];

  return v3;
}

- (id)_instructionMessage
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v2 = (void *)qword_35DD0;
  uint64_t v22 = qword_35DD0;
  if (!qword_35DD0)
  {
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_18DE4;
    v17 = &unk_2CF50;
    v18 = &v19;
    sub_18DE4((uint64_t)&v14);
    v2 = (void *)v20[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v19, 8);
  objc_super v4 = [v3 sharedConnection];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v5 = (void *)qword_35DE0;
  uint64_t v22 = qword_35DE0;
  if (!qword_35DE0)
  {
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_18FB0;
    v17 = &unk_2CF50;
    v18 = &v19;
    objc_super v6 = (void *)sub_18E3C();
    v7 = dlsym(v6, "MCFeatureMinimumPasscodeLength");
    *(void *)(v18[1] + 24) = v7;
    qword_35DE0 = *(void *)(v18[1] + 24);
    id v5 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v5) {
    sub_19B14();
  }
  v8 = [v4 valueRestrictionForFeature:*v5];

  if (!v8)
  {
    v8 = +[NSNumber numberWithUnsignedInteger:PKUpgradedDevicePasscodeMinimumLength];
  }
  v9 = +[NSNumberFormatter localizedStringFromNumber:v8 numberStyle:5];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"CHANGE_PASSCODE_MESSAGE_COMPANION" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings"];
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v9);

  return v12;
}

- (void)handleChangePasscodeUnlockRequired
{
  id v5 = [(NPKChangePasscodeCompanionInstructionViewController *)self _unlockRequiredTitle];
  id v3 = [(NPKChangePasscodeCompanionInstructionViewController *)self _unlockRequiredMessage];
  objc_super v4 = [(NPKChangePasscodeCompanionInstructionViewController *)self _errorAcknowledgeButtonTitle];
  [(NPKBridgeInstructionViewController *)self handleErrorWithTitle:v5 message:v3 acknowledgeButtonTitle:v4];
}

- (id)_unlockRequiredTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"CHANGE_PASSCODE_ALERT_UNLOCK_REQUIRED_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings"];

  return v3;
}

- (id)_unlockRequiredMessage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"CHANGE_PASSCODE_ALERT_UNLOCK_REQUIRED_MESSAGE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings"];

  return v3;
}

- (id)_errorAcknowledgeButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"CHANGE_PASSCODE_ALERT_ERROR_ACKNOWLEDGE_BUTTON_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings"];

  return v3;
}

- (NPKChangePasscodeCompanionInstructionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPKChangePasscodeCompanionInstructionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hidesCancelButton
{
  return self->_hidesCancelButton;
}

- (void)setHidesCancelButton:(BOOL)a3
{
  self->_hidesCancelButton = a3;
}

- (BOOL)isViewVisible
{
  return self->_isViewVisible;
}

- (void).cxx_destruct
{
}

@end