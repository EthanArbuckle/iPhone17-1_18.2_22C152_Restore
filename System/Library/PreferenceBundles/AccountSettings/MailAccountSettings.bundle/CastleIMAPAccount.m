@interface CastleIMAPAccount
+ (BOOL)addressIsEditable;
+ (BOOL)aliasesAreEditable;
+ (BOOL)isSSLEditable;
+ (BOOL)setupIsAutomated;
+ (id)aliasSpecifiersForEmails:(id)a3;
+ (id)copyShortFormForHost:(id)a3 descriptionPlaceholder:(id)a4 addressIsEditable:(BOOL)a5;
+ (id)descriptionPlaceholder;
+ (id)editableSuffix;
+ (id)helpTitle;
+ (id)helpURL;
+ (id)log;
+ (id)userInfoForAccountTopLevelSpecifier;
+ (int)advancedSpecifiersOptions;
- (BOOL)hasCustomDomain;
- (BOOL)mailDataClassSwitch;
- (id)dataclassName;
@end

@implementation CastleIMAPAccount

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CE60;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7340 != -1) {
    dispatch_once(&qword_D7340, block);
  }
  v2 = (void *)qword_D7338;

  return v2;
}

- (BOOL)mailDataClassSwitch
{
  return _os_feature_enabled_impl() ^ 1;
}

- (BOOL)hasCustomDomain
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(CastleIMAPAccount *)self parentAccount];
    if (v3)
    {
      v4 = [(CastleIMAPAccount *)self parentAccount];
      v5 = [v4 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
      v6 = [v5 objectForKeyedSubscript:@"customDomainEnabled"];
      unsigned int v7 = [v6 BOOLValue];
    }
    else
    {
      unsigned int v7 = 0;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  v8 = +[CastleIMAPAccount log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(CastleIMAPAccount *)self parentAccount];
    int v11 = 134218240;
    v12 = v9;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Parent account: %p, Custom Domain enabled: %{BOOL}d", (uint8_t *)&v11, 0x12u);
  }
  return v7;
}

- (id)dataclassName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ICLOUD_MAIL_LABEL" value:&stru_B9F70 table:@"AccountPreferences"];

  return v3;
}

+ (BOOL)setupIsAutomated
{
  return 1;
}

+ (id)editableSuffix
{
  return @"@icloud.com";
}

+ (id)descriptionPlaceholder
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"CASTLE_ACCOUNT_DESCRIPTION_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];

  return v3;
}

+ (id)helpTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"CASTLE_ACCOUNT_HELP_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  return v3;
}

+ (id)helpURL
{
  if (+[UIDevice mf_isPad]) {
    CFStringRef v2 = @"http://www.me.com/learn_more";
  }
  else {
    CFStringRef v2 = @"http://www.me.com/iphone_learn_more";
  }

  return +[NSURL URLWithString:v2];
}

+ (BOOL)addressIsEditable
{
  return 0;
}

+ (BOOL)aliasesAreEditable
{
  return 1;
}

+ (BOOL)isSSLEditable
{
  return 0;
}

+ (int)advancedSpecifiersOptions
{
  return 48;
}

+ (id)userInfoForAccountTopLevelSpecifier
{
  v3 = NSStringFromClass((Class)a1);
  v4 = +[NSDictionary dictionaryWithObjectsAndKeys:a1, @"class", v3, @"chosenType", 0];

  return v4;
}

+ (id)aliasSpecifiersForEmails:(id)a3
{
  id v3 = a3;
  id v38 = +[NSMutableArray array];
  v4 = (char *)[v3 count];
  v5 = [v3 allKeys];
  v6 = [v5 sortedArrayUsingComparator:&stru_B8D90];

  v39 = objc_msgSend(v6, "ef_map:", &stru_B8DD0);
  id v7 = objc_alloc_init((Class)MFAddressPickerReformatter);
  [v7 setAddresses:v39];
  [v7 setAttributesDisabled:1];
  +[UIFont labelFontSize];
  objc_msgSend(v7, "setFontSize:");
  unsigned int v8 = +[UIDevice mf_isPad];
  double v9 = 280.0;
  if (v8) {
    double v9 = 460.0;
  }
  [v7 setMaximumWidth:v9];
  id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v12 = [v7 reformattedAddressStringAtIndex:i];
      [v10 addObject:v12];
    }
  }
  unsigned int v13 = +[UIDevice mf_isPad];
  double v14 = 190.0;
  if (v13) {
    double v14 = 370.0;
  }
  [v7 setMaximumWidth:v14];
  id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
  if (v4)
  {
    for (j = 0; j != v4; ++j)
    {
      v17 = [v7 reformattedAddressStringAtIndex:j];
      [v15 addObject:v17];
    }
  }
  v37 = v15;
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
  v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:0 set:"_setDefaultAlias:forSpecifier:" get:"_defaultAlias" detail:objc_opt_class() cell:2 edit:0];

  [v20 setValues:v39 titles:v10];
  [v20 setProperty:&__kCFBooleanTrue forKey:@"LeftAlignLinkListDetailText"];
  [v38 addObject:v20];
  v35 = v20;
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v34 = v3;
  v22 = [v21 localizedStringForKey:@"ALLOW_SENDING_FROM" value:&stru_B9F70 table:@"AccountPreferences"];
  v36 = +[PSSpecifier groupSpecifierWithName:v22];

  v23 = +[NSBundle bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"ALIAS_SWITCH_EXPLANATION" value:&stru_B9F70 table:@"AccountPreferences"];
  [v36 setProperty:v24 forKey:PSFooterTextGroupKey];

  [v38 addObject:v36];
  if (v4)
  {
    v25 = 0;
    uint64_t v26 = PSKeyNameKey;
    uint64_t v27 = MFAliasPreferenceNameKey;
    do
    {
      v28 = [v37 objectAtIndex:v25];
      v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:0 set:"_enableAlias:forSpecifier:" get:"_isAliasEnabledForSpecifier:" detail:0 cell:6 edit:0];

      v30 = [v39 objectAtIndex:v25];
      [v29 setProperty:v30 forKey:v26];

      v31 = [v6 objectAtIndex:v25];
      v32 = +[NSDictionary dictionaryWithObject:v31 forKey:v27];
      [v29 setUserInfo:v32];

      [v38 addObject:v29];
      ++v25;
    }
    while (v4 != v25);
  }

  return v38;
}

+ (id)copyShortFormForHost:(id)a3 descriptionPlaceholder:(id)a4 addressIsEditable:(BOOL)a5
{
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v8 = [v7 localizedStringForKey:@"FULL_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  double v9 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v8 target:0 set:"setAccountProperty:withSpecifier:" get:"accountPropertyWithSpecifier:" detail:0 cell:8 edit:0];

  [v9 setKeyboardType:0 autoCaps:1 autoCorrection:1];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  int v11 = [v10 localizedStringForKey:@"JOHN_APPLESEED" value:&stru_B9F70 table:@"AccountPreferences"];
  [v9 setPlaceholder:v11];

  [v9 setProperty:@"myFullName" forKey:PSBestGuesserKey];
  uint64_t v12 = PSKeyNameKey;
  [v9 setProperty:MailAccountFullUserName forKey:PSKeyNameKey];
  [v6 addObject:v9];

  unsigned int v13 = +[NSBundle bundleForClass:objc_opt_class()];
  double v14 = [v13 localizedStringForKey:@"EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
  id v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:"_setDefaultAlias:forSpecifier:" get:"_getDefaultAlias:" detail:objc_opt_class() cell:2 edit:0];

  [v15 setProperty:MailAccountEmailAddresses forKey:v12];
  id v16 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  [v16 setObject:@"YES" forKey:@"AccountPreferenceRequired"];
  [v16 setObject:kCFBooleanTrue forKey:@"disableForManagedAccounts"];
  v17 = [a1 editableSuffix];
  id v18 = [v17 length];

  if (v18)
  {
    v19 = [a1 editableSuffix];
    [v16 setObject:v19 forKey:@"UserEditableSuffix"];
  }
  [v15 setUserInfo:v16];
  [v6 addObject:v15];

  return v6;
}

@end