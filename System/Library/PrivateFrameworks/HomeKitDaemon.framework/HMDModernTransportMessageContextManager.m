@interface HMDModernTransportMessageContextManager
+ (id)logCategory;
- (HMDModernTransportMessageContextFactory)factory;
- (HMDModernTransportMessageContextManager)init;
- (HMDModernTransportMessageContextManager)initWithFactory:(id)a3;
- (NSMutableDictionary)contexts;
- (id)contextForIdentifier:(id)a3;
- (id)contextWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7;
- (id)createContextWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7;
- (void)completeContext:(id)a3 withPayload:(id)a4 error:(id)a5 isFinal:(BOOL)a6;
@end

@implementation HMDModernTransportMessageContextManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_destroyWeak((id *)&self->_factory);
}

- (NSMutableDictionary)contexts
{
  return self->_contexts;
}

- (HMDModernTransportMessageContextFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  return (HMDModernTransportMessageContextFactory *)WeakRetained;
}

- (id)contextWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[HMDModernTransportMessageContext alloc] initWithMessage:v15 options:v14 completionHandler:v13 dateProvider:v12 timerProvider:v11];

  return v16;
}

- (void)completeContext:(id)a3 withPayload:(id)a4 error:(id)a5 isFinal:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 identifier];
  id v14 = [(HMDModernTransportMessageContextManager *)self contexts];
  id v15 = [v14 objectForKeyedSubscript:v13];

  if (v15)
  {
    v16 = [v10 messageResponseHandler];

    if (v16)
    {
      v17 = [v10 options];
      int v18 = [v17 expectsMultipleResponses];

      if (v18)
      {
        id v19 = (id)[v11 mutableCopy];
        if (!v19) {
          id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        }
        v20 = [NSNumber numberWithBool:v6];
        [v19 setObject:v20 forKeyedSubscript:@"kRemoteMessageIsFinalResponseKey"];

        uint64_t v21 = [v19 copy];
        id v11 = (id)v21;
      }
      [v10 messageQualityOfService];
      dispatch_qos_class_t v22 = HMFQOSClassFromQualityOfService();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __85__HMDModernTransportMessageContextManager_completeContext_withPayload_error_isFinal___block_invoke;
      block[3] = &unk_264A2F2F8;
      id v32 = v10;
      id v33 = v12;
      id v11 = v11;
      id v34 = v11;
      v23 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v22, 0, block);
      v23[2]();
    }
    if (v6)
    {
      [v10 done];
      v24 = [(HMDModernTransportMessageContextManager *)self contexts];
      [v24 removeObjectForKey:v13];
    }
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = HMFGetLogIdentifier();
      v29 = [v10 identifier];
      v30 = [v10 messageID];
      *(_DWORD *)buf = 138544130;
      v36 = v28;
      __int16 v37 = 2112;
      v38 = v29;
      __int16 v39 = 2112;
      v40 = v30;
      __int16 v41 = 2112;
      id v42 = v12;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Completed context %@ for message %@ with error: %@", buf, 0x2Au);
    }
  }
}

void __85__HMDModernTransportMessageContextManager_completeContext_withPayload_error_isFinal___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageResponseHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)contextForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HMDModernTransportMessageContextManager *)self contexts];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)createContextWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(HMDModernTransportMessageContextManager *)self factory];
  int v18 = [v17 contextWithMessage:v12 options:v13 completionHandler:v14 dateProvider:v15 timerProvider:v16];

  if (v18)
  {
    id v19 = [(HMDModernTransportMessageContextManager *)self contexts];
    v20 = [v18 identifier];
    [v19 setObject:v18 forKeyedSubscript:v20];

    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    dispatch_qos_class_t v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = id v29 = v13;
      [v18 identifier];
      v25 = v30 = v21;
      v26 = [v12 identifier];
      *(_DWORD *)buf = 138543874;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = v25;
      __int16 v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Created context %@ for message %@", buf, 0x20u);

      uint64_t v21 = v30;
      id v13 = v29;
    }

    id v27 = v18;
  }

  return v18;
}

- (HMDModernTransportMessageContextManager)initWithFactory:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDModernTransportMessageContextManager;
  v5 = [(HMDModernTransportMessageContextManager *)&v10 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_factory, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    contexts = v6->_contexts;
    v6->_contexts = v7;
  }
  return v6;
}

- (HMDModernTransportMessageContextManager)init
{
  return [(HMDModernTransportMessageContextManager *)self initWithFactory:self];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_85468 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_85468, &__block_literal_global_85469);
  }
  id v2 = (void *)logCategory__hmf_once_v3_85470;
  return v2;
}

void __54__HMDModernTransportMessageContextManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_85470;
  logCategory__hmf_once_v3_85470 = v0;
}

@end