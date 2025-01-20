@interface DSAccessResetController
- (DSAccessResetController)init;
- (DSAlternateDeviceAccessManager)accessManager;
- (DSNavigationDelegate)delegate;
- (id)_checklistImage;
- (void)finishFlow;
- (void)goToSafetyCheck;
- (void)setAccessManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSAccessResetController

- (DSAccessResetController)init
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = DSUILocStringForKey(@"ACCESS_RESET");
  v7 = DSUILocStringForKey(@"ACCESS_RESET_DETAIL");
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"person.crop.circle.badge.checkmark" withConfiguration:v5];
  v12.receiver = self;
  v12.super_class = (Class)DSAccessResetController;
  v9 = [(DSAccessResetController *)&v12 initWithTitle:v6 detailText:v7 icon:v8];

  if (v9)
  {
    v10 = +[DSAlternateDeviceAccessManager sharedManager];
    [(DSAccessResetController *)v9 setAccessManager:v10];
  }
  return v9;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)DSAccessResetController;
  [(DSOBWelcomeController *)&v30 viewDidLoad];
  v3 = DSUILocStringForKey(@"DONE");
  id v4 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:self selector:sel_finishFlow];

  v5 = DSUILocStringForKey(@"GO_TO_SAFETY_CHECK");
  id v6 = +[DSUIUtilities setUpLinkButtonForController:self title:v5 target:self selector:sel_goToSafetyCheck];

  v7 = [(DSAccessResetController *)self accessManager];
  v8 = [v7 mirroringDevices];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = DSUILocStringForKey(@"ACCESS_RESET_BULLET_MIRRORING");
    v11 = DSUILocStringForKey(@"ACCESS_RESET_BULLET_MIRRORING_DETAIL");
    objc_super v12 = [(DSAccessResetController *)self _checklistImage];
    [(DSAccessResetController *)self addBulletedListItemWithTitle:v10 description:v11 image:v12];
  }
  v13 = [(DSAccessResetController *)self accessManager];
  v14 = [v13 syncingDevices];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = DSUILocStringForKey(@"ACCESS_RESET_BULLET_PAIRING");
    v17 = DSUILocStringForKey(@"ACCESS_RESET_BULLET_PAIRING_DETAIL");
    v18 = [(DSAccessResetController *)self _checklistImage];
    [(DSAccessResetController *)self addBulletedListItemWithTitle:v16 description:v17 image:v18];
  }
  v19 = [(DSAccessResetController *)self accessManager];
  int v20 = [v19 hasAlternateFaceID];

  if (v20)
  {
    v21 = DSUILocStringForKey(@"ACCESS_RESET_BULLET_ALT_BIO");
    v22 = @"ACCESS_RESET_BULLET_ALT_FACEID_DETAIL";
LABEL_9:
    v25 = DSUILocStringForKey(v22);
    v26 = [(DSAccessResetController *)self _checklistImage];
    [(DSAccessResetController *)self addBulletedListItemWithTitle:v21 description:v25 image:v26];

    goto LABEL_10;
  }
  v23 = [(DSAccessResetController *)self accessManager];
  int v24 = [v23 hasAlternateTouchID];

  if (v24)
  {
    v21 = DSUILocStringForKey(@"ACCESS_RESET_BULLET_ALT_BIO");
    v22 = @"ACCESS_RESET_BULLET_ALT_TOUCHID_DETAIL";
    goto LABEL_9;
  }
LABEL_10:
  v27 = DSUILocStringForKey(@"ACCESS_RESET_BULLET_PASSCODE");
  v28 = DSUILocStringForKey(@"ACCESS_RESET_BULLET_PASSCODE_DETAIL");
  v29 = [(DSAccessResetController *)self _checklistImage];
  [(DSAccessResetController *)self addBulletedListItemWithTitle:v27 description:v28 image:v29];
}

- (id)_checklistImage
{
  return (id)[MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle"];
}

- (void)goToSafetyCheck
{
  v3 = [(DSAccessResetController *)self accessManager];
  [v3 sendSummaryAnalyticsWithReviewAction:1 resetAction:1 exit:1];

  id v4 = [(DSAccessResetController *)self delegate];
  [v4 goToCustomizeSharing];
}

- (void)finishFlow
{
  v3 = [(DSAccessResetController *)self accessManager];
  [v3 sendSummaryAnalyticsWithReviewAction:1 resetAction:1 exit:0];

  id v4 = [(DSAccessResetController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSAlternateDeviceAccessManager)accessManager
{
  return self->_accessManager;
}

- (void)setAccessManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end