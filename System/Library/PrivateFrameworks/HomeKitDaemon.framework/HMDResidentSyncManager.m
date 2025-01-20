@interface HMDResidentSyncManager
+ (id)logCategory;
- (HMDResidentSyncClient)client;
- (HMDResidentSyncManager)initWithHome:(id)a3 notificationCenter:(id)a4 persistence:(id)a5 logEventSubmitter:(id)a6;
- (HMDResidentSyncManager)initWithHome:(id)a3 notificationCenter:(id)a4 persistence:(id)a5 logEventSubmitter:(id)a6 isResidentCapable:(BOOL)a7 clientDataSource:(id)a8 serverDataSource:(id)a9;
- (HMDResidentSyncServer)server;
- (id)logIdentifier;
- (id)start;
- (void)interceptRemoteResidentRequest:(id)a3 proceed:(id)a4;
- (void)performResidentRequest:(id)a3 options:(unint64_t)a4;
- (void)performSync;
- (void)stop;
@end

@implementation HMDResidentSyncManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMDResidentSyncServer)server
{
  return (HMDResidentSyncServer *)objc_getProperty(self, a2, 24, 1);
}

- (HMDResidentSyncClient)client
{
  return (HMDResidentSyncClient *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  }
  else {
    id WeakRetained = 0;
  }
  v3 = [WeakRetained uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)interceptRemoteResidentRequest:(id)a3 proceed:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDResidentSyncManager *)self server];
  [v8 interceptRemoteResidentRequest:v7 proceed:v6];
}

- (void)performSync
{
  id v2 = [(HMDResidentSyncManager *)self client];
  [v2 performSync];
}

- (void)performResidentRequest:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(HMDResidentSyncManager *)self client];
  [v7 performResidentRequest:v6 options:a4];
}

- (void)stop
{
  v3 = [(HMDResidentSyncManager *)self client];
  [v3 stop];

  id v4 = [(HMDResidentSyncManager *)self server];
  [v4 stop];
}

- (id)start
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(HMDResidentSyncManager *)self client];
  v5 = [v4 start];
  [v3 addObject:v5];

  id v6 = [(HMDResidentSyncManager *)self server];

  if (v6)
  {
    id v7 = [(HMDResidentSyncManager *)self server];
    id v8 = [v7 start];
    [v3 addObject:v8];
  }
  v9 = [MEMORY[0x263F42538] allSettled:v3];

  return v9;
}

- (HMDResidentSyncManager)initWithHome:(id)a3 notificationCenter:(id)a4 persistence:(id)a5 logEventSubmitter:(id)a6 isResidentCapable:(BOOL)a7 clientDataSource:(id)a8 serverDataSource:(id)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  v41.receiver = self;
  v41.super_class = (Class)HMDResidentSyncManager;
  v21 = [(HMDResidentSyncManager *)&v41 init];
  v22 = v21;
  if (v21)
  {
    id v40 = v19;
    BOOL v23 = v10;
    objc_storeWeak((id *)&v21->_home, v15);
    id v39 = v20;
    id v24 = v16;
    if (HMDResidentSyncCodingModel__hmf_once_t0 != -1) {
      dispatch_once(&HMDResidentSyncCodingModel__hmf_once_t0, &__block_literal_global_163706);
    }
    id v25 = (id)HMDResidentSyncCodingModel__hmf_once_v1;
    v26 = [HMDResidentSyncClient alloc];
    v27 = [v15 msgDispatcher];
    v28 = [v15 residentDeviceManager];
    LOBYTE(v38) = v23;
    v29 = v26;
    id v16 = v24;
    uint64_t v30 = [(HMDResidentSyncClient *)v29 initWithHome:v15 codingModel:v25 dispatcher:v27 residentDeviceManager:v28 notificationCenter:v24 persistence:v17 isResidentCapable:v38 dataSource:v40 logEventSubmitter:v18];
    client = v22->_client;
    v22->_client = (HMDResidentSyncClient *)v30;

    if (v23)
    {
      v32 = [HMDResidentSyncServer alloc];
      v33 = [v15 msgDispatcher];
      v34 = [v15 residentDeviceManager];
      uint64_t v35 = [(HMDResidentSyncServer *)v32 initWithHome:v15 codingModel:v25 dispatcher:v33 residentDeviceManager:v34 notificationCenter:v16 persistence:v17 dataSource:v39 logEventSubmitter:v18];
      server = v22->_server;
      v22->_server = (HMDResidentSyncServer *)v35;
    }
    id v20 = v39;
    id v19 = v40;
  }

  return v22;
}

- (HMDResidentSyncManager)initWithHome:(id)a3 notificationCenter:(id)a4 persistence:(id)a5 logEventSubmitter:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[HMDDeviceCapabilities deviceCapabilities];
  uint64_t v15 = [v14 isResidentCapable];
  id v16 = objc_alloc_init(HMDResidentSyncClientDefaultDataSource);
  id v17 = objc_alloc_init(HMDResidentSyncServerDefaultDataSource);
  id v18 = [(HMDResidentSyncManager *)self initWithHome:v13 notificationCenter:v12 persistence:v11 logEventSubmitter:v10 isResidentCapable:v15 clientDataSource:v16 serverDataSource:v17];

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_166503 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_166503, &__block_literal_global_166504);
  }
  id v2 = (void *)logCategory__hmf_once_v1_166505;
  return v2;
}

void __37__HMDResidentSyncManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_166505;
  logCategory__hmf_once_v1_166505 = v0;
}

@end