@interface HMDPreferredMediaUserEventController
- (HMDFetchedSettingsDriver)driver;
- (HMDPreferredMediaUserEventController)initWithDataSource:(id)a3 queue:(id)a4 driver:(id)a5;
- (HMDPreferredMediaUserEventControllerDataSource)dataSource;
- (OS_dispatch_queue)queue;
- (double)eventTimestamp;
- (id)eventSource;
- (void)_postUpdateEventsIfDifferent:(id)a3;
- (void)driver:(id)a3 didUpdatePrimaryUserInfo:(id)a4;
- (void)driver:(id)a3 didUpdateSettings:(id)a4;
- (void)driverDidReload:(id)a3;
- (void)setQueue:(id)a3;
- (void)updatePreferredMediaUserWithPrimaryUserInfo:(id)a3 completion:(id)a4;
@end

@implementation HMDPreferredMediaUserEventController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMDPreferredMediaUserEventControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPreferredMediaUserEventControllerDataSource *)WeakRetained;
}

- (HMDFetchedSettingsDriver)driver
{
  return (HMDFetchedSettingsDriver *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)driverDidReload:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@PrimaryUserInfo fetch is not supported", (uint8_t *)&v9, 0xCu);
  }
}

- (void)driver:(id)a3 didUpdatePrimaryUserInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDPreferredMediaUserEventController *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v12;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received primaryUserInfo updates: %@", (uint8_t *)&v19, 0x16u);
  }
  [(HMDPreferredMediaUserEventController *)v10 _postUpdateEventsIfDifferent:v7];
  v13 = [(HMDPreferredMediaUserEventController *)v10 dataSource];
  if (v13)
  {
    v14 = [v7 uuidString];
    objc_msgSend(v13, "updatePreferredMediaUser:selectionType:", v14, objc_msgSend(v7, "selectionType"));
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v10;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot update primaryUserInfo in the accessory because dataSource is nil", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)driver:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Only primaryUserInfo settings is supported.", (uint8_t *)&v12, 0xCu);
  }
}

- (void)_postUpdateEventsIfDifferent:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDPreferredMediaUserEventController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v52 = v9;
    __int16 v53 = 2112;
    id v54 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Posting event to update primaryUserInfo: %@", buf, 0x16u);
  }
  v10 = [(HMDPreferredMediaUserEventController *)v7 dataSource];
  uint64_t v11 = v10;
  if (v10)
  {
    int v12 = [v10 accessoryUUID];
    v13 = [v11 homeUUID];
    if (![v11 isCurrentAccessory])
    {
LABEL_27:

      goto LABEL_28;
    }
    if (!v12 || !v13)
    {
      v28 = (void *)MEMORY[0x230FBD990]();
      v29 = v7;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v52 = v31;
        __int16 v53 = 2112;
        id v54 = v13;
        __int16 v55 = 2112;
        id v56 = v12;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil value in homeUUID: %@, accessoryUUID: %@", buf, 0x20u);
      }
      goto LABEL_27;
    }
    uint64_t v14 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B2F8] homeUUID:v13 accessoryUUID:v12];
    v15 = [v11 eventStoreReadHandle];
    v16 = [v15 lastEventForTopic:v14];

    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x263F0DFC0]);
      v18 = [v16 encodedData];
      int v19 = (void *)[v17 initWithProtoData:v18];

      if (v19)
      {
        if ([v19 isEqual:v4])
        {
          v20 = (void *)MEMORY[0x230FBD990]();
          __int16 v21 = v7;
          id v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v23 = v47 = v20;
            *(_DWORD *)buf = 138543362;
            v52 = v23;
            _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Skip sending event update for primaryUserInfo as it matches stored", buf, 0xCu);

            v20 = v47;
          }

LABEL_26:

          goto LABEL_27;
        }
LABEL_23:
        v49 = v16;
        v36 = (void *)MEMORY[0x230FBD990]();
        v37 = v7;
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v52 = v39;
          __int16 v53 = 2112;
          id v54 = v14;
          __int16 v55 = 2112;
          id v56 = v4;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Forwarding event with topic: %@ for primaryUserInfo: %@", buf, 0x20u);
        }
        id v40 = objc_alloc(MEMORY[0x263F49390]);
        v41 = [(HMDPreferredMediaUserEventController *)v37 eventSource];
        [(HMDPreferredMediaUserEventController *)v37 eventTimestamp];
        v42 = objc_msgSend(v40, "initWithSource:cachePolicy:combineType:timestamp:", v41, 2, 2);

        id v43 = objc_alloc(MEMORY[0x263F49380]);
        v44 = [v4 protoData];
        v45 = (void *)[v43 initWithEventData:v44 metadata:v42];

        v46 = [v11 eventForwarder];
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __69__HMDPreferredMediaUserEventController__postUpdateEventsIfDifferent___block_invoke;
        v50[3] = &unk_264A2F3E8;
        v50[4] = v37;
        [v46 forwardEvent:v45 topic:v14 completion:v50];

        v16 = v49;
        goto LABEL_26;
      }
      v32 = (void *)MEMORY[0x230FBD990]();
      v33 = v7;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = v48 = v32;
        *(_DWORD *)buf = 138543618;
        v52 = v35;
        __int16 v53 = 2112;
        id v54 = v14;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Error reading stored primary user for topic %@", buf, 0x16u);

        v32 = v48;
      }
    }
    int v19 = 0;
    goto LABEL_23;
  }
  v24 = (void *)MEMORY[0x230FBD990]();
  v25 = v7;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v52 = v27;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot post primaryUserInfo update event because dataSource is nil", buf, 0xCu);
  }
LABEL_28:
}

void __69__HMDPreferredMediaUserEventController__postUpdateEventsIfDifferent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error in forwarding the primary user event: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (double)eventTimestamp
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  return result;
}

- (id)eventSource
{
  v2 = [(HMDPreferredMediaUserEventController *)self dataSource];
  id v3 = [v2 accessoryUUID];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)updatePreferredMediaUserWithPrimaryUserInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDPreferredMediaUserEventController *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__HMDPreferredMediaUserEventController_updatePreferredMediaUserWithPrimaryUserInfo_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __95__HMDPreferredMediaUserEventController_updatePreferredMediaUserWithPrimaryUserInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) uuidString];
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "selectionType"));
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating preferred media user: %@, type: %@", (uint8_t *)&v9, 0x20u);
  }
  int v8 = [*(id *)(a1 + 32) driver];
  [v8 updateSettingWithKeyPath:@"root.home.primaryUser" primaryUserInfo:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (HMDPreferredMediaUserEventController)initWithDataSource:(id)a3 queue:(id)a4 driver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDPreferredMediaUserEventController;
  __int16 v11 = [(HMDPreferredMediaUserEventController *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v12->_driver, a5);
    [(HMDFetchedSettingsDriver *)v12->_driver setDelegate:v12];
  }

  return v12;
}

@end