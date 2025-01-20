@interface HMDMediaBrowser
+ (id)advertisementsFromOutputDevices:(__CFArray *)a3;
+ (id)logCategory;
+ (id)shortDescription;
- (HMDHomeManager)homeManager;
- (HMDMediaBrowser)initWithHomeManager:(id)a3;
- (HMDMediaBrowser)initWithHomeManager:(id)a3 dataSource:(id)a4;
- (HMDMediaBrowserDelegate)delegate;
- (HMDUnassociatedMediaAccessory)currentAccessory;
- (NSArray)accessoryAdvertisements;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)clientQueue;
- (id)descriptionWithPointer:(void *)a1 additionalDescription:(int)a2;
- (id)dumpDescription;
- (id)messageDispatcher;
- (id)shortDescription;
- (id)unassociatedAccessoryFromAdvertisementData:(id)a3;
- (void)_addAdvertisements:(void *)a1;
- (void)_handleAvailableOutputDevices:(unsigned char *)a1;
- (void)_removeAdvertisements:(void *)a1;
- (void)_startDiscoveringAssociatedAccessoriesViaBonjour;
- (void)_stopDiscoveringAssociatedAccessoriesViaBonjour;
- (void)dealloc;
- (void)deregisterAccessories:(id)a3;
- (void)discovery:(id)a3 didDiscoverAccessory:(id)a4;
- (void)discovery:(id)a3 didLoseAccessory:(id)a4 error:(id)a5;
- (void)discovery:(id)a3 didStartDiscoveringWithError:(id)a4;
- (void)discovery:(id)a3 didStopDiscoveringWithError:(id)a4;
- (void)registerAccessories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)startDiscoveringAssociatedAccessoriesViaBonjour;
- (void)startDiscoveringUnassociatedAccessories;
- (void)stopDiscoveringAssociatedAccessoriesViaBonjour;
- (void)stopDiscoveringUnassociatedAccessories;
- (void)timerDidFire:(id)a3;
- (void)updateSessionsForAccessories:(id)a3;
@end

@implementation HMDMediaBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_mediaEndpoints, 0);
  objc_storeStrong((id *)&self->_identifiersOfAssociatedMediaAccessories, 0);
  objc_storeStrong((id *)&self->_discoveryPollTimer, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentBrowseOperations, 0);
  objc_storeStrong((id *)&self->_accessoryAdvertisements, 0);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaBrowserDelegate *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  v8 = (HMFTimer *)a3;
  v4 = [(HMDMediaBrowser *)self clientQueue];
  dispatch_assert_queue_V2(v4);

  if (self)
  {
    discoveryPollTimer = self->_discoveryPollTimer;

    if (discoveryPollTimer == v8 && self->_updateAvailableOutputDevices)
    {
      self->_updateAvailableOutputDevices = 0;
      uint64_t v6 = MRAVRoutingDiscoverySessionCopyAvailableOutputDevices();
      if (v6)
      {
        v7 = (const void *)v6;
        -[HMDMediaBrowser _handleAvailableOutputDevices:](self, v6);
        CFRelease(v7);
      }
    }
  }
  else
  {
  }
}

- (void)_handleAvailableOutputDevices:(unsigned char *)a1
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a1[32] || a1[33])
  {
    id v16 = +[HMDMediaBrowser advertisementsFromOutputDevices:a2];
    v3 = (void *)MEMORY[0x263EFFA08];
    v4 = [a1 accessoryAdvertisements];
    v5 = [v3 setWithArray:v4];

    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 intersectSet:v16];
    v7 = (void *)[v16 mutableCopy];
    [v7 intersectSet:v6];
    v8 = (void *)[v5 mutableCopy];
    [v8 minusSet:v6];
    v9 = [v8 allObjects];
    -[HMDMediaBrowser _removeAdvertisements:](a1, v9);

    v10 = (void *)[v16 mutableCopy];
    [v10 minusSet:v7];
    v11 = [v10 allObjects];
    -[HMDMediaBrowser _addAdvertisements:](a1, v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = a1;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring media browser callback since not discovering media accessories", buf, 0xCu);
    }
  }
}

- (void)_removeAdvertisements:(void *)a1
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = a1;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v7;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing advertisements %@", buf, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if ([*((id *)v5 + 2) containsObject:v13])
          {
            [*((id *)v5 + 2) removeObject:v13];
            [v8 addObject:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    if ([v8 count])
    {
      v14 = [v5 clientQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __41__HMDMediaBrowser__removeAdvertisements___block_invoke;
      v15[3] = &unk_264A2F820;
      v15[4] = v5;
      id v16 = v8;
      dispatch_async(v14, v15);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v5 + 2);
  }
}

- (void)_addAdvertisements:(void *)a1
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1 && [v3 count])
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = a1;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding advertisements %@", buf, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (([*((id *)v6 + 2) containsObject:v14] & 1) == 0)
          {
            [*((id *)v6 + 2) addObject:v14];
            [v9 addObject:v14];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    if ([v9 count])
    {
      v15 = [v6 clientQueue];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __38__HMDMediaBrowser__addAdvertisements___block_invoke;
      v16[3] = &unk_264A2F820;
      v16[4] = v6;
      id v17 = v9;
      dispatch_async(v15, v16);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
  }
}

void __38__HMDMediaBrowser__addAdvertisements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    id v3 = [v1 delegate];
    if (objc_opt_respondsToSelector())
    {
      v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = v1;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = HMFGetLogIdentifier();
        int v8 = 138543618;
        id v9 = v7;
        __int16 v10 = 2112;
        id v11 = v2;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of added accessory advertisements: %@", (uint8_t *)&v8, 0x16u);
      }
      [v3 browser:v5 didAddAdvertisements:v2];
    }
  }
}

void __41__HMDMediaBrowser__removeAdvertisements___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    id v3 = [v1 delegate];
    if (objc_opt_respondsToSelector())
    {
      v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = v1;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = HMFGetLogIdentifier();
        int v8 = 138543618;
        id v9 = v7;
        __int16 v10 = 2112;
        id v11 = v2;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of removed accessory advertisements: %@", (uint8_t *)&v8, 0x16u);
      }
      [v3 browser:v5 didRemoveAdvertisements:v2];
    }
  }
}

- (void)deregisterAccessories:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaBrowser *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__HMDMediaBrowser_deregisterAccessories___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__HMDMediaBrowser_deregisterAccessories___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v71 = *MEMORY[0x263EF8340];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = &OBJC_IVAR___HMDResidentDeviceManagerRoarV3__backingStore;
  uint64_t v45 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v45)
  {
    uint64_t v4 = *(void *)v59;
    *(void *)&long long v3 = 138543874;
    long long v40 = v3;
    uint64_t v41 = *(void *)v59;
    uint64_t v42 = v1;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v59 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v58 + 1) + 8 * v5);
        uint64_t v7 = *(void *)(v1 + 40);
        if (v7) {
          id v8 = *(void **)(v7 + v2[528]);
        }
        else {
          id v8 = 0;
        }
        if (objc_msgSend(v8, "containsObject:", *(void *)(*((void *)&v58 + 1) + 8 * v5), v40))
        {
          id v9 = (void *)MEMORY[0x230FBD990]();
          id v10 = *(id *)(v1 + 40);
          id v11 = HMFGetOSLogHandle();
          uint64_t v44 = v5;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v63 = v12;
            __int16 v64 = 2112;
            id v65 = v6;
            _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@De-registering associated media accessory %@", buf, 0x16u);
          }
          uint64_t v13 = *(void *)(v1 + 40);
          if (v13) {
            uint64_t v14 = *(void **)(v13 + v2[528]);
          }
          else {
            uint64_t v14 = 0;
          }
          [v14 removeObject:v6];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v15 = *(void *)(v1 + 40);
          if (v15) {
            id v16 = *(void **)(v15 + 88);
          }
          else {
            id v16 = 0;
          }
          id v46 = [v16 allObjects];
          uint64_t v17 = [v46 countByEnumeratingWithState:&v54 objects:v69 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v47 = *(void *)v55;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v55 != v47) {
                  objc_enumerationMutation(v46);
                }
                long long v20 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                long long v21 = [v20 advertisements];
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v22 = v21;
                uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v68 count:16];
                if (v23)
                {
                  uint64_t v24 = v23;
                  uint64_t v25 = *(void *)v51;
LABEL_22:
                  uint64_t v26 = 0;
                  while (1)
                  {
                    if (*(void *)v51 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v27 = [*(id *)(*((void *)&v50 + 1) + 8 * v26) identifier];
                    char v28 = [v6 isEqual:v27];

                    if (v28) {
                      break;
                    }
                    if (v24 == ++v26)
                    {
                      uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v68 count:16];
                      if (v24) {
                        goto LABEL_22;
                      }
                      goto LABEL_28;
                    }
                  }
                  id v29 = v20;

                  if (!v29) {
                    continue;
                  }

                  v31 = (void *)MEMORY[0x230FBD990]();
                  uint64_t v1 = v42;
                  id v32 = *(id *)(v42 + 40);
                  v33 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    v34 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = v40;
                    v63 = v34;
                    __int16 v64 = 2112;
                    id v65 = v29;
                    __int16 v66 = 2112;
                    v67 = v6;
                    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Disconnecting from and removing the endpoint %@ for media accessory %@", buf, 0x20u);
                  }
                  v48[0] = MEMORY[0x263EF8330];
                  v48[1] = 3221225472;
                  v48[2] = __41__HMDMediaBrowser_deregisterAccessories___block_invoke_99;
                  v48[3] = &unk_264A2F370;
                  v48[4] = *(void *)(v42 + 40);
                  id v30 = v29;
                  id v49 = v30;
                  [v30 disconnectWithCompletionHandler:v48];
                  uint64_t v35 = *(void *)(v42 + 40);
                  id v2 = &OBJC_IVAR___HMDResidentDeviceManagerRoarV3__backingStore;
                  uint64_t v4 = v41;
                  if (v35) {
                    v36 = *(void **)(v35 + 88);
                  }
                  else {
                    v36 = 0;
                  }
                  uint64_t v5 = v44;
                  [v36 removeObject:v30];

                  goto LABEL_39;
                }
LABEL_28:
              }
              uint64_t v18 = [v46 countByEnumeratingWithState:&v54 objects:v69 count:16];
              if (v18) {
                continue;
              }
              break;
            }
            uint64_t v4 = v41;
            uint64_t v1 = v42;
            id v2 = &OBJC_IVAR___HMDResidentDeviceManagerRoarV3__backingStore;
          }
          uint64_t v5 = v44;
          id v30 = v46;
LABEL_39:
        }
        ++v5;
      }
      while (v5 != v45);
      uint64_t v37 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
      uint64_t v45 = v37;
    }
    while (v37);
  }

  uint64_t v38 = *(void *)(v1 + 40);
  if (v38) {
    v39 = *(void **)(v38 + v2[528]);
  }
  else {
    v39 = 0;
  }
  if (![v39 count]) {
    -[HMDMediaBrowser _stopDiscoveringAssociatedAccessoriesViaBonjour](*(void **)(v1 + 40));
  }
}

void __41__HMDMediaBrowser_deregisterAccessories___block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      id v10 = "%{public}@Disconnection from endpoint %@ failed with error %@";
      id v11 = v6;
      uint32_t v12 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v7)
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    id v10 = "%{public}@Disconnected from endpoint %@";
    id v11 = v6;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (void)_stopDiscoveringAssociatedAccessoriesViaBonjour
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = [a1 clientQueue];
    dispatch_assert_queue_V2(v2);

    uint64_t v4 = objc_msgSend(objc_getProperty(a1, v3, 96, 1), "airPlayBonjourBrowser");
    int v5 = [v4 isDiscovering];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = a1;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        int v12 = 138543362;
        uint64_t v13 = v9;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping browse for associated media accessories via bonjour", (uint8_t *)&v12, 0xCu);
      }
      id v11 = objc_msgSend(objc_getProperty(v7, v10, 96, 1), "airPlayBonjourBrowser");
      [v11 stopDiscovering];
    }
  }
}

- (void)updateSessionsForAccessories:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDMediaBrowser *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDMediaBrowser_updateSessionsForAccessories___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDMediaBrowser_updateSessionsForAccessories___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(id **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  if (v1)
  {
    id v2 = [v1 clientQueue];
    dispatch_assert_queue_V2(v2);

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v21;
    uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(id *)(*((void *)&v25 + 1) + 8 * i);
          int v5 = [v1 clientQueue];
          dispatch_assert_queue_V2(v5);

          id v6 = [v1[3] objectForKey:v4];
          id v7 = v6;
          if (v6 && ([v6 isFinished] & 1) == 0)
          {
            uint64_t v17 = (void *)MEMORY[0x230FBD990]();
            __int16 v18 = v1;
            id v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              uint64_t v20 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v37 = v20;
              __int16 v38 = 2112;
              id v39 = v4;
              _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Not starting browse operation as one is already in process for accessory: %@", buf, 0x16u);
            }
          }
          else
          {
            id v8 = [[HMDMediaAccessoryBrowseOperation alloc] initWithAccessoryIdentifier:v4];
            [(HMDMediaAccessoryBrowseOperation *)v8 setEndpointFeatures:8];
            [(HMFOperation *)v8 setQualityOfService:9];
            [v1[3] setObject:v8 forKey:v4];
            objc_initWeak(&location, v1);
            objc_initWeak(&from, v8);
            v29[0] = MEMORY[0x263EF8330];
            v29[1] = 3221225472;
            v29[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke;
            v29[3] = &unk_264A2CBC0;
            objc_copyWeak(&v31, &location);
            objc_copyWeak(&v32, &from);
            id v9 = v4;
            id v30 = v9;
            SEL v10 = (void *)MEMORY[0x230FBD990]([(HMDMediaAccessoryBrowseOperation *)v8 setCompletionBlock:v29]);
            id v11 = v1;
            HMFGetOSLogHandle();
            int v12 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              uint64_t v13 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v37 = v13;
              __int16 v38 = 2112;
              id v39 = v9;
              _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting a reconnaissance session for accessory %@", buf, 0x16u);
            }
            id v15 = objc_getProperty(v11, v14, 96, 1);
            id v16 = (id)[v15 performOperation:v8];

            objc_destroyWeak(&v32);
            objc_destroyWeak(&v31);
            objc_destroyWeak(&from);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v24);
    }
  }
}

void __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke(id *a1)
{
  id v2 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v4 = objc_loadWeakRetained(a1 + 6);
  int v5 = v4;
  if (WeakRetained)
  {
    if (v4)
    {
      id v6 = [v4 error];

      if (!v6)
      {
        id v7 = WeakRetained[13];
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_2;
        v8[3] = &unk_264A2CB98;
        id v9 = v5;
        SEL v10 = WeakRetained;
        id v11 = a1[4];
        objc_copyWeak(&v12, v2);
        dispatch_async(v7, v8);
        objc_destroyWeak(&v12);
      }
    }
  }
}

void __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) endpoint];
  SEL v3 = v2;
  if (v2)
  {
    id v4 = [v2 sessionIdentifier];
    int v5 = *(void **)(a1 + 40);
    if (v5) {
      int v5 = (void *)v5[11];
    }
    id v6 = v5;
    id v7 = [v6 allObjects];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_94;
    v40[3] = &unk_264A2CB48;
    id v8 = v3;
    id v41 = v8;
    id v9 = v4;
    id v42 = v9;
    objc_msgSend(v7, "hmf_objectPassingTest:", v40);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        SEL v14 = HMFGetLogIdentifier();
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v45 = v9;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Endpoint already exists for accessory '%@' with session identifier '%@'", buf, 0x20u);
      }
      if ([v10 isEqual:v8]) {
        goto LABEL_22;
      }
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 40);
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating to new media endpoint %@", buf, 0x16u);
      }
      [v8 updateWithEndpoint:v10];
    }
    else
    {
      id v10 = v8;
      [v10 setBrowser:*(void *)(a1 + 40)];
      uint64_t v25 = *(void *)(a1 + 40);
      if (v25) {
        long long v26 = *(void **)(v25 + 88);
      }
      else {
        long long v26 = 0;
      }
      long long v27 = (void *)MEMORY[0x230FBD990]([v26 addObject:v10]);
      id v28 = *(id *)(a1 + 40);
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = HMFGetLogIdentifier();
        id v31 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v45 = v31;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Creating and connecting to endpoint %@ for accessory: %@", buf, 0x20u);
      }
    }
    id v32 = [v10 description];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_96;
    v37[3] = &unk_264A2CB70;
    objc_copyWeak(&v39, (id *)(a1 + 56));
    id v33 = v32;
    id v38 = v33;
    [v10 updateOutputDevicesAndConnectWithCompletionHandler:v37];
    v34 = *(void **)(a1 + 40);
    id v43 = v10;
    id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    if (v34)
    {
      v36 = [v34 clientQueue];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __53__HMDMediaBrowser__notifyDelegateOfUpdatedEndpoints___block_invoke;
      uint64_t v45 = &unk_264A2F820;
      id v46 = v34;
      id v47 = v35;
      dispatch_async(v36, buf);
    }
    objc_destroyWeak(&v39);

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = *(id *)(a1 + 40);
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    uint64_t v24 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v24;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@No media endpoint found for accessory: %@", buf, 0x16u);
  }
LABEL_23:
}

uint64_t __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionIdentifier];
  uint64_t v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  return v3;
}

void __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v15 = 138543874;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v3;
      id v11 = "%{public}@Connection to endpoint %@ failed with error %@";
      id v12 = v7;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);
    }
  }
  else if (v8)
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    id v11 = "%{public}@Connection to endpoint %@";
    id v12 = v7;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

void __53__HMDMediaBrowser__notifyDelegateOfUpdatedEndpoints___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 browser:*(void *)(a1 + 32) didUpdateEndpoints:*(void *)(a1 + 40)];
  }
}

- (void)registerAccessories:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDMediaBrowser *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__HMDMediaBrowser_registerAccessories___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__HMDMediaBrowser_registerAccessories___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v31 objects:v39 count:16];
  int v5 = &OBJC_IVAR___HMDResidentDeviceManagerRoarV3__backingStore;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v7 = *(void *)v32;
    *(void *)&long long v4 = 138543618;
    long long v29 = v4;
    uint64_t v30 = v1;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * v8);
        uint64_t v10 = *(void *)(v1 + 40);
        if (v10) {
          id v11 = *(void **)(v10 + v5[528]);
        }
        else {
          id v11 = 0;
        }
        if ((objc_msgSend(v11, "containsObject:", *(void *)(*((void *)&v31 + 1) + 8 * v8), v29) & 1) == 0)
        {
          id v12 = (void *)MEMORY[0x230FBD990]();
          id v13 = *(id *)(v1 + 40);
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v15 = v6;
            uint64_t v16 = v7;
            __int16 v17 = v5;
            __int16 v19 = v18 = v2;
            *(_DWORD *)buf = v29;
            v36 = v19;
            __int16 v37 = 2112;
            uint64_t v38 = v9;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering associated media accessory %@", buf, 0x16u);

            id v2 = v18;
            int v5 = v17;
            uint64_t v7 = v16;
            uint64_t v6 = v15;
            uint64_t v1 = v30;
          }

          uint64_t v20 = *(void *)(v1 + 40);
          if (v20) {
            uint64_t v21 = *(void **)(v20 + v5[528]);
          }
          else {
            uint64_t v21 = 0;
          }
          [v21 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v22 = [v2 countByEnumeratingWithState:&v31 objects:v39 count:16];
      uint64_t v6 = v22;
    }
    while (v22);
  }

  uint64_t v23 = *(void *)(v1 + 40);
  if (v23) {
    uint64_t v24 = *(void **)(v23 + v5[528]);
  }
  else {
    uint64_t v24 = 0;
  }
  if ([v24 count]) {
    -[HMDMediaBrowser _startDiscoveringAssociatedAccessoriesViaBonjour](*(id **)(v1 + 40));
  }
  uint64_t v25 = (void *)MEMORY[0x230FBD990]();
  id v26 = *(id *)(v1 + 40);
  long long v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v28;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Bypassing associating local media session for registered media accessory", buf, 0xCu);
  }
}

- (void)_startDiscoveringAssociatedAccessoriesViaBonjour
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (isWatch())
    {
      id v2 = (void *)MEMORY[0x230FBD990]();
      uint64_t v3 = a1;
      long long v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v17 = v5;
        _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Browsing via bonjour is not allowed on watch", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = [a1 clientQueue];
      dispatch_assert_queue_V2(v6);

      objc_msgSend(objc_getProperty(a1, v7, 96, 1), "airPlayBonjourBrowser");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if ([v15 isDiscovering])
      {
      }
      else
      {
        uint64_t v8 = [a1[10] count];

        if (v8)
        {
          uint64_t v9 = (void *)MEMORY[0x230FBD990]();
          uint64_t v10 = a1;
          id v11 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            __int16 v17 = v12;
            _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting browse for associated media accessories via bonjour", buf, 0xCu);
          }
          uint64_t v14 = objc_msgSend(objc_getProperty(v10, v13, 96, 1), "airPlayBonjourBrowser");
          [v14 startDiscovering];
        }
      }
    }
  }
}

- (id)unassociatedAccessoryFromAdvertisementData:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 identifier];
  if (self) {
    identifiersOfAssociatedMediaAccessories = self->_identifiersOfAssociatedMediaAccessories;
  }
  else {
    identifiersOfAssociatedMediaAccessories = 0;
  }
  if (([(NSMutableSet *)identifiersOfAssociatedMediaAccessories containsObject:v5] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v18 = 0;
  }
  else
  {
    id v7 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x263F42608] sharedPreferences];
      id v11 = [v10 preferenceForKey:@"forceAirPlay2ATV"];
      int v12 = [v11 BOOLValue];

      if (v12)
      {
        SEL v13 = [v9 category];
        uint64_t v14 = [v13 categoryType];
        int v15 = [v14 isEqual:*MEMORY[0x263F0B030]];

        if (v15)
        {
          uint64_t v16 = [HMDUnassociatedAirPlayAccessory alloc];
          __int16 v17 = -[HMDMediaBrowser messageDispatcher](self);
          uint64_t v18 = [(HMDUnassociatedMediaAccessory *)v16 initWithAdvertisement:v7 messageDispatcher:v17];

          __int16 v19 = (void *)MEMORY[0x230FBD990]();
          uint64_t v20 = self;
          uint64_t v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = HMFGetLogIdentifier();
            int v30 = 138543874;
            long long v31 = v22;
            __int16 v32 = 2112;
            long long v33 = v18;
            __int16 v34 = 2112;
            id v35 = v7;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Creating an AirPlay accessory '%@' from ATV advertisement: %@", (uint8_t *)&v30, 0x20u);
          }
        }
        else
        {
          uint64_t v18 = 0;
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v23 = [HMDUnassociatedAirPlayAccessory alloc];
      uint64_t v24 = -[HMDMediaBrowser messageDispatcher](self);
      uint64_t v18 = [(HMDUnassociatedMediaAccessory *)v23 initWithAdvertisement:v7 messageDispatcher:v24];

      uint64_t v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = self;
      long long v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = HMFGetLogIdentifier();
        int v30 = 138543874;
        long long v31 = v28;
        __int16 v32 = 2112;
        long long v33 = v18;
        __int16 v34 = 2112;
        id v35 = v7;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Creating an AirPlay accessory '%@' from advertisement: %@", (uint8_t *)&v30, 0x20u);
      }
    }
  }
  return v18;
}

- (id)messageDispatcher
{
  if (a1)
  {
    uint64_t v1 = [a1 homeManager];
    id v2 = [v1 messageDispatcher];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)dumpDescription
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(HMDMediaBrowser *)self accessoryAdvertisements];
  int v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(HMDMediaBrowser *)self accessoryAdvertisements];
  id v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        [v5 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  SEL v13 = (void *)[v5 copy];
  return v13;
}

- (void)stopDiscoveringUnassociatedAccessories
{
  uint64_t v3 = [(HMDMediaBrowser *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HMDMediaBrowser_stopDiscoveringUnassociatedAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __57__HMDMediaBrowser_stopDiscoveringUnassociatedAccessories__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    id v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = HMFGetLogIdentifier();
      int v14 = 138543362;
      long long v15 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery of unassociated accessories", (uint8_t *)&v14, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v6 + 33))
    {
      if (*(void *)(v6 + 64))
      {
        MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback();
        *(void *)(v6 + 64) = 0;
      }
      [*(id *)(v6 + 72) suspend];
      id v7 = *(void **)(v6 + 72);
      *(void *)(v6 + 72) = 0;

      uint64_t v8 = [(id)v6 accessoryAdvertisements];
      if ([v8 count]) {
        -[HMDMediaBrowser _removeAdvertisements:]((void *)v6, v8);
      }
      uint64_t v9 = MRAVRoutingDiscoverySessionSetDiscoveryMode();
      uint64_t v10 = (void *)MEMORY[0x230FBD990](v9);
      id v11 = (id)v6;
      int v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        SEL v13 = HMFGetLogIdentifier();
        int v14 = 138543618;
        long long v15 = v13;
        __int16 v16 = 2048;
        uint64_t v17 = 0;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting MR discovery mode to %ld", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)startDiscoveringUnassociatedAccessories
{
  id v3 = [(HMDMediaBrowser *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDMediaBrowser_startDiscoveringUnassociatedAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__HMDMediaBrowser_startDiscoveringUnassociatedAccessories__block_invoke(uint64_t a1)
{
  v48[1] = *(id *)MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    id v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting discovery of unassociated accessories", (uint8_t *)&buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v6 + 33))
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      id v46 = __47__HMDMediaBrowser__startDiscoveringAccessories__block_invoke;
      id v47 = &unk_264A2CB20;
      objc_copyWeak(v48, &location);
      uint64_t v7 = MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback();
      if (v7)
      {
        *(void *)(v6 + 64) = v7;
        id v8 = objc_alloc(MEMORY[0x263F42658]);
        uint64_t v9 = [v8 initWithTimeInterval:4 options:*(double *)&mediaBrowserProcessingInterval];
        uint64_t v10 = *(void **)(v6 + 72);
        *(void *)(v6 + 72) = v9;

        id v11 = *(void **)(v6 + 72);
        int v12 = [(id)v6 clientQueue];
        [v11 setDelegateQueue:v12];

        [*(id *)(v6 + 72) setDelegate:v6];
        [*(id *)(v6 + 72) resume];
        uint64_t v13 = MRAVRoutingDiscoverySessionSetDiscoveryMode();
        int v14 = (void *)MEMORY[0x230FBD990](v13);
        id v15 = (id)v6;
        HMFGetOSLogHandle();
        __int16 v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          *(_DWORD *)id v41 = 138543618;
          id v42 = v17;
          __int16 v43 = 2048;
          uint64_t v44 = 2;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@_startDiscoveringAccessories: Setting MR discovery mode to %ld and adding all supported output devices to the browser", v41, 0x16u);
        }
        uint64_t v18 = (const void *)MRAVRoutingDiscoverySessionCopyAvailableOutputDevices();
        if (v18)
        {
          __int16 v19 = (void *)MEMORY[0x230FBD990]();
          uint64_t v20 = v15;
          HMFGetOSLogHandle();
          uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = HMFGetLogIdentifier();
            *(_DWORD *)id v41 = 138543618;
            id v42 = v22;
            __int16 v43 = 2112;
            uint64_t v44 = (uint64_t)v18;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Adding initially available output devices: %@", v41, 0x16u);
          }
          -[HMDMediaBrowser _handleAvailableOutputDevices:](v20, (uint64_t)v18);
          CFRelease(v18);
        }
      }
      else
      {
        uint64_t v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = (id)v6;
        HMFGetOSLogHandle();
        uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = HMFGetLogIdentifier();
          *(_DWORD *)id v41 = 138543362;
          id v42 = v26;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to register callback for unassociated accessory discovery", v41, 0xCu);
        }
      }
      objc_destroyWeak(v48);
      objc_destroyWeak(&location);
      uint64_t v6 = *(void *)(a1 + 32);
    }
    long long v27 = (void *)MEMORY[0x263EFF980];
    id v28 = [(id)v6 accessoryAdvertisements];
    long long v29 = objc_msgSend(v27, "arrayWithCapacity:", objc_msgSend(v28, "count"));

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    int v30 = objc_msgSend(*(id *)(a1 + 32), "accessoryAdvertisements", 0);
    uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(v30);
          }
          __int16 v34 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (([v34 isAssociated] & 1) == 0) {
            [v29 addObject:v34];
          }
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v31);
    }

    if ([v29 count]) {
      -[HMDMediaBrowser _addAdvertisements:](*(void **)(a1 + 32), v29);
    }
  }
}

void __47__HMDMediaBrowser__startDiscoveringAccessories__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [WeakRetained clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__HMDMediaBrowser_checkForUpdatedAvailableOutputDevices___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = WeakRetained;
    dispatch_async(v1, block);
  }
}

uint64_t __57__HMDMediaBrowser_checkForUpdatedAvailableOutputDevices___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(unsigned char *)(v1 + 34) = 1;
  }
  return result;
}

- (void)discovery:(id)a3 didStopDiscoveringWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Stopped HAP2BonjourBrowser for airplay with error: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)discovery:(id)a3 didStartDiscoveringWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Started HAP2BonjourBrowser for airplay with error: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)discovery:(id)a3 didLoseAccessory:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(HMDMediaBrowser *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDMediaBrowser_discovery_didLoseAccessory_error___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v13 = v7;
  __int16 v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __52__HMDMediaBrowser_discovery_didLoseAccessory_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) deviceID];
  id v3 = [v2 deviceIDString];

  id v4 = [*(id *)(a1 + 32) airPlayDeviceUUIDString];
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [*(id *)(a1 + 32) rawDiscoveryInfo];
    int v23 = 138543874;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v3;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@HAP2BonjourBrowser did lose accessory : %@ -> %@", (uint8_t *)&v23, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    id v11 = *(void **)(v10 + 80);
  }
  else {
    id v11 = 0;
  }
  int v12 = [v11 containsObject:v3];
  if (v4)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      __int16 v14 = *(void **)(v13 + 80);
    }
    else {
      __int16 v14 = 0;
    }
    int v15 = [v14 containsObject:v4];
  }
  else
  {
    int v15 = 0;
  }
  if (v12) {
    uint64_t v16 = v3;
  }
  else {
    uint64_t v16 = v4;
  }
  if ((v12 | v15) == 1)
  {
    id v17 = v16;
    uint64_t v18 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      __int16 v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 40);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v23 = 138543618;
        id v24 = v22;
        __int16 v25 = 2112;
        id v26 = v17;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of lost accessory : %@", (uint8_t *)&v23, 0x16u);
      }
      [v18 browser:*(void *)(a1 + 40) didLoseAssociatedMediaAccessory:v17 error:*(void *)(a1 + 48)];
    }
  }
}

- (void)discovery:(id)a3 didDiscoverAccessory:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDMediaBrowser *)self clientQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HMDMediaBrowser_discovery_didDiscoverAccessory___block_invoke;
  v8[3] = &unk_264A2F820;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __50__HMDMediaBrowser_discovery_didDiscoverAccessory___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) deviceID];
  id v3 = [v2 deviceIDString];

  id v4 = [*(id *)(a1 + 32) airPlayDeviceUUIDString];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 32) rawDiscoveryInfo];
    int v23 = 138543874;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v3;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@HAP2BonjourBrowser did discover accessory : %@ -> %@", (uint8_t *)&v23, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    id v11 = *(void **)(v10 + 80);
  }
  else {
    id v11 = 0;
  }
  int v12 = [v11 containsObject:v3];
  if (v4)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      __int16 v14 = *(void **)(v13 + 80);
    }
    else {
      __int16 v14 = 0;
    }
    int v15 = [v14 containsObject:v4];
  }
  else
  {
    int v15 = 0;
  }
  if (v12) {
    uint64_t v16 = v3;
  }
  else {
    uint64_t v16 = v4;
  }
  if ((v12 | v15) == 1)
  {
    id v17 = v16;
    uint64_t v18 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      __int16 v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 40);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v23 = 138543618;
        id v24 = v22;
        __int16 v25 = 2112;
        id v26 = v17;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of found accessory : %@", (uint8_t *)&v23, 0x16u);
      }
      [v18 browser:*(void *)(a1 + 40) didFindAssociatedMediaAccessory:v17];
    }
  }
}

- (void)stopDiscoveringAssociatedAccessoriesViaBonjour
{
  id v3 = [(HMDMediaBrowser *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMDMediaBrowser_stopDiscoveringAssociatedAccessoriesViaBonjour__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __65__HMDMediaBrowser_stopDiscoveringAssociatedAccessoriesViaBonjour__block_invoke(uint64_t a1)
{
}

- (void)startDiscoveringAssociatedAccessoriesViaBonjour
{
  id v3 = [(HMDMediaBrowser *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMDMediaBrowser_startDiscoveringAssociatedAccessoriesViaBonjour__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __66__HMDMediaBrowser_startDiscoveringAssociatedAccessoriesViaBonjour__block_invoke(uint64_t a1)
{
}

- (NSArray)accessoryAdvertisements
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_accessoryAdvertisements allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDUnassociatedMediaAccessory)currentAccessory
{
  id v2 = self;
  uint64_t v71 = *MEMORY[0x263EF8340];
  if (self) {
    self = (HMDMediaBrowser *)objc_getProperty(self, a2, 96, 1);
  }
  v68 = [(HMDMediaBrowser *)self currentAccessoryMediaRouteIdentifier];
  if (v68
    && (!v2 ? (id v4 = 0) : (id v4 = objc_getProperty(v2, v3, 96, 1)),
        [v4 isAppleMediaAccessory]))
  {
    id v5 = (void *)MEMORY[0x263F0DF40];
    if (v2) {
      id Property = objc_getProperty(v2, v3, 96, 1);
    }
    else {
      id Property = 0;
    }
    id v7 = [Property productInfo];
    v67 = [v5 categoryForProductInfo:v7];

    if (v2) {
      id v9 = objc_getProperty(v2, v8, 96, 1);
    }
    else {
      id v9 = 0;
    }
    uint64_t v10 = [v9 systemInfo];
    __int16 v66 = [v10 name];
    uint64_t v11 = [v10 productColor];
    uint64_t v13 = [(HMDMediaBrowser *)v2 homeManager];
    if (v2) {
      id v14 = objc_getProperty(v2, v12, 96, 1);
    }
    else {
      id v14 = 0;
    }
    if ([v14 requiresHomePodMiniPairing])
    {
      uint64_t v16 = [[HMDHomeKitVersion alloc] initWithVersionString:@"7.0.1"];
      uint64_t v17 = 3;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 1;
    }
    if (v2) {
      id v24 = objc_getProperty(v2, v15, 96, 1);
    }
    else {
      id v24 = 0;
    }
    uint64_t v63 = v11;
    __int16 v64 = v10;
    if ([v24 requiresHomePod2ndGenPairing])
    {
      uint64_t v61 = v17 | 4;
      __int16 v25 = [[HMDHomeKitVersion alloc] initWithVersionString:@"10.0"];
    }
    else
    {
      __int16 v25 = v16;
      uint64_t v61 = v17;
    }
    id v26 = [HMDUnassociatedAppleMediaAccessory alloc];
    __int16 v27 = +[HMDDeviceAddress localDeviceIDSIdentifier];
    id v28 = [v27 UUIDString];
    uint64_t v29 = [v13 capabilitiesController];
    int v30 = [v29 encodedCurrentAccessoryCapabilities];
    id v65 = v13;
    uint64_t v31 = [v13 capabilitiesController];
    uint64_t v32 = [v31 encodedCurrentResidentCapabilities];
    long long v33 = -[HMDMediaBrowser messageDispatcher](v2);
    uint64_t v34 = v61;
    v62 = v25;
    int v23 = [(HMDUnassociatedAppleMediaAccessory *)v26 initWithIdentifier:v68 name:v66 category:v67 requiredPairingCapabilities:v34 minimumPairingSoftware:v25 productColor:v63 idsIdentifierString:v28 rawAccessoryCapabilities:v30 rawResidentCapabilities:v32 messageDispatcher:v33];

    [(HMDUnassociatedAppleMediaAccessory *)v23 setCurrentAccessory:1];
    id v35 = v64;
    long long v36 = v35;
    if (v2)
    {
      long long v37 = [v35 model];
      long long v38 = &OBJC_IVAR___HMDResidentDeviceManagerRoarV3__backingStore;
      if (v37)
      {
        id v39 = [v36 regionInfo];
        if (v39)
        {
          uint64_t v40 = [v37 stringByAppendingString:v39];
        }
        else
        {
          uint64_t v40 = v37;
        }
        id v41 = v40;
        id v42 = v62;
      }
      else
      {
        id v41 = &stru_26E2EB898;
        id v42 = v62;
      }

      [(HMDUnassociatedAppleMediaAccessory *)v23 setModel:v41];
      __int16 v43 = [v36 serialNumber];
      [(HMDUnassociatedAppleMediaAccessory *)v23 setSerialNumber:v43];

      uint64_t v45 = objc_msgSend(objc_getProperty(v2, v44, 96, 1), "productInfo");
      id v46 = [v45 softwareVersion];
      [(HMDUnassociatedAppleMediaAccessory *)v23 setSoftwareVersion:v46];

      id v48 = objc_getProperty(v2, v47, 96, 1);
    }
    else
    {

      [(HMDUnassociatedAppleMediaAccessory *)v23 setModel:0];
      long long v58 = [v36 serialNumber];
      [(HMDUnassociatedAppleMediaAccessory *)v23 setSerialNumber:v58];

      long long v59 = [0 productInfo];
      long long v60 = [v59 softwareVersion];
      [(HMDUnassociatedAppleMediaAccessory *)v23 setSoftwareVersion:v60];

      id v48 = 0;
      long long v38 = &OBJC_IVAR___HMDResidentDeviceManagerRoarV3__backingStore;
      id v42 = v62;
    }
    -[HMDUnassociatedAppleMediaAccessory setVariant:](v23, "setVariant:", [v48 appleMediaAccessoryVariant]);
    if (v2)
    {
      -[HMDUnassociatedAppleMediaAccessory setSupportedStereoPairVersions:](v23, "setSupportedStereoPairVersions:", objc_msgSend(objc_getProperty(v2, v49, v38[527], 1), "supportedStereoPairVersions"));
      id v51 = objc_getProperty(v2, v50, v38[527], 1);
    }
    else
    {
      -[HMDUnassociatedAppleMediaAccessory setSupportedStereoPairVersions:](v23, "setSupportedStereoPairVersions:", [0 supportedStereoPairVersions]);
      id v51 = 0;
    }
    long long v52 = [v51 currentDevice];
    if (v52)
    {
      [(HMDUnassociatedAppleMediaAccessory *)v23 setDevice:v52];
    }
    else
    {
      long long v53 = (void *)MEMORY[0x230FBD990]();
      long long v54 = v2;
      long long v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        long long v56 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v70 = v56;
        _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain device for current accessory.", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v2) {
      id v18 = objc_getProperty(v2, v3, 96, 1);
    }
    else {
      id v18 = 0;
    }
    if ([v18 isAppleMediaAccessory])
    {
      __int16 v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = v2;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v70 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@No identifier found for current accessory", buf, 0xCu);
      }
    }
    int v23 = 0;
  }

  return (HMDUnassociatedMediaAccessory *)v23;
}

- (NSString)description
{
  return (NSString *)-[HMDMediaBrowser descriptionWithPointer:additionalDescription:](self, 0);
}

- (id)descriptionWithPointer:(void *)a1 additionalDescription:(int)a2
{
  if (a1)
  {
    id v4 = NSString;
    id v5 = [(id)objc_opt_class() shortDescription];
    if (a2)
    {
      objc_msgSend(NSString, "stringWithFormat:", @" %p", a1);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = &stru_26E2EB898;
    }
    id v7 = [a1 accessoryAdvertisements];
    id v8 = [v4 stringWithFormat:@"<%@%@, Advertising accessories = %@>", v5, v6, v7];

    if (a2) {
  }
    }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDMediaBrowser descriptionWithPointer:additionalDescription:](self, 1);
}

- (id)shortDescription
{
  id v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_discoverySession)
  {
    if (self->_discoverySessionCallbackToken) {
      MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback();
    }
    [(HMFTimer *)self->_discoveryPollTimer suspend];
    discoveryPollTimer = self->_discoveryPollTimer;
    self->_discoveryPollTimer = 0;

    CFRelease(self->_discoverySession);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableSet *)self->_mediaEndpoints allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) disconnectWithCompletionHandler:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)HMDMediaBrowser;
  [(HMDMediaBrowser *)&v9 dealloc];
}

- (HMDMediaBrowser)initWithHomeManager:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMDMediaBrowser;
  id v8 = [(HMDMediaBrowser *)&v25 init];
  if (v8)
  {
    HMDispatchQueueNameString();
    id v9 = objc_claimAutoreleasedReturnValue();
    long long v10 = (const char *)[v9 UTF8String];
    long long v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_dataSource, a4);
    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    identifiersOfAssociatedMediaAccessories = v8->_identifiersOfAssociatedMediaAccessories;
    v8->_identifiersOfAssociatedMediaAccessories = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    mediaEndpoints = v8->_mediaEndpoints;
    v8->_mediaEndpoints = (NSMutableSet *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    accessoryAdvertisements = v8->_accessoryAdvertisements;
    v8->_accessoryAdvertisements = (NSMutableSet *)v18;

    v8->_discoverUnassociatedAccessories = 0;
    v8->_discoverAssociatedAccessories = 0;
    uint64_t v20 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    currentBrowseOperations = v8->_currentBrowseOperations;
    v8->_currentBrowseOperations = (NSMapTable *)v20;

    objc_storeWeak((id *)&v8->_homeManager, v6);
    v8->_updateAvailableOutputDevices = 0;
    v8->_discoverySession = (void *)MRAVRoutingDiscoverySessionCreate();
    int v23 = objc_msgSend(objc_getProperty(v8, v22, 96, 1), "airPlayBonjourBrowser");
    [v23 setDelegate:v8];
  }
  return v8;
}

- (HMDMediaBrowser)initWithHomeManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(HMDMediaBrowserDataSource);
  id v6 = [(HMDMediaBrowser *)self initWithHomeManager:v4 dataSource:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_251724 != -1) {
    dispatch_once(&logCategory__hmf_once_t42_251724, &__block_literal_global_251725);
  }
  id v2 = (void *)logCategory__hmf_once_v43_251726;
  return v2;
}

void __30__HMDMediaBrowser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v43_251726;
  logCategory__hmf_once_v43_251726 = v0;
}

+ (id)advertisementsFromOutputDevices:(__CFArray *)a3
{
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    uint64_t v5 = [MEMORY[0x263EFF9C0] setWithCapacity:Count];
    if (Count >= 1)
    {
      CFIndex v6 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a3, v6);
        if (ValueAtIndex) {
          break;
        }
LABEL_11:
        if (Count == ++v6) {
          goto LABEL_25;
        }
      }
      id v8 = [[HMDMediaOutputDevice alloc] initWithOutputDevice:ValueAtIndex];
      unsigned int v9 = [(HMDMediaOutputDevice *)v8 deviceSubtype];
      if (v9 - 15 >= 4 && v9 != 11)
      {
        long long v11 = v8;
        dispatch_queue_t v12 = v11;
        if (v11 && ![(HMDMediaOutputDevice *)v11 supportsHAP])
        {
          long long v13 = [(HMDMediaOutputDevice *)v12 modelID];
          BOOL v14 = +[HMDMediaAccessoryAdvertisement canAirPortExpressSupportMediaAccessory:v13];

          if (v14)
          {
          }
          else
          {
            BOOL v15 = [(HMDMediaOutputDevice *)v12 supportsWHA];

            if (!v15) {
              goto LABEL_10;
            }
          }
          if ([(HMDMediaOutputDevice *)v12 isAppleMediaAccessory]) {
            uint64_t v16 = [[HMDAppleMediaAccessoryAdvertisement alloc] initWithOutputDevice:v12 device:0];
          }
          else {
            uint64_t v16 = [[HMDMediaAccessoryAdvertisement alloc] initWithOutputDevice:v12];
          }
          id v8 = (HMDMediaOutputDevice *)v16;

          if (!v8) {
            goto LABEL_11;
          }
          [v5 addObject:v8];
          goto LABEL_10;
        }
      }
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_25:
  uint64_t v17 = (void *)[v5 copy];

  return v17;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end