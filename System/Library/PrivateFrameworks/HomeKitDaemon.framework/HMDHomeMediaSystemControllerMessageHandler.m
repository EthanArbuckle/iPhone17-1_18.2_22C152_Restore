@interface HMDHomeMediaSystemControllerMessageHandler
+ (id)logCategory;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHome)home;
- (HMDHomeMediaSystemControllerMessageHandler)initWithQueue:(id)a3 home:(id)a4 messageDispatcher:(id)a5 delegate:(id)a6;
- (HMDHomeMediaSystemControllerMessageHandler)initWithQueue:(id)a3 home:(id)a4 messageDispatcher:(id)a5 delegate:(id)a6 featuresDataSource:(id)a7;
- (HMDHomeMediaSystemControllerMessageHandlerDelegate)delegate;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)queue;
- (id)homeUUID;
- (id)logIdentifier;
- (id)mediaGroupsAggregator;
- (id)mediaSystemNameFromRoomWithAccessoryUUIDs:(id)a3;
- (id)messageDestination;
- (id)messageRouter;
- (id)preProcessMediaSystemMessage:(id)a3;
- (id)preferredAssociatedGroupIdentifierForMediaSystemBuilderPayload:(id)a3;
- (id)stagingMediaSystemDataFromData:(id)a3 accessoryUUIDs:(id)a4;
- (id)unconfiguredParticipantOnboardingManager;
- (id)updateMediaSystemCompletionBlockWithMessage:(id)a3 data:(id)a4 accessoryUUIDs:(id)a5;
- (id)updateParticipantWithAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4;
- (id)updateParticipantWithDestinationManager:(id)a3 associatedGroupIdentifier:(id)a4;
- (id)validateConfiguredName:(id)a3;
- (id)validatePayload:(id)a3;
- (void)_legacyHandleAddMediaSystem:(id)a3;
- (void)_legacyHandleAddMediaSystemWithPreProcessedMessage:(id)a3;
- (void)_legacyHandleRemoveMediaSystem:(id)a3;
- (void)_legacyHandleUpdateMediaSystem:(id)a3;
- (void)_logAddMediaSystemMetricsUsingMessage:(id)a3;
- (void)_logRemoveMediaSystemMetricsUsingMessage:(id)a3;
- (void)_registerForMessages;
- (void)_routeMessage:(id)a3 localHandler:(id)a4;
- (void)locallyAddMediaSystemUsingRequestMessage:(id)a3;
- (void)locallyRemoveMediaSystemUsingRemoveRequestMessage:(id)a3;
- (void)locallyUpdateMediaSystemUsingRequestMessage:(id)a3;
- (void)queueOnboardingForUnconfiguredParticipantWithAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4;
- (void)routeAddMediaSystem:(id)a3;
- (void)routeRemoveMediaSystem:(id)a3;
- (void)routeUpdateMediaSystem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateParticipantWithDestinationIdentifier:(id)a3 associatedGroupIdentifier:(id)a4;
- (void)updateParticipantWithDestinationIdentifiers:(id)a3 associatedGroupIdentifier:(id)a4;
@end

@implementation HMDHomeMediaSystemControllerMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDHomeMediaSystemControllerMessageHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDHomeMediaSystemControllerMessageHandlerDelegate *)WeakRetained;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDHomeMediaSystemControllerMessageHandler *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  v4 = [(HMDHomeMediaSystemControllerMessageHandler *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (void)_routeMessage:(id)a3 localHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  v9 = v8;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v39 = 138543362;
      v40 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot route the message: home is nil", (uint8_t *)&v39, 0xCu);
    }
    uint64_t v19 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2018];
    goto LABEL_12;
  }
  v10 = [v8 primaryResident];
  int v11 = [v10 isConfirmed];

  v12 = [v9 primaryResident];
  v13 = [v12 device];
  int v14 = [v13 isCurrentDevice];

  if (v11 && v14)
  {
    v7[2](v7, v6);
    goto LABEL_16;
  }
  if ([v6 isRemote])
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      int v39 = 138543618;
      v40 = v23;
      __int16 v41 = 2112;
      id v42 = v6;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Only primary resident can handle remote message: %@", (uint8_t *)&v39, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3202];
LABEL_12:
    v24 = (void *)v19;
    [v6 respondWithError:v19];

    goto LABEL_16;
  }
  v25 = (void *)[v6 copy];
  v26 = (void *)[v25 mutableCopy];

  [v26 setRemote:1];
  [v26 setSecureRemote:1];
  [v26 setTimeout:45.0];
  v27 = [HMDRemoteHomeMessageDestination alloc];
  v28 = [v6 destination];
  v29 = [v28 target];
  v30 = [(HMDHomeMediaSystemControllerMessageHandler *)self homeUUID];
  v31 = [(HMDRemoteHomeMessageDestination *)v27 initWithTarget:v29 homeUUID:v30];
  [v26 setDestination:v31];

  v32 = (void *)MEMORY[0x230FBD990]();
  v33 = self;
  v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = HMFGetLogIdentifier();
    v36 = [v26 identifier];
    v37 = [v6 identifier];
    int v39 = 138543874;
    v40 = v35;
    __int16 v41 = 2112;
    id v42 = v36;
    __int16 v43 = 2112;
    v44 = v37;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Sending remote home message with identifier: %@ from local message identifier: %@", (uint8_t *)&v39, 0x20u);
  }
  v38 = [(HMDHomeMediaSystemControllerMessageHandler *)v33 messageDispatcher];
  [v38 sendMessage:v26];

LABEL_16:
}

- (void)_legacyHandleUpdateMediaSystem:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDHomeMediaSystemControllerMessageHandler *)self preProcessMediaSystemMessage:v4];
  if (v5)
  {
    id v6 = [v4 uuidForKey:*MEMORY[0x263F0EAA8]];
    v7 = [v4 stringForKey:*MEMORY[0x263F0EA80]];
    v8 = [v4 stringForKey:*MEMORY[0x263F0EA50]];
    v37 = [v4 arrayForKey:*MEMORY[0x263F0EA78]];
    if (v6)
    {
      v9 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
      v10 = [v9 validateName:v7];

      if (v10) {
        BOOL v11 = v7 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        v34 = v7;
        v35 = v6;
        v36 = v8;
        id v42 = 0;
        id v43 = 0;
        id v40 = 0;
        id v41 = 0;
        char v12 = [MEMORY[0x263F0E548] decodeComponentData:v37 leftComponentUUID:&v43 leftAccessoryUUID:&v42 rightComponentUUID:&v41 rightAccessoryUUID:&v40];
        id v13 = v43;
        id v14 = v42;
        id v15 = v41;
        id v16 = v40;
        v17 = v16;
        if (v12)
        {
          v18 = [(HMDHomeMediaSystemControllerMessageHandler *)self delegate];
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __77__HMDHomeMediaSystemControllerMessageHandler__legacyHandleUpdateMediaSystem___block_invoke;
          v38[3] = &unk_264A2E660;
          id v39 = v4;
          [v18 messageHandlerUpdateMediaSystem:v35 configuredName:v34 leftUUID:v13 leftAccessoryUUID:v14 rightUUID:v15 rightAccessoryUUID:v17 builderSession:v36 completion:v38];

          uint64_t v19 = v39;
        }
        else
        {
          id v33 = v16;
          v29 = (void *)MEMORY[0x230FBD990]();
          v30 = self;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v45 = v32;
            __int16 v46 = 2112;
            v47 = v37;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not decode components %@", buf, 0x16u);
          }
          uint64_t v19 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          [v4 respondWithError:v19];
          v17 = v33;
        }

        id v6 = v35;
        v8 = v36;
        v7 = v34;
        goto LABEL_21;
      }
      v24 = (void *)MEMORY[0x230FBD990]();
      v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v28;
        __int16 v46 = 2112;
        v47 = v7;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Name already exists %@", buf, 0x16u);
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
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v23;
        __int16 v46 = 2112;
        v47 = 0;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Message is missing mediaSystemUUID %@", buf, 0x16u);
      }
      v10 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    }
    [v4 respondWithError:v10];
LABEL_21:
  }
}

void __77__HMDHomeMediaSystemControllerMessageHandler__legacyHandleUpdateMediaSystem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) respondWithError:v6];
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      uint64_t v9 = *MEMORY[0x263F0EA58];
      v10[0] = v5;
      v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
      [v7 respondWithPayload:v8];
    }
    else
    {
      v8 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
      [v7 respondWithError:v8];
    }
  }
}

- (void)locallyUpdateMediaSystemUsingRequestMessage:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    v10 = [v4 identifier];
    BOOL v11 = [v4 messagePayload];
    *(_DWORD *)buf = 138544130;
    v58 = v8;
    __int16 v59 = 2112;
    v60 = v9;
    __int16 v61 = 2112;
    v62 = v10;
    __int16 v63 = 2112;
    v64 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Locally update media system using request message: %@(%@) payload: %@", buf, 0x2Au);
  }
  id v12 = objc_alloc(MEMORY[0x263F0E548]);
  id v13 = [v4 messagePayload];
  id v14 = (void *)[v12 initWithPayload:v13];

  uint64_t v15 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 mediaGroupsAggregator];
  id v16 = (void *)v15;
  if (v14 && v15)
  {
    v17 = [v14 uuid];
    v18 = [v16 localGroupWithIdentifier:v17];

    uint64_t v19 = [v18 mediaSystemData];
    if (v19)
    {
      uint64_t v20 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 validatePayload:v14];
      if (!v20)
      {
        v21 = (void *)[v19 mutableCopy];
        v22 = [v14 configuredName];
        v53 = v19;
        if (v22)
        {
          [v21 setName:v22];
        }
        else
        {
          v32 = [MEMORY[0x263F0E558] roomNameSentinel];
          [v21 setName:v32];
        }
        id v33 = [v14 configuredName];
        [v21 setDefaultName:v33 == 0];

        v34 = [v14 leftAccessoryUUID];
        [v21 setLeftDestinationIdentifier:v34];

        v35 = [v14 rightAccessoryUUID];
        [v21 setRightDestinationIdentifier:v35];

        v36 = [v14 leftAccessoryUUID];
        v56[0] = v36;
        v37 = [v14 rightAccessoryUUID];
        v56[1] = v37;
        v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
        [v16 updateGroup:v21 participantAccessoryUUIDs:v38];

        v50 = [v14 leftAccessoryUUID];
        v49 = [v14 uuid];
        id v39 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 updateParticipantWithAccessoryUUID:v50 associatedGroupIdentifier:v49];
        v55[0] = v39;
        [v14 rightAccessoryUUID];
        id v40 = v52 = v21;
        id v41 = [v14 uuid];
        id v42 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 updateParticipantWithAccessoryUUID:v40 associatedGroupIdentifier:v41];
        v55[1] = v42;
        v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];

        id v43 = [MEMORY[0x263F58190] chainFutures:v51];
        v44 = [v14 leftAccessoryUUID];
        v54[0] = v44;
        uint64_t v45 = [v14 rightAccessoryUUID];
        v54[1] = v45;
        __int16 v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
        v47 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 updateMediaSystemCompletionBlockWithMessage:v4 data:v52 accessoryUUIDs:v46];
        id v48 = (id)[v43 addCompletionBlock:v47];

        v31 = 0;
        uint64_t v19 = v53;
        goto LABEL_18;
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x230FBD990]();
      v28 = v6;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v58 = v30;
        __int16 v59 = 2112;
        v60 = v18;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to update media system due to missing media system group: %@", buf, 0x16u);
      }
      uint64_t v20 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    }
    v31 = (void *)v20;
    [v4 respondWithError:v20];
LABEL_18:

    goto LABEL_19;
  }
  v23 = (void *)MEMORY[0x230FBD990]();
  v24 = v6;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v58 = v26;
    __int16 v59 = 2112;
    v60 = v14;
    __int16 v61 = 2112;
    v62 = v16;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to update media system due to missing dependencies payload: %@ aggregator: %@", buf, 0x20u);
  }
  v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
  [v4 respondWithError:v18];
LABEL_19:
}

- (void)routeUpdateMediaSystem:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    v10 = [v4 identifier];
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Routing update media system message: %@(%@)", buf, 0x20u);
  }
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    BOOL v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = v6;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Home theater QFA is not enabled using legacy flows", buf, 0xCu);
    }
    [(HMDHomeMediaSystemControllerMessageHandler *)v12 _legacyHandleUpdateMediaSystem:v4];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __69__HMDHomeMediaSystemControllerMessageHandler_routeUpdateMediaSystem___block_invoke;
    v15[3] = &unk_264A2AFF0;
    v15[4] = v6;
    id v16 = v4;
    [(HMDHomeMediaSystemControllerMessageHandler *)v6 _routeMessage:v16 localHandler:v15];
  }
}

uint64_t __69__HMDHomeMediaSystemControllerMessageHandler_routeUpdateMediaSystem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) locallyUpdateMediaSystemUsingRequestMessage:*(void *)(a1 + 40)];
}

- (void)_legacyHandleRemoveMediaSystem:(id)a3
{
  id v8 = a3;
  id v4 = [v8 uuidForKey:*MEMORY[0x263F0EAA8]];
  id v5 = [v8 stringForKey:*MEMORY[0x263F0EA50]];
  id v6 = [(HMDHomeMediaSystemControllerMessageHandler *)self preProcessMediaSystemMessage:v8];
  if (v6)
  {
    v7 = [(HMDHomeMediaSystemControllerMessageHandler *)self delegate];
    [v7 messageHandlerRemoveMediaSystem:v4 builderSession:v5 message:v8];
  }
}

- (void)locallyRemoveMediaSystemUsingRemoveRequestMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    v10 = [v4 identifier];
    BOOL v11 = [v4 messagePayload];
    int v36 = 138544130;
    v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Locallying remove media system using request message: %@(%@) payload: %@", (uint8_t *)&v36, 0x2Au);
  }
  id v12 = [v4 messagePayload];
  id v13 = objc_msgSend(v12, "hmf_UUIDForKey:", *MEMORY[0x263F0EAA8]);

  if (v13)
  {
    id v14 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 mediaGroupsAggregator];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = [v14 localGroupWithIdentifier:v13];
      v17 = [v16 mediaSystemData];
      v18 = v17;
      if (v17)
      {
        __int16 v19 = [v17 associatedGroupIdentifier];
        uint64_t v20 = [v18 destinationUniqueIdentifiers];
        [(HMDHomeMediaSystemControllerMessageHandler *)v6 updateParticipantWithDestinationIdentifiers:v20 associatedGroupIdentifier:v19];

        [v15 removeGroupWithIdentifier:v13];
        [v4 respondWithSuccess];
      }
      else
      {
        v32 = (void *)MEMORY[0x230FBD990]();
        id v33 = v6;
        v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = HMFGetLogIdentifier();
          int v36 = 138543618;
          v37 = v35;
          __int16 v38 = 2112;
          id v39 = v16;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Failed to remove media system due to missing media system group: %@", (uint8_t *)&v36, 0x16u);
        }
        __int16 v19 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
        [v4 respondWithError:v19];
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x230FBD990]();
      v29 = v6;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        int v36 = 138543362;
        v37 = v31;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove media system due to no aggregator", (uint8_t *)&v36, 0xCu);
      }
      id v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
      [v4 respondWithError:v16];
    }
  }
  else
  {
    __int16 v21 = (void *)MEMORY[0x230FBD990]();
    v22 = v6;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      v25 = [v4 name];
      v26 = [v4 identifier];
      v27 = [v4 messagePayload];
      int v36 = 138544130;
      v37 = v24;
      __int16 v38 = 2112;
      id v39 = v25;
      __int16 v40 = 2112;
      id v41 = v26;
      __int16 v42 = 2112;
      id v43 = v27;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove media system due to invalid payload in request message: %@(%@) payload: %@", (uint8_t *)&v36, 0x2Au);
    }
    uint64_t v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    [v4 respondWithError:v15];
  }
}

- (void)routeRemoveMediaSystem:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Home theater QFA is not enabled using legacy flows", buf, 0xCu);
    }
    [(HMDHomeMediaSystemControllerMessageHandler *)v6 _legacyHandleRemoveMediaSystem:v4];
  }
  else
  {
    [(HMDHomeMediaSystemControllerMessageHandler *)self _logRemoveMediaSystemMetricsUsingMessage:v4];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__HMDHomeMediaSystemControllerMessageHandler_routeRemoveMediaSystem___block_invoke;
    v9[3] = &unk_264A2AFF0;
    v9[4] = self;
    id v10 = v4;
    [(HMDHomeMediaSystemControllerMessageHandler *)self _routeMessage:v10 localHandler:v9];
  }
}

uint64_t __69__HMDHomeMediaSystemControllerMessageHandler_routeRemoveMediaSystem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) locallyRemoveMediaSystemUsingRemoveRequestMessage:*(void *)(a1 + 40)];
}

- (void)_legacyHandleAddMediaSystemWithPreProcessedMessage:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:*MEMORY[0x263F0EAA8]];
  id v6 = [v4 stringForKey:*MEMORY[0x263F0EA80]];
  v7 = [v4 arrayForKey:*MEMORY[0x263F0EA78]];
  uint64_t v8 = [v4 stringForKey:*MEMORY[0x263F0EA50]];
  uint64_t v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    BOOL v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v14;
      __int16 v46 = 2112;
      v47 = v5;
      __int16 v48 = 2112;
      v49 = v9;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Message is missing required information uuid: %@, builderID: %@", buf, 0x20u);
    }
    id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    goto LABEL_19;
  }
  uint64_t v15 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v16 = [v15 validateName:v6];

  if (v16) {
    BOOL v17 = v6 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v29;
      __int16 v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Name already exists %@", buf, 0x16u);
    }
LABEL_19:
    [v4 respondWithError:v16];
    goto LABEL_24;
  }
  id v42 = 0;
  id v43 = 0;
  id v40 = 0;
  id v41 = 0;
  int v36 = v7;
  char v18 = [MEMORY[0x263F0E548] decodeComponentData:v7 leftComponentUUID:&v43 leftAccessoryUUID:&v42 rightComponentUUID:&v41 rightAccessoryUUID:&v40];
  id v37 = v43;
  id v19 = v42;
  id v20 = v41;
  id v21 = v40;
  v22 = v21;
  if (v18)
  {
    uint64_t v23 = [(HMDHomeMediaSystemControllerMessageHandler *)self delegate];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __97__HMDHomeMediaSystemControllerMessageHandler__legacyHandleAddMediaSystemWithPreProcessedMessage___block_invoke;
    v38[3] = &unk_264A2E660;
    id v39 = v4;
    [v23 messageHandlerAddMediaSystem:v5 configuredName:v6 leftUUID:v37 leftAccessoryUUID:v19 rightUUID:v20 rightAccessoryUUID:v22 builderSession:v9 completion:v38];

    v24 = v39;
  }
  else
  {
    id v34 = v21;
    id v35 = v20;
    v30 = (void *)MEMORY[0x230FBD990]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v33;
      __int16 v46 = 2112;
      v47 = v36;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not decode components %@", buf, 0x16u);
    }
    v24 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v24];
    v22 = v34;
    id v20 = v35;
  }

  v7 = v36;
LABEL_24:
}

void __97__HMDHomeMediaSystemControllerMessageHandler__legacyHandleAddMediaSystemWithPreProcessedMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) respondWithError:v6];
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      uint64_t v9 = *MEMORY[0x263F0EA58];
      v10[0] = v5;
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
      [v7 respondWithPayload:v8];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
      [v7 respondWithError:v8];
    }
  }
}

- (void)_legacyHandleAddMediaSystem:(id)a3
{
  id v4 = [(HMDHomeMediaSystemControllerMessageHandler *)self preProcessMediaSystemMessage:a3];
  if (v4)
  {
    id v5 = v4;
    [(HMDHomeMediaSystemControllerMessageHandler *)self _legacyHandleAddMediaSystemWithPreProcessedMessage:v4];
    id v4 = v5;
  }
}

- (id)homeUUID
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v4 = [v3 uuid];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to get home uuid from home: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (id)mediaGroupsAggregator
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v4 = [v3 mediaGroupsAggregator];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media groups aggregator from home: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (id)messageRouter
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v4 = [v3 primaryResidentMessageRouter];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get primary message router in home: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (id)unconfiguredParticipantOnboardingManager
{
  v2 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v3 = [v2 mediaGroupsUnconfiguredParticipantOnboardingManager];

  return v3;
}

- (void)queueOnboardingForUnconfiguredParticipantWithAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  BOOL v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = HMFGetLogIdentifier();
    int v18 = 138543874;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Queueing onboarding participant accessory uuid: %@ associated group identifier: %@", (uint8_t *)&v18, 0x20u);
  }
  int v12 = [(HMDHomeMediaSystemControllerMessageHandler *)v9 unconfiguredParticipantOnboardingManager];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 queueOnboardingParticipantWithAccessoryUUID:v6 withAssociatedGroupIdentifier:v7];
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = v9;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = HMFGetLogIdentifier();
      int v18 = 138543874;
      id v19 = v17;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to queue participant accessory uuid: %@ associated group identifier: %@ due to no onboarding manager", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (id)updateParticipantWithDestinationManager:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F58190];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __112__HMDHomeMediaSystemControllerMessageHandler_updateParticipantWithDestinationManager_associatedGroupIdentifier___block_invoke;
  v14[3] = &unk_264A2F370;
  v14[4] = self;
  id v10 = v9;
  id v15 = v10;
  [v8 requestToUpdateAudioGroupIdentifier:v7 completion:v14];

  BOOL v11 = v15;
  id v12 = v10;

  return v12;
}

void __112__HMDHomeMediaSystemControllerMessageHandler_updateParticipantWithDestinationManager_associatedGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Request to update audio groups completed with error: %@", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)updateParticipantWithAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v9 = [v8 destinationManagerWithParentIdentifier:v6];
  if (v9)
  {
    __int16 v10 = [(HMDHomeMediaSystemControllerMessageHandler *)self updateParticipantWithDestinationManager:v9 associatedGroupIdentifier:v7];
  }
  else
  {
    [(HMDHomeMediaSystemControllerMessageHandler *)self queueOnboardingForUnconfiguredParticipantWithAccessoryUUID:v6 associatedGroupIdentifier:v7];

    __int16 v10 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v10;
}

- (void)updateParticipantWithDestinationIdentifier:(id)a3 associatedGroupIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v9 = [v8 destinationManagerWithDestinationIdentifier:v6];
  if (v9
    || ([v8 destinationManagerWithParentIdentifier:v6],
        (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = [(HMDHomeMediaSystemControllerMessageHandler *)self updateParticipantWithDestinationManager:v9 associatedGroupIdentifier:v7];
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v8;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to update participant with destination identifier: %@ due to no destination manager found in home: %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)updateParticipantWithDestinationIdentifiers:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __116__HMDHomeMediaSystemControllerMessageHandler_updateParticipantWithDestinationIdentifiers_associatedGroupIdentifier___block_invoke;
  v8[3] = &unk_264A1E448;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  objc_msgSend(a3, "na_each:", v8);
}

uint64_t __116__HMDHomeMediaSystemControllerMessageHandler_updateParticipantWithDestinationIdentifiers_associatedGroupIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateParticipantWithDestinationIdentifier:a2 associatedGroupIdentifier:*(void *)(a1 + 40)];
}

- (id)mediaSystemNameFromRoomWithAccessoryUUIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(v5, "accessoryWithUUID:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          uint64_t v12 = [v11 room];
          if (v12)
          {
            __int16 v14 = v12;
            uint64_t v13 = [v12 name];

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x263F0E558], "defaultGroupName", (void)v16);
LABEL_13:

  return v13;
}

- (id)stagingMediaSystemDataFromData:(id)a3 accessoryUUIDs:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 mutableCopy];
  uint64_t v8 = [v7 name];
  uint64_t v9 = [MEMORY[0x263F0E558] roomNameSentinel];
  if ([v8 isEqualToString:v9]) {
    [(HMDHomeMediaSystemControllerMessageHandler *)self mediaSystemNameFromRoomWithAccessoryUUIDs:v6];
  }
  else {
  id v10 = [v7 name];
  }
  [v7 setName:v10];

  return v7;
}

- (id)updateMediaSystemCompletionBlockWithMessage:(id)a3 data:(id)a4 accessoryUUIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __110__HMDHomeMediaSystemControllerMessageHandler_updateMediaSystemCompletionBlockWithMessage_data_accessoryUUIDs___block_invoke;
  v16[3] = &unk_264A1B388;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  __int16 v14 = _Block_copy(v16);

  return v14;
}

void __110__HMDHomeMediaSystemControllerMessageHandler_updateMediaSystemCompletionBlockWithMessage_data_accessoryUUIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update media system participants completed with error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Update media system participants completed", buf, 0xCu);
    }
    id v13 = [*(id *)(a1 + 32) home];
    if (v13)
    {
      __int16 v14 = [*(id *)(a1 + 32) stagingMediaSystemDataFromData:*(void *)(a1 + 48) accessoryUUIDs:*(void *)(a1 + 56)];
      int v15 = [[HMDMediaSystem alloc] initWithMediaSystemData:v14 home:v13];
      long long v16 = *(void **)(a1 + 40);
      id v17 = [(HMDMediaSystem *)v15 serialize];
      v25 = v17;
      id v18 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v16 respondWithPayload:v18];
    }
    else
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 32);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create update media system response due to no home", buf, 0xCu);
      }
      id v23 = *(void **)(a1 + 40);
      __int16 v14 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v23 respondWithError:v14];
    }
  }
}

- (id)validateConfiguredName:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    __int16 v14 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get name to validate", (uint8_t *)&v30, 0xCu);
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 2;
    goto LABEL_10;
  }
  if (![v4 length] || (unint64_t v6 = objc_msgSend(v5, "length"), v6 > HMMaxLengthForNaming()))
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v30 = 138543618;
      v31 = v10;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get valid name due length of name: %@", (uint8_t *)&v30, 0x16u);
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 3;
LABEL_10:
    id v17 = [v11 hmErrorWithCode:v12];
    goto LABEL_11;
  }
  id v19 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v20 = v19;
  if (v19)
  {
    id v17 = [v19 validateName:v5];
    if (v17)
    {
      uint64_t v21 = (void *)MEMORY[0x230FBD990]();
      __int16 v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        int v30 = 138543874;
        v31 = v24;
        __int16 v32 = 2112;
        id v33 = v5;
        __int16 v34 = 2112;
        id v35 = v17;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get valid name: %@ error: %@", (uint8_t *)&v30, 0x20u);
      }
      id v25 = v17;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x230FBD990]();
    v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to get home during name validation", (uint8_t *)&v30, 0xCu);
    }
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
  }

LABEL_11:
  return v17;
}

- (id)validatePayload:(id)a3
{
  id v4 = [a3 configuredName];
  if (v4)
  {
    id v5 = [(HMDHomeMediaSystemControllerMessageHandler *)self validateConfiguredName:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)preferredAssociatedGroupIdentifierForMediaSystemBuilderPayload:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  unint64_t v6 = [v4 leftAccessoryUUID];
  uint64_t v7 = [v5 destinationManagerWithParentIdentifier:v6];

  __int16 v34 = v7;
  id v8 = [v7 destination];
  id v9 = [v8 audioGroupIdentifier];
  id v10 = [v4 rightAccessoryUUID];
  id v11 = [v5 destinationManagerWithParentIdentifier:v10];

  id v33 = v11;
  uint64_t v12 = [v11 destination];
  id v13 = [v12 audioGroupIdentifier];
  if (!v8 || !v12)
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v17 = v31 = v4;
      *(_DWORD *)buf = 138544130;
      uint64_t v36 = v17;
      __int16 v37 = 2112;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Preferred associated group will be derived without influence from missing left destination: %@ right destination: %@ in home: %@", buf, 0x2Au);

      id v4 = v31;
    }
  }
  if (v9 && v13 && ([v9 isEqual:v13] & 1) == 0)
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = id v28 = v4;
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v29;
      __int16 v37 = 2112;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v12;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Not setting a preferred group identifier due to miss matching groups on left destination: %@ right destination: %@", buf, 0x20u);

      id v4 = v28;
    }

    id v19 = 0;
  }
  else
  {
    if (v9) {
      id v18 = v9;
    }
    else {
      id v18 = v13;
    }
    id v19 = v18;
    if (v19)
    {
      id v20 = (void *)MEMORY[0x230FBD990]();
      uint64_t v21 = self;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v23 = v32 = v4;
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v23;
        __int16 v37 = 2112;
        id v38 = v19;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Setting preferred associated group identifier: %@", buf, 0x16u);

        id v4 = v32;
      }

      id v24 = v19;
    }
  }
  return v19;
}

- (void)locallyAddMediaSystemUsingRequestMessage:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  unint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 name];
    id v10 = [v4 identifier];
    id v11 = [v4 messagePayload];
    *(_DWORD *)buf = 138544130;
    v57 = v8;
    __int16 v58 = 2112;
    __int16 v59 = v9;
    __int16 v60 = 2112;
    __int16 v61 = v10;
    __int16 v62 = 2112;
    __int16 v63 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Locally add media system using request message: %@(%@) payload: %@", buf, 0x2Au);
  }
  id v12 = objc_alloc(MEMORY[0x263F0E548]);
  id v13 = [v4 messagePayload];
  __int16 v14 = (void *)[v12 initWithPayload:v13];

  int v15 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 homeUUID];
  uint64_t v16 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 mediaGroupsAggregator];
  id v17 = (void *)v16;
  if (!v14 || !v15 || !v16)
  {
    __int16 v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = v6;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v57 = v25;
      __int16 v58 = 2112;
      __int16 v59 = v14;
      __int16 v60 = 2112;
      __int16 v61 = v17;
      __int16 v62 = 2112;
      __int16 v63 = v15;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to add media system due to missing dependencies payload: %@ aggregator: %@ homeUUID: %@", buf, 0x2Au);
    }
    uint64_t v18 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
    goto LABEL_12;
  }
  uint64_t v18 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 validatePayload:v14];
  if (v18)
  {
LABEL_12:
    v26 = (void *)v18;
    [v4 respondWithError:v18];
    goto LABEL_13;
  }
  id v19 = [v14 configuredName];
  id v20 = v19;
  v51 = v17;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [MEMORY[0x263F0E558] roomNameSentinel];
  }
  v52 = v21;

  v27 = [v14 configuredName];
  BOOL v28 = v27 == 0;

  id v29 = objc_alloc(MEMORY[0x263F0E558]);
  int v30 = [v14 uuid];
  id v31 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 preferredAssociatedGroupIdentifierForMediaSystemBuilderPayload:v14];
  id v32 = [v14 leftAccessoryUUID];
  id v33 = [v14 rightAccessoryUUID];
  uint64_t v50 = (void *)[v29 initWithIdentifier:v30 parentIdentifier:v15 name:v52 defaultName:v28 associatedGroupIdentifier:v31 leftDestinationIdentifier:v32 rightDestinationIdentifier:v33];

  __int16 v34 = [v14 leftAccessoryUUID];
  v55[0] = v34;
  id v35 = [v14 rightAccessoryUUID];
  v55[1] = v35;
  uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
  id v17 = v51;
  [v51 updateGroup:v50 participantAccessoryUUIDs:v36];

  __int16 v48 = [v14 leftAccessoryUUID];
  v47 = [v14 uuid];
  __int16 v37 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 updateParticipantWithAccessoryUUID:v48 associatedGroupIdentifier:v47];
  v54[0] = v37;
  id v38 = [v14 rightAccessoryUUID];
  __int16 v39 = [v14 uuid];
  id v40 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 updateParticipantWithAccessoryUUID:v38 associatedGroupIdentifier:v39];
  v54[1] = v40;
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];

  __int16 v41 = [MEMORY[0x263F58190] chainFutures:v49];
  id v42 = [v14 leftAccessoryUUID];
  v53[0] = v42;
  uint64_t v43 = [v14 rightAccessoryUUID];
  v53[1] = v43;
  uint64_t v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
  uint64_t v45 = [(HMDHomeMediaSystemControllerMessageHandler *)v6 updateMediaSystemCompletionBlockWithMessage:v4 data:v50 accessoryUUIDs:v44];
  id v46 = (id)[v41 addCompletionBlock:v45];

  v26 = 0;
LABEL_13:
}

- (void)_logRemoveMediaSystemMetricsUsingMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  unint64_t v6 = [v4 messagePayload];
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F0EAA8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    int v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        id v17 = [v4 name];
        int v24 = 138543874;
        id v25 = v16;
        __int16 v26 = 2112;
        id v27 = v17;
        __int16 v28 = 2112;
        id v29 = v11;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Received %@ message for media system UUID: %@", (uint8_t *)&v24, 0x20u);
      }
      uint64_t v18 = [v5 mediaSystemSetupMetricDispatcher];
      [v18 markRequestReceivedForGroupIdentifier:v11 metricType:2 setupSessionIdentifier:0 setupSessionStartTimeMS:0];
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        int v24 = 138543618;
        id v25 = v23;
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Message %@ payload does not contain valid media system UUID", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      int v24 = 138543874;
      id v25 = v22;
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@home: %@ or payload: %@ is nil", (uint8_t *)&v24, 0x20u);
    }
  }
}

- (void)_logAddMediaSystemMetricsUsingMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v6 = objc_alloc(MEMORY[0x263F0E548]);
  uint64_t v7 = [v4 messagePayload];
  id v8 = (void *)[v6 initWithPayload:v7];

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v5 && v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      __int16 v14 = [v4 name];
      *(_DWORD *)buf = 138543874;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received %@ message for media system builder payload %@", buf, 0x20u);
    }
    int v15 = [v5 homeManager];
    double v25 = 0.0;
    uint64_t v16 = [v15 firstSetupSessionIdentifierOutputStartTime:&v25];
    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v10;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Found associated setup session identifier %@ during media system grouping", buf, 0x16u);
    }
    unint64_t v21 = 1000 * (unint64_t)v25;
    __int16 v22 = [v5 mediaSystemSetupMetricDispatcher];
    id v23 = [v8 uuid];
    [v22 markRequestReceivedForGroupIdentifier:v23 metricType:1 setupSessionIdentifier:v16 setupSessionStartTimeMS:v21];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v27 = v24;
      __int16 v28 = 2112;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home: %@ or media system builder payload: %@ is nil", buf, 0x20u);
    }
  }
}

- (void)routeAddMediaSystem:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 name];
    id v10 = [v4 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Routing add media system message: %@(%@)", buf, 0x20u);
  }
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = v6;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Home theater QFA is not enabled using legacy flows", buf, 0xCu);
    }
    [(HMDHomeMediaSystemControllerMessageHandler *)v12 _legacyHandleAddMediaSystem:v4];
  }
  else
  {
    [(HMDHomeMediaSystemControllerMessageHandler *)v6 _logAddMediaSystemMetricsUsingMessage:v4];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __66__HMDHomeMediaSystemControllerMessageHandler_routeAddMediaSystem___block_invoke;
    v15[3] = &unk_264A2AFF0;
    v15[4] = v6;
    id v16 = v4;
    [(HMDHomeMediaSystemControllerMessageHandler *)v6 _routeMessage:v16 localHandler:v15];
  }
}

uint64_t __66__HMDHomeMediaSystemControllerMessageHandler_routeAddMediaSystem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) locallyAddMediaSystemUsingRequestMessage:*(void *)(a1 + 40)];
}

- (id)preProcessMediaSystemMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  if (![v5 isSharedAdmin]) {
    goto LABEL_6;
  }
  id v6 = [v5 primaryResident];
  uint64_t v7 = v6;
  if (v6 && ([v6 isReachable] & 1) != 0)
  {
    if ([v7 supportsMediaSystem])
    {

LABEL_6:
      objc_initWeak((id *)location, self);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __75__HMDHomeMediaSystemControllerMessageHandler_preProcessMediaSystemMessage___block_invoke;
      aBlock[3] = &unk_264A2E890;
      objc_copyWeak(&v25, (id *)location);
      id v8 = v4;
      id v23 = v8;
      id v24 = v5;
      id v9 = _Block_copy(aBlock);
      id v10 = (void *)[v8 mutableCopy];
      id v11 = [v8 identifier];
      [v10 setIdentifier:v11];

      [v10 setResponseHandler:v9];
      objc_msgSend(v10, "setRemote:", objc_msgSend(v8, "isRemote"));
      id v12 = (void *)[v10 copy];

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)location);
      goto LABEL_11;
    }
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v21;
      __int16 v27 = 2112;
      __int16 v28 = v7;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident device does not support media system: %@", location, 0x16u);
    }
    uint64_t v17 = 92;
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    __int16 v14 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v16;
      __int16 v27 = 2112;
      __int16 v28 = v7;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident device isn't available or reachable: %@", location, 0x16u);
    }
    uint64_t v17 = 91;
  }

  uint64_t v18 = [MEMORY[0x263F087E8] hmErrorWithCode:v17];
  [v4 respondWithError:v18];

  id v12 = 0;
LABEL_11:

  return v12;
}

void __75__HMDHomeMediaSystemControllerMessageHandler_preProcessMediaSystemMessage___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && !v5 && [a1[5] isSharedAdmin])
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = a1[4];
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Relaying the message %@", (uint8_t *)&v17, 0x16u);
    }
    id v13 = [a1[5] administratorHandler];
    __int16 v14 = [v13 operationForMessage:a1[4] error:0];
    if (v14) {
      [v13 addOperation:v14];
    }
  }
  int v15 = [a1[4] responseHandler];

  if (v15)
  {
    id v16 = [a1[4] responseHandler];
    ((void (**)(void, id, id))v16)[2](v16, v5, v6);
  }
}

- (void)_registerForMessages
{
  v9[3] = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeMediaSystemControllerMessageHandler *)self home];
  id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  id v6 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:4 remoteAccessRequired:0];
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  id v8 = [(HMDHomeMediaSystemControllerMessageHandler *)self messageDispatcher];
  [v8 registerForMessage:*MEMORY[0x263F0E970] receiver:self policies:v7 selector:sel_routeAddMediaSystem_];
  [v8 registerForMessage:*MEMORY[0x263F0EAC0] receiver:self policies:v7 selector:sel_routeRemoveMediaSystem_];
}

- (HMDHomeMediaSystemControllerMessageHandler)initWithQueue:(id)a3 home:(id)a4 messageDispatcher:(id)a5 delegate:(id)a6 featuresDataSource:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDHomeMediaSystemControllerMessageHandler;
  uint64_t v18 = [(HMDHomeMediaSystemControllerMessageHandler *)&v21 init];
  __int16 v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeWeak((id *)&v19->_home, v14);
    objc_storeStrong((id *)&v19->_messageDispatcher, a5);
    objc_storeWeak((id *)&v19->_delegate, v16);
    objc_storeStrong((id *)&v19->_featuresDataSource, a7);
    [(HMDHomeMediaSystemControllerMessageHandler *)v19 _registerForMessages];
  }

  return v19;
}

- (HMDHomeMediaSystemControllerMessageHandler)initWithQueue:(id)a3 home:(id)a4 messageDispatcher:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(HMDFeaturesDataSource);
  id v15 = [(HMDHomeMediaSystemControllerMessageHandler *)self initWithQueue:v13 home:v12 messageDispatcher:v11 delegate:v10 featuresDataSource:v14];

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50_57202 != -1) {
    dispatch_once(&logCategory__hmf_once_t50_57202, &__block_literal_global_57203);
  }
  v2 = (void *)logCategory__hmf_once_v51_57204;
  return v2;
}

void __57__HMDHomeMediaSystemControllerMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v51_57204;
  logCategory__hmf_once_v51_57204 = v0;
}

@end