@interface PHBlocklistSettingsListController
- (BOOL)editing;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BSUIBrandManager)brandManager;
- (CNContactPickerViewController)contactPickerViewController;
- (CNContactStore)contactStore;
- (PHBlocklistSettingsListController)init;
- (PSSpecifier)addNewSpecifier;
- (TUContactsDataProvider)contactsDataProvider;
- (id)_specifierForRowIndex:(int64_t)a3;
- (id)specifiers;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)specifierStartIndex;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_editDoneButtonTapped:(id)a3;
- (void)_ruleTapped:(id)a3;
- (void)_rulesChanged:(id)a3;
- (void)_showContactPickerViewController:(id)a3;
- (void)_updateEditDoneButton;
- (void)_updateForEditingState;
- (void)blockContact:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)dealloc;
- (void)emitNavigationEvent;
- (void)loadView;
- (void)setAddNewSpecifier:(id)a3;
- (void)setBrandManager:(id)a3;
- (void)setContactPickerViewController:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactsDataProvider:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setSpecifierStartIndex:(int64_t)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHBlocklistSettingsListController

- (PHBlocklistSettingsListController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHBlocklistSettingsListController;
  v2 = [(PHBlocklistSettingsListController *)&v8 init];
  if (v2)
  {
    TUAddLocalNSObserver();
    v3 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = (TUContactsDataProvider *)[objc_alloc((Class)TUContactsDataProvider) initWithContactsDataSource:v2->_contactStore];
    contactsDataProvider = v2->_contactsDataProvider;
    v2->_contactsDataProvider = v5;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHBlocklistSettingsListController;
  [(PHBlocklistSettingsListController *)&v4 dealloc];
}

- (void)_rulesChanged:(id)a3
{
  [(PHBlocklistSettingsListController *)self reloadSpecifiers];
  objc_super v4 = +[TUPrivacyManager sharedPrivacyManager];
  v5 = [v4 privacyRules];
  id v6 = [v5 count];

  if (!v6) {
    self->_editing = 0;
  }

  [(PHBlocklistSettingsListController *)self _updateForEditingState];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)PHBlocklistSettingsListController;
  if ([(PHBlocklistSettingsListController *)&v4 respondsToSelector:"loadView"])
  {
    v3.receiver = self;
    v3.super_class = (Class)PHBlocklistSettingsListController;
    [(PHBlocklistSettingsListController *)&v3 loadView];
  }
  [(PHBlocklistSettingsListController *)self _updateEditDoneButton];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PHBlocklistSettingsListController *)self reloadSpecifiers];
  v8.receiver = self;
  v8.super_class = (Class)PHBlocklistSettingsListController;
  [(PHBlocklistSettingsListController *)&v8 viewWillAppear:v3];
  v5 = [(PHBlocklistSettingsListController *)self specifier];
  id v6 = [v5 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PHBlocklistSettingsListController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  BOOL v3 = [(PHBlocklistSettingsListController *)self specifier];
  objc_super v4 = [v3 target];
  v5 = [v4 parentListController];
  id v27 = [v5 specifierID];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  v7 = +[NSLocale currentLocale];
  objc_super v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  id v10 = [v6 initWithKey:@"Apps" table:0 locale:v7 bundleURL:v9];

  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v10, 0);
  if ([v27 isEqualToString:@"com.apple.preferences.facetime"])
  {
    id v26 = v10;
    id v12 = TUBundleIdentifierFaceTimeApplication;
    id v13 = objc_alloc((Class)_NSLocalizedStringResource);
    v14 = +[NSLocale currentLocale];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    CFStringRef v17 = @"FaceTime";
  }
  else
  {
    if (![v27 isEqualToString:@"com.apple.preferences.phone"]) {
      goto LABEL_6;
    }
    id v26 = v10;
    id v12 = TUBundleIdentifierPhoneApplication;
    id v13 = objc_alloc((Class)_NSLocalizedStringResource);
    v14 = +[NSLocale currentLocale];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    CFStringRef v17 = @"Phone";
  }
  id v18 = [v13 initWithKey:v17 table:0 locale:v14 bundleURL:v16];
  [v11 addObject:v18];

  v19 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", v12, @"BLOCKLIST_SETTINGS_MAIN_SPECIFIER_IDENTIFIER"];
  v20 = +[NSURL URLWithString:v19];
  id v21 = objc_alloc((Class)_NSLocalizedStringResource);
  v22 = +[NSLocale currentLocale];
  v23 = +[NSBundle bundleForClass:objc_opt_class()];
  v24 = [v23 bundleURL];
  id v25 = [v21 initWithKey:@"Blocked Contacts" table:0 locale:v22 bundleURL:v24];

  [(PHBlocklistSettingsListController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v12 title:v25 localizedNavigationComponents:v11 deepLink:v20];
  id v10 = v26;
LABEL_6:
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
    if (PHShouldHideVoicemailUI()) {
      CFStringRef v7 = @"BLOCKLIST_HELP_NO_VOICEMAIL";
    }
    else {
      CFStringRef v7 = @"BLOCKLIST_HELP";
    }
    objc_super v8 = +[PHBlocklistSettingsStrings localizedStringForKey:v7];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];
    [v5 addObject:v6];
    self->_specifierStartIndex = 1;
    v9 = +[TUPrivacyManager sharedPrivacyManager];
    id v10 = [v9 privacyRules];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_3ABC;
    v19[3] = &unk_83D0;
    v19[4] = self;
    id v11 = v5;
    id v20 = v11;
    [v10 enumerateObjectsUsingBlock:v19];

    addNewSpecifier = self->_addNewSpecifier;
    if (!addNewSpecifier)
    {
      id v13 = +[PHBlocklistSettingsStrings localizedStringForKey:@"BLOCKLIST_ADD_NEW"];
      v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:13 edit:0];
      v15 = self->_addNewSpecifier;
      self->_addNewSpecifier = v14;

      [(PSSpecifier *)self->_addNewSpecifier setButtonAction:"_showContactPickerViewController:"];
      addNewSpecifier = self->_addNewSpecifier;
    }
    [v11 addObject:addNewSpecifier];
    id v16 = [objc_alloc((Class)NSArray) initWithArray:v11];
    CFStringRef v17 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v16;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_ruleTapped:(id)a3
{
  id v34 = a3;
  objc_super v4 = [v34 userInfo];
  unsigned int v5 = [v4 type];
  if (!v5)
  {
    id v10 = [v4 phoneNumber];
    id v11 = [v10 unformattedInternationalRepresentation];
    id v12 = v11;
    if (v11)
    {
      id v35 = v11;
    }
    else
    {
      v14 = [v4 phoneNumber];
      id v35 = [v14 digits];
    }
    id v6 = (id *)&CNContactPhoneNumbersKey;
    uint64_t v7 = 2;
    goto LABEL_11;
  }
  if (v5 != 2)
  {
    if (v5 != 1)
    {
      id v13 = 0;
      uint64_t v7 = 0;
      id v35 = 0;
      goto LABEL_12;
    }
    id v35 = [v4 email];
    id v6 = (id *)&CNContactEmailAddressesKey;
    uint64_t v7 = 3;
LABEL_11:
    id v13 = *v6;
LABEL_12:
    id v15 = objc_alloc((Class)TUContactsDataProviderFetchRequest);
    id v16 = [objc_alloc((Class)TUHandle) initWithType:v7 value:v35];
    id v17 = [v15 initWithHandle:v16];

    id v18 = +[CNContactViewController descriptorForRequiredKeys];
    v41 = v18;
    v19 = +[NSArray arrayWithObjects:&v41 count:1];
    [v17 setAuxiliaryKeysToFetch:v19];

    id v20 = [(PHBlocklistSettingsListController *)self contactsDataProvider];
    id v21 = [v20 executeFetchRequest:v17];

    v22 = [v21 contacts];
    v23 = [v22 firstObject];

    if (v23)
    {
      v24 = +[CNContactViewController viewControllerForContact:v23];
      [v24 setAllowsEditing:0];
      if ([v13 isEqualToString:CNContactPhoneNumbersKey])
      {
        id v25 = +[CNPhoneNumber phoneNumberWithStringValue:v35];
        id v26 = [v23 labeledValueForPhoneNumber:v25];
        id v27 = [v26 identifier];
      }
      else
      {
        if (![v13 isEqualToString:CNContactEmailAddressesKey])
        {
          id v27 = 0;
          goto LABEL_25;
        }
        id v25 = [v23 labeledValueForEmailAddress:v35];
        id v27 = [v25 identifier];
      }

LABEL_25:
      [v24 highlightPropertyWithKey:v13 identifier:v27];
      goto LABEL_26;
    }
    id v27 = objc_alloc_init((Class)CNMutableContact);
    if ([v13 isEqualToString:CNContactPhoneNumbersKey])
    {
      v28 = +[CNPhoneNumber phoneNumberWithStringValue:v35];
      v29 = +[CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMain value:v28];
      v40 = v29;
      v30 = +[NSArray arrayWithObjects:&v40 count:1];

      [v27 setPhoneNumbers:v30];
    }
    else
    {
      if (![v13 isEqualToString:CNContactEmailAddressesKey])
      {
LABEL_23:
        v24 = +[CNContactViewController viewControllerForUnknownContact:v27];
LABEL_26:

        v32 = [(PHBlocklistSettingsListController *)self contactStore];
        [v24 setContactStore:v32];

        v33 = [(PHBlocklistSettingsListController *)self navigationController];
        [v33 pushViewController:v24 animated:1];

        goto LABEL_27;
      }
      v31 = +[CNLabeledValue labeledValueWithLabel:CNLabelHome value:v35];
      v39 = v31;
      v30 = +[NSArray arrayWithObjects:&v39 count:1];

      [v27 setEmailAddresses:v30];
    }

    goto LABEL_23;
  }
  objc_initWeak(&location, self);
  objc_super v8 = [(PHBlocklistSettingsListController *)self brandManager];
  v9 = [v4 businessID];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_4548;
  v36[3] = &unk_8420;
  objc_copyWeak(&v37, &location);
  [v8 brandWithURI:v9 completion:v36];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
LABEL_27:
}

- (void)_updateEditDoneButton
{
  uint64_t v3 = +[TUPrivacyManager sharedPrivacyManager];
  objc_super v4 = [v3 privacyRules];
  id v5 = [v4 count];

  if (v5)
  {
    if (self->_editing) {
      CFStringRef v6 = @"BLOCKLIST_DONE";
    }
    else {
      CFStringRef v6 = @"BLOCKLIST_EDIT";
    }
    id v9 = +[PHBlocklistSettingsStrings localizedStringForKey:v6];
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v9 style:2 * self->_editing target:self action:"_editDoneButtonTapped:"];
    objc_super v8 = [(PHBlocklistSettingsListController *)self navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
  else
  {
    id v9 = [(PHBlocklistSettingsListController *)self navigationItem];
    [v9 setRightBarButtonItem:0];
  }
}

- (void)_updateForEditingState
{
  [(PHBlocklistSettingsListController *)self _updateEditDoneButton];
  uint64_t v3 = [(PHBlocklistSettingsListController *)self navigationItem];
  [v3 setHidesBackButton:self->_editing animated:1];

  objc_super v4 = [(PHBlocklistSettingsListController *)self table];
  [v4 setEditing:self->_editing animated:1];

  addNewSpecifier = self->_addNewSpecifier;
  CFStringRef v6 = +[NSNumber numberWithBool:!self->_editing];
  [(PSSpecifier *)addNewSpecifier setProperty:v6 forKey:PSEnabledKey];

  id v7 = self->_addNewSpecifier;

  [(PHBlocklistSettingsListController *)self reloadSpecifier:v7 animated:0];
}

- (void)_editDoneButtonTapped:(id)a3
{
  self->_editing ^= 1u;
  [(PHBlocklistSettingsListController *)self _updateForEditingState];
}

- (void)_showContactPickerViewController:(id)a3
{
  objc_super v4 = [(PHBlocklistSettingsListController *)self contactPickerViewController];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)CNContactPickerViewController);
    [(PHBlocklistSettingsListController *)self setContactPickerViewController:v5];

    CFStringRef v6 = [(PHBlocklistSettingsListController *)self contactPickerViewController];
    [v6 setDelegate:self];

    id v7 = +[NSPredicate predicateWithFormat:@"(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"];
    objc_super v8 = [(PHBlocklistSettingsListController *)self contactPickerViewController];
    [v8 setPredicateForEnablingContact:v7];

    id v9 = [(PHBlocklistSettingsListController *)self contactPickerViewController];
    [v9 setAllowsEditing:0];

    v16[0] = CNContactPhoneNumbersKey;
    v16[1] = CNContactEmailAddressesKey;
    id v10 = +[NSArray arrayWithObjects:v16 count:2];
    id v11 = [(PHBlocklistSettingsListController *)self contactPickerViewController];
    [v11 setDisplayedPropertyKeys:v10];

    id v12 = [(PHBlocklistSettingsListController *)self contactPickerViewController];
    [v12 setAllowsCancel:1];

    id v13 = [(PHBlocklistSettingsListController *)self contactPickerViewController];
    v14 = +[PHBlocklistSettingsStrings localizedStringForKey:@"BLOCKLIST_ADD_PROMPT"];
    [v13 setPrompt:v14];
  }
  id v15 = [(PHBlocklistSettingsListController *)self contactPickerViewController];
  [(PHBlocklistSettingsListController *)self presentViewController:v15 animated:1 completion:0];
}

- (BSUIBrandManager)brandManager
{
  brandManager = self->_brandManager;
  if (!brandManager)
  {
    objc_super v4 = (BSUIBrandManager *)[objc_alloc((Class)BSUIBrandManager) initWithCachingEnabled:0];
    id v5 = self->_brandManager;
    self->_brandManager = v4;

    brandManager = self->_brandManager;
  }

  return brandManager;
}

- (id)_specifierForRowIndex:(int64_t)a3
{
  unint64_t v4 = self->_specifierStartIndex + a3;
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  if (v4 >= (unint64_t)[*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] count])
  {
    CFStringRef v6 = 0;
  }
  else
  {
    CFStringRef v6 = [*(id *)&self->PSListController_opaque[v5] objectAtIndex:v4];
  }

  return v6;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  unint64_t v4 = self;
  -[PHBlocklistSettingsListController _specifierForRowIndex:](self, "_specifierForRowIndex:", objc_msgSend(a4, "row", a3));
  uint64_t v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v5 != v4->_addNewSpecifier;

  return (char)v4;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  unint64_t v4 = self;
  -[PHBlocklistSettingsListController _specifierForRowIndex:](self, "_specifierForRowIndex:", objc_msgSend(a4, "row", a3));
  uint64_t v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v5 != v4->_addNewSpecifier;

  return (char)v4;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    -[PHBlocklistSettingsListController _specifierForRowIndex:](self, "_specifierForRowIndex:", objc_msgSend(a5, "row", a3));
    id v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    if (v7 && v7 != self->_addNewSpecifier)
    {
      id v10 = v7;
      objc_super v8 = +[TUPrivacyManager sharedPrivacyManager];
      id v9 = [(PSSpecifier *)v10 userInfo];
      [v8 removeRule:v9];

      [(PHBlocklistSettingsListController *)self removeSpecifier:v10 animated:1];
      [(PHBlocklistSettingsListController *)self reloadSpecifiers];
      id v7 = v10;
    }
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return +[PHBlocklistSettingsStrings localizedStringForKey:@"BLOCKLIST_REMOVE", a4];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)blockContact:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = a3;
  uint64_t v3 = [v21 phoneNumbers];
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = [*(id *)(*((void *)&v27 + 1) + 8 * i) value];
        id v9 = [v8 digits];
        id v10 = TUHomeCountryCode();
        id v11 = +[TUPhoneNumber phoneNumberWithDigits:v9 countryCode:v10];

        if (v11)
        {
          id v12 = +[TUPrivacyManager sharedPrivacyManager];
          [v12 setBlockIncomingCommunication:1 forPhoneNumber:v11];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v5);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = [v21 emailAddresses];
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
        v19 = +[TUPrivacyManager sharedPrivacyManager];
        id v20 = [v18 value];
        [v19 setBlockIncomingCommunication:1 forEmailAddress:v20];
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  [(PHBlocklistSettingsListController *)self reloadSpecifiers];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a4;
  [a3 invalidateSelectionAnimated:1];
  [(PHBlocklistSettingsListController *)self blockContact:v6];
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (TUContactsDataProvider)contactsDataProvider
{
  return self->_contactsDataProvider;
}

- (void)setContactsDataProvider:(id)a3
{
}

- (CNContactPickerViewController)contactPickerViewController
{
  return self->_contactPickerViewController;
}

- (void)setContactPickerViewController:(id)a3
{
}

- (PSSpecifier)addNewSpecifier
{
  return self->_addNewSpecifier;
}

- (void)setAddNewSpecifier:(id)a3
{
}

- (int64_t)specifierStartIndex
{
  return self->_specifierStartIndex;
}

- (void)setSpecifierStartIndex:(int64_t)a3
{
  self->_specifierStartIndex = a3;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void)setBrandManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandManager, 0);
  objc_storeStrong((id *)&self->_addNewSpecifier, 0);
  objc_storeStrong((id *)&self->_contactPickerViewController, 0);
  objc_storeStrong((id *)&self->_contactsDataProvider, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end