@interface TCSettingsViewController
- (BOOL)_contactIsUnknown:(id)a3;
- (BOOL)_hasWalkieTalkieContacts;
- (BOOL)_specifierAtIndexPathIsContact:(id)a3;
- (BOOL)editing;
- (BOOL)suppressAlertSpecifiers;
- (BOOL)suppressMirrorOption;
- (BOOL)suppressSendToNotificationCenterOption;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (TCSContactsDataSource)contactsDataSource;
- (TCSettingsViewController)init;
- (id)_allContactSpecifiers;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)localizedPaneTitle;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_displayContactForSpecifier:(id)a3;
- (void)_editDoneButtonTapped:(id)a3;
- (void)_reload;
- (void)_removeContactFromSpecifier:(id)a3;
- (void)_updateEditDoneButton;
- (void)_updateFooterTextForAllowlistGroupSpecifier:(id)a3;
- (void)_updateForEditingState;
- (void)contactsDidChange:(id)a3;
- (void)dealloc;
- (void)recencyDidChange:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactsDataSource:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TCSettingsViewController

- (TCSettingsViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)TCSettingsViewController;
  v2 = [(TCSettingsViewController *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v3;

    uint64_t v5 = objc_opt_new();
    contactFormatter = v2->_contactFormatter;
    v2->_contactFormatter = (CNContactFormatter *)v5;

    [(CNContactFormatter *)v2->_contactFormatter setStyle:0];
    [(CNContactFormatter *)v2->_contactFormatter setFallbackStyle:-1];
    id v7 = objc_alloc((Class)TCSContactsDataSource);
    v8 = v2->_contactStore;
    v9 = objc_opt_new();
    v10 = (TCSContactsDataSource *)[v7 initWithContactStore:v8 contacts:v9];
    contactsDataSource = v2->_contactsDataSource;
    v2->_contactsDataSource = v10;

    [(TCSContactsDataSource *)v2->_contactsDataSource setDelegate:v2];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_4E58, NSPersonNamePreferencesDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)TCSettingsViewController;
  [(TCSettingsViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TCSettingsViewController;
  [(TCSettingsViewController *)&v4 viewDidLoad];
  uint64_t v3 = [(TCSettingsViewController *)self table];
  [v3 setAllowsSelectionDuringEditing:1];

  [(TCSettingsViewController *)self _updateEditDoneButton];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TCSettingsViewController;
  [(TCSettingsViewController *)&v4 viewWillAppear:a3];
  [(TCSettingsViewController *)self reloadSpecifiers];
  [(TCSettingsViewController *)self _updateForEditingState];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"TINCAN_NAV_TITLE" value:&stru_8240 table:0];

  return v3;
}

- (id)applicationBundleIdentifier
{
  return TCSTinCanAppBundleIdentifier;
}

- (id)applicationGroupSpecifiers
{
  if ([(TCSettingsViewController *)self settingsMode] == (char *)&dword_0 + 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(TCSettingsViewController *)self _allContactSpecifiers];
  }

  return v3;
}

- (BOOL)suppressMirrorOption
{
  return 1;
}

- (BOOL)suppressAlertSpecifiers
{
  return 0;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (void)contactsDidChange:(id)a3
{
}

- (void)recencyDidChange:(id)a3
{
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return [(TCSettingsViewController *)self _specifierAtIndexPathIsContact:a4];
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  if ([(TCSettingsViewController *)self _specifierAtIndexPathIsContact:a4])
  {
    objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"TINCAN_ALLOWLIST_REMOVE" value:&stru_8240 table:0];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(TCSettingsViewController *)self _specifierAtIndexPathIsContact:a4];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_editing)
  {
    if ([(TCSettingsViewController *)self _specifierAtIndexPathIsContact:v7])
    {
      id v8 = 0;
      goto LABEL_6;
    }
    [(TCSettingsViewController *)self _editDoneButtonTapped:self];
  }
  id v8 = v7;
LABEL_6:

  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return [(TCSettingsViewController *)self _specifierAtIndexPathIsContact:a4];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    uint64_t v7 = [(TCSettingsViewController *)self specifierAtIndexPath:a5];
    if (v7) {
      [(TCSettingsViewController *)self _removeContactFromSpecifier:v7];
    }
    _objc_release_x1();
  }
}

- (void)_reload
{
  [(TCSettingsViewController *)self reloadSpecifiers];
  if (![(TCSettingsViewController *)self _hasWalkieTalkieContacts]) {
    self->_editing = 0;
  }

  [(TCSettingsViewController *)self _updateForEditingState];
}

- (id)_allContactSpecifiers
{
  v52 = [(TCSettingsViewController *)self loadSpecifiersFromPlistName:@"TinCanSettings" target:self];
  uint64_t v3 = [(TCSContactsDataSource *)self->_contactsDataSource sortedContacts];
  id v4 = [v3 copy];

  uint64_t v5 = [(TCSContactsDataSource *)self->_contactsDataSource sortedInviters];
  id v6 = [v5 copy];

  uint64_t v7 = [(TCSContactsDataSource *)self->_contactsDataSource sortedInvitees];
  id v8 = [v7 copy];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"GROUP_TITLE_FRIENDS" value:&stru_8240 table:0];
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:0 edit:0];
  friendsGroupSpecifier = self->_friendsGroupSpecifier;
  self->_friendsGroupSpecifier = v11;

  v47 = v6;
  id v13 = [v6 count];
  if (v13)
  {
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"GROUP_TITLE_FRIENDS_INVITED_YOU" value:&stru_8240 table:0];
    objc_super v14 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:0 edit:0];
  }
  else
  {
    objc_super v14 = 0;
  }
  p_invitersGroupSpecifier = &self->_invitersGroupSpecifier;
  objc_storeStrong((id *)&self->_invitersGroupSpecifier, v14);
  if (v13)
  {
  }
  id v15 = [v8 count];
  if (v15)
  {
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"GROUP_TITLE_FRIENDS_YOU_INVITED" value:&stru_8240 table:0];
    v16 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:0 edit:0];
  }
  else
  {
    v16 = 0;
  }
  v46 = v8;
  objc_storeStrong((id *)&self->_inviteesGroupSpecifier, v16);
  if (v15)
  {
  }
  [(TCSettingsViewController *)self _updateFooterTextForAllowlistGroupSpecifier:self->_friendsGroupSpecifier];
  [v52 addObject:self->_friendsGroupSpecifier];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v4;
  id v17 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v62;
    uint64_t v20 = PSEnabledKey;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        v23 = [(CNContactFormatter *)self->_contactFormatter stringFromContact:v22];
        v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:2 edit:0];

        [v24 setButtonAction:"_displayContactForSpecifier:"];
        [v24 setUserInfo:v22];
        [v24 setProperty:&__kCFBooleanTrue forKey:v20];
        [v24 setProperty:&off_83C8 forKey:@"TCSContactsDataSourceSectionType"];
        [v52 addObject:v24];
      }
      id v18 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v18);
  }

  v25 = *p_invitersGroupSpecifier;
  if (*p_invitersGroupSpecifier)
  {
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"GROUP_FOOTER_FRIENDS_INVITED_YOU" value:&stru_8240 table:0];
    [(PSSpecifier *)v25 setProperty:v27 forKey:PSFooterTextGroupKey];

    [v52 addObject:*p_invitersGroupSpecifier];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v49 = v47;
    id v28 = [v49 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v58;
      uint64_t v31 = PSEnabledKey;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(v49);
          }
          uint64_t v33 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
          v34 = [(CNContactFormatter *)self->_contactFormatter stringFromContact:v33];
          v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:0 detail:0 cell:2 edit:0];

          [v35 setButtonAction:"_displayContactForSpecifier:"];
          [v35 setUserInfo:v33];
          [v35 setProperty:&__kCFBooleanTrue forKey:v31];
          [v35 setProperty:&off_83E0 forKey:@"TCSContactsDataSourceSectionType"];
          [v52 addObject:v35];
        }
        id v29 = [v49 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v29);
    }
  }
  if (self->_inviteesGroupSpecifier)
  {
    objc_msgSend(v52, "addObject:");
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v50 = v46;
    id v36 = [v50 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v54;
      uint64_t v39 = PSEnabledKey;
      do
      {
        for (k = 0; k != v37; k = (char *)k + 1)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v50);
          }
          uint64_t v41 = *(void *)(*((void *)&v53 + 1) + 8 * (void)k);
          v42 = [(CNContactFormatter *)self->_contactFormatter stringFromContact:v41];
          v43 = +[PSSpecifier preferenceSpecifierNamed:v42 target:self set:0 get:0 detail:0 cell:2 edit:0];

          [v43 setButtonAction:"_displayContactForSpecifier:"];
          [v43 setUserInfo:v41];
          [v43 setProperty:&__kCFBooleanTrue forKey:v39];
          [v43 setProperty:&off_83F8 forKey:@"TCSContactsDataSourceSectionType"];
          [v52 addObject:v43];
        }
        id v37 = [v50 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v37);
    }
  }
  v44 = +[NSArray arrayWithArray:v52];

  return v44;
}

- (void)_updateEditDoneButton
{
  if ([(TCSettingsViewController *)self _hasWalkieTalkieContacts]
    && [(TCSettingsViewController *)self settingsMode] != (char *)&dword_0 + 1)
  {
    BOOL editing = self->_editing;
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    if (editing) {
      CFStringRef v6 = @"TINCAN_ALLOWLIST_DONE";
    }
    else {
      CFStringRef v6 = @"TINCAN_ALLOWLIST_EDIT";
    }
    id v9 = [v4 localizedStringForKey:v6 value:&stru_8240 table:0];

    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v9 style:2 * self->_editing target:self action:"_editDoneButtonTapped:"];
    id v8 = [(TCSettingsViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
  else
  {
    id v9 = [(TCSettingsViewController *)self navigationItem];
    [v9 setRightBarButtonItem:0];
  }
}

- (void)_updateForEditingState
{
  [(TCSettingsViewController *)self _updateEditDoneButton];
  uint64_t v3 = [(TCSettingsViewController *)self navigationItem];
  [v3 setHidesBackButton:self->_editing animated:1];

  id v4 = [(TCSettingsViewController *)self table];
  [v4 setEditing:self->_editing animated:1];
}

- (void)_editDoneButtonTapped:(id)a3
{
  self->_editing ^= 1u;
  [(TCSettingsViewController *)self _updateForEditingState];
}

- (BOOL)_specifierAtIndexPathIsContact:(id)a3
{
  uint64_t v3 = [(TCSettingsViewController *)self specifierAtIndexPath:a3];
  id v4 = [v3 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_removeContactFromSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"TCSContactsDataSourceSectionType"];
  CFStringRef v6 = (char *)[v5 integerValue];

  contactsDataSource = self->_contactsDataSource;
  id v8 = [v4 userInfo];
  [(TCSContactsDataSource *)contactsDataSource removeContact:v8 inSection:v6];

  [(TCSettingsViewController *)self removeSpecifier:v4 animated:1];
  if (v6 == (unsigned char *)&dword_0 + 2)
  {
    v12 = [(TCSContactsDataSource *)self->_contactsDataSource sortedInvitees];
    id v13 = [v12 count];

    if (v13) {
      goto LABEL_8;
    }
    v11 = &OBJC_IVAR___TCSettingsViewController__inviteesGroupSpecifier;
    goto LABEL_7;
  }
  if (v6 == (unsigned char *)&dword_0 + 1)
  {
    id v9 = [(TCSContactsDataSource *)self->_contactsDataSource sortedInviters];
    id v10 = [v9 count];

    if (!v10)
    {
      v11 = &OBJC_IVAR___TCSettingsViewController__invitersGroupSpecifier;
LABEL_7:
      [(TCSettingsViewController *)self removeSpecifier:*(void *)&self->BPSNotificationAppController_opaque[*v11] animated:1];
    }
  }
LABEL_8:
  if (![(TCSettingsViewController *)self _hasWalkieTalkieContacts])
  {
    self->_BOOL editing = 0;
    [(TCSettingsViewController *)self _updateFooterTextForAllowlistGroupSpecifier:self->_friendsGroupSpecifier];
    [(TCSettingsViewController *)self reloadSpecifier:self->_friendsGroupSpecifier];
  }

  [(TCSettingsViewController *)self _updateForEditingState];
}

- (BOOL)_contactIsUnknown:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_displayContactForSpecifier:(id)a3
{
  id v4 = [a3 userInfo];
  if ([(TCSettingsViewController *)self _contactIsUnknown:v4])
  {
    uint64_t v5 = +[CNContactViewController viewControllerForUnknownContact:v4];
    if (!v5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CFStringRef v6 = +[CNContactViewController descriptorForRequiredKeys];
  uint64_t v22 = v6;
  id v7 = +[NSArray arrayWithObjects:&v22 count:1];
  unsigned __int8 v8 = [v4 areKeysAvailable:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = [(TCSettingsViewController *)self contactStore];
    id v10 = [v4 identifier];
    v11 = +[CNContactViewController descriptorForRequiredKeys];
    v21 = v11;
    v12 = +[NSArray arrayWithObjects:&v21 count:1];
    id v20 = 0;
    uint64_t v13 = [v9 unifiedContactWithIdentifier:v10 keysToFetch:v12 error:&v20];
    id v14 = v20;

    if (v14)
    {
      _TCSInitializeLogging();
      id v15 = (void *)TCSLogDefault;
      if (os_log_type_enabled(TCSLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_6438(v15, v14);
      }
    }

    id v4 = (void *)v13;
  }
  if (v4)
  {
    uint64_t v5 = +[CNContactViewController viewControllerForContact:v4];
    [v5 setAllowsEditing:0];
    if (v5)
    {
LABEL_11:
      v16 = [(TCSettingsViewController *)self contactStore];
      [v5 setContactStore:v16];

      id v17 = BPSBridgeTintColor();
      id v18 = [v5 view];
      [v18 setTintColor:v17];

      uint64_t v19 = [(TCSettingsViewController *)self rootController];
      [v19 pushViewController:v5 animated:1];
    }
  }
LABEL_12:
}

- (BOOL)_hasWalkieTalkieContacts
{
  id v3 = [(TCSContactsDataSource *)self->_contactsDataSource sortedContacts];
  id v4 = (char *)[v3 count];
  uint64_t v5 = [(TCSContactsDataSource *)self->_contactsDataSource sortedInviters];
  CFStringRef v6 = &v4[(void)[v5 count]];
  id v7 = [(TCSContactsDataSource *)self->_contactsDataSource sortedInvitees];
  LOBYTE(v6) = (char *)[v7 count] + (void)v6 != 0;

  return (char)v6;
}

- (void)_updateFooterTextForAllowlistGroupSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TCSContactsDataSource *)self->_contactsDataSource sortedContacts];
  id v6 = [v5 count];

  if (v6)
  {
    [v4 removePropertyForKey:PSFooterTextGroupKey];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    contactStore = self->_contactStore;
    id v8 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:&__NSArray0__struct];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_62F0;
    v11[3] = &unk_81E0;
    v11[4] = &v12;
    [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v8 error:0 usingBlock:v11];

    if (*((unsigned char *)v13 + 24))
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      [v9 localizedStringForKey:@"TINCAN_ALLOWLIST_NO_CONTACTS" value:&stru_8240 table:0];
    }
    else
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      [v9 localizedStringForKey:@"TINCAN_ALLOWLIST_NO_CONTACTS_ON_PHONE" value:&stru_8240 table:0];
    id v10 = };

    [v4 setProperty:v10 forKey:PSFooterTextGroupKey];
    _Block_object_dispose(&v12, 8);
  }
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
}

- (TCSContactsDataSource)contactsDataSource
{
  return self->_contactsDataSource;
}

- (void)setContactsDataSource:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_BOOL editing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsDataSource, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_inviteesGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_invitersGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_friendsGroupSpecifier, 0);
}

@end