@interface HMDHouseholdMetricsServer
+ (id)logCategory;
- (BOOL)evaluateHouseholdActivityLogEventForSubmission:(id)a3;
- (BOOL)evaluateMetricResponsesForSubmission:(id)a3;
- (HMDHouseholdMetricsDataSource)dataSource;
- (HMDHouseholdMetricsLogEventProviding)householdMetricsProvider;
- (HMDHouseholdMetricsMessaging)remoteMessageDispatcher;
- (HMDHouseholdMetricsRequestContributor)requestContributor;
- (HMDHouseholdMetricsServer)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 householdMetricsProvider:(id)a5 remoteMessageDispatcher:(id)a6 logEventFactories:(id)a7 workQueue:(id)a8;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDictionary)logEventFactories;
- (OS_dispatch_queue)workQueue;
- (void)runHouseholdMetricsDataCollectionAssociatedToDate:(id)a3 forceSubmit:(BOOL)a4;
- (void)sendHouseholdMetricsCollectionRequestToDevices:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5 completion:(id)a6;
@end

@implementation HMDHouseholdMetricsServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logEventFactories, 0);
  objc_storeStrong((id *)&self->_requestContributor, 0);
  objc_destroyWeak((id *)&self->_remoteMessageDispatcher);
  objc_destroyWeak((id *)&self->_householdMetricsProvider);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSDictionary)logEventFactories
{
  return self->_logEventFactories;
}

- (HMDHouseholdMetricsRequestContributor)requestContributor
{
  return self->_requestContributor;
}

- (HMDHouseholdMetricsMessaging)remoteMessageDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteMessageDispatcher);
  return (HMDHouseholdMetricsMessaging *)WeakRetained;
}

- (HMDHouseholdMetricsLogEventProviding)householdMetricsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_householdMetricsProvider);
  return (HMDHouseholdMetricsLogEventProviding *)WeakRetained;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  return (HMMLogEventSubmitting *)WeakRetained;
}

- (HMDHouseholdMetricsDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDHouseholdMetricsDataSource *)WeakRetained;
}

- (void)runHouseholdMetricsDataCollectionAssociatedToDate:(id)a3 forceSubmit:(BOOL)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v5 = [(HMDHouseholdMetricsServer *)self householdMetricsProvider];
  v6 = [(HMDHouseholdMetricsServer *)self dataSource];
  v32 = self;
  v35 = [(HMDHouseholdMetricsServer *)self logEventSubmitter];
  if (v5 && v6 && v35)
  {
    v31 = v5;
    [v6 homeDataSources];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    uint64_t v36 = *(void *)v45;
    v37 = v6;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v38 = v8;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
        if ([v11 isCurrentDevicePrimaryResident])
        {
          v40 = v11;
          v12 = [v6 devicesOnCurrentAccount];
          v13 = [MEMORY[0x1E4F1CA48] array];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v14 = v12;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (!v15) {
            goto LABEL_21;
          }
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v49;
          while (1)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v49 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              v20 = [v19 productInfo];
              if ([v20 productPlatform] == 4)
              {
              }
              else
              {
                v21 = [v19 productInfo];
                uint64_t v22 = [v21 productPlatform];

                if (v22 != 2) {
                  continue;
                }
              }
              [v13 addObject:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v54 count:16];
            if (!v16)
            {
LABEL_21:

              v23 = (void *)[v13 copy];
              uint64_t v9 = v36;
              v6 = v37;
              uint64_t v8 = v38;
              v11 = v40;
              if (v23) {
                goto LABEL_22;
              }
              goto LABEL_27;
            }
          }
        }
        v25 = [v11 enabledResidents];
        uint64_t v26 = [v25 count];

        if (!v26)
        {
          if ([v11 isOwnerUser])
          {
            v27 = [v6 currentDevice];
            v28 = [v27 productInfo];
            uint64_t v29 = [v28 productClass];

            if (v29 == 1)
            {
              v30 = [v6 currentDevice];
              v52 = v30;
              v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];

              if (v23)
              {
LABEL_22:
                v24 = [v11 uuid];
                v41[0] = MEMORY[0x1E4F143A8];
                v41[1] = 3221225472;
                v41[2] = __91__HMDHouseholdMetricsServer_runHouseholdMetricsDataCollectionAssociatedToDate_forceSubmit___block_invoke;
                v41[3] = &unk_1E6A0D0A8;
                BOOL v43 = a4;
                v41[4] = v32;
                v41[5] = v11;
                id v42 = v35;
                [(HMDHouseholdMetricsServer *)v32 sendHouseholdMetricsCollectionRequestToDevices:v23 forHomeWithUUID:v24 associatedToDate:v34 completion:v41];
              }
            }
          }
        }
LABEL_27:
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (!v8)
      {
LABEL_29:

        v5 = v31;
        break;
      }
    }
  }
}

void __91__HMDHouseholdMetricsServer_runHouseholdMetricsDataCollectionAssociatedToDate_forceSubmit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56) || [*(id *)(a1 + 32) evaluateMetricResponsesForSubmission:v3])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91__HMDHouseholdMetricsServer_runHouseholdMetricsDataCollectionAssociatedToDate_forceSubmit___block_invoke_2;
    v8[3] = &unk_1E6A0F3A8;
    long long v9 = *(_OWORD *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    [v3 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Duplicate event detected, not submitting ...", buf, 0xCu);
    }
  }
}

void __91__HMDHouseholdMetricsServer_runHouseholdMetricsDataCollectionAssociatedToDate_forceSubmit___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] logEventFactories];
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      long long v9 = [a1[5] uuid];
      id v10 = [v8 coalescedLogEventsFromLogEvents:v6 homeUUID:v9];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            [a1[6] submitLogEvent:*(void *)(*((void *)&v28 + 1) + 8 * v15++)];
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v13);
      }
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v6;
      uint64_t v20 = [v11 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v25;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v25 != v22) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(a1[6], "submitLogEvent:", *(void *)(*((void *)&v24 + 1) + 8 * v23++), (void)v24);
          }
          while (v21 != v23);
          uint64_t v21 = [v11 countByEnumeratingWithState:&v24 objects:v36 count:16];
        }
        while (v21);
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = a1[4];
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      __int16 v34 = 2112;
      id v35 = v5;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@No factory found for the log event %@, which is impossible", buf, 0x16u);
    }
  }
}

- (void)sendHouseholdMetricsCollectionRequestToDevices:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5 completion:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(HMDHouseholdMetricsServer *)self householdMetricsProvider];
  uint64_t v15 = [(HMDHouseholdMetricsServer *)self remoteMessageDispatcher];
  uint64_t v16 = (void *)v15;
  if (v14 && v15)
  {
    v32 = v13;
    group = dispatch_group_create();
    id v17 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v33 = v10;
    id obj = v10;
    __int16 v34 = v16;
    uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v40)
    {
      uint64_t v18 = *(void *)v50;
      uint64_t v36 = v17;
      v37 = self;
      uint64_t v35 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (objc_msgSend(v20, "isCurrentDevice", v32))
          {
            uint64_t v21 = [v14 householdMetricsForHomeWithUUID:v11 associatedWithDate:v12];
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke;
            v47[3] = &unk_1E6A17CB0;
            v47[4] = self;
            id v48 = v17;
            [v21 enumerateKeysAndObjectsUsingBlock:v47];
          }
          else
          {
            v59[0] = @"homeUUID";
            uint64_t v22 = [v11 UUIDString];
            v59[1] = @"date";
            v60[0] = v22;
            v60[1] = v12;
            uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];

            uint64_t v23 = (void *)MEMORY[0x1D9452090]();
            long long v24 = self;
            long long v25 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              long long v26 = v14;
              id v27 = v12;
              long long v29 = v28 = v11;
              *(_DWORD *)buf = 138543874;
              v54 = v29;
              __int16 v55 = 2112;
              v56 = v20;
              __int16 v57 = 2112;
              v58 = v21;
              _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Sending household metrics request to device=%@, payload=%@", buf, 0x20u);

              id v11 = v28;
              id v12 = v27;
              uint64_t v14 = v26;
              uint64_t v16 = v34;
            }

            dispatch_group_enter(group);
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_3;
            v44[3] = &unk_1E6A11098;
            v44[4] = v24;
            v44[5] = v20;
            id v17 = v36;
            id v45 = v36;
            long long v46 = group;
            [v16 sendMessage:@"HMDHouseholdMetricsHomeDataLogEventRequest" toDevice:v20 withPayload:v21 responseHandler:v44];

            self = v37;
            uint64_t v18 = v35;
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v40);
    }

    long long v30 = [(HMDHouseholdMetricsServer *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_2;
    block[3] = &unk_1E6A193D0;
    block[4] = self;
    id v42 = v17;
    id v13 = v32;
    id v43 = v32;
    id v31 = v17;
    dispatch_group_notify(group, v30, block);

    uint64_t v16 = v34;
    id v10 = v33;
  }
}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  addLogEventsToResponse(v7, v5, *(void **)(a1 + 40));
  os_unfair_lock_unlock(v6);
}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  long long v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received response for household metrics from device=%@, error=, payload=%@", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_4;
  v12[3] = &unk_1E6A0D058;
  v12[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@All responses received (or timed-out)", buf, 0xCu);
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_9;
  v12[3] = &unk_1E6A0D080;
  id v9 = v6;
  id v13 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  os_unfair_lock_unlock(v7);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = (void *)[v9 copy];
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __120__HMDHouseholdMetricsServer_sendHouseholdMetricsCollectionRequestToDevices_forHomeWithUUID_associatedToDate_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) logEventFactories];
  id v7 = [v6 objectForKeyedSubscript:v13];

  if (objc_opt_respondsToSelector())
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      uint64_t v11 = [v7 logEventsFromDictionary:v10];
      if (v11)
      {
        id v12 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
        os_unfair_lock_lock_with_options();
        addLogEventsToResponse(v13, v11, *(void **)(a1 + 40));
        os_unfair_lock_unlock(v12);
      }
    }
  }
}

- (BOOL)evaluateMetricResponsesForSubmission:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:@"householdData"];
  id v5 = v4;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v12 = v11;
          }
          else {
            id v12 = 0;
          }
          id v13 = v12;

          if (!v13)
          {
            id v11 = 0;
LABEL_18:

            BOOL v14 = 0;
            goto LABEL_19;
          }
          if (!-[HMDHouseholdMetricsServer evaluateHouseholdActivityLogEventForSubmission:](self, "evaluateHouseholdActivityLogEventForSubmission:", v13, (void)v16))goto LABEL_18; {
        }
          }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        BOOL v14 = 1;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v14 = 1;
    }
LABEL_19:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)evaluateHouseholdActivityLogEventForSubmission:(id)a3
{
  return (unint64_t)[a3 requestCount] < 2;
}

- (HMDHouseholdMetricsServer)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 householdMetricsProvider:(id)a5 remoteMessageDispatcher:(id)a6 logEventFactories:(id)a7 workQueue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDHouseholdMetricsServer;
  uint64_t v20 = [(HMDHouseholdMetricsServer *)&v23 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_dataSource, v14);
    objc_storeWeak((id *)&v21->_logEventSubmitter, v15);
    objc_storeWeak((id *)&v21->_householdMetricsProvider, v16);
    objc_storeWeak((id *)&v21->_remoteMessageDispatcher, v17);
    objc_storeStrong((id *)&v21->_logEventFactories, a7);
    objc_storeStrong((id *)&v21->_workQueue, a8);
  }

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_76482 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_76482, &__block_literal_global_76483);
  }
  v2 = (void *)logCategory__hmf_once_v11_76484;
  return v2;
}

uint64_t __40__HMDHouseholdMetricsServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11_76484;
  logCategory__hmf_once_v11_76484 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end