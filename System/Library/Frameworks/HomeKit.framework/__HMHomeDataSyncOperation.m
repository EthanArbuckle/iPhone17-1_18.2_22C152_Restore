@interface __HMHomeDataSyncOperation
+ (id)logCategory;
- (BOOL)isRefresh;
- (HMHomeManager)manager;
- (NSString)logIdentifier;
- (__HMHomeDataSyncOperation)initWithHomeManager:(id)a3;
- (void)main;
- (void)setRefresh:(BOOL)a3;
@end

@implementation __HMHomeDataSyncOperation

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_50037 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_50037, &__block_literal_global_50038);
  }
  v2 = (void *)logCategory__hmf_once_v8_50039;

  return v2;
}

- (void)main
{
  v39[3] = *MEMORY[0x1E4F143B8];
  v3 = [(__HMHomeDataSyncOperation *)self manager];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 generationCounter];
    uint64_t v6 = [v4 metadataVersion];
    v7 = [v4 configuration];
    id v8 = objc_alloc(MEMORY[0x1E4F65488]);
    v9 = [v4 uuid];
    v28 = (void *)[v8 initWithTarget:v9];

    v10 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v11 = [(__HMHomeDataSyncOperation *)self qualityOfService];
    v38[0] = @"kConfigGenerationCounterKey";
    v12 = [NSNumber numberWithUnsignedInteger:v5];
    v39[0] = v12;
    v38[1] = @"kHAPMetadataVersionKey";
    v13 = [NSNumber numberWithUnsignedInteger:v6];
    v39[1] = v13;
    v38[2] = @"options";
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "options"));
    v39[2] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
    v16 = [v10 messageWithName:@"HMHM.fhc" qualityOfService:v11 destination:v28 payload:v15];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __33____HMHomeDataSyncOperation_main__block_invoke;
    v29[3] = &unk_1E5943D88;
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, &from);
    v17 = (void *)MEMORY[0x19F3A64A0]([v16 setResponseHandler:v29]);
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = [v16 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v35 = v20;
      __int16 v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending sync request using message: %@", buf, 0x16u);
    }
    v22 = [v4 context];
    v23 = [v22 messageDispatcher];
    [v23 sendMessage:v16];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v24 = (void *)MEMORY[0x19F3A64A0]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v35 = v27;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Manager was deallocated before sync operation started", buf, 0xCu);
    }
    v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [(HMFOperation *)v25 cancelWithError:v7];
  }
}

- (HMHomeManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (HMHomeManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);

  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setRefresh:(BOOL)a3
{
  self->_refresh = a3;
}

- (__HMHomeDataSyncOperation)initWithHomeManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)__HMHomeDataSyncOperation;
  uint64_t v5 = [(HMFOperation *)&v13 initWithTimeout:0.0];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_manager, v4);
    v7 = NSString;
    id v8 = [v4 logIdentifier];
    v9 = [(__HMHomeDataSyncOperation *)v6 name];
    uint64_t v10 = [v7 stringWithFormat:@"%@/%@", v8, v9];
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)v10;
  }
  return v6;
}

- (BOOL)isRefresh
{
  return self->_refresh;
}

@end