@interface HMDPersonManager
+ (id)logCategory;
+ (id)zoneNameForZoneUUID:(id)a3;
- (BOOL)isCurrentDeviceAvailableResident;
- (BOOL)isDataAvailable;
- (BOOL)isDataSyncInProgress;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (BOOL)sharesFaceClassifications;
- (BOOL)syncsDataToAllUsers;
- (BOOL)syncsPersonData;
- (HMBCloudZone)cloudZone;
- (HMBLocalZone)localZone;
- (HMDDatabaseZoneManager)zoneManager;
- (HMDPersonCoreDataManager)coreDataManager;
- (HMDPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 coreDataManager:(id)a5 dataInterfaces:(id)a6 workQueue:(id)a7;
- (HMDPersonManagerSettings)settings;
- (HMFTimer)unassociatedFaceCropsCleanupTimer;
- (NSSet)dataInterfaces;
- (NSString)logIdentifier;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (id)_faceCropsModelsWithUUIDs:(id)a3;
- (id)_removeFaceprintsForFaceCropsWithUUIDs:(id)a3;
- (id)_removePersonZones;
- (id)_unassociatedFaceCropsModelsWithUUIDs:(id)a3;
- (id)addOrUpdateFaceCrops:(id)a3;
- (id)addOrUpdateFaceprints:(id)a3;
- (id)addOrUpdatePersons:(id)a3;
- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4;
- (id)addUnassociatedFaceCropWithData:(id)a3;
- (id)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5;
- (id)attributeDescriptions;
- (id)createBatchChange;
- (id)disassociateFaceCropsWithUUIDs:(id)a3;
- (id)faceCropUUIDsForPersonWithUUID:(id)a3;
- (id)faceCropsForPersonWithUUID:(id)a3;
- (id)faceCropsForPersonsWithUUIDs:(id)a3;
- (id)faceCropsWithUUIDs:(id)a3;
- (id)faceprintsForFaceCropsWithUUIDs:(id)a3;
- (id)localZone:(id)a3 didProcessModelCreation:(id)a4;
- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4;
- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4;
- (id)performCloudPull;
- (id)personFaceCropWithUnassociatedFaceCropUUID:(id)a3;
- (id)personWithUUID:(id)a3;
- (id)personsWithUUIDs:(id)a3;
- (id)removeAllAssociatedDataDueToHomeGraphObjectRemoval:(BOOL)a3;
- (id)removeFaceCropsWithUUIDs:(id)a3;
- (id)removeFaceprintsWithUUIDs:(id)a3;
- (id)removePersonsWithUUIDs:(id)a3;
- (id)unassociatedFaceCropWithUUID:(id)a3;
- (id)unassociatedFaceCropsCleanupTimerFactory;
- (unint64_t)fetchBatchLimit;
- (void)_cleanUpExpiredUnassociatedFaceCrops;
- (void)_createOrRemoveZonesForSettings:(id)a3;
- (void)_createZones;
- (void)_handleCreatedOrUpdatedModel:(id)a3 mirrorOutputFuture:(id)a4;
- (void)_handleDeletedModel:(id)a3 mirrorOutputFuture:(id)a4;
- (void)_notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident;
- (void)_notifyDataInterfacesOfCurrentIsDataSyncInProgress;
- (void)configureWithHome:(id)a3;
- (void)coreDataManager:(id)a3 didRemovePersonsWithUUIDs:(id)a4;
- (void)coreDataManager:(id)a3 didUpdatePersons:(id)a4;
- (void)dealloc;
- (void)enumerateFaceCropsUsingBlock:(id)a3;
- (void)enumerateFaceprintsUsingBlock:(id)a3;
- (void)enumeratePersonFaceCropsUsingBlock:(id)a3;
- (void)enumeratePersonsUsingBlock:(id)a3;
- (void)enumerateUnassociatedFaceCropsUsingBlock:(id)a3;
- (void)handleDataSyncInProgressChangedNotification:(id)a3;
- (void)handleFaceMisclassificationForFaceCropData:(id)a3 personUUID:(id)a4;
- (void)handleResidentWasAddedNotification:(id)a3;
- (void)handleResidentWasRemovedNotification:(id)a3;
- (void)handleResidentWasUpdatedNotification:(id)a3;
- (void)handleUserPrivilegeDidChangeNotification:(id)a3;
- (void)setCloudZone:(id)a3;
- (void)setFetchBatchLimit:(unint64_t)a3;
- (void)setLocalZone:(id)a3;
- (void)setUnassociatedFaceCropsCleanupTimer:(id)a3;
- (void)setUnassociatedFaceCropsCleanupTimerFactory:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)zoneManagerDidStart:(id)a3;
- (void)zoneManagerDidStop:(id)a3;
@end

@implementation HMDPersonManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataInterfaces, 0);
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_unassociatedFaceCropsCleanupTimerFactory, 0);
  objc_storeStrong((id *)&self->_unassociatedFaceCropsCleanupTimer, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_coreDataManager, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (NSSet)dataInterfaces
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 88, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUnassociatedFaceCropsCleanupTimerFactory:(id)a3
{
}

- (id)unassociatedFaceCropsCleanupTimerFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setFetchBatchLimit:(unint64_t)a3
{
  self->_fetchBatchLimit = a3;
}

- (unint64_t)fetchBatchLimit
{
  return self->_fetchBatchLimit;
}

- (void)setUnassociatedFaceCropsCleanupTimer:(id)a3
{
}

- (HMFTimer)unassociatedFaceCropsCleanupTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 40, 1);
}

- (HMDPersonCoreDataManager)coreDataManager
{
  return (HMDPersonCoreDataManager *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)syncsPersonData
{
  return self->_syncsPersonData;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self unassociatedFaceCropsCleanupTimer];

  if (v5 == v4)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Unassociated face crops cleanup timer fired", (uint8_t *)&v10, 0xCu);
    }
    [(HMDPersonManager *)v7 _cleanUpExpiredUnassociatedFaceCrops];
  }
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDPersonManager *)self UUID];
  id v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDPersonManagerSettings)settings
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)createBatchChange
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating batch change", buf, 0xCu);
  }
  id v7 = [(HMDPersonManager *)v4 localZone];
  v8 = v7;
  if (v7)
  {
    id v21 = 0;
    v9 = [v7 createLocalInputWithError:&v21];
    id v10 = v21;
    if (v9)
    {
      v11 = [[HMDPersonDataBatchChange alloc] initWithLocalInput:v9];
      [(HMDPersonDataBatchChange *)v11 setDataSource:v4];
    }
    else
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      v17 = v4;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v23 = v19;
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create local zone input for batch change: %@", buf, 0x16u);
      }
      v11 = 0;
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    v13 = v4;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create batch change because the local zone is not available", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)removeFaceprintsWithUUIDs:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v24 = 138543618;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing faceprints with UUIDs: %@", (uint8_t *)&v24, 0x16u);
  }
  id v10 = [(HMDPersonManager *)v7 localZone];
  if (v10)
  {
    v11 = [MEMORY[0x263F49318] optionsWithLabel:@"Remove faceprints"];
    uint64_t v12 = [v10 removeModelIDs:v4 options:v11];

    v13 = (void *)MEMORY[0x263F581B8];
    v14 = [(HMDPersonManager *)v7 workQueue];
    v15 = [v13 schedulerWithDispatchQueue:v14];
    v16 = [v12 reschedule:v15];
    v17 = [v16 flatMap:&__block_literal_global_177_86849];
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    v19 = v7;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      int v24 = 138543362;
      id v25 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove faceprints because the local zone is not available", (uint8_t *)&v24, 0xCu);
    }
    v22 = (void *)MEMORY[0x263F58190];
    uint64_t v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    v17 = [v22 futureWithError:v12];
  }

  return v17;
}

uint64_t __46__HMDPersonManager_removeFaceprintsWithUUIDs___block_invoke()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (id)disassociateFaceCropsWithUUIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v27 = 138543618;
    uint64_t v28 = v9;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Disassociating face crops with UUIDs %@", (uint8_t *)&v27, 0x16u);
  }
  id v10 = [(HMDPersonManager *)v7 localZone];
  if (v10)
  {
    v11 = [(HMDPersonManager *)v7 _faceCropsModelsWithUUIDs:v4];
    uint64_t v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_164);
    v13 = objc_msgSend(v11, "na_map:", &__block_literal_global_167);
    v14 = [MEMORY[0x263F49318] optionsWithLabel:@"Disassociate face crops"];
    v15 = [v10 addModels:v13 andRemoveModelIDs:v12 options:v14];

    v16 = (void *)MEMORY[0x263F581B8];
    v17 = [(HMDPersonManager *)v7 workQueue];
    v18 = [v16 schedulerWithDispatchQueue:v17];
    v19 = [v15 reschedule:v18];
    v20 = [v19 flatMap:&__block_literal_global_172];
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    v22 = v7;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = HMFGetLogIdentifier();
      int v27 = 138543362;
      uint64_t v28 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot disassociate face crops because the local zone is not available", (uint8_t *)&v27, 0xCu);
    }
    id v25 = (void *)MEMORY[0x263F58190];
    v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    v20 = [v25 futureWithError:v11];
  }

  return v20;
}

uint64_t __51__HMDPersonManager_disassociateFaceCropsWithUUIDs___block_invoke_3()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

HMDUnassociatedFaceCropModel *__51__HMDPersonManager_disassociateFaceCropsWithUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 createPersonFaceCrop];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 unassociatedFaceCropUUID];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x263F08C38] UUID];
    }
    v8 = v6;

    id v9 = objc_alloc(MEMORY[0x263F0E358]);
    id v10 = [v3 dataRepresentation];
    v11 = [v3 dateCreated];
    [v3 faceBoundingBox];
    uint64_t v12 = objc_msgSend(v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v8, v10, v11);

    id v7 = [[HMDUnassociatedFaceCropModel alloc] initWithFaceCrop:v12];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __51__HMDPersonManager_disassociateFaceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hmbModelID];
}

- (id)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v52 = v14;
    __int16 v53 = 2112;
    id v54 = v8;
    __int16 v55 = 2112;
    id v56 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Associating face crops with UUIDs %@ to person with UUID %@", buf, 0x20u);
  }
  v15 = [(HMDPersonManager *)v12 localZone];
  if (v15)
  {
    v40 = [(HMDPersonManager *)v12 _unassociatedFaceCropsModelsWithUUIDs:v8];
    v41 = objc_msgSend(v40, "na_map:", &__block_literal_global_149_86865);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_2;
    v47[3] = &unk_264A1D7C0;
    id v16 = v9;
    id v48 = v16;
    int64_t v49 = a5;
    v39 = objc_msgSend(v40, "na_map:", v47);
    v42 = [(HMDPersonManager *)v12 _faceCropsModelsWithUUIDs:v8];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_3;
    v44[3] = &unk_264A1D7E8;
    id v45 = v16;
    int64_t v46 = a5;
    v38 = objc_msgSend(v42, "na_map:", v44);
    id v43 = v8;
    v17 = [MEMORY[0x263F49318] optionsWithLabel:@"Associate unassociated face crops"];
    v18 = [v15 addModels:v39 andRemoveModelIDs:v41 options:v17];

    v19 = [MEMORY[0x263F49318] optionsWithLabel:@"Associate face crops"];
    v20 = [v15 updateModels:v38 options:v19];

    id v21 = (void *)MEMORY[0x263F58190];
    v50[0] = v18;
    v50[1] = v20;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
    v23 = [v21 chainFutures:v22];
    id v24 = v9;
    id v25 = (void *)MEMORY[0x263F581B8];
    __int16 v26 = [(HMDPersonManager *)v12 workQueue];
    int v27 = [v25 schedulerWithDispatchQueue:v26];
    [v23 reschedule:v27];
    v29 = uint64_t v28 = v15;
    id v30 = [v29 flatMap:&__block_literal_global_161_86868];

    v15 = v28;
    uint64_t v31 = v40;

    id v9 = v24;
    id v8 = v43;
  }
  else
  {
    v32 = (void *)MEMORY[0x230FBD990]();
    v33 = v12;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v52 = v35;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Cannot associate face crops because the local zone is not available", buf, 0xCu);
    }
    v36 = (void *)MEMORY[0x263F58190];
    uint64_t v31 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    id v30 = [v36 futureWithError:v31];
  }

  return v30;
}

HMDFaceCropModel *__75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 createFaceCrop];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F0E5C8]);
    id v5 = [MEMORY[0x263F08C38] UUID];
    id v6 = [v3 dataRepresentation];
    id v7 = [v3 dateCreated];
    [v3 faceBoundingBox];
    id v8 = objc_msgSend(v4, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v5, v6, v7, *(void *)(a1 + 32));

    id v9 = [v3 UUID];
    [v8 setUnassociatedFaceCropUUID:v9];

    [v8 setSource:*(void *)(a1 + 40)];
    id v10 = [[HMDFaceCropModel alloc] initWithPersonFaceCrop:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

HMDFaceCropModel *__75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HMDFaceCropModel alloc];
  id v5 = [v3 hmbModelID];
  id v6 = [v3 hmbParentModelID];

  id v7 = [(HMBModel *)v4 initWithModelID:v5 parentModelID:v6];
  [(HMDFaceCropModel *)v7 setPersonUUID:*(void *)(a1 + 32)];
  [(HMDFaceCropModel *)v7 setSource:*(void *)(a1 + 40)];
  return v7;
}

uint64_t __75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_4()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

uint64_t __75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hmbModelID];
}

- (id)addOrUpdateFaceprints:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v26 = 138543618;
    int v27 = v9;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding/updating faceprints: %@", (uint8_t *)&v26, 0x16u);
  }
  id v10 = [(HMDPersonManager *)v7 localZone];
  if (v10)
  {
    v11 = objc_msgSend(v4, "na_map:", &__block_literal_global_141);
    uint64_t v12 = [(HMDPersonManager *)v7 localZone];
    v13 = [MEMORY[0x263F49318] optionsWithLabel:@"Add faceprints"];
    v14 = [v12 addModels:v11 options:v13];

    v15 = (void *)MEMORY[0x263F581B8];
    id v16 = [(HMDPersonManager *)v7 workQueue];
    v17 = [v15 schedulerWithDispatchQueue:v16];
    v18 = [v14 reschedule:v17];
    v19 = [v18 flatMap:&__block_literal_global_146];
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v7;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      int v26 = 138543362;
      int v27 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot add/update persons because the local zone is not available", (uint8_t *)&v26, 0xCu);
    }
    id v24 = (void *)MEMORY[0x263F58190];
    v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    v19 = [v24 futureWithError:v11];
  }

  return v19;
}

uint64_t __42__HMDPersonManager_addOrUpdateFaceprints___block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

HMDFaceprintModel *__42__HMDPersonManager_addOrUpdateFaceprints___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HMDFaceprintModel alloc] initWithFaceprint:v2];

  return v3;
}

- (id)faceprintsForFaceCropsWithUUIDs:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  __int16 v28 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v31;
    *(void *)&long long v7 = 138543874;
    long long v25 = v7;
    do
    {
      uint64_t v10 = 0;
      uint64_t v26 = v8;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * v10);
        uint64_t v12 = [(HMDPersonManager *)self localZone];
        uint64_t v13 = objc_opt_class();
        id v29 = 0;
        v14 = [v12 fetchModelsWithParentModelID:v11 ofType:v13 error:&v29];
        id v15 = v29;

        if (v14)
        {
          id v16 = objc_msgSend(v14, "na_map:", &__block_literal_global_138_86889);
          [v28 unionSet:v16];
        }
        else
        {
          uint64_t v17 = v9;
          v18 = (void *)MEMORY[0x230FBD990]();
          v19 = self;
          v20 = self;
          id v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v25;
            v35 = v22;
            __int16 v36 = 2112;
            uint64_t v37 = v11;
            __int16 v38 = 2112;
            id v39 = v15;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch faceprints for face crop with UUID %@: %@", buf, 0x20u);
          }
          uint64_t v9 = v17;
          self = v19;
          uint64_t v8 = v26;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v8);
  }

  v23 = (void *)[v28 copy];
  return v23;
}

uint64_t __52__HMDPersonManager_faceprintsForFaceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 createFaceprint];
}

- (void)enumerateFaceprintsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDPersonManager *)self localZone];
  long long v7 = [v6 queryModelsOfType:objc_opt_class()];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__HMDPersonManager_enumerateFaceprintsUsingBlock___block_invoke;
  v9[3] = &unk_264A1D738;
  id v10 = v4;
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __50__HMDPersonManager_enumerateFaceprintsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 createFaceprint];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v4;
  }
}

- (id)faceCropsForPersonsWithUUIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [MEMORY[0x263EFF9C0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = -[HMDPersonManager faceCropsForPersonWithUUID:](self, "faceCropsForPersonWithUUID:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v6 unionSet:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = (void *)[v6 copy];
  return v13;
}

- (void)enumeratePersonFaceCropsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDPersonManager *)self localZone];
  id v7 = [v6 queryModelsOfType:objc_opt_class()];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__HMDPersonManager_enumeratePersonFaceCropsUsingBlock___block_invoke;
  v9[3] = &unk_264A1D6D0;
  id v10 = v4;
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __55__HMDPersonManager_enumeratePersonFaceCropsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 createPersonFaceCrop];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v4;
  }
}

- (id)faceCropsWithUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDPersonManager *)self _faceCropsModelsWithUUIDs:v4];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_131_86894);

  id v8 = [(HMDPersonManager *)self _unassociatedFaceCropsModelsWithUUIDs:v4];

  uint64_t v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_134);

  id v10 = [v7 setByAddingObjectsFromSet:v9];

  return v10;
}

uint64_t __39__HMDPersonManager_faceCropsWithUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 createFaceCrop];
}

uint64_t __39__HMDPersonManager_faceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 createPersonFaceCrop];
}

- (void)enumerateUnassociatedFaceCropsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDPersonManager *)self localZone];
  id v7 = [v6 queryModelsOfType:objc_opt_class()];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__HMDPersonManager_enumerateUnassociatedFaceCropsUsingBlock___block_invoke;
  v9[3] = &unk_264A1D6A8;
  id v10 = v4;
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __61__HMDPersonManager_enumerateUnassociatedFaceCropsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 createFaceCrop];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v4;
  }
}

- (void)enumerateFaceCropsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDPersonManager *)self localZone];
  id v7 = [v6 queryModelsOfType:objc_opt_class()];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__HMDPersonManager_enumerateFaceCropsUsingBlock___block_invoke;
  v14[3] = &unk_264A1D6A8;
  id v8 = v4;
  id v15 = v8;
  [v7 enumerateObjectsUsingBlock:v14];
  uint64_t v9 = [(HMDPersonManager *)self localZone];
  id v10 = [v9 queryModelsOfType:objc_opt_class()];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__HMDPersonManager_enumerateFaceCropsUsingBlock___block_invoke_2;
  v12[3] = &unk_264A1D6D0;
  id v13 = v8;
  id v11 = v8;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __49__HMDPersonManager_enumerateFaceCropsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 createFaceCrop];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v4;
  }
}

void __49__HMDPersonManager_enumerateFaceCropsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 createPersonFaceCrop];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v4;
  }
}

- (id)personsWithUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __37__HMDPersonManager_personsWithUUIDs___block_invoke;
  v8[3] = &unk_264A1D680;
  v8[4] = self;
  uint64_t v6 = objc_msgSend(v4, "na_map:", v8);

  return v6;
}

uint64_t __37__HMDPersonManager_personsWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) personWithUUID:a2];
}

- (id)performCloudPull
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonManager *)self cloudZone];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F49318]) initWithLabel:@"Explicit cloud pull"];
    id v5 = [v3 performCloudPullWithOptions:v4];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __36__HMDPersonManager_performCloudPull__block_invoke;
    v13[3] = &unk_264A2F3E8;
    v13[4] = self;
    uint64_t v6 = [v5 addFailureBlock:v13];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v15 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform cloud pull because the cloud zone is not available", buf, 0xCu);
    }
    id v11 = (void *)MEMORY[0x263F58190];
    id v4 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    uint64_t v6 = [v11 futureWithError:v4];
  }

  return v6;
}

void __36__HMDPersonManager_performCloudPull__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform cloud pull: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)isCurrentDeviceAvailableResident
{
  id v2 = [(HMDPersonManager *)self zoneManager];
  id v3 = [v2 home];
  id v4 = [v3 residentDeviceManager];
  char v5 = [v4 isCurrentDeviceAvailableResident];

  return v5;
}

- (BOOL)isDataAvailable
{
  id v2 = [(HMDPersonManager *)self localZone];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)coreDataManager:(id)a3 didRemovePersonsWithUUIDs:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v18 = a4;
  char v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(HMDPersonManager *)self dataInterfaces];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v18;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
              if (objc_opt_respondsToSelector()) {
                [v9 handleRemovedPersonWithUUID:v15 mirrorOutputFuture:0];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)coreDataManager:(id)a3 didUpdatePersons:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v18 = a4;
  char v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(HMDPersonManager *)self dataInterfaces];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v18;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
              if (objc_opt_respondsToSelector()) {
                [v9 handleUpdatedPerson:v15 mirrorOutputFuture:0];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)zoneManagerDidStop:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Person zone manager stopped", (uint8_t *)&v10, 0xCu);
  }
  [(HMDPersonManager *)v7 setLocalZone:0];
  [(HMDPersonManager *)v7 setCloudZone:0];
}

- (void)zoneManagerDidStart:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v22 = 138543362;
    long long v23 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Person zone manager started", (uint8_t *)&v22, 0xCu);
  }
  int v10 = [(HMDPersonManager *)v7 zoneManager];
  uint64_t v11 = [v10 localZone];
  [(HMDPersonManager *)v7 setLocalZone:v11];

  uint64_t v12 = [(HMDPersonManager *)v7 localZone];
  [v12 addObserverForAllModels:v7];

  uint64_t v13 = [(HMDPersonManager *)v7 localZone];
  [v13 startUp];

  uint64_t v14 = [(HMDPersonManager *)v7 zoneManager];
  uint64_t v15 = [v14 cloudZone];
  [(HMDPersonManager *)v7 setCloudZone:v15];

  [(HMDPersonManager *)v7 _cleanUpExpiredUnassociatedFaceCrops];
  uint64_t v16 = [(HMDPersonManager *)v7 unassociatedFaceCropsCleanupTimerFactory];
  uint64_t v17 = v16[2](v16, 4, 86400.0);
  [(HMDPersonManager *)v7 setUnassociatedFaceCropsCleanupTimer:v17];

  id v18 = [(HMDPersonManager *)v7 unassociatedFaceCropsCleanupTimer];
  [v18 setDelegate:v7];

  long long v19 = [(HMDPersonManager *)v7 workQueue];
  long long v20 = [(HMDPersonManager *)v7 unassociatedFaceCropsCleanupTimer];
  [v20 setDelegateQueue:v19];

  long long v21 = [(HMDPersonManager *)v7 unassociatedFaceCropsCleanupTimer];
  [v21 resume];
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v4 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDPersonManager *)self workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__HMDPersonManager_localZone_didProcessModelDeletion___block_invoke;
  v9[3] = &unk_264A2F820;
  void v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __54__HMDPersonManager_localZone_didProcessModelDeletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) model];
  BOOL v3 = [*(id *)(a1 + 40) mirrorOutputFuture];
  [v2 _handleDeletedModel:v4 mirrorOutputFuture:v3];
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDPersonManager *)self workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HMDPersonManager_localZone_didProcessModelUpdate___block_invoke;
  v9[3] = &unk_264A2F820;
  void v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __52__HMDPersonManager_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) model];
  BOOL v3 = [*(id *)(a1 + 40) mirrorOutputFuture];
  [v2 _handleCreatedOrUpdatedModel:v4 mirrorOutputFuture:v3];
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDPersonManager *)self workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__HMDPersonManager_localZone_didProcessModelCreation___block_invoke;
  v9[3] = &unk_264A2F820;
  void v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __54__HMDPersonManager_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) model];
  BOOL v3 = [*(id *)(a1 + 40) mirrorOutputFuture];
  [v2 _handleCreatedOrUpdatedModel:v4 mirrorOutputFuture:v3];
}

- (void)handleDataSyncInProgressChangedNotification:(id)a3
{
  id v4 = [(HMDPersonManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HMDPersonManager_handleDataSyncInProgressChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __64__HMDPersonManager_handleDataSyncInProgressChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    [*(id *)(a1 + 32) isDataSyncInProgress];
    uint64_t v6 = HMFBooleanToString();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Data sync in progress changed to %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _notifyDataInterfacesOfCurrentIsDataSyncInProgress];
}

- (void)handleResidentWasRemovedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDPersonManager_handleResidentWasRemovedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDPersonManager_handleResidentWasRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if ([v5 isCurrentDevice])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device was removed as a resident", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) _notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident];
  }
}

- (void)handleResidentWasUpdatedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDPersonManager_handleResidentWasUpdatedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDPersonManager_handleResidentWasUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if ([v5 isCurrentDevice])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device updated its resident device state", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) _notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident];
  }
}

- (void)handleResidentWasAddedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMDPersonManager_handleResidentWasAddedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__HMDPersonManager_handleResidentWasAddedNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if ([v5 isCurrentDevice])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device was added as a resident", (uint8_t *)&v11, 0xCu);
    }
    id v10 = (id)[*(id *)(a1 + 40) performCloudPull];
    [*(id *)(a1 + 40) _notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident];
  }
}

- (void)handleUserPrivilegeDidChangeNotification:(id)a3
{
  id v4 = [(HMDPersonManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__HMDPersonManager_handleUserPrivilegeDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __61__HMDPersonManager_handleUserPrivilegeDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) zoneManager];
  [v1 updateShareParticipants];
}

- (id)_removePersonZones
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing zones for person manager data", buf, 0xCu);
  }
  id v8 = [(HMDPersonManager *)v5 zoneManager];
  uint64_t v9 = [v8 remove];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__HMDPersonManager__removePersonZones__block_invoke;
  v12[3] = &unk_264A2F3E8;
  void v12[4] = v5;
  id v10 = [v9 addFailureBlock:v12];

  return v10;
}

void __38__HMDPersonManager__removePersonZones__block_invoke(uint64_t a1, void *a2)
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
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove person manager zones: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_cleanUpExpiredUnassociatedFaceCrops
{
  v31[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-*MEMORY[0x263F0BB18]];
  v30[0] = @"dateAfter";
  id v5 = [MEMORY[0x263EFF910] distantPast];
  v30[1] = @"dateBefore";
  v31[0] = v5;
  v31[1] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

  id v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[HMDPersonManager fetchBatchLimit](self, "fetchBatchLimit"));
  int v8 = [MEMORY[0x263F49318] optionsWithLabel:@"Remove expired unassociated face crops"];
  [v8 setShouldEnqueueMirrorOutput:0];
  uint64_t v9 = +[HMDUnassociatedFaceCropModel unassociatedFaceCropsBetweenDatesQueryWithIsAscending:1];
  __int16 v10 = [(HMDPersonManager *)self localZone];
  id v11 = [v10 queryModelsUsingQuery:v9 arguments:v6];

  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  int v22 = __56__HMDPersonManager__cleanUpExpiredUnassociatedFaceCrops__block_invoke;
  long long v23 = &unk_264A1D658;
  uint64_t v24 = self;
  id v12 = v7;
  id v25 = v12;
  [v11 enumerateObjectsUsingBlock:&v20];
  if (objc_msgSend(v12, "count", v20, v21, v22, v23, v24))
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v12 count];
      *(_DWORD *)buf = 138543618;
      int v27 = v16;
      __int16 v28 = 2048;
      uint64_t v29 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Removing %lu expired unassociated face crops", buf, 0x16u);
    }
    id v18 = [(HMDPersonManager *)v14 localZone];
    id v19 = (id)[v18 removeModelIDs:v12 options:v8];

    [v12 removeAllObjects];
  }
}

void __56__HMDPersonManager__cleanUpExpiredUnassociatedFaceCrops__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = [v3 debugDescription];
    int v21 = 138543618;
    int v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Removing expired unassociated face crop: %@", (uint8_t *)&v21, 0x16u);
  }
  uint64_t v9 = *(void **)(a1 + 40);
  __int16 v10 = [v3 hmbModelID];
  [v9 addObject:v10];

  unint64_t v11 = [*(id *)(a1 + 40) count];
  if (v11 >= [*(id *)(a1 + 32) fetchBatchLimit])
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = [*(id *)(a1 + 40) count];
      int v21 = 138543618;
      int v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing %lu expired unassociated face crops", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v17 = [*(id *)(a1 + 32) localZone];
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = [MEMORY[0x263F49318] optionsWithLabel:@"Remove expired unassociated face crops"];
    id v20 = (id)[v17 removeModelIDs:v18 options:v19];

    [*(id *)(a1 + 40) removeAllObjects];
  }
}

- (void)_createZones
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating zones for person manager data", (uint8_t *)&v12, 0xCu);
  }
  int v8 = [(HMDPersonManager *)v5 zoneManager];
  uint64_t v9 = [v8 defaultConfiguration];
  __int16 v10 = (void *)[v9 mutableCopy];

  [v10 setShouldCreateZone:1];
  unint64_t v11 = [(HMDPersonManager *)v5 zoneManager];
  [v11 startWithConfiguration:v10];
}

- (void)_notifyDataInterfacesOfCurrentIsDataSyncInProgress
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(HMDPersonManager *)self dataInterfaces];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "handleUpdatedIsDataSyncInProgress:", -[HMDPersonManager isDataSyncInProgress](self, "isDataSyncInProgress"));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(HMDPersonManager *)self dataInterfaces];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "handleUpdatedIsCurrentDeviceAvailableResident:", -[HMDPersonManager isCurrentDeviceAvailableResident](self, "isCurrentDeviceAvailableResident"));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_handleDeletedModel:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v10 = v9;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  v71 = v9;
  if (v11)
  {
    long long v12 = (void *)MEMORY[0x230FBD990]();
    long long v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v95 = v15;
      __int16 v96 = 2112;
      id v97 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling deleted person model: %@", buf, 0x16u);
    }
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v16 = [(HMDPersonManager *)v13 dataInterfaces];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v93 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v87 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            int v22 = [v11 hmbModelID];
            [v21 handleRemovedPersonWithUUID:v22 mirrorOutputFuture:v7];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v86 objects:v93 count:16];
      }
      while (v18);
    }
  }
  else
  {
    id v23 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    id v16 = v24;

    if (v16)
    {
      uint64_t v25 = (void *)MEMORY[0x230FBD990]();
      long long v26 = self;
      int v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        __int16 v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v95 = v28;
        __int16 v96 = 2112;
        id v97 = v16;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Handling deleted face crop model: %@", buf, 0x16u);
      }
      uint64_t v29 = (void *)MEMORY[0x263EFFA08];
      long long v30 = [v16 hmbModelID];
      long long v31 = [v29 setWithObject:v30];
      id v32 = [(HMDPersonManager *)v26 _removeFaceprintsForFaceCropsWithUUIDs:v31];

      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v33 = [(HMDPersonManager *)v26 dataInterfaces];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v82 objects:v92 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v83;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v83 != v36) {
              objc_enumerationMutation(v33);
            }
            __int16 v38 = *(void **)(*((void *)&v82 + 1) + 8 * j);
            if (objc_opt_respondsToSelector())
            {
              id v39 = [v16 hmbModelID];
              [v38 handleRemovedFaceCropWithUUID:v39 mirrorOutputFuture:v7];
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v82 objects:v92 count:16];
        }
        while (v35);
      }
    }
    else
    {
      id v40 = v23;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v41 = v40;
      }
      else {
        uint64_t v41 = 0;
      }
      id v33 = v41;

      if (v33)
      {
        v42 = (void *)MEMORY[0x230FBD990]();
        id v43 = self;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          id v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v95 = v45;
          __int16 v96 = 2112;
          id v97 = v33;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Handling deleted unassociated face crop model: %@", buf, 0x16u);
        }
        int64_t v46 = (void *)MEMORY[0x263EFFA08];
        v47 = [v33 hmbModelID];
        id v48 = [v46 setWithObject:v47];
        id v49 = [(HMDPersonManager *)v43 _removeFaceprintsForFaceCropsWithUUIDs:v48];

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id obj = [(HMDPersonManager *)v43 dataInterfaces];
        uint64_t v50 = [obj countByEnumeratingWithState:&v78 objects:v91 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v79;
          do
          {
            for (uint64_t k = 0; k != v51; ++k)
            {
              if (*(void *)v79 != v52) {
                objc_enumerationMutation(obj);
              }
              id v54 = *(void **)(*((void *)&v78 + 1) + 8 * k);
              if (objc_opt_respondsToSelector())
              {
                __int16 v55 = [v33 hmbModelID];
                [v54 handleRemovedFaceCropWithUUID:v55 mirrorOutputFuture:v7];
              }
            }
            uint64_t v51 = [obj countByEnumeratingWithState:&v78 objects:v91 count:16];
          }
          while (v51);
        }
      }
      else
      {
        id v56 = v40;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v57 = v56;
        }
        else {
          uint64_t v57 = 0;
        }
        id v58 = v57;

        v59 = (void *)MEMORY[0x230FBD990]();
        v60 = self;
        v61 = HMFGetOSLogHandle();
        v62 = v61;
        id obj = v58;
        if (v58)
        {
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            v63 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v95 = v63;
            __int16 v96 = 2112;
            id v97 = v58;
            _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Handling deleted faceprint model: %@", buf, 0x16u);
          }
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v72 = [(HMDPersonManager *)v60 dataInterfaces];
          uint64_t v64 = [v72 countByEnumeratingWithState:&v74 objects:v90 count:16];
          if (v64)
          {
            uint64_t v65 = v64;
            uint64_t v66 = *(void *)v75;
            do
            {
              for (uint64_t m = 0; m != v65; ++m)
              {
                if (*(void *)v75 != v66) {
                  objc_enumerationMutation(v72);
                }
                v68 = *(void **)(*((void *)&v74 + 1) + 8 * m);
                if (objc_opt_respondsToSelector())
                {
                  v69 = [obj hmbModelID];
                  [v68 handleRemovedFaceprintWithUUID:v69 mirrorOutputFuture:v7];
                }
              }
              uint64_t v65 = [v72 countByEnumeratingWithState:&v74 objects:v90 count:16];
            }
            while (v65);
          }
        }
        else
        {
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            v70 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v95 = v70;
            __int16 v96 = 2112;
            id v97 = v56;
            _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Received deletion for unknown model: %@", buf, 0x16u);
          }
          id obj = 0;
        }
      }
    }
  }
}

- (void)_handleCreatedOrUpdatedModel:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v10 = v9;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    long long v12 = (void *)MEMORY[0x230FBD990]();
    long long v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v87 = v15;
      __int16 v88 = 2112;
      id v89 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling new/updated person model: %@", buf, 0x16u);
    }
    id v16 = [v11 createPerson];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v17 = [(HMDPersonManager *)v13 dataInterfaces];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v65 = v11;
      uint64_t v20 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v79 != v20) {
            objc_enumerationMutation(v17);
          }
          int v22 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v22 handleUpdatedPerson:v16 mirrorOutputFuture:v7];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v78 objects:v85 count:16];
      }
      while (v19);
      id v11 = v65;
    }
    goto LABEL_76;
  }
  id v23 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  id v16 = v24;

  if (!v16)
  {
    id v36 = v23;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v37 = v36;
    }
    else {
      uint64_t v37 = 0;
    }
    id v17 = v37;

    if (!v17)
    {
      id v48 = v36;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v49 = v48;
      }
      else {
        id v49 = 0;
      }
      id v30 = v49;

      uint64_t v50 = (void *)MEMORY[0x230FBD990]();
      uint64_t v51 = self;
      uint64_t v52 = HMFGetOSLogHandle();
      __int16 v53 = v52;
      if (v30)
      {
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          id v54 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v87 = v54;
          __int16 v88 = 2112;
          id v89 = v30;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Handling new/updated faceprint model: %@", buf, 0x16u);
        }
        __int16 v55 = [v30 createFaceprint];
        if (v55)
        {
          id v64 = v9;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v56 = [(HMDPersonManager *)v51 dataInterfaces];
          uint64_t v57 = [v56 countByEnumeratingWithState:&v66 objects:v82 count:16];
          if (v57)
          {
            uint64_t v58 = v57;
            uint64_t v59 = *(void *)v67;
            do
            {
              for (uint64_t j = 0; j != v58; ++j)
              {
                if (*(void *)v67 != v59) {
                  objc_enumerationMutation(v56);
                }
                v61 = *(void **)(*((void *)&v66 + 1) + 8 * j);
                if (objc_opt_respondsToSelector()) {
                  [v61 handleUpdatedFaceprint:v55 mirrorOutputFuture:v7];
                }
              }
              uint64_t v58 = [v56 countByEnumeratingWithState:&v66 objects:v82 count:16];
            }
            while (v58);
          }

          id v9 = v64;
          id v11 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v62 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v87 = v62;
          __int16 v88 = 2112;
          id v89 = v48;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Received creation/update for unknown model: %@", buf, 0x16u);
        }
        id v30 = 0;
      }
      id v17 = 0;
      goto LABEL_75;
    }
    __int16 v38 = (void *)MEMORY[0x230FBD990]();
    id v39 = self;
    id v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v87 = v41;
      __int16 v88 = 2112;
      id v89 = v17;
      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Handling new/updated unassociated face crop model: %@", buf, 0x16u);
    }
    id v30 = [v17 createFaceCrop];
    if (!v30) {
      goto LABEL_52;
    }
    id v63 = v9;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v42 = [(HMDPersonManager *)v39 dataInterfaces];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v70 objects:v83 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v71;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v71 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v70 + 1) + 8 * k);
          if (objc_opt_respondsToSelector()) {
            [v47 handleUpdatedUnassociatedFaceCrop:v30 mirrorOutputFuture:v7];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v70 objects:v83 count:16];
      }
      while (v44);
    }

LABEL_51:
    id v9 = v63;
LABEL_52:
    id v11 = 0;
    goto LABEL_75;
  }
  uint64_t v25 = (void *)MEMORY[0x230FBD990]();
  long long v26 = self;
  int v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    __int16 v28 = HMFGetLogIdentifier();
    uint64_t v29 = [v16 hmbModelID];
    *(_DWORD *)buf = 138543618;
    long long v87 = v28;
    __int16 v88 = 2112;
    id v89 = v29;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Handling new/updated face crop model: %@", buf, 0x16u);
  }
  id v17 = [v16 createPersonFaceCrop];
  if (v17)
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v30 = [(HMDPersonManager *)v26 dataInterfaces];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (!v31)
    {
LABEL_75:

      goto LABEL_76;
    }
    uint64_t v32 = v31;
    id v63 = v9;
    uint64_t v33 = *(void *)v75;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v75 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v74 + 1) + 8 * m);
        if (objc_opt_respondsToSelector()) {
          [v35 handleUpdatedPersonFaceCrop:v17 mirrorOutputFuture:v7];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v32);
    goto LABEL_51;
  }
LABEL_76:
}

- (id)_removeFaceprintsForFaceCropsWithUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDPersonManager *)self faceprintsForFaceCropsWithUUIDs:v4];

  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_92);
  uint64_t v8 = [(HMDPersonManager *)self removeFaceprintsWithUUIDs:v7];

  return v8;
}

uint64_t __59__HMDPersonManager__removeFaceprintsForFaceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (id)_faceCropsModelsWithUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __46__HMDPersonManager__faceCropsModelsWithUUIDs___block_invoke;
  v8[3] = &unk_264A1D610;
  v8[4] = self;
  id v6 = objc_msgSend(v4, "na_map:", v8);

  return v6;
}

id __46__HMDPersonManager__faceCropsModelsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) localZone];
  id v12 = 0;
  uint64_t v5 = [v4 fetchModelWithModelID:v3 ofType:objc_opt_class() error:&v12];
  id v6 = v12;

  if (!v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find face crop with UUID %@: %@", buf, 0x20u);
    }
  }

  return v5;
}

- (id)_unassociatedFaceCropsModelsWithUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __58__HMDPersonManager__unassociatedFaceCropsModelsWithUUIDs___block_invoke;
  v8[3] = &unk_264A1D5E8;
  v8[4] = self;
  id v6 = objc_msgSend(v4, "na_map:", v8);

  return v6;
}

id __58__HMDPersonManager__unassociatedFaceCropsModelsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) localZone];
  id v12 = 0;
  uint64_t v5 = [v4 fetchModelWithModelID:v3 ofType:objc_opt_class() error:&v12];
  id v6 = v12;

  if (!v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find unassociated face crop with UUID %@: %@", buf, 0x20u);
    }
  }

  return v5;
}

- (BOOL)isDataSyncInProgress
{
  id v2 = [(HMDPersonManager *)self zoneManager];
  id v3 = [v2 home];
  id v4 = [v3 homeManager];
  char v5 = [v4 isDataSyncInProgress];

  return v5;
}

- (void)_createOrRemoveZonesForSettings:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDPersonManager *)self isDataAvailable]
    || ![v4 requiresPersistentStorage])
  {
    if ([(HMDPersonManager *)self isDataAvailable]
      && ([v4 requiresPersistentStorage] & 1) == 0)
    {
      long long v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        long long v13 = HMFGetLogIdentifier();
        int v15 = 138543362;
        id v16 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Data is available but settings do not require persistent storage; removing zones",
          (uint8_t *)&v15,
          0xCu);
      }
      id v14 = [(HMDPersonManager *)v11 _removePersonZones];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Data is unavailable but settings require persistent storage; creating zones",
        (uint8_t *)&v15,
        0xCu);
    }
    [(HMDPersonManager *)v7 _createZones];
  }
}

- (id)faceCropUUIDsForPersonWithUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDPersonManager *)self localZone];
  if (v5)
  {
    id v6 = [(HMDPersonManager *)self faceCropsForPersonWithUUID:v4];
    id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_87);
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot query face crops because the local zone is not available", (uint8_t *)&v13, 0xCu);
    }
    id v7 = [MEMORY[0x263EFFA08] set];
  }

  return v7;
}

uint64_t __51__HMDPersonManager_faceCropUUIDsForPersonWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (id)removeFaceCropsWithUUIDs:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v20 = 138543618;
    int v21 = v8;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing face crops with UUIDs: %@", (uint8_t *)&v20, 0x16u);
  }
  id v9 = [(HMDPersonManager *)v6 localZone];
  if (v9)
  {
    long long v10 = [MEMORY[0x263F49318] optionsWithLabel:@"Remove face crops"];
    id v11 = [v9 removeModelIDs:v4 options:v10];

    uint64_t v12 = [v11 flatMap:&__block_literal_global_84_86969];
  }
  else
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = v6;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v20 = 138543362;
      int v21 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove face crops because the local zone is not available", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v17 = (void *)MEMORY[0x263F58190];
    id v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    uint64_t v12 = [v17 futureWithError:v11];
  }
  id v18 = (void *)v12;

  return v18;
}

uint64_t __45__HMDPersonManager_removeFaceCropsWithUUIDs___block_invoke()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (id)addOrUpdateFaceCrops:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v20 = 138543618;
    int v21 = v8;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding/updating face crops: %@", (uint8_t *)&v20, 0x16u);
  }
  id v9 = [(HMDPersonManager *)v6 localZone];
  if (v9)
  {
    long long v10 = objc_msgSend(v4, "na_map:", &__block_literal_global_73);
    id v11 = [MEMORY[0x263F49318] optionsWithLabel:@"Add face crops"];
    [v11 setTransactionItemsBatchLimit:5];
    uint64_t v12 = [v9 addModels:v10 options:v11];
    int v13 = [v12 flatMap:&__block_literal_global_79];
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = v6;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v20 = 138543362;
      int v21 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot add/update face crops because the local zone is not available", (uint8_t *)&v20, 0xCu);
    }
    id v18 = (void *)MEMORY[0x263F58190];
    long long v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    int v13 = [v18 futureWithError:v10];
  }

  return v13;
}

uint64_t __41__HMDPersonManager_addOrUpdateFaceCrops___block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

HMDFaceCropModel *__41__HMDPersonManager_addOrUpdateFaceCrops___block_invoke(uint64_t a1, void *a2)
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
  if (v4) {
    char v5 = [[HMDFaceCropModel alloc] initWithPersonFaceCrop:v4];
  }
  else {
    char v5 = [[HMDUnassociatedFaceCropModel alloc] initWithFaceCrop:v2];
  }
  id v6 = v5;

  return v6;
}

- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  long long v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    int v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding/updating persons: %@, removing persons with UUIDs: %@", buf, 0x20u);
  }
  uint64_t v12 = [(HMDPersonManager *)v9 coreDataManager];
  int v13 = [v12 addOrUpdatePersons:v6 andRemovePersonsWithUUIDs:v7];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke;
  v17[3] = &unk_264A1D580;
  v17[4] = v9;
  id v18 = v7;
  id v14 = v7;
  uint64_t v15 = [v13 flatMap:v17];

  return v15;
}

id __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) localZone];
  if (v4)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_61;
    v20[3] = &unk_264A1D558;
    char v5 = *(void **)(a1 + 40);
    v20[4] = *(void *)(a1 + 32);
    id v6 = objc_msgSend(v5, "na_flatMap:", v20);
    id v7 = [MEMORY[0x263F49318] optionsWithLabel:@"Remove face crops for person"];
    id v8 = [v4 removeModelIDs:v6 options:v7];

    id v9 = (void *)MEMORY[0x263F581B8];
    long long v10 = [*(id *)(a1 + 32) workQueue];
    id v11 = [v9 schedulerWithDispatchQueue:v10];
    uint64_t v12 = [v8 reschedule:v11];
    int v13 = [v12 flatMap:&__block_literal_global_70_86984];
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove face crops for persons because the local zone is not available", buf, 0xCu);
    }
    id v18 = (void *)MEMORY[0x263F58190];
    id v6 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    int v13 = [v18 futureWithError:v6];
  }

  return v13;
}

uint64_t __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_61(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) faceCropUUIDsForPersonWithUUID:a2];
}

uint64_t __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (id)removePersonsWithUUIDs:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [(HMDPersonManager *)self addOrUpdatePersons:v6 andRemovePersonsWithUUIDs:v5];

  return v7;
}

- (id)addOrUpdatePersons:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [(HMDPersonManager *)self addOrUpdatePersons:v5 andRemovePersonsWithUUIDs:v6];

  return v7;
}

- (void)enumeratePersonsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self coreDataManager];
  [v5 enumeratePersonsUsingBlock:v4];
}

- (id)addUnassociatedFaceCropWithData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  id v6 = [(HMDPersonManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDPersonManager_addUnassociatedFaceCropWithData___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_async(v6, block);

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __52__HMDPersonManager_addUnassociatedFaceCropWithData___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v22 = v5;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Adding unassociated face crop with data: %@", buf, 0x16u);
  }
  id v7 = objc_alloc(MEMORY[0x263F0E358]);
  id v8 = [MEMORY[0x263F08C38] UUID];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [MEMORY[0x263EFF910] date];
  id v11 = objc_msgSend(v7, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v8, v9, v10, *MEMORY[0x263F0C728], *(double *)(MEMORY[0x263F0C728] + 8), *(double *)(MEMORY[0x263F0C728] + 16), *(double *)(MEMORY[0x263F0C728] + 24));

  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = [MEMORY[0x263EFFA08] setWithObject:v11];
  id v14 = [v12 addOrUpdateFaceCrops:v13];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__HMDPersonManager_addUnassociatedFaceCropWithData___block_invoke_59;
  v19[3] = &unk_264A28FA8;
  id v20 = v11;
  id v15 = v11;
  id v16 = [v14 flatMap:v19];
  uint64_t v17 = [*(id *)(a1 + 48) completionHandlerAdapter];
  id v18 = (id)[v16 addCompletionBlock:v17];
}

uint64_t __52__HMDPersonManager_addUnassociatedFaceCropWithData___block_invoke_59(uint64_t a1)
{
  return [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];
}

- (void)handleFaceMisclassificationForFaceCropData:(id)a3 personUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDPersonManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HMDPersonManager_handleFaceMisclassificationForFaceCropData_personUUID___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __74__HMDPersonManager_handleFaceMisclassificationForFaceCropData_personUUID___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    id v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling face misclassification for face crop data: %@ personUUID: %@", buf, 0x20u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "dataInterfaces", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 handleFaceMisclassificationForFaceCropData:*(void *)(a1 + 40) personUUID:*(void *)(a1 + 48)];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)faceCropsForPersonWithUUID:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  uint64_t v6 = [v4 set];
  uint64_t v19 = @"personUUID";
  v20[0] = v5;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v8 = [(HMDPersonManager *)self localZone];
  uint64_t v9 = +[HMDFaceCropModel faceCropsForPersonUUIDQuery];
  uint64_t v10 = [v8 queryModelsUsingQuery:v9 arguments:v7];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  long long v16 = __47__HMDPersonManager_faceCropsForPersonWithUUID___block_invoke;
  long long v17 = &unk_264A1D530;
  id v18 = v6;
  id v11 = v6;
  [v10 enumerateObjectsUsingBlock:&v14];
  uint64_t v12 = objc_msgSend(v11, "copy", v14, v15, v16, v17);

  return v12;
}

void __47__HMDPersonManager_faceCropsForPersonWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 createPersonFaceCrop];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

- (id)personFaceCropWithUnassociatedFaceCropUUID:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v18 = @"unassociatedFaceCropUUID";
  v19[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  uint64_t v6 = [(HMDPersonManager *)self localZone];
  uint64_t v7 = +[HMDFaceCropModel faceCropsWithUnassociatedFaceCropUUIDQuery];
  id v8 = [v6 queryModelsUsingQuery:v7 arguments:v5];

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__86996;
  long long v16 = __Block_byref_object_dispose__86997;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__HMDPersonManager_personFaceCropWithUnassociatedFaceCropUUID___block_invoke;
  v11[3] = &unk_264A1D508;
  v11[4] = &v12;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __63__HMDPersonManager_personFaceCropWithUnassociatedFaceCropUUID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 createPersonFaceCrop];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

- (id)unassociatedFaceCropWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDPersonManager *)self localZone];
  uint64_t v6 = [v5 fetchModelWithModelID:v4 ofType:objc_opt_class() error:0];

  uint64_t v7 = [v6 createFaceCrop];

  return v7;
}

- (id)personWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDPersonManager *)self coreDataManager];
  uint64_t v6 = [v5 personWithUUID:v4];

  return v6;
}

- (BOOL)sharesFaceClassifications
{
  return 0;
}

- (BOOL)syncsDataToAllUsers
{
  return 0;
}

- (id)removeAllAssociatedDataDueToHomeGraphObjectRemoval:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Asked to remove all person data with isDueToHomeGraphObjectRemoval: %@", buf, 0x16u);
  }
  if (a3)
  {
    id v11 = [(HMDPersonManager *)v7 _removePersonZones];
  }
  else
  {
    uint64_t v12 = [(HMDPersonManager *)v7 coreDataManager];
    id v13 = [v12 removeAllAssociatedData];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __71__HMDPersonManager_removeAllAssociatedDataDueToHomeGraphObjectRemoval___block_invoke;
    v15[3] = &unk_264A28FA8;
    v15[4] = v7;
    id v11 = [v13 flatMap:v15];
  }
  return v11;
}

uint64_t __71__HMDPersonManager_removeAllAssociatedDataDueToHomeGraphObjectRemoval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePersonZones];
}

- (void)configureWithHome:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (!v4) {
    _HMFPreconditionFailure();
  }
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v42 = v9;
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring person manager with home: %@", buf, 0x16u);
  }
  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:v7 selector:sel_handleUserPrivilegeDidChangeNotification_ name:@"HMDUserPrivilegeDidChangeNotification" object:0];

  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = [v4 residentDeviceManager];
  [v11 addObserver:v7 selector:sel_handleResidentWasAddedNotification_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:v12];

  id v13 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v14 = [v4 residentDeviceManager];
  [v13 addObserver:v7 selector:sel_handleResidentWasUpdatedNotification_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v14];

  uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  long long v16 = [v4 residentDeviceManager];
  [v15 addObserver:v7 selector:sel_handleResidentWasRemovedNotification_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:v16];

  id v17 = [MEMORY[0x263F08A00] defaultCenter];
  __int16 v18 = [v4 homeManager];
  [v17 addObserver:v7 selector:sel_handleDataSyncInProgressChangedNotification_ name:@"HMDHomeManagerDataSyncInProgressChangedNotification" object:v18];

  uint64_t v19 = [(HMDPersonManager *)v7 zoneManager];
  uint64_t v20 = [v19 defaultConfiguration];
  __int16 v21 = (void *)[v20 mutableCopy];

  id v22 = objc_alloc_init(MEMORY[0x263F492F8]);
  [v22 setShouldRebuildOnManateeKeyLoss:1];
  [v21 setCloudZoneConfiguration:v22];
  [v21 setShouldCreateZone:0];
  __int16 v23 = [(HMDPersonManager *)v7 zoneManager];
  [v23 setDefaultConfiguration:v21];

  uint64_t v24 = [(HMDPersonManager *)v7 zoneManager];
  [v24 setDelegate:v7];

  uint64_t v25 = [(HMDPersonManager *)v7 zoneManager];
  [v25 setDataSource:v7];

  long long v26 = [(HMDPersonManager *)v7 zoneManager];
  [v26 configure];

  int v27 = [(HMDPersonManager *)v7 zoneManager];
  [v27 start];

  __int16 v28 = [(HMDPersonManager *)v7 coreDataManager];
  [v28 setDelegate:v7];

  uint64_t v29 = [(HMDPersonManager *)v7 coreDataManager];
  [v29 configureWithDataSource:v7];

  id v30 = [(HMDPersonManager *)v7 settings];
  [(HMDPersonManager *)v7 _createOrRemoveZonesForSettings:v30];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v31 = [(HMDPersonManager *)v7 dataInterfaces];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) configureWithDataSource:v7 home:v4];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v33);
  }

  [(HMDPersonManager *)v7 _notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident];
  [(HMDPersonManager *)v7 _notifyDataInterfacesOfCurrentIsDataSyncInProgress];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating %@", buf, 0x16u);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDPersonManager;
  [(HMDPersonManager *)&v7 dealloc];
}

- (HMDPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 coreDataManager:(id)a5 dataInterfaces:(id)a6 workQueue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v14)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v15)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  id v17 = v16;
  if (!v16)
  {
LABEL_13:
    uint64_t v28 = _HMFPreconditionFailure();
    return (HMDPersonManager *)__86__HMDPersonManager_initWithUUID_zoneManager_coreDataManager_dataInterfaces_workQueue___block_invoke(v28);
  }
  v29.receiver = self;
  v29.super_class = (Class)HMDPersonManager;
  __int16 v18 = [(HMDPersonManager *)&v29 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_workQueue, a7);
    uint64_t v20 = [v12 copy];
    UUID = v19->_UUID;
    v19->_UUID = (NSUUID *)v20;

    objc_storeStrong((id *)&v19->_zoneManager, a4);
    objc_storeStrong((id *)&v19->_dataInterfaces, a6);
    objc_storeStrong((id *)&v19->_coreDataManager, a5);
    id v22 = NSString;
    __int16 v23 = [v13 zoneName];
    uint64_t v24 = [v22 stringWithFormat:@"%@/%@", v12, v23];
    logIdentifier = v19->_logIdentifier;
    v19->_logIdentifier = (NSString *)v24;

    v19->_fetchBatchLimit = 100;
    id unassociatedFaceCropsCleanupTimerFactory = v19->_unassociatedFaceCropsCleanupTimerFactory;
    v19->_id unassociatedFaceCropsCleanupTimerFactory = &__block_literal_global_87021;
  }
  return v19;
}

id __86__HMDPersonManager_initWithUUID_zoneManager_coreDataManager_dataInterfaces_workQueue___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t64 != -1) {
    dispatch_once(&logCategory__hmf_once_t64, &__block_literal_global_181);
  }
  id v2 = (void *)logCategory__hmf_once_v65;
  return v2;
}

void __31__HMDPersonManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v65;
  logCategory__hmf_once_id v65 = v0;
}

+ (id)zoneNameForZoneUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  objc_super v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end