@interface HMDAppleMediaAccessoryInfoSubscriber
+ (id)logCategory;
- (HMDAppleMediaAccessoryInfoSubscriber)initWithQueue:(id)a3 dataSource:(id)a4;
- (HMDAppleMediaAccessoryInfoSubscriberDataSource)dataSource;
- (HMDAppleMediaAccessoryInfoSubscriberDelegate)delegate;
- (HMFWiFiNetworkInfo)receivedWifiInfo;
- (OS_dispatch_queue)workQueue;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setReceivedWifiInfo:(id)a3;
- (void)subscribeToWiFiInfoUpdate;
@end

@implementation HMDAppleMediaAccessoryInfoSubscriber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedWifiInfo, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setReceivedWifiInfo:(id)a3
{
}

- (HMFWiFiNetworkInfo)receivedWifiInfo
{
  return (HMFWiFiNetworkInfo *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAppleMediaAccessoryInfoSubscriberDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAppleMediaAccessoryInfoSubscriberDataSource *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HMDAppleMediaAccessoryInfoSubscriberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAppleMediaAccessoryInfoSubscriberDelegate *)WeakRetained;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F2E7A0] decodeTopic:v7];
  v9 = [v8 asAccessoryTopic];

  if (v9 && (uint64_t v10 = [v9 accessoryEventTopicSuffixID], v10 == *MEMORY[0x1E4F2C3B8]))
  {
    id v11 = v6;
    if (self)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F2E5C8]);
      v13 = [v11 encodedData];
      v14 = (void *)[v12 initWithProtoData:v13];

      if (v14)
      {
        v15 = [v14 hmfWifiNetworkInfo];
        if (v15
          && ([(HMDAppleMediaAccessoryInfoSubscriber *)self receivedWifiInfo],
              v16 = objc_claimAutoreleasedReturnValue(),
              char v17 = [v15 isEqualToNetworkInfo:v16],
              v16,
              (v17 & 1) == 0))
        {
          v31 = (void *)MEMORY[0x1D9452090]();
          v32 = self;
          v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = HMFGetLogIdentifier();
            [(HMDAppleMediaAccessoryInfoSubscriber *)v32 receivedWifiInfo];
            v35 = v39 = v31;
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v35;
            *(_WORD *)&buf[22] = 2112;
            v41 = v15;
            _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating received wifi info from: %@ to: %@", buf, 0x20u);

            v31 = v39;
          }

          [(HMDAppleMediaAccessoryInfoSubscriber *)v32 setReceivedWifiInfo:v15];
          v36 = [(HMDAppleMediaAccessoryInfoSubscriber *)v32 delegate];
          if (objc_opt_respondsToSelector())
          {
            v37 = [(HMDAppleMediaAccessoryInfoSubscriber *)v32 workQueue];
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __60__HMDAppleMediaAccessoryInfoSubscriber_handleWifiInfoEvent___block_invoke;
            v41 = &unk_1E6A19668;
            id v42 = v36;
            v43 = v32;
            id v44 = v15;
            dispatch_async(v37, buf);
          }
        }
        else
        {
          v18 = (void *)MEMORY[0x1D9452090]();
          v19 = self;
          v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = HMFGetLogIdentifier();
            [(HMDAppleMediaAccessoryInfoSubscriber *)v19 receivedWifiInfo];
            v22 = id v38 = v11;
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2112;
            v41 = v22;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Received wifi info: %@ saved wifi info: %@", buf, 0x20u);

            id v11 = v38;
          }
        }
      }
      else
      {
        v27 = (void *)MEMORY[0x1D9452090]();
        v28 = self;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v30;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error decoding the event to wifi info object", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Do not handle topic: %@", buf, 0x16u);
    }
  }
}

uint64_t __60__HMDAppleMediaAccessoryInfoSubscriber_handleWifiInfoEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) infoSubscriber:*(void *)(a1 + 40) didReceiveWiFiInfoUpdate:*(void *)(a1 + 48)];
}

- (void)subscribeToWiFiInfoUpdate
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAppleMediaAccessoryInfoSubscriber *)self dataSource];
  v4 = [v3 accessoryInfoControllerTopicForWifiInfo];
  if (v4)
  {
    v5 = [v3 subscriptionProvider];
    v15[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__HMDAppleMediaAccessoryInfoSubscriber_subscribeToWiFiInfoUpdate__block_invoke;
    v11[3] = &unk_1E6A192B8;
    v11[4] = self;
    id v12 = v4;
    [v5 changeRegistrationsForConsumer:self topicFilterAdditions:v6 topicFilterRemovals:MEMORY[0x1E4F1CBF0] completion:v11];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@wifi info topic is nil", buf, 0xCu);
    }
  }
}

void __65__HMDAppleMediaAccessoryInfoSubscriber_subscribeToWiFiInfoUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v31 = a1;
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    id v12 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v38 = v11;
    __int16 v39 = 2112;
    v40 = v12;
    __int16 v41 = 2112;
    id v42 = v6;
    v13 = "%{public}@Subscription to topic: %@ results in error: %@";
    v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    char v17 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v38 = v11;
    __int16 v39 = 2112;
    v40 = v17;
    v13 = "%{public}@Subscription to topic: %@ successful";
    v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 22;
  }
  _os_log_impl(&dword_1D49D5000, v14, v15, v13, buf, v16);

LABEL_7:
  v30 = v6;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  uint64_t v20 = a1;
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v25 = [v18 objectForKeyedSubscript:v24];
        v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = *(id *)(v20 + 32);
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v38 = v29;
          __int16 v39 = 2112;
          v40 = v25;
          __int16 v41 = 2112;
          id v42 = v24;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Received cached event: %@ topic: %@ during subscription", buf, 0x20u);

          uint64_t v20 = v31;
        }

        [*(id *)(v20 + 32) didReceiveEvent:v25 topic:v24];
      }
      uint64_t v21 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }
}

- (HMDAppleMediaAccessoryInfoSubscriber)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessoryInfoSubscriber;
  v9 = [(HMDAppleMediaAccessoryInfoSubscriber *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_185370 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_185370, &__block_literal_global_185371);
  }
  v2 = (void *)logCategory__hmf_once_v9_185372;
  return v2;
}

uint64_t __51__HMDAppleMediaAccessoryInfoSubscriber_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9_185372;
  logCategory__hmf_once_v9_185372 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end