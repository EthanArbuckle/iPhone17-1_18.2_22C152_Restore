@interface HMDCloudManagerDataSource
- (BOOL)isControllerKeyAvailable;
- (BOOL)isKeychainSyncEnabled;
- (BOOL)supportsKeyTransferServer;
- (HMDCloudManagerDataSource)initWithHomeManager:(id)a3;
- (HMDHomeManager)homeManager;
- (id)keyTransferAgent;
- (id)queryDatabaseOperationWithBlock:(id)a3;
- (unint64_t)dataMigrationOptions;
@end

@implementation HMDCloudManagerDataSource

- (void).cxx_destruct
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (id)keyTransferAgent
{
  v2 = [(HMDCloudManagerDataSource *)self homeManager];
  v3 = [v2 keyTransferAgent];

  return v3;
}

- (BOOL)supportsKeyTransferServer
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 supportsKeyTransferServer];

  return v3;
}

- (id)queryDatabaseOperationWithBlock:(id)a3
{
  return +[HMDSyncOperation queryDatabaseOperationWithBlock:a3];
}

- (unint64_t)dataMigrationOptions
{
  return DMGetUserDataDisposition() & 0x1E;
}

- (BOOL)isKeychainSyncEnabled
{
  v2 = +[HMDAppleAccountSettings sharedSettings];
  char v3 = [v2 isKeychainSyncEnabled];

  return v3;
}

- (BOOL)isControllerKeyAvailable
{
  v2 = [MEMORY[0x1E4F5BE48] systemStore];
  uint64_t v5 = 0;
  char v3 = [v2 getControllerPublicKey:&v5 secretKey:0 username:0 allowCreation:0 error:0];

  return v3;
}

- (HMDCloudManagerDataSource)initWithHomeManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDCloudManagerDataSource;
  uint64_t v5 = [(HMDCloudManagerDataSource *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_homeManager, v4);
  }

  return v6;
}

@end