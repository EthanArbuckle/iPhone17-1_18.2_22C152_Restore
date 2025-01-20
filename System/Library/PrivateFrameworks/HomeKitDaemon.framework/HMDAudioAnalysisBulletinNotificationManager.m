@interface HMDAudioAnalysisBulletinNotificationManager
+ (id)logCategory;
+ (id)registrationsForSource:(id)a3 context:(id)a4;
- (BOOL)multipleLocalRegistrationsForAccessory:(id)a3;
- (HMDAppleAccountManager)accountManager;
- (HMDAudioAnalysisBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5 accountManager:(id)a6 evaluator:(id)a7 notificationCenter:(id)a8;
- (HMDBulletinNotificationRegistrationSource)source;
- (HMDHome)home;
- (HMDNotificationConditionEvaluator)evaluator;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFTimer)synchronizeWithPrimaryDebounceTimer;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext:(id)a3;
- (id)_remoteAudioAnalysisRegistrationsForUUID:(id)a3;
- (id)localRegistrationForAccessory:(id)a3 enabled:(BOOL *)a4;
- (id)logIdentifier;
- (id)registrations;
- (id)synchronizeWithPrimaryDebounceTimerFactory;
- (id)userDevicesToNotify:(id)a3 withEvent:(id)a4;
- (void)_cleanupMultipleRegistrationsAndReplaceWithRegistration:(id)a3 completion:(id)a4;
- (void)_handleAudioAnalysisEventResidentToPrimaryMessage:(id)a3;
- (void)_notifyDevice:(id)a3 event:(id)a4 user:(id)a5;
- (void)_requestSynchronizeRegistrations;
- (void)_synchronizeLocalRegistrationsWithPrimaryResident;
- (void)_updateNotificationRegistration:(id)a3 enabled:(BOOL)a4 completion:(id)a5;
- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4;
- (void)cleanupMultipleRegistrationsAndReplaceWithRegistration:(id)a3 completion:(id)a4;
- (void)configure;
- (void)handleAudioAnalysisEvent:(id)a3;
- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3;
- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3;
- (void)synchronizeLocalRegistrationsWithPrimaryResident;
- (void)timerDidFire:(id)a3;
- (void)updateNotificationRegistration:(id)a3 enabled:(BOOL)a4 completion:(id)a5;
@end

@implementation HMDAudioAnalysisBulletinNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_synchronizeWithPrimaryDebounceTimerFactory, 0);
  objc_storeStrong((id *)&self->_synchronizeWithPrimaryDebounceTimer, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3
{
}

- (id)synchronizeWithPrimaryDebounceTimerFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3
{
}

- (HMFTimer)synchronizeWithPrimaryDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (HMDNotificationConditionEvaluator)evaluator
{
  return (HMDNotificationConditionEvaluator *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (HMDAppleAccountManager)accountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)_mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
  v6 = [v5 appleMediaAccessories];
  v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_65);
  v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_68_93581);

  v9 = +[MKFLocalBulletinAnalysisRegistration fetchRequest];
  id v24 = 0;
  v10 = [v4 executeFetchRequest:v9 error:&v24];
  id v11 = v24;
  if (v10)
  {
    if (![v10 count])
    {
      v12 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v26 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@No local registrations fetched", buf, 0xCu);
      }
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __118__HMDAudioAnalysisBulletinNotificationManager__mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext___block_invoke_69;
    v22[3] = &unk_264A1E178;
    id v23 = v8;
    v16 = objc_msgSend(v10, "na_filter:", v22);
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local registrations, error: %@", buf, 0x16u);
    }
    v16 = (void *)MEMORY[0x263EFFA68];
  }

  return v16;
}

uint64_t __118__HMDAudioAnalysisBulletinNotificationManager__mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext___block_invoke_69(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 accessoryModelID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __118__HMDAudioAnalysisBulletinNotificationManager__mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __118__HMDAudioAnalysisBulletinNotificationManager__mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHomePod];
}

- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating registrations on primary resident, [enabled : %@], [disabled : %@]", buf, 0x20u);
  }
  v13 = [(HMDAudioAnalysisBulletinNotificationManager *)v10 home];
  if ([v13 bulletinNotificationsSupported])
  {
    v14 = [(HMDAudioAnalysisBulletinNotificationManager *)v10 source];
    v15 = v14;
    if (v14)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __123__HMDAudioAnalysisBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke;
      v24[3] = &unk_264A28C88;
      v24[4] = v10;
      id v25 = v14;
      id v26 = v6;
      id v27 = v7;
      [v13 updateBulletinRegistrationOnPrimaryResidentWithSource:v25 enableRegistrations:v26 disableRegistration:v27 completionHandler:v24];
    }
    else
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = v10;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when updating notification registrations", buf, 0xCu);
      }
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = v10;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Bulletin notifications are not supported, only modifying local registrations", buf, 0xCu);
    }
  }
}

void __123__HMDAudioAnalysisBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      int v19 = 138544386;
      v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v3;
      v12 = "%{public}@Unable to update audio analysis registrations resident: source: %@, [enabled : %@], [disabled : %@], error: %@";
      v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 52;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v19, v15);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    int v19 = 138544130;
    v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    v12 = "%{public}@Updating audio analysis registrations primary resident was successful, source: %@, [enabled: %@], [disabled: %@]";
    v13 = v7;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 42;
    goto LABEL_6;
  }
}

- (void)_synchronizeLocalRegistrationsWithPrimaryResident
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronizing local registrations with primary resident", (uint8_t *)&buf, 0xCu);
  }
  v8 = [(HMDAudioAnalysisBulletinNotificationManager *)v5 source];
  if (v8)
  {
    uint64_t v9 = [(HMDAudioAnalysisBulletinNotificationManager *)v5 home];
    uint64_t v10 = [v9 backingStore];
    uint64_t v11 = [v10 context];

    v12 = [v11 managedObjectContext];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__93594;
    v59 = __Block_byref_object_dispose__93595;
    id v60 = [MEMORY[0x263EFF9C0] set];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke;
    v46[3] = &unk_264A2F000;
    v46[4] = v5;
    id v47 = v8;
    id v13 = v12;
    id v48 = v13;
    p_long long buf = &buf;
    [v11 unsafeSynchronousBlock:v46];
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__93594;
    v44 = __Block_byref_object_dispose__93595;
    id v45 = [MEMORY[0x263EFF9C0] set];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3;
    v37[3] = &unk_264A2F698;
    v37[4] = v5;
    id v14 = v13;
    id v38 = v14;
    v39 = &v40;
    uint32_t v15 = (void *)MEMORY[0x230FBD990]([v14 performBlockAndWait:v37]);
    uint64_t v16 = v5;
    HMFGetOSLogHandle();
    uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = v41[5];
      uint64_t v20 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v50 = 138543874;
      v51 = v18;
      __int16 v52 = 2112;
      uint64_t v53 = v19;
      __int16 v54 = 2112;
      uint64_t v55 = v20;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@enabledLocalRegistrations: %@ remoteRegistrations: %@", v50, 0x20u);
    }
    __int16 v21 = [MEMORY[0x263EFF9C0] set];
    uint64_t v22 = (void *)v41[5];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_58;
    v34[3] = &unk_264A1E150;
    v36 = &buf;
    id v23 = v21;
    id v35 = v23;
    objc_msgSend(v22, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v34);
    uint64_t v24 = [MEMORY[0x263EFFA08] setWithSet:*(void *)(*((void *)&buf + 1) + 40)];
    if (objc_msgSend(v23, "hmf_isEmpty") && objc_msgSend(v24, "hmf_isEmpty"))
    {
      __int16 v25 = (void *)MEMORY[0x230FBD990]();
      uint64_t v26 = v16;
      HMFGetOSLogHandle();
      __int16 v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)v50 = 138543362;
        v51 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@No changes detected to sync with primary", v50, 0xCu);
      }
    }
    else
    {
      uint64_t v29 = (void *)[v23 copy];
      [(HMDAudioAnalysisBulletinNotificationManager *)v16 _updateRegistrationsOnPrimaryWithEnabledRegistrations:v29 disabledRegistrations:v24];
    }
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    __int16 v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = v5;
    __int16 v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v33;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when synchronizing registrations with primary", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke(void *a1)
{
  v2 = [(id)objc_opt_class() registrationsForSource:a1[5] context:a1[6]];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2;
  v3[3] = &unk_264A1E0D8;
  v3[4] = a1[7];
  objc_msgSend(v2, "na_each:", v3);
}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4;
  v3[3] = &unk_264A1E100;
  v3[4] = *(void *)(a1 + 48);
  objc_msgSend(v2, "na_each:", v3);
}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_58(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_59;
  v7[3] = &unk_264A1E128;
  id v5 = v3;
  id v8 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  if (v6)
  {
    if (([v5 isEqual:v6] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:v6];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_59(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryUUID];
  uint64_t v4 = [*(id *)(a1 + 32) accessoryUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 enabled])
  {
    id v3 = [[HMDAudioAnalysisEventBulletinNotificationRegistration alloc] initWithLocalBulletinAudioAnalysisRegistration:v4];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v5 = +[HMDBulletinNotificationRegistrationUtilities audioAnalysisNotificationRegistrationFromRemoteRegistration:a2];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [v5 registration];
  [v3 addObject:v4];
}

- (void)_requestSynchronizeRegistrations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDAudioAnalysisBulletinNotificationManager *)v4 synchronizeWithPrimaryDebounceTimer];
    [v7 isRunning];
    id v8 = HMFBooleanToString();
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting synchronize registrations, debounce timer running: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = [(HMDAudioAnalysisBulletinNotificationManager *)v4 synchronizeWithPrimaryDebounceTimer];
  [v9 resume];
}

- (HMDBulletinNotificationRegistrationSource)source
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAudioAnalysisBulletinNotificationManager *)self accountManager];
  id v4 = [v3 account];
  id v5 = [v4 currentDevice];
  id v6 = [v5 deviceAddress];

  if (v6)
  {
    id v7 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
    id v8 = [v7 currentUser];
    uint64_t v9 = [v8 uuid];

    if (v9)
    {
      int v10 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v9 deviceAddress:v6];
    }
    else
    {
      uint32_t v15 = (void *)MEMORY[0x230FBD990]();
      uint64_t v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        __int16 v21 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device user", (uint8_t *)&v20, 0xCu);
      }
      int v10 = 0;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    __int16 v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v20 = 138543362;
      __int16 v21 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device address", (uint8_t *)&v20, 0xCu);
    }
    int v10 = 0;
  }

  return v10;
}

- (void)synchronizeLocalRegistrationsWithPrimaryResident
{
  id v3 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__HMDAudioAnalysisBulletinNotificationManager_synchronizeLocalRegistrationsWithPrimaryResident__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __95__HMDAudioAnalysisBulletinNotificationManager_synchronizeLocalRegistrationsWithPrimaryResident__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestSynchronizeRegistrations];
}

- (id)logIdentifier
{
  v2 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
  id v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)userDevicesToNotify:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  uint64_t v9 = [(HMDAudioAnalysisBulletinNotificationManager *)self _remoteAudioAnalysisRegistrationsForUUID:v8];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__93594;
  int v20 = __Block_byref_object_dispose__93595;
  id v21 = (id)objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__HMDAudioAnalysisBulletinNotificationManager_userDevicesToNotify_withEvent___block_invoke;
  v13[3] = &unk_264A1E0B0;
  v13[4] = self;
  id v10 = v7;
  id v14 = v10;
  uint32_t v15 = &v16;
  objc_msgSend(v9, "na_each:", v13);
  uint64_t v11 = (void *)[(id)v17[5] copy];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __77__HMDAudioAnalysisBulletinNotificationManager_userDevicesToNotify_withEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 registration];
  id v5 = [v3 source];
  id v6 = [v5 device];
  id v7 = [*(id *)(a1 + 32) home];
  id v8 = [v5 userUUID];
  uint64_t v9 = [v7 userWithUUID:v8];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) evaluator];
    uint64_t v11 = [v4 conditions];
    int v12 = [v10 conditionsPass:v11 registrationUser:v9];

    v36 = v9;
    if (v12)
    {
      id v13 = [v3 registration];
      uint64_t v14 = [v13 audioAnalysisClassifierOptions];
      BOOL v15 = ([*(id *)(a1 + 40) reason] & v14) != 0;
    }
    else
    {
      BOOL v15 = 0;
    }
    int v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v23 = v33 = v20;
      uint64_t v24 = [v3 registration];
      [v24 conditions];
      __int16 v25 = v35 = v4;
      HMFBooleanToString();
      BOOL v34 = v15;
      __int16 v27 = v26 = v6;
      *(_DWORD *)long long buf = 138544130;
      v39 = v23;
      __int16 v40 = 2112;
      v41 = v25;
      __int16 v42 = 2112;
      v43 = v27;
      __int16 v44 = 2112;
      id v45 = v26;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@conditions:%@, pass?%@, device:%@", buf, 0x2Au);

      id v4 = v35;
      id v6 = v26;
      BOOL v15 = v34;

      int v20 = v33;
    }

    uint64_t v9 = v36;
    if ((v15 & ~[v6 isCurrentDevice]) == 1 && v6)
    {
      v37[0] = v6;
      id v28 = [v3 source];
      [v28 userUUID];
      v30 = uint64_t v29 = v4;
      v37[1] = v30;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
      v32 = id v31 = v6;

      id v4 = v29;
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v32];

      id v6 = v31;
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      v39 = v19;
      __int16 v40 = 2112;
      v41 = v4;
      __int16 v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to evaluate registration: %@, no matching user for source: %@", buf, 0x20u);
    }
  }
}

- (void)_notifyDevice:(id)a3 event:(id)a4 user:(id)a5
{
  v36[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [HMDRemoteDeviceMessageDestination alloc];
  int v12 = [v9 accessoryUUID];
  id v13 = [(HMDRemoteDeviceMessageDestination *)v11 initWithTarget:v12 device:v8];

  uint64_t v14 = [v9 serialize];
  id v35 = @"HMDAudioAnalysisBulletinDataMessageKey";
  v36[0] = v14;
  BOOL v15 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = self;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    __int16 v30 = v19;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying device:%@, event:%@", buf, 0x20u);
  }
  int v20 = [HMDRemoteMessage alloc];
  if ([v10 isRemoteAccessAllowed]) {
    uint64_t v21 = -1;
  }
  else {
    uint64_t v21 = 14;
  }
  uint64_t v22 = [(HMDRemoteMessage *)v20 initWithName:@"HMDAudioAnalysisPrimaryResidentRouteEventRequestMessage" destination:v13 payload:v15 type:0 timeout:1 secure:v21 restriction:60.0];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __72__HMDAudioAnalysisBulletinNotificationManager__notifyDevice_event_user___block_invoke;
  v26[3] = &unk_264A2AEE8;
  v26[4] = v17;
  id v27 = v8;
  id v28 = v9;
  id v23 = v9;
  id v24 = v8;
  [(HMDRemoteMessage *)v22 setResponseHandler:v26];
  __int16 v25 = [(HMDAudioAnalysisBulletinNotificationManager *)v17 messageDispatcher];
  [v25 sendMessage:v22];
}

void __72__HMDAudioAnalysisBulletinNotificationManager__notifyDevice_event_user___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v20 = 138544130;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      id v27 = v5;
      uint64_t v14 = "%{public}@Failed to notify device:%@ for event:%@ with %@";
      BOOL v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 42;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, (uint8_t *)&v20, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    int v20 = 138543874;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v18;
    __int16 v24 = 2112;
    uint64_t v25 = v19;
    uint64_t v14 = "%{public}@Successfully notified device:%@, event:%@";
    BOOL v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 32;
    goto LABEL_6;
  }
}

- (id)_remoteAudioAnalysisRegistrationsForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint32_t v17 = __Block_byref_object_copy__93594;
  uint64_t v18 = __Block_byref_object_dispose__93595;
  id v19 = (id)MEMORY[0x263EFFA68];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__HMDAudioAnalysisBulletinNotificationManager__remoteAudioAnalysisRegistrationsForUUID___block_invoke;
  v11[3] = &unk_264A2F0A0;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 unsafeSynchronousBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __88__HMDAudioAnalysisBulletinNotificationManager__remoteAudioAnalysisRegistrationsForUUID___block_invoke(uint64_t a1)
{
  id v7 = +[HMCContext findAccessoryWithModelID:*(void *)(a1 + 32)];
  v2 = [v7 analysisEventBulletinRegistrations];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = objc_msgSend(v2, "na_map:", &__block_literal_global_45_93622);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

id __88__HMDAudioAnalysisBulletinNotificationManager__remoteAudioAnalysisRegistrationsForUUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities audioAnalysisNotificationRegistrationFromRemoteRegistration:a2];
}

- (id)registrations
{
  id v3 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessories];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__HMDAudioAnalysisBulletinNotificationManager_registrations__block_invoke;
    v8[3] = &unk_264A1E068;
    v8[4] = self;
    id v6 = objc_msgSend(v5, "na_flatMap:", v8);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

id __60__HMDAudioAnalysisBulletinNotificationManager_registrations__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  uint64_t v4 = [v2 _remoteAudioAnalysisRegistrationsForUUID:v3];

  return v4;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAudioAnalysisBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];

  if (v6 == v4)
  {
    uint64_t v11 = [(HMDAudioAnalysisBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
    [v11 suspend];

    [(HMDAudioAnalysisBulletinNotificationManager *)self _synchronizeLocalRegistrationsWithPrimaryResident];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer, ignoring", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident update notification.", (uint8_t *)&v9, 0xCu);
  }
  [(HMDAudioAnalysisBulletinNotificationManager *)v6 synchronizeLocalRegistrationsWithPrimaryResident];
}

- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling current device or account updated notification", (uint8_t *)&v9, 0xCu);
  }
  [(HMDAudioAnalysisBulletinNotificationManager *)v6 synchronizeLocalRegistrationsWithPrimaryResident];
}

- (void)_handleAudioAnalysisEventResidentToPrimaryMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    __int16 v31 = v8;
    __int16 v32 = 2112;
    id v33 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received audio analysis notification message %@", buf, 0x16u);
  }
  int v9 = [(HMDAudioAnalysisBulletinNotificationManager *)v6 home];
  if ([v9 isCurrentDevicePrimaryResident])
  {
    id v10 = [v4 messagePayload];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"HMDAudioAnalysisBulletinDataMessageKey"];
    int v12 = [[HMDAudioAnalysisEventBulletin alloc] initWithDictionary:v11];
    uint64_t v13 = [(HMDAudioAnalysisEventBulletin *)v12 accessoryUUID];
    uint64_t v14 = [v9 accessoryWithUUID:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v15 = v14;
    }
    else {
      BOOL v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      uint32_t v17 = [(HMDAudioAnalysisBulletinNotificationManager *)v6 userDevicesToNotify:v16 withEvent:v12];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __97__HMDAudioAnalysisBulletinNotificationManager__handleAudioAnalysisEventResidentToPrimaryMessage___block_invoke;
      v28[3] = &unk_264A2CEA8;
      v28[4] = v6;
      uint64_t v29 = v12;
      objc_msgSend(v17, "na_each:", v28);
    }
    else
    {
      __int16 v22 = (void *)MEMORY[0x230FBD990]();
      uint64_t v23 = v6;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        [(HMDAudioAnalysisEventBulletin *)v12 accessoryUUID];
        v26 = id v27 = v22;
        *(_DWORD *)long long buf = 138543618;
        __int16 v31 = v25;
        __int16 v32 = 2112;
        id v33 = v26;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Did not find accessory with UUID:%@", buf, 0x16u);

        __int16 v22 = v27;
      }
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v6;
    int v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      __int16 v31 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Ignoring audio analysis event, current device is not primary", buf, 0xCu);
    }
  }
}

void __97__HMDAudioAnalysisBulletinNotificationManager__handleAudioAnalysisEventResidentToPrimaryMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count] == 2)
  {
    id v4 = [v3 objectAtIndexedSubscript:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;

    id v7 = [v3 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v6) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v17 = 138543874;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        id v20 = v9;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@device:%@, uuid:%@", (uint8_t *)&v17, 0x20u);
      }
    }
    else
    {
      BOOL v15 = [*(id *)(a1 + 32) home];
      id v16 = [v15 userWithUUID:v6];

      if (v16) {
        [*(id *)(a1 + 32) _notifyDevice:v9 event:*(void *)(a1 + 40) user:v16];
      }
    }
  }
}

- (void)_cleanupMultipleRegistrationsAndReplaceWithRegistration:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  BOOL v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    __int16 v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Cleaning up multiple registrations and replacing with registration: %@", buf, 0x16u);
  }
  uint64_t v13 = [(HMDAudioAnalysisBulletinNotificationManager *)v10 home];
  uint64_t v14 = [v13 backingStore];
  BOOL v15 = [v14 context];

  id v16 = [v15 managedObjectContext];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke;
  v20[3] = &unk_264A2EE30;
  id v21 = v6;
  id v22 = v16;
  uint64_t v23 = v10;
  id v24 = v7;
  id v17 = v7;
  id v18 = v16;
  id v19 = v6;
  [v18 performBlock:v20];
}

void __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accessoryUUID];
  id v3 = +[MKFLocalBulletinAnalysisRegistration fetchRequest];
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"accessoryModelID", v2];
  [v3 setPredicate:v4];

  uint64_t v5 = *(void **)(a1 + 40);
  id v30 = 0;
  id v6 = [v5 executeFetchRequest:v3 error:&v30];
  id v7 = v30;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke_2;
  v28[3] = &unk_264A1E040;
  id v29 = *(id *)(a1 + 40);
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);
  id v8 = (void *)MEMORY[0x263EFF240];
  id v9 = +[MKFLocalBulletinAnalysisRegistration entity];
  BOOL v10 = [v9 name];
  uint64_t v11 = [v8 insertNewObjectForEntityForName:v10 inManagedObjectContext:*(void *)(a1 + 40)];

  [v11 setAccessoryModelID:v2];
  objc_msgSend(v11, "setClassifierOptions:", objc_msgSend(*(id *)(a1 + 32), "audioAnalysisClassifierOptions"));
  [v11 setEnabled:1];
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = [*(id *)(a1 + 32) conditions];
  id v14 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v11 moc:v12 conditions:v13];

  BOOL v15 = *(void **)(a1 + 40);
  id v27 = v7;
  int v16 = [v15 save:&v27];
  id v17 = v27;

  id v18 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) reset]);
  id v19 = *(id *)(a1 + 48);
  id v20 = HMFGetOSLogHandle();
  id v21 = v20;
  if (v16)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      __int16 v32 = v22;
      __int16 v33 = 2112;
      uint64_t v34 = v2;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Successfully cleaned up multiple local registrations for accessory UUID: %@", buf, 0x16u);
    }
    uint64_t v23 = [*(id *)(a1 + 48) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke_35;
    block[3] = &unk_264A2F7F8;
    block[4] = *(void *)(a1 + 48);
    dispatch_async(v23, block);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      __int16 v32 = v24;
      __int16 v33 = 2112;
      uint64_t v34 = v2;
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to clean up multiple local registrations for accessory UUID: %@ due to error: %@", buf, 0x20u);
    }
  }
  uint64_t v25 = *(void *)(a1 + 56);
  if (v25) {
    (*(void (**)(uint64_t, id))(v25 + 16))(v25, v17);
  }
}

uint64_t __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

uint64_t __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke_35(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestSynchronizeRegistrations];
}

- (void)cleanupMultipleRegistrationsAndReplaceWithRegistration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__HMDAudioAnalysisBulletinNotificationManager_cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __113__HMDAudioAnalysisBulletinNotificationManager_cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupMultipleRegistrationsAndReplaceWithRegistration:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (BOOL)multipleLocalRegistrationsForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
  id v6 = [v4 home];
  id v7 = [v6 uuid];
  id v8 = [v5 uuid];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v18 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v23, 8);
    _Unwind_Resume(v18);
  }
  id v10 = [v4 uuid];
  uint64_t v11 = [v5 backingStore];
  id v12 = [v11 context];

  id v13 = [v12 managedObjectContext];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __86__HMDAudioAnalysisBulletinNotificationManager_multipleLocalRegistrationsForAccessory___block_invoke;
  v19[3] = &unk_264A2F698;
  id v14 = v10;
  id v20 = v14;
  id v15 = v13;
  id v21 = v15;
  id v22 = &v23;
  [v15 performBlockAndWait:v19];
  char v16 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v16;
}

void __86__HMDAudioAnalysisBulletinNotificationManager_multipleLocalRegistrationsForAccessory___block_invoke(void *a1)
{
  v2 = +[MKFLocalBulletinAnalysisRegistration fetchRequest];
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"accessoryModelID", a1[4]];
  [v2 setPredicate:v3];

  id v4 = (void *)a1[5];
  id v7 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v2 error:&v7];
  id v6 = v7;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (unint64_t)[v5 count] > 1;
}

- (void)_updateNotificationRegistration:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    id v15 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138543874;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating registration: %@ enabled: %@", buf, 0x20u);
  }
  char v16 = [(HMDAudioAnalysisBulletinNotificationManager *)v12 home];
  id v17 = [v16 backingStore];
  id v18 = [v17 context];

  id v19 = [v18 managedObjectContext];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __98__HMDAudioAnalysisBulletinNotificationManager__updateNotificationRegistration_enabled_completion___block_invoke;
  v23[3] = &unk_264A2D340;
  id v24 = v8;
  id v25 = v19;
  BOOL v28 = a4;
  char v26 = v12;
  id v27 = v9;
  id v20 = v9;
  id v21 = v19;
  id v22 = v8;
  [v21 performBlock:v23];
}

void __98__HMDAudioAnalysisBulletinNotificationManager__updateNotificationRegistration_enabled_completion___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = [MEMORY[0x263EFF9C0] set];
  v49 = [*(id *)(a1 + 32) accessoryUUID];
  id v4 = +[MKFLocalBulletinAnalysisRegistration fetchAudioAnalysisModeRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinAnalysisRegistration, "fetchAudioAnalysisModeRegistrationForAccessoryUUID:managedObjectContext:");
  if (!v4)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 48);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = *(void **)(a1 + 32);
      id v15 = HMFBooleanToString();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v53 = v13;
      __int16 v54 = 2112;
      uint64_t v55 = v14;
      __int16 v56 = 2112;
      uint64_t v57 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Local registration doesn't exist for registration: %@ enabled: %@, creating one now", buf, 0x20u);
    }
    char v16 = (void *)MEMORY[0x263EFF240];
    id v17 = +[MKFLocalBulletinAnalysisRegistration entity];
    id v18 = [v17 name];
    uint64_t v5 = [v16 insertNewObjectForEntityForName:v18 inManagedObjectContext:*(void *)(a1 + 40)];

    [v5 setAccessoryModelID:v49];
    objc_msgSend(v5, "setClassifierOptions:", objc_msgSend(*(id *)(a1 + 32), "audioAnalysisClassifierOptions"));
    [v5 setEnabled:*(unsigned __int8 *)(a1 + 64)];
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  int v6 = [v4 enabled];
  int v7 = *(unsigned __int8 *)(a1 + 64);
  BOOL v8 = v7 != v6;
  if (v7 != v6) {
    [v5 setEnabled:v7 != 0];
  }
  uint64_t v9 = [v5 classifierOptions];
  if (v9 != [*(id *)(a1 + 32) audioAnalysisClassifierOptions])
  {
    objc_msgSend(v5, "setClassifierOptions:", objc_msgSend(*(id *)(a1 + 32), "audioAnalysisClassifierOptions"));
LABEL_9:
    BOOL v8 = 1;
  }
  id v19 = [v5 conditions];
  id v20 = [MEMORY[0x263EFFA08] set];
  if (v19)
  {
    uint64_t v21 = +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:v19];

    id v20 = (void *)v21;
  }
  id v22 = [*(id *)(a1 + 32) conditions];
  char v23 = [v20 isEqualToSet:v22];

  if (v23)
  {
    if (!v8) {
      goto LABEL_22;
    }
  }
  else
  {
    if (v19) {
      [v5 removeConditions:v19];
    }
    uint64_t v24 = *(void *)(a1 + 40);
    id v25 = [*(id *)(a1 + 32) conditions];
    id v26 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v5 moc:v24 conditions:v25];
  }
  if (*(unsigned char *)(a1 + 64)) {
    id v27 = v2;
  }
  else {
    id v27 = v3;
  }
  [v27 addObject:*(void *)(a1 + 32)];
LABEL_22:
  if (objc_msgSend(v2, "hmf_isEmpty") && objc_msgSend(v3, "hmf_isEmpty"))
  {
    BOOL v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 48);
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      __int16 v31 = v2;
      v33 = id v32 = v3;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v53 = v33;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Skipping save and not messaging primary because notification registration update resulted in no changes", buf, 0xCu);

      id v3 = v32;
      v2 = v31;
    }

    uint64_t v34 = *(void *)(a1 + 56);
    if (v34) {
      (*(void (**)(uint64_t, void))(v34 + 16))(v34, 0);
    }
  }
  else
  {
    id v47 = v2;
    uint64_t v35 = v3;
    id v36 = *(void **)(a1 + 40);
    id v51 = 0;
    int v37 = objc_msgSend(v36, "save:", &v51, v47);
    id v38 = v51;
    v39 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) reset]);
    id v40 = *(id *)(a1 + 48);
    v41 = HMFGetOSLogHandle();
    __int16 v42 = v41;
    if (v37)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v53 = v43;
        __int16 v54 = 2112;
        uint64_t v55 = v48;
        __int16 v56 = 2112;
        uint64_t v57 = v35;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Successfully updated local enabled registrations: %@, disabled registrations: %@", buf, 0x20u);
      }
      __int16 v44 = [*(id *)(a1 + 48) workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __98__HMDAudioAnalysisBulletinNotificationManager__updateNotificationRegistration_enabled_completion___block_invoke_26;
      block[3] = &unk_264A2F7F8;
      block[4] = *(void *)(a1 + 48);
      dispatch_async(v44, block);
    }
    else
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v45 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138544130;
        uint64_t v53 = v45;
        __int16 v54 = 2112;
        uint64_t v55 = v48;
        __int16 v56 = 2112;
        uint64_t v57 = v35;
        __int16 v58 = 2112;
        id v59 = v38;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to update local enabled registrations: %@, disabled registrations: %@ due to error: %@", buf, 0x2Au);
      }
    }
    uint64_t v46 = *(void *)(a1 + 56);
    id v3 = v35;
    if (v46) {
      (*(void (**)(uint64_t, id))(v46 + 16))(v46, v38);
    }

    v2 = v48;
  }
}

uint64_t __98__HMDAudioAnalysisBulletinNotificationManager__updateNotificationRegistration_enabled_completion___block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestSynchronizeRegistrations];
}

- (void)updateNotificationRegistration:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __97__HMDAudioAnalysisBulletinNotificationManager_updateNotificationRegistration_enabled_completion___block_invoke;
  v13[3] = &unk_264A2B340;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __97__HMDAudioAnalysisBulletinNotificationManager_updateNotificationRegistration_enabled_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNotificationRegistration:*(void *)(a1 + 40) enabled:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (id)localRegistrationForAccessory:(id)a3 enabled:(BOOL *)a4
{
  id v6 = a3;
  int v7 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
  id v8 = [v6 home];
  id v9 = [v8 uuid];
  id v10 = [v7 uuid];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    id v19 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);
    _Unwind_Resume(v19);
  }
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__93594;
  __int16 v33 = __Block_byref_object_dispose__93595;
  id v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v12 = [v7 backingStore];
  id v13 = [v12 context];

  id v14 = [v13 managedObjectContext];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __85__HMDAudioAnalysisBulletinNotificationManager_localRegistrationForAccessory_enabled___block_invoke;
  v20[3] = &unk_264A2ADD0;
  id v15 = v6;
  id v21 = v15;
  id v16 = v14;
  id v22 = v16;
  char v23 = &v29;
  uint64_t v24 = &v25;
  [v16 performBlockAndWait:v20];
  if (a4) {
    *a4 = *((unsigned char *)v26 + 24);
  }
  id v17 = (id)v30[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

void __85__HMDAudioAnalysisBulletinNotificationManager_localRegistrationForAccessory_enabled___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  id v6 = +[MKFLocalBulletinAnalysisRegistration fetchAudioAnalysisModeRegistrationForAccessoryUUID:v2 managedObjectContext:*(void *)(a1 + 40)];

  if (v6)
  {
    id v3 = [[HMDAudioAnalysisEventBulletinNotificationRegistration alloc] initWithLocalBulletinAudioAnalysisRegistration:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v6 enabled];
  }
}

- (void)handleAudioAnalysisEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 primaryResident];
    id v8 = [HMDRemoteDeviceMessageDestination alloc];
    id v9 = [(HMDAudioAnalysisBulletinNotificationManager *)self messageTargetUUID];
    id v10 = [v7 device];
    char v11 = [(HMDRemoteDeviceMessageDestination *)v8 initWithTarget:v9 device:v10];

    id v12 = +[HMDRemoteMessage messageWithName:@"HMDAudioAnalysisResidentToPrimaryEventRequestMessage" destination:v11 payload:v4];
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v22 = 138543618;
      char v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Routing message from resident to primary, %@", (uint8_t *)&v22, 0x16u);
    }
    if ([v6 isCurrentDeviceConfirmedPrimaryResident])
    {
      [(HMDAudioAnalysisBulletinNotificationManager *)v14 _handleAudioAnalysisEventResidentToPrimaryMessage:v12];
    }
    else
    {
      id v21 = [(HMDAudioAnalysisBulletinNotificationManager *)v14 messageDispatcher];
      [v21 sendMessage:v12];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v22 = 138543362;
      char v23 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@nil home", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)configure
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAudioAnalysisBulletinNotificationManager *)self home];
  if (v3)
  {
    id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    [v4 setTransportRestriction:8];
    uint64_t v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 3, 0, v4);
    v25[1] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];

    int v7 = [(HMDAudioAnalysisBulletinNotificationManager *)self messageDispatcher];
    [v7 registerForMessage:@"HMDAudioAnalysisResidentToPrimaryEventRequestMessage" receiver:self policies:v6 selector:sel__handleAudioAnalysisEventResidentToPrimaryMessage_];

    id v8 = [(HMDAudioAnalysisBulletinNotificationManager *)self notificationCenter];
    id v9 = [(HMDAudioAnalysisBulletinNotificationManager *)self accountManager];
    [v8 addObserver:self selector:sel_handleCurrentDeviceOrAccountUpdatedNotification_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v9];

    id v10 = [(HMDAudioAnalysisBulletinNotificationManager *)self notificationCenter];
    char v11 = [(HMDAudioAnalysisBulletinNotificationManager *)self accountManager];
    [v10 addObserver:self selector:sel_handleCurrentDeviceOrAccountUpdatedNotification_ name:@"HMDAppleAccountManagerAccountUpdatedNotification" object:v11];

    id v12 = [(HMDAudioAnalysisBulletinNotificationManager *)self notificationCenter];
    id v13 = [v3 residentDeviceManager];
    [v12 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v13];

    id v14 = [(HMDAudioAnalysisBulletinNotificationManager *)self notificationCenter];
    id v15 = [v3 residentDeviceManager];
    [v14 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:v15];

    id v16 = [(HMDAudioAnalysisBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimerFactory];
    id v17 = v16[2](v16, 28, 5.0);
    [(HMDAudioAnalysisBulletinNotificationManager *)self setSynchronizeWithPrimaryDebounceTimer:v17];

    id v18 = [(HMDAudioAnalysisBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
    [v18 setDelegate:self];

    id v19 = [(HMDAudioAnalysisBulletinNotificationManager *)self workQueue];
    id v20 = [(HMDAudioAnalysisBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
    [v20 setDelegateQueue:v19];
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    int v22 = self;
    char v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v27 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil home on configure", buf, 0xCu);
    }
  }
}

- (HMDAudioAnalysisBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5 accountManager:(id)a6 evaluator:(id)a7 notificationCenter:(id)a8
{
  id v14 = a3;
  id v25 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMDAudioAnalysisBulletinNotificationManager;
  id v18 = [(HMDAudioAnalysisBulletinNotificationManager *)&v26 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v19->_messageDispatcher, a5);
    objc_storeStrong((id *)&v19->_accountManager, a6);
    objc_storeStrong((id *)&v19->_evaluator, a7);
    objc_storeStrong((id *)&v19->_notificationCenter, a8);
    uint64_t v20 = objc_msgSend(v14, "uuid", v24, v25);
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v20;

    objc_storeWeak((id *)&v19->_home, v14);
    id synchronizeWithPrimaryDebounceTimerFactory = v19->_synchronizeWithPrimaryDebounceTimerFactory;
    v19->_id synchronizeWithPrimaryDebounceTimerFactory = &__block_literal_global_93668;
  }
  return v19;
}

id __132__HMDAudioAnalysisBulletinNotificationManager_initWithHome_workQueue_messageDispatcher_accountManager_evaluator_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)registrationsForSource:(id)a3 context:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_MKFAnalysisEventBulletinRegistration fetchRequest];
  id v9 = (void *)MEMORY[0x263F08A98];
  id v10 = [v6 userUUID];
  char v11 = [v6 deviceAddress];
  id v12 = [v11 idsIdentifier];
  id v13 = [v6 deviceAddress];
  id v14 = [v13 idsDestination];
  id v15 = [v9 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@)", @"user.modelID", v10, @"deviceIdsIdentifier", v12, @"deviceIdsDestination", v14];
  [v8 setPredicate:v15];

  id v24 = 0;
  id v16 = [v7 executeFetchRequest:v8 error:&v24];
  id v17 = v24;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      objc_super v26 = v22;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch audio analysis bulletin registrations for source: %@", buf, 0x16u);
    }
    id v18 = (id)MEMORY[0x263EFFA68];
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_93690 != -1) {
    dispatch_once(&logCategory__hmf_once_t27_93690, &__block_literal_global_51_93691);
  }
  v2 = (void *)logCategory__hmf_once_v28_93692;
  return v2;
}

void __58__HMDAudioAnalysisBulletinNotificationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v28_93692;
  logCategory__hmf_once_v28_93692 = v0;
}

@end