@interface CADMCProfileConnectionManagedConfigurationHandler
- (BOOL)isOpenInRestrictionInEffect;
- (BOOL)mayShowLocalAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4;
- (BOOL)mayShowLocalAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4;
- (CADMCProfileConnectionManagedConfigurationHandler)initWithMCProfileConnection:(id)a3;
- (MCProfileConnection)connection;
- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5;
- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5;
@end

@implementation CADMCProfileConnectionManagedConfigurationHandler

- (CADMCProfileConnectionManagedConfigurationHandler)initWithMCProfileConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADMCProfileConnectionManagedConfigurationHandler;
  v6 = [(CADMCProfileConnectionManagedConfigurationHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (BOOL)isOpenInRestrictionInEffect
{
  v2 = [(CADMCProfileConnectionManagedConfigurationHandler *)self connection];
  char v3 = [v2 isOpenInRestrictionInEffect];

  return v3;
}

- (MCProfileConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

- (BOOL)mayShowLocalAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(CADMCProfileConnectionManagedConfigurationHandler *)self connection];
  LOBYTE(v4) = [v7 mayShowLocalAccountsForBundleID:v6 sourceAccountManagement:v4];

  return v4;
}

- (BOOL)mayShowLocalAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(CADMCProfileConnectionManagedConfigurationHandler *)self connection];
  LOBYTE(v4) = [v7 mayShowLocalAccountsForTargetBundleID:v6 targetAccountManagement:v4];

  return v4;
}

- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(CADMCProfileConnectionManagedConfigurationHandler *)self connection];
  v11 = [v10 filteredOpenInAccounts:v9 originatingAppBundleID:v8 sourceAccountManagement:v5];

  return v11;
}

- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(CADMCProfileConnectionManagedConfigurationHandler *)self connection];
  v11 = [v10 filteredOpenInOriginatingAccounts:v9 targetAppBundleID:v8 targetAccountManagement:v5];

  return v11;
}

@end