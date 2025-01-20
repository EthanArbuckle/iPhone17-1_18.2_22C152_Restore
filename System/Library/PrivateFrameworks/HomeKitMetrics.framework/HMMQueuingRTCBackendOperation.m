@interface HMMQueuingRTCBackendOperation
+ (id)logCategory;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isRealtime;
- (HMMQueuingRTCBackendOperation)initWithMessages:(id)a3 serviceName:(id)a4 sessionUUID:(id)a5 isRealtime:(BOOL)a6 rtcFactory:(id)a7 staleSessionBlock:(id)a8;
- (HMMRTCReportingFactory)rtcFactory;
- (NSArray)messages;
- (NSString)serviceName;
- (NSUUID)sessionUUID;
- (id)staleSessionBlock;
- (void)changeOperationState:(int64_t)a3;
- (void)start;
@end

@implementation HMMQueuingRTCBackendOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_staleSessionBlock, 0);
  objc_storeStrong((id *)&self->_rtcFactory, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

- (id)staleSessionBlock
{
  return self->_staleSessionBlock;
}

- (HMMRTCReportingFactory)rtcFactory
{
  return self->_rtcFactory;
}

- (BOOL)isRealtime
{
  return self->_isRealtime;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSArray)messages
{
  return self->_messages;
}

- (BOOL)isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_operationState == 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_operationState == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)changeOperationState:(int64_t)a3
{
  int64_t operationState = self->_operationState;
  BOOL v6 = a3 == 1 || operationState == 1;
  int v7 = v6;
  if (v6) {
    [(HMMQueuingRTCBackendOperation *)self willChangeValueForKey:@"executing"];
  }
  BOOL v8 = a3 == 2 || operationState == 2;
  int v9 = v8;
  if (v8) {
    [(HMMQueuingRTCBackendOperation *)self willChangeValueForKey:@"finished"];
  }
  os_unfair_lock_lock_with_options();
  self->_int64_t operationState = a3;
  os_unfair_lock_unlock(&self->_lock);
  if (v7) {
    [(HMMQueuingRTCBackendOperation *)self didChangeValueForKey:@"executing"];
  }
  if (v9)
  {
    [(HMMQueuingRTCBackendOperation *)self didChangeValueForKey:@"finished"];
  }
}

- (void)start
{
  if ([(HMMQueuingRTCBackendOperation *)self isCancelled])
  {
    [(HMMQueuingRTCBackendOperation *)self changeOperationState:2];
  }
  else
  {
    [(HMMQueuingRTCBackendOperation *)self changeOperationState:1];
    v3 = [(HMMQueuingRTCBackendOperation *)self rtcFactory];
    v4 = [(HMMQueuingRTCBackendOperation *)self serviceName];
    v5 = [(HMMQueuingRTCBackendOperation *)self sessionUUID];
    BOOL v6 = objc_msgSend(v3, "sessionWithServiceName:samplingUUID:containsRealtime:", v4, v5, -[HMMQueuingRTCBackendOperation isRealtime](self, "isRealtime"));

    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __38__HMMQueuingRTCBackendOperation_start__block_invoke;
    v12 = &unk_1E69FD548;
    v13 = self;
    id v14 = v6;
    id v7 = v6;
    [v7 startConfigurationWithCompletionHandler:&v9];
    BOOL v8 = [(HMMQueuingRTCBackendOperation *)self staleSessionBlock];
    v8[2]();
  }
}

void __38__HMMQueuingRTCBackendOperation_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    id v23 = v3;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [*(id *)(a1 + 32) messages];
    uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v26 = *(void *)v28;
      uint64_t v25 = *MEMORY[0x1E4F94628];
      uint64_t v7 = *MEMORY[0x1E4F94640];
      uint64_t v8 = *MEMORY[0x1E4F94638];
      uint64_t v9 = *MEMORY[0x1E4F94630];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v26) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v12 = *(void **)(a1 + 40);
          int v13 = [*(id *)(a1 + 32) isRealtime];
          v32[0] = v25;
          v32[1] = v7;
          *(void *)buf = &unk_1F2C87748;
          *(void *)&buf[8] = &unk_1F2C87748;
          v32[2] = v8;
          v32[3] = v9;
          id v14 = &unk_1F2C87760;
          if (v13) {
            id v14 = &unk_1F2C87748;
          }
          *(void *)&buf[16] = v11;
          v34 = v14;
          v15 = (void *)MEMORY[0x1E4F1C9E8];
          id v16 = v11;
          v17 = [v15 dictionaryWithObjects:buf forKeys:v32 count:4];

          [v12 sendMessageWithDictionary:v17 error:0];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v6);
    }

    v4 = v23;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D944E970]();
    id v19 = *(id *)(a1 + 32);
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [*(id *)(a1 + 32) serviceName];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_1D4999000, v20, OS_LOG_TYPE_ERROR, "%{public}@No configured RTC backends for service %@", buf, 0x16u);
    }
  }
  [*(id *)(a1 + 32) changeOperationState:2];
}

- (HMMQueuingRTCBackendOperation)initWithMessages:(id)a3 serviceName:(id)a4 sessionUUID:(id)a5 isRealtime:(BOOL)a6 rtcFactory:(id)a7 staleSessionBlock:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMMQueuingRTCBackendOperation;
  v18 = [(HMMQueuingRTCBackendOperation *)&v25 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messages, a3);
    objc_storeStrong((id *)&v19->_serviceName, a4);
    objc_storeStrong((id *)&v19->_sessionUUID, a5);
    v19->_isRealtime = a6;
    objc_storeStrong((id *)&v19->_rtcFactory, a7);
    uint64_t v20 = MEMORY[0x1D944EB70](v17);
    id staleSessionBlock = v19->_staleSessionBlock;
    v19->_id staleSessionBlock = (id)v20;

    v19->_int64_t operationState = 0;
  }

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1) {
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_75);
  }
  v2 = (void *)logCategory__hmf_once_v10;
  return v2;
}

uint64_t __44__HMMQueuingRTCBackendOperation_logCategory__block_invoke()
{
  logCategory__hmf_once_uint64_t v10 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end