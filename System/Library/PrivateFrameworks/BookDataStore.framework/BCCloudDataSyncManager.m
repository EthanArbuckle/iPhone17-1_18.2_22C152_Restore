@interface BCCloudDataSyncManager
- (BCCloudDataMapper)dataMapper;
- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3;
- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3 dataMapper:(id)a4;
- (BCCloudDataSyncManagerDelegate)delegate;
- (BCCloudKitController)cloudKitController;
- (BOOL)processingCloudData;
- (BOOL)serverPushPostponed;
- (OS_dispatch_queue)syncQueue;
- (double)backOffInterval;
- (id)_batchFromCloudData:(id)a3;
- (id)_modifyRecordsCompletionBlockWithDispatchGroup:(id)a3 cloudDataMap:(id)a4 recordCount:(unint64_t)a5 operation:(id)a6;
- (id)privacyDelegate;
- (unint64_t)_maxCloudDataPerBatch;
- (unint64_t)tooBigBatch;
- (void)_enterDispatchGroup:(id)a3 times:(unint64_t)a4;
- (void)_fromBatch:(id)a3 getRecordsToSave:(id *)a4 recordIDsToDelete:(id *)a5 buildingMap:(id *)a6;
- (void)_leaveDispatchGroup:(id)a3 times:(unint64_t)a4;
- (void)_syncQueueSyncForCloudData:(id)a3 completion:(id)a4;
- (void)_updateRetryParametersFromModifyRecordsOperationError:(id)a3 batchSize:(unint64_t)a4;
- (void)databaseController:(id)a3 attachmentChanged:(BOOL)a4;
- (void)databaseController:(id)a3 fetchedAllRecordsInZone:(id)a4;
- (void)databaseController:(id)a3 reachabilityChanged:(BOOL)a4;
- (void)databaseController:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)databaseController:(id)a3 recordsChanged:(id)a4;
- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4;
- (void)setBackOffInterval:(double)a3;
- (void)setCloudKitController:(id)a3;
- (void)setDataMapper:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProcessingCloudData:(BOOL)a3;
- (void)setServerPushPostponed:(BOOL)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTooBigBatch:(unint64_t)a3;
- (void)signalSyncToCK;
- (void)startSyncToCKWithCompletion:(id)a3;
- (void)syncCloudData:(id)a3 completion:(id)a4;
@end

@implementation BCCloudDataSyncManager

- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3
{
  return (BCCloudDataSyncManager *)((uint64_t (*)(BCCloudDataSyncManager *, char *, id, void))MEMORY[0x270F9A6D0])(self, sel_initWithCloudKitController_dataMapper_, a3, 0);
}

- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3 dataMapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCCloudDataSyncManager;
  v9 = [(BCCloudDataSyncManager *)&v15 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iBooks.CloudDataSyncManager", v11);
    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_cloudKitController, a3);
    objc_storeStrong((id *)&v9->_dataMapper, a4);
    v9->_tooBigBatch = 400;
  }
  return v9;
}

- (void)syncCloudData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_super v15 = objc_msgSend_cloudKitController(self, v8, v9, v10, v11, v12, v13, v14);
  v23 = objc_msgSend_privateCloudDatabaseController(v15, v16, v17, v18, v19, v20, v21, v22);

  if (v23)
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2361063AC;
    v32[3] = &unk_264CA20A0;
    v32[4] = self;
    objc_copyWeak(&v35, &location);
    id v33 = v6;
    id v34 = v7;
    objc_msgSend_getAttached_(v23, v24, (uint64_t)v32, v25, v26, v27, v28, v29);

    objc_destroyWeak(&v35);
  }
  else
  {
    v30 = _Block_copy(v7);
    v31 = v30;
    if (v30) {
      (*((void (**)(void *))v30 + 2))(v30);
    }
  }
  objc_destroyWeak(&location);
}

- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  uint64_t v14 = objc_msgSend_cloudKitController(self, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v22 = objc_msgSend_privateCloudDatabaseController(v14, v15, v16, v17, v18, v19, v20, v21);

  if (v22)
  {
    objc_msgSend_fetchRecordForRecordID_completion_(v22, v23, (uint64_t)v29, (uint64_t)v6, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v28 = (void (**)(void *, void))_Block_copy(v6);

    if (v28) {
      v28[2](v28, 0);
    }
    id v6 = v28;
  }
}

- (void)databaseController:(id)a3 attachmentChanged:(BOOL)a4
{
  if (a4)
  {
    objc_msgSend_cloudKitController(self, a2, (uint64_t)a3, a4, v4, v5, v6, v7);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_transactionManager(v38, v9, v10, v11, v12, v13, v14, v15);
    uint64_t v24 = objc_msgSend_delegate(self, v17, v18, v19, v20, v21, v22, v23);
    v32 = objc_msgSend_entityName(v24, v25, v26, v27, v28, v29, v30, v31);
    objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v16, v33, (uint64_t)v32, (uint64_t)self, v34, v35, v36, v37);
  }
}

- (void)databaseController:(id)a3 reachabilityChanged:(BOOL)a4
{
  if (a4)
  {
    objc_msgSend_cloudKitController(self, a2, (uint64_t)a3, a4, v4, v5, v6, v7);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_transactionManager(v38, v9, v10, v11, v12, v13, v14, v15);
    uint64_t v24 = objc_msgSend_delegate(self, v17, v18, v19, v20, v21, v22, v23);
    v32 = objc_msgSend_entityName(v24, v25, v26, v27, v28, v29, v30, v31);
    objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v16, v33, (uint64_t)v32, (uint64_t)self, v34, v35, v36, v37);
  }
}

- (void)databaseController:(id)a3 recordsChanged:(id)a4
{
  id v5 = a4;
  uint64_t v13 = objc_msgSend_delegate(self, v6, v7, v8, v9, v10, v11, v12);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_236106888;
  v18[3] = &unk_264CA2008;
  v18[4] = self;
  objc_msgSend_syncManager_resolveConflictsForRecords_completion_(v13, v14, (uint64_t)self, (uint64_t)v5, (uint64_t)v18, v15, v16, v17);
}

- (void)databaseController:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v14 = objc_msgSend_delegate(self, v7, v8, v9, v10, v11, v12, v13);
  v25[0] = v6;
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v15, (uint64_t)v25, 1, v16, v17, v18, v19);

  objc_msgSend_syncManager_removeCloudDataForIDs_completion_(v14, v21, (uint64_t)self, (uint64_t)v20, (uint64_t)&unk_26E971E30, v22, v23, v24);
}

- (void)databaseController:(id)a3 fetchedAllRecordsInZone:(id)a4
{
  id v27 = a4;
  uint64_t v12 = objc_msgSend_delegate(self, v5, v6, v7, v8, v9, v10, v11);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v21 = objc_msgSend_delegate(self, v14, v15, v16, v17, v18, v19, v20);
    objc_msgSend_syncManager_fetchedAllRecordsInZone_(v21, v22, (uint64_t)self, (uint64_t)v27, v23, v24, v25, v26);
  }
}

- (id)privacyDelegate
{
  uint64_t v8 = objc_msgSend_cloudKitController(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_privateCloudDatabaseController(v8, v9, v10, v11, v12, v13, v14, v15);

  return v16;
}

- (void)startSyncToCKWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_syncQueue(self, v5, v6, v7, v8, v9, v10, v11);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_236106BF4;
  v14[3] = &unk_264CA17F0;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, v14);
}

- (void)signalSyncToCK
{
  objc_msgSend_delegate(self, a2, v2, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalSyncToCKForSyncManager_(v15, v9, (uint64_t)self, v10, v11, v12, v13, v14);
}

- (unint64_t)_maxCloudDataPerBatch
{
  unint64_t v8 = objc_msgSend_tooBigBatch(self, a2, v2, v3, v4, v5, v6, v7);
  if (v8 >> 1 <= 1) {
    return 1;
  }
  else {
    return v8 >> 1;
  }
}

- (id)_batchFromCloudData:(id)a3
{
  id v4 = a3;
  unint64_t v12 = objc_msgSend__maxCloudDataPerBatch(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v25 = v4;
  if (objc_msgSend_count(v4, v13, v14, v15, v16, v17, v18, v19) > v12)
  {
    uint64_t v25 = objc_msgSend_subarrayWithRange_(v4, v20, 0, v12, v21, v22, v23, v24);
  }
  return v25;
}

- (void)_fromBatch:(id)a3 getRecordsToSave:(id *)a4 recordIDsToDelete:(id *)a5 buildingMap:(id *)a6
{
  uint64_t v171 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10, v11, v12, v13, v14);
  id v163 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x263EFF980], v15, v16, v17, v18, v19, v20, v21);
  id v162 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v22, v23, v24, v25, v26, v27, v28);
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id v30 = v7;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v164, (uint64_t)v170, 16, v32, v33, v34);
  if (v35)
  {
    uint64_t v43 = v35;
    uint64_t v44 = *(void *)v165;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v165 != v44) {
          objc_enumerationMutation(v30);
        }
        v46 = *(void **)(*((void *)&v164 + 1) + 8 * v45);
        if (objc_msgSend_deletedFlag(v46, v36, v37, v38, v39, v40, v41, v42))
        {
          v54 = objc_msgSend_systemFields(v46, v47, v48, v49, v50, v51, v52, v53);
          v62 = v54;
          if (v54)
          {
            v63 = objc_msgSend_recordID(v54, v55, v56, v57, v58, v59, v60, v61);
            v70 = objc_msgSend_objectForKey_(v29, v64, (uint64_t)v63, v65, v66, v67, v68, v69);

            if (v70)
            {
              v78 = BDSCloudKitLog();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v169 = v46;
                v79 = v78;
                v80 = "BCCloudDataSyncManager: cloudDataMap already contans an entry for deleting %@";
                goto LABEL_22;
              }
            }
            else
            {
              v127 = objc_msgSend_recordID(v62, v71, v72, v73, v74, v75, v76, v77);
              objc_msgSend_setObject_forKeyedSubscript_(v29, v128, (uint64_t)v46, (uint64_t)v127, v129, v130, v131, v132);

              v78 = objc_msgSend_recordID(v62, v133, v134, v135, v136, v137, v138, v139);
              objc_msgSend_addObject_(v162, v140, (uint64_t)v78, v141, v142, v143, v144, v145);
            }
LABEL_24:

            goto LABEL_25;
          }
          v78 = BDSCloudKitLog();
          if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_DWORD *)buf = 138412290;
          v169 = v46;
          v79 = v78;
          v80 = "BCCloudDataSyncManager: Unable to retrieve systemFields from %@";
LABEL_22:
          _os_log_error_impl(&dword_2360BC000, v79, OS_LOG_TYPE_ERROR, v80, buf, 0xCu);
          goto LABEL_24;
        }
        v81 = objc_msgSend_dataMapper(self, v47, v48, v49, v50, v51, v52, v53);

        if (v81)
        {
          v89 = objc_msgSend_dataMapper(self, v82, v83, v84, v85, v86, v87, v88);
          v62 = objc_msgSend_recordFromCloudData_(v89, v90, (uint64_t)v46, v91, v92, v93, v94, v95);

          if (!v62) {
            goto LABEL_19;
          }
        }
        else
        {
          v62 = objc_msgSend_configuredRecordFromAttributes(v46, v82, v83, v84, v85, v86, v87, v88);
          if (!v62)
          {
LABEL_19:
            v118 = objc_msgSend_privacyDelegate(v46, v96, v97, v98, v99, v100, v101, v102);
            int v126 = objc_msgSend_establishedSalt(v118, v119, v120, v121, v122, v123, v124, v125);

            if (!v126) {
              goto LABEL_25;
            }
            v78 = BDSCloudKitLog();
            if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
              goto LABEL_24;
            }
            *(_DWORD *)buf = 138412290;
            v169 = v46;
            v79 = v78;
            v80 = "BCCloudDataSyncManager: Unable to configure CKRecord to save from %@";
            goto LABEL_22;
          }
        }
        v103 = objc_msgSend_recordID(v62, v96, v97, v98, v99, v100, v101, v102);
        v110 = objc_msgSend_objectForKey_(v29, v104, (uint64_t)v103, v105, v106, v107, v108, v109);

        if (v110)
        {
          v78 = BDSCloudKitLog();
          if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_DWORD *)buf = 138412290;
          v169 = v46;
          v79 = v78;
          v80 = "BCCloudDataSyncManager: cloudDataMap already contans an entry for saving %@";
          goto LABEL_22;
        }
        v146 = objc_msgSend_recordID(v62, v111, v112, v113, v114, v115, v116, v117);
        objc_msgSend_setObject_forKeyedSubscript_(v29, v147, (uint64_t)v46, (uint64_t)v146, v148, v149, v150, v151);

        objc_msgSend_addObject_(v163, v152, (uint64_t)v62, v153, v154, v155, v156, v157);
LABEL_25:

        ++v45;
      }
      while (v43 != v45);
      uint64_t v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v36, (uint64_t)&v164, (uint64_t)v170, 16, v40, v41, v42);
      uint64_t v43 = v158;
    }
    while (v158);
  }

  if (a4) {
    *a4 = v163;
  }
  if (a5) {
    *a5 = v162;
  }
  if (a6) {
    *a6 = v29;
  }
}

- (void)_enterDispatchGroup:(id)a3 times:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      dispatch_group_enter((dispatch_group_t)a3);
      --v4;
    }
    while (v4);
  }
}

- (void)_leaveDispatchGroup:(id)a3 times:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      dispatch_group_leave((dispatch_group_t)a3);
      --v4;
    }
    while (v4);
  }
}

- (void)_updateRetryParametersFromModifyRecordsOperationError:(id)a3 batchSize:(unint64_t)a4
{
  id v87 = a3;
  uint64_t v13 = objc_msgSend_syncQueue(self, v6, v7, v8, v9, v10, v11, v12);
  dispatch_assert_queue_V2(v13);

  uint64_t v21 = objc_msgSend_domain(v87, v14, v15, v16, v17, v18, v19, v20);
  int isEqualToString = objc_msgSend_isEqualToString_(v21, v22, *MEMORY[0x263EFD498], v23, v24, v25, v26, v27);

  uint64_t v29 = v87;
  if (isEqualToString)
  {
    objc_opt_class();
    uint64_t v37 = objc_msgSend_userInfo(v87, v30, v31, v32, v33, v34, v35, v36);
    uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v37, v38, *MEMORY[0x263EFD4A0], v39, v40, v41, v42, v43);
    uint64_t v45 = BUDynamicCast();
    objc_msgSend_doubleValue(v45, v46, v47, v48, v49, v50, v51, v52);
    double v54 = v53;

    if (v54 <= 0.0)
    {
      uint64_t v62 = objc_msgSend_code(v87, v55, v56, v57, v58, v59, v60, v61);
      if ((unint64_t)(v62 - 6) >= 2)
      {
        if (v62 == 27)
        {
          unint64_t v80 = objc_msgSend_tooBigBatch(self, v63, v64, v65, v66, v67, v68, v69);
          if (v80 >= a4) {
            objc_msgSend_setTooBigBatch_(self, v81, a4, v82, v83, v84, v85, v86);
          }
          else {
            objc_msgSend_setTooBigBatch_(self, v81, v80, v82, v83, v84, v85, v86);
          }
          double v54 = 0.0;
          goto LABEL_13;
        }
        BOOL v70 = v62 == 23;
        uint64_t v29 = v87;
        if (!v70) {
          goto LABEL_15;
        }
      }
      objc_msgSend_backOffInterval(self, v63, v64, v65, v66, v67, v68, v69);
      double v54 = 5.0;
      if (v71 >= 5.0)
      {
        objc_msgSend_backOffInterval(self, v55, v56, v57, v58, v59, v60, v61);
        objc_msgSend_setBackOffInterval_(self, v73, v74, v75, v76, v77, v78, v79, v72 + v72);
LABEL_14:
        uint64_t v29 = v87;
        goto LABEL_15;
      }
    }
LABEL_13:
    objc_msgSend_setBackOffInterval_(self, v55, v56, v57, v58, v59, v60, v61, v54);
    goto LABEL_14;
  }
LABEL_15:
}

- (id)_modifyRecordsCompletionBlockWithDispatchGroup:(id)a3 cloudDataMap:(id)a4 recordCount:(unint64_t)a5 operation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2361076E4;
  aBlock[3] = &unk_264CA2190;
  objc_copyWeak(v23, &location);
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  uint64_t v22 = self;
  v23[1] = (id)a5;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  uint64_t v16 = _Block_copy(aBlock);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  return v16;
}

- (void)_syncQueueSyncForCloudData:(id)a3 completion:(id)a4
{
  uint64_t v202 = *MEMORY[0x263EF8340];
  id v190 = a3;
  id aBlock = a4;
  objc_msgSend_setProcessingCloudData_(self, v6, 1, v7, v8, v9, v10, v11);
  id v19 = objc_msgSend_cloudKitController(self, v12, v13, v14, v15, v16, v17, v18);
  uint64_t v27 = objc_msgSend_privateCloudDatabaseController(v19, v20, v21, v22, v23, v24, v25, v26);

  if (v27)
  {
    v186 = objc_msgSend_database(v27, v28, v29, v30, v31, v32, v33, v34);
    uint64_t v35 = dispatch_group_create();
    dispatch_group_enter(v35);
    v188 = objc_msgSend__batchFromCloudData_(self, v36, (uint64_t)v190, v37, v38, v39, v40, v41);
    unint64_t v49 = objc_msgSend_count(v188, v42, v43, v44, v45, v46, v47, v48);
    BOOL v185 = v49 < objc_msgSend_count(v190, v50, v51, v52, v53, v54, v55, v56);
    uint64_t v64 = objc_msgSend_array(MEMORY[0x263EFF980], v57, v58, v59, v60, v61, v62, v63);
    double v72 = objc_msgSend_array(MEMORY[0x263EFF980], v65, v66, v67, v68, v69, v70, v71);
    unint64_t v80 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v73, v74, v75, v76, v77, v78, v79);
    id v196 = v64;
    id v197 = v72;
    id v195 = v80;
    objc_msgSend__fromBatch_getRecordsToSave_recordIDsToDelete_buildingMap_(self, v81, (uint64_t)v188, (uint64_t)&v197, (uint64_t)&v196, (uint64_t)&v195, v82, v83);
    id v84 = v197;

    id v85 = v196;
    id v187 = v195;

    uint64_t v93 = objc_msgSend_count(v84, v86, v87, v88, v89, v90, v91, v92);
    uint64_t v101 = objc_msgSend_count(v85, v94, v95, v96, v97, v98, v99, v100) + v93;
    objc_msgSend__enterDispatchGroup_times_(self, v102, (uint64_t)v35, v101, v103, v104, v105, v106);
    if (v101)
    {
      id v107 = objc_alloc(MEMORY[0x263EFD748]);
      uint64_t v113 = objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v107, v108, (uint64_t)v84, (uint64_t)v85, v109, v110, v111, v112);
      uint64_t v121 = objc_msgSend_bds_defaultConfiguration(MEMORY[0x263EFD778], v114, v115, v116, v117, v118, v119, v120);
      objc_msgSend_setConfiguration_(v113, v122, (uint64_t)v121, v123, v124, v125, v126, v127);

      objc_msgSend_setSavePolicy_(v113, v128, 0, v129, v130, v131, v132, v133);
      uint64_t v137 = objc_msgSend__modifyRecordsCompletionBlockWithDispatchGroup_cloudDataMap_recordCount_operation_(self, v134, (uint64_t)v35, (uint64_t)v187, v101, (uint64_t)v113, v135, v136);
      objc_msgSend_setModifyRecordsCompletionBlock_(v113, v138, (uint64_t)v137, v139, v140, v141, v142, v143);

      uint64_t v144 = BDSCloudKitLog();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      {
        v152 = objc_msgSend_delegate(self, v145, v146, v147, v148, v149, v150, v151);
        v160 = objc_msgSend_entityName(v152, v153, v154, v155, v156, v157, v158, v159);
        v168 = objc_msgSend_operationID(v113, v161, v162, v163, v164, v165, v166, v167);
        *(_DWORD *)buf = 138543618;
        v199 = v160;
        __int16 v200 = 2114;
        v201 = v168;
        _os_log_impl(&dword_2360BC000, v144, OS_LOG_TYPE_DEFAULT, "Adding CKModifyRecordsOperation to database for: %{public}@.  Operation ID: %{public}@", buf, 0x16u);
      }
      objc_msgSend_addOperation_(v186, v169, (uint64_t)v113, v170, v171, v172, v173, v174);
    }
    objc_initWeak((id *)buf, self);
    v182 = objc_msgSend_syncQueue(self, v175, v176, v177, v178, v179, v180, v181);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2361093BC;
    block[3] = &unk_264CA21B8;
    objc_copyWeak(&v193, (id *)buf);
    BOOL v194 = v185;
    block[4] = self;
    id v192 = aBlock;
    dispatch_group_notify(v35, v182, block);

    dispatch_group_leave(v35);
    objc_destroyWeak(&v193);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend_setProcessingCloudData_(self, v28, 0, v30, v31, v32, v33, v34);
    v183 = _Block_copy(aBlock);
    v184 = v183;
    if (v183) {
      (*((void (**)(void *))v183 + 2))(v183);
    }
  }
}

- (BCCloudDataSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BCCloudDataSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BCCloudKitController)cloudKitController
{
  return self->_cloudKitController;
}

- (void)setCloudKitController:(id)a3
{
}

- (BCCloudDataMapper)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (BOOL)processingCloudData
{
  return self->_processingCloudData;
}

- (void)setProcessingCloudData:(BOOL)a3
{
  self->_processingCloudData = a3;
}

- (double)backOffInterval
{
  return self->_backOffInterval;
}

- (void)setBackOffInterval:(double)a3
{
  self->_backOffInterval = a3;
}

- (unint64_t)tooBigBatch
{
  return self->_tooBigBatch;
}

- (void)setTooBigBatch:(unint64_t)a3
{
  self->_tooBigBatch = a3;
}

- (BOOL)serverPushPostponed
{
  return self->_serverPushPostponed;
}

- (void)setServerPushPostponed:(BOOL)a3
{
  self->_serverPushPostponed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_dataMapper, 0);
  objc_storeStrong((id *)&self->_cloudKitController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end