@interface HMDMediaGroupsAggregateConsumer
+ (id)logCategory;
- (BOOL)isAggregateTopic:(id)a3;
- (HMDMediaGroupSetupMetricDispatcher)homeTheaterSetupMetricDispatcher;
- (HMDMediaGroupSetupMetricDispatcher)mediaSystemSetupMetricDispatcher;
- (HMDMediaGroupsAggregateConsumer)initWithIdentifier:(id)a3 subscriptionProvider:(id)a4 notificationCenter:(id)a5 stageManager:(id)a6;
- (HMDMediaGroupsAggregateConsumerDelegate)delegate;
- (HMDMediaGroupsAggregateData)aggregationData;
- (HMDMediaGroupsStageManager)stageManager;
- (HMESubscriptionProviding)subscriptionProvider;
- (NSArray)groups;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)identifier;
- (id)allMediaSystemData;
- (id)destinationControllerDataWithParentIdentifier:(id)a3;
- (id)destinationWithIdentifier:(id)a3;
- (id)destinationWithParentIdentifier:(id)a3;
- (id)groupWithIdentifier:(id)a3;
- (id)logIdentifier;
- (id)mediaSystemDataWithIdentifier:(id)a3;
- (void)_trackHomeTheaterMetricsInAggregateData:(id)a3;
- (void)_trackMediaSystemMetricsInAggregateData:(id)a3;
- (void)commitAggregationData:(id)a3;
- (void)configureWithHome:(id)a3;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)notifyOfUpdatedAggregateData;
- (void)setDelegate:(id)a3;
- (void)setHomeTheaterSetupMetricDispatcher:(id)a3;
- (void)setMediaSystemSetupMetricDispatcher:(id)a3;
- (void)stageNullDestinationForCurrentDestinationControllerIdentifier:(id)a3;
- (void)startSubscriptionForHome:(id)a3;
- (void)stopSubscription;
- (void)unconfigure;
- (void)unstageNullDestinationForCurrentDestinationController;
@end

@implementation HMDMediaGroupsAggregateConsumer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeTheaterSetupMetricDispatcher);
  objc_destroyWeak((id *)&self->_mediaSystemSetupMetricDispatcher);
  objc_storeStrong((id *)&self->_stageManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setHomeTheaterSetupMetricDispatcher:(id)a3
{
}

- (HMDMediaGroupSetupMetricDispatcher)homeTheaterSetupMetricDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeTheaterSetupMetricDispatcher);
  return (HMDMediaGroupSetupMetricDispatcher *)WeakRetained;
}

- (void)setMediaSystemSetupMetricDispatcher:(id)a3
{
}

- (HMDMediaGroupSetupMetricDispatcher)mediaSystemSetupMetricDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSystemSetupMetricDispatcher);
  return (HMDMediaGroupSetupMetricDispatcher *)WeakRetained;
}

- (HMDMediaGroupsStageManager)stageManager
{
  return (HMDMediaGroupsStageManager *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaGroupsAggregateConsumerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaGroupsAggregateConsumerDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsAggregateConsumer *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)mediaSystemDataWithIdentifier:(id)a3
{
  v3 = [(HMDMediaGroupsAggregateConsumer *)self groupWithIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)allMediaSystemData
{
  v2 = [(HMDMediaGroupsAggregateConsumer *)self aggregationData];
  v3 = [v2 groups];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_62586);

  return v4;
}

id __53__HMDMediaGroupsAggregateConsumer_allMediaSystemData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)groupWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregateConsumer *)self aggregationData];
  v6 = [v5 groups];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__HMDMediaGroupsAggregateConsumer_groupWithIdentifier___block_invoke;
  v10[3] = &unk_1E6A0FCF8;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __55__HMDMediaGroupsAggregateConsumer_groupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (NSArray)groups
{
  id v2 = [(HMDMediaGroupsAggregateConsumer *)self aggregationData];
  v3 = [v2 groups];

  return (NSArray *)v3;
}

- (id)destinationWithParentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregateConsumer *)self aggregationData];
  v6 = [v5 destinations];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__HMDMediaGroupsAggregateConsumer_destinationWithParentIdentifier___block_invoke;
  v10[3] = &unk_1E6A12240;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __67__HMDMediaGroupsAggregateConsumer_destinationWithParentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 parentIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)destinationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregateConsumer *)self aggregationData];
  v6 = [v5 destinations];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__HMDMediaGroupsAggregateConsumer_destinationWithIdentifier___block_invoke;
  v10[3] = &unk_1E6A12240;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __61__HMDMediaGroupsAggregateConsumer_destinationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)destinationControllerDataWithParentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregateConsumer *)self aggregationData];
  v6 = [v5 destinationControllersData];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__HMDMediaGroupsAggregateConsumer_destinationControllerDataWithParentIdentifier___block_invoke;
  v10[3] = &unk_1E6A0F330;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __81__HMDMediaGroupsAggregateConsumer_destinationControllerDataWithParentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 parentIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (BOOL)isAggregateTopic:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F2E7A0] decodeTopic:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 asHomeEventTopic];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 homeEventTopicSuffixID];
      if (v9 == *MEMORY[0x1E4F2D228])
      {
        BOOL v10 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v15 = (void *)MEMORY[0x1D9452090]();
      v19 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "homeEventTopicSuffixID"));
        int v22 = 138543874;
        v23 = v18;
        __int16 v24 = 2112;
        id v25 = v20;
        __int16 v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected topic id: %@ topic: %@", (uint8_t *)&v22, 0x20u);

        goto LABEL_12;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1D9452090]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v18;
        __int16 v24 = 2112;
        id v25 = v6;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert to parsed home topic using topic: %@", (uint8_t *)&v22, 0x16u);
LABEL_12:
      }
    }

    BOOL v10 = 0;
    goto LABEL_14;
  }
  id v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    int v22 = 138543618;
    v23 = v14;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse topic: %@", (uint8_t *)&v22, 0x16u);
  }
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(HMDMediaGroupsAggregateConsumer *)self isAggregateTopic:v7])
  {
    v8 = [HMDMediaGroupsAggregateData alloc];
    uint64_t v9 = [v6 encodedData];
    BOOL v10 = [(HMDMediaGroupsAggregateData *)v8 initWithProtoBufferData:v9];

    if (v10)
    {
      [(HMDMediaGroupsAggregateConsumer *)self commitAggregationData:v10];
    }
    else
    {
      v15 = (void *)MEMORY[0x1D9452090]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v18;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Error deserializing event encoded aggregation data for topic: %@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle received event due to unexpected topic: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)notifyOfUpdatedAggregateData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying of updated aggregate data", (uint8_t *)&v14, 0xCu);
  }
  id v7 = [(HMDMediaGroupsAggregateConsumer *)v4 delegate];
  v8 = v7;
  if (v7)
  {
    [v7 didUpdateAggregateDataForMediaGroupsAggregateConsumer:v4];
    uint64_t v9 = [(HMDMediaGroupsAggregateConsumer *)v4 notificationCenter];
    [v9 postNotificationName:@"HMDMediaGroupsAggregateConsumerUpdatedAggregateDataNotification" object:v4];
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = v4;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of update aggregate data due to no delegate", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)unstageNullDestinationForCurrentDestinationController
{
  id v2 = [(HMDMediaGroupsAggregateConsumer *)self stageManager];
  [v2 unstageNullDestinationForCurrentDestinationController];
}

- (void)stageNullDestinationForCurrentDestinationControllerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregateConsumer *)self stageManager];
  [v5 stageNullDestinationForCurrentDestinationControllerIdentifier:v4];
}

- (void)startSubscriptionForHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 mediaGroupsAggregateDataTopicName];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    __int16 v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Subscribing to aggregated media group data with topic: %@", buf, 0x16u);
  }
  BOOL v10 = [(HMDMediaGroupsAggregateConsumer *)v7 subscriptionProvider];
  v13 = v5;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__HMDMediaGroupsAggregateConsumer_startSubscriptionForHome___block_invoke;
  v12[3] = &unk_1E6A18CB8;
  v12[4] = v7;
  [v10 registerConsumer:v7 topicFilters:v11 completion:v12];
}

void __60__HMDMediaGroupsAggregateConsumer_startSubscriptionForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Register consumer completed with error: %@", buf, 0x16u);
    }
  }
  id v11 = [v5 allKeys];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__HMDMediaGroupsAggregateConsumer_startSubscriptionForHome___block_invoke_18;
  v13[3] = &unk_1E6A16928;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v12 = v5;
  objc_msgSend(v11, "na_each:", v13);
}

void __60__HMDMediaGroupsAggregateConsumer_startSubscriptionForHome___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v2 didReceiveEvent:v5 topic:v4];
}

- (void)stopSubscription
{
  v3 = [(HMDMediaGroupsAggregateConsumer *)self subscriptionProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__HMDMediaGroupsAggregateConsumer_stopSubscription__block_invoke;
  v4[3] = &unk_1E6A197F0;
  v4[4] = self;
  [v3 unregisterConsumer:self completion:v4];
}

void __51__HMDMediaGroupsAggregateConsumer_stopSubscription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unregister consumer completed with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)unconfigure
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring media groups aggregate consumer", (uint8_t *)&v7, 0xCu);
  }
  [(HMDMediaGroupsAggregateConsumer *)v4 stopSubscription];
}

- (void)configureWithHome:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring media groups aggregate consumer", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v9 = [(HMDMediaGroupsAggregateConsumer *)v6 stageManager];
  [v9 configure];

  [(HMDMediaGroupsAggregateConsumer *)v6 startSubscriptionForHome:v4];
  __int16 v10 = [v4 mediaSystemSetupMetricDispatcher];
  [(HMDMediaGroupsAggregateConsumer *)v6 setMediaSystemSetupMetricDispatcher:v10];

  id v11 = [v4 homeTheaterSetupMetricDispatcher];
  [(HMDMediaGroupsAggregateConsumer *)v6 setHomeTheaterSetupMetricDispatcher:v11];
}

- (HMDMediaGroupsAggregateData)aggregationData
{
  id v2 = [(HMDMediaGroupsAggregateConsumer *)self stageManager];
  id v3 = [v2 aggregateData];

  return (HMDMediaGroupsAggregateData *)v3;
}

- (void)_trackHomeTheaterMetricsInAggregateData:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregateConsumer *)self homeTheaterSetupMetricDispatcher];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 activeGroupIdentifier];

    if (v7)
    {
      int v8 = [v6 activeGroupIdentifier];
      uint64_t v9 = (void *)MEMORY[0x1D9452090]();
      __int16 v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v39 = v12;
        __int16 v40 = 2112;
        v41 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Check committed home theater UUID: %@ in aggregate data", buf, 0x16u);
      }
      v13 = [v4 destinationControllersData];
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __75__HMDMediaGroupsAggregateConsumer__trackHomeTheaterMetricsInAggregateData___block_invoke;
      v36 = &unk_1E6A0F330;
      id v14 = v8;
      id v37 = v14;
      v15 = objc_msgSend(v13, "na_firstObjectPassingTest:", &v33);
      if (!v15) {
        goto LABEL_18;
      }
      uint64_t v16 = [v6 activeMetricType];
      __int16 v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = v10;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        [NSNumber numberWithUnsignedInteger:v16];
        __int16 v21 = v32 = v17;
        *(_DWORD *)buf = 138543618;
        v39 = v20;
        __int16 v40 = 2112;
        v41 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Attempting to mark request committed for metric type: %@", buf, 0x16u);

        __int16 v17 = v32;
      }

      if (v16 == 4)
      {
        v31 = [v15 destinationIdentifier];

        if (v31)
        {
LABEL_18:

          goto LABEL_19;
        }
        uint64_t v23 = [v15 identifier];
        __int16 v24 = v6;
        id v25 = v23;
        uint64_t v26 = 4;
      }
      else
      {
        if (v16 != 3) {
          goto LABEL_18;
        }
        id v22 = [v15 destinationIdentifier];

        if (!v22) {
          goto LABEL_18;
        }
        uint64_t v23 = [v15 identifier];
        __int16 v24 = v6;
        id v25 = v23;
        uint64_t v26 = 3;
      }
      objc_msgSend(v24, "markRequestCommittedForGroupIdentifier:metricType:error:", v25, v26, 0, v32, v33, v34, v35, v36);

      goto LABEL_18;
    }
  }
  v27 = (void *)MEMORY[0x1D9452090]();
  uint64_t v28 = self;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v39 = v30;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@No home theater setup metric has been tracked", buf, 0xCu);
  }
LABEL_19:
}

uint64_t __75__HMDMediaGroupsAggregateConsumer__trackHomeTheaterMetricsInAggregateData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v2, "hmf_isEqualToUUID:", v3);

  return v4;
}

- (void)_trackMediaSystemMetricsInAggregateData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregateConsumer *)self mediaSystemSetupMetricDispatcher];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 activeGroupIdentifier];

    if (v7)
    {
      int v8 = (void *)MEMORY[0x1D9452090]();
      uint64_t v9 = self;
      __int16 v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v25 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Check committed media system in aggregate data", buf, 0xCu);
      }
      int v12 = [v6 activeGroupIdentifier];
      v13 = [v4 groups];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __75__HMDMediaGroupsAggregateConsumer__trackMediaSystemMetricsInAggregateData___block_invoke;
      v22[3] = &unk_1E6A0FCF8;
      id v14 = v12;
      id v23 = v14;
      v15 = objc_msgSend(v13, "na_firstObjectPassingTest:", v22);
      uint64_t v16 = [v6 activeMetricType];
      if (v15 && v16 == 1)
      {
        uint64_t v17 = 1;
      }
      else
      {
        if (v15 || v16 != 2) {
          goto LABEL_15;
        }
        uint64_t v17 = 2;
      }
      [v6 markRequestCommittedForGroupIdentifier:v14 metricType:v17 error:0];
LABEL_15:

      goto LABEL_16;
    }
  }
  id v18 = (void *)MEMORY[0x1D9452090]();
  uint64_t v19 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    __int16 v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v25 = v21;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@No media system setup metric has been tracked", buf, 0xCu);
  }
LABEL_16:
}

uint64_t __75__HMDMediaGroupsAggregateConsumer__trackMediaSystemMetricsInAggregateData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = *(void **)(a1 + 32);
  int v7 = [v5 identifier];

  uint64_t v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

- (void)commitAggregationData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Committing aggregation data %@ for consumer", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = [(HMDMediaGroupsAggregateConsumer *)v6 stageManager];
  [v9 commitAggregateData:v4];

  [(HMDMediaGroupsAggregateConsumer *)v6 _trackMediaSystemMetricsInAggregateData:v4];
  [(HMDMediaGroupsAggregateConsumer *)v6 _trackHomeTheaterMetricsInAggregateData:v4];
}

- (HMDMediaGroupsAggregateConsumer)initWithIdentifier:(id)a3 subscriptionProvider:(id)a4 notificationCenter:(id)a5 stageManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v20 = (void *)_HMFPreconditionFailure();
    return (HMDMediaGroupsAggregateConsumer *)+[HMDMediaGroupsAggregateConsumer logCategory];
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaGroupsAggregateConsumer;
  uint64_t v16 = [(HMDMediaGroupsAggregateConsumer *)&v22 init];
  if (v16)
  {
    uint64_t v17 = HMFGetOSLogHandle();
    logger = v16->_logger;
    v16->_logger = (OS_os_log *)v17;

    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v16->_subscriptionProvider, a4);
    objc_storeStrong((id *)&v16->_notificationCenter, a5);
    objc_storeStrong((id *)&v16->_stageManager, a6);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21 != -1) {
    dispatch_once(&logCategory__hmf_once_t21, &__block_literal_global_27_62631);
  }
  id v2 = (void *)logCategory__hmf_once_v22;
  return v2;
}

uint64_t __46__HMDMediaGroupsAggregateConsumer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v22;
  logCategory__hmf_once_objc_super v22 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end