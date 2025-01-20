@interface HMDAppleAccountManagerDefaultDataSource
- (HMDACAccountStore)accountStore;
- (HMDAPSConnection)apsConnection;
- (HMDAppleAccountManagerDefaultDataSource)initWithQueue:(id)a3;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)queue;
- (id)accountChangeObserver;
@end

@implementation HMDAppleAccountManagerDefaultDataSource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)accountChangeObserver
{
  return objc_getProperty(self, a2, 40, 1);
}

- (HMDACAccountStore)accountStore
{
  return (HMDACAccountStore *)objc_getProperty(self, a2, 32, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAPSConnection)apsConnection
{
  return (HMDAPSConnection *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAppleAccountManagerDefaultDataSource)initWithQueue:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleAccountManagerDefaultDataSource;
  v6 = [(HMDAppleAccountManagerDefaultDataSource *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F4E1E8]);
    uint64_t v9 = [v8 initWithEnvironmentName:*MEMORY[0x1E4F4E1D0] namedDelegatePort:*MEMORY[0x1E4F4E1B8] queue:v5];
    apsConnection = v7->_apsConnection;
    v7->_apsConnection = (HMDAPSConnection *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = (NSNotificationCenter *)v11;

    v13 = (HMDACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v7->_accountStore;
    v7->_accountStore = v13;

    v15 = objc_alloc_init(HMDAccountChangeObserver);
    id accountChangeObserver = v7->_accountChangeObserver;
    v7->_id accountChangeObserver = v15;
  }
  return v7;
}

@end