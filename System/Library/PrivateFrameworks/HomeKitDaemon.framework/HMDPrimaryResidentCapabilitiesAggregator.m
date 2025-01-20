@interface HMDPrimaryResidentCapabilitiesAggregator
+ (id)logCategory;
- (HMDPrimaryResidentCapabilitiesAggregator)initWithDataSource:(id)a3 delegate:(id)a4 queue:(id)a5 notificationCenter:(id)a6 homeUUID:(id)a7 accessories:(id)a8;
- (id)accessoryCapabilitiesForAccessory:(id)a3 ifDifferentFrom:(id)a4;
- (id)logIdentifier;
- (id)publicPairingIdentityForAccessory:(id)a3 ifDifferentFrom:(id)a4;
- (id)residentCapabilitiesForAccessory:(id)a3 ifDifferentFrom:(id)a4;
- (void)_handleAddedAccessories:(uint64_t)a1;
- (void)_handleDidBecomePrimaryResident;
- (void)_processEventIfNewer:(void *)a3 topic:;
- (void)didAddAccessory:(id)a3;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)didRemoveAccessory:(id)a3;
- (void)handlePrimaryResidentIsCurrentDeviceChangeNotification:(id)a3;
- (void)processSoftwareVersionEvent:(void *)a3 accessoryTopic:;
- (void)startIfPrimaryResident;
@end

@implementation HMDPrimaryResidentCapabilitiesAggregator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
}

- (void)_processEventIfNewer:(void *)a3 topic:
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = a1;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v70 = v10;
      __int16 v71 = 2112;
      id v72 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received event for: %@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained(v8 + 2);
    id v12 = objc_loadWeakRetained(v8 + 3);
    if (!WeakRetained) {
      goto LABEL_34;
    }
    v13 = [MEMORY[0x263F0E300] decodeTopic:v6];
    v14 = [v13 asAccessoryTopic];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 accessoryEventTopicSuffixID];
      if (v16 == *MEMORY[0x263F0B2D0])
      {
        id v17 = objc_alloc(MEMORY[0x263F0DF30]);
        v18 = [v5 encodedData];
        v19 = (void *)[v17 initWithProtoData:v18];

        v20 = [v15 accessoryUUID];
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __71__HMDPrimaryResidentCapabilitiesAggregator__processEventIfNewer_topic___block_invoke;
        v63[3] = &unk_264A2E300;
        v64 = v19;
        v65 = v8;
        id v66 = v12;
        id v67 = v5;
        id v68 = v15;
        id v21 = v19;
        [v66 aggregator:v8 accessoryCapabilitiesWithUUID:v20 completion:v63];

        v22 = v64;
LABEL_32:

        goto LABEL_33;
      }
      uint64_t v28 = [v15 accessoryEventTopicSuffixID];
      if (v28 == *MEMORY[0x263F0B308])
      {
        id v29 = objc_alloc(MEMORY[0x263F0E6C0]);
        v30 = [v5 encodedData];
        v31 = (void *)[v29 initWithProtoData:v30];

        v32 = [v15 accessoryUUID];
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __71__HMDPrimaryResidentCapabilitiesAggregator__processEventIfNewer_topic___block_invoke_22;
        v57[3] = &unk_264A2E300;
        v58 = v31;
        v59 = v8;
        id v60 = v12;
        id v61 = v5;
        id v62 = v15;
        id v21 = v31;
        [v60 aggregator:v8 residentCapabilitiesWithUUID:v32 completion:v57];

        v22 = v58;
        goto LABEL_32;
      }
      uint64_t v33 = [v15 accessoryEventTopicSuffixID];
      if (v33 == *MEMORY[0x263F0B300])
      {
        id v21 = v5;
        id v55 = v15;
        id v34 = objc_loadWeakRetained(v8 + 3);
        if (v34)
        {
          id v35 = objc_alloc(MEMORY[0x263F425E8]);
          context = v21;
          v36 = [v21 encodedData];
          v37 = (void *)[v35 initWithProtoData:v36];

          if (v37)
          {
            v38 = [v55 accessoryUUID];
            [v34 aggregator:v8 didReceivePublicPairingKeyWithUUID:v38 pairingIdentity:v37];
          }
          else
          {
            v47 = (void *)MEMORY[0x230FBD990]();
            v52 = v8;
            v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v49 = v50 = v47;
              *(_DWORD *)buf = 138543618;
              v70 = v49;
              __int16 v71 = 2112;
              id v72 = context;
              _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to process accessory public pairing identity event: %@ due to invalid data", buf, 0x16u);

              v47 = v50;
            }
          }
          id v21 = context;
        }
        else
        {
          contexta = (void *)MEMORY[0x230FBD990]();
          v45 = v8;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v51 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v70 = v51;
            __int16 v71 = 2112;
            id v72 = v21;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to process accessory public pairing identity event: %@ due to no delegate", buf, 0x16u);
          }
        }

        v22 = v55;
        goto LABEL_32;
      }
      uint64_t v39 = [v15 accessoryEventTopicSuffixID];
      if (v39 == *MEMORY[0x263F0B2E0])
      {
        id v40 = v15;
        id v41 = v5;
        id v56 = objc_loadWeakRetained(v8 + 3);
        v42 = [v40 accessoryUUID];

        v43 = [v41 encodedData];

        [v56 aggregator:v8 didReceiveDeviceIRKWithUUID:v42 deviceIRK:v43];
        goto LABEL_33;
      }
      uint64_t v44 = [v15 accessoryEventTopicSuffixID];
      if (v44 == *MEMORY[0x263F0B328])
      {
        -[HMDPrimaryResidentCapabilitiesAggregator processSoftwareVersionEvent:accessoryTopic:](v8, v5, v15);
        goto LABEL_33;
      }
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = v8;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v26;
        __int16 v71 = 2112;
        id v72 = v6;
        v27 = "%{public}@Accessory event does not have expected suffix %@";
        goto LABEL_10;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = v8;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v26;
        __int16 v71 = 2112;
        id v72 = v6;
        v27 = "%{public}@Unable to parse topic %@";
LABEL_10:
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);
      }
    }

LABEL_33:

LABEL_34:
  }
}

void __71__HMDPrimaryResidentCapabilitiesAggregator__processEventIfNewer_topic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3) {
    v4 = (void *)[objc_alloc(MEMORY[0x263F0DF30]) initWithProtoData:v3];
  }
  else {
    v4 = 0;
  }
  if (([*(id *)(a1 + 32) isEqual:v4] & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138543618;
      id v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating on receiving different accessory capabilities %@.", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    v13 = [*(id *)(a1 + 56) encodedData];
    v14 = [*(id *)(a1 + 64) accessoryUUID];
    v15 = [*(id *)(a1 + 64) homeUUID];
    [v12 aggregator:v10 changedAccessoryCapabilities:v11 rawCapabilities:v13 accessoryUUID:v14 homeUUID:v15];
  }
}

void __71__HMDPrimaryResidentCapabilitiesAggregator__processEventIfNewer_topic___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3) {
    v4 = (void *)[objc_alloc(MEMORY[0x263F0E6C0]) initWithProtoData:v3];
  }
  else {
    v4 = 0;
  }
  if (([*(id *)(a1 + 32) isEqual:v4] & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138543618;
      id v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating on receiving different resident capabilities %@.", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    v13 = [*(id *)(a1 + 56) encodedData];
    v14 = [*(id *)(a1 + 64) accessoryUUID];
    v15 = [*(id *)(a1 + 64) homeUUID];
    [v12 aggregator:v10 changedResidentCapabilities:v11 rawCapabilities:v13 accessoryUUID:v14 homeUUID:v15];
  }
}

- (void)processSoftwareVersionEvent:(void *)a3 accessoryTopic:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 3);
  if (WeakRetained)
  {
    id v8 = objc_alloc(MEMORY[0x263F0DFF0]);
    uint64_t v9 = [v5 encodedData];
    uint64_t v10 = (void *)[v8 initWithProtoData:v9];

    if (v10)
    {
      uint64_t v11 = [v6 accessoryUUID];
      id v12 = [v10 softwareVersion];
      [WeakRetained aggregator:a1 didReceiveSoftwareVersionWithUUID:v11 softwareVersion:v12];
    }
    else
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      __int16 v18 = a1;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v20;
        __int16 v23 = 2112;
        id v24 = v5;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to process accessory software version event: %@ due to invalid data", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = a1;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to process accessory software version event: %@ due to no delegate", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
}

- (void)handlePrimaryResidentIsCurrentDeviceChangeNotification:(id)a3
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__HMDPrimaryResidentCapabilitiesAggregator_handlePrimaryResidentIsCurrentDeviceChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __99__HMDPrimaryResidentCapabilitiesAggregator_handlePrimaryResidentIsCurrentDeviceChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v4 = [WeakRetained isCurrentDevicePrimaryResident];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v4 == (*(unsigned char *)(v5 + 8) != 0)) {
      return;
    }
  }
  else if ((v4 & 1) == 0)
  {
    return;
  }
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [NSNumber numberWithBool:v4];
    int v16 = 138543618;
    id v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Primary resident status changed to %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    *(unsigned char *)(v11 + 8) = v4;
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      if (*(unsigned char *)(v12 + 8))
      {
        -[HMDPrimaryResidentCapabilitiesAggregator _handleDidBecomePrimaryResident](v12);
      }
      else
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 40));
        id v13 = objc_loadWeakRetained((id *)(v12 + 16));
        v14 = v13;
        if (v13)
        {
          v15 = [v13 localAndRemoteSubscriptionProvider];
          [v15 unregisterConsumer:v12 completion:&__block_literal_global_19_261217];
        }
      }
    }
  }
}

- (void)_handleDidBecomePrimaryResident
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  [WeakRetained aggregatorDidBecomePrimary:a1];

  id v3 = [*(id *)(a1 + 56) allObjects];
  -[HMDPrimaryResidentCapabilitiesAggregator _handleAddedAccessories:](a1, v3);
}

- (void)_handleAddedAccessories:(uint64_t)a1
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if ([v3 count])
    {
      if (*(unsigned char *)(a1 + 8))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        uint64_t v5 = WeakRetained;
        if (WeakRetained)
        {
          id v29 = WeakRetained;
          v30 = v3;
          v38 = [MEMORY[0x263EFF980] array];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id obj = *(id *)(a1 + 56);
          uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v39)
          {
            uint64_t v37 = *(void *)v49;
            uint64_t v36 = *MEMORY[0x263F0B2D0];
            uint64_t v35 = *MEMORY[0x263F0B308];
            uint64_t v34 = *MEMORY[0x263F0B300];
            uint64_t v33 = *MEMORY[0x263F0B2E0];
            uint64_t v32 = *MEMORY[0x263F0B328];
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v49 != v37) {
                  objc_enumerationMutation(obj);
                }
                id v7 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                id v43 = *(id *)(a1 + 32);
                id v8 = (void *)MEMORY[0x263F0DFA8];
                id v42 = *(id *)(a1 + 32);
                id v9 = v7;
                id v41 = [v8 topicFromSuffixID:v36 homeUUID:v42 accessoryUUID:v9];
                *(void *)buf = v41;
                uint64_t v10 = (void *)MEMORY[0x263F0DFA8];
                id v40 = *(id *)(a1 + 32);
                uint64_t v11 = [v10 topicFromSuffixID:v35 homeUUID:v40 accessoryUUID:v9];
                *(void *)&buf[8] = v11;
                uint64_t v12 = (void *)MEMORY[0x263F0DFA8];
                id v13 = *(id *)(a1 + 32);
                v14 = [v12 topicFromSuffixID:v34 homeUUID:v13 accessoryUUID:v9];
                *(void *)&buf[16] = v14;
                v15 = (void *)MEMORY[0x263F0DFA8];
                id v16 = *(id *)(a1 + 32);
                id v17 = [v15 topicFromSuffixID:v33 homeUUID:v16 accessoryUUID:v9];
                v54 = v17;
                __int16 v18 = (void *)MEMORY[0x263F0DFA8];
                uint64_t v19 = a1;
                id v20 = *(id *)(a1 + 32);
                int v21 = [v18 topicFromSuffixID:v32 homeUUID:v20 accessoryUUID:v9];

                id v55 = v21;
                v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:5];

                a1 = v19;
                [v38 addObjectsFromArray:v22];
              }
              uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
            }
            while (v39);
          }

          __int16 v23 = (void *)MEMORY[0x230FBD990]();
          id v24 = (id)a1;
          uint64_t v25 = HMFGetOSLogHandle();
          id v3 = v30;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v26;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v30;
            _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Subscribing for accessories: %@", buf, 0x16u);
          }
          uint64_t v5 = v29;
          v27 = [v29 localAndRemoteSubscriptionProvider];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __68__HMDPrimaryResidentCapabilitiesAggregator__handleAddedAccessories___block_invoke;
          v44[3] = &unk_264A2E2D8;
          v44[4] = v24;
          id v45 = v38;
          id v46 = v29;
          id v47 = v30;
          id v28 = v38;
          [v27 changeRegistrationsForConsumer:v24 topicFilterAdditions:v28 topicFilterRemovals:MEMORY[0x263EFFA68] completion:v44];
        }
      }
    }
  }
}

void __68__HMDPrimaryResidentCapabilitiesAggregator__handleAddedAccessories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error subscribing to capabilities for accessories: %@, error: %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      id v13 = *(NSObject **)(v12 + 40);
    }
    else {
      id v13 = 0;
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__HMDPrimaryResidentCapabilitiesAggregator__handleAddedAccessories___block_invoke_2;
    v16[3] = &unk_264A2E610;
    id v17 = *(id *)(a1 + 40);
    id v18 = v5;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    id v19 = v14;
    uint64_t v20 = v15;
    dispatch_async(v13, v16);
  }
}

void __68__HMDPrimaryResidentCapabilitiesAggregator__handleAddedAccessories___block_invoke_2(id *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(a1[5], "objectForKeyedSubscript:", v7, (void)v12);
        id v9 = [a1[6] eventStoreReadHandle];
        uint64_t v10 = [v9 lastEventForTopic:v7];

        uint64_t v11 = v8;
        if (v8 || (uint64_t v11 = v10) != 0) {
          -[HMDPrimaryResidentCapabilitiesAggregator _processEventIfNewer:topic:](a1[7], v11, v7);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (id)publicPairingIdentityForAccessory:(id)a3 ifDifferentFrom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      id v9 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B300] homeUUID:self->_homeUUID accessoryUUID:v6];
      uint64_t v10 = [WeakRetained eventStoreReadHandle];
      uint64_t v11 = [v10 lastEventForTopic:v9];

      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x263F425E8]);
        long long v13 = [v11 encodedData];
        long long v14 = (void *)[v12 initWithProtoData:v13];

        if (!v7) {
          goto LABEL_9;
        }
      }
      else
      {
        long long v14 = 0;
        if (!v7) {
          goto LABEL_9;
        }
      }
      long long v15 = [v14 publicPairingIdentity];
      char v16 = [v15 isEqual:v7];

      if (v16)
      {
        id v17 = 0;
LABEL_10:

        goto LABEL_13;
      }
LABEL_9:
      id v17 = v7;
      goto LABEL_10;
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

- (id)residentCapabilitiesForAccessory:(id)a3 ifDifferentFrom:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource)) != 0)
  {
    id v9 = WeakRetained;
    uint64_t v10 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B308] homeUUID:self->_homeUUID accessoryUUID:v6];
    uint64_t v11 = [v9 eventStoreReadHandle];
    id v12 = [v11 lastEventForTopic:v10];

    if (v12)
    {
      long long v13 = (void *)[objc_alloc(MEMORY[0x263F0E6C0]) initWithProtoData:v7];
      id v14 = objc_alloc(MEMORY[0x263F0E6C0]);
      long long v15 = [v12 encodedData];
      char v16 = (void *)[v14 initWithProtoData:v15];

      if (v16 && ([v16 isEqual:v13] & 1) == 0)
      {
        v22 = [v16 pbCapabilities];
        id v17 = [v22 data];
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = v7;
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = HMFGetLogIdentifier();
      int v24 = 138543362;
      __int16 v25 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot create resident capabilities due to nil datasource", (uint8_t *)&v24, 0xCu);
    }
    id v9 = 0;
    id v17 = 0;
  }

  return v17;
}

- (id)accessoryCapabilitiesForAccessory:(id)a3 ifDifferentFrom:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource)) != 0)
  {
    id v9 = WeakRetained;
    uint64_t v10 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B2D0] homeUUID:self->_homeUUID accessoryUUID:v6];
    uint64_t v11 = [v9 eventStoreReadHandle];
    id v12 = [v11 lastEventForTopic:v10];

    if (v12)
    {
      long long v13 = (void *)[objc_alloc(MEMORY[0x263F0DF30]) initWithProtoData:v7];
      id v14 = objc_alloc(MEMORY[0x263F0DF30]);
      long long v15 = [v12 encodedData];
      char v16 = (void *)[v14 initWithProtoData:v15];

      if (v16 && ([v16 isEqual:v13] & 1) == 0)
      {
        v22 = [v16 pbCapabilities];
        id v17 = [v22 data];
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = v7;
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = HMFGetLogIdentifier();
      int v24 = 138543362;
      __int16 v25 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot create accessory capabilities due to nil datasource", (uint8_t *)&v24, 0xCu);
    }
    id v9 = 0;
    id v17 = 0;
  }

  return v17;
}

- (void)didRemoveAccessory:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMDPrimaryResidentCapabilitiesAggregator_didRemoveAccessory___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__HMDPrimaryResidentCapabilitiesAggregator_didRemoveAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 56);
  }
  else {
    uint64_t v3 = 0;
  }
  if ([v3 containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = v4 ? *(void **)(v4 + 56) : 0;
    [v5 removeObject:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v7 = *(NSObject **)(v6 + 40);
      dispatch_assert_queue_V2(v7);
    }
  }
}

- (void)didAddAccessory:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMDPrimaryResidentCapabilitiesAggregator_didAddAccessory___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__HMDPrimaryResidentCapabilitiesAggregator_didAddAccessory___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 56);
  }
  else {
    uint64_t v3 = 0;
  }
  if (([v3 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v5 = *(void **)(v4 + 56);
    }
    else {
      uint64_t v5 = 0;
    }
    [v5 addObject:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 32);
    v8[0] = *(void *)(a1 + 40);
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    -[HMDPrimaryResidentCapabilitiesAggregator _handleAddedAccessories:](v6, v7);
  }
}

- (void)startIfPrimaryResident
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMDPrimaryResidentCapabilitiesAggregator_startIfPrimaryResident__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __66__HMDPrimaryResidentCapabilitiesAggregator_startIfPrimaryResident__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    if (WeakRetained)
    {
      uint64_t v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = *(id *)(a1 + 32);
      uint64_t v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = HMFGetLogIdentifier();
        int v8 = [WeakRetained isCurrentDevicePrimaryResident];
        id v9 = @"NO";
        if (v8) {
          id v9 = @"YES";
        }
        int v19 = 138543618;
        uint64_t v20 = v7;
        __int16 v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting capabilities aggregator, primary resident: %@", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        uint64_t v11 = *(void **)(v10 + 48);
      }
      else {
        uint64_t v11 = 0;
      }
      objc_msgSend(v11, "removeObserver:");
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        long long v13 = *(void **)(v12 + 48);
      }
      else {
        long long v13 = 0;
      }
      id v14 = v13;
      long long v15 = [WeakRetained primaryResidentChangeMonitor];
      [v14 addObserver:v12 selector:sel_handlePrimaryResidentIsCurrentDeviceChangeNotification_ name:@"HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification" object:v15];

      char v16 = [WeakRetained isCurrentDevicePrimaryResident];
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17)
      {
        *(unsigned char *)(v17 + 8) = v16;
        uint64_t v18 = *(void *)(a1 + 32);
        if (v18)
        {
          if (*(unsigned char *)(v18 + 8)) {
            -[HMDPrimaryResidentCapabilitiesAggregator _handleDidBecomePrimaryResident](v18);
          }
        }
      }
    }
  }
  else
  {
    id WeakRetained = 0;
  }
}

- (HMDPrimaryResidentCapabilitiesAggregator)initWithDataSource:(id)a3 delegate:(id)a4 queue:(id)a5 notificationCenter:(id)a6 homeUUID:(id)a7 accessories:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v24 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMDPrimaryResidentCapabilitiesAggregator;
  int v19 = [(HMDPrimaryResidentCapabilitiesAggregator *)&v25 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_queue, a5);
    objc_storeWeak((id *)&v20->_dataSource, v14);
    objc_storeWeak((id *)&v20->_delegate, v15);
    objc_storeStrong((id *)&v20->_homeUUID, a7);
    objc_storeStrong((id *)&v20->_notificationCenter, a6);
    uint64_t v21 = [MEMORY[0x263EFF9C0] setWithArray:v18];
    accessories = v20->_accessories;
    v20->_accessories = (NSMutableSet *)v21;
  }
  return v20;
}

- (id)logIdentifier
{
  if (self) {
    self = (HMDPrimaryResidentCapabilitiesAggregator *)self->_homeUUID;
  }
  return (id)[(HMDPrimaryResidentCapabilitiesAggregator *)self UUIDString];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_261241 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_261241, &__block_literal_global_261242);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_261243;
  return v2;
}

void __55__HMDPrimaryResidentCapabilitiesAggregator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v1_261243;
  logCategory__hmf_once_v1_261243 = v0;
}

@end