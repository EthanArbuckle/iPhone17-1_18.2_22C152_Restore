@interface HMDFetchedAccessorySettingsSubscriber
+ (id)logCategory;
- (HMDFetchedAccessorySettingsSubscriber)initWithWorkQueue:(id)a3 subscriptionProvider:(id)a4 keyPaths:(id)a5 homeUUID:(id)a6;
- (HMDFetchedAccessorySettingsSubscriberDelegate)delegate;
- (id)cachedSettingForAccessory:(id)a3 keyPath:(id)a4;
- (id)logIdentifier;
- (id)topicsForKeyPaths:(void *)a3 accessoryUUID:(void *)a4 homeUUID:;
- (void)_didReceiveEvent:(void *)a3 topic:;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)setDelegate:(id)a3;
- (void)subscribeToSettingsForAccessoryUUIDs:(id)a3;
- (void)unsubscribeForAccessory:(id)a3;
- (void)unsubscribeToAllAccessories;
@end

@implementation HMDFetchedAccessorySettingsSubscriber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_destroyWeak((id *)&self->_subscriptionProvider);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedSettings, 0);
}

- (id)logIdentifier
{
  v2 = NSString;
  if (self) {
    self = (HMDFetchedAccessorySettingsSubscriber *)objc_getProperty(self, a2, 56, 1);
  }
  return (id)[v2 stringWithFormat:@"%@", self];
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v9 = a4;
  if (self) {
    Property = objc_getProperty(self, v8, 32, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HMDFetchedAccessorySettingsSubscriber_didReceiveCachedEvent_topic_source___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v14 = v7;
  id v15 = v9;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(Property, block);
}

void __76__HMDFetchedAccessorySettingsSubscriber_didReceiveCachedEvent_topic_source___block_invoke(void **a1)
{
}

- (void)_didReceiveEvent:(void *)a3 topic:
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 32, 1);
    dispatch_assert_queue_V2(Property);
    id v9 = (void *)MEMORY[0x230FBD990]();
    v10 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v42 = v12;
      __int16 v43 = 2112;
      id v44 = v5;
      __int16 v45 = 2112;
      id v46 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received event:%@ for topic:%@", buf, 0x20u);
    }
    int v13 = HMImmutableSettingChangeEventComponentsFromTopic();
    id v14 = 0;
    id v15 = 0;
    id v39 = 0;
    if (!v13)
    {
      v24 = (void *)MEMORY[0x230FBD990]();
      v25 = v10;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v42 = v27;
        __int16 v43 = 2112;
        id v44 = v5;
        __int16 v45 = 2112;
        id v46 = v14;
        __int16 v47 = 2112;
        id v48 = v15;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Received unknown event: %@ home: %@ target: %@", buf, 0x2Au);
      }
      goto LABEL_18;
    }
    id v16 = v5;
    id v36 = v14;
    v37 = v16;
    id v38 = v15;
    id v40 = 0;
    v17 = [MEMORY[0x263F0E3F8] decodeSettingFromEvent:v16 error:&v40];
    id v19 = v40;
    if (v19)
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = v10;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v42 = v23;
        __int16 v43 = 2112;
        id v44 = v37;
        __int16 v45 = 2112;
        id v46 = v19;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Decode setting failed. event:%@ error:%@", buf, 0x20u);
      }
    }
    else
    {
      id v28 = objc_getProperty(v10, v18, 48, 1);
      v29 = [v17 keyPath];
      char v30 = [v28 containsObject:v29];

      if (v30)
      {
        os_unfair_lock_lock_with_options();
        v31 = *(void **)&v10[4]._os_unfair_lock_opaque;
        v32 = [v17 keyPath];
        v33 = [NSString stringWithFormat:@"%@.%@", v38, v32];
        [v31 setObject:v17 forKeyedSubscript:v33];

        os_unfair_lock_unlock(v10 + 2);
        v34 = [(os_unfair_lock_s *)v10 delegate];
        [v34 didReceiveAccessorySetting:v17 accessoryUUID:v38];

LABEL_17:
LABEL_18:

        goto LABEL_19;
      }
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = v10;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v42 = v35;
        __int16 v43 = 2112;
        id v44 = v17;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unknown keyPath for setting:%@", buf, 0x16u);
      }
    }

    goto LABEL_17;
  }
LABEL_19:
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    Property = objc_getProperty(self, v7, 32, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDFetchedAccessorySettingsSubscriber_didReceiveEvent_topic___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(Property, block);
}

void __63__HMDFetchedAccessorySettingsSubscriber_didReceiveEvent_topic___block_invoke(void **a1)
{
}

- (id)cachedSettingForAccessory:(id)a3 keyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  cachedSettings = self->_cachedSettings;
  id v10 = [NSString stringWithFormat:@"%@.%@", v6, v7];
  id v11 = [(NSMutableDictionary *)cachedSettings objectForKeyedSubscript:v10];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)unsubscribeToAllAccessories
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionProvider);
  }
  else {
    id WeakRetained = 0;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__HMDFetchedAccessorySettingsSubscriber_unsubscribeToAllAccessories__block_invoke;
  v4[3] = &unk_264A2F3E8;
  v4[4] = self;
  [WeakRetained unregisterConsumer:self completion:v4];
}

void __68__HMDFetchedAccessorySettingsSubscriber_unsubscribeToAllAccessories__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = *(id *)(a1 + 32);
      if (v10)
      {
        id Property = objc_getProperty(v10, v8, 48, 1);
        id v10 = *(id *)(a1 + 32);
        if (v10) {
          id v10 = objc_getProperty(v10, v11, 56, 1);
        }
      }
      else
      {
        id Property = 0;
      }
      int v21 = 138544130;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = Property;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v3;
      id v13 = "%{public}@Failed to unsubscribe to keyPaths:%@ homeUUID:%@ for all accessories with error:%@";
      id v14 = v7;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 42;
LABEL_12:
      _os_log_impl(&dword_22F52A000, v14, v15, v13, (uint8_t *)&v21, v16);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = *(id *)(a1 + 32);
    if (v18)
    {
      id v20 = objc_getProperty(v18, v17, 48, 1);
      id v18 = *(id *)(a1 + 32);
      if (v18) {
        id v18 = objc_getProperty(v18, v19, 56, 1);
      }
    }
    else
    {
      id v20 = 0;
    }
    int v21 = 138543874;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v20;
    __int16 v25 = 2112;
    id v26 = v18;
    id v13 = "%{public}@Unsubscribed to keyPaths:%@ homeUUID:%@ for all accessories";
    id v14 = v7;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 32;
    goto LABEL_12;
  }
}

- (void)unsubscribeForAccessory:(id)a3
{
  id v5 = a3;
  if (self)
  {
    id v6 = objc_getProperty(self, v4, 48, 1);
    id Property = objc_getProperty(self, v7, 56, 1);
    id v9 = -[HMDFetchedAccessorySettingsSubscriber topicsForKeyPaths:accessoryUUID:homeUUID:]((uint64_t)self, v6, v5, Property);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionProvider);
  }
  else
  {
    id v9 = -[HMDFetchedAccessorySettingsSubscriber topicsForKeyPaths:accessoryUUID:homeUUID:](0, 0, v5, 0);
    id WeakRetained = 0;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__HMDFetchedAccessorySettingsSubscriber_unsubscribeForAccessory___block_invoke;
  v12[3] = &unk_264A2F370;
  v12[4] = self;
  id v13 = v5;
  id v11 = v5;
  [WeakRetained unregisterConsumer:self topicFilters:v9 completion:v12];
}

- (id)topicsForKeyPaths:(void *)a3 accessoryUUID:(void *)a4 homeUUID:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a1)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __82__HMDFetchedAccessorySettingsSubscriber_topicsForKeyPaths_accessoryUUID_homeUUID___block_invoke;
    v12[3] = &unk_264A2E5E8;
    id v13 = v8;
    id v14 = v7;
    id v10 = objc_msgSend(a2, "na_map:", v12);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __65__HMDFetchedAccessorySettingsSubscriber_unsubscribeForAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = *(id *)(a1 + 32);
      if (v10)
      {
        id Property = objc_getProperty(v10, v8, 48, 1);
        id v10 = *(id *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        if (v10) {
          id v10 = objc_getProperty(v10, v11, 56, 1);
        }
      }
      else
      {
        id Property = 0;
        uint64_t v13 = *(void *)(a1 + 40);
      }
      int v23 = 138544386;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = Property;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v3;
      id v14 = "%{public}@Failed to unsubscribe to keyPaths:%@ accessories:%@ homeUUID:%@ with error:%@";
      os_log_type_t v15 = v7;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 52;
LABEL_12:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, (uint8_t *)&v23, v17);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = *(id *)(a1 + 32);
    if (v19)
    {
      id v21 = objc_getProperty(v19, v18, 48, 1);
      id v19 = *(id *)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 40);
      if (v19) {
        id v19 = objc_getProperty(v19, v20, 56, 1);
      }
    }
    else
    {
      id v21 = 0;
      uint64_t v22 = *(void *)(a1 + 40);
    }
    int v23 = 138544130;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v21;
    __int16 v27 = 2112;
    uint64_t v28 = v22;
    __int16 v29 = 2112;
    id v30 = v19;
    id v14 = "%{public}@Unsubscribed to keyPaths:%@ accessories:%@ homeUUID:%@";
    os_log_type_t v15 = v7;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 42;
    goto LABEL_12;
  }
}

void __82__HMDFetchedAccessorySettingsSubscriber_topicsForKeyPaths_accessoryUUID_homeUUID___block_invoke()
{
}

- (void)subscribeToSettingsForAccessoryUUIDs:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke;
  v10[3] = &unk_264A23A28;
  v10[4] = self;
  id v5 = objc_msgSend(v4, "na_flatMap:", v10);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionProvider);
  }
  else {
    id WeakRetained = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke_2;
  v8[3] = &unk_264A23A78;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [WeakRetained registerConsumer:self topicFilters:v5 completion:v8];
}

id __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    id Property = objc_getProperty(*(id *)(a1 + 32), v3, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = Property;
  id v9 = *(void **)(a1 + 32);
  if (v9) {
    id v10 = objc_getProperty(v9, v7, 56, 1);
  }
  else {
    id v10 = 0;
  }
  id v11 = -[HMDFetchedAccessorySettingsSubscriber topicsForKeyPaths:accessoryUUID:homeUUID:](v5, v8, v4, v10);

  return v11;
}

void __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = *(id *)(a1 + 32);
      if (v13)
      {
        id Property = objc_getProperty(v13, v11, 48, 1);
        id v13 = *(id *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        if (v13) {
          id v13 = objc_getProperty(v13, v14, 56, 1);
        }
      }
      else
      {
        id Property = 0;
        uint64_t v16 = *(void *)(a1 + 40);
      }
      *(_DWORD *)buf = 138544386;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = Property;
      __int16 v31 = 2112;
      uint64_t v32 = v16;
      __int16 v33 = 2112;
      id v34 = v13;
      __int16 v35 = 2112;
      id v36 = v6;
      uint32_t v17 = "%{public}@Failed to subscribe to keyPaths:%@ accessories:%@ homeUUID:%@ with error:%@";
      id v18 = v10;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 52;
LABEL_12:
      _os_log_impl(&dword_22F52A000, v18, v19, v17, buf, v20);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = *(id *)(a1 + 32);
    if (v22)
    {
      id v24 = objc_getProperty(v22, v21, 48, 1);
      id v22 = *(id *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      if (v22) {
        id v22 = objc_getProperty(v22, v23, 56, 1);
      }
    }
    else
    {
      id v24 = 0;
      uint64_t v25 = *(void *)(a1 + 40);
    }
    *(_DWORD *)buf = 138544130;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v24;
    __int16 v31 = 2112;
    uint64_t v32 = v25;
    __int16 v33 = 2112;
    id v34 = v22;
    uint32_t v17 = "%{public}@Subscribed to keyPaths:%@ accessories:%@ homeUUID:%@";
    id v18 = v10;
    os_log_type_t v19 = OS_LOG_TYPE_INFO;
    uint32_t v20 = 42;
    goto LABEL_12;
  }

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke_1;
  v26[3] = &unk_264A23A50;
  v26[4] = *(void *)(a1 + 32);
  objc_msgSend(v5, "na_each:", v26);
}

uint64_t __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) didReceiveEvent:a3 topic:a2];
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMDFetchedAccessorySettingsSubscriberDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMDFetchedAccessorySettingsSubscriberDelegate *)WeakRetained;
}

- (HMDFetchedAccessorySettingsSubscriber)initWithWorkQueue:(id)a3 subscriptionProvider:(id)a4 keyPaths:(id)a5 homeUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDFetchedAccessorySettingsSubscriber;
  os_log_type_t v15 = [(HMDFetchedAccessorySettingsSubscriber *)&v24 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_subscriptionProvider, v12);
    objc_storeStrong((id *)&v16->_workQueue, a3);
    v16->_lock._os_unfair_lock_opaque = 0;
    uint64_t v17 = objc_opt_new();
    cachedSettings = v16->_cachedSettings;
    v16->_cachedSettings = (NSMutableDictionary *)v17;

    uint64_t v19 = [v13 copy];
    keyPaths = v16->_keyPaths;
    v16->_keyPaths = (NSArray *)v19;

    uint64_t v21 = [v14 copy];
    homeUUID = v16->_homeUUID;
    v16->_homeUUID = (NSUUID *)v21;
  }
  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_177501 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_177501, &__block_literal_global_177502);
  }
  v2 = (void *)logCategory__hmf_once_v15_177503;
  return v2;
}

void __52__HMDFetchedAccessorySettingsSubscriber_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v15_177503;
  logCategory__hmf_once_v15_177503 = v0;
}

@end