@interface CNManagedProfileConnection
+ (id)sharedConnection;
- (BOOL)isOpenInRestrictionInEffect;
- (BOOL)mayShowLocalContactsAccountsForBundleID:(id)a3 sourceAccountManagement:(int64_t)a4;
- (BOOL)mayShowLocalContactsAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int64_t)a4;
- (CNManagedProfileConnection)init;
- (CNManagedProfileConnection)initWithProfileConnection:(id)a3;
- (MCProfileConnection)profileConnection;
- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int64_t)a5;
- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int64_t)a5;
- (void)setProfileConnection:(id)a3;
@end

@implementation CNManagedProfileConnection

- (BOOL)isOpenInRestrictionInEffect
{
  v2 = [(CNManagedProfileConnection *)self profileConnection];
  char v3 = [v2 isOpenInRestrictionInEffect];

  return v3;
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

+ (id)sharedConnection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CNManagedProfileConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_cn_once_token_2 != -1) {
    dispatch_once(&sharedConnection_cn_once_token_2, block);
  }
  v2 = (void *)sharedConnection_cn_once_object_2;

  return v2;
}

uint64_t __46__CNManagedProfileConnection_sharedConnection__block_invoke(uint64_t a1)
{
  sharedConnection_cn_once_object_2 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (CNManagedProfileConnection)init
{
  char v3 = [(objc_class *)getMCProfileConnectionClass() sharedConnection];
  v4 = [(CNManagedProfileConnection *)self initWithProfileConnection:v3];

  return v4;
}

- (CNManagedProfileConnection)initWithProfileConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNManagedProfileConnection;
  v6 = [(CNManagedProfileConnection *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profileConnection, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)mayShowLocalContactsAccountsForBundleID:(id)a3 sourceAccountManagement:(int64_t)a4
{
  id v6 = a3;
  v7 = [(CNManagedProfileConnection *)self profileConnection];
  LOBYTE(a4) = [v7 mayShowLocalContactsAccountsForBundleID:v6 sourceAccountManagement:a4];

  return a4;
}

- (BOOL)mayShowLocalContactsAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int64_t)a4
{
  id v6 = a3;
  v7 = [(CNManagedProfileConnection *)self profileConnection];
  LOBYTE(a4) = [v7 mayShowLocalContactsAccountsForTargetBundleID:v6 targetAccountManagement:a4];

  return a4;
}

- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(CNManagedProfileConnection *)self profileConnection];
  v11 = [v10 filteredOpenInContactsAccounts:v9 originatingAppBundleID:v8 sourceAccountManagement:a5];

  return v11;
}

- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(CNManagedProfileConnection *)self profileConnection];
  v11 = [v10 filteredOpenInOriginatingContactsAccounts:v9 targetAppBundleID:v8 targetAccountManagement:a5];

  return v11;
}

- (void)setProfileConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end