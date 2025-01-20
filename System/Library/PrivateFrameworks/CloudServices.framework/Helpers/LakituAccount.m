@interface LakituAccount
+ (id)personaAwareAccountWithDSID:(id)a3;
- (ACAccount)account;
- (LakituAccount)initWithACAccount:(id)a3;
- (NSString)altDSID;
- (NSString)authToken;
- (NSString)dsid;
- (NSString)escrowURL;
- (NSString)iCloudEnv;
- (void)setAccount:(id)a3;
@end

@implementation LakituAccount

+ (id)personaAwareAccountWithDSID:(id)a3
{
  id v4 = a3;
  if (!&kAAProtocoliCloudAccountKey)
  {
    v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AppleAccount.framework is not available", buf, 2u);
    }
    id v6 = 0;
    goto LABEL_34;
  }
  if (sub_1000432B0())
  {
    v7 = +[ACAccountStore defaultStore];
    v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
    v5 = v8;
    if (v4
      && ([v8 aa_personID],
          v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v4 isEqualToString:v9],
          v9,
          !v10))
    {
      v23 = CloudServicesLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        id v36 = v4;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "using non-primary DSID: %{private}@", buf, 0xCu);
      }

      v11 = objc_msgSend(v7, "aa_appleAccountWithPersonID:", v4);
    }
    else
    {
      v11 = v5;
    }
    v22 = v11;
    if (!v11)
    {
      v24 = CloudServicesLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "unable to determine AppleAccount", buf, 2u);
      }
    }
LABEL_31:

    v5 = v22;
    goto LABEL_32;
  }
  v12 = +[UMUserManager sharedManager];
  v13 = [v12 currentPersona];

  if (([v13 isDataSeparatedPersona] & 1) == 0)
  {

    v7 = 0;
    goto LABEL_21;
  }
  v7 = [v13 userPersonaUniqueString];

  if (!v7)
  {
LABEL_21:
    v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "unable to determine AppleAccount for current persona", buf, 2u);
    }
LABEL_23:
    v22 = 0;
    goto LABEL_31;
  }
  +[ACAccountStore defaultStore];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v29 = long long v33 = 0u;
  v14 = objc_msgSend(v29, "aa_appleAccounts");
  id v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v15)
  {
LABEL_19:

    goto LABEL_21;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v31;
LABEL_13:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v31 != v17) {
      objc_enumerationMutation(v14);
    }
    v19 = *(void **)(*((void *)&v30 + 1) + 8 * v18);
    v20 = [v19 personaIdentifier];
    unsigned __int8 v21 = [v7 isEqualToString:v20];

    if (v21) {
      break;
    }
    if (v16 == (id)++v18)
    {
      id v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v16) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }
  v5 = v19;

  if (!v5) {
    goto LABEL_21;
  }
  if (v4)
  {
    v26 = [v5 aa_personID];
    unsigned __int8 v27 = [v4 isEqualToString:v26];

    if ((v27 & 1) == 0)
    {
      v28 = CloudServicesLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        id v36 = v4;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "specified DSID %{private}@ does not match current persona", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
LABEL_32:

  if (v5)
  {
    id v6 = [objc_alloc((Class)a1) initWithACAccount:v5];
LABEL_34:

    goto LABEL_35;
  }
  id v6 = 0;
LABEL_35:

  return v6;
}

- (LakituAccount)initWithACAccount:(id)a3
{
  id v4 = a3;
  if (&kAAProtocoliCloudAccountKey)
  {
    v10.receiver = self;
    v10.super_class = (Class)LakituAccount;
    v7 = [(LakituAccount *)&v10 init];
    v8 = v7;
    if (v7) {
      [(LakituAccount *)v7 setAccount:v4];
    }
    self = v8;
    id v6 = self;
  }
  else
  {
    v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AppleAccount.framework is not available", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (NSString)dsid
{
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getting dsid", (uint8_t *)&v9, 2u);
  }

  v5 = [(LakituAccount *)self account];
  if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
  {
    id v6 = objc_msgSend(v5, "aa_personID");
    v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      objc_super v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "got dsid: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004E548();
    }
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)altDSID
{
  id v4 = [(LakituAccount *)self account];
  v5 = objc_msgSend(v4, "aa_altDSID");

  return (NSString *)v5;
}

- (NSString)authToken
{
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getting auth token", buf, 2u);
  }

  v5 = [(LakituAccount *)self account];
  if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
  {
    id v6 = +[ACAccountStore defaultStore];
    id v12 = 0;
    v7 = [v6 credentialForAccount:v5 error:&v12];
    v8 = v12;
    if (v7)
    {
      int v9 = [v7 token];
      objc_super v10 = CloudServicesLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "got auth token", buf, 2u);
      }
    }
    else
    {
      objc_super v10 = CloudServicesLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error accessing auth token: %@", buf, 0xCu);
      }
      int v9 = 0;
    }
  }
  else
  {
    v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004E548();
    }
    int v9 = 0;
  }

  return (NSString *)v9;
}

- (NSString)escrowURL
{
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getting escrowURL", buf, 2u);
  }

  v5 = [(LakituAccount *)self account];
  if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
  {
    id v6 = [v5 propertiesForDataclass:kAccountDataclassKeychainSync];
    v7 = [v6 objectForKey:@"escrowProxyUrl"];

    v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "got escrowURL", v10, 2u);
    }
  }
  else
  {
    v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004E548();
    }
    v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)iCloudEnv
{
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getting iCloud env", buf, 2u);
  }

  v5 = [(LakituAccount *)self account];
  if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
  {
    id v6 = [v5 dataclassProperties];
    v7 = [v6 objectForKeyedSubscript:kAAProtocoliCloudAccountKey];
    v8 = [v7 objectForKeyedSubscript:@"iCloudEnv"];

    int v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "got iCloud env", v11, 2u);
    }
  }
  else
  {
    int v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004E548();
    }
    v8 = 0;
  }

  return (NSString *)v8;
}

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end