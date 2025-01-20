@interface MailAccount
+ (BOOL)addressIsEditable;
+ (BOOL)aliasesAreEditable;
+ (BOOL)setupIsAutomated;
+ (Class)accountValidatorClass;
+ (id)_accountDescriptionSpecifiersForExistingAccount:(BOOL)a3;
+ (id)_incomingSpecifiers;
+ (id)advancedSpecifiers:(BOOL)a3;
+ (id)advancedSpecifiersWithOptions:(unsigned int)a3;
+ (id)aliasSpecifiersForEmails:(id)a3;
+ (id)copyShortFormForHost:(id)a3 descriptionPlaceholder:(id)a4 addressIsEditable:(BOOL)a5;
+ (id)descriptionPlaceholder;
+ (id)detailedSpecifiers:(BOOL)a3;
+ (id)easySetupSpecifiersWithPlaceholderAddress:(id)a3 accountName:(id)a4;
+ (id)editableSuffix;
+ (id)emailAddressHostPart;
+ (id)firstSetupSpecifiers;
+ (id)helpTitle;
+ (id)helpURL;
+ (id)primarySpecifiers:(BOOL)a3;
+ (id)userInfoForAccountTopLevelSpecifier;
+ (int)advancedSpecifiersOptions;
+ (void)getRemoveOptionTitles:(id *)a3 values:(id *)a4 defaultValue:(id *)a5;
- (BOOL)hasCustomDomain;
- (BOOL)mailDataClassSwitch;
- (NSString)dataclassName;
- (id)advancedSpecifiers;
- (id)detailedSpecifiers;
- (id)otherTopLevelSpecifiers;
- (id)primarySpecifiers;
- (id)valueForSettingsInAccountPropertiesForKey:(id)a3;
@end

@implementation MailAccount

+ (id)emailAddressHostPart
{
  return 0;
}

+ (Class)accountValidatorClass
{
  return (Class)objc_opt_class();
}

+ (id)copyShortFormForHost:(id)a3 descriptionPlaceholder:(id)a4 addressIsEditable:(BOOL)a5
{
  id v35 = a3;
  id v34 = a4;
  id v36 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"FULL_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  v10 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v9 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v10 setKeyboardType:0 autoCaps:1 autoCorrection:1];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"JOHN_APPLESEED" value:&stru_B9F70 table:@"AccountPreferences"];
  [v10 setPlaceholder:v12];

  uint64_t v13 = PSKeyNameKey;
  [v10 setProperty:MailAccountFullUserName forKey:PSKeyNameKey];
  [v36 addObject:v10];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
  v16 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v15 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v16 setKeyboardType:7 autoCaps:0 autoCorrection:1];
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"EXAMPLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v19 = [v18 stringByAppendingFormat:@"@%@", v35];
  [v16 setPlaceholder:v19];

  [v16 setProperty:MFMailAccountUsername forKey:v13];
  if (!a5) {
    [v16 setProperty:@"NO" forKey:PSEnabledKey];
  }
  id v20 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  [v20 setObject:@"YES" forKey:@"AccountPreferenceRequired"];
  [v20 setObject:kCFBooleanTrue forKey:@"disableForManagedAccounts"];
  v21 = [a1 editableSuffix];
  id v22 = [v21 length];

  if (v22)
  {
    v23 = [a1 editableSuffix];
    [v20 setObject:v23 forKey:@"UserEditableSuffix"];
  }
  [v16 setUserInfo:v20];
  [v36 addObject:v16];
  v24 = +[NSBundle bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"PASSWORD" value:&stru_B9F70 table:@"AccountPreferences"];
  v26 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v25 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v26 setKeyboardType:1 autoCaps:0 autoCorrection:1];
  v27 = +[NSBundle bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"REQUIRED" value:&stru_B9F70 table:@"AccountPreferences"];
  [v26 setPlaceholder:v28];

  [v26 setProperty:MailAccountPassword forKey:v13];
  v29 = +[NSDictionary dictionaryWithObjectsAndKeys:@"YES", @"AccountPreferenceRequired", 0];
  [v26 setUserInfo:v29];

  *(void *)&v26[OBJC_IVAR___PSSpecifier_cellType] = 12;
  [v36 addObject:v26];
  if (_os_feature_enabled_impl())
  {
    v30 = v26;
  }
  else
  {
    v31 = +[NSBundle bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"DESCRIPTION" value:&stru_B9F70 table:@"AccountPreferences"];
    v30 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v32 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

    [v30 setKeyboardType:0 autoCaps:2 autoCorrection:0];
    [v30 setPlaceholder:v34];
    [v30 setProperty:MFMailAccountDescription forKey:v13];
    [v36 addObject:v30];
  }

  return v36;
}

- (id)otherTopLevelSpecifiers
{
  return +[NSArray array];
}

+ (id)_accountDescriptionSpecifiersForExistingAccount:(BOOL)a3
{
  BOOL v3 = a3;
  id v24 = +[NSMutableArray arrayWithCapacity:3];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"FULL_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  v6 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v5 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v6 setKeyboardType:0 autoCaps:1 autoCorrection:1];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"JOHN_APPLESEED" value:&stru_B9F70 table:@"AccountPreferences"];
  [v6 setPlaceholder:v8];

  uint64_t v9 = PSKeyNameKey;
  [v6 setProperty:MailAccountFullUserName forKey:PSKeyNameKey];
  v10 = +[NSDictionary dictionaryWithObjectsAndKeys:kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v6 setUserInfo:v10];

  [v24 addObject:v6];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v13 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v12 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  if (v3) {
    [v13 setProperty:@"EXISTING_ACCOUNT_EMAIL" forKey:PSIDKey];
  }
  [v13 setKeyboardType:7 autoCaps:0 autoCorrection:1];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"GENERIC_ADDRESS_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v13 setPlaceholder:v15];

  [v13 setProperty:MailAccountEmailAddresses forKey:v9];
  v16 = +[NSDictionary dictionaryWithObjectsAndKeys:@"YES", @"AccountPreferenceRequired", kCFBooleanTrue, @"disableForManagedAccounts", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v13 setUserInfo:v16];

  [v24 addObject:v13];
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"DESCRIPTION" value:&stru_B9F70 table:@"AccountPreferences"];
  v19 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v18 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  id v20 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"GENERIC_EMAIL_ACCOUNT_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];

  [v19 setKeyboardType:0 autoCaps:2 autoCorrection:0];
  [v19 setPlaceholder:v21];
  [v19 setProperty:MFMailAccountDescription forKey:v9];
  id v22 = +[NSDictionary dictionaryWithObjectsAndKeys:kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v19 setUserInfo:v22];

  [v24 addObject:v19];

  return v24;
}

+ (id)_incomingSpecifiers
{
  id v26 = +[NSMutableArray arrayWithCapacity:4];
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"INCOMING_MAIL_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v26 addObject:v4];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"HOST_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v6 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v7 setKeyboardType:3 autoCaps:0 autoCorrection:1];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"HOSTNAME_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v7 setPlaceholder:v9];

  v10 = +[NSDictionary dictionaryWithObjectsAndKeys:@"YES", @"AccountPreferenceRequired", kCFBooleanTrue, @"disableForManagedAccounts", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v7 setUserInfo:v10];

  uint64_t v11 = PSKeyNameKey;
  [v7 setProperty:MailAccountHostname forKey:PSKeyNameKey];
  [v26 addObject:v7];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"USER_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  v14 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v13 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  if (+[UIDevice mf_isPad]) {
    uint64_t v15 = 7;
  }
  else {
    uint64_t v15 = 0;
  }
  [v14 setKeyboardType:v15 autoCaps:0 autoCorrection:1];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"REQUIRED" value:&stru_B9F70 table:@"AccountPreferences"];
  [v14 setPlaceholder:v17];

  v18 = +[NSDictionary dictionaryWithObjectsAndKeys:@"YES", @"AccountPreferenceRequired", kCFBooleanTrue, @"disableForManagedAccounts", kCFBooleanTrue, @"disableForModificationRestrictions", 0];
  [v14 setUserInfo:v18];

  [v14 setProperty:MFMailAccountUsername forKey:v11];
  [v26 addObject:v14];
  v19 = +[NSBundle bundleForClass:objc_opt_class()];
  id v20 = [v19 localizedStringForKey:@"PASSWORD" value:&stru_B9F70 table:@"AccountPreferences"];
  v21 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v20 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v21 setKeyboardType:1 autoCaps:0 autoCorrection:1];
  id v22 = +[NSBundle bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"REQUIRED" value:&stru_B9F70 table:@"AccountPreferences"];
  [v21 setPlaceholder:v23];

  id v24 = +[NSDictionary dictionaryWithObjectsAndKeys:@"YES", @"AccountPreferenceRequired", 0];
  [v21 setUserInfo:v24];

  *(void *)&v21[OBJC_IVAR___PSSpecifier_cellType] = 12;
  [v21 setProperty:MailAccountPassword forKey:v11];
  [v26 addObject:v21];

  return v26;
}

+ (id)primarySpecifiers:(BOOL)a3
{
  v4 = +[NSMutableArray array];
  if ([a1 setupIsAutomated])
  {
    v5 = [a1 emailAddressHostPart];
    v6 = [a1 descriptionPlaceholder];
    id v7 = objc_msgSend(a1, "copyShortFormForHost:descriptionPlaceholder:addressIsEditable:", v5, v6, objc_msgSend(a1, "addressIsEditable"));
    [v4 addObjectsFromArray:v7];
  }
  else
  {
    v8 = [a1 _accountDescriptionSpecifiersForExistingAccount:1];
    [v4 addObjectsFromArray:v8];

    v5 = [a1 _incomingSpecifiers];
    [v4 addObjectsFromArray:v5];
  }

  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"OUTGOING_MAIL_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v4 addObject:v11];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"SMTP" value:&stru_B9F70 table:@"AccountPreferences"];
  v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:0 set:0 get:"getSMTPDisplayName:" detail:objc_opt_class() cell:2 edit:0];

  [v14 setProperty:@"SMTP_INFORMATION_KEY" forKey:PSIDKey];
  [v4 addObject:v14];

  return v4;
}

- (id)primarySpecifiers
{
  BOOL v3 = objc_msgSend((id)objc_opt_class(), "primarySpecifiers:", -[MailAccount isManaged](self, "isManaged"));
  [v3 makeObjectsPerformSelector:"setTarget:" withObject:self];

  return v3;
}

+ (void)getRemoveOptionTitles:(id *)a3 values:(id *)a4 defaultValue:(id *)a5
{
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v16 localizedStringForKey:@"NEVER" value:&stru_B9F70 table:@"AccountPreferences"];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"REMOVE_AFTER_ONE_DAY" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"REMOVE_AFTER_ONE_WEEK" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"REMOVE_AFTER_ONE_MONTH" value:&stru_B9F70 table:@"AccountPreferences"];
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, v8, v10, v12, 0);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = +[NSArray arrayWithObjects:@"-1", @"1", @"7", @"30", 0];
  if (a3) {
    *a3 = v17;
  }
  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = MFMailAccountNumberOfDaysToKeepTrashDefaultValue;
  }
}

+ (id)advancedSpecifiersWithOptions:(unsigned int)a3
{
  char v3 = a3;
  id v87 = +[NSMutableArray array];
  unsigned int v4 = [a1 isSSLEditable];
  char v83 = v3;
  if ((v3 & 0x20) != 0)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"MOVE_DISCARDED_MESSAGES_INTO" value:&stru_B9F70 table:@"AccountPreferences"];
    id v7 = +[PSSpecifier groupSpecifierWithName:v6];

    uint64_t v8 = PSIDKey;
    [v7 setProperty:@"MFArchiveMessagesGroupSpecifierID" forKey:PSIDKey];
    [v7 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v87 addObject:v7];
    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"DELETED_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:a1 set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v12 = PSValueKey;
    [v11 setProperty:&__kCFBooleanFalse forKey:PSValueKey];
    [v11 setProperty:@"MFArchiveMessagesTrashMailboxSpecifierID" forKey:v8];
    uint64_t v13 = MFMailAccountArchive;
    uint64_t v14 = PSKeyNameKey;
    [v11 setProperty:MFMailAccountArchive forKey:PSKeyNameKey];
    [v87 addObject:v11];
    uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"ARCHIVE_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    id v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:a1 set:0 get:0 detail:0 cell:3 edit:0];

    [v17 setProperty:&__kCFBooleanTrue forKey:v12];
    [v17 setProperty:@"MFArchiveMessagesArchiveMailboxSpecifierID" forKey:v8];
    [v17 setProperty:v13 forKey:v14];
    [v87 addObject:v17];
  }
  if ((v83 & 0x10) != 0)
  {
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"DELETED_MESSAGES_GROUP" value:&stru_B9F70 table:@"AccountPreferences"];
    id v20 = +[PSSpecifier groupSpecifierWithName:v19];
    [v87 addObject:v20];

    id v89 = 0;
    id v90 = 0;
    id v88 = 0;
    [a1 getRemoveOptionTitles:&v90 values:&v89 defaultValue:&v88];
    id v21 = v90;
    id v22 = v89;
    id v23 = v88;
    id v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"REMOVE_FROM_TRASH" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v26 = objc_opt_class();
    v27 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v21, @"titles", kCFBooleanFalse, @"disableForManagedAccounts", 0];
    id v28 = _ConfigurePSSpecifier(v87, (uint64_t)v25, 0, (uint64_t)"setAccountProperty:withSpecifier:", (uint64_t)"accountPropertyWithSpecifier:", 0, 0, v26, 2, 0, v27, MFMailAccountNumberOfDaysToKeepTrash, v22);

    v29 = [v87 lastObject];
    [v29 setProperty:v23 forKey:PSDefaultValueKey];
  }
  if ((v83 & 3) != 0) {
    int v30 = 1;
  }
  else {
    int v30 = v4;
  }
  if (v30 == 1)
  {
    v31 = +[NSBundle bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"INCOMING_SETTINGS" value:&stru_B9F70 table:@"AccountPreferences"];
    v33 = +[PSSpecifier groupSpecifierWithName:v32];
    [v87 addObject:v33];

    if (v4)
    {
      id v34 = +[NSBundle bundleForClass:objc_opt_class()];
      id v35 = [v34 localizedStringForKey:@"USE_SSL" value:&stru_B9F70 table:@"AccountPreferences"];
      id v36 = _ConfigureBooleanPSSpecifier(v87, (uint64_t)v35, 0, (uint64_t)"setSSLSetting:withSpecifier:", (uint64_t)"accountPropertyWithSpecifier:", 0, 0, 0, 6, 0, 0, MailAccountSSLEnabled);

      v37 = +[NSDictionary dictionaryWithObjectsAndKeys:kCFBooleanTrue, @"disableForManagedAccounts", 0];
      [v36 setUserInfo:v37];
    }
    if (v83)
    {
      v38 = +[NSBundle bundleForClass:objc_opt_class()];
      v39 = [v38 localizedStringForKey:@"AUTHENTICATION" value:&stru_B9F70 table:@"AccountPreferences"];
      v40 = +[PSSpecifier preferenceSpecifierNamed:v39 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

      [v40 setProperty:@"authSchemeValuesForSpecifier:" forKey:PSValuesDataSourceKey];
      [v40 setProperty:@"authSchemeTitlesForSpecifier:" forKey:PSTitlesDataSourceKey];
      [v40 setProperty:MFMailAccountAuthenticationScheme forKey:PSKeyNameKey];
      v41 = +[NSDictionary dictionaryWithObjectsAndKeys:kCFBooleanTrue, @"disableForManagedAccounts", 0];
      [v40 setUserInfo:v41];

      [v87 addObject:v40];
    }
    if ((v83 & 2) != 0)
    {
      v42 = +[NSBundle bundleForClass:objc_opt_class()];
      v43 = [v42 localizedStringForKey:@"IMAP_PATH_PREFIX" value:&stru_B9F70 table:@"AccountPreferences"];
      v44 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v43 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

      [v44 setKeyboardType:1 autoCaps:0 autoCorrection:1];
      [v44 setPlaceholder:@"/"];
      [v44 setProperty:IMAPServerPathPrefix forKey:PSKeyNameKey];
      v45 = +[NSDictionary dictionaryWithObjectsAndKeys:kCFBooleanTrue, @"disableForManagedAccounts", 0];
      [v44 setUserInfo:v45];

      [v87 addObject:v44];
    }
    if ((v83 & 4) != 0)
    {
      v82 = +[NSBundle bundleForClass:objc_opt_class()];
      v84 = [v82 localizedStringForKey:@"DELETE_MESSAGES_INTERVAL" value:&stru_B9F70 table:@"AccountPreferences"];
      uint64_t v46 = objc_opt_class();
      v81 = +[NSBundle bundleForClass:objc_opt_class()];
      v47 = [v81 localizedStringForKey:@"NEVER" value:&stru_B9F70 table:@"AccountPreferences"];
      v48 = +[NSBundle bundleForClass:objc_opt_class()];
      v49 = [v48 localizedStringForKey:@"7_DAYS" value:&stru_B9F70 table:@"AccountPreferences"];
      v50 = +[NSBundle bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:@"AFTER_DELETE" value:&stru_B9F70 table:@"AccountPreferences"];
      v52 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v47, v49, v51, 0);
      v53 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v52, @"titles", 0];
      v96[0] = MF_POPAccountNeverDeleteMessagesKey;
      v96[1] = MF_POPAccountDeleteMessagesAfterIntervalKey;
      v96[2] = MF_POPAccountDeleteMessagesWhenTransferredOutOfInboxKey;
      v54 = +[NSArray arrayWithObjects:v96 count:3];
      v55 = _ConfigurePSSpecifier(v87, (uint64_t)v84, 0, (uint64_t)"setAccountProperty:withSpecifier:", (uint64_t)"accountPropertyWithSpecifier:", 0, 0, v46, 2, 0, v53, @"POPDeleteIntervalKey", v54);

      v56 = +[NSDictionary dictionaryWithObjectsAndKeys:kCFBooleanFalse, @"disableForManagedAccounts", 0];
      [v55 setUserInfo:v56];

      [v55 setProperty:MF_POPAccountDeletionPolicy forKey:PSKeyNameKey];
    }
    v57 = +[NSBundle bundleForClass:objc_opt_class()];
    v58 = [v57 localizedStringForKey:@"SERVER_PORT" value:&stru_B9F70 table:@"AccountPreferences"];
    v59 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v58 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

    [v59 setKeyboardType:4 autoCaps:0 autoCorrection:1];
    [v59 setProperty:MailAccountPortNumber forKey:PSKeyNameKey];
    v60 = +[NSDictionary dictionaryWithObjectsAndKeys:kCFBooleanTrue, @"disableForManagedAccounts", 0];
    [v59 setUserInfo:v60];

    [v59 setProperty:@"SERVER_PORT" forKey:PSIDKey];
    [v87 addObject:v59];
  }
  v61 = +[NSBundle bundleForClass:objc_opt_class()];
  v62 = [v61 localizedStringForKey:@"SMIME_PREFS" value:&stru_B9F70 table:@"AccountPreferences"];
  v63 = +[PSSpecifier groupSpecifierWithName:v62];
  [v87 addObject:v63];

  v64 = +[NSBundle bundleForClass:objc_opt_class()];
  v65 = [v64 localizedStringForKey:@"NO" value:&stru_B9F70 table:@"AccountPreferences"];
  v95[0] = v65;
  v66 = +[NSBundle bundleForClass:objc_opt_class()];
  v67 = [v66 localizedStringForKey:@"YES" value:&stru_B9F70 table:@"AccountPreferences"];
  v95[1] = v67;
  v85 = +[NSArray arrayWithObjects:v95 count:2];

  v68 = +[NSBundle bundleForClass:objc_opt_class()];
  v69 = [v68 localizedStringForKey:@"ENABLE_SIGNING" value:&stru_B9F70 table:@"AccountPreferences"];
  v70 = +[PSSpecifier preferenceSpecifierNamed:v69 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

  uint64_t v71 = MFMailAccountSigningEnabled;
  uint64_t v72 = PSKeyNameKey;
  [v70 setObject:MFMailAccountSigningEnabled forKeyedSubscript:PSKeyNameKey];
  uint64_t v73 = PSIDKey;
  [v70 setObject:v71 forKeyedSubscript:PSIDKey];
  [v70 setValues:&off_C0318 titles:v85];
  v93[0] = @"ExistingMessageAccount";
  v93[1] = @"disableForManagedAccounts";
  v94[0] = a1;
  v94[1] = &__kCFBooleanFalse;
  v74 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:2];
  [v70 setUserInfo:v74];

  [v87 addObject:v70];
  v75 = +[NSBundle bundleForClass:objc_opt_class()];
  v76 = [v75 localizedStringForKey:@"ENABLE_ENCRYPTION" value:&stru_B9F70 table:@"AccountPreferences"];
  v77 = +[PSSpecifier preferenceSpecifierNamed:v76 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

  uint64_t v78 = MFMailAccountEncryptionEnabled;
  [v77 setObject:MFMailAccountEncryptionEnabled forKeyedSubscript:v72];
  [v77 setObject:v78 forKeyedSubscript:v73];
  [v77 setValues:&off_C0318 titles:v85];
  v91[0] = @"ExistingMessageAccount";
  v91[1] = @"disableForManagedAccounts";
  v92[0] = a1;
  v92[1] = &__kCFBooleanFalse;
  v79 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
  [v77 setUserInfo:v79];

  [v87 addObject:v77];

  return v87;
}

+ (int)advancedSpecifiersOptions
{
  return 1;
}

+ (id)advancedSpecifiers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = qword_D7328;
  if (!qword_D7328)
  {
    uint64_t v5 = objc_opt_class();
    qword_D7328 = v5;
  }
  if (v5 != objc_opt_class())
  {
    v6 = (void *)qword_D7320;
    qword_D7320 = 0;

    qword_D7328 = objc_opt_class();
  }
  id v7 = (void *)qword_D7320;
  if (!qword_D7320)
  {
    unsigned int v8 = [a1 advancedSpecifiersOptions];
    if (v3) {
      uint64_t v9 = v8 | 8;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = [a1 advancedSpecifiersWithOptions:v9];
    uint64_t v11 = (void *)qword_D7320;
    qword_D7320 = v10;

    id v7 = (void *)qword_D7320;
  }

  return v7;
}

- (id)advancedSpecifiers
{
  BOOL v3 = objc_msgSend((id)objc_opt_class(), "advancedSpecifiers:", -[MailAccount isManaged](self, "isManaged"));
  unsigned int v4 = [v3 specifierForID:managedExplanationText];
  if (v4)
  {
    uint64_t v5 = [(MailAccount *)self managedAccountFooterText];
    [v4 setName:v5];
  }

  return v3;
}

+ (id)detailedSpecifiers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[NSMutableArray array];
  v6 = +[PSSpecifier emptyGroupSpecifier];
  [v5 addObject:v6];

  id v31 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v31, "setObject:forKey:");
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v8 = [v7 localizedStringForKey:@"ENABLE_THIS_ACCOUNT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v9 = _ConfigureBooleanPSSpecifier(v5, (uint64_t)v8, 0, (uint64_t)"setAccountProperty:withSpecifier:", (uint64_t)"accountPropertyWithSpecifier:", 0, 0, 0, 6, 0, v31, @"MailAccountIsActive");

  v32 = [a1 displayedAccountTypeString];
  uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"ACCOUNT_INFORMATION" value:&stru_B9F70 table:@"AccountPreferences"];

  int v30 = (void *)v11;
  id v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v11, v32);
  uint64_t v12 = +[PSSpecifier groupSpecifierWithName:v29];
  uint64_t v13 = PSIDKey;
  [v12 setProperty:@"RegionalAccountInformationKey" forKey:PSIDKey];
  if ([(id)objc_opt_class() aliasesAreEditable])
  {
    uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"DEFAULT_EMAIL_EXPLANATION" value:&stru_B9F70 table:@"AccountPreferences"];

    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v32);
    [v12 setProperty:v16 forKey:PSFooterTextGroupKey];
  }
  [v5 addObject:v12];
  id v17 = [a1 primarySpecifiers:v3];
  [v5 addObjectsFromArray:v17];

  v18 = +[PSSpecifier emptyGroupSpecifier];
  [v5 addObject:v18];
  v19 = +[NSBundle bundleForClass:objc_opt_class()];
  id v20 = [v19 localizedStringForKey:@"ADVANCED" value:&stru_B9F70 table:@"AccountPreferences"];
  id v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v21 setProperty:@"ADVANCED_SPECIFIER_KEY" forKey:v13];
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  [v22 setObject:kCFBooleanTrue forKey:@"disableForModificationRestrictions"];
  [v21 setUserInfo:v22];
  [v5 addObject:v21];
  if (v3)
  {
    id v23 = 0;
    [v18 setProperty:managedExplanationText forKey:v13];
  }
  else
  {
    id v24 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v24];

    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v26 = [v25 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_B9F70 table:@"AccountPreferences"];
    id v23 = +[PSSpecifier deleteButtonSpecifierWithName:v26 target:0 action:"deleteAccount"];

    [v23 setProperty:@"DELETE_ACCOUNT" forKey:v13];
    id v27 = objc_alloc_init((Class)NSMutableDictionary);

    [v27 setObject:kCFBooleanTrue forKey:@"disableForModificationRestrictions"];
    [v23 setUserInfo:v27];
    id v22 = v27;
    [v5 addObject:v23];
  }

  return v5;
}

- (id)detailedSpecifiers
{
  id v46 = +[NSMutableArray array];
  v38 = objc_msgSend((id)objc_opt_class(), "detailedSpecifiers:", -[MailAccount isManaged](self, "isManaged"));
  objc_msgSend(v38, "makeObjectsPerformSelector:withObject:");
  v47 = [v38 objectEnumerator];
  v45 = [(MailAccount *)self accountPropertyForKey:@"RegionalDisplayName"];
  v42 = [(MailAccount *)self accountPropertyForKey:@"PlaceholderAddress"];
  v2 = 0;
  uint64_t v43 = MFMailAccountDescription;
  uint64_t v44 = MailAccountEmailAddresses;
  uint64_t v3 = PSKeyNameKey;
  uint64_t v4 = PSEnabledKey;
  uint64_t v51 = PSFooterTextGroupKey;
  while (1)
  {
    v50 = [v47 nextObject];

    if (!v50) {
      break;
    }
    id v5 = objc_alloc((Class)NSMutableDictionary);
    v6 = [v50 userInfo];
    id v49 = [v5 initWithDictionary:v6];

    [v49 setObject:self forKey:@"ExistingMessageAccount"];
    [v50 setUserInfo:v49];
    id v7 = [v50 identifier];
    LODWORD(v5) = [v7 isEqualToString:managedExplanationText];

    if (v5)
    {
      unsigned int v8 = [(MailAccount *)self managedAccountFooterText];
      [v50 setProperty:v8 forKey:v51];
      goto LABEL_11;
    }
    if (v45)
    {
      id v9 = [v50 identifier];
      unsigned int v10 = [v9 isEqualToString:@"RegionalAccountInformationKey"];

      if (v10)
      {
        uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
        unsigned int v8 = [v11 localizedStringForKey:@"ACCOUNT_INFORMATION" value:&stru_B9F70 table:@"AccountPreferences"];

        uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v45);
        [v50 setName:v12];
        goto LABEL_10;
      }
      uint64_t v13 = [v50 identifier];
      unsigned int v14 = [v13 isEqualToString:v43];

      if (v14)
      {
        uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
        unsigned int v8 = [v15 localizedStringForKey:@"GENERIC_ACCOUNT_DESCRIPTION_PLACEHOLDER_FORMAT" value:&stru_B9F70 table:@"AccountPreferences"];

        uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v45);
        [v50 setPlaceholder:v12];
LABEL_10:

LABEL_11:
LABEL_12:
        [v46 addObject:v50];
        goto LABEL_13;
      }
    }
    v16 = [v50 identifier];
    unsigned int v17 = [v16 isEqualToString:v44];

    if (!v17) {
      goto LABEL_12;
    }
    if (![(id)objc_opt_class() aliasesAreEditable])
    {
      if (v42) {
        [v50 setPlaceholder:v42];
      }
      goto LABEL_12;
    }
    [(MailAccount *)self invalidateEmailAliases];
    [(MailAccount *)self updateEmailAliasesIfNeeded];
    v41 = [(MailAccount *)self emailAddressesAndAliases];
    if ((unint64_t)[v41 count] < 2)
    {
      v19 = +[NSBundle bundleForClass:objc_opt_class()];
      id v20 = [v19 localizedStringForKey:@"EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
      v39 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v20 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

      [v39 setKeyboardType:7 autoCaps:0 autoCorrection:1];
      [v39 setProperty:v44 forKey:v3];
      [v39 setProperty:@"NO" forKey:v4];
      v62 = v39;
      v18 = +[NSArray arrayWithObjects:&v62 count:1];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v21 = v38;
      id v22 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v57;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v57 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            uint64_t v26 = [v25 identifier];
            unsigned int v27 = [v26 isEqualToString:@"RegionalAccountInformationKey"];

            if (v27) {
              [v25 removePropertyForKey:v51];
            }
          }
          id v22 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
        }
        while (v22);
      }
    }
    else
    {
      v18 = [(id)objc_opt_class() aliasSpecifiersForEmails:v41];
    }
    if (v18)
    {
      [v18 makeObjectsPerformSelector:"setTarget:" withObject:self];
      v40 = v18;
      id v28 = [(MailAccount *)self defaultEmailAddress];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v29 = v18;
      id v30 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v53;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v53 != v31) {
              objc_enumerationMutation(v29);
            }
            v33 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
            id v34 = [v33 propertyForKey:v3];
            unsigned int v35 = [v34 isEqualToString:v28];

            if (v35)
            {
              id v36 = +[NSNumber numberWithBool:0];
              [v33 setProperty:v36 forKey:v4];
            }
          }
          id v30 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v30);
      }

      [v46 addObjectsFromArray:v29];
      v18 = v40;
    }

LABEL_13:
    v2 = v50;
  }

  return v46;
}

+ (BOOL)setupIsAutomated
{
  return 0;
}

+ (id)editableSuffix
{
  return &stru_B9F70;
}

+ (id)descriptionPlaceholder
{
  return 0;
}

+ (id)helpTitle
{
  return 0;
}

+ (id)helpURL
{
  return 0;
}

+ (BOOL)addressIsEditable
{
  return 1;
}

+ (BOOL)aliasesAreEditable
{
  return 0;
}

+ (id)aliasSpecifiersForEmails:(id)a3
{
  return 0;
}

+ (id)firstSetupSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([a1 setupIsAutomated])
  {
    uint64_t v4 = [a1 emailAddressHostPart];
    id v5 = [a1 descriptionPlaceholder];
    id v6 = [a1 copyShortFormForHost:v4 descriptionPlaceholder:v5 addressIsEditable:1];
    [v3 addObjectsFromArray:v6];

    id v7 = [a1 helpTitle];
    uint64_t v8 = [a1 helpURL];
    id v9 = (void *)v8;
    if (v7 && v8)
    {
      unsigned int v10 = +[PSSpecifier emptyGroupSpecifier];
      [v10 setProperty:@"AccountLinkButtonView" forKey:PSFooterCellClassGroupKey];
      [v10 setProperty:v7 forKey:@"accountLinkButtonTitle"];
      [v10 setProperty:v9 forKey:@"accountLinkButtonURL"];
      LODWORD(v11) = 1125515264;
      uint64_t v12 = +[NSNumber numberWithFloat:v11];
      [v10 setProperty:v12 forKey:@"accountLinkButtonViewHeight"];

      [v3 addObject:v10];
    }
  }
  else
  {
    uint64_t v4 = +[NSArray arrayWithObjects:@"IMAP", @"POP", 0];
    id v5 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:"setChosenType:withSpecifier:" get:"chosenType:" detail:0 cell:9 edit:0];
    [v5 setValues:v4];
    [v3 addObject:v5];
    uint64_t v13 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v13];

    unsigned int v14 = [a1 _accountDescriptionSpecifiersForExistingAccount:0];
    [v3 addObjectsFromArray:v14];

    uint64_t v15 = [a1 _incomingSpecifiers];
    [v3 addObjectsFromArray:v15];

    id v7 = +[AccountPSOutgoingDetailController outgoingGroupSpecifiers];
    [v3 addObjectsFromArray:v7];
  }

  return v3;
}

+ (id)easySetupSpecifiersWithPlaceholderAddress:(id)a3 accountName:(id)a4
{
  id v29 = a3;
  id v30 = a4;
  if (!v29)
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v29 = [v5 localizedStringForKey:@"GENERIC_ADDRESS_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
  }
  id v31 = +[NSMutableArray array];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"FULL_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v8 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v7 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v8 setKeyboardType:0 autoCaps:1 autoCorrection:1];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v10 = [v9 localizedStringForKey:@"JOHN_APPLESEED" value:&stru_B9F70 table:@"AccountPreferences"];
  [v8 setPlaceholder:v10];

  uint64_t v11 = PSKeyNameKey;
  [v8 setProperty:MailAccountFullUserName forKey:PSKeyNameKey];
  [v31 addObject:v8];
  uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v14 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v13 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v14 setKeyboardType:7 autoCaps:0 autoCorrection:1];
  [v14 setPlaceholder:v29];
  [v14 setProperty:MailAccountEmailAddresses forKey:v11];
  uint64_t v15 = +[NSDictionary dictionaryWithObject:@"YES" forKey:@"AccountPreferenceRequired"];
  [v14 setUserInfo:v15];

  [v31 addObject:v14];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v17 = [v16 localizedStringForKey:@"PASSWORD" value:&stru_B9F70 table:@"AccountPreferences"];
  v18 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v17 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v18 setKeyboardType:1 autoCaps:0 autoCorrection:1];
  v19 = +[NSBundle bundleForClass:objc_opt_class()];
  id v20 = [v19 localizedStringForKey:@"REQUIRED" value:&stru_B9F70 table:@"AccountPreferences"];
  [v18 setPlaceholder:v20];

  [v18 setProperty:MailAccountPassword forKey:v11];
  id v21 = +[NSDictionary dictionaryWithObjectsAndKeys:@"YES", @"AccountPreferenceRequired", 0];
  [v18 setUserInfo:v21];

  *(void *)&v18[OBJC_IVAR___PSSpecifier_cellType] = 12;
  [v31 addObject:v18];
  +[NSBundle bundleForClass:objc_opt_class()];
  if (v30) {
    id v22 = {;
  }
    uint64_t v23 = [v22 localizedStringForKey:@"GENERIC_ACCOUNT_DESCRIPTION_PLACEHOLDER_FORMAT" value:&stru_B9F70 table:@"AccountPreferences"];

    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v30);
  }
  else {
    uint64_t v23 = {;
  }
    [v23 localizedStringForKey:@"GENERIC_EMAIL_ACCOUNT_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
  id v24 = };

  v25 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v26 = [v25 localizedStringForKey:@"DESCRIPTION" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v27 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v26 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v27 setKeyboardType:0 autoCaps:1 autoCorrection:0];
  [v27 setPlaceholder:v24];
  [v27 setProperty:MFMailAccountDescription forKey:v11];
  [v31 addObject:v27];

  return v31;
}

+ (id)userInfoForAccountTopLevelSpecifier
{
  return 0;
}

- (id)valueForSettingsInAccountPropertiesForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:MFMailAccountArchive])
  {
    unsigned int v5 = [(MailAccount *)self shouldArchiveByDefault];
    id v6 = &__kCFBooleanFalse;
    if (v5) {
      id v6 = &__kCFBooleanTrue;
    }
    id v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MailAccount;
    id v7 = [(MailAccount *)&v10 valueForSettingsInAccountPropertiesForKey:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)mailDataClassSwitch
{
  return 0;
}

- (BOOL)hasCustomDomain
{
  return 0;
}

- (NSString)dataclassName
{
  return 0;
}

@end