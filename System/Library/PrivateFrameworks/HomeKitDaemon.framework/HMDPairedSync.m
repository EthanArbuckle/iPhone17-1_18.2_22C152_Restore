@interface HMDPairedSync
- (HMDPairedSync)initWithQueue:(id)a3;
- (PSYSyncCoordinator)coordinator;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
@end

@implementation HMDPairedSync

- (void).cxx_destruct
{
}

- (PSYSyncCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received an update to being-sync-session to watch but no companion sync is needed for HH2", (uint8_t *)&v12, 0xCu);
  }
  [v7 syncDidComplete];
}

- (HMDPairedSync)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDPairedSync;
  v5 = [(HMDPairedSync *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F5BB20] syncCoordinatorWithServiceName:@"com.apple.pairedsync.homekit"];
    coordinator = v5->_coordinator;
    v5->_coordinator = (PSYSyncCoordinator *)v6;

    [(PSYSyncCoordinator *)v5->_coordinator setDelegate:v5 queue:v4];
  }

  return v5;
}

@end