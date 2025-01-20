@interface HMMTRSyncClusterDoorLock
+ (id)deriveHomePinFromUUID:(id)a3 withNumberOfDigits:(int64_t)a4 flow:(id)a5;
+ (id)doorLockFeatureMapSupportsAliroBLEUWB:(id)a3;
+ (id)doorLockFeatureMapSupportsAliroProvisioning:(id)a3;
+ (id)doorLockFeatureMapSupportsPinCodes:(id)a3;
+ (id)doorLockFeatureMapSupportsWeekDaySchedule:(id)a3;
+ (id)doorLockFeatureMapSupportsYearDaySchedule:(id)a3;
+ (id)logCategory;
+ (id)numberFromAttributeDictionary:(id)a3;
+ (id)numberFromAttributeResponse:(id)a3;
+ (id)pinDataWithDigits:(id)a3;
+ (id)validateFutureResults:(id)a3 ofClass:(Class)a4 areNullable:(BOOL)a5 flow:(id)a6;
+ (id)valueFromAttributeResponse:(id)a3;
+ (id)valueFromDictionaryWithData:(id)a3;
- (HMFFuture)apiSerializationFuture;
- (HMMTRAccessoryServer)accessoryServer;
- (HMMTRDoorLockClusterAPIRouter)apiRouter;
- (HMMTRSyncClusterDoorLock)initWithDevice:(id)a3 baseDevice:(id)a4 endpoint:(unsigned __int16)a5 queue:(id)a6 accessoryServer:(id)a7;
- (HMMTRSyncClusterDoorLock)lockWithPin:(id)a3 flow:(id)a4;
- (MTRBaseClusterDoorLock)baseDoorLock;
- (MTRBaseDevice)baseDevice;
- (OS_dispatch_queue)queue;
- (id)_findSchedulesToBeAdded:(id)a3 dict:(id)a4;
- (id)_findUserOrAvailableSlotWithUserUniqueID:(id)a3 flow:(id)a4;
- (id)_getUserAtIndex:(int64_t)a3 includeAliroCredentials:(BOOL)a4 flow:(id)a5;
- (id)_removeUserWithUniqueID:(id)a3 flow:(id)a4;
- (id)accessoryHasCOTAEnabledWithFlow:(id)a3;
- (id)addCredentialData:(id)a3 forCredentialType:(id)a4 atIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7;
- (id)addDeviceCredentialKeyData:(id)a3 ofType:(int64_t)a4 forUserIndex:(int64_t)a5 flow:(id)a6;
- (id)addIssuerKeyData:(id)a3 forUserIndex:(int64_t)a4 isUnifiedAccess:(BOOL)a5 flow:(id)a6;
- (id)addOrUpdatePinCodeWithValue:(id)a3 forUserIndex:(int64_t)a4;
- (id)addOrUpdateReaderKeyData:(id)a3 flow:(id)a4;
- (id)addPinCodeWithValue:(id)a3 forUserIndex:(int64_t)a4 flow:(id)a5;
- (id)addPinCredentialAtIndex:(int64_t)a3 withValue:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6;
- (id)addReaderKeyData:(id)a3 toUserIndex:(int64_t)a4 flow:(id)a5;
- (id)addUserAtUserIndex:(int64_t)a3 withUserUniqueID:(int64_t)a4 userType:(id)a5 flow:(id)a6;
- (id)clearCredentialAtIndex:(int64_t)a3 withCredentialType:(id)a4 flow:(id)a5;
- (id)clearScheduleOfScheduleType:(int64_t)a3 atScheduleIndex:(int64_t)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6;
- (id)clearUserAtIndex:(int64_t)a3 flow:(id)a4;
- (id)deriveHomePinFromUUID:(id)a3 flow:(id)a4;
- (id)ensureAccessoryConnected:(id)a3 flow:(id)a4;
- (id)fetchAccessoryColor_flow:(id)a3;
- (id)fetchAccessorySupportsAliroBLEUWBWithFlow:(id)a3;
- (id)fetchAccessorySupportsAliroProvisioningWithFlow:(id)a3;
- (id)fetchAccessorySupportsPinCodesWithFlow:(id)a3;
- (id)fetchAccessorySupportsTapToUnlock;
- (id)fetchCurrentFabricIndex;
- (id)fetchCurrentFabricIndex_flow:(id)a3;
- (id)fetchFeatureMapForSupportingWeekAndYearDayScheduleWithFlow:(id)a3;
- (id)fetchFeatureMapWithFlow:(id)a3;
- (id)fetchReaderGroupSubIdentifier;
- (id)findAllUsersWithCreatorFabricIndex:(id)a3 indexStartingAtSlot:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 users:(id)a6 flow:(id)a7;
- (id)findAvailableCredentialIndexStartingAtSlot:(int64_t)a3 forCredentialType:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 flow:(id)a6;
- (id)findHomeUserWithUniqueID:(id)a3 indexStartingAtSlot:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 availableSlots:(id)a6 currentFabricIndex:(id)a7 flow:(id)a8;
- (id)findOperationOrderForModifyingWeekDaySchedules:(id)a3 andYearDaySchedules:(id)a4 forUserIndex:(int64_t)a5 flow:(id)a6;
- (id)findOrAddUserWithUniqueID:(id)a3 flow:(id)a4;
- (id)findOrAddUserWithUniqueID:(id)a3 userType:(id)a4 flow:(id)a5;
- (id)findOrAddUserWithUniqueID:(id)a3 withWeekDaySchedules:(id)a4 andYearDaySchedules:(id)a5 flow:(id)a6;
- (id)findScheduleSlotsToAddAndClearForScheduleType:(int64_t)a3 withRequestedSchedules:(id)a4 forUserAtUserIndex:(int64_t)a5 numberOfSchedulesSupported:(int64_t)a6 flow:(id)a7;
- (id)findUserOrAvailableSlotWithUserUniqueID:(id)a3 flow:(id)a4;
- (id)firstAvailableCredentialSlotForCredentialType:(int64_t)a3 flow:(id)a4;
- (id)getAllCredentialsIndexStartingAtSlot:(int64_t)a3 forCredentialType:(int64_t)a4 credentials:(id)a5 flow:(id)a6;
- (id)getAllPinCodes;
- (id)getAllUsers;
- (id)getAllUsersStartingAtSlot:(int64_t)a3 assumingTotalNumberOfSlots:(int64_t)a4 users:(id)a5 flow:(id)a6;
- (id)getCredentialAtIndex:(int64_t)a3 forCredentialType:(int64_t)a4 flow:(id)a5;
- (id)getScheduleOfScheduleType:(int64_t)a3 atScheduleIndex:(int64_t)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6;
- (id)getUserAtIndex:(int64_t)a3 flow:(id)a4;
- (id)getUsersWithUniqueIDs:(id)a3 flow:(id)a4;
- (id)lock_flow:(id)a3;
- (id)numberOfWeekDaySchedulesSupportedWithFlow:(id)a3;
- (id)numberOfYearDaySchedulesSupportedWithFlow:(id)a3;
- (id)pinCredentialForUser:(id)a3 flow:(id)a4;
- (id)provisionHomePin:(id)a3 flow:(id)a4;
- (id)readReaderConfigWithFlow:(id)a3;
- (id)readScheduleForScheduleType:(int64_t)a3 forUserIndex:(int64_t)a4 flow:(id)a5;
- (id)readSchedulesForUserIndex:(int64_t)a3 flow:(id)a4;
- (id)readSchedulesForWritingForScheduleType:(int64_t)a3 forUserIndex:(int64_t)a4 startingAtSlot:(int64_t)a5 assumingTotalNumberOfSlots:(int64_t)a6 schedulesToSlots:(id)a7 availableSlots:(id)a8 flow:(id)a9;
- (id)removeHomeUser;
- (id)removePinCodeForUserIndex:(int64_t)a3;
- (id)removeUserWithUniqueID:(id)a3;
- (id)rfidCredentialForUser:(id)a3 flow:(id)a4;
- (id)serialize:(id)a3;
- (id)setOrReadReaderConfig:(id)a3 flow:(id)a4;
- (id)setScheduleOfScheduleType:(int64_t)a3 withSchedule:(id)a4 atScheduleIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7;
- (id)totalNumberOfPINCredentialsSupported_flow:(id)a3;
- (id)totalNumberOfRFIDCredentialsSupported_flow:(id)a3;
- (id)totalNumberOfUsersSupported_flow:(id)a3;
- (id)unlockWithPin:(id)a3 flow:(id)a4;
- (id)unlock_flow:(id)a3;
- (id)updateCredentialData:(id)a3 forCredentialType:(id)a4 atIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7;
- (id)updatePinCredentialAtIndex:(int64_t)a3 withValue:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6;
- (id)updateSchedulesForUserIndex:(int64_t)a3 withWeekDaySchedules:(id)a4 andYearDaySchedules:(id)a5 flow:(id)a6;
- (id)updateSchedulesOfScheduleType:(int64_t)a3 withRequestedSchedules:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6;
- (id)updateUserTypeForUserIndex:(int64_t)a3 userType:(id)a4 flow:(id)a5;
- (int64_t)totalNumberOfSchedulesSupportedOfScheduleType:(int64_t)a3 withDefaultCapacity:(int64_t)a4 flow:(id)a5;
- (os_unfair_lock_s)unfairLock;
- (unsigned)endpoint;
- (void)dealloc;
- (void)lockDoorWithAccessoryUUID:(id)a3 completionHandler:(id)a4;
- (void)readAttributeCurrentFabricIndexWithCompletionHandler:(id)a3;
- (void)readAttributeWithEndpointIDAndCompletion:(id)a3 clusterID:(id)a4 attributeID:(id)a5 completion:(id)a6;
- (void)setApiRouter:(id)a3;
- (void)setApiSerializationFuture:(id)a3;
- (void)setBaseDevice:(id)a3;
- (void)setBaseDoorLock:(id)a3;
- (void)setEndpoint:(unsigned __int16)a3;
- (void)setQueue:(id)a3;
- (void)unlockDoorWithAccessoryUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation HMMTRSyncClusterDoorLock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apiRouter, 0);
  objc_storeStrong((id *)&self->_baseDoorLock, 0);
  objc_storeStrong((id *)&self->_baseDevice, 0);
  objc_destroyWeak((id *)&self->_accessoryServer);
  objc_storeStrong((id *)&self->_apiSerializationFuture, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setApiRouter:(id)a3
{
}

- (HMMTRDoorLockClusterAPIRouter)apiRouter
{
  return (HMMTRDoorLockClusterAPIRouter *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBaseDoorLock:(id)a3
{
}

- (MTRBaseClusterDoorLock)baseDoorLock
{
  return (MTRBaseClusterDoorLock *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBaseDevice:(id)a3
{
}

- (MTRBaseDevice)baseDevice
{
  return (MTRBaseDevice *)objc_getProperty(self, a2, 64, 1);
}

- (HMMTRAccessoryServer)accessoryServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryServer);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setApiSerializationFuture:(id)a3
{
}

- (HMFFuture)apiSerializationFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEndpoint:(unsigned __int16)a3
{
  self->_endpoint = a3;
}

- (unsigned)endpoint
{
  return self->_endpoint;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@dealloc", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMMTRSyncClusterDoorLock;
  [(HMMTRSyncClusterDoorLock *)&v7 dealloc];
}

- (id)accessoryHasCOTAEnabledWithFlow:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__HMMTRSyncClusterDoorLock_accessoryHasCOTAEnabledWithFlow___block_invoke;
  v5[3] = &unk_265374CC8;
  v5[4] = self;
  v3 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v5 flow:a3];
  return v3;
}

id __60__HMMTRSyncClusterDoorLock_accessoryHasCOTAEnabledWithFlow___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) readAttributeRequirePINforRemoteOperationWithParams:0];
  v2 = (void *)MEMORY[0x263F42538];
  v3 = [v1 objectForKey:@"value"];
  v4 = [v2 futureWithValue:v3];

  return v4;
}

- (id)readScheduleForScheduleType:(int64_t)a3 forUserIndex:(int64_t)a4 flow:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v8 UUID];
    *(_DWORD *)buf = 138544130;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v13;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] readScheduleForScheduleType: %ld, forUserIndex: %ld", buf, 0x2Au);
  }
  uint64_t v14 = [(HMMTRSyncClusterDoorLock *)v10 totalNumberOfSchedulesSupportedOfScheduleType:a3 withDefaultCapacity:1 flow:v8];
  v15 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  v16 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  v17 = [(HMMTRSyncClusterDoorLock *)v10 readSchedulesForWritingForScheduleType:a3 forUserIndex:a4 startingAtSlot:1 assumingTotalNumberOfSlots:v14 schedulesToSlots:v15 availableSlots:v16 flow:v8];
  v18 = [v17 then:&__block_literal_global_292];

  return v18;
}

uint64_t __74__HMMTRSyncClusterDoorLock_readScheduleForScheduleType_forUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 schedulesToSlots];
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_295);
  objc_claimAutoreleasedReturnValue();

  return 1;
}

id __74__HMMTRSyncClusterDoorLock_readScheduleForScheduleType_forUserIndex_flow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v6 = [a3 count];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__HMMTRSyncClusterDoorLock_readScheduleForScheduleType_forUserIndex_flow___block_invoke_3;
  v10[3] = &unk_265375630;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v5, "na_arrayByRepeatingWithCount:generatorBlock:", v6, v10);

  return v8;
}

id __74__HMMTRSyncClusterDoorLock_readScheduleForScheduleType_forUserIndex_flow___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)getScheduleOfScheduleType:(int64_t)a3 atScheduleIndex:(int64_t)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    v15 = [v10 UUID];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v41 = 2112;
    v42 = v15;
    __int16 v43 = 2048;
    int64_t v44 = a3;
    __int16 v45 = 2048;
    int64_t v46 = a4;
    __int16 v47 = 2048;
    int64_t v48 = a5;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getScheduleOfScheduleType: %ld, atScheduleIndex: %ld, and forUserAtUserIndex: %ld", buf, 0x34u);
  }
  if (a3 == 1)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F10E50]);
    v23 = [NSNumber numberWithInteger:a5];
    [v16 setUserIndex:v23];

    __int16 v24 = [NSNumber numberWithInteger:a4];
    [v16 setYearDayIndex:v24];

    *(void *)buf = 0;
    v19 = [MEMORY[0x263F42538] futureWithPromise:buf];
    int64_t v25 = [*(id *)buf resolverBlock];
    [(MTRClusterDoorLock *)v12 getYearDayScheduleWithParams:v16 expectedValues:0 expectedValueInterval:0 completion:v25];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_2_290;
    v32[3] = &unk_2653755A8;
    v32[4] = v12;
    id v33 = v10;
    int64_t v34 = a4;
    int64_t v35 = a5;
    v21 = [v19 then:&__block_literal_global_288 orRecover:v32];
    __int16 v22 = v33;
    goto LABEL_7;
  }
  if (!a3)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F10E48]);
    v17 = [NSNumber numberWithInteger:a5];
    [v16 setUserIndex:v17];

    v18 = [NSNumber numberWithInteger:a4];
    [v16 setWeekDayIndex:v18];

    *(void *)buf = 0;
    v19 = [MEMORY[0x263F42538] futureWithPromise:buf];
    v20 = [*(id *)buf resolverBlock];
    [(MTRClusterDoorLock *)v12 getWeekDayScheduleWithParams:v16 expectedValues:0 expectedValueInterval:0 completion:v20];

    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_2;
    v36[3] = &unk_2653755A8;
    v36[4] = v12;
    id v37 = v10;
    int64_t v38 = a4;
    int64_t v39 = a5;
    v21 = [v19 then:&__block_literal_global_282 orRecover:v36];
    __int16 v22 = v37;
LABEL_7:

    goto LABEL_11;
  }
  __int16 v26 = (void *)MEMORY[0x2533B64D0]();
  int64_t v27 = v12;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    v30 = [v10 UUID];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v29;
    __int16 v41 = 2112;
    v42 = v30;
    __int16 v43 = 2048;
    int64_t v44 = a4;
    __int16 v45 = 2048;
    int64_t v46 = a5;
    __int16 v47 = 2048;
    int64_t v48 = a3;
    _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to get schedule at scheduleIndex: %ld and userIndex: %ld since scheduleType was of unknown type: %ld.", buf, 0x34u);
  }
  v21 = [MEMORY[0x263F42538] futureWithError:0];
LABEL_11:

  return v21;
}

uint64_t __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    int v15 = 138544386;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to get week day schedule at scheduleIndex: %ld and userIndex: %ld with error: %@", (uint8_t *)&v15, 0x34u);
  }
  id v11 = v3;
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_2_290(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    int v15 = 138544386;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to get year day schedule at scheduleIndex: %ld and userIndex: %ld with error: %@", (uint8_t *)&v15, 0x34u);
  }
  id v11 = v3;
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_285(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HMMTRYearDaySchedule alloc] initWithMTRSchedule:v2];

  id v4 = v3;
  return 1;
}

uint64_t __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HMMTRWeekDaySchedule alloc] initWithMTRSchedule:v2];

  id v4 = v3;
  return 1;
}

- (id)updateUserTypeForUserIndex:(int64_t)a3 userType:(id)a4 flow:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x2533B64D0]();
  id v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = [v9 UUID];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v13;
    __int16 v25 = 2112;
    __int16 v26 = v14;
    __int16 v27 = 2048;
    int64_t v28 = a3;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updateUserTypeForUserIndex: %ld, userType: %@", buf, 0x2Au);
  }
  id v15 = objc_alloc_init(MEMORY[0x263F10E80]);
  [v15 setOperationType:&unk_2702B4EF0];
  id v16 = [NSNumber numberWithInteger:a3];
  [v15 setUserIndex:v16];

  [v15 setUserType:v8];
  *(void *)buf = 0;
  __int16 v17 = [MEMORY[0x263F42538] futureWithPromise:buf];
  v18 = [*(id *)buf errorOnlyResolverBlock];
  [(MTRClusterDoorLock *)v11 setUserWithParams:v15 expectedValues:0 expectedValueInterval:0 completionHandler:v18];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69__HMMTRSyncClusterDoorLock_updateUserTypeForUserIndex_userType_flow___block_invoke;
  v22[3] = &unk_265376318;
  v22[4] = v11;
  id v23 = v9;
  id v19 = v9;
  uint64_t v20 = [v17 recover:v22];

  return v20;
}

uint64_t __69__HMMTRSyncClusterDoorLock_updateUserTypeForUserIndex_userType_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add user with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)setScheduleOfScheduleType:(int64_t)a3 withSchedule:(id)a4 atScheduleIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  if (a3 == 1)
  {
    *(void *)buf = 0;
    uint64_t v14 = [MEMORY[0x263F42538] futureWithPromise:buf];
    uint64_t v19 = [*(id *)buf errorOnlyResolverBlock];
    uint64_t v20 = [v12 convertToMTRScheduleAtScheduleIndex:a5 forUserAtUserIndex:a6];
    [(MTRClusterDoorLock *)self setYearDayScheduleWithParams:v20 expectedValues:0 expectedValueInterval:0 completion:v19];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __107__HMMTRSyncClusterDoorLock_setScheduleOfScheduleType_withSchedule_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_278;
    v27[3] = &unk_265376318;
    v27[4] = self;
    id v28 = v13;
    __int16 v17 = [v14 recover:v27];
    id v18 = v28;
    goto LABEL_5;
  }
  if (!a3)
  {
    *(void *)buf = 0;
    uint64_t v14 = [MEMORY[0x263F42538] futureWithPromise:buf];
    __int16 v15 = [*(id *)buf errorOnlyResolverBlock];
    id v16 = [v12 convertToMTRScheduleAtScheduleIndex:a5 forUserAtUserIndex:a6];
    [(MTRClusterDoorLock *)self setWeekDayScheduleWithParams:v16 expectedValues:0 expectedValueInterval:0 completion:v15];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __107__HMMTRSyncClusterDoorLock_setScheduleOfScheduleType_withSchedule_atScheduleIndex_forUserAtUserIndex_flow___block_invoke;
    v29[3] = &unk_265376318;
    v29[4] = self;
    id v30 = v13;
    __int16 v17 = [v14 recover:v29];
    id v18 = v30;
LABEL_5:

    goto LABEL_9;
  }
  __int16 v21 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v22 = self;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    id v24 = HMFGetLogIdentifier();
    __int16 v25 = [v13 UUID];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v24;
    __int16 v32 = 2112;
    id v33 = v25;
    __int16 v34 = 2048;
    int64_t v35 = a3;
    _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set schedule with error of unknown HMMTRScheduleType: %ld", buf, 0x20u);
  }
  __int16 v17 = [MEMORY[0x263F42538] futureWithError:0];
LABEL_9:

  return v17;
}

uint64_t __107__HMMTRSyncClusterDoorLock_setScheduleOfScheduleType_withSchedule_atScheduleIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set weekday schedule with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __107__HMMTRSyncClusterDoorLock_setScheduleOfScheduleType_withSchedule_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_278(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set yearday schedule with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)clearScheduleOfScheduleType:(int64_t)a3 atScheduleIndex:(int64_t)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    __int16 v15 = [v10 UUID];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v37 = 2112;
    int64_t v38 = v15;
    __int16 v39 = 2048;
    int64_t v40 = a3;
    __int16 v41 = 2048;
    int64_t v42 = a4;
    __int16 v43 = 2048;
    int64_t v44 = a5;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] clearScheduleOfScheduleType: %ld, atScheduleIndex: %ld, for userIndex: %ld", buf, 0x34u);
  }
  if (a3 == 1)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F10E18]);
    id v23 = [NSNumber numberWithInteger:a4];
    [v16 setYearDayIndex:v23];

    id v24 = [NSNumber numberWithInteger:a5];
    [v16 setUserIndex:v24];

    *(void *)buf = 0;
    uint64_t v19 = [MEMORY[0x263F42538] futureWithPromise:buf];
    __int16 v25 = [*(id *)buf errorOnlyResolverBlock];
    [(MTRClusterDoorLock *)v12 clearYearDayScheduleWithParams:v16 expectedValues:0 expectedValueInterval:0 completion:v25];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __96__HMMTRSyncClusterDoorLock_clearScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_277;
    v32[3] = &unk_265376318;
    v32[4] = v12;
    id v33 = v10;
    __int16 v21 = [v19 recover:v32];
    uint64_t v22 = v33;
    goto LABEL_7;
  }
  if (!a3)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F10E10]);
    __int16 v17 = [NSNumber numberWithInteger:a4];
    [v16 setWeekDayIndex:v17];

    id v18 = [NSNumber numberWithInteger:a5];
    [v16 setUserIndex:v18];

    *(void *)buf = 0;
    uint64_t v19 = [MEMORY[0x263F42538] futureWithPromise:buf];
    uint64_t v20 = [*(id *)buf errorOnlyResolverBlock];
    [(MTRClusterDoorLock *)v12 clearWeekDayScheduleWithParams:v16 expectedValues:0 expectedValueInterval:0 completion:v20];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __96__HMMTRSyncClusterDoorLock_clearScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke;
    v34[3] = &unk_265376318;
    v34[4] = v12;
    id v35 = v10;
    __int16 v21 = [v19 recover:v34];
    uint64_t v22 = v35;
LABEL_7:

    goto LABEL_11;
  }
  __int16 v26 = (void *)MEMORY[0x2533B64D0]();
  __int16 v27 = v12;
  id v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    __int16 v29 = HMFGetLogIdentifier();
    id v30 = [v10 UUID];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v29;
    __int16 v37 = 2112;
    int64_t v38 = v30;
    __int16 v39 = 2048;
    int64_t v40 = a3;
    _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to clear schedule with error of unknown HMMTRScheduleType: %ld", buf, 0x20u);
  }
  __int16 v21 = [MEMORY[0x263F42538] futureWithError:0];
LABEL_11:

  return v21;
}

uint64_t __96__HMMTRSyncClusterDoorLock_clearScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to clear weekday schedule with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __96__HMMTRSyncClusterDoorLock_clearScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_277(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to clear yearday schedule with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (int64_t)totalNumberOfSchedulesSupportedOfScheduleType:(int64_t)a3 withDefaultCapacity:(int64_t)a4 flow:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (a3 == 1)
  {
    id v9 = [(MTRClusterDoorLock *)self readAttributeNumberOfYearDaySchedulesSupportedPerUserWithParams:0];
    uint64_t v10 = [v9 objectForKey:@"value"];
    if (!v10)
    {
      id v24 = (void *)MEMORY[0x2533B64D0]();
      __int16 v25 = self;
      __int16 v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = HMFGetLogIdentifier();
        id v28 = [v8 UUID];
        int v29 = 138543618;
        id v30 = v27;
        __int16 v31 = 2112;
        __int16 v32 = v28;
        _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of yearday schedule slots, assuming 1 by default", (uint8_t *)&v29, 0x16u);
      }
      id v16 = &unk_2702B4ED8;
      goto LABEL_9;
    }
LABEL_8:
    id v16 = (void *)v10;
LABEL_9:

    int64_t v17 = [v16 integerValue];
    goto LABEL_13;
  }
  if (!a3)
  {
    id v9 = [(MTRClusterDoorLock *)self readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithParams:0];
    uint64_t v10 = [v9 objectForKey:@"value"];
    if (!v10)
    {
      id v11 = (void *)MEMORY[0x2533B64D0]();
      id v12 = self;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        __int16 v15 = [v8 UUID];
        int v29 = 138543874;
        id v30 = v14;
        __int16 v31 = 2112;
        __int16 v32 = v15;
        __int16 v33 = 2048;
        int64_t v34 = a4;
        _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of weekday schedule slots, assuming %ld by default", (uint8_t *)&v29, 0x20u);
      }
      uint64_t v10 = [NSNumber numberWithInteger:a4];
    }
    goto LABEL_8;
  }
  id v18 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v19 = self;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = HMFGetLogIdentifier();
    uint64_t v22 = [v8 UUID];
    int v29 = 138543874;
    id v30 = v21;
    __int16 v31 = 2112;
    __int16 v32 = v22;
    __int16 v33 = 2048;
    int64_t v34 = a3;
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] ScheduleType unknown of type: %ld", (uint8_t *)&v29, 0x20u);
  }
  int64_t v17 = 0;
LABEL_13:

  return v17;
}

- (id)numberOfYearDaySchedulesSupportedWithFlow:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HMMTRSyncClusterDoorLock_numberOfYearDaySchedulesSupportedWithFlow___block_invoke;
  v8[3] = &unk_265374CF0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v8 flow:v5];

  return v6;
}

id __70__HMMTRSyncClusterDoorLock_numberOfYearDaySchedulesSupportedWithFlow___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F42538];
  id v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalNumberOfSchedulesSupportedOfScheduleType:withDefaultCapacity:flow:", 1, 0, *(void *)(a1 + 40)));
  id v3 = [v1 futureWithValue:v2];

  return v3;
}

- (id)numberOfWeekDaySchedulesSupportedWithFlow:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HMMTRSyncClusterDoorLock_numberOfWeekDaySchedulesSupportedWithFlow___block_invoke;
  v8[3] = &unk_265374CF0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v8 flow:v5];

  return v6;
}

id __70__HMMTRSyncClusterDoorLock_numberOfWeekDaySchedulesSupportedWithFlow___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F42538];
  id v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalNumberOfSchedulesSupportedOfScheduleType:withDefaultCapacity:flow:", 0, 0, *(void *)(a1 + 40)));
  id v3 = [v1 futureWithValue:v2];

  return v3;
}

- (id)totalNumberOfRFIDCredentialsSupported_flow:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MTRGenericCluster *)self device];

  if (v5)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__HMMTRSyncClusterDoorLock_totalNumberOfRFIDCredentialsSupported_flow___block_invoke;
    v13[3] = &unk_265374CF0;
    v13[4] = self;
    id v14 = v4;
    uint64_t v6 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v13 flow:v14];
  }
  else
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No MTRDevice, assuming 50 slots", buf, 0x16u);
    }
    uint64_t v6 = [MEMORY[0x263F42538] futureWithValue:&unk_2702B5010];
  }

  return v6;
}

id __71__HMMTRSyncClusterDoorLock_totalNumberOfRFIDCredentialsSupported_flow___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) readAttributeNumberOfRFIDUsersSupportedWithParams:0];
  id v3 = [v2 objectForKey:@"value"];
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 40) UUID];
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of RFID credential slots, assuming 50 by default", (uint8_t *)&v11, 0x16u);
    }
    id v3 = &unk_2702B5010;
  }
  id v9 = [MEMORY[0x263F42538] futureWithValue:v3];

  return v9;
}

- (id)totalNumberOfPINCredentialsSupported_flow:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MTRGenericCluster *)self device];

  if (v5)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__HMMTRSyncClusterDoorLock_totalNumberOfPINCredentialsSupported_flow___block_invoke;
    v13[3] = &unk_265374CF0;
    v13[4] = self;
    id v14 = v4;
    uint64_t v6 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v13 flow:v14];
  }
  else
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No MTRDevice, assuming 50 slots", buf, 0x16u);
    }
    uint64_t v6 = [MEMORY[0x263F42538] futureWithValue:&unk_2702B5010];
  }

  return v6;
}

id __70__HMMTRSyncClusterDoorLock_totalNumberOfPINCredentialsSupported_flow___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) readAttributeNumberOfPINUsersSupportedWithParams:0];
  id v3 = [v2 objectForKey:@"value"];
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 40) UUID];
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of PIN credential slots, assuming 50 by default", (uint8_t *)&v11, 0x16u);
    }
    id v3 = &unk_2702B5010;
  }
  id v9 = [MEMORY[0x263F42538] futureWithValue:v3];

  return v9;
}

- (id)totalNumberOfUsersSupported_flow:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MTRGenericCluster *)self device];

  if (v5)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__HMMTRSyncClusterDoorLock_totalNumberOfUsersSupported_flow___block_invoke;
    v13[3] = &unk_265374CF0;
    v13[4] = self;
    id v14 = v4;
    uint64_t v6 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v13 flow:v14];
  }
  else
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No MTRDevice, assuming 50 slots", buf, 0x16u);
    }
    uint64_t v6 = [MEMORY[0x263F42538] futureWithValue:&unk_2702B5010];
  }

  return v6;
}

id __61__HMMTRSyncClusterDoorLock_totalNumberOfUsersSupported_flow___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) readAttributeNumberOfTotalUsersSupportedWithParams:0];
  id v3 = [v2 objectForKey:@"value"];
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 40) UUID];
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of user slots, assuming 50 by default", (uint8_t *)&v11, 0x16u);
    }
    id v3 = &unk_2702B5010;
  }
  id v9 = [MEMORY[0x263F42538] futureWithValue:v3];

  return v9;
}

- (id)fetchCurrentFabricIndex_flow:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MTRGenericCluster *)self device];

  if (v5)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    id v17 = v4;
    uint64_t v6 = objc_msgSend(MEMORY[0x263F42530], "untrackedPlaceholderFlow", v16, 3221225472, __57__HMMTRSyncClusterDoorLock_fetchCurrentFabricIndex_flow___block_invoke, &unk_265374CF0, self);
    id v7 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:&v16 flow:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      id v12 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] THIS IS A BUG: device is nil, this should not happen.", buf, 0x16u);
    }
    __int16 v13 = (void *)MEMORY[0x263F42538];
    id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:2 userInfo:0];
    id v7 = [v13 futureWithError:v14];
  }
  return v7;
}

id __57__HMMTRSyncClusterDoorLock_fetchCurrentFabricIndex_flow___block_invoke(uint64_t a1)
{
  id v9 = 0;
  id v2 = [MEMORY[0x263F42538] futureWithPromise:&v9];
  id v3 = [v9 resolverBlock];
  [*(id *)(a1 + 32) readAttributeCurrentFabricIndexWithCompletionHandler:v3];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMMTRSyncClusterDoorLock_fetchCurrentFabricIndex_flow___block_invoke_2;
  v7[3] = &unk_265376318;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v5 = [v2 recover:v7];

  return v5;
}

uint64_t __57__HMMTRSyncClusterDoorLock_fetchCurrentFabricIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch current fabric index with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (void)readAttributeCurrentFabricIndexWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v22 = 138543618;
    id v23 = v8;
    __int16 v24 = 2112;
    __int16 v25 = v6;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Getting current fabric index: %@", (uint8_t *)&v22, 0x16u);
  }
  id v9 = objc_alloc(MEMORY[0x263F10D20]);
  uint64_t v10 = [(MTRGenericCluster *)v6 device];
  id v11 = [(HMMTRSyncClusterDoorLock *)v6 queue];
  id v12 = (void *)[v9 initWithDevice:v10 endpointID:&unk_2702B4F38 queue:v11];

  id v13 = objc_alloc_init(MEMORY[0x263F10FA0]);
  [v13 setFilterByFabric:0];
  id v14 = [v12 readAttributeCurrentFabricIndexWithParams:v13];
  __int16 v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "hmf_numberForKey:", *MEMORY[0x263F10C30]);
    uint64_t v16 = (HMMTRSyncClusterDoorLock *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      __int16 v17 = (void *)MEMORY[0x2533B64D0]();
      id v18 = v6;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v22 = 138543618;
        id v23 = v20;
        __int16 v24 = 2112;
        __int16 v25 = v16;
        _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Current Fabric Index: %@", (uint8_t *)&v22, 0x16u);
      }
      v4[2](v4, v16, 0);
    }
    else
    {
      __int16 v21 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v21);
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    ((void (**)(id, void *, HMMTRSyncClusterDoorLock *))v4)[2](v4, 0, v16);
  }
}

- (id)fetchCurrentFabricIndex
{
  id v3 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
  id v4 = [(HMMTRSyncClusterDoorLock *)self fetchCurrentFabricIndex_flow:v3];

  return v4;
}

- (id)getCredentialAtIndex:(int64_t)a3 forCredentialType:(int64_t)a4 flow:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [v8 UUID];
    *(_DWORD *)buf = 138544130;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    __int16 v27 = 2048;
    int64_t v28 = a3;
    __int16 v29 = 2048;
    int64_t v30 = a4;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getCredentialAtIndex: %ld forCredentialType: %ld", buf, 0x2Au);
  }
  uint64_t v19 = MEMORY[0x263EF8330];
  int64_t v21 = a4;
  int64_t v22 = a3;
  id v20 = v8;
  id v14 = (void *)MEMORY[0x263F42530];
  id v15 = v8;
  uint64_t v16 = objc_msgSend(v14, "untrackedPlaceholderFlow", v19, 3221225472, __72__HMMTRSyncClusterDoorLock_getCredentialAtIndex_forCredentialType_flow___block_invoke, &unk_265375560, v10);
  __int16 v17 = [(HMMTRSyncClusterDoorLock *)v10 ensureAccessoryConnected:&v19 flow:v16];

  return v17;
}

id __72__HMMTRSyncClusterDoorLock_getCredentialAtIndex_forCredentialType_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E20]);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v2 setCredentialType:v3];

  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  [v2 setCredentialIndex:v4];

  id v5 = objc_alloc_init(MEMORY[0x263F10E38]);
  [v5 setCredential:v2];
  id v14 = 0;
  uint64_t v6 = [MEMORY[0x263F42538] futureWithPromise:&v14];
  id v7 = [v14 resolverBlock];
  id v8 = [*(id *)(a1 + 32) apiRouter];
  [v8 getCredentialStatusWithParams:v5 flow:*(void *)(a1 + 40) completion:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__HMMTRSyncClusterDoorLock_getCredentialAtIndex_forCredentialType_flow___block_invoke_2;
  v12[3] = &unk_265376318;
  id v9 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v9;
  uint64_t v10 = [v6 recover:v12];

  return v10;
}

uint64_t __72__HMMTRSyncClusterDoorLock_getCredentialAtIndex_forCredentialType_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to get credential with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)updateCredentialData:(id)a3 forCredentialType:(id)a4 atIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int16 v15 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v16 = self;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [v14 UUID];
    *(_DWORD *)buf = 138544642;
    uint64_t v35 = v18;
    __int16 v36 = 2112;
    __int16 v37 = v19;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2048;
    int64_t v43 = a5;
    __int16 v44 = 2048;
    int64_t v45 = a6;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updateCredentialData: %@ forCredentialType: %@, atIndex: %ld forUserAtUserIndex: %ld", buf, 0x3Eu);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  int64_t v32 = a5;
  int64_t v33 = a6;
  id v28 = v13;
  id v29 = v12;
  int64_t v30 = v16;
  id v31 = v14;
  id v20 = (void *)MEMORY[0x263F42530];
  id v21 = v14;
  id v22 = v12;
  id v23 = v13;
  __int16 v24 = objc_msgSend(v20, "untrackedPlaceholderFlow", v27, 3221225472, __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke, &unk_265375538);
  __int16 v25 = [(HMMTRSyncClusterDoorLock *)v16 ensureAccessoryConnected:&v27 flow:v24];

  return v25;
}

id __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E28]);
  [v2 setCredentialType:*(void *)(a1 + 32)];
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v2 setCredentialIndex:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F10E78]);
  [v4 setOperationType:&unk_2702B4EF0];
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  [v4 setUserIndex:v5];

  [v4 setCredential:v2];
  [v4 setCredentialData:*(void *)(a1 + 40)];
  id v19 = 0;
  uint64_t v6 = [MEMORY[0x263F42538] futureWithPromise:&v19];
  id v7 = [v19 resolverBlock];
  [*(id *)(a1 + 48) setCredentialWithParams:v4 expectedValues:0 expectedValueInterval:0 completionHandler:v7];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_2;
  v14[3] = &unk_265375510;
  id v8 = *(void **)(a1 + 56);
  v14[4] = *(void *)(a1 + 48);
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 32);
  long long v18 = *(_OWORD *)(a1 + 64);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_272;
  v12[3] = &unk_265376318;
  id v9 = *(void **)(a1 + 56);
  v12[4] = *(void *)(a1 + 48);
  id v13 = v9;
  uint64_t v10 = [v6 then:v14 orRecover:v12];

  return v10;
}

uint64_t __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 status];
  char v5 = [v4 isEqualToNumber:&unk_2702B4F38];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [*(id *)(a1 + 40) UUID];
      id v11 = *(void **)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v14 = *(void *)(a1 + 72);
      int v33 = 138544642;
      int64_t v34 = v9;
      __int16 v35 = 2112;
      __int16 v36 = v10;
      __int16 v37 = 2112;
      __int16 v38 = v11;
      __int16 v39 = 2112;
      uint64_t v40 = v12;
      __int16 v41 = 2048;
      uint64_t v42 = v13;
      __int16 v43 = 2048;
      uint64_t v44 = v14;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully updated CredentialData: %@ forCredentialType: %@, atIndex: %ld forUserAtUserIndex: %ld", (uint8_t *)&v33, 0x3Eu);
    }
    v3;
    uint64_t v15 = 1;
  }
  else
  {
    id v16 = [v3 status];
    int v17 = [v16 isEqualToNumber:&unk_2702B4EF0];

    long long v18 = (void *)MEMORY[0x2533B64D0]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    id v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        id v23 = [*(id *)(a1 + 40) UUID];
        int v33 = 138543618;
        int64_t v34 = v22;
        __int16 v35 = 2112;
        __int16 v36 = v23;
        _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Credential is a duplicate", (uint8_t *)&v33, 0x16u);
      }
      __int16 v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = 8;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = [*(id *)(a1 + 40) UUID];
        id v28 = [v3 status];
        int v33 = 138543874;
        int64_t v34 = v26;
        __int16 v35 = 2112;
        __int16 v36 = v27;
        __int16 v37 = 2112;
        __int16 v38 = v28;
        _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add credential with status: %@", (uint8_t *)&v33, 0x20u);
      }
      __int16 v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = 6;
    }
    id v29 = [v24 errorWithDomain:@"HMMTROperationErrorDomain" code:v25 userInfo:0];
    int64_t v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v15 = 2;
  }

  return v15;
}

uint64_t __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_272(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add credential with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)addCredentialData:(id)a3 forCredentialType:(id)a4 atIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int16 v15 = (void *)MEMORY[0x2533B64D0]();
  id v16 = self;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [v14 UUID];
    *(_DWORD *)buf = 138544642;
    __int16 v35 = v18;
    __int16 v36 = 2112;
    __int16 v37 = v19;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2048;
    int64_t v43 = a5;
    __int16 v44 = 2048;
    int64_t v45 = a6;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addCredentialData: %@ forCredentialType: %@, atIndex: %ld forUserAtUserIndex: %ld", buf, 0x3Eu);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  int64_t v32 = a5;
  int64_t v33 = a6;
  id v28 = v13;
  id v29 = v12;
  int64_t v30 = v16;
  id v31 = v14;
  id v20 = (void *)MEMORY[0x263F42530];
  id v21 = v14;
  id v22 = v12;
  id v23 = v13;
  __int16 v24 = objc_msgSend(v20, "untrackedPlaceholderFlow", v27, 3221225472, __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke, &unk_265375538);
  uint64_t v25 = [(HMMTRSyncClusterDoorLock *)v16 ensureAccessoryConnected:&v27 flow:v24];

  return v25;
}

id __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E20]);
  [v2 setCredentialType:*(void *)(a1 + 32)];
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v2 setCredentialIndex:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F10E78]);
  [v4 setOperationType:&unk_2702B4F38];
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  [v4 setUserIndex:v5];

  [v4 setCredential:v2];
  [v4 setCredentialData:*(void *)(a1 + 40)];
  id v20 = 0;
  uint64_t v6 = [MEMORY[0x263F42538] futureWithPromise:&v20];
  id v7 = [v20 resolverBlock];
  id v8 = [*(id *)(a1 + 48) apiRouter];
  [v8 setCredentialWithParams:v4 flow:*(void *)(a1 + 56) completion:v7];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_2;
  v15[3] = &unk_265375510;
  id v9 = *(void **)(a1 + 56);
  v15[4] = *(void *)(a1 + 48);
  id v16 = v9;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 32);
  long long v19 = *(_OWORD *)(a1 + 64);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_271;
  v13[3] = &unk_265376318;
  uint64_t v10 = *(void **)(a1 + 56);
  v13[4] = *(void *)(a1 + 48);
  id v14 = v10;
  id v11 = [v6 then:v15 orRecover:v13];

  return v11;
}

uint64_t __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 status];
  char v5 = [v4 isEqualToNumber:&unk_2702B4F38];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [*(id *)(a1 + 40) UUID];
      id v11 = *(void **)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v14 = *(void *)(a1 + 72);
      int v33 = 138544642;
      int64_t v34 = v9;
      __int16 v35 = 2112;
      __int16 v36 = v10;
      __int16 v37 = 2112;
      __int16 v38 = v11;
      __int16 v39 = 2112;
      uint64_t v40 = v12;
      __int16 v41 = 2048;
      uint64_t v42 = v13;
      __int16 v43 = 2048;
      uint64_t v44 = v14;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added CredentialData: %@ forCredentialType: %@, atIndex: %ld forUserAtUserIndex: %ld", (uint8_t *)&v33, 0x3Eu);
    }
    v3;
    uint64_t v15 = 1;
  }
  else
  {
    id v16 = [v3 status];
    int v17 = [v16 isEqualToNumber:&unk_2702B4EF0];

    id v18 = (void *)MEMORY[0x2533B64D0]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    id v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        id v23 = [*(id *)(a1 + 40) UUID];
        int v33 = 138543618;
        int64_t v34 = v22;
        __int16 v35 = 2112;
        __int16 v36 = v23;
        _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Credential is a duplicate", (uint8_t *)&v33, 0x16u);
      }
      __int16 v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = 8;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = [*(id *)(a1 + 40) UUID];
        id v28 = [v3 status];
        int v33 = 138543874;
        int64_t v34 = v26;
        __int16 v35 = 2112;
        __int16 v36 = v27;
        __int16 v37 = 2112;
        __int16 v38 = v28;
        _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add credential with status: %@", (uint8_t *)&v33, 0x20u);
      }
      __int16 v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = 6;
    }
    id v29 = [v24 errorWithDomain:@"HMMTROperationErrorDomain" code:v25 userInfo:0];
    int64_t v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v15 = 2;
  }

  return v15;
}

uint64_t __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_271(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add credential with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)updatePinCredentialAtIndex:(int64_t)a3 withValue:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
  int v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    id v16 = [v11 UUID];
    *(_DWORD *)buf = 138544386;
    int64_t v30 = v15;
    __int16 v31 = 2112;
    int64_t v32 = v16;
    __int16 v33 = 2048;
    int64_t v34 = a3;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2048;
    int64_t v38 = a5;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updatePinCredentialAtIndex: %ld, withValue: %@ forUserAtUserIndex: %ld", buf, 0x34u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke;
  v23[3] = &unk_2653754C0;
  int64_t v27 = a3;
  int64_t v28 = a5;
  id v24 = v10;
  uint64_t v25 = v13;
  id v26 = v11;
  __int16 v17 = (void *)MEMORY[0x263F42530];
  id v18 = v11;
  id v19 = v10;
  id v20 = [v17 untrackedPlaceholderFlow];
  id v21 = [(HMMTRSyncClusterDoorLock *)v13 ensureAccessoryConnected:v23 flow:v20];

  return v21;
}

id __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E28]);
  [v2 setCredentialType:&unk_2702B4ED8];
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  [v2 setCredentialIndex:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F10E78]);
  [v4 setOperationType:&unk_2702B4EF0];
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v4 setUserIndex:v5];

  [v4 setCredential:v2];
  uint64_t v6 = +[HMMTRSyncClusterDoorLock pinDataWithDigits:*(void *)(a1 + 32)];
  [v4 setCredentialData:v6];

  id v17 = 0;
  id v7 = [MEMORY[0x263F42538] futureWithPromise:&v17];
  id v8 = [v17 resolverBlock];
  [*(id *)(a1 + 40) setCredentialWithParams:v4 expectedValues:0 expectedValueInterval:0 completionHandler:v8];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_2;
  v15[3] = &unk_2653754E8;
  id v9 = *(void **)(a1 + 48);
  v15[4] = *(void *)(a1 + 40);
  id v16 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_269;
  v13[3] = &unk_265376318;
  id v10 = *(void **)(a1 + 48);
  v13[4] = *(void *)(a1 + 40);
  id v14 = v10;
  id v11 = [v7 then:v15 orRecover:v13];

  return v11;
}

uint64_t __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 status];
  char v5 = [v4 isEqualToNumber:&unk_2702B4F38];

  if (v5)
  {
    v3;
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      uint64_t v12 = [v3 status];
      int v20 = 138543874;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pin credential with status: %@", (uint8_t *)&v20, 0x20u);
    }
    int v13 = [v3 status];
    int v14 = [v13 isEqualToNumber:&unk_2702B4EF0];

    if (v14) {
      uint64_t v15 = 8;
    }
    else {
      uint64_t v15 = 7;
    }
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:v15 userInfo:0];
    id v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v6 = 2;
  }

  return v6;
}

uint64_t __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_269(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    int v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pin credential with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)addPinCredentialAtIndex:(int64_t)a3 withValue:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
  int v13 = self;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    id v16 = [v11 UUID];
    *(_DWORD *)buf = 138544386;
    int64_t v30 = v15;
    __int16 v31 = 2112;
    int64_t v32 = v16;
    __int16 v33 = 2048;
    int64_t v34 = a3;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2048;
    int64_t v38 = a5;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addPinCredentialAtIndex: %ld, withValue: %@ forUserAtUserIndex: %ld", buf, 0x34u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke;
  v23[3] = &unk_2653754C0;
  int64_t v27 = a3;
  int64_t v28 = a5;
  id v24 = v10;
  uint64_t v25 = v13;
  id v26 = v11;
  __int16 v17 = (void *)MEMORY[0x263F42530];
  id v18 = v11;
  id v19 = v10;
  int v20 = [v17 untrackedPlaceholderFlow];
  id v21 = [(HMMTRSyncClusterDoorLock *)v13 ensureAccessoryConnected:v23 flow:v20];

  return v21;
}

id __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E28]);
  [v2 setCredentialType:&unk_2702B4ED8];
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  [v2 setCredentialIndex:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F10E78]);
  [v4 setOperationType:&unk_2702B4F38];
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v4 setUserIndex:v5];

  [v4 setCredential:v2];
  uint64_t v6 = +[HMMTRSyncClusterDoorLock pinDataWithDigits:*(void *)(a1 + 32)];
  [v4 setCredentialData:v6];

  id v17 = 0;
  id v7 = [MEMORY[0x263F42538] futureWithPromise:&v17];
  id v8 = [v17 resolverBlock];
  [*(id *)(a1 + 40) setCredentialWithParams:v4 expectedValues:0 expectedValueInterval:0 completionHandler:v8];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_2;
  v15[3] = &unk_2653754E8;
  id v9 = *(void **)(a1 + 48);
  v15[4] = *(void *)(a1 + 40);
  id v16 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_268;
  v13[3] = &unk_265376318;
  id v10 = *(void **)(a1 + 48);
  v13[4] = *(void *)(a1 + 40);
  id v14 = v10;
  id v11 = [v7 then:v15 orRecover:v13];

  return v11;
}

uint64_t __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 status];
  char v5 = [v4 isEqualToNumber:&unk_2702B4F38];

  uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      int v23 = 138543618;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pin credential", (uint8_t *)&v23, 0x16u);
    }
    v3;
    uint64_t v12 = 1;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 40) UUID];
      __int16 v15 = [v3 status];
      int v23 = 138543874;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v14;
      __int16 v27 = 2112;
      int64_t v28 = v15;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pin credential with status: %@", (uint8_t *)&v23, 0x20u);
    }
    id v16 = [v3 status];
    int v17 = [v16 isEqualToNumber:&unk_2702B4EF0];

    if (v17) {
      uint64_t v18 = 8;
    }
    else {
      uint64_t v18 = 6;
    }
    id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:v18 userInfo:0];
    int v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v12 = 2;
  }

  return v12;
}

uint64_t __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_268(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pin credential with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)addUserAtUserIndex:(int64_t)a3 withUserUniqueID:(int64_t)a4 userType:(id)a5 flow:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
  int v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    id v16 = [v11 UUID];
    *(_DWORD *)buf = 138544386;
    int64_t v30 = v15;
    __int16 v31 = 2112;
    int64_t v32 = v16;
    __int16 v33 = 2048;
    int64_t v34 = a3;
    __int16 v35 = 2048;
    int64_t v36 = a4;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addUserAtUserIndex: %ld, withUserUniqueID: %ld, userType: %@", buf, 0x34u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __78__HMMTRSyncClusterDoorLock_addUserAtUserIndex_withUserUniqueID_userType_flow___block_invoke;
  v23[3] = &unk_2653754C0;
  int64_t v27 = a3;
  int64_t v28 = a4;
  id v24 = v10;
  __int16 v25 = v13;
  id v26 = v11;
  __int16 v17 = (void *)MEMORY[0x263F42530];
  id v18 = v11;
  id v19 = v10;
  int v20 = [v17 untrackedPlaceholderFlow];
  id v21 = [(HMMTRSyncClusterDoorLock *)v13 ensureAccessoryConnected:v23 flow:v20];

  return v21;
}

id __78__HMMTRSyncClusterDoorLock_addUserAtUserIndex_withUserUniqueID_userType_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E80]);
  [v2 setOperationType:&unk_2702B4F38];
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  [v2 setUserIndex:v3];

  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v2 setUserUniqueId:v4];

  [v2 setUserType:*(void *)(a1 + 32)];
  id v13 = 0;
  id v5 = [MEMORY[0x263F42538] futureWithPromise:&v13];
  uint64_t v6 = [v13 errorOnlyResolverBlock];
  id v7 = [*(id *)(a1 + 40) baseDoorLock];
  [v7 setUserWithParams:v2 completion:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__HMMTRSyncClusterDoorLock_addUserAtUserIndex_withUserUniqueID_userType_flow___block_invoke_2;
  v11[3] = &unk_265376318;
  id v8 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v8;
  id v9 = [v5 recover:v11];

  return v9;
}

uint64_t __78__HMMTRSyncClusterDoorLock_addUserAtUserIndex_withUserUniqueID_userType_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add user with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)unlock_flow:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    id v18 = v8;
    __int16 v19 = 2112;
    int v20 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Unlocking", buf, 0x16u);
  }
  uint64_t v15 = MEMORY[0x263EF8330];
  id v16 = v4;
  id v10 = (void *)MEMORY[0x263F42530];
  id v11 = v4;
  id v12 = objc_msgSend(v10, "untrackedPlaceholderFlow", v15, 3221225472, __40__HMMTRSyncClusterDoorLock_unlock_flow___block_invoke, &unk_265374CF0, v6);
  int v13 = [(HMMTRSyncClusterDoorLock *)v6 ensureAccessoryConnected:&v15 flow:v12];

  return v13;
}

id __40__HMMTRSyncClusterDoorLock_unlock_flow___block_invoke(uint64_t a1)
{
  id v8 = 0;
  id v2 = [MEMORY[0x263F42538] futureWithPromise:&v8];
  id v3 = [v8 errorOnlyResolverBlock];
  [*(id *)(a1 + 32) unlockDoorWithParams:0 expectedValues:0 expectedValueInterval:0 completionHandler:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__HMMTRSyncClusterDoorLock_unlock_flow___block_invoke_2;
  v6[3] = &unk_265375498;
  id v7 = *(id *)(a1 + 40);
  id v4 = [v2 recover:v6];

  return v4;
}

uint64_t __40__HMMTRSyncClusterDoorLock_unlock_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = objc_opt_class();
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Unlocked door with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)unlockWithPin:(id)a3 flow:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Unlocking with pin: %@", buf, 0x20u);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __47__HMMTRSyncClusterDoorLock_unlockWithPin_flow___block_invoke;
  v19[3] = &unk_265374B60;
  id v20 = v6;
  uint64_t v21 = v9;
  id v22 = v7;
  int v13 = (void *)MEMORY[0x263F42530];
  id v14 = v7;
  id v15 = v6;
  id v16 = [v13 untrackedPlaceholderFlow];
  __int16 v17 = [(HMMTRSyncClusterDoorLock *)v9 ensureAccessoryConnected:v19 flow:v16];

  return v17;
}

id __47__HMMTRSyncClusterDoorLock_unlockWithPin_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E98]);
  id v3 = +[HMMTRSyncClusterDoorLock pinDataWithDigits:*(void *)(a1 + 32)];
  [v2 setPinCode:v3];

  id v10 = 0;
  id v4 = [MEMORY[0x263F42538] futureWithPromise:&v10];
  id v5 = [v10 errorOnlyResolverBlock];
  [*(id *)(a1 + 40) unlockDoorWithParams:v2 expectedValues:0 expectedValueInterval:0 completionHandler:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HMMTRSyncClusterDoorLock_unlockWithPin_flow___block_invoke_2;
  v8[3] = &unk_265375498;
  id v9 = *(id *)(a1 + 48);
  id v6 = [v4 recover:v8];

  return v6;
}

uint64_t __47__HMMTRSyncClusterDoorLock_unlockWithPin_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = objc_opt_class();
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Unlocked door with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)lock_flow:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Locking", buf, 0x16u);
  }
  uint64_t v15 = MEMORY[0x263EF8330];
  id v16 = v4;
  id v10 = (void *)MEMORY[0x263F42530];
  id v11 = v4;
  id v12 = objc_msgSend(v10, "untrackedPlaceholderFlow", v15, 3221225472, __38__HMMTRSyncClusterDoorLock_lock_flow___block_invoke, &unk_265374CF0, v6);
  int v13 = [(HMMTRSyncClusterDoorLock *)v6 ensureAccessoryConnected:&v15 flow:v12];

  return v13;
}

id __38__HMMTRSyncClusterDoorLock_lock_flow___block_invoke(uint64_t a1)
{
  id v8 = 0;
  id v2 = [MEMORY[0x263F42538] futureWithPromise:&v8];
  id v3 = [v8 errorOnlyResolverBlock];
  [*(id *)(a1 + 32) lockDoorWithParams:0 expectedValues:0 expectedValueInterval:0 completionHandler:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__HMMTRSyncClusterDoorLock_lock_flow___block_invoke_2;
  v6[3] = &unk_265375498;
  id v7 = *(id *)(a1 + 40);
  id v4 = [v2 recover:v6];

  return v4;
}

uint64_t __38__HMMTRSyncClusterDoorLock_lock_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = objc_opt_class();
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Locked door with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (HMMTRSyncClusterDoorLock)lockWithPin:(id)a3 flow:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Locking with pin: %@", buf, 0x20u);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __45__HMMTRSyncClusterDoorLock_lockWithPin_flow___block_invoke;
  v19[3] = &unk_265374B60;
  id v20 = v6;
  uint64_t v21 = v9;
  id v22 = v7;
  int v13 = (void *)MEMORY[0x263F42530];
  id v14 = v7;
  id v15 = v6;
  id v16 = [v13 untrackedPlaceholderFlow];
  __int16 v17 = [(HMMTRSyncClusterDoorLock *)v9 ensureAccessoryConnected:v19 flow:v16];

  return (HMMTRSyncClusterDoorLock *)v17;
}

id __45__HMMTRSyncClusterDoorLock_lockWithPin_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E58]);
  id v3 = +[HMMTRSyncClusterDoorLock pinDataWithDigits:*(void *)(a1 + 32)];
  [v2 setPinCode:v3];

  id v10 = 0;
  id v4 = [MEMORY[0x263F42538] futureWithPromise:&v10];
  id v5 = [v10 errorOnlyResolverBlock];
  [*(id *)(a1 + 40) lockDoorWithParams:v2 expectedValues:0 expectedValueInterval:0 completionHandler:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HMMTRSyncClusterDoorLock_lockWithPin_flow___block_invoke_2;
  v8[3] = &unk_265375498;
  id v9 = *(id *)(a1 + 48);
  id v6 = [v4 recover:v8];

  return v6;
}

uint64_t __45__HMMTRSyncClusterDoorLock_lockWithPin_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = objc_opt_class();
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Locked door with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)addReaderKeyData:(id)a3 toUserIndex:(int64_t)a4 flow:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x2533B64D0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 UUID];
    *(_DWORD *)buf = 138544130;
    __int16 v25 = v13;
    __int16 v26 = 2112;
    __int16 v27 = v14;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2048;
    int64_t v31 = a4;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addReaderKeyData: %@ to UserIndex %ld", buf, 0x2Au);
  }
  __int16 v15 = -[HMMTRSyncClusterDoorLock firstAvailableCredentialSlotForCredentialType:flow:](v11, "firstAvailableCredentialSlotForCredentialType:flow:", [&unk_2702B4EF0 integerValue], v9);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__HMMTRSyncClusterDoorLock_addReaderKeyData_toUserIndex_flow___block_invoke;
  v20[3] = &unk_265375470;
  v20[4] = v11;
  id v21 = v8;
  id v22 = v9;
  int64_t v23 = a4;
  id v16 = v9;
  id v17 = v8;
  id v18 = [v15 then:v20];

  return v18;
}

uint64_t __62__HMMTRSyncClusterDoorLock_addReaderKeyData_toUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addCredentialData:forCredentialType:atIndex:forUserAtUserIndex:flow:", *(void *)(a1 + 40), &unk_2702B4EF0, objc_msgSend(v3, "integerValue"), *(void *)(a1 + 56), *(void *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    id v7 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v7 addPinCodeWithValue:v9 forUserIndex:v10 flow:v11];
  }
}

- (id)addPinCodeWithValue:(id)a3 forUserIndex:(int64_t)a4 flow:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = (void *)MEMORY[0x2533B64D0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 UUID];
    *(_DWORD *)buf = 138544130;
    __int16 v25 = v13;
    __int16 v26 = 2112;
    __int16 v27 = v14;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2048;
    int64_t v31 = a4;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addPinCodeWithValue: %@, forUserIndex: %ld", buf, 0x2Au);
  }
  __int16 v15 = -[HMMTRSyncClusterDoorLock firstAvailableCredentialSlotForCredentialType:flow:](v11, "firstAvailableCredentialSlotForCredentialType:flow:", [&unk_2702B4ED8 integerValue], v9);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__HMMTRSyncClusterDoorLock_addPinCodeWithValue_forUserIndex_flow___block_invoke;
  v20[3] = &unk_265375470;
  v20[4] = v11;
  id v21 = v8;
  id v22 = v9;
  int64_t v23 = a4;
  id v16 = v9;
  id v17 = v8;
  id v18 = [v15 then:v20];

  return v18;
}

uint64_t __66__HMMTRSyncClusterDoorLock_addPinCodeWithValue_forUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addPinCredentialAtIndex:withValue:forUserAtUserIndex:flow:", objc_msgSend(v3, "integerValue"), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    id v7 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v7 findAllUsersWithCreatorFabricIndex:v9 indexStartingAtSlot:v10 assumingTotalNumberOfSlots:v11 users:v12 flow:v13];
  }
}

- (id)findAllUsersWithCreatorFabricIndex:(id)a3 indexStartingAtSlot:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 users:(id)a6 flow:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  __int16 v15 = (void *)MEMORY[0x2533B64D0]();
  id v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [v14 UUID];
    *(_DWORD *)buf = 138544386;
    int64_t v34 = v18;
    __int16 v35 = 2112;
    int64_t v36 = v19;
    __int16 v37 = 2112;
    id v38 = v12;
    __int16 v39 = 2048;
    int64_t v40 = a4;
    __int16 v41 = 2048;
    int64_t v42 = a5;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findAllUsersWithCreatorFabricIndex: %@ indexStartingAtSlot: %ld assumingTotalNumberOfSlots: %ld", buf, 0x34u);
  }
  id v20 = [(HMMTRSyncClusterDoorLock *)v16 _getUserAtIndex:a4 includeAliroCredentials:1 flow:v14];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __121__HMMTRSyncClusterDoorLock_findAllUsersWithCreatorFabricIndex_indexStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke;
  v26[3] = &unk_265375448;
  id v27 = v12;
  id v28 = v13;
  int64_t v31 = a4;
  int64_t v32 = a5;
  id v29 = v16;
  id v30 = v14;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = [v20 then:v26];

  return v24;
}

id __121__HMMTRSyncClusterDoorLock_findAllUsersWithCreatorFabricIndex_indexStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 creatorFabricIndex];
  int v5 = [v4 isEqualToNumber:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  if (*(void *)(a1 + 64) >= *(void *)(a1 + 72)
    || ([v3 nextUserIndex], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    [*(id *)(a1 + 40) copy];
    uint64_t v12 = 1;
    goto LABEL_8;
  }
  id v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v3 nextUserIndex];
  objc_msgSend(v7, "findAllUsersWithCreatorFabricIndex:indexStartingAtSlot:assumingTotalNumberOfSlots:users:flow:", v8, objc_msgSend(v9, "integerValue"), *(void *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 56));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    int64_t v11 = v10;

    uint64_t v12 = 3;
LABEL_8:

    return (id)v12;
  }
  id v14 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
  return [(HMMTRSyncClusterDoorLock *)v14 _findSchedulesToBeAdded:v16 dict:v17];
}

- (id)_findSchedulesToBeAdded:(id)a3 dict:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, (void)v18);

        if (v14)
        {
          SEL v15 = [v6 objectForKeyedSubscript:v13];
          if ([v15 count] == 1)
          {
            [v6 removeObjectForKey:v13];
          }
          else
          {
            id v16 = [v15 anyObject];
            [v15 removeObject:v16];
          }
        }
        else
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)readSchedulesForWritingForScheduleType:(int64_t)a3 forUserIndex:(int64_t)a4 startingAtSlot:(int64_t)a5 assumingTotalNumberOfSlots:(int64_t)a6 schedulesToSlots:(id)a7 availableSlots:(id)a8 flow:(id)a9
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  id v17 = (void *)MEMORY[0x2533B64D0]();
  long long v18 = self;
  long long v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = id v28 = v17;
    [v16 UUID];
    long long v21 = v29 = v15;
    *(_DWORD *)buf = 138544642;
    __int16 v41 = v20;
    __int16 v42 = 2112;
    uint64_t v43 = v21;
    __int16 v44 = 2048;
    int64_t v45 = a3;
    __int16 v46 = 2048;
    int64_t v47 = a4;
    __int16 v48 = 2048;
    int64_t v49 = a5;
    __int16 v50 = 2048;
    int64_t v51 = a6;
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] readSchedulesForWritingForScheduleType: %ld, forUserIndex: %ld, atSlot:%ld assumingTotalNumberOfSlots: %ld", buf, 0x3Eu);

    id v15 = v29;
    id v17 = v28;
  }

  id v22 = [(HMMTRSyncClusterDoorLock *)v18 getScheduleOfScheduleType:a3 atScheduleIndex:a5 forUserAtUserIndex:a4 flow:v16];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __159__HMMTRSyncClusterDoorLock_readSchedulesForWritingForScheduleType_forUserIndex_startingAtSlot_assumingTotalNumberOfSlots_schedulesToSlots_availableSlots_flow___block_invoke;
  v31[3] = &unk_265375420;
  id v32 = v15;
  __int16 v33 = v18;
  id v34 = v16;
  id v35 = v14;
  int64_t v36 = a5;
  int64_t v37 = a6;
  int64_t v38 = a3;
  int64_t v39 = a4;
  id v23 = v14;
  id v24 = v16;
  id v25 = v15;
  __int16 v26 = [v22 then:v31];

  return v26;
}

uint64_t __159__HMMTRSyncClusterDoorLock_readSchedulesForWritingForScheduleType_forUserIndex_startingAtSlot_assumingTotalNumberOfSlots_schedulesToSlots_availableSlots_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 status];
  int v5 = [v4 isEqualToNumber:&unk_2702B4F50];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
    [v6 addObject:v7];
    goto LABEL_11;
  }
  id v8 = [v3 status];
  int v9 = [v8 isEqualToNumber:&unk_2702B4F38];

  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 56) objectForKeyedSubscript:v3];

    if (v10)
    {
      id v7 = [*(id *)(a1 + 56) objectForKeyedSubscript:v3];
      uint64_t v11 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
      [v7 addObject:v11];
    }
    else
    {
      id v7 = [MEMORY[0x263EFF9C0] set];
      long long v21 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
      [v7 addObject:v21];

      [*(id *)(a1 + 56) setObject:v7 forKey:v3];
    }
LABEL_11:

    uint64_t v22 = *(void *)(a1 + 64);
    if (v22 >= *(void *)(a1 + 72))
    {
      __int16 v26 = objc_opt_new();
      [v26 setAvailableSlots:*(void *)(a1 + 32)];
      [v26 setSchedulesToSlots:*(void *)(a1 + 56)];
      uint64_t v25 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "readSchedulesForWritingForScheduleType:forUserIndex:startingAtSlot:assumingTotalNumberOfSlots:schedulesToSlots:availableSlots:flow:", *(void *)(a1 + 80), *(void *)(a1 + 88), v22 + 1, *(void *)(a1 + 48));
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      if (!v23) {
        _HMFPreconditionFailure();
      }
      id v24 = v23;

      uint64_t v25 = 3;
    }
    goto LABEL_17;
  }
  uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
  id v13 = *(id *)(a1 + 40);
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [*(id *)(a1 + 48) UUID];
    id v17 = [v3 status];
    *(_DWORD *)buf = 138543874;
    id v29 = v15;
    __int16 v30 = 2112;
    int64_t v31 = v16;
    __int16 v32 = 2112;
    __int16 v33 = v17;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Schedule status was an invalid response of %@", buf, 0x20u);
  }
  id v18 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:9 userInfo:0];
  long long v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  uint64_t v25 = 2;
LABEL_17:

  return v25;
}

- (id)findScheduleSlotsToAddAndClearForScheduleType:(int64_t)a3 withRequestedSchedules:(id)a4 forUserAtUserIndex:(int64_t)a5 numberOfSchedulesSupported:(int64_t)a6 flow:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = [MEMORY[0x263EFF9A0] dictionary];
  id v15 = [MEMORY[0x263EFF980] arrayWithCapacity:a6];
  id v16 = [(HMMTRSyncClusterDoorLock *)self readSchedulesForWritingForScheduleType:a3 forUserIndex:a5 startingAtSlot:1 assumingTotalNumberOfSlots:a6 schedulesToSlots:v14 availableSlots:v15 flow:v13];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __148__HMMTRSyncClusterDoorLock_findScheduleSlotsToAddAndClearForScheduleType_withRequestedSchedules_forUserAtUserIndex_numberOfSchedulesSupported_flow___block_invoke;
  v21[3] = &unk_2653753F8;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v17 = v13;
  id v18 = v12;
  long long v19 = [v16 then:v21];

  return v19;
}

uint64_t __148__HMMTRSyncClusterDoorLock_findScheduleSlotsToAddAndClearForScheduleType_withRequestedSchedules_forUserAtUserIndex_numberOfSchedulesSupported_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 schedulesToSlots];
  int v5 = (void *)[v4 mutableCopy];

  uint64_t v39 = a1;
  id v6 = [*(id *)(a1 + 32) _findSchedulesToBeAdded:*(void *)(a1 + 40) dict:v5];
  int64_t v40 = v5;
  id v7 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_256);
  id v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  int v9 = [v7 objectEnumerator];
  uint64_t v10 = [v3 availableSlots];
  uint64_t v11 = [v10 objectEnumerator];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    int64_t v37 = v7;
    id v38 = v3;
    id v15 = 0;
    uint64_t v16 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v9, "nextObject", v37);

        id v15 = (void *)v19;
        if (!v19)
        {
          id v15 = [v11 nextObject];
          if (!v15)
          {
            id v28 = (void *)MEMORY[0x2533B64D0]();
            id v29 = *(id *)(v39 + 32);
            __int16 v30 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              int64_t v31 = HMFGetLogIdentifier();
              __int16 v32 = [*(id *)(v39 + 48) UUID];
              *(_DWORD *)buf = 138543618;
              __int16 v46 = v31;
              __int16 v47 = 2112;
              __int16 v48 = v32;
              _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] There are no more slots to add schedules. Should have errored before reaching here.", buf, 0x16u);
            }
            id v33 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:9 userInfo:0];
            uint64_t v34 = v33;
            id v3 = v38;
            if (v33)
            {
              id v35 = v33;
            }
            else
            {
              [MEMORY[0x263F087E8] hmfUnspecifiedError];
              objc_claimAutoreleasedReturnValue();
            }
            id v27 = v40;
            id v22 = v37;

            uint64_t v26 = 2;
            id v20 = v12;
            goto LABEL_21;
          }
        }
        [v8 setObject:v18 forKey:v15];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v14) {
        continue;
      }
      break;
    }

    id v7 = v37;
    id v3 = v38;
  }

  id v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v21 = [v9 nextObject];
  id v22 = v7;
  if (v21)
  {
    id v23 = (void *)v21;
    do
    {
      [v20 addObject:v23];
      uint64_t v24 = [v9 nextObject];

      id v23 = (void *)v24;
    }
    while (v24);
  }
  uint64_t v25 = objc_opt_new();
  [v25 setSlotToHMMTRSchedulesToAdd:v8];
  [v25 setSlotsOfSchedulesToClear:v20];
  uint64_t v26 = 1;
  id v27 = v40;
LABEL_21:

  return v26;
}

uint64_t __148__HMMTRSyncClusterDoorLock_findScheduleSlotsToAddAndClearForScheduleType_withRequestedSchedules_forUserAtUserIndex_numberOfSchedulesSupported_flow___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 allObjects];
}

- (id)updateSchedulesOfScheduleType:(int64_t)a3 withRequestedSchedules:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    uint64_t v16 = [v11 UUID];
    *(_DWORD *)buf = 138544386;
    id v33 = v15;
    __int16 v34 = 2112;
    id v35 = v16;
    __int16 v36 = 2048;
    int64_t v37 = a3;
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2048;
    int64_t v41 = a5;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updateSchedulesOfScheduleType: %ld, withRequestedSchedules: %@ forUserIndex: %ld", buf, 0x34u);
  }
  if ([v10 count])
  {
    unint64_t v17 = [(HMMTRSyncClusterDoorLock *)v13 totalNumberOfSchedulesSupportedOfScheduleType:a3 withDefaultCapacity:1 flow:v11];
    if ([v10 count] <= v17)
    {
      uint64_t v26 = [(HMMTRSyncClusterDoorLock *)v13 findScheduleSlotsToAddAndClearForScheduleType:a3 withRequestedSchedules:v10 forUserAtUserIndex:a5 numberOfSchedulesSupported:v17 flow:v11];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke;
      v28[3] = &unk_2653753B0;
      v28[4] = v13;
      int64_t v30 = a3;
      int64_t v31 = a5;
      id v29 = v11;
      uint64_t v25 = [v26 then:v28];
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v19 = v13;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        id v22 = [v11 UUID];
        *(_DWORD *)buf = 138543618;
        id v33 = v21;
        __int16 v34 = 2112;
        id v35 = v22;
        _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to updateSchedulesOfScheduleType since requested schedules is more than accessory supports", buf, 0x16u);
      }
      id v23 = (void *)MEMORY[0x263F42538];
      uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:9 userInfo:0];
      uint64_t v25 = [v23 futureWithError:v24];
    }
  }
  else
  {
    uint64_t v25 = [(HMMTRSyncClusterDoorLock *)v13 clearScheduleOfScheduleType:a3 atScheduleIndex:254 forUserAtUserIndex:a5 flow:v11];
  }

  return v25;
}

uint64_t __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F42538];
  int v5 = [v3 slotToHMMTRSchedulesToAdd];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke_2;
  v21[3] = &unk_265375360;
  id v6 = *(void **)(a1 + 40);
  v21[4] = *(void *)(a1 + 32);
  long long v23 = *(_OWORD *)(a1 + 48);
  id v22 = v6;
  id v7 = objc_msgSend(v5, "na_map:", v21);
  id v8 = [v4 all:v7];
  v24[0] = v8;
  int v9 = (void *)MEMORY[0x263F42538];
  id v10 = [v3 slotsOfSchedulesToClear];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke_3;
  v18[3] = &unk_265375388;
  id v11 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  long long v20 = *(_OWORD *)(a1 + 48);
  id v19 = v11;
  id v12 = objc_msgSend(v10, "na_map:", v18);
  uint64_t v13 = [v9 all:v12];
  v24[1] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  id v15 = [v4 all:v14];
  if (!v15) {
    _HMFPreconditionFailure();
  }
  uint64_t v16 = v15;

  return 3;
}

id __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke_2(void *a1, void *a2, void *a3)
{
  int v5 = (void *)a1[4];
  uint64_t v6 = a1[6];
  id v7 = a3;
  id v8 = objc_msgSend(v5, "setScheduleOfScheduleType:withSchedule:atScheduleIndex:forUserAtUserIndex:flow:", v6, v7, objc_msgSend(a2, "integerValue"), a1[7], a1[5]);

  return v8;
}

uint64_t __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[6];
  uint64_t v5 = [a2 integerValue];
  uint64_t v6 = a1[7];
  uint64_t v7 = a1[5];
  return [v3 clearScheduleOfScheduleType:v4 atScheduleIndex:v5 forUserAtUserIndex:v6 flow:v7];
}

- (id)findOperationOrderForModifyingWeekDaySchedules:(id)a3 andYearDaySchedules:(id)a4 forUserIndex:(int64_t)a5 flow:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    unint64_t v17 = [v12 UUID];
    *(_DWORD *)buf = 138544386;
    id v39 = v16;
    __int16 v40 = 2112;
    int64_t v41 = v17;
    __int16 v42 = 2112;
    id v43 = v10;
    __int16 v44 = 2112;
    id v45 = v11;
    __int16 v46 = 2048;
    int64_t v47 = a5;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findOperationOrderForModifyingWeekDaySchedules: %@ andYearDaySchedules: %@ forUserIndex: %ld", buf, 0x34u);
  }
  if (objc_msgSend(v10, "hmf_isEmpty") && objc_msgSend(v11, "hmf_isEmpty"))
  {
    uint64_t v18 = (void *)MEMORY[0x263F42538];
    id v19 = [(HMMTRSyncClusterDoorLock *)v14 clearScheduleOfScheduleType:0 atScheduleIndex:254 forUserAtUserIndex:a5 flow:v12];
    v37[0] = v19;
    long long v20 = [(HMMTRSyncClusterDoorLock *)v14 clearScheduleOfScheduleType:1 atScheduleIndex:254 forUserAtUserIndex:a5 flow:v12];
    v37[1] = v20;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
    id v22 = [v18 all:v21];

    goto LABEL_14;
  }
  if (objc_msgSend(v11, "hmf_isEmpty"))
  {
    id v19 = [(HMMTRSyncClusterDoorLock *)v14 updateSchedulesOfScheduleType:0 withRequestedSchedules:v10 forUserAtUserIndex:a5 flow:v12];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke;
    v34[3] = &unk_265375338;
    v34[4] = v14;
    int64_t v36 = a5;
    id v35 = v12;
    id v22 = [v19 then:v34];
    long long v23 = v35;
LABEL_10:

    goto LABEL_14;
  }
  if (objc_msgSend(v10, "hmf_isEmpty"))
  {
    id v19 = [(HMMTRSyncClusterDoorLock *)v14 updateSchedulesOfScheduleType:1 withRequestedSchedules:v11 forUserAtUserIndex:a5 flow:v12];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke_2;
    v31[3] = &unk_265375338;
    void v31[4] = v14;
    int64_t v33 = a5;
    id v32 = v12;
    id v22 = [v19 then:v31];
    long long v23 = v32;
    goto LABEL_10;
  }
  uint64_t v24 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v25 = v14;
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    id v27 = HMFGetLogIdentifier();
    id v28 = [v12 UUID];
    *(_DWORD *)buf = 138543618;
    id v39 = v27;
    __int16 v40 = 2112;
    int64_t v41 = v28;
    _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set schedule since both year day and week day schedule types are set at the same time.", buf, 0x16u);
  }
  id v29 = (void *)MEMORY[0x263F42538];
  id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:9 userInfo:0];
  id v22 = [v29 futureWithError:v19];
LABEL_14:

  return v22;
}

uint64_t __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clearScheduleOfScheduleType:1 atScheduleIndex:254 forUserAtUserIndex:*(void *)(a1 + 48) flow:*(void *)(a1 + 40)];
  if (v4)
  {
    uint64_t v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke_2(v7);
  }
}

uint64_t __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clearScheduleOfScheduleType:0 atScheduleIndex:254 forUserAtUserIndex:*(void *)(a1 + 48) flow:*(void *)(a1 + 40)];
  if (v4)
  {
    uint64_t v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v7 getAllUsersStartingAtSlot:v9 assumingTotalNumberOfSlots:v10 users:v11 flow:v12];
  }
}

- (id)getAllUsersStartingAtSlot:(int64_t)a3 assumingTotalNumberOfSlots:(int64_t)a4 users:(id)a5 flow:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    uint64_t v16 = [v11 UUID];
    *(_DWORD *)buf = 138544130;
    id v29 = v15;
    __int16 v30 = 2112;
    int64_t v31 = v16;
    __int16 v32 = 2048;
    int64_t v33 = a3;
    __int16 v34 = 2048;
    int64_t v35 = a4;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getAllUsersStartingAtSlot: %ld assumingTotalNumberOfSlots: %ld", buf, 0x2Au);
  }
  unint64_t v17 = [(HMMTRSyncClusterDoorLock *)v13 _getUserAtIndex:a3 includeAliroCredentials:1 flow:v11];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __92__HMMTRSyncClusterDoorLock_getAllUsersStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke;
  v22[3] = &unk_265375310;
  int64_t v26 = a3;
  int64_t v27 = a4;
  id v23 = v10;
  uint64_t v24 = v13;
  id v25 = v11;
  id v18 = v11;
  id v19 = v10;
  long long v20 = [v17 then:v22];

  return v20;
}

id __92__HMMTRSyncClusterDoorLock_getAllUsersStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userStatus];
  char v5 = [v4 isEqualToNumber:&unk_2702B4F38];

  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  if (*(void *)(a1 + 56) >= *(void *)(a1 + 64)
    || ([v3 nextUserIndex], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    [*(id *)(a1 + 32) copy];
    uint64_t v11 = 1;
    goto LABEL_8;
  }
  uint64_t v7 = *(void **)(a1 + 40);
  SEL v8 = [v3 nextUserIndex];
  objc_msgSend(v7, "getAllUsersStartingAtSlot:assumingTotalNumberOfSlots:users:flow:", objc_msgSend(v8, "integerValue"), *(void *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 48));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v10 = v9;

    uint64_t v11 = 3;
LABEL_8:

    return (id)v11;
  }
  uint64_t v13 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
  return [(HMMTRSyncClusterDoorLock *)v13 findHomeUserWithUniqueID:v15 indexStartingAtSlot:v16 assumingTotalNumberOfSlots:v17 availableSlots:v18 currentFabricIndex:v19 flow:v20];
}

- (id)findHomeUserWithUniqueID:(id)a3 indexStartingAtSlot:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 availableSlots:(id)a6 currentFabricIndex:(id)a7 flow:(id)a8
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void *)MEMORY[0x2533B64D0]();
  id v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    [v17 UUID];
    id v31 = v14;
    v23 = int64_t v22 = a5;
    *(_DWORD *)buf = 138544642;
    int64_t v41 = v21;
    __int16 v42 = 2112;
    id v43 = v23;
    __int16 v44 = 2048;
    int64_t v45 = a4;
    __int16 v46 = 2048;
    int64_t v47 = v22;
    __int16 v48 = 2112;
    id v49 = v15;
    __int16 v50 = 2112;
    id v51 = v16;
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findHomeUserIndexStartingAtSlot: %ld assumingTotalNumberOfSlots: %ld availableSlots: %@ currentFabricIndex: %@", buf, 0x3Eu);

    a5 = v22;
    id v14 = v31;
  }
  uint64_t v24 = [(HMMTRSyncClusterDoorLock *)v19 _getUserAtIndex:a4 includeAliroCredentials:1 flow:v17];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __139__HMMTRSyncClusterDoorLock_findHomeUserWithUniqueID_indexStartingAtSlot_assumingTotalNumberOfSlots_availableSlots_currentFabricIndex_flow___block_invoke;
  v32[3] = &unk_2653752E8;
  id v33 = v16;
  id v34 = v14;
  int64_t v38 = a4;
  int64_t v39 = a5;
  id v35 = v15;
  uint64_t v36 = v19;
  id v37 = v17;
  id v25 = v17;
  id v26 = v15;
  id v27 = v14;
  id v28 = v16;
  id v29 = [v24 then:v32];

  return v29;
}

id __139__HMMTRSyncClusterDoorLock_findHomeUserWithUniqueID_indexStartingAtSlot_assumingTotalNumberOfSlots_availableSlots_currentFabricIndex_flow___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 creatorFabricIndex];
  if ([v4 isEqualToNumber:a1[4]])
  {
    char v5 = [v3 userUniqueId];
    int v6 = [v5 isEqualToNumber:a1[5]];

    if (v6)
    {
      [(id)objc_opt_new() setUser:v3];
LABEL_15:
      uint64_t v22 = 1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v7 = [v3 userStatus];

  if (!v7)
  {
    SEL v8 = (void *)a1[6];
    id v9 = [NSNumber numberWithInteger:a1[9]];
    [v8 addObject:v9];
  }
  if (a1[9] >= a1[10]) {
    goto LABEL_14;
  }
  uint64_t v10 = [v3 nextUserIndex];
  if (!v10
    || (uint64_t v11 = (void *)v10,
        [v3 nextUserIndex],
        id v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 integerValue] - a1[9],
        v12,
        v11,
        v13 >= 2))
  {
    id v14 = (void *)a1[6];
    id v15 = [NSNumber numberWithInteger:a1[9] + 1];
    [v14 addObject:v15];
  }
  id v16 = [v3 nextUserIndex];

  if (!v16)
  {
LABEL_14:
    [(id)objc_opt_new() setAvailableSlots:a1[6]];
    goto LABEL_15;
  }
  id v17 = (void *)a1[7];
  uint64_t v18 = a1[5];
  id v19 = [v3 nextUserIndex];
  objc_msgSend(v17, "findHomeUserWithUniqueID:indexStartingAtSlot:assumingTotalNumberOfSlots:availableSlots:currentFabricIndex:flow:", v18, objc_msgSend(v19, "integerValue"), a1[10], a1[6], a1[4], a1[8]);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    uint64_t v21 = v20;

    uint64_t v22 = 3;
LABEL_16:

    return (id)v22;
  }
  uint64_t v24 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
  return [(HMMTRSyncClusterDoorLock *)v24 getAllCredentialsIndexStartingAtSlot:v26 forCredentialType:v27 credentials:v28 flow:v29];
}

- (id)getAllCredentialsIndexStartingAtSlot:(int64_t)a3 forCredentialType:(int64_t)a4 credentials:(id)a5 flow:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v11 UUID];
    *(_DWORD *)buf = 138544130;
    id v28 = v15;
    __int16 v29 = 2112;
    __int16 v30 = v16;
    __int16 v31 = 2048;
    int64_t v32 = a3;
    __int16 v33 = 2048;
    int64_t v34 = a4;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getAllCredentialsIndexStartingAtSlot: %ld forCredentialType: %ld", buf, 0x2Au);
  }
  id v17 = [(HMMTRSyncClusterDoorLock *)v13 getCredentialAtIndex:a3 forCredentialType:a4 flow:v11];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __100__HMMTRSyncClusterDoorLock_getAllCredentialsIndexStartingAtSlot_forCredentialType_credentials_flow___block_invoke;
  v22[3] = &unk_2653752C0;
  id v23 = v10;
  uint64_t v24 = v13;
  id v25 = v11;
  int64_t v26 = a4;
  id v18 = v11;
  id v19 = v10;
  id v20 = [v17 then:v22];

  return v20;
}

id __100__HMMTRSyncClusterDoorLock_getAllCredentialsIndexStartingAtSlot_forCredentialType_credentials_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 credentialExists];
  int v5 = [v4 BOOLValue];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  int v6 = [v3 nextCredentialIndex];

  if (!v6)
  {
    *(id *)(a1 + 32);
    uint64_t v11 = 1;
    goto LABEL_7;
  }
  uint64_t v7 = *(void **)(a1 + 40);
  SEL v8 = [v3 nextCredentialIndex];
  objc_msgSend(v7, "getAllCredentialsIndexStartingAtSlot:forCredentialType:credentials:flow:", objc_msgSend(v8, "integerValue"), *(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 48));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v10 = v9;

    uint64_t v11 = 3;
LABEL_7:

    return (id)v11;
  }
  uint64_t v13 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
  return [(HMMTRSyncClusterDoorLock *)v13 findAvailableCredentialIndexStartingAtSlot:v15 forCredentialType:v16 assumingTotalNumberOfSlots:v17 flow:v18];
}

- (id)findAvailableCredentialIndexStartingAtSlot:(int64_t)a3 forCredentialType:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 flow:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    SEL v14 = HMFGetLogIdentifier();
    int64_t v15 = [v10 UUID];
    *(_DWORD *)buf = 138544386;
    int64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2048;
    int64_t v30 = a3;
    __int16 v31 = 2048;
    int64_t v32 = a4;
    __int16 v33 = 2048;
    int64_t v34 = a5;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findAvailableCredentialIndexStartingAtSlot: %ld forCredentialType: %ld assumingTotalNumberOfSlots: %ld", buf, 0x34u);
  }
  if (a3 <= a5)
  {
    int64_t v17 = [(HMMTRSyncClusterDoorLock *)v12 getCredentialAtIndex:a3 forCredentialType:a4 flow:v10];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __121__HMMTRSyncClusterDoorLock_findAvailableCredentialIndexStartingAtSlot_forCredentialType_assumingTotalNumberOfSlots_flow___block_invoke;
    v20[3] = &unk_265375298;
    int64_t v22 = a3;
    int64_t v23 = a5;
    v20[4] = v12;
    int64_t v24 = a4;
    id v21 = v10;
    id v18 = [v17 then:v20];
  }
  else
  {
    int64_t v16 = (void *)MEMORY[0x263F42538];
    int64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:5 userInfo:0];
    id v18 = [v16 futureWithError:v17];
  }

  return v18;
}

id __121__HMMTRSyncClusterDoorLock_findAvailableCredentialIndexStartingAtSlot_forCredentialType_assumingTotalNumberOfSlots_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 credentialExists];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    id v10 = NSNumber;
    uint64_t v11 = *(void *)(a1 + 48);
    goto LABEL_7;
  }
  if (*(void *)(a1 + 48) >= *(void *)(a1 + 56))
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:5 userInfo:0];
    SEL v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v12 = 2;
    goto LABEL_14;
  }
  uint64_t v6 = [v3 nextCredentialIndex];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [v3 nextCredentialIndex],
        SEL v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 integerValue] - *(void *)(a1 + 48),
        v8,
        v7,
        v9 >= 2))
  {
    id v10 = NSNumber;
    uint64_t v11 = *(void *)(a1 + 48) + 1;
LABEL_7:
    [v10 numberWithInteger:v11];
    objc_claimAutoreleasedReturnValue();
    uint64_t v12 = 1;
LABEL_14:

    return (id)v12;
  }
  id v16 = [*(id *)(a1 + 32) findAvailableCredentialIndexStartingAtSlot:*(void *)(a1 + 48) + 2 forCredentialType:*(void *)(a1 + 64) assumingTotalNumberOfSlots:*(void *)(a1 + 56) flow:*(void *)(a1 + 40)];
  if (v16)
  {
    int64_t v17 = v16;

    uint64_t v12 = 3;
    goto LABEL_14;
  }
  id v19 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
  return [(HMMTRSyncClusterDoorLock *)v19 firstAvailableCredentialSlotForCredentialType:v21 flow:v22];
}

- (id)firstAvailableCredentialSlotForCredentialType:(int64_t)a3 flow:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
  SEL v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    int64_t v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2048;
    int64_t v30 = a3;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] firstAvailableCredentialSlotForCredentialType: %ld", buf, 0x20u);
  }
  if ([&unk_2702B4ED8 integerValue] == a3)
  {
    uint64_t v12 = [(HMMTRSyncClusterDoorLock *)v8 totalNumberOfPINCredentialsSupported_flow:v6];
LABEL_10:
    id v13 = (void *)v12;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __79__HMMTRSyncClusterDoorLock_firstAvailableCredentialSlotForCredentialType_flow___block_invoke;
    v22[3] = &unk_265375270;
    void v22[4] = v8;
    int64_t v24 = a3;
    id v23 = v6;
    SEL v14 = [v13 then:v22];

    goto LABEL_11;
  }
  if ([&unk_2702B4EF0 integerValue] == a3)
  {
    uint64_t v12 = [(HMMTRSyncClusterDoorLock *)v8 totalNumberOfRFIDCredentialsSupported_flow:v6];
    goto LABEL_10;
  }
  if ([&unk_2702B4F08 integerValue] == a3 || objc_msgSend(&unk_2702B4F20, "integerValue") == a3)
  {
    uint64_t v12 = [MEMORY[0x263F42538] futureWithValue:&unk_2702B5010];
    goto LABEL_10;
  }
  id v16 = (void *)MEMORY[0x2533B64D0]();
  int64_t v17 = v8;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    SEL v20 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    int64_t v26 = v19;
    __int16 v27 = 2112;
    id v28 = v20;
    __int16 v29 = 2048;
    int64_t v30 = a3;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unsupported credential type: %ld", buf, 0x20u);
  }
  int64_t v21 = (void *)MEMORY[0x263F42538];
  id v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
  SEL v14 = [v21 futureWithError:v13];
LABEL_11:

  return v14;
}

uint64_t __79__HMMTRSyncClusterDoorLock_firstAvailableCredentialSlotForCredentialType_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "findAvailableCredentialIndexStartingAtSlot:forCredentialType:assumingTotalNumberOfSlots:flow:", 1, *(void *)(a1 + 48), objc_msgSend(v3, "integerValue"), *(void *)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    char v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v7 findOrAddUserWithUniqueID:v9 userType:v10 flow:v11];
  }
}

- (id)findOrAddUserWithUniqueID:(id)a3 userType:(id)a4 flow:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    SEL v14 = HMFGetLogIdentifier();
    id v15 = [v10 UUID];
    *(_DWORD *)buf = 138544130;
    __int16 v27 = v14;
    __int16 v28 = 2112;
    __int16 v29 = v15;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findOrAddUserWithUniqueID: %@, userType: %@ if creating new user", buf, 0x2Au);
  }
  id v16 = [(HMMTRSyncClusterDoorLock *)v12 _findUserOrAvailableSlotWithUserUniqueID:v8 flow:v10];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke;
  v22[3] = &unk_265375248;
  void v22[4] = v12;
  id v23 = v10;
  id v24 = v8;
  id v25 = v9;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  SEL v20 = [v16 then:v22];

  return v20;
}

uint64_t __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 user];

  if (v4)
  {
    char v5 = objc_opt_new();
    id v6 = [v3 user];
    [v5 setExistingUser:v6];

    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      uint64_t v12 = [v5 existingUser];
      *(_DWORD *)buf = 138543874;
      id v33 = v10;
      __int16 v34 = 2112;
      uint64_t v35 = v11;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found user: %@", buf, 0x20u);
    }
    uint64_t v13 = 1;
  }
  else
  {
    SEL v14 = [v3 availableSlots];
    int v15 = objc_msgSend(v14, "hmf_isEmpty");

    if (v15)
    {
      id v16 = (void *)MEMORY[0x2533B64D0]();
      id v17 = *(id *)(a1 + 32);
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        SEL v20 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138543618;
        id v33 = v19;
        __int16 v34 = 2112;
        uint64_t v35 = v20;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not add home user because there are no available slots", buf, 0x16u);
      }
      id v21 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:5 userInfo:0];
      id v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        [MEMORY[0x263F087E8] hmfUnspecifiedError];
        objc_claimAutoreleasedReturnValue();
      }

      uint64_t v13 = 2;
    }
    else
    {
      id v24 = [v3 availableSlots];
      id v25 = [v24 firstObject];
      uint64_t v26 = [v25 integerValue];

      __int16 v27 = objc_msgSend(*(id *)(a1 + 32), "addUserAtUserIndex:withUserUniqueID:userType:flow:", v26, objc_msgSend(*(id *)(a1 + 48), "integerValue"), *(void *)(a1 + 56), *(void *)(a1 + 40));
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke_243;
      v31[3] = &__block_descriptor_40_e50___HMFFutureBlockOutcome_q__16__0___HMFAlwaysNil__8l;
      void v31[4] = v26;
      id v28 = [v27 then:v31];
      if (!v28) {
        _HMFPreconditionFailure();
      }
      __int16 v29 = v28;

      uint64_t v13 = 3;
    }
  }

  return v13;
}

uint64_t __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke_243(uint64_t a1)
{
  return 1;
}

- (id)rfidCredentialForUser:(id)a3 flow:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v7 UUID];
    int v17 = 138543874;
    id v18 = v11;
    __int16 v19 = 2112;
    SEL v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] pinCredentialForUser: %@", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v13 = [v6 credentials];
  SEL v14 = objc_msgSend(v13, "hmf_objectPassingTest:", &__block_literal_global_241);

  int v15 = [v14 credentialIndex];

  return v15;
}

uint64_t __55__HMMTRSyncClusterDoorLock_rfidCredentialForUser_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 credentialType];
  uint64_t v3 = [v2 isEqualToNumber:&unk_2702B4EF0];

  return v3;
}

- (id)pinCredentialForUser:(id)a3 flow:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v7 UUID];
    int v17 = 138543874;
    id v18 = v11;
    __int16 v19 = 2112;
    SEL v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] pinCredentialForUser: %@", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v13 = [v6 credentials];
  SEL v14 = objc_msgSend(v13, "hmf_objectPassingTest:", &__block_literal_global_239);

  int v15 = [v14 credentialIndex];

  return v15;
}

uint64_t __54__HMMTRSyncClusterDoorLock_pinCredentialForUser_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 credentialType];
  uint64_t v3 = [v2 isEqualToNumber:&unk_2702B4ED8];

  return v3;
}

- (id)provisionHomePin:(id)a3 flow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRSyncClusterDoorLock *)self findOrAddUserWithUniqueID:&unk_2702B4F38 userType:&unk_2702B4F80 flow:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__HMMTRSyncClusterDoorLock_provisionHomePin_flow___block_invoke;
  v13[3] = &unk_265374FC8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 then:v13];

  return v11;
}

uint64_t __50__HMMTRSyncClusterDoorLock_provisionHomePin_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 newUserSlot])
  {
    id v6 = [v3 existingUser];
    id v7 = [v6 userIndex];
    uint64_t v8 = [v7 integerValue];

    id v9 = *(void **)(a1 + 32);
    id v10 = [v3 existingUser];
    char v5 = [v9 pinCredentialForUser:v10 flow:*(void *)(a1 + 48)];

    if (v5) {
      objc_msgSend(*(id *)(a1 + 32), "updatePinCredentialAtIndex:withValue:forUserAtUserIndex:flow:", objc_msgSend(v5, "integerValue"), *(void *)(a1 + 40), v8, *(void *)(a1 + 48));
    }
    else {
    id v11 = [*(id *)(a1 + 32) addPinCodeWithValue:*(void *)(a1 + 40) forUserIndex:v8 flow:*(void *)(a1 + 48)];
    }
    id v4 = v11;
    if (!v11) {
      goto LABEL_10;
    }

LABEL_9:
    return 3;
  }
  objc_msgSend(*(id *)(a1 + 32), "addPinCodeWithValue:forUserIndex:flow:", *(void *)(a1 + 40), objc_msgSend(v3, "newUserSlot"), *(void *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = v4;
  if (v4) {
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v13 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
  return (uint64_t)[(HMMTRSyncClusterDoorLock *)v13 deriveHomePinFromUUID:v15 flow:v16];
}

- (id)deriveHomePinFromUUID:(id)a3 flow:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTRClusterDoorLock *)self readAttributeMaxPINCodeLengthWithParams:0];
  id v9 = [v8 objectForKey:@"value"];
  if (v9)
  {
    id v10 = objc_msgSend((id)objc_opt_class(), "deriveHomePinFromUUID:withNumberOfDigits:flow:", v6, objc_msgSend(v9, "integerValue"), v7);
  }
  else
  {
    id v11 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      SEL v14 = HMFGetLogIdentifier();
      id v15 = [v7 UUID];
      int v17 = 138543618;
      id v18 = v14;
      __int16 v19 = 2112;
      SEL v20 = v15;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to read max pin code length from accessory", (uint8_t *)&v17, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

- (id)readSchedulesForUserIndex:(int64_t)a3 flow:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__HMMTRSyncClusterDoorLock_readSchedulesForUserIndex_flow___block_invoke;
  v10[3] = &unk_265374C50;
  void v10[4] = self;
  id v11 = v6;
  int64_t v12 = a3;
  id v7 = v6;
  uint64_t v8 = [(HMMTRSyncClusterDoorLock *)self serialize:v10];

  return v8;
}

id __59__HMMTRSyncClusterDoorLock_readSchedulesForUserIndex_flow___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    int v17 = v5;
    __int16 v18 = 2112;
    __int16 v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] readSchedulesForUserIndex: %ld", buf, 0x20u);
  }
  uint64_t v8 = (void *)MEMORY[0x263F42538];
  id v9 = [*(id *)(a1 + 32) readScheduleForScheduleType:0 forUserIndex:*(void *)(a1 + 48) flow:*(void *)(a1 + 40)];
  id v10 = objc_msgSend(*(id *)(a1 + 32), "readScheduleForScheduleType:forUserIndex:flow:", 1, *(void *)(a1 + 48), *(void *)(a1 + 40), v9);
  v15[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  int64_t v12 = [v8 all:v11];
  uint64_t v13 = [v12 then:&__block_literal_global_214];

  return v13;
}

uint64_t __59__HMMTRSyncClusterDoorLock_readSchedulesForUserIndex_flow___block_invoke_212(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v2 objectAtIndexedSubscript:1];

  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return 1;
}

- (id)updateSchedulesForUserIndex:(int64_t)a3 withWeekDaySchedules:(id)a4 andYearDaySchedules:(id)a5 flow:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke;
  v18[3] = &unk_265375158;
  v18[4] = self;
  id v19 = v12;
  id v21 = v11;
  int64_t v22 = a3;
  id v20 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  id v16 = [(HMMTRSyncClusterDoorLock *)self serialize:v18];

  return v16;
}

id __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544386;
    uint64_t v26 = v5;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2048;
    uint64_t v30 = v7;
    __int16 v31 = 2112;
    uint64_t v32 = v9;
    __int16 v33 = 2112;
    uint64_t v34 = v8;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updateSchedulesForUserIndex: %ld, withWeekDaySchedules: %@ andYearDaySchedules: %@", buf, 0x34u);
  }
  id v10 = &unk_2702B4F68;
  if (objc_msgSend(*(id *)(a1 + 48), "hmf_isEmpty")
    && objc_msgSend(*(id *)(a1 + 56), "hmf_isEmpty"))
  {
    id v10 = &unk_2702B4F38;
  }
  id v11 = v10;
  id v12 = [*(id *)(a1 + 32) findOperationOrderForModifyingWeekDaySchedules:*(void *)(a1 + 48) andYearDaySchedules:*(void *)(a1 + 56) forUserIndex:*(void *)(a1 + 64) flow:*(void *)(a1 + 40)];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_211;
  v21[3] = &unk_2653750B8;
  uint64_t v24 = *(void *)(a1 + 64);
  id v13 = *(void **)(a1 + 40);
  v21[4] = *(void *)(a1 + 32);
  id v22 = v11;
  id v23 = v13;
  id v14 = v11;
  id v15 = [v12 then:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2;
  v19[3] = &unk_265376318;
  id v16 = *(void **)(a1 + 40);
  void v19[4] = *(void *)(a1 + 32);
  id v20 = v16;
  int v17 = [v15 recover:v19];

  return v17;
}

uint64_t __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_211(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) updateUserTypeForUserIndex:*(void *)(a1 + 56) userType:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2(v7);
  }
}

uint64_t __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update either week or year day schedules with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:9 userInfo:0];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)findOrAddUserWithUniqueID:(id)a3 withWeekDaySchedules:(id)a4 andYearDaySchedules:(id)a5 flow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke;
  v20[3] = &unk_265375130;
  v20[4] = self;
  id v21 = v13;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = [(HMMTRSyncClusterDoorLock *)self serialize:v20];

  return v18;
}

id __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    uint64_t v26 = v5;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    __int16 v31 = 2112;
    uint64_t v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v9;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findOrAddUserWithUniqueID: %@, withWeekDaySchedules: %@ andYearDaySchedules: %@", buf, 0x34u);
  }
  id v10 = &unk_2702B4F68;
  if (objc_msgSend(*(id *)(a1 + 56), "hmf_isEmpty")
    && objc_msgSend(*(id *)(a1 + 64), "hmf_isEmpty"))
  {
    id v10 = &unk_2702B4F38;
  }
  id v11 = v10;
  id v12 = [*(id *)(a1 + 32) findOrAddUserWithUniqueID:*(void *)(a1 + 48) userType:v11 flow:*(void *)(a1 + 40)];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_209;
  v19[3] = &unk_265375108;
  id v20 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(a1 + 40);
  id v21 = v13;
  uint64_t v22 = v14;
  id v23 = v15;
  id v24 = v11;
  id v16 = v11;
  id v17 = [v12 then:v19];

  return v17;
}

uint64_t __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_209(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 newUserSlot];
  if (!v4)
  {
    id v5 = [v3 existingUser];
    id v6 = [v5 userIndex];
    uint64_t v4 = [v6 integerValue];
  }
  if (objc_msgSend(a1[4], "hmf_isEmpty")
    && objc_msgSend(a1[5], "hmf_isEmpty")
    && ([v3 existingUser], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    id v19 = [MEMORY[0x263F42538] futureWithValue:v3];
    if (v19)
    {
      id v20 = v19;

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v8 = [a1[6] findOperationOrderForModifyingWeekDaySchedules:a1[4] andYearDaySchedules:a1[5] forUserIndex:v4 flow:a1[7]];
    uint64_t v9 = [v3 existingUser];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [v3 existingUser];
      id v12 = [v11 userType];
      char v13 = [v12 isEqualToNumber:a1[8]];

      if ((v13 & 1) == 0)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2;
        v28[3] = &unk_2653750B8;
        v28[4] = a1[6];
        uint64_t v31 = v4;
        id v29 = a1[8];
        id v30 = a1[7];
        uint64_t v14 = [v8 then:v28];

        uint64_t v8 = (void *)v14;
      }
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_3;
    v26[3] = &unk_2653750E0;
    id v27 = v3;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_4;
    v23[3] = &unk_265377D70;
    id v15 = a1[7];
    void v23[4] = a1[6];
    id v24 = v15;
    id v25 = v27;
    id v16 = [v8 then:v26 orRecover:v23];
    if (v16)
    {
      id v17 = v16;

LABEL_11:
      return 3;
    }
  }
  uint64_t v21 = _HMFPreconditionFailure();
  return __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2(v21, v22);
}

uint64_t __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) updateUserTypeForUserIndex:*(void *)(a1 + 56) userType:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_3(v7);
  }
}

uint64_t __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F42538] futureWithValue:*(void *)(a1 + 32)];
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_4(v7);
  }
}

uint64_t __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_4(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = [a1[5] UUID];
    int v19 = 138543874;
    id v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update either week or year day schedules with error: %@", (uint8_t *)&v19, 0x20u);
  }
  if ([a1[6] newUserSlot])
  {
    uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = a1[4];
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      char v13 = [a1[5] UUID];
      int v19 = 138543618;
      id v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to create a new RG matter user with correct schedules, so removing the user.", (uint8_t *)&v19, 0x16u);
    }
    id v14 = (id)objc_msgSend(a1[4], "clearUserAtIndex:flow:", objc_msgSend(a1[6], "newUserSlot"), a1[5]);
  }
  id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:9 userInfo:0];
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)clearCredentialAtIndex:(int64_t)a3 withCredentialType:(id)a4 flow:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x2533B64D0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    char v13 = HMFGetLogIdentifier();
    id v14 = [v9 UUID];
    *(_DWORD *)buf = 138544130;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    int64_t v31 = a3;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] clearCredentialAtIndex: %ld, withCredentialType: %@", buf, 0x2Au);
  }
  uint64_t v21 = MEMORY[0x263EF8330];
  id v22 = v8;
  __int16 v23 = v11;
  id v24 = v9;
  int64_t v25 = a3;
  id v15 = (void *)MEMORY[0x263F42530];
  id v16 = v9;
  id v17 = v8;
  id v18 = objc_msgSend(v15, "untrackedPlaceholderFlow", v21, 3221225472, __75__HMMTRSyncClusterDoorLock_clearCredentialAtIndex_withCredentialType_flow___block_invoke, &unk_265375090);
  int v19 = [(HMMTRSyncClusterDoorLock *)v11 ensureAccessoryConnected:&v21 flow:v18];

  return v19;
}

id __75__HMMTRSyncClusterDoorLock_clearCredentialAtIndex_withCredentialType_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E28]);
  [v2 setCredentialType:*(void *)(a1 + 32)];
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  [v2 setCredentialIndex:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F10E00]);
  [v4 setCredential:v2];
  id v12 = 0;
  id v5 = [MEMORY[0x263F42538] futureWithPromise:&v12];
  id v6 = [v12 errorOnlyResolverBlock];
  [*(id *)(a1 + 40) clearCredentialWithParams:v4 expectedValues:0 expectedValueInterval:0 completionHandler:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__HMMTRSyncClusterDoorLock_clearCredentialAtIndex_withCredentialType_flow___block_invoke_2;
  v10[3] = &unk_265376318;
  uint64_t v7 = *(void **)(a1 + 48);
  void v10[4] = *(void *)(a1 + 40);
  id v11 = v7;
  id v8 = [v5 recover:v10];

  return v8;
}

uint64_t __75__HMMTRSyncClusterDoorLock_clearCredentialAtIndex_withCredentialType_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pin credential with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)clearUserAtIndex:(int64_t)a3 flow:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v11;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Clearing user at index: %ld", buf, 0x20u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__HMMTRSyncClusterDoorLock_clearUserAtIndex_flow___block_invoke;
  v17[3] = &unk_265374C50;
  id v18 = v6;
  int64_t v19 = a3;
  v17[4] = v8;
  id v12 = (void *)MEMORY[0x263F42530];
  id v13 = v6;
  id v14 = [v12 untrackedPlaceholderFlow];
  __int16 v15 = [(HMMTRSyncClusterDoorLock *)v8 ensureAccessoryConnected:v17 flow:v14];

  return v15;
}

id __50__HMMTRSyncClusterDoorLock_clearUserAtIndex_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v2 setUserIndex:v3];

  id v14 = 0;
  id v4 = [MEMORY[0x263F42538] futureWithPromise:&v14];
  id v5 = [v14 errorOnlyResolverBlock];
  [*(id *)(a1 + 32) clearUserWithParams:v2 expectedValues:0 expectedValueInterval:0 completionHandler:v5];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__HMMTRSyncClusterDoorLock_clearUserAtIndex_flow___block_invoke_2;
  v11[3] = &unk_265374C78;
  id v6 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 48);
  id v12 = v7;
  uint64_t v13 = v8;
  id v9 = [v4 recover:v11];

  return v9;
}

uint64_t __50__HMMTRSyncClusterDoorLock_clearUserAtIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = [*(id *)(a1 + 40) UUID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v14 = 138544130;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to clear user at index: %ld, with error: %@", (uint8_t *)&v14, 0x2Au);
  }
  id v10 = v3;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)getAllUsers
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__HMMTRSyncClusterDoorLock_getAllUsers__block_invoke;
  v4[3] = &unk_265374CC8;
  v4[4] = self;
  id v2 = [(HMMTRSyncClusterDoorLock *)self serialize:v4];
  return v2;
}

id __39__HMMTRSyncClusterDoorLock_getAllUsers__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Getting all users", buf, 0x16u);
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "totalNumberOfUsersSupported_flow:", v2);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__HMMTRSyncClusterDoorLock_getAllUsers__block_invoke_205;
  v12[3] = &unk_265374DB8;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v2;
  id v9 = v2;
  id v10 = [v8 then:v12];

  return v10;
}

uint64_t __39__HMMTRSyncClusterDoorLock_getAllUsers__block_invoke_205(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 integerValue];
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [v4 getAllUsersStartingAtSlot:1 assumingTotalNumberOfSlots:v5 users:v6 flow:*(void *)(a1 + 40)];
  if (v7)
  {
    uint64_t v8 = v7;

    return 3;
  }
  else
  {
    id v10 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v10 addDeviceCredentialKeyData:v12 ofType:v13 forUserIndex:v14 flow:v15];
  }
}

- (id)addDeviceCredentialKeyData:(id)a3 ofType:(int64_t)a4 forUserIndex:(int64_t)a5 flow:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [&unk_2702B4EF0 integerValue];
  if (a4 == 1) {
    uint64_t v12 = [&unk_2702B4F20 integerValue];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke;
  v17[3] = &unk_265375068;
  v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  uint64_t v20 = v12;
  int64_t v21 = a4;
  int64_t v22 = a5;
  id v13 = v10;
  id v14 = v11;
  id v15 = [(HMMTRSyncClusterDoorLock *)self serialize:v17];

  return v15;
}

id __80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138544642;
    __int16 v23 = v5;
    __int16 v24 = 2112;
    int64_t v25 = v6;
    __int16 v26 = 2112;
    uint64_t v27 = v7;
    __int16 v28 = 2048;
    uint64_t v29 = v8;
    __int16 v30 = 2048;
    uint64_t v31 = v9;
    __int16 v32 = 2048;
    uint64_t v33 = v10;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addDeviceCredentialKeyData: %@, credentialType: %ld, tapToUnlockType: %ld, forUserIndex: %ld", buf, 0x3Eu);
  }
  id v11 = [*(id *)(a1 + 32) firstAvailableCredentialSlotForCredentialType:*(void *)(a1 + 56) flow:*(void *)(a1 + 40)];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke_204;
  v17[3] = &unk_265375040;
  v17[4] = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  id v18 = v12;
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v20 = v13;
  uint64_t v21 = v14;
  id v19 = *(id *)(a1 + 40);
  id v15 = [v11 then:v17];

  return v15;
}

uint64_t __80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke_204(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = [NSNumber numberWithInteger:a1[7]];
  objc_msgSend(v4, "addCredentialData:forCredentialType:atIndex:forUserAtUserIndex:flow:", v5, v6, objc_msgSend(v3, "integerValue"), a1[8], a1[6]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v8 = v7;

    return 3;
  }
  else
  {
    uint64_t v10 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v10 addIssuerKeyData:v12 forUserIndex:v13 isUnifiedAccess:v14 flow:v15];
  }
}

- (id)addIssuerKeyData:(id)a3 forUserIndex:(int64_t)a4 isUnifiedAccess:(BOOL)a5 flow:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke;
  v17[3] = &unk_265375018;
  id v12 = &unk_2702B4EF0;
  v17[4] = self;
  id v18 = v11;
  BOOL v22 = v7;
  if (!v7) {
    id v12 = &unk_2702B4F08;
  }
  id v19 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v13 = v10;
  id v14 = v11;
  id v15 = [(HMMTRSyncClusterDoorLock *)self serialize:v17];

  return v15;
}

id __79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544642;
    BOOL v22 = v5;
    __int16 v23 = 2112;
    __int16 v24 = v6;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    __int16 v31 = 2048;
    uint64_t v32 = v10;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeyData: %@, isUnifiedAccess: %ld, credentialType: %@, forUserIndex: %ld", buf, 0x3Eu);
  }
  id v11 = objc_msgSend(*(id *)(a1 + 32), "firstAvailableCredentialSlotForCredentialType:flow:", objc_msgSend(*(id *)(a1 + 56), "integerValue"), *(void *)(a1 + 40));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke_203;
  v16[3] = &unk_265374FF0;
  v16[4] = *(void *)(a1 + 32);
  id v17 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  id v18 = v12;
  uint64_t v20 = v13;
  id v19 = *(id *)(a1 + 40);
  id v14 = [v11 then:v16];

  return v14;
}

uint64_t __79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke_203(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addCredentialData:forCredentialType:atIndex:forUserAtUserIndex:flow:", *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(v3, "integerValue"), *(void *)(a1 + 64), *(void *)(a1 + 56));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v7 addOrUpdateReaderKeyData:v9 flow:v10];
  }
}

- (id)addOrUpdateReaderKeyData:(id)a3 flow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke;
  v12[3] = &unk_265374B60;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = [(HMMTRSyncClusterDoorLock *)self serialize:v12];

  return v10;
}

id __58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [a1[5] UUID];
    id v7 = a1[6];
    *(_DWORD *)buf = 138543874;
    __int16 v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addOrUpdateReaderKeyData: %@", buf, 0x20u);
  }
  id v8 = [a1[4] findOrAddUserWithUniqueID:&unk_2702B4F38 userType:&unk_2702B4F80 flow:a1[5]];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke_201;
  v12[3] = &unk_265374FC8;
  id v9 = a1[5];
  v12[4] = a1[4];
  id v13 = v9;
  id v14 = a1[6];
  id v10 = [v8 then:v12];

  return v10;
}

uint64_t __58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke_201(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 newUserSlot];
  if (!v4)
  {
    uint64_t v5 = [v3 existingUser];
    id v6 = [v5 userIndex];
    uint64_t v4 = [v6 integerValue];
  }
  id v7 = [v3 existingUser];

  if (v7
    && (id v8 = *(void **)(a1 + 32),
        [v3 existingUser],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v8 rfidCredentialForUser:v9 flow:*(void *)(a1 + 40)],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "updateCredentialData:forCredentialType:atIndex:forUserAtUserIndex:flow:", *(void *)(a1 + 48), &unk_2702B4EF0, objc_msgSend(v10, "integerValue"), v4, *(void *)(a1 + 40));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      id v12 = v11;

LABEL_8:
      return 3;
    }
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) addReaderKeyData:*(void *)(a1 + 48) toUserIndex:v4 flow:*(void *)(a1 + 40)];
    id v10 = v12;
    if (v12) {
      goto LABEL_8;
    }
  }
  id v14 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
  return (uint64_t)[(HMMTRSyncClusterDoorLock *)v14 readReaderConfigWithFlow:v16];
}

- (id)readReaderConfigWithFlow:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] readReaderConfig", buf, 0x16u);
  }
  *(void *)buf = 0;
  id v10 = [MEMORY[0x263F42538] futureWithPromise:buf];
  id v11 = [*(id *)buf resolverBlock];
  id v12 = [(HMMTRSyncClusterDoorLock *)v6 apiRouter];
  [v12 readAttributeAliroReaderVerificationKeyWithFlow:v4 completion:v11];

  v27[0] = v10;
  *(void *)buf = 0;
  id v13 = [MEMORY[0x263F42538] futureWithPromise:buf];
  id v14 = [*(id *)buf resolverBlock];
  SEL v15 = [(HMMTRSyncClusterDoorLock *)v6 apiRouter];
  [v15 readAttributeAliroReaderGroupIdentifierWithFlow:v4 completion:v14];

  v27[1] = v13;
  *(void *)buf = 0;
  id v16 = [MEMORY[0x263F42538] futureWithPromise:buf];
  __int16 v17 = [*(id *)buf resolverBlock];
  id v18 = [(HMMTRSyncClusterDoorLock *)v6 apiRouter];
  [v18 readAttributeAliroGroupResolvingKeyWithFlow:v4 completion:v17];

  __int16 v19 = [v16 recover:&__block_literal_global_196];
  v27[2] = v19;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];

  uint64_t v21 = [MEMORY[0x263F42538] allSettled:v20];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __53__HMMTRSyncClusterDoorLock_readReaderConfigWithFlow___block_invoke_2;
  v25[3] = &unk_265374FA0;
  v25[4] = v6;
  id v26 = v4;
  id v22 = v4;
  __int16 v23 = [v21 then:v25];

  return v23;
}

uint64_t __53__HMMTRSyncClusterDoorLock_readReaderConfigWithFlow___block_invoke_2(uint64_t a1, void *a2)
{
  v39[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_class();
  uint64_t v5 = [v3 objectAtIndexedSubscript:0];
  v39[0] = v5;
  id v6 = [v3 objectAtIndexedSubscript:1];
  v39[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  uint64_t v8 = [v4 validateFutureResults:v7 ofClass:objc_opt_class() areNullable:0 flow:*(void *)(a1 + 40)];

  id v9 = objc_opt_class();
  id v10 = [v3 objectAtIndexedSubscript:2];
  uint64_t v38 = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
  uint64_t v12 = [v9 validateFutureResults:v11 ofClass:objc_opt_class() areNullable:1 flow:*(void *)(a1 + 40)];

  if (v8 | v12)
  {
    id v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = *(id *)(a1 + 32);
    SEL v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      __int16 v17 = [*(id *)(a1 + 40) UUID];
      int v30 = 138544130;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      uint64_t v35 = v8;
      __int16 v36 = 2112;
      uint64_t v37 = v12;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error while reading aliro reader config: %@, %@", (uint8_t *)&v30, 0x2Au);
    }
    if (v8) {
      id v18 = (void *)v8;
    }
    else {
      id v18 = (void *)v12;
    }
    id v19 = v18;
    if (v19)
    {
      id v20 = v19;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
      id v20 = 0;
    }
    uint64_t v21 = 2;
  }
  else
  {
    id v20 = (id)objc_opt_new();
    id v22 = [v3 objectAtIndexedSubscript:0];
    [v20 setReaderPublicKeyExternalRepresentation:v22];

    __int16 v23 = [v3 objectAtIndexedSubscript:1];
    [v20 setReaderGroupIdentifier:v23];

    __int16 v24 = [v3 objectAtIndexedSubscript:2];
    __int16 v25 = [MEMORY[0x263EFF9D0] null];

    if (v24 != v25)
    {
      id v26 = [v3 objectAtIndexedSubscript:2];
      [v20 setGroupResolvingKey:v26];
    }
    id v27 = [MEMORY[0x263F42538] futureWithValue:v20];
    if (!v27) {
      _HMFPreconditionFailure();
    }
    uint64_t v28 = v27;

    uint64_t v21 = 3;
  }

  return v21;
}

uint64_t __53__HMMTRSyncClusterDoorLock_readReaderConfigWithFlow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 domain];
  id v4 = v3;
  if (v3 == (void *)*MEMORY[0x263F10BE8])
  {
    uint64_t v5 = [v2 code];

    if (v5 == 134)
    {
      [MEMORY[0x263EFF9D0] null];
      objc_claimAutoreleasedReturnValue();
      uint64_t v6 = 1;
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v7 = v2;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  uint64_t v6 = 2;
LABEL_9:

  return v6;
}

- (id)setOrReadReaderConfig:(id)a3 flow:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = v12;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] setOrReadReaderConfig: %@", buf, 0x20u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__HMMTRSyncClusterDoorLock_setOrReadReaderConfig_flow___block_invoke;
  v17[3] = &unk_265374B60;
  v17[4] = v9;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  SEL v15 = [(HMMTRSyncClusterDoorLock *)v9 ensureAccessoryConnected:v17 flow:v13];

  return v15;
}

id __55__HMMTRSyncClusterDoorLock_setOrReadReaderConfig_flow___block_invoke(uint64_t a1)
{
  id v9 = 0;
  id v2 = [MEMORY[0x263F42538] futureWithPromise:&v9];
  id v3 = [v9 errorOnlyResolverBlock];
  id v4 = [*(id *)(a1 + 32) apiRouter];
  [v4 setAliroReaderConfigWithConfig:*(void *)(a1 + 40) flow:*(void *)(a1 + 48) completion:v3];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMMTRSyncClusterDoorLock_setOrReadReaderConfig_flow___block_invoke_2;
  v7[3] = &unk_265376318;
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  uint64_t v5 = [v2 recover:v7];

  return v5;
}

uint64_t __55__HMMTRSyncClusterDoorLock_setOrReadReaderConfig_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 domain];
  uint64_t v5 = v4;
  if (v4 != (void *)*MEMORY[0x263F10BE8])
  {

LABEL_6:
    id v10 = (void *)MEMORY[0x2533B64D0]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 40) UUID];
      int v19 = 138543874;
      id v20 = v13;
      __int16 v21 = 2112;
      __int16 v22 = v14;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set or read reader config with error: %@", (uint8_t *)&v19, 0x20u);
    }
    id v15 = v3;
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v9 = 2;
    goto LABEL_12;
  }
  uint64_t v6 = [v3 code];

  if (v6 != 203) {
    goto LABEL_6;
  }
  id v7 = [*(id *)(a1 + 32) readReaderConfigWithFlow:*(void *)(a1 + 40)];
  if (!v7) {
    _HMFPreconditionFailure();
  }
  id v8 = v7;

  uint64_t v9 = 3;
LABEL_12:

  return v9;
}

- (id)removePinCodeForUserIndex:(int64_t)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__HMMTRSyncClusterDoorLock_removePinCodeForUserIndex___block_invoke;
  v5[3] = &unk_265374F58;
  v5[4] = self;
  void v5[5] = a3;
  id v3 = [(HMMTRSyncClusterDoorLock *)self serialize:v5];
  return v3;
}

id __54__HMMTRSyncClusterDoorLock_removePinCodeForUserIndex___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] removePinCodeForUserIndex: %ld", buf, 0x20u);
  }
  uint64_t v9 = [*(id *)(a1 + 32) _getUserAtIndex:*(void *)(a1 + 40) includeAliroCredentials:0 flow:v2];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__HMMTRSyncClusterDoorLock_removePinCodeForUserIndex___block_invoke_194;
  v13[3] = &unk_265374F30;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v2;
  id v10 = v2;
  id v11 = [v9 then:v13];

  return v11;
}

id __54__HMMTRSyncClusterDoorLock_removePinCodeForUserIndex___block_invoke_194(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pinCredentialForUser:v3 flow:*(void *)(a1 + 40)];
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "clearCredentialAtIndex:withCredentialType:flow:", objc_msgSend(v4, "integerValue"), &unk_2702B4ED8, *(void *)(a1 + 40));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 3;

LABEL_5:
    return (id)v8;
  }
  id v10 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
  return [(HMMTRSyncClusterDoorLock *)v10 addOrUpdatePinCodeWithValue:v12 forUserIndex:v13];
}

- (id)addOrUpdatePinCodeWithValue:(id)a3 forUserIndex:(int64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke;
  v10[3] = &unk_265374C50;
  void v10[4] = self;
  id v11 = v6;
  int64_t v12 = a4;
  id v7 = v6;
  uint64_t v8 = [(HMMTRSyncClusterDoorLock *)self serialize:v10];

  return v8;
}

id __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    __int16 v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    __int16 v27 = 2048;
    uint64_t v28 = v9;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] addOrUpdatePinCodeWithValue: %@, forUserIndex: %ld", buf, 0x2Au);
  }
  id v10 = [*(id *)(a1 + 32) _getUserAtIndex:*(void *)(a1 + 48) includeAliroCredentials:1 flow:v2];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke_193;
  v17[3] = &unk_265374F08;
  id v11 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  id v18 = v2;
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 48);
  id v19 = v12;
  uint64_t v20 = v13;
  id v14 = v2;
  id v15 = [v10 then:v17];

  return v15;
}

uint64_t __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke_193(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pinCredentialForUser:v3 flow:*(void *)(a1 + 40)];
  uint64_t v5 = v4;
  if (v4) {
    objc_msgSend(*(id *)(a1 + 32), "updatePinCredentialAtIndex:withValue:forUserAtUserIndex:flow:", objc_msgSend(v4, "integerValue"), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
  else {
  id v6 = [*(id *)(a1 + 32) addPinCodeWithValue:*(void *)(a1 + 48) forUserIndex:*(void *)(a1 + 56) flow:*(void *)(a1 + 40)];
  }
  id v7 = v6;
  if (v6)
  {

    return 3;
  }
  else
  {
    uint64_t v9 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v9 getAllPinCodes];
  }
}

- (id)getAllPinCodes
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke;
  v4[3] = &unk_265374CC8;
  v4[4] = self;
  id v2 = [(HMMTRSyncClusterDoorLock *)self serialize:v4];
  return v2;
}

id __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] getAllPinCodes", buf, 0x16u);
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "fetchCurrentFabricIndex_flow:", v2);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_176;
  v12[3] = &unk_265374DB8;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v2;
  id v9 = v2;
  SEL v10 = [v8 then:v12];

  return v10;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_176(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [&unk_2702B4ED8 integerValue];
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [v4 getAllCredentialsIndexStartingAtSlot:1 forCredentialType:v5 credentials:v6 flow:*(void *)(a1 + 40)];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_2;
  v18[3] = &unk_265374EE0;
  uint64_t v8 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v8;
  id v9 = v3;
  id v20 = v9;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3_192;
  v16[3] = &unk_265376318;
  SEL v10 = *(void **)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  id v17 = v10;
  id v11 = [v7 then:v18 orRecover:v16];
  if (v11)
  {
    id v12 = v11;

    return 3;
  }
  else
  {
    uint64_t v14 = _HMFPreconditionFailure();
    return __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_2(v14, v15);
  }
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F42538];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3;
  v12[3] = &unk_265374E78;
  uint64_t v5 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = *(id *)(a1 + 48);
  id v6 = objc_msgSend(v3, "na_map:", v12);
  id v7 = [v4 allSettled:v6];
  id v8 = [v7 then:&__block_literal_global_186];
  if (v8)
  {
    id v9 = v8;

    return 3;
  }
  else
  {
    uint64_t v11 = _HMFPreconditionFailure();
    return __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3_192(v11);
  }
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3_192(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to get all pincodes with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  SEL v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 userIndex];
  id v6 = objc_msgSend(v4, "_getUserAtIndex:includeAliroCredentials:flow:", objc_msgSend(v5, "integerValue"), 0, *(void *)(a1 + 40));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_4;
  v15[3] = &unk_265374E50;
  id v7 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v7;
  id v17 = v3;
  id v18 = *(id *)(a1 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_182;
  v12[3] = &unk_265377D70;
  id v8 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v8;
  id v14 = v17;
  id v9 = v17;
  SEL v10 = [v6 then:v15 orRecover:v12];

  return v10;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_184(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_2_187(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 userStatus];
  int v5 = [v4 isEqualToNumber:&unk_2702B4FF8];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      SEL v10 = [*(id *)(a1 + 40) UUID];
      uint64_t v11 = *(void *)(a1 + 48);
      int v18 = 138543874;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Dropping credential that we could not fetch a user for. The user slot was marked Available. Credential: %@", (uint8_t *)&v18, 0x20u);
    }
    id v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v16 = 2;
  }
  else
  {
    __int16 v15 = objc_opt_new();
    [v15 setCredential:*(void *)(a1 + 48)];
    [v15 setUser:v3];
    [v15 setCurrentFabricIndex:*(void *)(a1 + 56)];
    uint64_t v16 = 1;
  }

  return v16;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v14 = 138544130;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Dropping credential that we could not fetch a user for. Credential: %@, Error: %@", (uint8_t *)&v14, 0x2Au);
  }
  id v10 = v3;
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)fetchFeatureMapWithFlow:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HMMTRSyncClusterDoorLock_fetchFeatureMapWithFlow___block_invoke;
  v7[3] = &unk_265374CC8;
  v7[4] = self;
  id v4 = objc_msgSend(MEMORY[0x263F42530], "untrackedPlaceholderFlow", a3);
  id v5 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v7 flow:v4];

  return v5;
}

id __52__HMMTRSyncClusterDoorLock_fetchFeatureMapWithFlow___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F10CF0]);
  id v3 = [*(id *)(a1 + 32) device];
  uint64_t v4 = [*(id *)(a1 + 32) endpoint];
  id v5 = [*(id *)(a1 + 32) queue];
  id v6 = (void *)[v2 initWithDevice:v3 endpoint:v4 queue:v5];

  id v24 = 0;
  id v7 = [MEMORY[0x263F42538] futureWithPromise:&v24];
  id v8 = objc_alloc_init(MEMORY[0x263F10FA0]);
  uint64_t v9 = [v6 readAttributeFeatureMapWithParams:v8];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    int v14 = (void *)MEMORY[0x2533B64D0]();
    id v15 = *(id *)(a1 + 32);
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Read feature map: %@", buf, 0x16u);
    }
    [v24 fulfillWithValue:v13];
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x2533B64D0]();
    id v19 = *(id *)(a1 + 32);
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v21;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not read attribute feature map from door lock", buf, 0xCu);
    }
    id v22 = v24;
    id v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    [v22 rejectWithError:v13];
  }

  return v7;
}

- (id)fetchAccessoryColor_flow:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x263EF8330];
  id v11 = v4;
  id v5 = (void *)MEMORY[0x263F42530];
  id v6 = v4;
  id v7 = objc_msgSend(v5, "untrackedPlaceholderFlow", v10, 3221225472, __53__HMMTRSyncClusterDoorLock_fetchAccessoryColor_flow___block_invoke, &unk_265374CF0, self);
  id v8 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:&v10 flow:v7];

  return v8;
}

id __53__HMMTRSyncClusterDoorLock_fetchAccessoryColor_flow___block_invoke(uint64_t a1)
{
  id v9 = 0;
  id v2 = [MEMORY[0x263F42538] futureWithPromise:&v9];
  id v3 = [v9 resolverBlock];
  [*(id *)(a1 + 32) readAttributeWithEndpointIDAndCompletion:&unk_2702B4F38 clusterID:&unk_2702B4FC8 attributeID:&unk_2702B4FB0 completion:v3];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HMMTRSyncClusterDoorLock_fetchAccessoryColor_flow___block_invoke_172;
  v7[3] = &unk_265374E28;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v5 = [v2 then:v7];

  return v5;
}

uint64_t __53__HMMTRSyncClusterDoorLock_fetchAccessoryColor_flow___block_invoke_172(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v24 = 138543874;
    __int16 v25 = v7;
    __int16 v26 = 2112;
    __int16 v27 = v8;
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Read value for fetchAccessoryColor: %@", (uint8_t *)&v24, 0x20u);
  }
  id v9 = [(id)objc_opt_class() productFinishFromAttributeResponse:v3];
  uint64_t v10 = [(id)objc_opt_class() colorFromAttributeResponse:v3];
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    id v15 = [*(id *)(a1 + 40) UUID];
    int v24 = 138544130;
    __int16 v25 = v14;
    __int16 v26 = 2112;
    __int16 v27 = v15;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = v10;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Parsed productFinish: %@, color: %@", (uint8_t *)&v24, 0x2Au);
  }
  __int16 v16 = &unk_2702B4FE0;
  if (v9 && v10)
  {
    if ([v9 integerValue] == 2 && objc_msgSend(v10, "integerValue") == 16)
    {
      uint64_t v17 = 14935011;
    }
    else if ([v9 integerValue] == 2 && objc_msgSend(v10, "integerValue") == 15)
    {
      uint64_t v17 = 14341582;
    }
    else if ([v9 integerValue] == 1 && !objc_msgSend(v10, "integerValue"))
    {
      uint64_t v17 = 0;
    }
    else
    {
      if ([v9 integerValue] != 3 || objc_msgSend(v10, "integerValue") != 17) {
        goto LABEL_20;
      }
      uint64_t v17 = 15521450;
    }
    __int16 v16 = [NSNumber numberWithInteger:v17];
LABEL_20:
    __int16 v18 = (void *)MEMORY[0x2533B64D0]();
    id v19 = *(id *)(a1 + 32);
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [*(id *)(a1 + 40) UUID];
      int v24 = 138543874;
      __int16 v25 = v21;
      __int16 v26 = 2112;
      __int16 v27 = v22;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Returning color: %@", (uint8_t *)&v24, 0x20u);
    }
  }

  return 1;
}

- (id)fetchFeatureMapForSupportingWeekAndYearDayScheduleWithFlow:(id)a3
{
  id v3 = [(HMMTRSyncClusterDoorLock *)self fetchFeatureMapWithFlow:a3];
  id v4 = [v3 then:&__block_literal_global_296];

  return v4;
}

uint64_t __87__HMMTRSyncClusterDoorLock_fetchFeatureMapForSupportingWeekAndYearDayScheduleWithFlow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  id v3 = a2;
  unsigned int v4 = [v3 unsignedIntValue] & 0x10;
  __int16 v5 = [v3 unsignedIntValue];

  id v6 = [v2 numberWithUnsignedInt:v5 & 0x400 | v4];

  return 1;
}

- (id)fetchReaderGroupSubIdentifier
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__HMMTRSyncClusterDoorLock_fetchReaderGroupSubIdentifier__block_invoke;
  v6[3] = &unk_265374CC8;
  void v6[4] = self;
  id v3 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
  unsigned int v4 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v6 flow:v3];

  return v4;
}

id __57__HMMTRSyncClusterDoorLock_fetchReaderGroupSubIdentifier__block_invoke(uint64_t a1)
{
  id v8 = 0;
  id v2 = [MEMORY[0x263F42538] futureWithPromise:&v8];
  id v3 = [v8 resolverBlock];
  unsigned int v4 = [*(id *)(a1 + 32) baseDoorLock];
  [v4 readAttributeAliroReaderGroupSubIdentifierWithCompletion:v3];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMMTRSyncClusterDoorLock_fetchReaderGroupSubIdentifier__block_invoke_2;
  v7[3] = &unk_265374DE0;
  v7[4] = *(void *)(a1 + 32);
  __int16 v5 = [v2 then:v7];

  return v5;
}

uint64_t __57__HMMTRSyncClusterDoorLock_fetchReaderGroupSubIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unsigned int v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Read value for reader group sub identifier: %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (id)fetchAccessorySupportsAliroBLEUWBWithFlow:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMTRSyncClusterDoorLock *)self fetchFeatureMapWithFlow:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroBLEUWBWithFlow___block_invoke;
  v9[3] = &unk_265374DB8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 then:v9];

  return v7;
}

void __70__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroBLEUWBWithFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() doorLockFeatureMapSupportsAliroBLEUWB:v3];
  if ([v4 BOOLValue])
  {
    v4;
LABEL_5:

    return;
  }
  id v16 = 0;
  id v5 = [MEMORY[0x263F42538] futureWithPromise:&v16];
  id v6 = [*(id *)(a1 + 32) apiRouter];
  uint64_t v7 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroBLEUWBWithFlow___block_invoke_2;
  v14[3] = &unk_265374D90;
  id v15 = v16;
  [v6 fetchAppleClusterFeaturesWithFlow:v7 completion:v14];

  id v8 = v5;
  if (v8)
  {
    int v9 = v8;

    goto LABEL_5;
  }
  uint64_t v10 = _HMFPreconditionFailure();
  __70__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroBLEUWBWithFlow___block_invoke_2(v10, v11, v12, v13);
}

void __70__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroBLEUWBWithFlow___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = *(void **)(a1 + 32);
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 rejectWithError:a4];
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithBool:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 fulfillWithValue:v6];
  }
}

- (id)fetchAccessorySupportsAliroProvisioningWithFlow:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMTRSyncClusterDoorLock *)self fetchFeatureMapWithFlow:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroProvisioningWithFlow___block_invoke;
  v9[3] = &unk_265374DB8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 then:v9];

  return v7;
}

void __76__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroProvisioningWithFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() doorLockFeatureMapSupportsAliroProvisioning:v3];
  if ([v4 BOOLValue])
  {
    v4;
LABEL_5:

    return;
  }
  id v16 = 0;
  id v5 = [MEMORY[0x263F42538] futureWithPromise:&v16];
  id v6 = [*(id *)(a1 + 32) apiRouter];
  uint64_t v7 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroProvisioningWithFlow___block_invoke_2;
  v14[3] = &unk_265374D90;
  id v15 = v16;
  [v6 fetchAppleClusterFeaturesWithFlow:v7 completion:v14];

  id v8 = v5;
  if (v8)
  {
    int v9 = v8;

    goto LABEL_5;
  }
  uint64_t v10 = _HMFPreconditionFailure();
  __76__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroProvisioningWithFlow___block_invoke_2(v10, v11, v12, v13);
}

void __76__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroProvisioningWithFlow___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = *(void **)(a1 + 32);
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 rejectWithError:a4];
  }
  else
  {
    id v6 = [NSNumber numberWithBool:a2];
    [v4 fulfillWithValue:v6];
  }
}

- (id)fetchAccessorySupportsTapToUnlock
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsTapToUnlock__block_invoke;
  v6[3] = &unk_265374CC8;
  void v6[4] = self;
  id v3 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
  id v4 = [(HMMTRSyncClusterDoorLock *)self ensureAccessoryConnected:v6 flow:v3];

  return v4;
}

id __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsTapToUnlock__block_invoke(uint64_t a1)
{
  id v7 = 0;
  id v2 = [MEMORY[0x263F42538] futureWithPromise:&v7];
  id v3 = [v7 resolverBlock];
  [*(id *)(a1 + 32) readAttributeWithEndpointIDAndCompletion:&unk_2702B4F38 clusterID:&unk_2702B4F98 attributeID:&unk_2702B4F38 completion:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsTapToUnlock__block_invoke_2;
  v6[3] = &unk_265374D68;
  void v6[4] = *(void *)(a1 + 32);
  id v4 = [v2 then:v6];

  return v4;
}

uint64_t __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsTapToUnlock__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() numberFromAttributeDictionary:v3];
  id v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x263EFFA80];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v13 = 138543874;
    int v14 = v11;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Read value for supportsTapToUnlock with value %@ from response: %@", (uint8_t *)&v13, 0x20u);
  }

  return 1;
}

- (void)readAttributeWithEndpointIDAndCompletion:(id)a3 clusterID:(id)a4 attributeID:(id)a5 completion:(id)a6
{
  id v18 = (void (**)(id, void *, void))a6;
  uint64_t v10 = (objc_class *)MEMORY[0x263F10FA0];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  __int16 v15 = [(MTRGenericCluster *)self device];
  id v16 = [v15 readAttributeWithEndpointID:v13 clusterID:v12 attributeID:v11 params:v14];

  if (v16)
  {
    v18[2](v18, v16, 0);
  }
  else
  {
    __int16 v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    ((void (**)(id, void *, void *))v18)[2](v18, 0, v17);
  }
}

- (id)fetchAccessorySupportsPinCodesWithFlow:(id)a3
{
  uint64_t v4 = [(HMMTRSyncClusterDoorLock *)self fetchFeatureMapWithFlow:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__HMMTRSyncClusterDoorLock_fetchAccessorySupportsPinCodesWithFlow___block_invoke;
  v7[3] = &unk_265374D40;
  v7[4] = self;
  id v5 = [v4 then:v7];

  return v5;
}

uint64_t __67__HMMTRSyncClusterDoorLock_fetchAccessorySupportsPinCodesWithFlow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() doorLockFeatureMapSupportsPinCodes:v2];

  id v4 = v3;
  return 1;
}

- (id)_removeUserWithUniqueID:(id)a3 flow:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    __int16 v28 = v11;
    __int16 v29 = 2112;
    __int16 v30 = v12;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing user with userUniqueID: %@", buf, 0x20u);
  }
  id v13 = [(HMMTRSyncClusterDoorLock *)v9 _findUserOrAvailableSlotWithUserUniqueID:v6 flow:v7];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __57__HMMTRSyncClusterDoorLock__removeUserWithUniqueID_flow___block_invoke;
  void v24[3] = &unk_265374D18;
  v24[4] = v9;
  id v14 = v7;
  id v25 = v14;
  id v15 = v6;
  id v26 = v15;
  id v16 = [v13 then:v24];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __57__HMMTRSyncClusterDoorLock__removeUserWithUniqueID_flow___block_invoke_165;
  v21[3] = &unk_265377D70;
  v21[4] = v9;
  id v22 = v14;
  id v23 = v15;
  id v17 = v15;
  id v18 = v14;
  uint64_t v19 = [v16 recover:v21];

  return v19;
}

uint64_t __57__HMMTRSyncClusterDoorLock__removeUserWithUniqueID_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 user];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 user];
    id v7 = [v6 userIndex];
    objc_msgSend(v5, "clearUserAtIndex:flow:", objc_msgSend(v7, "integerValue"), *(void *)(a1 + 40));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8) {
      _HMFPreconditionFailure();
    }
    id v9 = v8;
    uint64_t v10 = 3;
  }
  else
  {
    id v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) UUID];
      uint64_t v16 = *(void *)(a1 + 48);
      int v18 = 138543874;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find user on lock, so nothing to remove. userUniqueID: %@", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __57__HMMTRSyncClusterDoorLock__removeUserWithUniqueID_flow___block_invoke_165(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v14 = 138544130;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove user with userUniqueID: %@, error: %@", (uint8_t *)&v14, 0x2Au);
  }
  id v10 = v3;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)removeUserWithUniqueID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HMMTRSyncClusterDoorLock_removeUserWithUniqueID___block_invoke;
  v8[3] = &unk_265374CF0;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(HMMTRSyncClusterDoorLock *)self serialize:v8];

  return v6;
}

id __51__HMMTRSyncClusterDoorLock_removeUserWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    uint64_t v8 = *(void *)(a1 + 40);
    int v11 = 138543874;
    id v12 = v6;
    __int16 v13 = 2112;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Removing user with uniqueID: %@", (uint8_t *)&v11, 0x20u);
  }
  id v9 = [*(id *)(a1 + 32) _removeUserWithUniqueID:*(void *)(a1 + 40) flow:v2];

  return v9;
}

- (id)removeHomeUser
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HMMTRSyncClusterDoorLock_removeHomeUser__block_invoke;
  v4[3] = &unk_265374CC8;
  v4[4] = self;
  id v2 = [(HMMTRSyncClusterDoorLock *)self serialize:v4];
  return v2;
}

id __42__HMMTRSyncClusterDoorLock_removeHomeUser__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    int v10 = 138543618;
    int v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Removing home user", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) _removeUserWithUniqueID:&unk_2702B4F38 flow:v2];

  return v8;
}

- (id)_getUserAtIndex:(int64_t)a3 includeAliroCredentials:(BOOL)a4 flow:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x2533B64D0]();
  int v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    __int16 v13 = [v8 UUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    int64_t v26 = a3;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getUserAtIndex: %ld", buf, 0x20u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__HMMTRSyncClusterDoorLock__getUserAtIndex_includeAliroCredentials_flow___block_invoke;
  v17[3] = &unk_265374CA0;
  id v18 = v8;
  int64_t v19 = a3;
  BOOL v20 = a4;
  v17[4] = v10;
  id v14 = v8;
  __int16 v15 = [(HMMTRSyncClusterDoorLock *)v10 ensureAccessoryConnected:v17 flow:v14];

  return v15;
}

id __73__HMMTRSyncClusterDoorLock__getUserAtIndex_includeAliroCredentials_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F10E40]);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v2 setUserIndex:v3];

  id v15 = 0;
  id v4 = [MEMORY[0x263F42538] futureWithPromise:&v15];
  id v5 = [v15 resolverBlock];
  id v6 = [*(id *)(a1 + 32) apiRouter];
  [v6 getUserWithParams:v2 includeAliroCredentials:*(unsigned __int8 *)(a1 + 56) flow:*(void *)(a1 + 40) completion:v5];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__HMMTRSyncClusterDoorLock__getUserAtIndex_includeAliroCredentials_flow___block_invoke_2;
  v12[3] = &unk_265374C78;
  id v7 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 48);
  id v13 = v8;
  uint64_t v14 = v9;
  int v10 = [v4 recover:v12];

  return v10;
}

uint64_t __73__HMMTRSyncClusterDoorLock__getUserAtIndex_includeAliroCredentials_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v14 = 138544130;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to get user at index: %ld with error: %@", (uint8_t *)&v14, 0x2Au);
  }
  id v10 = v3;
  int v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (id)getUserAtIndex:(int64_t)a3 flow:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__HMMTRSyncClusterDoorLock_getUserAtIndex_flow___block_invoke;
  v10[3] = &unk_265374C50;
  id v11 = v6;
  int64_t v12 = a3;
  void v10[4] = self;
  id v7 = v6;
  id v8 = [(HMMTRSyncClusterDoorLock *)self serialize:v10];

  return v8;
}

uint64_t __48__HMMTRSyncClusterDoorLock_getUserAtIndex_flow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getUserAtIndex:*(void *)(a1 + 48) includeAliroCredentials:0 flow:*(void *)(a1 + 40)];
}

- (id)getUsersWithUniqueIDs:(id)a3 flow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke;
  v12[3] = &unk_265374B60;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = [(HMMTRSyncClusterDoorLock *)self serialize:v12];

  return v10;
}

id __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "fetchCurrentFabricIndex_flow:", *(void *)(a1 + 40));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_2;
  v6[3] = &unk_265374C28;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v4 = [v2 then:v6];

  return v4;
}

uint64_t __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(a1[4], "totalNumberOfUsersSupported_flow:", a1[5]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_3;
  v11[3] = &unk_265374BB0;
  v11[4] = a1[4];
  id v5 = v3;
  id v12 = v5;
  id v13 = a1[5];
  id v14 = a1[6];
  id v6 = [v4 then:v11];
  if (v6)
  {
    id v7 = v6;

    return 3;
  }
  else
  {
    uint64_t v9 = _HMFPreconditionFailure();
    return __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_3(v9, v10);
  }
}

uint64_t __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v3 integerValue];
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = [v4 findAllUsersWithCreatorFabricIndex:v5 indexStartingAtSlot:1 assumingTotalNumberOfSlots:v6 users:v7 flow:*(void *)(a1 + 48)];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_4;
  v14[3] = &unk_265374C00;
  id v15 = *(id *)(a1 + 56);
  id v9 = [v8 then:v14];
  if (v9)
  {
    id v10 = v9;

    return 3;
  }
  else
  {
    uint64_t v12 = _HMFPreconditionFailure();
    return __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_4(v12, v13);
  }
}

uint64_t __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_4(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_5;
  v4[3] = &unk_265374BD8;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_map:", v4);
  objc_claimAutoreleasedReturnValue();

  return 1;
}

id __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 userUniqueID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_findUserOrAvailableSlotWithUserUniqueID:(id)a3 flow:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v7 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v25 = v11;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findHomeUserOrAvailableSlot", buf, 0x16u);
  }
  id v13 = [MEMORY[0x263EFF980] array];
  id v14 = [(HMMTRSyncClusterDoorLock *)v9 fetchCurrentFabricIndex_flow:v7];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke;
  v20[3] = &unk_265374BB0;
  v20[4] = v9;
  id v21 = v7;
  id v22 = v6;
  id v23 = v13;
  id v15 = v13;
  id v16 = v6;
  id v17 = v7;
  __int16 v18 = [v14 then:v20];

  return v18;
}

uint64_t __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(a1[4], "totalNumberOfUsersSupported_flow:", a1[5]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke_2;
  v11[3] = &unk_265374B88;
  v11[4] = a1[4];
  id v12 = a1[6];
  id v13 = a1[7];
  id v5 = v3;
  id v14 = v5;
  id v15 = a1[5];
  id v6 = [v4 then:v11];
  if (v6)
  {
    id v7 = v6;

    return 3;
  }
  else
  {
    uint64_t v9 = _HMFPreconditionFailure();
    return __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke_2(v9, v10);
  }
}

uint64_t __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "findHomeUserWithUniqueID:indexStartingAtSlot:assumingTotalNumberOfSlots:availableSlots:currentFabricIndex:flow:", *(void *)(a1 + 40), 1, objc_msgSend(v3, "integerValue"), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    id v7 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v7 findUserOrAvailableSlotWithUserUniqueID:v9 flow:v10];
  }
}

- (id)findUserOrAvailableSlotWithUserUniqueID:(id)a3 flow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__HMMTRSyncClusterDoorLock_findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke;
  v12[3] = &unk_265374B60;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(HMMTRSyncClusterDoorLock *)self serialize:v12];

  return v10;
}

uint64_t __73__HMMTRSyncClusterDoorLock_findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findUserOrAvailableSlotWithUserUniqueID:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
}

- (id)findOrAddUserWithUniqueID:(id)a3 flow:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findOrAddUserWithUniqueID: %@", buf, 0x20u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_flow___block_invoke;
  v17[3] = &unk_265374B60;
  v17[4] = v9;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = [(HMMTRSyncClusterDoorLock *)v9 serialize:v17];

  return v15;
}

uint64_t __59__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_flow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) findOrAddUserWithUniqueID:*(void *)(a1 + 40) userType:&unk_2702B4F38 flow:*(void *)(a1 + 48)];
}

- (void)lockDoorWithAccessoryUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke;
  v11[3] = &unk_265374B38;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(HMMTRSyncClusterDoorLock *)self serialize:v11];
}

id __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = a1[4];
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    id v8 = a1[5];
    id v9 = (void *)MEMORY[0x2533B66E0](a1[6]);
    *(_DWORD *)buf = 138544130;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Locking door with accessoryUUID: %@ completionHandler: %@", buf, 0x2Au);
  }
  id v10 = [a1[4] accessoryHasCOTAEnabledWithFlow:v2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_156;
  v14[3] = &unk_265374B10;
  void v14[4] = a1[4];
  id v15 = v2;
  id v17 = a1[6];
  id v16 = a1[5];
  id v11 = v2;
  id v12 = [v10 then:v14];

  return v12;
}

uint64_t __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_156(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [v3 BOOLValue];
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v51 = v9;
      __int16 v52 = 2112;
      v53 = v10;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory has COTA enabled", buf, 0x16u);
    }
    id v11 = [*(id *)(a1 + 32) deriveHomePinFromUUID:*(void *)(a1 + 48) flow:*(void *)(a1 + 40)];
    id v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      id v51 = v15;
      __int16 v52 = 2112;
      v53 = v16;
      __int16 v54 = 2112;
      v55 = v11;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] homePin: %@", buf, 0x20u);
    }
    if (v11)
    {
      id v17 = [*(id *)(a1 + 32) lockWithPin:v11 flow:*(void *)(a1 + 40)];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_158;
      v44[3] = &unk_265377D70;
      id v18 = *(void **)(a1 + 40);
      v44[4] = *(void *)(a1 + 32);
      id v45 = v18;
      id v19 = v11;
      id v46 = v19;
      __int16 v20 = [v17 recover:v44];

      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_2;
      v41[3] = &unk_265374AE8;
      id v21 = *(id *)(a1 + 56);
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = *(void **)(a1 + 40);
      id v43 = v21;
      v41[4] = v22;
      id v42 = v23;
      [v20 getResultWithCompletion:v41];
      id v24 = v20;
      if (!v24) {
        _HMFPreconditionFailure();
      }
      id v25 = v24;
      uint64_t v26 = 3;
    }
    else
    {
      uint64_t v33 = (void *)MEMORY[0x2533B64D0]();
      id v34 = *(id *)(a1 + 32);
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = HMFGetLogIdentifier();
        uint64_t v37 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138543618;
        id v51 = v36;
        __int16 v52 = 2112;
        v53 = v37;
        _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create home pin, aborting", buf, 0x16u);
      }
      uint64_t v38 = (void (**)(void, void))MEMORY[0x2533B66E0](*(void *)(a1 + 56));
      if (v38)
      {
        int64_t v39 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:4 userInfo:0];
        ((void (**)(void, void *))v38)[2](v38, v39);
      }
      id v19 = 0;
      uint64_t v26 = 1;
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v27 = HMFGetLogIdentifier();
      uint64_t v28 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v51 = v27;
      __int16 v52 = 2112;
      v53 = v28;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory does not have COTA enabled", buf, 0x16u);
    }
    __int16 v29 = objc_msgSend(*(id *)(a1 + 32), "lock_flow:", *(void *)(a1 + 40));
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_157;
    v47[3] = &unk_265374A98;
    id v30 = *(id *)(a1 + 56);
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(void **)(a1 + 40);
    id v49 = v30;
    v47[4] = v31;
    id v48 = v32;
    [v29 getResultWithCompletion:v47];

    uint64_t v26 = 1;
    id v19 = v49;
  }

  return v26;
}

void __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 48))
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      int v12 = 138543874;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling completion with error: %@", (uint8_t *)&v12, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_158(id *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [v3 domain];
  id v5 = v4;
  if (v4 != (void *)*MEMORY[0x263F10BE8])
  {

LABEL_6:
    id v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = a1[4];
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      id v15 = [a1[5] UUID];
      __int16 v16 = [v3 domain];
      *(_DWORD *)buf = 138544130;
      id v23 = v14;
      __int16 v24 = 2112;
      id v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 2048;
      uint64_t v29 = [v3 code];
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not attempting to add home pin because the write failed for a different reason than our COTA pin being rejected. ErrorDomain: %@, ErrorCode: %ld", buf, 0x2Au);
    }
    id v17 = v3;
    if (v17)
    {
      id v7 = v17;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
      id v7 = 0;
    }
    uint64_t v10 = 2;
    goto LABEL_12;
  }
  uint64_t v6 = [v3 code];

  if (v6 != 1) {
    goto LABEL_6;
  }
  id v7 = [a1[4] provisionHomePin:a1[6] flow:a1[5]];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_159;
  v19[3] = &unk_265374AC0;
  void v19[4] = a1[4];
  id v20 = a1[6];
  id v21 = a1[5];
  id v8 = [v7 then:v19];
  if (!v8) {
    _HMFPreconditionFailure();
  }
  id v9 = v8;

  uint64_t v10 = 3;
LABEL_12:

  return v10;
}

void __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 48))
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      int v12 = 138543874;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling completion with error: %@", (uint8_t *)&v12, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_159(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) lockWithPin:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    [(HMMTRSyncClusterDoorLock *)v6 unlockDoorWithAccessoryUUID:v8 completionHandler:v9];
  }
}

- (void)unlockDoorWithAccessoryUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke;
  v11[3] = &unk_265374B38;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(HMMTRSyncClusterDoorLock *)self serialize:v11];
}

id __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = a1[4];
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    id v8 = a1[5];
    id v9 = (void *)MEMORY[0x2533B66E0](a1[6]);
    *(_DWORD *)buf = 138544130;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Unlocking door with accessoryUUID: %@ completionHandler: %@", buf, 0x2Au);
  }
  id v10 = [a1[4] accessoryHasCOTAEnabledWithFlow:v2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_146;
  v14[3] = &unk_265374B10;
  void v14[4] = a1[4];
  id v15 = v2;
  id v17 = a1[6];
  id v16 = a1[5];
  id v11 = v2;
  id v12 = [v10 then:v14];

  return v12;
}

uint64_t __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_146(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [v3 BOOLValue];
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v51 = v9;
      __int16 v52 = 2112;
      v53 = v10;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory has COTA enabled", buf, 0x16u);
    }
    id v11 = [*(id *)(a1 + 32) deriveHomePinFromUUID:*(void *)(a1 + 48) flow:*(void *)(a1 + 40)];
    id v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = *(id *)(a1 + 32);
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      id v51 = v15;
      __int16 v52 = 2112;
      v53 = v16;
      __int16 v54 = 2112;
      v55 = v11;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] homePin: %@", buf, 0x20u);
    }
    if (v11)
    {
      id v17 = [*(id *)(a1 + 32) unlockWithPin:v11 flow:*(void *)(a1 + 40)];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_149;
      v44[3] = &unk_265377D70;
      uint64_t v18 = *(void **)(a1 + 40);
      v44[4] = *(void *)(a1 + 32);
      id v45 = v18;
      id v19 = v11;
      id v46 = v19;
      __int16 v20 = [v17 recover:v44];

      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_2;
      v41[3] = &unk_265374AE8;
      id v21 = *(id *)(a1 + 56);
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = *(void **)(a1 + 40);
      id v43 = v21;
      v41[4] = v22;
      id v42 = v23;
      [v20 getResultWithCompletion:v41];
      id v24 = v20;
      if (!v24) {
        _HMFPreconditionFailure();
      }
      id v25 = v24;
      uint64_t v26 = 3;
    }
    else
    {
      uint64_t v33 = (void *)MEMORY[0x2533B64D0]();
      id v34 = *(id *)(a1 + 32);
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = HMFGetLogIdentifier();
        uint64_t v37 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138543618;
        id v51 = v36;
        __int16 v52 = 2112;
        v53 = v37;
        _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create home pin, aborting", buf, 0x16u);
      }
      uint64_t v38 = (void (**)(void, void))MEMORY[0x2533B66E0](*(void *)(a1 + 56));
      if (v38)
      {
        int64_t v39 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:4 userInfo:0];
        ((void (**)(void, void *))v38)[2](v38, v39);
      }
      id v19 = 0;
      uint64_t v26 = 1;
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v27 = HMFGetLogIdentifier();
      __int16 v28 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v51 = v27;
      __int16 v52 = 2112;
      v53 = v28;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory does not have COTA enabled", buf, 0x16u);
    }
    uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "unlock_flow:", *(void *)(a1 + 40));
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_147;
    v47[3] = &unk_265374A98;
    id v30 = *(id *)(a1 + 56);
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(void **)(a1 + 40);
    id v49 = v30;
    v47[4] = v31;
    id v48 = v32;
    [v29 getResultWithCompletion:v47];

    uint64_t v26 = 1;
    id v19 = v49;
  }

  return v26;
}

void __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 48))
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      int v12 = 138543874;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling completion with error: %@", (uint8_t *)&v12, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_149(id *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [v3 domain];
  id v5 = v4;
  if (v4 != (void *)*MEMORY[0x263F10BE8])
  {

LABEL_6:
    id v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = a1[4];
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      id v15 = [a1[5] UUID];
      __int16 v16 = [v3 domain];
      *(_DWORD *)buf = 138544130;
      id v23 = v14;
      __int16 v24 = 2112;
      id v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 2048;
      uint64_t v29 = [v3 code];
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not attempting to add home pin because the write failed for a different reason than our COTA pin being rejected. ErrorDomain: %@, ErrorCode: %ld", buf, 0x2Au);
    }
    id v17 = v3;
    if (v17)
    {
      id v7 = v17;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
      id v7 = 0;
    }
    uint64_t v10 = 2;
    goto LABEL_12;
  }
  uint64_t v6 = [v3 code];

  if (v6 != 1) {
    goto LABEL_6;
  }
  id v7 = [a1[4] provisionHomePin:a1[6] flow:a1[5]];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_150;
  v19[3] = &unk_265374AC0;
  void v19[4] = a1[4];
  id v20 = a1[6];
  id v21 = a1[5];
  id v8 = [v7 then:v19];
  if (!v8) {
    _HMFPreconditionFailure();
  }
  id v9 = v8;

  uint64_t v10 = 3;
LABEL_12:

  return v10;
}

void __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 48))
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      int v12 = 138543874;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling completion with error: %@", (uint8_t *)&v12, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_150(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) unlockWithPin:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    id v7 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return (uint64_t)[(HMMTRSyncClusterDoorLock *)v7 ensureAccessoryConnected:v9 flow:v10];
  }
}

- (id)ensureAccessoryConnected:(id)a3 flow:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  SEL v8 = [(HMMTRSyncClusterDoorLock *)self accessoryServer];

  if (v8)
  {
    *(void *)buf = 0;
    id v9 = [MEMORY[0x263F42538] futureWithPromise:buf];
    id v10 = objc_alloc(MEMORY[0x263F42520]);
    id v11 = [(HMMTRSyncClusterDoorLock *)self queue];
    int v12 = (void *)[v10 initWithQueue:v11];

    id v13 = [(HMMTRSyncClusterDoorLock *)self accessoryServer];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke;
    v26[3] = &unk_265378900;
    id v27 = v12;
    id v28 = *(id *)buf;
    uint64_t v29 = v6;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_3;
    v21[3] = &unk_265374A70;
    id v22 = v27;
    id v23 = self;
    id v24 = v7;
    id v25 = v28;
    id v14 = v27;
    [v13 queueAccessoryOperation:v26 highPriority:1 completion:v21];
  }
  else
  {
    id v15 = (void *)MEMORY[0x2533B64D0]();
    __int16 v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      id v19 = [v7 UUID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v18;
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Accessory server is nil", buf, 0x16u);
    }
    id v9 = v6[2](v6);
  }

  return v9;
}

void __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_2;
  v3[3] = &unk_2653770F0;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performBlock:v3];
}

void __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_4;
    v5[3] = &unk_265376F38;
    id v3 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 48);
    v5[4] = *(void *)(a1 + 40);
    id v6 = v4;
    id v7 = *(id *)(a1 + 56);
    [v3 performBlock:v5];
  }
}

void __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    int v12 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to connect to Matter accessory", (uint8_t *)&v9, 0x16u);
  }
  id v7 = *(void **)(a1 + 48);
  SEL v8 = [MEMORY[0x263F087E8] hmfErrorWithCode:11 reason:@"Failed to connect to Matter accessory"];
  [v7 rejectWithError:v8];
}

void __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 resolveWithFuture:v2];
}

- (id)serialize:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  id v5 = [MEMORY[0x263F42538] futureWithPromise:&v18];
  os_unfair_lock_lock_with_options();
  id v6 = [(HMMTRSyncClusterDoorLock *)self apiSerializationFuture];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __38__HMMTRSyncClusterDoorLock_serialize___block_invoke;
  id v14 = &unk_265377618;
  id v15 = v18;
  id v7 = v4;
  id v17 = v7;
  id v8 = v5;
  id v16 = v8;
  int v9 = [v6 finally:&v11];
  -[HMMTRSyncClusterDoorLock setApiSerializationFuture:](self, "setApiSerializationFuture:", v9, v11, v12, v13, v14);

  os_unfair_lock_unlock(&self->_unfairLock);
  return v8;
}

HMMTRSyncClusterDoorLock *__38__HMMTRSyncClusterDoorLock_serialize___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v2 resolveWithFuture:v3];

  id v4 = *(id *)(a1 + 40);
  if (v4)
  {

    return (HMMTRSyncClusterDoorLock *)3;
  }
  else
  {
    id v6 = (HMMTRSyncClusterDoorLock *)_HMFPreconditionFailure();
    return [(HMMTRSyncClusterDoorLock *)v6 initWithDevice:v8 baseDevice:v9 endpoint:v10 queue:v11 accessoryServer:v12];
  }
}

- (HMMTRSyncClusterDoorLock)initWithDevice:(id)a3 baseDevice:(id)a4 endpoint:(unsigned __int16)a5 queue:(id)a6 accessoryServer:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id obj = a6;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)MEMORY[0x2533B64D0]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    [NSNumber numberWithUnsignedShort:v9];
    v20 = id v28 = v15;
    *(_DWORD *)buf = 138544130;
    id v32 = v19;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    uint64_t v38 = v20;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@HMMTRSyncClusterDoorLock initWithDevice called with device: %@, baseDevice: %@ and endpoint: %@", buf, 0x2Au);

    id v15 = v28;
  }

  if (!v12
    || (v30.receiver = v17,
        v30.super_class = (Class)HMMTRSyncClusterDoorLock,
        (id v17 = [(MTRClusterDoorLock *)&v30 initWithDevice:v12 endpoint:v9 queue:v14]) != 0))
  {
    objc_storeStrong((id *)&v17->_queue, obj);
    v17->_endpoint = v9;
    [MEMORY[0x263F42520] blessWithImplicitContext:v14];
    uint64_t v21 = [MEMORY[0x263F42538] futureWithNoValue];
    apiSerializationFuture = v17->_apiSerializationFuture;
    v17->_apiSerializationFuture = (HMFFuture *)v21;

    v17->_unfairLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v17->_accessoryServer, v15);
    objc_storeStrong((id *)&v17->_baseDevice, a4);
    uint64_t v23 = [objc_alloc(MEMORY[0x263F10C88]) initWithDevice:v13 endpoint:v9 queue:v14];
    baseDoorLock = v17->_baseDoorLock;
    v17->_baseDoorLock = (MTRBaseClusterDoorLock *)v23;

    id v25 = [[HMMTRDoorLockClusterAPIRouter alloc] initWithBaseDoorLock:v17->_baseDoorLock baseDevice:v13 queue:v14];
    apiRouter = v17->_apiRouter;
    v17->_apiRouter = v25;
  }
  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t206 != -1) {
    dispatch_once(&logCategory__hmf_once_t206, &__block_literal_global_298);
  }
  id v2 = (void *)logCategory__hmf_once_v207;
  return v2;
}

uint64_t __39__HMMTRSyncClusterDoorLock_logCategory__block_invoke()
{
  logCategory__hmf_once_v207 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

+ (id)pinDataWithDigits:(id)a3
{
  return (id)[a3 dataUsingEncoding:1];
}

+ (id)validateFutureResults:(id)a3 ofClass:(Class)a4 areNullable:(BOOL)a5 flow:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = objc_msgSend(v10, "na_map:", &__block_literal_global_230);
  if (objc_msgSend(v12, "hmf_isEmpty"))
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __75__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_areNullable_flow___block_invoke_231;
    v22[3] = &__block_descriptor_41_e16___NSData_16__0_8lu32l8;
    BOOL v23 = a5;
    void v22[4] = a4;
    id v13 = objc_msgSend(v10, "na_map:", v22);
    uint64_t v14 = [v13 count];
    if (v14 == [v10 count])
    {
      id v15 = 0;
    }
    else
    {
      id v16 = (void *)MEMORY[0x2533B64D0]();
      id v17 = a1;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [v11 UUID];
        *(_DWORD *)buf = 138544130;
        id v28 = v19;
        __int16 v29 = 2112;
        objc_super v30 = v20;
        __int16 v31 = 2112;
        id v32 = v10;
        __int16 v33 = 2112;
        id v34 = v13;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to cast future results to correct type. results: %@, finalResults: %@", buf, 0x2Au);
      }
      id v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    }
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __75__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_areNullable_flow___block_invoke_2;
    void v24[3] = &unk_2653751C0;
    id v26 = a1;
    id v25 = v11;
    objc_msgSend(v12, "na_each:", v24);
    id v15 = [v12 firstObject];
    id v13 = v25;
  }

  return v15;
}

void __75__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_areNullable_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    SEL v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) UUID];
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error in future results: %@", (uint8_t *)&v9, 0x20u);
  }
}

id __75__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_areNullable_flow___block_invoke_231(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    objc_opt_class();
    id v4 = v3;
    id v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
    id v6 = v5;

    if (v6) {
      objc_opt_class();
    }
  }
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

id __75__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_areNullable_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (id)deriveHomePinFromUUID:(id)a3 withNumberOfDigits:(int64_t)a4 flow:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = NSString;
  __int16 v11 = [v8 UUIDString];
  id v12 = [v10 stringWithFormat:@"%@ %@", v11, @"Home Pin"];

  id v32 = objc_msgSend(v12, "hmmtr_sha256hash");
  if ([v32 length] >= (unint64_t)a4)
  {
    id v30 = v8;
    __int16 v31 = v12;
    id v19 = [MEMORY[0x263F089D8] string];
    if (a4 < 1)
    {
LABEL_9:
      id v18 = v19;
      id v8 = v30;
    }
    else
    {
      uint64_t v20 = 0;
      while (1)
      {
        uint64_t v21 = objc_msgSend(v32, "substringWithRange:", v20, 1);
        id v22 = [MEMORY[0x263F08B08] scannerWithString:v21];
        unsigned int v33 = 0;
        if (([v22 scanHexInt:&v33] & 1) == 0) {
          break;
        }
        v33 %= 0xAu;
        BOOL v23 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v33);
        [v19 appendString:v23];

        if (a4 == ++v20) {
          goto LABEL_9;
        }
      }
      id v24 = (void *)MEMORY[0x2533B64D0]();
      id v25 = a1;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        id v28 = [v9 UUID];
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v27;
        __int16 v36 = 2112;
        __int16 v37 = v28;
        __int16 v38 = 2112;
        uint64_t v39 = v21;
        _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to scan hex to int from hash: %@", buf, 0x20u);
      }

      id v18 = 0;
      id v8 = v30;
    }

    id v12 = v31;
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = a1;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [v9 UUID];
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = v16;
      __int16 v36 = 2112;
      __int16 v37 = v17;
      __int16 v38 = 2112;
      uint64_t v39 = v32;
      __int16 v40 = 2048;
      int64_t v41 = a4;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Number of digits exceeds total size of hash. Hash: %@, numberOfDigits: %ld", buf, 0x2Au);
    }
    id v18 = 0;
  }

  return v18;
}

+ (id)valueFromDictionaryWithData:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)valueFromAttributeResponse:(id)a3
{
  if (a3)
  {
    id v4 = [a3 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      id v7 = [a1 valueFromDictionaryWithData:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

+ (id)numberFromAttributeDictionary:(id)a3
{
  if (a3)
  {
    id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)numberFromAttributeResponse:(id)a3
{
  uint64_t v3 = [a1 valueFromAttributeResponse:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)doorLockFeatureMapSupportsAliroBLEUWB:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 0x4000);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

+ (id)doorLockFeatureMapSupportsAliroProvisioning:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 0x2000);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

+ (id)doorLockFeatureMapSupportsYearDaySchedule:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 0x400);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

+ (id)doorLockFeatureMapSupportsWeekDaySchedule:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 0x10);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

+ (id)doorLockFeatureMapSupportsPinCodes:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 1);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

@end