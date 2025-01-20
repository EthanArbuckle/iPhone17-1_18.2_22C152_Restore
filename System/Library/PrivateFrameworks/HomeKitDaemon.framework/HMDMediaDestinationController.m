@interface HMDMediaDestinationController
+ (id)logCategory;
+ (unint64_t)expectedSupportOptions;
- (BOOL)hasSetDestinationRelatedToIdentifier:(id)a3;
- (BOOL)isTargetDevice;
- (HMDMediaDestinationController)initWithBackingStoreHandler:(id)a3 messageHandler:(id)a4 metricsEventDispatcher:(id)a5 targetDevice:(BOOL)a6 dataSource:(id)a7 delegate:(id)a8;
- (HMDMediaDestinationController)initWithData:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5 notificationCenter:(id)a6 logEventSubmitter:(id)a7 dailyScheduler:(id)a8 targetDevice:(BOOL)a9 dataSource:(id)a10 delegate:(id)a11;
- (HMDMediaDestinationControllerBackingStoreHandler)backingStoreHandler;
- (HMDMediaDestinationControllerDataSource)dataSource;
- (HMDMediaDestinationControllerDelegate)delegate;
- (HMDMediaDestinationControllerMessageHandler)messageHandler;
- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher;
- (HMFStagedValue)stagedAvailableDestinationIdentifiers;
- (HMFStagedValue)stagedDestinationIdentifier;
- (HMMediaDestinationControllerData)committedData;
- (HMMediaDestinationControllerData)data;
- (NSString)urlString;
- (NSUUID)identifier;
- (id)_updateDestinationIdentifier:(id)a3;
- (id)assistantObjectWithHome:(id)a3 name:(id)a4;
- (id)attributeDescriptions;
- (id)dataSourceAvailableDestinationIdentifiers;
- (id)dataSourceDestinationManagerWithIdentifier:(id)a3;
- (id)dataSourceDestinationUsingRelatedIdentifier:(id)a3;
- (id)dataSourceDestinationWithIdentifier:(id)a3;
- (id)dataSourceTargetAccessory;
- (id)filteredAvailableDestinationIdentifiers;
- (id)filteredDestinationIdentifierFilteredAvailableDestinationIdentifiers:(id)a3;
- (id)legacyUpdateAvailableDestinationIdentifiers:(id)a3;
- (id)legacyUpdateDestinationIdentifier:(id)a3;
- (id)logIdentifier;
- (id)mediaGroupParticipantDataLocalStorage;
- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4;
- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4;
- (id)updateAvailableDestinationIdentifiers:(id)a3;
- (id)updateDestinationIdentifier:(id)a3;
- (id)updateDestinationIdentifier:(id)a3 updateOptions:(unint64_t)a4;
- (id)updateDestinationWithIdentifier:(id)a3 audioGroupIdentifier:(id)a4;
- (void)configureWithHome:(id)a3;
- (void)mediaDestinationControllerBackingStoreHandler:(id)a3 didUpdateAvailableDestinationIdentifiers:(id)a4;
- (void)mediaDestinationControllerBackingStoreHandler:(id)a3 didUpdateDestinationIdentifier:(id)a4;
- (void)mediaDestinationControllerBackingStoreHandlerDidProcessUnexpectedModelAdd:(id)a3;
- (void)mediaDestinationControllerMessageHandler:(id)a3 didReceiveMediaDestinationControllerUpdateDestinationRequestMessage:(id)a4 destinationIdentifier:(id)a5 updateOptions:(unint64_t)a6;
- (void)mediaDestinationControllerMessageHandler:(id)a3 didReceiveMediaDestinationControllerUpdatedDestinationNotification:(id)a4 destinationControllerIdentifier:(id)a5 destinationIdentifier:(id)a6;
- (void)mergeData:(id)a3;
- (void)migrateSupportOptions;
- (void)notifyDelegateDidUpdateStagedValues;
- (void)refreshAvailableDestinationIdentifiers;
- (void)refreshDestinationController;
- (void)refreshDestinationIdentifier;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMetricsEventDispatcher:(id)a3;
- (void)stageAvailableDestinationIdentifiers:(id)a3;
- (void)stageDestinationIdentifier:(id)a3;
- (void)stagedValue:(id)a3 didExpireAvailableDestinationIdentifiers:(id)a4;
- (void)stagedValue:(id)a3 didExpireDestinationIdentifier:(id)a4;
- (void)stagedValue:(id)a3 didExpireValue:(id)a4;
- (void)triggerStageValueDidExpireValueForStagedAvailableDestinationIdentifiers;
- (void)triggerStageValueDidExpireValueForStagedDestinationIdentifier;
- (void)unsetAudioGroupForCurrentDestination;
@end

@implementation HMDMediaDestinationController

- (id)assistantObjectWithHome:(id)a3 name:(id)a4
{
  v15[9] = *MEMORY[0x263EF8340];
  v14[0] = @"objectType";
  v14[1] = @"objectName";
  v15[0] = *MEMORY[0x263F655C8];
  v15[1] = a4;
  v14[2] = @"objectIdentifier";
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDMediaDestinationController *)self urlString];
  v15[2] = v8;
  v14[3] = @"objectHome";
  v9 = [v7 name];
  v15[3] = v9;
  v14[4] = @"objectHomeIdentifier";
  v10 = [v7 urlString];

  v15[4] = v10;
  v15[5] = self;
  v14[5] = @"objectReference";
  v14[6] = @"objectServiceType";
  uint64_t v11 = *MEMORY[0x263F65678];
  v15[6] = *MEMORY[0x263F657C8];
  v15[7] = v11;
  v14[7] = @"objectServiceSubType";
  v14[8] = @"objectGroupType";
  v15[8] = *MEMORY[0x263F655F8];
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];

  return v12;
}

- (NSString)urlString
{
  v2 = [(HMDMediaDestinationController *)self identifier];
  v3 = hm_assistantIdentifier();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedAvailableDestinationIdentifiers, 0);
  objc_storeStrong((id *)&self->_stagedDestinationIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsEventDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_backingStoreHandler, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMFStagedValue)stagedAvailableDestinationIdentifiers
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 80, 1);
}

- (HMFStagedValue)stagedDestinationIdentifier
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMetricsEventDispatcher:(id)a3
{
}

- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher
{
  return (HMDMediaDestinationControllerMetricsEventDispatcher *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isTargetDevice
{
  return self->_isTargetDevice;
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationControllerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaDestinationControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaDestinationControllerDataSource *)WeakRetained;
}

- (HMDMediaDestinationControllerBackingStoreHandler)backingStoreHandler
{
  return (HMDMediaDestinationControllerBackingStoreHandler *)objc_getProperty(self, a2, 40, 1);
}

- (HMDMediaDestinationControllerMessageHandler)messageHandler
{
  return (HMDMediaDestinationControllerMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)notifyDelegateDidUpdateStagedValues
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaDestinationController *)self delegate];
  v4 = v3;
  if (v3)
  {
    [v3 mediaDestinationControllerDidUpdateStagedValues:self];
  }
  else
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed notify did update staged values due to no delegate", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)stagedValue:(id)a3 didExpireAvailableDestinationIdentifiers:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [MEMORY[0x263EFFA08] setWithArray:v7];
    int v9 = (void *)MEMORY[0x263EFFA08];
    v10 = [(HMDMediaDestinationController *)self committedData];
    uint64_t v11 = [v10 availableDestinationIdentifiers];
    v12 = [v9 setWithArray:v11];
    char v13 = [v8 isEqualToSet:v12];

    if ((v13 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        int v24 = 138543618;
        v25 = v17;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Handling did expire available destination identifiers: %@", (uint8_t *)&v24, 0x16u);
      }
      v18 = [(HMDMediaDestinationController *)v15 metricsEventDispatcher];
      v19 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      [v18 submitFailureEventWithEventErrorCode:9 error:v19];

      [(HMDMediaDestinationController *)v15 notifyDelegateDidUpdateStagedValues];
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      int v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Expired available destination identifiers was null when the property is non-null", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)stagedValue:(id)a3 didExpireDestinationIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDMediaDestinationController *)self committedData];
  int v9 = [v8 destinationIdentifier];
  char v10 = HMFEqualObjects();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v18 = 138543618;
      v19 = v14;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Handling did expire destination identifier: %@", (uint8_t *)&v18, 0x16u);
    }
    v15 = [(HMDMediaDestinationController *)v12 metricsEventDispatcher];
    v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v15 submitFailureEventWithEventErrorCode:8 error:v16];

    v17 = [(HMDMediaDestinationController *)v12 messageHandler];
    [v17 notifyUpdatedDestinationWithIdentifier:v7];

    [(HMDMediaDestinationController *)v12 notifyDelegateDidUpdateStagedValues];
  }
}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];

  if (v8 == v6)
  {
    [(HMDMediaDestinationController *)self stagedValue:v6 didExpireDestinationIdentifier:v7];
  }
  else
  {
    id v9 = [(HMDMediaDestinationController *)self stagedAvailableDestinationIdentifiers];

    if (v9 == v6)
    {
      [(HMDMediaDestinationController *)self stagedValue:v6 didExpireAvailableDestinationIdentifiers:v7];
    }
    else
    {
      char v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        char v13 = HMFGetLogIdentifier();
        int v14 = 138543874;
        v15 = v13;
        __int16 v16 = 2112;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unknown stage value: %@ did expire value: %@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
}

- (void)triggerStageValueDidExpireValueForStagedAvailableDestinationIdentifiers
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    char v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Triggering stage value did expire value for staged available destination identifiers", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(HMDMediaDestinationController *)v4 stagedAvailableDestinationIdentifiers];
  id v8 = [v7 value];
  [(HMDMediaDestinationController *)v4 stagedValue:v7 didExpireValue:v8];
}

- (void)triggerStageValueDidExpireValueForStagedDestinationIdentifier
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    char v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Triggering stage value did expire value for staged destination identifier", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(HMDMediaDestinationController *)v4 stagedDestinationIdentifier];
  id v8 = [v7 value];
  [(HMDMediaDestinationController *)v4 stagedValue:v7 didExpireValue:v8];
}

- (id)logIdentifier
{
  v2 = [(HMDMediaDestinationController *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v23[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v22 = [(HMDMediaDestinationController *)self identifier];
  id v21 = (void *)[v3 initWithName:@"identifier" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDMediaDestinationController *)self isTargetDevice];
  uint64_t v20 = HMFBooleanToString();
  id v19 = (void *)[v4 initWithName:@"isTargetDevice" value:v20];
  v23[1] = v19;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  id v6 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
  id v7 = [v6 value];
  id v8 = (void *)[v5 initWithName:@"destinationIdentifier" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  char v10 = [(HMDMediaDestinationController *)self committedData];
  [v10 supportedOptions];
  uint64_t v11 = HMMediaDestinationControllerSupportOptionsAsString();
  v12 = (void *)[v9 initWithName:@"supportedOptions" value:v11];
  v23[3] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  int v14 = [(HMDMediaDestinationController *)self stagedAvailableDestinationIdentifiers];
  v15 = [v14 value];
  __int16 v16 = (void *)[v13 initWithName:@"availableDestinationIdentifiers" value:v15];
  v23[4] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];

  return v17;
}

- (void)mediaDestinationControllerBackingStoreHandlerDidProcessUnexpectedModelAdd:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    char v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing destination controller due to unexpected model add", (uint8_t *)&v9, 0xCu);
  }
  [(HMDMediaDestinationController *)v6 refreshDestinationController];
}

- (void)mediaDestinationControllerBackingStoreHandler:(id)a3 didUpdateAvailableDestinationIdentifiers:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  char v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    int v14 = v11;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Committing updated available destination identifiers: %@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [(HMDMediaDestinationController *)v9 stagedAvailableDestinationIdentifiers];
  [v12 commitValue:v7];
}

- (void)mediaDestinationControllerBackingStoreHandler:(id)a3 didUpdateDestinationIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_logger;
  if (os_signpost_enabled((os_log_t)v8))
  {
    if (v7)
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, (os_log_t)v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HMDMediaDestinationControllerCommitDestinationIdentifierEvent", "destinationIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v17, 0xCu);
    }
    else
    {
      int v9 = [MEMORY[0x263EFF9D0] null];
      int v17 = 138412290;
      id v18 = v9;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, (os_log_t)v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HMDMediaDestinationControllerCommitDestinationIdentifierEvent", "destinationIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v17, 0xCu);
    }
  }

  char v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v13;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Committing updated destination identifier: %@", (uint8_t *)&v17, 0x16u);
  }
  int v14 = [(HMDMediaDestinationController *)v11 stagedDestinationIdentifier];
  [v14 commitValue:v7];

  __int16 v15 = [(HMDMediaDestinationController *)v11 metricsEventDispatcher];
  [v15 submitStagedDestinationIdentifierCommittedEventWithCommittedDestinationIdentifier:v7];

  id v16 = [(HMDMediaDestinationController *)v11 messageHandler];
  [v16 notifyUpdatedDestinationWithIdentifier:v7];
}

- (void)mediaDestinationControllerMessageHandler:(id)a3 didReceiveMediaDestinationControllerUpdatedDestinationNotification:(id)a4 destinationControllerIdentifier:(id)a5 destinationIdentifier:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(HMDMediaDestinationController *)self identifier];
  if (objc_msgSend(v12, "hmf_isEqualToUUID:", v14))
  {
  }
  else
  {
    __int16 v15 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
    id v16 = [v15 value];
    int v17 = objc_msgSend(v13, "hmf_isEqualToUUID:", v16);

    if (v17)
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      __int16 v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        __int16 v31 = 2112;
        id v32 = v13;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Unsetting media destination due to another destination controller with the same destination identifier: %@", buf, 0x16u);
      }
      uint64_t v22 = [(HMDMediaDestinationController *)v19 updateDestinationIdentifier:0 updateOptions:4];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __195__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdatedDestinationNotification_destinationControllerIdentifier_destinationIdentifier___block_invoke;
      v28[3] = &unk_264A2F3E8;
      v28[4] = v19;
      id v23 = (id)[v22 addFailureBlock:v28];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __195__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdatedDestinationNotification_destinationControllerIdentifier_destinationIdentifier___block_invoke_32;
      v27[3] = &unk_264A2F398;
      v27[4] = v19;
      id v24 = (id)[v22 addSuccessBlock:v27];
    }
  }
  v25 = [(HMDMediaDestinationController *)self identifier];
  int v26 = objc_msgSend(v12, "hmf_isEqualToUUID:", v25);

  if (v26) {
    [(HMDMediaDestinationController *)self refreshDestinationController];
  }
}

void __195__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdatedDestinationNotification_destinationControllerIdentifier_destinationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
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
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Update destination identifier to unset destination finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __195__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdatedDestinationNotification_destinationControllerIdentifier_destinationIdentifier___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Update destination identifier to unset destination finished", (uint8_t *)&v8, 0xCu);
  }
}

- (void)mediaDestinationControllerMessageHandler:(id)a3 didReceiveMediaDestinationControllerUpdateDestinationRequestMessage:(id)a4 destinationIdentifier:(id)a5 updateOptions:(unint64_t)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x230FBD990]();
  int v14 = self;
  __int16 v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v30 = v16;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling did receive media destination controller update destination request message", buf, 0xCu);
  }
  int v17 = [(HMDMediaDestinationController *)v14 metricsEventDispatcher];
  id v18 = [(HMDMediaDestinationController *)v14 stagedDestinationIdentifier];
  __int16 v19 = [v18 value];
  [v17 submitReceivedUpdateDestinationRequestMessageEventWithDestinationIdentifier:v12 existingDestinationIdentifier:v19];

  id v20 = [(HMDMediaDestinationController *)v14 updateDestinationIdentifier:v12 updateOptions:a6];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __178__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdateDestinationRequestMessage_destinationIdentifier_updateOptions___block_invoke;
  v27[3] = &unk_264A2F370;
  v27[4] = v14;
  id v21 = v11;
  id v28 = v21;
  id v22 = (id)[v20 addFailureBlock:v27];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __178__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdateDestinationRequestMessage_destinationIdentifier_updateOptions___block_invoke_31;
  v25[3] = &unk_264A2F3C0;
  v25[4] = v14;
  id v26 = v21;
  id v23 = v21;
  id v24 = (id)[v20 addSuccessBlock:v25];
}

void __178__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdateDestinationRequestMessage_destinationIdentifier_updateOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
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
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Update destination future finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) respondWithError:v3];
}

void __178__HMDMediaDestinationController_mediaDestinationControllerMessageHandler_didReceiveMediaDestinationControllerUpdateDestinationRequestMessage_destinationIdentifier_updateOptions___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Update destination future finished", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 40) respondWithSuccess];
}

- (id)messageHandler:(id)a3 deviceForOutgoingMessage:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDMediaDestinationController *)self dataSourceTargetAccessory];
  int v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 deviceForDirectMessaging];
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      int v17 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get relay preference due to no target accessory", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)messageHandler:(id)a3 shouldRelayIncomingMessage:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDMediaDestinationController *)self dataSourceTargetAccessory];
  int v9 = v8;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "isCurrentAccessory") ^ 1);
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      int v17 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get relay preference due to no target accessory", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)dataSourceDestinationUsingRelatedIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDMediaDestinationController *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 mediaDestinationController:self destinationWithParentIdentifier:v4];
    if (v7)
    {
      int v8 = (void *)MEMORY[0x230FBD990]();
      int v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        int v25 = 138543874;
        id v26 = v11;
        __int16 v27 = 2112;
        id v28 = v7;
        __int16 v29 = 2112;
        id v30 = v4;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Found destination: %@ using parent identifier: %@", (uint8_t *)&v25, 0x20u);
      }
      uint64_t v12 = [v7 uniqueIdentifier];

      id v4 = (id)v12;
    }
    id v13 = [v6 mediaDestinationController:self rootDestinationWithDecendantIdentifier:v4];
    id v14 = v7;
    if (v13)
    {
      __int16 v15 = (void *)MEMORY[0x230FBD990]();
      int v16 = self;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v25 = 138543874;
        id v26 = v18;
        __int16 v27 = 2112;
        id v28 = v13;
        __int16 v29 = 2112;
        id v30 = v4;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Found root destination: %@ using decendant identifier: %@", (uint8_t *)&v25, 0x20u);
      }
      id v14 = v13;
    }
    id v19 = v14;
  }
  else
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      int v25 = 138543618;
      id v26 = v23;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data source during destination with parent identifier: %@", (uint8_t *)&v25, 0x16u);
    }
    id v19 = 0;
  }

  return v19;
}

- (id)dataSourceDestinationWithIdentifier:(id)a3
{
  id v3 = [(HMDMediaDestinationController *)self dataSourceDestinationManagerWithIdentifier:a3];
  id v4 = [v3 destination];

  return v4;
}

- (id)dataSourceDestinationManagerWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDMediaDestinationController *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 mediaDestinationController:self destinationManagerWithIdentifier:v4];
  }
  else
  {
    int v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination manager with identifier: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)dataSourceTargetAccessory
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationController *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 targetAccessoryForMediaDestinationController:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get target accessory due to no data source", (uint8_t *)&v11, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)dataSourceAvailableDestinationIdentifiers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationController *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 availableDestinationIdentifiersForMediaDestinationController:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get refreshed available destination identifiers due to no data source", (uint8_t *)&v11, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)mediaGroupParticipantDataLocalStorage
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationController *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 mediaGroupLocalDataStorageForMediaDestinationController:self];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      uint64_t v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = HMFGetLogIdentifier();
        int v17 = 138543618;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local data storage due data source: %@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
  else
  {
    int v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data souce local data storage due to no data source", (uint8_t *)&v17, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)filteredDestinationIdentifierFilteredAvailableDestinationIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
  id v6 = [v5 value];

  if (!v6)
  {
    id v11 = 0;
    goto LABEL_13;
  }
  id v7 = [(HMDMediaDestinationController *)self dataSourceDestinationWithIdentifier:v6];
  if (!v7)
  {
    id v7 = [(HMDMediaDestinationController *)self dataSourceDestinationUsingRelatedIdentifier:v6];
    if (!v7) {
      goto LABEL_9;
    }
  }
  int v8 = [v7 audioGroupIdentifier];
  int v9 = [(HMDMediaDestinationController *)self identifier];
  if ((objc_msgSend(v8, "hmf_isEqualToUUID:", v9) & 1) == 0)
  {

    goto LABEL_9;
  }
  char v10 = [v4 containsObject:v6];

  if ((v10 & 1) == 0)
  {
LABEL_9:
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      int v17 = 138544130;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Filtering unknown destination with identifier: %@ due to destination: %@ available destinations: %@", (uint8_t *)&v17, 0x2Au);
    }
    id v11 = 0;
    goto LABEL_12;
  }
  id v11 = v6;
LABEL_12:

LABEL_13:
  return v11;
}

- (id)filteredAvailableDestinationIdentifiers
{
  id v3 = [(HMDMediaDestinationController *)self stagedAvailableDestinationIdentifiers];
  id v4 = [v3 value];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMDMediaDestinationController_filteredAvailableDestinationIdentifiers__block_invoke;
  v7[3] = &unk_264A2F348;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

BOOL __72__HMDMediaDestinationController_filteredAvailableDestinationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSourceDestinationWithIdentifier:v3];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Filtering unknown available destination with identifier: %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4 != 0;
}

- (HMMediaDestinationControllerData)data
{
  id v3 = [(HMDMediaDestinationController *)self backingStoreHandler];
  id v4 = [v3 data];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [(HMDMediaDestinationController *)self filteredAvailableDestinationIdentifiers];
  [v5 setAvailableDestinationIdentifiers:v6];

  id v7 = [v5 availableDestinationIdentifiers];
  int v8 = [(HMDMediaDestinationController *)self filteredDestinationIdentifierFilteredAvailableDestinationIdentifiers:v7];
  [v5 setDestinationIdentifier:v8];

  int v9 = (void *)[v5 copy];
  return (HMMediaDestinationControllerData *)v9;
}

- (HMMediaDestinationControllerData)committedData
{
  v2 = [(HMDMediaDestinationController *)self backingStoreHandler];
  id v3 = [v2 data];

  return (HMMediaDestinationControllerData *)v3;
}

- (BOOL)hasSetDestinationRelatedToIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
  id v6 = [v5 value];

  if (v6)
  {
    if (objc_msgSend(v6, "hmf_isEqualToUUID:", v4))
    {
      char v7 = 1;
    }
    else
    {
      int v8 = [(HMDMediaDestinationController *)self dataSourceDestinationUsingRelatedIdentifier:v4];
      if (v8)
      {
        int v9 = [(HMDMediaDestinationController *)self dataSourceDestinationUsingRelatedIdentifier:v6];
        int v10 = v9;
        if (v9)
        {
          id v11 = [v9 uniqueIdentifier];
          __int16 v12 = [v8 uniqueIdentifier];
          char v7 = objc_msgSend(v11, "hmf_isEqualToUUID:", v12);
        }
        else
        {
          char v7 = 0;
        }
      }
      else
      {
        char v7 = 0;
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)refreshDestinationIdentifier
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
  id v4 = [v3 value];

  if (v4)
  {
    uint64_t v5 = [(HMDMediaDestinationController *)self dataSourceDestinationUsingRelatedIdentifier:v4];
    if (v5)
    {
      id v6 = (void *)v5;
      char v7 = (void *)MEMORY[0x230FBD990]();
      int v8 = self;
      int v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = HMFGetLogIdentifier();
        id v11 = [v6 identifier];
        *(_DWORD *)buf = 138543874;
        __int16 v19 = v10;
        __int16 v20 = 2112;
        __int16 v21 = v4;
        __int16 v22 = 2112;
        __int16 v23 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating related destination identifier: %@ to destination identifier: %@", buf, 0x20u);
      }
      __int16 v12 = [v6 uniqueIdentifier];
      id v13 = [(HMDMediaDestinationController *)v8 updateDestinationIdentifier:v12];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __61__HMDMediaDestinationController_refreshDestinationIdentifier__block_invoke;
      v17[3] = &unk_264A2F3E8;
      v17[4] = v8;
      id v14 = (id)[v13 addFailureBlock:v17];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __61__HMDMediaDestinationController_refreshDestinationIdentifier__block_invoke_29;
      v16[3] = &unk_264A2F398;
      v16[4] = v8;
      id v15 = (id)[v13 addSuccessBlock:v16];
    }
  }
}

void __61__HMDMediaDestinationController_refreshDestinationIdentifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Update destination identifier for refresh finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __61__HMDMediaDestinationController_refreshDestinationIdentifier__block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Update destination identifier for refresh finished", (uint8_t *)&v8, 0xCu);
  }
}

- (void)refreshAvailableDestinationIdentifiers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaDestinationController *)self dataSourceAvailableDestinationIdentifiers];
  if (v3)
  {
    id v4 = [(HMDMediaDestinationController *)self stagedAvailableDestinationIdentifiers];
    id v5 = [v4 value];

    id v6 = [MEMORY[0x263EFFA08] setWithArray:v3];
    char v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
    char v8 = [v6 isEqualToSet:v7];

    if ((v8 & 1) == 0)
    {
      int v9 = [(HMDMediaDestinationController *)self updateAvailableDestinationIdentifiers:v3];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __71__HMDMediaDestinationController_refreshAvailableDestinationIdentifiers__block_invoke;
      v17[3] = &unk_264A2F3E8;
      v17[4] = self;
      id v10 = (id)[v9 addFailureBlock:v17];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __71__HMDMediaDestinationController_refreshAvailableDestinationIdentifiers__block_invoke_27;
      v16[3] = &unk_264A2F398;
      v16[4] = self;
      id v11 = (id)[v9 addSuccessBlock:v16];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v19 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to update available destination identifiers due to no refreshed available destination identifiers", buf, 0xCu);
    }
  }
}

void __71__HMDMediaDestinationController_refreshAvailableDestinationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Update available destination identifiers for refresh finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __71__HMDMediaDestinationController_refreshAvailableDestinationIdentifiers__block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Update available destination identifiers for refresh finished", (uint8_t *)&v8, 0xCu);
  }
}

- (void)refreshDestinationController
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(HMDMediaDestinationController *)self isTargetDevice])
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Refreshing destination controller", (uint8_t *)&v7, 0xCu);
    }
    [(HMDMediaDestinationController *)v4 refreshAvailableDestinationIdentifiers];
    [(HMDMediaDestinationController *)v4 refreshDestinationIdentifier];
  }
}

- (id)updateDestinationWithIdentifier:(id)a3 audioGroupIdentifier:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating destination with identifier: %@ audio group identifier: %@", buf, 0x20u);
  }
  uint64_t v12 = [(HMDMediaDestinationController *)v9 dataSourceDestinationManagerWithIdentifier:v6];
  id v13 = v12;
  if (v12)
  {
    [v12 stageAudioGroupIdentifier:v7];
    id v14 = objc_alloc_init(MEMORY[0x263F58190]);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __86__HMDMediaDestinationController_updateDestinationWithIdentifier_audioGroupIdentifier___block_invoke;
    v29[3] = &unk_264A2F370;
    v29[4] = v9;
    id v15 = v14;
    id v30 = v15;
    [v13 requestToUpdateAudioGroupIdentifier:v7 completion:v29];
    id v16 = v30;
    id v17 = v15;

    uint64_t v18 = v17;
    goto LABEL_12;
  }
  __int16 v19 = (void *)MEMORY[0x230FBD990]();
  uint64_t v20 = v9;
  __int16 v21 = HMFGetOSLogHandle();
  __int16 v22 = v21;
  if (v7)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v23;
      __int16 v33 = 2112;
      id v34 = v6;
      uint64_t v24 = "%{public}@Failed to update destination due to no destination manager found for identifier: %@";
      uint64_t v25 = v22;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v25, v26, v24, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    __int16 v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v32 = v23;
    __int16 v33 = 2112;
    id v34 = v6;
    uint64_t v24 = "%{public}@No destination manager found to unset the audio group for the destination with identifier: %@";
    uint64_t v25 = v22;
    os_log_type_t v26 = OS_LOG_TYPE_INFO;
    goto LABEL_10;
  }

  __int16 v27 = (void *)MEMORY[0x263F58190];
  id v17 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:9007];
  uint64_t v18 = [v27 futureWithError:v17];
LABEL_12:

  return v18;
}

void __86__HMDMediaDestinationController_updateDestinationWithIdentifier_audioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
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
      int v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Send request to update audio group identifier completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Send request to update audio group identifier completed", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (void)unsetAudioGroupForCurrentDestination
{
  id v3 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
  id v6 = [v3 value];

  id v4 = v6;
  if (v6)
  {
    id v5 = [(HMDMediaDestinationController *)self updateDestinationWithIdentifier:v6 audioGroupIdentifier:0];
    id v4 = v6;
  }
}

- (id)legacyUpdateDestinationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
  [v5 stageValue:v4 withTimeout:60.0];

  id v6 = objc_alloc_init(MEMORY[0x263F58190]);
  id v7 = [(HMDMediaDestinationController *)self backingStoreHandler];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HMDMediaDestinationController_legacyUpdateDestinationIdentifier___block_invoke;
  v12[3] = &unk_264A2F370;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  [v7 updateDestinationIdentifier:v4 completion:v12];

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __67__HMDMediaDestinationController_legacyUpdateDestinationIdentifier___block_invoke(uint64_t a1, void *a2)
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
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Update destination finished with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Update destination finished", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)_updateDestinationIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      int v20 = 138543362;
      __int16 v21 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v20, 0xCu);
    }
    id v8 = [(HMDMediaDestinationController *)v10 legacyUpdateDestinationIdentifier:v4];
  }
  else
  {
    id v5 = [(HMDMediaDestinationController *)self mediaGroupParticipantDataLocalStorage];
    id v6 = v5;
    if (v5)
    {
      [v5 updateDestinationControllerDestinationIdentifier:v4];
      id v7 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
      [v7 commitValue:v4];

      id v8 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    else
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        int v20 = 138543618;
        __int16 v21 = v16;
        __int16 v22 = 2112;
        id v23 = v4;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination identifier: %@ in local storage due to no local storage found", (uint8_t *)&v20, 0x16u);
      }
      id v17 = (void *)MEMORY[0x263F58190];
      uint64_t v18 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:9008];
      id v8 = [v17 futureWithError:v18];
    }
  }

  return v8;
}

- (id)updateDestinationIdentifier:(id)a3 updateOptions:(unint64_t)a4
{
  unsigned int v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    id v11 = HMMediaDestinationControllerUpateOptionsAsString();
    int v32 = 138543874;
    __int16 v33 = v10;
    __int16 v34 = 2112;
    id v35 = v6;
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating with destination identifier: %@ support options: %@", (uint8_t *)&v32, 0x20u);
  }
  __int16 v12 = [(HMDMediaDestinationController *)v8 stagedAvailableDestinationIdentifiers];
  id v13 = [v12 value];

  if (!v6 || (v4 & 3) != 0 || ([v13 containsObject:v6] & 1) != 0)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (!v6 || (v4 & 4) != 0)
    {
      if (!v6)
      {
LABEL_23:
        id v30 = [(HMDMediaDestinationController *)v8 _updateDestinationIdentifier:v6];
        [v14 addObject:v30];
        __int16 v27 = [MEMORY[0x263F58190] chainFutures:v14];

        goto LABEL_24;
      }
    }
    else if (![(HMDMediaDestinationController *)v8 hasSetDestinationRelatedToIdentifier:v6])
    {
      [(HMDMediaDestinationController *)v8 unsetAudioGroupForCurrentDestination];
    }
    id v15 = [(HMDMediaDestinationController *)v8 dataSourceDestinationUsingRelatedIdentifier:v6];
    if (v15)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = v8;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = HMFGetLogIdentifier();
        int v32 = 138543618;
        __int16 v33 = v19;
        __int16 v34 = 2112;
        id v35 = v15;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating using related destination: %@", (uint8_t *)&v32, 0x16u);
      }
      uint64_t v20 = [v15 uniqueIdentifier];

      int v21 = 0;
      id v6 = (id)v20;
    }
    else
    {
      int v21 = (v4 >> 1) & 1;
    }

    if (!v21 && v6 && (v4 & 4) == 0)
    {
      id v28 = [(HMDMediaDestinationController *)v8 identifier];
      __int16 v29 = [(HMDMediaDestinationController *)v8 updateDestinationWithIdentifier:v6 audioGroupIdentifier:v28];
      [v14 addObject:v29];
    }
    goto LABEL_23;
  }
  __int16 v22 = (void *)MEMORY[0x230FBD990]();
  id v23 = v8;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    int v32 = 138543874;
    __int16 v33 = v25;
    __int16 v34 = 2112;
    id v35 = v6;
    __int16 v36 = 2112;
    uint64_t v37 = v13;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to update to destination identifier: %@ due to identifier not in available destination identifiers: %@", (uint8_t *)&v32, 0x20u);
  }
  os_log_type_t v26 = (void *)MEMORY[0x263F58190];
  id v14 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:9006];
  __int16 v27 = [v26 futureWithError:v14];
LABEL_24:

  return v27;
}

- (id)updateDestinationIdentifier:(id)a3
{
  return [(HMDMediaDestinationController *)self updateDestinationIdentifier:a3 updateOptions:0];
}

- (id)legacyUpdateAvailableDestinationIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaDestinationController *)self stagedAvailableDestinationIdentifiers];
  [v5 stageValue:v4 withTimeout:60.0];

  id v6 = objc_alloc_init(MEMORY[0x263F58190]);
  id v7 = [(HMDMediaDestinationController *)self backingStoreHandler];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__HMDMediaDestinationController_legacyUpdateAvailableDestinationIdentifiers___block_invoke;
  v12[3] = &unk_264A2F370;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  [v7 updateAvailableDestinationIdentifiers:v4 completion:v12];

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __77__HMDMediaDestinationController_legacyUpdateAvailableDestinationIdentifiers___block_invoke(uint64_t a1, void *a2)
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
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Update available destination identifiers finished with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Update available destination identifiers finished", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)updateAvailableDestinationIdentifiers:(id)a3
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
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating with available destination identifiers: %@", (uint8_t *)&v24, 0x16u);
  }
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = v6;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v24, 0xCu);
    }
    __int16 v12 = [(HMDMediaDestinationController *)v14 legacyUpdateAvailableDestinationIdentifiers:v4];
  }
  else
  {
    uint64_t v9 = [(HMDMediaDestinationController *)v6 mediaGroupParticipantDataLocalStorage];
    int v10 = v9;
    if (v9)
    {
      [v9 updateDestinationControllerAvailableDestinationIdentifiers:v4];
      id v11 = [(HMDMediaDestinationController *)v6 stagedAvailableDestinationIdentifiers];
      [v11 commitValue:v4];

      __int16 v12 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    else
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = v6;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        int v24 = 138543362;
        uint64_t v25 = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update available destination identifiers in local storage due to no local storage found", (uint8_t *)&v24, 0xCu);
      }
      int v21 = (void *)MEMORY[0x263F58190];
      __int16 v22 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
      __int16 v12 = [v21 futureWithError:v22];
    }
  }

  return v12;
}

- (void)stageAvailableDestinationIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v19 = v9;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Staging available destination identifiers: %@", buf, 0x16u);
  }
  int v10 = [(HMDMediaDestinationController *)v7 stagedAvailableDestinationIdentifiers];
  id v11 = [v10 value];

  uint64_t v12 = [v11 count];
  uint64_t v13 = [v5 count];
  if (v12 == v13)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__HMDMediaDestinationController_stageAvailableDestinationIdentifiers___block_invoke;
    v16[3] = &unk_264A2F348;
    id v3 = &v17;
    id v17 = v5;
    int v14 = objc_msgSend(v11, "na_allObjectsPassTest:", v16) ^ 1;
  }
  else
  {
    int v14 = 1;
  }
  id v15 = [(HMDMediaDestinationController *)v7 stagedAvailableDestinationIdentifiers];
  [v15 stageValue:v5 withTimeout:600.0];

  if (v14) {
    [(HMDMediaDestinationController *)v7 notifyDelegateDidUpdateStagedValues];
  }
  if (v12 == v13) {
}
  }

uint64_t __70__HMDMediaDestinationController_stageAvailableDestinationIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)stageDestinationIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging destination identifier: %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v9 = [(HMDMediaDestinationController *)v6 stagedDestinationIdentifier];
  int v10 = [v9 value];
  char v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", v4);

  uint64_t v12 = [(HMDMediaDestinationController *)v6 stagedDestinationIdentifier];
  [v12 stageValue:v4 withTimeout:600.0];

  uint64_t v13 = [(HMDMediaDestinationController *)v6 metricsEventDispatcher];
  [v13 startStagedDestinationIdentifierCommittedEventWithStagedDestinationIdentifier:v4];

  if ((v11 & 1) == 0) {
    [(HMDMediaDestinationController *)v6 notifyDelegateDidUpdateStagedValues];
  }
}

- (void)mergeData:(id)a3
{
  id v9 = a3;
  id v4 = [(HMDMediaDestinationController *)self backingStoreHandler];
  [v4 mergeData:v9];

  if (![(HMDMediaDestinationController *)self isTargetDevice])
  {
    id v5 = [(HMDMediaDestinationController *)self stagedDestinationIdentifier];
    id v6 = [v9 destinationIdentifier];
    [v5 commitValue:v6];

    id v7 = [(HMDMediaDestinationController *)self stagedAvailableDestinationIdentifiers];
    id v8 = [v9 availableDestinationIdentifiers];
    [v7 commitValue:v8];
  }
}

- (void)migrateSupportOptions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (isFeatureHomeTheaterQFAEnabledForTests)
  {
    if (([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
    {
      if ([(HMDMediaDestinationController *)self isTargetDevice])
      {
        unint64_t v3 = +[HMDMediaDestinationController expectedSupportOptions];
        id v4 = [(HMDMediaDestinationController *)self committedData];
        uint64_t v5 = [v4 supportedOptions];

        if (v5 != v3)
        {
          id v6 = (void *)MEMORY[0x230FBD990]();
          id v7 = self;
          id v8 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            id v9 = HMFGetLogIdentifier();
            int v10 = HMMediaDestinationControllerSupportOptionsAsString();
            *(_DWORD *)buf = 138543618;
            int v14 = v9;
            __int16 v15 = 2112;
            __int16 v16 = v10;
            _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Migrating support options: %@", buf, 0x16u);
          }
          char v11 = [(HMDMediaDestinationController *)v7 backingStoreHandler];
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __54__HMDMediaDestinationController_migrateSupportOptions__block_invoke;
          v12[3] = &unk_264A2F320;
          v12[4] = v7;
          void v12[5] = v3;
          [v11 updateSupportedOptions:v3 completion:v12];
        }
      }
    }
  }
}

void __54__HMDMediaDestinationController_migrateSupportOptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = HMMediaDestinationControllerSupportOptionsAsString();
      int v9 = 138543874;
      int v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate supported options: %@ error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)configureWithHome:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = [(HMDMediaDestinationController *)v6 committedData];
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with data: %@", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [(HMDMediaDestinationController *)v6 messageHandler];
  [v10 configureWithHome:v4];

  [(HMDMediaDestinationController *)v6 refreshDestinationController];
  [(HMDMediaDestinationController *)v6 migrateSupportOptions];
}

- (HMDMediaDestinationController)initWithBackingStoreHandler:(id)a3 messageHandler:(id)a4 metricsEventDispatcher:(id)a5 targetDevice:(BOOL)a6 dataSource:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v43 = a5;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v15)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    __int16 v33 = (HMDMediaDestinationController *)_HMFPreconditionFailure();
    return [(HMDMediaDestinationController *)v33 initWithData:v35 backingStore:v36 messageDispatcher:v37 notificationCenter:v38 logEventSubmitter:v39 dailyScheduler:v40 targetDevice:v47 dataSource:v48 delegate:v49];
  }
  __int16 v19 = v18;
  id obj = a4;
  v44 = v16;
  v45 = v15;
  __int16 v20 = [v14 data];
  id v21 = objc_alloc(MEMORY[0x263F42638]);
  uint64_t v22 = [v20 destinationIdentifier];
  id v23 = (void *)[v21 initWithValue:v22];

  id v24 = objc_alloc(MEMORY[0x263F42638]);
  uint64_t v25 = [v20 availableDestinationIdentifiers];
  __int16 v26 = (void *)[v24 initWithValue:v25];

  v46.receiver = self;
  v46.super_class = (Class)HMDMediaDestinationController;
  id v27 = [(HMDMediaDestinationController *)&v46 init];
  if (v27)
  {
    uint64_t v28 = HMFGetOSLogHandle();
    logger = v27->_logger;
    v27->_logger = (OS_os_log *)v28;

    uint64_t v30 = [v14 identifier];
    identifier = v27->_identifier;
    v27->_identifier = (NSUUID *)v30;

    objc_storeStrong((id *)&v27->_backingStoreHandler, a3);
    objc_storeStrong((id *)&v27->_messageHandler, obj);
    v27->_isTargetDevice = a6;
    objc_storeStrong((id *)&v27->_metricsEventDispatcher, v43);
    objc_storeWeak((id *)&v27->_dataSource, v17);
    objc_storeWeak((id *)&v27->_delegate, v19);
    objc_storeStrong((id *)&v27->_stagedDestinationIdentifier, v23);
    [(HMFStagedValue *)v27->_stagedDestinationIdentifier setDelegate:v27];
    objc_storeStrong((id *)&v27->_stagedAvailableDestinationIdentifiers, v26);
    [(HMFStagedValue *)v27->_stagedAvailableDestinationIdentifiers setDelegate:v27];
  }

  return v27;
}

- (HMDMediaDestinationController)initWithData:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5 notificationCenter:(id)a6 logEventSubmitter:(id)a7 dailyScheduler:(id)a8 targetDevice:(BOOL)a9 dataSource:(id)a10 delegate:(id)a11
{
  id v34 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v33 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = [HMDMediaDestinationControllerMetricsEventDispatcher alloc];
  uint64_t v25 = [v23 identifier];
  __int16 v26 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)v24 initWithIdentifier:v25 logEventSubmitter:v20 dataSource:v18];

  [v19 registerDailyTaskRunner:v26];
  id v27 = [[HMDMediaDestinationControllerBackingStoreHandler alloc] initWithData:v23 backingStore:v22 metricsEventDispatcher:v26 delegate:self];

  uint64_t v28 = [HMDMediaDestinationControllerMessageHandler alloc];
  __int16 v29 = [v23 identifier];

  uint64_t v30 = [(HMDMediaDestinationControllerMessageHandler *)v28 initWithMessageTargetUUID:v29 messageDispatcher:v21 notificationCenter:v33 metricsEventDispatcher:v26 targetDevice:a9 dataSource:self delegate:self];
  uint64_t v31 = [(HMDMediaDestinationController *)self initWithBackingStoreHandler:v27 messageHandler:v30 metricsEventDispatcher:v26 targetDevice:a9 dataSource:v18 delegate:v34];

  return v31;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t53_271551 != -1) {
    dispatch_once(&logCategory__hmf_once_t53_271551, &__block_literal_global_271552);
  }
  v2 = (void *)logCategory__hmf_once_v54_271553;
  return v2;
}

void __44__HMDMediaDestinationController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v54_271553;
  logCategory__hmf_once_v54_271553 = v0;
}

+ (unint64_t)expectedSupportOptions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (+[HMDDeviceCapabilities supportsAudioDestinationControllerCreation])
  {
    return 7;
  }
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@[HMDMediaDestinationController] Querying expected support options on unsupported device", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

@end