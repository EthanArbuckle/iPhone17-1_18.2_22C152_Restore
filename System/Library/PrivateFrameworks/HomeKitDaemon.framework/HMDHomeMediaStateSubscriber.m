@interface HMDHomeMediaStateSubscriber
+ (id)logCategory;
+ (id)shortDescription;
- (HMDHomeMediaStateSubscriber)initWithHomeUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 remoteSubscriptionProvider:(id)a6 localSubscriptionProvider:(id)a7;
- (HMDHomeMediaStateSubscriberDataSource)dataSource;
- (HMESubscriptionProviding)localSubscriptionProvider;
- (HMESubscriptionProviding)remoteSubscriptionProvider;
- (NSMutableDictionary)subscribedAccessoriesToTokenMap;
- (NSUUID)homeUUID;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (id)nonCurrentAccessoryUUIDs;
- (id)topicsForAccessoryUUID:(void *)a1 homeUUID:(void *)a2;
- (void)_localSubscribeForAppleMediaState:(void *)a3 forAccessories:;
- (void)_subscribeForAppleMediaState:(void *)a3 forAccessories:(void *)a4 subscriptionToken:;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)localSubscribeForAppleMediaState;
- (void)localSubscribeForAppleMediaStateForAccessory:(id)a3;
- (void)localUnsubscribeForAppleMediaState;
- (void)localUnsubscribeForAppleMediaStateForAccessory:(id)a3;
- (void)processEvent:(void *)a3 topic:;
- (void)subscribeForAppleMediaStateForAccessory:(id)a3 subscriptionToken:(id)a4;
- (void)subscribeForAppleMediaStateWithSubscriptionToken:(id)a3;
- (void)unsubscribeForAppleMediaStateForAccessory:(id)a3 subscriptionToken:(id)a4;
- (void)unsubscribeForAppleMediaStateWithSubscriptionToken:(id)a3;
@end

@implementation HMDHomeMediaStateSubscriber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedAccessoriesToTokenMap, 0);
  objc_storeStrong((id *)&self->_localSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_remoteSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (NSMutableDictionary)subscribedAccessoriesToTokenMap
{
  return self->_subscribedAccessoriesToTokenMap;
}

- (HMESubscriptionProviding)localSubscriptionProvider
{
  return self->_localSubscriptionProvider;
}

- (HMESubscriptionProviding)remoteSubscriptionProvider
{
  return self->_remoteSubscriptionProvider;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (HMDHomeMediaStateSubscriberDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDHomeMediaStateSubscriberDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDHomeMediaStateSubscriber *)self homeUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
}

- (void)processEvent:(void *)a3 topic:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = [a1 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__HMDHomeMediaStateSubscriber_processEvent_topic___block_invoke;
    block[3] = &unk_264A2F2F8;
    block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

void __50__HMDHomeMediaStateSubscriber_processEvent_topic___block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    id v5 = [v1 workQueue];
    dispatch_assert_queue_V2(v5);

    id v6 = [MEMORY[0x263F0E300] decodeTopic:v4];
    v7 = [v6 asAccessoryTopic];

    if (v7)
    {
      v8 = [v1 homeUUID];
      id v9 = [v7 homeUUID];
      char v10 = objc_msgSend(v8, "hmf_isEqualToUUID:", v9);

      if (v10)
      {
        uint64_t v11 = [v7 accessoryEventTopicSuffixID];
        if (v11 == *MEMORY[0x263F0B2E8])
        {
          id v12 = objc_alloc(MEMORY[0x263F0DFB8]);
          v13 = [v3 encodedData];
          v14 = (void *)[v12 initWithProtoData:v13];

          if (v14)
          {
            v15 = [v7 accessoryUUID];
            id v16 = v14;
            id v17 = v15;
            v18 = [v1 workQueue];
            dispatch_assert_queue_V2(v18);

            v19 = [v1 dataSource];
            v20 = [v19 mediaProfileForAppleMediaAccessoryUUID:v17 mediaStateSubscriber:v1];

            v21 = (void *)MEMORY[0x230FBD990]();
            id v22 = v1;
            v23 = HMFGetOSLogHandle();
            v24 = v23;
            if (v20)
            {
              id v69 = v17;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                v25 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v74 = v25;
                __int16 v75 = 2112;
                id v76 = v69;
                __int16 v77 = 2112;
                id v78 = v16;
                _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating Media State for accessory: %@ to: %@", buf, 0x20u);
              }
              v26 = [MEMORY[0x263EFF9A0] dictionary];
              v27 = [v16 mediaIdentifier];
              [v26 setObject:v27 forKeyedSubscript:*MEMORY[0x263F0D190]];

              v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "playbackState"));
              [v26 setObject:v28 forKeyedSubscript:*MEMORY[0x263F0D1A8]];

              v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "shuffleState"));
              [v26 setObject:v29 forKeyedSubscript:*MEMORY[0x263F0D200]];

              v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "repeatState"));
              [v26 setObject:v30 forKeyedSubscript:*MEMORY[0x263F0D1D0]];

              v31 = NSNumber;
              [v16 volume];
              v32 = objc_msgSend(v31, "numberWithDouble:");
              [v26 setObject:v32 forKeyedSubscript:*MEMORY[0x263F0D220]];

              v33 = [v20 uniqueIdentifier];
              v34 = [v33 UUIDString];
              [v26 setObject:v34 forKeyedSubscript:*MEMORY[0x263F0D180]];

              v35 = [v20 mediaSession];
              v36 = [v35 uuid];
              v37 = [v36 UUIDString];
              [v26 setObject:v37 forKeyedSubscript:*MEMORY[0x263F0D218]];

              v38 = (void *)[v26 copy];
              [v20 handleSessionUpdatedNotification:v38];

              id v17 = v69;
              goto LABEL_35;
            }
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v71 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v74 = v71;
              __int16 v75 = 2112;
              id v76 = v17;
              _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@No media profile found for accessory %@", buf, 0x16u);
            }
LABEL_34:

LABEL_35:

            goto LABEL_36;
          }
          v61 = (void *)MEMORY[0x230FBD990]();
          id v62 = v1;
          v63 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = HMFGetLogIdentifier();
            v65 = [v3 encodedData];
            *(_DWORD *)buf = 138543874;
            v74 = v64;
            __int16 v75 = 2112;
            id v76 = v4;
            __int16 v77 = 2112;
            id v78 = v65;
            v66 = "%{public}@Skipping handling of accessory topic: %@ with bad media state payload: %@";
LABEL_30:
            _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, v66, buf, 0x20u);

            goto LABEL_31;
          }
          goto LABEL_31;
        }
        uint64_t v44 = [v7 accessoryEventTopicSuffixID];
        if (v44 == *MEMORY[0x263F0B310])
        {
          id v45 = objc_alloc(MEMORY[0x263F0DFE8]);
          v46 = [v3 encodedData];
          v14 = (void *)[v45 initWithProtoData:v46];

          if (v14)
          {
            v47 = [v7 accessoryUUID];
            id v16 = v14;
            id v17 = v47;
            v48 = [v1 workQueue];
            dispatch_assert_queue_V2(v48);

            v49 = [v1 dataSource];
            v20 = [v49 mediaProfileForAppleMediaAccessoryUUID:v17 mediaStateSubscriber:v1];

            v21 = (void *)MEMORY[0x230FBD990]();
            id v22 = v1;
            v50 = HMFGetOSLogHandle();
            v24 = v50;
            if (v20)
            {
              v70 = v14;
              v51 = v16;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                v52 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v74 = v52;
                __int16 v75 = 2112;
                id v76 = v17;
                __int16 v77 = 2112;
                id v78 = v51;
                _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating sleep wake state for accessory: %@ to: %@", buf, 0x20u);
              }
              v53 = [MEMORY[0x263EFF9A0] dictionary];
              v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "sleepWakeState"));
              [v53 setObject:v54 forKeyedSubscript:*MEMORY[0x263F0D210]];

              v55 = [v20 uniqueIdentifier];
              v56 = [v55 UUIDString];
              [v53 setObject:v56 forKeyedSubscript:*MEMORY[0x263F0D180]];

              v57 = [v20 mediaSession];
              v58 = [v57 uuid];
              v59 = [v58 UUIDString];
              [v53 setObject:v59 forKeyedSubscript:*MEMORY[0x263F0D218]];

              v60 = (void *)[v53 copy];
              [v20 handleSessionUpdatedNotification:v60];

              id v16 = v51;
              v14 = v70;
              goto LABEL_35;
            }
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v72 = v14;
              v68 = id v67 = v16;
              *(_DWORD *)buf = 138543618;
              v74 = v68;
              __int16 v75 = 2112;
              id v76 = v17;
              _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@No media profile found for accessory %@", buf, 0x16u);

              id v16 = v67;
              v14 = v72;
            }
            goto LABEL_34;
          }
          v61 = (void *)MEMORY[0x230FBD990]();
          id v62 = v1;
          v63 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = HMFGetLogIdentifier();
            v65 = [v3 encodedData];
            *(_DWORD *)buf = 138543874;
            v74 = v64;
            __int16 v75 = 2112;
            id v76 = v4;
            __int16 v77 = 2112;
            id v78 = v65;
            v66 = "%{public}@Skipping handling of accessory topic: %@ with bad sleep wake state payload: %@";
            goto LABEL_30;
          }
LABEL_31:

LABEL_36:

          goto LABEL_37;
        }
        v39 = (void *)MEMORY[0x230FBD990]();
        id v40 = v1;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v74 = v42;
          __int16 v75 = 2112;
          id v76 = v4;
          v43 = "%{public}@Skipping handling of unexpected accessory topic: %@";
          goto LABEL_22;
        }
LABEL_23:

LABEL_37:

        goto LABEL_38;
      }
      v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = v1;
      v41 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v74 = v42;
      __int16 v75 = 2112;
      id v76 = v4;
      v43 = "%{public}@Skipping handling of accessory topic: %@ with unexpected home";
    }
    else
    {
      v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = v1;
      v41 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v74 = v42;
      __int16 v75 = 2112;
      id v76 = v4;
      v43 = "%{public}@Skipping handling of non accessory topic: %@";
    }
LABEL_22:
    _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);

    goto LABEL_23;
  }
LABEL_38:
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
}

- (void)localSubscribeForAppleMediaStateForAccessory:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeMediaStateSubscriber *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 currentAccessoryUUIDsForMediaStateSubscriber:self];
    if (v7
      && ([v4 uuid],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = objc_msgSend(v8, "hmf_isEqualToUUID:", v7),
          v8,
          v9))
    {
      char v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v22 = v13;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Skipping local subscribe to media state for current accessory : %@", buf, 0x16u);
      }
    }
    else
    {
      v14 = [(HMDHomeMediaStateSubscriber *)self workQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __76__HMDHomeMediaStateSubscriber_localSubscribeForAppleMediaStateForAccessory___block_invoke;
      v19[3] = &unk_264A2F820;
      v19[4] = self;
      id v20 = v4;
      dispatch_async(v14, v19);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v18;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to locally subscribe to media state for accessory : %@, nil data source", buf, 0x16u);
    }
  }
}

void __76__HMDHomeMediaStateSubscriber_localSubscribeForAppleMediaStateForAccessory___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  v2 = [*(id *)(a1 + 40) uuid];
  v4[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  -[HMDHomeMediaStateSubscriber _localSubscribeForAppleMediaState:forAccessories:](v1, 1, v3);
}

- (void)_localSubscribeForAppleMediaState:(void *)a3 forAccessories:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v19 = a3;
  if (a1)
  {
    id v4 = [a1 workQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = [MEMORY[0x263EFF980] array];
    id v6 = [MEMORY[0x263EFF980] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v19;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      if (a2) {
        char v10 = v5;
      }
      else {
        char v10 = v6;
      }
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
          v13 = [a1 homeUUID];
          v14 = -[HMDHomeMediaStateSubscriber topicsForAccessoryUUID:homeUUID:](v12, v13);

          [v10 addObjectsFromArray:v14];
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    if ([v5 count] || objc_msgSend(v6, "count"))
    {
      objc_initWeak(&location, a1);
      v15 = [a1 localSubscriptionProvider];
      id v16 = (void *)[v5 copy];
      id v17 = (void *)[v6 copy];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __80__HMDHomeMediaStateSubscriber__localSubscribeForAppleMediaState_forAccessories___block_invoke;
      v20[3] = &unk_264A23068;
      objc_copyWeak(&v22, &location);
      char v23 = a2;
      id v21 = v7;
      [v15 changeRegistrationsForConsumer:a1 topicFilterAdditions:v16 topicFilterRemovals:v17 completion:v20];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
}

- (id)topicsForAccessoryUUID:(void *)a1 homeUUID:(void *)a2
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F0DFA8];
  uint64_t v4 = *MEMORY[0x263F0B2E8];
  id v5 = a2;
  id v6 = a1;
  id v7 = [v3 topicFromSuffixID:v4 homeUUID:v5 accessoryUUID:v6];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B310] homeUUID:v5 accessoryUUID:v6];

  v11[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

void __80__HMDHomeMediaStateSubscriber__localSubscribeForAppleMediaState_forAccessories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  char v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    id v12 = (void *)v11;
    int v13 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    if (v13) {
      v15 = @"subscribe";
    }
    else {
      v15 = @"unsubscribe";
    }
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    char v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Did %@ locally to apple media state for accessories: %@", buf, 0x20u);
  }
  if ([v5 count] && v9)
  {
    id v16 = [v9 workQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __80__HMDHomeMediaStateSubscriber__localSubscribeForAppleMediaState_forAccessories___block_invoke_11;
    v17[3] = &unk_264A2F820;
    id v18 = v5;
    id v19 = v9;
    dispatch_async(v16, v17);
  }
}

void __80__HMDHomeMediaStateSubscriber__localSubscribeForAppleMediaState_forAccessories___block_invoke_11(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, (void)v9);
        -[HMDHomeMediaStateSubscriber processEvent:topic:](*(void **)(a1 + 40), v8, v7);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)localUnsubscribeForAppleMediaStateForAccessory:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeMediaStateSubscriber *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 currentAccessoryUUIDsForMediaStateSubscriber:self];
    if (v7
      && ([v4 uuid],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = objc_msgSend(v8, "hmf_isEqualToUUID:", v7),
          v8,
          v9))
    {
      long long v10 = (void *)MEMORY[0x230FBD990]();
      long long v11 = self;
      long long v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v22 = v13;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Skipping local unsubscribe to media state for current accessory : %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v14 = [(HMDHomeMediaStateSubscriber *)self workQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __78__HMDHomeMediaStateSubscriber_localUnsubscribeForAppleMediaStateForAccessory___block_invoke;
      v19[3] = &unk_264A2F820;
      v19[4] = self;
      id v20 = v4;
      dispatch_async(v14, v19);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v18;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to locally unsubscribe to media state for accessory : %@, nil data source", buf, 0x16u);
    }
  }
}

void __78__HMDHomeMediaStateSubscriber_localUnsubscribeForAppleMediaStateForAccessory___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) uuid];
  v4[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  -[HMDHomeMediaStateSubscriber _localSubscribeForAppleMediaState:forAccessories:](v1, 0, v3);
}

- (void)localUnsubscribeForAppleMediaState
{
  uint64_t v3 = [(HMDHomeMediaStateSubscriber *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMDHomeMediaStateSubscriber_localUnsubscribeForAppleMediaState__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __65__HMDHomeMediaStateSubscriber_localUnsubscribeForAppleMediaState__block_invoke(uint64_t a1)
{
  -[HMDHomeMediaStateSubscriber nonCurrentAccessoryUUIDs](*(id *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _localSubscribeForAppleMediaState:forAccessories:](*(void **)(a1 + 32), 0, v2);
}

- (id)nonCurrentAccessoryUUIDs
{
  id v1 = a1;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = [a1 dataSource];
    uint64_t v3 = v2;
    if (v2)
    {
      id v4 = [v2 appleMediaAccessoryUUIDsForMediaStateSubscriber:v1];
      if ([v4 count])
      {
        uint64_t v5 = [v3 currentAccessoryUUIDsForMediaStateSubscriber:v1];
        id v6 = v5;
        if (v5)
        {
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __55__HMDHomeMediaStateSubscriber_nonCurrentAccessoryUUIDs__block_invoke;
          v13[3] = &unk_264A2F348;
          id v14 = v5;
          uint64_t v7 = objc_msgSend(v4, "na_filter:", v13);

          id v4 = (id)v7;
        }
        id v4 = v4;

        id v1 = v4;
      }
      else
      {
        id v1 = (id)MEMORY[0x263EFFA68];
      }
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v1;
      long long v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v16 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to get non-current accessory uuids due to nil data source", buf, 0xCu);
      }
      id v1 = (id)MEMORY[0x263EFFA68];
    }
  }
  return v1;
}

uint64_t __55__HMDHomeMediaStateSubscriber_nonCurrentAccessoryUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmf_isEqualToUUID:", *(void *)(a1 + 32)) ^ 1;
}

- (void)localSubscribeForAppleMediaState
{
  uint64_t v3 = [(HMDHomeMediaStateSubscriber *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDHomeMediaStateSubscriber_localSubscribeForAppleMediaState__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __63__HMDHomeMediaStateSubscriber_localSubscribeForAppleMediaState__block_invoke(uint64_t a1)
{
  -[HMDHomeMediaStateSubscriber nonCurrentAccessoryUUIDs](*(id *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _localSubscribeForAppleMediaState:forAccessories:](*(void **)(a1 + 32), 1, v2);
}

- (void)unsubscribeForAppleMediaStateForAccessory:(id)a3 subscriptionToken:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDHomeMediaStateSubscriber *)self dataSource];
  id v9 = v8;
  if (v8)
  {
    long long v10 = [v8 currentAccessoryUUIDsForMediaStateSubscriber:self];
    if (v10
      && ([v6 uuid],
          long long v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v10),
          v11,
          v12))
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping unsubscribe to media state for current accessory : %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v17 = [(HMDHomeMediaStateSubscriber *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __91__HMDHomeMediaStateSubscriber_unsubscribeForAppleMediaStateForAccessory_subscriptionToken___block_invoke;
      block[3] = &unk_264A2F2F8;
      block[4] = self;
      id v23 = v6;
      id v24 = v7;
      dispatch_async(v17, block);
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to unsubscribe to media state for accessory : %@, nil data source", buf, 0x16u);
    }
  }
}

void __91__HMDHomeMediaStateSubscriber_unsubscribeForAppleMediaStateForAccessory_subscriptionToken___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  v5[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  -[HMDHomeMediaStateSubscriber _subscribeForAppleMediaState:forAccessories:subscriptionToken:](v2, 0, v4, *(void **)(a1 + 48));
}

- (void)_subscribeForAppleMediaState:(void *)a3 forAccessories:(void *)a4 subscriptionToken:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v33 = a4;
  if (a1)
  {
    id v7 = [a1 workQueue];
    dispatch_assert_queue_V2(v7);

    v31 = [MEMORY[0x263EFF980] array];
    uint64_t v30 = [MEMORY[0x263EFF980] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v29;
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v40;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
          int v12 = [a1 homeUUID];
          int v13 = -[HMDHomeMediaStateSubscriber topicsForAccessoryUUID:homeUUID:](v11, v12);

          id v14 = [a1 subscribedAccessoriesToTokenMap];
          v15 = [v14 objectForKeyedSubscript:v11];
          id v16 = v15;
          if (a2)
          {
            BOOL v17 = v15 == 0;

            if (v17)
            {
              id v18 = [MEMORY[0x263EFF9C0] set];
              id v19 = [a1 subscribedAccessoriesToTokenMap];
              [v19 setObject:v18 forKeyedSubscript:v11];

              [v31 addObjectsFromArray:v13];
            }
            id v20 = [a1 subscribedAccessoriesToTokenMap];
            uint64_t v21 = [v20 objectForKeyedSubscript:v11];
            [v21 addObject:v33];
          }
          else
          {
            [v15 removeObject:v33];

            __int16 v22 = [a1 subscribedAccessoriesToTokenMap];
            id v23 = [v22 objectForKeyedSubscript:v11];
            BOOL v24 = [v23 count] == 0;

            if (v24)
            {
              uint64_t v25 = [a1 subscribedAccessoriesToTokenMap];
              [v25 setObject:0 forKeyedSubscript:v11];

              [v30 addObjectsFromArray:v13];
            }
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v8);
    }

    if ([v31 count] || objc_msgSend(v30, "count"))
    {
      objc_initWeak(&location, a1);
      uint64_t v26 = [a1 remoteSubscriptionProvider];
      __int16 v27 = (void *)[v31 copy];
      id v28 = (void *)[v30 copy];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __93__HMDHomeMediaStateSubscriber__subscribeForAppleMediaState_forAccessories_subscriptionToken___block_invoke;
      v34[3] = &unk_264A23068;
      objc_copyWeak(&v36, &location);
      char v37 = a2;
      id v35 = obj;
      [v26 changeRegistrationsForConsumer:a1 topicFilterAdditions:v27 topicFilterRemovals:v28 completion:v34];

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
  }
}

void __93__HMDHomeMediaStateSubscriber__subscribeForAppleMediaState_forAccessories_subscriptionToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = (void *)v11;
    int v13 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    if (v13) {
      v15 = @"subscribe";
    }
    else {
      v15 = @"unsubscribe";
    }
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Did %@ to apple media state for accessories: %@", buf, 0x20u);
  }
  if ([v5 count] && v9)
  {
    id v16 = [v9 workQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __93__HMDHomeMediaStateSubscriber__subscribeForAppleMediaState_forAccessories_subscriptionToken___block_invoke_9;
    v17[3] = &unk_264A2F820;
    id v18 = v5;
    id v19 = v9;
    dispatch_async(v16, v17);
  }
}

void __93__HMDHomeMediaStateSubscriber__subscribeForAppleMediaState_forAccessories_subscriptionToken___block_invoke_9(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, (void)v9);
        -[HMDHomeMediaStateSubscriber processEvent:topic:](*(void **)(a1 + 40), v8, v7);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)subscribeForAppleMediaStateForAccessory:(id)a3 subscriptionToken:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDHomeMediaStateSubscriber *)self dataSource];
  long long v9 = v8;
  if (v8)
  {
    long long v10 = [v8 currentAccessoryUUIDsForMediaStateSubscriber:self];
    if (v10
      && ([v6 uuid],
          long long v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v10),
          v11,
          v12))
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping subscribe to media state for current accessory : %@", buf, 0x16u);
      }
    }
    else
    {
      BOOL v17 = [(HMDHomeMediaStateSubscriber *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __89__HMDHomeMediaStateSubscriber_subscribeForAppleMediaStateForAccessory_subscriptionToken___block_invoke;
      block[3] = &unk_264A2F2F8;
      block[4] = self;
      id v23 = v6;
      id v24 = v7;
      dispatch_async(v17, block);
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to subscribe to media state for accessory : %@, nil data source", buf, 0x16u);
    }
  }
}

void __89__HMDHomeMediaStateSubscriber_subscribeForAppleMediaStateForAccessory_subscriptionToken___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  v5[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  -[HMDHomeMediaStateSubscriber _subscribeForAppleMediaState:forAccessories:subscriptionToken:](v2, 1, v4, *(void **)(a1 + 48));
}

- (void)unsubscribeForAppleMediaStateWithSubscriptionToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDHomeMediaStateSubscriber *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__HMDHomeMediaStateSubscriber_unsubscribeForAppleMediaStateWithSubscriptionToken___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __82__HMDHomeMediaStateSubscriber_unsubscribeForAppleMediaStateWithSubscriptionToken___block_invoke(uint64_t a1)
{
  -[HMDHomeMediaStateSubscriber nonCurrentAccessoryUUIDs](*(id *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _subscribeForAppleMediaState:forAccessories:subscriptionToken:](*(void **)(a1 + 32), 0, v2, *(void **)(a1 + 40));
}

- (void)subscribeForAppleMediaStateWithSubscriptionToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDHomeMediaStateSubscriber *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__HMDHomeMediaStateSubscriber_subscribeForAppleMediaStateWithSubscriptionToken___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__HMDHomeMediaStateSubscriber_subscribeForAppleMediaStateWithSubscriptionToken___block_invoke(uint64_t a1)
{
  -[HMDHomeMediaStateSubscriber nonCurrentAccessoryUUIDs](*(id *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaStateSubscriber _subscribeForAppleMediaState:forAccessories:subscriptionToken:](*(void **)(a1 + 32), 1, v2, *(void **)(a1 + 40));
}

- (HMDHomeMediaStateSubscriber)initWithHomeUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 remoteSubscriptionProvider:(id)a6 localSubscriptionProvider:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomeMediaStateSubscriber;
  BOOL v17 = [(HMDHomeMediaStateSubscriber *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    homeUUID = v17->_homeUUID;
    v17->_homeUUID = (NSUUID *)v18;

    objc_storeStrong((id *)&v17->_workQueue, a4);
    objc_storeStrong((id *)&v17->_remoteSubscriptionProvider, a6);
    objc_storeStrong((id *)&v17->_localSubscriptionProvider, a7);
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    subscribedAccessoriesToTokenMap = v17->_subscribedAccessoriesToTokenMap;
    v17->_subscribedAccessoriesToTokenMap = (NSMutableDictionary *)v20;

    objc_storeWeak((id *)&v17->_dataSource, v14);
  }

  return v17;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_167801 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_167801, &__block_literal_global_167802);
  }
  id v2 = (void *)logCategory__hmf_once_v21_167803;
  return v2;
}

void __42__HMDHomeMediaStateSubscriber_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v21_167803;
  logCategory__hmf_once_v21_167803 = v0;
}

@end