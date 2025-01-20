@interface HMDAccessCodeManager
+ (id)logCategory;
- (BOOL)_redispatchToResidentIfNeccesaryForMessage:(id)a3 withNewResponseHandler:(id)a4;
- (BOOL)hasCurrentUserAccessCodeChangedWithChangedAccessCodes:(id)a3 home:(id)a4;
- (BOOL)isHomeAppForegrounded;
- (Class)utilities;
- (HMDAccessCodeDataManager)dataManager;
- (HMDAccessCodeManager)initWithContext:(id)a3;
- (HMDAccessCodeManager)initWithContext:(id)a3 utilities:(Class)a4 accessoryReaderWriter:(id)a5 dataManager:(id)a6;
- (HMDAccessCodeManagerContext)context;
- (HMDAccessoryAccessCodeReaderWriter)accessoryReaderWriter;
- (NSHashTable)subscribedClientConnections;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)_accessCodeForUserWithUUID:(id)a3 inHome:(id)a4;
- (id)_addNewAccessCode:(id)a3 forUserWithUUID:(id)a4 toAccessoriesWithUUIDs:(id)a5 withRetries:(BOOL)a6;
- (id)_createNewAccessCodeForUserWithUUID:(id)a3;
- (id)_filterModificationRequestsForPrivilege:(id)a3;
- (id)_removeAccessCode:(id)a3 forUser:(id)a4 removedByUserUUID:(id)a5;
- (id)_removeAccessCode:(id)a3 forUserBeingRemoved:(id)a4;
- (id)_removeAccessCode:(id)a3 forUserWithUUID:(id)a4 removedByUserUUID:(id)a5;
- (id)_removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:(id)a3 forUserUUID:(id)a4;
- (id)_resetAccessCodesForHomeAccessCode:(id)a3;
- (id)_updateAccessCode:(id)a3 toNewValue:(id)a4 onAccessoriesWithFetchResponses:(id)a5 withRetries:(BOOL)a6;
- (id)_updateModificationRequestsWithUserOrGuestNames:(id)a3;
- (id)_waitUntilDataHasSyncedToResidentForAccessoryUUIDs:(id)a3;
- (id)_waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:(id)a3;
- (id)addNewAccessCode:(id)a3 forUserWithUUID:(id)a4 toAccessoriesWithUUIDs:(id)a5 withRetries:(BOOL)a6;
- (id)logIdentifier;
- (id)removeAccessCode:(id)a3 fromHAPAccessory:(id)a4;
- (void)_fetchAccessCodeConstraintsForMessage:(id)a3;
- (void)_fetchAccessCodesForMessage:(id)a3;
- (void)_generateNewAccessCodeWithCompletion:(id)a3;
- (void)_generateNewUserAccessCodeForMessage:(id)a3;
- (void)_notifySubscribersOfMessageWithName:(id)a3 payload:(id)a4;
- (void)_removeSimpleLabelAccessCodeMessage:(id)a3;
- (void)_resetAccessoryAccessCodesForMessage:(id)a3;
- (void)_setAccessCodeForUserForMessage:(id)a3;
- (void)_submitAccessCodeModificationRequestsForMessage:(id)a3;
- (void)_updateAccessoryAccessCodeCache;
- (void)_updateCacheWithModificationResponses:(id)a3;
- (void)accessCodeDataManager:(id)a3 didAddAccessoryAccessCodes:(id)a4;
- (void)accessCodeDataManager:(id)a3 didAddHomeAccessCodes:(id)a4 addedByUserUUID:(id)a5;
- (void)accessCodeDataManager:(id)a3 didRemoveAccessoryAccessCodes:(id)a4;
- (void)accessCodeDataManager:(id)a3 didRemoveHomeAccessCodes:(id)a4 removedByUserUUID:(id)a5;
- (void)accessCodeDataManager:(id)a3 didUpdateAccessoryAccessCodes:(id)a4;
- (void)accessCodeDataManager:(id)a3 didUpdateHomeAccessCodes:(id)a4 changedByUserUUID:(id)a5;
- (void)configureWithMessageDispatcher:(id)a3;
- (void)fetchAccessCodeForIdentifier:(id)a3 accessoryUUID:(id)a4 completion:(id)a5;
- (void)handleAccessorySupportsAccessCodeDidChangeNotification:(id)a3;
- (void)handleConfirmDataHasSyncedToResidentMessage:(id)a3;
- (void)handleFetchAccessCodeConstraintsMessage:(id)a3;
- (void)handleFetchAccessCodesMessage:(id)a3;
- (void)handleFetchCachedAccessCodesMessage:(id)a3;
- (void)handleFetchHomeAccessCodesMessage:(id)a3;
- (void)handleGenerateNewUserAccessCodeMessage:(id)a3;
- (void)handleHomeDidDisableCharacteristicNotification:(id)a3;
- (void)handleHomeDidEnableCharacteristicNotification:(id)a3;
- (void)handleHomeUserRemovedNotification:(id)a3;
- (void)handleRemoveHomeAccessCodeMessage:(id)a3;
- (void)handleRemoveSimpleLabelAccessCodeMessage:(id)a3;
- (void)handleResetAccessoryAccessCodesMessage:(id)a3;
- (void)handleSetAccessCodeForUserMessage:(id)a3;
- (void)handleSetUserInformationMessage:(id)a3;
- (void)handleSubmitAccessCodeModificationRequestsMessage:(id)a3;
- (void)handleSubscribeMessage:(id)a3;
- (void)handleUnsubscribeMessage:(id)a3;
- (void)handleUserAccessCodeDidChangeMessage:(id)a3;
- (void)setHomeAppForegrounded:(BOOL)a3;
- (void)unconfigure;
@end

@implementation HMDAccessCodeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedClientConnections, 0);
  objc_storeStrong((id *)&self->_accessoryReaderWriter, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
}

- (NSHashTable)subscribedClientConnections
{
  return (NSHashTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHomeAppForegrounded:(BOOL)a3
{
  self->_homeAppForegrounded = a3;
}

- (BOOL)isHomeAppForegrounded
{
  return self->_homeAppForegrounded;
}

- (HMDAccessoryAccessCodeReaderWriter)accessoryReaderWriter
{
  return (HMDAccessoryAccessCodeReaderWriter *)objc_getProperty(self, a2, 40, 1);
}

- (Class)utilities
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (HMDAccessCodeManagerContext)context
{
  return (HMDAccessCodeManagerContext *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAccessCodeDataManager)dataManager
{
  return (HMDAccessCodeDataManager *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)messageReceiveQueue
{
  v2 = [(HMDAccessCodeManager *)self context];
  v3 = [v2 workQueue];

  return (OS_dispatch_queue *)v3;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDAccessCodeManager *)self context];
  v3 = [v2 UUID];

  return (NSUUID *)v3;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessCodeManager *)self context];
  v3 = [v2 UUID];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)accessCodeDataManager:(id)a3 didRemoveAccessoryAccessCodes:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(HMDAccessCodeManager *)self context];
  v7 = [v6 workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x263F0AE50];
  uint64_t v11 = *MEMORY[0x263F0AEC8];
  v9 = encodeRootObjectForIncomingXPCMessage(v5, 0);

  v12[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [(HMDAccessCodeManager *)self _notifySubscribersOfMessageWithName:v8 payload:v10];
}

- (void)accessCodeDataManager:(id)a3 didUpdateAccessoryAccessCodes:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(HMDAccessCodeManager *)self context];
  v7 = [v6 workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x263F0AE60];
  uint64_t v11 = *MEMORY[0x263F0AEC8];
  v9 = encodeRootObjectForIncomingXPCMessage(v5, 0);

  v12[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [(HMDAccessCodeManager *)self _notifySubscribersOfMessageWithName:v8 payload:v10];
}

- (void)accessCodeDataManager:(id)a3 didAddAccessoryAccessCodes:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(HMDAccessCodeManager *)self context];
  v7 = [v6 workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x263F0AE40];
  uint64_t v11 = *MEMORY[0x263F0AEC8];
  v9 = encodeRootObjectForIncomingXPCMessage(v5, 0);

  v12[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [(HMDAccessCodeManager *)self _notifySubscribersOfMessageWithName:v8 payload:v10];
}

- (void)accessCodeDataManager:(id)a3 didRemoveHomeAccessCodes:(id)a4 removedByUserUUID:(id)a5
{
  id v6 = a4;
  v7 = [(HMDAccessCodeManager *)self context];
  uint64_t v8 = [v7 workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__HMDAccessCodeManager_accessCodeDataManager_didRemoveHomeAccessCodes_removedByUserUUID___block_invoke;
  v10[3] = &unk_264A2F820;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);
}

void __89__HMDAccessCodeManager_accessCodeDataManager_didRemoveHomeAccessCodes_removedByUserUUID___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0AE58];
  uint64_t v10 = *MEMORY[0x263F0AEE0];
  v3 = *(void **)(a1 + 32);
  v4 = encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 40), 0);
  v11[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v3 _notifySubscribersOfMessageWithName:v2 payload:v5];

  id v6 = [*(id *)(a1 + 32) context];
  v7 = [v6 home];

  if (v7
    && [*(id *)(a1 + 32) hasCurrentUserAccessCodeChangedWithChangedAccessCodes:*(void *)(a1 + 40) home:v7])
  {
    uint64_t v8 = [*(id *)(a1 + 32) context];
    id v9 = [v8 walletKeyManager];
    [v9 handleAccessCodeChanged];
  }
  if ([*(id *)(a1 + 32) isHomeAppForegrounded]) {
    [*(id *)(a1 + 32) _updateAccessoryAccessCodeCache];
  }
}

- (void)accessCodeDataManager:(id)a3 didUpdateHomeAccessCodes:(id)a4 changedByUserUUID:(id)a5
{
  id v6 = a4;
  v7 = [(HMDAccessCodeManager *)self context];
  uint64_t v8 = [v7 workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__HMDAccessCodeManager_accessCodeDataManager_didUpdateHomeAccessCodes_changedByUserUUID___block_invoke;
  v10[3] = &unk_264A2F820;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);
}

void __89__HMDAccessCodeManager_accessCodeDataManager_didUpdateHomeAccessCodes_changedByUserUUID___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0AE68];
  uint64_t v10 = *MEMORY[0x263F0AEE0];
  v3 = *(void **)(a1 + 32);
  v4 = encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 40), 0);
  v11[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v3 _notifySubscribersOfMessageWithName:v2 payload:v5];

  id v6 = [*(id *)(a1 + 32) context];
  v7 = [v6 home];

  if (v7
    && [*(id *)(a1 + 32) hasCurrentUserAccessCodeChangedWithChangedAccessCodes:*(void *)(a1 + 40) home:v7])
  {
    uint64_t v8 = [*(id *)(a1 + 32) context];
    id v9 = [v8 walletKeyManager];
    [v9 handleAccessCodeChanged];
  }
  if ([*(id *)(a1 + 32) isHomeAppForegrounded]) {
    [*(id *)(a1 + 32) _updateAccessoryAccessCodeCache];
  }
}

- (void)accessCodeDataManager:(id)a3 didAddHomeAccessCodes:(id)a4 addedByUserUUID:(id)a5
{
  id v6 = a4;
  v7 = [(HMDAccessCodeManager *)self context];
  uint64_t v8 = [v7 workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__HMDAccessCodeManager_accessCodeDataManager_didAddHomeAccessCodes_addedByUserUUID___block_invoke;
  v10[3] = &unk_264A2F820;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);
}

void __84__HMDAccessCodeManager_accessCodeDataManager_didAddHomeAccessCodes_addedByUserUUID___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0AE48];
  uint64_t v10 = *MEMORY[0x263F0AEE0];
  v3 = *(void **)(a1 + 32);
  v4 = encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 40), 0);
  v11[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v3 _notifySubscribersOfMessageWithName:v2 payload:v5];

  id v6 = [*(id *)(a1 + 32) context];
  v7 = [v6 home];

  if (v7
    && [*(id *)(a1 + 32) hasCurrentUserAccessCodeChangedWithChangedAccessCodes:*(void *)(a1 + 40) home:v7])
  {
    uint64_t v8 = [*(id *)(a1 + 32) context];
    id v9 = [v8 walletKeyManager];
    [v9 handleAccessCodeChanged];
  }
  if ([*(id *)(a1 + 32) isHomeAppForegrounded]) {
    [*(id *)(a1 + 32) _updateAccessoryAccessCodeCache];
  }
}

- (id)_waitUntilDataHasSyncedToResidentForAccessoryUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F58190];
  id v6 = [(HMDAccessCodeManager *)self context];
  uint64_t v7 = [v6 residentDataSyncVerificationRetries];
  uint64_t v8 = [(HMDAccessCodeManager *)self context];
  [v8 residentDataSyncVerificationRetryTimeInterval];
  double v10 = v9;
  id v11 = [(HMDAccessCodeManager *)self context];
  v12 = [v11 workQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__HMDAccessCodeManager__waitUntilDataHasSyncedToResidentForAccessoryUUIDs___block_invoke;
  v16[3] = &unk_264A15048;
  v16[4] = self;
  id v17 = v4;
  id v13 = v4;
  v14 = [v5 futureWithRetries:v7 timeInterval:v12 workQueue:v16 block:v10];

  return v14;
}

id __75__HMDAccessCodeManager__waitUntilDataHasSyncedToResidentForAccessoryUUIDs___block_invoke(uint64_t a1)
{
  v31[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F58190]);
  id v3 = objc_alloc(MEMORY[0x263F42590]);
  id v4 = objc_alloc(MEMORY[0x263F42570]);
  id v5 = [*(id *)(a1 + 32) messageTargetUUID];
  id v6 = (void *)[v4 initWithTarget:v5];
  uint64_t v30 = *MEMORY[0x263F0AED0];
  uint64_t v7 = encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 40), 0);
  v31[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  double v9 = (void *)[v3 initWithName:@"HMAccessCodeManagerConfirmDataHasSyncedToResidentMessage" qualityOfService:33 destination:v6 payload:v8];

  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __75__HMDAccessCodeManager__waitUntilDataHasSyncedToResidentForAccessoryUUIDs___block_invoke_2;
  v23 = &unk_264A2D870;
  uint64_t v24 = *(void *)(a1 + 32);
  id v10 = v2;
  id v25 = v10;
  id v11 = (void *)MEMORY[0x230FBD990]([v9 setResponseHandler:&v20]);
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v27 = v14;
    __int16 v28 = 2112;
    uint64_t v29 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Pinging resident to confirm data has synced for accessories: %@", buf, 0x16u);
  }
  v16 = objc_msgSend(*(id *)(a1 + 32), "context", v20, v21, v22, v23, v24);
  [v16 redispatchToResidentMessage:v9];

  id v17 = v25;
  id v18 = v10;

  return v18;
}

void __75__HMDAccessCodeManager__waitUntilDataHasSyncedToResidentForAccessoryUUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  double v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to confirm resident has data with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else
  {
    if (v10)
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Resident confirmed that data has synced", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)_waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  int v6 = [v5 isCurrentDevicePrimaryResident];

  if (!v6)
  {
    uint64_t v7 = [(HMDAccessCodeManager *)self context];
    if ([v7 primaryResidentSupportsAccessCodes])
    {
      id v8 = [(HMDAccessCodeManager *)self context];
      double v9 = [v8 residentCommunicationHandlerPreferredDevice];

      if (v9)
      {
        uint64_t v10 = [(HMDAccessCodeManager *)self _waitUntilDataHasSyncedToResidentForAccessoryUUIDs:v4];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v10 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_7:
  id v11 = (void *)v10;

  return v11;
}

- (void)_updateAccessoryAccessCodeCache
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  id v4 = [(HMDAccessCodeManager *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  int v6 = (void *)MEMORY[0x263F42590];
  uint64_t v7 = *MEMORY[0x263F0AE78];
  uint64_t v13 = *MEMORY[0x263F0AED0];
  id v8 = [(HMDAccessCodeManager *)self context];
  double v9 = [v8 UUIDsOfAccessoriesSupportingAccessCodes];
  uint64_t v10 = encodeRootObject();
  v14[0] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v12 = [v6 messageWithName:v7 destination:v5 payload:v11];

  [(HMDAccessCodeManager *)self handleFetchAccessCodesMessage:v12];
}

- (id)_accessCodeForUserWithUUID:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 users];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__HMDAccessCodeManager__accessCodeForUserWithUUID_inHome___block_invoke;
  v16[3] = &unk_264A2DB60;
  id v8 = v6;
  id v17 = v8;
  double v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v16);
  uint64_t v10 = [v9 accessCode];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v12 = [(HMDAccessCodeManager *)self dataManager];
    uint64_t v13 = [v12 homeAccessCodeWithRemovedUserInfoWithUUID:v8];
    v14 = [v13 accessCodeValue];
    id v11 = [v14 stringValue];
  }
  return v11;
}

uint64_t __58__HMDAccessCodeManager__accessCodeForUserWithUUID_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 uuid];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

- (void)_generateNewAccessCodeWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Generating new access code", buf, 0xCu);
  }
  double v9 = [(HMDAccessCodeManager *)v6 accessoryReaderWriter];
  uint64_t v10 = [(HMDAccessCodeManager *)v6 context];
  id v11 = [v10 UUIDsOfAccessoriesSupportingAccessCodes];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke;
  v13[3] = &unk_264A14D68;
  v13[4] = v6;
  id v14 = v4;
  id v12 = v4;
  [v9 readConstraintsAndAccessCodesFromAccessoriesWithUUIDs:v11 completion:v13];
}

void __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    id v8 = objc_msgSend(v5, "na_map:", &__block_literal_global_384);
    double v9 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_387);
    uint64_t v10 = [*(id *)(a1 + 32) dataManager];
    id v11 = [v10 homeAccessCodeValues];
    id v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_393);

    uint64_t v13 = [*(id *)(a1 + 32) context];
    id v14 = [v13 generateAccessCodeValueFromConstraints:v8 accessoryAccessCodes:v9 homeAccessCodes:v12];

    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = HMFGetOSLogHandle();
    id v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = uint64_t v30 = v9;
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully generated new access code", buf, 0xCu);

        double v9 = v30;
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v31 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v33 = v27;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate new access code", buf, 0xCu);
      }
      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v29 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
      (*(void (**)(uint64_t, void, void, void *))(v28 + 16))(v28, 0, 0, v29);

      double v9 = v31;
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      uint64_t v24 = [*(id *)(a1 + 32) context];
      id v25 = [v24 UUIDsOfAccessoriesSupportingAccessCodes];
      *(_DWORD *)buf = 138544130;
      v33 = v23;
      __int16 v34 = 2112;
      id v35 = v5;
      __int16 v36 = 2112;
      v37 = v7;
      __int16 v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to read constraints: %@, and access codes: %@, from accessories with UUIDs: %@", buf, 0x2Au);
    }
    uint64_t v26 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*(void (**)(uint64_t, void, void, void *))(v26 + 16))(v26, 0, 0, v8);
  }
}

id __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 accessCodeValue];
  uint64_t v3 = [v2 stringValue];

  return v3;
}

id __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 accessoryAccessCodeValues];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_390);

  return v3;
}

id __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 accessCodeValue];
  uint64_t v3 = [v2 stringValue];

  return v3;
}

uint64_t __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke_381(uint64_t a1, void *a2)
{
  return [a2 constraints];
}

- (id)_addNewAccessCode:(id)a3 forUserWithUUID:(id)a4 toAccessoriesWithUUIDs:(id)a5 withRetries:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  __int16 v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v16;
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Adding new access code to accessories with UUIDs: %@", buf, 0x16u);
  }
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  id v25 = __93__HMDAccessCodeManager__addNewAccessCode_forUserWithUUID_toAccessoriesWithUUIDs_withRetries___block_invoke;
  uint64_t v26 = &unk_264A14CC0;
  id v27 = v10;
  id v28 = v11;
  id v17 = v11;
  id v18 = v10;
  v19 = objc_msgSend(v12, "na_map:", &v23);
  uint64_t v20 = [(HMDAccessCodeManager *)v14 accessoryReaderWriter];
  id v21 = [v20 performAccessCodeModificationRequests:v19 withRetries:v6];

  return v21;
}

id __93__HMDAccessCodeManager__addNewAccessCode_forUserWithUUID_toAccessoriesWithUUIDs_withRetries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F0DEB0];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithAccessCodeValue:*(void *)(a1 + 32) accessoryUUID:v4];

  [v5 setUserUUID:*(void *)(a1 + 40)];
  return v5;
}

- (id)addNewAccessCode:(id)a3 forUserWithUUID:(id)a4 toAccessoriesWithUUIDs:(id)a5 withRetries:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_new();
  id v14 = [(HMDAccessCodeManager *)self context];
  __int16 v15 = [v14 workQueue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __92__HMDAccessCodeManager_addNewAccessCode_forUserWithUUID_toAccessoriesWithUUIDs_withRetries___block_invoke;
  v23[3] = &unk_264A25E60;
  v23[4] = self;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  BOOL v28 = a6;
  id v16 = v13;
  id v27 = v16;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, v23);

  uint64_t v20 = v27;
  id v21 = v16;

  return v21;
}

void __92__HMDAccessCodeManager_addNewAccessCode_forUserWithUUID_toAccessoriesWithUUIDs_withRetries___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _addNewAccessCode:*(void *)(a1 + 40) forUserWithUUID:*(void *)(a1 + 48) toAccessoriesWithUUIDs:*(void *)(a1 + 56) withRetries:*(unsigned __int8 *)(a1 + 72)];
  id v2 = [*(id *)(a1 + 64) completionHandlerAdapter];
  id v3 = (id)[v4 addCompletionBlock:v2];
}

- (id)_updateAccessCode:(id)a3 toNewValue:(id)a4 onAccessoriesWithFetchResponses:(id)a5 withRetries:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke;
  v23[3] = &unk_264A14C70;
  id v24 = v9;
  id v11 = v9;
  id v12 = objc_msgSend(a5, "na_map:", v23);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke_3;
  id v21 = &unk_264A14C98;
  id v22 = v10;
  id v13 = v10;
  id v14 = objc_msgSend(v12, "na_map:", &v18);
  __int16 v15 = [(HMDAccessCodeManager *)self accessoryReaderWriter];
  id v16 = [v15 performAccessCodeModificationRequests:v14 withRetries:1];

  return v16;
}

id __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryAccessCodeValues];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke_2;
  v6[3] = &unk_264A26770;
  id v7 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v6);

  return v4;
}

id __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F0DEE0];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithAccessoryAccessCodeValue:v4 updatedAccessCodeValue:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accessCodeValue];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_resetAccessCodesForHomeAccessCode:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting access codes for home access code: %@", buf, 0x16u);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F58190]);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__HMDAccessCodeManager__resetAccessCodesForHomeAccessCode___block_invoke;
  v15[3] = &unk_264A14C48;
  id v10 = v9;
  id v16 = v10;
  id v17 = v6;
  id v18 = v4;
  id v11 = v4;
  [(HMDAccessCodeManager *)v6 _generateNewAccessCodeWithCompletion:v15];
  id v12 = v18;
  id v13 = v10;

  return v13;
}

void __59__HMDAccessCodeManager__resetAccessCodesForHomeAccessCode___block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
    id v9 = [a1[5] dataManager];
    id v10 = [a1[6] userInformationValue];
    id v11 = [a1[6] accessCodeValue];
    id v12 = [v9 updateUserInformation:v10 forHomeAccessCodeWithOldValue:v11 newAccessCodeValue:v7];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __59__HMDAccessCodeManager__resetAccessCodesForHomeAccessCode___block_invoke_2;
    uint64_t v20 = &unk_264A14C20;
    id v13 = a1[6];
    id v21 = a1[5];
    id v22 = v13;
    id v23 = v7;
    id v24 = v8;
    id v14 = [v12 flatMap:&v17];
    __int16 v15 = objc_msgSend(a1[4], "completionHandlerAdapter", v17, v18, v19, v20, v21);
    id v16 = (id)[v14 addCompletionBlock:v15];
  }
  else
  {
    [a1[4] finishWithError:a4];
  }
}

id __59__HMDAccessCodeManager__resetAccessCodesForHomeAccessCode___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) accessCodeValue];
  id v4 = [v2 _updateAccessCode:v3 toNewValue:*(void *)(a1 + 48) onAccessoriesWithFetchResponses:*(void *)(a1 + 56) withRetries:1];

  return v4;
}

- (id)_createNewAccessCodeForUserWithUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating new access code for user with UUID: %@", buf, 0x16u);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F58190]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __60__HMDAccessCodeManager__createNewAccessCodeForUserWithUUID___block_invoke;
  v14[3] = &unk_264A14C48;
  id v10 = v9;
  id v15 = v10;
  id v16 = v4;
  uint64_t v17 = v6;
  id v11 = v4;
  [(HMDAccessCodeManager *)v6 _generateNewAccessCodeWithCompletion:v14];
  id v12 = v10;

  return v12;
}

void __60__HMDAccessCodeManager__createNewAccessCodeForUserWithUUID___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F0DEF0]) initWithSimpleLabel:0 labelIdentifier:0 userUUID:a1[5] removedUserInfo:0];
    id v8 = [a1[6] dataManager];
    id v9 = [v8 setUserInformation:v7 forHomeAccessCodeWithValue:v6 changedByUserUUID:0];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__HMDAccessCodeManager__createNewAccessCodeForUserWithUUID___block_invoke_2;
    v13[3] = &unk_264A26650;
    v13[4] = a1[6];
    id v14 = v6;
    id v15 = a1[5];
    id v10 = [v9 flatMap:v13];
    id v11 = [a1[4] completionHandlerAdapter];
    id v12 = (id)[v10 addCompletionBlock:v11];
  }
  else
  {
    [a1[4] finishWithError:a4];
  }
}

id __60__HMDAccessCodeManager__createNewAccessCodeForUserWithUUID___block_invoke_2(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v4 = [v1 context];
  id v5 = [v4 UUIDsOfAccessoriesSupportingAccessCodes];
  id v6 = [v1 _addNewAccessCode:v2 forUserWithUUID:v3 toAccessoriesWithUUIDs:v5 withRetries:1];

  return v6;
}

- (void)_notifySubscribersOfMessageWithName:(id)a3 payload:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v25 = a4;
  id v6 = [(HMDAccessCodeManager *)self context];
  id v7 = [v6 workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [(HMDAccessCodeManager *)v9 subscribedClientConnections];
    *(_DWORD *)buf = 138543874;
    uint64_t v33 = v11;
    __int16 v34 = 2048;
    uint64_t v35 = [v12 count];
    __int16 v36 = 2112;
    id v37 = v26;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribers of message with name: %@", buf, 0x20u);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = [(HMDAccessCodeManager *)v9 subscribedClientConnections];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * v17);
        uint64_t v19 = [MEMORY[0x263F42590] entitledMessageWithName:v26 messagePayload:v25];
        [v19 setTransport:v18];
        id v20 = objc_alloc(MEMORY[0x263F42570]);
        id v21 = [(HMDAccessCodeManager *)v9 messageTargetUUID];
        uint64_t v22 = (void *)[v20 initWithTarget:v21];
        [v19 setDestination:v22];

        id v23 = [(HMDAccessCodeManager *)v9 context];
        id v24 = [v23 messageDispatcher];
        [v24 sendMessage:v19];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }
}

- (void)_generateNewUserAccessCodeForMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v31 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Generating new user access code for message.", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeManager *)v8 context];
  id v12 = [v11 remoteMessageForwarder];
  id v13 = [v12 messageForForwardedMessage:v4];

  id v14 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v15 = [v13 stringForKey:*MEMORY[0x263F0AEF0]];
  uint64_t v16 = (void *)[v14 initWithUUIDString:v15];

  uint64_t v17 = [(HMDAccessCodeManager *)v8 context];
  uint64_t v18 = [v17 home];
  uint64_t v19 = [(HMDAccessCodeManager *)v8 _accessCodeForUserWithUUID:v16 inHome:v18];

  if (v19)
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v8;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@User already has an access code, so doing nothing.", buf, 0xCu);
    }
    id v24 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2600];
    [v13 respondWithError:v24];
  }
  else
  {
    id v25 = [(HMDAccessCodeManager *)v8 _createNewAccessCodeForUserWithUUID:v16];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __61__HMDAccessCodeManager__generateNewUserAccessCodeForMessage___block_invoke;
    v27[3] = &unk_264A2E1A0;
    id v28 = v13;
    long long v29 = v8;
    id v26 = (id)[v25 addCompletionBlock:v27];

    id v24 = v28;
  }
}

void __61__HMDAccessCodeManager__generateNewUserAccessCodeForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) _updateCacheWithModificationResponses:v5]);
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to message with modification responses: %@", buf, 0x16u);
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v14 = *MEMORY[0x263F0AEA0];
    id v12 = encodeRootObjectForIncomingXPCMessage(v5, 0);
    uint64_t v15 = v12;
    id v13 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    objc_msgSend(v11, "respondWithPayload:", v13, v14);
  }
  else
  {
    [*(id *)(a1 + 32) respondWithError:v6];
  }
}

- (void)_resetAccessoryAccessCodesForMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v25 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Resetting access code for message", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeManager *)v8 context];
  id v12 = [v11 remoteMessageForwarder];
  id v13 = [v12 messageForForwardedMessage:v4];

  uint64_t v14 = *MEMORY[0x263F0AED8];
  uint64_t v23 = objc_opt_class();
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  uint64_t v16 = [v13 unarchivedObjectForKey:v14 ofClasses:v15];

  uint64_t v17 = [(HMDAccessCodeManager *)v8 _resetAccessCodesForHomeAccessCode:v16];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__HMDAccessCodeManager__resetAccessoryAccessCodesForMessage___block_invoke;
  v20[3] = &unk_264A2E1A0;
  id v21 = v13;
  uint64_t v22 = v8;
  id v18 = v13;
  id v19 = (id)[v17 addCompletionBlock:v20];
}

void __61__HMDAccessCodeManager__resetAccessoryAccessCodesForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) _updateCacheWithModificationResponses:v5]);
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to message with modification responses: %@", buf, 0x16u);
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v14 = *MEMORY[0x263F0AEA0];
    id v12 = encodeRootObjectForIncomingXPCMessage(v5, 0);
    uint64_t v15 = v12;
    id v13 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    objc_msgSend(v11, "respondWithPayload:", v13, v14);
  }
  else
  {
    [*(id *)(a1 + 32) respondWithError:v6];
  }
}

- (id)_removeAccessCode:(id)a3 forUserBeingRemoved:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessCodeManager *)self context];
  id v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:v6];
  id v11 = [(HMDAccessCodeManager *)self accessoryReaderWriter];
  id v12 = [v7 uuid];
  id v13 = [v11 removeAllAccessCodesWithValue:v10 withUserUUID:v12 guestName:0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__HMDAccessCodeManager__removeAccessCode_forUserBeingRemoved___block_invoke;
  v18[3] = &unk_264A2D848;
  v18[4] = self;
  id v19 = v7;
  id v20 = v6;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = [v13 addCompletionBlock:v18];

  return v16;
}

void __62__HMDAccessCodeManager__removeAccessCode_forUserBeingRemoved___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5 || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "utilities"), "anyModificationFailed:", v5))
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@At least one modification response failed, so saving removedUserAccessCode", (uint8_t *)&v19, 0xCu);
    }
    id v11 = objc_alloc(MEMORY[0x263F0E6A8]);
    id v12 = [*(id *)(a1 + 40) displayName];
    id v13 = [*(id *)(a1 + 40) uuid];
    id v14 = [*(id *)(a1 + 40) userID];
    id v15 = [MEMORY[0x263EFF910] date];
    uint64_t v16 = (void *)[v11 initWithName:v12 userUUID:v13 userID:v14 dateRemoved:v15];

    uint64_t v17 = [*(id *)(a1 + 32) dataManager];
    id v18 = (id)[v17 saveRemovedUserAccessCode:*(void *)(a1 + 48) withRemovedUserInfo:v16];
  }
}

- (id)removeAccessCode:(id)a3 fromHAPAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [(HMDAccessCodeManager *)self context];
  id v10 = [v9 workQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__HMDAccessCodeManager_removeAccessCode_fromHAPAccessory___block_invoke;
  v17[3] = &unk_264A2E610;
  id v18 = v6;
  int v19 = self;
  id v20 = v7;
  id v11 = v8;
  id v21 = v11;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v10, v17);

  id v14 = v21;
  id v15 = v11;

  return v15;
}

void __58__HMDAccessCodeManager_removeAccessCode_fromHAPAccessory___block_invoke(uint64_t a1)
{
  id v6 = (id)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:*(void *)(a1 + 32)];
  uint64_t v2 = [*(id *)(a1 + 40) accessoryReaderWriter];
  uint64_t v3 = [v2 removeAllHAPAccessCodesWithValue:v6 forSpecificAccessory:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 56) completionHandlerAdapter];
  id v5 = (id)[v3 addCompletionBlock:v4];
}

- (id)_removeAccessCode:(id)a3 forUser:(id)a4 removedByUserUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessCodeManager *)self context];
  id v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:v8];
  id v14 = [(HMDAccessCodeManager *)self dataManager];
  id v15 = [v14 removeHomeAccessCodeWithValue:v13 removedByUserUUID:v10];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__HMDAccessCodeManager__removeAccessCode_forUser_removedByUserUUID___block_invoke;
  v21[3] = &unk_264A14C20;
  v21[4] = self;
  id v22 = v13;
  id v23 = v9;
  id v24 = v8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v13;
  int v19 = [v15 flatMap:v21];

  return v19;
}

id __68__HMDAccessCodeManager__removeAccessCode_forUser_removedByUserUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accessoryReaderWriter];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) uuid];
  id v5 = [v2 removeAllAccessCodesWithValue:v3 withUserUUID:v4 guestName:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__HMDAccessCodeManager__removeAccessCode_forUser_removedByUserUUID___block_invoke_2;
  v8[3] = &unk_264A2D848;
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = [v5 addCompletionBlock:v8];

  return v6;
}

void __68__HMDAccessCodeManager__removeAccessCode_forUser_removedByUserUUID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5 || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "utilities"), "anyModificationFailed:", v5))
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@At least one modification response failed, so saving removedUserAccessCode", (uint8_t *)&v19, 0xCu);
    }
    id v11 = objc_alloc(MEMORY[0x263F0E6A8]);
    id v12 = [*(id *)(a1 + 40) displayName];
    id v13 = [*(id *)(a1 + 40) uuid];
    id v14 = [*(id *)(a1 + 40) userID];
    id v15 = [MEMORY[0x263EFF910] date];
    id v16 = (void *)[v11 initWithName:v12 userUUID:v13 userID:v14 dateRemoved:v15];

    id v17 = [*(id *)(a1 + 32) dataManager];
    id v18 = (id)[v17 saveRemovedUserAccessCode:*(void *)(a1 + 48) withRemovedUserInfo:v16];
  }
}

- (id)_removeAccessCode:(id)a3 forUserWithUUID:(id)a4 removedByUserUUID:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessCodeManager *)self context];
  id v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(HMDAccessCodeManager *)self context];
  id v14 = [v13 userWithUUID:v9];

  if (v14)
  {
    id v15 = [(HMDAccessCodeManager *)self _removeAccessCode:v8 forUser:v14 removedByUserUUID:v10];
  }
  else
  {
    id v16 = [(HMDAccessCodeManager *)self dataManager];
    id v17 = [v16 homeAccessCodeWithRemovedUserInfoWithUUID:v9];

    if (v17)
    {
      id v18 = [v17 accessCodeValue];
      uint64_t v19 = [(HMDAccessCodeManager *)self _removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:v18 forUserUUID:v9];
    }
    else
    {
      id v20 = (void *)MEMORY[0x230FBD990]();
      uint64_t v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        int v26 = 138543618;
        long long v27 = v23;
        __int16 v28 = 2112;
        id v29 = v9;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Did not find any current or former user with UUID: %@", (uint8_t *)&v26, 0x16u);
      }
      id v24 = (void *)MEMORY[0x263F58190];
      id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      uint64_t v19 = [v24 futureWithError:v18];
    }
    id v15 = (void *)v19;
  }
  return v15;
}

- (void)_setAccessCodeForUserForMessage:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v4 = [(HMDAccessCodeManager *)self context];
  id v5 = [v4 workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v66 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Setting access code for user for message.", buf, 0xCu);
  }
  id v10 = [v54 proxyConnection];
  id v11 = [v10 clientIdentifier];
  int v12 = [v11 isEqualToString:*MEMORY[0x263F0CEB8]];

  if (v12) {
    id v13 = objc_alloc_init(HMDAccessCodeSetupLogEvent);
  }
  else {
    id v13 = 0;
  }
  id v14 = [(HMDAccessCodeManager *)v7 context];
  id v15 = [v14 remoteMessageForwarder];
  id v16 = [v15 messageForForwardedMessage:v54];

  uint64_t v17 = [v16 stringForKey:*MEMORY[0x263F0AEA8]];
  id v18 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v19 = [v16 stringForKey:*MEMORY[0x263F0AEF0]];
  id v20 = (void *)[v18 initWithUUIDString:v19];

  uint64_t v21 = [(HMDAccessCodeManager *)v7 context];
  id v22 = [v21 userForMessage:v16];

  id v23 = [(HMDAccessCodeManager *)v7 context];
  id v24 = [v23 home];
  uint64_t v25 = [(HMDAccessCodeManager *)v7 _accessCodeForUserWithUUID:v20 inHome:v24];

  v53 = (void *)v25;
  if (([v22 isAdministrator] & 1) != 0
    || ([v22 uuid],
        int v26 = objc_claimAutoreleasedReturnValue(),
        char v27 = HMFEqualObjects(),
        v26,
        (v27 & 1) != 0))
  {
    if (v25 | v17)
    {
      v52 = v13;
      __int16 v28 = &unk_2303E3000;
      if (v17)
      {
        id v29 = (void *)v25;
        uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:v17];
        __int16 v31 = (void *)[objc_alloc(MEMORY[0x263F0DEF0]) initWithSimpleLabel:0 labelIdentifier:0 userUUID:v20 removedUserInfo:0];
        uint64_t v32 = [(HMDAccessCodeManager *)v7 dataManager];
        uint64_t v33 = [v22 uuid];
        [v32 setUserInformation:v31 forHomeAccessCodeWithValue:v30 changedByUserUUID:v33];
        __int16 v34 = v50 = v17;
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke;
        v58[3] = &unk_264A14C20;
        id v59 = v29;
        v60 = v7;
        id v61 = v20;
        id v62 = v30;
        id v35 = v30;
        __int16 v36 = [v34 flatMap:v58];

        uint64_t v17 = v50;
        __int16 v28 = (void *)&unk_2303E3000;
      }
      else
      {
        __int16 v31 = [v22 uuid];
        __int16 v36 = [(HMDAccessCodeManager *)v7 _removeAccessCode:v25 forUserWithUUID:v20 removedByUserUUID:v31];
      }

      v55[0] = MEMORY[0x263EF8330];
      v55[1] = v28[326];
      v55[2] = __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke_3;
      v55[3] = &unk_264A2D848;
      v55[4] = v7;
      id v56 = v16;
      id v13 = v52;
      v57 = v52;
      id v49 = (id)[v36 addCompletionBlock:v55];
    }
    else
    {
      id v37 = (void *)MEMORY[0x230FBD990]();
      uint64_t v38 = v7;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v66 = v40;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@A nil access code was passed but the user has no access code, so responding with success", buf, 0xCu);
      }
      uint64_t v63 = *MEMORY[0x263F0AEA0];
      __int16 v36 = encodeRootObjectForIncomingXPCMessage(MEMORY[0x263EFFA68], 0);
      v64 = v36;
      v41 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      [v16 respondWithPayload:v41];
    }
  }
  else
  {
    v42 = (void *)MEMORY[0x230FBD990]();
    v43 = v7;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      [v22 uuid];
      uint64_t v51 = v17;
      v47 = v46 = v13;
      *(_DWORD *)buf = 138543874;
      v66 = v45;
      __int16 v67 = 2112;
      v68 = v47;
      __int16 v69 = 2112;
      v70 = v20;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Dropping request: The user: %@ does not have permission to change the access code for the user: %@", buf, 0x20u);

      id v13 = v46;
      uint64_t v17 = v51;
    }
    v48 = [MEMORY[0x263F087E8] hmErrorWithCode:53];
    [v16 respondWithError:v48];

    __int16 v36 = [MEMORY[0x263F087E8] hmErrorWithCode:53];
    [(HMDAccessCodeSetupLogEvent *)v13 submitFailureWithReason:2 error:v36];
  }
}

id __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = [*(id *)(a1 + 40) accessoryReaderWriter];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:*(void *)(a1 + 32)];
    uint64_t v5 = [v3 removeAllAccessCodesWithValue:v4 withUserUUID:*(void *)(a1 + 48) guestName:0];

    uint64_t v2 = (void *)v5;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F58190]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke_2;
  v13[3] = &unk_264A2A648;
  id v7 = *(void **)(a1 + 48);
  v13[4] = *(void *)(a1 + 40);
  id v14 = v7;
  id v15 = *(id *)(a1 + 56);
  id v8 = v6;
  id v16 = v8;
  id v9 = (id)[v2 addCompletionBlock:v13];
  id v10 = v16;
  id v11 = v8;

  return v11;
}

void __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1[4];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Responding to message with modification responses: %@", buf, 0x16u);
    }
    id v12 = a1[5];
    uint64_t v21 = *MEMORY[0x263F0AEA0];
    id v13 = encodeRootObjectForIncomingXPCMessage(v5, 0);
    id v22 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    objc_msgSend(v12, "respondWithPayload:", v14, v21);

    [a1[6] submitSuccess];
  }
  else
  {
    if (v6)
    {
      id v15 = v6;
    }
    else
    {
      id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    }
    id v16 = v15;
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = a1[4];
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v20;
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Responding to message with error: %@", buf, 0x16u);
    }
    [a1[5] respondWithError:v16];
    [a1[6] submitFailureWithReason:1 error:v7];
  }
}

void __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = [v2 UUIDsOfAccessoriesSupportingAccessCodes];

  id v4 = [*(id *)(a1 + 32) context];
  id v5 = [v4 home];
  id v6 = [v5 userWithUUID:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 32) context];
  id v11 = [v7 uuidsOfAccessoriesSupportingAccessCodesForUser:v6];

  id v8 = [*(id *)(a1 + 32) _addNewAccessCode:*(void *)(a1 + 48) forUserWithUUID:*(void *)(a1 + 40) toAccessoriesWithUUIDs:v11 withRetries:1];
  id v9 = [*(id *)(a1 + 56) completionHandlerAdapter];
  id v10 = (id)[v8 addCompletionBlock:v9];
}

- (id)_removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:(id)a3 forUserUUID:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x263F58190];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  id v10 = [(HMDAccessCodeManager *)self dataManager];
  id v11 = [v6 stringValue];
  id v12 = [v10 simpleLabelForAccessCode:v11];

  id v13 = [(HMDAccessCodeManager *)self accessoryReaderWriter];
  id v14 = [v13 removeAllAccessCodesWithValue:v6 withUserUUID:v8 guestName:v12];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke;
  v21[3] = &unk_264A2D848;
  v21[4] = self;
  id v15 = v9;
  id v22 = v15;
  id v23 = v6;
  id v16 = v6;
  id v17 = (id)[v14 addCompletionBlock:v21];

  id v18 = v23;
  id v19 = v15;

  return v19;
}

void __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "utilities"), "anyModificationFailed:", v5);
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v28 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@At least one modification failed, so we will not remove the home access code.", buf, 0xCu);
      }
      [*(id *)(a1 + 40) finishWithResult:v5];
    }
    else
    {
      if (v11)
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v28 = v17;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory access code removals succeeded, so now removing the home access code.", buf, 0xCu);
      }
      id v18 = [*(id *)(a1 + 32) dataManager];
      id v19 = [v18 removeHomeAccessCodeWithValue:*(void *)(a1 + 48) removedByUserUUID:0];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke_370;
      v24[3] = &unk_264A2F3C0;
      id v25 = *(id *)(a1 + 40);
      id v26 = v5;
      id v20 = [v19 addSuccessBlock:v24];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke_2;
      v22[3] = &unk_264A2F3E8;
      id v23 = *(id *)(a1 + 40);
      id v21 = (id)[v20 addFailureBlock:v22];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to remove accessory access codes", buf, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
}

uint64_t __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke_370(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

uint64_t __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)_removeSimpleLabelAccessCodeMessage:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing simple label access code for message.", buf, 0xCu);
  }
  BOOL v11 = [(HMDAccessCodeManager *)v8 context];
  id v12 = [v11 remoteMessageForwarder];
  id v13 = [v12 messageForForwardedMessage:v4];

  id v14 = [v13 stringForKey:*MEMORY[0x263F0AEA8]];
  id v15 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:v14];
  id v16 = [(HMDAccessCodeManager *)v8 dataManager];
  id v17 = [v16 accessCodeValuesWithSimpleLabel];
  char v18 = [v17 containsObject:v15];

  if (v18)
  {
    id v19 = [(HMDAccessCodeManager *)v8 _removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:v15 forUserUUID:0];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    void v31[2] = __60__HMDAccessCodeManager__removeSimpleLabelAccessCodeMessage___block_invoke;
    v31[3] = &unk_264A28890;
    id v20 = v13;
    id v32 = v20;
    id v21 = [v19 addSuccessBlock:v31];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __60__HMDAccessCodeManager__removeSimpleLabelAccessCodeMessage___block_invoke_2;
    v29[3] = &unk_264A2F3E8;
    id v30 = v20;
    id v22 = (id)[v21 addFailureBlock:v29];

    id v23 = v32;
  }
  else
  {
    id v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = v8;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@A home access code with the specified value does not exist, so we have nothing to do.", buf, 0xCu);
    }
    uint64_t v33 = *MEMORY[0x263F0AEA0];
    id v23 = encodeRootObjectForIncomingXPCMessage(MEMORY[0x263EFFA68], 0);
    __int16 v34 = v23;
    __int16 v28 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v13 respondWithPayload:v28];
  }
}

void __60__HMDAccessCodeManager__removeSimpleLabelAccessCodeMessage___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x263F0AEA0];
  uint64_t v3 = encodeRootObjectForIncomingXPCMessage(a2, 0);
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 respondWithPayload:v4];
}

uint64_t __60__HMDAccessCodeManager__removeSimpleLabelAccessCodeMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (id)_filterModificationRequestsForPrivilege:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__HMDAccessCodeManager__filterModificationRequestsForPrivilege___block_invoke;
  v5[3] = &unk_264A14F10;
  v5[4] = self;
  uint64_t v3 = objc_msgSend(a3, "na_filter:", v5);
  return v3;
}

uint64_t __64__HMDAccessCodeManager__filterModificationRequestsForPrivilege___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 userUUID];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) context];
    id v6 = [v3 userUUID];
    int v7 = [v5 userWithUUID:v6];
  }
  else
  {
    int v7 = 0;
  }

  id v8 = [*(id *)(a1 + 32) context];
  id v9 = [v3 accessoryUUID];
  id v10 = [v8 hapAccessoryWithUUID:v9];

  if (v7 && ([v10 supportsAccessCodesForUser:v7] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543874;
      char v18 = v15;
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Dropping request for user who does not have access. Request: %@, user: %@", (uint8_t *)&v17, 0x20u);
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (id)_updateModificationRequestsWithUserOrGuestNames:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__HMDAccessCodeManager__updateModificationRequestsWithUserOrGuestNames___block_invoke;
  v5[3] = &unk_264A14BF8;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "na_map:", v5);
  return v3;
}

id __72__HMDAccessCodeManager__updateModificationRequestsWithUserOrGuestNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v5)
  {
    id v12 = [v5 accessCodeValue];
    id v13 = [v12 stringValue];
LABEL_17:

    id v16 = [*(id *)(a1 + 32) dataManager];
    int v17 = [v16 simpleLabelForAccessCode:v13];
    [v9 setGuestName:v17];

    char v18 = [*(id *)(a1 + 32) dataManager];
    __int16 v19 = [v18 userUUIDForAccessCode:v13];
    [v9 setUserUUID:v19];

    id v20 = v9;
    goto LABEL_18;
  }
  if (v8)
  {
    id v14 = v8;
LABEL_16:
    id v12 = [v14 accessoryAccessCodeValue];
    id v15 = [v12 accessCodeValue];
    id v13 = [v15 stringValue];

    goto LABEL_17;
  }
  if (v11)
  {
    id v14 = v11;
    goto LABEL_16;
  }
  id v22 = (void *)MEMORY[0x230FBD990]();
  id v23 = *(id *)(a1 + 32);
  id v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    id v25 = HMFGetLogIdentifier();
    int v27 = 138543362;
    __int16 v28 = v25;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received modification request of unknown type", (uint8_t *)&v27, 0xCu);
  }
  id v26 = v9;
LABEL_18:

  return v9;
}

- (void)_submitAccessCodeModificationRequestsForMessage:(id)a3
{
  v44[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v41 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting AccessCodeModificationRequests for message.", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeManager *)v8 context];
  id v12 = [v11 remoteMessageForwarder];
  id v13 = [v12 messageForForwardedMessage:v4];

  uint64_t v14 = *MEMORY[0x263F0AE98];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  v44[2] = objc_opt_class();
  v44[3] = objc_opt_class();
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
  id v16 = [v13 unarchivedObjectForKey:v14 ofClasses:v15];

  if (v16 && !objc_msgSend(v16, "hmf_isEmpty"))
  {
    id v23 = [(HMDAccessCodeManager *)v8 context];
    id v22 = [v23 userForMessage:v13];

    id v24 = [v22 uuid];
    id v25 = [(HMDAccessCodeManager *)v8 context];
    id v26 = [v25 home];
    int v27 = [(HMDAccessCodeManager *)v8 _accessCodeForUserWithUUID:v24 inHome:v26];

    if (([v22 isAdministrator] & 1) != 0
      || ([(objc_class *)[(HMDAccessCodeManager *)v8 utilities] allModificationRequests:v16 areAddingAccessCode:v27] & 1) != 0)
    {
      __int16 v28 = [(HMDAccessCodeManager *)v8 _updateModificationRequestsWithUserOrGuestNames:v16];
      uint64_t v29 = [(HMDAccessCodeManager *)v8 _filterModificationRequestsForPrivilege:v28];

      id v30 = [(HMDAccessCodeManager *)v8 accessoryReaderWriter];
      __int16 v31 = [v30 performAccessCodeModificationRequests:v29 withRetries:1];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __72__HMDAccessCodeManager__submitAccessCodeModificationRequestsForMessage___block_invoke;
      v38[3] = &unk_264A2E1A0;
      v38[4] = v8;
      id v39 = v13;
      id v32 = (id)[v31 addCompletionBlock:v38];
    }
    else
    {
      uint64_t v33 = (void *)MEMORY[0x230FBD990]();
      __int16 v34 = v8;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        __int16 v36 = HMFGetLogIdentifier();
        uint64_t v37 = [v22 uuid];
        *(_DWORD *)buf = 138543618;
        v41 = v36;
        __int16 v42 = 2112;
        v43 = v37;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Dropping request: The user: %@ is not an admin and attempted to change an access code that does not belong to them", buf, 0x16u);
      }
      uint64_t v29 = [MEMORY[0x263F087E8] hmErrorWithCode:53];
      [v13 respondWithError:v29];
    }
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    char v18 = v8;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      __int16 v21 = [v13 messagePayload];
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      __int16 v42 = 2112;
      v43 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find modification requests in message payload: %@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v13 respondWithError:v22];
  }
}

void __72__HMDAccessCodeManager__submitAccessCodeModificationRequestsForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) _updateCacheWithModificationResponses:v5]);
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v10;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to client with modification response values: %@", buf, 0x16u);
    }
    id v11 = *(void **)(a1 + 40);
    uint64_t v18 = *MEMORY[0x263F0AEA0];
    id v12 = encodeRootObjectForIncomingXPCMessage(v5, 0);
    __int16 v19 = v12;
    id v13 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    objc_msgSend(v11, "respondWithPayload:", v13, v18);
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v17;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform modification requests with error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v6];
  }
}

- (void)_fetchAccessCodeConstraintsForMessage:(id)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching access code constraints for message.", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeManager *)v8 context];
  id v12 = [v11 remoteMessageForwarder];
  id v13 = [v12 messageForForwardedMessage:v4];

  uint64_t v14 = *MEMORY[0x263F0AED0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  id v16 = [v13 unarchivedObjectForKey:v14 ofClasses:v15];

  if (v16 && !objc_msgSend(v16, "hmf_isEmpty"))
  {
    id v23 = [(HMDAccessCodeManager *)v8 accessoryReaderWriter];
    uint64_t v24 = [v23 readConstraintsFromAccessoriesWithUUIDs:v16];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __62__HMDAccessCodeManager__fetchAccessCodeConstraintsForMessage___block_invoke;
    v26[3] = &unk_264A2E1A0;
    v26[4] = v8;
    id v27 = v13;
    id v25 = (id)[v24 addCompletionBlock:v26];
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v8;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      __int16 v21 = [v13 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      __int16 v31 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory UUIDs in message payload: %@", buf, 0x16u);
    }
    __int16 v22 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v13 respondWithError:v22];
  }
}

void __62__HMDAccessCodeManager__fetchAccessCodeConstraintsForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Responding with constraints: %@", buf, 0x16u);
    }
    id v12 = *(void **)(a1 + 40);
    uint64_t v16 = *MEMORY[0x263F0AEB8];
    id v13 = encodeRootObjectForIncomingXPCMessage(v5, 0);
    int v17 = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    objc_msgSend(v12, "respondWithPayload:", v14, v16);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v15;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to read access code constraints with error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v6];
  }
}

- (void)_fetchAccessCodesForMessage:(id)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching access codes for message.", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeManager *)v8 context];
  id v12 = [v11 remoteMessageForwarder];
  id v13 = [v12 messageForForwardedMessage:v4];

  uint64_t v14 = *MEMORY[0x263F0AED0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  uint64_t v16 = [v13 unarchivedObjectForKey:v14 ofClasses:v15];

  if (v16 && !objc_msgSend(v16, "hmf_isEmpty"))
  {
    id v23 = [(HMDAccessCodeManager *)v8 accessoryReaderWriter];
    uint64_t v24 = [v23 readAccessCodesFromAccessoriesWithUUIDs:v16];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __52__HMDAccessCodeManager__fetchAccessCodesForMessage___block_invoke;
    v26[3] = &unk_264A2E1A0;
    v26[4] = v8;
    id v27 = v13;
    id v25 = (id)[v24 addCompletionBlock:v26];
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v8;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      id v21 = [v13 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      __int16 v31 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory UUIDs in message payload: %@", buf, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v13 respondWithError:v22];
  }
}

void __52__HMDAccessCodeManager__fetchAccessCodesForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [*(id *)(a1 + 32) context];
    id v8 = [v7 userForMessage:*(void *)(a1 + 40)];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) dataManager];
      [v9 updateCacheWithFetchResponses:v5];

      id v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "utilities"), "filteredFetchResponses:forUser:", v5, v8);
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v31 = v14;
        __int16 v32 = 2112;
        id v33 = v10;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Responding to message with fetch responses: %@", buf, 0x16u);
      }
      id v15 = *(void **)(a1 + 40);
      uint64_t v28 = *MEMORY[0x263F0AEC0];
      uint64_t v16 = encodeRootObjectForIncomingXPCMessage(v10, 0);
      uint64_t v29 = v16;
      int v17 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      objc_msgSend(v15, "respondWithPayload:", v17, v28);
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = *(id *)(a1 + 32);
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        id v26 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        __int16 v31 = v25;
        __int16 v32 = 2112;
        id v33 = v26;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine which user sent the message: %@", buf, 0x16u);
      }
      id v27 = *(void **)(a1 + 40);
      id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v27 respondWithError:v10];
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 32);
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v21;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to read access codes with error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v6];
  }
}

- (BOOL)_redispatchToResidentIfNeccesaryForMessage:(id)a3 withNewResponseHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessCodeManager *)self context];
  char v9 = [v8 isCurrentDevicePrimaryResident];

  if ((v9 & 1) == 0)
  {
    id v10 = [(HMDAccessCodeManager *)self context];
    if ([v10 primaryResidentSupportsAccessCodes])
    {
      id v11 = [(HMDAccessCodeManager *)self context];
      id v12 = [v11 residentCommunicationHandlerPreferredDevice];

      if (v12)
      {
        id v13 = (void *)MEMORY[0x230FBD990]();
        uint64_t v14 = self;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          int v28 = 138543362;
          uint64_t v29 = v16;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Redispatching message to resident.", (uint8_t *)&v28, 0xCu);
        }
        if (v7)
        {
          int v17 = (void *)[v6 mutableCopy];
          [v17 setResponseHandler:v7];
          uint64_t v18 = [(HMDAccessCodeManager *)v14 context];
          id v19 = [v18 remoteMessageForwarder];
          [v19 redispatchToResidentMessage:v17];
        }
        else
        {
          int v17 = [(HMDAccessCodeManager *)v14 context];
          uint64_t v18 = [v17 remoteMessageForwarder];
          [v18 redispatchToResidentMessage:v6];
        }

LABEL_16:
        BOOL v22 = 1;
        goto LABEL_17;
      }
    }
    else
    {
    }
    __int16 v20 = [(HMDAccessCodeManager *)self context];
    char v21 = [v20 isCurrentDeviceOwnerUser];

    if ((v21 & 1) == 0)
    {
      id v23 = (void *)MEMORY[0x230FBD990]();
      uint64_t v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        int v28 = 138543362;
        uint64_t v29 = v26;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@There is no resident available, so nothing can be done.", (uint8_t *)&v28, 0xCu);
      }
      int v17 = [MEMORY[0x263F087E8] hmErrorWithCode:91];
      [v6 respondWithError:v17];
      goto LABEL_16;
    }
  }
  BOOL v22 = 0;
LABEL_17:

  return v22;
}

- (void)_updateCacheWithModificationResponses:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    id v5 = [(objc_class *)[(HMDAccessCodeManager *)self utilities] addedAccessoryAccessCodesFromModificationResponses:v4];
    if ([v5 count])
    {
      id v6 = [(HMDAccessCodeManager *)self dataManager];
      [v6 updateCacheWithAddedAccessCodes:v5];
    }
    id v7 = [(objc_class *)[(HMDAccessCodeManager *)self utilities] updatedAccessoryAccessCodesFromModificationResponses:v11];
    if ([v7 count])
    {
      id v8 = [(HMDAccessCodeManager *)self dataManager];
      [v8 updateCacheWithUpdatedAccessCodes:v7];
    }
    char v9 = [(objc_class *)[(HMDAccessCodeManager *)self utilities] removedAccessoryAccessCodesFromModificationResponses:v11];
    if ([v9 count])
    {
      id v10 = [(HMDAccessCodeManager *)self dataManager];
      [v10 updateCacheWithRemovedAccessCodes:v9];
    }
    id v4 = v11;
  }
}

- (BOOL)hasCurrentUserAccessCodeChangedWithChangedAccessCodes:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDAccessCodeManager *)self context];
  char v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __83__HMDAccessCodeManager_hasCurrentUserAccessCodeChangedWithChangedAccessCodes_home___block_invoke;
  v12[3] = &unk_264A26628;
  id v13 = v6;
  id v10 = v6;
  LOBYTE(v6) = objc_msgSend(v7, "na_any:", v12);

  return (char)v6;
}

uint64_t __83__HMDAccessCodeManager_hasCurrentUserAccessCodeChangedWithChangedAccessCodes_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 userInformationValue];
  id v4 = [v3 userUUID];
  id v5 = [*(id *)(a1 + 32) currentUser];
  id v6 = [v5 uuid];
  uint64_t v7 = HMFEqualObjects();

  return v7;
}

- (void)handleHomeDidDisableCharacteristicNotification:(id)a3
{
  id v4 = [(HMDAccessCodeManager *)self context];
  id v5 = [v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMDAccessCodeManager_handleHomeDidDisableCharacteristicNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __71__HMDAccessCodeManager_handleHomeDidDisableCharacteristicNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling home did disable characteristic notification", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) setHomeAppForegrounded:0];
}

- (void)handleHomeDidEnableCharacteristicNotification:(id)a3
{
  id v4 = [(HMDAccessCodeManager *)self context];
  id v5 = [v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDAccessCodeManager_handleHomeDidEnableCharacteristicNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __70__HMDAccessCodeManager_handleHomeDidEnableCharacteristicNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling home did enable characteristic notification", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) setHomeAppForegrounded:1];
}

- (void)handleAccessorySupportsAccessCodeDidChangeNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 home];

  int v7 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 home];

  if (v10 == v6)
  {
    id v15 = [(HMDAccessCodeManager *)self context];
    uint64_t v16 = [v15 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__HMDAccessCodeManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v18 = v9;
    id v19 = self;
    id v20 = v6;
    dispatch_async(v16, block);
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v22 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Not handling access code support change for accessory in other home", buf, 0xCu);
    }
  }
}

void __79__HMDAccessCodeManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke(id *a1)
{
  if ([a1[4] supportsAccessCode]
    && [a1[4] wasUpdatedWithServiceType:@"00000260-0000-1000-8000-0026BB765291"]
    && ([a1[4] hasPostedBulletinForAccessCodeOnboarding] & 1) == 0)
  {
    id v5 = [a1[5] context];
    if (([v5 hasHomeOnboardedForAccessCodes] & 1) == 0
      && [a1[6] isAdminUser])
    {
      uint64_t v2 = [a1[5] context];
      char v3 = [v2 isCurrentDeviceWatch];

      if (v3) {
        return;
      }
      [a1[4] setHasPostedBulletinForAccessCodeOnboarding:1];
      id v5 = [a1[5] context];
      id v4 = [v5 bulletinBoard];
      [v4 insertLockOnboardingBulletinForHome:a1[6] serviceType:@"00000260-0000-1000-8000-0026BB765291"];
    }
  }
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__HMDAccessCodeManager_handleHomeUserRemovedNotification___block_invoke;
  v8[3] = &unk_264A2F820;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __58__HMDAccessCodeManager_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  char v3 = [v2 objectForKey:@"HMDUserNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling removed user: %@", buf, 0x16u);
  }
  id v10 = [v5 accessCode];

  if (!v10)
  {
    BOOL v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 40);
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v33 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Removed user does not have an access code, so nothing to do.", buf, 0xCu);
    }
    goto LABEL_15;
  }
  id v11 = *(void **)(a1 + 40);
  id v12 = [v11 dataManager];
  id v13 = (void *)MEMORY[0x263F0E398];
  uint64_t v14 = [v5 accessCode];
  id v15 = [v5 uuid];
  uint64_t v16 = [v13 homeAccessCodeValueWithStringValue:v14 userUUID:v15];
  __int16 v31 = v16;
  int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  [v11 accessCodeDataManager:v12 didRemoveHomeAccessCodes:v17 removedByUserUUID:0];

  id v18 = [*(id *)(a1 + 40) context];
  LOBYTE(v11) = [v18 isCurrentDevicePrimaryResident];

  if ((v11 & 1) == 0)
  {
    BOOL v22 = (void *)MEMORY[0x230FBD990]();
    id v26 = *(id *)(a1 + 40);
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = HMFGetLogIdentifier();
      uint64_t v29 = [*(id *)(a1 + 40) context];
      [v29 isCurrentDevicePrimaryResident];
      uint64_t v30 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      id v33 = v28;
      __int16 v34 = 2112;
      id v35 = v30;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Not removing access codes for removed user since isCurrentDevicePrimaryResident: %@", buf, 0x16u);
    }
LABEL_15:
    goto LABEL_16;
  }
  id v19 = *(void **)(a1 + 40);
  id v20 = [v5 accessCode];
  id v21 = (id)[v19 _removeAccessCode:v20 forUserBeingRemoved:v5];

LABEL_16:
}

- (void)handleUserAccessCodeDidChangeMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 numberForKey:@"HMDAccessCodeManagerMessageKeyUserAccessCodeChangeType"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v15 = 138543618;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling UserAccessCodeDidChangeMessage with changeType: %lu", (uint8_t *)&v15, 0x16u);
  }
  id v11 = [(HMDAccessCodeManager *)v8 context];
  id v12 = [v11 home];

  switch(v6)
  {
    case 2:
      id v13 = [(HMDAccessCodeManager *)v8 context];
      uint64_t v14 = [v13 bulletinBoard];
      [v14 insertAccessCodeRemovedBulletinForHome:v12];
      goto LABEL_9;
    case 1:
      id v13 = [(HMDAccessCodeManager *)v8 context];
      uint64_t v14 = [v13 bulletinBoard];
      [v14 insertAccessCodeChangedBulletinForHome:v12];
      goto LABEL_9;
    case 0:
      id v13 = [(HMDAccessCodeManager *)v8 context];
      uint64_t v14 = [v13 bulletinBoard];
      [v14 insertAccessCodeAddedBulletinForHome:v12];
LABEL_9:

      break;
  }
}

- (void)handleConfirmDataHasSyncedToResidentMessage:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling ConfirmDataHasSyncedToResidentMessage", buf, 0xCu);
  }
  uint64_t v11 = *MEMORY[0x263F0AED0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  id v13 = [v4 unarchivedObjectForKey:v11 ofClasses:v12];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__HMDAccessCodeManager_handleConfirmDataHasSyncedToResidentMessage___block_invoke;
  v22[3] = &unk_264A2F348;
  void v22[4] = v8;
  int v14 = objc_msgSend(v13, "na_all:", v22);
  int v15 = (void *)MEMORY[0x230FBD990]();
  uint64_t v16 = v8;
  __int16 v17 = HMFGetOSLogHandle();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v18)
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Resident has all accessories for UUIDs: %@", buf, 0x16u);
    }
    [v4 respondWithSuccess];
  }
  else
  {
    if (v18)
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Resident does not have all accessories for UUIDs: %@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    [v4 respondWithError:v21];
  }
}

BOOL __68__HMDAccessCodeManager_handleConfirmDataHasSyncedToResidentMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 context];
  id v5 = [v4 hapAccessoryWithUUID:v3];

  return v5 != 0;
}

- (void)handleGenerateNewUserAccessCodeMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling GenerateNewUserAccessCodeMessage", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v8);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  int v14 = __63__HMDAccessCodeManager_handleGenerateNewUserAccessCodeMessage___block_invoke;
  int v15 = &unk_264A2D420;
  objc_copyWeak(&v17, (id *)buf);
  id v11 = v4;
  id v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _generateNewUserAccessCodeForMessage:](v8, "_generateNewUserAccessCodeForMessage:", v11, v12, v13, v14, v15); {

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __63__HMDAccessCodeManager_handleGenerateNewUserAccessCodeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void v12[2] = *MEMORY[0x263EF8340];
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = *MEMORY[0x263F0AEA0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v11 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);

  [WeakRetained _updateCacheWithModificationResponses:v11];
  [*(id *)(a1 + 32) respondWithPayload:v6 error:v7];
}

- (void)handleResetAccessoryAccessCodesMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling ResetAccessoryAccessCodesMessage: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v8);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  int v14 = __63__HMDAccessCodeManager_handleResetAccessoryAccessCodesMessage___block_invoke;
  int v15 = &unk_264A2D420;
  objc_copyWeak(&v17, (id *)buf);
  id v11 = v4;
  id v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _resetAccessoryAccessCodesForMessage:](v8, "_resetAccessoryAccessCodesForMessage:", v11, v12, v13, v14, v15); {

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __63__HMDAccessCodeManager_handleResetAccessoryAccessCodesMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void v12[2] = *MEMORY[0x263EF8340];
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = *MEMORY[0x263F0AEA0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v11 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);

  [WeakRetained _updateCacheWithModificationResponses:v11];
  [*(id *)(a1 + 32) respondWithPayload:v6 error:v7];
}

- (void)handleFetchCachedAccessCodesMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling FetchCachedAccessCodesMessage", buf, 0xCu);
  }
  id v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = v8;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    int v15 = [(HMDAccessCodeManager *)v12 dataManager];
    id v16 = [v15 cachedAccessCodes];
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    id v26 = v16;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Responding with cached access codes: %@", buf, 0x16u);
  }
  id v17 = [(HMDAccessCodeManager *)v12 dataManager];
  BOOL v18 = [v17 cachedAccessCodes];
  uint64_t v19 = encodeRootObjectForIncomingXPCMessage(v18, 0);
  uint64_t v22 = v19;
  __int16 v20 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  [v4 respondWithPayload:v20];
}

- (void)handleFetchHomeAccessCodesMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling FetchHomeAccessCodesMessage", buf, 0xCu);
  }
  id v11 = [(HMDAccessCodeManager *)v8 dataManager];
  uint64_t v12 = [v11 homeAccessCodeValues];

  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  int v14 = v8;
  int v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding with home access codes: %@", buf, 0x16u);
  }
  uint64_t v19 = *MEMORY[0x263F0AEE0];
  id v17 = encodeRootObjectForIncomingXPCMessage(v12, 0);
  __int16 v20 = v17;
  BOOL v18 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  objc_msgSend(v4, "respondWithPayload:", v18, v19);
}

- (void)handleFetchAccessCodeConstraintsMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v31 = v10;
    __int16 v32 = 2112;
    id v33 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling FetchAccessCodeConstraintsMessage: %@", buf, 0x16u);
  }
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  uint64_t v12 = [v4 unarchivedObjectForKey:*MEMORY[0x263F0AED0] ofClasses:v11];

  if (v12 && !objc_msgSend(v12, "hmf_isEmpty"))
  {
    objc_initWeak((id *)buf, v8);
    uint64_t v19 = [(HMDAccessCodeManager *)v8 _waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:v12];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke;
    v26[3] = &unk_264A2A530;
    objc_copyWeak(&v28, (id *)buf);
    id v20 = v4;
    id v27 = v20;
    uint64_t v21 = [v19 addSuccessBlock:v26];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke_3;
    v23[3] = &unk_264A2E210;
    void v23[4] = v8;
    id v24 = v12;
    id v25 = v20;
    id v22 = (id)[v21 addFailureBlock:v23];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    int v14 = v8;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory UUIDs in message payload: %@", buf, 0x16u);
    }
    BOOL v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v18];
  }
}

void __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke_2;
  v4[3] = &unk_264A2F0C8;
  id v5 = v3;
  if (([WeakRetained _redispatchToResidentIfNeccesaryForMessage:v5 withNewResponseHandler:v4] & 1) == 0) {
    [WeakRetained _fetchAccessCodeConstraintsForMessage:*(void *)(a1 + 32)];
  }
}

void __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Data never synced to the resident for accessories: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void **)(a1 + 48);
  id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  [v9 respondWithError:v10];
}

uint64_t __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:a3 error:a2];
}

- (void)handleFetchAccessCodesMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v31 = v10;
    __int16 v32 = 2112;
    id v33 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling FetchAccessCodesMessage: %@", buf, 0x16u);
  }
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  uint64_t v12 = [v4 unarchivedObjectForKey:*MEMORY[0x263F0AED0] ofClasses:v11];

  if (v12 && !objc_msgSend(v12, "hmf_isEmpty"))
  {
    objc_initWeak((id *)buf, v8);
    uint64_t v19 = [(HMDAccessCodeManager *)v8 _waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:v12];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke;
    v26[3] = &unk_264A2A530;
    objc_copyWeak(&v28, (id *)buf);
    id v20 = v4;
    id v27 = v20;
    uint64_t v21 = [v19 addSuccessBlock:v26];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke_3;
    v23[3] = &unk_264A2E210;
    void v23[4] = v8;
    id v24 = v12;
    id v25 = v20;
    id v22 = (id)[v21 addFailureBlock:v23];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = v8;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory UUIDs in message payload: %@", buf, 0x16u);
    }
    BOOL v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v18];
  }
}

void __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke_2;
  uint64_t v9 = &unk_264A2D420;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  if (([WeakRetained _redispatchToResidentIfNeccesaryForMessage:v5 withNewResponseHandler:&v6] & 1) == 0) {
    objc_msgSend(WeakRetained, "_fetchAccessCodesForMessage:", *(void *)(a1 + 32), v6, v7, v8, v9);
  }

  objc_destroyWeak(&v11);
}

void __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Data never synced to the resident for accessories: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void **)(a1 + 48);
  id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  [v9 respondWithError:v10];
}

void __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = *MEMORY[0x263F0AEC0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  int v11 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);

  uint64_t v12 = [WeakRetained dataManager];
  [v12 updateCacheWithFetchResponses:v11];

  [*(id *)(a1 + 32) respondWithPayload:v6 error:v7];
}

- (void)handleRemoveHomeAccessCodeMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v26 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling RemoveHomeAccessCodeMessage", buf, 0xCu);
  }
  uint64_t v11 = *MEMORY[0x263F0AEB0];
  uint64_t v24 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  __int16 v13 = [v4 unarchivedObjectForKey:v11 ofClasses:v12];

  if (v13)
  {
    uint64_t v14 = [(HMDAccessCodeManager *)v8 dataManager];
    uint64_t v15 = [v14 removeHomeAccessCodeWithValue:v13 removedByUserUUID:0];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __58__HMDAccessCodeManager_handleRemoveHomeAccessCodeMessage___block_invoke;
    v22[3] = &unk_264A26BA0;
    void v22[4] = v8;
    id v23 = v4;
    id v16 = (id)[v15 addCompletionBlock:v22];
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    BOOL v18 = v8;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v26 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find data in payload while attempting to remove home access code", buf, 0xCu);
    }
    uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v21];
  }
}

void __58__HMDAccessCodeManager_handleRemoveHomeAccessCodeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove home access code with error: %@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 40) respondWithSuccess];
  }
}

- (void)handleSetUserInformationMessage:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling SetUserInformationMessage", buf, 0xCu);
  }
  uint64_t v11 = *MEMORY[0x263F0AEE8];
  v33[0] = objc_opt_class();
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  __int16 v13 = [v4 unarchivedObjectForKey:v11 ofClasses:v12];

  uint64_t v14 = *MEMORY[0x263F0AEB0];
  uint64_t v32 = objc_opt_class();
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  id v16 = [v4 unarchivedObjectForKey:v14 ofClasses:v15];

  if (v13 && v16)
  {
    id v17 = [(HMDAccessCodeManager *)v8 dataManager];
    BOOL v18 = [v17 setUserInformation:v13 forHomeAccessCodeWithValue:v16 changedByUserUUID:0];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __56__HMDAccessCodeManager_handleSetUserInformationMessage___block_invoke;
    v25[3] = &unk_264A2CED0;
    v25[4] = v8;
    id v26 = v13;
    id v27 = v4;
    id v19 = (id)[v18 addCompletionBlock:v25];
  }
  else
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = v8;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      __int16 v31 = v13;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find data in payload while attempting to set userInfo: %@", buf, 0x16u);
    }
    uint64_t v24 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v24];
  }
}

void __56__HMDAccessCodeManager_handleSetUserInformationMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543874;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set userInfo: %@, with error: %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (void)handleRemoveSimpleLabelAccessCodeMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling RemoveSimpleLabelAccessCodeMessage: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v8);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  __int16 v14 = __65__HMDAccessCodeManager_handleRemoveSimpleLabelAccessCodeMessage___block_invoke;
  uint64_t v15 = &unk_264A2D420;
  objc_copyWeak(&v17, (id *)buf);
  id v11 = v4;
  id v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _removeSimpleLabelAccessCodeMessage:](v8, "_removeSimpleLabelAccessCodeMessage:", v11, v12, v13, v14, v15); {

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __65__HMDAccessCodeManager_handleRemoveSimpleLabelAccessCodeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void v12[2] = *MEMORY[0x263EF8340];
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = *MEMORY[0x263F0AEA0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v11 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);

  [WeakRetained _updateCacheWithModificationResponses:v11];
  [*(id *)(a1 + 32) respondWithPayload:v6 error:v7];
}

- (void)handleSetAccessCodeForUserMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling SetAccessCodeForUserMessage: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v8);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  __int16 v14 = __58__HMDAccessCodeManager_handleSetAccessCodeForUserMessage___block_invoke;
  uint64_t v15 = &unk_264A2D420;
  objc_copyWeak(&v17, (id *)buf);
  id v11 = v4;
  id v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _setAccessCodeForUserForMessage:](v8, "_setAccessCodeForUserForMessage:", v11, v12, v13, v14, v15); {

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __58__HMDAccessCodeManager_handleSetAccessCodeForUserMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void v12[2] = *MEMORY[0x263EF8340];
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = *MEMORY[0x263F0AEA0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v11 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);

  [WeakRetained _updateCacheWithModificationResponses:v11];
  [*(id *)(a1 + 32) respondWithPayload:v6 error:v7];
}

- (void)handleSubmitAccessCodeModificationRequestsMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling SubmitAccessCodeModificationRequestsMessage: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v8);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  __int16 v14 = __74__HMDAccessCodeManager_handleSubmitAccessCodeModificationRequestsMessage___block_invoke;
  uint64_t v15 = &unk_264A2D420;
  objc_copyWeak(&v17, (id *)buf);
  id v11 = v4;
  id v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _submitAccessCodeModificationRequestsForMessage:](v8, "_submitAccessCodeModificationRequestsForMessage:", v11, v12, v13, v14, v15); {

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __74__HMDAccessCodeManager_handleSubmitAccessCodeModificationRequestsMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void v12[2] = *MEMORY[0x263EF8340];
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = *MEMORY[0x263F0AEA0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v11 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);

  [WeakRetained _updateCacheWithModificationResponses:v11];
  [*(id *)(a1 + 32) respondWithPayload:v6 error:v7];
}

- (void)handleUnsubscribeMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v26 = 138543362;
    id v27 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling client unsubscribe message", (uint8_t *)&v26, 0xCu);
  }
  id v11 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    __int16 v14 = [(HMDAccessCodeManager *)v8 subscribedClientConnections];
    [v14 removeObject:v13];

    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = v8;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding with no payload after removing client from subscribed clients", (uint8_t *)&v26, 0xCu);
    }
    [v4 respondWithSuccess];
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    __int16 v20 = v8;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = [v4 transport];
      int v26 = 138543874;
      id v27 = v22;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      __int16 v31 = v24;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v26, 0x20u);
    }
    id v25 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v4 respondWithError:v25];
  }
}

- (void)handleSubscribeMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v26 = 138543362;
    id v27 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling client subscribe message", (uint8_t *)&v26, 0xCu);
  }
  id v11 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    __int16 v14 = [(HMDAccessCodeManager *)v8 subscribedClientConnections];
    [v14 addObject:v13];

    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = v8;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding with no payload after adding client to subscribed clients", (uint8_t *)&v26, 0xCu);
    }
    [v4 respondWithSuccess];
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    __int16 v20 = v8;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = [v4 transport];
      int v26 = 138543874;
      id v27 = v22;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      __int16 v31 = v24;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v26, 0x20u);
    }
    id v25 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    [v4 respondWithError:v25];
  }
}

- (void)fetchAccessCodeForIdentifier:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(HMDAccessCodeManager *)self context];
  uint64_t v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(HMDAccessCodeManager *)self dataManager];
  __int16 v14 = [v13 cachedAccessCodeForIdentifier:v8 accessoryUUID:v9];

  uint64_t v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = self;
  id v17 = HMFGetOSLogHandle();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v18)
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Found cached access code for identifier: %@, accessory UUID: %@", buf, 0x20u);
    }
    __int16 v20 = [v14 stringValue];
    v10[2](v10, v20, 0);
  }
  else
  {
    if (v18)
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetching access code for identifier: %@, accessory UUID: %@", buf, 0x20u);
    }
    uint64_t v22 = [(HMDAccessCodeManager *)v16 accessoryReaderWriter];
    uint64_t v23 = [v22 readAccessCodeWithIdentifier:v8 accessoryUUID:v9];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __78__HMDAccessCodeManager_fetchAccessCodeForIdentifier_accessoryUUID_completion___block_invoke;
    v25[3] = &unk_264A14BD0;
    v25[4] = v16;
    id v26 = v8;
    id v27 = v10;
    id v24 = (id)[v23 addCompletionBlock:v25];
  }
}

void __78__HMDAccessCodeManager_fetchAccessCodeForIdentifier_accessoryUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v17 = 138543618;
      BOOL v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetched access code for access code identifier: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 48);
    __int16 v14 = [v5 stringValue];
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);
  }
  else
  {
    if (v10)
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 138543874;
      BOOL v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch access code for access code identifier: %@ with error: %@", (uint8_t *)&v17, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)unconfigure
{
  id v3 = [(HMDAccessCodeManager *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 deregisterReceiver:self];

  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 administratorHandler];
  [v6 deregisterReceiver:self];

  id v8 = [(HMDAccessCodeManager *)self context];
  id v7 = [v8 notificationCenter];
  [v7 removeObserver:self];
}

- (void)configureWithMessageDispatcher:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessCodeManager *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDAccessCodeManager *)self context];
  [v7 configureWithMessageDispatcher:v4];

  id v8 = [(HMDAccessCodeManager *)self context];
  id v9 = [v8 home];

  if (!v9) {
    _HMFPreconditionFailure();
  }
  v65 = v4;
  BOOL v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    __int16 v14 = [(HMDAccessCodeManager *)v11 context];
    uint64_t v15 = [v14 UUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v71 = v13;
    __int16 v72 = 2112;
    v73 = v15;
    __int16 v74 = 2112;
    v75 = v9;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring HMDAccessCodeManager with UUID: %@, for home: %@", buf, 0x20u);
  }
  uint64_t v16 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  uint64_t v17 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  uint64_t v18 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v9 userPrivilege:5 remoteAccessRequired:0];
  __int16 v19 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v9 userPrivilege:4 remoteAccessRequired:0];
  v69[0] = v16;
  v69[1] = v18;
  v64 = (void *)v18;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
  v68[0] = v16;
  v68[1] = v17;
  uint64_t v63 = (void *)v17;
  v68[2] = v18;
  __int16 v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:3];
  id v22 = [(HMDAccessCodeManager *)v11 context];
  uint64_t v23 = [v22 messageDispatcher];
  [v23 registerForMessage:*MEMORY[0x263F0AF28] receiver:v11 policies:v20 selector:sel_handleSubscribeMessage_];

  id v24 = [(HMDAccessCodeManager *)v11 context];
  id v25 = [v24 messageDispatcher];
  [v25 registerForMessage:*MEMORY[0x263F0AF30] receiver:v11 policies:v20 selector:sel_handleUnsubscribeMessage_];

  id v26 = [(HMDAccessCodeManager *)v11 context];
  id v27 = [v26 messageDispatcher];
  [v27 registerForMessage:*MEMORY[0x263F0AE78] receiver:v11 policies:v21 selector:sel_handleFetchAccessCodesMessage_];

  __int16 v28 = [(HMDAccessCodeManager *)v11 context];
  uint64_t v29 = [v28 messageDispatcher];
  [v29 registerForMessage:*MEMORY[0x263F0AE70] receiver:v11 policies:v21 selector:sel_handleFetchAccessCodeConstraintsMessage_];

  __int16 v30 = [(HMDAccessCodeManager *)v11 context];
  id v31 = [v30 messageDispatcher];
  [v31 registerForMessage:*MEMORY[0x263F0AE88] receiver:v11 policies:v20 selector:sel_handleFetchHomeAccessCodesMessage_];

  __int16 v32 = [(HMDAccessCodeManager *)v11 context];
  id v33 = [v32 messageDispatcher];
  [v33 registerForMessage:*MEMORY[0x263F0AE80] receiver:v11 policies:v20 selector:sel_handleFetchCachedAccessCodesMessage_];

  uint64_t v34 = [(HMDAccessCodeManager *)v11 context];
  id v35 = [v34 messageDispatcher];
  [v35 registerForMessage:*MEMORY[0x263F0AF08] receiver:v11 policies:v21 selector:sel_handleResetAccessoryAccessCodesMessage_];

  uint64_t v36 = [(HMDAccessCodeManager *)v11 context];
  uint64_t v37 = [v36 messageDispatcher];
  [v37 registerForMessage:*MEMORY[0x263F0AF10] receiver:v11 policies:v21 selector:sel_handleSetAccessCodeForUserMessage_];

  uint64_t v38 = [(HMDAccessCodeManager *)v11 context];
  id v39 = [v38 messageDispatcher];
  [v39 registerForMessage:*MEMORY[0x263F0AF20] receiver:v11 policies:v21 selector:sel_handleSubmitAccessCodeModificationRequestsMessage_];

  uint64_t v40 = [(HMDAccessCodeManager *)v11 context];
  v41 = [v40 messageDispatcher];
  [v41 registerForMessage:@"HMAccessCodeManagerConfirmDataHasSyncedToResidentMessage" receiver:v11 policies:v21 selector:sel_handleConfirmDataHasSyncedToResidentMessage_];

  __int16 v42 = [(HMDAccessCodeManager *)v11 context];
  v43 = [v42 messageDispatcher];
  [v43 registerForMessage:@"HMDAccessCodeManagerUserAccessCodeDidChangeMessage" receiver:v11 policies:v21 selector:sel_handleUserAccessCodeDidChangeMessage_];

  v67[0] = v16;
  v67[1] = v19;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
  v66[0] = v16;
  v66[1] = v17;
  v66[2] = v19;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:3];
  v46 = [(HMDAccessCodeManager *)v11 context];
  v47 = [v46 administratorHandler];
  [v47 registerForMessage:*MEMORY[0x263F0AF18] receiver:v11 policies:v44 selector:sel_handleSetUserInformationMessage_];

  v48 = [(HMDAccessCodeManager *)v11 context];
  id v49 = [v48 administratorHandler];
  [v49 registerForMessage:*MEMORY[0x263F0AEF8] receiver:v11 policies:v44 selector:sel_handleRemoveHomeAccessCodeMessage_];

  uint64_t v50 = [(HMDAccessCodeManager *)v11 context];
  uint64_t v51 = [v50 messageDispatcher];
  [v51 registerForMessage:*MEMORY[0x263F0AE90] receiver:v11 policies:v45 selector:sel_handleGenerateNewUserAccessCodeMessage_];

  v52 = [(HMDAccessCodeManager *)v11 context];
  v53 = [v52 messageDispatcher];
  [v53 registerForMessage:*MEMORY[0x263F0AF00] receiver:v11 policies:v45 selector:sel_handleRemoveSimpleLabelAccessCodeMessage_];

  id v54 = [(HMDAccessCodeManager *)v11 context];
  v55 = [v54 notificationCenter];
  [v55 addObserver:v11 selector:sel_handleHomeUserRemovedNotification_ name:@"HMDHomeUserRemovedNotification" object:v9];

  id v56 = [(HMDAccessCodeManager *)v11 context];
  v57 = [v56 notificationCenter];
  [v57 addObserver:v11 selector:sel_handleAccessorySupportsAccessCodeDidChangeNotification_ name:@"HMDAccessorySupportsAccessCodeDidChangeNotification" object:0];

  v58 = [(HMDAccessCodeManager *)v11 context];
  id v59 = [v58 notificationCenter];
  [v59 addObserver:v11 selector:sel_handleHomeDidEnableCharacteristicNotification_ name:@"HMDHomeDidEnableCharacteristicNotifyEventNotification" object:v9];

  v60 = [(HMDAccessCodeManager *)v11 context];
  id v61 = [v60 notificationCenter];
  [v61 addObserver:v11 selector:sel_handleHomeDidDisableCharacteristicNotification_ name:@"HMDHomeDidDisableCharacteristicNotifyEventNotification" object:v9];

  id v62 = [(HMDAccessCodeManager *)v11 dataManager];
  [v62 configure];
}

- (HMDAccessCodeManager)initWithContext:(id)a3 utilities:(Class)a4 accessoryReaderWriter:(id)a5 dataManager:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDAccessCodeManager;
  __int16 v14 = [(HMDAccessCodeManager *)&v19 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_context, a3);
    objc_storeStrong((id *)&v15->_utilities, a4);
    objc_storeStrong((id *)&v15->_accessoryReaderWriter, a5);
    objc_storeStrong((id *)&v15->_dataManager, a6);
    uint64_t v16 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    subscribedClientConnections = v15->_subscribedClientConnections;
    v15->_subscribedClientConnections = (NSHashTable *)v16;
  }
  return v15;
}

- (HMDAccessCodeManager)initWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[HMDAccessoryAccessCodeReaderWriter alloc] initWithContext:v4];
  id v6 = [[HMDAccessCodeDataManager alloc] initWithContext:v4 delegate:self];
  id v7 = [(HMDAccessCodeManager *)self initWithContext:v4 utilities:objc_opt_class() accessoryReaderWriter:v5 dataManager:v6];

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t107 != -1) {
    dispatch_once(&logCategory__hmf_once_t107, &__block_literal_global_397);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v108;
  return v2;
}

void __35__HMDAccessCodeManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v108;
  logCategory__hmf_once_v108 = v0;
}

@end