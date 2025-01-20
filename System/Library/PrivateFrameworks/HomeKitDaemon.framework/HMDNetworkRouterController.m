@interface HMDNetworkRouterController
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMDHAPAccessory)accessory;
- (HMDNetworkRouterController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5;
- (HMDService)routerService;
- (NSString)wiFiSSID;
- (OS_dispatch_queue)workQueue;
- (unint64_t)hash;
- (void)_handleAccessoryConnected;
- (void)_handleCharacteristicChanges:(id)a3;
- (void)_handleCharacteristicsChangedPayload:(id)a3;
- (void)_handleNetworkAccessViolationUpdate;
- (void)_writeClientConfigurationControlRequest:(id)a3 operationName:(id)a4 completion:(id)a5;
- (void)_writeTLVWithValueInResponse:(id)a3 characteristicType:(id)a4 operationName:(id)a5 completion:(id)a6;
- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 completion:(id)a5;
- (void)_writeValueIfDifferent:(id)a3 characteristicType:(id)a4 operationName:(id)a5 completion:(id)a6;
- (void)addClientConfiguration:(id)a3 completion:(id)a4;
- (void)configure;
- (void)fetchAccessViolationsWithCompletion:(id)a3;
- (void)getClientStatusWithIdentifier:(id)a3 completion:(id)a4;
- (void)getClientStatusWithIdentifiers:(id)a3 completion:(id)a4;
- (void)handleAccessoryConfiguredNotification:(id)a3;
- (void)handleCharacteristicsChangedNotification:(id)a3;
- (void)readClientConfigurationWithClientIdentifier:(id)a3 completion:(id)a4;
- (void)removeClientConfigurationWithClientIdentifier:(id)a3 completion:(id)a4;
- (void)resetAccessViolationForClientIdentifier:(id)a3 completion:(id)a4;
- (void)setAccessory:(id)a3;
- (void)setRouterService:(id)a3;
- (void)updateClientConfiguration:(id)a3 completion:(id)a4;
- (void)writeManagedNetworkEnable:(BOOL)a3 completion:(id)a4;
@end

@implementation HMDNetworkRouterController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routerService);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setRouterService:(id)a3
{
}

- (HMDService)routerService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routerService);
  return (HMDService *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)handleAccessoryConfiguredNotification:(id)a3
{
  v4 = [(HMDNetworkRouterController *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDNetworkRouterController_handleAccessoryConfiguredNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __68__HMDNetworkRouterController_handleAccessoryConfiguredNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAccessoryConnected];
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDNetworkRouterController *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HMDNetworkRouterController_handleCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__HMDNetworkRouterController_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  [v1 _handleCharacteristicsChangedPayload:v2];
}

- (void)_handleAccessoryConnected
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(HMDNetworkRouterController *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v20 = v5;
    id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    [(HMDNetworkRouterController *)self routerService];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v19 = long long v24 = 0u;
    v7 = [v19 characteristics];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v13 = [v12 characteristicType];
          int v14 = [v13 isEqualToString:@"0000021F-0000-1000-8000-0026BB765291"];

          if (v14) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    id v5 = v20;
    if ([v6 count])
    {
      [(HMDNetworkRouterController *)self _handleCharacteristicChanges:v6];
      [v20 enableNotification:1 forCharacteristics:v6 message:0 clientIdentifier:@"com.apple.HomeKitDaemon.networkRouter"];
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Handling connected accessory failed. No hapAccessory found.", buf, 0xCu);
    }
  }
}

- (void)_handleCharacteristicsChangedPayload:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNetworkRouterController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_msgSend(v4, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");
  if ([v6 count])
  {
    id v18 = v4;
    v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v17 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
          int v14 = [(HMDNetworkRouterController *)self accessory];
          v15 = [v13 accessory];
          int v16 = HMFEqualObjects();

          if (v16) {
            [v7 addObject:v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [(HMDNetworkRouterController *)self _handleCharacteristicChanges:v7];
    id v6 = v17;
    id v4 = v18;
  }
}

- (void)_handleCharacteristicChanges:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) type];
        int v10 = [v9 isEqualToString:@"0000021F-0000-1000-8000-0026BB765291"];

        if (v10) {
          [(HMDNetworkRouterController *)self _handleNetworkAccessViolationUpdate];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_handleNetworkAccessViolationUpdate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(HMDNetworkRouterController *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      long long v13 = "%{public}@Handling network access violation failed. No hapAccessory found.";
      long long v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_11:
      _os_log_impl(&dword_22F52A000, v14, v15, v13, buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v6 = [v5 home];
  uint64_t v7 = [v6 routerClientManager];
  char v8 = [v7 started];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      long long v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      long long v13 = "%{public}@Device is not managing the network router, skipping handling of network violation update";
      long long v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__HMDNetworkRouterController__handleNetworkAccessViolationUpdate__block_invoke;
  v16[3] = &unk_264A2D7A0;
  v16[4] = self;
  [(HMDNetworkRouterController *)self fetchAccessViolationsWithCompletion:v16];
LABEL_13:
}

void __65__HMDNetworkRouterController__handleNetworkAccessViolationUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) accessory];
    char v8 = [v7 home];

    if (v8)
    {
      uint64_t v46 = a1;
      id v44 = v6;
      uint64_t v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v45 = v5;
      id v10 = v5;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v54 != v13) {
              objc_enumerationMutation(v10);
            }
            os_log_type_t v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v16 = [v15 clientIdentifier];
            v17 = [v16 value];

            if (v17)
            {
              id v18 = [v15 clientIdentifier];
              uint64_t v19 = [v18 value];
              [v9 setObject:v15 forKey:v19];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
        }
        while (v12);
      }

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v43 = v8;
      obuint64_t j = [v8 accessories];
      uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:v63 count:16];
      uint64_t v21 = v46;
      if (v20)
      {
        uint64_t v22 = v20;
        uint64_t v48 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v50 != v48) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            v25 = [v24 networkClientIdentifier];
            if (v25)
            {
              v26 = v9;
              v27 = [v9 objectForKeyedSubscript:v25];
              uint64_t v28 = v27;
              if (v27)
              {
                v29 = [v27 lastViolationTimestamp];
                v30 = HAPDateWithTimeIntervalSince1970();

                v31 = [v28 lastResetTimestamp];
                v32 = HAPDateWithTimeIntervalSince1970();

                v33 = [[HMDAccessoryNetworkAccessViolation alloc] initWithLastViolationDate:v30 lastViolationResetDate:v32];
                [v24 saveNetworkAccessViolation:v33];
              }
              else
              {
                v34 = (void *)MEMORY[0x230FBD990]();
                id v35 = *(id *)(v21 + 32);
                v36 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  v37 = HMFGetLogIdentifier();
                  v38 = [v24 name];
                  *(_DWORD *)buf = 138543874;
                  v58 = v37;
                  __int16 v59 = 2112;
                  id v60 = v38;
                  __int16 v61 = 2112;
                  v62 = v25;
                  _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@No network access violation info for accessory %@ with client identifier %@", buf, 0x20u);

                  uint64_t v21 = v46;
                }
              }

              uint64_t v9 = v26;
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v63 count:16];
        }
        while (v22);
      }

      id v6 = v44;
      id v5 = v45;
      char v8 = v43;
    }
  }
  else
  {
    v39 = (void *)MEMORY[0x230FBD990]();
    id v40 = *(id *)(a1 + 32);
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v58 = v42;
      __int16 v59 = 2112;
      id v60 = v6;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access violations: %@", buf, 0x16u);
    }
  }
}

- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:a4 value:a3 authorizationData:0 type:0];
  id v10 = [(HMDNetworkRouterController *)self accessory];
  v16[0] = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  uint64_t v12 = [(HMDNetworkRouterController *)self workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__HMDNetworkRouterController__writeValue_forCharacteristic_completion___block_invoke;
  v14[3] = &unk_264A28FD0;
  id v15 = v8;
  id v13 = v8;
  [v10 writeCharacteristicValues:v11 source:7 queue:v12 completionHandler:v14];
}

void __71__HMDNetworkRouterController__writeValue_forCharacteristic_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_writeTLVWithValueInResponse:(id)a3 characteristicType:(id)a4 operationName:(id)a5 completion:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v31 = 0;
  long long v14 = [v10 serializeWithError:&v31];
  id v15 = v31;
  if (v14)
  {
    uint64_t v16 = [(HMDNetworkRouterController *)self routerService];
    v17 = [v16 findCharacteristicWithType:v11];

    if (v17)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __103__HMDNetworkRouterController__writeTLVWithValueInResponse_characteristicType_operationName_completion___block_invoke;
      v27[3] = &unk_264A24500;
      v27[4] = self;
      id v28 = v12;
      id v29 = v14;
      id v30 = v13;
      [(HMDNetworkRouterController *)self _writeValue:v29 forCharacteristic:v17 completion:v27];
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      long long v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        __int16 v34 = 2112;
        id v35 = v12;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Characteristic not found for operation %@", buf, 0x16u);
      }
      v26 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*((void (**)(id, void *, void))v13 + 2))(v13, v26, 0);

      v17 = 0;
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v33 = v21;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v36 = 2112;
      id v37 = v15;
      __int16 v38 = 2112;
      id v39 = v12;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize TLV: %@ with error: %@ for operation %@", buf, 0x2Au);
    }
    v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, void *, void))v13 + 2))(v13, v17, 0);
  }
}

void __103__HMDNetworkRouterController__writeTLVWithValueInResponse_characteristicType_operationName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = [v3 error];
      int v23 = 138544130;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@%@ with write value %@ failed with error %@", (uint8_t *)&v23, 0x2Au);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = [v3 error];
  }
  else
  {
    id v15 = [v3 value];

    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 56);
      long long v14 = [v3 value];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v14);
      goto LABEL_8;
    }
    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      int v23 = 138543874;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid response from %@ with write value %@", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
  }
  long long v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, v13, 0);
LABEL_8:
}

- (void)_writeValueIfDifferent:(id)a3 characteristicType:(id)a4 operationName:(id)a5 completion:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void))a6;
  long long v14 = [(HMDNetworkRouterController *)self routerService];
  id v15 = [v14 findCharacteristicWithType:v11];

  if (v15)
  {
    uint64_t v16 = [v15 value];
    int v17 = [v16 isEqual:v10];

    if (v17)
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      uint64_t v19 = self;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v32 = v21;
        __int16 v33 = 2112;
        id v34 = v12;
        __int16 v35 = 2112;
        id v36 = v10;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Omitting %@ write with value %@, cached value matches", buf, 0x20u);
      }
      v13[2](v13, 0);
    }
    else
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __97__HMDNetworkRouterController__writeValueIfDifferent_characteristicType_operationName_completion___block_invoke;
      v27[3] = &unk_264A24500;
      v27[4] = self;
      id v28 = v12;
      id v29 = v10;
      id v30 = v13;
      [(HMDNetworkRouterController *)self _writeValue:v29 forCharacteristic:v15 completion:v27];
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    int v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Characteristic not found for operation %@", buf, 0x16u);
    }
    uint64_t v26 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    ((void (**)(id, void *))v13)[2](v13, v26);
  }
}

void __97__HMDNetworkRouterController__writeValueIfDifferent_characteristicType_operationName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = [v3 error];
      int v21 = 138544130;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@%@ with write value %@ failed with error %@", (uint8_t *)&v21, 0x2Au);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = [v3 error];
  }
  else
  {
    if (v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_8;
    }
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      int v21 = 138543874;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid response from %@ with write value %@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
  }
  long long v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v13);

LABEL_8:
}

- (void)_writeClientConfigurationControlRequest:(id)a3 operationName:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    long long v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v23 = v14;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Writing client configuration request %@ for %@", buf, 0x20u);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __95__HMDNetworkRouterController__writeClientConfigurationControlRequest_operationName_completion___block_invoke;
  v18[3] = &unk_264A2CA30;
  v18[4] = v12;
  id v19 = v9;
  id v20 = v8;
  id v21 = v10;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  [(HMDNetworkRouterController *)v12 _writeTLVWithValueInResponse:v16 characteristicType:@"0000020C-0000-1000-8000-0026BB765291" operationName:v17 completion:v18];
}

void __95__HMDNetworkRouterController__writeClientConfigurationControlRequest_operationName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v10;
      __int16 v49 = 2112;
      uint64_t v50 = v11;
      __int16 v51 = 2112;
      id v52 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@%@ operation failed with error %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v46 = 0;
    uint64_t v12 = +[HMDNetworkRouterClientControlResponse parsedFromData:v6 error:&v46];
    uint64_t v13 = (__CFString *)v46;
    if (v13)
    {
      long long v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        uint64_t v18 = *(void *)(a1 + 40);
        id v19 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        uint64_t v48 = v17;
        __int16 v49 = 2112;
        uint64_t v50 = v18;
        __int16 v51 = 2112;
        id v52 = v19;
        __int16 v53 = 2112;
        long long v54 = v13;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse response to %@ request: %@ with error: %@", buf, 0x2Au);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v20 = [v12 operationResponses];
      id v21 = [v20 firstObject];

      if (v21)
      {
        uint64_t v22 = [v21 configuration];
        uint64_t v45 = [v22 clientIdentifier];

        __int16 v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = *(id *)(a1 + 32);
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v44 = HMFGetLogIdentifier();
          uint64_t v41 = *(void *)(a1 + 40);
          v43 = [v21 status];
          HMDNetworkRouterControlOperationStatusTypeAsString([v43 status]);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            [NSString stringWithFormat:@" (returned client identifier = %@)", v45];
            id v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v27 = &stru_26E2EB898;
          }
          *(_DWORD *)buf = 138544130;
          uint64_t v48 = v44;
          __int16 v49 = 2112;
          uint64_t v50 = v41;
          __int16 v51 = 2112;
          id v52 = v26;
          __int16 v53 = 2112;
          v42 = v27;
          long long v54 = v27;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@%@ operation status %@%@", buf, 0x2Au);
          if (v45) {
        }
          }
        uint64_t v36 = *(void *)(a1 + 56);
        uint64_t v37 = [v21 status];
        uint64_t v38 = [v37 status];
        uint64_t v39 = v38;
        if ((unint64_t)(v38 - 1) > 0xA)
        {
          uint64_t v40 = 0;
        }
        else
        {
          uint64_t v40 = [MEMORY[0x263F087E8] hmErrorWithCode:qword_2303E4648[v38 - 1]];
        }
        if (v39 && !v40)
        {
          uint64_t v40 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
        }
        (*(void (**)(uint64_t, void *, void *))(v36 + 16))(v36, v40, v21);

        __int16 v35 = (void *)v45;
      }
      else
      {
        uint64_t v28 = (void *)MEMORY[0x230FBD990]();
        id v29 = *(id *)(a1 + 32);
        id v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = HMFGetLogIdentifier();
          uint64_t v32 = *(void *)(a1 + 40);
          __int16 v33 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          uint64_t v48 = v31;
          __int16 v49 = 2112;
          uint64_t v50 = v32;
          __int16 v51 = 2112;
          id v52 = v33;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Invalid response from %@ with write value %@", buf, 0x20u);
        }
        uint64_t v34 = *(void *)(a1 + 56);
        __int16 v35 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
        (*(void (**)(uint64_t, void *, void))(v34 + 16))(v34, v35, 0);
      }
    }
  }
}

- (void)resetAccessViolationForClientIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = accessViolationControlWithType(2);
  id v9 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v7];

  id v10 = [HMDNetworkRouterClientIdentifierList alloc];
  uint64_t v11 = [MEMORY[0x263EFF980] arrayWithObject:v9];
  uint64_t v12 = [(HMDNetworkRouterClientIdentifierList *)v10 initWithClientIdentifiers:v11];
  [v8 setClientIdentifierList:v12];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__HMDNetworkRouterController_resetAccessViolationForClientIdentifier_completion___block_invoke;
  v14[3] = &unk_264A244D8;
  id v15 = v6;
  id v13 = v6;
  [(HMDNetworkRouterController *)self _writeTLVWithValueInResponse:v8 characteristicType:@"0000021F-0000-1000-8000-0026BB765291" operationName:@"Reset Access Violation" completion:v14];
}

uint64_t __81__HMDNetworkRouterController_resetAccessViolationForClientIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAccessViolationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = accessViolationControlWithType(1);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDNetworkRouterController_fetchAccessViolationsWithCompletion___block_invoke;
  v7[3] = &unk_264A244B0;
  v7[4] = self;
  id v8 = @"Get Access Violation List";
  id v9 = v4;
  id v6 = v4;
  [(HMDNetworkRouterController *)self _writeTLVWithValueInResponse:v5 characteristicType:@"0000021F-0000-1000-8000-0026BB765291" operationName:@"Get Access Violation List" completion:v7];
}

void __66__HMDNetworkRouterController_fetchAccessViolationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v21 = 0;
    id v7 = +[HMDNetworkRouterAccessViolationControlResponse parsedFromData:v6 error:&v21];
    id v8 = v21;
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = [v7 violations];
      uint64_t v11 = (void *)[v10 copy];
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v11, 0);
    }
    else
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        __int16 v23 = v19;
        __int16 v24 = 2112;
        id v25 = v20;
        __int16 v26 = 2112;
        id v27 = v6;
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse response to %@ request %@: %@", buf, 0x2Au);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    long long v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access violation list TLV: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)removeClientConfigurationWithClientIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = clientControlWithOperationType(4);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v7];

  id v10 = [v8 operations];
  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = [v11 configuration];
  [v12 setClientIdentifier:v9];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__HMDNetworkRouterController_removeClientConfigurationWithClientIdentifier_completion___block_invoke;
  v14[3] = &unk_264A24488;
  id v15 = v6;
  id v13 = v6;
  [(HMDNetworkRouterController *)self _writeClientConfigurationControlRequest:v8 operationName:@"Remove Client Configuration" completion:v14];
}

uint64_t __87__HMDNetworkRouterController_removeClientConfigurationWithClientIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateClientConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = clientControlWithOperationType(5);
  uint64_t v9 = [v8 operations];
  id v10 = [v9 firstObject];
  [v10 setConfiguration:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HMDNetworkRouterController_updateClientConfiguration_completion___block_invoke;
  v12[3] = &unk_264A24488;
  id v13 = v6;
  id v11 = v6;
  [(HMDNetworkRouterController *)self _writeClientConfigurationControlRequest:v8 operationName:@"Update Client Configuration" completion:v12];
}

uint64_t __67__HMDNetworkRouterController_updateClientConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readClientConfigurationWithClientIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = clientControlWithOperationType(2);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v7];

  id v10 = [v8 operations];
  id v11 = [v10 firstObject];
  uint64_t v12 = [v11 configuration];
  [v12 setClientIdentifier:v9];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__HMDNetworkRouterController_readClientConfigurationWithClientIdentifier_completion___block_invoke;
  v14[3] = &unk_264A24488;
  id v15 = v6;
  id v13 = v6;
  [(HMDNetworkRouterController *)self _writeClientConfigurationControlRequest:v8 operationName:@"Read Client Configuration" completion:v14];
}

void __85__HMDNetworkRouterController_readClientConfigurationWithClientIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 configuration];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

- (void)addClientConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = clientControlWithOperationType(3);
  uint64_t v9 = [v8 operations];
  id v10 = [v9 firstObject];
  [v10 setConfiguration:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__HMDNetworkRouterController_addClientConfiguration_completion___block_invoke;
  v12[3] = &unk_264A24488;
  id v13 = v6;
  id v11 = v6;
  [(HMDNetworkRouterController *)self _writeClientConfigurationControlRequest:v8 operationName:@"Add Client Configuration" completion:v12];
}

void __64__HMDNetworkRouterController_addClientConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = [a3 configuration];
  id v6 = [v5 clientIdentifier];
  id v7 = [v6 value];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v7);
  }
  else if (v10)
  {
    (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v10, 0);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
}

- (void)getClientStatusWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HMDNetworkRouterClientStatusIdentifierList alloc];
  uint64_t v9 = [MEMORY[0x263EFF980] arrayWithObject:v7];

  id v10 = [(HMDNetworkRouterClientStatusIdentifierList *)v8 initWithClientStatusIdentifiers:v9];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__HMDNetworkRouterController_getClientStatusWithIdentifier_completion___block_invoke;
  v12[3] = &unk_264A24460;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(HMDNetworkRouterController *)self getClientStatusWithIdentifiers:v10 completion:v12];
}

void __71__HMDNetworkRouterController_getClientStatusWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = [v6 clientStatuses];
    unint64_t v9 = [v8 count];

    if (v9 < 2)
    {
      uint64_t v16 = *(void *)(a1 + 40);
      id v15 = [v7 clientStatuses];
      id v17 = [v15 firstObject];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);
    }
    else
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        int v18 = 138543362;
        id v19 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Router returned multiple client status results but only one was expected", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
      (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
    }
  }
}

- (void)getClientStatusWithIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[HMDNetworkRouterClientStatusControlOperation alloc] initWithOperation:1];
  unint64_t v9 = [[HMDNetworkRouterClientStatusControl alloc] initWithOperation:v8 clientStatusIdentifierList:v6];
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    __int16 v23 = @"Get Client Status";
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Writing client status request %@ for %@", buf, 0x20u);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__HMDNetworkRouterController_getClientStatusWithIdentifiers_completion___block_invoke;
  v15[3] = &unk_264A244B0;
  v15[4] = v11;
  uint64_t v16 = @"Get Client Status";
  id v17 = v7;
  id v14 = v7;
  [(HMDNetworkRouterController *)v11 _writeTLVWithValueInResponse:v9 characteristicType:@"0000020D-0000-1000-8000-0026BB765291" operationName:@"Get Client Status" completion:v15];
}

void __72__HMDNetworkRouterController_getClientStatusWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v20 = 0;
    id v7 = +[HMDNetworkRouterClientStatusList parsedFromData:v6 error:&v20];
    id v8 = v20;
    unint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    uint64_t v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        __int16 v22 = v13;
        __int16 v23 = 2112;
        uint64_t v24 = v14;
        __int16 v25 = 2112;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v8;
        id v15 = "%{public}@Failed to parse response to %@ request: %@ with error: %@";
        uint64_t v16 = v12;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        uint32_t v18 = 42;
LABEL_8:
        _os_log_impl(&dword_22F52A000, v16, v17, v15, buf, v18);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      __int16 v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = v7;
      id v15 = "%{public}@%@ returned response: %@";
      uint64_t v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
      uint32_t v18 = 32;
      goto LABEL_8;
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    goto LABEL_10;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_10:
}

- (void)writeManagedNetworkEnable:(BOOL)a3 completion:(id)a4
{
  if (a3) {
    uint64_t v4 = &unk_26E472658;
  }
  else {
    uint64_t v4 = &unk_26E472670;
  }
  [(HMDNetworkRouterController *)self _writeValueIfDifferent:v4 characteristicType:@"00000215-0000-1000-8000-0026BB765291" operationName:@"Setting Managed Network Enable" completion:a4];
}

- (NSString)wiFiSSID
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNetworkRouterController *)self routerService];
  uint64_t v4 = [v3 getConfiguredName];

  if (v4 && [v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@SSID unavailable", (uint8_t *)&v11, 0xCu);
    }
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (unint64_t)hash
{
  id v2 = [(HMDNetworkRouterController *)self routerService];
  id v3 = [v2 uuid];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HMDNetworkRouterController *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(HMDNetworkRouterController *)self routerService];
      id v7 = [v6 uuid];
      id v8 = [(HMDNetworkRouterController *)v5 routerService];

      unint64_t v9 = [v8 uuid];
      char v10 = [v7 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (void)configure
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNetworkRouterController *)self accessory];
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel_handleCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v3];

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel_handleAccessoryConfiguredNotification_ name:@"HMDAccessoryConnectedNotification" object:v3];

    if ([v3 isReachable])
    {
      id v6 = [(HMDNetworkRouterController *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__HMDNetworkRouterController_configure__block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = self;
      dispatch_async(v6, block);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    unint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not configuring network router controller as accessory is nil", buf, 0xCu);
    }
  }
}

uint64_t __39__HMDNetworkRouterController_configure__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAccessoryConnected];
}

- (HMDNetworkRouterController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDNetworkRouterController;
  int v11 = [(HMDNetworkRouterController *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v8);
    objc_storeWeak((id *)&v12->_routerService, v9);
    objc_storeStrong((id *)&v12->_workQueue, a5);
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_184048 != -1) {
    dispatch_once(&logCategory__hmf_once_t28_184048, &__block_literal_global_184049);
  }
  id v2 = (void *)logCategory__hmf_once_v29_184050;
  return v2;
}

void __41__HMDNetworkRouterController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v29_184050;
  logCategory__hmf_once_v29_184050 = v0;
}

@end