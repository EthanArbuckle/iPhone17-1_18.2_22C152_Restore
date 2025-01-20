@interface NCBSGuardianContactCardViewController
- (BOOL)hasMeCard;
- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate;
- (NCBSGuardianContactCardViewController)init;
- (id)_newMeContactForGuardian:(id)a3;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)guardianContactStore;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_setGuardianMeContact:(id)a3;
- (void)_visitMeCard;
- (void)alternateButtonPressed:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation NCBSGuardianContactCardViewController

- (NCBSGuardianContactCardViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCBSGuardianContactCardViewController;
  v2 = [(NCBSGuardianContactCardViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCBSGuardianContactCardViewController *)v2 setStyle:10];
  }
  return v3;
}

- (id)titleString
{
  unsigned int v2 = [(NCBSGuardianContactCardViewController *)self hasMeCard];
  v3 = NanoContactsBridgeSetupBundle();
  v4 = v3;
  if (v2) {
    CFStringRef v5 = @"TK_CONTACTS_GUARDIAN_ME_TITLE_UPDATE";
  }
  else {
    CFStringRef v5 = @"TK_CONTACTS_GUARDIAN_ME_TITLE_CREATE";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v6;
}

- (id)detailString
{
  unsigned int v3 = [(NCBSGuardianContactCardViewController *)self hasMeCard];
  v4 = NanoContactsBridgeSetupBundle();
  CFStringRef v5 = v4;
  if (v3) {
    CFStringRef v6 = @"TK_CONTACTS_GUARDIAN_ME_DETAIL_UPDATE";
  }
  else {
    CFStringRef v6 = @"TK_CONTACTS_GUARDIAN_ME_DETAIL_CREATE";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  v8 = [(NCBSGuardianContactCardViewController *)self miniFlowDelegate];
  v9 = [v8 familyMemberFirstName];

  v10 = +[NSString stringWithValidatedFormat:v7, @"%@%@", 0, v9, v9 validFormatSpecifiers error];

  return v10;
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
  unsigned int v2 = [(NCBSGuardianContactCardViewController *)self hasMeCard];
  unsigned int v3 = NanoContactsBridgeSetupBundle();
  v4 = v3;
  if (v2) {
    CFStringRef v5 = @"TK_CONTACTS_GUARDIAN_ME_BUTTON_UPDATE";
  }
  else {
    CFStringRef v5 = @"TK_CONTACTS_GUARDIAN_ME_BUTTON_CREATE";
  }
  CFStringRef v6 = [v3 localizedStringForKey:v5 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v6;
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (id)alternateButtonTitle
{
  unsigned int v2 = [(NCBSGuardianContactCardViewController *)self hasMeCard];
  unsigned int v3 = NanoContactsBridgeSetupBundle();
  v4 = v3;
  if (v2) {
    CFStringRef v5 = @"TK_CONTACTS_GUARDIAN_ME_BUTTON_SKIP";
  }
  else {
    CFStringRef v5 = @"TK_CONTACTS_GUARDIAN_ME_BUTTON_LATER";
  }
  CFStringRef v6 = [v3 localizedStringForKey:v5 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v6;
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = [(NCBSGuardianContactCardViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (id)guardianContactStore
{
  guardianContactStore = self->_guardianContactStore;
  if (!guardianContactStore)
  {
    id v4 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    CFStringRef v5 = self->_guardianContactStore;
    self->_guardianContactStore = v4;

    CFStringRef v6 = self->_guardianContactStore;
    if (v6)
    {
      v7 = +[CNContactViewController descriptorForRequiredKeys];
      v23 = v7;
      v8 = +[NSArray arrayWithObjects:&v23 count:1];
      id v14 = 0;
      v9 = [(CNContactStore *)v6 _ios_meContactWithKeysToFetch:v8 error:&v14];
      CFStringRef v6 = (CNContactStore *)v14;

      self->_BOOL hasMeCard = v9 != 0;
    }
    v10 = NCBS_Tinker_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_guardianContactStore;
      BOOL hasMeCard = self->_hasMeCard;
      *(_DWORD *)buf = 136446978;
      v16 = "-[NCBSGuardianContactCardViewController guardianContactStore]";
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 1024;
      BOOL v20 = hasMeCard;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - OPENED guardianContactStore: %@, hasMeCard: %d (error: %{public}@)", buf, 0x26u);
    }

    guardianContactStore = self->_guardianContactStore;
  }

  return guardianContactStore;
}

- (BOOL)hasMeCard
{
  if (self->_hasMeCard) {
    return 1;
  }
  if (self->_guardianContactStore) {
    return 0;
  }
  id v4 = [(NCBSGuardianContactCardViewController *)self guardianContactStore];
  return self->_hasMeCard;
}

- (id)_newMeContactForGuardian:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  CFStringRef v5 = [v3 firstName];
  [v4 setGivenName:v5];

  CFStringRef v6 = [v3 lastName];
  [v4 setFamilyName:v6];

  v7 = [v3 appleID];

  if (v7)
  {
    v8 = +[CNLabeledValue labeledValueWithLabel:CNLabelEmailiCloud value:v7];
    v11 = v8;
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v4 setEmailAddresses:v9];
  }
  return v4;
}

- (void)_visitMeCard
{
  id v3 = [(NCBSGuardianContactCardViewController *)self miniFlowDelegate];
  id v4 = [v3 setupGuardian];

  CFStringRef v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = [(NCBSGuardianContactCardViewController *)self guardianContactStore];
    *(_DWORD *)buf = 136446722;
    v23 = "-[NCBSGuardianContactCardViewController _visitMeCard]";
    __int16 v24 = 2112;
    v25 = v6;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - guardianContactStore: %@, guardianFamilyMember: %@", buf, 0x20u);
  }
  v7 = [(NCBSGuardianContactCardViewController *)self guardianContactStore];
  v8 = +[CNContactViewController descriptorForRequiredKeys];
  __int16 v21 = v8;
  v9 = +[NSArray arrayWithObjects:&v21 count:1];
  id v20 = 0;
  v10 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v9, &v20);
  id v11 = v20;

  v12 = NCBS_Tinker_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v23 = "-[NCBSGuardianContactCardViewController _visitMeCard]";
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s - _ios_meContactWithKeysToFetch result: %@, error: %{public}@", buf, 0x20u);
  }

  if (v10)
  {
    v13 = +[CNContactViewController viewControllerForUpdatingContact:v10 withPropertiesFromContact:0];
  }
  else
  {
    id v14 = [(NCBSGuardianContactCardViewController *)self _newMeContactForGuardian:v4];
    v13 = +[CNContactViewController viewControllerForNewContact:v14];
  }
  v15 = [(NCBSGuardianContactCardViewController *)self guardianContactStore];
  [v13 setContactStore:v15];

  [v13 setDisplayMode:2];
  [v13 setDelegate:self];
  id v16 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v13];
  __int16 v17 = [(NCBSGuardianContactCardViewController *)self view];
  v18 = [v17 tintColor];
  __int16 v19 = [v16 view];
  [v19 setTintColor:v18];

  [(NCBSGuardianContactCardViewController *)self presentViewController:v16 animated:1 completion:0];
}

- (void)_setGuardianMeContact:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(NCBSGuardianContactCardViewController *)self guardianContactStore];
  id v11 = 0;
  unsigned int v6 = [v5 setMeContact:v4 error:&v11];
  id v7 = v11;

  int v8 = self->_hasMeCard | v6;
  self->_hasMeCard |= v6;
  if (v8)
  {
    v9 = [(NCBSGuardianContactCardViewController *)self miniFlowDelegate];
    [v9 setSetupGuardianHasContactsToDonate:1];
  }
  v10 = NCBS_Tinker_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v13 = "-[NCBSGuardianContactCardViewController _setGuardianMeContact:]";
    __int16 v14 = 1024;
    unsigned int v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - setMeContact result: %d, error: %{public}@, contact: %@", buf, 0x26u);
  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5 = a4;
  [(NCBSGuardianContactCardViewController *)self dismissViewControllerAnimated:1 completion:0];
  if (v5)
  {
    [(NCBSGuardianContactCardViewController *)self _setGuardianMeContact:v5];
    unsigned int v6 = [(NCBSGuardianContactCardViewController *)self miniFlowDelegate];
    [v6 miniFlowStepComplete:self];
  }
  else
  {
    id v7 = NCBS_Tinker_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446210;
      v9 = "-[NCBSGuardianContactCardViewController contactViewController:didCompleteWithContact:]";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - setMeContact canceled (no contact)", (uint8_t *)&v8, 0xCu);
    }
  }
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
  objc_destroyWeak((id *)&self->miniFlowDelegate);

  objc_storeStrong((id *)&self->_guardianContactStore, 0);
}

@end