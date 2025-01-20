@interface AAUIAccountSaveErrorHandler
- (AAUIAccountSaveErrorHandler)initWithPresenter:(id)a3;
- (void)_beginManateeUpgradeForAccount:(id)a3 failedDataclassName:(id)a4;
- (void)_displayAccountSaveErrorAlertWithTitle:(id)a3 message:(id)a4 alternativeAction:(id)a5;
- (void)_handleInsufficientStorageWithUserInfo:(id)a3;
- (void)_handleManateeErrorForAccount:(id)a3 withDescription:(id)a4 failedDataclasses:(id)a5;
- (void)_handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:(id)a3;
- (void)handleAccountSaveError:(id)a3 forAccount:(id)a4 failedDataclasses:(id)a5;
@end

@implementation AAUIAccountSaveErrorHandler

- (AAUIAccountSaveErrorHandler)initWithPresenter:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAUIAccountSaveErrorHandler;
  v5 = [(AAUIAccountSaveErrorHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presenter, v4);
  }

  return v6;
}

- (void)handleAccountSaveError:(id)a3 forAccount:(id)a4 failedDataclasses:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 domain];
  unsigned int v12 = [v11 isEqualToString:AADataclassActionErrorDomain];

  if (v12)
  {
    v13 = (char *)[v8 code];
    if (v13 == (unsigned char *)&dword_0 + 2)
    {
      v23 = _AAUILogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_4883C(v23, v24, v25, v26, v27, v28, v29, v30);
      }

      [(AAUIAccountSaveErrorHandler *)self _handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:v10];
    }
    else
    {
      if (v13 == (unsigned char *)&dword_0 + 1)
      {
        v31 = _AAUILogSystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_48804(v31, v32, v33, v34, v35, v36, v37, v38);
        }

        v22 = [v8 localizedRecoverySuggestion];
        [(AAUIAccountSaveErrorHandler *)self _handleManateeErrorForAccount:v9 withDescription:v22 failedDataclasses:v10];
        goto LABEL_14;
      }
      if (!v13)
      {
        v14 = _AAUILogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_487CC(v14, v15, v16, v17, v18, v19, v20, v21);
        }

        v22 = [v8 userInfo];
        [(AAUIAccountSaveErrorHandler *)self _handleInsufficientStorageWithUserInfo:v22];
LABEL_14:

        goto LABEL_18;
      }
      v39 = _AAUILogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_48754((uint64_t)v8, v39);
      }
    }
  }
LABEL_18:
  [v9 reload];
}

- (void)_handleInsufficientStorageWithUserInfo:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9CB0;
  v5[3] = &unk_75130;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)_handleManateeErrorForAccount:(id)a3 withDescription:(id)a4 failedDataclasses:(id)a5
{
  id v7 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9EF8;
  block[3] = &unk_75520;
  id v11 = a5;
  unsigned int v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_beginManateeUpgradeForAccount:(id)a3 failedDataclassName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext);
  id v9 = objc_msgSend(v6, "aa_altDSID");
  id v10 = [v8 initWithAltDSID:v9];

  [v10 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
  [v10 setDeviceToDeviceEncryptionUpgradeType:0];
  if ([v7 isEqualToString:ACAccountDataclassMessages])
  {
    id v11 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v12 = [v11 localizedStringForKey:@"UPGRADE_ACCOUNT_SECURITY_FEATURE_MESSAGES" value:&stru_76890 table:@"Localizable"];
    [v10 setFeatureName:v12];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  [v10 setPresentingViewController:WeakRetained];

  id v14 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper) initWithContext:v10];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_A1A8;
  v17[3] = &unk_75570;
  v17[4] = self;
  id v18 = v7;
  id v19 = v6;
  id v15 = v6;
  id v16 = v7;
  [v14 performDeviceToDeviceEncryptionStateRepairWithCompletion:v17];
}

- (void)_handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:(id)a3
{
  id v14 = a3;
  id v4 = [v14 count];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v14 anyObject];
    uint64_t v8 = [v6 localizedStringForKey:v7 value:&stru_76890 table:@"Localizable"];

    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_MESSAGE" value:&stru_76890 table:@"Localizable"];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8);

    id v6 = (void *)v8;
  }
  else
  {
    id v11 = [v5 localizedStringForKey:@"MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_MESSAGE_NO_FEATURE" value:&stru_76890 table:@"Localizable"];
  }

  unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_TITLE" value:&stru_76890 table:@"Localizable"];
  [(AAUIAccountSaveErrorHandler *)self _displayAccountSaveErrorAlertWithTitle:v13 message:v11 alternativeAction:0];
}

- (void)_displayAccountSaveErrorAlertWithTitle:(id)a3 message:(id)a4 alternativeAction:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_ABE8;
  v12[3] = &unk_75598;
  id v13 = a4;
  id v14 = self;
  id v15 = v8;
  id v16 = a5;
  id v9 = v16;
  id v10 = v8;
  id v11 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void).cxx_destruct
{
}

@end