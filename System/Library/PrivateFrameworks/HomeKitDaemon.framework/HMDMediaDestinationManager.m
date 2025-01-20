@interface HMDMediaDestinationManager
+ (id)logCategory;
- (BOOL)isTargetDevice;
- (HMDMediaDestinationBackingStoreHandler)backingStoreHandler;
- (HMDMediaDestinationManager)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 backingStore:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9;
- (HMDMediaDestinationManager)initWithDestination:(id)a3 messageHandler:(id)a4 backingStoreHandler:(id)a5 metricsDispatcher:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9;
- (HMDMediaDestinationManagerDataSource)dataSource;
- (HMDMediaDestinationManagerDelegate)delegate;
- (HMDMediaDestinationManagerMetricsDispatcher)metricsDispatcher;
- (HMDMediaDestinationMessageHandler)messageHandler;
- (HMFStagedValue)stagedAudioGroupIdentifier;
- (HMMediaDestination)committedDestination;
- (HMMediaDestination)destination;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (id)dataSourceDestinationControllerWithIdentifier:(id)a3;
- (id)dataSourceRootDestinationManager;
- (id)dataSourceTargetAccessory;
- (id)legacyUpdateAudioGroupIdentifier:(id)a3;
- (id)legacyUpdateSupportedOptions:(unint64_t)a3;
- (id)logIdentifier;
- (id)mediaGroupParticipantLocalDataStorage;
- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4;
- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4;
- (id)updateAudioGroupIdentifier:(id)a3;
- (id)updateSupportedOptions:(unint64_t)a3;
- (void)configureWithHome:(id)a3 currentAccessory:(BOOL)a4;
- (void)mediaDestinationBackingStoreHandler:(id)a3 didUpdateDestination:(id)a4;
- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateAudioGroupIdentifierRequestMessage:(id)a4 audioGroupIdentifier:(id)a5;
- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateSupportedOptionsRequestMessage:(id)a4 supportOptions:(unint64_t)a5;
- (void)mergeDestination:(id)a3;
- (void)notifyDelegateDidUpdateStagedValues;
- (void)requestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stageAudioGroupIdentifier:(id)a3;
- (void)stagedValue:(id)a3 didExpireValue:(id)a4;
- (void)triggerStageValueDidExpireValueForAudioDestinationIdentifier;
@end

@implementation HMDMediaDestinationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedAudioGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_backingStoreHandler, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMFStagedValue)stagedAudioGroupIdentifier
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 72, 1);
}

- (HMDMediaDestinationManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDMediaDestinationManagerMetricsDispatcher *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isTargetDevice
{
  return self->_targetDevice;
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationManagerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaDestinationManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaDestinationManagerDataSource *)WeakRetained;
}

- (HMDMediaDestinationBackingStoreHandler)backingStoreHandler
{
  return (HMDMediaDestinationBackingStoreHandler *)objc_getProperty(self, a2, 40, 1);
}

- (HMDMediaDestinationMessageHandler)messageHandler
{
  return (HMDMediaDestinationMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDMediaDestinationManager *)self stagedAudioGroupIdentifier];

  if (v8 == v6)
  {
    id v13 = v7;
    v14 = [(HMDMediaDestinationManager *)self committedDestination];
    v15 = [v14 audioGroupIdentifier];
    char v16 = HMFEqualObjects();

    if ((v16 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        int v23 = 138543618;
        v24 = v20;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Handling expired audio group identifier value: %@", (uint8_t *)&v23, 0x16u);
      }
      v21 = [(HMDMediaDestinationManager *)v18 messageHandler];
      v22 = [(HMDMediaDestinationManager *)v18 destination];
      [v21 handleUpdatedDestination:v22];

      [(HMDMediaDestinationManager *)v18 notifyDelegateDidUpdateStagedValues];
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v23 = 138543874;
      v24 = v12;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unknown stage value: %@ did expire value: %@", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (void)triggerStageValueDidExpireValueForAudioDestinationIdentifier
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Triggering did expire value for audio destination identifier", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(HMDMediaDestinationManager *)v4 stagedAudioGroupIdentifier];
  id v8 = [v7 value];
  [(HMDMediaDestinationManager *)v4 stagedValue:v7 didExpireValue:v8];
}

- (id)logIdentifier
{
  v2 = [(HMDMediaDestinationManager *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDMediaDestinationManager *)self identifier];
  v5 = (void *)[v3 initWithName:@"identifier" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)notifyDelegateDidUpdateStagedValues
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationManager *)self delegate];
  v4 = v3;
  if (v3)
  {
    [v3 mediaDestinationManagerDidUpdateStagedValues:self];
  }
  else
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of updated staged values due to no delegate", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateAudioGroupIdentifierRequestMessage:(id)a4 audioGroupIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v25 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling did receive update audio group identifier request message", buf, 0xCu);
  }
  v15 = [(HMDMediaDestinationManager *)v12 updateAudioGroupIdentifier:v10];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __133__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke;
  v22[3] = &unk_264A2F3E8;
  id v16 = v9;
  id v23 = v16;
  id v17 = (id)[v15 addFailureBlock:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __133__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke_2;
  v20[3] = &unk_264A2F398;
  id v21 = v16;
  id v18 = v16;
  id v19 = (id)[v15 addSuccessBlock:v20];
}

uint64_t __133__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

uint64_t __133__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateAudioGroupIdentifierRequestMessage_audioGroupIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (void)mediaDestinationMessageHandler:(id)a3 didReceiveUpdateSupportedOptionsRequestMessage:(id)a4 supportOptions:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v24 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling did receive update supported options request message", buf, 0xCu);
  }
  v14 = [(HMDMediaDestinationManager *)v11 updateSupportedOptions:a5];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __123__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke;
  v21[3] = &unk_264A2F3E8;
  id v15 = v9;
  id v22 = v15;
  id v16 = (id)[v14 addFailureBlock:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __123__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke_2;
  v19[3] = &unk_264A2F398;
  id v20 = v15;
  id v17 = v15;
  id v18 = (id)[v14 addSuccessBlock:v19];
}

uint64_t __123__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

uint64_t __123__HMDMediaDestinationManager_mediaDestinationMessageHandler_didReceiveUpdateSupportedOptionsRequestMessage_supportOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDMediaDestinationManager *)self dataSourceTargetAccessory];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 deviceForDirectMessaging];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get device due to no target accessory", (uint8_t *)&v16, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDMediaDestinationManager *)self dataSourceTargetAccessory];
  id v9 = v8;
  if (v8)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "isCurrentAccessory") ^ 1);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine relay preference due to no target accessory", (uint8_t *)&v16, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)mediaDestinationBackingStoreHandler:(id)a3 didUpdateDestination:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_logger;
  if (os_signpost_enabled((os_log_t)v8))
  {
    uint64_t v9 = [v7 audioGroupIdentifier];
    id v10 = (void *)v9;
    if (v9)
    {
      int v19 = 138412290;
      uint64_t v20 = v9;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, (os_log_t)v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HMDMediaDestinationManagerCommitAudioGroupIdentifier", "audioGroupIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263EFF9D0] null];
      int v19 = 138412290;
      uint64_t v20 = (uint64_t)v11;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, (os_log_t)v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HMDMediaDestinationManagerCommitAudioGroupIdentifier", "audioGroupIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }

  v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    int v19 = 138543618;
    uint64_t v20 = (uint64_t)v15;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling did update destination: %@", (uint8_t *)&v19, 0x16u);
  }
  int v16 = [(HMDMediaDestinationManager *)v13 stagedAudioGroupIdentifier];
  id v17 = [v7 audioGroupIdentifier];
  [v16 commitValue:v17];

  uint64_t v18 = [(HMDMediaDestinationManager *)v13 messageHandler];
  [v18 handleUpdatedDestination:v7];
}

- (id)legacyUpdateAudioGroupIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(HMDMediaDestinationManager *)self dataSourceDestinationControllerWithIdentifier:v4];
    if (v5)
    {
      id v6 = [(HMDMediaDestinationManager *)self dataSourceRootDestinationManager];
      id v7 = v6;
      if (v6)
      {
        [(HMDMediaDestinationManager *)v6 stageAudioGroupIdentifier:v4];
        id v8 = v7;
      }
      else
      {
        id v8 = self;
      }
      uint64_t v9 = [(HMDMediaDestinationManager *)v8 identifier];
      [v5 stageDestinationIdentifier:v9];
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x263F58190]);
  uint64_t v11 = [(HMDMediaDestinationManager *)self backingStoreHandler];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__HMDMediaDestinationManager_legacyUpdateAudioGroupIdentifier___block_invoke;
  v16[3] = &unk_264A2F370;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  [v11 updateAudioGroupIdentifier:v4 completion:v16];

  id v13 = v17;
  id v14 = v12;

  return v14;
}

void __63__HMDMediaDestinationManager_legacyUpdateAudioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Update audio group identifier completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Update audio group identifier completed", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)updateAudioGroupIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v24 = 138543618;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating audio group identifier: %@", (uint8_t *)&v24, 0x16u);
  }
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = v6;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v24, 0xCu);
    }
    __int16 v12 = [(HMDMediaDestinationManager *)v14 legacyUpdateAudioGroupIdentifier:v4];
  }
  else
  {
    uint64_t v9 = [(HMDMediaDestinationManager *)v6 mediaGroupParticipantLocalDataStorage];
    int v10 = v9;
    if (v9)
    {
      [v9 updateAudioGroupIdentifier:v4];
      uint64_t v11 = [(HMDMediaDestinationManager *)v6 stagedAudioGroupIdentifier];
      [v11 commitValue:v4];

      __int16 v12 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    else
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = v6;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        int v24 = 138543618;
        uint64_t v25 = v20;
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update local storgage with audio group identifier: %@ due to no local storage found", (uint8_t *)&v24, 0x16u);
      }
      __int16 v21 = (void *)MEMORY[0x263F58190];
      id v22 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
      __int16 v12 = [v21 futureWithError:v22];
    }
  }

  return v12;
}

- (id)legacyUpdateSupportedOptions:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  id v6 = [(HMDMediaDestinationManager *)self backingStoreHandler];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__HMDMediaDestinationManager_legacyUpdateSupportedOptions___block_invoke;
  v11[3] = &unk_264A2F370;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  [v6 updateSupportedOptions:a3 completion:v11];

  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __59__HMDMediaDestinationManager_legacyUpdateSupportedOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Update supported options completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Update supported options completed", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)updateSupportedOptions:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x230FBD990](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = HMMediaDestinationSupportOptionsAsString();
    int v25 = 138543618;
    __int16 v26 = v8;
    __int16 v27 = 2112;
    uint64_t v28 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating supported options: %@", (uint8_t *)&v25, 0x16u);
  }
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = v6;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      int v25 = 138543362;
      __int16 v26 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v25, 0xCu);
    }
    __int16 v12 = [(HMDMediaDestinationManager *)v14 legacyUpdateSupportedOptions:a3];
  }
  else
  {
    int v10 = [(HMDMediaDestinationManager *)v6 mediaGroupParticipantLocalDataStorage];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 updateDestinationSupportOptions:a3];
      __int16 v12 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    else
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = v6;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        __int16 v21 = HMMediaDestinationSupportOptionsAsString();
        int v25 = 138543618;
        __int16 v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update supported options: %@ due to no local storage found", (uint8_t *)&v25, 0x16u);
      }
      id v22 = (void *)MEMORY[0x263F58190];
      uint64_t v23 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
      __int16 v12 = [v22 futureWithError:v23];
    }
  }
  return v12;
}

- (id)dataSourceRootDestinationManager
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationManager *)self dataSource];
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine root destination due to no data source", (uint8_t *)&v10, 0xCu);
    }
  }
  id v8 = [v3 rootDestinationManagerForMediaDestinationManager:self];

  return v8;
}

- (id)dataSourceDestinationControllerWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDMediaDestinationManager *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 mediaDestinationManager:self destinationControllerWithIdentifier:v4];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source destination controller due to no data source", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)dataSourceTargetAccessory
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationManager *)self dataSource];
  id v4 = [v3 targetAccessoryForMediaDestinationManager:self];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get associated accessory from data source: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (id)mediaGroupParticipantLocalDataStorage
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationManager *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 mediaGroupParticipantLocalDataStorageForMediaDestinationManager:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local data storage due to no data source", (uint8_t *)&v11, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

- (HMMediaDestination)committedDestination
{
  v2 = [(HMDMediaDestinationManager *)self backingStoreHandler];
  id v3 = [v2 destination];

  return (HMMediaDestination *)v3;
}

- (HMMediaDestination)destination
{
  id v3 = [(HMDMediaDestinationManager *)self backingStoreHandler];
  id v4 = [v3 destination];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [(HMDMediaDestinationManager *)self stagedAudioGroupIdentifier];
  id v7 = [v6 value];
  [v5 setAudioGroupIdentifier:v7];

  id v8 = (void *)[v5 copy];
  return (HMMediaDestination *)v8;
}

- (void)requestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDMediaDestinationManager *)self messageHandler];
  [v8 sendRequestToUpdateAudioGroupIdentifier:v7 completion:v6];
}

- (void)stageAudioGroupIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543618;
    __int16 v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging audio group identifier: %@", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [(HMDMediaDestinationManager *)v6 stagedAudioGroupIdentifier];
  int v10 = [v9 value];
  char v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", v4);

  int v12 = [(HMDMediaDestinationManager *)v6 stagedAudioGroupIdentifier];
  [v12 stageValue:v4 withTimeout:600.0];

  if ((v11 & 1) == 0) {
    [(HMDMediaDestinationManager *)v6 notifyDelegateDidUpdateStagedValues];
  }
}

- (void)mergeDestination:(id)a3
{
  id v7 = a3;
  id v4 = [(HMDMediaDestinationManager *)self backingStoreHandler];
  [v4 mergeDestination:v7];

  if (![(HMDMediaDestinationManager *)self isTargetDevice])
  {
    id v5 = [(HMDMediaDestinationManager *)self stagedAudioGroupIdentifier];
    id v6 = [v7 audioGroupIdentifier];
    [v5 commitValue:v6];
  }
}

- (void)configureWithHome:(id)a3 currentAccessory:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = [(HMDMediaDestinationManager *)v7 committedDestination];
    int v12 = 138543874;
    int v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring destination manager: %@ destination: %@", (uint8_t *)&v12, 0x20u);
  }
  char v11 = [(HMDMediaDestinationManager *)v7 messageHandler];
  [v11 configureWithHome:v5];
}

- (HMDMediaDestinationManager)initWithDestination:(id)a3 messageHandler:(id)a4 backingStoreHandler:(id)a5 metricsDispatcher:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v39 = a6;
  id v18 = a8;
  id v19 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v16)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v17)
  {
LABEL_9:
    v31 = (HMDMediaDestinationManager *)_HMFPreconditionFailure();
    return [(HMDMediaDestinationManager *)v31 initWithDestination:v33 messageDispatcher:v34 notificationCenter:v35 backingStore:v36 targetDevice:v37 dataSource:v38 delegate:a9];
  }
  uint64_t v20 = v19;
  v40.receiver = self;
  v40.super_class = (Class)HMDMediaDestinationManager;
  __int16 v21 = [(HMDMediaDestinationManager *)&v40 init];
  if (v21)
  {
    uint64_t v22 = HMFGetOSLogHandle();
    logger = v21->_logger;
    v21->_logger = (OS_os_log *)v22;

    uint64_t v24 = [v15 uniqueIdentifier];
    identifier = v21->_identifier;
    v21->_identifier = (NSUUID *)v24;

    objc_storeStrong((id *)&v21->_messageHandler, a4);
    objc_storeStrong((id *)&v21->_backingStoreHandler, a5);
    objc_storeStrong((id *)&v21->_metricsDispatcher, a6);
    v21->_targetDevice = a7;
    objc_storeWeak((id *)&v21->_dataSource, v18);
    objc_storeWeak((id *)&v21->_delegate, v20);
    id v26 = objc_alloc(MEMORY[0x263F42638]);
    __int16 v27 = [v15 audioGroupIdentifier];
    uint64_t v28 = [v26 initWithValue:v27];
    stagedAudioGroupIdentifier = v21->_stagedAudioGroupIdentifier;
    v21->_stagedAudioGroupIdentifier = (HMFStagedValue *)v28;

    [(HMFStagedValue *)v21->_stagedAudioGroupIdentifier setDelegate:v21];
  }

  return v21;
}

- (HMDMediaDestinationManager)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 backingStore:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  BOOL v29 = a7;
  id v28 = a9;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = [HMDMediaDestinationManagerMetricsDispatcher alloc];
  __int16 v21 = [v19 uniqueIdentifier];
  uint64_t v22 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v23 = [(HMDMediaDestinationManagerMetricsDispatcher *)v20 initWithIdentifier:v21 logEventSubmitter:v22];

  uint64_t v24 = [[HMDMediaDestinationMessageHandler alloc] initWithDestination:v19 messageDispatcher:v18 notificationCenter:v17 dataSource:self delegate:self];
  int v25 = [[HMDMediaDestinationBackingStoreHandler alloc] initWithDestination:v19 backingStore:v16 metricsDispatcher:v23 delegate:self];

  id v26 = [(HMDMediaDestinationManager *)self initWithDestination:v19 messageHandler:v24 backingStoreHandler:v25 metricsDispatcher:v23 targetDevice:v29 dataSource:v15 delegate:v28];
  return v26;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_113241 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_113241, &__block_literal_global_113242);
  }
  v2 = (void *)logCategory__hmf_once_v25_113243;
  return v2;
}

void __41__HMDMediaDestinationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25_113243;
  logCategory__hmf_once_v25_113243 = v0;
}

@end