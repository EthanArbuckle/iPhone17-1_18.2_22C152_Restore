@interface ICSettingsPasswordViewController
- (BOOL)biometricsSwitchEnabled;
- (BOOL)hasMultipleAccounts;
- (ICAccount)account;
- (ICSettingsPasswordViewController)initWithAccountID:(id)a3;
- (NSManagedObjectID)accountID;
- (NSString)biometricsGroupFooter;
- (NSString)biometricsSwitchTitle;
- (NSString)lockedNotesModeGroupFooter;
- (PSSpecifier)biometricsGroupSpecifier;
- (PSSpecifier)biometricsSwitchSpecifier;
- (PSSpecifier)changeCustomPasswordSpecifier;
- (PSSpecifier)checkedLockedNotesModeSpecifier;
- (PSSpecifier)lockedNotesModeCustomPasswordSpecifier;
- (PSSpecifier)lockedNotesModeDevicePasswordSpecifier;
- (PSSpecifier)lockedNotesModeGroupSpecifier;
- (PSSpecifier)resetCustomPasswordGroupSpecifier;
- (PSSpecifier)resetCustomPasswordSpecifier;
- (PSSpecifier)setCustomPasswordSpecifier;
- (id)biometricsSwitchValue:(id)a3;
- (void)applicationDidResume;
- (void)didTapBiometricsLearnMoreLink:(id)a3;
- (void)didTapChangeCustomPasswordButton:(id)a3;
- (void)didTapLockedNotesModeLearnMoreLink:(id)a3;
- (void)didTapResetCustomPasswordButton:(id)a3;
- (void)didTapSetCustomPasswordButton:(id)a3;
- (void)presentLockedNotesWelcomePrompt;
- (void)reloadSpecifiers;
- (void)reloadTitle;
- (void)resetCustomPasswordForAccount:(id)a3;
- (void)setAccount:(id)a3;
- (void)setBiometricsSwitchValue:(id)a3 specifier:(id)a4;
- (void)setLockedNotesMode:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICSettingsPasswordViewController

- (ICSettingsPasswordViewController)initWithAccountID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSettingsPasswordViewController;
  v6 = [(ICSettingsPasswordViewController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountID, a3);
    v8 = +[ICNoteContext sharedContext];
    v9 = [v8 managedObjectContext];
    uint64_t v10 = [v9 objectWithID:v5];
    account = v7->_account;
    v7->_account = (ICAccount *)v10;
  }
  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsPasswordViewController;
  [(ICSettingsPasswordViewController *)&v4 viewWillAppear:a3];
  +[ICLocalAuthentication refreshBiometricsContext];
  +[ICLocalAuthentication refreshHasPasscode];
  [(ICSettingsPasswordViewController *)self reloadTitle];
  [(ICSettingsPasswordViewController *)self reloadSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSettingsPasswordViewController;
  [(ICSettingsPasswordViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(ICSettingsPasswordViewController *)self account];
  if ([v4 resolvedLockedNotesMode] == 1)
  {
    id v5 = [(ICSettingsPasswordViewController *)self account];
    unsigned __int8 v6 = [v5 hasPassphraseSet];

    if ((v6 & 1) == 0)
    {
      [(ICSettingsPasswordViewController *)self presentLockedNotesWelcomePrompt];
      [(ICSettingsPasswordViewController *)self reloadSpecifiers];
    }
  }
  else
  {
  }
  [(ICSettingsPasswordViewController *)self ic_submitNavigationEventForIdentifier:@"PASSWORD" titleStringKey:@"PASSWORD_SETTINGS" navigationComponents:&off_1F1A8];
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)ICSettingsPasswordViewController;
  [(ICSettingsPasswordViewController *)&v3 applicationDidResume];
  +[ICLocalAuthentication refreshBiometricsContext];
  +[ICLocalAuthentication refreshHasPasscode];
  [(ICSettingsPasswordViewController *)self reloadTitle];
  [(ICSettingsPasswordViewController *)self reloadSpecifiers];
}

- (void)reloadTitle
{
  objc_super v3 = [(ICSettingsPasswordViewController *)self account];
  objc_super v4 = [v3 localizedName];
  objc_msgSend(v4, "ic_trimmedString");
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = +[ICAccountUtilities sharedInstance];
  unsigned __int8 v6 = [(ICSettingsPasswordViewController *)self account];
  objc_super v7 = [v6 identifier];
  v8 = [v5 iCloudACAccountWithIdentifier:v7];
  v9 = [v8 username];
  uint64_t v10 = objc_msgSend(v9, "ic_trimmedString");

  if ([v16 length] && objc_msgSend(v10, "length"))
  {
    v11 = objc_alloc_init(ICNavigationTitleView);
    v12 = [(ICNavigationTitleView *)v11 titleLabel];
    [v12 setText:v16];

    objc_super v13 = [(ICNavigationTitleView *)v11 subtitleLabel];
    [v13 setText:v10];

    v14 = [(ICSettingsPasswordViewController *)self navigationItem];
    [v14 setTitleView:v11];
  }
  else
  {
    if ([v16 length])
    {
      [(ICSettingsPasswordViewController *)self setTitle:v16];
      goto LABEL_8;
    }
    v11 = [(ICSettingsPasswordViewController *)self bundle];
    v15 = [(ICNavigationTitleView *)v11 localizedStringForKey:@"NOTES_PW_NAVIGATION_TITLE" value:@"Password" table:@"Settings"];
    [(ICSettingsPasswordViewController *)self setTitle:v15];
  }
LABEL_8:
}

- (BOOL)hasMultipleAccounts
{
  v2 = [(ICSettingsPasswordViewController *)self account];
  objc_super v3 = [v2 managedObjectContext];
  objc_super v4 = +[ICAccount allActiveAccountsInContext:v3];
  BOOL v5 = (unint64_t)[v4 count] > 1;

  return v5;
}

- (void)reloadSpecifiers
{
  objc_super v3 = +[ICNoteContext sharedContext];
  objc_super v4 = [v3 managedObjectContext];
  BOOL v5 = [(ICSettingsPasswordViewController *)self accountID];
  unsigned __int8 v6 = [v4 objectWithID:v5];
  [(ICSettingsPasswordViewController *)self setAccount:v6];

  lockedNotesModeGroupSpecifier = self->_lockedNotesModeGroupSpecifier;
  self->_lockedNotesModeGroupSpecifier = 0;

  lockedNotesModeDevicePasswordSpecifier = self->_lockedNotesModeDevicePasswordSpecifier;
  self->_lockedNotesModeDevicePasswordSpecifier = 0;

  lockedNotesModeCustomPasswordSpecifier = self->_lockedNotesModeCustomPasswordSpecifier;
  self->_lockedNotesModeCustomPasswordSpecifier = 0;

  biometricsGroupSpecifier = self->_biometricsGroupSpecifier;
  self->_biometricsGroupSpecifier = 0;

  biometricsSwitchSpecifier = self->_biometricsSwitchSpecifier;
  self->_biometricsSwitchSpecifier = 0;

  changeCustomPasswordSpecifier = self->_changeCustomPasswordSpecifier;
  self->_changeCustomPasswordSpecifier = 0;

  setCustomPasswordSpecifier = self->_setCustomPasswordSpecifier;
  self->_setCustomPasswordSpecifier = 0;

  resetCustomPasswordGroupSpecifier = self->_resetCustomPasswordGroupSpecifier;
  self->_resetCustomPasswordGroupSpecifier = 0;

  resetCustomPasswordSpecifier = self->_resetCustomPasswordSpecifier;
  self->_resetCustomPasswordSpecifier = 0;

  id v30 = objc_alloc_init((Class)NSMutableArray);
  id v16 = +[ICLockedNotesModeMigrator sharedMigrator];
  v17 = [(ICSettingsPasswordViewController *)self account];
  LODWORD(v5) = [v16 account:v17 supportsMode:2];

  if (v5)
  {
    v18 = [(ICSettingsPasswordViewController *)self lockedNotesModeGroupSpecifier];
    [v30 addObject:v18];

    v19 = [(ICSettingsPasswordViewController *)self lockedNotesModeDevicePasswordSpecifier];
    [v30 addObject:v19];

    v20 = [(ICSettingsPasswordViewController *)self lockedNotesModeCustomPasswordSpecifier];
    [v30 addObject:v20];
  }
  v21 = [(ICSettingsPasswordViewController *)self biometricsGroupSpecifier];
  [v30 addObject:v21];

  v22 = [(ICSettingsPasswordViewController *)self biometricsSwitchSpecifier];
  [v30 addObject:v22];

  v23 = [(ICSettingsPasswordViewController *)self account];
  unsigned int v24 = [v23 resolvedLockedNotesMode];

  if (v24 == 1)
  {
    v25 = +[PSSpecifier emptyGroupSpecifier];
    [v30 addObject:v25];

    v26 = [(ICSettingsPasswordViewController *)self changeCustomPasswordSpecifier];
    [v30 addObject:v26];

    v27 = +[PSSpecifier emptyGroupSpecifier];
    [v30 addObject:v27];

    v28 = [(ICSettingsPasswordViewController *)self resetCustomPasswordGroupSpecifier];
    [v30 addObject:v28];

    v29 = [(ICSettingsPasswordViewController *)self resetCustomPasswordSpecifier];
    [v30 addObject:v29];
  }
  [(ICSettingsPasswordViewController *)self setSpecifiers:v30];
}

- (PSSpecifier)lockedNotesModeGroupSpecifier
{
  lockedNotesModeGroupSpecifier = self->_lockedNotesModeGroupSpecifier;
  if (!lockedNotesModeGroupSpecifier)
  {
    objc_super v4 = [(ICSettingsPasswordViewController *)self bundle];
    BOOL v5 = [v4 localizedStringForKey:@"PW_LOCKED_NOTES_MODE_TITLE" value:@"Choose a password method" table:@"Settings"];

    unsigned __int8 v6 = [(ICSettingsPasswordViewController *)self bundle];
    objc_super v7 = [v6 localizedStringForKey:@"LEARN_MORE" value:@"Learn More…" table:@"Settings"];

    v8 = [(ICSettingsPasswordViewController *)self lockedNotesModeGroupFooter];
    v9 = +[NSString stringWithFormat:@"%@ %@", v8, v7];

    id v10 = [v9 rangeOfString:v7];
    NSUInteger v12 = v11;
    objc_super v13 = +[PSSpecifier groupSpecifierWithName:v5];
    v14 = self->_lockedNotesModeGroupSpecifier;
    self->_lockedNotesModeGroupSpecifier = v13;

    [(PSSpecifier *)self->_lockedNotesModeGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v15 = self->_lockedNotesModeGroupSpecifier;
    id v16 = [(ICSettingsPasswordViewController *)self checkedLockedNotesModeSpecifier];
    [(PSSpecifier *)v15 setProperty:v16 forKey:PSRadioGroupCheckedSpecifierKey];

    v17 = self->_lockedNotesModeGroupSpecifier;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [(PSSpecifier *)v17 setProperty:v19 forKey:PSFooterCellClassGroupKey];

    [(PSSpecifier *)self->_lockedNotesModeGroupSpecifier setProperty:v9 forKey:PSFooterTextGroupKey];
    v20 = self->_lockedNotesModeGroupSpecifier;
    v28.location = (NSUInteger)v10;
    v28.length = v12;
    v21 = NSStringFromRange(v28);
    [(PSSpecifier *)v20 setProperty:v21 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v22 = self->_lockedNotesModeGroupSpecifier;
    v23 = +[NSValue valueWithNonretainedObject:self];
    [(PSSpecifier *)v22 setProperty:v23 forKey:PSFooterHyperlinkViewTargetKey];

    unsigned int v24 = self->_lockedNotesModeGroupSpecifier;
    v25 = NSStringFromSelector("didTapLockedNotesModeLearnMoreLink:");
    [(PSSpecifier *)v24 setProperty:v25 forKey:PSFooterHyperlinkViewActionKey];

    lockedNotesModeGroupSpecifier = self->_lockedNotesModeGroupSpecifier;
  }

  return lockedNotesModeGroupSpecifier;
}

- (void)didTapLockedNotesModeLearnMoreLink:(id)a3
{
  id v7 = +[ICLockedNotesModeMigrator sharedMigrator];
  objc_super v4 = [(ICSettingsPasswordViewController *)self account];
  BOOL v5 = [(ICSettingsPasswordViewController *)self view];
  unsigned __int8 v6 = [v5 window];
  [v7 presentLockedNotesLearnMoreViewForAccount:v4 window:v6];
}

- (NSString)lockedNotesModeGroupFooter
{
  unsigned int v3 = [(ICSettingsPasswordViewController *)self hasMultipleAccounts];
  objc_super v4 = [(ICSettingsPasswordViewController *)self bundle];
  BOOL v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 localizedStringForKey:@"PW_LOCKED_NOTES_MODE_FOOTER_MULTIPLE_ACCOUNTS" value:@"Choose the method to use to lock notes for your “%@” account." table:@"Settings"];

    id v7 = [(ICSettingsPasswordViewController *)self account];
    v8 = [v7 localizedName];
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);

    BOOL v5 = (void *)v6;
  }
  else
  {
    v9 = [v4 localizedStringForKey:@"PW_LOCKED_NOTES_MODE_FOOTER" value:@"Choose the method to use to lock your notes." table:@"Settings"];
  }

  return (NSString *)v9;
}

- (PSSpecifier)checkedLockedNotesModeSpecifier
{
  unsigned int v3 = [(ICSettingsPasswordViewController *)self account];
  objc_super v4 = [v3 accountData];
  if ([v4 lockedNotesMode] == 1)
  {

LABEL_3:
    BOOL v5 = [(ICSettingsPasswordViewController *)self lockedNotesModeCustomPasswordSpecifier];
    goto LABEL_10;
  }
  uint64_t v6 = [(ICSettingsPasswordViewController *)self account];
  id v7 = [v6 accountData];
  if ([v7 lockedNotesMode])
  {
  }
  else
  {
    v8 = [(ICSettingsPasswordViewController *)self account];
    unsigned int v9 = [v8 hasPassphraseSet];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v10 = [(ICSettingsPasswordViewController *)self account];
  NSUInteger v11 = [v10 accountData];
  unsigned int v12 = [v11 lockedNotesMode];

  if (v12 == 2)
  {
    BOOL v5 = [(ICSettingsPasswordViewController *)self lockedNotesModeDevicePasswordSpecifier];
  }
  else
  {
    BOOL v5 = 0;
  }
LABEL_10:

  return (PSSpecifier *)v5;
}

- (PSSpecifier)lockedNotesModeDevicePasswordSpecifier
{
  lockedNotesModeDevicePasswordSpecifier = self->_lockedNotesModeDevicePasswordSpecifier;
  if (!lockedNotesModeDevicePasswordSpecifier)
  {
    objc_super v4 = [(ICSettingsPasswordViewController *)self bundle];
    BOOL v5 = [v4 localizedStringForKey:@"PW_LOCKED_NOTES_MODE_DEVICE" value:@"Use Device Passcode" table:@"Settings"];

    uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];
    id v7 = self->_lockedNotesModeDevicePasswordSpecifier;
    self->_lockedNotesModeDevicePasswordSpecifier = v6;

    [(PSSpecifier *)self->_lockedNotesModeDevicePasswordSpecifier setButtonAction:"setLockedNotesMode:"];
    v8 = self->_lockedNotesModeDevicePasswordSpecifier;
    unsigned int v9 = [(ICSettingsPasswordViewController *)self presentedViewController];
    id v10 = +[NSNumber numberWithInt:v9 == 0];
    [(PSSpecifier *)v8 setProperty:v10 forKey:PSEnabledKey];

    [(PSSpecifier *)self->_lockedNotesModeDevicePasswordSpecifier setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    lockedNotesModeDevicePasswordSpecifier = self->_lockedNotesModeDevicePasswordSpecifier;
  }

  return lockedNotesModeDevicePasswordSpecifier;
}

- (PSSpecifier)lockedNotesModeCustomPasswordSpecifier
{
  lockedNotesModeCustomPasswordSpecifier = self->_lockedNotesModeCustomPasswordSpecifier;
  if (!lockedNotesModeCustomPasswordSpecifier)
  {
    objc_super v4 = [(ICSettingsPasswordViewController *)self bundle];
    BOOL v5 = [v4 localizedStringForKey:@"PW_LOCKED_NOTES_MODE_CUSTOM" value:@"Use Custom Password" table:@"Settings"];

    uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];
    id v7 = self->_lockedNotesModeCustomPasswordSpecifier;
    self->_lockedNotesModeCustomPasswordSpecifier = v6;

    [(PSSpecifier *)self->_lockedNotesModeCustomPasswordSpecifier setButtonAction:"setLockedNotesMode:"];
    v8 = self->_lockedNotesModeCustomPasswordSpecifier;
    unsigned int v9 = [(ICSettingsPasswordViewController *)self presentedViewController];
    id v10 = +[NSNumber numberWithInt:v9 == 0];
    [(PSSpecifier *)v8 setProperty:v10 forKey:PSEnabledKey];

    [(PSSpecifier *)self->_lockedNotesModeCustomPasswordSpecifier setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    lockedNotesModeCustomPasswordSpecifier = self->_lockedNotesModeCustomPasswordSpecifier;
  }

  return lockedNotesModeCustomPasswordSpecifier;
}

- (void)setLockedNotesMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICSettingsPasswordViewController *)self account];
  uint64_t v6 = [v5 accountData];
  unsigned int v7 = [v6 lockedNotesMode];

  id v8 = [(ICSettingsPasswordViewController *)self lockedNotesModeDevicePasswordSpecifier];
  if (v8 == v4)
  {
    uint64_t v10 = 2;
  }
  else
  {
    id v9 = [(ICSettingsPasswordViewController *)self lockedNotesModeCustomPasswordSpecifier];
    uint64_t v10 = v9 == v4;
  }
  if (v10 != v7 && v10)
  {
    objc_initWeak(&location, self);
    NSUInteger v11 = +[ICLockedNotesModeMigrator sharedMigrator];
    unsigned int v12 = [(ICSettingsPasswordViewController *)self account];
    id v13 = objc_loadWeakRetained(&location);
    v14 = [v13 view];
    v15 = [v14 window];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_625C;
    v16[3] = &unk_1C8D0;
    objc_copyWeak(&v17, &location);
    __int16 v18 = v10;
    __int16 v19 = v7;
    [v11 presentBackwardsCompatibilityAlertIfNeededForAccount:v12 mode:v10 window:v15 confirmHandler:v16 cancelHandler:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)presentLockedNotesWelcomePrompt
{
  objc_initWeak(&location, self);
  unsigned int v3 = +[ICLockedNotesModeMigrator sharedMigrator];
  id v4 = [(ICSettingsPasswordViewController *)self account];
  BOOL v5 = [(ICSettingsPasswordViewController *)self view];
  uint64_t v6 = [v5 window];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_68C0;
  v7[3] = &unk_1C948;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v3 presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:v4 window:v6 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (PSSpecifier)biometricsGroupSpecifier
{
  biometricsGroupSpecifier = self->_biometricsGroupSpecifier;
  if (!biometricsGroupSpecifier)
  {
    id v4 = [(ICSettingsPasswordViewController *)self bundle];
    BOOL v5 = [v4 localizedStringForKey:@"LEARN_MORE" value:@"Learn More…" table:@"Settings"];

    uint64_t v6 = [(ICSettingsPasswordViewController *)self biometricsGroupFooter];
    unsigned int v7 = +[NSString stringWithFormat:@"%@ %@", v6, v5];

    id v8 = [v7 rangeOfString:v5];
    NSUInteger v10 = v9;
    NSUInteger v11 = +[PSSpecifier emptyGroupSpecifier];
    unsigned int v12 = self->_biometricsGroupSpecifier;
    self->_biometricsGroupSpecifier = v11;

    id v13 = self->_biometricsGroupSpecifier;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [(PSSpecifier *)v13 setProperty:v15 forKey:PSFooterCellClassGroupKey];

    [(PSSpecifier *)self->_biometricsGroupSpecifier setProperty:v7 forKey:PSFooterTextGroupKey];
    id v16 = self->_biometricsGroupSpecifier;
    v24.id location = (NSUInteger)v8;
    v24.length = v10;
    id v17 = NSStringFromRange(v24);
    [(PSSpecifier *)v16 setProperty:v17 forKey:PSFooterHyperlinkViewLinkRangeKey];

    __int16 v18 = self->_biometricsGroupSpecifier;
    __int16 v19 = +[NSValue valueWithNonretainedObject:self];
    [(PSSpecifier *)v18 setProperty:v19 forKey:PSFooterHyperlinkViewTargetKey];

    v20 = self->_biometricsGroupSpecifier;
    v21 = NSStringFromSelector("didTapBiometricsLearnMoreLink:");
    [(PSSpecifier *)v20 setProperty:v21 forKey:PSFooterHyperlinkViewActionKey];

    biometricsGroupSpecifier = self->_biometricsGroupSpecifier;
  }

  return biometricsGroupSpecifier;
}

- (void)didTapBiometricsLearnMoreLink:(id)a3
{
}

- (NSString)biometricsGroupFooter
{
  if (+[ICLocalAuthentication biometricsType] == &dword_4)
  {
    if (+[ICLocalAuthentication biometricsEnrolled]&& [(ICSettingsPasswordViewController *)self hasMultipleAccounts])
    {
      unsigned int v3 = [(ICSettingsPasswordViewController *)self bundle];
      id v4 = v3;
      CFStringRef v5 = @"PW_OPTIC_ID_ENROLLED_FOOTER_MULTIPLE_ACCOUNT";
      CFStringRef v6 = @"Use Optic ID to view and manage locked notes in this account.";
      goto LABEL_29;
    }
    unsigned int v7 = +[ICLocalAuthentication biometricsEnrolled];
    id v4 = [(ICSettingsPasswordViewController *)self bundle];
    if (v7)
    {
      CFStringRef v5 = @"PW_OPTIC_ID_ENROLLED_FOOTER_SINGLE_ACCOUNT";
      CFStringRef v6 = @"Use Optic ID to view and manage locked notes.";
    }
    else
    {
      CFStringRef v5 = @"PW_OPTIC_ID_NOT_ENROLLED_FOOTER";
      CFStringRef v6 = @"Set up Optic ID in Settings > Optic ID & Passcode to add it as a way to manage your locked notes.";
    }
  }
  else if (+[ICLocalAuthentication biometricsType] == (char *)&dword_0 + 2)
  {
    if (+[ICLocalAuthentication biometricsEnrolled]&& [(ICSettingsPasswordViewController *)self hasMultipleAccounts])
    {
      unsigned int v3 = [(ICSettingsPasswordViewController *)self bundle];
      id v4 = v3;
      CFStringRef v5 = @"PW_FACE_ID_ENROLLED_FOOTER_MULTIPLE_ACCOUNT";
      CFStringRef v6 = @"Use Face ID to view and manage locked notes in this account.";
      goto LABEL_29;
    }
    unsigned int v10 = +[ICLocalAuthentication biometricsEnrolled];
    id v4 = [(ICSettingsPasswordViewController *)self bundle];
    if (v10)
    {
      CFStringRef v5 = @"PW_FACE_ID_ENROLLED_FOOTER_SINGLE_ACCOUNT";
      CFStringRef v6 = @"Use Face ID to view and manage locked notes.";
    }
    else
    {
      CFStringRef v5 = @"PW_FACE_ID_NOT_ENROLLED_FOOTER";
      CFStringRef v6 = @"Set up Face ID in Settings > Face ID & Passcode to add it as a way to manage your locked notes.";
    }
  }
  else
  {
    id v8 = (char *)+[ICLocalAuthentication biometricsType];
    unsigned int v9 = +[ICLocalAuthentication biometricsEnrolled];
    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      if (v9 && [(ICSettingsPasswordViewController *)self hasMultipleAccounts])
      {
        unsigned int v3 = [(ICSettingsPasswordViewController *)self bundle];
        id v4 = v3;
        CFStringRef v5 = @"PW_TOUCH_ID_ENROLLED_FOOTER_MULTIPLE_ACCOUNT";
        CFStringRef v6 = @"Use your fingerprint to view locked notes in this account.";
        goto LABEL_29;
      }
      unsigned int v11 = +[ICLocalAuthentication biometricsEnrolled];
      id v4 = [(ICSettingsPasswordViewController *)self bundle];
      if (v11)
      {
        CFStringRef v5 = @"PW_TOUCH_ID_ENROLLED_FOOTER_SINGLE_ACCOUNT";
        CFStringRef v6 = @"Use your fingerprint to view locked notes.";
      }
      else
      {
        CFStringRef v5 = @"PW_TOUCH_ID_NOT_ENROLLED_FOOTER";
        CFStringRef v6 = @"Set up Touch ID in Settings > Touch ID & Passcode to add it as a way to manage your locked notes.";
      }
    }
    else
    {
      if (v9 && [(ICSettingsPasswordViewController *)self hasMultipleAccounts])
      {
        unsigned int v3 = [(ICSettingsPasswordViewController *)self bundle];
        id v4 = v3;
        CFStringRef v5 = @"PW_BIOMETRICS_ENROLLED_FOOTER_MULTIPLE_ACCOUNT";
        CFStringRef v6 = @"Use biometrics to view locked notes in this account.";
        goto LABEL_29;
      }
      unsigned int v12 = +[ICLocalAuthentication biometricsEnrolled];
      id v4 = [(ICSettingsPasswordViewController *)self bundle];
      if (v12)
      {
        CFStringRef v5 = @"PW_BIOMETRICS_ENROLLED_FOOTER_SINGLE_ACCOUNT";
        CFStringRef v6 = @"Use biometrics to view locked notes.";
      }
      else
      {
        CFStringRef v5 = @"PW_BIOMETRICS_NOT_ENROLLED_FOOTER";
        CFStringRef v6 = @"Set up Biometrics in Settings > Passcode to add it as a way to manage your locked notes.";
      }
    }
  }
  unsigned int v3 = v4;
LABEL_29:
  id v13 = [v3 localizedStringForKey:v5 value:v6 table:@"Settings"];

  return (NSString *)v13;
}

- (PSSpecifier)biometricsSwitchSpecifier
{
  biometricsSwitchSpecifier = self->_biometricsSwitchSpecifier;
  if (!biometricsSwitchSpecifier)
  {
    id v4 = [(ICSettingsPasswordViewController *)self biometricsSwitchTitle];
    CFStringRef v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setBiometricsSwitchValue:specifier:" get:"biometricsSwitchValue:" detail:0 cell:6 edit:0];
    CFStringRef v6 = self->_biometricsSwitchSpecifier;
    self->_biometricsSwitchSpecifier = v5;

    unsigned int v7 = self->_biometricsSwitchSpecifier;
    id v8 = +[NSNumber numberWithBool:[(ICSettingsPasswordViewController *)self biometricsSwitchEnabled]];
    [(PSSpecifier *)v7 setProperty:v8 forKey:PSEnabledKey];

    biometricsSwitchSpecifier = self->_biometricsSwitchSpecifier;
  }

  return biometricsSwitchSpecifier;
}

- (NSString)biometricsSwitchTitle
{
  if (+[ICLocalAuthentication biometricsType] == &dword_4)
  {
    unsigned int v3 = [(ICSettingsPasswordViewController *)self bundle];
    id v4 = v3;
    CFStringRef v5 = @"USE_OPTIC_ID_CELL_TITLE";
    CFStringRef v6 = @"Use Optic ID";
  }
  else if (+[ICLocalAuthentication biometricsType] == (char *)&dword_0 + 2)
  {
    unsigned int v3 = [(ICSettingsPasswordViewController *)self bundle];
    id v4 = v3;
    CFStringRef v5 = @"USE_FACE_ID_CELL_TITLE";
    CFStringRef v6 = @"Use Face ID";
  }
  else
  {
    unsigned int v7 = (char *)+[ICLocalAuthentication biometricsType];
    unsigned int v3 = [(ICSettingsPasswordViewController *)self bundle];
    id v4 = v3;
    if (v7 == (unsigned char *)&dword_0 + 1)
    {
      CFStringRef v5 = @"USE_TOUCH_ID_CELL_TITLE";
      CFStringRef v6 = @"Use Touch ID";
    }
    else
    {
      CFStringRef v5 = @"USE_BIOMETRICS_CELL_TITLE";
      CFStringRef v6 = @"Use Biometrics";
    }
  }
  id v8 = [v3 localizedStringForKey:v5 value:v6 table:@"Settings"];

  return (NSString *)v8;
}

- (BOOL)biometricsSwitchEnabled
{
  v2 = [(ICSettingsPasswordViewController *)self presentedViewController];
  if (v2) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = +[ICLocalAuthentication biometricsEnrolled];
  }

  return v3;
}

- (id)biometricsSwitchValue:(id)a3
{
  if ([(ICSettingsPasswordViewController *)self biometricsSwitchEnabled])
  {
    id v4 = [(ICSettingsPasswordViewController *)self account];
    if (v4)
    {
      CFStringRef v5 = +[ICAuthenticationState sharedState];
      CFStringRef v6 = [(ICSettingsPasswordViewController *)self account];
      unsigned int v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 biometricsEnabledForAccount:v6]);
    }
    else
    {
      unsigned int v7 = +[NSNumber numberWithInt:0];
    }
  }
  else
  {
    unsigned int v7 = +[NSNumber numberWithInt:0];
  }

  return v7;
}

- (void)setBiometricsSwitchValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(ICSettingsPasswordViewController *)self account];
  unsigned int v9 = +[ICAuthenticationPrompt promptForIntent:8 object:v8];

  unsigned int v10 = +[ICAuthentication shared];
  unsigned int v11 = [(ICSettingsPasswordViewController *)self view];
  unsigned int v12 = [v11 window];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_77E8;
  v15[3] = &unk_1C970;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v16 = v13;
  id v14 = v7;
  id v17 = v14;
  [v10 authenticateWithPrompt:v9 displayWindow:v12 completionHandler:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (PSSpecifier)changeCustomPasswordSpecifier
{
  changeCustomPasswordSpecifier = self->_changeCustomPasswordSpecifier;
  if (!changeCustomPasswordSpecifier)
  {
    id v4 = [(ICSettingsPasswordViewController *)self bundle];
    CFStringRef v5 = [v4 localizedStringForKey:@"CHANGE_PW_BUTTON_TITLE" value:@"Change Password…" table:@"Settings"];

    id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
    id v7 = self->_changeCustomPasswordSpecifier;
    self->_changeCustomPasswordSpecifier = v6;

    [(PSSpecifier *)self->_changeCustomPasswordSpecifier setButtonAction:"didTapChangeCustomPasswordButton:"];
    id v8 = self->_changeCustomPasswordSpecifier;
    unsigned int v9 = [(ICSettingsPasswordViewController *)self presentedViewController];
    unsigned int v10 = +[NSNumber numberWithInt:v9 == 0];
    [(PSSpecifier *)v8 setProperty:v10 forKey:PSEnabledKey];

    changeCustomPasswordSpecifier = self->_changeCustomPasswordSpecifier;
  }

  return changeCustomPasswordSpecifier;
}

- (void)didTapChangeCustomPasswordButton:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc((Class)ICPasswordChangeViewController);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_7C98;
  v22[3] = &unk_1C8F8;
  objc_copyWeak(&v23, &location);
  id v6 = [v5 initWithCompletionHandler:v22];
  [v6 setIsInSettings:1];
  id v7 = [ICSettingsNavigationController alloc];
  id v8 = [(ICSettingsPasswordViewController *)self navigationController];
  unsigned int v9 = -[ICSettingsNavigationController initWithRootViewController:supportedInterfaceOrientations:](v7, "initWithRootViewController:supportedInterfaceOrientations:", v6, [v8 supportedInterfaceOrientations]);

  [(ICSettingsNavigationController *)v9 setModalPresentationStyle:2];
  unsigned int v10 = [(ICSettingsNavigationController *)v9 presentationController];
  [v10 setDelegate:self];

  unsigned int v11 = [(ICSettingsPasswordViewController *)self account];
  unsigned int v12 = +[ICAuthenticationPrompt promptForIntent:5 object:v11];

  id v13 = +[ICAuthentication shared];
  id v14 = [(ICSettingsPasswordViewController *)self view];
  v15 = [v14 window];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_7CD8;
  v18[3] = &unk_1C970;
  objc_copyWeak(&v21, &location);
  id v16 = v6;
  id v19 = v16;
  id v17 = v9;
  v20 = v17;
  [v13 authenticateWithPrompt:v12 displayWindow:v15 completionHandler:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (PSSpecifier)setCustomPasswordSpecifier
{
  setCustomPasswordSpecifier = self->_setCustomPasswordSpecifier;
  if (!setCustomPasswordSpecifier)
  {
    id v4 = [(ICSettingsPasswordViewController *)self bundle];
    id v5 = [v4 localizedStringForKey:@"SET_PW_BUTTON_TITLE" value:@"Set Password…" table:@"Settings"];

    id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
    id v7 = self->_setCustomPasswordSpecifier;
    self->_setCustomPasswordSpecifier = v6;

    [(PSSpecifier *)self->_setCustomPasswordSpecifier setButtonAction:"didTapSetCustomPasswordButton:"];
    id v8 = self->_setCustomPasswordSpecifier;
    unsigned int v9 = [(ICSettingsPasswordViewController *)self presentedViewController];
    unsigned int v10 = +[NSNumber numberWithInt:v9 == 0];
    [(PSSpecifier *)v8 setProperty:v10 forKey:PSEnabledKey];

    setCustomPasswordSpecifier = self->_setCustomPasswordSpecifier;
  }

  return setCustomPasswordSpecifier;
}

- (void)didTapSetCustomPasswordButton:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc((Class)ICPasswordChangeViewController);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_80FC;
  id v16 = &unk_1C8F8;
  objc_copyWeak(&v17, &location);
  id v6 = [v5 initWithCompletionHandler:&v13];
  objc_msgSend(v6, "setIsInSettings:", 1, v13, v14, v15, v16);
  [v6 setIsSettingInitialPassword:1];
  id v7 = [(ICSettingsPasswordViewController *)self account];
  [v6 setUpForAddingPasswordWithAccount:v7];

  id v8 = [ICSettingsNavigationController alloc];
  unsigned int v9 = [(ICSettingsPasswordViewController *)self navigationController];
  unsigned int v10 = -[ICSettingsNavigationController initWithRootViewController:supportedInterfaceOrientations:](v8, "initWithRootViewController:supportedInterfaceOrientations:", v6, [v9 supportedInterfaceOrientations]);

  [(ICSettingsNavigationController *)v10 setModalPresentationStyle:2];
  unsigned int v11 = [(ICSettingsNavigationController *)v10 presentationController];
  [v11 setDelegate:self];

  unsigned int v12 = [(ICSettingsPasswordViewController *)self navigationController];
  [v12 presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (PSSpecifier)resetCustomPasswordGroupSpecifier
{
  resetCustomPasswordGroupSpecifier = self->_resetCustomPasswordGroupSpecifier;
  if (!resetCustomPasswordGroupSpecifier)
  {
    id v4 = [(ICSettingsPasswordViewController *)self account];
    id v5 = +[ICAuthenticationAlert resetCustomPasswordInfoAlertWithAccount:v4];

    id v6 = +[PSSpecifier emptyGroupSpecifier];
    id v7 = self->_resetCustomPasswordGroupSpecifier;
    self->_resetCustomPasswordGroupSpecifier = v6;

    id v8 = self->_resetCustomPasswordGroupSpecifier;
    unsigned int v9 = [v5 message];
    [(PSSpecifier *)v8 setProperty:v9 forKey:PSFooterTextGroupKey];

    resetCustomPasswordGroupSpecifier = self->_resetCustomPasswordGroupSpecifier;
  }

  return resetCustomPasswordGroupSpecifier;
}

- (PSSpecifier)resetCustomPasswordSpecifier
{
  resetCustomPasswordSpecifier = self->_resetCustomPasswordSpecifier;
  if (!resetCustomPasswordSpecifier)
  {
    id v4 = [(ICSettingsPasswordViewController *)self account];
    id v5 = +[ICAuthenticationAlert resetCustomPasswordConfirmationAlertWithAccount:v4];

    id v6 = [v5 actionTitle];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];
    id v8 = self->_resetCustomPasswordSpecifier;
    self->_resetCustomPasswordSpecifier = v7;

    [(PSSpecifier *)self->_resetCustomPasswordSpecifier setButtonAction:"didTapResetCustomPasswordButton:"];
    [(PSSpecifier *)self->_resetCustomPasswordSpecifier setProperty:objc_opt_class() forKey:PSCellClassKey];
    unsigned int v9 = self->_resetCustomPasswordSpecifier;
    unsigned int v10 = [(ICSettingsPasswordViewController *)self presentedViewController];
    unsigned int v11 = +[NSNumber numberWithInt:v10 == 0];
    [(PSSpecifier *)v9 setProperty:v11 forKey:PSEnabledKey];

    resetCustomPasswordSpecifier = self->_resetCustomPasswordSpecifier;
  }

  return resetCustomPasswordSpecifier;
}

- (void)didTapResetCustomPasswordButton:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(ICSettingsPasswordViewController *)self account];
  id v6 = +[ICAuthenticationPrompt promptForIntent:6 object:v5];

  id v7 = +[ICAuthentication shared];
  id v8 = [(ICSettingsPasswordViewController *)self view];
  unsigned int v9 = [v8 window];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_84DC;
  v10[3] = &unk_1C8F8;
  objc_copyWeak(&v11, &location);
  [v7 authenticateWithPrompt:v6 displayWindow:v9 completionHandler:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)resetCustomPasswordForAccount:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[ICLockedNotesModeMigrator sharedMigrator];
  id v6 = [(ICSettingsPasswordViewController *)self view];
  id v7 = [v6 window];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_88F4;
  v9[3] = &unk_1C9C0;
  id v8 = v4;
  id v10 = v8;
  objc_copyWeak(&v12, &location);
  id v11 = self;
  [v5 presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:v8 window:v7 completionHandler:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (NSManagedObjectID)accountID
{
  return self->_accountID;
}

- (ICAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_resetCustomPasswordSpecifier, 0);
  objc_storeStrong((id *)&self->_resetCustomPasswordGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_setCustomPasswordSpecifier, 0);
  objc_storeStrong((id *)&self->_changeCustomPasswordSpecifier, 0);
  objc_storeStrong((id *)&self->_biometricsSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_biometricsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_lockedNotesModeCustomPasswordSpecifier, 0);
  objc_storeStrong((id *)&self->_lockedNotesModeDevicePasswordSpecifier, 0);

  objc_storeStrong((id *)&self->_lockedNotesModeGroupSpecifier, 0);
}

@end