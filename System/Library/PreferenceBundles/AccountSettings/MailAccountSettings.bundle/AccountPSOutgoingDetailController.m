@interface AccountPSOutgoingDetailController
+ (BOOL)shouldPresentAsModalSheet;
+ (id)outgoingGroupSpecifiers;
+ (id)outgoingSpecifiers;
- (BOOL)haveEnoughValues;
- (Class)accountClass;
- (id)accountPropertyWithSpecifier:(id)a3;
- (id)authSchemeTitlesForSpecifier:(id)a3;
- (id)authSchemeValuesForSpecifier:(id)a3;
- (id)isEnabled:(id)a3;
- (id)specifiers;
- (id)specifiersForExistingAccount;
- (id)specifiersForNewAccount;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_bottomDescriptionWithSpecifier:(id)a3;
- (void)_finishedAccountSetup;
- (void)_reallyDeleteOutgoingAccount;
- (void)_resetDeliveryAccountsForViewingAccount;
- (void)_saveAccounts;
- (void)_updateDoneButton;
- (void)applicationWillSuspend;
- (void)cancelButtonTapped:(id)a3;
- (void)deleteOutgoingAccount;
- (void)didFinishSaveAccountAnywaysSheetWithResult:(BOOL)a3;
- (void)handleValidAccount:(id)a3;
- (void)processValidationResult:(int64_t)a3;
- (void)propertyValueChanged:(id)a3;
- (void)saveAndDismiss;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setEnabled:(id)a3 withSpecifier:(id)a4;
- (void)validateForExistingAccount;
- (void)validateForNewAccount;
- (void)viewDidLoad;
@end

@implementation AccountPSOutgoingDetailController

+ (id)outgoingSpecifiers
{
  id v23 = +[NSMutableArray arrayWithCapacity:3];
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HOST_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  v4 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v3 target:a1 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v4 setKeyboardType:3 autoCaps:0 autoCorrection:1];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"OUTGOING_HOSTNAME_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v4 setPlaceholder:v6];

  v7 = +[NSDictionary dictionaryWithObjectsAndKeys:@"YES", @"AccountPreferenceRequired", MailAccountHostname, @"outgoing_key", kCFBooleanTrue, @"disableForManagedAccounts", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v4 setUserInfo:v7];

  [v23 addObject:v4];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"USER_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  v10 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v9 target:a1 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  if (+[UIDevice mf_isPad]) {
    uint64_t v11 = 7;
  }
  else {
    uint64_t v11 = 0;
  }
  [v10 setKeyboardType:v11 autoCaps:0 autoCorrection:1];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"OPTIONAL" value:&stru_B9F70 table:@"AccountPreferences"];
  [v10 setPlaceholder:v13];

  v14 = +[NSDictionary dictionaryWithObjectsAndKeys:MFMailAccountUsername, @"outgoing_key", kCFBooleanTrue, @"disableForManagedAccounts", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v10 setUserInfo:v14];

  [v23 addObject:v10];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"PASSWORD" value:&stru_B9F70 table:@"AccountPreferences"];
  v17 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v16 target:a1 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v17 setKeyboardType:1 autoCaps:0 autoCorrection:1];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"OPTIONAL" value:&stru_B9F70 table:@"AccountPreferences"];
  [v17 setPlaceholder:v19];

  *(void *)&v17[OBJC_IVAR___PSSpecifier_cellType] = 12;
  v20 = +[NSDictionary dictionaryWithObjectsAndKeys:MailAccountPassword, @"outgoing_key", 0];
  [v17 setUserInfo:v20];

  [v23 addObject:v17];

  return v23;
}

+ (id)outgoingGroupSpecifiers
{
  v2 = +[NSMutableArray arrayWithCapacity:4];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"OUTGOING_MAIL_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v2 addObject:v5];

  v6 = +[AccountPSOutgoingDetailController outgoingSpecifiers];
  [v2 addObjectsFromArray:v6];

  return v2;
}

+ (BOOL)shouldPresentAsModalSheet
{
  return 0;
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3 = *(void **)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier];
  if (!v3) {
    sub_7B534();
  }
  v4 = [v3 userInfo];
  v22 = [v4 objectForKey:@"OutgoingAccountViewingAccountKey"];
  objc_storeStrong((id *)&self->_viewingAccount, v22);
  v5 = [v4 objectForKey:@"OutgoingAccountAccountKey"];
  [(AccountPSDetailControllerBase *)self setAccount:v5];

  v6 = [v4 objectForKey:@"OutgoingAccountIsPrimaryAccountKey"];
  *((unsigned char *)self + 272) = *((unsigned char *)self + 272) & 0xFE | [v6 BOOLValue];

  if (*((unsigned char *)self + 272))
  {
    if ([(id)objc_opt_class() primaryDeliveryAccountIsDynamic]) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }
  *((unsigned char *)self + 272) = *((unsigned char *)self + 272) & 0xFD | v7;
  v8 = [v4 objectForKey:@"OutgoingAccountIsCarrierAccountKey"];
  if ([v8 BOOLValue]) {
    char v9 = 4;
  }
  else {
    char v9 = 0;
  }
  *((unsigned char *)self + 272) = *((unsigned char *)self + 272) & 0xFB | v9;

  primaryForAccount = self->_primaryForAccount;
  self->_primaryForAccount = 0;

  if ((*((unsigned char *)self + 272) & 1) == 0)
  {
    +[MailAccount mailAccounts];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = 0;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        v15 = 0;
        v16 = v13;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v13 = *(id *)(*((void *)&v24 + 1) + 8 * (void)v15);

          v17 = [v13 deliveryAccount];
          v18 = [(AccountPSDetailControllerBase *)self account];
          BOOL v19 = v17 == v18;

          if (v19)
          {
            v20 = self->_primaryForAccount;
            self->_primaryForAccount = (MailAccount *)v13;
            id v21 = v13;

            goto LABEL_21;
          }
          v15 = (char *)v15 + 1;
          v16 = v13;
        }
        while (v12 != v15);
        id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
LABEL_21:
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)AccountPSOutgoingDetailController;
  [(AccountPSDetailControllerBase *)&v23 viewDidLoad];
  [(AccountPSOutgoingDetailController *)self _updateDoneButton];
}

- (void)applicationWillSuspend
{
  v3 = +[UIDevice currentDevice];
  unsigned __int8 v4 = [v3 isMultitaskingSupported];

  if ((v4 & 1) == 0)
  {
    if (*((unsigned char *)&self->super + 232)) {
      [(AccountPSDetailControllerBase *)self cancelAccountValidation];
    }
    v5 = [(AccountPSOutgoingDetailController *)self navigationController];
    v6 = [v5 topViewController];

    if (v6 == self)
    {
      char v7 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
      [v7 resignFirstResponder];

      v8 = [(AccountPSDetailControllerBase *)self fixAccountInputValues:self->super._accountValues];
      char v9 = [(AccountPSDetailControllerBase *)self account];
      [v9 setAccountPropertiesWithDictionary:v8];

      [(AccountPSOutgoingDetailController *)self _saveAccounts];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)AccountPSOutgoingDetailController;
  [(AccountPSOutgoingDetailController *)&v10 applicationWillSuspend];
}

- (void)cancelButtonTapped:(id)a3
{
  unsigned __int8 v4 = [(AccountPSOutgoingDetailController *)self parentController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(AccountPSOutgoingDetailController *)self parentController];
    [v6 performSelector:"canceledAccountSetup"];
  }

  [(AccountPSOutgoingDetailController *)self dismissAnimated:1];
}

- (id)specifiersForNewAccount
{
  [(id)objc_opt_class() outgoingSpecifiers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "setTarget:", self, (void)v8);
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (id)specifiersForExistingAccount
{
  v60 = +[NSMutableArray array];
  v2 = [(AccountPSDetailControllerBase *)self account];

  if (v2)
  {
    id v3 = [(AccountPSDetailControllerBase *)self account];
    unsigned int v4 = [(id)objc_opt_class() isSSLEditable];
  }
  else
  {
    unsigned int v4 = 1;
  }
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"ENABLE_THIS_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
  char v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setEnabled:withSpecifier:" get:"isEnabled:" detail:0 cell:6 edit:0];

  long long v8 = +[NSDictionary dictionaryWithObjectsAndKeys:@"MailAccountIsActive", @"outgoing_key", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v7 setUserInfo:v8];

  uint64_t v63 = PSIDKey;
  objc_msgSend(v7, "setProperty:forKey:", @"TOGGLE_BUTTON");
  [v60 addObject:v7];
  v56 = [(id)objc_opt_class() outgoingGroupSpecifiers];
  v58 = [v56 objectAtIndex:0];
  [v60 addObjectsFromArray:v56];
  if (v4)
  {
    long long v9 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v10 = [v9 localizedStringForKey:@"USE_SSL" value:&stru_B9F70 table:@"AccountPreferences"];
    long long v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:6 edit:0];

    id v12 = +[NSDictionary dictionaryWithObjectsAndKeys:MailAccountSSLEnabled, @"outgoing_key", kCFBooleanTrue, @"disableForManagedAccounts", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
    [v11 setUserInfo:v12];

    [v60 addObject:v11];
  }
  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v14 = [v13 localizedStringForKey:@"AUTHENTICATION" value:&stru_B9F70 table:@"AccountPreferences"];
  v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

  [v15 setProperty:@"authSchemeValuesForSpecifier:" forKey:PSValuesDataSourceKey];
  [v15 setProperty:@"authSchemeTitlesForSpecifier:" forKey:PSTitlesDataSourceKey];
  v16 = +[NSDictionary dictionaryWithObjectsAndKeys:MFMailAccountAuthenticationScheme, @"outgoing_key", kCFBooleanTrue, @"disableForManagedAccounts", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v15 setUserInfo:v16];

  [v60 addObject:v15];
  v57 = v15;
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"SERVER_PORT" value:&stru_B9F70 table:@"AccountPreferences"];
  BOOL v19 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v18 target:self set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  v59 = v19;
  [v19 setKeyboardType:4 autoCaps:0 autoCorrection:1];
  uint64_t v20 = MailAccountPortNumber;
  [v59 setProperty:MailAccountPortNumber forKey:PSKeyNameKey];
  id v21 = +[NSDictionary dictionaryWithObjectsAndKeys:v20, @"outgoing_key", kCFBooleanTrue, @"disableForManagedAccounts", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v59 setUserInfo:v21];

  [v60 addObject:v59];
  v22 = self;
  objc_super v23 = [(AccountPSDetailControllerBase *)self account];
  unsigned int v61 = [v23 isManaged];

  long long v24 = +[MCProfileConnection sharedConnection];
  unsigned int v25 = [v24 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v60;
  id v26 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v66;
    uint64_t v28 = PSEnabledKey;
    do
    {
      v29 = 0;
      do
      {
        if (*(void *)v66 != v27) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v29);
        [v30 setTarget:v22];
        v31 = [v30 propertyForKey:v63];
        unsigned __int8 v32 = [v31 isEqualToString:@"TOGGLE_BUTTON"];
        if (v25 == 2) {
          unsigned __int8 v33 = 0;
        }
        else {
          unsigned __int8 v33 = v32;
        }

        CFStringRef v34 = @"YES";
        if ((v33 & 1) == 0)
        {
          if (!v61) {
            goto LABEL_17;
          }
          v35 = objc_msgSend(v30, "userInfo", @"YES");
          v36 = [v35 objectForKey:@"disableForManagedAccounts"];
          unsigned __int8 v37 = [v36 BOOLValue];

          CFStringRef v34 = @"NO";
          if ((v37 & 1) == 0)
          {
LABEL_17:
            if (v25 != 2) {
              goto LABEL_40;
            }
            v38 = objc_msgSend(v30, "userInfo", v34);
            v39 = [v38 objectForKeyedSubscript:@"disableForModificationRestrictions"];
            unsigned __int8 v40 = [v39 BOOLValue];

            CFStringRef v34 = @"NO";
            if ((v40 & 1) == 0)
            {
LABEL_40:
              CFStringRef v34 = @"NO";
              if (!self->_primaryForAccount)
              {
                char v41 = *((unsigned char *)self + 272);
                if (v41)
                {
                  unsigned __int8 v42 = [(id)objc_opt_class() setupIsAutomated];
                  CFStringRef v34 = @"NO";
                  if (v42) {
                    goto LABEL_20;
                  }
                  char v41 = *((unsigned char *)self + 272);
                }
                CFStringRef v34 = @"YES";
                if ((v41 & 1) == 0)
                {
                  v43 = [(AccountPSDetailControllerBase *)self account];
                  if ([v43 hasNoReferences])
                  {
                    BOOL v44 = (*((unsigned char *)self + 272) & 4) == 0;

                    if (v44) {
                      CFStringRef v34 = @"YES";
                    }
                    else {
                      CFStringRef v34 = @"NO";
                    }
                  }
                  else
                  {

                    CFStringRef v34 = @"YES";
                  }
                }
              }
            }
          }
        }
LABEL_20:
        [v30 setProperty:v34 forKey:v28];
        v29 = (char *)v29 + 1;
        v22 = self;
      }
      while (v26 != v29);
      id v45 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
      id v26 = v45;
    }
    while (v45);
  }

  v46 = self;
  if ((*((unsigned char *)self + 272) & 4) == 0)
  {
    v47 = [(AccountPSDetailControllerBase *)self account];
    unsigned int v48 = [v47 hasNoReferences];

    v46 = self;
    if (v48)
    {
      v49 = +[PSSpecifier emptyGroupSpecifier];
      [obj addObject:v49];

      v50 = +[NSBundle bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:@"DELETE_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
      v52 = +[PSSpecifier deleteButtonSpecifierWithName:v51 target:self action:"deleteOutgoingAccount"];

      v53 = +[NSBundle bundleForClass:objc_opt_class()];
      v54 = [v53 localizedStringForKey:@"DELETE_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
      [v52 setProperty:v54 forKey:v63];

      [obj addObject:v52];
      v46 = self;
    }
  }
  [(AccountPSOutgoingDetailController *)v46 _bottomDescriptionWithSpecifier:v58];

  return obj;
}

- (id)specifiers
{
  id v3 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  unsigned int v4 = [v3 objectForKey:@"OutgoingAccountAccountKey"];
  [(AccountPSDetailControllerBase *)self setAccount:v4];

  uint64_t v5 = [(AccountPSDetailControllerBase *)self account];

  if (v5) {
    [(AccountPSOutgoingDetailController *)self specifiersForExistingAccount];
  }
  else {
  uint64_t v6 = [(AccountPSOutgoingDetailController *)self specifiersForNewAccount];
  }
  uint64_t v7 = OBJC_IVAR___PSListController__specifiers;
  long long v8 = *(void **)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] = v6;

  id v9 = *(id *)&self->super.ACUIViewController_opaque[v7];
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AccountPSOutgoingDetailController;
  long long v8 = [(AccountPSOutgoingDetailController *)&v13 tableView:v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 textField];
    if (v9)
    {
      long long v10 = +[NSNotificationCenter defaultCenter];
      [v10 removeObserver:self name:0 object:v9];

      long long v11 = +[NSNotificationCenter defaultCenter];
      [v11 addObserver:self selector:"propertyValueChanged:" name:UITextFieldTextDidChangeNotification object:v9];
    }
  }

  return v8;
}

- (void)saveAndDismiss
{
  [(AccountPSOutgoingDetailController *)self _resetDeliveryAccountsForViewingAccount];
  [(MailAccount *)self->_viewingAccount savePersistentAccount];
  id v3 = [(AccountPSDetailControllerBase *)self account];
  [v3 savePersistentAccount];

  [(AccountPSOutgoingDetailController *)self _finishedAccountSetup];
}

- (void)processValidationResult:(int64_t)a3
{
  if (a3 != 2 && a3 != 4)
  {
    *((unsigned char *)&self->super + 232) &= ~1u;
    [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
    [(AccountPSOutgoingDetailController *)self _updateDoneButton];
  }
}

- (void)validateForNewAccount
{
  id v12 = [(NSMutableDictionary *)self->super._accountValues objectForKey:MailAccountHostname];
  uint64_t v3 = [(NSMutableDictionary *)self->super._accountValues objectForKey:MFMailAccountUsername];
  unsigned int v4 = +[DeliveryAccount existingAccountWithHostname:v12 username:v3];
  uint64_t v5 = v4;
  if (v4 && ([v4 usesSSL] & 1) != 0)
  {
    int64_t v6 = 0;
  }
  else
  {
    if (self->super._accountValues)
    {
      id v7 = objc_opt_class();
      long long v8 = [(AccountPSDetailControllerBase *)self fixAccountInputValues:self->super._accountValues];
      id v9 = [v7 newAccountWithDictionary:v8];
      if (v9) {
        int64_t v6 = [(AccountPSDetailControllerBase *)self validateAccount:v9 withFallbacks:1];
      }
      else {
        int64_t v6 = 1;
      }

      goto LABEL_11;
    }
    int64_t v6 = 1;
  }
  long long v10 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v11 = [v10 localizedStringForKey:@"ACCOUNT_VERIFIED" value:&stru_B9F70 table:@"AccountPreferences"];
  [(AccountPSOutgoingDetailController *)self stopValidationWithPrompt:v11 showButtons:0];

  [(AccountPSOutgoingDetailController *)self setCellsChecked:1];
  [(AccountPSDetailControllerBase *)self setAccount:v5];
  *((unsigned char *)self + 272) |= 8u;
  [(AccountPSOutgoingDetailController *)self _saveAccounts];
  [(AccountPSOutgoingDetailController *)self performSelector:"_finishedAccountSetup" withObject:0 afterDelay:1.0];
LABEL_11:
  [(AccountPSOutgoingDetailController *)self _updateDoneButton];
  [(AccountPSOutgoingDetailController *)self processValidationResult:v6];
}

- (void)validateForExistingAccount
{
  if (self->super._accountValues)
  {
    -[AccountPSDetailControllerBase fixAccountInputValues:](self, "fixAccountInputValues:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [(AccountPSDetailControllerBase *)self account];
    [v3 setAccountPropertiesWithDictionary:v7];

    unsigned int v4 = [(AccountPSDetailControllerBase *)self account];
    uint64_t v5 = [v4 defaultConnectionSettings];
    originalConnectionSettings = self->super._originalConnectionSettings;
    self->super._originalConnectionSettings = v5;

    [(AccountPSOutgoingDetailController *)self processValidationResult:[(AccountPSDetailControllerBase *)self validateAccount]];
  }
}

- (void)handleValidAccount:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [(AccountPSDetailControllerBase *)self account];

  if (!v4)
  {
    +[DeliveryAccount addDeliveryAccount:v7];
    [(AccountPSDetailControllerBase *)self setAccount:v7];
  }
  *((unsigned char *)self + 272) |= 8u;
  [(AccountPSOutgoingDetailController *)self _saveAccounts];
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  int64_t v6 = [v5 localizedStringForKey:@"ACCOUNT_VERIFIED" value:&stru_B9F70 table:@"AccountPreferences"];
  [(AccountPSOutgoingDetailController *)self stopValidationWithPrompt:v6 showButtons:0];

  [(AccountPSOutgoingDetailController *)self setCellsChecked:1];
  [(AccountPSOutgoingDetailController *)self performSelector:"_finishedAccountSetup" withObject:0 afterDelay:1.0];
}

- (void)propertyValueChanged:(id)a3
{
  *((unsigned char *)&self->super + 232) &= ~2u;
  [(AccountPSOutgoingDetailController *)self _updateDoneButton];
}

- (void)_saveAccounts
{
  [(AccountPSOutgoingDetailController *)self _resetDeliveryAccountsForViewingAccount];
  [(MailAccount *)self->_viewingAccount savePersistentAccount];
  id v3 = [(AccountPSDetailControllerBase *)self account];
  [v3 savePersistentAccount];

  id v4 = [(AccountPSOutgoingDetailController *)self parentController];
  [v4 reloadOutgoingAccounts];
}

- (void)_bottomDescriptionWithSpecifier:(id)a3
{
  id v12 = a3;
  id v4 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  uint64_t v5 = [v4 objectForKey:@"OutgoingAccountViewingAccountKey"];
  int64_t v6 = [v4 objectForKey:@"OutgoingAccountAccountKey"];
  unsigned int v7 = [v6 isManaged];
  if (self->_primaryForAccount)
  {
    long long v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"ALREADY_PRIMARY_ACCOUNT_DESCRIPTION" value:&stru_B9F70 table:@"AccountPreferences"];

    long long v10 = [(MailAccount *)self->_primaryForAccount displayName];
    long long v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

    [v12 setProperty:v11 forKey:PSFooterTextGroupKey];
LABEL_3:

    goto LABEL_4;
  }
  if (v7)
  {
    id v9 = [v5 managedAccountFooterText];
    if (v9) {
      [v12 setProperty:v9 forKey:PSFooterTextGroupKey];
    }
    goto LABEL_3;
  }
LABEL_4:
}

- (void)_updateDoneButton
{
  id v8 = [(AccountPSOutgoingDetailController *)self navigationItem];
  id v3 = [v8 rightBarButtonItem];
  if ([(AccountPSOutgoingDetailController *)self haveEnoughValues]) {
    BOOL v4 = (*((unsigned char *)&self->super + 232) & 1) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  [v3 setEnabled:v4];

  if (!self->super._account)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v9 localizedStringForKey:@"SAVE" value:&stru_B9F70 table:@"AccountPreferences"];
    int64_t v6 = [(AccountPSOutgoingDetailController *)self navigationItem];
    unsigned int v7 = [v6 rightBarButtonItem];
    [v7 setTitle:v5];
  }
}

- (BOOL)haveEnoughValues
{
  uint64_t v21 = OBJC_IVAR___PSListController__specifiers;
  id v20 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  if (v20)
  {
    uint64_t v3 = 0;
    uint64_t v19 = PSKeyNameKey;
    while (1)
    {
      BOOL v4 = [*(id *)&self->super.ACUIViewController_opaque[v21] objectAtIndex:v3];
      uint64_t v5 = [v4 userInfo];
      int64_t v6 = [v4 properties];
      unsigned int v7 = [v5 objectForKey:@"AccountPreferenceRequired"];

      if (!v7)
      {
        char v15 = 1;
        goto LABEL_20;
      }
      id v8 = [(AccountPSOutgoingDetailController *)self indexPathForIndex:v3];
      uint64_t v9 = OBJC_IVAR___PSListController__table;
      long long v10 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__table] cellForRowAtIndexPath:v8];
      unsigned int v11 = [v10 isEditing];

      if (!v11) {
        break;
      }
      id v12 = [*(id *)&self->super.ACUIViewController_opaque[v9] cellForRowAtIndexPath:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v13 = [v12 textField];
        uint64_t v14 = [v13 text];
        char v15 = [v14 length] != 0;

LABEL_18:
        goto LABEL_19;
      }
      char v15 = 1;
LABEL_19:

LABEL_20:
      if ((unint64_t)v20 <= ++v3 || (v15 & 1) == 0) {
        return v15;
      }
    }
    id v12 = [v5 objectForKey:@"outgoing_key"];
    accountValues = self->super._accountValues;
    if (v12)
    {
      objc_super v13 = [(NSMutableDictionary *)self->super._accountValues objectForKey:v12];
    }
    else
    {
      v17 = [v6 objectForKey:v19];
      objc_super v13 = [(NSMutableDictionary *)accountValues objectForKey:v17];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v13 isEqualToString:&stru_B9F70] & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v13 count])
    {

      objc_super v13 = 0;
    }
    char v15 = v13 != 0;
    goto LABEL_18;
  }
  return 0;
}

- (void)_resetDeliveryAccountsForViewingAccount
{
  if ((*((unsigned char *)self + 272) & 2) != 0)
  {
    viewingAccount = self->_viewingAccount;
    uint64_t v9 = (*((unsigned __int8 *)self + 272) >> 4) & 1;
    [(MailAccount *)viewingAccount setPrimaryDeliveryAccountDisabled:v9];
  }
  else
  {
    if (*((unsigned char *)self + 272))
    {
      long long v10 = self->_viewingAccount;
      id v17 = [(AccountPSDetailControllerBase *)self account];
      -[MailAccount setDeliveryAccount:](v10, "setDeliveryAccount:");
LABEL_20:

      return;
    }
    char v3 = *((unsigned char *)self + 272);
    BOOL v4 = self->_viewingAccount;
    if ((v3 & 4) == 0)
    {
      id v16 = [(MailAccount *)v4 deliveryAccountAlternates];
      id v5 = [v16 mutableCopy];

      id v17 = v5;
      if (!v5) {
        id v17 = objc_alloc_init((Class)NSMutableArray);
      }
      if ((*((unsigned char *)self + 272) & 8) != 0)
      {
        id v12 = [(AccountPSDetailControllerBase *)self account];
        if (v12)
        {
          objc_super v13 = [(AccountPSDetailControllerBase *)self account];
          unsigned __int8 v14 = [v17 containsObject:v13];

          if ((v14 & 1) == 0)
          {
            char v15 = [(AccountPSDetailControllerBase *)self account];
            [v17 addObject:v15];
          }
        }
      }
      else
      {
        int64_t v6 = [(AccountPSDetailControllerBase *)self account];
        id v7 = [v17 indexOfObject:v6];

        if (v7 != (id)0x7FFFFFFFFFFFFFFFLL) {
          [v17 removeObjectAtIndex:v7];
        }
      }
      [(MailAccount *)self->_viewingAccount setDeliveryAccountAlternates:v17];
      goto LABEL_20;
    }
    uint64_t v11 = (*((unsigned __int8 *)self + 272) >> 3) & 1;
    [(MailAccount *)v4 setCanUseCarrierDeliveryFallback:v11];
  }
}

- (void)_finishedAccountSetup
{
  char v3 = [(AccountPSOutgoingDetailController *)self parentController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AccountPSOutgoingDetailController *)self parentController];
    [v5 performSelector:"finishedAccountSetup"];
  }
  [(AccountPSOutgoingDetailController *)self dismissAnimated:1];

  [(AccountPSOutgoingDetailController *)self setTaskCompletionAssertionEnabled:0];
}

- (id)isEnabled:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)self + 272) & 2) != 0)
  {
    unsigned int v8 = [(MailAccount *)self->_viewingAccount isPrimaryDeliveryAccountDisabled];
    if (v8) {
      char v9 = 16;
    }
    else {
      char v9 = 0;
    }
    *((unsigned char *)self + 272) = *((unsigned char *)self + 272) & 0xEF | v9;
    id v7 = (id)(v8 ^ 1);
  }
  else if (*((unsigned char *)self + 272))
  {
    long long v10 = [(NSMutableDictionary *)self->super._accountValues objectForKey:@"MailAccountIsActive"];
    id v7 = [v10 BOOLValue];
  }
  else
  {
    viewingAccount = self->_viewingAccount;
    if ((*((unsigned char *)self + 272) & 4) != 0)
    {
      id v7 = [(MailAccount *)self->_viewingAccount canUseCarrierDeliveryFallback];
    }
    else
    {
      int64_t v6 = [(AccountPSDetailControllerBase *)self account];
      id v7 = [(MailAccount *)viewingAccount canUseDeliveryAccount:v6];
    }
    if (v7) {
      char v11 = 8;
    }
    else {
      char v11 = 0;
    }
    *((unsigned char *)self + 272) = *((unsigned char *)self + 272) & 0xF7 | v11;
  }
  id v12 = +[NSNumber numberWithBool:v7];

  return v12;
}

- (void)setEnabled:(id)a3 withSpecifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ((*((unsigned char *)self + 272) & 2) != 0)
  {
    if ([v9 BOOLValue]) {
      char v7 = 0;
    }
    else {
      char v7 = 16;
    }
    char v8 = *((unsigned char *)self + 272) & 0xEF;
    goto LABEL_11;
  }
  if ((*((unsigned char *)self + 272) & 1) == 0)
  {
    if ([v9 BOOLValue]) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    char v8 = *((unsigned char *)self + 272) & 0xF7;
LABEL_11:
    *((unsigned char *)self + 272) = v8 | v7;
    goto LABEL_13;
  }
  [(NSMutableDictionary *)self->super._accountValues setObject:v9 forKey:@"MailAccountIsActive"];
LABEL_13:
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v11 = a3;
  id v6 = [a4 userInfo];
  char v7 = [v6 objectForKey:@"outgoing_key"];
  accountValues = self->super._accountValues;
  if (v11)
  {
    if (!accountValues)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v10 = self->super._accountValues;
      self->super._accountValues = v9;

      accountValues = self->super._accountValues;
    }
    [(NSMutableDictionary *)accountValues setObject:v11 forKey:v7];
  }
  else
  {
    [(NSMutableDictionary *)accountValues removeObjectForKey:v7];
  }
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"outgoing_key"];
  char v7 = [(NSMutableDictionary *)self->super._accountValues objectForKey:v6];
  if ([v6 isEqualToString:MailAccountHostname])
  {
    char v8 = [(AccountPSDetailControllerBase *)self account];

    if (v8)
    {
      id v9 = [(AccountPSDetailControllerBase *)self account];
      long long v10 = [v9 displayHostname];
      unsigned __int8 v11 = [v7 isEqualToString:v10];

      if ((v11 & 1) == 0)
      {
        id v12 = [(AccountPSDetailControllerBase *)self account];
        uint64_t v13 = [v12 displayHostname];

        [v4 setProperty:@"NO" forKey:PSEnabledKey];
        char v7 = (void *)v13;
      }
    }
  }

  return v7;
}

- (id)authSchemeValuesForSpecifier:(id)a3
{
  char v3 = [(AccountPSDetailControllerBase *)self account];
  id v4 = [(id)objc_opt_class() authSchemeValues];

  return v4;
}

- (id)authSchemeTitlesForSpecifier:(id)a3
{
  char v3 = [(AccountPSDetailControllerBase *)self account];
  id v4 = [(id)objc_opt_class() authSchemeTitles];

  return v4;
}

- (void)deleteOutgoingAccount
{
  if (+[UIDevice mf_isPad])
  {
    char v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"DELETE" value:&stru_B9F70 table:@"AccountPreferences"];
    v17[0] = v4;
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"CANCEL" value:&stru_B9F70 table:@"AccountPreferences"];
    v17[1] = v6;
    char v7 = +[NSArray arrayWithObjects:v17 count:2];

    char v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"DELETE_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];

    long long v10 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v11 = [v10 localizedStringForKey:@"DELETE_SMTP_SERVER_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  }
  else
  {
    long long v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v10 localizedStringForKey:@"DELETE_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
    v16[0] = v12;
    uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_B9F70 table:@"AccountPreferences"];
    v16[1] = v14;
    char v7 = +[NSArray arrayWithObjects:v16 count:2];

    id v9 = 0;
    unsigned __int8 v11 = 0;
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_22324;
  v15[3] = &unk_B8F70;
  v15[4] = self;
  v15[5] = 0;
  [(AccountPSOutgoingDetailController *)self showConfirmationWithButtons:v7 title:v9 message:v11 destructive:1 completion:v15];
}

- (void)_reallyDeleteOutgoingAccount
{
  id v4 = [(AccountPSDetailControllerBase *)self account];
  +[DeliveryAccount removeDeliveryAccount:](DeliveryAccount, "removeDeliveryAccount:");

  *((unsigned char *)self + 272) &= ~8u;
  [(AccountPSOutgoingDetailController *)self _resetDeliveryAccountsForViewingAccount];
  id v5 = [(AccountPSOutgoingDetailController *)self parentController];
  [v5 reloadOutgoingAccounts];

  id v6 = [(AccountPSOutgoingDetailController *)self rootController];
  id v3 = [v6 popViewControllerAnimated:1];
}

- (void)didFinishSaveAccountAnywaysSheetWithResult:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(AccountPSDetailControllerBase *)self accountValues];
    id v7 = [(AccountPSDetailControllerBase *)self fixAccountInputValues:v4];

    id v5 = [(AccountPSDetailControllerBase *)self account];

    if (v5)
    {
      id v6 = [(AccountPSDetailControllerBase *)self account];
      [v6 setAccountPropertiesWithDictionary:v7];
    }
    else
    {
      id v6 = [(objc_class *)[(AccountPSOutgoingDetailController *)self accountClass] newAccountWithDictionary:v7];
      +[DeliveryAccount addDeliveryAccount:v6];
    }

    [(AccountPSOutgoingDetailController *)self saveAndDismiss];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryForAccount, 0);

  objc_storeStrong((id *)&self->_viewingAccount, 0);
}

@end