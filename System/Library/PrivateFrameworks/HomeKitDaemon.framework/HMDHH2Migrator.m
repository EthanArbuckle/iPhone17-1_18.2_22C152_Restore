@interface HMDHH2Migrator
+ (BOOL)shouldIgnoreModel:(id)a3;
+ (id)arrayByRemovingElementsInArray:(id)a3 fromArray:(id)a4;
+ (id)auditedHomeAccessCodeModelsFromModels:(id)a3 userAccessCodeModelsAndInvites:(id)a4;
+ (id)auditedUserAccessCodeModelsAndInvitesFromModels:(id)a3;
+ (id)logCategory;
+ (id)modelsByDroppingEmptyStringAccessCodesOnModels:(id)a3;
+ (id)userAccessCodeFromModel:(id)a3;
+ (int64_t)compareUserAccessCodeInModel:(id)a3 withModel:(id)a4;
- (BOOL)_performMigrationFromTestDirectoryUsingHH2ControllerKey:(id)a3;
- (BOOL)_saveAndResetWithContext:(id)a3 errorMessage:(id)a4;
- (BOOL)_startMigratingHomeDataFromLocation:(id)a3 usingHH2PairingKey:(id)a4;
- (BOOL)didCoreDataPushAllModelsToCloudKit:(id)a3 previousToken:(id)a4 cloudStore:(id)a5;
- (BOOL)fetchAndMigrateCameraSettingsFromAccessory:(id)a3 fromLocalZone:(id)a4 managedObjectContext:(id)a5;
- (BOOL)fetchAndMigrateCompositeSettingsFromAccessory:(id)a3 fromLocalZone:(id)a4 managedObjectContext:(id)a5;
- (BOOL)handlePostMigration;
- (BOOL)makeSureToCreateHH2SentinelZoneWithError:(id *)a3;
- (BOOL)migrateAccessoryV5Models:(id)a3 fromLocalZone:(id)a4 forHome:(id)a5 owner:(id)a6;
- (BOOL)migrateCameraProfileSettingModel:(id)a3 accessory:(id)a4 managedObjectContext:(id)a5;
- (BOOL)migrateCompositeAccessorySettingModel:(id)a3 accessory:(id)a4 managedObjectContext:(id)a5;
- (BOOL)migrateHome:(id)a3 primaryHomeUUID:(id)a4 managedObjectContext:(id)a5 hh2ControllerKey:(id)a6;
- (BOOL)migrateHomeData:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5;
- (BOOL)migrateHomeManager:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5;
- (BOOL)migrateHomePersonModelsForHomeUUID:(id)a3 localZone:(id)a4 managedObjectContext:(id)a5;
- (BOOL)migrateHomeToCoreData:(id)a3 primaryHomeUUID:(id)a4 managedObjectContext:(id)a5 hh2ControllerKey:(id)a6;
- (BOOL)migrateMediaContentProfileAccessControl:(id)a3 forOwnerUser:(id)a4 fromLocalZone:(id)a5;
- (BOOL)migratePersonFaceCropModelsForLocalZone:(id)a3;
- (BOOL)migratePhotosPersonManagerSettingsFromLocalZone:(id)a3 owner:(id)a4 managedObjectContext:(id)a5;
- (BOOL)migrateUserListeningHistoryControl:(id)a3 forOwnerUser:(id)a4 fromLocalZone:(id)a5;
- (BOOL)migrateUserSettingsToCoreData:(id)a3 forUser:(id)a4 fromLocalZone:(id)a5;
- (BOOL)migrateV5Models:(id)a3 forHome:(id)a4;
- (BOOL)migrateV5PersonDataForHome:(id)a3 managedObjectContext:(id)a4;
- (BOOL)populateAndSaveCDModelsFrom:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5 tag:(id)a6;
- (BOOL)rollAccessoryKeysToHH2:(id)a3 hh2ControllerKey:(id)a4;
- (BOOL)saveUserSettingsToCoreData:(id)a3 forUser:(id)a4 privateSettingsMap:(id)a5;
- (BOOL)scheduleAccessoryKeyMigration:(id)a3 oldPairingIdentity:(id)a4 hh2PairingIdentity:(id)a5;
- (BOOL)startMigratingHomeDataFromLocation:(id)a3;
- (BOOL)startMigrationFromLocation:(id)a3;
- (BOOL)startMigrationIfNeeded;
- (BOOL)waitForCDToExportModelsToCloudKit:(id)a3;
- (BOOL)waitForCloudKitSyncForProcessingResult:(id)a3 error:(id *)a4;
- (BOOL)waitForCloudTransformToRun;
- (BOOL)waitForFirstImportToFinish;
- (BOOL)waitForStartupForCloudZone:(id)a3;
- (BOOL)waitForV5UpdatesToSyncToCloudKit;
- (HMDBackgroundOperationManager)backgroundOpsManager;
- (HMDCoreData)coreData;
- (HMDCoreDataCloudTransform)cloudTransform;
- (HMDDatabase)cameraClipsDatabase;
- (HMDDatabase)defaultDatabase;
- (HMDHH2FrameworkSwitch)hh2FrameworkSwitch;
- (HMDHH2Migrator)init;
- (HMDHH2Migrator)initWithMigratorRecord:(id)a3 hh2FrameworkSwitch:(id)a4 coreData:(id)a5 cloudTransform:(id)a6 backgroundOperationManager:(id)a7 defaultDatabase:(id)a8 cameraClipsDatabase:(id)a9;
- (HMDHH2MigratorRecord)migratorRecord;
- (HMDHomeData)homeData;
- (NSDate)migrationStartTime;
- (NSMutableSet)openedZones;
- (NSMutableSet)scheduledKeyRollOperationsDuringMigration;
- (NSMutableSet)v5ModelUpdateFutures;
- (OS_dispatch_queue)queue;
- (id)_auditAccessCodesByRemovingIllegalDuplicatesFromModels:(id)a3;
- (id)allObjectIDsFromTransactions:(id)a3 cloudStoreIdentifier:(id)a4;
- (id)backingStoreObjectsForAccountsAndDevices:(id)a3;
- (id)findAndRemoveAllModelsWithInvalidAccessCodes:(id)a3;
- (id)makeListOfArchivesToMigrate:(id)a3;
- (id)openZoneWithName:(id)a3 inDatabase:(id)a4;
- (id)privateZoneForOwnerUser:(id)a3;
- (id)sharedZoneForOwnerUser:(id)a3;
- (void)_createResidentModelsDuringMigrationForAppleMediaAccessory:(id)a3 context:(id)a4;
- (void)_fixUpHomeWithoutOwner:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5;
- (void)_fixupAccessoryWithNoInitialValues:(id)a3;
- (void)_fixupAccessoryWithNoRoom:(id)a3 coreDataModelObject:(id)a4;
- (void)_fixupActionSetInvalidName:(id)a3 context:(id)a4;
- (void)_fixupActionSetUnlocalizedName:(id)a3;
- (void)_fixupAppleMediaAccessory:(id)a3 context:(id)a4;
- (void)_fixupCharacteristicEventTriggerInvalidService:(id)a3 context:(id)a4;
- (void)_fixupCharacteristicWriteActionWithInvalidService:(id)a3 context:(id)a4;
- (void)_fixupGuestAccessCodeWithInvalidLabel:(id)a3 context:(id)a4;
- (void)_fixupHomeInvalidName:(id)a3 context:(id)a4;
- (void)_fixupHomeManagerPairingIdentity:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5;
- (void)_fixupInvalidCharacteristicFormat:(id)a3 context:(id)a4;
- (void)_fixupSoftwareUpdateModelWithNoAccessory:(id)a3 coreDataModelObject:(id)a4;
- (void)_fixupTriggerInvalidName:(id)a3 context:(id)a4;
- (void)_fixupUserAccessCodeWithInvalidValue:(id)a3 context:(id)a4;
- (void)_fixupUserAuthorizationDataForUserModel:(id)a3;
- (void)_fixupUserPairingIdentity:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5;
- (void)_fixupUserUUID:(id)a3;
- (void)_updatePairingIdentityForHome:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5;
- (void)dealloc;
- (void)fixupAssistantAccessControlForUserModel:(id)a3;
- (void)fixupModelForMigration:(id)a3 backingStoreModelObject:(id)a4 hh2ControllerKey:(id)a5;
- (void)revertChangesPerformedDuringMigration;
- (void)setHomeData:(id)a3;
- (void)submitABCEventForFailedMigrationWithReason:(unint64_t)a3 withError:(id)a4;
@end

@implementation HMDHH2Migrator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_migrationStartTime, 0);
  objc_storeStrong((id *)&self->_cameraClipsDatabase, 0);
  objc_storeStrong((id *)&self->_defaultDatabase, 0);
  objc_storeStrong((id *)&self->_backgroundOpsManager, 0);
  objc_storeStrong((id *)&self->_cloudTransform, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_storeStrong((id *)&self->_openedZones, 0);
  objc_storeStrong((id *)&self->_v5ModelUpdateFutures, 0);
  objc_storeStrong((id *)&self->_scheduledKeyRollOperationsDuringMigration, 0);
  objc_storeStrong((id *)&self->_hh2FrameworkSwitch, 0);
  objc_storeStrong((id *)&self->_migratorRecord, 0);
}

- (void)setHomeData:(id)a3
{
}

- (HMDHomeData)homeData
{
  return self->_homeData;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)migrationStartTime
{
  return self->_migrationStartTime;
}

- (HMDDatabase)cameraClipsDatabase
{
  return self->_cameraClipsDatabase;
}

- (HMDDatabase)defaultDatabase
{
  return self->_defaultDatabase;
}

- (HMDBackgroundOperationManager)backgroundOpsManager
{
  return self->_backgroundOpsManager;
}

- (HMDCoreDataCloudTransform)cloudTransform
{
  return self->_cloudTransform;
}

- (HMDCoreData)coreData
{
  return self->_coreData;
}

- (NSMutableSet)openedZones
{
  return self->_openedZones;
}

- (NSMutableSet)v5ModelUpdateFutures
{
  return self->_v5ModelUpdateFutures;
}

- (NSMutableSet)scheduledKeyRollOperationsDuringMigration
{
  return self->_scheduledKeyRollOperationsDuringMigration;
}

- (HMDHH2FrameworkSwitch)hh2FrameworkSwitch
{
  return self->_hh2FrameworkSwitch;
}

- (HMDHH2MigratorRecord)migratorRecord
{
  return self->_migratorRecord;
}

- (id)makeListOfArchivesToMigrate:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = *MEMORY[0x263EFF6A8];
  v26[0] = *MEMORY[0x263EFF750];
  v26[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __46__HMDHH2Migrator_makeListOfArchivesToMigrate___block_invoke;
  v24[3] = &unk_264A28668;
  v24[4] = self;
  v8 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:v7 options:0 errorHandler:v24];

  v9 = [MEMORY[0x263EFF9C0] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "pathExtension", (void)v20);
        int v17 = [v16 isEqual:@"sqlite"];

        if (v17) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v12);
  }

  v18 = (void *)[v9 copy];
  return v18;
}

uint64_t __46__HMDHH2Migrator_makeListOfArchivesToMigrate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not adding file : %@ to migration list due to %@", (uint8_t *)&v12, 0x20u);
  }

  return 1;
}

- (BOOL)_performMigrationFromTestDirectoryUsingHH2ControllerKey:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = (id)hh1TestArchivesDirectoryPath;
    *(_DWORD *)buf = 138543618;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Was asked to migrate from test directory : %@", buf, 0x16u);
  }
  v9 = NSURL;
  id v10 = (id)hh1TestArchivesDirectoryPath;
  v39 = [v9 fileURLWithPath:v10];

  if (isInternalBuild())
  {
    uint64_t v11 = [MEMORY[0x263F35AD0] systemStore];
    id v49 = 0;
    int v12 = [v11 getOrCreateLocalPairingIdentity:&v49];
    id v38 = v49;

    BOOL v13 = v12 != 0;
    if (v12)
    {
      __int16 v14 = [(HMDHH2Migrator *)v5 makeListOfArchivesToMigrate:v39];
      id v15 = (void *)MEMORY[0x230FBD990]();
      __int16 v16 = v5;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v51 = v18;
        __int16 v52 = 2112;
        id v53 = v14;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@List of files to Migrate : %@", buf, 0x16u);
      }
      v19 = [MEMORY[0x263EFF9C0] set];
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2020000000;
      int v48 = 0;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __74__HMDHH2Migrator__performMigrationFromTestDirectoryUsingHH2ControllerKey___block_invoke;
      v41[3] = &unk_264A28640;
      v41[4] = v16;
      id v42 = v40;
      v44 = &v45;
      id v20 = v19;
      id v43 = v20;
      [v14 enumerateObjectsUsingBlock:v41];
      uint64_t v21 = [v14 count];
      long long v22 = (void *)MEMORY[0x230FBD990]();
      long long v23 = v16;
      HMFGetOSLogHandle();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = [NSNumber numberWithUnsignedInteger:v21 - *((int *)v46 + 6)];
        v27 = [NSNumber numberWithUnsignedInteger:v21];
        *(_DWORD *)buf = 138544130;
        id v51 = v25;
        __int16 v52 = 2112;
        id v53 = v26;
        __int16 v54 = 2112;
        v55 = v27;
        __int16 v56 = 2112;
        id v57 = v20;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Final Migration Status Succeeded: %@/%@, Failed list : %@", buf, 0x2Au);
      }
      v28 = [(HMDHH2Migrator *)v23 migratorRecord];
      [v28 finishMigration];

      _Block_object_dispose(&v45, 8);
    }
    else
    {
      v33 = (void *)MEMORY[0x230FBD990]();
      v34 = v5;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v51 = v36;
        __int16 v52 = 2112;
        id v53 = v38;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to get / create HH1 controller key : %@. Failing the test migration", buf, 0x16u);
      }
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = v5;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v51 = v32;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot migrate test archives as this is not an internal build", buf, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

void __74__HMDHH2Migrator__performMigrationFromTestDirectoryUsingHH2ControllerKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v19 = [MEMORY[0x263EFF910] date];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Picked up the file for migration: %@", buf, 0x16u);
  }
  id v8 = (void *)MEMORY[0x230FBD990]();
  v9 = *(void **)(a1 + 32);
  id v10 = [v3 path];
  int v11 = [v9 _startMigratingHomeDataFromLocation:v10 usingHH2PairingKey:*(void *)(a1 + 40)];

  int v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  __int16 v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    if (v11) {
      __int16 v16 = @"successfully";
    }
    else {
      __int16 v16 = @"with an error";
    }
    id v17 = [MEMORY[0x263EFF910] date];
    [v17 timeIntervalSinceDate:v19];
    *(_DWORD *)buf = 138544130;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    id v23 = v3;
    __int16 v24 = 2112;
    id v25 = v16;
    __int16 v26 = 2048;
    uint64_t v27 = v18;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Migration of [%@] finished [%@]. Total time: %f", buf, 0x2Au);
  }
  if ((v11 & 1) == 0)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    [*(id *)(a1 + 48) addObject:v3];
  }
}

- (void)submitABCEventForFailedMigrationWithReason:(unint64_t)a3 withError:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [MEMORY[0x263F42618] processInfo];
  id v8 = objc_alloc(MEMORY[0x263F7C080]);
  v9 = dispatch_get_global_queue(2, 0);
  id v10 = (void *)[v8 initWithQueue:v9];

  int v11 = [v7 name];
  int v12 = [v10 signatureWithDomain:@"HomeKit" type:@"CoreData" subType:@"Migration" detectedProcess:v11 triggerThresholdValues:0];

  unint64_t v13 = a3 - 1;
  if (a3 - 1 > 8) {
    __int16 v14 = @"Unknown";
  }
  else {
    __int16 v14 = off_264A28688[v13];
  }
  [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x263F7C190]];
  if (v6)
  {
    id v15 = [v6 description];
    [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x263F7C170]];
  }
  __int16 v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "identifier"));
  [v12 setObject:v16 forKeyedSubscript:*MEMORY[0x263F7C178]];

  id v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  uint64_t v18 = [MEMORY[0x263EFF910] date];
  [v18 timeIntervalSinceDate:self->_migrationStartTime];
  double v20 = v19;
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __71__HMDHH2Migrator_submitABCEventForFailedMigrationWithReason_withError___block_invoke;
  v51[3] = &unk_264A28618;
  v51[4] = self;
  uint64_t v21 = v17;
  __int16 v52 = v21;
  char v22 = [v10 snapshotWithSignature:v12 duration:0 event:0 payload:v51 reply:v20];

  if ((v22 & 1) == 0)
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    __int16 v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v49 = v6;
      unint64_t v26 = v13;
      uint64_t v27 = v10;
      v29 = uint64_t v28 = v7;
      *(_DWORD *)buf = 138543362;
      __int16 v54 = v29;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to submit ABC event", buf, 0xCu);

      v7 = v28;
      id v10 = v27;
      unint64_t v13 = v26;
      id v6 = v49;
    }
  }
  dispatch_time_t v30 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v21, v30))
  {
    v31 = (void *)MEMORY[0x230FBD990]();
    v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v50 = v12;
      v34 = v21;
      id v35 = v6;
      unint64_t v36 = v13;
      v37 = v10;
      v39 = id v38 = v7;
      *(_DWORD *)buf = 138543362;
      __int16 v54 = v39;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to file the ABC event", buf, 0xCu);

      v7 = v38;
      id v10 = v37;
      unint64_t v13 = v36;
      id v6 = v35;
      uint64_t v21 = v34;
      int v12 = v50;
    }
  }
  id v40 = (void *)MEMORY[0x230FBD990]();
  v41 = self;
  id v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    id v43 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v54 = v43;
    __int16 v55 = 2112;
    id v56 = v6;
    _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Migration to HH2 failed with error: %@", buf, 0x16u);
  }
  v44 = (void *)MEMORY[0x230FBD990]();
  uint64_t v45 = v41;
  v46 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
  {
    uint64_t v47 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v54 = v47;
    _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_FAULT, "%{public}@Migration to HH2 failed", buf, 0xCu);
  }
  if (v13 > 8) {
    int v48 = @"Unknown";
  }
  else {
    int v48 = off_264A28688[v13];
  }
  +[HMDHH2MigrationStateLogger recordMigrationFailedWithError:v6 withReason:v48];
}

void __71__HMDHH2Migrator_submitABCEventForFailedMigrationWithReason_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@ABC event was not submitted due to : %@", (uint8_t *)&v8, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)waitForFirstImportToFinish
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHH2Migrator *)self migratorRecord];
  if ([v3 migrateFromTestDirectory])
  {

LABEL_4:
    id v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v22 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Not going to wait for first import to finish as we are running without live CloudKit", buf, 0xCu);
    }
    return 1;
  }
  id v4 = [(HMDHH2Migrator *)self migratorRecord];
  int v5 = [v4 dryRun];

  if (v5) {
    goto LABEL_4;
  }
  id v19 = 0;
  id v20 = 0;
  id v11 = [(HMDHH2Migrator *)self coreData];
  uint64_t v12 = [v11 firstCloudKitImportFuture];
  char v10 = [v12 waitForResult:&v19 orError:&v20 withTimeout:900.0];

  unint64_t v13 = (void *)MEMORY[0x230FBD990]();
  __int16 v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = HMFGetLogIdentifier();
    id v17 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    char v22 = v16;
    __int16 v23 = 2112;
    __int16 v24 = v17;
    __int16 v25 = 2112;
    id v26 = v20;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Did first import finished: %@ error: %@", buf, 0x20u);
  }
  if ((v10 & 1) == 0) {
    [(HMDHH2Migrator *)v14 submitABCEventForFailedMigrationWithReason:3 withError:v20];
  }

  return v10;
}

- (BOOL)migratePersonFaceCropModelsForLocalZone:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    char v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Migrating person face crop models for local zone: %@", buf, 0x16u);
  }
  v9 = [MEMORY[0x263EFF9C0] set];
  char v10 = [v4 queryModelsOfType:objc_opt_class()];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__HMDHH2Migrator_migratePersonFaceCropModelsForLocalZone___block_invoke;
  v17[3] = &unk_264A285F0;
  id v11 = v9;
  id v18 = v11;
  id v12 = v4;
  id v19 = v12;
  id v20 = v6;
  [v10 enumerateObjectsUsingBlock:v17];
  if ([v11 count])
  {
    unint64_t v13 = [MEMORY[0x263F49318] optionsWithLabel:@"Migrate face crop models to HH2"];
    __int16 v14 = [v12 updateModels:v11 options:v13];
    id v15 = [(HMDHH2Migrator *)v6 v5ModelUpdateFutures];
    [v15 addObject:v14];
  }
  return 1;
}

void __58__HMDHH2Migrator_migratePersonFaceCropModelsForLocalZone___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [HMDFaceCropModel alloc];
  int v5 = [v3 hmbModelID];
  id v6 = [v3 hmbParentModelID];
  id v12 = [(HMBModel *)v4 initWithModelID:v5 parentModelID:v6];

  v7 = [v3 person];

  int v8 = [v7 hmbModelID];
  [(HMDFaceCropModel *)v12 setPersonUUID:v8];

  [a1[4] addObject:v12];
  if ((unint64_t)[a1[4] count] >= 0x15)
  {
    v9 = [MEMORY[0x263F49318] optionsWithLabel:@"Migrate face crop models to HH2"];
    char v10 = [a1[5] updateModels:a1[4] options:v9];
    id v11 = [a1[6] v5ModelUpdateFutures];
    [v11 addObject:v10];

    [a1[4] removeAllObjects];
  }
}

- (BOOL)migrateHomePersonModelsForHomeUUID:(id)a3 localZone:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  unint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Migrating home person models for local zone: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v26 = 1;
  id v15 = [v9 queryModelsOfType:objc_opt_class()];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __84__HMDHH2Migrator_migrateHomePersonModelsForHomeUUID_localZone_managedObjectContext___block_invoke;
  v20[3] = &unk_264A285C8;
  id v16 = v10;
  id v21 = v16;
  char v22 = v12;
  id v17 = v8;
  id v23 = v17;
  id v24 = buf;
  [v15 enumerateObjectsUsingBlock:v20];
  BOOL v18 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v18;
}

void __84__HMDHH2Migrator_migrateHomePersonModelsForHomeUUID_localZone_managedObjectContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__HMDHH2Migrator_migrateHomePersonModelsForHomeUUID_localZone_managedObjectContext___block_invoke_2;
  v11[3] = &unk_264A285A0;
  id v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v5;
  id v13 = v7;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  id v14 = v8;
  uint64_t v15 = v9;
  uint64_t v16 = a3;
  id v10 = v5;
  [v6 performBlockAndWait:v11];
}

void __84__HMDHH2Migrator_migrateHomePersonModelsForHomeUUID_localZone_managedObjectContext___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v5;
    __int16 v26 = 2112;
    uint64_t v27 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Migrating home person model: %@", buf, 0x16u);
  }
  v7 = +[_MKFModel modelWithModelID:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) hmbModelID];
    uint64_t v9 = +[_MKFModel modelWithModelID:v8 context:*(void *)(a1 + 56)];
    if (!v9)
    {
      uint64_t v9 = [[_MKFHomePerson alloc] initWithContext:*(void *)(a1 + 56)];
      [(_MKFHomePerson *)v9 setModelID:v8];
      [(_MKFHomePerson *)v9 setHome:v7];
    }
    id v10 = [*(id *)(a1 + 40) name];
    [(_MKFHomePerson *)v9 setName:v10];

    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = *(void **)(a1 + 32);
    id v13 = [NSString stringWithFormat:@"Failed to save home person for home person model: %@", *(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v12 _saveAndResetWithContext:v11 errorMessage:v13];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v17;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated home person model: %@", buf, 0x16u);
      }
    }
    else
    {
      **(unsigned char **)(a1 + 72) = 1;
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v22 = HMFGetLogIdentifier();
      uint64_t v23 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v22;
      __int16 v26 = 2112;
      uint64_t v27 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to find home with model ID: %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    **(unsigned char **)(a1 + 72) = 1;
  }
}

- (BOOL)migrateV5PersonDataForHome:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 personManagerZoneUUID];
  if (v8)
  {
    uint64_t v9 = +[HMDHomePersonManager zoneNameForZoneUUID:v8];
    id v10 = [(HMDHH2Migrator *)self cameraClipsDatabase];
    uint64_t v11 = [(HMDHH2Migrator *)self openZoneWithName:v9 inDatabase:v10];

    id v12 = (void *)MEMORY[0x230FBD990]();
    if (!v11)
    {
      id v20 = self;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        char v22 = HMFGetLogIdentifier();
        int v29 = 138543618;
        dispatch_time_t v30 = v22;
        __int16 v31 = 2112;
        id v32 = v6;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to open home person manager zone for home: %@", (uint8_t *)&v29, 0x16u);
      }
      goto LABEL_18;
    }
    id v13 = [v6 uuid];
    BOOL v14 = [(HMDHH2Migrator *)self migrateHomePersonModelsForHomeUUID:v13 localZone:v11 managedObjectContext:v7];

    if (v14)
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      if ([(HMDHH2Migrator *)self migratePersonFaceCropModelsForLocalZone:v11])
      {
        BOOL v15 = 1;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      __int16 v26 = HMFGetLogIdentifier();
      int v29 = 138543618;
      dispatch_time_t v30 = v26;
      __int16 v31 = 2112;
      id v32 = v6;
      uint64_t v27 = "%{public}@Failed to migrate person face crop models for home: %@";
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

LABEL_18:
        BOOL v15 = 0;
        goto LABEL_19;
      }
      __int16 v26 = HMFGetLogIdentifier();
      int v29 = 138543618;
      dispatch_time_t v30 = v26;
      __int16 v31 = 2112;
      id v32 = v6;
      uint64_t v27 = "%{public}@Failed to migrate home person models for home: %@";
    }
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v29, 0x16u);

    goto LABEL_17;
  }
  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = self;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    int v29 = 138543362;
    dispatch_time_t v30 = v19;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Not migrating home person models because no home person manager zone UUID exists", (uint8_t *)&v29, 0xCu);
  }
  BOOL v15 = 1;
LABEL_20:

  return v15;
}

- (BOOL)migrateCameraProfileSettingModel:(id)a3 accessory:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    BOOL v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    id v27 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Found camera profile setting model on accessory : [%@], [%@]", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v27) = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __82__HMDHH2Migrator_migrateCameraProfileSettingModel_accessory_managedObjectContext___block_invoke;
  v20[3] = &unk_264A2F078;
  id v15 = v9;
  id v21 = v15;
  id v16 = v10;
  id v22 = v16;
  uint64_t v23 = v12;
  uint64_t v25 = buf;
  id v17 = v8;
  id v24 = v17;
  [v16 performBlockAndWait:v20];
  BOOL v18 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v18;
}

void __82__HMDHH2Migrator_migrateCameraProfileSettingModel_accessory_managedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[_MKFModel modelWithModelID:v2 context:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "accessModeAtHome"));
    [v3 setCameraAccessModeAtHome:v4];

    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "accessModeNotAtHome"));
    [v3 setCameraAccessModeNotAtHome:v5];

    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "recordingEventTriggers"));
    [v3 setCameraRecordingEventTriggers:v6];

    id v7 = [*(id *)(a1 + 56) activityZones];
    [v3 setCameraActivityZones:v7];

    id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 56), "activityZonesIncludedForSignificantEventDetection"));
    [v3 setCameraActivityZonesIncludedForSignificantEventDetection:v8];

    uint64_t v10 = *(void *)(a1 + 40);
    id v9 = *(void **)(a1 + 48);
    uint64_t v11 = NSString;
    id v12 = [v3 debugDescription];
    id v13 = [v11 stringWithFormat:@"Unable to save the camera profile settings for: %@", v12];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v9 _saveAndResetWithContext:v10 errorMessage:v13];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      BOOL v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = *(id *)(a1 + 48);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        BOOL v18 = [v3 debugDescription];
        *(_DWORD *)buf = 138543618;
        id v24 = v17;
        __int16 v25 = 2112;
        __int16 v26 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully stored camera profile settings for %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 48);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v22;
      __int16 v25 = 2112;
      __int16 v26 = 0;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to get MKFHAPAccessory for %@. Failing the migration due to that.", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (BOOL)fetchAndMigrateCameraSettingsFromAccessory:(id)a3 fromLocalZone:(id)a4 managedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v11 = [v8 uuid];
  id v12 = [v9 queryModelsWithParentModelID:v11 ofType:objc_opt_class()];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__HMDHH2Migrator_fetchAndMigrateCameraSettingsFromAccessory_fromLocalZone_managedObjectContext___block_invoke;
  v16[3] = &unk_264A28578;
  id v19 = &v20;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [v12 enumerateObjectsUsingBlock:v16];
  LOBYTE(v10) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v10;
}

uint64_t __96__HMDHH2Migrator_fetchAndMigrateCameraSettingsFromAccessory_fromLocalZone_managedObjectContext___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) migrateCameraProfileSettingModel:a2 accessory:*(void *)(a1 + 40) managedObjectContext:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (BOOL)migrateCompositeAccessorySettingModel:(id)a3 accessory:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    id v15 = [v8 debugDescription];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v28 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Found composite accessory setting model on accessory : [%@], [%@]", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v28) = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __87__HMDHH2Migrator_migrateCompositeAccessorySettingModel_accessory_managedObjectContext___block_invoke;
  v21[3] = &unk_264A2F078;
  id v16 = v9;
  id v22 = v16;
  id v17 = v10;
  id v23 = v17;
  id v24 = v12;
  __int16 v26 = buf;
  id v18 = v8;
  id v25 = v18;
  [v17 performBlockAndWait:v21];
  BOOL v19 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v19;
}

void __87__HMDHH2Migrator_migrateCompositeAccessorySettingModel_accessory_managedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[_MKFModel modelWithModelID:v2 context:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = objc_msgSend(*(id *)(a1 + 56), "root_siri_soundAlert_value");
    [v3 setSoundAlertEnabled:v4];

    id v5 = objc_msgSend(*(id *)(a1 + 56), "root_siri_lightWhenUsingSiri_value");
    [v3 setLightWhenUsingSiriEnabled:v5];

    id v6 = objc_msgSend(*(id *)(a1 + 56), "root_siri_siriEnabled_value");
    [v3 setSiriEnabled:v6];

    id v7 = objc_msgSend(*(id *)(a1 + 56), "root_siri_language_inputLanguageCodeValueName");
    [v3 setSiriLanguageCode:v7];

    id v8 = objc_msgSend(*(id *)(a1 + 56), "root_siri_language_outputLanguageVoiceCodeValueName");
    [v3 setSiriLanguageVoiceCode:v8];

    id v9 = objc_msgSend(*(id *)(a1 + 56), "root_siri_language_outputLanguageGenderCodeValueName");
    [v3 setSiriLanguageVoiceGenderCode:v9];

    id v10 = objc_msgSend(*(id *)(a1 + 56), "root_siri_language_voiceNameValueName");
    [v3 setSiriLanguageVoiceName:v10];

    uint64_t v11 = objc_msgSend(*(id *)(a1 + 56), "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
    [v3 setHasDismissedHomePodHasNonMemberMediaAccountWarning:v11];

    id v12 = objc_msgSend(*(id *)(a1 + 56), "root_doorbellChime_enabled_value");
    [v3 setDoorbellChimeEnabled:v12];

    id v13 = objc_msgSend(*(id *)(a1 + 56), "root_announce_enabled_value");
    [v3 setAnnounceEnabled:v13];

    id v14 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
    [v3 setVisionDoubleTapSettingsTimeoutInterval:v14];

    id v15 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_vision_voiceOver_enabled_value");
    [v3 setVisionVoiceOverEnabled:v15];

    id v16 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
    [v3 setVisionVoiceOverAudioDuckingEnabled:v16];

    id v17 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
    [v3 setVisionSpeakingRate:v17];

    id v18 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_holdDuration_enabled_value");
    [v3 setInteractionHoldDurationEnabled:v18];

    BOOL v19 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_holdDuration_seconds_value");
    [v3 setInteractionHoldDurationSeconds:v19];

    uint64_t v20 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_touchAccommodations_enabled_value");
    [v3 setInteractionTouchAccommodationsEnabled:v20];

    id v21 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
    [v3 setInteractionIgnoreRepeatEnabled:v21];

    id v22 = objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
    [v3 setInteractionIgnoreRepeatSeconds:v22];

    id v23 = objc_msgSend(*(id *)(a1 + 56), "root_general_analytics_shareSiriAnalytics_value");
    [v3 setShareSiriAnalytics:v23];

    id v24 = objc_msgSend(*(id *)(a1 + 56), "root_general_analytics_shareSpeakerAnalytics_value");
    [v3 setShareSpeakerAnalytics:v24];

    id v25 = objc_msgSend(*(id *)(a1 + 56), "root_airPlay_airPlayEnabled_value");
    [v3 setAirPlayEnabled:v25];

    __int16 v26 = objc_msgSend(*(id *)(a1 + 56), "root_siriEndpoint_enabled_value");
    [v3 setSiriEndpointEnabled:v26];

    uint64_t v28 = *(void *)(a1 + 40);
    uint64_t v27 = *(void **)(a1 + 48);
    uint64_t v29 = [NSString stringWithFormat:@"Unable to save the sidekick settings for: %@", v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v27 _saveAndResetWithContext:v28 errorMessage:v29];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      dispatch_time_t v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = *(id *)(a1 + 48);
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        v34 = [v3 debugDescription];
        *(_DWORD *)buf = 138543618;
        id v40 = v33;
        __int16 v41 = 2112;
        id v42 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Successfully stored sidekick settings for %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = *(id *)(a1 + 48);
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v40 = v38;
      __int16 v41 = 2112;
      id v42 = 0;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to get MKFHAPAccessory for %@. Failing the migration due to that.", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (BOOL)fetchAndMigrateCompositeSettingsFromAccessory:(id)a3 fromLocalZone:(id)a4 managedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v11 = [v8 uuid];
  id v12 = [v9 queryModelsWithParentModelID:v11 ofType:objc_opt_class()];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __99__HMDHH2Migrator_fetchAndMigrateCompositeSettingsFromAccessory_fromLocalZone_managedObjectContext___block_invoke;
  v16[3] = &unk_264A28550;
  BOOL v19 = &v20;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [v12 enumerateObjectsUsingBlock:v16];
  LOBYTE(v10) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v10;
}

uint64_t __99__HMDHH2Migrator_fetchAndMigrateCompositeSettingsFromAccessory_fromLocalZone_managedObjectContext___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) migrateCompositeAccessorySettingModel:a2 accessory:*(void *)(a1 + 40) managedObjectContext:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (BOOL)migratePhotosPersonManagerSettingsFromLocalZone:(id)a3 owner:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    id v26 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Migrating person manager settings for user: %@, localZone: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v26) = 1;
  id v15 = [v8 queryModelsOfType:objc_opt_class()];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __93__HMDHH2Migrator_migratePhotosPersonManagerSettingsFromLocalZone_owner_managedObjectContext___block_invoke;
  v20[3] = &unk_264A28528;
  id v16 = v9;
  id v21 = v16;
  id v17 = v10;
  id v22 = v17;
  char v23 = v12;
  id v24 = buf;
  [v15 enumerateObjectsUsingBlock:v20];
  BOOL v18 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v18;
}

void __93__HMDHH2Migrator_migratePhotosPersonManagerSettingsFromLocalZone_owner_managedObjectContext___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) uuid];
  id v7 = +[_MKFModel modelWithModelID:v6 context:*(void *)(a1 + 40)];

  if (v7)
  {
    id v8 = [v5 sharingFaceClassificationsEnabled];
    [v7 setSharePhotosFaceClassifications:v8];

    id v9 = [v5 zoneUUID];
    [v7 setPhotosPersonDataZoneUUID:v9];

    uint64_t v11 = *(void *)(a1 + 40);
    id v10 = *(void **)(a1 + 48);
    id v12 = [NSString stringWithFormat:@"Unable to save the photos person manager settings for: %@", *(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 _saveAndResetWithContext:v11 errorMessage:v12];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 48);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v24 = v16;
        __int16 v25 = 2112;
        uint64_t v26 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully stored photos person manager settings for %@", buf, 0x16u);
      }
    }
  }
  else
  {
    BOOL v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 48);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v24 = v21;
      __int16 v25 = 2112;
      uint64_t v26 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not sure how this happened. Unable to find the MKFUser for : %@", buf, 0x16u);
    }
    *a3 = 1;
  }
}

- (BOOL)migrateAccessoryV5Models:(id)a3 fromLocalZone:(id)a4 forHome:(id)a5 owner:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Will look for all the V5 models and migrate them for home : %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v28 = 1;
  BOOL v18 = [v12 accessories];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __71__HMDHH2Migrator_migrateAccessoryV5Models_fromLocalZone_forHome_owner___block_invoke;
  v23[3] = &unk_264A28500;
  v23[4] = v15;
  id v19 = v12;
  id v24 = v19;
  uint64_t v26 = buf;
  id v20 = v10;
  id v25 = v20;
  [v18 enumerateObjectsUsingBlock:v23];

  BOOL v21 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v21;
}

void __71__HMDHH2Migrator_migrateAccessoryV5Models_fromLocalZone_forHome_owner___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) uuid];
  id v10 = +[HMDCompositeSettingsControllerManager zoneNameForHomeUUID:v9];
  id v11 = [*(id *)(a1 + 32) defaultDatabase];
  id v12 = [v8 openZoneWithName:v10 inDatabase:v11];

  if (v12)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) fetchAndMigrateCompositeSettingsFromAccessory:v6 fromLocalZone:v12 managedObjectContext:*(void *)(a1 + 48)];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      BOOL v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [v6 debugDescription];
        int v22 = 138543618;
        char v23 = v19;
        __int16 v24 = 2112;
        id v25 = v20;
        BOOL v21 = "%{public}@Could not migrate sidekick settings for accessory : %@";
        goto LABEL_9;
      }
LABEL_10:

      *a4 = 1;
      goto LABEL_11;
    }
  }

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(void **)(a1 + 32);
  id v14 = +[HMDCameraProfileSettingsManager zoneNameForHome:*(void *)(a1 + 40)];
  id v15 = [*(id *)(a1 + 32) defaultDatabase];
  id v12 = [v13 openZoneWithName:v14 inDatabase:v15];

  if (v12)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) fetchAndMigrateCameraSettingsFromAccessory:v6 fromLocalZone:v12 managedObjectContext:*(void *)(a1 + 48)];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      BOOL v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [v6 debugDescription];
        int v22 = 138543618;
        char v23 = v19;
        __int16 v24 = 2112;
        id v25 = v20;
        BOOL v21 = "%{public}@Could not migrate camera profile settings for accessory : %@";
LABEL_9:
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v22, 0x16u);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (BOOL)saveUserSettingsToCoreData:(id)a3 forUser:(id)a4 privateSettingsMap:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@User Settings : %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v36 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __72__HMDHH2Migrator_saveUserSettingsToCoreData_forUser_privateSettingsMap___block_invoke;
  v25[3] = &unk_264A2F078;
  id v15 = v9;
  id v26 = v15;
  id v16 = v8;
  id v27 = v16;
  char v28 = v12;
  id v17 = v10;
  id v29 = v17;
  dispatch_time_t v30 = buf;
  BOOL v18 = (void *)MEMORY[0x230FBD990]([v16 performBlockAndWait:v25]);
  id v19 = v12;
  HMFGetOSLogHandle();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    int v22 = HMFBooleanToString();
    *(_DWORD *)id v31 = 138543618;
    id v32 = v21;
    __int16 v33 = 2112;
    v34 = v22;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Migrating user's owned settings finished : %@", v31, 0x16u);
  }
  BOOL v23 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v23;
}

void __72__HMDHH2Migrator_saveUserSettingsToCoreData_forUser_privateSettingsMap___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[_MKFModel modelWithModelID:v2 context:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = +[_MKFUser entity];
    id v5 = objc_msgSend(v4, "hmd_attributesBySettingsPath");

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __72__HMDHH2Migrator_saveUserSettingsToCoreData_forUser_privateSettingsMap___block_invoke_198;
    v19[3] = &unk_264A284D8;
    id v6 = *(void **)(a1 + 56);
    v19[4] = *(void *)(a1 + 48);
    id v20 = *(id *)(a1 + 32);
    id v21 = v5;
    id v7 = v3;
    id v22 = v7;
    id v8 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v19];
    uint64_t v10 = *(void *)(a1 + 40);
    id v9 = *(void **)(a1 + 48);
    id v11 = NSString;
    id v12 = [v7 debugDescription];
    id v13 = [v11 stringWithFormat:@"Unable to save the owner's private settings : %@", v12];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v9 _saveAndResetWithContext:v10 errorMessage:v13];
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 48);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFUser in database: %@", buf, 0x16u);
    }
  }
}

void __72__HMDHH2Migrator_saveUserSettingsToCoreData_forUser_privateSettingsMap___block_invoke_198(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 type];
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7 == 2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v28 = 138543874;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v5;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[keyPath = %@] : [Value = %@]", (uint8_t *)&v28, 0x20u);
    }
    id v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
    id v14 = [v13 name];

    if (v14)
    {
      id v15 = *(id *)(a1 + 56);
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [v6 numberValue];
        int v28 = 138544130;
        id v29 = v19;
        __int16 v30 = 2112;
        id v31 = v5;
        __int16 v32 = 2112;
        id v33 = v20;
        __int16 v34 = 2112;
        id v35 = v14;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Going to save setting:[%@] with value:[%@] on attribute: [%@]", (uint8_t *)&v28, 0x2Au);
      }
      id v21 = [v6 numberValue];
      [v15 setValue:v21 forKey:v14];
    }
    else
    {
      __int16 v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = *(id *)(a1 + 32);
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v28 = 138543618;
        id v29 = v27;
        __int16 v30 = 2112;
        id v31 = v5;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Did not find mapping of settings to attribute name. [%@]", (uint8_t *)&v28, 0x16u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      BOOL v23 = *(void **)(a1 + 40);
      int v28 = 138543874;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v23;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Non number setting found : [%@] for user :[%@]. Only expecting number setting for private settings", (uint8_t *)&v28, 0x20u);
    }
  }
}

- (BOOL)migrateUserSettingsToCoreData:(id)a3 forUser:(id)a4 fromLocalZone:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    int v24 = 138543874;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate user settings for user [%@] from local zone: [%@]", (uint8_t *)&v24, 0x20u);
  }
  id v15 = [v9 uuid];
  id v16 = +[HMDUser getSettingsUsingPreOrderTraversal:v10 rootUUID:v15 keyPath:&stru_26E2EB898];

  uint64_t v17 = [v16 count];
  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
  if (v17)
  {
    char v19 = [(HMDHH2Migrator *)v12 saveUserSettingsToCoreData:v8 forUser:v9 privateSettingsMap:v16];
  }
  else
  {
    id v20 = v12;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      int v24 = 138543618;
      id v25 = v22;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Did not find any settings model for user : %@", (uint8_t *)&v24, 0x16u);
    }
    char v19 = 1;
  }

  return v19;
}

- (BOOL)migrateUserListeningHistoryControl:(id)a3 forOwnerUser:(id)a4 fromLocalZone:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  id v11 = [MEMORY[0x263EFF980] array];
  id v12 = [v10 queryModelsOfType:objc_opt_class()];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __80__HMDHH2Migrator_migrateUserListeningHistoryControl_forOwnerUser_fromLocalZone___block_invoke;
  v29[3] = &unk_264A284B0;
  id v13 = v11;
  id v30 = v13;
  id v14 = (void *)MEMORY[0x230FBD990]([v12 enumerateObjectsUsingBlock:v29]);
  id v15 = self;
  HMFGetOSLogHandle();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v17;
    __int16 v37 = 2112;
    id v38 = v13;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Found listening history control enabled accessories: %@", buf, 0x16u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __80__HMDHH2Migrator_migrateUserListeningHistoryControl_forOwnerUser_fromLocalZone___block_invoke_194;
  v23[3] = &unk_264A2F078;
  id v18 = v9;
  id v24 = v18;
  id v19 = v8;
  id v25 = v19;
  __int16 v26 = v15;
  __int16 v28 = &v31;
  id v20 = v13;
  id v27 = v20;
  [v19 performBlockAndWait:v23];
  BOOL v21 = *((unsigned char *)v32 + 24) != 0;

  _Block_object_dispose(&v31, 8);
  return v21;
}

void __80__HMDHH2Migrator_migrateUserListeningHistoryControl_forOwnerUser_fromLocalZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessories];
  [v2 addObjectsFromArray:v3];
}

void __80__HMDHH2Migrator_migrateUserListeningHistoryControl_forOwnerUser_fromLocalZone___block_invoke_194(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = *(void *)(a1 + 40);
  id v43 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v43];
  id v5 = v43;

  if (v4)
  {
    char v34 = v4;
    id v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = *(id *)(a1 + 56);
    uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    uint64_t v8 = a1;
    id v35 = v6;
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v40;
      p_cache = MKFCKOutgoingInvitation.cache;
      do
      {
        uint64_t v12 = 0;
        id v13 = v5;
        uint64_t v36 = v9;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
          uint64_t v15 = *(void *)(v8 + 40);
          id v38 = v13;
          id v16 = [p_cache + 168 modelWithModelID:v14 context:v15 error:&v38];
          id v5 = v38;

          if (v16)
          {
            [v6 addObject:v16];
          }
          else
          {
            uint64_t v17 = v10;
            id v18 = (void *)MEMORY[0x230FBD990]();
            id v19 = *(id *)(v8 + 48);
            id v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v21 = v5;
              v23 = uint64_t v22 = v8;
              *(_DWORD *)buf = 138543618;
              v46 = v23;
              __int16 v47 = 2112;
              int v48 = v14;
              _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to find accessory with UUID %@ when migrating user listening history control", buf, 0x16u);

              uint64_t v8 = v22;
              id v5 = v21;
              id v6 = v35;
            }

            uint64_t v10 = v17;
            p_cache = (void **)(MKFCKOutgoingInvitation + 16);
            uint64_t v9 = v36;
          }

          ++v12;
          id v13 = v5;
        }
        while (v9 != v12);
        uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v9);
    }

    id v24 = (void *)[v6 copy];
    id v4 = v34;
    objc_msgSend(v34, "setAccessoriesWithListeningHistoryEnabled_:", v24);

    *(unsigned char *)(*(void *)(*(void *)(v8 + 64) + 8) + 24) = [*(id *)(v8 + 48) _saveAndResetWithContext:*(void *)(v8 + 40) errorMessage:@"Unable to save the migrated user listening history control"];
    if (*(unsigned char *)(*(void *)(*(void *)(v8 + 64) + 8) + 24))
    {
      id v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = *(id *)(v8 + 48);
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        __int16 v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v46 = v28;
        __int16 v47 = 2112;
        int v48 = v35;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated user listening history control for accessories: %@", buf, 0x16u);
      }
      id v6 = v35;
    }
  }
  else
  {
    id v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = *(id *)(a1 + 48);
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      uint64_t v33 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v32;
      __int16 v47 = 2112;
      int v48 = v33;
      __int16 v49 = 2112;
      id v50 = v5;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate user listening history control because owner user %@ fetch failed with error %@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (BOOL)migrateMediaContentProfileAccessControl:(id)a3 forOwnerUser:(id)a4 fromLocalZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  id v11 = [MEMORY[0x263EFF980] array];
  uint64_t v12 = [v10 queryModelsOfType:objc_opt_class()];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __85__HMDHH2Migrator_migrateMediaContentProfileAccessControl_forOwnerUser_fromLocalZone___block_invoke;
  v24[3] = &unk_264A28488;
  id v13 = v11;
  id v25 = v13;
  [v12 enumerateObjectsUsingBlock:v24];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __85__HMDHH2Migrator_migrateMediaContentProfileAccessControl_forOwnerUser_fromLocalZone___block_invoke_2;
  v18[3] = &unk_264A2F078;
  id v14 = v9;
  id v19 = v14;
  id v15 = v8;
  id v20 = v15;
  id v21 = self;
  BOOL v23 = &v26;
  id v16 = v13;
  id v22 = v16;
  [v15 performBlockAndWait:v18];
  LOBYTE(v13) = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)v13;
}

void __85__HMDHH2Migrator_migrateMediaContentProfileAccessControl_forOwnerUser_fromLocalZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessories];
  [v2 addObjectsFromArray:v3];
}

void __85__HMDHH2Migrator_migrateMediaContentProfileAccessControl_forOwnerUser_fromLocalZone___block_invoke_2(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = *(void *)(a1 + 40);
  id v43 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v43];
  id v5 = v43;

  if (v4)
  {
    char v34 = v4;
    id v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = *(id *)(a1 + 56);
    uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    uint64_t v8 = a1;
    id v35 = v6;
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v40;
      p_cache = MKFCKOutgoingInvitation.cache;
      do
      {
        uint64_t v12 = 0;
        id v13 = v5;
        uint64_t v36 = v9;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
          uint64_t v15 = *(void *)(v8 + 40);
          id v38 = v13;
          id v16 = [p_cache + 168 modelWithModelID:v14 context:v15 error:&v38];
          id v5 = v38;

          if (v16)
          {
            [v6 addObject:v16];
          }
          else
          {
            uint64_t v17 = v10;
            id v18 = (void *)MEMORY[0x230FBD990]();
            id v19 = *(id *)(v8 + 48);
            id v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v21 = v5;
              v23 = uint64_t v22 = v8;
              *(_DWORD *)buf = 138543618;
              v46 = v23;
              __int16 v47 = 2112;
              int v48 = v14;
              _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to find accessory with UUID %@ when migrating media content profile access control", buf, 0x16u);

              uint64_t v8 = v22;
              id v5 = v21;
              id v6 = v35;
            }

            uint64_t v10 = v17;
            p_cache = (void **)(MKFCKOutgoingInvitation + 16);
            uint64_t v9 = v36;
          }

          ++v12;
          id v13 = v5;
        }
        while (v9 != v12);
        uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v9);
    }

    id v24 = (void *)[v6 copy];
    id v4 = v34;
    objc_msgSend(v34, "setAccessoriesWithMediaContentProfileEnabled_:", v24);

    *(unsigned char *)(*(void *)(*(void *)(v8 + 64) + 8) + 24) = [*(id *)(v8 + 48) _saveAndResetWithContext:*(void *)(v8 + 40) errorMessage:@"Unable to save the migrated media content profile access control"];
    if (*(unsigned char *)(*(void *)(*(void *)(v8 + 64) + 8) + 24))
    {
      id v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = *(id *)(v8 + 48);
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v46 = v28;
        __int16 v47 = 2112;
        int v48 = v35;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated media content profile access control for accessories %@", buf, 0x16u);
      }
      id v6 = v35;
    }
  }
  else
  {
    char v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = *(id *)(a1 + 48);
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      uint64_t v33 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v32;
      __int16 v47 = 2112;
      int v48 = v33;
      __int16 v49 = 2112;
      id v50 = v5;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate media content profile access control because owner user %@ fetch failed with error %@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (BOOL)migrateV5Models:(id)a3 forHome:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v34 = 138543618;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting migration for V5 models for home : %@", (uint8_t *)&v34, 0x16u);
  }
  uint64_t v12 = [v7 owner];
  if (v12)
  {
    id v13 = [(HMDHH2Migrator *)v9 privateZoneForOwnerUser:v12];
    if (!v13)
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = v9;
      BOOL v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        int v34 = 138543618;
        id v35 = v24;
        __int16 v36 = 2112;
        id v37 = v12;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate V5 models: could not get private zone for owner user: %@", (uint8_t *)&v34, 0x16u);
      }
      BOOL v16 = 0;
      goto LABEL_41;
    }
    id v14 = [(HMDHH2Migrator *)v9 sharedZoneForOwnerUser:v12];
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    if (!v14)
    {
      id v25 = v9;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        int v34 = 138543618;
        id v35 = v27;
        __int16 v36 = 2112;
        id v37 = v12;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate V5 models: could not get shared zone for owner user: %@", (uint8_t *)&v34, 0x16u);
      }
      goto LABEL_39;
    }
    if ([(HMDHH2Migrator *)v9 migrateUserSettingsToCoreData:v6 forUser:v12 fromLocalZone:v13])
    {
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      if ([(HMDHH2Migrator *)v9 migrateUserSettingsToCoreData:v6 forUser:v12 fromLocalZone:v14])
      {
        uint64_t v15 = (void *)MEMORY[0x230FBD990]();
        if ([(HMDHH2Migrator *)v9 migrateMediaContentProfileAccessControl:v6 forOwnerUser:v12 fromLocalZone:v14])
        {
          uint64_t v15 = (void *)MEMORY[0x230FBD990]();
          if ([(HMDHH2Migrator *)v9 migrateUserListeningHistoryControl:v6 forOwnerUser:v12 fromLocalZone:v14])
          {
            uint64_t v15 = (void *)MEMORY[0x230FBD990]();
            if ([(HMDHH2Migrator *)v9 migratePhotosPersonManagerSettingsFromLocalZone:v14 owner:v12 managedObjectContext:v6])
            {
              uint64_t v15 = (void *)MEMORY[0x230FBD990]();
              if ([(HMDHH2Migrator *)v9 migrateAccessoryV5Models:v6 fromLocalZone:v13 forHome:v7 owner:v12])
              {
                uint64_t v15 = (void *)MEMORY[0x230FBD990]();
                if ([(HMDHH2Migrator *)v9 migrateV5PersonDataForHome:v7 managedObjectContext:v6])
                {
                  BOOL v16 = 1;
LABEL_40:

LABEL_41:
                  goto LABEL_42;
                }
                uint64_t v28 = (void *)MEMORY[0x230FBD990]();
                char v29 = v9;
                id v30 = HMFGetOSLogHandle();
                if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_38;
                }
                goto LABEL_36;
              }
              uint64_t v28 = (void *)MEMORY[0x230FBD990]();
              char v29 = v9;
              id v30 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
LABEL_36:
                uint64_t v31 = HMFGetLogIdentifier();
                int v34 = 138543618;
                id v35 = v31;
                __int16 v36 = 2112;
                id v37 = v12;
                __int16 v32 = "%{public}@Failed to migrate V5 models: unable to migrate accessory settings for owner user: %@";
                goto LABEL_37;
              }
LABEL_38:

LABEL_39:
              BOOL v16 = 0;
              goto LABEL_40;
            }
            uint64_t v28 = (void *)MEMORY[0x230FBD990]();
            char v29 = v9;
            id v30 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              goto LABEL_38;
            }
            uint64_t v31 = HMFGetLogIdentifier();
            int v34 = 138543618;
            id v35 = v31;
            __int16 v36 = 2112;
            id v37 = v12;
            __int16 v32 = "%{public}@Failed to migrate V5 models: unable to migrate photos person manager settings for owner user: %@";
          }
          else
          {
            uint64_t v28 = (void *)MEMORY[0x230FBD990]();
            char v29 = v9;
            id v30 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              goto LABEL_38;
            }
            uint64_t v31 = HMFGetLogIdentifier();
            int v34 = 138543618;
            id v35 = v31;
            __int16 v36 = 2112;
            id v37 = v12;
            __int16 v32 = "%{public}@Failed to migrate V5 models: unable to migrate listening history control for owner user: %@";
          }
        }
        else
        {
          uint64_t v28 = (void *)MEMORY[0x230FBD990]();
          char v29 = v9;
          id v30 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
          uint64_t v31 = HMFGetLogIdentifier();
          int v34 = 138543618;
          id v35 = v31;
          __int16 v36 = 2112;
          id v37 = v12;
          __int16 v32 = "%{public}@Failed to migrate V5 models: unable to migrate media content profile access control for owner user: %@";
        }
      }
      else
      {
        uint64_t v28 = (void *)MEMORY[0x230FBD990]();
        char v29 = v9;
        id v30 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        uint64_t v31 = HMFGetLogIdentifier();
        int v34 = 138543618;
        id v35 = v31;
        __int16 v36 = 2112;
        id v37 = v12;
        __int16 v32 = "%{public}@Failed to migrate V5 models: unable to migrate shared settings for owner user: %@";
      }
    }
    else
    {
      uint64_t v28 = (void *)MEMORY[0x230FBD990]();
      char v29 = v9;
      id v30 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      uint64_t v31 = HMFGetLogIdentifier();
      int v34 = 138543618;
      id v35 = v31;
      __int16 v36 = 2112;
      id v37 = v12;
      __int16 v32 = "%{public}@Failed to migrate V5 models: unable to migrate private settings for owner user: %@";
    }
LABEL_37:
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v34, 0x16u);

    goto LABEL_38;
  }
  uint64_t v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = v9;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v20 = HMFGetLogIdentifier();
    int v34 = 138543618;
    id v35 = v20;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate V5 models: owner user was not found for home: %@", (uint8_t *)&v34, 0x16u);
  }
  BOOL v16 = 0;
LABEL_42:

  return v16;
}

- (id)sharedZoneForOwnerUser:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isOwner])
  {
    id v5 = [v4 sharedZoneName];
    id v6 = [(HMDHH2Migrator *)self defaultDatabase];
    id v7 = [(HMDHH2Migrator *)self openZoneWithName:v5 inDatabase:v6];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not going to open shared zone for user : %@ as it is not an owner", (uint8_t *)&v13, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)privateZoneForOwnerUser:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isOwner])
  {
    id v5 = [v4 privateZoneName];
    id v6 = [(HMDHH2Migrator *)self defaultDatabase];
    id v7 = [(HMDHH2Migrator *)self openZoneWithName:v5 inDatabase:v6];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not going to open zone for user: %@ as it is not an owner", (uint8_t *)&v13, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)openZoneWithName:(id)a3 inDatabase:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Opening zone with name: %@", buf, 0x16u);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F492F8]);
  id v25 = 0;
  int v13 = [v7 privateZonesWithName:v6 configuration:v12 delegate:0 error:&v25];
  id v14 = v25;
  if (v13)
  {
    __int16 v15 = [(HMDHH2Migrator *)v9 openedZones];
    [v15 addObject:v13];

    id v16 = [v13 localZone];
    [v16 startUp];
    uint64_t v17 = [v13 cloudZone];
    [(HMDHH2Migrator *)v9 waitForStartupForCloudZone:v17];

    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v9;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Successfully opened local zone [%@]", buf, 0x16u);
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = v9;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v27 = v23;
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to open zone with name %@: %@", buf, 0x20u);
    }
    id v16 = 0;
  }

  return v16;
}

- (id)backingStoreObjectsForAccountsAndDevices:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = [v4 account];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [v4 account];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Getting bso objects for account : %@", buf, 0x16u);
    }
    id v12 = [v4 account];
    int v13 = [v12 backingStoreObjectsWithChangeType:1 version:4];
    [v5 addObjectsFromArray:v13];
  }
  id v14 = [v4 remoteAccounts];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__HMDHH2Migrator_backingStoreObjectsForAccountsAndDevices___block_invoke;
  v19[3] = &unk_264A28460;
  v19[4] = self;
  id v15 = v5;
  id v20 = v15;
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);

  id v16 = v20;
  id v17 = v15;

  return v17;
}

void __59__HMDHH2Migrator_backingStoreObjectsForAccountsAndDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Getting bso objects for remote account : %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v3 backingStoreObjectsWithChangeType:1 version:4];
  [v8 addObjectsFromArray:v9];
}

- (BOOL)makeSureToCreateHH2SentinelZoneWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [(HMDHH2Migrator *)self hh2FrameworkSwitch];
  int v6 = [v5 checkExistenceOfHH2SentinelZone];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@This is wierd... Looks like HH2 Sentinel zone exist already. That means other devices are already booted up in new world and might have wreaked havoc. Well... Let's move on. ¯\\_(ツ)_/¯", (uint8_t *)&v19, 0xCu);
    }
    return 1;
  }
  else
  {
    __int16 v12 = [(HMDHH2Migrator *)self hh2FrameworkSwitch];
    char v13 = [v12 waitForHH2SentinelZoneToBeCreated:a3 error:1.2e11];

    if (v13)
    {
      BOOL v11 = 1;
      +[HMDHH2FrameworkSwitch setHH2EnablementPreferenceKey:1];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to create HH2 Sentinel zone. We already checked that HH2 sentinel does not exist. Aborting the migration... ", (uint8_t *)&v19, 0xCu);
      }
      return 0;
    }
  }
  return v11;
}

- (BOOL)handlePostMigration
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v43 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting HH2 post migration work.", buf, 0xCu);
  }
  id v7 = [(HMDHH2Migrator *)v4 migratorRecord];
  int v8 = [v7 forceMigrationFailureForTesting];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = v4;
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v43 = v12;
      char v13 = "%{public}@*=*=*=*= Failing migration as it was requested by home-util command *=*=*=*=";
LABEL_9:
      id v16 = v11;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v16, v17, v13, buf, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v14 = [(HMDHH2Migrator *)v4 migratorRecord];
  int v15 = [v14 dryRun];

  if (!v15)
  {
    id v20 = [(HMDHH2Migrator *)v4 hh2FrameworkSwitch];
    int v21 = [v20 waitForHH2SentinelZoneToBeFetchedFromCloud];

    if ((v21 & 1) == 0)
    {
      uint64_t v9 = (void *)MEMORY[0x230FBD990]();
      int v10 = v4;
      BOOL v11 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      __int16 v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v43 = v12;
      char v13 = "%{public}@Unable to perform initial sync for HH2 sentinel zone. Without that we cannot finish migration";
      id v16 = v11;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
    id v41 = 0;
    BOOL v22 = [(HMDHH2Migrator *)v4 makeSureToCreateHH2SentinelZoneWithError:&v41];
    id v23 = v41;
    if (v22)
    {
      id v24 = [(HMDHH2Migrator *)v4 migratorRecord];
      char v25 = [v24 migrateFromTestDirectory];

      if ((v25 & 1) != 0
        || ([(HMDHH2Migrator *)v4 migratorRecord],
            id v26 = objc_claimAutoreleasedReturnValue(),
            char v27 = [v26 finishMigration],
            v26,
            (v27 & 1) != 0))
      {
        __int16 v28 = (void *)MEMORY[0x230FBD990]();
        id v29 = v4;
        __int16 v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          id v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v43 = v31;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Finally Victory : n_n : HH2 migration successfully done.", buf, 0xCu);
        }
        BOOL v18 = 1;
        +[HMDHH2MigrationStateLogger recordMigrationEnd:1];
        goto LABEL_29;
      }
      id v37 = (void *)MEMORY[0x230FBD990]();
      uint64_t v38 = v4;
      long long v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        long long v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v43 = v40;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@This is the worst possible thing as we cannot even remove our migration record from the local disk. I am sad. :( Aborting the migration...", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v32 = (void *)MEMORY[0x230FBD990]();
      uint64_t v33 = v4;
      int v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v43 = v35;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to create HH2 sentinel zone. Cannot mark migration as done. Aborting...", buf, 0xCu);
      }
      __int16 v36 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2714 underlyingError:v23];
      [(HMDHH2Migrator *)v33 submitABCEventForFailedMigrationWithReason:2 withError:v36];
    }
    BOOL v18 = 0;
LABEL_29:

    return v18;
  }
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = v4;
  BOOL v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v43 = v12;
    char v13 = "%{public}@*=*=*=*= Failing migration as this was just a Dry Run *=*=*=*=";
    goto LABEL_9;
  }
LABEL_11:

  return 0;
}

- (void)revertChangesPerformedDuringMigration
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing all the key-roll operations scheduled during migration as it has failed...", buf, 0xCu);
  }
  id v7 = [(HMDHH2Migrator *)v4 backgroundOpsManager];
  int v8 = [(HMDHH2Migrator *)v4 scheduledKeyRollOperationsDuringMigration];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__HMDHH2Migrator_revertChangesPerformedDuringMigration__block_invoke;
  v11[3] = &unk_264A2D5F8;
  id v12 = v7;
  id v9 = v7;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  int v10 = [(HMDHH2Migrator *)v4 scheduledKeyRollOperationsDuringMigration];
  [v10 removeAllObjects];
}

uint64_t __55__HMDHH2Migrator_revertChangesPerformedDuringMigration__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeAllOperationForAccessoryIdentifier:a2];
}

- (BOOL)scheduleAccessoryKeyMigration:(id)a3 oldPairingIdentity:(id)a4 hh2PairingIdentity:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_38;
  }
  BOOL v11 = v10;
  id v12 = [v8 identifier];

  if (!v12)
  {
LABEL_38:
    _HMFPreconditionFailure();
    goto LABEL_39;
  }
  if (!v9)
  {
LABEL_39:
    _HMFPreconditionFailure();
LABEL_40:
    _HMFPreconditionFailure();
  }
  if (!v11) {
    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char v13 = [(HMDHH2Migrator *)self backgroundOpsManager];
    if (!v13)
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      char v27 = self;
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v47 = v29;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Background operation manager is nil. Not scheduling key roll operation for that.", buf, 0xCu);
      }
      BOOL v30 = 0;
      goto LABEL_35;
    }
    id v14 = v8;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v16 = v14;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    id v18 = v14;
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();
    if (v19) {
      id v20 = v18;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    if (isKindOfClass)
    {
      BOOL v22 = [v18 identifier];

      if (v22)
      {
        id v23 = [(HMDHH2Migrator *)self scheduledKeyRollOperationsDuringMigration];
        id v24 = [v18 uuid];
        [v23 addObject:v24];

        char v25 = [v13 scheduleHH2KeyRollForAccessory:v18 previousIdentity:v9 newIdentity:v11];
LABEL_26:
        BOOL v30 = v25;
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      uint64_t v38 = (void *)MEMORY[0x230FBD990]();
      long long v39 = self;
      long long v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
LABEL_32:
        HMFGetLogIdentifier();
        long long v42 = v45 = v38;
        *(_DWORD *)buf = 138543618;
        __int16 v47 = v42;
        __int16 v48 = 2112;
        id v49 = v18;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Accessory identifier is nil. Not scheduling key roll operation for that. %@", buf, 0x16u);

        uint64_t v38 = v45;
      }
    }
    else
    {
      if ((v19 & 1) == 0)
      {
        uint64_t v38 = (void *)MEMORY[0x230FBD990]();
        long long v39 = self;
        long long v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v41 = v44 = v17;
          *(_DWORD *)buf = 138543618;
          __int16 v47 = v41;
          __int16 v48 = 2112;
          id v49 = v18;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unexpected accessory class. Not scheduling key roll operation for it. %@", buf, 0x16u);

          id v17 = v44;
        }
        goto LABEL_33;
      }
      id v35 = [v18 identifier];

      if (v35)
      {
        __int16 v36 = [(HMDHH2Migrator *)self scheduledKeyRollOperationsDuringMigration];
        id v37 = [v18 uuid];
        [v36 addObject:v37];

        char v25 = [v13 scheduleHH2KeyRollForAirPlayAccessory:v18 previousIdentity:v9 newIdentity:v11];
        goto LABEL_26;
      }
      uint64_t v38 = (void *)MEMORY[0x230FBD990]();
      long long v39 = self;
      long long v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
    }
LABEL_33:

    BOOL v30 = 0;
    goto LABEL_34;
  }
  id v31 = (void *)MEMORY[0x230FBD990]();
  uint64_t v32 = self;
  uint64_t v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    int v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v47 = v34;
    __int16 v48 = 2112;
    id v49 = v8;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Not Scheduling key roll operation for Non-HAP and Non-AirPlay accessory : %@", buf, 0x16u);
  }
  BOOL v30 = 1;
LABEL_36:

  return v30;
}

- (BOOL)rollAccessoryKeysToHH2:(id)a3 hh2ControllerKey:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accessories];
  if (v8
    && ([v6 accessories],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        v10))
  {
    BOOL v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v6 accessories];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v15 count];
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Scheduling accessory key-roll for [%lu] accessories", buf, 0x16u);
    }
    id v16 = objc_alloc(MEMORY[0x263F35A78]);
    id v17 = [v7 identifier];
    id v18 = [v7 publicKey];
    char v19 = (void *)[v16 initWithIdentifier:v17 publicKey:v18 privateKey:0 permissions:1];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v33 = 1;
    id v20 = [v6 accessories];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __58__HMDHH2Migrator_rollAccessoryKeysToHH2_hh2ControllerKey___block_invoke;
    v28[3] = &unk_264A28500;
    id v31 = buf;
    v28[4] = v12;
    id v29 = v6;
    id v21 = v19;
    id v30 = v21;
    [v20 enumerateObjectsUsingBlock:v28];

    BOOL v22 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = self;
    char v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@[%@] does not have any accessories in it. Skipping key-roll.", buf, 0x16u);
    }
    BOOL v22 = 1;
  }

  return v22;
}

void __58__HMDHH2Migrator_rollAccessoryKeysToHH2_hh2ControllerKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) owner];
  uint64_t v10 = [v9 pairingIdentity];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 scheduleAccessoryKeyMigration:v6 oldPairingIdentity:v10 hh2PairingIdentity:*(void *)(a1 + 48)];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    BOOL v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to schedule key roll operation for %@", (uint8_t *)&v15, 0x16u);
    }
    *a4 = 1;
  }
}

- (BOOL)waitForV5UpdatesToSyncToCloudKit
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = [(HMDHH2Migrator *)self migratorRecord];
  if ([v2 migrateFromTestDirectory])
  {

LABEL_4:
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Not going to wait for V5 updates to sync to CloudKit during Dry Run.", (uint8_t *)&buf, 0xCu);
    }
    return 1;
  }
  id v3 = [(HMDHH2Migrator *)self migratorRecord];
  int v4 = [v3 dryRun];

  if (v4) {
    goto LABEL_4;
  }
  id v9 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = [(HMDHH2Migrator *)self v5ModelUpdateFutures];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
        dispatch_group_enter(v9);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __50__HMDHH2Migrator_waitForV5UpdatesToSyncToCloudKit__block_invoke;
        v24[3] = &unk_264A28438;
        p_long long buf = &buf;
        void v24[4] = self;
        char v25 = v9;
        id v15 = (id)[v14 addCompletionBlock:v24];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v11);
  }

  dispatch_time_t v16 = dispatch_time(0, 900000000000);
  if (dispatch_group_wait(v9, v16))
  {
    __int16 v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    HMFGetOSLogHandle();
    uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)id v31 = 138543362;
      uint64_t v32 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for V5 CloudKit sync", v31, 0xCu);
    }
    id v21 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
    [(HMDHH2Migrator *)v18 submitABCEventForFailedMigrationWithReason:5 withError:v21];
  }
  _Block_object_dispose(&buf, 8);

  return 1;
}

void __50__HMDHH2Migrator_waitForV5UpdatesToSyncToCloudKit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v5)
  {
    id v28 = 0;
    int v7 = [*(id *)(a1 + 32) waitForCloudKitSyncForProcessingResult:v5 error:&v28];
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    uint64_t v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        id v14 = [*(id *)(a1 + 32) v5ModelUpdateFutures];
        uint64_t v15 = [v14 count];
        *(_DWORD *)long long buf = 138543874;
        long long v30 = v12;
        __int16 v31 = 2048;
        uint64_t v32 = v13;
        __int16 v33 = 2048;
        uint64_t v34 = v15;
        dispatch_time_t v16 = "%{public}@Finished V5 CloudKit sync for %ld/%lu";
        __int16 v17 = v11;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        uint32_t v19 = 32;
LABEL_10:
        _os_log_impl(&dword_22F52A000, v17, v18, v16, buf, v19);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      id v14 = [*(id *)(a1 + 32) v5ModelUpdateFutures];
      uint64_t v27 = [v14 count];
      *(_DWORD *)long long buf = 138544130;
      long long v30 = v12;
      __int16 v31 = 2048;
      uint64_t v32 = v26;
      __int16 v33 = 2048;
      uint64_t v34 = v27;
      __int16 v35 = 2112;
      id v36 = v28;
      dispatch_time_t v16 = "%{public}@Failed V5 CloudKit sync for %ld/%lu: %@";
      __int16 v17 = v11;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 42;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  id v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = *(id *)(a1 + 32);
  BOOL v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = HMFGetLogIdentifier();
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    char v25 = [*(id *)(a1 + 32) v5ModelUpdateFutures];
    *(_DWORD *)long long buf = 138544130;
    long long v30 = v23;
    __int16 v31 = 2048;
    uint64_t v32 = v24;
    __int16 v33 = 2048;
    uint64_t v34 = [v25 count];
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed V5 local database sync for %ld/%lu: %@", buf, 0x2Au);
  }
LABEL_12:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)waitForCloudKitSyncForProcessingResult:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [v6 mirrorOutputResult];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__HMDHH2Migrator_waitForCloudKitSyncForProcessingResult_error___block_invoke;
  v20[3] = &unk_264A28410;
  BOOL v22 = &v24;
  id v23 = a4;
  id v9 = v7;
  id v21 = v9;
  id v10 = (id)[v8 addCompletionBlock:v20];

  dispatch_time_t v11 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    HMFGetOSLogHandle();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      long long v29 = v15;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for CloudKit sync for %@", buf, 0x16u);
    }
    if (a4)
    {
      dispatch_time_t v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:13];
      id v17 = *a4;
      *a4 = v16;
    }
  }
  BOOL v18 = *((unsigned char *)v25 + 24) != 0;

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __63__HMDHH2Migrator_waitForCloudKitSyncForProcessingResult_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v6 = *(id **)(a1 + 48);
    if (v6) {
      objc_storeStrong(v6, a3);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)waitForStartupForCloudZone:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 zoneID];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [v4 startUp];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__HMDHH2Migrator_waitForStartupForCloudZone___block_invoke;
  v18[3] = &unk_264A2CED0;
  void v18[4] = self;
  id v8 = v5;
  id v19 = v8;
  id v9 = v6;
  id v20 = v9;
  id v10 = (id)[v7 addCompletionBlock:v18];

  dispatch_time_t v11 = dispatch_time(0, 60000000000);
  intptr_t v12 = dispatch_semaphore_wait(v9, v11);
  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      BOOL v22 = v16;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for cloud zone startup for %@", buf, 0x16u);
    }
  }

  return v12 == 0;
}

void __45__HMDHH2Migrator_waitForStartupForCloudZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v15 = 138543618;
      dispatch_time_t v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud zone startup succeeded for %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 138543874;
      dispatch_time_t v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cloud zone startup failed for %@: %@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 32) submitABCEventForFailedMigrationWithReason:9 withError:v6];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)allObjectIDsFromTransactions:(id)a3 cloudStoreIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = a3;
  id v9 = [v7 set];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__HMDHH2Migrator_allObjectIDsFromTransactions_cloudStoreIdentifier___block_invoke;
  v14[3] = &unk_264A283E8;
  id v15 = v6;
  dispatch_time_t v16 = self;
  id v17 = v9;
  id v10 = v9;
  id v11 = v6;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

  uint64_t v12 = (void *)[v10 copy];
  return v12;
}

void __68__HMDHH2Migrator_allObjectIDsFromTransactions_cloudStoreIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 storeID];
  char v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = [v3 changes];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__HMDHH2Migrator_allObjectIDsFromTransactions_cloudStoreIdentifier___block_invoke_158;
    v15[3] = &unk_264A283C0;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = v7;
    uint64_t v17 = v8;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 40);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v3 storeID];
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543874;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring transactions from [%@] as expecting transaction from [%@]", buf, 0x20u);
    }
  }
}

void __68__HMDHH2Migrator_allObjectIDsFromTransactions_cloudStoreIdentifier___block_invoke_158(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 changedObjectID];
  unint64_t v5 = [v3 changeType];
  if (v5 >= 2)
  {
    if (v5 == 2)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        int v10 = 138543618;
        id v11 = v9;
        __int16 v12 = 2112;
        uint64_t v13 = v4;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Delete change detected : %@", (uint8_t *)&v10, 0x16u);
      }
      [*(id *)(a1 + 32) removeObject:v4];
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (BOOL)didCoreDataPushAllModelsToCloudKit:(id)a3 previousToken:(id)a4 cloudStore:(id)a5
{
  v71[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  __int16 v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to execute history change request using token : %@", buf, 0x16u);
  }
  id v15 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:v9];
  v71[0] = v10;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:1];
  [v15 setAffectedStores:v16];

  id v62 = 0;
  uint64_t v17 = [v8 executeRequest:v15 error:&v62];
  uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t))v62;
  if (v17)
  {
    uint64_t v18 = [v17 result];
    if (![v18 count])
    {
      uint64_t v34 = (void *)MEMORY[0x230FBD990]();
      __int16 v35 = v12;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@There are no transactions from the history fetch results", buf, 0xCu);
      }
      BOOL v33 = 1;
      goto LABEL_26;
    }
    __int16 v19 = [v10 identifier];
    id v56 = [(HMDHH2Migrator *)v12 allObjectIDsFromTransactions:v18 cloudStoreIdentifier:v19];

    if (![v56 count])
    {
      uint64_t v38 = (void *)MEMORY[0x230FBD990]();
      long long v39 = v12;
      long long v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@There were no objects inserted as part of the migration.", buf, 0xCu);
      }
      BOOL v33 = 1;
      goto LABEL_25;
    }
    __int16 v20 = [HMDHH2CoreDataCloudKitMirroringObserver alloc];
    uint64_t v21 = [(HMDHH2Migrator *)v12 coreData];
    __int16 v22 = [v10 identifier];
    uint64_t v23 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v20 initWithObjectIds:v56 coreData:v21 storeIdentifier:v22];

    uint64_t v24 = dispatch_group_create();
    dispatch_group_enter(v24);
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v68 = __Block_byref_object_copy__220801;
    v69 = __Block_byref_object_dispose__220802;
    id v70 = 0;
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __78__HMDHH2Migrator_didCoreDataPushAllModelsToCloudKit_previousToken_cloudStore___block_invoke;
    v58[3] = &unk_264A2AFC8;
    v61 = buf;
    v59 = v23;
    __int16 v54 = v59;
    dispatch_group_t group = v24;
    dispatch_group_t v60 = group;
    [(HMDHH2CoreDataCloudKitMirroringObserver *)v59 startMonitoring:v58];
    dispatch_time_t v25 = dispatch_time(0, 900000000000);
    if (dispatch_group_wait(group, v25))
    {
      context = (void *)MEMORY[0x230FBD990]();
      uint64_t v26 = v12;
      HMFGetOSLogHandle();
      char v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)v63 = 138543362;
        v64 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not push the models to CloudKit. Timed out.", v63, 0xCu);
      }
      [(HMDHH2CoreDataCloudKitMirroringObserver *)v54 stopMonitoring];
    }
    else
    {
      BOOL v42 = *(void *)(*(void *)&buf[8] + 40) == 0;
      contexta = (void *)MEMORY[0x230FBD990]();
      id v43 = v12;
      if (v42)
      {
        HMFGetOSLogHandle();
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          uint64_t v50 = v43;
          uint64_t v51 = HMFGetLogIdentifier();
          *(_DWORD *)v63 = 138543362;
          v64 = v51;
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Successfully exported CD models to CloudKit", v63, 0xCu);

          id v43 = v50;
        }

        BOOL v33 = 1;
        goto LABEL_24;
      }
      HMFGetOSLogHandle();
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = v43;
        v46 = HMFGetLogIdentifier();
        uint64_t v47 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v63 = 138543618;
        v64 = v46;
        __int16 v65 = 2112;
        uint64_t v66 = v47;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to verify CD models pushed to CloudKit using export stream : %@", v63, 0x16u);

        id v43 = v45;
      }
    }
    [(HMDHH2Migrator *)v12 submitABCEventForFailedMigrationWithReason:4 withError:*(void *)(*(void *)&buf[8] + 40)];
    BOOL v33 = 0;
LABEL_24:

    _Block_object_dispose(buf, 8);
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  long long v29 = (void *)MEMORY[0x230FBD990]();
  __int16 v30 = v12;
  id v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    uint64_t v32 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v68 = v57;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch history for cloud store with token %@: %@", buf, 0x20u);
  }
  BOOL v33 = 0;
LABEL_27:

  return v33;
}

void __78__HMDHH2Migrator_didCoreDataPushAllModelsToCloudKit_previousToken_cloudStore___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) stopMonitoring];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)waitForCloudTransformToRun
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHH2Migrator *)self cloudTransform];
  if (v3)
  {
    *(void *)&long long v38 = 0;
    *((void *)&v38 + 1) = &v38;
    uint64_t v39 = 0x3032000000;
    long long v40 = __Block_byref_object_copy__220801;
    id v41 = __Block_byref_object_dispose__220802;
    id v42 = 0;
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    unint64_t v5 = dispatch_get_global_queue(2, 0);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __44__HMDHH2Migrator_waitForCloudTransformToRun__block_invoke;
    v30[3] = &unk_264A2F000;
    v30[4] = self;
    id v31 = v3;
    BOOL v33 = &v38;
    id v6 = v4;
    uint64_t v32 = v6;
    dispatch_async(v5, v30);

    dispatch_time_t v7 = dispatch_time(0, 420000000000);
    intptr_t v8 = dispatch_group_wait(v6, v7);
    if (v8)
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990](v8, v9, v10, v11, v12, v13);
      id v15 = self;
      HMFGetOSLogHandle();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        __int16 v35 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cloud transform did not run and the operation timed out.", buf, 0xCu);
      }
    }
    else
    {
      BOOL v23 = *(void *)(*((void *)&v38 + 1) + 40) == 0;
      uint64_t v14 = (void *)MEMORY[0x230FBD990](0, v9, v10, v11, v12, v13);
      uint64_t v24 = self;
      if (v23)
      {
        HMFGetOSLogHandle();
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          long long v29 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          __int16 v35 = v29;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Successfully finished running cloud transform", buf, 0xCu);
        }
        BOOL v22 = 1;
        goto LABEL_12;
      }
      HMFGetOSLogHandle();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        dispatch_time_t v25 = HMFGetLogIdentifier();
        uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 40);
        *(_DWORD *)long long buf = 138543618;
        __int16 v35 = v25;
        __int16 v36 = 2112;
        uint64_t v37 = v26;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@runTransformForCoreData after migration failed with error : %@", buf, 0x16u);
      }
    }

    BOOL v22 = 0;
LABEL_12:

    _Block_object_dispose(&v38, 8);
    goto LABEL_13;
  }
  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
  __int16 v19 = self;
  __int16 v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    LODWORD(v38) = 138543362;
    *(void *)((char *)&v38 + 4) = v21;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cloud transform is unavailable.", (uint8_t *)&v38, 0xCu);
  }
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

void __44__HMDHH2Migrator_waitForCloudTransformToRun__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v15 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting cloud transform.", buf, 0xCu);
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  [v6 runTransformWithError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  intptr_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    id v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud transform completed with : %@", buf, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (BOOL)waitForCDToExportModelsToCloudKit:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    intptr_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting to wait for CD to export models to CK : history token before migration began : %@", buf, 0x16u);
  }
  if ([(HMDHH2Migrator *)v6 waitForCloudTransformToRun])
  {
    id v9 = [(HMDHH2Migrator *)v6 migratorRecord];
    if ([v9 migrateFromTestDirectory])
    {

LABEL_10:
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = v6;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Not going to wait for all CloudKit models to be exported to CloudKit servers.", buf, 0xCu);
      }
      BOOL v14 = 1;
      goto LABEL_18;
    }
    id v15 = [(HMDHH2Migrator *)v6 migratorRecord];
    int v16 = [v15 dryRun];

    if (v16) {
      goto LABEL_10;
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v37 = 0;
    uint64_t v21 = [(HMDHH2Migrator *)v6 coreData];
    BOOL v22 = (void *)[v21 newManagedObjectContext];

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __52__HMDHH2Migrator_waitForCDToExportModelsToCloudKit___block_invoke;
    v30[3] = &unk_264A2F000;
    BOOL v33 = buf;
    v30[4] = v6;
    id v23 = v22;
    id v31 = v23;
    id v32 = v4;
    uint64_t v24 = [v23 performBlockAndWait:v30];
    BOOL v14 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      dispatch_time_t v25 = (void *)MEMORY[0x230FBD990](v24);
      uint64_t v26 = v6;
      HMFGetOSLogHandle();
      char v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v34 = 138543362;
        __int16 v35 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to verify whether CD models made it to CloudKit", v34, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = v6;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cloud transform failed after migration.", buf, 0xCu);
    }
    BOOL v14 = 0;
  }
LABEL_18:

  return v14;
}

uint64_t __52__HMDHH2Migrator_waitForCDToExportModelsToCloudKit___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  unint64_t v5 = [v2 coreData];
  id v6 = [v5 cloudPrivateStore];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v2 didCoreDataPushAllModelsToCloudKit:v3 previousToken:v4 cloudStore:v6];

  uint64_t v7 = (void *)a1[5];
  return [v7 reset];
}

- (void)fixupAssistantAccessControlForUserModel:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 managedObjectContext];
  id v6 = [v4 home];
  uint64_t v7 = [(HMDHH2Migrator *)self homeData];
  intptr_t v8 = [v6 modelID];
  id v9 = [v7 homeWithUUID:v8];
  uint64_t v10 = [v4 modelID];
  uint64_t v11 = [v9 userWithUUID:v10];

  uint64_t v12 = [v11 assistantAccessControl];
  uint64_t v13 = v12;
  if (v12)
  {
    BOOL v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "areActivityNotificationsEnabledForPersonalRequests"));
    [v4 setActivityNotificationsEnabledForPersonalRequests:v14];

    *(void *)&long long v39 = 0;
    *((void *)&v39 + 1) = &v39;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__220801;
    id v42 = __Block_byref_object_dispose__220802;
    id v15 = (void *)MEMORY[0x263EFF9C0];
    int v16 = [v13 accessories];
    objc_msgSend(v15, "setWithCapacity:", objc_msgSend(v16, "count"));
    id v43 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v17 = [v13 accessories];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __58__HMDHH2Migrator_fixupAssistantAccessControlForUserModel___block_invoke;
    v29[3] = &unk_264A28398;
    id v30 = v5;
    id v31 = self;
    id v32 = &v39;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);

    uint64_t v18 = (void *)[*(id *)(*((void *)&v39 + 1) + 40) copy];
    objc_msgSend(v4, "setAccessoriesWithPersonalRequestsEnabled_:", v18);

    __int16 v19 = (void *)MEMORY[0x230FBD990]();
    __int16 v20 = self;
    HMFGetOSLogHandle();
    uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = [v4 activityNotificationsEnabledForPersonalRequests];
      uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 40);
      *(_DWORD *)long long buf = 138543874;
      id v34 = v22;
      __int16 v35 = 2112;
      __int16 v36 = v23;
      __int16 v37 = 2112;
      uint64_t v38 = v24;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@FixUp: Migrated owner's assistant access control activityNotificationsEnabled=%@, accessories=%@", buf, 0x20u);
    }

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    dispatch_time_t v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = self;
    char v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      LODWORD(v39) = 138543362;
      *(void *)((char *)&v39 + 4) = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@No assistant access control to migrate", (uint8_t *)&v39, 0xCu);
    }
  }
}

void __58__HMDHH2Migrator_fixupAssistantAccessControlForUserModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 uuid];
  uint64_t v5 = *(void *)(a1 + 32);
  id v13 = 0;
  id v6 = +[_MKFModel modelWithModelID:v4 context:v5 error:&v13];
  id v7 = v13;

  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v6];
  }
  else
  {
    intptr_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v3 uuid];
      *(_DWORD *)long long buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@FixUp: Failed to find accessory with UUID %@ when migrating assistant access control", buf, 0x16u);
    }
  }
}

- (void)_fixupSoftwareUpdateModelWithNoAccessory:(id)a3 coreDataModelObject:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  intptr_t v8 = [v7 accessory];

  if (!v8)
  {
    id v9 = HMDCastIfManagedObjectBSORepresentable(v7);
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        BOOL v14 = HMFGetLogIdentifier();
        id v15 = objc_msgSend(v9, "hmd_parentModelID");
        int v31 = 138543874;
        id v32 = v14;
        __int16 v33 = 2112;
        id v34 = v9;
        __int16 v35 = 2112;
        __int16 v36 = v15;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@FixUP: Looks like [%@] does not have accessory associated with it. Going to find the accessory with model id: %@", (uint8_t *)&v31, 0x20u);
      }
      __int16 v16 = objc_msgSend(v9, "hmd_parentModelID");
      uint64_t v17 = +[_MKFModel modelWithModelID:v16 context:v6];

      if (v17)
      {
        uint64_t v18 = (void *)MEMORY[0x230FBD990]([v7 setAccessory:v17]);
        __int16 v19 = v11;
        __int16 v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = HMFGetLogIdentifier();
          id v22 = [v17 debugDescription];
          id v23 = [v7 debugDescription];
          int v31 = 138543874;
          id v32 = v21;
          __int16 v33 = 2112;
          id v34 = v22;
          __int16 v35 = 2112;
          __int16 v36 = v23;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@FixUP: Setting accessory [%@] on software update model [%@]", (uint8_t *)&v31, 0x20u);
        }
      }
      else
      {
        uint64_t v26 = (void *)MEMORY[0x230FBD990]();
        char v27 = v11;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          long long v29 = HMFGetLogIdentifier();
          id v30 = objc_msgSend(v9, "hmd_parentModelID");
          int v31 = 138543618;
          id v32 = v29;
          __int16 v33 = 2112;
          id v34 = v30;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the _MKFAccessory with modelID : %@ for software update model.", (uint8_t *)&v31, 0x16u);
        }
        [v6 deleteObject:v7];
      }
    }
    else
    {
      if (v13)
      {
        uint64_t v24 = HMFGetLogIdentifier();
        dispatch_time_t v25 = [v7 debugDescription];
        int v31 = 138543618;
        id v32 = v24;
        __int16 v33 = 2112;
        id v34 = v25;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Deleting the software update model %@ as it does not have accessory associated with it.", (uint8_t *)&v31, 0x16u);
      }
      [v6 deleteObject:v7];
    }
  }
}

- (void)_fixupAccessoryWithNoInitialValues:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 initialManufacturer];
  if (v5)
  {

LABEL_3:
    int v6 = 0;
    goto LABEL_8;
  }
  id v7 = [v4 manufacturer];

  if (!v7) {
    goto LABEL_3;
  }
  intptr_t v8 = [v4 manufacturer];
  [v4 setInitialManufacturer:v8];

  id v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    BOOL v13 = [v4 manufacturer];
    int v35 = 138543618;
    __int16 v36 = v12;
    __int16 v37 = 2112;
    uint64_t v38 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@FixUP: updated initialManufacturer to [%@]", (uint8_t *)&v35, 0x16u);
  }
  int v6 = 1;
LABEL_8:
  BOOL v14 = [v4 initialModel];
  if (v14)
  {
  }
  else
  {
    id v15 = [v4 model];

    if (v15)
    {
      __int16 v16 = [v4 model];
      [v4 setInitialModel:v16];

      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = self;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        uint64_t v21 = [v4 model];
        int v35 = 138543618;
        __int16 v36 = v20;
        __int16 v37 = 2112;
        uint64_t v38 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@FixUP: updated initialModel to [%@]", (uint8_t *)&v35, 0x16u);
      }
      int v6 = 1;
    }
  }
  id v22 = [v4 initialCategoryIdentifier];
  if ([v22 unsignedIntValue])
  {

    goto LABEL_16;
  }
  id v23 = [v4 accessoryCategory];

  if (!v23)
  {
LABEL_16:
    if (!v6) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  uint64_t v24 = [v4 accessoryCategory];
  [v4 setInitialCategoryIdentifier:v24];

  dispatch_time_t v25 = (void *)MEMORY[0x230FBD990]();
  uint64_t v26 = self;
  char v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = HMFGetLogIdentifier();
    long long v29 = [v4 accessoryCategory];
    int v35 = 138543618;
    __int16 v36 = v28;
    __int16 v37 = 2112;
    uint64_t v38 = v29;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@FixUP: updated initialCategoryIdentifier to [%@]", (uint8_t *)&v35, 0x16u);
  }
LABEL_22:
  id v30 = (void *)MEMORY[0x230FBD990]();
  int v31 = self;
  id v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    __int16 v33 = HMFGetLogIdentifier();
    id v34 = [v4 debugDescription];
    int v35 = 138543618;
    __int16 v36 = v33;
    __int16 v37 = 2112;
    uint64_t v38 = v34;
    _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@FixUP: updated initial values on : %@", (uint8_t *)&v35, 0x16u);
  }
LABEL_25:
}

- (void)_fixupAccessoryWithNoRoom:(id)a3 coreDataModelObject:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  intptr_t v8 = [v7 room];

  if (!v8)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v24 = 138543618;
      dispatch_time_t v25 = v12;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@FixUP: Looks like [%@] does not have room associated with it. Going to put this accessory to default room", (uint8_t *)&v24, 0x16u);
    }
    BOOL v13 = [v7 home];
    BOOL v14 = [v13 defaultRoom];

    if (v14)
    {
      id v15 = [v7 home];
      __int16 v16 = [v15 defaultRoom];
      [v7 setRoom:v16];

      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = v10;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        uint64_t v21 = [v7 home];
        id v22 = [v21 defaultRoom];
        int v24 = 138543874;
        dispatch_time_t v25 = v20;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 2112;
        long long v29 = v22;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@FixUP: added accessory: [%@] to default room : [%@]", (uint8_t *)&v24, 0x20u);

LABEL_9:
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      id v23 = v10;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        uint64_t v21 = [v7 home];
        int v24 = 138543618;
        dispatch_time_t v25 = v20;
        __int16 v26 = 2112;
        id v27 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@This is not good. Looks like we do not have default room in the home : %@", (uint8_t *)&v24, 0x16u);
        goto LABEL_9;
      }
    }
  }
}

- (void)_createResidentModelsDuringMigrationForAppleMediaAccessory:(id)a3 context:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 home];
  if (!v9)
  {
    uint64_t v18 = MEMORY[0x230FBD990]();
    __int16 v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      id v22 = [v8 debugDescription];
      *(_DWORD *)long long buf = 138543618;
      id v41 = v21;
      __int16 v42 = 2112;
      id v43 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@FixUp: Accessory without a home: %@", buf, 0x16u);
    }
    uint64_t v17 = (void *)v18;
    goto LABEL_9;
  }
  uint64_t v10 = [v8 resident];

  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  BOOL v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      id v15 = HMFGetLogIdentifier();
      __int16 v16 = [v8 debugDescription];
      *(_DWORD *)long long buf = 138543618;
      id v41 = v15;
      __int16 v42 = 2112;
      id v43 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@FixUp: Accessory already has a resident: %@", buf, 0x16u);
    }
    uint64_t v17 = v11;
LABEL_9:
    goto LABEL_13;
  }
  id v38 = v7;
  if (v14)
  {
    id v23 = HMFGetLogIdentifier();
    int v24 = [v8 debugDescription];
    *(_DWORD *)long long buf = 138543618;
    id v41 = v23;
    __int16 v42 = 2112;
    id v43 = v24;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@FixUp: Creating resident for media accessory %@", buf, 0x16u);
  }
  buf[0] = 0;
  dispatch_time_t v25 = [v8 modelID];
  __int16 v26 = [v25 UUIDString];
  uint64_t v39 = v26;
  id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];

  __int16 v28 = (void *)MEMORY[0x263F08C38];
  long long v29 = [v9 modelID];
  uint64_t v30 = objc_msgSend(v28, "hm_deriveUUIDFromBaseUUID:withSalts:", v29, v27);

  int v31 = [v9 materializeOrCreateResidentsRelationWithModelID:v30 createdNew:buf];
  [v31 setAppleMediaAccessory:v8];
  id v32 = [(HMDHH2Migrator *)v12 homeData];
  __int16 v33 = [v9 modelID];
  id v34 = [v32 homeWithUUID:v33];
  int v35 = [v8 modelID];
  __int16 v36 = [v34 accessoryWithUUID:v35];

  __int16 v37 = [v36 name];
  [v31 setName:v37];

  id v7 = v38;
LABEL_13:
}

- (void)_fixupAppleMediaAccessory:(id)a3 context:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 home];
  if (v9)
  {
    uint64_t v10 = [(HMDHH2Migrator *)self homeData];
    uint64_t v11 = [v9 modelID];
    uint64_t v12 = [v10 homeWithUUID:v11];
    BOOL v13 = [v8 modelID];
    BOOL v14 = [v12 accessoryWithUUID:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    uint64_t v17 = [v16 deviceForDirectMessaging];
    if (v17)
    {
      uint64_t v18 = [v8 idsIdentifier];

      if (!v18)
      {
        __int16 v19 = (void *)MEMORY[0x230FBD990]();
        __int16 v20 = self;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = HMFGetLogIdentifier();
          id v23 = [v8 modelID];
          int v30 = 138543618;
          int v31 = v22;
          __int16 v32 = 2112;
          __int16 v33 = v23;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Adding ids identifier to %@ in fixup", (uint8_t *)&v30, 0x16u);
        }
        int v24 = [v17 idsIdentifier];
        [v8 setIdsIdentifier:v24];
      }
    }
  }
  else
  {
    dispatch_time_t v25 = (void *)MEMORY[0x230FBD990]();
    __int16 v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      long long v29 = [v8 debugDescription];
      int v30 = 138543618;
      int v31 = v28;
      __int16 v32 = 2112;
      __int16 v33 = v29;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@FixUp: AppleMediaAccessory without a home: %@", (uint8_t *)&v30, 0x16u);
    }
  }
}

- (void)_fixupCharacteristicEventTriggerInvalidService:(id)a3 context:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v24 = v6;
  [v6 events];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    uint64_t v25 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          BOOL v14 = v13;
        }
        else {
          BOOL v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          id v16 = [v15 service];

          if (!v16)
          {
            uint64_t v17 = (void *)MEMORY[0x230FBD990]();
            uint64_t v18 = self;
            __int16 v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v20 = v8;
              id v21 = v7;
              v23 = id v22 = self;
              *(_DWORD *)long long buf = 138543618;
              int v31 = v23;
              __int16 v32 = 2112;
              id v33 = v15;
              _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@FixUp: deleting characteristicEvent: %@ as it has no associated service", buf, 0x16u);

              self = v22;
              id v7 = v21;
              id v8 = v20;
              uint64_t v11 = v25;
            }

            [v7 deleteObject:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v10);
  }
}

- (void)_fixupCharacteristicWriteActionWithInvalidService:(id)a3 context:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v24 = v6;
  id v8 = [v6 actions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    uint64_t v25 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          BOOL v14 = v13;
        }
        else {
          BOOL v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          id v16 = [v15 service];

          if (!v16)
          {
            uint64_t v17 = (void *)MEMORY[0x230FBD990]();
            uint64_t v18 = self;
            __int16 v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v20 = v8;
              id v21 = v7;
              v23 = id v22 = self;
              *(_DWORD *)long long buf = 138543618;
              int v31 = v23;
              __int16 v32 = 2112;
              id v33 = v15;
              _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@FixUp: deleting characteristicWriteAction: %@ as it has no associated service", buf, 0x16u);

              self = v22;
              id v7 = v21;
              id v8 = v20;
              uint64_t v11 = v25;
            }

            [v7 deleteObject:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v10);
  }
}

- (void)_fixupActionSetUnlocalizedName:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = [v4 type];
  id v7 = +[HMDHome getBuiltinActionSets];
  id v8 = objc_msgSend(v7, "hmf_stringForKey:", v6);
  if ([v8 isEqual:v5])
  {
    uint64_t v9 = HMDLocalizedStringForKey(v8);
    uint64_t v10 = (void *)MEMORY[0x230FBD990]([v4 setName:v9]);
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543874;
      id v15 = v13;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      __int16 v19 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@FixUp: found action set with unlocalized name, updating name from: %@ to: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)_fixupActionSetInvalidName:(id)a3 context:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 name];
  uint64_t v9 = v8;
  if (!v8 || ![(__CFString *)v8 length])
  {
    uint64_t v10 = NSString;
    uint64_t v11 = HMDLocalizedStringForKey(@"ACTION_SET_FALLBACK_NAME");
    id v27 = 0;
    objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%ld", &v27, _fixupActionSetInvalidName_context__fixedUpActionSetNameCounter);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v13 = v27;

    int v14 = v12;
    if (!v12)
    {
      id v26 = v7;
      id v15 = (void *)MEMORY[0x230FBD990]();
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v17 = v25 = v15;
        *(_DWORD *)long long buf = 138544130;
        long long v29 = v17;
        __int16 v30 = 2112;
        int v31 = @"ACTION_SET_FALLBACK_NAME";
        __int16 v32 = 2112;
        id v33 = @"%ld";
        __int16 v34 = 2112;
        id v35 = v13;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        id v15 = v25;
      }

      int v14 = @"ACTION_SET_FALLBACK_NAME";
      id v7 = v26;
    }
    __int16 v18 = v14;

    uint64_t v19 = [v6 setName:v18];
    ++_fixupActionSetInvalidName_context__fixedUpActionSetNameCounter;
    uint64_t v20 = (void *)MEMORY[0x230FBD990](v19);
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      int v24 = [v6 name];
      *(_DWORD *)long long buf = 138543874;
      long long v29 = v23;
      __int16 v30 = 2112;
      int v31 = v9;
      __int16 v32 = 2112;
      id v33 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@FixUp: found action set with invalid name, updating name from: %@ to: %@", buf, 0x20u);
    }
  }
}

- (void)_fixupTriggerInvalidName:(id)a3 context:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v8 name];
  uint64_t v10 = v9;
  if (!v9 || ![(__CFString *)v9 length])
  {
    uint64_t v11 = NSString;
    uint64_t v12 = HMDLocalizedStringForKey(@"TRIGGER_FALLBACK_NAME");
    id v28 = 0;
    objc_msgSend(v11, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, @"%ld", &v28, _fixupTriggerInvalidName_context__fixedUpTriggerNameCounter);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v14 = v28;

    id v15 = v13;
    if (!v13)
    {
      id v27 = v7;
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        __int16 v18 = v26 = v16;
        *(_DWORD *)long long buf = 138544130;
        __int16 v30 = v18;
        __int16 v31 = 2112;
        __int16 v32 = @"TRIGGER_FALLBACK_NAME";
        __int16 v33 = 2112;
        __int16 v34 = @"%ld";
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        __int16 v16 = v26;
      }

      id v15 = @"TRIGGER_FALLBACK_NAME";
      id v7 = v27;
    }
    uint64_t v19 = v15;

    uint64_t v20 = [v8 setName:v19];
    ++_fixupTriggerInvalidName_context__fixedUpTriggerNameCounter;
    id v21 = (void *)MEMORY[0x230FBD990](v20);
    id v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = HMFGetLogIdentifier();
      uint64_t v25 = [v8 name];
      *(_DWORD *)long long buf = 138543874;
      __int16 v30 = v24;
      __int16 v31 = 2112;
      __int16 v32 = v10;
      __int16 v33 = 2112;
      __int16 v34 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@FixUp: found trigger with invalid name, updating name from: %@ to: %@", buf, 0x20u);
    }
  }
}

- (void)_fixupUserAuthorizationDataForUserModel:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isOwner])
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = [(HMDHH2Migrator *)self homeData];
    id v7 = [v6 homes];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke;
    v16[3] = &unk_264A2B898;
    id v8 = v5;
    id v17 = v8;
    objc_msgSend(v7, "na_each:", v16);

    uint64_t v9 = (void *)[v8 copy];
    [v4 setOwnerCharacteristicAuthorizationData:v9];

    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      id v15 = [v4 ownerCharacteristicAuthorizationData];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@FixUp: Updating %@ user's characteristics authorization data to %@", buf, 0x20u);
    }
  }
}

void __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 hapAccessories];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_2;
  v4[3] = &unk_264A28370;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 services];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_3;
  v6[3] = &unk_264A28348;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v6);
}

void __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_4;
  v4[3] = &unk_264A28320;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v4);
}

void __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_4(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 getCharacteristicDictionaryForMigrationFixup];
  id v4 = [v3 objectForKeyedSubscript:@"kCharacteristicAuthorizationDataCodingKey"];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) uuid];
    id v7 = [v5 objectForKeyedSubscript:v6];
    id v8 = v7;
    if (!v7)
    {
      id v8 = [MEMORY[0x263EFF9A0] dictionary];
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) uuid];
    [v9 setObject:v8 forKeyedSubscript:v10];

    if (!v7) {
    uint64_t v11 = *(void **)(a1 + 32);
    }
    uint64_t v12 = [*(id *)(a1 + 40) uuid];
    id v13 = [v11 objectForKeyedSubscript:v12];
    id v14 = [v15 instanceID];
    [v13 setObject:v4 forKeyedSubscript:v14];
  }
}

- (void)_fixupInvalidCharacteristicFormat:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [a3 characteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HMDHH2Migrator__fixupInvalidCharacteristicFormat_context___block_invoke;
  v9[3] = &unk_264A282F8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
}

void __60__HMDHH2Migrator__fixupInvalidCharacteristicFormat_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 format];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = [v3 debugDescription];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@FixUp: Deleting the characteristic without a format : %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) deleteObject:v3];
  }
}

- (void)_fixupUserAccessCodeWithInvalidValue:(id)a3 context:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v8 accessCode];

  if (!v9)
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v8 debugDescription];
      int v15 = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      __int16 v18 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@FixUp: Found MKFUserAccessCode without accessCode. Going to remove this entity: %@", (uint8_t *)&v15, 0x16u);
    }
    [v7 deleteObject:v8];
  }
}

- (void)_fixupGuestAccessCodeWithInvalidLabel:(id)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v8 label];
  if (!v9
    || (int v10 = (void *)v9,
        [v8 label],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 length],
        v11,
        v10,
        !v12))
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = HMFGetLogIdentifier();
      __int16 v17 = [v8 debugDescription];
      int v18 = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      id v21 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@FixUp: Found MKFGuestAccessCode with empty label. Going to remove this entity: %@", (uint8_t *)&v18, 0x16u);
    }
    [v7 deleteObject:v8];
  }
}

- (void)_fixupHomeManagerPairingIdentity:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = HMFGetLogIdentifier();
    __int16 v16 = [v11 controllerKeyIdentifier];
    int v23 = 138543618;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    id v26 = v16;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@FixUp: Current controller key identifier for the home manager is %@", (uint8_t *)&v23, 0x16u);
  }
  __int16 v17 = [v9 identifier];
  [v11 setControllerKeyIdentifier:v17];

  int v18 = (void *)MEMORY[0x230FBD990]();
  uint64_t v19 = v13;
  __int16 v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = HMFGetLogIdentifier();
    uint64_t v22 = [v11 controllerKeyIdentifier];
    int v23 = 138543618;
    uint64_t v24 = v21;
    __int16 v25 = 2112;
    id v26 = v22;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@FixUp: Updating the controller key identifier for the Home Manager to %@", (uint8_t *)&v23, 0x16u);
  }
}

- (void)_fixupUserPairingIdentity:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 privilege];
  int v12 = [v11 intValue];

  if (v12 == 3)
  {
    id v13 = [(HMDHH2Migrator *)self homeData];
    uint64_t v14 = [v13 account];

    if (v14)
    {
      int v15 = [(HMDHH2Migrator *)self homeData];
      __int16 v16 = [v15 account];
      __int16 v17 = [v16 identifier];
      [v8 setAccountIdentifier:v17];

      int v18 = [(HMDHH2Migrator *)self homeData];
      uint64_t v19 = [v18 primaryAccountHandle];
      if (v19)
      {
        [v8 setAccountHandle:v19];
      }
      else
      {
        __int16 v20 = [v14 primaryHandle];
        [v8 setAccountHandle:v20];
      }
    }
    id v21 = (void *)MEMORY[0x230FBD990]([v8 setPairingIdentity:v9]);
    uint64_t v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      __int16 v25 = [v8 pairingIdentity];
      int v26 = 138543618;
      uint64_t v27 = v24;
      __int16 v28 = 2112;
      long long v29 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@FixUp: Updating owner's pairing identity : %@", (uint8_t *)&v26, 0x16u);
    }
  }
}

- (void)_updatePairingIdentityForHome:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  int v12 = [v9 publicKey];
  id v13 = [v12 data];
  [v11 setOwnerPublicKey:v13];

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  int v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    int v18 = [v11 ownerPublicKey];
    int v19 = 138543618;
    __int16 v20 = v17;
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@FixUp: Updated the home owner's public key to %@", (uint8_t *)&v19, 0x16u);
  }
}

- (void)_fixupHomeInvalidName:(id)a3 context:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 name];
  id v10 = v9;
  if (!v9 || ![(__CFString *)v9 length])
  {
    id v11 = NSString;
    int v12 = HMDLocalizedStringForKey(@"HOME_FALLBACK_NAME");
    id v28 = 0;
    objc_msgSend(v11, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, @"%ld", &v28, _fixupHomeInvalidName_context__fixedUpHomeNameCounter);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v14 = v28;

    int v15 = v13;
    if (!v13)
    {
      id v27 = v7;
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        int v18 = v26 = v16;
        *(_DWORD *)long long buf = 138544130;
        uint64_t v30 = v18;
        __int16 v31 = 2112;
        __int16 v32 = @"HOME_FALLBACK_NAME";
        __int16 v33 = 2112;
        __int16 v34 = @"%ld";
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        __int16 v16 = v26;
      }

      int v15 = @"HOME_FALLBACK_NAME";
      id v7 = v27;
    }
    int v19 = v15;

    uint64_t v20 = [v8 setName:v19];
    ++_fixupHomeInvalidName_context__fixedUpHomeNameCounter;
    __int16 v21 = (void *)MEMORY[0x230FBD990](v20);
    uint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      __int16 v25 = [v8 name];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      __int16 v32 = v10;
      __int16 v33 = 2112;
      __int16 v34 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@FixUp: found home with invalid name, updating name from: %@ to: %@", buf, 0x20u);
    }
  }
}

- (void)_fixUpHomeWithoutOwner:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  int v12 = [v11 owner];

  if (!v12)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Looks like this home does not have owner. Going to create one", (uint8_t *)&v19, 0xCu);
    }
    __int16 v17 = [[_MKFUser alloc] initWithContext:v10];
    int v18 = [MEMORY[0x263F08C38] UUID];
    [(_MKFUser *)v17 setModelID:v18];

    [(_MKFUser *)v17 setPairingIdentity:v9];
    [(_MKFUser *)v17 setPrivilege:&unk_26E473120];
    [v11 setOwner:v17];
    [(_MKFUser *)v17 setHome:v11];
    [(_MKFUser *)v17 setOwnedHome:v11];
  }
}

- (void)fixupModelForMigration:(id)a3 backingStoreModelObject:(id)a4 hh2ControllerKey:(id)a5
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 managedObject];
  int v12 = [v11 entity];
  id v13 = +[_MKFHome entity];
  int v14 = [v12 isKindOfEntity:v13];

  p_cache = MKFCKOutgoingInvitation.cache;
  if (v14)
  {
    [(HMDHH2Migrator *)self _updatePairingIdentityForHome:v11 withHH2ControllerKey:v10 context:v8];
    [(HMDHH2Migrator *)self _fixUpHomeWithoutOwner:v11 withHH2ControllerKey:v10 context:v8];
    [(HMDHH2Migrator *)self _fixupHomeInvalidName:v11 context:v8];
    id v16 = v11;
    id v17 = v8;
    if (self)
    {
      id v100 = v10;
      id v97 = v16;
      id v18 = v17;
      id v102 = 0;
      int v19 = +[_MKFHomeManager fetchWithContext:v18 error:&v102];
      id v20 = v102;
      id v98 = v17;
      id v99 = v16;
      if (v19)
      {
        uint64_t v21 = [v19 appDataDictionary];
        if (v21)
        {
          BOOL v22 = +[HMDHome didHomeAppOnboardHindsightWithAppData:v21];
        }
        else
        {
          context = (void *)MEMORY[0x230FBD990]();
          id v27 = self;
          id v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            long long v29 = v95 = v9;
            *(_DWORD *)long long buf = 138543362;
            v104 = v29;
            _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Home manager doesn't have app data", buf, 0xCu);

            id v9 = v95;
          }

          BOOL v22 = 0;
          p_cache = MKFCKOutgoingInvitation.cache;
        }
      }
      else
      {
        uint64_t v23 = (void *)MEMORY[0x230FBD990]();
        uint64_t v24 = self;
        __int16 v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          int v26 = v94 = v9;
          *(_DWORD *)long long buf = 138543618;
          v104 = v26;
          __int16 v105 = 2114;
          id v106 = v20;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to find home manager: %{public}@", buf, 0x16u);

          id v9 = v94;
        }

        BOOL v22 = 0;
        p_cache = (void **)(MKFCKOutgoingInvitation + 16);
      }

      uint64_t v30 = (void *)MEMORY[0x230FBD990]();
      __int16 v31 = self;
      __int16 v32 = HMFGetOSLogHandle();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
      if (v22)
      {
        __int16 v34 = v97;
        if (v33)
        {
          __int16 v35 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v104 = v35;
          __int16 v105 = 2112;
          id v106 = v97;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Home %@ has previously onboarded hindsight", buf, 0x16u);
        }
        [v97 setDidOnboardEventLog:MEMORY[0x263EFFA88]];
      }
      else
      {
        __int16 v34 = v97;
        if (v33)
        {
          id v36 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v104 = v36;
          __int16 v105 = 2112;
          id v106 = v97;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Home %@ has not completed hindsight onboarding", buf, 0x16u);
        }
      }

      id v16 = v99;
      id v10 = v100;
      id v17 = v98;
    }
  }
  uint64_t v37 = [v11 entity];
  id v38 = +[_MKFUser entity];
  int v39 = [v37 isKindOfEntity:v38];

  if (v39)
  {
    id v40 = v11;
    id v41 = [v40 privilege];
    int v42 = [v41 intValue];

    if (v42 == 3)
    {
      [(HMDHH2Migrator *)self _fixupUserPairingIdentity:v40 withHH2ControllerKey:v10 context:v8];
      [(HMDHH2Migrator *)self fixupAssistantAccessControlForUserModel:v40];
      [(HMDHH2Migrator *)self _fixupUserAuthorizationDataForUserModel:v40];
    }
  }
  id v43 = [v11 entity];
  uint64_t v44 = [p_cache + 298 entity];
  int v45 = [v43 isKindOfEntity:v44];

  if (v45) {
    [(HMDHH2Migrator *)self _fixupHomeManagerPairingIdentity:v11 withHH2ControllerKey:v10 context:v8];
  }
  v46 = [v11 entity];
  uint64_t v47 = +[_MKFAppleMediaAccessory entity];
  int v48 = [v46 isKindOfEntity:v47];

  if (v48)
  {
    [(HMDHH2Migrator *)self _fixupAppleMediaAccessory:v11 context:v8];
    [(HMDHH2Migrator *)self _createResidentModelsDuringMigrationForAppleMediaAccessory:v11 context:v8];
  }
  id v49 = [v11 entity];
  uint64_t v50 = +[_MKFAccessory entity];
  int v51 = [v49 isKindOfEntity:v50];

  if (v51)
  {
    [(HMDHH2Migrator *)self _fixupAccessoryWithNoRoom:v8 coreDataModelObject:v11];
    [(HMDHH2Migrator *)self _fixupAccessoryWithNoInitialValues:v11];
  }
  __int16 v52 = [v11 entity];
  id v53 = +[_MKFSoftwareUpdate entity];
  int v54 = [v52 isKindOfEntity:v53];

  if (v54) {
    [(HMDHH2Migrator *)self _fixupSoftwareUpdateModelWithNoAccessory:v8 coreDataModelObject:v11];
  }
  __int16 v55 = [v11 entity];
  id v56 = +[_MKFGuestAccessCode entity];
  int v57 = [v55 isKindOfEntity:v56];

  if (v57)
  {
    uint64_t v58 = (void *)MEMORY[0x263F08C38];
    id v59 = v11;
    dispatch_group_t v60 = [v58 UUID];
    [v59 setHh2ModelID:v60];

    [(HMDHH2Migrator *)self _fixupGuestAccessCodeWithInvalidLabel:v59 context:v8];
  }
  v61 = [v11 entity];
  id v62 = +[_MKFRemovedUserAccessCode entity];
  int v63 = [v61 isKindOfEntity:v62];

  if (v63)
  {
    v64 = (void *)MEMORY[0x263F08C38];
    id v65 = v11;
    uint64_t v66 = [v64 UUID];
    [v65 setHh2ModelID:v66];
  }
  v67 = [v11 entity];
  v68 = +[_MKFApplicationData entity];
  int v69 = [v67 isKindOfEntity:v68];

  if (v69)
  {
    id v70 = v11;
    if (([v70 hasValidContainer] & 1) == 0)
    {
      v71 = (void *)MEMORY[0x230FBD990]();
      v72 = self;
      v73 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v74 = id v96 = v9;
        [v70 debugDescription];
        v75 = id v101 = v10;
        v76 = [v70 appDataDictionary];
        *(_DWORD *)long long buf = 138543874;
        v104 = v74;
        __int16 v105 = 2112;
        id v106 = v75;
        __int16 v107 = 2112;
        v108 = v76;
        _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_INFO, "%{public}@FixUp : Deleting app data [%@] as it is not associated with any container : %@", buf, 0x20u);

        id v10 = v101;
        id v9 = v96;
      }

      [v8 deleteObject:v70];
    }
  }
  v77 = [v11 entity];
  v78 = +[_MKFUserAccessCode entity];
  int v79 = [v77 isKindOfEntity:v78];

  if (v79) {
    [(HMDHH2Migrator *)self _fixupUserAccessCodeWithInvalidValue:v11 context:v8];
  }
  v80 = [v11 entity];
  v81 = +[_MKFService entity];
  int v82 = [v80 isKindOfEntity:v81];

  if (v82) {
    [(HMDHH2Migrator *)self _fixupInvalidCharacteristicFormat:v11 context:v8];
  }
  v83 = [v11 entity];
  v84 = +[_MKFTrigger entity];
  int v85 = [v83 isKindOfEntity:v84];

  if (v85) {
    [(HMDHH2Migrator *)self _fixupTriggerInvalidName:v11 context:v8];
  }
  v86 = [v11 entity];
  v87 = +[_MKFActionSet entity];
  int v88 = [v86 isKindOfEntity:v87];

  if (v88)
  {
    id v89 = v11;
    [(HMDHH2Migrator *)self _fixupActionSetInvalidName:v89 context:v8];
    [(HMDHH2Migrator *)self _fixupActionSetUnlocalizedName:v89];
    [(HMDHH2Migrator *)self _fixupCharacteristicWriteActionWithInvalidService:v89 context:v8];
  }
  v90 = [v11 entity];
  v91 = +[_MKFEventTrigger entity];
  int v92 = [v90 isKindOfEntity:v91];

  if (v92) {
    [(HMDHH2Migrator *)self _fixupCharacteristicEventTriggerInvalidService:v11 context:v8];
  }
}

- (BOOL)_saveAndResetWithContext:(id)a3 errorMessage:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  char v8 = objc_msgSend(v6, "hmd_saveWithTransactionAuthor:error:", 7, &v15);
  id v9 = v15;
  if ((v8 & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@%@, Save Error: %@", buf, 0x20u);
    }
    [(HMDHH2Migrator *)v11 submitABCEventForFailedMigrationWithReason:1 withError:v9];
  }
  [v6 reset];

  return v8;
}

- (BOOL)populateAndSaveCDModelsFrom:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5 tag:(id)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v42 = a5;
  int v12 = (uint64_t (*)(uint64_t, uint64_t))a6;
  id v13 = (void *)MEMORY[0x230FBD990]();
  int v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    id v59 = v12;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Migrating [%@] models for %@", buf, 0x20u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v59 = __Block_byref_object_copy__220801;
  dispatch_group_t v60 = __Block_byref_object_dispose__220802;
  id v61 = 0;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke;
  v50[3] = &unk_264A28280;
  id v18 = v11;
  __int16 v52 = v14;
  id v53 = buf;
  id v51 = v18;
  uint64_t v19 = objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v50);
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    __int16 v20 = (void *)MEMORY[0x230FBD990](v19);
    id v21 = v14;
    HMFGetOSLogHandle();
    uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
      *(_DWORD *)int v54 = 138543618;
      __int16 v55 = v23;
      __int16 v56 = 2112;
      int v57 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to create managed object : %@", v54, 0x16u);
    }
    [(HMDHH2Migrator *)v21 submitABCEventForFailedMigrationWithReason:8 withError:*(void *)(*(void *)&buf[8] + 40)];
    BOOL v25 = 0;
  }
  else
  {
    int v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke_97;
    v46[3] = &unk_264A282A8;
    v46[4] = v14;
    id v49 = buf;
    id v27 = v18;
    id v47 = v27;
    id v28 = v26;
    id v48 = v28;
    uint64_t v29 = objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v46);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v30 = (void *)MEMORY[0x230FBD990](v29);
      __int16 v31 = v14;
      HMFGetOSLogHandle();
      __int16 v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        BOOL v33 = HMFGetLogIdentifier();
        __int16 v34 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
        *(_DWORD *)int v54 = 138543618;
        __int16 v55 = v33;
        __int16 v56 = 2112;
        int v57 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to update managed object : %@", v54, 0x16u);
      }
      [(HMDHH2Migrator *)v31 submitABCEventForFailedMigrationWithReason:8 withError:*(void *)(*(void *)&buf[8] + 40)];
      BOOL v25 = 0;
    }
    else
    {
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke_101;
      v43[3] = &unk_264A282D0;
      v43[4] = v14;
      id v35 = v27;
      id v44 = v35;
      id v45 = v42;
      id v36 = (void *)MEMORY[0x230FBD990](objc_msgSend(v28, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v43));
      uint64_t v37 = v14;
      HMFGetOSLogHandle();
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        int v39 = HMFGetLogIdentifier();
        *(_DWORD *)int v54 = 138543618;
        __int16 v55 = v39;
        __int16 v56 = 2112;
        int v57 = v12;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Going to save all CD models for the [%@] to the working store", v54, 0x16u);
      }
      id v40 = [NSString stringWithFormat:@"Failed to save during migrating %@", v12];
      BOOL v25 = [(HMDHH2Migrator *)v37 _saveAndResetWithContext:v35 errorMessage:v40];
    }
  }

  _Block_object_dispose(buf, 8);
  return v25;
}

void __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = HMDCastIfModelCDRepresentable(v6);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = objc_msgSend(v7, "cd_currentManagedObjectInContext:error:", v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138543874;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to create current managed object for %@: %@", buf, 0x20u);
    }
    *a4 = 1;
  }
}

void __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke_97(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a2;
  int v7 = [(id)objc_opt_class() shouldIgnoreModel:v6];
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v6 bsoType];
      int v14 = [v6 uuid];
      *(_DWORD *)long long buf = 138543874;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v13;
      __int16 v38 = 2112;
      int v39 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not migrating [%@.%@] as it is ignored right now.", buf, 0x20u);
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)long long buf = 138543874;
      id v35 = v15;
      __int16 v36 = 2112;
      id v37 = v6;
      __int16 v38 = 2112;
      int v39 = v16;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Populating CD object for %@: %@", buf, 0x20u);
    }
    id v17 = HMDCastIfModelCDRepresentable(v6);
    if (!v17) {
      _HMFPreconditionFailure();
    }
    id v18 = v17;
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v20 + 40);
    char v21 = objc_msgSend(v17, "cd_updateManagedObjectInContext:error:", v19, &obj);
    objc_storeStrong((id *)(v20 + 40), obj);
    if (v21)
    {
      uint64_t v22 = [v6 managedObject];

      if (v22)
      {
        [*(id *)(a1 + 48) addObject:v6];
      }
      else
      {
        uint64_t v29 = (void *)MEMORY[0x230FBD990]();
        id v30 = *(id *)(a1 + 32);
        __int16 v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v32 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          id v35 = v32;
          __int16 v36 = 2112;
          id v37 = v6;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Nil managed object found for [%@]. Not adding to the migration list", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = *(id *)(a1 + 32);
      BOOL v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = HMFGetLogIdentifier();
        id v27 = [v6 bsoType];
        id v28 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)long long buf = 138543874;
        id v35 = v26;
        __int16 v36 = 2112;
        id v37 = v27;
        __int16 v38 = 2112;
        int v39 = v28;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not populate CD version of %@ due to %@", buf, 0x20u);
      }
      *a4 = 1;
    }
  }
}

uint64_t __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke_101(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fixupModelForMigration:*(void *)(a1 + 40) backingStoreModelObject:a2 hh2ControllerKey:*(void *)(a1 + 48)];
}

- (id)findAndRemoveAllModelsWithInvalidAccessCodes:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_70_220909);
  id v5 = objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_73_220910);

  id v6 = objc_msgSend(v3, "na_map:", &__block_literal_global_76_220911);
  int v7 = objc_msgSend(v6, "na_dictionaryWithKeyGenerator:", &__block_literal_global_79_220912);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_5;
  v12[3] = &unk_264A28188;
  id v13 = v7;
  id v14 = v5;
  id v8 = v5;
  id v9 = v7;
  id v10 = objc_msgSend(v3, "na_map:", v12);

  return v10;
}

id __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_5(uint64_t a1, void *a2)
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
  id v6 = v5;
  if (v5)
  {
    int v7 = *(void **)(a1 + 32);
    id v8 = [v5 parentUUID];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = *(void **)(a1 + 40);
      BOOL v11 = [v9 userID];
      id v12 = [v10 objectForKeyedSubscript:v11];

      if (v12)
      {
        id v13 = [v12 accessCode];

        if (v13)
        {
          id v14 = [v12 accessCode];
          [v6 setValue:v14];

          id v15 = v6;
          id v13 = v3;
        }
      }
      else
      {
        id v13 = v3;
      }
    }
    else
    {
      id v13 = v3;
    }
  }
  else
  {
    id v13 = v3;
  }

  return v13;
}

uint64_t __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

id __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_3(uint64_t a1, void *a2)
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

id __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 user];
  id v3 = [v2 objectForKeyedSubscript:@"userID"];

  return v3;
}

id __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke(uint64_t a1, void *a2)
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

- (id)_auditAccessCodesByRemovingIllegalDuplicatesFromModels:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke;
  v16[3] = &unk_264A280C0;
  id v17 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(v5, "na_map:", v16);
  int v7 = objc_msgSend(v5, "na_map:", &__block_literal_global_67_220928);
  id v8 = [(id)objc_opt_class() auditedHomeAccessCodeModelsFromModels:v7 userAccessCodeModelsAndInvites:v6];
  id v9 = [(id)objc_opt_class() auditedUserAccessCodeModelsAndInvitesFromModels:v6];
  id v10 = [(id)objc_opt_class() arrayByRemovingElementsInArray:v8 fromArray:v7];
  BOOL v11 = [(id)objc_opt_class() arrayByRemovingElementsInArray:v9 fromArray:v6];
  id v12 = [v10 arrayByAddingObjectsFromArray:v11];
  id v13 = [(id)objc_opt_class() arrayByRemovingElementsInArray:v12 fromArray:v5];
  id v14 = [(HMDHH2Migrator *)self findAndRemoveAllModelsWithInvalidAccessCodes:v13];

  return v14;
}

id __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v3 && (isKindOfClass & 1) != 0)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v7 = v6;
    }
    else {
      int v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke_2;
      v17[3] = &unk_264A28098;
      id v18 = v8;
      id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", v17);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v11 = v10;
      }
      else {
        BOOL v11 = 0;
      }
      id v12 = v11;
      id v13 = v12;
      if (v12
        && ([v12 privilege],
            id v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v14 isEqual:&unk_26E473120],
            v14,
            v15))
      {
        id v5 = v6;
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

id __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke_64(uint64_t a1, void *a2)
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

uint64_t __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) parentUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)migrateHomeToCoreData:(id)a3 primaryHomeUUID:(id)a4 managedObjectContext:(id)a5 hh2ControllerKey:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x230FBD990]();
  int v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v42 = v17;
    __int16 v43 = 2112;
    id v44 = v10;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting migration for home : %@", buf, 0x16u);
  }
  id v18 = [MEMORY[0x263EFF980] array];
  uint64_t v19 = [v10 uuid];
  char v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
  {
    id v40 = v13;
    char v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = v15;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v24 = v39 = v11;
      BOOL v25 = [v10 name];
      int v26 = [v10 uuid];
      *(_DWORD *)long long buf = 138543874;
      id v42 = v24;
      __int16 v43 = 2112;
      id v44 = v25;
      __int16 v45 = 2112;
      v46 = v26;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Adding HMDHomeManagerHomeModel for %@/%@", buf, 0x20u);

      id v11 = v39;
    }

    id v27 = objc_opt_class();
    id v28 = [v10 uuid];
    uint64_t v29 = [v27 modelForHomeUUID:v28];

    [v29 setObjectChangeType:1];
    [v18 addObject:v29];

    id v13 = v40;
  }
  id v30 = [v10 backingStoreObjects:4 hh2Migration:1];
  [v18 addObjectsFromArray:v30];

  __int16 v31 = [v10 uuid];
  __int16 v32 = HMDWorkingContextNameForHomeUUID(v31);
  [v12 setName:v32];

  BOOL v33 = (void *)MEMORY[0x230FBD990]();
  __int16 v34 = [(id)objc_opt_class() modelsByDroppingEmptyStringAccessCodesOnModels:v18];
  id v35 = [(HMDHH2Migrator *)v15 _auditAccessCodesByRemovingIllegalDuplicatesFromModels:v34];

  __int16 v36 = [v10 name];
  BOOL v37 = [(HMDHH2Migrator *)v15 populateAndSaveCDModelsFrom:v35 managedObjectContext:v12 hh2ControllerKey:v13 tag:v36];

  return v37;
}

- (BOOL)migrateHome:(id)a3 primaryHomeUUID:(id)a4 managedObjectContext:(id)a5 hh2ControllerKey:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = [v10 isOwnerUser];
  int v15 = (void *)MEMORY[0x230FBD990]();
  if ((v14 & 1) == 0)
  {
    uint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = HMFGetLogIdentifier();
      int v32 = 138543618;
      BOOL v33 = v24;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Not migrating home [%@] as it is not owned by the current user.", (uint8_t *)&v32, 0x16u);
    }
    goto LABEL_11;
  }
  id v16 = (void *)MEMORY[0x230FBD990]();
  if (![(HMDHH2Migrator *)self migrateHomeToCoreData:v10 primaryHomeUUID:v11 managedObjectContext:v12 hh2ControllerKey:v13])
  {
    int v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t v29 = HMFGetLogIdentifier();
    int v32 = 138543362;
    BOOL v33 = v29;
    id v30 = "%{public}@Unable to migrate home data to Core Data.";
LABEL_20:
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v32, 0xCu);

    goto LABEL_21;
  }
  id v16 = (void *)MEMORY[0x230FBD990]();
  if (![(HMDHH2Migrator *)self migrateV5Models:v12 forHome:v10])
  {
    int v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t v29 = HMFGetLogIdentifier();
    int v32 = 138543362;
    BOOL v33 = v29;
    id v30 = "%{public}@Unable to migrate v5 models to Core Data.";
    goto LABEL_20;
  }
  id v17 = [(HMDHH2Migrator *)self migratorRecord];
  char v18 = [v17 shouldSkipKeyRollOperations];

  id v16 = (void *)MEMORY[0x230FBD990]();
  if (v18)
  {
    uint64_t v19 = self;
    char v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      char v21 = HMFGetLogIdentifier();
      int v32 = 138543362;
      BOOL v33 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@*=*=*=*= Not scheduling any kind of key roll operations as migrator was asked to skip them. *=*=*=*=", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_17;
  }
  if (![(HMDHH2Migrator *)self rollAccessoryKeysToHH2:v10 hh2ControllerKey:v13])
  {
    int v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      int v32 = 138543362;
      BOOL v33 = v29;
      id v30 = "%{public}@Unable to schedule key-roll operations";
      goto LABEL_20;
    }
LABEL_21:

    BOOL v25 = 0;
    goto LABEL_22;
  }
LABEL_17:
LABEL_11:
  BOOL v25 = 1;
LABEL_22:

  return v25;
}

- (BOOL)migrateHomeManager:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = [v7 primaryHomeUUID];
  if (v11)
  {
    id v12 = [v7 homes];
    id v13 = objc_msgSend(v12, "hmf_firstObjectWithUUID:", v11);

    if (([v13 isOwnerUser] & 1) == 0)
    {
      __int16 v31 = v10;
      char v14 = (void *)MEMORY[0x230FBD990]();
      int v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        [v13 isOwnerUser];
        char v18 = HMFBooleanToString();
        *(_DWORD *)long long buf = 138543874;
        __int16 v34 = v17;
        __int16 v35 = 2112;
        uint64_t v36 = v11;
        __int16 v37 = 2112;
        __int16 v38 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping migrating primary home setting %@, primaryHome.isOwnerUser = %@", buf, 0x20u);
      }

      id v11 = 0;
      id v10 = v31;
    }
  }
  uint64_t v19 = objc_opt_class();
  char v20 = [v7 cloudZones];
  char v21 = [v7 applicationData];
  uint64_t v22 = [v19 getAllBackingStoreObjects:4 primaryHomeUUID:v11 cloudZone:v20 appData:v21];

  if (v11)
  {
    uint64_t v23 = v10;
    id v24 = (void *)MEMORY[0x230FBD990]();
    BOOL v25 = self;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      __int16 v34 = v27;
      __int16 v35 = 2112;
      uint64_t v36 = v11;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Adding primary HMDHomeManagerHomeModel %@", buf, 0x16u);
    }
    id v28 = [(id)objc_opt_class() modelForHomeUUID:v11];
    [v28 setObjectChangeType:1];
    [v22 addObject:v28];

    id v10 = v23;
  }
  [v8 setName:@"HomeManager"];
  BOOL v29 = [(HMDHH2Migrator *)self populateAndSaveCDModelsFrom:v22 managedObjectContext:v8 hh2ControllerKey:v9 tag:@"Home Manager"];

  return v29;
}

- (BOOL)migrateHomeData:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(HMDHH2Migrator *)self setHomeData:v8];
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  BOOL v11 = [(HMDHH2Migrator *)self migrateHomeManager:v8 managedObjectContext:v9 hh2ControllerKey:v10];
  *((unsigned char *)v35 + 24) = v11;
  if (v11)
  {
    id v12 = [v8 homes];
    BOOL v13 = [v12 count] == 0;

    if (v13)
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      BOOL v25 = self;
      HMFGetOSLogHandle();
      int v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v39 = v27;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@There are no homes... Skipping home migration path...", buf, 0xCu);
      }
      BOOL v15 = 1;
    }
    else
    {
      [(HMDHH2Migrator *)self _fixupUserUUID:v8];
      char v14 = [v8 homes];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __72__HMDHH2Migrator_migrateHomeData_managedObjectContext_hh2ControllerKey___block_invoke;
      v29[3] = &unk_264A28050;
      BOOL v33 = &v34;
      void v29[4] = self;
      id v30 = v8;
      id v31 = v9;
      id v32 = v10;
      objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);

      BOOL v15 = *((unsigned char *)v35 + 24) != 0;
      if (!*((unsigned char *)v35 + 24))
      {
        id v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = self;
        HMFGetOSLogHandle();
        char v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          uint64_t v39 = v19;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to migrate the homes to CD.", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    char v20 = (void *)MEMORY[0x230FBD990]();
    char v21 = self;
    HMFGetOSLogHandle();
    uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v39 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to migrate the home manager to CD.", buf, 0xCu);
    }
    BOOL v15 = 0;
  }
  _Block_object_dispose(&v34, 8);

  return v15;
}

void __72__HMDHH2Migrator_migrateHomeData_managedObjectContext_hh2ControllerKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) primaryHomeUUID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v7 migrateHome:v6 primaryHomeUUID:v8 managedObjectContext:*(void *)(a1 + 48) hh2ControllerKey:*(void *)(a1 + 56)];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    *a4 = 1;
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      char v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not migrate home : %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_fixupUserUUID:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 homes];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    id v39 = v3;
    id v6 = [v3 homes];
    id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_220953];

    id v8 = [MEMORY[0x263EFF9C0] set];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v46;
      uint64_t v42 = *(void *)v46;
      id v43 = v9;
      do
      {
        uint64_t v13 = 0;
        uint64_t v40 = v11;
        do
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
          BOOL v15 = HMDIsEmptyHome(v14);
          if ([v14 isOwnerUser])
          {
            id v16 = [v14 owner];
            uint64_t v17 = [v16 uuid];
            char v18 = v8;
            int v19 = [v8 containsObject:v17];

            if (v19)
            {
              if (v15)
              {
                char v20 = [v14 uuid];
                char v21 = [v16 pairingIdentity];
                uint64_t v22 = +[HMDUser UUIDWithUserID:0 forHomeIdentifier:v20 uuid:0 pairingIdentity:v21];

                if ([v18 containsObject:v22])
                {
                  uint64_t v23 = [v16 userID];
                  id v24 = [v14 uuid];
                  BOOL v25 = +[HMDUser UUIDWithUserID:v23 forHomeIdentifier:v24 uuid:0 pairingIdentity:0];

                  if ([v18 containsObject:v25])
                  {
                    uint64_t v22 = [MEMORY[0x263F08C38] UUID];

                    int v26 = @"random";
                  }
                  else
                  {
                    uint64_t v22 = v25;
                    int v26 = @"userID";
                  }
                }
                else
                {
                  int v26 = @"pairingID";
                }
                id v41 = v26;
                uint64_t v12 = v42;
                id v9 = v43;
                uint64_t v11 = v40;
                BOOL v33 = (void *)MEMORY[0x230FBD990]();
                uint64_t v34 = self;
                __int16 v35 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  uint64_t v36 = HMFGetLogIdentifier();
                  char v37 = [v16 uuid];
                  *(_DWORD *)long long buf = 138544130;
                  uint64_t v50 = v36;
                  __int16 v51 = 2112;
                  __int16 v52 = v37;
                  __int16 v53 = 2112;
                  int v54 = v41;
                  __int16 v55 = 2112;
                  __int16 v56 = v22;
                  _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Detected duplicate user UUID %@, forcing this user to use new \"%@\" UUID %@", buf, 0x2Au);

                  uint64_t v12 = v42;
                  id v9 = v43;
                }

                [v16 setUUID:v22];
              }
              else
              {
                id v27 = (void *)MEMORY[0x230FBD990]();
                id v28 = self;
                BOOL v29 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  id v30 = HMFGetLogIdentifier();
                  id v31 = [v16 uuid];
                  id v32 = [v14 uuid];
                  *(_DWORD *)long long buf = 138543874;
                  uint64_t v50 = v30;
                  __int16 v51 = 2112;
                  __int16 v52 = v31;
                  __int16 v53 = 2112;
                  int v54 = v32;
                  _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Detected duplicate user UUID %@, not changing UUID because of none empty home %@", buf, 0x20u);

                  id v9 = v43;
                  uint64_t v12 = v42;
                }
              }
            }
            __int16 v38 = [v16 uuid];
            id v8 = v18;
            [v18 addObject:v38];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v11);
    }

    id v3 = v39;
  }
}

uint64_t __33__HMDHH2Migrator__fixupUserUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = HMDIsEmptyHome(v4);
  BOOL v7 = HMDIsEmptyHome(v5);
  if (!v6 || v7)
  {
    if (v6 || !v7)
    {
      id v9 = [v4 uuid];
      uint64_t v10 = [v9 UUIDString];
      uint64_t v11 = [v5 uuid];
      uint64_t v12 = [v11 UUIDString];
      uint64_t v8 = [v10 compare:v12];
    }
    else
    {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (BOOL)_startMigratingHomeDataFromLocation:(id)a3 usingHH2PairingKey:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@HH2 pairing identity : %@", buf, 0x16u);
  }
  char v53 = 0;
  uint64_t v12 = (void *)MEMORY[0x230FBD990](+[HMDHAPMetadata prepareMetadata]);
  id v52 = 0;
  uint64_t v13 = +[HMDMainDriver loadHomeDataFromLocalStore:&v52 fromLocation:v6 decryptionFailed:&v53 forHH2Migration:1];
  id v14 = v52;
  if (v13)
  {
    BOOL v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = v9;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      char v18 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_FAULT, "%{public}@Could not decrypt the archived home data. %@", buf, 0x16u);
    }
    [(HMDHH2Migrator *)v16 submitABCEventForFailedMigrationWithReason:7 withError:v13];

    goto LABEL_21;
  }
  if (v53 || !v14)
  {
    id v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = v9;
    BOOL v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Unable to unarchive homeData. Cannot do HH2 Migration. Aborting...", buf, 0xCu);
    }
  }
  else
  {
    int v19 = [(HMDHH2Migrator *)v9 backgroundOpsManager];
    [v19 removeAllOperationsBeforeStartingHH2Migration];

    if ([(HMDHH2Migrator *)v9 waitForFirstImportToFinish])
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v58 = 0;
      char v20 = [(HMDHH2Migrator *)v9 coreData];
      char v21 = [v20 coordinator];
      uint64_t v22 = [(HMDHH2Migrator *)v9 coreData];
      uint64_t v23 = [v22 cloudPrivateStore];
      __int16 v56 = v23;
      id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
      BOOL v25 = [v21 currentPersistentHistoryTokenFromStores:v24];

      int v26 = [(HMDHH2Migrator *)v9 coreData];
      id v27 = (void *)[v26 newManagedObjectContext];

      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __73__HMDHH2Migrator__startMigratingHomeDataFromLocation_usingHH2PairingKey___block_invoke;
      v47[3] = &unk_264A2F078;
      __int16 v51 = buf;
      v47[4] = v9;
      id v48 = v14;
      id v28 = v27;
      id v49 = v28;
      id v50 = v7;
      uint64_t v29 = [v28 performBlockAndWait:v47];
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        if ([(HMDHH2Migrator *)v9 waitForCDToExportModelsToCloudKit:v25])
        {
          if ([(HMDHH2Migrator *)v9 waitForV5UpdatesToSyncToCloudKit])
          {
            if ([(HMDHH2Migrator *)v9 handlePostMigration])
            {
              BOOL v30 = 1;
LABEL_32:

              _Block_object_dispose(buf, 8);
              goto LABEL_22;
            }
            char v37 = (void *)MEMORY[0x230FBD990]();
            long long v45 = v9;
            HMFGetOSLogHandle();
            id v39 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              long long v46 = HMFGetLogIdentifier();
              *(_DWORD *)int v54 = 138543362;
              __int16 v55 = v46;
              _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to finish post migration task. Aborting...", v54, 0xCu);
            }
          }
          else
          {
            char v37 = (void *)MEMORY[0x230FBD990]();
            id v43 = v9;
            HMFGetOSLogHandle();
            id v39 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              id v44 = HMFGetLogIdentifier();
              *(_DWORD *)int v54 = 138543362;
              __int16 v55 = v44;
              _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to sync V5 updates to CloudKit. Aborting...", v54, 0xCu);
            }
          }
        }
        else
        {
          char v37 = (void *)MEMORY[0x230FBD990]();
          id v41 = v9;
          HMFGetOSLogHandle();
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            uint64_t v42 = HMFGetLogIdentifier();
            *(_DWORD *)int v54 = 138543362;
            __int16 v55 = v42;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to export CD models to CloudKit. Aborting...", v54, 0xCu);
          }
        }
      }
      else
      {
        char v37 = (void *)MEMORY[0x230FBD990](v29);
        __int16 v38 = v9;
        HMFGetOSLogHandle();
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = HMFGetLogIdentifier();
          *(_DWORD *)int v54 = 138543362;
          __int16 v55 = v40;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to do migration to HH2. Aborting...", v54, 0xCu);
        }
      }

      BOOL v30 = 0;
      goto LABEL_32;
    }
    id v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = v9;
    BOOL v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __int16 v35 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Timed out while waiting for first import to finish", buf, 0xCu);
    }
  }

LABEL_21:
  BOOL v30 = 0;
LABEL_22:

  return v30;
}

uint64_t __73__HMDHH2Migrator__startMigratingHomeDataFromLocation_usingHH2PairingKey___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) migrateHomeData:*(void *)(a1 + 40) managedObjectContext:*(void *)(a1 + 48) hh2ControllerKey:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 48);
  return [v2 reset];
}

- (BOOL)startMigratingHomeDataFromLocation:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F35AD0] systemStore];
  id v23 = 0;
  id v24 = 0;
  int v6 = [v5 getOrCreateHH2ControllerKey:&v24 secretKey:0 keyPair:0 username:&v23];
  id v7 = v24;
  id v8 = v23;

  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      int v26 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_FAULT, "%{public}@FATAL Error : Unable to create HH2 Controller key", buf, 0xCu);
    }
    BOOL v15 = 0;
  }
  else
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v7];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F35A78]) initWithIdentifier:v8 publicKey:v16 privateKey:0 permissions:1];
    char v18 = [(HMDHH2Migrator *)self migratorRecord];
    int v19 = [v18 migrateFromTestDirectory];

    char v20 = (void *)MEMORY[0x230FBD990]();
    if (v19) {
      BOOL v21 = [(HMDHH2Migrator *)self _performMigrationFromTestDirectoryUsingHH2ControllerKey:v17];
    }
    else {
      BOOL v21 = [(HMDHH2Migrator *)self _startMigratingHomeDataFromLocation:v4 usingHH2PairingKey:v17];
    }
    BOOL v15 = v21;
  }
  return v15;
}

- (BOOL)startMigrationFromLocation:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"HH2 Migration" parent:0 options:1];
  [v5 begin];
  id v6 = v5;
  id v40 = v6;
  id v7 = [(HMDHH2Migrator *)self migratorRecord];
  char v8 = [v7 isMigrationInProgress];
  BOOL v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  if (v8)
  {
    HMFGetOSLogHandle();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v42 = v12;
      __int16 v43 = 2112;
      id v44 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Current device is the designated migrator : [%@]", buf, 0x16u);
    }
    if ([v7 beginMigration])
    {
      uint64_t v13 = [(HMDHH2Migrator *)v10 hh2FrameworkSwitch];
      id v39 = 0;
      uint64_t v14 = [v13 areCloudKitServersReachableWithError:&v39];
      id v15 = v39;

      if (v14 == 1)
      {
        if ([(HMDHH2Migrator *)v10 startMigratingHomeDataFromLocation:v4])
        {
          int v28 = 0;
LABEL_27:

          char v29 = 0;
          goto LABEL_28;
        }
        uint64_t v34 = (void *)MEMORY[0x230FBD990]([(HMDHH2Migrator *)v10 revertChangesPerformedDuringMigration]);
        __int16 v35 = v10;
        HMFGetOSLogHandle();
        uint64_t v36 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          char v37 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          uint64_t v42 = v37;
          __int16 v43 = 2112;
          id v44 = v7;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not finish HH2 migration successfully. Will try again. [%@]", buf, 0x16u);
        }
      }
      else
      {
        if (v14)
        {
          BOOL v30 = (void *)MEMORY[0x230FBD990]();
          id v31 = v10;
          HMFGetOSLogHandle();
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            BOOL v33 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            uint64_t v42 = v33;
            _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Cannot start the migration as there is a CloudKit account status issue", buf, 0xCu);
          }
          char v20 = +[HMDHH2FrameworkSwitch errorFromHMDCKAccountStatus:v14];
          [(HMDHH2Migrator *)v31 submitABCEventForFailedMigrationWithReason:6 withError:v20];
        }
        else
        {
          id v16 = (void *)MEMORY[0x230FBD990]();
          uint64_t v17 = v10;
          HMFGetOSLogHandle();
          char v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            int v19 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            uint64_t v42 = v19;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot start the migration as CloudKit account status could not be queried", buf, 0xCu);
          }
          char v20 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2727 underlyingError:v15];
          [(HMDHH2Migrator *)v17 submitABCEventForFailedMigrationWithReason:6 withError:v20];
        }
      }
      int v28 = 1;
      goto LABEL_27;
    }
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = v10;
    HMFGetOSLogHandle();
    BOOL v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v26 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v42 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Cannot start the migration as unable to record the migration attempt. Switching back to HH1 framework.", buf, 0xCu);
    }
    uint64_t v27 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2718];
    +[HMDHH2MigratorRecord recordMigrationFailureWithError:v27];

    +[HMDHH2FrameworkSwitch switchBackToHH1AndRelaunchDueToHH2MigrationFailed];
    [v7 finishMigration];
  }
  else
  {
    HMFGetOSLogHandle();
    BOOL v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v42 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Migration to HH2 is not needed as this device is not the designated migrator", buf, 0xCu);
    }
  }
  int v28 = 1;
  char v29 = 1;
LABEL_28:

  __HMFActivityScopeLeave();
  return (v28 == 0) | v29;
}

- (BOOL)startMigrationIfNeeded
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(HMDHH2Migrator *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__HMDHH2Migrator_startMigrationIfNeeded__block_invoke;
  v5[3] = &unk_264A2F0A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __40__HMDHH2Migrator_startMigrationIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Initiating migration with user initiated qos", (uint8_t *)&v7, 0xCu);
  }
  uint64_t result = [*(id *)(a1 + 32) startMigrationFromLocation:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSinceDate:v4->_migrationStartTime];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating... Total time : [%f]", buf, 0x16u);
  }
  v9.receiver = v4;
  v9.super_class = (Class)HMDHH2Migrator;
  [(HMDHH2Migrator *)&v9 dealloc];
}

- (HMDHH2Migrator)initWithMigratorRecord:(id)a3 hh2FrameworkSwitch:(id)a4 coreData:(id)a5 cloudTransform:(id)a6 backgroundOperationManager:(id)a7 defaultDatabase:(id)a8 cameraClipsDatabase:(id)a9
{
  id v37 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v16 = a8;
  id v17 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HMDHH2Migrator;
  char v18 = [(HMDHH2Migrator *)&v38 init];
  int v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_migratorRecord, a3);
    objc_storeStrong((id *)&v19->_hh2FrameworkSwitch, a4);
    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    scheduledKeyRollOperationsDuringMigration = v19->_scheduledKeyRollOperationsDuringMigration;
    v19->_scheduledKeyRollOperationsDuringMigration = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9C0] set];
    v5ModelUpdateFutures = v19->_v5ModelUpdateFutures;
    v19->_v5ModelUpdateFutures = (NSMutableSet *)v22;

    uint64_t v24 = [MEMORY[0x263EFF9C0] set];
    openedZones = v19->_openedZones;
    v19->_openedZones = (NSMutableSet *)v24;

    objc_storeStrong((id *)&v19->_coreData, a5);
    objc_storeStrong((id *)&v19->_cloudTransform, a6);
    objc_storeStrong((id *)&v19->_backgroundOpsManager, a7);
    objc_storeStrong((id *)&v19->_defaultDatabase, a8);
    objc_storeStrong((id *)&v19->_cameraClipsDatabase, a9);
    uint64_t v26 = [MEMORY[0x263EFF910] date];
    migrationStartTime = v19->_migrationStartTime;
    v19->_migrationStartTime = (NSDate *)v26;

    int v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    char v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v30 = dispatch_queue_create("HMDHH2Migrator", v29);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v30;
  }
  return v19;
}

- (HMDHH2Migrator)init
{
  id v3 = [[HMDHH2FrameworkSwitch alloc] initWithAutoSwitchDisabledWithHomeManager:0];
  id v4 = +[HMDHH2MigratorRecord singleRecord];
  id v5 = +[HMDCoreData sharedInstance];
  uint64_t v6 = +[HMDCoreDataCloudTransform sharedInstance];
  int v7 = [[HMDBackgroundOperationManager alloc] initWithHomeManager:0];
  uint64_t v8 = +[HMDDatabase defaultDatabase];
  objc_super v9 = +[HMDDatabase cameraClipsDatabase];
  uint64_t v10 = [(HMDHH2Migrator *)self initWithMigratorRecord:v4 hh2FrameworkSwitch:v3 coreData:v5 cloudTransform:v6 backgroundOperationManager:v7 defaultDatabase:v8 cameraClipsDatabase:v9];

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t162 != -1) {
    dispatch_once(&logCategory__hmf_once_t162, &__block_literal_global_181_221007);
  }
  id v2 = (void *)logCategory__hmf_once_v163;
  return v2;
}

void __29__HMDHH2Migrator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v163;
  logCategory__hmf_once_v163 = v0;
}

+ (BOOL)shouldIgnoreModel:(id)a3
{
  v9[12] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = a3;
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  v9[4] = objc_opt_class();
  void v9[5] = objc_opt_class();
  v9[6] = objc_opt_class();
  v9[7] = objc_opt_class();
  v9[8] = objc_opt_class();
  v9[9] = objc_opt_class();
  v9[10] = objc_opt_class();
  v9[11] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:12];
  uint64_t v6 = [v3 setWithArray:v5];

  uint64_t v7 = objc_opt_class();
  LOBYTE(v4) = [v6 containsObject:v7];

  return (char)v4;
}

+ (id)arrayByRemovingElementsInArray:(id)a3 fromArray:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__HMDHH2Migrator_arrayByRemovingElementsInArray_fromArray___block_invoke;
  v9[3] = &unk_264A28258;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(a4, "na_map:", v9);

  return v7;
}

id __59__HMDHH2Migrator_arrayByRemovingElementsInArray_fromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

+ (id)auditedUserAccessCodeModelsAndInvitesFromModels:(id)a3
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke;
  v8[3] = &__block_descriptor_40_e67_q24__0__HMDBackingStoreModelObject_8__HMDBackingStoreModelObject_16l;
  v8[4] = a1;
  id v4 = [a3 sortedArrayUsingComparator:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke_2;
  v7[3] = &__block_descriptor_40_e57___NSArray_24__0__HMDBackingStoreModelObject_8__NSArray_16l;
  v7[4] = a1;
  id v5 = objc_msgSend(v4, "na_reduceWithInitialValue:reducer:", MEMORY[0x263EFFA68], v7);

  return v5;
}

uint64_t __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [(id)objc_opt_class() compareUserAccessCodeInModel:v5 withModel:v4];

  return v6;
}

id __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() userAccessCodeFromModel:v5];
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke_3;
    v28[3] = &__block_descriptor_40_e46___NSString_16__0__HMDBackingStoreModelObject_8l;
    v28[4] = *(void *)(a1 + 32);
    objc_super v9 = objc_msgSend(v6, "na_map:", v28);
    id v10 = [v8 setWithArray:v9];

    if ([MEMORY[0x263F0DEC0] doesAccessCode:v7 conflictWithExistingAccessCodes:v10])
    {
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        dispatch_queue_t v30 = v14;
        __int16 v31 = 2112;
        id v32 = v5;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Dropping user access code in model because it conflicts with another. Model: %@", buf, 0x16u);
      }
      id v15 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        char v18 = (void *)MEMORY[0x230FBD990]();
        id v19 = *(id *)(a1 + 32);
        uint64_t v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          BOOL v21 = HMFGetLogIdentifier();
          uint64_t v22 = [v17 user];
          [v22 objectForKeyedSubscript:@"userID"];
          id v23 = v27 = v18;
          *(_DWORD *)long long buf = 138543618;
          dispatch_queue_t v30 = v21;
          __int16 v31 = 2112;
          id v32 = v23;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@userID: %@", buf, 0x16u);

          char v18 = v27;
        }

        [v17 setAccessCode:0];
        id v24 = [v6 arrayByAddingObject:v17];
      }
      else
      {
        id v24 = v6;
      }
      BOOL v25 = v24;
    }
    else
    {
      BOOL v25 = [v6 arrayByAddingObject:v5];
    }
  }
  else
  {
    BOOL v25 = [v6 arrayByAddingObject:v5];
  }

  return v25;
}

id __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() userAccessCodeFromModel:v2];

  return v3;
}

+ (int64_t)compareUserAccessCodeInModel:(id)a3 withModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v5 && (isKindOfClass & 1) != 0)
  {
    int64_t v8 = -1;
  }
  else
  {
    id v9 = v6;
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if (v9 && (v10 & 1) != 0)
    {
      int64_t v8 = 1;
    }
    else
    {
      id v11 = v9;
      id v12 = [v5 user];
      uint64_t v13 = [v12 objectForKeyedSubscript:@"userID"];

      uint64_t v14 = [v11 user];

      id v15 = [v14 objectForKeyedSubscript:@"userID"];

      int64_t v8 = [v13 compare:v15];
    }
  }

  return v8;
}

+ (id)userAccessCodeFromModel:(id)a3
{
  id v3 = a3;
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
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v5)
  {
    uint64_t v9 = [v5 value];
LABEL_11:
    char v10 = (void *)v9;
    goto LABEL_12;
  }
  if (v8)
  {
    uint64_t v9 = [v8 accessCode];
    goto LABEL_11;
  }
  char v10 = 0;
LABEL_12:

  return v10;
}

+ (id)auditedHomeAccessCodeModelsFromModels:(id)a3 userAccessCodeModelsAndInvites:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 sortedArrayUsingSelector:sel_uuid];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke;
  v11[3] = &unk_264A281F0;
  id v12 = v6;
  id v13 = a1;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "na_reduceWithInitialValue:reducer:", MEMORY[0x263EFFA68], v11);

  return v9;
}

id __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 value];
  id v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_msgSend(v6, "na_map:", &__block_literal_global_86_221037);
  char v10 = [v8 setWithArray:v9];

  id v11 = (void *)MEMORY[0x263EFFA08];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke_3;
  v23[3] = &__block_descriptor_40_e46___NSString_16__0__HMDBackingStoreModelObject_8l;
  id v12 = *(void **)(a1 + 32);
  void v23[4] = *(void *)(a1 + 40);
  id v13 = objc_msgSend(v12, "na_map:", v23);
  uint64_t v14 = [v11 setWithArray:v13];

  id v15 = [v10 setByAddingObjectsFromSet:v14];
  if ([MEMORY[0x263F0DEC0] doesAccessCode:v7 conflictWithExistingAccessCodes:v15])
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 40);
    char v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      BOOL v25 = v19;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Dropping HMDHomeAccessCodeModel because it conflicts with another. Dropping model: %@", buf, 0x16u);
    }
    id v20 = v6;
  }
  else
  {
    id v20 = [v6 arrayByAddingObject:v5];
  }
  BOOL v21 = v20;

  return v21;
}

id __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() userAccessCodeFromModel:v2];

  return v3;
}

uint64_t __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

+ (id)modelsByDroppingEmptyStringAccessCodesOnModels:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_53_221042);
}

id __65__HMDHH2Migrator_modelsByDroppingEmptyStringAccessCodesOnModels___block_invoke(uint64_t a1, void *a2)
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
  id v5 = v4;
  if (v4
    && ([v4 accessCode],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:&stru_26E2EB898],
        v6,
        v7))
  {
    [v5 setAccessCode:0];
    id v8 = v5;
    id v9 = v2;
  }
  else
  {
    id v10 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    if (v12
      && ([v12 value],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isEqualToString:&stru_26E2EB898],
          v13,
          (v14 & 1) != 0))
    {
      id v9 = 0;
    }
    else
    {
      id v15 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      if (v17
        && ([v17 value],
            char v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v18 isEqualToString:&stru_26E2EB898],
            v18,
            (v19 & 1) != 0))
      {
        id v9 = 0;
      }
      else
      {
        id v20 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          BOOL v21 = v20;
        }
        else {
          BOOL v21 = 0;
        }
        id v22 = v21;

        if (v22
          && ([v22 accessCode],
              id v23 = objc_claimAutoreleasedReturnValue(),
              char v24 = [v23 isEqualToString:&stru_26E2EB898],
              v23,
              (v24 & 1) != 0))
        {
          id v9 = 0;
        }
        else
        {
          id v9 = v20;
        }
      }
    }
  }
  return v9;
}

@end