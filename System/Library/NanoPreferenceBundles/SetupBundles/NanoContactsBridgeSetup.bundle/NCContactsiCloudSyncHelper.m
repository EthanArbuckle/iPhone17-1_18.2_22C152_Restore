@interface NCContactsiCloudSyncHelper
- (BOOL)enablingPrimaryiCloudAccountRequiresMergeFromLocal;
- (BOOL)isLocalSourceEmpty;
- (BOOL)primaryiCloudAccountCardDAVEnabled;
- (NCCNContactsDataclassOwnerImplementation)implementation;
- (NCContactsiCloudSyncHelper)init;
- (void)setPrimaryiCloudAccountCardDAVEnabled;
@end

@implementation NCContactsiCloudSyncHelper

- (NCContactsiCloudSyncHelper)init
{
  v9.receiver = self;
  v9.super_class = (Class)NCContactsiCloudSyncHelper;
  v2 = [(NCContactsiCloudSyncHelper *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)ACAccountStore);
    id v4 = objc_alloc_init((Class)CNContactStore);
    v5 = +[CNACAccountProvider providerWithStore:v3];
    v6 = [[NCCNContactsDataclassOwnerContactsImplementation alloc] initWithContactStore:v4 accountProvider:v5];
    implementation = v2->_implementation;
    v2->_implementation = (NCCNContactsDataclassOwnerImplementation *)v6;
  }
  return v2;
}

- (BOOL)primaryiCloudAccountCardDAVEnabled
{
  v2 = objc_opt_new();
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 isEnabledForDataclass:ACAccountDataclassContacts];
  }
  else
  {
    v6 = NCABISH_Accounts_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_F78C(v6);
    }

    unsigned int v5 = 1;
  }
  v7 = NCABISH_Accounts_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    v10 = "-[NCContactsiCloudSyncHelper primaryiCloudAccountCardDAVEnabled]";
    __int16 v11 = 1024;
    unsigned int v12 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - return primaryiCloudAccountCardDAVEnabled: %d", (uint8_t *)&v9, 0x12u);
  }

  return v5;
}

- (void)setPrimaryiCloudAccountCardDAVEnabled
{
  id v3 = NCABISH_Accounts_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[NCContactsiCloudSyncHelper setPrimaryiCloudAccountCardDAVEnabled]";
    __int16 v21 = 1024;
    int v22 = 1;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d", buf, 0x12u);
  }

  id v4 = objc_opt_new();
  unsigned int v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
  v6 = v5;
  if (v5)
  {
    [v5 setEnabled:1 forDataclass:ACAccountDataclassContacts];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_4128;
    v17[3] = &unk_1C490;
    char v18 = 1;
    [v4 saveAccount:v6 withCompletionHandler:v17];
    v7 = [v6 childAccountsWithAccountTypeIdentifier:ACAccountTypeIdentifierCardDAV];
    v8 = objc_alloc_init(NCCNDataclassActionParameters);
    [(NCCNDataclassActionParameters *)v8 setAccount:v6];
    [(NCCNDataclassActionParameters *)v8 setChildAccounts:v7];
    int v9 = [(NCContactsiCloudSyncHelper *)self implementation];
    [(NCCNDataclassActionParameters *)v8 setImplementation:v9];

    unsigned int v10 = [(NCContactsiCloudSyncHelper *)self isLocalSourceEmpty];
    __int16 v11 = off_1C340;
    if (!v10) {
      __int16 v11 = &off_1C348;
    }
    id v12 = [objc_alloc(*v11) initWithParameters:v8];
    unsigned int v13 = [v12 perform];
    v14 = NCABISH_Accounts_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      *(_DWORD *)buf = 136447234;
      v20 = "-[NCContactsiCloudSyncHelper setPrimaryiCloudAccountCardDAVEnabled]";
      __int16 v21 = 1024;
      int v22 = 1;
      __int16 v23 = 1024;
      unsigned int v24 = v13;
      __int16 v25 = 1024;
      unsigned int v26 = v10;
      __int16 v27 = 2114;
      v28 = v15;
      id v16 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%d - didSucceed:%d (localSourceStartedEmpty:%d, actionHandler:%{public}@)", buf, 0x28u);
    }
  }
  else
  {
    v7 = NCABISH_Accounts_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_F810(v7);
    }
  }
}

- (BOOL)enablingPrimaryiCloudAccountRequiresMergeFromLocal
{
  return ![(NCContactsiCloudSyncHelper *)self isLocalSourceEmpty];
}

- (BOOL)isLocalSourceEmpty
{
  v2 = [(NCContactsiCloudSyncHelper *)self implementation];
  unsigned __int8 v3 = [v2 isLocalContainerEmpty];

  return v3;
}

- (NCCNContactsDataclassOwnerImplementation)implementation
{
  return self->_implementation;
}

- (void).cxx_destruct
{
}

@end