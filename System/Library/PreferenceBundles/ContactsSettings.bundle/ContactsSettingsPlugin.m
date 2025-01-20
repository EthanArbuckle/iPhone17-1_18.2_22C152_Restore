@interface ContactsSettingsPlugin
- (BOOL)_importAlreadyInProgress;
- (BOOL)shouldLoadSpecifiersLazily;
- (CNSharedProfileOnboardingController)onboardingController;
- (ContactsSettingsPlugin)init;
- (PSSystemPolicyForApp)appPolicy;
- (__CTServerConnection)_ctServerConnection;
- (id)_simPhonebookEntryAtIndex:(int)a3;
- (id)contactProviderCount:(id)a3;
- (id)contactStoreTitlesForSpecifier:(id)a3;
- (id)contactsSortOrder:(id)a3;
- (id)defaultContactsName:(id)a3;
- (id)meCardName:(id)a3;
- (id)personNameOrder:(id)a3;
- (id)sharedNameAndPhotoAudience:(id)a3;
- (id)sharedNameAndPhotoSharingFooterText;
- (id)specifiers;
- (int64_t)providerCount;
- (void)_SIMStatusChanged;
- (void)_beginImportToStoreID:(int)a3;
- (void)_clearSpecifiers;
- (void)_dismissMeCardPickerAnimated:(BOOL)a3;
- (void)_erroredDuringSIMPhonebookFetch;
- (void)_fetchSIMPhonebook;
- (void)_noteImportEnded;
- (void)_noteImportStarted;
- (void)_phonebookAvailable;
- (void)_phonebookSelected;
- (void)_reloadMeCardCellIfVisible;
- (void)_rootControllerDidSuspend;
- (void)_setDefaultContacts:(id)a3 specifier:(id)a4;
- (void)_showMeCardPopover;
- (void)_stopListeningForSIMPhonebookNotifications;
- (void)_synchronizeNanoUserDefault:(id)a3;
- (void)_updateABStoresAndNames;
- (void)_updateSIMImportSpecifier:(BOOL)a3;
- (void)_updateSIMImportVisibility;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)importFromSIM:(id)a3;
- (void)onboardingControllerDidDismissSettings:(id)a3;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)provideSettingsNavigationDonation;
- (void)setAppPolicy:(id)a3;
- (void)setContactsSortOrder:(id)a3 specifier:(id)a4;
- (void)setDefaultContacts:(id)a3 specifier:(id)a4;
- (void)setOnboardingController:(id)a3;
- (void)setPersonNameOrder:(id)a3 specifier:(id)a4;
- (void)setProviderCount:(int64_t)a3;
- (void)showMeCardPicker:(id)a3;
- (void)showSharedNameAndPhotoSettings:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)windowDidRotate:(id)a3;
- (void)windowWillRotate:(id)a3;
@end

@implementation ContactsSettingsPlugin

- (id)specifiers
{
  [(ContactsSettingsPlugin *)self setTitle:0];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = objc_alloc((Class)NSDictionary);
  v5 = [v3 pathForResource:@"Contacts" ofType:@"plist"];
  id v6 = [v4 initWithContentsOfFile:v5];

  v40 = v6;
  v7 = SpecifiersFromPlist();
  uint64_t v8 = objc_msgSend(v7, "specifierForID:", @"ContactsPlacard", 0);
  v9 = [(ContactsSettingsPlugin *)self appPolicy];

  if (!v9)
  {
    id v10 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.MobileAddressBook"];
    [(ContactsSettingsPlugin *)self setAppPolicy:v10];

    v11 = [(ContactsSettingsPlugin *)self appPolicy];
    [v11 setDelegate:self];
  }
  v12 = [(ContactsSettingsPlugin *)self appPolicy];
  uint64_t v13 = [v12 specifiersForPolicyOptions:0x800000 force:0];

  v14 = [(ContactsSettingsPlugin *)self appPolicy];
  v15 = [v14 specifiersForPolicyOptions:0x8000000 force:0];

  v39 = v7;
  v16 = (NSMutableArray *)[v7 mutableCopy];
  currentSpecifiers = self->_currentSpecifiers;
  self->_currentSpecifiers = v16;

  uint64_t v18 = [v15 specifierForID:@"ACCOUNTS"];
  v38 = (void *)v8;
  v36 = v15;
  if (v18)
  {
    v19 = (void *)v18;
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"CONTACTS_ACCOUNTS" value:&stru_10D88 table:@"Contacts"];
    [v19 setName:v21];
  }
  else
  {
    v19 = [v15 specifierForID:@"ADD_ACCOUNT"];
    if (!v19) {
      goto LABEL_7;
    }
  }
  [(NSMutableArray *)self->_currentSpecifiers ps_insertObject:v19 afterObject:v8];
LABEL_7:
  v37 = (void *)v13;
  v35 = v19;
  [(NSMutableArray *)self->_currentSpecifiers ps_insertObjectsFromArray:v13 afterObject:v19];
  [(ContactsSettingsPlugin *)self _updateSIMImportVisibility];
  [(ContactsSettingsPlugin *)self _updateABStoresAndNames];
  id v41 = [(NSMutableArray *)self->_contactStores count];
  v22 = +[CNEnvironment currentEnvironment];
  v23 = [v22 featureFlags];
  unsigned __int8 v34 = [v23 isFeatureEnabled:5];

  v24 = (char *)[(NSMutableArray *)self->_currentSpecifiers count];
  if ((uint64_t)v24 >= 1)
  {
    v25 = v24 + 1;
    uint64_t v33 = PSFooterTextGroupKey;
    uint64_t v26 = PSValuesDataSourceKey;
    uint64_t v27 = PSTitlesDataSourceKey;
    while (1)
    {
      v28 = [(NSMutableArray *)self->_currentSpecifiers objectAtIndex:v25 - 2];
      v29 = [v28 identifier];
      if ([v29 isEqualToString:@"DefaultContacts"]) {
        break;
      }
      if ([v29 isEqualToString:@"SIMImport"])
      {
        objc_storeStrong((id *)&self->_SIMImportSpecifier, v28);
        objc_storeWeak((id *)&v28[OBJC_IVAR___PSSpecifier_target], self);
      }
      else
      {
        if (![v29 isEqualToString:@"SIMImportSpacer"])
        {
          if ([v29 isEqualToString:@"MeCard"])
          {
            objc_storeStrong((id *)&self->_MeCardSpecifier, v28);
LABEL_23:
            objc_storeWeak((id *)&v28[OBJC_IVAR___PSSpecifier_target], self);
            goto LABEL_24;
          }
          if ([v29 isEqualToString:@"ContactsSortOrder"]
            || [v29 isEqualToString:@"PersonNameOrder"]
            || [v29 isEqualToString:@"ContactsInMail"])
          {
            goto LABEL_23;
          }
          if ([v29 isEqualToString:@"ContactProvider"])
          {
            objc_storeWeak((id *)&v28[OBJC_IVAR___PSSpecifier_target], self);
LABEL_29:
            if (v34) {
              goto LABEL_24;
            }
          }
          else
          {
            if ([v29 isEqualToString:@"ContactProviderSpacer"]) {
              goto LABEL_29;
            }
            if ([v29 isEqualToString:@"SharedNamePhotoSpacer"])
            {
              objc_storeWeak((id *)&v28[OBJC_IVAR___PSSpecifier_target], self);
              v30 = [(ContactsSettingsPlugin *)self sharedNameAndPhotoSharingFooterText];
              [v28 setProperty:v30 forKey:v33];

              goto LABEL_24;
            }
            if ([v29 isEqualToString:@"SharedNameAndPhoto"]) {
              goto LABEL_23;
            }
            if (![v29 isEqualToString:@"ContactsHeader"]) {
              goto LABEL_24;
            }
          }
LABEL_17:
          [(NSMutableArray *)self->_currentSpecifiers removeObjectAtIndex:v25 - 2];
          goto LABEL_24;
        }
        objc_storeStrong((id *)&self->_SIMImportSpacerSpecifier, v28);
      }
      if (!self->_shouldShowSIMImport) {
        goto LABEL_17;
      }
LABEL_24:

      if ((unint64_t)--v25 <= 1) {
        goto LABEL_36;
      }
    }
    objc_storeWeak((id *)&v28[OBJC_IVAR___PSSpecifier_target], self);
    [v28 setProperty:@"contactStoreTitlesForSpecifier:" forKey:v26];
    [v28 setProperty:@"contactStoreTitlesForSpecifier:" forKey:v27];
    if ((unint64_t)v41 >= 2) {
      goto LABEL_24;
    }
    goto LABEL_17;
  }
LABEL_36:
  [(ContactsSettingsPlugin *)self _updateSIMImportSpecifier:0];
  if (MGGetBoolAnswer())
  {
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
  }
  [(ContactsSettingsPlugin *)self setSpecifiers:self->_currentSpecifiers];
  v31 = self->_currentSpecifiers;

  return v31;
}

- (void)_updateSIMImportSpecifier:(BOOL)a3
{
  if (self->_shouldShowSIMImport)
  {
    BOOL v3 = a3;
    unsigned int v5 = [(ContactsSettingsPlugin *)self _importAlreadyInProgress];
    SIMImportSpecifier = self->_SIMImportSpecifier;
    if (v5)
    {
      [(PSSpecifier *)SIMImportSpecifier setProperty:kCFBooleanFalse forKey:PSEnabledKey];
      v7 = self->_SIMImportSpecifier;
      uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"Importing contacts";
    }
    else
    {
      [(PSSpecifier *)SIMImportSpecifier setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      v7 = self->_SIMImportSpecifier;
      uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"Import SIM Contacts";
    }
    v11 = [v8 localizedStringForKey:v10 value:&stru_10D88 table:@"Contacts"];
    [(PSSpecifier *)v7 setName:v11];

    if (v3)
    {
      v12 = self->_SIMImportSpecifier;
      [(ContactsSettingsPlugin *)self reloadSpecifier:v12];
    }
  }
}

- (BOOL)_importAlreadyInProgress
{
  v2 = [UIApp rootController];
  unsigned __int8 v3 = [v2 taskIsRunning:@"importContactsFromSIM"];

  return v3;
}

- (ContactsSettingsPlugin)init
{
  v13.receiver = self;
  v13.super_class = (Class)ContactsSettingsPlugin;
  v2 = [(ContactsSettingsPlugin *)&v13 init];
  if (v2)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_rootControllerDidSuspend" name:PSRootControllerDidSuspendNotification object:0];

    id v4 = +[UIDevice currentDevice];
    if (objc_opt_respondsToSelector())
    {
      unsigned int v5 = +[UIDevice currentDevice];
      id v6 = (char *)[v5 userInterfaceIdiom];

      if (v6 != (unsigned char *)&dword_0 + 1)
      {
LABEL_6:
        uint64_t v8 = (void *)ABAddressBookCreateWithOptions(0, 0);
        v2->_addressBook = v8;
        ABAddressBookRegisterExternalChangeCallback(v8, (ABExternalChangeCallback)sub_4684, v2);
        dispatch_queue_t v9 = dispatch_queue_create("com.apple.addressBookUI.contactsSettingsPlugin", 0);
        addressBookQueue = v2->_addressBookQueue;
        v2->_addressBookQueue = (OS_dispatch_queue *)v9;

        v11 = v2;
        goto LABEL_7;
      }
      v7 = +[NSNotificationCenter defaultCenter];
      [v7 addObserver:v2 selector:"windowWillRotate:" name:UIWindowWillRotateNotification object:0];

      id v4 = +[NSNotificationCenter defaultCenter];
      [v4 addObserver:v2 selector:"windowDidRotate:" name:UIWindowDidRotateNotification object:0];
    }

    goto LABEL_6;
  }
LABEL_7:

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ContactsSettingsPlugin;
  [(ContactsSettingsPlugin *)&v4 viewWillAppear:a3];
  if (([(ContactsSettingsPlugin *)self isMovingToParentViewController] & 1) == 0) {
    [(ContactsSettingsPlugin *)self reloadSpecifiers];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ContactsSettingsPlugin;
  [(ContactsSettingsPlugin *)&v4 viewDidAppear:a3];
  [(ContactsSettingsPlugin *)self provideSettingsNavigationDonation];
}

- (void)_rootControllerDidSuspend
{
  [(UIAlertController *)self->_loadingContacts dismissViewControllerAnimated:0 completion:0];

  [(ContactsSettingsPlugin *)self _dismissMeCardPickerAnimated:0];
}

- (void)_noteImportStarted
{
  if (![(ContactsSettingsPlugin *)self _importAlreadyInProgress])
  {
    id v2 = [UIApp rootController];
    [v2 addTask:@"importContactsFromSIM"];
  }
}

- (void)_noteImportEnded
{
  if ([(ContactsSettingsPlugin *)self _importAlreadyInProgress])
  {
    unsigned __int8 v3 = [UIApp rootController];
    id v12 = [v3 viewControllers];

    objc_super v4 = (char *)[v12 count];
    if ((uint64_t)v4 >= 1)
    {
      unsigned int v5 = v4 + 1;
      while (1)
      {
        id v6 = [v12 objectAtIndex:v5 - 2];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v7 = [(PSSpecifier *)self->_SIMImportSpecifier identifier];
          uint64_t v8 = [v6 specifierForID:v7];

          if (v8) {
            break;
          }
        }

        if ((unint64_t)--v5 <= 1) {
          goto LABEL_10;
        }
      }
      [v8 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      dispatch_queue_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v10 = [v9 localizedStringForKey:@"Import SIM Contacts" value:&stru_10D88 table:@"Contacts"];
      [v8 setName:v10];

      [v6 reloadSpecifier:v8];
    }
LABEL_10:
    v11 = [UIApp rootController];
    [v11 taskFinished:@"importContactsFromSIM"];
  }
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  ABAddressBookUnregisterExternalChangeCallback(self->_addressBook, (ABExternalChangeCallback)sub_4684, self);
  CFRelease(self->_addressBook);
  self->_addressBook = 0;
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection) {
    CFRelease(ctServerConnection);
  }
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveEveryObserver();
  loadingContacts = self->_loadingContacts;
  if (loadingContacts)
  {
    [(UIAlertController *)loadingContacts dismissViewControllerAnimated:0 completion:0];
    id v6 = self->_loadingContacts;
    self->_loadingContacts = 0;
  }
  [(ContactsSettingsPlugin *)self _dismissMeCardPickerAnimated:0];
  v7.receiver = self;
  v7.super_class = (Class)ContactsSettingsPlugin;
  [(ContactsSettingsPlugin *)&v7 dealloc];
}

- (void)_updateABStoresAndNames
{
  addressBookQueue = self->_addressBookQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4B28;
  block[3] = &unk_10A30;
  block[4] = self;
  dispatch_sync(addressBookQueue, block);
}

- (BOOL)shouldLoadSpecifiersLazily
{
  return 1;
}

- (void)setDefaultContacts:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  addressBookQueue = self->_addressBookQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4EBC;
  block[3] = &unk_10A58;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(addressBookQueue, block);
}

- (void)_setDefaultContacts:(id)a3 specifier:(id)a4
{
  id v6 = -[NSMutableArray indexOfObject:](self->_contactStoreNames, "indexOfObject:", a3, a4);
  if (a3)
  {
    id v7 = v6;
    if (v6 < [(NSMutableArray *)self->_contactStores count])
    {
      addressBook = self->_addressBook;
      id v9 = [(NSMutableArray *)self->_contactStores objectAtIndex:v7];
      _ABAddressBookSetDefaultSource(addressBook, v9, 0);
    }
  }
}

- (id)defaultContactsName:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_50A8;
  id v13 = sub_50B8;
  id v14 = 0;
  if (![(NSMutableArray *)self->_contactStoreNames count]) {
    [(ContactsSettingsPlugin *)self _updateABStoresAndNames];
  }
  addressBookQueue = self->_addressBookQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_50C0;
  v8[3] = &unk_10A80;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(addressBookQueue, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)contactStoreTitlesForSpecifier:(id)a3
{
  if (![(NSMutableArray *)self->_contactStoreNames count]) {
    [(ContactsSettingsPlugin *)self _updateABStoresAndNames];
  }
  contactStoreNames = self->_contactStoreNames;

  return contactStoreNames;
}

- (__CTServerConnection)_ctServerConnection
{
  result = self->_ctServerConnection;
  if (!result)
  {
    result = (__CTServerConnection *)_CTServerConnectionCreate();
    self->_ctServerConnection = result;
  }
  return result;
}

- (void)_stopListeningForSIMPhonebookNotifications
{
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();

  CTTelephonyCenterRemoveObserver();
}

- (void)_erroredDuringSIMPhonebookFetch
{
  [(ContactsSettingsPlugin *)self _stopListeningForSIMPhonebookNotifications];
  loadingContacts = self->_loadingContacts;
  if (loadingContacts)
  {
    [(UIAlertController *)loadingContacts dismissViewControllerAnimated:1 completion:0];
    id v4 = self->_loadingContacts;
    self->_loadingContacts = 0;

    [(ContactsSettingsPlugin *)self _noteImportEnded];
  }
}

- (void)_fetchSIMPhonebook
{
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  if ([(ContactsSettingsPlugin *)self _ctServerConnection])
  {
    if (!((unint64_t)_CTServerConnectionSelectPhonebook() >> 32)) {
      return;
    }
    CFRelease(self->_ctServerConnection);
    self->_ctServerConnection = 0;
  }

  [(ContactsSettingsPlugin *)self _erroredDuringSIMPhonebookFetch];
}

- (id)_simPhonebookEntryAtIndex:(int)a3
{
  id v4 = [(ContactsSettingsPlugin *)self _ctServerConnection];
  if (v4)
  {
    if ((unint64_t)_CTServerConnectionCopyPhoneBookEntry() >> 32)
    {
      CFRelease(self->_ctServerConnection);
      self->_ctServerConnection = 0;
      [(ContactsSettingsPlugin *)self _erroredDuringSIMPhonebookFetch];
    }
    id v4 = 0;
  }

  return v4;
}

- (void)_phonebookSelected
{
  if (self->_loadingContacts)
  {
    if ([(ContactsSettingsPlugin *)self _ctServerConnection])
    {
      if (!((unint64_t)_CTServerConnectionFetchPhonebook() >> 32)) {
        return;
      }
      CFRelease(self->_ctServerConnection);
      self->_ctServerConnection = 0;
    }
    [(ContactsSettingsPlugin *)self _erroredDuringSIMPhonebookFetch];
  }
}

- (void)_phonebookAvailable
{
  if (self->_loadingContacts)
  {
    if ([(ContactsSettingsPlugin *)self _ctServerConnection])
    {
      if ((unint64_t)_CTServerConnectionGetPhonebookEntryCount() >> 32)
      {
        CFRelease(self->_ctServerConnection);
        self->_ctServerConnection = 0;
        [(ContactsSettingsPlugin *)self _erroredDuringSIMPhonebookFetch];
      }
      else
      {
        [(UIAlertController *)self->_loadingContacts dismissViewControllerAnimated:1 completion:0];
        loadingContacts = self->_loadingContacts;
        self->_loadingContacts = 0;

        self->_importStoreID = -1;
        [(ContactsSettingsPlugin *)self _noteImportEnded];
      }
    }
    else
    {
      [(ContactsSettingsPlugin *)self _erroredDuringSIMPhonebookFetch];
    }
  }
}

- (void)_beginImportToStoreID:(int)a3
{
  if (self->_shouldShowSIMImport)
  {
    self->_importStoreID = a3;
    [(ContactsSettingsPlugin *)self _noteImportStarted];
    [(ContactsSettingsPlugin *)self _updateSIMImportSpecifier:1];
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v5 = [v4 localizedStringForKey:@"Importing contacts" value:&stru_10D88 table:@"Contacts"];
    id v6 = +[UIAlertController alertControllerWithTitle:v5 message:0 preferredStyle:1];
    loadingContacts = self->_loadingContacts;
    self->_loadingContacts = v6;

    uint64_t v8 = self->_loadingContacts;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_5954;
    v9[3] = &unk_10A30;
    v9[4] = self;
    [(ContactsSettingsPlugin *)self presentViewController:v8 animated:1 completion:v9];
  }
}

- (void)importFromSIM:(id)a3
{
  if (!self->_loadingContacts)
  {
    ABAddressBookRef v4 = ABAddressBookCreateWithOptions(0, 0);
    if (v4)
    {
      unsigned int v5 = v4;
      id v24 = 0;
      id v25 = 0;
      CNUICopyAccountInformation((uint64_t)v4, 0, &v25, &v24, 0, 0);
      id v6 = v25;
      id v21 = v24;
      id v7 = (char *)[v21 count];
      if ((unint64_t)v7 < 2)
      {
        [(ContactsSettingsPlugin *)self _beginImportToStoreID:0xFFFFFFFFLL];
      }
      else
      {
        uint64_t v8 = v7;
        CFTypeRef cf = v5;
        uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
        id v10 = [v9 localizedStringForKey:@"IMPORT_CONTACTS_PROMPT" value:&stru_10D88 table:@"Contacts"];
        uint64_t v11 = +[UIAlertController alertControllerWithTitle:v10 message:0 preferredStyle:0];

        for (i = 0; i != v8; ++i)
        {
          id v13 = objc_msgSend(v6, "objectAtIndex:", i, cf);
          if (v13)
          {
            ABRecordID RecordID = ABRecordGetRecordID(v13);
            v15 = [v21 objectAtIndex:i];
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_5C10;
            v22[3] = &unk_10AA8;
            v22[4] = self;
            ABRecordID v23 = RecordID;
            v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v22];
            [v11 addAction:v16];
          }
        }
        v17 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v18 = [v17 localizedStringForKey:@"Cancel" value:&stru_10D88 table:@"Contacts"];
        v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:0];
        [v11 addAction:v19];

        [(ContactsSettingsPlugin *)self presentViewController:v11 animated:1 completion:0];
        unsigned int v5 = cf;
      }
      CFRelease(v5);
    }
  }
}

- (void)_updateSIMImportVisibility
{
  if (MGGetBoolAnswer() && MGGetBoolAnswer())
  {
    CFStringRef SIMStatus = (const __CFString *)CTSIMSupportGetSIMStatus();
    if (SIMStatus) {
      BOOL v4 = CFStringCompare(SIMStatus, kCTSIMSupportSIMStatusNotInserted, 0) != kCFCompareEqualTo;
    }
    else {
      BOOL v4 = 0;
    }
    self->_shouldShowSIMImport = v4;
  }
  else
  {
    self->_shouldShowSIMImport = 0;
  }
}

- (void)_clearSpecifiers
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  addressBookQueue = self->_addressBookQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5D8C;
  v4[3] = &unk_10A80;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(addressBookQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(ContactsSettingsPlugin *)self performSelectorOnMainThread:"reloadSpecifiers" withObject:0 waitUntilDone:0];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_SIMStatusChanged
{
  BOOL shouldShowSIMImport = self->_shouldShowSIMImport;
  [(ContactsSettingsPlugin *)self _updateSIMImportVisibility];
  if (shouldShowSIMImport != self->_shouldShowSIMImport)
  {
    if (shouldShowSIMImport)
    {
      if (self->_SIMImportSpacerSpecifier) {
        -[NSMutableArray removeObject:](self->_currentSpecifiers, "removeObject:");
      }
      if (self->_SIMImportSpecifier) {
        -[NSMutableArray removeObject:](self->_currentSpecifiers, "removeObject:");
      }
    }
    else
    {
      [(NSMutableArray *)self->_currentSpecifiers addObject:self->_SIMImportSpacerSpecifier];
      [(NSMutableArray *)self->_currentSpecifiers addObject:self->_SIMImportSpecifier];
      [(ContactsSettingsPlugin *)self _updateSIMImportSpecifier:0];
      [(ContactsSettingsPlugin *)self setSpecifiers:self->_currentSpecifiers];
    }
  }
  loadingContacts = self->_loadingContacts;
  if (loadingContacts && !self->_shouldShowSIMImport)
  {
    [(UIAlertController *)loadingContacts dismissViewControllerAnimated:1 completion:0];
    uint64_t v5 = self->_loadingContacts;
    self->_loadingContacts = 0;
  }
}

- (id)meCardName:(id)a3
{
  id v3 = objc_alloc_init((Class)CNContactStore);
  BOOL v4 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  uint64_t v9 = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  id v6 = objc_msgSend(v3, "_ios_meContactWithKeysToFetch:error:", v5, 0);

  uint64_t v7 = +[CNContactFormatter stringFromContact:v6 style:0];

  return v7;
}

- (void)_showMeCardPopover
{
  id v3 = [(ContactsSettingsPlugin *)self table];
  BOOL v4 = [(ContactsSettingsPlugin *)self indexPathForIndex:[(ContactsSettingsPlugin *)self indexOfSpecifier:self->_MeCardSpecifier]];
  uint64_t v5 = [v3 cellForRowAtIndexPath:v4];
  if (!v5) {
    goto LABEL_9;
  }
  [v3 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 frame];
  v20.origin.x = v14;
  v20.origin.y = v15;
  v20.size.width = v16;
  v20.size.height = v17;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  if (!CGRectContainsRect(v19, v20))
  {
LABEL_9:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_A408();
    }
    [v3 scrollToRowAtIndexPath:v4 atScrollPosition:3 animated:0];
    uint64_t v18 = [v3 cellForRowAtIndexPath:v4];

    uint64_t v5 = (void *)v18;
  }
  [v3 deselectRowAtIndexPath:v4 animated:1];
  [v5 frame];
  -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self->_meCardPopover, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v3, 13, 1);
}

- (void)showMeCardPicker:(id)a3
{
  BOOL v4 = (CNContactPickerViewController *)objc_alloc_init((Class)CNContactPickerViewController);
  meCardPicker = self->_meCardPicker;
  self->_meCardPicker = v4;

  [(CNContactPickerViewController *)self->_meCardPicker setDelegate:self];
  [(CNContactPickerViewController *)self->_meCardPicker setHidesSearchableSources:1];
  [(CNContactPickerViewController *)self->_meCardPicker setOnlyRealContacts:1];
  [(CNContactPickerViewController *)self->_meCardPicker setShouldDisplayAddNewContactRow:1];
  [(CNContactPickerViewController *)self->_meCardPicker setMode:2];
  double v6 = +[UIDevice currentDevice];
  if (objc_opt_respondsToSelector())
  {
    CGFloat v7 = +[UIDevice currentDevice];
    double v8 = (char *)[v7 userInterfaceIdiom];

    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      CGFloat v9 = (UIPopoverController *)[objc_alloc((Class)UIPopoverController) initWithContentViewController:self->_meCardPicker];
      meCardPopover = self->_meCardPopover;
      self->_meCardPopover = v9;

      [(UIPopoverController *)self->_meCardPopover setDelegate:self];
      [(ContactsSettingsPlugin *)self _showMeCardPopover];
      return;
    }
  }
  else
  {
  }
  CGFloat v11 = self->_meCardPicker;

  [(ContactsSettingsPlugin *)self presentViewController:v11 animated:1 completion:0];
}

- (void)windowWillRotate:(id)a3
{
  if ([(UIPopoverController *)self->_meCardPopover isPopoverVisible])
  {
    meCardPopover = self->_meCardPopover;
    [(UIPopoverController *)meCardPopover dismissPopoverAnimated:0];
  }
}

- (void)windowDidRotate:(id)a3
{
  if (self->_meCardPopover) {
    [(ContactsSettingsPlugin *)self _showMeCardPopover];
  }
}

- (void)_dismissMeCardPickerAnimated:(BOOL)a3
{
  meCardPicker = self->_meCardPicker;
  if (!meCardPicker) {
    return;
  }
  BOOL v5 = a3;
  [(CNContactPickerViewController *)meCardPicker setDelegate:0];
  double v6 = +[UIDevice currentDevice];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  CGFloat v7 = +[UIDevice currentDevice];
  double v8 = (char *)[v7 userInterfaceIdiom];

  if (v8 != (unsigned char *)&dword_0 + 1)
  {
LABEL_7:
    [(ContactsSettingsPlugin *)self dismissViewControllerAnimated:v5 completion:0];
    goto LABEL_8;
  }
  [(UIPopoverController *)self->_meCardPopover setDelegate:0];
  [(UIPopoverController *)self->_meCardPopover dismissPopoverAnimated:v5];
  meCardPopover = self->_meCardPopover;
  self->_meCardPopover = 0;

LABEL_8:
  double v10 = self->_meCardPicker;
  self->_meCardPicker = 0;
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
}

- (void)_reloadMeCardCellIfVisible
{
  id v3 = [(ContactsSettingsPlugin *)self table];
  BOOL v4 = [(ContactsSettingsPlugin *)self indexPathForIndex:[(ContactsSettingsPlugin *)self indexOfSpecifier:self->_MeCardSpecifier]];
  BOOL v5 = [v3 cellForRowAtIndexPath:v4];

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CGFloat v7 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "me card cell is visible", v7, 2u);
    }
    double v6 = +[NSArray arrayWithObject:v4];
    [v3 reloadRowsAtIndexPaths:v6 withRowAnimation:5];
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)CNContactStore);
  id v12 = 0;
  unsigned int v7 = [v6 setMeContact:v5 error:&v12];
  id v8 = v12;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id v10 = v5;
    id v11 = v8;
    _CNUILog();
  }
  [(ContactsSettingsPlugin *)self _reloadMeCardCellIfVisible];
  [(ContactsSettingsPlugin *)self _dismissMeCardPickerAnimated:1];
}

- (id)contactsSortOrder:(id)a3
{
  uint64_t SortOrdering = ABPersonGetSortOrdering();

  return +[NSNumber numberWithInt:SortOrdering];
}

- (void)setContactsSortOrder:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  CFStringRef v6 = (const __CFString *)ABPeoplePickerPrefs();
  CFPreferencesSetAppValue(@"contactsSortOrder", v5, v6);

  CFStringRef v7 = (const __CFString *)ABPeoplePickerPrefs();
  CFPreferencesAppSynchronize(v7);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.AddressBook.PreferenceChanged", 0, 0, 1u);

  [(ContactsSettingsPlugin *)self _synchronizeNanoUserDefault:@"contactsSortOrder"];
}

- (id)personNameOrder:(id)a3
{
  uint64_t CompositeNameFormatForRecord = ABPersonGetCompositeNameFormatForRecord(0);

  return +[NSNumber numberWithInt:CompositeNameFormatForRecord];
}

- (void)setPersonNameOrder:(id)a3 specifier:(id)a4
{
  id v4 = [a3 intValue];

  _ABPersonSetCompositeNameFormat(v4);
}

- (id)contactProviderCount:(id)a3
{
  id v4 = a3;
  addressBookQueue = self->_addressBookQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6958;
  block[3] = &unk_10AD0;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async(addressBookQueue, block);
  uint64_t v7 = [(ContactsSettingsPlugin *)self providerCount];
  if (v7 < 1)
  {
    id v8 = &stru_10D88;
  }
  else
  {
    id v8 = +[NSString stringWithFormat:@"%ld", v7];
  }

  return v8;
}

- (void)_synchronizeNanoUserDefault:(id)a3
{
  id v5 = a3;
  if (PSIsNanoMirroringDomain())
  {
    id v3 = objc_opt_new();
    id v4 = +[NSSet setWithObject:v5];
    [v3 synchronizeUserDefaultsDomain:@"com.apple.PeoplePicker" keys:v4];
  }
}

- (void)showSharedNameAndPhotoSettings:(id)a3
{
  id v5 = objc_alloc_init((Class)CNContactStore);
  id v4 = [objc_alloc((Class)CNSharedProfileOnboardingController) initWithContactStore:v5];
  [v4 setDelegate:self];
  [v4 startOnboardingOrEditForMode:1 fromViewController:self];
  [(ContactsSettingsPlugin *)self setOnboardingController:v4];
}

- (id)sharedNameAndPhotoSharingFooterText
{
  id v2 = +[CNEnvironment currentEnvironment];
  id v3 = [v2 nicknameProvider];
  unsigned __int8 v4 = [v3 isNicknameSharingEnabled];

  if ((v4 & 1) == 0)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v9 = v8;
    CFStringRef v10 = @"NAME_AND_PHOTO_SHARING_NOT_SHARING_FOOTER";
    goto LABEL_7;
  }
  id v5 = +[CNEnvironment currentEnvironment];
  id v6 = [v5 nicknameProvider];
  uint64_t v7 = (char *)[v6 sharingAudience];

  if (v7 == (unsigned char *)&dword_0 + 1)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v9 = v8;
    CFStringRef v10 = @"NAME_AND_PHOTO_SHARING_CONTACTS_ONLY_FOOTER";
    goto LABEL_7;
  }
  if (v7 == (unsigned char *)&dword_0 + 2)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v9 = v8;
    CFStringRef v10 = @"NAME_AND_PHOTO_SHARING_ALWAYS_ASK_FOOTER";
LABEL_7:
    id v11 = [v8 localizedStringForKey:v10 value:&stru_10D88 table:@"Contacts"];

    goto LABEL_8;
  }
  id v11 = &stru_10D88;
LABEL_8:

  return v11;
}

- (id)sharedNameAndPhotoAudience:(id)a3
{
  id v3 = +[CNEnvironment currentEnvironment];
  unsigned __int8 v4 = [v3 nicknameProvider];
  unsigned __int8 v5 = [v4 isNicknameSharingEnabled];

  if (v5)
  {
    objc_opt_class();
    id v6 = +[CNEnvironment currentEnvironment];
    uint64_t v7 = [v6 nicknameProvider];
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    uint64_t v10 = [v9 sharingAudienceDisplayString];
  }
  else
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"NAME_AND_PHOTO_SHARING_OFF" value:&stru_10D88 table:@"Contacts"];
  }
  id v11 = (void *)v10;

  return v11;
}

- (void)onboardingControllerDidDismissSettings:(id)a3
{
}

- (void)provideSettingsNavigationDonation
{
  id v3 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.MobileAddressBook"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  unsigned __int8 v5 = +[NSLocale currentLocale];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"CONTACTS" table:@"Contacts" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  uint64_t v10 = +[NSLocale currentLocale];
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"CONTACTS_SETTINGS_SUBTITLE" table:@"Contacts" locale:v10 bundleURL:v12];

  id v15 = v13;
  CGFloat v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(ContactsSettingsPlugin *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.MobileAddressBook" title:v8 localizedNavigationComponents:v14 deepLink:v3];
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (int64_t)providerCount
{
  return self->_providerCount;
}

- (void)setProviderCount:(int64_t)a3
{
  self->_providerCount = a3;
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_addressBookQueue, 0);
  objc_storeStrong((id *)&self->_meCardPicker, 0);
  objc_storeStrong((id *)&self->_meCardPopover, 0);
  objc_storeStrong((id *)&self->_loadingContacts, 0);
  objc_storeStrong((id *)&self->_contactStoreNames, 0);
  objc_storeStrong((id *)&self->_contactStores, 0);
  objc_storeStrong((id *)&self->_MeCardSpecifier, 0);
  objc_storeStrong((id *)&self->_SIMImportSpecifier, 0);
  objc_storeStrong((id *)&self->_SIMImportSpacerSpecifier, 0);

  objc_storeStrong((id *)&self->_currentSpecifiers, 0);
}

@end