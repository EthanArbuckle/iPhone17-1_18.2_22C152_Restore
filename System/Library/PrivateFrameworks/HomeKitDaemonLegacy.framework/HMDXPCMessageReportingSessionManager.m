@interface HMDXPCMessageReportingSessionManager
+ (id)logCategory;
- (HMDXPCMessageReportingSessionManager)init;
- (NSMutableDictionary)sessionsByUUID;
- (id)consumeResponseMessagePayloadsForSessionWithReportContextRequestInfo:(id)a3;
- (id)consumeSessionResultsTimerFactory;
- (id)endSessionTimerFactory;
- (id)performBackgroundRequestHandler;
- (void)addResponseMessagePayload:(id)a3 toSessionWithUUID:(id)a4;
- (void)endSessionWithUUID:(id)a3;
- (void)setConsumeSessionResultsTimerFactory:(id)a3;
- (void)setEndSessionTimerFactory:(id)a3;
- (void)setPerformBackgroundRequestHandler:(id)a3;
- (void)startSessionWithUUID:(id)a3 reportContext:(id)a4 xpcClientConnection:(id)a5;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDXPCMessageReportingSessionManager

- (void)addResponseMessagePayload:(id)a3 toSessionWithUUID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v9 = [(HMDXPCMessageReportingSessionManager *)self sessionsByUUID];
  v10 = [v9 objectForKeyedSubscript:v7];
  v11 = [v10 responseMessagePayloads];

  if (v11)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v15;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Adding response message payload to session with UUID: %@", (uint8_t *)&v16, 0x16u);
    }
    [v11 addObject:v6];
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)sessionsByUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performBackgroundRequestHandler, 0);
  objc_storeStrong(&self->_consumeSessionResultsTimerFactory, 0);
  objc_storeStrong(&self->_endSessionTimerFactory, 0);
  objc_storeStrong((id *)&self->_sessionsByUUID, 0);
}

- (void)setPerformBackgroundRequestHandler:(id)a3
{
}

- (id)performBackgroundRequestHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setConsumeSessionResultsTimerFactory:(id)a3
{
}

- (id)consumeSessionResultsTimerFactory
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setEndSessionTimerFactory:(id)a3
{
}

- (id)endSessionTimerFactory
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(HMDXPCMessageReportingSessionManager *)self sessionsByUUID];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v6)
  {
    v15 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = *(void *)v26;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * i);
      v10 = [(HMDXPCMessageReportingSessionManager *)self sessionsByUUID];
      v11 = [v10 objectForKeyedSubscript:v9];

      id v12 = [v11 consumeSessionResultsTimer];
      LODWORD(v10) = v12 == v4;

      if (v10)
      {
        int v16 = (void *)MEMORY[0x1D9452090]();
        v17 = self;
        HMFGetOSLogHandle();
        __int16 v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v30 = v19;
          __int16 v31 = 2112;
          uint64_t v32 = v9;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Results retrieval timed out for session with UUID: %@", buf, 0x16u);
        }
        uint64_t v20 = [(HMDXPCMessageReportingSessionManager *)v17 sessionsByUUID];
        [v20 setObject:0 forKeyedSubscript:v9];

        v15 = 0;
        goto LABEL_18;
      }
      id v13 = [v11 endSessionTimer];
      BOOL v14 = v13 == v4;

      if (v14)
      {
        v21 = (void *)MEMORY[0x1D9452090]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v30 = v24;
          __int16 v31 = 2112;
          uint64_t v32 = v9;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@End timed out for session with UUID: %@", buf, 0x16u);
        }
        v15 = [v11 UUID];
LABEL_18:

        goto LABEL_19;
      }
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    v15 = 0;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_19:

  os_unfair_lock_unlock(&self->_lock);
  if (v15) {
    [(HMDXPCMessageReportingSessionManager *)self endSessionWithUUID:v15];
  }
}

- (id)consumeResponseMessagePayloadsForSessionWithReportContextRequestInfo:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = [(HMDXPCMessageReportingSessionManager *)self sessionsByUUID];
  uint64_t v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    id v27 = (id)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v11 = [(HMDXPCMessageReportingSessionManager *)self sessionsByUUID];
        id v12 = [v11 objectForKeyedSubscript:v10];

        id v13 = [v12 reportContext];
        BOOL v14 = [v13 requestInfo];
        int v15 = [v14 isEqualToData:v4];

        if (v15)
        {
          int v16 = (void *)MEMORY[0x1D9452090]();
          v17 = self;
          HMFGetOSLogHandle();
          __int16 v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v28 = v16;
            HMFGetLogIdentifier();
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = [v12 responseMessagePayloads];
            uint64_t v21 = [v20 count];
            v22 = [v12 UUID];
            *(_DWORD *)buf = 138543874;
            id v34 = v19;
            __int16 v35 = 2048;
            uint64_t v36 = v21;
            __int16 v37 = 2112;
            v38 = v22;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Consuming %lu response message payloads for session with UUID: %@", buf, 0x20u);

            int v16 = v28;
          }

          v23 = [(HMDXPCMessageReportingSessionManager *)v17 sessionsByUUID];
          v24 = [v12 UUID];
          [v23 setObject:0 forKeyedSubscript:v24];

          id v27 = [v12 responseMessagePayloads];

          goto LABEL_14;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v27 = (id)MEMORY[0x1E4F1CBF0];
  }
LABEL_14:

  os_unfair_lock_unlock(lock);
  return v27;
}

- (void)endSessionWithUUID:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDXPCMessageReportingSessionManager *)self sessionsByUUID];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    HMFGetOSLogHandle();
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v48 = v14;
      __int16 v49 = 2112;
      id v50 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No existing session to end with UUID: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  uint64_t v7 = [v6 consumeSessionResultsTimer];

  if (!v7)
  {
    int v15 = [v6 reportContext];
    int v16 = [v6 xpcClientConnection];
    int v17 = [v16 isActivated];

    __int16 v18 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v19 = [v18 preferenceForKey:@"cachedResponsesCleanupTimeoutSeconds"];
    uint64_t v20 = [v19 numberValue];

    uint64_t v21 = [(HMDXPCMessageReportingSessionManager *)self consumeSessionResultsTimerFactory];
    [v20 doubleValue];
    v22 = v21[2](v21, 0);
    [v6 setConsumeSessionResultsTimer:v22];

    v23 = [v6 consumeSessionResultsTimer];
    [v23 setDelegate:self];

    v24 = [v6 consumeSessionResultsTimer];
    [v24 resume];

    [v6 setEndSessionTimer:0];
    os_unfair_lock_unlock(&self->_lock);
    long long v25 = (void *)MEMORY[0x1D9452090]();
    long long v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v48 = v28;
      __int16 v49 = 2112;
      id v50 = v4;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Ending session with UUID: %@", buf, 0x16u);
    }
    long long v29 = [v15 reportDomain];
    long long v30 = [v15 requestInfo];
    if (v17)
    {
      long long v31 = (void *)MEMORY[0x1D9452090]();
      long long v32 = v26;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v48 = v34;
        __int16 v49 = 2112;
        id v50 = v4;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@XPC client connection is still active so not reporting completion of session with UUID: %@", buf, 0x16u);
      }
    }
    else
    {
      if ([v29 isEqualToString:*MEMORY[0x1E4F2DD00]])
      {
        __int16 v35 = (void *)MEMORY[0x1D9452090]();
        uint64_t v36 = v26;
        __int16 v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v48 = v38;
          __int16 v49 = 2112;
          id v50 = v30;
          _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Reporting completion of Siri request with requestInfo: %@", buf, 0x16u);
        }
        v39 = dispatch_get_global_queue(0, 0);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __59__HMDXPCMessageReportingSessionManager_endSessionWithUUID___block_invoke;
        v45[3] = &unk_1E6A197C8;
        v45[4] = v36;
        id v46 = v30;
        dispatch_async(v39, v45);

        goto LABEL_26;
      }
      if (isInternalBuild() && [v29 isEqualToString:*MEMORY[0x1E4F2DD08]])
      {
        uint64_t v40 = (void *)MEMORY[0x1D9452090]();
        v41 = v26;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v48 = v43;
          __int16 v49 = 2112;
          id v50 = v30;
          _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Reporting completion of HomeUtil request with requestInfo: %@", buf, 0x16u);
        }
        notify_post("HomeUtilAsyncCompletionReportNotification");
        goto LABEL_26;
      }
      long long v31 = (void *)MEMORY[0x1D9452090]();
      long long v32 = v26;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v48 = v44;
        __int16 v49 = 2112;
        id v50 = v29;
        __int16 v51 = 2112;
        v52 = v30;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Not reporting completion of request with unhandled domain: %@, requestInfo: %@", buf, 0x20u);
      }
    }

LABEL_26:

    goto LABEL_27;
  }
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  HMFGetOSLogHandle();
  uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v6 UUID];
    *(_DWORD *)buf = 138543618;
    id v48 = v11;
    __int16 v49 = 2112;
    id v50 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Not ending already-ended session with UUID: %@", buf, 0x16u);
  }
LABEL_7:

  os_unfair_lock_unlock(&self->_lock);
LABEL_27:
}

void __59__HMDXPCMessageReportingSessionManager_endSessionWithUUID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) performBackgroundRequestHandler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__HMDXPCMessageReportingSessionManager_endSessionWithUUID___block_invoke_2;
  v4[3] = &unk_1E6A10888;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  ((void (**)(void, id, void *))v2)[2](v2, v5, v4);
}

void __59__HMDXPCMessageReportingSessionManager_endSessionWithUUID___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 138543618;
      int v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      uint64_t v10 = "%{public}@Successfully reported completion of request with requestInfo: %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543618;
    int v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    uint64_t v10 = "%{public}@Failed to report completion of request with requestInfo: %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }
}

- (void)startSessionWithUUID:(id)a3 reportContext:(id)a4 xpcClientConnection:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 reportTimeout];
  if (v12 <= 0.0) {
    double v13 = 15.0;
  }
  else {
    double v13 = v12;
  }
  int v14 = (void *)MEMORY[0x1D9452090](v11);
  int v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    uint64_t v18 = [v9 reportDomain];
    id v19 = [v9 requestInfo];
    int v27 = 138544386;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    long long v32 = v18;
    __int16 v33 = 2112;
    id v34 = v19;
    __int16 v35 = 2048;
    double v36 = v13;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting reporting session with UUID: %@, reportDomain: %@, requestInfo: %@, timeout: %fs", (uint8_t *)&v27, 0x34u);
  }
  uint64_t v20 = [[HMDXPCMessageReportingSession alloc] initWithUUID:v8 reportContext:v9 xpcClientConnection:v10];
  uint64_t v21 = [(HMDXPCMessageReportingSessionManager *)v15 endSessionTimerFactory];
  v22 = v21[2](v21, 2, v13);
  [(HMDXPCMessageReportingSession *)v20 setEndSessionTimer:v22];

  v23 = [(HMDXPCMessageReportingSession *)v20 endSessionTimer];
  [v23 setDelegate:v15];

  v24 = [(HMDXPCMessageReportingSession *)v20 endSessionTimer];
  [v24 resume];

  p_os_unfair_lock_t lock = &v15->_lock;
  os_unfair_lock_lock_with_options();
  long long v26 = [(HMDXPCMessageReportingSessionManager *)v15 sessionsByUUID];
  [v26 setObject:v20 forKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
}

- (HMDXPCMessageReportingSessionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)HMDXPCMessageReportingSessionManager;
  v2 = [(HMDXPCMessageReportingSessionManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    sessionsByUUID = v2->_sessionsByUUID;
    v2->_sessionsByUUID = (NSMutableDictionary *)v3;

    id endSessionTimerFactory = v2->_endSessionTimerFactory;
    v2->_id endSessionTimerFactory = &__block_literal_global_56999;

    id consumeSessionResultsTimerFactory = v2->_consumeSessionResultsTimerFactory;
    v2->_id consumeSessionResultsTimerFactory = &__block_literal_global_54;

    id performBackgroundRequestHandler = v2->_performBackgroundRequestHandler;
    v2->_id performBackgroundRequestHandler = &__block_literal_global_57_57000;
  }
  return v2;
}

void __44__HMDXPCMessageReportingSessionManager_init__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x1E4F4E5B0];
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)[[v4 alloc] initWithContext:v6];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F4E5A8]) initWithRequestInfo:v8];
  [v7 performRequestWithCompletion:v5];
}

id __44__HMDXPCMessageReportingSessionManager_init__block_invoke_2(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

id __44__HMDXPCMessageReportingSessionManager_init__block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1) {
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_65_57009);
  }
  v2 = (void *)logCategory__hmf_once_v17;
  return v2;
}

uint64_t __51__HMDXPCMessageReportingSessionManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17;
  logCategory__hmf_once_uint64_t v17 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end