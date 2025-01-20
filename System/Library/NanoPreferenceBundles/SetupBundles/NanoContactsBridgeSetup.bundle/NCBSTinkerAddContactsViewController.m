@interface NCBSTinkerAddContactsViewController
+ (BOOL)controllerNeedsToRunWithMiniFlowDelegate:(id)a3;
- (CNUIFamilyMemberContactsController)familyMemberContactsController;
- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate;
- (NCBSTinkerAddContactsViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_addContacts;
- (void)alternateButtonPressed:(id)a3;
- (void)dismissPresentedViewController:(id)a3;
- (void)presentViewController:(id)a3;
- (void)presentedViewControllerDidCancel:(id)a3;
- (void)setFamilyMemberContactsController:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation NCBSTinkerAddContactsViewController

- (NCBSTinkerAddContactsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCBSTinkerAddContactsViewController;
  v2 = [(NCBSTinkerAddContactsViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCBSTinkerAddContactsViewController *)v2 setStyle:10];
  }
  return v3;
}

- (void)setMiniFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_miniFlowDelegate, a3);
  v4 = [(NCBSTinkerAddContactsViewController *)self miniFlowDelegate];
  unsigned int v5 = [v4 familyMemberContactsStatusAtStartOfFlow];

  if (v5 == 3) {
    uint64_t v6 = 10;
  }
  else {
    uint64_t v6 = 2;
  }

  [(NCBSTinkerAddContactsViewController *)self setStyle:v6];
}

+ (BOOL)controllerNeedsToRunWithMiniFlowDelegate:(id)a3
{
  return [a3 setupGuardianHasContactsToDonate] != 0;
}

- (id)titleString
{
  v2 = [(NCBSTinkerAddContactsViewController *)self miniFlowDelegate];
  v3 = [v2 familyMemberFirstName];

  v4 = NanoContactsBridgeSetupBundle();
  unsigned int v5 = [v4 localizedStringForKey:@"TK_CONTACTS_ADD_TITLE" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (id)detailString
{
  v2 = [(NCBSTinkerAddContactsViewController *)self miniFlowDelegate];
  v3 = [v2 familyMemberFirstName];

  v4 = NanoContactsBridgeSetupBundle();
  unsigned int v5 = [v4 localizedStringForKey:@"TK_CONTACTS_ADD_DETAIL" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3, v3);

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
  v3 = [v2 localizedStringForKey:@"TK_CONTACTS_ADD_BUTTON_ADD" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (id)alternateButtonTitle
{
  v2 = NanoContactsBridgeSetupBundle();
  v3 = [v2 localizedStringForKey:@"TK_CONTACTS_ADD_BUTTON_LATER" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v3;
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = [(NCBSTinkerAddContactsViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (void)_addContacts
{
  v3 = [(NCBSTinkerAddContactsViewController *)self miniFlowDelegate];
  id v4 = [v3 familyMember];

  unsigned int v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    v9 = "-[NCBSTinkerAddContactsViewController _addContacts]";
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - familyMember: %@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = [objc_alloc((Class)CNUIFamilyMemberContactsController) initWithFamilyMember:v4 familyMemberContactsPresentation:self];
  [(NCBSTinkerAddContactsViewController *)self setFamilyMemberContactsController:v6];

  v7 = [(NCBSTinkerAddContactsViewController *)self familyMemberContactsController];
  [v7 performInteraction:2];
}

- (void)presentViewController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 136446466;
    __int16 v10 = "-[NCBSTinkerAddContactsViewController presentViewController:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}s: %@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [(NCBSTinkerAddContactsViewController *)self view];
  v7 = [v6 tintColor];
  int v8 = [v4 view];
  [v8 setTintColor:v7];

  [(NCBSTinkerAddContactsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)dismissPresentedViewController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(NCBSTinkerAddContactsViewController *)self presentedViewController];
    int v9 = 136446722;
    __int16 v10 = "-[NCBSTinkerAddContactsViewController dismissPresentedViewController:]";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}s: %{public}@; presentedViewController: %{public}@",
      (uint8_t *)&v9,
      0x20u);
  }
  v7 = [(NCBSTinkerAddContactsViewController *)self presentedViewController];

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [(NCBSTinkerAddContactsViewController *)self dismissViewControllerAnimated:1 completion:0];
      int v8 = [(NCBSTinkerAddContactsViewController *)self miniFlowDelegate];
      [v8 miniFlowStepComplete:self];
    }
  }
}

- (void)presentedViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(NCBSTinkerAddContactsViewController *)self presentedViewController];
    int v8 = 136446722;
    int v9 = "-[NCBSTinkerAddContactsViewController presentedViewControllerDidCancel:]";
    __int16 v10 = 2114;
    id v11 = v4;
    __int16 v12 = 2114;
    __int16 v13 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}s: %{public}@; presentedViewController: %{public}@",
      (uint8_t *)&v8,
      0x20u);
  }
  v7 = [(NCBSTinkerAddContactsViewController *)self presentedViewController];

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(NCBSTinkerAddContactsViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_miniFlowDelegate);

  return (NCBSBridgeSetupControllerDelegate *)WeakRetained;
}

- (CNUIFamilyMemberContactsController)familyMemberContactsController
{
  return self->_familyMemberContactsController;
}

- (void)setFamilyMemberContactsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberContactsController, 0);

  objc_destroyWeak((id *)&self->_miniFlowDelegate);
}

@end