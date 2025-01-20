@interface HMDResidentSelectionMode
+ (id)logCategory;
- (BOOL)_allResidentsHaveSameLocationStatus:(unint64_t)a3;
- (BOOL)_currentDevicePreferredResidentsListIsPublished;
- (BOOL)_isViableUserPreferredResident:(id)a3;
- (BOOL)_preferredResidentsListFromElectorUpdated;
- (BOOL)_shouldTakeOverBasedOnReachability;
- (BOOL)_updateLocalPreferredResidentsList;
- (BOOL)allResidentsAboveMeAreUnreachableIn:(id)a3;
- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4;
- (BOOL)hasViablePrimaryResidentWithSelectionInfo:(id)a3;
- (BOOL)newPrimaryIsInREv2BasedOnTheirTimestamp:(id)a3 ourSelectionInfo:(id)a4;
- (BOOL)residentIsLocallyReachable:(id)a3;
- (BOOL)shouldRegeneratePreferredResidentsListBasedOnFoundResidents:(id)a3 residentLocationMap:(id)a4;
- (BOOL)shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:(id)a3 isTimerTriggered:(BOOL)a4;
- (BOOL)takeOverIfConditionsAreMetWithIsTimerTriggered:(BOOL)a3;
- (BOOL)takeOverIfPrimaryIsNotViableWithIsTimerTriggered:(BOOL)a3;
- (HMDBackgroundTaskManager)backgroundTaskManager;
- (HMDIDSServerBag)idsServerBag;
- (HMDPreferredResidentsList)localPreferredResidentsList;
- (HMDPreferredResidentsList)preferredResidentsListFromElector;
- (HMDResidentDeviceManagerContext)context;
- (HMDResidentSelectionInfo)residentSelectionInfoFromWorkingStore;
- (HMDResidentSelectionMode)initWithContext:(id)a3;
- (HMDResidentSelectionMode)initWithContext:(id)a3 backgroundTaskManager:(id)a4;
- (HMDResidentSelectionModeDelegate)delegate;
- (HMDResidentSelectionStatusKit)presentResidentsStatuses;
- (HMFTimer)takeOverIfPrimaryIsNotViableTimer;
- (HMFTimer)takeOverTimer;
- (NSArray)sortedResidents;
- (NSDictionary)residentIDSIdentifierToLocationMap;
- (NSEnumerator)residentsEnumerator;
- (NSSet)locallyReachableResidents;
- (NSString)backgroundTaskIdentifier;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (OS_dispatch_queue)queue;
- (double)_statusDebounceInterval;
- (double)_takeOverIfPrimaryIsNotViableInterval;
- (double)_takeOverTimerInterval;
- (id)_generatePreferredResidentsList;
- (id)_highestVersionLowestUUIDResident;
- (id)_nextResidentsListGenerationDate;
- (id)_sortResidentsByLatestVersionLowestUUID:(id)a3;
- (id)_sortResidentsUsingAllCriteria:(id)a3;
- (id)backupsForResident:(id)a3;
- (id)createSelectionMessageCompletion;
- (id)dumpState;
- (id)logIdentifier;
- (id)preferredResidentsRemovedFromHome;
- (id)productTypePreferenceList;
- (id)residentSelectionInfoWithOurselvesAsThePreferredWithTimestamp:(id)a3;
- (id)residentsNotPresentInPreferredResidentsList:(id)a3;
- (id)selectionCompletion;
- (id)userPreferredResidentPerSelectionInfo:(id)a3;
- (id)wiredResidentIDSIdentifiers;
- (int64_t)compareLocationResident1:(id)a3 resident2:(id)a4;
- (int64_t)compareNetworkConnectionResident1:(id)a3 resident2:(id)a4;
- (int64_t)compareProductTypeResident1:(id)a3 resident2:(id)a4;
- (unint64_t)_preferredResidentsListMaxSize;
- (unint64_t)_takeOverOnlyIfCurrentPrimaryIsNotViableJitter;
- (unint64_t)currentModeType;
- (unint64_t)locationOfResident:(id)a3;
- (unint64_t)messageTransportRestriction;
- (unint64_t)preferredListGenerationEndHour;
- (unint64_t)preferredListGenerationStartHour;
- (unint64_t)primaryChangedReason;
- (void)_evaluatePrimaryChangedReason;
- (void)_evaluatePrimaryChangedReasonForCurrentSelectionInfo:(id)a3 previousSelectionInfo:(id)a4;
- (void)_publishElectorsList;
- (void)_publishPreferredResidentsList:(id)a3;
- (void)_registerForMessagesAsAResident;
- (void)_rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:(double)a3;
- (void)_rescheduleTakeOverTimer;
- (void)cancelAllTakeOverTimers;
- (void)configureAsAResidentWithRunPrimaryEvaluation:(BOOL)a3;
- (void)currentDeviceReadyAsAResident;
- (void)deregisterForMessages;
- (void)didFailResidentSelectionWithResident:(id)a3 error:(id)a4;
- (void)didReceiveSelectionMessage:(id)a3;
- (void)didSucceedResidentSelectionWithPreferred:(id)a3;
- (void)didUpdateResidentSelectionModelTo:(id)a3;
- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5;
- (void)handleDailyPreferredResidentsListRegenerationNotification:(id)a3;
- (void)handleMeshInformationRequest:(id)a3;
- (void)handleTakeOverIfPrimaryIsNotViableTimerFired;
- (void)handleTakeOverTimerFired;
- (void)handleWeAreSelectedAsThePreferredPrimaryWithInfo:(id)a3 selectionMessage:(id)a4;
- (void)handleWeAreSelectedAsThePreferredPrimaryWithSelectionTimestamp:(id)a3 selectionMessage:(id)a4;
- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)scheduleDailyPreferredResidentsListRegenerationTask;
- (void)scheduleTakeOverTimerIfRequiredAfterBlockDuration:(double)a3;
- (void)selectPrimaryResidentFromResidents:(id)a3 requireAutoUpdate:(BOOL)a4 completion:(id)a5;
- (void)sendSelectionMessageToResident:(id)a3 requireAutoUpdate:(BOOL)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setLocalPreferredResidentsList:(id)a3;
- (void)setPreferredResidentsListFromElector:(id)a3;
- (void)setPresentResidentsStatuses:(id)a3;
- (void)setPrimaryChangedReason:(unint64_t)a3;
- (void)setResidentIDSIdentifierToLocationMap:(id)a3;
- (void)setResidentSelectionInfoFromWorkingStore:(id)a3;
- (void)setResidentsEnumerator:(id)a3;
- (void)setSelectionCompletion:(id)a3;
- (void)setTakeOverIfPrimaryIsNotViableTimer:(id)a3;
- (void)setTakeOverTimer:(id)a3;
- (void)start;
- (void)takeOverWithSelectionTimestamp:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentSelectionMode

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idsServerBag);
  objc_storeStrong((id *)&self->_presentResidentsStatuses, 0);
  objc_storeStrong((id *)&self->_residentIDSIdentifierToLocationMap, 0);
  objc_storeStrong((id *)&self->_takeOverTimer, 0);
  objc_storeStrong((id *)&self->_takeOverIfPrimaryIsNotViableTimer, 0);
  objc_storeStrong((id *)&self->_backgroundTaskManager, 0);
  objc_storeStrong((id *)&self->_backgroundTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_residentsEnumerator, 0);
  objc_storeStrong(&self->_selectionCompletion, 0);
  objc_storeStrong((id *)&self->_preferredResidentsListFromElector, 0);
  objc_storeStrong((id *)&self->_localPreferredResidentsList, 0);
  objc_storeStrong((id *)&self->_residentSelectionInfoFromWorkingStore, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDIDSServerBag)idsServerBag
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsServerBag);
  return (HMDIDSServerBag *)WeakRetained;
}

- (void)setPresentResidentsStatuses:(id)a3
{
}

- (HMDResidentSelectionStatusKit)presentResidentsStatuses
{
  return (HMDResidentSelectionStatusKit *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPrimaryChangedReason:(unint64_t)a3
{
  self->_primaryChangedReason = a3;
}

- (unint64_t)primaryChangedReason
{
  return self->_primaryChangedReason;
}

- (void)setResidentIDSIdentifierToLocationMap:(id)a3
{
}

- (NSDictionary)residentIDSIdentifierToLocationMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTakeOverTimer:(id)a3
{
}

- (HMFTimer)takeOverTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTakeOverIfPrimaryIsNotViableTimer:(id)a3
{
}

- (HMFTimer)takeOverIfPrimaryIsNotViableTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 88, 1);
}

- (HMDBackgroundTaskManager)backgroundTaskManager
{
  return self->_backgroundTaskManager;
}

- (NSString)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setResidentsEnumerator:(id)a3
{
}

- (NSEnumerator)residentsEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSelectionCompletion:(id)a3
{
}

- (id)selectionCompletion
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setPreferredResidentsListFromElector:(id)a3
{
}

- (HMDPreferredResidentsList)preferredResidentsListFromElector
{
  return (HMDPreferredResidentsList *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalPreferredResidentsList:(id)a3
{
}

- (HMDPreferredResidentsList)localPreferredResidentsList
{
  return (HMDPreferredResidentsList *)objc_getProperty(self, a2, 40, 1);
}

- (void)setResidentSelectionInfoFromWorkingStore:(id)a3
{
}

- (HMDResidentSelectionInfo)residentSelectionInfoFromWorkingStore
{
  return (HMDResidentSelectionInfo *)objc_getProperty(self, a2, 32, 1);
}

- (HMDResidentDeviceManagerContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDResidentDeviceManagerContext *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (HMDResidentSelectionModeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDResidentSelectionModeDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDResidentSelectionMode *)self context];
  v3 = [v2 home];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

- (void)timerDidFire:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [(HMDResidentSelectionMode *)self takeOverIfPrimaryIsNotViableTimer];

  if (v4 == v7)
  {
    [(HMDResidentSelectionMode *)self handleTakeOverIfPrimaryIsNotViableTimerFired];
  }
  else
  {
    id v5 = [(HMDResidentSelectionMode *)self takeOverTimer];

    v6 = v7;
    if (v5 != v7) {
      goto LABEL_6;
    }
    [(HMDResidentSelectionMode *)self handleTakeOverTimerFired];
  }
  v6 = v7;
LABEL_6:
}

- (id)productTypePreferenceList
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E470D68, &unk_26E470D80, &unk_26E470D98, &unk_26E470DB0, &unk_26E470DC8, &unk_26E470DE0, &unk_26E470DF8, &unk_26E470E10, &unk_26E470E28, &unk_26E470D50, 0);
}

- (id)wiredResidentIDSIdentifiers
{
  v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = [(HMDResidentSelectionMode *)self context];
  id v5 = [v4 presentResidentsStatuses];
  v6 = [v5 wiredResidentIDSIdentifiers];
  id v7 = [v3 setWithSet:v6];

  v8 = [(HMDResidentSelectionMode *)self context];
  v9 = [v8 currentResidentDevice];
  v10 = [v9 device];
  v11 = [v10 idsIdentifier];

  if ([v8 isActingAsResident]
    && ([v7 containsObject:v11] & 1) == 0
    && [v8 ourNetworkConnectionType] == 1)
  {
    [v7 addObject:v11];
  }
  v12 = (void *)[v7 copy];

  return v12;
}

- (int64_t)compareNetworkConnectionResident1:(id)a3 resident2:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDResidentSelectionMode *)self wiredResidentIDSIdentifiers];
  v9 = [v7 device];

  v10 = [v9 idsIdentifier];
  int v11 = [v8 containsObject:v10];

  v12 = [v6 device];

  v13 = [v12 idsIdentifier];
  unsigned int v14 = [v8 containsObject:v13];

  if (v11 ^ 1 | v14) {
    int64_t v15 = (v11 ^ 1) & v14;
  }
  else {
    int64_t v15 = -1;
  }

  return v15;
}

- (int64_t)compareProductTypeResident1:(id)a3 resident2:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDResidentSelectionMode *)self productTypePreferenceList];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "productType"));
  unint64_t v10 = [v8 indexOfObject:v9];

  int v11 = [(HMDResidentSelectionMode *)self productTypePreferenceList];
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "productType"));
  unint64_t v13 = [v11 indexOfObject:v12];

  unsigned int v14 = [(HMDResidentSelectionMode *)self productTypePreferenceList];
  uint64_t v15 = [v14 indexOfObject:&unk_26E470D50];

  if (v10 == v15)
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [v6 shortDescription];
      int v26 = 138543618;
      v27 = v19;
      __int16 v28 = 2112;
      v29 = v20;
LABEL_7:
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Could not find the product type for: %@", (uint8_t *)&v26, 0x16u);
    }
  }
  else
  {
    if (v13 != v15) {
      goto LABEL_9;
    }
    v16 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [v7 shortDescription];
      int v26 = 138543618;
      v27 = v19;
      __int16 v28 = 2112;
      v29 = v20;
      goto LABEL_7;
    }
  }

LABEL_9:
  uint64_t v22 = -1;
  if (v10 < v13) {
    uint64_t v23 = -1;
  }
  else {
    uint64_t v23 = 1;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v22 = v23;
  }
  if (v10 == v13) {
    int64_t v24 = 0;
  }
  else {
    int64_t v24 = v22;
  }

  return v24;
}

- (int64_t)compareLocationResident1:(id)a3 resident2:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(HMDResidentSelectionMode *)self locationOfResident:a3];
  unint64_t v8 = [(HMDResidentSelectionMode *)self locationOfResident:v6];

  int64_t v9 = -1;
  uint64_t v10 = 1;
  uint64_t v11 = -1;
  uint64_t v12 = 1;
  if (v7 == 200) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v8 != 100) {
    uint64_t v12 = v13;
  }
  if (v7 != 100) {
    uint64_t v11 = v12;
  }
  if (v8 != 300) {
    uint64_t v10 = v11;
  }
  if (v7 != 300) {
    int64_t v9 = v10;
  }
  if (v7 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (unint64_t)locationOfResident:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentSelectionMode *)self context];
  id v6 = [v5 presentResidentsStatuses];
  unint64_t v7 = [v6 residentIDSIdentifierToLocationMap];

  unint64_t v8 = [v4 device];
  int64_t v9 = [v8 idsIdentifier];
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  if (v10)
  {
    uint64_t v11 = [v4 device];
    uint64_t v12 = [v11 idsIdentifier];
    uint64_t v13 = [v7 objectForKeyedSubscript:v12];
    unint64_t v14 = [v13 unsignedIntegerValue];
  }
  else
  {
    uint64_t v15 = [v5 currentResidentDevice];
    int v16 = [v15 isEqual:v4];

    if (v16) {
      unint64_t v14 = [v5 myLocation];
    }
    else {
      unint64_t v14 = 100;
    }
  }

  return v14;
}

- (BOOL)_allResidentsHaveSameLocationStatus:(unint64_t)a3
{
  id v4 = [(HMDResidentSelectionMode *)self context];
  id v5 = [v4 presentResidentsStatuses];
  id v6 = [v5 residentIDSIdentifierToLocationMap];
  unint64_t v7 = [v6 allValues];

  if ([v7 count])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__HMDResidentSelectionMode__allResidentsHaveSameLocationStatus___block_invoke;
    v10[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
    v10[4] = a3;
    char v8 = objc_msgSend(v7, "na_all:", v10);
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

BOOL __64__HMDResidentSelectionMode__allResidentsHaveSameLocationStatus___block_invoke(uint64_t a1, void *a2)
{
  return [a2 unsignedIntegerValue] == *(void *)(a1 + 32);
}

- (id)_sortResidentsUsingAllCriteria:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__HMDResidentSelectionMode__sortResidentsUsingAllCriteria___block_invoke;
  v5[3] = &unk_264A2CFD0;
  v5[4] = self;
  v3 = [a3 sortedArrayUsingComparator:v5];
  return v3;
}

uint64_t __59__HMDResidentSelectionMode__sortResidentsUsingAllCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) compareLocationResident1:v5 resident2:v6];
  if (!v7)
  {
    char v8 = [v6 device];
    int64_t v9 = [v8 version];
    uint64_t v10 = [v5 device];
    uint64_t v11 = [v10 version];
    uint64_t v7 = [v9 compare:v11];

    if (!v7)
    {
      uint64_t v7 = [*(id *)(a1 + 32) compareNetworkConnectionResident1:v5 resident2:v6];
      if (!v7)
      {
        uint64_t v7 = [*(id *)(a1 + 32) compareProductTypeResident1:v5 resident2:v6];
        if (!v7)
        {
          uint64_t v12 = [v5 device];
          uint64_t v13 = [v12 idsIdentifier];
          unint64_t v14 = [v13 UUIDString];
          uint64_t v15 = [v6 device];
          int v16 = [v15 idsIdentifier];
          v17 = [v16 UUIDString];
          uint64_t v7 = [v14 compare:v17];
        }
      }
    }
  }

  return v7;
}

- (id)preferredResidentsRemovedFromHome
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(HMDResidentSelectionMode *)self context];
  id v5 = [v4 electorsPreferredResidentsList];
  id v6 = [v5 residentIDSIdentifiers];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  int v16 = __61__HMDResidentSelectionMode_preferredResidentsRemovedFromHome__block_invoke;
  v17 = &unk_264A190F0;
  v18 = self;
  id v7 = v3;
  id v19 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v14);

  if (objc_msgSend(v7, "count", v14, v15, v16, v17, v18))
  {
    char v8 = (void *)MEMORY[0x230FBD990]();
    int64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Residents that should be removed from the Preferred Residents List are: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];

  return v12;
}

void __61__HMDResidentSelectionMode_preferredResidentsRemovedFromHome__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) context];
  id v4 = [v3 residentDeviceWithIDSIdentifier:v5];

  if (!v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)_publishPreferredResidentsList:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentSelectionMode *)self context];
  char v6 = [v5 isActingAsResident];

  if (v6)
  {
    [(HMDResidentSelectionMode *)self setLocalPreferredResidentsList:v4];
    id v7 = [(HMDResidentSelectionMode *)self delegate];
    [v7 primarySelectionMode:self didUpdatePreferredResidentsList:v4];
  }
  else
  {
    char v8 = (void *)MEMORY[0x230FBD990]();
    int64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not publishing the preferred residents list since we are not acting as a resident.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (BOOL)_updateLocalPreferredResidentsList
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentSelectionMode *)self localPreferredResidentsList];
  id v4 = [(HMDResidentSelectionMode *)self _generatePreferredResidentsList];
  id v5 = v4;
  if (v3
    && ([v4 residentIDSIdentifiers],
        char v6 = objc_claimAutoreleasedReturnValue(),
        [v3 residentIDSIdentifiers],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqualToArray:v7],
        v7,
        v6,
        v8))
  {
    int64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Local preferred residents list is already up to date", (uint8_t *)&v19, 0xCu);
    }
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      __int16 v22 = v5;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating local preferred residents list: %@.", (uint8_t *)&v19, 0x16u);
    }
    [(HMDResidentSelectionMode *)v15 _publishPreferredResidentsList:v5];
    BOOL v13 = 1;
  }

  return v13;
}

- (void)_publishElectorsList
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentSelectionMode *)self context];
  id v4 = [v3 electorsPreferredResidentsList];

  id v5 = [v4 residentIDSIdentifiers];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    int v8 = self;
    int64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      int v12 = v10;
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Publishing the preferred residents list from elector: %@.", (uint8_t *)&v11, 0x16u);
    }
    [(HMDResidentSelectionMode *)v8 _publishPreferredResidentsList:v4];
  }
  else
  {
    [(HMDResidentSelectionMode *)self _updateLocalPreferredResidentsList];
  }
}

- (void)handleDailyPreferredResidentsListRegenerationNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = objc_msgSend(v5, "hmf_stringForKey:", @"HMD.BGTM.NK");

  id v7 = [(HMDResidentSelectionMode *)self backgroundTaskIdentifier];
  int v8 = HMFEqualObjects();

  if (v8)
  {
    int64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v16 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Preferred residents list regeneration task fired.", buf, 0xCu);
    }
    __int16 v13 = [(HMDResidentSelectionMode *)v10 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__HMDResidentSelectionMode_handleDailyPreferredResidentsListRegenerationNotification___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v10;
    dispatch_async(v13, block);
  }
}

uint64_t __86__HMDResidentSelectionMode_handleDailyPreferredResidentsListRegenerationNotification___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _updateLocalPreferredResidentsList];
  if ([*(id *)(a1 + 32) currentModeType] == 2)
  {
    v2 = [*(id *)(a1 + 32) context];
    v3 = [v2 primaryResidentDevice];
    int v4 = [v3 isCurrentDevice];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) preferredResidentsRemovedFromHome];
      uint64_t v6 = [*(id *)(a1 + 32) residentSelectionInfoFromWorkingStore];
      id v7 = [v6 preferredResidentIDSIdentifier];
      int v8 = [v5 containsObject:v7];

      if (v8)
      {
        int64_t v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = *(id *)(a1 + 32);
        int v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v25 = v12;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Preferred resident is removed while in Manual mode. Will force switch to Auto mode.", buf, 0xCu);
        }
        __int16 v13 = [HMDResidentSelectionInfo alloc];
        uint64_t v14 = [MEMORY[0x263EFF910] date];
        uint64_t v15 = [(HMDResidentSelectionInfo *)v13 initWithPreferredResidentIDSIdentifier:0 currentResidentSelectionModeType:3 selectionTimestamp:v14];

        int v16 = [*(id *)(a1 + 32) delegate];
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v19 = MEMORY[0x263EF8330];
        uint64_t v20 = 3221225472;
        __int16 v21 = __86__HMDResidentSelectionMode_handleDailyPreferredResidentsListRegenerationNotification___block_invoke_77;
        __int16 v22 = &unk_264A2F3E8;
        uint64_t v23 = v17;
        objc_msgSend(v16, "primarySelectionMode:didUpdateResidentSelectionInfo:completion:");
      }
    }
  }
  return [*(id *)(a1 + 32) scheduleDailyPreferredResidentsListRegenerationTask];
}

void __86__HMDResidentSelectionMode_handleDailyPreferredResidentsListRegenerationNotification___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int64_t v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Model update for switching from Manual to Auto mode completed.", (uint8_t *)&v8, 0xCu);
  }
}

- (id)_nextResidentsListGenerationDate
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F42608] sharedPreferences];
  int v4 = [v3 preferenceForKey:@"rsPreferredListGenInterval"];
  id v5 = [v4 numberValue];

  [v5 doubleValue];
  if (v6 <= 0.0)
  {
    unint64_t v8 = [(HMDResidentSelectionMode *)self preferredListGenerationEndHour];
    unint64_t v9 = [(HMDResidentSelectionMode *)self preferredListGenerationStartHour];
    unint64_t v10 = [(HMDResidentSelectionMode *)self preferredListGenerationEndHour];
    if (v10 < [(HMDResidentSelectionMode *)self preferredListGenerationStartHour]
      || (unint64_t v11 = 86400 * (v8 - v9), v11 > 0x15180))
    {
      int v12 = (void *)MEMORY[0x230FBD990]();
      __int16 v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v25 = 138544130;
        uint64_t v26 = v15;
        __int16 v27 = 2048;
        uint64_t v28 = 18000;
        __int16 v29 = 2048;
        uint64_t v30 = [(HMDResidentSelectionMode *)v13 preferredListGenerationStartHour];
        __int16 v31 = 2048;
        uint64_t v32 = [(HMDResidentSelectionMode *)v13 preferredListGenerationEndHour];
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Overriding to default allowedGenerationIntervalSeconds value %zu due to startHour=%zu, endHour=%zu", (uint8_t *)&v25, 0x2Au);
      }
      unint64_t v11 = 18000;
    }
    int v16 = [(HMDResidentSelectionMode *)self context];
    uint64_t v17 = [v16 home];
    v18 = [v17 uuid];
    uint64_t v19 = objc_msgSend(v18, "hmf_bytesAsData");
    unint64_t v20 = HMDTruncatedHash(v19);

    __int16 v21 = [MEMORY[0x263EFF8F0] currentCalendar];
    __int16 v22 = [MEMORY[0x263EFF910] now];
    uint64_t v23 = objc_msgSend(v21, "nextDateAfterDate:matchingHour:minute:second:options:", v22, -[HMDResidentSelectionMode preferredListGenerationStartHour](self, "preferredListGenerationStartHour"), 0, 0, 1024);

    id v7 = [v23 addTimeInterval:(double)(v20 % v11)];
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:");
  }

  return v7;
}

- (unint64_t)preferredListGenerationEndHour
{
  v2 = [(HMDResidentSelectionMode *)self idsServerBag];
  id v3 = [v2 residentSelectionPreferredListGenerationEndHour];

  if (v3) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 6;
  }

  return v4;
}

- (unint64_t)preferredListGenerationStartHour
{
  v2 = [(HMDResidentSelectionMode *)self idsServerBag];
  id v3 = [v2 residentSelectionPreferredListGenerationStartHour];

  if (v3) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)scheduleDailyPreferredResidentsListRegenerationTask
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(HMDResidentSelectionMode *)self context];
  char v4 = [v3 isActingAsResident];

  if ((v4 & 1) == 0)
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    unint64_t v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v25 = v11;
      int v12 = "%{public}@Scheduling preferred resident list regen task on non-resident";
      __int16 v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  id v5 = [(HMDResidentSelectionMode *)self backgroundTaskManager];
  double v6 = [(HMDResidentSelectionMode *)self backgroundTaskIdentifier];
  int v7 = [v5 hasOutstandingTaskWithIdentifier:v6];

  if (v7)
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    unint64_t v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v25 = v11;
      int v12 = "%{public}@Not scheduling the task to regenerate the preferred list because there is an outstanding one.";
      __int16 v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_7:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v15 = [(HMDResidentSelectionMode *)self _nextResidentsListGenerationDate];
  int v16 = [(HMDResidentSelectionMode *)self backgroundTaskManager];
  uint64_t v17 = [(HMDResidentSelectionMode *)self backgroundTaskIdentifier];
  id v23 = 0;
  [v16 scheduleTaskWithIdentifier:v17 fireDate:v15 onObserver:self selector:sel_handleDailyPreferredResidentsListRegenerationNotification_ error:&v23];
  id v18 = v23;

  uint64_t v19 = (void *)MEMORY[0x230FBD990]();
  unint64_t v20 = self;
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    __int16 v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v25 = v22;
    __int16 v26 = 2112;
    __int16 v27 = v15;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Scheduled a background task for preferred residents list regeneration for: %@.", buf, 0x16u);
  }
}

- (void)deregisterForMessages
{
  id v4 = [(HMDResidentSelectionMode *)self context];
  id v3 = [v4 messageDispatcher];
  [v3 deregisterReceiver:self];
}

- (id)backupsForResident:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentSelectionMode *)self sortedResidents];
  double v6 = v5;
  if (v5)
  {
    int v7 = (void *)[v5 mutableCopy];
    [v7 removeObject:v4];
  }
  else
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    unint64_t v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      os_log_type_t v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@There are no residents available to act as a backup.", (uint8_t *)&v13, 0xCu);
    }
    int v7 = 0;
  }

  return v7;
}

- (id)residentSelectionInfoWithOurselvesAsThePreferredWithTimestamp:(id)a3
{
  id v4 = a3;
  if ([(HMDResidentSelectionMode *)self currentModeType] == 2)
  {
    id v5 = [(HMDResidentSelectionMode *)self context];
    double v6 = [v5 currentResidentDevice];
    int v7 = [v6 device];
    unint64_t v8 = [v7 idsIdentifier];
  }
  else
  {
    unint64_t v8 = 0;
  }
  unint64_t v9 = [[HMDResidentSelectionInfo alloc] initWithPreferredResidentIDSIdentifier:v8 currentResidentSelectionModeType:[(HMDResidentSelectionMode *)self currentModeType] selectionTimestamp:v4];

  return v9;
}

- (void)handleWeAreSelectedAsThePreferredPrimaryWithInfo:(id)a3 selectionMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(HMDResidentSelectionMode *)self delegate];
  unint64_t v9 = [(HMDResidentSelectionMode *)self context];
  unint64_t v10 = [v9 currentResidentDevice];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__HMDResidentSelectionMode_handleWeAreSelectedAsThePreferredPrimaryWithInfo_selectionMessage___block_invoke;
  v12[3] = &unk_264A2F370;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v8 primarySelectionMode:self didSelectPrimaryResident:v10 selectionInfo:v7 selectionLogEvent:0 completion:v12];
}

void __94__HMDResidentSelectionMode_handleWeAreSelectedAsThePreferredPrimaryWithInfo_selectionMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      unint64_t v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed selection with error: %@.", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v3];
  }
  else
  {
    if (v7)
    {
      unint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully completed selection.", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithSuccess];
  }
}

- (void)handleWeAreSelectedAsThePreferredPrimaryWithSelectionTimestamp:(id)a3 selectionMessage:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)MEMORY[0x230FBD990]();
  unint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@We are selected as the new preferred.", (uint8_t *)&v13, 0xCu);
  }
  __int16 v12 = [(HMDResidentSelectionMode *)v9 residentSelectionInfoWithOurselvesAsThePreferredWithTimestamp:v6];
  [(HMDResidentSelectionMode *)v9 handleWeAreSelectedAsThePreferredPrimaryWithInfo:v12 selectionMessage:v7];
}

- (BOOL)_preferredResidentsListFromElectorUpdated
{
  id v3 = [(HMDResidentSelectionMode *)self context];
  id v4 = [(HMDResidentSelectionMode *)self preferredResidentsListFromElector];

  if (v4)
  {
    id v5 = [(HMDResidentSelectionMode *)self preferredResidentsListFromElector];
    [v3 electorsPreferredResidentsList];
  }
  else
  {
    id v5 = [v3 electorsPreferredResidentsList];
    [(HMDResidentSelectionMode *)self localPreferredResidentsList];
  id v6 = };
  char v7 = [v5 isEqual:v6];

  return v7 ^ 1;
}

- (id)_generatePreferredResidentsList
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(HMDResidentSelectionMode *)self sortedResidents];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__HMDResidentSelectionMode__generatePreferredResidentsList__block_invoke;
  v14[3] = &unk_264A2A710;
  id v15 = v3;
  id v5 = v3;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

  unint64_t v6 = [v5 count];
  unint64_t v7 = [(HMDResidentSelectionMode *)self _preferredResidentsListMaxSize];
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  unint64_t v9 = objc_msgSend(v5, "subarrayWithRange:", 0, v8);
  int v10 = [HMDPreferredResidentsList alloc];
  id v11 = [MEMORY[0x263EFF910] date];
  __int16 v12 = [(HMDPreferredResidentsList *)v10 initWithResidentIDSIdentifiers:v9 modifiedTimestamp:v11];

  return v12;
}

void __59__HMDResidentSelectionMode__generatePreferredResidentsList__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 device];
  id v4 = [v3 idsIdentifier];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    unint64_t v6 = [v8 device];
    unint64_t v7 = [v6 idsIdentifier];
    [v5 addObject:v7];
  }
}

- (unint64_t)_preferredResidentsListMaxSize
{
  v2 = [(HMDResidentSelectionMode *)self idsServerBag];
  id v3 = [v2 residentSelectionPreferredResidentsListMaxSize];

  if (v3 && [v3 unsignedIntValue]) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 10;
  }

  return v4;
}

- (id)residentsNotPresentInPreferredResidentsList:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  unint64_t v6 = [(HMDResidentSelectionMode *)self context];
  unint64_t v7 = [v6 residentsPresentOnStatusKit];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __72__HMDResidentSelectionMode_residentsNotPresentInPreferredResidentsList___block_invoke;
  v24[3] = &unk_264A190F0;
  id v8 = v4;
  id v25 = v8;
  id v9 = v5;
  id v26 = v9;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);

  int v10 = [v6 availableResidentDevices];
  id v11 = (void *)[v10 copy];

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  unint64_t v20 = __72__HMDResidentSelectionMode_residentsNotPresentInPreferredResidentsList___block_invoke_2;
  __int16 v21 = &unk_264A19118;
  id v22 = v8;
  id v23 = v9;
  id v12 = v9;
  id v13 = v8;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v18);
  uint64_t v14 = objc_msgSend(v12, "allObjects", v18, v19, v20, v21);
  id v15 = [v6 residentDevicesWithIDSIdentifiers:v14];

  int v16 = [(HMDResidentSelectionMode *)self _sortResidentsByLatestVersionLowestUUID:v15];

  return v16;
}

void __72__HMDResidentSelectionMode_residentsNotPresentInPreferredResidentsList___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __72__HMDResidentSelectionMode_residentsNotPresentInPreferredResidentsList___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 device];
  uint64_t v4 = [v3 idsIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;
    unint64_t v6 = *(void **)(a1 + 32);
    unint64_t v7 = [v11 device];
    id v8 = [v7 idsIdentifier];
    LOBYTE(v6) = [v6 containsObject:v8];

    if (v6) {
      goto LABEL_5;
    }
    id v9 = *(void **)(a1 + 40);
    id v3 = [v11 device];
    int v10 = [v3 idsIdentifier];
    [v9 addObject:v10];
  }
LABEL_5:
}

- (BOOL)allResidentsAboveMeAreUnreachableIn:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  id v5 = [(HMDResidentSelectionMode *)self context];
  unint64_t v6 = [v5 currentResidentDevice];
  unint64_t v7 = [v6 device];
  id v8 = [v7 idsIdentifier];

  id v9 = [v5 residentsPresentOnStatusKit];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __64__HMDResidentSelectionMode_allResidentsAboveMeAreUnreachableIn___block_invoke;
  v22[3] = &unk_264A190C8;
  id v10 = v8;
  id v23 = v10;
  id v11 = v9;
  id v24 = v11;
  id v25 = &v26;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v22);
  id v12 = [v4 firstObject];
  int v13 = [v12 isEqual:v10];

  int v14 = *((unsigned __int8 *)v27 + 24);
  if (*((unsigned char *)v27 + 24)) {
    int v15 = v13;
  }
  else {
    int v15 = 0;
  }
  if (v15 == 1)
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    HMFGetOSLogHandle();
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Taking over as the current primary since we are on top of the preferred residents list.", buf, 0xCu);
    }
    int v14 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v20 = v14 != 0;

  _Block_object_dispose(&v26, 8);
  return v20;
}

void __64__HMDResidentSelectionMode_allResidentsAboveMeAreUnreachableIn___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([v6 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    if (![*(id *)(a1 + 40) containsObject:v6]) {
      goto LABEL_5;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  *a4 = 1;
LABEL_5:
}

- (BOOL)_shouldTakeOverBasedOnReachability
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(HMDResidentSelectionMode *)self context];
  id v4 = [v3 electorsPreferredResidentsList];

  if (v4)
  {
    id v5 = [v4 residentIDSIdentifiers];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = [(HMDResidentSelectionMode *)self residentsNotPresentInPreferredResidentsList:v5];
  unint64_t v7 = [MEMORY[0x263EFF980] array];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__HMDResidentSelectionMode__shouldTakeOverBasedOnReachability__block_invoke;
  v16[3] = &unk_264A2A710;
  id v8 = v7;
  id v17 = v8;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);
  id v9 = [v5 arrayByAddingObjectsFromArray:v8];
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Preferred Residents: %@", buf, 0x16u);
  }
  BOOL v14 = [(HMDResidentSelectionMode *)v11 allResidentsAboveMeAreUnreachableIn:v9];

  return v14;
}

void __62__HMDResidentSelectionMode__shouldTakeOverBasedOnReachability__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 device];
  id v5 = [v3 idsIdentifier];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

- (BOOL)_isViableUserPreferredResident:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMDResidentSelectionMode *)self locationOfResident:v4];
  if (v5 == 300
    || [(HMDResidentSelectionMode *)self _allResidentsHaveSameLocationStatus:v5])
  {
    char v6 = 1;
  }
  else
  {
    unint64_t v7 = [(HMDResidentSelectionMode *)self context];
    id v8 = [v7 residentStatusChannel];
    id v9 = [v8 currentPrimaryResident];
    id v10 = [v9 idsIdentifier];

    id v11 = [v4 device];
    id v12 = [v11 idsIdentifier];
    char v6 = objc_msgSend(v10, "hmf_isEqualToUUID:", v12);
  }
  return v6;
}

- (BOOL)shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:(id)a3 isTimerTriggered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = [(HMDResidentSelectionMode *)self context];
  if ([v7 isActingAsResident])
  {
    id v8 = [(HMDResidentSelectionMode *)self userPreferredResidentPerSelectionInfo:v6];
    id v9 = [v7 availableResidentDevices];
    unint64_t v10 = [v9 count];

    if (v4) {
      [(HMDResidentSelectionMode *)self _evaluatePrimaryChangedReason];
    }
    id v11 = [v7 residentStatusChannel];
    char v12 = [v11 isConnected];

    if (v10 >= 2 && (v12 & 1) == 0)
    {
      uint64_t v13 = MEMORY[0x230FBD990]();
      BOOL v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        id v17 = (void *)v13;
LABEL_10:
        BOOL v18 = 0;
LABEL_17:

        goto LABEL_18;
      }
      int v16 = HMFGetLogIdentifier();
      int v33 = 138543362;
      v34 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over as the current primary since there are other residents and we are not connected.", (uint8_t *)&v33, 0xCu);
LABEL_8:

      goto LABEL_9;
    }
    if ([v8 isCurrentDevice])
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      __int16 v20 = self;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v33 = 138543362;
        v34 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Should take over as the current primary since we are the user preferred.", (uint8_t *)&v33, 0xCu);
      }
    }
    else
    {
      if ([v8 isReachable]
        && [(HMDResidentSelectionMode *)self _isViableUserPreferredResident:v8])
      {
        uint64_t v13 = MEMORY[0x230FBD990]();
        BOOL v14 = self;
        int v15 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        int v16 = HMFGetLogIdentifier();
        id v24 = [v8 shortDescription];
        int v33 = 138543618;
        v34 = v16;
        __int16 v35 = 2112;
        v36 = v24;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over as the current primary since the user preferred resident: %@ is viable.", (uint8_t *)&v33, 0x16u);

        goto LABEL_8;
      }
      BOOL v25 = [(HMDResidentSelectionMode *)self _shouldTakeOverBasedOnReachability];
      uint64_t v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = self;
      uint64_t v28 = HMFGetOSLogHandle();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      if (!v25)
      {
        if (v29)
        {
          __int16 v31 = HMFGetLogIdentifier();
          uint64_t v32 = StringFromHMDResidentLocation([v7 myLocation]);
          int v33 = 138543618;
          v34 = v31;
          __int16 v35 = 2112;
          v36 = v32;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over as the current primary since none of the conditions apply. Our location: %@", (uint8_t *)&v33, 0x16u);
        }
        id v17 = v26;
        goto LABEL_10;
      }
      if (v29)
      {
        uint64_t v30 = HMFGetLogIdentifier();
        int v33 = 138543362;
        v34 = v30;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Should take over as the current primary since all residents above me in the list are unreachable.", (uint8_t *)&v33, 0xCu);
      }
      if (v4) {
        [(HMDResidentSelectionMode *)v27 setPrimaryChangedReason:3];
      }
    }
    BOOL v18 = 1;
    goto LABEL_17;
  }
  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (void)_evaluatePrimaryChangedReason
{
  id v5 = [(HMDResidentSelectionMode *)self context];
  id v3 = [v5 residentSelectionInfo];
  BOOL v4 = [(HMDResidentSelectionMode *)self residentSelectionInfoFromWorkingStore];
  [(HMDResidentSelectionMode *)self _evaluatePrimaryChangedReasonForCurrentSelectionInfo:v3 previousSelectionInfo:v4];
}

- (BOOL)hasViablePrimaryResidentWithSelectionInfo:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentSelectionMode *)self context];
  id v6 = [v5 residentStatusChannel];
  unint64_t v7 = [v6 currentPrimaryResident];

  id v8 = [v5 currentResidentDevice];
  id v9 = [v8 device];
  unint64_t v10 = [v9 version];

  id v11 = [v7 swVersion];
  char v12 = [v8 isReachable];
  BOOL v29 = [(HMDResidentSelectionMode *)self userPreferredResidentPerSelectionInfo:v4];
  if ([v29 isCurrentDevice])
  {
    context = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v15;
      int v16 = "%{public}@Should take over since we are the user preferred and hence better than the current primary.";
LABEL_10:
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!v7)
  {
    context = (void *)MEMORY[0x230FBD990]();
    id v23 = self;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v15;
      int v16 = "%{public}@Should take over since the current primary is not reachable.";
      goto LABEL_10;
    }
LABEL_11:
    BOOL v22 = 0;
    goto LABEL_21;
  }
  id v27 = v4;
  id v17 = v10;
  int v18 = [v11 isAtLeastVersion:v10];
  context = (void *)MEMORY[0x230FBD990]();
  uint64_t v19 = self;
  BOOL v14 = HMFGetOSLogHandle();
  BOOL v20 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    unint64_t v10 = v17;
    if (v12)
    {
      if (v20)
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v31 = v24;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Should take over since the current primary is not better than us.", buf, 0xCu);
      }
      BOOL v22 = 0;
    }
    else
    {
      if (v20)
      {
        BOOL v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v31 = v25;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over since we are not reachable.", buf, 0xCu);
      }
      BOOL v22 = 1;
    }
    goto LABEL_20;
  }
  if (!v20)
  {
    BOOL v22 = 1;
    unint64_t v10 = v17;
LABEL_20:
    id v4 = v27;
    goto LABEL_21;
  }
  __int16 v21 = HMFGetLogIdentifier();
  *(_DWORD *)buf = 138543874;
  __int16 v31 = v21;
  __int16 v32 = 2112;
  int v33 = v11;
  __int16 v34 = 2112;
  unint64_t v10 = v17;
  __int16 v35 = v17;
  _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over since the current primary version: %@ is same or better than ours: %@.", buf, 0x20u);

  BOOL v22 = 1;
  id v4 = v27;
LABEL_21:

  return v22;
}

- (void)cancelAllTakeOverTimers
{
  id v3 = [(HMDResidentSelectionMode *)self takeOverTimer];
  [v3 suspend];

  [(HMDResidentSelectionMode *)self setTakeOverTimer:0];
  id v4 = [(HMDResidentSelectionMode *)self takeOverIfPrimaryIsNotViableTimer];
  [v4 suspend];

  [(HMDResidentSelectionMode *)self setTakeOverIfPrimaryIsNotViableTimer:0];
}

- (void)takeOverWithSelectionTimestamp:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  unint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543362;
    int v15 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Taking over as the current primary.", (uint8_t *)&v14, 0xCu);
  }
  id v9 = [(HMDResidentSelectionMode *)v6 delegate];
  unint64_t v10 = [(HMDResidentSelectionMode *)v6 context];
  id v11 = [v10 currentResidentDevice];
  char v12 = [v11 device];
  uint64_t v13 = [v12 idsIdentifier];
  [v9 primarySelectionMode:v6 didReceivePrimaryResidentIdsIdentifier:v13 selectionTimestamp:v4];

  [(HMDResidentSelectionMode *)v6 cancelAllTakeOverTimers];
}

- (BOOL)takeOverIfConditionsAreMetWithIsTimerTriggered:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = [(HMDResidentSelectionMode *)self context];
  if ([v5 isActingAsResident])
  {
    id v6 = [v5 residentSelectionInfo];
    LODWORD(v3) = [(HMDResidentSelectionMode *)self shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:v6 isTimerTriggered:v3];
    if (v3)
    {
      unint64_t v7 = [v6 selectionTimestamp];
      [(HMDResidentSelectionMode *)self takeOverWithSelectionTimestamp:v7];
    }
  }
  else
  {
    uint64_t v3 = MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Evaluating becoming the primary on non-resident", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)handleTakeOverTimerFired
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Takeover timer fired.", (uint8_t *)&v7, 0xCu);
  }
  [(HMDResidentSelectionMode *)v4 takeOverIfConditionsAreMetWithIsTimerTriggered:1];
}

- (void)_rescheduleTakeOverTimer
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDResidentSelectionMode *)self _takeOverTimerInterval];
  double v5 = v4;
  id v6 = (void *)MEMORY[0x230FBD990](v3);
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v16 = 138543618;
    id v17 = v9;
    __int16 v18 = 2048;
    double v19 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Rescheduling take over time in %f", (uint8_t *)&v16, 0x16u);
  }
  unint64_t v10 = [(HMDResidentSelectionMode *)v7 takeOverTimer];
  [v10 suspend];

  id v11 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:v5];
  [(HMDResidentSelectionMode *)v7 setTakeOverTimer:v11];

  int v12 = [(HMDResidentSelectionMode *)v7 takeOverTimer];
  [v12 setDelegate:v7];

  uint64_t v13 = [(HMDResidentSelectionMode *)v7 queue];
  uint64_t v14 = [(HMDResidentSelectionMode *)v7 takeOverTimer];
  [v14 setDelegateQueue:v13];

  int v15 = [(HMDResidentSelectionMode *)v7 takeOverTimer];
  [v15 resume];
}

- (double)_takeOverTimerInterval
{
  v2 = [(HMDResidentSelectionMode *)self idsServerBag];
  uint64_t v3 = [v2 residentSelectionTakeOverInterval];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 7200.0;
  }

  return v5;
}

- (void)scheduleTakeOverTimerIfRequiredAfterBlockDuration:(double)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v5 = [(HMDResidentSelectionMode *)self takeOverIfPrimaryIsNotViableTimer];
  int v6 = [v5 isRunning];

  if (v6)
  {
    int v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      id v11 = [(HMDResidentSelectionMode *)v8 takeOverIfPrimaryIsNotViableTimer];
      int v12 = [v11 fireDate];
      int v18 = 138543618;
      double v19 = v10;
      __int16 v20 = 2112;
      double v21 = *(double *)&v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Primary takeover is blocked. Take over timer is already running. It will fire at: %@.", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    double v13 = a3 + 300.0;
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = HMFGetLogIdentifier();
      int v18 = 138543618;
      double v19 = v17;
      __int16 v20 = 2048;
      double v21 = v13;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Primary takeover is blocked. Scheduling timer after: %fs", (uint8_t *)&v18, 0x16u);
    }
    [(HMDResidentSelectionMode *)v15 _rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:v13];
  }
}

- (BOOL)takeOverIfPrimaryIsNotViableWithIsTimerTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v5 = [(HMDResidentSelectionMode *)self context];
  if (([v5 isActingAsResident] & 1) == 0)
  {
    int v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      int v20 = 138543362;
      double v21 = v10;
      id v11 = "%{public}@Evaluating becoming the primary on non-resident";
      int v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_13:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v20, 0xCu);
    }
LABEL_14:

    goto LABEL_15;
  }
  [v5 blockPrimaryTakeoverDuration];
  if (v6 <= 0.0)
  {
    uint64_t v14 = [v5 residentStatusChannel];
    char v15 = [v14 isConnected];

    if (v15)
    {
      int v16 = [v5 residentSelectionInfo];
      if ([(HMDResidentSelectionMode *)self shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:v16 isTimerTriggered:v3])
      {
        if (![(HMDResidentSelectionMode *)self hasViablePrimaryResidentWithSelectionInfo:v16])
        {
          double v19 = [v16 selectionTimestamp];
          [(HMDResidentSelectionMode *)self takeOverWithSelectionTimestamp:v19];

          BOOL v17 = 1;
          goto LABEL_18;
        }
        [(HMDResidentSelectionMode *)self _rescheduleTakeOverTimer];
      }
      BOOL v17 = 0;
LABEL_18:

      goto LABEL_16;
    }
    int v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      int v20 = 138543362;
      double v21 = v10;
      id v11 = "%{public}@Not taking over as we are not connected to StatusKit";
      int v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  -[HMDResidentSelectionMode scheduleTakeOverTimerIfRequiredAfterBlockDuration:](self, "scheduleTakeOverTimerIfRequiredAfterBlockDuration:");
LABEL_15:
  BOOL v17 = 0;
LABEL_16:

  return v17;
}

- (void)handleTakeOverIfPrimaryIsNotViableTimerFired
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  double v4 = self;
  double v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Takeover if better than the current primary timer fired.", (uint8_t *)&v7, 0xCu);
  }
  [(HMDResidentSelectionMode *)v4 takeOverIfPrimaryIsNotViableWithIsTimerTriggered:1];
}

- (void)_rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:(double)a3
{
  double v5 = [(HMDResidentSelectionMode *)self takeOverIfPrimaryIsNotViableTimer];
  [v5 suspend];

  double v6 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a3];
  [(HMDResidentSelectionMode *)self setTakeOverIfPrimaryIsNotViableTimer:v6];

  int v7 = [(HMDResidentSelectionMode *)self takeOverIfPrimaryIsNotViableTimer];
  [v7 setDelegate:self];

  id v8 = [(HMDResidentSelectionMode *)self queue];
  uint64_t v9 = [(HMDResidentSelectionMode *)self takeOverIfPrimaryIsNotViableTimer];
  [v9 setDelegateQueue:v8];

  id v10 = [(HMDResidentSelectionMode *)self takeOverIfPrimaryIsNotViableTimer];
  [v10 resume];
}

- (BOOL)shouldRegeneratePreferredResidentsListBasedOnFoundResidents:(id)a3 residentLocationMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v17 = 0;
    int v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    id v8 = [(HMDResidentSelectionMode *)self localPreferredResidentsList];
    uint64_t v9 = [v8 residentIDSIdentifiers];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __108__HMDResidentSelectionMode_shouldRegeneratePreferredResidentsListBasedOnFoundResidents_residentLocationMap___block_invoke;
    v13[3] = &unk_264A19E68;
    id v14 = v7;
    id v10 = v9;
    id v15 = v10;
    int v16 = &v17;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
    BOOL v11 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __108__HMDResidentSelectionMode_shouldRegeneratePreferredResidentsListBasedOnFoundResidents_residentLocationMap___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 unsignedIntegerValue];

  LODWORD(v7) = [*(id *)(a1 + 40) containsObject:v6];
  if (v7 && (v8 == 200 || v8 == 100))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)handleMeshInformationRequest:(id)a3
{
  v48[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v5 = [(HMDResidentSelectionMode *)self context];
  id v6 = v5;
  if (!v5)
  {
    int v33 = (void *)MEMORY[0x230FBD990]();
    __int16 v34 = self;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      uint64_t v37 = [v4 destination];
      *(_DWORD *)buf = 138543618;
      v42 = v36;
      __int16 v43 = 2112;
      v44 = v37;
      v38 = "%{public}@Responding with error to mesh information request from: %@ due to missing context.";
LABEL_14:
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, v38, buf, 0x16u);
    }
LABEL_15:

    BOOL v11 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v11];
    goto LABEL_16;
  }
  id v7 = [v5 currentResidentDevice];

  if (!v7)
  {
    int v33 = (void *)MEMORY[0x230FBD990]();
    __int16 v34 = self;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      uint64_t v37 = [v4 destination];
      *(_DWORD *)buf = 138543618;
      v42 = v36;
      __int16 v43 = 2112;
      v44 = v37;
      v38 = "%{public}@Ignoring mesh information request from: %@ since we are not a resident.";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v40 = v4;
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v6 home];
  id v10 = [v9 accessories];
  BOOL v11 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));

  int v12 = NSNumber;
  os_log_type_t v13 = [v6 home];
  id v14 = [v13 enabledResidents];
  id v15 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));

  int v16 = [v6 primaryResidentDevice];
  if (!v16)
  {
    int v16 = [(HMDResidentSelectionMode *)self _highestVersionLowestUUIDResident];
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      double v21 = v20 = v6;
      *(_DWORD *)buf = 138543618;
      v42 = v21;
      __int16 v43 = 2112;
      v44 = v16;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Using resident: %@ for the leader for the mesh information request since we do not have a primary.", buf, 0x16u);

      id v6 = v20;
    }
  }
  uint64_t v22 = [v16 identifier];
  id v23 = [v22 UUIDString];

  v47[0] = @"r";
  v39 = v6;
  id v24 = [v6 currentResidentDevice];
  BOOL v25 = [v24 identifier];
  uint64_t v26 = [v25 UUIDString];
  v48[0] = v26;
  v48[1] = v11;
  v47[1] = @"rip";
  v47[2] = @"res";
  v48[2] = v15;
  v48[3] = v23;
  v47[3] = @"l";
  v47[4] = @"p";
  v48[4] = v23;
  id v27 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:5];

  uint64_t v28 = (void *)MEMORY[0x230FBD990]();
  BOOL v29 = self;
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    __int16 v31 = HMFGetLogIdentifier();
    __int16 v32 = [v4 destination];
    *(_DWORD *)buf = 138543874;
    v42 = v31;
    __int16 v43 = 2112;
    v44 = v32;
    __int16 v45 = 2112;
    v46 = v27;
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Handling mesh information request from: %@ and responding with: %@.", buf, 0x20u);

    id v4 = v40;
  }

  [v4 respondWithPayload:v27];

  id v6 = v39;
LABEL_16:
}

- (id)_highestVersionLowestUUIDResident
{
  BOOL v3 = [(HMDResidentSelectionMode *)self context];
  id v4 = [v3 availableResidentDevices];
  double v5 = [(HMDResidentSelectionMode *)self _sortResidentsByLatestVersionLowestUUID:v4];

  id v6 = [v5 firstObject];

  return v6;
}

- (BOOL)newPrimaryIsInREv2BasedOnTheirTimestamp:(id)a3 ourSelectionInfo:(id)a4
{
  if (a3) {
    return 0;
  }
  double v5 = [a4 selectionTimestamp];
  BOOL v4 = v5 != 0;

  return v4;
}

- (id)userPreferredResidentPerSelectionInfo:(id)a3
{
  BOOL v4 = [a3 preferredResidentIDSIdentifier];
  if (v4)
  {
    double v5 = [(HMDResidentSelectionMode *)self context];
    id v6 = [v5 residentDeviceWithIDSIdentifier:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)messageTransportRestriction
{
  return -1;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDResidentSelectionMode *)self context];
  BOOL v3 = [v2 home];
  BOOL v4 = [v3 uuid];

  return (NSUUID *)v4;
}

- (id)_sortResidentsByLatestVersionLowestUUID:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_63_37211];
}

uint64_t __68__HMDResidentSelectionMode__sortResidentsByLatestVersionLowestUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 device];
  id v7 = [v6 version];
  uint64_t v8 = [v4 device];
  uint64_t v9 = [v8 version];
  uint64_t v10 = [v7 compare:v9];

  if (!v10)
  {
    BOOL v11 = [v4 device];
    int v12 = [v11 idsIdentifier];
    os_log_type_t v13 = [v12 UUIDString];
    id v14 = [v5 device];
    id v15 = [v14 idsIdentifier];
    int v16 = [v15 UUIDString];
    uint64_t v10 = [v13 compare:v16];
  }
  return v10;
}

- (NSArray)sortedResidents
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDResidentSelectionMode *)self context];
  id v4 = [v3 home];
  id v5 = [v4 enabledResidents];

  id v6 = [(HMDResidentSelectionMode *)self _sortResidentsUsingAllCriteria:v5];
  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    BOOL v11 = [v6 shortDescription];
    int v13 = 138543618;
    id v14 = v10;
    __int16 v15 = 2112;
    int v16 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Residents after sorting: %@.", (uint8_t *)&v13, 0x16u);
  }

  return (NSArray *)v6;
}

- (BOOL)residentIsLocallyReachable:(id)a3
{
  return 0;
}

- (NSSet)locallyReachableResidents
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (id)dumpState
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = NSString;
  unint64_t v5 = [(HMDResidentSelectionMode *)self currentModeType];
  if (v5 - 1 > 2) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_264A29950[v5 - 1];
  }
  id v7 = v6;
  uint64_t v8 = [(HMDResidentSelectionMode *)self residentSelectionInfoFromWorkingStore];
  uint64_t v9 = [v4 stringWithFormat:@"Mode: %@, Working store info: %@", v7, v8];
  [v3 setObject:v9 forKeyedSubscript:@"State"];

  uint64_t v10 = [(HMDResidentSelectionMode *)self localPreferredResidentsList];
  BOOL v11 = [(HMDResidentSelectionMode *)self context];
  int v12 = [v10 residentIDSIdentifiers];
  int v13 = [v11 residentDevicesWithIDSIdentifiers:v12];

  id v14 = [v10 modifiedTimestamp];
  __int16 v15 = [v14 localTimeDescription];
  [v3 setObject:v15 forKeyedSubscript:@"Local Preferred Residents Timestamp"];

  int v16 = objc_msgSend(v13, "na_map:", &__block_literal_global_37220);
  [v3 setObject:v16 forKeyedSubscript:@"Local Preferred Residents"];

  uint64_t v17 = NSString;
  int v18 = [v11 presentResidentsStatuses];
  uint64_t v19 = [v18 residentIDSIdentifierToLocationMap];
  char v20 = [v17 stringWithFormat:@" %@", v19];
  [v3 setObject:v20 forKeyedSubscript:@"Resident Location map"];

  return v3;
}

uint64_t __37__HMDResidentSelectionMode_dumpState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortDescription];
}

- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(HMDResidentSelectionMode *)self context];
  if ([v11 isActingAsResident])
  {
    int v12 = [v11 residentStatusChannel];
    char v13 = [v12 isConnected];

    if (v13)
    {
      if ([v9 count]) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = [v10 count] != 0;
      }
      uint64_t v19 = [v8 residentIDSIdentifierToLocationMap];
      BOOL v20 = [(HMDResidentSelectionMode *)self shouldRegeneratePreferredResidentsListBasedOnFoundResidents:v9 residentLocationMap:v19];

      if (v20)
      {
        double v21 = (void *)MEMORY[0x230FBD990]();
        uint64_t v22 = self;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          id v24 = HMFGetLogIdentifier();
          [v8 residentIDSIdentifierToLocationMap];
          BOOL v25 = v37 = v21;
          *(_DWORD *)buf = 138543618;
          v39 = v24;
          __int16 v40 = 2112;
          double v41 = *(double *)&v25;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Regenerating new preferred residents list. Latest location info: %@", buf, 0x16u);

          double v21 = v37;
        }

        [(HMDResidentSelectionMode *)v22 _updateLocalPreferredResidentsList];
      }
      BOOL v26 = [(HMDResidentSelectionMode *)self _preferredResidentsListFromElectorUpdated];
      id v27 = [v11 electorsPreferredResidentsList];
      [(HMDResidentSelectionMode *)self setPreferredResidentsListFromElector:v27];

      if (v14 || v26)
      {
        uint64_t v28 = [(HMDResidentSelectionMode *)self _statusDebounceInterval];
        double v30 = v29;
        __int16 v31 = (void *)MEMORY[0x230FBD990](v28);
        __int16 v32 = self;
        int v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = HMFGetLogIdentifier();
          __int16 v35 = HMFBooleanToString();
          uint64_t v36 = HMFBooleanToString();
          *(_DWORD *)buf = 138544130;
          v39 = v34;
          __int16 v40 = 2048;
          double v41 = v30;
          __int16 v42 = 2112;
          __int16 v43 = v35;
          __int16 v44 = 2112;
          __int16 v45 = v36;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Kicking off debounce for taking over evaluation in %f. Reachability changed: %@. Preferred Residents list updated: %@", buf, 0x2Au);
        }
        [(HMDResidentSelectionMode *)v32 _rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:v30];
      }
    }
    else
    {
      __int16 v15 = (void *)MEMORY[0x230FBD990]();
      int v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v39 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@We are not connected per the latest resident status update, not acting on this update.", buf, 0xCu);
      }
      [(HMDResidentSelectionMode *)v16 cancelAllTakeOverTimers];
    }
  }
}

- (double)_statusDebounceInterval
{
  v2 = [(HMDResidentSelectionMode *)self idsServerBag];
  BOOL v3 = [v2 residentSelectionStatusDebounceInterval];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 60.0;
  }

  return v5;
}

- (void)didReceiveSelectionMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 messagePayload];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"primary.ids.identifier");

  if (v6)
  {
    id v7 = [v4 messagePayload];
    id v8 = objc_msgSend(v7, "hmf_dateForKey:", @"primary.selection.timestamp");

    if (v8)
    {
      id v9 = [(HMDResidentSelectionMode *)self context];
      id v10 = [v9 currentResidentDevice];
      BOOL v11 = [v10 device];
      int v12 = [v11 idsIdentifier];

      if (objc_msgSend(v6, "hmf_isEqualToUUID:", v12))
      {
        char v13 = (void *)MEMORY[0x230FBD990]();
        BOOL v14 = self;
        __int16 v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = HMFGetLogIdentifier();
          int v25 = 138543362;
          BOOL v26 = v16;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Controller notified that current device is the new preferred primary", (uint8_t *)&v25, 0xCu);
        }
        [(HMDResidentSelectionMode *)v14 handleWeAreSelectedAsThePreferredPrimaryWithSelectionTimestamp:v8 selectionMessage:v4];
      }
    }
    else
    {
      double v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        int v25 = 138543618;
        BOOL v26 = v24;
        __int16 v27 = 2112;
        uint64_t v28 = v6;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Message with preferred primary: %@ did not contain a preferred primary selection timestamp", (uint8_t *)&v25, 0x16u);
      }
      int v12 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      [v4 respondWithError:v12];
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = HMFGetLogIdentifier();
      int v25 = 138543362;
      BOOL v26 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Message did not contain a preferred primary value", (uint8_t *)&v25, 0xCu);
    }
    id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    [v4 respondWithError:v8];
  }
}

- (void)didUpdateResidentSelectionModelTo:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(HMDResidentSelectionMode *)self residentSelectionInfoFromWorkingStore];
  [(HMDResidentSelectionMode *)self _evaluatePrimaryChangedReasonForCurrentSelectionInfo:v5 previousSelectionInfo:v6];

  [(HMDResidentSelectionMode *)self setResidentSelectionInfoFromWorkingStore:v5];
  id v7 = [(HMDResidentSelectionMode *)self context];
  LODWORD(v5) = [v7 isActingAsResident];

  if (v5)
  {
    [(HMDResidentSelectionMode *)self takeOverIfPrimaryIsNotViableWithIsTimerTriggered:0];
  }
}

- (void)_evaluatePrimaryChangedReasonForCurrentSelectionInfo:(id)a3 previousSelectionInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v8 = [(HMDResidentSelectionMode *)self currentModeType];
  if (v7)
  {
    if (v8 == 2)
    {
      id v9 = [v6 preferredResidentIDSIdentifier];
      id v10 = [v7 preferredResidentIDSIdentifier];
      int v11 = [v9 isEqual:v10];

      if (v11) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 1;
      }
    }
    else
    {
      uint64_t v12 = 3;
    }
    goto LABEL_12;
  }
  if (v8 == 2)
  {
    uint64_t v12 = 1;
LABEL_12:
    uint64_t v13 = [(HMDResidentSelectionMode *)self setPrimaryChangedReason:v12];
    goto LABEL_13;
  }
  uint64_t v13 = [(HMDResidentSelectionMode *)self currentModeType];
  if (v13 == 3)
  {
    uint64_t v12 = 2;
    goto LABEL_12;
  }
LABEL_13:
  BOOL v14 = (void *)MEMORY[0x230FBD990](v13);
  __int16 v15 = self;
  int v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    int v18 = 138543618;
    uint64_t v19 = v17;
    __int16 v20 = 2048;
    uint64_t v21 = [(HMDResidentSelectionMode *)v15 primaryChangedReason];
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@New evaluated primary changed reason: %lu", (uint8_t *)&v18, 0x16u);
  }
}

- (void)sendSelectionMessageToResident:(id)a3 requireAutoUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([v8 isCurrentDevice])
  {
    id v10 = [(HMDResidentSelectionMode *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__HMDResidentSelectionMode_sendSelectionMessageToResident_requireAutoUpdate_completion___block_invoke;
    block[3] = &unk_264A2EE80;
    block[4] = self;
    id v37 = v9;
    id v36 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    int v11 = [v8 device];
    uint64_t v12 = [v11 idsIdentifier];

    if (v12)
    {
      v38[0] = @"primary.ids.identifier";
      uint64_t v13 = [v8 device];
      BOOL v14 = [v13 idsIdentifier];
      __int16 v15 = [v14 UUIDString];
      v39[0] = v15;
      v38[1] = @"primary.selection.timestamp";
      int v16 = [MEMORY[0x263EFF910] date];
      v39[1] = v16;
      v38[2] = @"primary.selection.mode";
      uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[HMDResidentSelectionMode currentModeType](self, "currentModeType"));
      v39[2] = v17;
      v38[3] = @"RS.requireAutoUpdate";
      int v18 = [NSNumber numberWithBool:v6];
      v39[3] = v18;
      uint64_t v19 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];

      __int16 v20 = [HMDRemoteDeviceMessageDestination alloc];
      uint64_t v21 = [(HMDResidentSelectionMode *)self messageTargetUUID];
      uint64_t v22 = [v8 device];
      id v23 = [(HMDRemoteDeviceMessageDestination *)v20 initWithTarget:v21 device:v22];

      id v24 = [[HMDRemoteMessage alloc] initWithName:@"residentSelection.preferred" qualityOfService:25 destination:v23 payload:v19 type:0 timeout:1 secure:0.0 restriction:[(HMDResidentSelectionMode *)self messageTransportRestriction]];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __88__HMDResidentSelectionMode_sendSelectionMessageToResident_requireAutoUpdate_completion___block_invoke_38;
      v32[3] = &unk_264A2B228;
      id v34 = v9;
      id v33 = v8;
      [(HMDRemoteMessage *)v24 setResponseHandler:v32];
      int v25 = [(HMDResidentSelectionMode *)self context];
      BOOL v26 = [v25 messageDispatcher];
      [v26 sendMessage:v24 completionHandler:0];
    }
    else
    {
      __int16 v27 = (void *)MEMORY[0x230FBD990]();
      uint64_t v28 = self;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        double v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        double v41 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@IDS identifier of the preferred resident is nil.", buf, 0xCu);
      }
      __int16 v31 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      (*((void (**)(id, id, void *))v9 + 2))(v9, v8, v31);
    }
  }
}

uint64_t __88__HMDResidentSelectionMode_sendSelectionMessageToResident_requireAutoUpdate_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [MEMORY[0x263EFF910] date];
  [v2 handleWeAreSelectedAsThePreferredPrimaryWithSelectionTimestamp:v3 selectionMessage:0];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

uint64_t __88__HMDResidentSelectionMode_sendSelectionMessageToResident_requireAutoUpdate_completion___block_invoke_38(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)didSucceedResidentSelectionWithPreferred:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Selection completed with preferred primary: %@.", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [(HMDResidentSelectionMode *)v6 selectionCompletion];
  id v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v4, 0);
  }

  [(HMDResidentSelectionMode *)v6 setSelectionCompletion:0];
  [(HMDResidentSelectionMode *)v6 setResidentsEnumerator:0];
}

- (void)didFailResidentSelectionWithResident:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDResidentSelectionMode *)self residentsEnumerator];
  uint64_t v9 = [v8 nextObject];

  id v10 = (void *)MEMORY[0x230FBD990]();
  int v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = HMFGetLogIdentifier();
    int v17 = 138543874;
    int v18 = v13;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to select resident %@. Attempting the next one: %@", (uint8_t *)&v17, 0x20u);
  }
  if (v9)
  {
    id v14 = [(HMDResidentSelectionMode *)v11 createSelectionMessageCompletion];
    [(HMDResidentSelectionMode *)v11 sendSelectionMessageToResident:v9 requireAutoUpdate:0 completion:v14];
  }
  else
  {
    uint64_t v15 = [(HMDResidentSelectionMode *)v11 selectionCompletion];
    int v16 = (void *)v15;
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v7);
    }

    [(HMDResidentSelectionMode *)v11 setSelectionCompletion:0];
    [(HMDResidentSelectionMode *)v11 setResidentsEnumerator:0];
  }
}

- (id)createSelectionMessageCompletion
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HMDResidentSelectionMode_createSelectionMessageCompletion__block_invoke;
  aBlock[3] = &unk_264A2ED40;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  return v2;
}

void __60__HMDResidentSelectionMode_createSelectionMessageCompletion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HMDResidentSelectionMode_createSelectionMessageCompletion__block_invoke_2;
  block[3] = &unk_264A2F2F8;
  id v11 = v5;
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __60__HMDResidentSelectionMode_createSelectionMessageCompletion__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v5 = v3;

  id v4 = *(void **)(a1 + 48);
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v4, "didFailResidentSelectionWithResident:error:", v5);
  }
  else {
    [v4 didSucceedResidentSelectionWithPreferred:v5];
  }
}

- (void)selectPrimaryResidentFromResidents:(id)a3 requireAutoUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(HMDResidentSelectionMode *)self setSelectionCompletion:a5];
  id v9 = [v8 objectEnumerator];

  [(HMDResidentSelectionMode *)self setResidentsEnumerator:v9];
  id v12 = [(HMDResidentSelectionMode *)self residentsEnumerator];
  id v10 = [v12 nextObject];
  id v11 = [(HMDResidentSelectionMode *)self createSelectionMessageCompletion];
  [(HMDResidentSelectionMode *)self sendSelectionMessageToResident:v10 requireAutoUpdate:v6 completion:v11];
}

- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id v10 = (void *)MEMORY[0x263EFF940];
  uint64_t v11 = *MEMORY[0x263EFF498];
  id v12 = NSString;
  uint64_t v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"You must override %@ in a subclass", v13];
  id v15 = [v10 exceptionWithName:v11 reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDResidentSelectionMode *)self context];
  id v9 = [v8 residentSelectionInfo];
  id v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    id v14 = [v6 shortDescription];
    int v33 = 138543874;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    double v38 = *(double *)&v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Evaluating to allow external update of primary resident to: %@ with selection timestamp: %@.", (uint8_t *)&v33, 0x20u);
  }
  id v15 = [v8 primaryResidentDevice];
  int v16 = [v15 isCurrentDevice];

  if (!v16) {
    goto LABEL_12;
  }
  if (![(HMDResidentSelectionMode *)v11 newPrimaryIsInREv2BasedOnTheirTimestamp:v7 ourSelectionInfo:v9])
  {
    if ([(HMDResidentSelectionMode *)v11 shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:v9 isTimerTriggered:0])
    {
      double v24 = (double)arc4random_uniform([(HMDResidentSelectionMode *)v11 _takeOverOnlyIfCurrentPrimaryIsNotViableJitter]);
      uint64_t v25 = [(HMDResidentSelectionMode *)v11 _takeOverIfPrimaryIsNotViableInterval];
      double v27 = v26 + v24;
      uint64_t v28 = (void *)MEMORY[0x230FBD990](v25);
      uint64_t v29 = v11;
      double v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        __int16 v31 = HMFGetLogIdentifier();
        int v33 = 138543874;
        id v34 = v31;
        __int16 v35 = 2112;
        id v36 = v6;
        __int16 v37 = 2048;
        double v38 = v27;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@For now allowing external update of primary resident to: %@. Will reconsider in %f seconds", (uint8_t *)&v33, 0x20u);
      }
      [(HMDResidentSelectionMode *)v29 _rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:v27];
    }
LABEL_12:
    BOOL v23 = 1;
    goto LABEL_13;
  }
  int v17 = (void *)MEMORY[0x230FBD990]();
  int v18 = v11;
  __int16 v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    int v33 = 138543362;
    id v34 = v20;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Not allowing external update of primary resident because its an REV2 device.", (uint8_t *)&v33, 0xCu);
  }
  __int16 v21 = [(HMDResidentSelectionMode *)v18 delegate];
  uint64_t v22 = [v9 selectionTimestamp];
  [v21 primarySelectionMode:v18 reassertAsCurrentPrimaryWithSelectionTimestamp:v22];

  BOOL v23 = 0;
LABEL_13:

  return v23;
}

- (unint64_t)_takeOverOnlyIfCurrentPrimaryIsNotViableJitter
{
  id v2 = [(HMDResidentSelectionMode *)self idsServerBag];
  BOOL v3 = [v2 residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter];

  if (v3) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 60;
  }

  return v4;
}

- (double)_takeOverIfPrimaryIsNotViableInterval
{
  id v2 = [(HMDResidentSelectionMode *)self idsServerBag];
  BOOL v3 = [v2 residentSelectionTakeOverIfPrimaryIsNotViableInterval];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 300.0;
  }

  return v5;
}

- (BOOL)_currentDevicePreferredResidentsListIsPublished
{
  id v2 = [(HMDResidentSelectionMode *)self context];
  BOOL v3 = [v2 residentsPresentOnStatusKit];
  double v4 = [v2 currentResidentDevice];
  double v5 = [v4 device];
  id v6 = [v5 idsIdentifier];
  char v7 = [v3 containsObject:v6];

  return v7;
}

- (void)configureAsAResidentWithRunPrimaryEvaluation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v5 = [(HMDResidentSelectionMode *)self context];
  char v6 = [v5 isActingAsResident];

  char v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring as a resident in the current mode. Run primary evaluation: %d", (uint8_t *)&v15, 0x12u);
    }
    [(HMDResidentSelectionMode *)v8 scheduleDailyPreferredResidentsListRegenerationTask];
    [(HMDResidentSelectionMode *)v8 _updateLocalPreferredResidentsList];
    if ((!v3
       || ![(HMDResidentSelectionMode *)v8 takeOverIfPrimaryIsNotViableWithIsTimerTriggered:0])&& ![(HMDResidentSelectionMode *)v8 _currentDevicePreferredResidentsListIsPublished])
    {
      id v12 = [(HMDResidentSelectionMode *)v8 delegate];
      uint64_t v13 = [(HMDResidentSelectionMode *)v8 localPreferredResidentsList];
      [v12 primarySelectionMode:v8 didUpdatePreferredResidentsList:v13];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Configuring as resident on non-resident", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)currentDeviceReadyAsAResident
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDResidentSelectionMode *)self context];
  char v4 = [v3 isActingAsResident];

  double v5 = (void *)MEMORY[0x230FBD990]();
  char v6 = self;
  char v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device ready as a resident", (uint8_t *)&v12, 0xCu);
    }
    [(HMDResidentSelectionMode *)v6 _registerForMessagesAsAResident];
    [(HMDResidentSelectionMode *)v6 scheduleDailyPreferredResidentsListRegenerationTask];
    [(HMDResidentSelectionMode *)v6 _publishElectorsList];
    if (![(HMDResidentSelectionMode *)v6 takeOverIfPrimaryIsNotViableWithIsTimerTriggered:0])
    {
      id v10 = [(HMDResidentSelectionMode *)v6 delegate];
      [v10 primarySelectionModeReadyAsResident:v6];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Ready as resident on non-resident", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  char v4 = self;
  double v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting.", (uint8_t *)&v7, 0xCu);
  }
  [(HMDResidentSelectionMode *)v4 _registerForMessagesAsAResident];
}

- (void)_registerForMessagesAsAResident
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(HMDResidentSelectionMode *)self context];
  if ([v3 isActingAsResident])
  {
    char v4 = +[HMDRemoteMessagePolicy defaultPolicy];
    [v4 setRequiresSecureMessage:1];
    objc_msgSend(v4, "setRoles:", objc_msgSend(v4, "roles") | 4);
    double v5 = (void *)[v4 copy];
    char v6 = [v3 home];
    int v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:3 remoteAccessRequired:0];

    id v8 = [v3 messageDispatcher];
    v14[0] = v5;
    v14[1] = v7;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    [v8 registerForMessage:@"mesh.meshInformationRequest" receiver:self policies:v9 selector:sel_handleMeshInformationRequest_];
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not registering for messages since we are not a resident.", buf, 0xCu);
    }
  }
}

- (unint64_t)currentModeType
{
  return 0;
}

- (HMDResidentSelectionMode)initWithContext:(id)a3 backgroundTaskManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDResidentSelectionMode;
  id v8 = [(HMDResidentSelectionMode *)&v21 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    uint64_t v10 = [v6 queue];
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    int v12 = NSString;
    uint64_t v13 = [v6 home];
    uint64_t v14 = [v13 uuid];
    uint64_t v15 = [v12 stringWithFormat:@"resident.list.generation/%@", v14];
    backgroundTaskIdentifier = v9->_backgroundTaskIdentifier;
    v9->_backgroundTaskIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v9->_backgroundTaskManager, a4);
    v9->_primaryChangedReason = 0;
    uint64_t v17 = [v6 home];
    BOOL v18 = [v17 homeManager];
    uint64_t v19 = [v18 idsServerBag];
    objc_storeWeak((id *)&v9->_idsServerBag, v19);
  }
  return v9;
}

- (HMDResidentSelectionMode)initWithContext:(id)a3
{
  id v4 = a3;
  double v5 = +[HMDBackgroundTaskManager sharedManager];
  id v6 = [(HMDResidentSelectionMode *)self initWithContext:v4 backgroundTaskManager:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t67 != -1) {
    dispatch_once(&logCategory__hmf_once_t67, &__block_literal_global_99);
  }
  id v2 = (void *)logCategory__hmf_once_v68;
  return v2;
}

void __39__HMDResidentSelectionMode_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v68;
  logCategory__hmf_once_v68 = v0;
}

@end