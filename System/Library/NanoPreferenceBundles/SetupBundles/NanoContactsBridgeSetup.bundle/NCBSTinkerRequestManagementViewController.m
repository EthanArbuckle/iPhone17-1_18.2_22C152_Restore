@interface NCBSTinkerRequestManagementViewController
- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate;
- (NCBSTinkerRequestManagementViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_notifyUserRequestWasSentThenProceed;
- (void)_requestToManageContacts;
- (void)alternateButtonPressed:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation NCBSTinkerRequestManagementViewController

- (NCBSTinkerRequestManagementViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCBSTinkerRequestManagementViewController;
  v2 = [(NCBSTinkerRequestManagementViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCBSTinkerRequestManagementViewController *)v2 setStyle:10];
  }
  return v3;
}

- (id)titleString
{
  v2 = [(NCBSTinkerRequestManagementViewController *)self miniFlowDelegate];
  v3 = [v2 familyMemberFirstName];

  v4 = NanoContactsBridgeSetupBundle();
  objc_super v5 = [v4 localizedStringForKey:@"TK_CONTACTS_REQUEST_TITLE" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (id)detailString
{
  v2 = [(NCBSTinkerRequestManagementViewController *)self miniFlowDelegate];
  v3 = [v2 familyMemberFirstName];

  v4 = NanoContactsBridgeSetupBundle();
  objc_super v5 = [v4 localizedStringForKey:@"TK_CONTACTS_REQUEST_DETAIL" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3, v3);

  return v6;
}

- (id)imageResource
{
  return @"Contacts-Header_80";
}

- (id)imageResourceBundleIdentifier
{
  return NanoContactsBridgeSetupBundleIdentifier;
}

- (id)suggestedButtonTitle
{
  v2 = NanoContactsBridgeSetupBundle();
  v3 = [v2 localizedStringForKey:@"TK_CONTACTS_REQUEST_BUTTON_ASK" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (id)alternateButtonTitle
{
  v2 = NanoContactsBridgeSetupBundle();
  v3 = [v2 localizedStringForKey:@"TK_CONTACTS_REQUEST_BUTTON_LATER" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v3;
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = [(NCBSTinkerRequestManagementViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (void)_requestToManageContacts
{
  v3 = NCBS_Tinker_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v7 = "-[NCBSTinkerRequestManagementViewController _requestToManageContacts]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s - making request", buf, 0xCu);
  }

  id v4 = [(NCBSTinkerRequestManagementViewController *)self miniFlowDelegate];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_DBD4;
  v5[3] = &unk_1C540;
  v5[4] = self;
  [v4 requestContactsManagementWithCompletionHandler:v5];
}

- (void)_notifyUserRequestWasSentThenProceed
{
  v3 = [(NCBSTinkerRequestManagementViewController *)self miniFlowDelegate];
  id v4 = [v3 familyMemberFirstName];

  objc_super v5 = NanoContactsBridgeSetupBundle();
  v6 = [v5 localizedStringForKey:@"TK_CONTACTS_REQUESTED_MESSAGE" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);

  v8 = NanoContactsBridgeSetupBundle();
  v9 = [v8 localizedStringForKey:@"TK_CONTACTS_REQUESTED_TITLE" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v10 = +[UIAlertController alertControllerWithTitle:v9 message:v7 preferredStyle:1];

  v11 = NanoContactsBridgeSetupBundle();
  v12 = [v11 localizedStringForKey:@"TK_CONTACTS_REQUESTED_BUTTON_OK" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_DEE0;
  v14[3] = &unk_1C8C0;
  v14[4] = self;
  v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v14];
  [v10 addAction:v13];

  [(NCBSTinkerRequestManagementViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (NCBSBridgeSetupControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end