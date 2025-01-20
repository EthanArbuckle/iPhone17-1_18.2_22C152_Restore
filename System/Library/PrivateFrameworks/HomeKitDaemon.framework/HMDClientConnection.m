@interface HMDClientConnection
+ (id)logCategory;
- (HMDClientConnection)initWithHomeManager:(id)a3 queue:(id)a4 messageDispatcher:(id)a5;
- (HMDClientConnection)initWithHomeManager:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 dataSource:(id)a6;
- (HMDClientConnectionDataSource)dataSource;
- (HMDHomeManager)homeManager;
- (HMFMessageDispatcher)msgDispatcher;
- (NSMutableArray)commandsBeingExecuted;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (void)_handleIdmsAccountUsernameModified:(id)a3;
- (void)_handleSiriCommand:(id)a3;
- (void)_handleSiriIntentRequest:(id)a3;
- (void)_handleSiriSyncDataRequest:(id)a3;
- (void)_registerForMessages;
- (void)dealloc;
- (void)setHomeManager:(id)a3;
@end

@implementation HMDClientConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandsBeingExecuted, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
}

- (NSMutableArray)commandsBeingExecuted
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (HMDClientConnectionDataSource)dataSource
{
  return (HMDClientConnectionDataSource *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)[MEMORY[0x263F0E2B8] UUID];
}

- (void)_handleIdmsAccountUsernameModified:(id)a3
{
  id v6 = a3;
  v4 = [MEMORY[0x263F42620] productInfo];
  uint64_t v5 = [v4 productClass];

  if (v5 == 6) {
    logAndPostNotification(@"HMDHomeManagerIDMSAccountUsernameDidUpdateNotification", self, 0);
  }
  [v6 respondWithPayload:0];
}

- (void)_handleSiriIntentRequest:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 dataForKey:*MEMORY[0x263F0EB88]];
  if (v5)
  {
    id v33 = 0;
    id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v33];
    id v7 = v33;
    if (v6)
    {
      v8 = [[HMDAssistantIntent alloc] initWithIntent:v6];
      v9 = [(HMDClientConnection *)self homeManager];
      int v10 = [v9 isDataSyncInProgressWithMessage:v4];
      v11 = [v4 numberForKey:*MEMORY[0x263F0EB98]];
      [v11 unsignedIntegerValue];

      v32 = HMStringFromIntentRequestType();
      v12 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v15)
        {
          v30 = HMFGetLogIdentifier();
          uint64_t v16 = HMINControlHomeIntentShortDescription();
          *(_DWORD *)buf = 138543874;
          v35 = v30;
          __int16 v36 = 2112;
          id v37 = v32;
          __int16 v38 = 2112;
          uint64_t v39 = v16;
          v17 = (void *)v16;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Error - Data sync in progress - Unable to %@ intent [ %@ ] ", buf, 0x20u);
        }
        v18 = [MEMORY[0x263F087E8] hmErrorWithCode:77];
        v19 = [v4 responseHandler];
        ((void (**)(void, void *, void))v19)[2](v19, v18, 0);
      }
      else
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v28 = v31 = v12;
          v29 = HMINControlHomeIntentShortDescription();
          *(_DWORD *)buf = 138543874;
          v35 = v28;
          __int16 v36 = 2112;
          id v37 = v32;
          __int16 v38 = 2112;
          uint64_t v39 = (uint64_t)v29;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received to %@ intent: [ %@ ]", buf, 0x20u);

          v12 = v31;
        }

        v18 = [v9 gatherer];
        [(HMDAssistantIntent *)v8 performWithGather:v18 message:v4];
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x230FBD990]();
      v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v35 = v27;
        __int16 v36 = 2112;
        id v37 = v7;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive control home intent from the message payload data: %@", buf, 0x16u);
      }
      v8 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      v9 = [v4 responseHandler];
      ((void (**)(void, HMDAssistantIntent *, void))v9)[2](v9, v8, 0);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Error - Did not get the intent", buf, 0xCu);
    }
    id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    id v6 = [v4 responseHandler];
    ((void (**)(void, id, void))v6)[2](v6, v7, 0);
  }
}

- (void)_handleSiriSyncDataRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDClientConnection *)self homeManager];
  [v5 handleSiriSyncDataRequest:v4];
}

- (void)_handleSiriCommand:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v5 = objc_alloc(MEMORY[0x263F424F0]);
  id v6 = NSString;
  id v7 = MEMORY[0x230FBBCF0](self, a2);
  v8 = [v6 stringWithFormat:@"%@, %s:%ld", v7, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Messaging/XPC/HMDClientConnection.m", 160];
  v47 = (void *)[v5 initWithName:v8];

  v50 = [(HMDClientConnection *)self homeManager];
  id val = [v50 accessoryBrowser];
  v9 = [v51 name];
  v45 = [val beginActiveAssertionWithReason:v9];

  int v10 = [v51 messagePayload];
  v48 = [v10 objectForKeyedSubscript:@"kSiriCommandKey"];

  v11 = [MEMORY[0x263F08928] deserializeObjectWithData:v48 allowedClass:objc_opt_class() frameworkClasses:&unk_26E474398];
  [v11 setHomeManager:v50];
  v12 = [v11 aceId];
  [v47 setClientMetricIdentifier:v12];

  v46 = [v51 identifier];
  v13 = (void *)MEMORY[0x230FBD990]();
  v14 = self;
  BOOL v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    v17 = [v46 UUIDString];
    v18 = [v11 aceId];
    v19 = [v11 serverValidity];
    v20 = objc_msgSend(v11, "hm_shortDescription");
    *(_DWORD *)buf = 138544386;
    v64 = v16;
    __int16 v65 = 2114;
    v66 = v17;
    __int16 v67 = 2114;
    v68 = v18;
    __int16 v69 = 2114;
    v70 = v19;
    __int16 v71 = 2112;
    v72 = v20;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Incoming Siri command(%{public}@) serverValidity %{public}@:\n%@", buf, 0x34u);
  }
  int v21 = [v50 isDataSyncInProgressWithMessage:v51];
  v22 = [(HMDClientConnection *)v14 dataSource];
  v44 = [v22 carPlayDataSource];

  if (v21) {
    goto LABEL_4;
  }
  v29 = [(HMDClientConnection *)v14 dataSource];
  if (![v29 supportsDeviceLock]) {
    goto LABEL_12;
  }
  v30 = [(HMDClientConnection *)v14 dataSource];
  if (![v30 isDeviceLocked]
    || [v50 isAccessAllowedWhenLocked])
  {

LABEL_12:
LABEL_13:
    v31 = [(HMDClientConnection *)v14 workQueue];
    v32 = [(HMDClientConnection *)v14 msgDispatcher];
    v26 = +[HMDAssistantCommandExecutor executorWithCommand:v11 workQueue:v31 messageDispatcher:v32];

    id v33 = [(HMDClientConnection *)v14 commandsBeingExecuted];
    [v33 addObject:v26];

    objc_initWeak((id *)buf, v14);
    objc_initWeak(&location, val);
    objc_initWeak(&from, v26);
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __42__HMDClientConnection__handleSiriCommand___block_invoke;
    v52[3] = &unk_264A239D8;
    objc_copyWeak(&v57, (id *)buf);
    objc_copyWeak(&v58, &from);
    objc_copyWeak(&v59, &location);
    id v53 = v46;
    id v54 = v11;
    id v55 = v51;
    id v56 = v45;
    [v26 performWithCompletion:v52];

    objc_destroyWeak(&v59);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&v57);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
    goto LABEL_18;
  }
  char v43 = [v44 synchronouslyFetchIsCarPlayConnectedStatus];

  if (v43) {
    goto LABEL_13;
  }
LABEL_4:
  v23 = [(HMDClientConnection *)v14 commandsBeingExecuted];
  BOOL v24 = [v23 count] == 0;

  if (v24) {
    [val endActiveAssertion:v45];
  }
  id v25 = objc_alloc_init(MEMORY[0x263F64930]);
  v26 = v25;
  if (v21)
  {
    [v25 setCommandOutcome:*MEMORY[0x263F65558]];
    id v27 = [MEMORY[0x263EFF8C0] array];
    [v26 setActionResults:v27];
    v28 = @"Data sync in progress";
  }
  else
  {
    [v25 setCommandOutcome:*MEMORY[0x263F65548]];
    id v27 = objc_alloc_init(MEMORY[0x263F64918]);
    [v27 setOutcome:*MEMORY[0x263F65290]];
    id v62 = v27;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
    [v26 setActionResults:v34];

    v28 = @"HomeKit access not allowed when device is locked";
  }

  v35 = [v26 dictionary];
  __int16 v36 = (void *)MEMORY[0x230FBD990]();
  id v37 = v14;
  __int16 v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    uint64_t v39 = HMFGetLogIdentifier();
    uint64_t v40 = [v11 aceId];
    v41 = objc_msgSend(v26, "hm_headerDescription");
    *(_DWORD *)buf = 138544130;
    v64 = v39;
    __int16 v65 = 2112;
    v66 = v28;
    __int16 v67 = 2112;
    v68 = v40;
    __int16 v69 = 2112;
    v70 = v41;
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@%@ - response for Siri command(%@): %@", buf, 0x2Au);
  }
  v42 = [v51 responseHandler];
  ((void (**)(void, void, void *))v42)[2](v42, 0, v35);

LABEL_18:
}

void __42__HMDClientConnection__handleSiriCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = objc_loadWeakRetained((id *)(a1 + 72));
  id v46 = objc_loadWeakRetained((id *)(a1 + 80));
  if (v5)
  {
    id v41 = v8;
    id v44 = v6;
    id v45 = v5;
    v9 = (void *)[objc_alloc(MEMORY[0x263F64930]) initWithDictionary:v5];
    int v10 = (void *)MEMORY[0x230FBD990]();
    id v42 = WeakRetained;
    id v11 = WeakRetained;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [*(id *)(a1 + 32) UUIDString];
      BOOL v15 = [*(id *)(a1 + 40) aceId];
      uint64_t v16 = objc_msgSend(v9, "hm_headerDescription");
      *(_DWORD *)buf = 138544130;
      id v53 = v13;
      __int16 v54 = 2114;
      id v55 = v14;
      __int16 v56 = 2114;
      id v57 = v15;
      __int16 v58 = 2114;
      id v59 = v16;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Outgoing Response for Siri command(%{public}@): %{public}@", buf, 0x2Au);
    }
    uint64_t v43 = a1;

    uint64_t v40 = v9;
    objc_msgSend(v9, "hm_contentDescription");
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x230FBD990]();
          id v24 = v11;
          id v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v53 = v26;
            __int16 v54 = 2112;
            id v55 = v22;
            _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v19);
    }

    id v6 = v44;
    id v5 = v45;
    id WeakRetained = v42;
    a1 = v43;
    id v8 = v41;
    if (!v44) {
      goto LABEL_21;
    }
LABEL_18:
    v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = WeakRetained;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = HMFGetLogIdentifier();
      v35 = [*(id *)(a1 + 32) UUIDString];
      *(_DWORD *)buf = 138543874;
      id v53 = v34;
      __int16 v54 = 2114;
      id v55 = v35;
      __int16 v56 = 2114;
      id v57 = v6;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Error executing Siri command: %{public}@", buf, 0x20u);
    }
    goto LABEL_21;
  }
  id v27 = (void *)MEMORY[0x230FBD990]();
  id v28 = WeakRetained;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v53 = v30;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Nil response for Siri command", buf, 0xCu);
  }
  if (v6) {
    goto LABEL_18;
  }
LABEL_21:
  __int16 v36 = [*(id *)(a1 + 48) responseHandler];
  ((void (**)(void, id, id))v36)[2](v36, v6, v5);

  if (v8)
  {
    id v37 = [WeakRetained commandsBeingExecuted];
    [v37 removeObject:v8];

    __int16 v38 = [WeakRetained commandsBeingExecuted];
    uint64_t v39 = [v38 count];

    if (!v39) {
      [v46 endActiveAssertion:*(void *)(a1 + 56)];
    }
  }
}

- (void)dealloc
{
  v3 = [(HMDClientConnection *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDClientConnection;
  [(HMDClientConnection *)&v4 dealloc];
}

- (void)_registerForMessages
{
  v21[1] = *MEMORY[0x263EF8340];
  v3 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  objc_super v4 = +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:1];
  v21[0] = v3;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  id v6 = [(HMDClientConnection *)self msgDispatcher];
  [v6 registerForMessage:*MEMORY[0x263F0EB90] receiver:self policies:v5 selector:sel__handleSiriIntentRequest_];

  v20[0] = v3;
  v20[1] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];

  id v8 = [(HMDClientConnection *)self msgDispatcher];
  [v8 registerForMessage:*MEMORY[0x263F0C5E0] receiver:self policies:v7 selector:sel__handleSiriCommand_];

  v9 = [(HMDClientConnection *)self msgDispatcher];
  [v9 registerForMessage:*MEMORY[0x263F0C5E8] receiver:self policies:v7 selector:sel__handleSiriSyncDataRequest_];

  int v10 = [MEMORY[0x263F42620] productInfo];
  uint64_t v11 = [v10 productClass];

  if (v11 == 6)
  {
    v12 = [(HMDClientConnection *)self msgDispatcher];
    uint64_t v13 = *MEMORY[0x263F0C5D8];
    v14 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v19[0] = v14;
    uint64_t v18 = *MEMORY[0x263F0B8B8];
    BOOL v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    uint64_t v16 = +[HMDXPCiCloudSwitchMessagePolicy policyWithBundleIdentifiers:v15];
    v19[1] = v16;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    [v12 registerForMessage:v13 receiver:self policies:v17 selector:sel__handleIdmsAccountUsernameModified_];
  }
}

- (HMDClientConnection)initWithHomeManager:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 dataSource:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDClientConnection;
  v14 = [(HMDClientConnection *)&v19 init];
  BOOL v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_homeManager, v10);
    objc_storeStrong((id *)&v15->_dataSource, a6);
    objc_storeStrong((id *)&v15->_workQueue, a4);
    objc_storeStrong((id *)&v15->_msgDispatcher, a5);
    uint64_t v16 = [MEMORY[0x263EFF980] array];
    commandsBeingExecuted = v15->_commandsBeingExecuted;
    v15->_commandsBeingExecuted = (NSMutableArray *)v16;

    [(HMDClientConnection *)v15 _registerForMessages];
  }

  return v15;
}

- (HMDClientConnection)initWithHomeManager:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDClientConnectionDataSource);
  id v12 = [(HMDClientConnection *)self initWithHomeManager:v10 queue:v9 messageDispatcher:v8 dataSource:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_177273 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_177273, &__block_literal_global_177274);
  }
  v2 = (void *)logCategory__hmf_once_v11_177275;
  return v2;
}

void __34__HMDClientConnection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v11_177275;
  logCategory__hmf_once_v11_177275 = v0;
}

@end