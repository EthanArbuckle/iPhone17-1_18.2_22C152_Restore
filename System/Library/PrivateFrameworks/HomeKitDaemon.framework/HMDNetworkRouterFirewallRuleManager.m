@interface HMDNetworkRouterFirewallRuleManager
+ (HMDNetworkRouterFirewallRuleManager)sharedInstance;
+ (double)_intervalPreferenceForKey:(void *)a3 defaultValue:;
+ (double)defaultCloudFetchInterval;
+ (double)defaultCloudFetchRetryInterval;
+ (id)logCategory;
- (HMBLocalDatabase)localDatabase;
- (HMDNetworkRouterFirewallRuleManager)init;
- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3;
- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3 coordinatorFactory:(id)a4;
- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3 notificationCenter:(id)a4 workQueue:(id)a5 coordinatorFactory:(id)a6;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)coordinator;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinatorFactory)coordinatorFactory;
- (NSArray)activeClients;
- (NSMutableArray)clients;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (int64_t)state;
- (unint64_t)operationsInProgressCount;
- (void)__beginOperationWithBlock:(os_unfair_lock_s *)a1;
- (void)__finishOperationWithCallbackBlock:(void *)a1;
- (void)__invokeCompletions:(void *)a3 withError:;
- (void)__notifyCoordinatorThatClientsChanged;
- (void)__startupOrShutdownIfNecessary;
- (void)_addOverridesWithData:(char)a3 replace:(void *)a4 completion:;
- (void)_dumpCloudRecordsForProductGroup:(void *)a3 productNumber:(char)a4 rawOutput:(char)a5 listOnly:(char)a6 verifySignatures:(void *)a7 completion:;
- (void)_dumpLocalRuleConfigurationsForProductGroup:(void *)a3 productNumber:(void *)a4 firmwareVersion:(char)a5 ignoreOverrides:(char)a6 rawOutput:(void *)a7 completion:;
- (void)_fetchCloudChangesIgnoringLastFetchedAccessories:(BOOL)a3 forceChangeNotifications:(BOOL)a4 completion:(id)a5;
- (void)_removeOverridesForProductGroup:(void *)a3 productNumber:(void *)a4 completion:;
- (void)addOverrides:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didCompleteScheduledCloudFetch;
- (void)dumpAllLocalRulesIgnoringOverrides:(BOOL)a3 rawOutput:(BOOL)a4 completion:(id)a5;
- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7;
- (void)dumpLocalRulesForProductGroup:(id)a3 ignoreOverrides:(BOOL)a4 rawOutput:(BOOL)a5 completion:(id)a6;
- (void)dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8;
- (void)dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8;
- (void)fetchCloudChangesWithCompletion:(id)a3;
- (void)fetchPairedMetadataVersionConfigurationsForAccessories:(id)a3 completion:(id)a4;
- (void)fetchRulesForAccessories:(id)a3 completion:(id)a4;
- (void)forceFetchCloudChangesAndForceChangeNotifications:(BOOL)a3 completion:(id)a4;
- (void)listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5;
- (void)removeAllLocalRulesWithCompletion:(id)a3;
- (void)removeAllOverridesWithCompletion:(id)a3;
- (void)removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 completion:(id)a5;
- (void)setCoordinator:(id)a3;
- (void)setOperationsInProgressCount:(unint64_t)a3;
- (void)setOverrides:(id)a3 completion:(id)a4;
- (void)setState:(int64_t)a3;
- (void)shutdownForClient:(id)a3;
- (void)startupForClient:(id)a3 completion:(id)a4;
@end

@implementation HMDNetworkRouterFirewallRuleManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinatorFactory)coordinatorFactory
{
  return self->_coordinatorFactory;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMBLocalDatabase)localDatabase
{
  return self->_localDatabase;
}

- (void)forceFetchCloudChangesAndForceChangeNotifications:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __100__HMDNetworkRouterFirewallRuleManager_forceFetchCloudChangesAndForceChangeNotifications_completion___block_invoke;
  v8[3] = &unk_264A253E8;
  id v9 = v6;
  id v7 = v6;
  [(HMDNetworkRouterFirewallRuleManager *)self _fetchCloudChangesIgnoringLastFetchedAccessories:1 forceChangeNotifications:v4 completion:v8];
}

uint64_t __100__HMDNetworkRouterFirewallRuleManager_forceFetchCloudChangesAndForceChangeNotifications_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 completion:(id)a5
{
}

- (void)_removeOverridesForProductGroup:(void *)a3 productNumber:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a1)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke;
    v11[3] = &unk_264A1B360;
    id v14 = v9;
    id v12 = v7;
    id v13 = v8;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:](a1, v11);
  }
}

void __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke_2;
    v24[3] = &unk_264A2F870;
    id v26 = *(id *)(a1 + 48);
    id v25 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v24);

    id v7 = v26;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v5 coordinator];
    v10 = v9;
    if (v8)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v23 = 0;
      id v13 = (id *)&v23;
      char v14 = [v9 removeOverridesForProductGroup:v11 productNumber:v12 error:&v23];
    }
    else
    {
      uint64_t v22 = 0;
      id v13 = (id *)&v22;
      char v14 = [v9 removeAllOverridesWithError:&v22];
    }
    char v15 = v14;
    id v16 = *v13;

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke_3;
    v18[3] = &unk_264A24FC8;
    char v21 = v15;
    id v17 = *(id *)(a1 + 48);
    id v19 = v16;
    id v20 = v17;
    id v7 = v16;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v18);
  }
}

- (void)__beginOperationWithBlock:(os_unfair_lock_s *)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = [(os_unfair_lock_s *)a1 operationsInProgressCount] + 1;
    [(os_unfair_lock_s *)a1 setOperationsInProgressCount:v4];
    os_unfair_lock_unlock(a1 + 2);
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = a1;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Operation started (%lu operations now pending)", buf, 0x16u);
    }
    id v9 = [(os_unfair_lock_s *)v6 workQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__HMDNetworkRouterFirewallRuleManager___beginOperationWithBlock___block_invoke;
    v10[3] = &unk_264A2F870;
    v10[4] = v6;
    id v11 = v3;
    dispatch_async(v9, v10);
  }
}

void __65__HMDNetworkRouterFirewallRuleManager___beginOperationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  if (v2 == 1 || v2 == 3)
  {
    uint64_t v6 = a1 + 32;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v6 + 8);
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = 15;
  }
  else
  {
    if (v2 == 2)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v9();
      return;
    }
    uint64_t v10 = a1 + 32;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v10 + 8);
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = -1;
  }
  id v11 = [v7 hmErrorWithCode:v8];
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v4, v11);
}

uint64_t __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)__finishOperationWithCallbackBlock:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 workQueue];
    dispatch_assert_queue_V2(v4);

    uint64_t v5 = [a1 callbackQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__HMDNetworkRouterFirewallRuleManager___finishOperationWithCallbackBlock___block_invoke;
    v6[3] = &unk_264A2F870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void __74__HMDNetworkRouterFirewallRuleManager___finishOperationWithCallbackBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HMDNetworkRouterFirewallRuleManager___finishOperationWithCallbackBlock___block_invoke_2;
  block[3] = &unk_264A2F7F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __74__HMDNetworkRouterFirewallRuleManager___finishOperationWithCallbackBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  if (v1)
  {
    int v2 = [*(id *)(a1 + 32) workQueue];
    dispatch_assert_queue_V2(v2);

    os_unfair_lock_lock_with_options();
    uint64_t v3 = [(os_unfair_lock_s *)v1 operationsInProgressCount];
    if (v3)
    {
      uint64_t v4 = v3 - 1;
      [(os_unfair_lock_s *)v1 setOperationsInProgressCount:v3 - 1];
    }
    else
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      uint64_t v10 = v1;
      HMFGetOSLogHandle();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v16 = int v15 = 138543362;
        uint64_t v12 = (void *)v16;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Operation count unbalanced", (uint8_t *)&v15, 0xCu);
      }
      id v13 = [[HMDAssertionLogEvent alloc] initWithReason:@"Operation count unbalanced"];
      __int16 v14 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v14 submitLogEvent:v13];

      uint64_t v4 = 0;
    }
    os_unfair_lock_unlock(v1 + 2);
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    uint64_t v6 = v1;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = (uint64_t)v8;
      __int16 v17 = 2048;
      uint64_t v18 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Operation finished (%lu operations now pending)", (uint8_t *)&v15, 0x16u);
    }
    -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](v6);
  }
}

- (void)__startupOrShutdownIfNecessary
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = [(os_unfair_lock_s *)a1 state];
    if ((v2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      uint64_t v3 = v2;
      uint64_t v4 = [(os_unfair_lock_s *)a1 clients];
      unint64_t v5 = [v4 count];
      if (!v5) {
        goto LABEL_13;
      }
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [v4 objectAtIndex:v7];
        id v9 = [v8 client];

        if (v9)
        {
          ++v7;
        }
        else
        {
          [v4 removeObjectAtIndex:v7];
          --v5;
          ++v6;
        }
      }
      while (v7 < v5);
      if (v6)
      {
        uint64_t v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = a1;
        uint64_t v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)v58 = 138543874;
          *(void *)&v58[4] = v13;
          *(_WORD *)&v58[12] = 2048;
          *(void *)&v58[14] = v6;
          *(_WORD *)&v58[22] = 2048;
          v59 = (void *)v5;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Purged %lu deallocated client(s) (now have %lu)", v58, 0x20u);
        }
        char v14 = 1;
      }
      else
      {
LABEL_13:
        char v14 = 0;
      }
      os_unfair_lock_lock_with_options();
      uint64_t v15 = [(os_unfair_lock_s *)a1 operationsInProgressCount];
      os_unfair_lock_unlock(a1 + 2);
      BOOL v16 = (v5 | v15) != 0;
      if (v3 || !(v5 | v15))
      {
        if (v3 != 2) {
          BOOL v16 = 1;
        }
        if (v16)
        {
          char v25 = v14 ^ 1;
          if (v3 != 2) {
            char v25 = 1;
          }
          if ((v25 & 1) == 0) {
            -[HMDNetworkRouterFirewallRuleManager __notifyCoordinatorThatClientsChanged](a1);
          }
        }
        else
        {
          id v26 = [(os_unfair_lock_s *)a1 workQueue];
          dispatch_assert_queue_V2(v26);

          if ([(os_unfair_lock_s *)a1 state] != 2)
          {
            v46 = (void *)MEMORY[0x230FBD990]();
            v47 = a1;
            v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              v49 = HMFGetLogIdentifier();
              *(_DWORD *)v58 = 138543362;
              *(void *)&v58[4] = v49;
              _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must be running", v58, 0xCu);
            }
            v50 = [[HMDAssertionLogEvent alloc] initWithReason:@"Must be running"];
            v51 = +[HMDMetricsManager sharedLogEventSubmitter];
            [v51 submitLogEvent:v50];
          }
          os_unfair_lock_lock_with_options();
          if ([(os_unfair_lock_s *)a1 operationsInProgressCount])
          {
            v52 = (void *)MEMORY[0x230FBD990]();
            v53 = a1;
            HMFGetOSLogHandle();
            v54 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
            {
              v55 = HMFGetLogIdentifier();
              *(_DWORD *)v58 = 138543362;
              *(void *)&v58[4] = v55;
              _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have finished all operations", v58, 0xCu);
            }
            v56 = [[HMDAssertionLogEvent alloc] initWithReason:@"Must have finished all operations"];
            v57 = +[HMDMetricsManager sharedLogEventSubmitter];
            [v57 submitLogEvent:v56];
          }
          os_unfair_lock_unlock(a1 + 2);
          v27 = (void *)MEMORY[0x230FBD990]();
          v28 = a1;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = HMFGetLogIdentifier();
            *(_DWORD *)v58 = 138543362;
            *(void *)&v58[4] = v30;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Shutdown initiated", v58, 0xCu);
          }
          [(os_unfair_lock_s *)v28 setState:3];
          v31 = [(os_unfair_lock_s *)v28 coordinator];
          *(void *)v58 = MEMORY[0x263EF8330];
          *(void *)&v58[8] = 3221225472;
          *(void *)&v58[16] = __49__HMDNetworkRouterFirewallRuleManager___shutdown__block_invoke;
          v59 = &unk_264A2F3E8;
          v60 = v28;
          [v31 shutdownWithCompletion:v58];
        }
      }
      else
      {
        __int16 v17 = [(os_unfair_lock_s *)a1 workQueue];
        dispatch_assert_queue_V2(v17);

        if ([(os_unfair_lock_s *)a1 state])
        {
          v40 = (void *)MEMORY[0x230FBD990]();
          v41 = a1;
          v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            v43 = HMFGetLogIdentifier();
            *(_DWORD *)v58 = 138543362;
            *(void *)&v58[4] = v43;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must be stopped", v58, 0xCu);
          }
          v44 = [[HMDAssertionLogEvent alloc] initWithReason:@"Must be stopped"];
          v45 = +[HMDMetricsManager sharedLogEventSubmitter];
          [v45 submitLogEvent:v44];
        }
        uint64_t v18 = (void *)MEMORY[0x230FBD990]();
        uint64_t v19 = a1;
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          char v21 = HMFGetLogIdentifier();
          *(_DWORD *)v58 = 138543362;
          *(void *)&v58[4] = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Startup initiated", v58, 0xCu);
        }
        [(os_unfair_lock_s *)v19 setState:1];
        uint64_t v22 = [(os_unfair_lock_s *)v19 coordinatorFactory];

        if (v22)
        {
          uint64_t v23 = [(os_unfair_lock_s *)v19 coordinatorFactory];
          v24 = [v23 createCoordinator];
        }
        else
        {
          v32 = [HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator alloc];
          uint64_t v23 = [(os_unfair_lock_s *)v19 notificationCenter];
          [(id)objc_opt_class() defaultCloudFetchInterval];
          double v34 = v33;
          [(id)objc_opt_class() defaultCloudFetchRetryInterval];
          double v36 = v35;
          v37 = [(os_unfair_lock_s *)v19 workQueue];
          v24 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v32 initWithFirewallRuleManager:v19 notificationCenter:v23 cloudFetchInterval:v37 cloudFetchRetryInterval:v34 ownerQueue:v36];
        }
        v38 = [(os_unfair_lock_s *)v19 localDatabase];
        *(void *)v58 = MEMORY[0x263EF8330];
        *(void *)&v58[8] = 3221225472;
        *(void *)&v58[16] = __48__HMDNetworkRouterFirewallRuleManager___startup__block_invoke;
        v59 = &unk_264A2F370;
        v60 = v19;
        v61 = v24;
        v39 = v24;
        [(HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)v39 startupWithLocalDatabase:v38 completion:v58];
      }
    }
  }
}

- (void)__notifyCoordinatorThatClientsChanged
{
  if (a1)
  {
    uint64_t v2 = [a1 workQueue];
    dispatch_assert_queue_V2(v2);

    id v3 = [a1 coordinator];
    if (objc_opt_respondsToSelector()) {
      [v3 firewallRuleManagerClientsDidChange];
    }
  }
}

void __49__HMDNetworkRouterFirewallRuleManager___shutdown__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    unint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    unint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 32) setCoordinator:0];
  [*(id *)(a1 + 32) setState:0];
  -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](*(void *)(a1 + 32));
}

void __48__HMDNetworkRouterFirewallRuleManager___startup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = [*(id *)(a1 + 32) clients];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  BOOL v16 = __48__HMDNetworkRouterFirewallRuleManager___startup__block_invoke_2;
  __int16 v17 = &unk_264A1B248;
  uint64_t v18 = *(void *)(a1 + 32);
  id v7 = v6;
  id v19 = v7;
  uint64_t v8 = (void *)MEMORY[0x230FBD990](objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v14));
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v21 = v12;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Startup failed: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", 0, v14, v15, v16, v17, v18);
    [v5 removeAllObjects];
    -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](*(void **)(a1 + 32), v7, v3);
  }
  else
  {
    if (v11)
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v21 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Startup completed successfully", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setCoordinator:", *(void *)(a1 + 40), v14, v15, v16, v17, v18);
    [*(id *)(a1 + 32) setState:2];
    -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](*(void **)(a1 + 32), v7, 0);
    -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](*(void *)(a1 + 32));
  }
}

void __48__HMDNetworkRouterFirewallRuleManager___startup__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 startupCompletion];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = _Block_copy(v4);
    [v6 addObject:v7];

    [v3 setStartupCompletion:0];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Completion should not have been called yet", (uint8_t *)&v14, 0xCu);
    }
    id v12 = [[HMDAssertionLogEvent alloc] initWithReason:@"Completion should not have been called yet"];
    uint64_t v13 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v13 submitLogEvent:v12];
  }
}

- (void)__invokeCompletions:(void *)a3 withError:
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && [v5 count])
  {
    id v7 = [a1 callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__HMDNetworkRouterFirewallRuleManager___invokeCompletions_withError___block_invoke;
    block[3] = &unk_264A2F2F8;
    block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

void __69__HMDNetworkRouterFirewallRuleManager___invokeCompletions_withError___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)removeAllOverridesWithCompletion:(id)a3
{
}

- (void)addOverrides:(id)a3 completion:(id)a4
{
}

- (void)_addOverridesWithData:(char)a3 replace:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a4;
  long long v9 = v8;
  if (a1)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke;
    v10[3] = &unk_264A1B338;
    id v12 = v8;
    id v11 = v7;
    char v13 = a3;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:](a1, v10);
  }
}

void __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_2;
    v22[3] = &unk_264A2F870;
    id v24 = *(id *)(a1 + 40);
    id v23 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v22);

    id v7 = v24;
  }
  else
  {
    id v7 = +[HMDNetworkRouterFirewallRuleManagerOverrideParser parseFromData:*(void *)(a1 + 32)];
    if (v7)
    {
      id v8 = [v5 coordinator];
      long long v9 = (void *)[v7 copy];
      uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      id v19 = 0;
      char v11 = [v8 addOverrides:v9 replace:v10 error:&v19];
      id v12 = v19;

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_4;
      v15[3] = &unk_264A24FC8;
      char v18 = v11;
      id v13 = *(id *)(a1 + 40);
      id v16 = v12;
      id v17 = v13;
      id v14 = v12;
      -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v15);
    }
    else
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_3;
      v20[3] = &unk_264A2DFA0;
      id v21 = *(id *)(a1 + 40);
      -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v20);
      id v14 = v21;
    }
  }
}

uint64_t __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (void)setOverrides:(id)a3 completion:(id)a4
{
}

- (void)dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  char v18 = v17;
  if (self)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke;
    v19[3] = &unk_264A1B2E8;
    id v23 = v17;
    id v20 = v14;
    id v21 = v15;
    id v22 = v16;
    BOOL v24 = a6;
    BOOL v25 = a7;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v19);
  }
}

void __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_2;
    v24[3] = &unk_264A2F870;
    id v26 = *(id *)(a1 + 56);
    id v25 = v5;
    id v6 = a2;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v6, v24);

    id v7 = v26;
  }
  else
  {
    id v8 = a2;
    long long v9 = [v8 coordinator];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v14 = *(unsigned __int8 *)(a1 + 65);
    id v23 = 0;
    id v15 = [v9 dumpPairedMetadataForProductGroup:v10 productNumber:v11 firmwareVersion:v12 ignoreOverrides:v13 rawOutput:v14 error:&v23];
    id v16 = v23;

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_3;
    v19[3] = &unk_264A2EE80;
    id v20 = v15;
    id v17 = *(id *)(a1 + 56);
    id v21 = v16;
    id v22 = v17;
    id v7 = v16;
    id v18 = v15;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v8, v19);
  }
}

uint64_t __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, a1[5]);
  }
}

- (void)removeAllLocalRulesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke;
  v6[3] = &unk_264A1B310;
  id v7 = v4;
  id v5 = v4;
  -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v6);
}

void __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke_2;
    v18[3] = &unk_264A2F870;
    id v20 = *(id *)(a1 + 32);
    id v19 = v5;
    id v6 = a2;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v6, v18);

    id v7 = v20;
  }
  else
  {
    id v8 = a2;
    long long v9 = [v8 coordinator];
    id v17 = 0;
    char v10 = [v9 removeAllLocalRulesWithError:&v17];
    id v11 = v17;

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke_3;
    v13[3] = &unk_264A24FC8;
    id v12 = *(id *)(a1 + 32);
    char v16 = v10;
    id v14 = v11;
    id v15 = v12;
    id v7 = v11;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v8, v13);
  }
}

uint64_t __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8
{
}

- (void)_dumpLocalRuleConfigurationsForProductGroup:(void *)a3 productNumber:(void *)a4 firmwareVersion:(char)a5 ignoreOverrides:(char)a6 rawOutput:(void *)a7 completion:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = v16;
  if (a1)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke;
    v18[3] = &unk_264A1B2E8;
    id v22 = v16;
    id v19 = v13;
    id v20 = v14;
    id v21 = v15;
    char v23 = a5;
    char v24 = a6;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:](a1, v18);
  }
}

void __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_2;
    v24[3] = &unk_264A2F870;
    id v26 = *(id *)(a1 + 56);
    id v25 = v5;
    id v6 = a2;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v6, v24);

    id v7 = v26;
  }
  else
  {
    id v8 = a2;
    long long v9 = [v8 coordinator];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v14 = *(unsigned __int8 *)(a1 + 65);
    id v23 = 0;
    id v15 = [v9 dumpLocalRulesForProductGroup:v10 productNumber:v11 firmwareVersion:v12 ignoreOverrides:v13 rawOutput:v14 error:&v23];
    id v16 = v23;

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_3;
    v19[3] = &unk_264A2EE80;
    id v20 = v15;
    id v17 = *(id *)(a1 + 56);
    id v21 = v16;
    id v22 = v17;
    id v7 = v16;
    id v18 = v15;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v8, v19);
  }
}

uint64_t __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, a1[5]);
  }
}

- (void)dumpLocalRulesForProductGroup:(id)a3 ignoreOverrides:(BOOL)a4 rawOutput:(BOOL)a5 completion:(id)a6
{
}

- (void)dumpAllLocalRulesIgnoringOverrides:(BOOL)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
}

- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7
{
}

- (void)_dumpCloudRecordsForProductGroup:(void *)a3 productNumber:(char)a4 rawOutput:(char)a5 listOnly:(char)a6 verifySignatures:(void *)a7 completion:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a7;
  id v16 = v15;
  if (a1)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke;
    v17[3] = &unk_264A1B2C0;
    id v20 = v15;
    id v18 = v13;
    id v19 = v14;
    char v21 = a4;
    char v22 = a5;
    char v23 = a6;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:](a1, v17);
  }
}

void __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_2;
    v18[3] = &unk_264A2F870;
    id v7 = &v20;
    id v20 = *(id *)(a1 + 48);
    id v8 = &v19;
    id v19 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v18);
  }
  else
  {
    long long v9 = [v5 coordinator];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 58);
    uint64_t v14 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_3;
    v15[3] = &unk_264A1ED08;
    id v7 = &v16;
    id v16 = v5;
    id v8 = &v17;
    id v17 = *(id *)(a1 + 48);
    [v9 dumpCloudRecordsForProductGroup:v14 productNumber:v10 rawOutput:v11 listOnly:v12 verifySignatures:v13 completion:v15];
  }
}

uint64_t __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_4;
  v11[3] = &unk_264A2EE80;
  id v12 = v5;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v7, v11);
}

uint64_t __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, a1[5]);
  }
}

- (void)listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
}

- (void)fetchPairedMetadataVersionConfigurationsForAccessories:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __105__HMDNetworkRouterFirewallRuleManager_fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke;
  v10[3] = &unk_264A1B298;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v10);
}

void __105__HMDNetworkRouterFirewallRuleManager_fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __105__HMDNetworkRouterFirewallRuleManager_fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke_2;
    v15[3] = &unk_264A2F870;
    id v17 = *(id *)(a1 + 40);
    id v16 = v5;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](a2, v15);
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    if (a2)
    {
      id v8 = v6;
      id v9 = [a2 workQueue];
      dispatch_assert_queue_V2(v9);

      id v10 = [a2 coordinator];
      id v21 = 0;
      id v11 = [v10 fetchPairedMetadataVersionConfigurationsForAccessories:v8 qualityOfService:17 ignoreOverrides:0 error:&v21];

      id v12 = v21;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      if (v11)
      {
        id v13 = __106__HMDNetworkRouterFirewallRuleManager__fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke_2;
        id v14 = v11;
      }
      else
      {
        id v13 = __106__HMDNetworkRouterFirewallRuleManager__fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke;
        id v14 = v12;
      }
      v18[2] = v13;
      v18[3] = &unk_264A2F870;
      id v20 = v7;
      id v19 = v14;
      -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](a2, v18);
    }
  }
}

uint64_t __105__HMDNetworkRouterFirewallRuleManager_fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __106__HMDNetworkRouterFirewallRuleManager__fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __106__HMDNetworkRouterFirewallRuleManager__fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchRulesForAccessories:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke;
  v10[3] = &unk_264A1B298;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v10);
}

void __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_2;
    v14[3] = &unk_264A2F870;
    id v7 = &v16;
    id v16 = *(id *)(a1 + 40);
    id v8 = &v15;
    id v15 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v14);
  }
  else
  {
    id v9 = [v5 coordinator];
    uint64_t v10 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_3;
    v11[3] = &unk_264A26250;
    id v7 = &v12;
    id v12 = v5;
    id v8 = &v13;
    id v13 = *(id *)(a1 + 40);
    [v9 fetchRulesForAccessories:v10 qualityOfService:17 ignoreOverrides:0 completion:v11];
  }
}

uint64_t __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_4;
  v11[3] = &unk_264A2EE80;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v7, v11);
}

uint64_t __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_fetchCloudChangesIgnoringLastFetchedAccessories:(BOOL)a3 forceChangeNotifications:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke;
  v10[3] = &unk_264A1B270;
  id v11 = v8;
  BOOL v12 = a3;
  BOOL v13 = a4;
  id v9 = v8;
  -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v10);
}

void __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_2;
    v15[3] = &unk_264A2F870;
    id v7 = &v17;
    id v17 = *(id *)(a1 + 32);
    id v8 = &v16;
    id v16 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v15);
  }
  else
  {
    id v9 = [v5 coordinator];
    uint64_t v10 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 41);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_3;
    v12[3] = &unk_264A26250;
    id v7 = &v13;
    id v13 = v5;
    id v8 = &v14;
    id v14 = *(id *)(a1 + 32);
    [v9 fetchCloudChangesWithQualityOfService:17 ignoreLastFetchedAccessories:v10 forceChangeNotifications:v11 completion:v12];
  }
}

uint64_t __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_4;
  v11[3] = &unk_264A2EE80;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v7, v11);
}

uint64_t __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchCloudChangesWithCompletion:(id)a3
{
}

- (void)didCompleteScheduledCloudFetch
{
  uint64_t v3 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDNetworkRouterFirewallRuleManager_didCompleteScheduledCloudFetch__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __69__HMDNetworkRouterFirewallRuleManager_didCompleteScheduledCloudFetch__block_invoke(uint64_t a1)
{
}

- (NSArray)activeClients
{
  uint64_t v3 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDNetworkRouterFirewallRuleManager *)self clients];
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HMDNetworkRouterFirewallRuleManager_activeClients__block_invoke;
  v9[3] = &unk_264A1B220;
  id v10 = v5;
  id v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
  id v7 = (void *)[v6 copy];

  return (NSArray *)v7;
}

void __52__HMDNetworkRouterFirewallRuleManager_activeClients__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 client];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v3 = v4;
  }
}

- (void)shutdownForClient:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDNetworkRouterFirewallRuleManager_shutdownForClient___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDNetworkRouterFirewallRuleManager_shutdownForClient___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) clients];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__56914;
  v43 = __Block_byref_object_dispose__56915;
  id v44 = 0;
  uint64_t v35 = 0;
  double v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = __57__HMDNetworkRouterFirewallRuleManager_shutdownForClient___block_invoke_2;
  v31 = &unk_264A1B1F8;
  id v32 = *(id *)(a1 + 40);
  double v33 = &v39;
  double v34 = &v35;
  uint64_t v3 = objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v28);
  if (v40[5])
  {
    id v4 = (void *)MEMORY[0x230FBD990](objc_msgSend(v2, "removeObjectAtIndex:", v36[3], v28, v29, v30, v31));
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v2 count];
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v47 = (uint64_t)v7;
      __int16 v48 = 2048;
      uint64_t v49 = v8;
      __int16 v50 = 2112;
      uint64_t v51 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed active client (now have %lu): %@", buf, 0x20u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) state];
    if (v10 == 2) {
      -[HMDNetworkRouterFirewallRuleManager __notifyCoordinatorThatClientsChanged](*(void **)(a1 + 32));
    }
    uint64_t v11 = [(id)v40[5] startupCompletion];
    if (v11)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 1)
      {
        id v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        char v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v47 = v24;
          id v25 = (void *)v24;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must be starting or stopping", buf, 0xCu);
        }
        id v26 = [[HMDAssertionLogEvent alloc] initWithReason:@"Must be starting or stopping"];
        v27 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v27 submitLogEvent:v26];
      }
      id v12 = *(void **)(a1 + 32);
      id v13 = _Block_copy(v11);
      v45 = v13;
      id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
      id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
      -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](v12, v14, v15);
    }
    -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](*(os_unfair_lock_s **)(a1 + 32));
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990](v3);
    id v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = (uint64_t)v19;
      __int16 v48 = 2112;
      uint64_t v49 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Ignoring unbalanced shutdown request for client %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
}

void __57__HMDNetworkRouterFirewallRuleManager_shutdownForClient___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v8 = [v10 client];
  uint64_t v9 = (void *)a1[4];

  if (v8 == v9)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)startupForClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke(id *a1)
{
  v44[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1[4] clients];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  double v34 = __Block_byref_object_copy__56914;
  uint64_t v35 = __Block_byref_object_dispose__56915;
  id v36 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke_39;
  v28[3] = &unk_264A1B1D0;
  id v29 = a1[5];
  v30 = &v31;
  uint64_t v3 = objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);
  if (v32[5])
  {
    id v4 = (void *)MEMORY[0x230FBD990](v3);
    id v5 = a1[4];
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = a1[5];
      *(_DWORD *)buf = 138543618;
      id v39 = v7;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring duplicate startup request for client %@", buf, 0x16u);
    }
    id v9 = [(id)v32[5] startupCompletion];
    id v10 = v9;
    if (v9)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke_41;
      v25[3] = &unk_264A2CFF8;
      id v26 = v9;
      id v27 = a1[6];
      [(id)v32[5] setStartupCompletion:v25];

      uint64_t v11 = v26;
    }
    else
    {
      id v23 = a1[4];
      uint64_t v11 = _Block_copy(a1[6]);
      v44[0] = v11;
      uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
      -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](v23, v24, 0);
    }
  }
  else
  {
    id v12 = objc_alloc_init(HMDNetworkRouterFirewallRuleManagerClientState);
    id v13 = (void *)v32[5];
    v32[5] = (uint64_t)v12;

    [(id)v32[5] setClient:a1[5]];
    id v14 = (void *)MEMORY[0x230FBD990]([v2 addObject:v32[5]]);
    id v15 = a1[4];
    HMFGetOSLogHandle();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v2 count];
      id v19 = a1[5];
      *(_DWORD *)buf = 138543874;
      id v39 = v17;
      __int16 v40 = 2048;
      uint64_t v41 = v18;
      __int16 v42 = 2112;
      id v43 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Added active client (now have %lu): %@", buf, 0x20u);
    }
    if ([a1[4] state] == 2)
    {
      id v20 = a1[4];
      id v21 = _Block_copy(a1[6]);
      uint64_t v37 = v21;
      id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
      -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](v20, v22, 0);

      -[HMDNetworkRouterFirewallRuleManager __notifyCoordinatorThatClientsChanged](a1[4]);
    }
    else
    {
      [(id)v32[5] setStartupCompletion:a1[6]];
      -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary]((os_unfair_lock_s *)a1[4]);
    }
  }

  _Block_object_dispose(&v31, 8);
}

void __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke_39(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 client];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setOperationsInProgressCount:(unint64_t)a3
{
  self->_operationsInProgressCount = a3;
}

- (unint64_t)operationsInProgressCount
{
  return self->_operationsInProgressCount;
}

- (NSMutableArray)clients
{
  uint64_t v3 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  clients = self->_clients;
  return clients;
}

- (void)setState:(int64_t)a3
{
  id v5 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  self->_state = a3;
}

- (int64_t)state
{
  uint64_t v3 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return self->_state;
}

- (void)setCoordinator:(id)a3
{
  id v4 = (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)a3;
  id v5 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  coordinator = self->_coordinator;
  self->_coordinator = v4;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)coordinator
{
  uint64_t v3 = [(HMDNetworkRouterFirewallRuleManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  coordinator = self->_coordinator;
  return coordinator;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_state)
  {
    uint64_t v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: should be stopped", buf, 0xCu);
    }
    id v7 = [[HMDAssertionLogEvent alloc] initWithReason:@"should be stopped"];
    id v8 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v8 submitLogEvent:v7];
  }
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkRouterFirewallRuleManager;
  [(HMDNetworkRouterFirewallRuleManager *)&v9 dealloc];
}

- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3 coordinatorFactory:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [v6 defaultCenter];
  id v10 = (const char *)HMFDispatchQueueName();
  uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create(v10, v11);

  id v13 = [(HMDNetworkRouterFirewallRuleManager *)self initWithLocalDatabase:v8 notificationCenter:v9 workQueue:v12 coordinatorFactory:v7];
  return v13;
}

- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3
{
  return [(HMDNetworkRouterFirewallRuleManager *)self initWithLocalDatabase:a3 coordinatorFactory:0];
}

- (HMDNetworkRouterFirewallRuleManager)init
{
  uint64_t v3 = +[HMDDatabase defaultDatabase];
  id v4 = [v3 localDatabase];
  id v5 = [(HMDNetworkRouterFirewallRuleManager *)self initWithLocalDatabase:v4];

  return v5;
}

- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3 notificationCenter:(id)a4 workQueue:(id)a5 coordinatorFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDNetworkRouterFirewallRuleManager;
  id v15 = [(HMDNetworkRouterFirewallRuleManager *)&v26 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_localDatabase, a3);
    objc_storeStrong((id *)&v16->_notificationCenter, a4);
    id v17 = (const char *)HMFDispatchQueueName();
    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    callbackQueue = v16->_callbackQueue;
    v16->_callbackQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->_workQueue, a5);
    objc_storeStrong((id *)&v16->_coordinatorFactory, a6);
    coordinator = v16->_coordinator;
    v16->_coordinator = 0;

    uint64_t v22 = [MEMORY[0x263EFF980] array];
    clients = v16->_clients;
    v16->_clients = (NSMutableArray *)v22;

    v16->_state = 0;
    v16->_operationsInProgressCount = 0;
    uint64_t v24 = v16;
  }

  return v16;
}

+ (double)defaultCloudFetchRetryInterval
{
  return +[HMDNetworkRouterFirewallRuleManager _intervalPreferenceForKey:defaultValue:](3600.0, (uint64_t)a1, @"HMDNetworkRouterFirewallRuleManagerCloudFetchRetryInterval");
}

+ (double)_intervalPreferenceForKey:(void *)a3 defaultValue:
{
  id v4 = a3;
  self;
  id v5 = [MEMORY[0x263F42608] sharedPreferences];
  id v6 = [v5 preferenceForKey:v4];

  id v7 = [v6 numberValue];

  if (v7)
  {
    id v8 = [v6 numberValue];
    [v8 doubleValue];
    a1 = v9;
  }
  return a1;
}

+ (double)defaultCloudFetchInterval
{
  return +[HMDNetworkRouterFirewallRuleManager _intervalPreferenceForKey:defaultValue:](86400.0, (uint64_t)a1, @"HMDNetworkRouterFirewallRuleManagerCloudFetchInterval");
}

+ (HMDNetworkRouterFirewallRuleManager)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_21_56971);
  }
  uint64_t v2 = (void *)sharedInstance_firewallRuleManager;
  return (HMDNetworkRouterFirewallRuleManager *)v2;
}

void __53__HMDNetworkRouterFirewallRuleManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMDNetworkRouterFirewallRuleManager);
  uint64_t v1 = (void *)sharedInstance_firewallRuleManager;
  sharedInstance_firewallRuleManager = (uint64_t)v0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_56974 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_56974, &__block_literal_global_56975);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_56976;
  return v2;
}

void __50__HMDNetworkRouterFirewallRuleManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v1_56976;
  logCategory__hmf_once_v1_56976 = v0;
}

@end