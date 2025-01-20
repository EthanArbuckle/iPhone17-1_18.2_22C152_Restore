@interface ICloudMailAccountController
+ (id)log;
- (ACAccount)appleAccount;
- (BOOL)_hasCustomDomain;
- (BOOL)_hasIcloudMailConfigured;
- (BOOL)_mailDataclassChangeForSpecifier:(id)a3;
- (id)_byodSpecifier;
- (id)_iCloudMailSettingSpecifiers;
- (id)_tobleroneMailSwitchSpecifier;
- (id)account;
- (id)specifiers;
- (void)_iCloudMailSettingSpecifierTapped:(id)a3;
- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)icloudMailCreationNeedsViewUpdate:(id)a3 withAccount:(id)a4;
- (void)setAppleAccount:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICloudMailAccountController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6EE90;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7520 != -1) {
    dispatch_once(&qword_D7520, block);
  }
  v2 = (void *)qword_D7518;

  return v2;
}

- (id)account
{
  return self->_appleAccount;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)ICloudMailAccountController;
  [(ICloudMailAccountController *)&v2 viewDidLoad];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    userInfoDictionary = self->_userInfoDictionary;
    if (!userInfoDictionary)
    {
      v7 = [*(id *)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
      v8 = self->_userInfoDictionary;
      self->_userInfoDictionary = v7;

      [(NSMutableDictionary *)self->_userInfoDictionary setValue:&__kCFBooleanTrue forKey:@"hideMailDataclass"];
      [(NSMutableDictionary *)self->_userInfoDictionary setValue:&__kCFBooleanTrue forKey:@"MailDetailViewWithBackKey"];
      userInfoDictionary = self->_userInfoDictionary;
    }
    v9 = [(NSMutableDictionary *)userInfoDictionary objectForKey:ACUIAccountKey];
    v10 = [v9 parentAccount];
    appleAccount = self->_appleAccount;
    self->_appleAccount = v10;

    if (!self->_appleAccount) {
      objc_storeStrong((id *)&self->_appleAccount, v9);
    }
    if (!self->_accountManager)
    {
      v12 = [*(id *)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"icloudAccountManager"];
      accountManager = self->_accountManager;
      self->_accountManager = v12;
    }
    v14 = [(ICloudMailAccountController *)self _tobleroneMailSwitchSpecifier];
    [v5 addObjectsFromArray:v14];

    if ([(ICloudMailAccountController *)self _hasIcloudMailConfigured])
    {
      if ([(ICloudMailAccountController *)self _hasCustomDomain])
      {
        v15 = [(ICloudMailAccountController *)self _byodSpecifier];
        [v5 addObjectsFromArray:v15];
      }
      v16 = [(ICloudMailAccountController *)self _iCloudMailSettingSpecifiers];
      [v5 addObjectsFromArray:v16];
    }
    v17 = *(void **)&self->ACUIDataclassConfigurationViewController_opaque[v3];
    *(void *)&self->ACUIDataclassConfigurationViewController_opaque[v3] = v5;

    v4 = *(void **)&self->ACUIDataclassConfigurationViewController_opaque[v3];
  }

  return v4;
}

- (id)_iCloudMailSettingSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v4];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"ICLOUD_MAIL_SETTINGS_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:1 edit:0];

  [v7 setControllerLoadAction:"_iCloudMailSettingSpecifierTapped:"];
  [v7 setUserInfo:self->_userInfoDictionary];
  [v3 addObject:v7];
  id v8 = [v3 copy];

  return v8;
}

- (id)_byodSpecifier
{
  byodSpecifierProviderAdapter = self->_byodSpecifierProviderAdapter;
  if (!byodSpecifierProviderAdapter)
  {
    v4 = [[BYODSpecifierProviderAdapter alloc] initWithAccountManager:self->_accountManager presenter:self];
    id v5 = self->_byodSpecifierProviderAdapter;
    self->_byodSpecifierProviderAdapter = v4;

    byodSpecifierProviderAdapter = self->_byodSpecifierProviderAdapter;
  }

  return [(BYODSpecifierProviderAdapter *)byodSpecifierProviderAdapter specifiers];
}

- (id)_tobleroneMailSwitchSpecifier
{
  id v27 = objc_alloc_init((Class)NSMutableArray);
  v25 = +[PSSpecifier emptyGroupSpecifier];
  [v27 addObject:v25];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = +[UIImage imageNamed:@"mailSettingsIcon.png" inBundle:v3];

  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"MAIL_CARD_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"MAIL_CARD_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v6 setProperty:v8 forKey:PSTitleKey];

  id v9 = objc_alloc_init((Class)AADeviceInfo);
  v10 = [v9 deviceClass];
  v11 = [v10 uppercaseString];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [@"MAIL_CARD_SUBTEXT_" stringByAppendingString:v11];
  v14 = [v12 localizedStringForKey:v13 value:&stru_B9F70 table:@"AccountPreferences"];

  [v6 setProperty:v14 forKey:PSTableCellSubtitleTextKey];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"MAIL_DATACLASS_SWITCH_KB_LINK" value:&stru_B9F70 table:@"AccountPreferences"];
  [v6 setProperty:v16 forKey:@"AAUIDataclassAttributedLink"];

  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"LEARN_MORE_ELLIPSIS" value:&stru_B9F70 table:@"AccountPreferences"];
  [v6 setProperty:v18 forKey:@"AAUIDataclassAttributedLinkText"];

  [v6 setProperty:&off_C03D8 forKey:PSAlignmentKey];
  uint64_t v19 = PSIconImageKey;
  [v6 setProperty:v26 forKey:PSIconImageKey];
  [v27 addObject:v6];
  v20 = [(ICloudMailAccountController *)self specifierForDataclass:ACAccountDataclassMail];
  [v20 removePropertyForKey:v19];
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [@"MAIL_DATACLASS_SWITCH_TEXT_" stringByAppendingString:v11];
  v23 = [v21 localizedStringForKey:v22 value:&stru_B9F70 table:@"AccountPreferences"];

  [v20 setName:v23];
  [v27 addObject:v20];

  return v27;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICloudMailAccountController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "handleURL with dicttionary: %@.", buf, 0xCu);
  }

  id v9 = [v6 objectForKey:@"domain"];
  if ([(ICloudMailAccountController *)self _hasIcloudMailConfigured])
  {
    if (!v9)
    {
      v23.receiver = self;
      v23.super_class = (Class)ICloudMailAccountController;
      [(ICloudMailAccountController *)&v23 handleURL:v6 withCompletion:v7];
      goto LABEL_10;
    }
    v10 = [v6 objectForKey:@"domainState"];
    byodSpecifierProviderAdapter = self->_byodSpecifierProviderAdapter;
    if (!byodSpecifierProviderAdapter)
    {
      v12 = [[BYODSpecifierProviderAdapter alloc] initWithAccountManager:self->_accountManager presenter:self];
      p_byodSpecifierProviderAdapter = &self->_byodSpecifierProviderAdapter;
      v14 = *p_byodSpecifierProviderAdapter;
      *p_byodSpecifierProviderAdapter = v12;

      byodSpecifierProviderAdapter = *p_byodSpecifierProviderAdapter;
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_6FD10;
    v24[3] = &unk_B8EB0;
    id v25 = v7;
    [(BYODSpecifierProviderAdapter *)byodSpecifierProviderAdapter loadDomain:v9 withState:v10 completion:v24];
    v15 = v25;
  }
  else
  {
    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"BYOD_MEMBER_MAIL_CONFIGURE_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v9);

    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"BYOD_MEMBER_MAIL_CONFIGURE_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    v15 = +[UIAlertController alertControllerWithTitle:v19 message:v10 preferredStyle:1];

    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
    v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:0];

    [v15 addAction:v22];
    [(ICloudMailAccountController *)self presentViewController:v15 animated:1 completion:0];
  }
LABEL_10:
}

- (void)_iCloudMailSettingSpecifierTapped:(id)a3
{
  id v6 = a3;
  id v4 = objc_alloc_init((Class)PSSetupController);
  id v5 = objc_alloc_init(AccountPSDetailController);
  [(AccountPSDetailController *)v5 setSpecifier:v6];
  [(AccountPSDetailController *)v5 setParentController:v4];
  [(AccountPSDetailController *)v5 setRootController:v4];
  [v4 showController:v5];
  [v4 setParentController:self];
  [v4 setSpecifier:v6];
  [v4 setModalPresentationStyle:2];
  [(ICloudMailAccountController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 BOOLValue]
    || [(ICloudMailAccountController *)self _mailDataclassChangeForSpecifier:v7])
  {
    id v8 = +[ICloudMailAccountController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v11 = [v6 BOOLValue];
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Mail Dataclass Switch Changed To %{BOOL}d", buf, 8u);
    }

    v9.receiver = self;
    v9.super_class = (Class)ICloudMailAccountController;
    [(ICloudMailAccountController *)&v9 dataclassSwitchStateDidChange:v6 withSpecifier:v7];
  }
}

- (BOOL)_mailDataclassChangeForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "acui_dataclass");
  if (([v5 isEqualToString:ACAccountDataclassMail] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v6 = [(ICloudMailAccountController *)self appleAccount];
  unsigned int v7 = objc_msgSend(v6, "aa_needsEmailConfiguration");

  if (!v7)
  {
LABEL_7:
    BOOL v14 = 1;
    goto LABEL_8;
  }
  icloudMailCreator = self->_icloudMailCreator;
  if (!icloudMailCreator)
  {
    objc_super v9 = [ICloudMailCreator alloc];
    appleAccount = self->_appleAccount;
    unsigned int v11 = [(ACAccount *)appleAccount accountStore];
    v12 = [(ICloudMailCreator *)v9 initWithViewController:self appleAccount:appleAccount accountStore:v11];
    v13 = self->_icloudMailCreator;
    self->_icloudMailCreator = v12;

    [(ICloudMailCreator *)self->_icloudMailCreator setDelegate:self];
    icloudMailCreator = self->_icloudMailCreator;
  }
  [(ICloudMailCreator *)icloudMailCreator showAlertForMailSetup];
  BOOL v14 = 0;
LABEL_8:

  return v14;
}

- (BOOL)_hasCustomDomain
{
  if (_os_feature_enabled_impl() && (appleAccount = self->_appleAccount) != 0)
  {
    id v4 = [(ACAccount *)appleAccount propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
    id v5 = [v4 objectForKeyedSubscript:@"customDomainEnabled"];
    unsigned int v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned int v6 = 0;
  }
  unsigned int v7 = +[ICloudMailAccountController log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = self->_appleAccount;
    int v10 = 134218240;
    unsigned int v11 = v8;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Parent account: %p, Custom Domain enabled: %{BOOL}d", (uint8_t *)&v10, 0x12u);
  }

  return v6;
}

- (BOOL)_hasIcloudMailConfigured
{
  if (![(ACAccount *)self->_appleAccount isProvisionedForDataclass:ACAccountDataclassMail])return 0; {
  id v3 = [(ACAccount *)self->_appleAccount aa_childMailAccount];
  }
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)icloudMailCreationNeedsViewUpdate:(id)a3 withAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    id v8 = +[ICloudMailAccountController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Updating iCloud mail specifiers", buf, 2u);
    }

    objc_super v9 = objc_msgSend(v7, "aa_childMailAccount");
    if (v9) {
      [(NSMutableDictionary *)self->_userInfoDictionary setValue:v9 forKey:ACUIAccountKey];
    }
    [(ICloudMailAccountController *)self reloadSpecifiers];
  }
  else
  {
    objc_super v9 = +[ICloudMailAccountController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "No self. cannot update view for mail account create", v10, 2u);
    }
  }
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_byodSpecifierProviderAdapter, 0);
  objc_storeStrong((id *)&self->_userInfoDictionary, 0);
  objc_storeStrong((id *)&self->_icloudMailCreator, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end