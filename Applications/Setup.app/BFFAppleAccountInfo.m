@interface BFFAppleAccountInfo
+ (id)_accountInfos;
+ (id)infoForAccountIdentifier:(id)a3;
+ (id)primaryAccountInfo;
- (NSString)altDSID;
- (NSString)dsid;
- (NSString)password;
- (NSString)rawPassword;
- (NSString)username;
- (void)setAltDSID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRawPassword:(id)a3;
- (void)setUsername:(id)a3;
- (void)updateWithAuthenticationResults:(id)a3;
@end

@implementation BFFAppleAccountInfo

+ (id)_accountInfos
{
  v5 = (dispatch_once_t *)&unk_100321EB8;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B48D0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321EB0;

  return v2;
}

+ (id)primaryAccountInfo
{
  id v7 = a1;
  location[1] = (id)a2;
  id v2 = +[ACAccountStore defaultStore];
  id v3 = [v2 aa_primaryAppleAccount];
  location[0] = [v3 identifier];

  id v4 = [v7 infoForAccountIdentifier:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

+ (id)infoForAccountIdentifier:(id)a3
{
  id v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  id v3 = +[ACAccountStore defaultStore];
  id v9 = [v3 accountWithIdentifier:location[0]];

  if (v9)
  {
    id v8 = [v12 _accountInfos];
    id v4 = [v8 objectForKeyedSubscript:location[0]];
    id v5 = v10;
    id v10 = v4;

    if (!v10)
    {
      id v10 = objc_alloc_init(BFFAppleAccountInfo);

      [v8 setObject:v10 forKeyedSubscript:location[0]];
    }
    objc_storeStrong(&v8, 0);
  }
  id v6 = v10;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)updateWithAuthenticationResults:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] objectForKeyedSubscript:AKAuthenticationUsernameKey];
  [(BFFAppleAccountInfo *)v10 setUsername:v3];

  id v4 = [location[0] objectForKeyedSubscript:AKAuthenticationPasswordKey];
  [(BFFAppleAccountInfo *)v10 setPassword:v4];

  id v5 = [location[0] objectForKeyedSubscript:AKAuthenticationRawPasswordKey];
  [(BFFAppleAccountInfo *)v10 setRawPassword:v5];

  id v6 = [location[0] objectForKeyedSubscript:AKAuthenticationDSIDKey];
  id v7 = [v6 stringValue];
  [(BFFAppleAccountInfo *)v10 setDsid:v7];

  id v8 = [location[0] objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  [(BFFAppleAccountInfo *)v10 setAltDSID:v8];

  objc_storeStrong(location, 0);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end