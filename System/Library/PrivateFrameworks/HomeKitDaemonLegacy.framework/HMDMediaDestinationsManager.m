@interface HMDMediaDestinationsManager
+ (id)deriveAudioGroupIdentifierFromDestinations:(id)a3;
+ (id)logCategory;
+ (unint64_t)deriveSupportedOptionsFromDestinations:(id)a3;
- (BOOL)messageHandler:(id)a3 isReadyForIncomingMessage:(id)a4;
- (HMDMediaDestinationMessageHandler)messageHandler;
- (HMDMediaDestinationsManager)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7;
- (HMDMediaDestinationsManager)initWithDestination:(id)a3 messageHandler:(id)a4 dataSource:(id)a5 delegate:(id)a6;
- (HMDMediaDestinationsManagerDataSource)dataSource;
- (HMDMediaDestinationsManagerDelegate)delegate;
- (HMMediaDestination)destination;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (id)dataSourceAssociatedDestinationManagers;
- (id)dataSourceAssociatedDestinations;
- (id)dataSourceDestinationControllerWithIdentifier:(id)a3;
- (id)dataSourceTargetAccessory;
- (id)defaultDestination;
- (id)deriveAudioDestination;
- (id)logIdentifier;
- (id)mediaGroupsAggregatorMessenger;
- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4;
- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4;
- (id)sendRequestsToUpdateAudioGroupIdentifier:(id)a3;
- (id)sendRequestsToUpdateSupportOptions:(unint64_t)a3;
- (void)configureWithHome:(id)a3;
- (void)legacyRequestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4;
- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateAudioGroupIdentifierRequestMessage:(id)a4 audioGroupIdentifier:(id)a5;
- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateSupportedOptionsRequestMessage:(id)a4 supportOptions:(unint64_t)a5;
- (void)mediaDestinationsMessageHandler:(id)a3 didReceiveDestinationUpdatedNotification:(id)a4 destination:(id)a5;
- (void)mergeDestination:(id)a3;
- (void)refreshDestination;
- (void)requestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)stageAudioGroupIdentifier:(id)a3;
@end

@implementation HMDMediaDestinationsManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationsManagerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaDestinationsManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaDestinationsManagerDataSource *)WeakRetained;
}

- (HMDMediaDestinationMessageHandler)messageHandler
{
  return (HMDMediaDestinationMessageHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDestination:(id)a3
{
}

- (HMMediaDestination)destination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDMediaDestinationsManager *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDMediaDestinationsManager *)self identifier];
  v5 = (void *)[v3 initWithName:@"identifier" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)mediaDestinationsMessageHandler:(id)a3 didReceiveDestinationUpdatedNotification:(id)a4 destination:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!isFeatureHomeTheaterQFAEnabledForTests
    || ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v14;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Refreshing manager due to updated destination notification with destination: %@", (uint8_t *)&v15, 0x16u);
    }
    [(HMDMediaDestinationsManager *)v12 refreshDestination];
  }
}

- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateSupportedOptionsRequestMessage:(id)a4 supportOptions:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(HMDMediaDestinationsManager *)self sendRequestsToUpdateSupportOptions:a5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __124__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke;
  v15[3] = &unk_1E6A196E0;
  v15[4] = self;
  id v9 = v7;
  id v16 = v9;
  id v10 = (id)[v8 addFailureBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __124__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke_16;
  v13[3] = &unk_1E6A19730;
  v13[4] = self;
  id v14 = v9;
  id v11 = v9;
  id v12 = (id)[v8 addSuccessBlock:v13];
}

void __124__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send update supported options requests finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) respondWithError:v3];
}

void __124__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Send update supported options requests finished", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 40) respondWithSuccess];
}

- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateAudioGroupIdentifierRequestMessage:(id)a4 audioGroupIdentifier:(id)a5
{
  id v7 = a4;
  int v8 = [(HMDMediaDestinationsManager *)self sendRequestsToUpdateAudioGroupIdentifier:a5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __134__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke;
  v15[3] = &unk_1E6A196E0;
  v15[4] = self;
  id v9 = v7;
  id v16 = v9;
  id v10 = (id)[v8 addFailureBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __134__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke_14;
  v13[3] = &unk_1E6A19730;
  v13[4] = self;
  id v14 = v9;
  id v11 = v9;
  id v12 = (id)[v8 addSuccessBlock:v13];
}

void __134__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send update audio group identifier requests finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) respondWithError:v3];
}

void __134__HMDMediaDestinationsManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Send update audio group identifier requests finished", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 40) respondWithSuccess];
}

- (BOOL)messageHandler:(id)a3 isReadyForIncomingMessage:(id)a4
{
  v4 = [(HMDMediaDestinationsManager *)self destination];
  BOOL v5 = [v4 supportedOptions] != 0;

  return v5;
}

- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDMediaDestinationsManager *)self dataSourceTargetAccessory];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "isCurrentAccessory") ^ 1);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get relay preference due to no target accessory", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDMediaDestinationsManager *)self dataSourceTargetAccessory];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 deviceForDirectMessaging];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get device for message due to no target accessory", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)dataSourceDestinationControllerWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMDMediaDestinationsManager *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 mediaDestinationsManager:self destinationControllerWithIdentifier:v4];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source destination controller due to no data source", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)dataSourceTargetAccessory
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaDestinationsManager *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 targetAccessoryForMediaDestinationManager:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get target accessory due to no data source", (uint8_t *)&v11, 0xCu);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (id)dataSourceAssociatedDestinationManagers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaDestinationsManager *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 associatedDestinationManagersForMediaDestinationsManager:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive destination due to no data source", (uint8_t *)&v11, 0xCu);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (id)dataSourceAssociatedDestinations
{
  v2 = [(HMDMediaDestinationsManager *)self dataSourceAssociatedDestinationManagers];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_3590);

  return v3;
}

uint64_t __63__HMDMediaDestinationsManager_dataSourceAssociatedDestinations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 destination];
}

- (id)mediaGroupsAggregatorMessenger
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaDestinationsManager *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 mediaGroupsAggregatorMessengerForMediaDestinationsManager:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media groups aggregator messenger due to no data source", (uint8_t *)&v11, 0xCu);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (id)defaultDestination
{
  v2 = [(HMDMediaDestinationsManager *)self destination];
  id v3 = objc_alloc(MEMORY[0x1E4F2E8C8]);
  id v4 = [v2 uniqueIdentifier];
  BOOL v5 = [v2 parentIdentifier];
  id v6 = (void *)[v3 initWithUniqueIdentifier:v4 parentIdentifier:v5 supportedOptions:0];

  return v6;
}

- (id)deriveAudioDestination
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaDestinationsManager *)self dataSourceAssociatedDestinations];
  if (v3)
  {
    id v4 = [(HMDMediaDestinationsManager *)self destination];
    unint64_t v5 = +[HMDMediaDestinationsManager deriveSupportedOptionsFromDestinations:v3];
    id v6 = +[HMDMediaDestinationsManager deriveAudioGroupIdentifierFromDestinations:v3];
    id v7 = objc_alloc(MEMORY[0x1E4F2E8C8]);
    int v8 = [v4 uniqueIdentifier];
    id v9 = [v4 parentIdentifier];
    uint64_t v10 = (void *)[v7 initWithUniqueIdentifier:v8 parentIdentifier:v9 supportedOptions:v5 audioGroupIdentifier:v6];
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Derived default destination due to no associated destinations", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v10 = [(HMDMediaDestinationsManager *)v12 defaultDestination];
  }

  return v10;
}

- (id)sendRequestsToUpdateAudioGroupIdentifier:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v4 = [(HMDMediaDestinationsManager *)self dataSourceAssociatedDestinationManagers];
  unint64_t v5 = (void *)MEMORY[0x1D9452090]();
  v25 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v34 = v8;
      __int16 v35 = 2112;
      id v36 = v24;
      __int16 v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending request to update audio group identifier: %@ managers: %@", buf, 0x20u);
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v22 = v4;
    id obj = v4;
    uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v15 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
          [v9 addObject:v15];
          int v16 = [v14 messageHandler];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __72__HMDMediaDestinationsManager_sendRequestsToUpdateAudioGroupIdentifier___block_invoke;
          v26[3] = &unk_1E6A18BA0;
          v26[4] = v25;
          v26[5] = v14;
          id v27 = v15;
          id v17 = v15;
          [v16 sendRequestToUpdateAudioGroupIdentifier:v24 completion:v26];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }

    uint64_t v18 = [MEMORY[0x1E4F7A0D8] chainFutures:v9];
    id v4 = v22;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to send update supported options request to associated destinations due to no associated destinations", buf, 0xCu);
    }
    v20 = (void *)MEMORY[0x1E4F7A0D8];
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v18 = [v20 futureWithError:v9];
  }

  return v18;
}

void __72__HMDMediaDestinationsManager_sendRequestsToUpdateAudioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send request to update audio group identifier for manager: %@ completed with error: %@", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 48) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

- (id)sendRequestsToUpdateSupportOptions:(unint64_t)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = [(HMDMediaDestinationsManager *)self dataSourceAssociatedDestinationManagers];
  id v5 = (void *)MEMORY[0x1D9452090]();
  v26 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = HMMediaDestinationSupportOptionsAsString();
      *(_DWORD *)buf = 138543874;
      __int16 v35 = v8;
      __int16 v36 = 2112;
      __int16 v37 = v9;
      __int16 v38 = 2112;
      uint64_t v39 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending request to update supported options: %@ managers: %@", buf, 0x20u);
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v23 = v4;
    id obj = v4;
    uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v16 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
          [v10 addObject:v16];
          id v17 = [v15 messageHandler];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __66__HMDMediaDestinationsManager_sendRequestsToUpdateSupportOptions___block_invoke;
          v27[3] = &unk_1E6A18BA0;
          v27[4] = v26;
          v27[5] = v15;
          id v28 = v16;
          id v18 = v16;
          [v17 sendRequestToUpdateSupportOptions:a3 completion:v27];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }

    uint64_t v19 = [MEMORY[0x1E4F7A0D8] chainFutures:v10];
    id v4 = v23;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v20;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to send update supported options request to associated destinations due to no associated destinations", buf, 0xCu);
    }
    v21 = (void *)MEMORY[0x1E4F7A0D8];
    id v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v19 = [v21 futureWithError:v10];
  }

  return v19;
}

void __66__HMDMediaDestinationsManager_sendRequestsToUpdateSupportOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send request to update support options for manager: %@ completed with error: %@", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 48) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

- (NSUUID)identifier
{
  v2 = [(HMDMediaDestinationsManager *)self destination];
  id v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (void)refreshDestination
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!isFeatureHomeTheaterQFAEnabledForTests
    || ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Refreshing destination", (uint8_t *)&v20, 0xCu);
    }
    id v7 = [(HMDMediaDestinationsManager *)v4 destination];
    uint64_t v8 = [(HMDMediaDestinationsManager *)v4 deriveAudioDestination];
    if ((HMFEqualObjects() & 1) == 0)
    {
      int v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = v4;
      __int16 v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v20 = 138543874;
        v21 = v12;
        __int16 v22 = 2112;
        v23 = v7;
        __int16 v24 = 2112;
        v25 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating audio destination: %@ with derived audio destination: %@", (uint8_t *)&v20, 0x20u);
      }
      [(HMDMediaDestinationsManager *)v10 setDestination:v8];
      __int16 v13 = [(HMDMediaDestinationsManager *)v10 messageHandler];
      [v13 handleUpdatedDestination:v8];

      id v14 = [(HMDMediaDestinationsManager *)v10 delegate];
      uint64_t v15 = v14;
      if (v14)
      {
        [v14 mediaDestinationsManager:v10 didUpdateDestination:v8];
      }
      else
      {
        id v16 = (void *)MEMORY[0x1D9452090]();
        id v17 = v10;
        id v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          int v20 = 138543362;
          v21 = v19;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify delegate of updated destination due to no delegate", (uint8_t *)&v20, 0xCu);
        }
      }
    }
  }
}

- (void)mergeDestination:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaDestinationsManager *)self destination];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging destination: %@", (uint8_t *)&v11, 0x16u);
    }
    [(HMDMediaDestinationsManager *)v8 setDestination:v4];
  }
}

- (void)legacyRequestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDMediaDestinationsManager *)self messageHandler];
  [v8 sendRequestToUpdateAudioGroupIdentifier:v7 completion:v6];
}

- (void)requestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) != 0)
  {
    id v8 = [(HMDMediaDestinationsManager *)self mediaGroupsAggregatorMessenger];
    if (v8)
    {
      int v9 = [(HMDMediaDestinationsManager *)self destination];
      id v10 = [v9 parentIdentifier];
      [v8 sendRequestToUpdateAssociatedGroupIdentifier:v6 forGroupIdentifier:v10 completion:v7];
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        int v19 = 138543618;
        int v20 = v18;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to request update audio group identifier: %@ due to no aggregator messenger", (uint8_t *)&v19, 0x16u);
      }
      int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      v7[2](v7, v9);
    }
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      int v20 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@HT QFA is not enabled", (uint8_t *)&v19, 0xCu);
    }
    [(HMDMediaDestinationsManager *)v12 legacyRequestToUpdateAudioGroupIdentifier:v6 completion:v7];
  }
}

- (void)stageAudioGroupIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!isFeatureHomeTheaterQFAEnabledForTests
    || ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Stageing audio group identifier: %@", buf, 0x16u);
    }
    int v9 = [(HMDMediaDestinationsManager *)v6 dataSourceAssociatedDestinationManagers];
    if (v9)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__HMDMediaDestinationsManager_stageAudioGroupIdentifier___block_invoke;
      v14[3] = &unk_1E6A05838;
      id v15 = v4;
      objc_msgSend(v9, "na_each:", v14);
      [(HMDMediaDestinationsManager *)v6 refreshDestination];
    }
    else
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      int v11 = v6;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v17 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage audio group identifier due to no associated destination managers", buf, 0xCu);
      }
    }
  }
}

uint64_t __57__HMDMediaDestinationsManager_stageAudioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stageAudioGroupIdentifier:*(void *)(a1 + 32)];
}

- (void)configureWithHome:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = [(HMDMediaDestinationsManager *)v6 committedDestination];
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring destinations manager: %@ destination: %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [(HMDMediaDestinationsManager *)v6 messageHandler];
  [v10 configureWithHome:v4];

  [(HMDMediaDestinationsManager *)v6 refreshDestination];
}

- (HMDMediaDestinationsManager)initWithDestination:(id)a3 messageHandler:(id)a4 dataSource:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v12)
  {
LABEL_7:
    id v19 = (HMDMediaDestinationsManager *)_HMFPreconditionFailure();
    return [(HMDMediaDestinationsManager *)v19 initWithDestination:v21 messageDispatcher:v22 notificationCenter:v23 dataSource:v24 delegate:v25];
  }
  __int16 v15 = v14;
  v26.receiver = self;
  v26.super_class = (Class)HMDMediaDestinationsManager;
  id v16 = [(HMDMediaDestinationsManager *)&v26 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_destination, a3);
    objc_storeStrong((id *)&v17->_messageHandler, a4);
    objc_storeWeak((id *)&v17->_dataSource, v13);
    objc_storeWeak((id *)&v17->_delegate, v15);
  }

  return v17;
}

- (HMDMediaDestinationsManager)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [[HMDMediaDestinationsMessageHandler alloc] initWithDestination:v16 messageDispatcher:v15 notificationCenter:v14 dataSource:self delegate:self];

  __int16 v18 = [(HMDMediaDestinationsManager *)self initWithDestination:v16 messageHandler:v17 dataSource:v13 delegate:v12];
  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27 != -1) {
    dispatch_once(&logCategory__hmf_once_t27, &__block_literal_global_24);
  }
  v2 = (void *)logCategory__hmf_once_v28;
  return v2;
}

uint64_t __42__HMDMediaDestinationsManager_logCategory__block_invoke()
{
  logCategory__hmf_once_id v28 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)deriveAudioGroupIdentifierFromDestinations:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 audioGroupIdentifier];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HMDMediaDestinationsManager_deriveAudioGroupIdentifierFromDestinations___block_invoke;
  v10[3] = &unk_1E6A12240;
  id v11 = v5;
  id v6 = v5;
  LODWORD(v5) = objc_msgSend(v3, "na_allObjectsPassTest:", v10);

  if (v5) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

uint64_t __74__HMDMediaDestinationsManager_deriveAudioGroupIdentifierFromDestinations___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 audioGroupIdentifier];
  uint64_t v4 = objc_msgSend(v2, "hmf_isEqualToUUID:", v3);

  return v4;
}

+ (unint64_t)deriveSupportedOptionsFromDestinations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    unint64_t v7 = 77;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (![v9 containsSupportedOptions:1]) {
          v7 &= ~1uLL;
        }
        if (![v9 containsSupportedOptions:8]) {
          v7 &= ~8uLL;
        }
        if (![v9 containsSupportedOptions:4]) {
          v7 &= ~4uLL;
        }
        if (![v9 containsSupportedOptions:64]) {
          v7 &= ~0x40uLL;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = 77;
  }

  return v7;
}

@end