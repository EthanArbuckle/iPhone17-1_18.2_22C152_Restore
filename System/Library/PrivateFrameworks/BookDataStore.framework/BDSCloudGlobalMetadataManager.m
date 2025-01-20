@interface BDSCloudGlobalMetadataManager
+ (id)sharedManager;
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCloudChangeTokenController)changeTokenController;
- (BCCloudDataManager)dataManager;
- (BCCloudDataSource)globalMetadataDataSource;
- (BCCloudDataSyncManager)syncManager;
- (BDSCloudGlobalMetadataManager)init;
- (BDSCloudGlobalMetadataManager)initWithCloudDataSource:(id)a3;
- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager;
- (BOOL)enableCloudSync;
- (NSManagedObjectModel)objectModel;
- (NSMutableDictionary)conflictResolvers;
- (id)entityName;
- (void)currentCloudSyncVersions:(id)a3;
- (void)deleteMetadatumForKey:(id)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)fetchMetadataIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)getMetadataChangesSince:(id)a3 completion:(id)a4;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)metadataValueForKey:(id)a3 completion:(id)a4;
- (void)metadatumForKey:(id)a3 completion:(id)a4;
- (void)metadatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5;
- (void)removeConflictResolverForKey:(id)a3;
- (void)removeMetadataForSaltedHashedRecordIDs:(id)a3 completion:(id)a4;
- (void)resolvedMetadataValueForKey:(id)a3 completion:(id)a4;
- (void)setChangeTokenController:(id)a3;
- (void)setConflictResolver:(id)a3 forKey:(id)a4;
- (void)setConflictResolvers:(id)a3;
- (void)setDataManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setGlobalMetadataDataSource:(id)a3;
- (void)setMetadata:(id)a3 completion:(id)a4;
- (void)setMetadataValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setMetadatum:(id)a3 completion:(id)a4;
- (void)setObjectModel:(id)a3;
- (void)setSaltVersionIdentifierManager:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 fetchedAllRecordsInZone:(id)a4;
- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4;
@end

@implementation BDSCloudGlobalMetadataManager

+ (id)sharedManager
{
  if (qword_26AD77648 != -1) {
    dispatch_once(&qword_26AD77648, &unk_26E971BF0);
  }
  v2 = (void *)qword_26AD77640;
  return v2;
}

- (BDSCloudGlobalMetadataManager)init
{
  v3 = [BCCloudDataSource alloc];
  v11 = objc_msgSend_objectModel(self, v4, v5, v6, v7, v8, v9, v10);
  v17 = objc_msgSend_initWithManagedObjectModel_nameOnDisk_(v3, v12, (uint64_t)v11, @"BCCloudGlobalMetadata", v13, v14, v15, v16);

  v24 = (BDSCloudGlobalMetadataManager *)objc_msgSend_initWithCloudDataSource_(self, v18, (uint64_t)v17, v19, v20, v21, v22, v23);
  return v24;
}

- (BDSCloudGlobalMetadataManager)initWithCloudDataSource:(id)a3
{
  id v5 = a3;
  v85.receiver = self;
  v85.super_class = (Class)BDSCloudGlobalMetadataManager;
  uint64_t v6 = [(BDSCloudGlobalMetadataManager *)&v85 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_globalMetadataDataSource, a3);
    uint64_t v15 = objc_msgSend_sharedInstance(BCCloudKitController, v8, v9, v10, v11, v12, v13, v14);
    uint64_t v16 = [BCCloudDataSyncManager alloc];
    uint64_t v23 = objc_msgSend_initWithCloudKitController_(v16, v17, (uint64_t)v15, v18, v19, v20, v21, v22);
    syncManager = v7->_syncManager;
    v7->_syncManager = (BCCloudDataSyncManager *)v23;

    objc_msgSend_setDelegate_(v7->_syncManager, v25, (uint64_t)v7, v26, v27, v28, v29, v30);
    v31 = [BCCloudChangeTokenController alloc];
    v39 = objc_msgSend_managedObjectContext(v5, v32, v33, v34, v35, v36, v37, v38);
    v47 = objc_msgSend_sharedInstance(BCCloudKitController, v40, v41, v42, v43, v44, v45, v46);
    uint64_t v52 = objc_msgSend_initWithMOC_zoneName_cloudKitController_(v31, v48, (uint64_t)v39, @"GlobalMetadata", (uint64_t)v47, v49, v50, v51);
    changeTokenController = v7->_changeTokenController;
    v7->_changeTokenController = (BCCloudChangeTokenController *)v52;

    v54 = [BCCloudDataManager alloc];
    v62 = objc_msgSend_entityName(v7, v55, v56, v57, v58, v59, v60, v61);
    uint64_t v63 = objc_opt_class();
    uint64_t v64 = objc_opt_class();
    uint64_t v66 = objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_(v54, v65, (uint64_t)v5, (uint64_t)v62, @"BDSCloudGlobalMetadataManagerChanged", v63, v64, (uint64_t)v7->_syncManager, v15);
    dataManager = v7->_dataManager;
    v7->_dataManager = (BCCloudDataManager *)v66;

    v68 = [BDSSaltVersionIdentifierManager alloc];
    uint64_t v69 = (uint64_t)v7->_changeTokenController;
    v77 = objc_msgSend_privateCloudDatabaseController(v15, v70, v71, v72, v73, v74, v75, v76);
    uint64_t v82 = objc_msgSend_initWithZoneDataManager_tokenController_databaseController_(v68, v78, (uint64_t)v7, v69, (uint64_t)v77, v79, v80, v81);
    saltVersionIdentifierManager = v7->_saltVersionIdentifierManager;
    v7->_saltVersionIdentifierManager = (BDSSaltVersionIdentifierManager *)v82;
  }
  return v7;
}

- (NSManagedObjectModel)objectModel
{
  objectModel = self->_objectModel;
  if (!objectModel)
  {
    v4 = (void *)MEMORY[0x263F086E0];
    uint64_t v5 = objc_opt_class();
    uint64_t v12 = objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8, v9, v10, v11);
    uint64_t v18 = objc_msgSend_pathForResource_ofType_(v12, v13, @"BCCloudGlobalMetadata", @"momd", v14, v15, v16, v17);

    v24 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v19, (uint64_t)v18, 1, v20, v21, v22, v23);
    id v25 = objc_alloc(MEMORY[0x263EFF298]);
    v32 = (NSManagedObjectModel *)objc_msgSend_initWithContentsOfURL_(v25, v26, (uint64_t)v24, v27, v28, v29, v30, v31);
    uint64_t v33 = self->_objectModel;
    self->_objectModel = v32;

    objectModel = self->_objectModel;
  }
  return objectModel;
}

- (void)setConflictResolver:(id)a3 forKey:(id)a4
{
  id v51 = a3;
  id v6 = a4;
  if ((objc_msgSend_enableCloudSync(self, v7, v8, v9, v10, v11, v12, v13) & 1) == 0)
  {
    uint64_t v21 = objc_msgSend_conflictResolvers(self, v14, v15, v16, v17, v18, v19, v20);

    if (!v21)
    {
      uint64_t v29 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v22, v23, v24, v25, v26, v27, v28);
      objc_msgSend_setConflictResolvers_(self, v30, (uint64_t)v29, v31, v32, v33, v34, v35);
    }
    if (v51)
    {
      uint64_t v36 = objc_msgSend_copy(v51, v22, v23, v24, v25, v26, v27, v28);
      uint64_t v37 = _Block_copy(v36);
      uint64_t v45 = objc_msgSend_conflictResolvers(self, v38, v39, v40, v41, v42, v43, v44);
      objc_msgSend_setObject_forKeyedSubscript_(v45, v46, (uint64_t)v37, (uint64_t)v6, v47, v48, v49, v50);
    }
  }
}

- (void)removeConflictResolverForKey:(id)a3
{
  id v24 = a3;
  if ((objc_msgSend_enableCloudSync(self, v4, v5, v6, v7, v8, v9, v10) & 1) == 0)
  {
    uint64_t v18 = objc_msgSend_conflictResolvers(self, v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v18, v19, 0, (uint64_t)v24, v20, v21, v22, v23);
  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  objc_msgSend_dataManager(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hasSaltChangedWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_dataManager(self, v5, v6, v7, v8, v9, v10, v11);
  changeTokenController = self->_changeTokenController;
  v25[0] = v12;
  v25[1] = changeTokenController;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v25, 2, v15, v16, v17, v18);
  objc_msgSend_bds_chainSuccessAndErrorCompletionSelectorCallsForSelector_completion_(v19, v20, (uint64_t)sel_dissociateCloudDataFromSyncWithCompletion_, (uint64_t)v4, v21, v22, v23, v24);
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  objc_msgSend_deleteCloudDataWithCompletion_(BCCloudDataSource, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  if (objc_msgSend_enableCloudSync(self, v7, v8, v9, v10, v11, v12, v13))
  {
    uint64_t v21 = objc_msgSend_dataManager(self, v14, v15, v16, v17, v18, v19, v20);
    objc_msgSend_startSyncToCKWithSyncManager_completion_(v21, v22, (uint64_t)v28, (uint64_t)v6, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v27 = _Block_copy(v6);
    uint64_t v21 = v27;
    if (v27) {
      (*((void (**)(void *))v27 + 2))(v27);
    }
  }
}

- (void)signalSyncToCKForSyncManager:(id)a3
{
  if (objc_msgSend_enableCloudSync(self, a2, (uint64_t)a3, v3, v4, v5, v6, v7))
  {
    objc_msgSend_sharedInstance(BCCloudKitController, v9, v10, v11, v12, v13, v14, v15);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_transactionManager(v45, v16, v17, v18, v19, v20, v21, v22);
    uint64_t v31 = objc_msgSend_entityName(self, v24, v25, v26, v27, v28, v29, v30);
    uint64_t v39 = objc_msgSend_syncManager(self, v32, v33, v34, v35, v36, v37, v38);
    objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v23, v40, (uint64_t)v31, (uint64_t)v39, v41, v42, v43, v44);
  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12, v13, v14, v15))
  {
    uint64_t v23 = (void *)MEMORY[0x263EFF980];
    uint64_t v24 = objc_msgSend_count(v7, v16, v17, v18, v19, v20, v21, v22);
    uint64_t v31 = objc_msgSend_arrayWithCapacity_(v23, v25, v24, v26, v27, v28, v29, v30);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v32 = v7;
    uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v62, (uint64_t)v66, 16, v34, v35, v36);
    if (v37)
    {
      uint64_t v45 = v37;
      uint64_t v46 = *(void *)v63;
      do
      {
        uint64_t v47 = 0;
        do
        {
          if (*(void *)v63 != v46) {
            objc_enumerationMutation(v32);
          }
          uint64_t v48 = objc_msgSend_recordName(*(void **)(*((void *)&v62 + 1) + 8 * v47), v38, v39, v40, v41, v42, v43, v44, (void)v62);
          objc_msgSend_addObject_(v31, v49, (uint64_t)v48, v50, v51, v52, v53, v54);

          ++v47;
        }
        while (v45 != v47);
        uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v38, (uint64_t)&v62, (uint64_t)v66, 16, v42, v43, v44);
      }
      while (v45);
    }

    objc_msgSend_removeMetadataForSaltedHashedRecordIDs_completion_(self, v55, (uint64_t)v31, (uint64_t)v8, v56, v57, v58, v59);
  }
  else
  {
    uint64_t v60 = _Block_copy(v8);
    uint64_t v61 = v60;
    if (v60) {
      (*((void (**)(void *, void, void))v60 + 2))(v60, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 fetchedAllRecordsInZone:(id)a4
{
  id v31 = a4;
  if (objc_msgSend_enableCloudSync(self, v5, v6, v7, v8, v9, v10, v11)
    && objc_msgSend_isEqualToString_(v31, v12, @"GlobalMetadata", v13, v14, v15, v16, v17))
  {
    uint64_t v25 = objc_msgSend_defaultCenter(MEMORY[0x263F087C8], v18, v19, v20, v21, v22, v23, v24);
    objc_msgSend_postNotificationName_object_(v25, v26, @"BDSCloudGlobalMetadataManagerFetchedRecordsChanged", 0, v27, v28, v29, v30);
  }
}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12, v13, v14, v15))
  {
    uint64_t v23 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v24 = objc_msgSend_count(v7, v16, v17, v18, v19, v20, v21, v22);
    id v31 = objc_msgSend_dictionaryWithCapacity_(v23, v25, v24, v26, v27, v28, v29, v30);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v32 = v7;
    uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v62, (uint64_t)v66, 16, v34, v35, v36);
    if (v37)
    {
      uint64_t v45 = v37;
      uint64_t v46 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v63 != v46) {
            objc_enumerationMutation(v32);
          }
          uint64_t v48 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v49 = objc_msgSend_key(v48, v38, v39, v40, v41, v42, v43, v44, (void)v62);
          objc_msgSend_setObject_forKey_(v31, v50, (uint64_t)v48, (uint64_t)v49, v51, v52, v53, v54);
        }
        uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v38, (uint64_t)&v62, (uint64_t)v66, 16, v42, v43, v44);
      }
      while (v45);
    }

    objc_msgSend_updateSyncGenerationFromCloudData_completion_(self, v55, (uint64_t)v31, (uint64_t)v8, v56, v57, v58, v59);
  }
  else
  {
    uint64_t v60 = _Block_copy(v8);
    uint64_t v61 = v60;
    if (v60) {
      (*((void (**)(void *, void, void))v60 + 2))(v60, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12, v13, v14, v15))
  {
    uint64_t v23 = objc_msgSend_dataManager(self, v16, v17, v18, v19, v20, v21, v22);
    id v31 = objc_msgSend_conflictResolvers(self, v24, v25, v26, v27, v28, v29, v30);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = sub_2360EA084;
    v38[3] = &unk_264CA11F8;
    id v39 = v8;
    objc_msgSend_resolveConflictsForRecords_withResolvers_completion_(v23, v32, (uint64_t)v7, (uint64_t)v31, (uint64_t)v38, v33, v34, v35);
  }
  else
  {
    uint64_t v36 = _Block_copy(v8);
    uint64_t v37 = v36;
    if (v36) {
      (*((void (**)(void *, void, void))v36 + 2))(v36, 0, 0);
    }
  }
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12, v13, v14, v15))
  {
    uint64_t v23 = objc_msgSend_dataManager(self, v16, v17, v18, v19, v20, v21, v22);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_2360EA1F8;
    v31[3] = &unk_264CA1220;
    id v32 = v8;
    objc_msgSend_failedRecordIDs_completion_(v23, v24, (uint64_t)v7, (uint64_t)v31, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v29 = _Block_copy(v8);
    uint64_t v30 = v29;
    if (v29) {
      (*((void (**)(void *, void, void))v29 + 2))(v29, 0, 0);
    }
  }
}

- (id)entityName
{
  return @"BCGlobalMetadatum";
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v8 = a3;
  uint64_t v95 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend_shared(MEMORY[0x263F2BA58], a2, a3, v3, v4, v5, v6, v7);
  int v18 = objc_msgSend_verboseLoggingEnabled(v10, v11, v12, v13, v14, v15, v16, v17);

  if (v18)
  {
    uint64_t v26 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = @"NO";
      if (v8) {
        uint64_t v27 = @"YES";
      }
      int v93 = 138412290;
      v94 = v27;
      _os_log_impl(&dword_2360BC000, v26, OS_LOG_TYPE_DEFAULT, "\"\\\"BDSCloudGlobalMetadataManager #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v93, 0xCu);
    }
  }
  if (self->_enableCloudSync != v8)
  {
    self->_enableCloudSync = v8;
    uint64_t v28 = objc_msgSend_changeTokenController(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setEnableCloudSync_(v28, v29, v8, v30, v31, v32, v33, v34);

    uint64_t v42 = objc_msgSend_sharedInstance(BCCloudKitController, v35, v36, v37, v38, v39, v40, v41);
    uint64_t v50 = objc_msgSend_privateCloudDatabaseController(v42, v43, v44, v45, v46, v47, v48, v49);
    uint64_t v56 = v50;
    syncManager = self->_syncManager;
    if (v8)
    {
      objc_msgSend_addObserver_recordType_(v50, v51, (uint64_t)syncManager, @"globalMetadata", v52, v53, v54, v55);

      uint64_t v42 = objc_msgSend_sharedInstance(BCCloudKitController, v58, v59, v60, v61, v62, v63, v64);
      uint64_t v56 = objc_msgSend_transactionManager(v42, v65, v66, v67, v68, v69, v70, v71);
      uint64_t v79 = objc_msgSend_entityName(self, v72, v73, v74, v75, v76, v77, v78);
      v87 = objc_msgSend_syncManager(self, v80, v81, v82, v83, v84, v85, v86);
      objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v56, v88, (uint64_t)v79, (uint64_t)v87, v89, v90, v91, v92);
    }
    else
    {
      objc_msgSend_removeObserver_recordType_(v50, v51, (uint64_t)syncManager, @"globalMetadata", v52, v53, v54, v55);
    }
  }
}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4 = a3;
  objc_msgSend_dataManager(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentCloudSyncVersions_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)setMetadatum:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11, v12, v13, v14);
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (void *)MEMORY[0x263F08A98];
  uint64_t v23 = objc_msgSend_key(v7, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v30 = objc_msgSend_predicateWithFormat_(v15, v24, @"key = %@", v25, v26, v27, v28, v29, v23);
  objc_msgSend_setCloudData_predicate_completion_(v35, v31, (uint64_t)v7, (uint64_t)v30, (uint64_t)v6, v32, v33, v34);
}

- (void)setMetadata:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11, v12, v13, v14);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (void *)MEMORY[0x263F08A98];
  uint64_t v23 = objc_msgSend_allKeys(v7, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v30 = objc_msgSend_predicateWithFormat_(v15, v24, @"key IN %@", v25, v26, v27, v28, v29, v23);
  objc_msgSend_setCloudData_predicate_propertyIDKey_completion_(v34, v31, (uint64_t)v7, (uint64_t)v30, @"key", (uint64_t)v6, v32, v33);
}

- (void)removeMetadataForSaltedHashedRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_count(v6, v8, v9, v10, v11, v12, v13, v14))
  {
    objc_msgSend_dataManager(self, v15, v16, v17, v18, v19, v20, v21);
    uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v29 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v23, @"saltedHashedID IN %@", v24, v25, v26, v27, v28, v6);
    objc_msgSend_removeCloudDataForPredicate_completion_(v22, v30, (uint64_t)v29, (uint64_t)v7, v31, v32, v33, v34);
  }
  else
  {
    id v35 = BDSCloudKitLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_2361F9C0C(v35);
    }

    uint64_t v22 = (void (**)(void, void, void))_Block_copy(v7);
    if (v22)
    {
      uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v36, @"BDSErrorDomain", 1003, 0, v37, v38, v39);
      ((void (**)(void, void, void *))v22)[2](v22, 0, v40);
    }
  }
}

- (void)updateSyncGenerationFromCloudData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11, v12, v13, v14);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (void *)MEMORY[0x263F08A98];
  uint64_t v23 = objc_msgSend_allKeys(v7, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v30 = objc_msgSend_predicateWithFormat_(v15, v24, @"key IN %@", v25, v26, v27, v28, v29, v23);
  objc_msgSend_updateSyncGenerationFromCloudData_predicate_propertyIDKey_completion_(v34, v31, (uint64_t)v7, (uint64_t)v30, @"key", (uint64_t)v6, v32, v33);
}

- (void)deleteMetadatumForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11, v12, v13, v14);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v15, @"key = %@", v16, v17, v18, v19, v20, v7);

  objc_msgSend_deleteCloudDataForPredicate_completion_(v27, v22, (uint64_t)v21, (uint64_t)v6, v23, v24, v25, v26);
}

- (void)metadatumForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v15 = objc_msgSend_dataManager(self, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v22 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v16, @"key = %@  AND (deletedFlag == NULL OR deletedFlag == NO)", v17, v18, v19, v20, v21, v7);

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_2360EA9A4;
  v28[3] = &unk_264CA14F8;
  id v29 = v6;
  id v23 = v6;
  objc_msgSend_cloudDataWithPredicate_sortDescriptors_completion_(v15, v24, (uint64_t)v22, 0, (uint64_t)v28, v25, v26, v27);
}

- (void)metadatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v16 = a4;
  if (v6)
  {
    uint64_t v17 = objc_msgSend_dataManager(self, v9, v10, v11, v12, v13, v14, v15);
    uint64_t v24 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v18, @"key = %@", v19, v20, v21, v22, v23, v16);

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_2360EAB54;
    v29[3] = &unk_264CA14F8;
    id v30 = v8;
    objc_msgSend_cloudDataWithPredicate_sortDescriptors_completion_(v17, v25, (uint64_t)v24, 0, (uint64_t)v29, v26, v27, v28);

    id v16 = v30;
  }
  else
  {
    objc_msgSend_metadatumForKey_completion_(self, v9, (uint64_t)v16, (uint64_t)v8, v12, v13, v14, v15);
  }
}

- (void)fetchMetadataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_msgSend_dataManager(self, v7, v8, v9, v10, v11, v12, v13);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchCloudDataIncludingDeleted_completion_(v19, v14, v4, (uint64_t)v6, v15, v16, v17, v18);
}

- (void)getMetadataChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_opt_class();
  objc_msgSend_getChangesSince_forEntityClass_completion_(v20, v16, (uint64_t)v7, v15, (uint64_t)v6, v17, v18, v19);
}

- (void)resolvedMetadataValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [BCMutableGlobalMetadatum alloc];
  uint64_t v15 = objc_msgSend_initWithKey_(v8, v9, (uint64_t)v7, v10, v11, v12, v13, v14);
  uint64_t v23 = objc_msgSend_dataManager(self, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v31 = objc_msgSend_conflictResolvers(self, v24, v25, v26, v27, v28, v29, v30);
  uint64_t v38 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v32, @"key = %@", v33, v34, v35, v36, v37, v7);

  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_2360EAE30;
  v43[3] = &unk_264CA14F8;
  id v44 = v6;
  id v39 = v6;
  objc_msgSend_resolvedCloudDataForCloudData_withResolvers_predicate_completion_(v23, v40, (uint64_t)v15, (uint64_t)v31, (uint64_t)v38, (uint64_t)v43, v41, v42);
}

- (void)metadataValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2360EAF94;
  v13[3] = &unk_264CA1520;
  id v14 = v6;
  id v7 = v6;
  objc_msgSend_metadatumForKey_completion_(self, v8, (uint64_t)a3, (uint64_t)v13, v9, v10, v11, v12);
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2360EB114;
  v19[3] = &unk_264CA1548;
  id v20 = v9;
  id v21 = v8;
  uint64_t v22 = self;
  id v23 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  objc_msgSend_metadatumForKey_completion_(self, v14, (uint64_t)v13, (uint64_t)v19, v15, v16, v17, v18);
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (BCCloudDataSource)globalMetadataDataSource
{
  return self->_globalMetadataDataSource;
}

- (void)setGlobalMetadataDataSource:(id)a3
{
}

- (BCCloudDataSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)setDataManager:(id)a3
{
}

- (void)setObjectModel:(id)a3
{
}

- (BCCloudChangeTokenController)changeTokenController
{
  return self->_changeTokenController;
}

- (void)setChangeTokenController:(id)a3
{
}

- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager
{
  return self->_saltVersionIdentifierManager;
}

- (void)setSaltVersionIdentifierManager:(id)a3
{
}

- (NSMutableDictionary)conflictResolvers
{
  return self->_conflictResolvers;
}

- (void)setConflictResolvers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictResolvers, 0);
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_globalMetadataDataSource, 0);
}

@end