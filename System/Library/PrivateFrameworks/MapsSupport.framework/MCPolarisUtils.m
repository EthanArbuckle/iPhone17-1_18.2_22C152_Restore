@interface MCPolarisUtils
+ (id)sharedUtils;
- (BOOL)_permissiveLocationAuthWithManager:(id)a3;
- (BOOL)hasPrimaryAppleAccount;
- (BOOL)hasSufficientLocationAuth;
- (BOOL)isAddressCorrectionAdministrativelyDisabled;
- (BOOL)isManagedAppleAccount;
- (BOOL)isMultiUserMode;
- (BOOL)isUserOptedIn;
- (MCPolarisUtils)init;
- (NSString)appleAccountMapsToken;
- (NSString)appleAccountPersonId;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setHasSufficientLocationAuth:(BOOL)a3;
@end

@implementation MCPolarisUtils

+ (id)sharedUtils
{
  if (qword_100023A50 != -1) {
    dispatch_once(&qword_100023A50, &stru_10001D6D8);
  }
  v2 = (void *)qword_100023A58;

  return v2;
}

- (BOOL)_permissiveLocationAuthWithManager:(id)a3
{
  id v3 = a3;
  v4 = v3;
  BOOL v5 = v3 && (int)[v3 authorizationStatus] >= 3 && objc_msgSend(v4, "accuracyAuthorization") == 0;

  return v5;
}

- (MCPolarisUtils)init
{
  v22.receiver = self;
  v22.super_class = (Class)MCPolarisUtils;
  v2 = [(MCPolarisUtils *)&v22 init];
  if (v2)
  {
    unsigned __int8 v3 = 1;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.geocorrectiond.location", v4);
    locationQueue = v2->_locationQueue;
    v2->_locationQueue = (OS_dispatch_queue *)v5;

    v7 = v2->_locationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D4DC;
    block[3] = &unk_10001C650;
    v8 = v2;
    v21 = v8;
    dispatch_sync(v7, block);
    v8->_hasSufficientLocationAuth = [(MCPolarisUtils *)v8 _permissiveLocationAuthWithManager:v8->_locationManager];
    id v9 = objc_alloc_init((Class)ACAccountStore);
    v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
    v8->_hasPrimaryAppleAccount = v10 != 0;
    v8->_isManagedAppleAccount = objc_msgSend(v10, "aa_isManagedAppleID");
    uint64_t v11 = objc_msgSend(v10, "aa_personID");
    appleAccountPersonId = v8->_appleAccountPersonId;
    v8->_appleAccountPersonId = (NSString *)v11;

    uint64_t v13 = objc_msgSend(v10, "aa_mapsToken");
    appleAccountMapsToken = v8->_appleAccountMapsToken;
    v8->_appleAccountMapsToken = (NSString *)v13;

    v15 = +[MCProfileConnection sharedConnection];
    if ([v15 userMode] != 1) {
      unsigned __int8 v3 = [v15 isEphemeralMultiUser];
    }
    v8->_isMultiUserMode = v3;
    char BOOL = GEOConfigGetBOOL();
    v17 = +[GEOPlatform sharedPlatform];
    if ([v17 isInternalInstall])
    {
      int HasValue = _GEOConfigHasValue();

      if (HasValue) {
        char BOOL = GEOConfigGetBOOL();
      }
    }
    else
    {
    }
    v8->_isAddressCorrectionAdministrativelyDisabled = BOOL ^ 1;
    v8->_isUserOptedIn = GEOConfigGetInteger() == 2;
  }
  return v2;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  BOOL v4 = [(MCPolarisUtils *)self _permissiveLocationAuthWithManager:a3];

  [(MCPolarisUtils *)self setHasSufficientLocationAuth:v4];
}

- (BOOL)hasPrimaryAppleAccount
{
  return self->_hasPrimaryAppleAccount;
}

- (BOOL)isManagedAppleAccount
{
  return self->_isManagedAppleAccount;
}

- (NSString)appleAccountPersonId
{
  return self->_appleAccountPersonId;
}

- (NSString)appleAccountMapsToken
{
  return self->_appleAccountMapsToken;
}

- (BOOL)isMultiUserMode
{
  return self->_isMultiUserMode;
}

- (BOOL)isAddressCorrectionAdministrativelyDisabled
{
  return self->_isAddressCorrectionAdministrativelyDisabled;
}

- (BOOL)isUserOptedIn
{
  return self->_isUserOptedIn;
}

- (BOOL)hasSufficientLocationAuth
{
  return self->_hasSufficientLocationAuth;
}

- (void)setHasSufficientLocationAuth:(BOOL)a3
{
  self->_hasSufficientLocationAuth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_appleAccountPersonId, 0);

  objc_storeStrong((id *)&self->_appleAccountMapsToken, 0);
}

@end