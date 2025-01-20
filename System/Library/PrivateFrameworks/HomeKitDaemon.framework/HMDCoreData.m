@interface HMDCoreData
+ (BOOL)isDatabaseCorruptedFromError:(id)a3;
+ (BOOL)isDiskFullFromError:(id)a3;
+ (BOOL)isUsingProductionObjectModel;
+ (HMDCoreData)sharedInstance;
+ (HMDFeaturesDataSource)featuresDataSource;
+ (NSArray)defaultPersistentStoreDescriptions;
+ (NSArray)entitiesExcludedFromWorkingStoreHistory;
+ (NSManagedObjectModel)managedObjectModel;
+ (NSPersistentStoreDescription)cloudPrivateStoreDescription;
+ (NSPersistentStoreDescription)cloudSharedStoreDescription;
+ (NSPersistentStoreDescription)localStoreDescription;
+ (NSPersistentStoreDescription)workingStoreDescription;
+ (NSURL)managedObjectModelURL;
+ (__CFString)afterTimeInterval:(double)a1;
+ (id)_storeDescriptionForConfiguration:(void *)a3 storeName:;
+ (id)createWithPersistentStoreDescriptions:(id)a3;
+ (id)createWithPersistentStoreDescriptions:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5;
+ (id)getPersistentCloudKitContainerOptionsForStore:(id)a3 userDefaults:(id)a4;
+ (id)logCategory;
+ (id)productionManagedObjectModelURL;
+ (id)sharedInstanceWithoutLiveCloudKit;
+ (id)storeNameForConfiguration:(id)a3;
+ (id)userInitiatedCKOperationConfiguration;
+ (id)userInitiatedVoucherWithLabel:(id)a3 forEventsOfType:(int64_t)a4 affectingObjectsMatching:(id)a5;
+ (uint64_t)isError:(void *)a3 domain:(void *)a4 fromError:;
+ (void)cleanUpSharedInstance;
- (BOOL)_pruneStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan:(int64_t)a3 storeType:(unint64_t)a4;
- (BOOL)_shouldPruneCloudStoreHistory;
- (BOOL)_shouldPruneWorkingStoreHistory;
- (BOOL)isRelatedContext:(id)a3;
- (HMCContext)contextWithRootPartition;
- (HMDCoreData)initWithCloudKitContainer:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5;
- (HMDCoreData)initWithPersistentStoreDescriptions:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5;
- (HMFFuture)firstCloudKitImportFuture;
- (NSNotificationCenter)notificationCenter;
- (NSPersistentCloudKitContainer)container;
- (NSPersistentStore)cloudPrivateStore;
- (NSPersistentStore)cloudSharedStore;
- (NSPersistentStore)localStore;
- (NSPersistentStore)workingStore;
- (NSPersistentStoreCoordinator)coordinator;
- (NSSet)allContexts;
- (id)_currentNotificationListeners;
- (id)contextWithHomeUUID:(id)a3;
- (id)dumpCloudKitConfiguration:(BOOL)a3 localConfiguration:(BOOL)a4 workingConfiguration:(BOOL)a5 includeFakeModels:(BOOL)a6 context:(id)a7 error:(id *)a8;
- (id)dumpConfiguration:(id)a3 includeFakeModels:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (id)newManagedObjectContext;
- (void)_checkFirstCloudKitImportComplete;
- (void)_handleChangeNotification:(id)a3;
- (void)_handleDidResetSyncNotification:(id)a3;
- (void)_handlePersistentCloudKitContainerActivityChangedNotification:(id)a3;
- (void)_handlePersistentCloudKitContainerEventChangedNotification:(id)a3;
- (void)_handleWillResetSyncNotification:(id)a3;
- (void)_markFirstCloudKitImportComplete;
- (void)_resolveFirstCloudKitImportPromise;
- (void)addNotificationListener:(id)a3;
- (void)applyVoucherForModel:(id)a3 withModelID:(id)a4 eventType:(int64_t)a5 storeType:(unint64_t)a6;
- (void)removeNotificationListener:(id)a3;
- (void)startLoadingStores;
- (void)startWatchingManagedObjectChanges;
- (void)stopWatchingManagedObjectChanges;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCoreData

void __46__HMDCoreData_productionManagedObjectModelURL__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 URLForResource:@"HomeKitCoreDataModel" withExtension:@"momd"];
  v4 = (void *)productionManagedObjectModelURL_sProductionURL;
  productionManagedObjectModelURL_sProductionURL = v3;

  if (!productionManagedObjectModelURL_sProductionURL)
  {
    uint64_t v5 = self;
    *(void *)v19 = MEMORY[0x263EF8330];
    *(void *)&v19[8] = 3221225472;
    *(void *)&v19[16] = __47__HMDCoreData_developmentManagedObjectModelURL__block_invoke;
    v20 = (__CFString *)&__block_descriptor_40_e5_v8__0l;
    *(void *)v21 = v5;
    if (developmentManagedObjectModelURL_onceTokenForBundle != -1) {
      dispatch_once(&developmentManagedObjectModelURL_onceTokenForBundle, v19);
    }
    id v6 = (id)developmentManagedObjectModelURL_developmentManagedObjectModelURL;
    v7 = objc_msgSend(v6, "path", *(void *)v19, *(void *)&v19[8], *(void *)&v19[16], v20, *(void *)v21);

    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)v19 = 138544386;
      *(void *)&v19[4] = v11;
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = @"HomeKitCoreDataModel";
      *(_WORD *)&v19[22] = 2112;
      v20 = @"momd";
      *(_WORD *)v21 = 2112;
      *(void *)&v21[2] = v2;
      __int16 v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to find [%@.%@] in bundle [%@]. Going to look into development momd directory: %@", v19, 0x34u);
    }
    v12 = [MEMORY[0x263F086E0] pathForResource:@"Production" ofType:@"mom" inDirectory:v7];
    uint64_t v13 = [objc_alloc(NSURL) initFileURLWithPath:v12];
    v14 = (void *)productionManagedObjectModelURL_sProductionURL;
    productionManagedObjectModelURL_sProductionURL = v13;
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = *(id *)(a1 + 32);
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)v19 = 138543618;
    *(void *)&v19[4] = v18;
    *(_WORD *)&v19[12] = 2112;
    *(void *)&v19[14] = productionManagedObjectModelURL_sProductionURL;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Production URL: %@", v19, 0x16u);
  }
}

void __36__HMDCoreData_managedObjectModelURL__block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = +[HMDFeaturesDataSource defaultDataSource];
  v0 = self;
  if (isInternalBuild())
  {
    v1 = (void *)MEMORY[0x230FBD990]();
    id v2 = v0;
    uint64_t v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = v7;
      __int16 v12 = 1024;
      int v13 = 0;
      _os_log_impl(&dword_22F52A000, v3, OS_LOG_TYPE_INFO, "%{public}@%@, HomeAS: %{BOOL}d", buf, 0x1Cu);
    }
  }

  uint64_t v5 = +[HMDCoreData productionManagedObjectModelURL]();
  id v6 = (void *)managedObjectModelURL_managedObjectModelURL;
  managedObjectModelURL_managedObjectModelURL = v5;

  if (!managedObjectModelURL_managedObjectModelURL) {
    _HMFPreconditionFailure();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstCloudKitImportFuture, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_activityLogEvent, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityTimedOutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_firstCloudKitImportPromise, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_cloudSharedStore, 0);
  objc_storeStrong((id *)&self->_cloudPrivateStore, 0);
  objc_storeStrong((id *)&self->_workingStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMFFuture)firstCloudKitImportFuture
{
  return self->_firstCloudKitImportFuture;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSPersistentStore)localStore
{
  return self->_localStore;
}

- (NSPersistentStore)cloudSharedStore
{
  return self->_cloudSharedStore;
}

- (NSPersistentStore)cloudPrivateStore
{
  return self->_cloudPrivateStore;
}

- (NSPersistentStore)workingStore
{
  return self->_workingStore;
}

- (NSPersistentCloudKitContainer)container
{
  return self->_container;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  uint64_t v5 = (HMFTimer *)a3;
  dispatch_assert_queue_V2(queue);
  activityTimedOutTimer = self->_activityTimedOutTimer;

  if (activityTimedOutTimer == v5)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v7 = self->_activityLogEvent;
    if (v7)
    {
      BOOL firstSetupActivity = self->_firstSetupActivity;

      if (firstSetupActivity)
      {
        id v9 = (void *)MEMORY[0x230FBD990]();
        __int16 v10 = self;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          __int16 v12 = HMFGetLogIdentifier();
          activityLogEvent = v10->_activityLogEvent;
          int v18 = 138543618;
          v19 = v12;
          __int16 v20 = 2112;
          v21 = activityLogEvent;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Cloudkit setup activity timedout. Submit cloudkit setup activity metric %@", (uint8_t *)&v18, 0x16u);
        }
        uint64_t v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:13];
        v15 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v15 submitLogEvent:v10->_activityLogEvent error:v14];

        v10->_BOOL firstSetupActivity = 0;
        id v16 = v10->_activityLogEvent;
        v10->_activityLogEvent = 0;

        activityIdentifier = v10->_activityIdentifier;
        v10->_activityIdentifier = 0;
      }
    }
    objc_storeStrong((id *)&self->_activityTimedOutTimer, 0);
  }
}

- (void)_handlePersistentCloudKitContainerActivityChangedNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__HMDCoreData__handlePersistentCloudKitContainerActivityChangedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __77__HMDCoreData__handlePersistentCloudKitContainerActivityChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && (*(unsigned char *)(v1 + 35) & 1) != 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) userInfo];
    id v4 = [v3 objectForKeyedSubscript:@"activityDictionary"];

    if (!v4)
    {
      v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = *(id *)(a1 + 32);
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        v31 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v74 = v30;
        __int16 v75 = 2112;
        v76 = v31;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@No activityDictionary for notification: %@", buf, 0x16u);
      }
      goto LABEL_42;
    }
    uint64_t v5 = [[HMDCoreDataCloudKitSetupActivity alloc] initWithDictionary:v4];
    id v6 = [(HMDCoreDataCloudKitSetupActivity *)v5 activityType];

    if (!v6)
    {
      v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = *(id *)(a1 + 32);
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v74 = v35;
        __int16 v75 = 2112;
        v76 = v4;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@No activity type for activityDictionary: %@", buf, 0x16u);
      }
      goto LABEL_41;
    }
    id v7 = [(HMDCoreDataCloudKitSetupActivity *)v5 activityType];
    int v8 = [v7 isEqual:@"event"];

    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      __int16 v10 = v5;
      if (!v9) {
        goto LABEL_40;
      }
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v9 + 120));
      id v11 = [(HMDCoreDataCloudKitSetupActivity *)v10 endDate];

      if (v11)
      {
        if (*(unsigned char *)(v9 + 35))
        {
          __int16 v12 = [(HMDCoreDataCloudKitSetupActivity *)v10 endDate];
          int v13 = [(HMDCoreDataCloudKitSetupActivity *)v10 startDate];
          [v12 timeIntervalSinceDate:v13];
          double v15 = v14;

          id v16 = &OBJC_IVAR___HMDUserActivityType3StateLogEvent__logReason;
          id v17 = *(id *)(v9 + 144);
          int v18 = [(HMDCoreDataCloudKitSetupActivity *)v10 activityType];
          [v17 setDurationForPhase:v18 duration:v15];

          v19 = [(HMDCoreDataCloudKitSetupActivity *)v10 error];

          __int16 v20 = (void *)MEMORY[0x230FBD990]();
          v21 = (char *)(id)v9;
          uint64_t v22 = HMFGetOSLogHandle();
          v23 = v22;
          if (v19)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v24 = HMFGetLogIdentifier();
              v25 = (void *)*((void *)v21 + 18);
              id v72 = v25;
              v26 = [(HMDCoreDataCloudKitSetupActivity *)v10 error];
              *(_DWORD *)buf = 138543874;
              v74 = v24;
              __int16 v75 = 2112;
              v76 = v25;
              id v16 = &OBJC_IVAR___HMDUserActivityType3StateLogEvent__logReason;
              __int16 v77 = 2112;
              v78 = v26;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Submit cloudkit setup activity metric %@, with error: %@", buf, 0x20u);

LABEL_36:
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = HMFGetLogIdentifier();
            v67 = (void *)*((void *)v21 + 18);
            *(_DWORD *)buf = 138543618;
            v74 = v24;
            __int16 v75 = 2112;
            v76 = v67;
            _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Submit cloudkit setup activity metric %@", buf, 0x16u);
            goto LABEL_36;
          }

          v68 = +[HMDMetricsManager sharedLogEventSubmitter];
          id v69 = *(id *)&v21[v16[232]];
          v70 = [(HMDCoreDataCloudKitSetupActivity *)v10 error];
          [v68 submitLogEvent:v69 error:v70];

          objc_storeStrong((id *)&v21[v16[232]], 0);
          objc_storeStrong((id *)v21 + 17, 0);
          v21[35] = 0;
        }
LABEL_40:

        goto LABEL_41;
      }
      if (*(void *)(v9 + 136))
      {
        uint64_t v51 = MEMORY[0x230FBD990]();
        id v52 = (id)v9;
        v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v74 = v54;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Cloudkit setup activity is ongoing", buf, 0xCu);
        }
        v55 = (void *)v51;
LABEL_32:
        goto LABEL_40;
      }
      v60 = +[HMDMainDriver driver];
      v61 = [v60 currentAccessorySetupMetricDispatcher];
      v49 = [v61 setupSessionIdentifier];

      v62 = [HMDCoreDataCloudKitSetupActivityLogEvent alloc];
      v63 = [(HMDCoreDataCloudKitSetupActivity *)v10 identifier];
      v64 = [(HMDCoreDataCloudKitSetupActivityLogEvent *)v62 initWithActivityIdentifier:v63 setupSessionIdentifier:v49];
      objc_storeStrong((id *)(v9 + 144), v64);

      v65 = [(HMDCoreDataCloudKitSetupActivity *)v10 identifier];
      objc_storeStrong((id *)(v9 + 136), v65);

      v66 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:900.0];
      objc_storeStrong((id *)(v9 + 128), v66);

      [*(id *)(v9 + 128) setDelegate:v9];
      [*(id *)(v9 + 128) setDelegateQueue:*(void *)(v9 + 120)];
      [*(id *)(v9 + 128) resume];
    }
    else
    {
      v36 = [(HMDCoreDataCloudKitSetupActivity *)v5 activityType];
      int v37 = [v36 isEqual:@"setup-phase"];

      if (!v37)
      {
LABEL_41:

LABEL_42:
        return;
      }
      uint64_t v38 = *(void *)(a1 + 32);
      __int16 v10 = v5;
      if (!v38) {
        goto LABEL_40;
      }
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v38 + 120));
      if (!*(void *)(v38 + 136)) {
        goto LABEL_40;
      }
      v39 = [(HMDCoreDataCloudKitSetupActivity *)v10 parentActivityIdentifier];
      char v40 = [v39 isEqual:*(void *)(v38 + 136)];

      if ((v40 & 1) == 0)
      {
        uint64_t v56 = MEMORY[0x230FBD990]();
        id v57 = (id)v38;
        v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v74 = v59;
          _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Received setup-phase of different Cloudkit setup activity", buf, 0xCu);
        }
        v55 = (void *)v56;
        goto LABEL_32;
      }
      v41 = [(HMDCoreDataCloudKitSetupActivity *)v10 endDate];

      if (v41)
      {
        v42 = [(HMDCoreDataCloudKitSetupActivity *)v10 endDate];
        v43 = [(HMDCoreDataCloudKitSetupActivity *)v10 startDate];
        [v42 timeIntervalSinceDate:v43];
        double v45 = v44;

        id v46 = *(id *)(v38 + 144);
        v47 = [(HMDCoreDataCloudKitSetupActivity *)v10 phase];
        [v46 setDurationForPhase:v47 duration:v45];

        if ([(HMDCoreDataCloudKitSetupActivity *)v10 succeeded]) {
          goto LABEL_40;
        }
        id v48 = *(id *)(v38 + 144);
        v49 = [(HMDCoreDataCloudKitSetupActivity *)v10 phase];
        v50 = [(HMDCoreDataCloudKitSetupActivity *)v10 error];
        [v48 setErrorForPhase:v49 error:v50];
      }
      else
      {
        id v71 = *(id *)(v38 + 144);
        v49 = [(HMDCoreDataCloudKitSetupActivity *)v10 phase];
        [v71 setDurationForPhase:v49 duration:-1.0];
      }
    }

    goto LABEL_40;
  }
}

- (id)dumpCloudKitConfiguration:(BOOL)a3 localConfiguration:(BOOL)a4 workingConfiguration:(BOOL)a5 includeFakeModels:(BOOL)a6 context:(id)a7 error:(id *)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  BOOL v12 = a3;
  id v14 = a7;
  double v15 = [MEMORY[0x263EFF980] arrayWithCapacity:v11 + (unint64_t)v12 + v10];
  if (v11)
  {
    uint64_t v16 = [(HMDCoreData *)self dumpConfiguration:@"Local" includeFakeModels:1 context:v14 error:a8];
    if (!v16) {
      goto LABEL_11;
    }
    id v17 = (void *)v16;
    [v15 addObject:v16];
  }
  if (v10)
  {
    uint64_t v18 = [(HMDCoreData *)self dumpConfiguration:@"Working" includeFakeModels:1 context:v14 error:a8];
    if (v18)
    {
      v19 = (void *)v18;
      [v15 addObject:v18];

      goto LABEL_7;
    }
LABEL_11:
    __int16 v20 = 0;
    goto LABEL_12;
  }
LABEL_7:
  if (v12)
  {
    __int16 v20 = [(HMDCoreData *)self dumpConfiguration:@"CloudKit" includeFakeModels:v9 context:v14 error:a8];
    if (!v20) {
      goto LABEL_12;
    }
    [v15 addObject:v20];
  }
  __int16 v20 = [v15 componentsJoinedByString:@"\n"];
LABEL_12:

  return v20;
}

- (id)dumpConfiguration:(id)a3 includeFakeModels:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = (void *)MEMORY[0x230FBD990]();
  BOOL v12 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__89639;
  v36 = __Block_byref_object_dispose__89640;
  id v37 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke;
  v26[3] = &unk_264A1DE50;
  id v13 = v10;
  id v27 = v13;
  id v14 = v9;
  id v28 = v14;
  v30 = &v32;
  BOOL v31 = a4;
  id v15 = v12;
  id v29 = v15;
  [v13 performBlockAndWait:v26];
  uint64_t v16 = (void *)v33[5];
  if (v16)
  {
    id v17 = 0;
    if (a6) {
      *a6 = v16;
    }
  }
  else
  {
    uint64_t v18 = [v15 allKeys];
    v19 = [v18 sortedArrayUsingSelector:sel_compare_];

    __int16 v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_6;
    v23[3] = &unk_264A1DE78;
    id v21 = v20;
    id v24 = v21;
    id v25 = v15;
    objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    id v17 = [v21 componentsJoinedByString:@"\n"];
  }
  _Block_object_dispose(&v32, 8);

  return v17;
}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x230FBD990]();
  uint64_t v3 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v4 = [v3 managedObjectModel];
  uint64_t v5 = [v4 entitiesForConfiguration:*(void *)(a1 + 40)];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_2;
  v8[3] = &unk_264A1DE28;
  id v9 = *(id *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v7;
  long long v10 = v7;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  [v2 addObject:v3];
}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([v6 isAbstract] & 1) == 0)
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__89639;
    id v28 = __Block_byref_object_dispose__89640;
    id v29 = 0;
    long long v7 = [v6 relationshipsByName];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_3;
    v23[3] = &unk_264A1DDB0;
    void v23[4] = &v24;
    [v7 enumerateKeysAndObjectsUsingBlock:v23];

    id v8 = objc_alloc(MEMORY[0x263EFF260]);
    id v9 = [v6 name];
    long long v10 = (void *)[v8 initWithEntityName:v9];

    [v10 setFetchBatchSize:10];
    [v10 setReturnsObjectsAsFaults:0];
    if (v25[5]) {
      objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:");
    }
    char v11 = *(void **)(a1 + 32);
    id v22 = 0;
    BOOL v12 = [v11 executeFetchRequest:v10 error:&v22];
    id v13 = v22;
    id v14 = v13;
    if (v12)
    {
      if ([v12 count])
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_4;
        v18[3] = &unk_264A1DE00;
        char v21 = *(unsigned char *)(a1 + 56);
        __int16 v20 = &v24;
        id v19 = *(id *)(a1 + 40);
        objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
      }
    }
    else
    {
      uint64_t v15 = HMDSanitizeCoreDataError(v13);
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      *a4 = 1;
    }

    _Block_object_dispose(&v24, 8);
  }
}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if ([a3 isToMany])
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x263EFF980] array];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v5 addObject:v9];
  }
}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) ? (id v4 = 0) : (id v4 = v3),
        id v5 = v4,
        char v6 = [v5 isFake],
        v5,
        (v6 & 1) == 0))
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_5;
    v12[3] = &unk_264A1DDD8;
    id v8 = v3;
    id v13 = v8;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);
    id v9 = [v8 debugDescription];
    long long v10 = *(void **)(a1 + 32);
    char v11 = [v8 objectID];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) valueForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  [v4 count];
}

- (void)removeNotificationListener:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)self->_listeners removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addNotificationListener:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)self->_listeners addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSSet)allContexts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v4, 88, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  uint64_t v7 = [v6 dictionaryRepresentation];

  os_unfair_lock_unlock(p_lock);
  id v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = [v7 allValues];
  long long v10 = [v8 setWithArray:v9];

  return (NSSet *)v10;
}

- (BOOL)isRelatedContext:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCoreData *)self coordinator];
  if (v4)
  {
    do
    {
      id v6 = [v4 persistentStoreCoordinator];

      BOOL v7 = v6 == v5;
      if (v7) {
        break;
      }
      uint64_t v8 = [v4 parentContext];

      id v4 = (id)v8;
    }
    while (v8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)contextWithHomeUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v6, 88, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = Property;
  id v9 = [v8 objectForKey:v4];

  if (!v9)
  {
    long long v10 = HMDWorkingContextNameForHomeUUID(v4);
    id v9 = __contextWithContextName(self, v10);

    if (self) {
      id v12 = objc_getProperty(self, v11, 88, 1);
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    [v13 setObject:v9 forKey:v4];
  }
  id v14 = v9;

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (HMCContext)contextWithRootPartition
{
  id v3 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v5, 88, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  id v8 = [v7 objectForKey:v3];

  if (!v8)
  {
    id v8 = __contextWithContextName(self, @"HomeManager");
    if (self) {
      id v10 = objc_getProperty(self, v9, 88, 1);
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    [v11 setObject:v8 forKey:v3];
  }
  os_unfair_lock_unlock(p_lock);

  return (HMCContext *)v8;
}

- (id)newManagedObjectContext
{
  id v3 = [[HMDManagedObjectContext alloc] initWithConcurrencyType:1];
  id v4 = [(HMDCoreData *)self coordinator];
  [(HMDManagedObjectContext *)v3 setPersistentStoreCoordinator:v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__HMDCoreData_newManagedObjectContext__block_invoke;
  v8[3] = &unk_264A2F820;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  [(HMDManagedObjectContext *)v5 performBlockAndWait:v8];
  id v6 = v5;

  return v6;
}

void __38__HMDCoreData_newManagedObjectContext__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x230FBD990]();
  objc_msgSend(*(id *)(a1 + 32), "setHmd_coreData:", *(void *)(a1 + 40));
}

- (NSPersistentStoreCoordinator)coordinator
{
  id v2 = [(HMDCoreData *)self container];
  id v3 = [v2 persistentStoreCoordinator];

  return (NSPersistentStoreCoordinator *)v3;
}

- (void)_handleDidResetSyncNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = reasonFromResetSyncNotification(v4);
  id v6 = stringFromResetSyncReason(v5);
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Core Data has finished resetting all of our CloudKit data with reason: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  if ((unint64_t)(v5 - 1) >= 2)
  {
    id v11 = [[HMDLogEventCoreDataSignificantEvent alloc] initWithReason:3];
    [(HMDLogEventCoreDataSignificantEvent *)v11 setContext:v6];
    id v12 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v12 submitLogEvent:v11];
  }
}

- (void)_handleWillResetSyncNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = reasonFromResetSyncNotification(v4);
  id v6 = stringFromResetSyncReason(v5);
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Core Data is about to reset all of our CloudKit data with reason: %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)_handlePersistentCloudKitContainerEventChangedNotification:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = (void *)*MEMORY[0x263EFF088];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFF088]];

  if (v7)
  {
    id v8 = v7;
    objc_opt_class();
    int v9 = objc_opt_isKindOfClass() & 1;
    if (v9) {
      id v10 = v8;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (!v9)
    {
      id v25 = (void *)MEMORY[0x230FBD990]();
      uint64_t v26 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v84 = v28;
        __int16 v85 = 2114;
        v86 = v6;
        __int16 v87 = 2112;
        id v88 = v4;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in notification: %@", buf, 0x20u);
      }
      goto LABEL_55;
    }
    id v12 = [v8 storeIdentifier];
    uint64_t v13 = [v8 type];
    if (v13 == 1)
    {
      char v29 = 1;
    }
    else
    {
      if (!v13)
      {
        id v14 = v8;
        uint64_t v15 = v14;
        if (self)
        {
          uint64_t v16 = [v14 endDate];

          if (!v16)
          {
            v36 = (void *)MEMORY[0x230FBD990]();
            id v37 = self;
            uint64_t v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              v39 = HMFGetLogIdentifier();
              char v40 = [v15 storeIdentifier];
              *(_DWORD *)buf = 138543618;
              v84 = v39;
              __int16 v85 = 2114;
              v86 = v40;
              _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Beginning setup for store with identifier %{public}@", buf, 0x16u);
            }
            logger = v37->_logger;
            if (os_signpost_enabled(logger))
            {
              v42 = logger;
              v43 = [v15 storeIdentifier];
              *(_DWORD *)buf = 138412290;
              v84 = v43;
              _os_signpost_emit_with_name_impl(&dword_22F52A000, v42, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CoreDataCloudTransformSetup", "storeIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);
            }
            v37->_os_signpost_id_t setupSignpostID = 0xEEEEB0B5B2B2EEEELL;
            goto LABEL_54;
          }
          uint64_t v17 = self->_logger;
          uint64_t v18 = v17;
          os_signpost_id_t setupSignpostID = self->_setupSignpostID;
          if (setupSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v17))
          {
            v74 = [v15 storeIdentifier];
            [v15 succeeded];
            id v72 = HMFBooleanToString();
            v70 = [v15 error];
            if (v70)
            {
              __int16 v20 = NSNumber;
              id v69 = [v15 error];
              id v71 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v69, "code"));
            }
            else
            {
              id v71 = [MEMORY[0x263EFF9D0] null];
              id v69 = v71;
            }
            double v44 = [v15 error];
            if (v44)
            {
              v68 = [v15 error];
              [v68 domain];
            }
            else
            {
              [MEMORY[0x263EFF9D0] null];
            double v45 = };
            *(_DWORD *)buf = 138413058;
            v84 = v74;
            __int16 v85 = 2112;
            v86 = v72;
            __int16 v87 = 2112;
            id v88 = v71;
            __int16 v89 = 2112;
            uint64_t v90 = (uint64_t)v45;
            _os_signpost_emit_with_name_impl(&dword_22F52A000, v18, OS_SIGNPOST_INTERVAL_END, setupSignpostID, "CoreDataCloudTransformSetup", "storeIdentifier=%{signpost.description:attribute}@ succeeded=%{signpost.description:attribute}@ errorCode=%{signpost.description:attribute}@ errorDomain=%{signpost.description:attribute}@ ", buf, 0x2Au);
            if (v44)
            {

              double v45 = v68;
            }

            if (v70) {
          }
            }

          self->_os_signpost_id_t setupSignpostID = 0;
          id v46 = [v15 storeIdentifier];
          v47 = [(HMDCoreData *)self cloudPrivateStore];
          id v48 = [v47 identifier];
          if ([(HMDCoreDataCloudKitOperationLogEvent *)v46 isEqualToString:v48])
          {
            BOOL firstSetupEvent = self->_firstSetupEvent;

            double v50 = 0.0;
            if (!firstSetupEvent)
            {
LABEL_48:
              int v56 = [v15 succeeded];
              id v57 = (void *)MEMORY[0x230FBD990]();
              v58 = self;
              v59 = HMFGetOSLogHandle();
              v60 = v59;
              if (v56)
              {
                if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                {
                  v61 = HMFGetLogIdentifier();
                  v62 = [v15 storeIdentifier];
                  +[HMDCoreData afterTimeInterval:](v50);
                  v63 = __int16 v75 = v57;
                  *(_DWORD *)buf = 138543874;
                  v84 = v61;
                  __int16 v85 = 2114;
                  v86 = v62;
                  __int16 v87 = 2112;
                  id v88 = v63;
                  _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@Finished setup for store with identifier %{public}@ %@", buf, 0x20u);

                  id v57 = v75;
                }
              }
              else if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v73 = HMFGetLogIdentifier();
                [v15 storeIdentifier];
                v64 = v76 = v57;
                v65 = [v15 error];
                uint64_t v66 = +[HMDCoreData afterTimeInterval:](v50);
                *(_DWORD *)buf = 138544130;
                v84 = v73;
                __int16 v85 = 2114;
                v86 = v64;
                __int16 v87 = 2114;
                id v88 = v65;
                __int16 v89 = 2112;
                uint64_t v90 = v66;
                v67 = (void *)v66;
                _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Setup failed for store with identifier %{public}@: %{public}@ %@", buf, 0x2Au);

                id v57 = v76;
              }

              goto LABEL_54;
            }
            HMFUptime();
            double v50 = v51 - self->_startTime;
            id v46 = [[HMDCoreDataCloudKitOperationLogEvent alloc] initWithOperationType:3 interval:v50];
            id v52 = +[HMDMetricsManager sharedLogEventSubmitter];
            v53 = [v15 error];
            [v52 submitLogEvent:v46 error:v53];

            if (([v15 succeeded] & 1) == 0 && v50 <= 300.0)
            {
LABEL_47:

              goto LABEL_48;
            }
            v54 = +[HMDMainDriver driver];
            v47 = [v54 currentAccessorySetupMetricDispatcher];

            v55 = [v15 error];
            [v47 markFirstCoreDataContainerSetupDuration:v55 error:v50];

            self->_BOOL firstSetupEvent = 0;
          }
          else
          {

            double v50 = 0.0;
          }

          goto LABEL_47;
        }
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
      char v29 = 0;
    }
    v30 = [v8 endDate];

    if (v30)
    {
      BOOL v31 = [v8 endDate];
      uint64_t v32 = [v8 startDate];
      [v31 timeIntervalSinceDate:v32];
      uint64_t v34 = v33;
    }
    else
    {
      uint64_t v34 = 0;
    }
    BOOL v35 = v30 == 0;
    uint64_t v15 = -[HMDCoreData _currentNotificationListeners]((char *)self);
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __74__HMDCoreData__handlePersistentCloudKitContainerEventChangedNotification___block_invoke;
    v77[3] = &unk_264A1DD60;
    BOOL v81 = v35;
    char v82 = v29;
    v77[4] = self;
    id v78 = v12;
    id v79 = v8;
    uint64_t v80 = v34;
    objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v77);

    goto LABEL_54;
  }
  char v21 = (void *)MEMORY[0x230FBD990]();
  id v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v84 = v24;
    __int16 v85 = 2114;
    v86 = v6;
    __int16 v87 = 2112;
    id v88 = v4;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@No '%{public}@' for notification: %@", buf, 0x20u);
  }
LABEL_56:
}

- (id)_currentNotificationListeners
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock_with_options();
    uint64_t v1 = [v1[10] allObjects];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

void __74__HMDCoreData__handlePersistentCloudKitContainerEventChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 65))
    {
      char v3 = objc_opt_respondsToSelector();
      id v4 = v7;
      if ((v3 & 1) == 0) {
        goto LABEL_17;
      }
      [v7 coreData:*(void *)(a1 + 32) cloudKitImportStartedForStoreWithIdentifier:*(void *)(a1 + 40)];
    }
    else
    {
      char v6 = objc_opt_respondsToSelector();
      id v4 = v7;
      if ((v6 & 1) == 0) {
        goto LABEL_17;
      }
      [v7 coreData:*(void *)(a1 + 32) cloudKitExportStartedForStoreWithIdentifier:*(void *)(a1 + 40)];
    }
  }
  else
  {
    if ([*(id *)(a1 + 48) succeeded])
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 48) error];
    }
    if (*(unsigned char *)(a1 + 65))
    {
      if (objc_opt_respondsToSelector()) {
        [v7 coreData:*(void *)(a1 + 32) cloudKitImportFinishedForStoreWithIdentifier:*(void *)(a1 + 40) duration:v5 error:*(double *)(a1 + 56)];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v7 coreData:*(void *)(a1 + 32) cloudKitExportFinishedForStoreWithIdentifier:*(void *)(a1 + 40) duration:v5 error:*(double *)(a1 + 56)];
    }
  }
  id v4 = v7;
LABEL_17:
}

+ (__CFString)afterTimeInterval:(double)a1
{
  self;
  if (a1 <= 0.0)
  {
    id v2 = &stru_26E2EB898;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"after: %fs", *(void *)&a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_handleChangeNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  char v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFF170]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    int v9 = -[HMDCoreData _currentNotificationListeners]((char *)self);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __41__HMDCoreData__handleChangeNotification___block_invoke;
    v20[3] = &unk_264A1DD38;
    v20[4] = self;
    id v10 = v8;
    id v21 = v10;
    objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);
    id v11 = [(HMDCoreData *)self workingStore];
    id v12 = [v11 identifier];
    LODWORD(v10) = [v10 isEqualToString:v12];

    if (v10)
    {
      os_unfair_lock_lock_with_options();
      if (!self)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)0x10);
        goto LABEL_8;
      }
      os_unfair_lock_assert_owner(&self->_lock);
      BOOL firstCloudKitImportComplete = self->_firstCloudKitImportComplete;
      os_unfair_lock_unlock(&self->_lock);
      if (!firstCloudKitImportComplete)
      {
LABEL_8:
        id v14 = dispatch_get_global_queue(25, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __41__HMDCoreData__handleChangeNotification___block_invoke_2;
        block[3] = &unk_264A2F7F8;
        block[4] = self;
        dispatch_async(v14, block);
      }
    }

    goto LABEL_13;
  }
  uint64_t v15 = (void *)MEMORY[0x230FBD990]();
  uint64_t v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v23 = v18;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Notification with unexpected userInfo: %@", buf, 0x16u);
  }
LABEL_13:
}

void __41__HMDCoreData__handleChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 coreData:*(void *)(a1 + 32) persistentStoreWithIdentifierDidChange:*(void *)(a1 + 40)];
  }
}

void __41__HMDCoreData__handleChangeNotification___block_invoke_2(uint64_t a1)
{
}

- (void)_checkFirstCloudKitImportComplete
{
  if (a1)
  {
    id v2 = (void *)[a1 newManagedObjectContext];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __48__HMDCoreData__checkFirstCloudKitImportComplete__block_invoke;
    v4[3] = &unk_264A2F820;
    v4[4] = a1;
    id v5 = v2;
    id v3 = v2;
    [v3 performBlock:v4];
  }
}

void __48__HMDCoreData__checkFirstCloudKitImportComplete__block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud sync metadata", buf, 0xCu);
  }
  char v6 = +[MKFCloudSyncMetadata fetchRequest];
  v36[0] = @"historyTokenForCloudStore";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  [v6 setPropertiesToFetch:v7];

  id v8 = [*(id *)(a1 + 32) workingStore];
  BOOL v35 = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  [v6 setAffectedStores:v9];

  id v10 = *(void **)(a1 + 40);
  id v30 = 0;
  id v11 = [v10 executeFetchRequest:v6 error:&v30];
  id v12 = v30;
  if (v11)
  {
    if ((unint64_t)[v11 count] < 2) {
      goto LABEL_11;
    }
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v16;
      __int16 v33 = 2114;
      id v34 = v11;
      uint64_t v17 = "%{public}@Fetched too many cloud sync metadata objects: %{public}@";
LABEL_9:
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v16;
      __int16 v33 = 2114;
      id v34 = v12;
      uint64_t v17 = "%{public}@Failed to fetch cloud sync metadata: %{public}@";
      goto LABEL_9;
    }
  }

LABEL_11:
  uint64_t v18 = [v11 firstObject];

  id v19 = [v18 historyTokenForCloudStore];

  if (v19)
  {
    __int16 v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      -[HMDCoreData _markFirstCloudKitImportComplete](*(void *)(a1 + 32));
      goto LABEL_21;
    }
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v23;
    __int16 v24 = "%{public}@Cloud sync has previous history token";
LABEL_14:
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

    goto LABEL_15;
  }
  uint64_t v25 = *(void *)(a1 + 32);
  if (!v25 || !*(unsigned char *)(v25 + 33))
  {
    __int16 v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v23;
    __int16 v24 = "%{public}@Not using CloudKit so marking first import complete";
    goto LABEL_14;
  }
  uint64_t v26 = (void *)MEMORY[0x230FBD990]();
  id v27 = *(id *)(a1 + 32);
  id v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    char v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v29;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@No previous cloud sync token, waiting for initial import", buf, 0xCu);
  }
LABEL_21:
}

- (void)_markFirstCloudKitImportComplete
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock_with_options();
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (*(unsigned char *)(a1 + 32))
    {
      os_unfair_lock_unlock(v2);
    }
    else
    {
      os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
      *(unsigned char *)(a1 + 32) = 1;
      os_unfair_lock_unlock(v2);
      id v3 = [(id)a1 allContexts];
      if ([v3 count])
      {
        id v4 = (void *)MEMORY[0x230FBD990]();
        id v5 = (id)a1;
        char v6 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          id v7 = HMFGetLogIdentifier();
          uint64_t v8 = [v3 count];
          uint64_t v9 = [v3 count];
          id v10 = "s";
          *(_DWORD *)buf = 138543874;
          id v19 = v7;
          if (v9 == 1) {
            id v10 = "";
          }
          __int16 v20 = 2048;
          uint64_t v21 = v8;
          __int16 v22 = 2080;
          v23 = v10;
          _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Flushing %ld context%s before resolving first CloudKit import promise", buf, 0x20u);
        }
        dispatch_group_t v11 = dispatch_group_create();
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke;
        v16[3] = &unk_264A1DD88;
        v16[4] = v5;
        dispatch_group_t v17 = v11;
        id v12 = v11;
        objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);
        intptr_t v13 = HMDCurrentQOSWithFloor();
        id v14 = dispatch_get_global_queue(v13, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke_293;
        block[3] = &unk_264A2F7F8;
        block[4] = v5;
        dispatch_group_notify(v12, v14, block);
      }
      else
      {
        -[HMDCoreData _resolveFirstCloudKitImportPromise]((void *)a1);
      }
    }
  }
}

- (void)_resolveFirstCloudKitImportPromise
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = a1;
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@First CloudKit import promise resolved", (uint8_t *)&v11, 0xCu);
    }
    char v6 = v3[1];
    if (os_signpost_enabled(v6))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CoreDataFirstImportComplete", "", (uint8_t *)&v11, 2u);
    }
    id v7 = (void *)v3[12];
    uint64_t v8 = [MEMORY[0x263F42538] futureWithNoValue];
    [v7 resolveWithFuture:v8];

    uint64_t v9 = +[HMDMainDriver driver];
    id v10 = [v9 currentAccessorySetupMetricDispatcher];

    [v10 markSetupEndStage:13 error:0];
    [v10 markSetupBeginStage:7 error:0];
  }
}

void __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  char v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = [v3 name];
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v7;
    __int16 v16 = 2160;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Flushing '%{mask.hash}@' context before resolving first CloudKit import promise", buf, 0x20u);
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke_291;
  v11[3] = &unk_264A2F2F8;
  uint64_t v9 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  id v13 = v9;
  id v10 = v3;
  [v10 performBlock:v11];
}

void __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke_293(uint64_t a1)
{
}

void __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke_291(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    char v6 = [*(id *)(a1 + 40) name];
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2160;
    uint64_t v10 = 1752392040;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Flushed '%{mask.hash}@' context", (uint8_t *)&v7, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)stopWatchingManagedObjectChanges
{
  id v3 = [(HMDCoreData *)self notificationCenter];
  [v3 removeObserver:self];
}

- (void)startWatchingManagedObjectChanges
{
  id v3 = [(HMDCoreData *)self notificationCenter];
  uint64_t v4 = *MEMORY[0x263EFF080];
  id v5 = [(HMDCoreData *)self container];
  [v3 addObserver:self selector:sel__handlePersistentCloudKitContainerEventChangedNotification_ name:v4 object:v5];

  char v6 = [(HMDCoreData *)self notificationCenter];
  uint64_t v7 = *MEMORY[0x263EFF0F8];
  uint64_t v8 = [(HMDCoreData *)self container];
  __int16 v9 = [v8 persistentStoreCoordinator];
  [v6 addObserver:self selector:sel__handleChangeNotification_ name:v7 object:v9];

  uint64_t v10 = [(HMDCoreData *)self notificationCenter];
  [v10 addObserver:self selector:sel__handleWillResetSyncNotification_ name:*MEMORY[0x263EFEFD8] object:0];

  __int16 v11 = [(HMDCoreData *)self notificationCenter];
  [v11 addObserver:self selector:sel__handleDidResetSyncNotification_ name:*MEMORY[0x263EFEFC8] object:0];

  id v12 = [(HMDCoreData *)self notificationCenter];
  [v12 addObserver:self selector:sel__handlePersistentCloudKitContainerActivityChangedNotification_ name:*MEMORY[0x263EFF078] object:0];
}

- (void)startLoadingStores
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  if (self)
  {
    id v3 = [(HMDCoreData *)self container];
    uint64_t v4 = [v3 persistentStoreDescriptions];
    uint64_t v53 = MEMORY[0x263EF8330];
    uint64_t v54 = 3221225472;
    v55 = __23__HMDCoreData__preLoad__block_invoke;
    int v56 = &unk_264A1DC70;
    id v57 = self;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v53);

    HMFUptime();
    self->_startTime = v5;
    self->_BOOL firstSetupEvent = 1;
    self->_BOOL firstSetupActivity = 1;
    activityTimedOutTimer = self->_activityTimedOutTimer;
    self->_activityTimedOutTimer = 0;

    activityIdentifier = self->_activityIdentifier;
    self->_activityIdentifier = 0;

    activityLogEvent = self->_activityLogEvent;
    self->_activityLogEvent = 0;

    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x3032000000;
    id v72 = __Block_byref_object_copy__89639;
    v73 = __Block_byref_object_dispose__89640;
    id v74 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = &v65;
    uint64_t v67 = 0x2020000000;
    uint64_t v68 = 0;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 4;
    __int16 v9 = [(HMDCoreData *)self container];
    uint64_t v53 = MEMORY[0x263EF8330];
    uint64_t v54 = 3221225472;
    v55 = __20__HMDCoreData__load__block_invoke;
    int v56 = &unk_264A1DC98;
    id v57 = self;
    v58 = &v69;
    v59 = &v61;
    v60 = &v65;
    [v9 loadPersistentStoresWithCompletionHandler:&v53];

    uint64_t v10 = (void *)v70[5];
    if (v10)
    {
      uint64_t v11 = v62[3];
      id v12 = v10;
      uint64_t v13 = [[HMDCoreDataLoadErrorLogEvent alloc] initWithReason:v11];
      [(HMMLogEvent *)v13 setError:v12];

      +[HMDMetricsManager submitMinimalCoreAnalyticsEvent:v13];
      id v14 = +[HMDMetricsManager defaultRadarInitiator];
      LOBYTE(v52) = 1;
      [v14 requestRadarWithDisplayReason:@"persistent stores failed to load" radarTitle:@"Failed to load persistent stores" componentName:@"HomeKit" componentVersion:@"Data Model" componentID:834211 attachments:0 waitForResponse:v52];
    }
    if (v66[3])
    {
      +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:steps:](HMDResetConfigPostCleanup, "writePostCleanupRecordWithReason:steps:", 8);
      uint64_t v15 = +[HMDMainDriver driver];
      [v15 relaunch];
    }
    else if (v70[5])
    {
      double v45 = (void *)MEMORY[0x230FBD990]();
      id v46 = self;
      HMFGetOSLogHandle();
      v47 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)v70[5], "code"));
        double v50 = [(id)v70[5] domain];
        uint64_t v51 = v70[5];
        *(_DWORD *)buf = 138544130;
        id v76 = v48;
        __int16 v77 = 2112;
        id v78 = v49;
        __int16 v79 = 2112;
        uint64_t v80 = v50;
        __int16 v81 = 2112;
        uint64_t v82 = v51;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to load persistent container: (%@/%@): %@", buf, 0x2Au);
      }
      _Exit(1);
    }
    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v69, 8);

    __int16 v16 = [(HMDCoreData *)self coordinator];
    uint64_t v17 = [v16 persistentStores];
    uint64_t v53 = MEMORY[0x263EF8330];
    uint64_t v54 = 3221225472;
    v55 = __24__HMDCoreData__postLoad__block_invoke;
    int v56 = &unk_264A1DCE8;
    id v57 = self;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v53);

    __int16 v18 = [(HMDCoreData *)self workingStore];
    LODWORD(v16) = v18 == 0;

    if (v16) {
      goto LABEL_26;
    }
    id v19 = [(HMDCoreData *)self cloudPrivateStore];
    BOOL v20 = v19 == 0;

    if (v20) {
      goto LABEL_26;
    }
    uint64_t v21 = [(HMDCoreData *)self cloudSharedStore];
    BOOL v22 = v21 == 0;

    if (v22
      || ([(HMDCoreData *)self localStore],
          v23 = objc_claimAutoreleasedReturnValue(),
          BOOL v24 = v23 == 0,
          v23,
          v24))
    {
LABEL_26:
      _HMFPreconditionFailure();
      __break(1u);
      return;
    }
    if ([(HMDCoreData *)self _shouldPruneWorkingStoreHistory])
    {
      uint64_t v25 = [MEMORY[0x263F42608] sharedPreferences];
      uint64_t v26 = [v25 preferenceForKey:@"workingStoreMaxHistoryPercentage"];
      id v27 = [v26 numberValue];

      uint64_t v28 = v27 ? [v27 integerValue] : 20;
      if ([(HMDCoreData *)self _pruneStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan:v28 storeType:2])
      {
        char v29 = +[HMDHomeKitVersion currentVersion];
        id v30 = [v29 versionString];

        [(NSUserDefaults *)self->_userDefaults setObject:v30 forKey:@"workingStoreHistoryPruneRanHomeKitVersionKey"];
        BOOL v31 = (void *)MEMORY[0x263EFF910];
        uint64_t v32 = self->_userDefaults;
        __int16 v33 = [v31 now];
        id v34 = [v33 description];
        [(NSUserDefaults *)v32 setObject:v34 forKey:@"workingStoreHistoryPruneRanDateKey"];
      }
    }
    if ([(HMDCoreData *)self _shouldPruneCloudStoreHistory])
    {
      BOOL v35 = [MEMORY[0x263F42608] sharedPreferences];
      v36 = [v35 preferenceForKey:@"cloudStoreMaxHistoryPercentage"];
      id v37 = [v36 numberValue];

      uint64_t v38 = v37 ? [v37 integerValue] : 20;
      if ([(HMDCoreData *)self _pruneStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan:v38 storeType:0])
      {
        v39 = +[HMDHomeKitVersion currentVersion];
        char v40 = [v39 versionString];

        [(NSUserDefaults *)self->_userDefaults setObject:v40 forKey:@"cloudStoreHistoryPruneRanHomeKitVersionKey"];
        v41 = (void *)MEMORY[0x263EFF910];
        v42 = self->_userDefaults;
        v43 = [v41 now];
        double v44 = [v43 description];
        [(NSUserDefaults *)v42 setObject:v44 forKey:@"cloudStoreHistoryPruneRanDateKey"];
      }
    }
  }
  -[HMDCoreData _checkFirstCloudKitImportComplete](self);
}

void __24__HMDCoreData__postLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a2;
  double v5 = [v4 configurationName];
  int v6 = [v5 isEqualToString:@"Working"];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      objc_storeStrong((id *)(v7 + 48), a2);
    }
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [v4 identifier];
      uint64_t v13 = [v4 URL];
      int v24 = 138544130;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      id v27 = v12;
      __int16 v28 = 2160;
      uint64_t v29 = 1752392040;
      __int16 v30 = 2112;
      BOOL v31 = v13;
      id v14 = "%{public}@Found working store with identifier %{public}@ at '%{mask.hash}@'";
LABEL_23:
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v24, 0x2Au);

      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v15 = [v4 configurationName];
    int v16 = [v15 isEqualToString:@"Local"];

    if (v16)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17) {
        objc_storeStrong((id *)(v17 + 72), a2);
      }
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        id v12 = [v4 identifier];
        uint64_t v13 = [v4 URL];
        int v24 = 138544130;
        uint64_t v25 = v11;
        __int16 v26 = 2114;
        id v27 = v12;
        __int16 v28 = 2160;
        uint64_t v29 = 1752392040;
        __int16 v30 = 2112;
        BOOL v31 = v13;
        id v14 = "%{public}@Found local store with identifier %{public}@ at '%{mask.hash}@'";
        goto LABEL_23;
      }
    }
    else
    {
      __int16 v18 = [v4 configurationName];
      int v19 = [v18 isEqualToString:@"CloudKit"];

      if (v19)
      {
        BOOL v20 = [v4 URL];
        uint64_t v21 = [v20 lastPathComponent];
        int v22 = [v21 containsString:@"shared"];

        uint64_t v23 = *(void *)(a1 + 32);
        if (v22)
        {
          if (v23) {
            objc_storeStrong((id *)(v23 + 64), a2);
          }
          uint64_t v8 = (void *)MEMORY[0x230FBD990]();
          id v9 = *(id *)(a1 + 32);
          uint64_t v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = HMFGetLogIdentifier();
            id v12 = [v4 identifier];
            uint64_t v13 = [v4 URL];
            int v24 = 138544130;
            uint64_t v25 = v11;
            __int16 v26 = 2114;
            id v27 = v12;
            __int16 v28 = 2160;
            uint64_t v29 = 1752392040;
            __int16 v30 = 2112;
            BOOL v31 = v13;
            id v14 = "%{public}@Found shared cloud store with identifier %{public}@ at '%{mask.hash}@'";
            goto LABEL_23;
          }
        }
        else
        {
          if (v23) {
            objc_storeStrong((id *)(v23 + 56), a2);
          }
          uint64_t v8 = (void *)MEMORY[0x230FBD990]();
          id v9 = *(id *)(a1 + 32);
          uint64_t v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = HMFGetLogIdentifier();
            id v12 = [v4 identifier];
            uint64_t v13 = [v4 URL];
            int v24 = 138544130;
            uint64_t v25 = v11;
            __int16 v26 = 2114;
            id v27 = v12;
            __int16 v28 = 2160;
            uint64_t v29 = 1752392040;
            __int16 v30 = 2112;
            BOOL v31 = v13;
            id v14 = "%{public}@Found private cloud store with identifier %{public}@ at '%{mask.hash}@'";
            goto LABEL_23;
          }
        }
      }
      else
      {
        uint64_t v8 = (void *)MEMORY[0x230FBD990]();
        id v9 = *(id *)(a1 + 32);
        uint64_t v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = HMFGetLogIdentifier();
          int v24 = 138543618;
          uint64_t v25 = v11;
          __int16 v26 = 2114;
          id v27 = v4;
          _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Found store with unexpected configuration: %{public}@", (uint8_t *)&v24, 0x16u);
LABEL_24:
        }
      }
    }
  }
}

void __20__HMDCoreData__load__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [v5 URL];
      int v51 = 138543874;
      uint64_t v52 = v11;
      __int16 v53 = 2112;
      uint64_t v54 = (uint64_t)v12;
      __int16 v55 = 2112;
      id v56 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_FAULT, "%{public}@Failed to load persistent store at '%@': %@", (uint8_t *)&v51, 0x20u);
    }
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v5 URL];
      int v51 = 138544130;
      uint64_t v52 = v16;
      __int16 v53 = 2160;
      uint64_t v54 = 1752392040;
      __int16 v55 = 2112;
      id v56 = v17;
      __int16 v57 = 2114;
      id v58 = v6;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to load persistent store at '%{mask.hash}@': %{public}@", (uint8_t *)&v51, 0x2Au);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v18 = HMDSanitizeCoreDataError(v6);
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    if (+[HMDCoreData isDatabaseCorruptedFromError:v6])
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v21 = [v5 configuration];
      int v22 = [v21 isEqualToString:@"CloudKit"];

      if (v22)
      {
        uint64_t v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = *(id *)(a1 + 32);
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = HMFGetLogIdentifier();
          int v51 = 138543362;
          uint64_t v52 = v26;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Will clean up with steps for cloudkit stores", (uint8_t *)&v51, 0xCu);
        }
        uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v28 = *(void *)(v27 + 24) | 0x16;
      }
      else
      {
        BOOL v35 = [v5 configuration];
        int v36 = [v35 isEqualToString:@"Local"];

        if (v36)
        {
          id v37 = (void *)MEMORY[0x230FBD990]();
          id v38 = *(id *)(a1 + 32);
          v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            char v40 = HMFGetLogIdentifier();
            int v51 = 138543362;
            uint64_t v52 = v40;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Will clean up with steps for local store", (uint8_t *)&v51, 0xCu);
          }
          uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v28 = *(void *)(v27 + 24) | 8;
        }
        else
        {
          v41 = [v5 configuration];
          int v42 = [v41 isEqualToString:@"Working"];

          v43 = (void *)MEMORY[0x230FBD990]();
          id v44 = *(id *)(a1 + 32);
          double v45 = HMFGetOSLogHandle();
          BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
          if (v42)
          {
            if (v46)
            {
              v47 = HMFGetLogIdentifier();
              int v51 = 138543362;
              uint64_t v52 = v47;
              _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Will clean up with steps for working store", (uint8_t *)&v51, 0xCu);
            }
            uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
            uint64_t v28 = *(void *)(v27 + 24) | 2;
          }
          else
          {
            if (v46)
            {
              id v48 = HMFGetLogIdentifier();
              v49 = [v5 URL];
              double v50 = [v5 configuration];
              int v51 = 138544130;
              uint64_t v52 = v48;
              __int16 v53 = 2160;
              uint64_t v54 = 1752392040;
              __int16 v55 = 2112;
              id v56 = v49;
              __int16 v57 = 2114;
              id v58 = v50;
              _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Can't decide cleanup steps - unknown store configuration '%{mask.hash}@': %{public}@", (uint8_t *)&v51, 0x2Au);
            }
            uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v28 = 2;
          }
        }
      }
LABEL_31:
      *(void *)(v27 + 24) = v28;
      goto LABEL_32;
    }
    if (+[HMDCoreData isDiskFullFromError:v6])
    {
      BOOL v31 = (void *)MEMORY[0x230FBD990]();
      id v32 = *(id *)(a1 + 32);
      __int16 v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v34 = HMFGetLogIdentifier();
        int v51 = 138543362;
        uint64_t v52 = v34;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Disk full error. Exit.", (uint8_t *)&v51, 0xCu);
      }
      uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v28 = 3;
      goto LABEL_31;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      __int16 v30 = [v5 URL];
      int v51 = 138543874;
      uint64_t v52 = v29;
      __int16 v53 = 2160;
      uint64_t v54 = 1752392040;
      __int16 v55 = 2112;
      id v56 = v30;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Loaded persistent store at '%{mask.hash}@'", (uint8_t *)&v51, 0x20u);
    }
  }
LABEL_32:
}

void __23__HMDCoreData__preLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [v3 configuration];
    id v9 = [v3 URL];
    int v12 = 138544130;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2160;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Starting '%{public}@' database at '%{mask.hash}@'", (uint8_t *)&v12, 0x2Au);
  }
  uint64_t v10 = [v3 cloudKitContainerOptions];

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      *(unsigned char *)(v11 + 33) = 1;
    }
  }
}

- (BOOL)_shouldPruneCloudStoreHistory
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self) {
    userDefaults = self->_userDefaults;
  }
  else {
    userDefaults = 0;
  }
  id v4 = userDefaults;
  id v5 = [(NSUserDefaults *)v4 objectForKey:@"cloudStoreHistoryPruneRanHomeKitVersionKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (self) {
    id v8 = self->_userDefaults;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = [(NSUserDefaults *)v9 objectForKey:@"cloudStoreHistoryPruneRanDateKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v7)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    __int16 v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v20 = 138543874;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      id v23 = v7;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Cloud store history was already pruned on version %{public}@ at %{public}@", (uint8_t *)&v20, 0x20u);
    }
    BOOL v17 = 0;
  }
  else
  {
    __int16 v18 = [MEMORY[0x263F42620] productInfo];
    BOOL v17 = [v18 productPlatform] == 3;
  }
  return v17;
}

- (BOOL)_pruneStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan:(int64_t)a3 storeType:(unint64_t)a4
{
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v7 = [(HMDCoreData *)self newManagedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__HMDCoreData__pruneStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan_storeType___block_invoke;
  v10[3] = &unk_264A1DD10;
  id v8 = v7;
  id v11 = v8;
  id v12 = self;
  uint64_t v13 = &v16;
  unint64_t v14 = a4;
  int64_t v15 = a3;
  [v8 performBlockAndWait:v10];
  LOBYTE(a3) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return a3;
}

void __85__HMDCoreData__pruneStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan_storeType___block_invoke(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v2 = +[MKFCloudSyncMetadata fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  id v3 = *(void **)(a1 + 32);
  id v79 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v79];
  id v5 = (__CFString *)v79;
  if (v4)
  {
    if ([(__CFString *)v4 count])
    {
      if ((unint64_t)[(__CFString *)v4 count] >= 2)
      {
        id v6 = (void *)MEMORY[0x230FBD990]();
        id v7 = *(id *)(a1 + 40);
        id v8 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v9 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v81 = (uint64_t)v9;
          __int16 v82 = 2114;
          uint64_t v83 = v4;
          _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@More than one MKFCloudSyncMetadata object (using first): %{public}@", buf, 0x16u);
        }
      }
      uint64_t v10 = [(__CFString *)v4 firstObject];
      id v11 = v10;
      uint64_t v12 = *(void *)(a1 + 56);
      if (v12)
      {
        if (v12 != 2)
        {
          id v48 = (void *)MEMORY[0x230FBD990]();
          id v49 = *(id *)(a1 + 40);
          double v50 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            uint64_t v51 = HMFGetLogIdentifier();
            uint64_t v52 = (void *)v51;
            uint64_t v53 = *(void *)(a1 + 56);
            uint64_t v54 = @"Cloud";
            if (v53 == 1) {
              uint64_t v54 = @"CloudShared";
            }
            if (v53 == 2) {
              __int16 v55 = @"Working";
            }
            else {
              __int16 v55 = v54;
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v81 = v51;
            __int16 v82 = 2112;
            uint64_t v83 = v55;
            id v56 = v55;
            _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Do not support to prune %@ store", buf, 0x16u);
          }
          goto LABEL_58;
        }
        uint64_t v13 = [v10 historyTokenForWorkingStore];
      }
      else
      {
        uint64_t v13 = [v10 historyTokenForCloudStore];
      }
      __int16 v22 = (void *)v13;
      id v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = *(id *)(a1 + 40);
      id v25 = HMFGetOSLogHandle();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
      if (v22)
      {
        __int16 v77 = v11;
        if (v26)
        {
          uint64_t v27 = HMFGetLogIdentifier();
          uint64_t v28 = (void *)v27;
          uint64_t v29 = @"Cloud";
          uint64_t v30 = *(void *)(a1 + 56);
          uint64_t v31 = *(void *)(a1 + 64);
          if (v30 == 1) {
            uint64_t v29 = @"CloudShared";
          }
          *(_DWORD *)buf = 138544130;
          uint64_t v81 = v27;
          __int16 v82 = 2112;
          if (v30 == 2) {
            uint64_t v29 = @"Working";
          }
          uint64_t v83 = v29;
          __int16 v84 = 2114;
          double v85 = *(double *)&v22;
          __int16 v86 = 2050;
          uint64_t v87 = v31;
          id v32 = v29;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Will prune %@ store history before history token %{public}@ when history percentage is > %{public}zd%%", buf, 0x2Au);
        }
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        double v34 = v33;
        BOOL v35 = [MEMORY[0x263EFF2F8] deleteHistoryBeforeToken:v22 whenHistoryPercentageOfStoreIsGreaterThan:*(void *)(a1 + 64)];
        int v36 = *(void **)(a1 + 32);
        id v78 = v5;
        id v37 = (id)[v36 executeRequest:v35 error:&v78];
        id v38 = v78;

        if (v38)
        {
          v39 = (void *)MEMORY[0x230FBD990]();
          id v40 = *(id *)(a1 + 40);
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            uint64_t v42 = HMFGetLogIdentifier();
            v43 = (void *)v42;
            uint64_t v44 = *(void *)(a1 + 56);
            double v45 = @"Cloud";
            if (v44 == 1) {
              double v45 = @"CloudShared";
            }
            *(_DWORD *)buf = 138543874;
            uint64_t v81 = v42;
            if (v44 == 2) {
              BOOL v46 = @"Working";
            }
            else {
              BOOL v46 = v45;
            }
            __int16 v82 = 2112;
            uint64_t v83 = v46;
            __int16 v84 = 2114;
            double v85 = *(double *)&v38;
            v47 = v46;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Pruning %@ store history failed with %{public}@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v63 = [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
          double v65 = v64;
          uint64_t v66 = (void *)MEMORY[0x230FBD990](v63);
          id v67 = *(id *)(a1 + 40);
          uint64_t v68 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            double v69 = v65 - v34;
            uint64_t v70 = HMFGetLogIdentifier();
            id v76 = (void *)v70;
            uint64_t v71 = *(void *)(a1 + 56);
            id v72 = @"Cloud";
            if (v71 == 1) {
              id v72 = @"CloudShared";
            }
            *(_DWORD *)buf = 138543874;
            uint64_t v81 = v70;
            if (v71 == 2) {
              v73 = @"Working";
            }
            else {
              v73 = v72;
            }
            __int16 v82 = 2112;
            uint64_t v83 = v73;
            __int16 v84 = 2050;
            double v85 = v69;
            id v74 = v66;
            __int16 v75 = v73;
            _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Successfully pruned %@ store history in %{public}.3lf seconds", buf, 0x20u);

            uint64_t v66 = v74;
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
        id v11 = v77;

        id v5 = v38;
      }
      else
      {
        if (v26)
        {
          uint64_t v57 = HMFGetLogIdentifier();
          id v58 = (void *)v57;
          uint64_t v59 = *(void *)(a1 + 56);
          v60 = @"Cloud";
          if (v59 == 1) {
            v60 = @"CloudShared";
          }
          if (v59 == 2) {
            uint64_t v61 = @"Working";
          }
          else {
            uint64_t v61 = v60;
          }
          *(_DWORD *)buf = 138543618;
          uint64_t v81 = v57;
          __int16 v82 = 2112;
          uint64_t v83 = v61;
          v62 = v61;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@No last history token for %@ store, this must be a new device", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
LABEL_58:

      goto LABEL_59;
    }
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    int v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = (uint64_t)v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@No MKFCloudSyncMetadata found, this must be a new device", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    unint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v81 = (uint64_t)v17;
      __int16 v82 = 2114;
      uint64_t v83 = v5;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFCloudSyncMetadata: %{public}@", buf, 0x16u);
    }
  }
LABEL_59:
}

- (BOOL)_shouldPruneWorkingStoreHistory
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self) {
    userDefaults = self->_userDefaults;
  }
  else {
    userDefaults = 0;
  }
  id v4 = userDefaults;
  id v5 = [(NSUserDefaults *)v4 objectForKey:@"workingStoreHistoryPruneRanHomeKitVersionKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (self) {
    id v8 = self->_userDefaults;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = [(NSUserDefaults *)v9 objectForKey:@"workingStoreHistoryPruneRanDateKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v7)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    unint64_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v21 = 138543874;
      __int16 v22 = v16;
      __int16 v23 = 2114;
      id v24 = v7;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Working store history was already pruned on version %{public}@ at %{public}@", (uint8_t *)&v21, 0x20u);
    }
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263F42620] productInfo];
    if ([v18 productPlatform] == 4)
    {
      BOOL v17 = 1;
    }
    else
    {
      id v19 = [MEMORY[0x263F42620] productInfo];
      BOOL v17 = [v19 productPlatform] == 3;
    }
  }

  return v17;
}

- (HMDCoreData)initWithPersistentStoreDescriptions:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263EFF2C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  uint64_t v13 = (objc_class *)objc_opt_class();
  unint64_t v14 = NSStringFromClass(v13);
  id v15 = +[HMDCoreData managedObjectModel];
  uint64_t v16 = (void *)[v12 initWithName:v14 managedObjectModel:v15];

  BOOL v17 = (void *)[v11 copy];
  [v16 setPersistentStoreDescriptions:v17];

  uint64_t v18 = [(HMDCoreData *)self initWithCloudKitContainer:v16 notificationCenter:v10 userDefaults:v9];
  return v18;
}

- (HMDCoreData)initWithCloudKitContainer:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDCoreData;
  id v12 = [(HMDCoreData *)&v27 init];
  if (v12)
  {
    uint64_t v13 = HMFGetOSLogHandle();
    logger = v12->_logger;
    v12->_logger = (OS_os_log *)v13;

    v12->_lock._os_unfair_lock_opaque = 0;
    uint64_t v15 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    contexts = v12->_contexts;
    v12->_contexts = (NSMapTable *)v15;

    objc_storeStrong((id *)&v12->_container, a3);
    objc_storeStrong((id *)&v12->_notificationCenter, a4);
    objc_storeStrong((id *)&v12->_userDefaults, a5);
    uint64_t v17 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    listeners = v12->_listeners;
    v12->_listeners = (NSHashTable *)v17;

    v12->_BOOL firstCloudKitImportComplete = 0;
    uint64_t v19 = [MEMORY[0x263F42538] futureWithPromise:&v12->_firstCloudKitImportPromise];
    firstCloudKitImportFuture = v12->_firstCloudKitImportFuture;
    v12->_firstCloudKitImportFuture = (HMFFuture *)v19;

    HMDispatchQueueNameString();
    id v21 = objc_claimAutoreleasedReturnValue();
    __int16 v22 = (const char *)[v21 UTF8String];
    __int16 v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v24;
  }
  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t88 != -1) {
    dispatch_once(&logCategory__hmf_once_t88, &__block_literal_global_89858);
  }
  id v2 = (void *)logCategory__hmf_once_v89;
  return v2;
}

void __26__HMDCoreData_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v89;
  logCategory__hmf_once___int16 v89 = v0;
}

+ (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)+[HMDFeaturesDataSource defaultDataSource];
}

+ (BOOL)isDiskFullFromError:(id)a3
{
  return +[HMDCoreData isError:domain:fromError:]((uint64_t)HMDCoreData, 13, (void *)*MEMORY[0x263EFF150], a3);
}

+ (uint64_t)isError:(void *)a3 domain:(void *)a4 fromError:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = v7;
  if (v9)
  {
    id v10 = [MEMORY[0x263EFF980] array];
    unint64_t v11 = 0;
    uint64_t v12 = *MEMORY[0x263F08608];
    uint64_t v13 = v9;
    do
    {
      [v10 addObject:v13];
      unint64_t v14 = [v13 userInfo];
      uint64_t v15 = [v14 objectForKeyedSubscript:v12];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      id v17 = v16;

      if (v17) {
        BOOL v18 = v11 >= 9;
      }
      else {
        BOOL v18 = 1;
      }
      ++v11;
      uint64_t v13 = v15;
    }
    while (!v18);
    uint64_t v19 = (void *)[v10 copy];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x263EFFA68];
  }
  int v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = v8;
  __int16 v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    __int16 v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v32 = v23;
    __int16 v33 = 2112;
    double v34 = v19;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@all underlying errors : %@", buf, 0x16u);
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __40__HMDCoreData_isError_domain_fromError___block_invoke;
  v27[3] = &unk_264A1DCC0;
  id v28 = v6;
  uint64_t v29 = a2;
  id v30 = v21;
  id v24 = v6;
  uint64_t v25 = objc_msgSend(v19, "na_any:", v27);

  return v25;
}

BOOL __40__HMDCoreData_isError_domain_fromError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [v3 code];
    uint64_t v6 = *(void *)(a1 + 40);

    if (v5 == v6)
    {
      BOOL v7 = 1;
      goto LABEL_14;
    }
  }
  else
  {
  }
  id v8 = [v3 userInfo];
  id v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 32)];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 48);
    unint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 32);
      int v18 = 138544130;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Found the %@ error domain and error code : %@, %@", (uint8_t *)&v18, 0x2Au);
    }
    BOOL v7 = [v11 integerValue] == *(void *)(a1 + 40);
  }
  else
  {
    BOOL v7 = 0;
  }

LABEL_14:
  return v7;
}

+ (BOOL)isDatabaseCorruptedFromError:(id)a3
{
  return +[HMDCoreData isError:domain:fromError:]((uint64_t)HMDCoreData, 11, (void *)*MEMORY[0x263EFF150], a3);
}

+ (NSArray)defaultPersistentStoreDescriptions
{
  v9[4] = *MEMORY[0x263EF8340];
  id v3 = [a1 cloudPrivateStoreDescription];
  v9[0] = v3;
  id v4 = [a1 cloudSharedStoreDescription];
  v9[1] = v4;
  uint64_t v5 = [a1 localStoreDescription];
  v9[2] = v5;
  uint64_t v6 = [a1 workingStoreDescription];
  v9[3] = v6;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return (NSArray *)v7;
}

+ (NSArray)entitiesExcludedFromWorkingStoreHistory
{
  return (NSArray *)&unk_26E474080;
}

+ (NSPersistentStoreDescription)workingStoreDescription
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [a1 storeNameForConfiguration:@"core.sqlite"];
  id v4 = +[HMDCoreData _storeDescriptionForConfiguration:storeName:]((uint64_t)a1, @"Working", v3);

  [v4 setOption:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF108]];
  uint64_t v8 = *MEMORY[0x263EFF0A0];
  uint64_t v5 = [a1 entitiesExcludedFromWorkingStoreHistory];
  v9[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v4 setOption:v6 forKey:*MEMORY[0x263EFF0B0]];
  return (NSPersistentStoreDescription *)v4;
}

+ (id)_storeDescriptionForConfiguration:(void *)a3 storeName:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = (id)storeDirectoryPath;
  uint64_t v8 = NSURL;
  id v9 = [v7 stringByAppendingPathComponent:v5];
  id v10 = [v8 fileURLWithPath:v9];

  id v11 = [MEMORY[0x263EFF328] persistentStoreDescriptionWithURL:v10];
  [v11 setConfiguration:v4];
  uint64_t v12 = MEMORY[0x263EFFA88];
  [v11 setOption:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF0B0]];
  [v11 setOption:v12 forKey:*MEMORY[0x263EFF100]];
  [v11 setOption:&unk_26E4715F0 forKey:*MEMORY[0x263EFF0B8]];
  if (([v6 isUsingProductionObjectModel] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = v6;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      id v21 = v4;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Disabling automatic store migration for: [%@ / %@]", (uint8_t *)&v18, 0x20u);
    }
    [v11 setShouldMigrateStoreAutomatically:0];
  }

  return v11;
}

+ (NSPersistentStoreDescription)localStoreDescription
{
  id v3 = [a1 storeNameForConfiguration:@"core-local.sqlite"];
  id v4 = +[HMDCoreData _storeDescriptionForConfiguration:storeName:]((uint64_t)a1, @"Local", v3);

  return (NSPersistentStoreDescription *)v4;
}

+ (NSPersistentStoreDescription)cloudSharedStoreDescription
{
  id v3 = [a1 storeNameForConfiguration:@"core-cloudkit-shared.sqlite"];
  id v4 = +[HMDCoreData _storeDescriptionForConfiguration:storeName:]((uint64_t)a1, @"CloudKit", v3);

  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = [a1 getPersistentCloudKitContainerOptionsForStore:@"core-cloudkit-shared.sqlite" userDefaults:v5];
  [v4 setCloudKitContainerOptions:v6];

  id v7 = [v4 cloudKitContainerOptions];
  [v7 setDatabaseScope:3];

  return (NSPersistentStoreDescription *)v4;
}

+ (NSPersistentStoreDescription)cloudPrivateStoreDescription
{
  id v3 = [a1 storeNameForConfiguration:@"core-cloudkit.sqlite"];
  id v4 = +[HMDCoreData _storeDescriptionForConfiguration:storeName:]((uint64_t)a1, @"CloudKit", v3);

  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = [a1 getPersistentCloudKitContainerOptionsForStore:@"core-cloudkit.sqlite" userDefaults:v5];
  [v4 setCloudKitContainerOptions:v6];

  return (NSPersistentStoreDescription *)v4;
}

+ (id)getPersistentCloudKitContainerOptionsForStore:(id)a3 userDefaults:(id)a4
{
  id v4 = objc_opt_new();
  [v4 setUseZoneWidePCS:1];
  [v4 setApplicationBundleIdentifierOverrideForPushTopicGeneration:@"com.apple.willowd.homekit.config"];
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF1F0]) initWithContainerIdentifier:@"com.apple.homekit.config"];
  [v5 setUseDeviceToDeviceEncryption:1];
  [v5 setAutomaticallyScheduleImportAndExportOperations:1];
  [v5 setContainerOptions:v4];
  [v5 setApsConnectionMachServiceName:@"com.apple.aps.homekit"];

  return v5;
}

+ (id)storeNameForConfiguration:(id)a3
{
  id v4 = a3;
  if ([a1 isUsingProductionObjectModel])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"dev-%@", v4];
  }
  uint64_t v6 = v5;

  return v6;
}

+ (id)createWithPersistentStoreDescriptions:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreDescriptions:v10 notificationCenter:v9 userDefaults:v8];

  return v11;
}

+ (id)createWithPersistentStoreDescriptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v8 = [a1 createWithPersistentStoreDescriptions:v5 notificationCenter:v6 userDefaults:v7];

  return v8;
}

+ (id)sharedInstanceWithoutLiveCloudKit
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDCoreData_sharedInstanceWithoutLiveCloudKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_onceToken != -1) {
    dispatch_once(&_onceToken, block);
  }
  id v2 = (void *)_sharedInstance;
  return v2;
}

void __48__HMDCoreData_sharedInstanceWithoutLiveCloudKit__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) defaultPersistentStoreDescriptions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __48__HMDCoreData_sharedInstanceWithoutLiveCloudKit__block_invoke_2;
  v9[3] = &__block_descriptor_40_e45_v32__0__NSPersistentStoreDescription_8Q16_B24l;
  v9[4] = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x230FBD990](objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9));
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating HMDCoreData instance without Live CloudKit", buf, 0xCu);
  }
  uint64_t v7 = [*(id *)(a1 + 32) createWithPersistentStoreDescriptions:v2];
  id v8 = (void *)_sharedInstance;
  _sharedInstance = v7;

  [(id)_sharedInstance startWatchingManagedObjectChanges];
  [(id)_sharedInstance startLoadingStores];
}

void __48__HMDCoreData_sharedInstanceWithoutLiveCloudKit__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Not configuring [%@] with cloud kit container options", (uint8_t *)&v8, 0x16u);
  }
  [v3 setCloudKitContainerOptions:0];
}

+ (BOOL)isUsingProductionObjectModel
{
  id v3 = +[HMDCoreData productionManagedObjectModelURL]();
  id v4 = [a1 managedObjectModelURL];
  char v5 = HMFEqualObjects();

  return v5;
}

+ (id)productionManagedObjectModelURL
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HMDCoreData_productionManagedObjectModelURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (productionManagedObjectModelURL_onceTokenForBundle != -1) {
    dispatch_once(&productionManagedObjectModelURL_onceTokenForBundle, block);
  }
  uint64_t v1 = (void *)productionManagedObjectModelURL_sProductionURL;
  return v1;
}

void __47__HMDCoreData_developmentManagedObjectModelURL__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 URLForResource:@"HomeKitCoreDataModel-Development" withExtension:@"momd"];
  id v4 = (void *)developmentManagedObjectModelURL_developmentManagedObjectModelURL;
  developmentManagedObjectModelURL_developmentManagedObjectModelURL = v3;

  char v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v8;
    __int16 v11 = 2112;
    uint64_t v12 = developmentManagedObjectModelURL_developmentManagedObjectModelURL;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Development URL: %@", (uint8_t *)&v9, 0x16u);
  }
}

+ (NSURL)managedObjectModelURL
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HMDCoreData_managedObjectModelURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (managedObjectModelURL_onceTokenForURL != -1) {
    dispatch_once(&managedObjectModelURL_onceTokenForURL, block);
  }
  id v2 = (void *)managedObjectModelURL_managedObjectModelURL;
  return (NSURL *)v2;
}

+ (NSManagedObjectModel)managedObjectModel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HMDCoreData_managedObjectModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (managedObjectModel_once != -1) {
    dispatch_once(&managedObjectModel_once, block);
  }
  id v2 = (void *)managedObjectModel_model;
  return (NSManagedObjectModel *)v2;
}

void __33__HMDCoreData_managedObjectModel__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectModelURL];
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  char v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v2;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Using : %{public}@", (uint8_t *)&v9, 0x16u);
  }
  if (!v2) {
    _HMFPreconditionFailure();
  }
  uint64_t v7 = [objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v2];
  int v8 = (void *)managedObjectModel_model;
  managedObjectModel_model = v7;

  objc_msgSend((id)managedObjectModel_model, "hmd_makeImmutable");
}

+ (void)cleanUpSharedInstance
{
  [(id)_sharedInstance stopWatchingManagedObjectChanges];
  id v2 = (void *)_sharedInstance;
  _sharedInstance = 0;
}

+ (HMDCoreData)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HMDCoreData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_onceToken != -1) {
    dispatch_once(&_onceToken, block);
  }
  id v2 = (void *)_sharedInstance;
  return (HMDCoreData *)v2;
}

uint64_t __29__HMDCoreData_sharedInstance__block_invoke()
{
  uint64_t v0 = self;
  uint64_t v1 = [v0 defaultPersistentStoreDescriptions];
  uint64_t v2 = [v0 createWithPersistentStoreDescriptions:v1];

  uint64_t v3 = (void *)_sharedInstance;
  _sharedInstance = v2;

  [(id)_sharedInstance startWatchingManagedObjectChanges];
  id v4 = (void *)_sharedInstance;
  return [v4 startLoadingStores];
}

- (void)applyVoucherForModel:(id)a3 withModelID:(id)a4 eventType:(int64_t)a5 storeType:(unint64_t)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (a6 == 2)
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v15;
      __int16 v34 = 2112;
      id v35 = v10;
      uint64_t v16 = "%{public}@Voucher is not applicable to working store. %@";
LABEL_9:
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v17 = [v10 attributesByName];
  int v18 = [v17 objectForKeyedSubscript:@"modelID"];

  if (!v18)
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v15;
      __int16 v34 = 2112;
      id v35 = v10;
      uint64_t v16 = "%{public}@Entity doesn't contain modelID. %@";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_15;
  }
  if (a6) {
    [(HMDCoreData *)self cloudSharedStore];
  }
  else {
  uint64_t v19 = [(HMDCoreData *)self cloudPrivateStore];
  }
  __int16 v20 = +[MKFCKSharedHome fetchRequest];
  id v21 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"modelID", v11];
  [v20 setPredicate:v21];

  __int16 v22 = objc_opt_class();
  id v23 = [v10 name];
  uint64_t v24 = [v22 userInitiatedVoucherWithLabel:v23 forEventsOfType:a5 affectingObjectsMatching:v20];

  id v25 = (void *)MEMORY[0x230FBD990]();
  uint64_t v26 = self;
  objc_super v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v33 = v28;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2048;
    int64_t v37 = a5;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@applyVoucherForSharedHome %@ eventType: %ld", buf, 0x20u);
  }
  uint64_t v29 = [(HMDCoreData *)v26 container];
  uint64_t v31 = v19;
  id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  [v29 applyActivityVoucher:v24 toStores:v30];

LABEL_15:
}

+ (id)userInitiatedVoucherWithLabel:(id)a3 forEventsOfType:(int64_t)a4 affectingObjectsMatching:(id)a5
{
  int v8 = (objc_class *)MEMORY[0x263EFF2C8];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  uint64_t v12 = [a1 userInitiatedCKOperationConfiguration];
  uint64_t v13 = (void *)[v11 initWithLabel:v10 forEventsOfType:a4 withConfiguration:v12 affectingObjectsMatching:v9];

  return v13;
}

+ (id)userInitiatedCKOperationConfiguration
{
  dispatch_block_t v2 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_500);
  if (userInitiatedCKOperationConfiguration_onceToken != -1) {
    dispatch_once(&userInitiatedCKOperationConfiguration_onceToken, v2);
  }
  id v3 = (id)userInitiatedCKOperationConfiguration_configuration;

  return v3;
}

uint64_t __61__HMDCoreData_Voucher__userInitiatedCKOperationConfiguration__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD778]);
  uint64_t v1 = (void *)userInitiatedCKOperationConfiguration_configuration;
  userInitiatedCKOperationConfiguration_configuration = (uint64_t)v0;

  dispatch_block_t v2 = (void *)userInitiatedCKOperationConfiguration_configuration;
  return [v2 setQualityOfService:25];
}

@end