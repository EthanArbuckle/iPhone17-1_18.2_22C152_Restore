@interface HMDeviceSetupOperationBase
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)logCategory;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (HMAccessory)accessory;
- (HMDeviceSetupOperationBase)init;
- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3;
- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3 sessionIdentifier:(id)a4;
- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3 setupSessionFactory:(id)a4;
- (HMDeviceSetupOperationTransport)sessionTransport;
- (HMDeviceSetupSession)setupSession;
- (NSError)error;
- (OS_dispatch_queue)clientQueue;
- (id)logIdentifier;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)dealloc;
- (void)finish;
- (void)setAccessory:(id)a3;
- (void)setError:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setupSession:(id)a3 didCloseWithError:(id)a4;
- (void)setupSession:(id)a3 didReceiveExchangeData:(id)a4 completionHandler:(id)a5;
- (void)start;
@end

@implementation HMDeviceSetupOperationBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSession, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_sessionTransport);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (HMDeviceSetupSession)setupSession
{
  return self->_setupSession;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMDeviceSetupOperationTransport)sessionTransport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionTransport);

  return (HMDeviceSetupOperationTransport *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDeviceSetupOperationBase *)self setupSession];
  v3 = [v2 identifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)setupSession:(id)a3 didReceiveExchangeData:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(HMDeviceSetupOperationBase *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HMDeviceSetupOperationBase_setupSession_didReceiveExchangeData_completionHandler___block_invoke;
  block[3] = &unk_1E5945138;
  id v13 = v7;
  id v14 = v8;
  block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __84__HMDeviceSetupOperationBase_setupSession_didReceiveExchangeData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) sessionTransport];
  v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v2;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending exchange data using session transport: %@", buf, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 32) qualityOfService];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__HMDeviceSetupOperationBase_setupSession_didReceiveExchangeData_completionHandler___block_invoke_33;
    v13[3] = &unk_1E593E980;
    id v14 = *(id *)(a1 + 48);
    [v2 sendRequestData:v8 qualityOfService:v9 responseHandler:v13];
    id v10 = v14;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v16 = v11;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_FAULT, "%{public}@Session transport is unexpectedly nil", buf, 0xCu);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    id v10 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:9000];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v10);
LABEL_9:
  }
}

uint64_t __84__HMDeviceSetupOperationBase_setupSession_didReceiveExchangeData_completionHandler___block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a2);
  }
  return result;
}

- (void)setupSession:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDeviceSetupOperationBase *)self clientQueue];
  dispatch_activate(v8);

  uint64_t v9 = [(HMDeviceSetupOperationBase *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HMDeviceSetupOperationBase_setupSession_didCloseWithError___block_invoke;
  block[3] = &unk_1E5945650;
  id v13 = v7;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __61__HMDeviceSetupOperationBase_setupSession_didCloseWithError___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setExecuting:0];
    uint64_t v3 = *(void *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    [v2 cancelWithError:v3];
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) userInfo];
    v5 = objc_msgSend(v4, "hmf_dataForKey:", @"kAccessoryDataKey");

    if (v5)
    {
      id v20 = 0;
      id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v20];
      id v7 = v20;
      if (v6)
      {
        id v8 = v6;
        if (![v8 supportedStereoPairVersions])
        {
          *(_OWORD *)buf = *MEMORY[0x1E4F64F68];
          *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F64F68] + 16);
          uint64_t v9 = [MEMORY[0x1E4F65558] versionFromOperatingSystemVersion:buf];
          if (+[HMMediaSystemBuilder supportsMediaSystem:v8])
          {
            id v10 = [v8 softwareVersion];
            char v11 = [v10 isAtLeastVersion:v9];

            if ((v11 & 1) == 0) {
              [v8 setSupportedStereoPairVersions:1];
            }
          }
        }
        uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
        id v13 = *(id *)(a1 + 40);
        id v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Finished setup operation with accessory: %@", buf, 0x16u);
        }
        [*(id *)(a1 + 40) setAccessory:v8];
      }
      else
      {
        v16 = (void *)MEMORY[0x19F3A64A0]();
        id v17 = *(id *)(a1 + 40);
        v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v7;
          _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory from accessory data: %@", buf, 0x16u);
        }
      }
    }
    [*(id *)(a1 + 40) finish];
  }
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HMDeviceSetupOperationBase *)self clientQueue];
  dispatch_activate(v5);

  id v6 = [(HMDeviceSetupOperationBase *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HMDeviceSetupOperationBase_cancelWithError___block_invoke;
  v8[3] = &unk_1E5945628;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __46__HMDeviceSetupOperationBase_cancelWithError___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0
    && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling with error: %@", buf, 0x16u);
    }
    if (*(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(a1 + 32), "setError:");
    }
    v10.receiver = *(id *)(a1 + 32);
    v10.super_class = (Class)HMDeviceSetupOperationBase;
    objc_msgSendSuper2(&v10, sel_cancel);
    char v7 = [*(id *)(a1 + 32) isExecuting];
    id v8 = *(void **)(a1 + 32);
    if (v7)
    {
      id v9 = [v8 setupSession];
      [v9 close];
    }
    else
    {
      [v8 finish];
    }
  }
}

- (void)cancel
{
  id v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
  [(HMDeviceSetupOperationBase *)self cancelWithError:v3];
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(HMDeviceSetupOperationBase *)self isExecuting])
  {
    v5 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v6 = self;
    char v7 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v8;
    id v9 = "%{public}@Operation is already executing";
    goto LABEL_8;
  }
  if (([(HMDeviceSetupOperationBase *)self isReady] & 1) == 0)
  {
    v5 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v6 = self;
    char v7 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v8;
    id v9 = "%{public}@Operation is not ready";
LABEL_8:
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);

LABEL_9:
    objc_exception_throw( (id) *MEMORY[0x1E4F1C3C8]);
  }
  id v3 = [(HMDeviceSetupOperationBase *)self clientQueue];
  dispatch_activate(v3);

  id v4 = [(HMDeviceSetupOperationBase *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDeviceSetupOperationBase_start__block_invoke;
  block[3] = &unk_1E59452E8;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __35__HMDeviceSetupOperationBase_start__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(a1 + 32);
  v2 = v1;
  if (v1)
  {
    if (([v1 isFinished] & 1) != 0 || objc_msgSend(v2, "isCancelled"))
    {
      id v3 = (void *)MEMORY[0x19F3A64A0]();
      id v4 = v2;
      v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = HMFGetLogIdentifier();
        int v13 = 138543362;
        uint64_t v14 = v6;
        _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Operation is already complete, aborting.", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      char v7 = (void *)MEMORY[0x19F3A64A0]();
      id v8 = v2;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v10 = HMFGetLogIdentifier();
        int v13 = 138543362;
        uint64_t v14 = v10;
        _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Starting operation", (uint8_t *)&v13, 0xCu);
      }
      [v8 setExecuting:1];
      char v11 = [v8 setupSession];
      [v11 configure];

      uint64_t v12 = [v8 setupSession];
      [v12 open];
    }
  }
}

- (void)setAccessory:(id)a3
{
  id v4 = (HMAccessory *)a3;
  os_unfair_lock_lock_with_options();
  accessory = self->_accessory;
  self->_accessory = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMAccessory)accessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accessory;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setQualityOfService:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDeviceSetupOperationBase;
  -[HMDeviceSetupOperationBase setQualityOfService:](&v7, sel_setQualityOfService_);
  clientQueue = self->_clientQueue;
  uint64_t v6 = dispatch_get_global_queue(a3, 0);
  dispatch_set_target_queue(clientQueue, v6);
}

- (void)setError:(id)a3
{
  id v4 = (NSError *)[a3 copy];
  os_unfair_lock_lock_with_options();
  error = self->_error;
  self->_error = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSError)error
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_error;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)finish
{
  [(HMDeviceSetupOperationBase *)self setExecuting:0];

  [(HMDeviceSetupOperationBase *)self setFinished:1];
}

- (void)setFinished:(BOOL)a3
{
  [(HMDeviceSetupOperationBase *)self willChangeValueForKey:@"isFinished"];
  os_unfair_lock_lock_with_options();
  self->_finished = a3;
  os_unfair_lock_unlock(&self->_lock);

  [(HMDeviceSetupOperationBase *)self didChangeValueForKey:@"isFinished"];
}

- (BOOL)isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExecuting:(BOOL)a3
{
  [(HMDeviceSetupOperationBase *)self willChangeValueForKey:@"isExecuting"];
  os_unfair_lock_lock_with_options();
  self->_executing = a3;
  os_unfair_lock_unlock(&self->_lock);

  [(HMDeviceSetupOperationBase *)self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isExecuting
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)dealloc
{
  id v3 = [(HMDeviceSetupOperationBase *)self clientQueue];
  dispatch_activate(v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDeviceSetupOperationBase;
  [(HMDeviceSetupOperationBase *)&v4 dealloc];
}

- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3 setupSessionFactory:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, HMDeviceSetupOperationBase *))a4;
  v22.receiver = self;
  v22.super_class = (Class)HMDeviceSetupOperationBase;
  id v8 = [(HMDeviceSetupOperationBase *)&v22 init];
  id v9 = v8;
  if (v8)
  {
    HMDispatchQueueNameString(v8, 0);
    id v10 = objc_claimAutoreleasedReturnValue();
    char v11 = (const char *)[v10 UTF8String];
    uint64_t v12 = dispatch_queue_attr_make_initially_inactive(0);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    clientQueue = v9->_clientQueue;
    v9->_clientQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v9->_sessionTransport, v6);
    uint64_t v15 = v7[2](v7, v9);
    setupSession = v9->_setupSession;
    v9->_setupSession = (HMDeviceSetupSession *)v15;

    id v17 = NSString;
    v18 = [(HMDeviceSetupSession *)v9->_setupSession identifier];
    uint64_t v19 = [v18 UUIDString];
    id v20 = [v17 stringWithFormat:@"DeviceSetupOperation (%@)", v19];
    [(HMDeviceSetupOperationBase *)v9 setName:v20];
  }
  return v9;
}

- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HMDeviceSetupOperationBase_initWithSessionTransport_sessionIdentifier___block_invoke;
  v10[3] = &unk_1E5940BE8;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(HMDeviceSetupOperationBase *)self initWithSessionTransport:a3 setupSessionFactory:v10];

  return v8;
}

HMDeviceSetupSession *__73__HMDeviceSetupOperationBase_initWithSessionTransport_sessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [[HMDeviceSetupSession alloc] initWithRole:0 identifier:*(void *)(a1 + 32) delegate:v3];

  return v4;
}

- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [(HMDeviceSetupOperationBase *)self initWithSessionTransport:v5 sessionIdentifier:v6];

  return v7;
}

- (HMDeviceSetupOperationBase)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17 != -1) {
    dispatch_once(&logCategory__hmf_once_t17, &__block_literal_global_6332);
  }
  v2 = (void *)logCategory__hmf_once_v18;

  return v2;
}

uint64_t __41__HMDeviceSetupOperationBase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v18;
  logCategory__hmf_once_v18 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"executing"]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"finished"] ^ 1;
  }

  return v4;
}

@end