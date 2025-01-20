@interface AAUIViewServiceURLHandler
- (BOOL)handleUniversalLinkInUserActivity:(id)a3;
- (id)_buildURLInfoFromActivity:(id)a3;
- (id)destroySessionBlock;
- (void)_handleMailImportURL:(id)a3;
- (void)_openCustomDomainManageURL;
- (void)_openCustomDomainURL:(id)a3 domainState:(id)a4;
- (void)_openPrivateEmailManageURL;
- (void)_presentCustodianInvitationWithUUID:(id)a3 fallBackURL:(id)a4;
- (void)_presentInheritanceInvitationWithBeneficiaryID:(id)a3 fallBackURL:(id)a4;
- (void)setDestroySessionBlock:(id)a3;
@end

@implementation AAUIViewServiceURLHandler

- (id)_buildURLInfoFromActivity:(id)a3
{
  id v3 = a3;
  v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 activityType];
    int v12 = 136380931;
    v13 = "-[AAUIViewServiceURLHandler _buildURLInfoFromActivity:]";
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{private}s handling user activity type: %@", (uint8_t *)&v12, 0x16u);
  }
  v6 = [v3 activityType];
  unsigned int v7 = [v6 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v7)
  {
    v8 = [v3 webpageURL];
    if (v8)
    {
      id v9 = [objc_alloc((Class)NSURLComponents) initWithURL:v8 resolvingAgainstBaseURL:1];
      if (v9)
      {
        v10 = +[AAUniversalLinkHelper infoForComponents:v9];
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)handleUniversalLinkInUserActivity:(id)a3
{
  id v4 = a3;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000034F8;
  v21[3] = &unk_10000C348;
  v21[4] = self;
  v5 = objc_retainBlock(v21);
  v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v4 activityType];
    *(_DWORD *)buf = 136380931;
    v23 = "-[AAUIViewServiceURLHandler handleUniversalLinkInUserActivity:]";
    __int16 v24 = 2112;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{private}s handling user activity type: %@", buf, 0x16u);
  }
  v8 = [(AAUIViewServiceURLHandler *)self _buildURLInfoFromActivity:v4];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 objectForKeyedSubscript:AAURLKeyFlowType];
    v11 = v10;
    if (!v10)
    {
      __int16 v14 = _AAUILogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100006E24();
      }

      ((void (*)(void *))v5[2])(v5);
      BOOL v13 = 0;
      goto LABEL_25;
    }
    if ([v10 isEqualToString:AAURLKeyFlowTypePrivateEmailManage])
    {
      [(AAUIViewServiceURLHandler *)self _openPrivateEmailManageURL];
LABEL_24:
      ((void (*)(void *))v5[2])(v5);
      BOOL v13 = 1;
LABEL_25:

      goto LABEL_26;
    }
    if ([v11 isEqualToString:AAURLKeyFlowTypeCustomDomain])
    {
      v15 = [v9 objectForKeyedSubscript:AAURLKeyID];
      v16 = [v9 objectForKeyedSubscript:AAURLKeyCustomDomainState];
      if (v15) {
        [(AAUIViewServiceURLHandler *)self _openCustomDomainURL:v15 domainState:v16];
      }
      else {
        [(AAUIViewServiceURLHandler *)self _openCustomDomainManageURL];
      }

      goto LABEL_23;
    }
    if ([v11 isEqualToString:AAURLKeyFlowTypeMailImport])
    {
      v15 = [v9 objectForKeyedSubscript:AAURLKeyState];
      [(AAUIViewServiceURLHandler *)self _handleMailImportURL:v15];
LABEL_23:

      goto LABEL_24;
    }
    v17 = [v9 objectForKeyedSubscript:AAURLKeyID];
    if (!v17)
    {
      ((void (*)(void *))v5[2])(v5);
      BOOL v13 = 0;
LABEL_33:

      goto LABEL_25;
    }
    id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:v17];
    if ([v11 isEqualToString:AAURLKeyFlowTypeCustodian])
    {
      v19 = [v4 webpageURL];
      [(AAUIViewServiceURLHandler *)self _presentCustodianInvitationWithUUID:v18 fallBackURL:v19];
    }
    else
    {
      if (![v11 isEqualToString:AAURLKeyFlowTypeBeneficiary])
      {
        BOOL v13 = 0;
        goto LABEL_32;
      }
      v19 = [v4 webpageURL];
      [(AAUIViewServiceURLHandler *)self _presentInheritanceInvitationWithBeneficiaryID:v18 fallBackURL:v19];
    }

    BOOL v13 = 1;
LABEL_32:

    goto LABEL_33;
  }
  int v12 = _AAUILogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100006DE4();
  }

  ((void (*)(void *))v5[2])(v5);
  BOOL v13 = 0;
LABEL_26:

  return v13;
}

- (void)_openPrivateEmailManageURL
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/PRIVATE_EMAIL_MANAGE"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)_openCustomDomainManageURL
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail/BYOD_SETTING_SPECIFIER_ID"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)_openCustomDomainURL:(id)a3 domainState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSURLComponents) initWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail/BYOD_SETTING_SPECIFIER_ID"];
  if (v7)
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"domain" value:v5];
    [v8 addObject:v9];

    if (v6)
    {
      id v10 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"domainState" value:v6];
      [v8 addObject:v10];
    }
    [v7 setQueryItems:v8];
    v11 = [v7 string];
    int v12 = [v11 stringByReplacingOccurrencesOfString:@"?" withString:@"&"];

    BOOL v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "url string for custom email domain %@", buf, 0xCu);
    }

    id v14 = [objc_alloc((Class)NSURL) initWithString:v12];
    v15 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v17 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    id v18 = &__kCFBooleanTrue;
    v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v15 openSensitiveURL:v14 withOptions:v16];
  }
  else
  {
    v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "malformed custom domain URL provided to NSURLComponents. byodUrlComponent is nil", buf, 2u);
    }
  }
}

- (void)_presentCustodianInvitationWithUUID:(id)a3 fallBackURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)AACustodianController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003954;
  v11[3] = &unk_10000C370;
  id v12 = v7;
  BOOL v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 displayInvitationUIWithUUID:v9 completion:v11];
}

- (void)_presentInheritanceInvitationWithBeneficiaryID:(id)a3 fallBackURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to present Inheritance Invitation UI...", buf, 2u);
  }

  id v9 = objc_alloc_init((Class)AAInheritanceController);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003BCC;
  v12[3] = &unk_10000C370;
  id v13 = v7;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 presentInheritanceInvitationUIWithBeneficiaryID:v10 completion:v12];
}

- (void)_handleMailImportURL:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSURLComponents) initWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail/MAIL_IMPORT"];
  id v5 = v4;
  if (v3 && v4)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"state" value:v3];
    [v6 addObject:v7];

    [v5 setQueryItems:v6];
    id v8 = [v5 string];
    id v9 = [v8 stringByReplacingOccurrencesOfString:@"?" withString:@"&"];

    id v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "url string for Unified Settings - mail import %@", (uint8_t *)&v13, 0xCu);
    }

    id v11 = [objc_alloc((Class)NSURL) initWithString:v9];
    id v12 = +[LSApplicationWorkspace defaultWorkspace];
    [v12 openSensitiveURL:v11 withOptions:0];
  }
  else
  {
    +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail/MAIL_IMPORT"];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = +[LSApplicationWorkspace defaultWorkspace];
    [v9 openSensitiveURL:v6 withOptions:0];
  }
}

- (id)destroySessionBlock
{
  return self->_destroySessionBlock;
}

- (void)setDestroySessionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end