@interface CARBluetoothSyncContactsPrompt
- (id)contactsApprovalCompletion;
- (void)_handleContactsApprovalCompleted:(BOOL)a3;
- (void)presentSyncContactsAlertFromViewController:(id)a3;
- (void)setContactsApprovalCompletion:(id)a3;
@end

@implementation CARBluetoothSyncContactsPrompt

- (void)presentSyncContactsAlertFromViewController:(id)a3
{
  id v15 = a3;
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"SYNC_CONTACTS_TITLE" value:&stru_24F60 table:@"Alerts"];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"SYNC_CONTACTS_MESSAGE" value:&stru_24F60 table:@"Alerts"];
  v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"SYNC_DISALLOW_BUTTON" value:&stru_24F60 table:@"Alerts"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_110D4;
  v17[3] = &unk_24CA8;
  v17[4] = self;
  v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:v17];
  [v8 addAction:v11];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"SYNC_ALLOW_BUTTON" value:&stru_24F60 table:@"Alerts"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_110E0;
  v16[3] = &unk_24CA8;
  v16[4] = self;
  v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v16];
  [v8 addAction:v14];

  [v15 presentViewController:v8 animated:1 completion:0];
}

- (void)_handleContactsApprovalCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CARBluetoothSyncContactsPrompt *)self contactsApprovalCompletion];
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, v3);
    v4 = (void (**)(void, void))v5;
  }
}

- (id)contactsApprovalCompletion
{
  return self->_contactsApprovalCompletion;
}

- (void)setContactsApprovalCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end