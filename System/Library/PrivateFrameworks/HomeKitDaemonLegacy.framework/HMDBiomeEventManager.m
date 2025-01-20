@interface HMDBiomeEventManager
- (BMHomeKitClientAccessoryControlStream)hapAccessoryStream;
- (BMHomeKitClientActionSetStream)actionSetStream;
- (BMHomeKitClientMediaAccessoryControlStream)mediaAccessoryStream;
- (HMDBiomeEventManager)init;
- (HMDBiomeEventManager)initWithNotificationCenter:(id)a3 actionSetStream:(id)a4 mediaAccessoryStream:(id)a5 accessoryStream:(id)a6 prunableStreamFactory:(id)a7 workQueue:(id)a8;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (id)prunableStreamFactory;
- (void)_deleteAccessoryEventsPassingTest:(void *)a1;
- (void)_deleteActionSetEventsPassingTest:(void *)a1;
- (void)_deleteEventFromStartDate:(void *)a3 toEndDate:stream:passingDeleteEventTest:;
- (void)_deleteMediaAccessoryEventsPassingTest:(void *)a1;
- (void)_handleAccessoryRemovedNotification:(id)a3;
- (void)_handleActionSetEmptiedNotification:(id)a3;
- (void)_handleHomeRemovedNotification:(id)a3;
- (void)_handleServiceRemovedNotification:(id)a3;
- (void)_submitAccessoryEvent:(id)a3;
- (void)_submitActionSetEvent:(id)a3;
- (void)_submitMediaAccessoryEvent:(id)a3;
- (void)deleteAllEvents;
- (void)fetchMostRecentEventWithCharacteristicType:(id)a3 serviceType:(id)a4 homeSPIClientIdentifier:(id)a5 completion:(id)a6;
- (void)submitAccessoryEvent:(id)a3;
- (void)submitActionSetEvent:(id)a3;
- (void)submitMediaAccessoryEvent:(id)a3;
@end

@implementation HMDBiomeEventManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong(&self->_prunableStreamFactory, 0);
  objc_storeStrong((id *)&self->_hapAccessoryStream, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryStream, 0);
  objc_storeStrong((id *)&self->_actionSetStream, 0);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (id)prunableStreamFactory
{
  return objc_getProperty(self, a2, 32, 1);
}

- (BMHomeKitClientAccessoryControlStream)hapAccessoryStream
{
  return (BMHomeKitClientAccessoryControlStream *)objc_getProperty(self, a2, 24, 1);
}

- (BMHomeKitClientMediaAccessoryControlStream)mediaAccessoryStream
{
  return (BMHomeKitClientMediaAccessoryControlStream *)objc_getProperty(self, a2, 16, 1);
}

- (BMHomeKitClientActionSetStream)actionSetStream
{
  return (BMHomeKitClientActionSetStream *)objc_getProperty(self, a2, 8, 1);
}

- (void)_submitMediaAccessoryEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBiomeEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(HMDBiomeEventManager *)self mediaAccessoryStream];
  v6 = [v7 source];
  [v6 sendEvent:v4];
}

- (void)submitMediaAccessoryEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBiomeEventManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDBiomeEventManager_submitMediaAccessoryEvent___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__HMDBiomeEventManager_submitMediaAccessoryEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitMediaAccessoryEvent:*(void *)(a1 + 40)];
}

- (void)_submitAccessoryEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBiomeEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(HMDBiomeEventManager *)self hapAccessoryStream];
  id v6 = [v7 source];
  [v6 sendEvent:v4];
}

- (void)submitAccessoryEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBiomeEventManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HMDBiomeEventManager_submitAccessoryEvent___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__HMDBiomeEventManager_submitAccessoryEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitAccessoryEvent:*(void *)(a1 + 40)];
}

- (void)_submitActionSetEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBiomeEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(HMDBiomeEventManager *)self actionSetStream];
  id v6 = [v7 source];
  [v6 sendEvent:v4];
}

- (void)submitActionSetEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBiomeEventManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HMDBiomeEventManager_submitActionSetEvent___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__HMDBiomeEventManager_submitActionSetEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitActionSetEvent:*(void *)(a1 + 40)];
}

- (void)deleteAllEvents
{
  objc_initWeak(&location, self);
  v3 = [(HMDBiomeEventManager *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__HMDBiomeEventManager_deleteAllEvents__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__HMDBiomeEventManager_deleteAllEvents__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v15 = WeakRetained;
    v2 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v2);

    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = v15;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deleting all events in biome", buf, 0xCu);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [v4 hapAccessoryStream];
    v20[0] = v7;
    id v8 = [v4 mediaAccessoryStream];
    v20[1] = v8;
    v9 = [v4 actionSetStream];
    v20[2] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:buf count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          -[HMDBiomeEventManager _deleteEventFromStartDate:toEndDate:stream:passingDeleteEventTest:](v4, *(void **)(*((void *)&v16 + 1) + 8 * v14++), &__block_literal_global_37_78413);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:buf count:16];
      }
      while (v12);
    }

    id WeakRetained = v15;
  }
}

- (void)_deleteEventFromStartDate:(void *)a3 toEndDate:stream:passingDeleteEventTest:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = a1;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v41 = v11;
    __int16 v42 = 2112;
    v43 = 0;
    __int16 v44 = 2112;
    id v45 = 0;
    __int16 v46 = 2112;
    id v47 = v5;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events from: (%@) to: (%@) in stream: %@", buf, 0x2Au);
  }
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v12 timeIntervalSinceReferenceDate];
  uint64_t v14 = v13;

  id v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v15 timeIntervalSinceReferenceDate];
  uint64_t v17 = v16;

  long long v18 = (void *)MEMORY[0x1E4F4FB88];
  long long v19 = [v5 identifier];
  uint64_t v20 = [v18 streamForStreamIdentifier:v19];

  if (v20)
  {
    v21 = [v9 prunableStreamFactory];
    v22 = v21[2](v21, v20);

    id v39 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __90__HMDBiomeEventManager__deleteEventFromStartDate_toEndDate_stream_passingDeleteEventTest___block_invoke;
    v34[3] = &unk_1E6A0D428;
    id v35 = 0;
    uint64_t v37 = v14;
    uint64_t v38 = v17;
    id v36 = v6;
    [v22 pruneEventsWithError:&v39 predicateBlock:v34];
    id v23 = v39;
    v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v9;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      v28 = HMFBooleanToString();
      *(_DWORD *)buf = 138544642;
      v41 = v27;
      __int16 v42 = 2112;
      v43 = 0;
      __int16 v44 = 2112;
      id v45 = 0;
      __int16 v46 = 2112;
      id v47 = v5;
      __int16 v48 = 2112;
      v49 = v28;
      __int16 v50 = 2112;
      id v51 = v23;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Deleted matching biome events from: (%@) to: (%@) in stream: %@ with success: %@ (%@)", buf, 0x3Eu);
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = v9;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      v33 = [v5 identifier];
      *(_DWORD *)buf = 138543874;
      v41 = v32;
      __int16 v42 = 2112;
      v43 = v33;
      __int16 v44 = 2112;
      id v45 = v5;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to find public stream to prune for stream identifier: %@ of stream: %@", buf, 0x20u);
    }
  }
}

uint64_t __90__HMDBiomeEventManager__deleteEventFromStartDate_toEndDate_stream_passingDeleteEventTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    [v3 timestamp];
    BOOL v7 = v6 >= *(double *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      [v4 timestamp];
      LOBYTE(v5) = v8 > *(double *)(a1 + 56);
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  uint64_t v9 = 0;
  if (v7 && (v5 & 1) == 0) {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v9;
}

uint64_t __40__HMDBiomeEventManager__deleteAllEvents__block_invoke()
{
  return 1;
}

- (void)fetchMostRecentEventWithCharacteristicType:(id)a3 serviceType:(id)a4 homeSPIClientIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  uint64_t v14 = [(HMDBiomeEventManager *)self workQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __114__HMDBiomeEventManager_fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke;
  v19[3] = &unk_1E6A167A0;
  objc_copyWeak(&v24, &location);
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __114__HMDBiomeEventManager_fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke(uint64_t a1)
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v28 = v2;
  id v6 = v3;
  id v7 = v5;
  double v8 = v4;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v9);

    id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;

    id v13 = [WeakRetained hapAccessoryStream];
    uint64_t v14 = [v13 publisherFromStartTime:v12];

    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke;
    v42[3] = &unk_1E6A0D250;
    id v15 = v7;
    id v43 = v15;
    id v16 = v6;
    id v44 = v16;
    id v17 = v28;
    id v45 = v17;
    id v18 = [v14 filterWithIsIncluded:v42];
    long long v19 = [v18 last];

    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    id v39 = __Block_byref_object_copy__78423;
    v40 = __Block_byref_object_dispose__78424;
    id v41 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke_30;
    v31[3] = &unk_1E6A0D278;
    id v35 = &v36;
    v31[4] = WeakRetained;
    id v32 = v17;
    id v33 = v16;
    id v34 = v15;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke_32;
    v30[3] = &unk_1E6A0D2A0;
    v30[4] = &v36;
    id v20 = (id)[v19 sinkWithCompletion:v31 shouldContinue:v30];
    if (v37[5])
    {
      v46[0] = @"HMDServiceSPIClientIdentifierKey";
      id v21 = objc_alloc(MEMORY[0x1E4F29128]);
      id v22 = [(id)v37[5] serviceUniqueIdentifier];
      id v23 = (void *)[v21 initWithUUIDString:v22];
      v46[1] = @"HMDAccessorySPIClientIdentifierKey";
      v47[0] = v23;
      id v24 = objc_alloc(MEMORY[0x1E4F29128]);
      id v25 = [(id)v37[5] accessoryUniqueIdentifier];
      v26 = (void *)[v24 initWithUUIDString:v25];
      v47[1] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
    }
    else
    {
      v27 = (void *)MEMORY[0x1E4F1CC08];
    }
    v8[2](v8, v27);

    _Block_object_dispose(&v36, 8);
  }
}

uint64_t __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)a1[4];
    id v6 = [v3 base];
    id v7 = [v6 homeUniqueIdentifier];
    LODWORD(v5) = objc_msgSend(v5, "hmf_isEqualToUUIDString:", v7);

    double v8 = (void *)a1[5];
    uint64_t v9 = [v4 serviceType];
    LODWORD(v8) = [v8 isEqualToString:v9];

    id v10 = (void *)a1[6];
    double v11 = [v4 characteristicType];
    LODWORD(v10) = [v10 isEqualToString:v11];

    uint64_t v12 = v5 & v8 & v10;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) && [v3 state])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      int v14 = 138544130;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching most revnet event of characeristic type: %@, service type: %@, in home with unique Identifier: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

uint64_t __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (void)_handleActionSetEmptiedNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"HMDActionSetNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [v8 home];
    if (v9)
    {
      id v10 = [(HMDBiomeEventManager *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__HMDBiomeEventManager__handleActionSetEmptiedNotification___block_invoke;
      block[3] = &unk_1E6A19668;
      block[4] = self;
      id v20 = v8;
      id v21 = v9;
      dispatch_async(v10, block);
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      __int16 v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v23 = v18;
        __int16 v24 = 2112;
        id v25 = v4;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@No home found for emptied action set notification: %@ for action set: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v14;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@No action set found for emptied action set notification: %@", buf, 0x16u);
    }
  }
}

void __60__HMDBiomeEventManager__handleActionSetEmptiedNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) spiClientIdentifier];
  id v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = [*(id *)(a1 + 48) spiClientIdentifier];
  id v6 = [*(id *)(a1 + 48) uuid];
  id v15 = v3;
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  if (v2)
  {
    id v10 = [v2 workQueue];
    dispatch_assert_queue_V2(v10);

    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v2;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v17 = v7;
      *(_WORD *)__int16 v18 = 2112;
      *(void *)&v18[2] = v8;
      *(_WORD *)&v18[10] = 2112;
      *(void *)&v18[12] = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events for action set with uniqueIdentifier: %@, uuid: %@, in home with uniqueIdentifier: %@ uuid %@", buf, 0x34u);
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __113__HMDBiomeEventManager__deleteAllEventsForActionSetUniqueIdentifier_actionSetUUID_homeUniqueIdentifier_homeUUID___block_invoke;
    uint64_t v17 = &unk_1E6A0D388;
    *(void *)__int16 v18 = v15;
    *(void *)&v18[8] = v8;
    -[HMDBiomeEventManager _deleteActionSetEventsPassingTest:](v12, buf);
  }
}

uint64_t __113__HMDBiomeEventManager__deleteAllEventsForActionSetUniqueIdentifier_actionSetUUID_homeUniqueIdentifier_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 actionSetUniqueIdentifier];
  if (objc_msgSend(v4, "hmf_isEqualToUUIDString:", v5))
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v3 base];
    id v8 = [v7 homeUniqueIdentifier];
    uint64_t v9 = objc_msgSend(v6, "hmf_isEqualToUUIDString:", v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_deleteActionSetEventsPassingTest:(void *)a1
{
  id v3 = a2;
  id v4 = [a1 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [a1 actionSetStream];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMDBiomeEventManager__deleteActionSetEventsPassingTest___block_invoke;
  v7[3] = &unk_1E6A0D2E8;
  id v6 = v3;
  id v8 = v6;
  -[HMDBiomeEventManager _deleteEventFromStartDate:toEndDate:stream:passingDeleteEventTest:](a1, v5, v7);
}

uint64_t __58__HMDBiomeEventManager__deleteActionSetEventsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_handleServiceRemovedNotification:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"HMDServiceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [v8 accessory];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 home];
      if (v11)
      {
        id v12 = [(HMDBiomeEventManager *)self workQueue];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __58__HMDBiomeEventManager__handleServiceRemovedNotification___block_invoke;
        v25[3] = &unk_1E6A18668;
        v25[4] = self;
        id v26 = v8;
        id v27 = v10;
        id v28 = v11;
        dispatch_async(v12, v25);
      }
      else
      {
        id v21 = (void *)MEMORY[0x1D9452090]();
        uint64_t v22 = self;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          id v30 = v24;
          __int16 v31 = 2112;
          id v32 = v4;
          __int16 v33 = 2112;
          id v34 = v8;
          __int16 v35 = 2112;
          uint64_t v36 = v10;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@No home found for removed service notification: %@ for service: %@ on accessory: %@", buf, 0x2Au);
        }
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      __int16 v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v30 = v20;
        __int16 v31 = 2112;
        id v32 = v4;
        __int16 v33 = 2112;
        id v34 = v8;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@No accessory found for removed service notification: %@ for service: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    int v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@No service found for removed service notification: %@", buf, 0x16u);
    }
  }
}

void __58__HMDBiomeEventManager__handleServiceRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) spiClientIdentifier];
  id v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = [*(id *)(a1 + 48) spiClientIdentifier];
  id v6 = [*(id *)(a1 + 48) uuid];
  id v7 = [*(id *)(a1 + 56) spiClientIdentifier];
  id v8 = [*(id *)(a1 + 56) uuid];
  id v19 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  if (v2)
  {
    int v14 = [v2 workQueue];
    dispatch_assert_queue_V2(v14);

    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v2;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      id v21 = v11;
      *(_WORD *)uint64_t v22 = 2112;
      *(void *)&v22[2] = v19;
      *(_WORD *)&v22[10] = 2112;
      *(void *)&v22[12] = v9;
      *(_WORD *)&v22[20] = 2112;
      *(void *)&v22[22] = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events for accessory's (uniqueIdentifier: %@ uuid: %@) service with uniqueIdentifier: %@, uuid: %@, in home with uniqueIdentifier: %@ uuid %@", buf, 0x48u);
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __167__HMDBiomeEventManager__deleteAllEventsForAccessoryServiceUniqueIdentifier_accessoryServiceUUID_accessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke;
    id v21 = &unk_1E6A0D400;
    *(void *)uint64_t v22 = v19;
    *(void *)&v22[8] = v10;
    *(void *)&v22[16] = v12;
    -[HMDBiomeEventManager _deleteAccessoryEventsPassingTest:](v16, buf);
  }
}

uint64_t __167__HMDBiomeEventManager__deleteAllEventsForAccessoryServiceUniqueIdentifier_accessoryServiceUUID_accessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = [v3 serviceUniqueIdentifier];
  if (objc_msgSend(v4, "hmf_isEqualToUUIDString:", v5))
  {
    id v6 = (void *)a1[5];
    id v7 = [v3 accessoryUniqueIdentifier];
    if (objc_msgSend(v6, "hmf_isEqualToUUIDString:", v7))
    {
      id v8 = (void *)a1[6];
      id v9 = [v3 base];
      id v10 = [v9 homeUniqueIdentifier];
      uint64_t v11 = objc_msgSend(v8, "hmf_isEqualToUUIDString:", v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_deleteAccessoryEventsPassingTest:(void *)a1
{
  id v3 = a2;
  id v4 = [a1 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [a1 hapAccessoryStream];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMDBiomeEventManager__deleteAccessoryEventsPassingTest___block_invoke;
  v7[3] = &unk_1E6A0D2E8;
  id v6 = v3;
  id v8 = v6;
  -[HMDBiomeEventManager _deleteEventFromStartDate:toEndDate:stream:passingDeleteEventTest:](a1, v5, v7);
}

uint64_t __58__HMDBiomeEventManager__deleteAccessoryEventsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_handleAccessoryRemovedNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v12 = [(HMDBiomeEventManager *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__HMDBiomeEventManager__handleAccessoryRemovedNotification___block_invoke;
      block[3] = &unk_1E6A19668;
      block[4] = self;
      id v22 = v8;
      id v23 = v11;
      dispatch_async(v12, block);
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      __int16 v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v25 = v20;
        __int16 v26 = 2112;
        id v27 = v4;
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@No home found for removed accessory notification: %@ for accessory: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    int v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@No accessory found for removed accessory notification: %@", buf, 0x16u);
    }
  }
}

void __60__HMDBiomeEventManager__handleAccessoryRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) spiClientIdentifier];
  id v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = [*(id *)(a1 + 48) spiClientIdentifier];
  id v6 = [*(id *)(a1 + 48) uuid];
  id v17 = v3;
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  if (v2)
  {
    id v10 = [v2 workQueue];
    dispatch_assert_queue_V2(v10);

    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v2;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      id v22 = v7;
      *(_WORD *)id v23 = 2112;
      *(void *)&v23[2] = v8;
      *(_WORD *)&v23[10] = 2112;
      *(void *)&v23[12] = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events for accessory with uniqueIdentifier: %@, uuid: %@, in home with uniqueIdentifier: %@ uuid %@", buf, 0x34u);
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __113__HMDBiomeEventManager__deleteAllEventsForAccessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke;
    id v22 = &unk_1E6A0D3B0;
    id v15 = v17;
    *(void *)id v23 = v15;
    id v16 = v8;
    *(void *)&v23[8] = v16;
    -[HMDBiomeEventManager _deleteAccessoryEventsPassingTest:](v12, buf);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __113__HMDBiomeEventManager__deleteAllEventsForAccessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke_2;
    v18[3] = &unk_1E6A0D3D8;
    id v19 = v15;
    id v20 = v16;
    -[HMDBiomeEventManager _deleteMediaAccessoryEventsPassingTest:](v12, v18);
  }
}

uint64_t __113__HMDBiomeEventManager__deleteAllEventsForAccessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 accessoryUniqueIdentifier];
  if (objc_msgSend(v4, "hmf_isEqualToUUIDString:", v5))
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v3 base];
    id v8 = [v7 homeUniqueIdentifier];
    uint64_t v9 = objc_msgSend(v6, "hmf_isEqualToUUIDString:", v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __113__HMDBiomeEventManager__deleteAllEventsForAccessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 accessoryUniqueIdentifier];
  if (objc_msgSend(v4, "hmf_isEqualToUUIDString:", v5))
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v3 base];
    id v8 = [v7 homeUniqueIdentifier];
    uint64_t v9 = objc_msgSend(v6, "hmf_isEqualToUUIDString:", v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_deleteMediaAccessoryEventsPassingTest:(void *)a1
{
  id v3 = a2;
  id v4 = [a1 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [a1 mediaAccessoryStream];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HMDBiomeEventManager__deleteMediaAccessoryEventsPassingTest___block_invoke;
  v7[3] = &unk_1E6A0D2E8;
  id v6 = v3;
  id v8 = v6;
  -[HMDBiomeEventManager _deleteEventFromStartDate:toEndDate:stream:passingDeleteEventTest:](a1, v5, v7);
}

uint64_t __63__HMDBiomeEventManager__deleteMediaAccessoryEventsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_handleHomeRemovedNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"HMDHomeNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [(HMDBiomeEventManager *)self workQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__HMDBiomeEventManager__handleHomeRemovedNotification___block_invoke;
    v14[3] = &unk_1E6A197C8;
    v14[4] = self;
    id v15 = v8;
    dispatch_async(v9, v14);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No home found for home accessory notification: %@", buf, 0x16u);
    }
  }
}

void __55__HMDBiomeEventManager__handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) spiClientIdentifier];
  id v4 = [*(id *)(a1 + 40) uuid];
  id v13 = v3;
  id v5 = v4;
  if (v2)
  {
    id v6 = [v2 workQueue];
    dispatch_assert_queue_V2(v6);

    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = v2;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events for home with uniqueIdentifier: %@, uuid: %@", buf, 0x20u);
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke;
    id v19 = &unk_1E6A0D310;
    id v11 = v13;
    id v20 = v11;
    -[HMDBiomeEventManager _deleteActionSetEventsPassingTest:](v8, buf);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke_2;
    v16[3] = &unk_1E6A0D338;
    id v12 = v11;
    id v17 = v12;
    -[HMDBiomeEventManager _deleteAccessoryEventsPassingTest:](v8, v16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke_3;
    v14[3] = &unk_1E6A0D360;
    id v15 = v12;
    -[HMDBiomeEventManager _deleteMediaAccessoryEventsPassingTest:](v8, v14);
  }
}

uint64_t __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 base];
  id v4 = [v3 homeUniqueIdentifier];
  uint64_t v5 = objc_msgSend(v2, "hmf_isEqualToUUIDString:", v4);

  return v5;
}

uint64_t __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 base];
  id v4 = [v3 homeUniqueIdentifier];
  uint64_t v5 = objc_msgSend(v2, "hmf_isEqualToUUIDString:", v4);

  return v5;
}

uint64_t __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 base];
  id v4 = [v3 homeUniqueIdentifier];
  uint64_t v5 = objc_msgSend(v2, "hmf_isEqualToUUIDString:", v4);

  return v5;
}

- (HMDBiomeEventManager)init
{
  HMDispatchQueueNameString();
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];
  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v7 = dispatch_queue_create(v4, v6);

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = objc_alloc_init(MEMORY[0x1E4F50368]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F50380]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F50358]);
  id v12 = [(HMDBiomeEventManager *)self initWithNotificationCenter:v8 actionSetStream:v9 mediaAccessoryStream:v10 accessoryStream:v11 prunableStreamFactory:&__block_literal_global_78455 workQueue:v7];

  return v12;
}

id __28__HMDBiomeEventManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPublicStream:a2];
  return v2;
}

- (HMDBiomeEventManager)initWithNotificationCenter:(id)a3 actionSetStream:(id)a4 mediaAccessoryStream:(id)a5 accessoryStream:(id)a6 prunableStreamFactory:(id)a7 workQueue:(id)a8
{
  id v29 = a3;
  id v28 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HMDBiomeEventManager;
  id v19 = [(HMDBiomeEventManager *)&v30 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workQueue, a8);
    objc_storeStrong((id *)&v20->_notificationCenter, a3);
    objc_storeStrong((id *)&v20->_actionSetStream, a4);
    objc_storeStrong((id *)&v20->_mediaAccessoryStream, a5);
    objc_storeStrong((id *)&v20->_hapAccessoryStream, a6);
    uint64_t v21 = _Block_copy(v17);
    id prunableStreamFactory = v20->_prunableStreamFactory;
    v20->_id prunableStreamFactory = v21;

    id v23 = [(HMDBiomeEventManager *)v20 notificationCenter];
    [v23 addObserver:v20 selector:sel__handleAccessoryRemovedNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:0];

    uint64_t v24 = [(HMDBiomeEventManager *)v20 notificationCenter];
    [v24 addObserver:v20 selector:sel__handleActionSetEmptiedNotification_ name:@"HMDHomeActionSetEmptiedNotification" object:0];

    uint64_t v25 = [(HMDBiomeEventManager *)v20 notificationCenter];
    [v25 addObserver:v20 selector:sel__handleServiceRemovedNotification_ name:@"HMDHomeServiceRemovedNotification" object:0];

    __int16 v26 = [(HMDBiomeEventManager *)v20 notificationCenter];
    [v26 addObserver:v20 selector:sel__handleHomeRemovedNotification_ name:@"HMDHomeRemovedNotification" object:0];
  }
  return v20;
}

@end