@interface AAUIOtherSpecifierProvider
- (AAUIOtherSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUISpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (id)_specifierForLookMeUpByEmail;
- (id)_specifiersForServerProvidedFooter;
- (id)account;
- (void)_footerButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUIOtherSpecifierProvider

- (AAUIOtherSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIOtherSpecifierProvider;
  v6 = [(AAUIOtherSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (specifiers)
  {
    v3 = specifiers;
  }
  else
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if ((+[AADeviceInfo isMultiUserMode] & 1) == 0)
    {
      v6 = +[PSSpecifier groupSpecifierWithID:@"ADVANCED_GROUP"];
      v7 = [(AAUIOtherSpecifierProvider *)self _specifierForLookMeUpByEmail];
      if (v7)
      {
        [v5 addObject:v6];
        [v5 addObject:v7];
      }
      v8 = [(AAUIOtherSpecifierProvider *)self _specifiersForServerProvidedFooter];
      [v5 addObjectsFromArray:v8];
    }
    objc_super v9 = (NSArray *)[v5 copy];
    v10 = self->_specifiers;
    self->_specifiers = v9;

    v3 = self->_specifiers;
  }

  return v3;
}

- (id)_specifierForLookMeUpByEmail
{
  v3 = [(AAUIOtherSpecifierProvider *)self account];
  unsigned int v4 = [v3 isProvisionedForDataclass:ACAccountDataclassCKDatabaseService];

  if (v4)
  {
    id v5 = +[NSBundle aaui_loadBundle:@"CloudKitSettings.bundle" atPath:@"System/Library/PreferenceBundles/AccountSettings"];
    Class v6 = NSClassFromString(@"CKSettingsController");
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"CLOUD_DRIVE_PRIVACY_INFO" value:&stru_76890 table:@"Localizable"];
    objc_super v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:v6 cell:2 edit:0];

    [v9 setIdentifier:@"CLOUD_DRIVE_PRIVACY_INFO"];
    v10 = [(AAUIOtherSpecifierProvider *)self account];
    v11 = objc_msgSend(v10, "aa_cloudKitAccount");

    if (v11)
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v15 = objc_loadWeakRetained((id *)p_delegate);
        v16 = [v15 specifier];
        v17 = [v16 userInfo];
        id v18 = [v17 mutableCopy];

        [v18 setObject:v11 forKeyedSubscript:ACUIAccountKey];
        id v19 = [v18 copy];
        [v9 setUserInfo:v19];
      }
    }
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)_specifiersForServerProvidedFooter
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(AAUIOtherSpecifierProvider *)self account];
  id v5 = objc_msgSend(v4, "aa_accountFooterText");
  id v6 = [v5 length];

  if (v6)
  {
    v7 = +[PSSpecifier emptyGroupSpecifier];
    v8 = [(AAUIOtherSpecifierProvider *)self account];
    objc_super v9 = objc_msgSend(v8, "aa_accountFooterText");
    [v7 setProperty:v9 forKey:PSFooterTextGroupKey];

    [v7 setProperty:&off_79DA0 forKey:PSFooterAlignmentGroupKey];
    [v3 addObject:v7];
  }
  v10 = [(AAUIOtherSpecifierProvider *)self account];
  v11 = objc_msgSend(v10, "aa_accountFooterButton");

  if (v11)
  {
    v12 = [(AAUIOtherSpecifierProvider *)self account];
    v13 = objc_msgSend(v12, "aa_accountFooterButton");
    v14 = [v13 objectForKey:@"title"];

    id v15 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v15];

    v16 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:13 edit:0];
    *(void *)&v16[OBJC_IVAR___PSSpecifier_action] = "_footerButtonTapped:";
    [v3 addObject:v16];
  }

  return v3;
}

- (void)_footerButtonTapped:(id)a3
{
  id v3 = [(AAUIOtherSpecifierProvider *)self account];
  unsigned int v4 = objc_msgSend(v3, "aa_accountFooterButton");
  id v6 = [v4 objectForKey:@"url"];

  id v5 = +[NSURL URLWithString:v6];
  [UIApp openURL:v5 options:&__NSDictionary0__struct completionHandler:0];
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end