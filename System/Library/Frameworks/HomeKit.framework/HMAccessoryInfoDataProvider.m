@interface HMAccessoryInfoDataProvider
+ (id)logCategory;
- (HMAccessoryInfoDataProvider)initWithEventStoreReadHandle:(id)a3 subscriptionProvider:(id)a4;
- (HMAccessoryInfoDataProviderDataSource)dataSource;
- (HMAccessoryInfoDataProviderDelegate)delegate;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMESubscriptionProviding)eventSubscriptionProvider;
- (id)accessoryUUIDForIdentifier:(id)a3 homeIdentifier:(id)a4;
- (id)dataSourceHomeWithHomeIdentifier:(id)a3;
- (id)homeUUIDForIdentifier:(id)a3;
- (void)configureWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 dataProviderDelegate:(id)a6 completionHandler:(id)a7;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)didReceiveEvent:(id)a3 topic:(id)a4 logMessage:(id)a5;
- (void)notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:(id)a3 accountInfo:(id)a4;
- (void)notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:(id)a3 primaryUserInfo:(id)a4;
- (void)notifyDelegateDidReceiveWifiNetworkInfoUpdatesForAccessoryWithIdentifier:(id)a3 wifiNetworkInfo:(id)a4;
- (void)notifyOfCachedEvents:(id)a3;
- (void)notifyOfEventStoreLastEventForTopic:(id)a3;
- (void)notifyOfEventStoreLastEventsForTopics:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)subscribeToAccessoryInfoWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 completionHandler:(id)a6;
- (void)unsubscribeToAccessoryInfoWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation HMAccessoryInfoDataProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMESubscriptionProviding)eventSubscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 32, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMAccessoryInfoDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMAccessoryInfoDataProviderDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMAccessoryInfoDataProviderDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HMAccessoryInfoDataProviderDataSource *)WeakRetained;
}

- (id)dataSourceHomeWithHomeIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMAccessoryInfoDataProvider *)self dataSource];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 accessoryInfoDataProvider:self homeWithHomeIdentifier:v4];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source home UUID due to no data source", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (void)notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:(id)a3 primaryUserInfo:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMAccessoryInfoDataProvider *)self delegate];
  v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138544130;
    v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did receive primaryUserInfo updates for accessory with identifier: %@ primaryUser: %@ delegate: %@", (uint8_t *)&v13, 0x2Au);
  }
  if (objc_opt_respondsToSelector()) {
    [v8 accessoryInfoDataProvider:v10 didReceiveUpdatesForAccessoryWithIdentifier:v6 primaryUserInfo:v7];
  }
}

- (void)notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:(id)a3 accountInfo:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMAccessoryInfoDataProvider *)self delegate];
  v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138544130;
    v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did receive account info updates for accessory with identifier: %@ accountInfo: %@ delegate: %@", (uint8_t *)&v13, 0x2Au);
  }
  if (objc_opt_respondsToSelector()) {
    [v8 accessoryInfoDataProvider:v10 didReceiveUpdatesForAccessoryWithIdentifier:v6 accountInfo:v7];
  }
}

- (void)notifyDelegateDidReceiveWifiNetworkInfoUpdatesForAccessoryWithIdentifier:(id)a3 wifiNetworkInfo:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMAccessoryInfoDataProvider *)self delegate];
  v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = [v7 SSID];
    int v14 = 138544386;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying client of did receive wifi network info updates for accessory with identifier: %@ wifi: %@ WiFi SSID: %@ delegate: %@", (uint8_t *)&v14, 0x34u);
  }
  if (objc_opt_respondsToSelector()) {
    [v8 accessoryInfoDataProvider:v10 didReceiveUpdatesForAccessoryWithIdentifier:v6 wifiNetworkInfo:v7];
  }
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4 logMessage:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  v8 = (HMAccessoryInfoAccount *)a3;
  v9 = (HMAccessoryInfoAccount *)a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v80 = v14;
    __int16 v81 = 2112;
    v82 = v8;
    __int16 v83 = 2112;
    v84 = v9;
    __int16 v85 = 2112;
    id v86 = v10;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Received event: %@, topic: %@ %@", buf, 0x2Au);
  }
  __int16 v15 = +[HMEventTopicHelper decodeTopic:v9];
  __int16 v16 = [v15 asAccessoryTopic];

  if (v16)
  {
    id v17 = [(HMAccessoryInfoDataProvider *)v12 dataSource];
    if ([v16 accessoryEventTopicSuffixID] == 504)
    {
      __int16 v18 = [HMAccessoryInfoWifiInfo alloc];
      id v19 = [(HMAccessoryInfoAccount *)v8 encodedData];
      __int16 v20 = [(HMAccessoryInfoWifiInfo *)v18 initWithProtoData:v19];

      if (v20)
      {
        v71 = v8;
        uint64_t v21 = [(HMAccessoryInfoWifiInfo *)v20 hmfWifiNetworkInfo];
        __int16 v22 = (void *)MEMORY[0x19F3A64A0]();
        v23 = v12;
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v25 = v68 = v17;
          [(HMAccessoryInfoDataProvider *)v23 delegate];
          v27 = id v26 = v10;
          *(_DWORD *)buf = 138544130;
          v80 = v25;
          __int16 v81 = 2112;
          v82 = v21;
          __int16 v83 = 2112;
          v84 = 0;
          __int16 v85 = 2112;
          id v86 = v27;
          _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Modified setting:%@, error:%@, delegate:%@", buf, 0x2Au);

          id v10 = v26;
          id v17 = v68;
        }

        if (v21)
        {
          v67 = v9;
          id v69 = v10;
          v28 = [v16 homeUUID];
          uint64_t v29 = [v16 accessoryUUID];
          v30 = v17;
          v31 = (void *)v29;
          id v77 = 0;
          id v78 = 0;
          v32 = v30;
          int v33 = [v30 accessoryInfoDataProvider:v23 transformHomeUUID:v28 accessoryUUID:v29 toClientHomeIdentifier:&v78 clientAccessoryIdentifier:&v77];
          id v34 = v78;
          id v35 = v77;

          if (v33) {
            [(HMAccessoryInfoDataProvider *)v23 notifyDelegateDidReceiveWifiNetworkInfoUpdatesForAccessoryWithIdentifier:v35 wifiNetworkInfo:v21];
          }
          id v17 = v32;
          v9 = v67;
          id v10 = v69;
        }
        else
        {
          id v34 = 0;
          id v35 = 0;
        }

        v8 = v71;
        goto LABEL_41;
      }
      v43 = (void *)MEMORY[0x19F3A64A0]();
      v62 = v12;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v63 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v80 = v63;
        _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, "%{public}@Received event cannot be decoded to wifi network info object", buf, 0xCu);
      }
      goto LABEL_40;
    }
    if ([v16 accessoryEventTopicSuffixID] == 510)
    {
      id v70 = v10;
      v40 = [HMAccessoryInfoAccount alloc];
      v72 = v8;
      v41 = [(HMAccessoryInfoAccount *)v8 encodedData];
      v42 = [(HMAccessoryInfoAccount *)v40 initWithProtoData:v41];

      v43 = (void *)MEMORY[0x19F3A64A0]();
      v44 = v12;
      v45 = HMFGetOSLogHandle();
      v46 = v45;
      if (v42)
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v47 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v80 = v47;
          __int16 v81 = 2112;
          v82 = v42;
          _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_INFO, "%{public}@Received event for account info: %@", buf, 0x16u);
        }
        v48 = [v16 homeUUID];
        v49 = [v16 accessoryUUID];
        id v75 = 0;
        id v76 = 0;
        v50 = v17;
        int v51 = [v17 accessoryInfoDataProvider:v44 transformHomeUUID:v48 accessoryUUID:v49 toClientHomeIdentifier:&v76 clientAccessoryIdentifier:&v75];
        id v52 = v76;
        id v53 = v75;

        if (v51) {
          [(HMAccessoryInfoDataProvider *)v44 notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:v53 accountInfo:v42];
        }
LABEL_27:

        id v10 = v70;
        v8 = v72;
        id v17 = v50;
LABEL_41:

        goto LABEL_42;
      }
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      v65 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v80 = v65;
      v66 = "%{public}@Received event cannot be decoded to accountInfo object";
    }
    else
    {
      if ([v16 accessoryEventTopicSuffixID] != 503)
      {
        v43 = (void *)MEMORY[0x19F3A64A0]();
        v12 = v12;
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v64 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v80 = v64;
          __int16 v81 = 2112;
          v82 = v9;
          _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, "%{public}@Received event with unknown topic: %@", buf, 0x16u);
        }
        goto LABEL_40;
      }
      id v70 = v10;
      v54 = [HMAccessoryInfoPrimaryUser alloc];
      v72 = v8;
      v55 = [(HMAccessoryInfoAccount *)v8 encodedData];
      v42 = [(HMAccessoryInfoPrimaryUser *)v54 initWithProtoData:v55];

      v43 = (void *)MEMORY[0x19F3A64A0]();
      v56 = v12;
      v57 = HMFGetOSLogHandle();
      v46 = v57;
      if (v42)
      {
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v58 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v80 = v58;
          __int16 v81 = 2112;
          v82 = v42;
          _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_INFO, "%{public}@Received event for primaryUserInfo: %@", buf, 0x16u);
        }
        v59 = [v16 homeUUID];
        v60 = [v16 accessoryUUID];
        id v73 = 0;
        id v74 = 0;
        v50 = v17;
        int v61 = [v17 accessoryInfoDataProvider:v56 transformHomeUUID:v59 accessoryUUID:v60 toClientHomeIdentifier:&v74 clientAccessoryIdentifier:&v73];
        id v52 = v74;
        id v53 = v73;

        if (v61) {
          [(HMAccessoryInfoDataProvider *)v56 notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:v53 primaryUserInfo:v42];
        }
        goto LABEL_27;
      }
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
LABEL_39:
        id v10 = v70;
        v8 = v72;
LABEL_40:

        goto LABEL_41;
      }
      v65 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v80 = v65;
      v66 = "%{public}@Received event cannot be decoded to primaryUserInfo object";
    }
    _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);

    goto LABEL_39;
  }
  v36 = (void *)MEMORY[0x19F3A64A0]();
  v37 = v12;
  v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v80 = v39;
    __int16 v81 = 2112;
    v82 = v9;
    _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse topic: %@", buf, 0x16u);
  }
LABEL_42:
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
}

- (void)configureWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 dataProviderDelegate:(id)a6 completionHandler:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  __int16 v16 = (void *)MEMORY[0x19F3A64A0]();
  id v17 = self;
  __int16 v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    __int16 v20 = HMAccessoryInfoOptionAsString(a5);
    int v21 = 138544130;
    __int16 v22 = v19;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    v28 = v20;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Configuring accessoryInfoDataProvider with home identifier: %@ accessory identifier: %@ options: %@", (uint8_t *)&v21, 0x2Au);
  }
  [(HMAccessoryInfoDataProvider *)v17 setDelegate:v14];
  [(HMAccessoryInfoDataProvider *)v17 subscribeToAccessoryInfoWithHomeIdentifier:v12 accessoryIdentifier:v13 accessoryInfoTypes:a5 completionHandler:v15];
}

- (void)unsubscribeToAccessoryInfoWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  id v13 = [(HMAccessoryInfoDataProvider *)self homeUUIDForIdentifier:v10];
  if (v13)
  {
    id v14 = [(HMAccessoryInfoDataProvider *)self accessoryUUIDForIdentifier:v11 homeIdentifier:v10];
    id v15 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v16 = self;
    id v17 = HMFGetOSLogHandle();
    __int16 v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v19 = v33 = v11;
        __int16 v20 = HMAccessoryInfoOptionAsString(a5);
        *(_DWORD *)buf = 138544130;
        v37 = v19;
        __int16 v38 = 2112;
        id v39 = v13;
        __int16 v40 = 2112;
        v41 = v14;
        __int16 v42 = 2112;
        v43 = v20;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to accessory info with home uuid: %@ accessory uuid: %@ options: %@", buf, 0x2Au);

        id v11 = v33;
      }

      int v21 = HMAccessoryInfoEventTopicsFromOption(a5, v13, v14);
      if (objc_msgSend(v21, "hmf_isEmpty"))
      {
        __int16 v22 = (void *)MEMORY[0x19F3A64A0]();
        __int16 v23 = v16;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          __int16 v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v37 = v25;
          _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Topics array is empty", buf, 0xCu);
        }
        id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        v12[2](v12, v26);
      }
      else
      {
        v32 = [(HMAccessoryInfoDataProvider *)v16 eventSubscriptionProvider];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __133__HMAccessoryInfoDataProvider_unsubscribeToAccessoryInfoWithHomeIdentifier_accessoryIdentifier_accessoryInfoTypes_completionHandler___block_invoke;
        v34[3] = &unk_1E59449C8;
        v34[4] = v16;
        id v35 = v12;
        [v32 unregisterConsumer:v16 topicFilters:v21 completion:v34];
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v31;
        __int16 v38 = 2112;
        id v39 = v11;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Failed to unsubscribe to accessory info due to unknown accessory identifier: %@", buf, 0x16u);
      }
      int v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v12[2](v12, v21);
    }
  }
  else
  {
    __int16 v27 = (void *)MEMORY[0x19F3A64A0]();
    v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v37 = v30;
      __int16 v38 = 2112;
      id v39 = v10;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Failed to unsubscribe to accessory info due to unknown home identifier: %@", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v12[2](v12, v14);
  }
}

void __133__HMAccessoryInfoDataProvider_unsubscribeToAccessoryInfoWithHomeIdentifier_accessoryIdentifier_accessoryInfoTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribe topics with result: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)notifyOfEventStoreLastEventForTopic:(id)a3
{
  id v6 = a3;
  id v4 = [(HMAccessoryInfoDataProvider *)self eventStoreReadHandle];
  id v5 = [v4 lastEventForTopic:v6];

  if (v5) {
    [(HMAccessoryInfoDataProvider *)self didReceiveEvent:v5 topic:v6 logMessage:@"last event store"];
  }
}

- (void)notifyOfEventStoreLastEventsForTopics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMAccessoryInfoDataProvider *)self eventStoreReadHandle];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 count];

    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __69__HMAccessoryInfoDataProvider_notifyOfEventStoreLastEventsForTopics___block_invoke;
      v8[3] = &unk_1E59408F0;
      v8[4] = self;
      objc_msgSend(v4, "na_each:", v8);
    }
  }
}

uint64_t __69__HMAccessoryInfoDataProvider_notifyOfEventStoreLastEventsForTopics___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyOfEventStoreLastEventForTopic:a2];
}

- (void)notifyOfCachedEvents:(id)a3
{
  if (a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __52__HMAccessoryInfoDataProvider_notifyOfCachedEvents___block_invoke;
    v3[3] = &unk_1E5941A98;
    v3[4] = self;
    objc_msgSend(a3, "na_each:", v3);
  }
}

uint64_t __52__HMAccessoryInfoDataProvider_notifyOfCachedEvents___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) didReceiveEvent:a3 topic:a2 logMessage:@"completion cache"];
}

- (void)subscribeToAccessoryInfoWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a6;
  id v13 = (void *)MEMORY[0x19F3A64A0]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    id v17 = HMAccessoryInfoOptionAsString(a5);
    *(_DWORD *)buf = 138544130;
    v43 = v16;
    __int16 v44 = 2112;
    id v45 = v10;
    __int16 v46 = 2112;
    id v47 = v11;
    __int16 v48 = 2112;
    v49 = v17;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory info with home identifier: %@ accessory identifier: %@ options: %@", buf, 0x2Au);
  }
  __int16 v18 = [(HMAccessoryInfoDataProvider *)v14 homeUUIDForIdentifier:v10];
  if (v18)
  {
    id v19 = [(HMAccessoryInfoDataProvider *)v14 accessoryUUIDForIdentifier:v11 homeIdentifier:v10];
    __int16 v20 = (void *)MEMORY[0x19F3A64A0]();
    int v21 = v14;
    __int16 v22 = HMFGetOSLogHandle();
    __int16 v23 = v22;
    if (v19)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v24 = v38 = v11;
        __int16 v25 = HMAccessoryInfoOptionAsString(a5);
        *(_DWORD *)buf = 138544130;
        v43 = v24;
        __int16 v44 = 2112;
        id v45 = v18;
        __int16 v46 = 2112;
        id v47 = v19;
        __int16 v48 = 2112;
        v49 = v25;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory info with home uuid: %@ accessory uuid: %@ options: %@", buf, 0x2Au);

        id v11 = v38;
      }

      HMAccessoryInfoEventTopicsFromOption(a5, v18, v19);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "hmf_isEmpty"))
      {
        __int16 v27 = (void *)MEMORY[0x19F3A64A0]();
        v28 = v21;
        uint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v43 = v30;
          _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Topics array is empty", buf, 0xCu);
        }
        v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        v12[2](v12, v31);
      }
      else
      {
        [(HMAccessoryInfoDataProvider *)v21 notifyOfEventStoreLastEventsForTopics:v26];
        v37 = [(HMAccessoryInfoDataProvider *)v21 eventSubscriptionProvider];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __131__HMAccessoryInfoDataProvider_subscribeToAccessoryInfoWithHomeIdentifier_accessoryIdentifier_accessoryInfoTypes_completionHandler___block_invoke;
        v39[3] = &unk_1E59408C8;
        v39[4] = v21;
        id v26 = v26;
        id v40 = v26;
        v41 = v12;
        [v37 registerConsumer:v21 topicFilters:v26 completion:v39];
      }
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        __int16 v44 = 2112;
        id v45 = v11;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to accessory info due to unknown accessory identifier: %@", buf, 0x16u);
      }
      id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v12[2](v12, v26);
    }
  }
  else
  {
    v32 = (void *)MEMORY[0x19F3A64A0]();
    id v33 = v14;
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v35;
      __int16 v44 = 2112;
      id v45 = v10;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to accessory info due to unknown home identifier: %@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v12[2](v12, v19);
  }
}

void __131__HMAccessoryInfoDataProvider_subscribeToAccessoryInfoWithHomeIdentifier_accessoryIdentifier_accessoryInfoTypes_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v20 = 138543874;
      int v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      id v25 = v6;
      id v13 = "%{public}@Error subscribing topics %@ with error: %@";
      id v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v14, v15, v13, (uint8_t *)&v20, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    int v20 = 138543618;
    int v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    id v13 = "%{public}@Successfully subscribed to topics: %@";
    id v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 22;
    goto LABEL_6;
  }

  [*(id *)(a1 + 32) notifyOfCachedEvents:v5];
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6, v18, v19);
}

- (id)accessoryUUIDForIdentifier:(id)a3 homeIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMAccessoryInfoDataProvider *)self dataSourceHomeWithHomeIdentifier:a4];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 accessoryWithUniqueIdentifier:v6];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 uuid];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)homeUUIDForIdentifier:(id)a3
{
  id v3 = [(HMAccessoryInfoDataProvider *)self dataSourceHomeWithHomeIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 uuid];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (HMAccessoryInfoDataProvider)initWithEventStoreReadHandle:(id)a3 subscriptionProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryInfoDataProvider;
  v9 = [(HMAccessoryInfoDataProvider *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStoreReadHandle, a3);
    objc_storeStrong((id *)&v10->_eventSubscriptionProvider, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26 != -1) {
    dispatch_once(&logCategory__hmf_once_t26, &__block_literal_global_24841);
  }
  v2 = (void *)logCategory__hmf_once_v27;

  return v2;
}

uint64_t __42__HMAccessoryInfoDataProvider_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v27;
  logCategory__hmf_once___int16 v27 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end