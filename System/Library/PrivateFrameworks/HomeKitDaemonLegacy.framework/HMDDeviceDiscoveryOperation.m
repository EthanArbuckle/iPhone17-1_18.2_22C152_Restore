@interface HMDDeviceDiscoveryOperation
+ (double)timeout;
+ (id)logCategory;
- (HMDAccount)account;
- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3;
- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3 service:(id)a4 timeout:(double)a5;
- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3 timeout:(double)a4;
- (HMDIDSService)service;
- (NSSet)devices;
- (id)discoveryBlock;
- (void)cancelWithError:(id)a3;
- (void)main;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDiscoveryBlock:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation HMDDeviceDiscoveryOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoveryBlock, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDiscoveryBlock:(id)a3
{
}

- (id)discoveryBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (HMDAccount)account
{
  return (HMDAccount *)objc_getProperty(self, a2, 352, 1);
}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 344, 1);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v43 = a4;
  id v45 = a5;
  id v12 = a6;
  id v13 = a7;
  v44 = v12;
  v14 = +[HMDDeviceHandle deviceHandleForDestination:v12];
  v46 = [v14 accountHandle];
  v15 = +[HMDAccountIdentifier accountIdentifierForMessageContext:v13];
  if (v15)
  {
    a7 = [(HMDDeviceDiscoveryOperation *)self account];
    id v12 = [a7 identifier];
    if (([v15 isEqual:v12] & 1) == 0)
    {

LABEL_14:
      v28 = (void *)MEMORY[0x1D9452090]();
      v29 = self;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v31 = HMFGetLogIdentifier();
        v32 = [v14 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v48 = v31;
        __int16 v49 = 2112;
        v50 = v32;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring message from: %@", buf, 0x16u);
      }
      goto LABEL_24;
    }
  }
  v16 = [(HMDDeviceDiscoveryOperation *)self account];
  v17 = [v16 handles];
  char v18 = [v17 containsObject:v46];

  if (v15)
  {
  }
  if ((v18 & 1) == 0) {
    goto LABEL_14;
  }
  v19 = [(HMDIDSSendMessageOperation *)self->_operation message];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  v22 = +[HMDRemoteMessageSerialization remoteMessageWithDictionary:v45 error:0];
  v23 = [v22 transactionIdentifier];
  v24 = [v21 transactionIdentifier];
  int v25 = HMFEqualObjects();

  if (v25)
  {
    v26 = +[HMDAccountRegistry sharedRegistry];
    v27 = [v26 deviceForHandle:v14];

    if (v27)
    {
      os_unfair_lock_t lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      if ([(NSMutableSet *)self->_devices containsObject:v27])
      {
        os_unfair_lock_unlock(lock);
      }
      else
      {
        context = (void *)MEMORY[0x1D9452090]();
        v33 = self;
        HMFGetOSLogHandle();
        v34 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v38 = v33;
          HMFGetLogIdentifier();
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          v35 = [v27 shortDescription];
          *(_DWORD *)buf = 138543618;
          id v48 = v39;
          __int16 v49 = 2112;
          v50 = v35;
          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Discovered device: %@", buf, 0x16u);

          v33 = v38;
        }

        [(NSMutableSet *)self->_devices addObject:v27];
        os_unfair_lock_unlock(lock);
        uint64_t v36 = [(HMDDeviceDiscoveryOperation *)v33 discoveryBlock];
        v37 = (void *)v36;
        if (v36) {
          (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v27);
        }
      }
    }
  }
LABEL_24:
}

- (void)main
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDDeviceDiscoveryOperation *)self account];
  v4 = [v3 handles];
  v28 = [v4 firstObject];

  if (v28)
  {
    v5 = [HMDRemoteAccountMessageDestination alloc];
    v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = [(HMDRemoteAccountMessageDestination *)v5 initWithTarget:v6 handle:v28 multicast:1];

    v27 = (void *)v7;
    v8 = [[HMDRemoteMessage alloc] initWithName:@"kElectDeviceForIDSSessionKey" qualityOfService:[(HMDDeviceDiscoveryOperation *)self qualityOfService] destination:v7 payload:0];
    [(HMDRemoteMessage *)v8 setType:0];
    v26 = v8;
    v9 = [[HMDIDSSendMessageOperation alloc] initWithMessage:v8 service:self->_service];
    operation = self->_operation;
    self->_operation = v9;

    [(HMFOperation *)self->_operation setQualityOfService:[(HMDDeviceDiscoveryOperation *)self qualityOfService]];
    [(HMDIDSService *)self->_service addDelegate:self queue:self->_queue];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(HMDAccount *)self->_account devices];
    uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1D9452090]();
          v16 = self;
          v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            char v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v36 = v18;
            __int16 v37 = 2112;
            v38 = v14;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Adding known device: %@", buf, 0x16u);
          }
          os_unfair_lock_lock_with_options();
          [(NSMutableSet *)v16->_devices addObject:v14];
          os_unfair_lock_unlock(&v16->_lock);
          uint64_t v19 = [(HMDDeviceDiscoveryOperation *)v16 discoveryBlock];
          v20 = (void *)v19;
          if (v19) {
            (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v14);
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v11);
    }

    [(HMFOperation *)self->_operation start];
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      int v25 = [(HMDDeviceDiscoveryOperation *)v22 account];
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v24;
      __int16 v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot discover devices for account without any handles: %@", buf, 0x16u);
    }
    v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [(HMDDeviceDiscoveryOperation *)v22 cancelWithError:v27];
  }
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F64ED0]])
  {
    uint64_t v6 = [v4 code];

    if (v6 == 13)
    {
      [(HMFOperation *)self finish];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v7.receiver = self;
  v7.super_class = (Class)HMDDeviceDiscoveryOperation;
  [(HMFOperation *)&v7 cancel];
LABEL_6:
  if ([(HMFOperation *)self->_operation isExecuting]) {
    [(HMFOperation *)self->_operation cancel];
  }
}

- (void)setQualityOfService:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDDeviceDiscoveryOperation;
  -[HMFOperation setQualityOfService:](&v7, sel_setQualityOfService_);
  queue = self->_queue;
  uint64_t v6 = dispatch_get_global_queue(a3, 0);
  dispatch_set_target_queue(queue, v6);
}

- (NSSet)devices
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableSet *)self->_devices copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3 service:(id)a4 timeout:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  if (a5 <= 0.0)
  {
    [(id)objc_opt_class() timeout];
    a5 = v11;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDDeviceDiscoveryOperation;
  uint64_t v12 = [(HMFOperation *)&v19 initWithTimeout:a5];
  if (v12)
  {
    HMDispatchQueueNameString();
    id v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v12->_service, a4);
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    devices = v12->_devices;
    v12->_devices = (NSMutableSet *)v16;
  }
  return v12;
}

- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  objc_super v7 = +[HMDIDSServiceManager sharedManager];
  v8 = [v7 service];

  id v9 = [(HMDDeviceDiscoveryOperation *)self initWithAccount:v6 service:v8 timeout:a4];
  return v9;
}

- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3
{
  return [(HMDDeviceDiscoveryOperation *)self initWithAccount:a3 timeout:0.0];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_30878 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_30878, &__block_literal_global_30879);
  }
  v2 = (void *)logCategory__hmf_once_v5_30880;
  return v2;
}

uint64_t __42__HMDDeviceDiscoveryOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_30880;
  logCategory__hmf_once_v5_30880 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (double)timeout
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  v3 = [v2 preferenceForKey:@"deviceDiscoveryTimeout"];

  id v4 = [v3 numberValue];

  if (v4)
  {
    v5 = [v3 numberValue];
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 65.0;
  }

  return v7;
}

@end