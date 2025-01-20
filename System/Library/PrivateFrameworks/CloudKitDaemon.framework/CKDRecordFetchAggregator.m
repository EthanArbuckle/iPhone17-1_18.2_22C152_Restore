@interface CKDRecordFetchAggregator
- (BOOL)fetchAssetContents;
- (BOOL)fetchMergeableValues;
- (BOOL)forceDecryptionAttempt;
- (BOOL)isMarkedToFinishByParent;
- (BOOL)preserveOrdering;
- (BOOL)started;
- (BOOL)supportsClearAssetEncryption;
- (BOOL)useRecordCache;
- (CKDFetchRecordsOperation)currentFetchOp;
- (CKDRecordFetchAggregator)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSMutableDictionary)fetchInfosByOrder;
- (NSSet)desiredKeys;
- (OS_dispatch_group)fetchGroup;
- (OS_dispatch_queue)fetchQueue;
- (OS_dispatch_source)fetchSource;
- (OS_dispatch_source)recordReadySource;
- (id)CKPropertiesDescription;
- (id)_fetchRecord:(id)a3 recordReadyHandle:(BOOL *)a4 withRecordCompletion:(id)a5;
- (id)activityCreate;
- (id)description;
- (id)fetchAggregatorCompletionBlock;
- (int)operationType;
- (unint64_t)curFetchOrder;
- (unint64_t)highestReturnedOrder;
- (void)_addRecordFetchInfos:(id)a3;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_finishRecordFetchAggregator;
- (void)_flushFetchedRecordsToConsumerLocked;
- (void)_flushFetchedRecordsToConsumerNoOrderingLocked;
- (void)_flushFetchedRecordsToConsumerOrderedLocked;
- (void)_lockedSendFetchRequest;
- (void)_performCallbackForFetchInfoLocked:(id)a3;
- (void)_recordFetchesAvailable;
- (void)dealloc;
- (void)fetchRecords:(id)a3 withPerRecordCompletion:(id)a4;
- (void)finishIfAppropriate;
- (void)main;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setCurFetchOrder:(unint64_t)a3;
- (void)setCurrentFetchOp:(id)a3;
- (void)setDesiredKeys:(id)a3;
- (void)setFetchAggregatorCompletionBlock:(id)a3;
- (void)setFetchAssetContents:(BOOL)a3;
- (void)setFetchGroup:(id)a3;
- (void)setFetchMergeableValues:(BOOL)a3;
- (void)setFetchQueue:(id)a3;
- (void)setFetchSource:(id)a3;
- (void)setForceDecryptionAttempt:(BOOL)a3;
- (void)setHighestReturnedOrder:(unint64_t)a3;
- (void)setMarkedToFinishByParent:(BOOL)a3;
- (void)setPreserveOrdering:(BOOL)a3;
- (void)setRecordReadySource:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setUseRecordCache:(BOOL)a3;
@end

@implementation CKDRecordFetchAggregator

- (CKDRecordFetchAggregator)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)CKDRecordFetchAggregator;
  id v10 = [(CKDDatabaseOperation *)&v52 initWithOperationInfo:v6 container:v7];
  if (v10)
  {
    *((unsigned char *)v10 + 465) = objc_msgSend_fetchAssetContents(v6, v8, v9);
    *((unsigned char *)v10 + 466) = objc_msgSend_fetchMergeableValues(v6, v11, v12);
    *((unsigned char *)v10 + 467) = objc_msgSend_preserveOrdering(v6, v13, v14);
    v17 = objc_msgSend_desiredKeys(v6, v15, v16);
    uint64_t v20 = objc_msgSend_copy(v17, v18, v19);
    v21 = (void *)*((void *)v10 + 61);
    *((void *)v10 + 61) = v20;

    uint64_t v24 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v6, v22, v23);
    v25 = (void *)*((void *)v10 + 60);
    *((void *)v10 + 60) = v24;

    *((unsigned char *)v10 + 470) = objc_msgSend_forceDecryptionAttempt(v6, v26, v27);
    *((unsigned char *)v10 + 464) = 1;
    objc_initWeak(&location, v10);
    dispatch_group_t v28 = dispatch_group_create();
    v29 = (void *)*((void *)v10 + 65);
    *((void *)v10 + 65) = v28;

    v32 = objc_msgSend_fetchQueue(v10, v30, v31);
    dispatch_source_t v33 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, v32);
    v34 = (void *)*((void *)v10 + 64);
    *((void *)v10 + 64) = v33;

    v35 = *((void *)v10 + 64);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_1C4F17110;
    v49[3] = &unk_1E64F09E0;
    objc_copyWeak(&v50, &location);
    v36 = v49;
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v54 = 3221225472;
    v55 = sub_1C4F1A9E4;
    v56 = &unk_1E64F0A80;
    id v57 = v36;
    dispatch_source_set_event_handler(v35, &handler);

    dispatch_resume(*((dispatch_object_t *)v10 + 64));
    v39 = objc_msgSend_fetchQueue(v10, v37, v38);
    dispatch_source_t v40 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, v39);
    v41 = (void *)*((void *)v10 + 62);
    *((void *)v10 + 62) = v40;

    v42 = *((void *)v10 + 62);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1C4F1718C;
    v47[3] = &unk_1E64F09E0;
    objc_copyWeak(&v48, &location);
    v43 = v47;
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v54 = 3221225472;
    v55 = sub_1C4F1A9E4;
    v56 = &unk_1E64F0A80;
    id v57 = v43;
    dispatch_source_set_event_handler(v42, &handler);

    dispatch_resume(*((dispatch_object_t *)v10 + 62));
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v45 = (void *)*((void *)v10 + 66);
    *((void *)v10 + 66) = v44;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }

  return (CKDRecordFetchAggregator *)v10;
}

- (OS_dispatch_queue)fetchQueue
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fetchQueue)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_qos_class_t v6 = objc_msgSend_QOSClass(v2, v4, v5);
    id v7 = dispatch_queue_attr_make_with_qos_class(v3, v6, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cloudkit.fetchAggregator.fetchQueue", v7);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_set_specific((dispatch_queue_t)v2->_fetchQueue, "com.apple.cloudkit.recordfetchaggregator", (void *)1, 0);
  }
  objc_sync_exit(v2);

  id v10 = v2->_fetchQueue;
  return v10;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/record-fetch-aggregator", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)dealloc
{
  fetchSource = self->_fetchSource;
  if (fetchSource) {
    dispatch_source_cancel(fetchSource);
  }
  recordReadySource = self->_recordReadySource;
  if (recordReadySource) {
    dispatch_source_cancel(recordReadySource);
  }
  v5.receiver = self;
  v5.super_class = (Class)CKDRecordFetchAggregator;
  [(CKDOperation *)&v5 dealloc];
}

- (id)CKPropertiesDescription
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_1C4F17518;
  v18 = sub_1C4F17528;
  id v19 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4F17530;
  aBlock[3] = &unk_1E64F28C8;
  aBlock[4] = self;
  id v4 = v3;
  id v12 = v4;
  v13 = &v14;
  objc_super v5 = (void (**)(void))_Block_copy(aBlock);
  if (dispatch_get_specific("com.apple.cloudkit.recordfetchaggregator"))
  {
    v5[2](v5);
  }
  else
  {
    dispatch_queue_t v8 = objc_msgSend_fetchQueue(self, v6, v7);
    dispatch_sync(v8, v5);
  }
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDRecordFetchAggregator *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (int)operationType
{
  return 0;
}

- (void)_performCallbackForFetchInfoLocked:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_fetchQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  dispatch_queue_t v8 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v4;
    _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Performing callback for fetch info %@", buf, 0xCu);
  }
  unint64_t v11 = objc_msgSend_highestReturnedOrder(self, v9, v10);
  unint64_t Order = objc_msgSend_fetchOrder(v4, v12, v13);
  if (v11 <= Order) {
    objc_msgSend_setHighestReturnedOrder_(self, v15, Order);
  }
  else {
    objc_msgSend_setHighestReturnedOrder_(self, v15, v11);
  }
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = sub_1C4F179DC;
  dispatch_source_t v33 = &unk_1E64F0948;
  id v34 = v4;
  v35 = self;
  id v19 = v4;
  dispatch_async(v18, &v30);

  v22 = objc_msgSend_fetchInfosByOrder(self, v20, v21, v30, v31, v32, v33);
  uint64_t v23 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v26 = objc_msgSend_fetchOrder(v19, v24, v25);
  dispatch_group_t v28 = objc_msgSend_numberWithUnsignedInteger_(v23, v27, v26);
  objc_msgSend_setObject_forKeyedSubscript_(v22, v29, 0, v28);
}

- (void)_flushFetchedRecordsToConsumerOrderedLocked
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_fetchQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);
  while (1)
  {

    uint64_t v7 = objc_msgSend_fetchInfosByOrder(self, v5, v6);
    dispatch_queue_t v8 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v11 = objc_msgSend_highestReturnedOrder(self, v9, v10);
    uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(v8, v12, v11 + 1);
    id v4 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

    if (!v4 || objc_msgSend_state(v4, v15, v16) != 3) {
      break;
    }
    objc_msgSend__performCallbackForFetchInfoLocked_(self, v17, (uint64_t)v4);
  }

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v18 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v19 = v18;
    uint64_t v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    uint64_t v24 = objc_msgSend_ckShortDescription(self, v22, v23);
    int v27 = 138544130;
    dispatch_group_t v28 = v21;
    __int16 v29 = 2048;
    uint64_t v30 = self;
    __int16 v31 = 2114;
    v32 = v24;
    __int16 v33 = 2048;
    uint64_t v34 = objc_msgSend_highestReturnedOrder(self, v25, v26);
    _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Done flushing record callbacks for <%{public}@: %p; %{public}@>. Current highest callback is %lu",
      (uint8_t *)&v27,
      0x2Au);
  }
}

- (void)_flushFetchedRecordsToConsumerNoOrderingLocked
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_fetchQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = objc_msgSend_fetchInfosByOrder(self, v5, v6, 0);
  uint64_t v10 = objc_msgSend_allValues(v7, v8, v9);

  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, v23, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v10);
        }
        v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend_state(v18, v13, v14) == 3) {
          objc_msgSend__performCallbackForFetchInfoLocked_(self, v13, (uint64_t)v18);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v19, v23, 16);
    }
    while (v15);
  }
}

- (void)_flushFetchedRecordsToConsumerLocked
{
  id v4 = objc_msgSend_fetchQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  if (objc_msgSend_preserveOrdering(self, v5, v6))
  {
    MEMORY[0x1F4181798](self, sel__flushFetchedRecordsToConsumerOrderedLocked, v7);
  }
  else
  {
    MEMORY[0x1F4181798](self, sel__flushFetchedRecordsToConsumerNoOrderingLocked, v7);
  }
}

- (void)_lockedSendFetchRequest
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend_fetchQueue(self, a2, v2);
  dispatch_assert_queue_V2(v5);

  dispatch_queue_t v8 = objc_msgSend_currentFetchOp(self, v6, v7);

  if (v8)
  {
    v108 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v108, v109, (uint64_t)a2, self, @"CKDRecordFetchAggregator.m", 324, @"Can't send a fetch request when another one is still outstanding");
  }
  SEL v110 = a2;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v11 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v102 = v11;
    v103 = (objc_class *)objc_opt_class();
    v104 = NSStringFromClass(v103);
    v107 = objc_msgSend_ckShortDescription(self, v105, v106);
    *(_DWORD *)buf = 138543874;
    v123 = v104;
    __int16 v124 = 2048;
    v125 = self;
    __int16 v126 = 2114;
    v127 = v107;
    _os_log_debug_impl(&dword_1C4CFF000, v102, OS_LOG_TYPE_DEBUG, "Sending fetch requests for <%{public}@: %p; %{public}@>",
      buf,
      0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  v111 = self;
  uint64_t v17 = objc_msgSend_fetchInfosByOrder(self, v15, v16);
  long long v20 = objc_msgSend_allValues(v17, v18, v19);

  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v118, v130, 16);
  if (v22)
  {
    uint64_t v25 = v22;
    uint64_t v26 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v119 != v26) {
          objc_enumerationMutation(v20);
        }
        dispatch_group_t v28 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        if (objc_msgSend_state(v28, v23, v24) == 1)
        {
          __int16 v29 = objc_msgSend_record(v28, v23, v24);

          if (v29)
          {
            v32 = objc_msgSend_record(v28, v30, v31);
            objc_msgSend_addObject_(v13, v33, (uint64_t)v32);
          }
          else
          {
            v32 = objc_msgSend_recordID(v28, v30, v31);
            objc_msgSend_addObject_(v12, v34, (uint64_t)v32);
          }

          id v37 = objc_msgSend_recordID(v28, v35, v36);
          v39 = objc_msgSend_objectForKeyedSubscript_(v14, v38, (uint64_t)v37);

          if (v39)
          {
            objc_msgSend_addObject_(v39, v40, (uint64_t)v28);
          }
          else
          {
            v39 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v40, (uint64_t)v28);
            id v44 = objc_msgSend_recordID(v28, v42, v43);
            objc_msgSend_setObject_forKeyedSubscript_(v14, v45, (uint64_t)v39, v44);
          }
          objc_msgSend_setState_(v28, v41, 2);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v118, v130, 16);
    }
    while (v25);
  }

  v46 = v12;
  if (objc_msgSend_count(v12, v47, v48) || objc_msgSend_count(v13, v49, v50))
  {
    uint64_t v51 = objc_msgSend_count(v12, v49, v50);
    uint64_t v54 = (void *)MEMORY[0x1E4F1A550];
    if (v51)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v55 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v56 = v55;
        id v57 = (objc_class *)objc_opt_class();
        v58 = NSStringFromClass(v57);
        v61 = objc_msgSend_ckShortDescription(v111, v59, v60);
        *(_DWORD *)buf = 138544130;
        v123 = v58;
        __int16 v124 = 2048;
        v125 = v111;
        __int16 v126 = 2114;
        v127 = v61;
        __int16 v128 = 2112;
        v129 = v46;
        _os_log_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_INFO, "Fetching the following record IDs from the server for operation <%{public}@: %p; %{public}@>: %@",
          buf,
          0x2Au);
      }
    }
    if (objc_msgSend_count(v13, v52, v53))
    {
      if (*v54 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v62 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v63 = v62;
        v64 = (objc_class *)objc_opt_class();
        v65 = NSStringFromClass(v64);
        v68 = objc_msgSend_ckShortDescription(v111, v66, v67);
        v70 = objc_msgSend_valueForKeyPath_(v13, v69, @"recordID");
        *(_DWORD *)buf = 138544130;
        v123 = v65;
        __int16 v124 = 2048;
        v125 = v111;
        __int16 v126 = 2114;
        v127 = v68;
        __int16 v128 = 2112;
        v129 = v70;
        _os_log_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_INFO, "Running the following full records through a fetch records operation for <%{public}@: %p; %{public}@>: %@",
          buf,
          0x2Au);
      }
    }
    v71 = objc_opt_new();
    v74 = objc_msgSend_allObjects(v46, v72, v73);
    objc_msgSend_setRecordIDs_(v71, v75, (uint64_t)v74);

    v78 = objc_msgSend_desiredKeys(v111, v76, v77);
    v81 = objc_msgSend_allObjects(v78, v79, v80);
    objc_msgSend_setDesiredKeys_(v71, v82, (uint64_t)v81);

    v85 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v111, v83, v84);
    objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v71, v86, (uint64_t)v85);

    uint64_t AssetContents = objc_msgSend_fetchAssetContents(v111, v87, v88);
    objc_msgSend_setShouldFetchAssetContent_(v71, v90, AssetContents);
    uint64_t MergeableValues = objc_msgSend_fetchMergeableValues(v111, v91, v92);
    objc_msgSend_setShouldFetchMergeableValues_(v71, v94, MergeableValues);
    uint64_t v97 = objc_msgSend_databaseScope(v111, v95, v96);
    objc_msgSend_setDatabaseScope_(v71, v98, v97);
    uint64_t v99 = objc_opt_class();
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = sub_1C4F184A8;
    v112[3] = &unk_1E64F6340;
    id v113 = v13;
    v114 = v111;
    SEL v117 = v110;
    id v115 = v71;
    id v116 = v14;
    id v100 = v71;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v111, v101, v99, v100, v112);
  }
}

- (void)_recordFetchesAvailable
{
  id v4 = objc_msgSend_fetchQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  objc_msgSend_fetchInfosByOrder(self, v5, v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v13, v7, v8))
  {
    uint64_t v11 = objc_msgSend_currentFetchOp(self, v9, v10);

    if (!v11)
    {
      MEMORY[0x1F4181798](self, sel__lockedSendFetchRequest, v12);
    }
  }
  else
  {
  }
}

- (void)_addRecordFetchInfos:(id)a3
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_fetchQueue(self, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F192F8;
  block[3] = &unk_1E64F19C0;
  id v11 = v5;
  uint64_t v12 = self;
  SEL v13 = a2;
  id v9 = v5;
  dispatch_sync(v8, block);
}

- (void)main
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_isMarkedToFinishByParent(v2, v3, v4))
  {
    objc_sync_exit(v2);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = v6;
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      uint64_t v15 = objc_msgSend_ckShortDescription(v2, v13, v14);
      int v22 = 138543874;
      uint64_t v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = v2;
      __int16 v26 = 2114;
      int v27 = v15;
      _os_log_debug_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEBUG, "Parent asked record fetch aggregator operation <%{public}@: %p; %{public}@> to finish before it started",
        (uint8_t *)&v22,
        0x20u);
    }
    objc_msgSend__finishRecordFetchAggregator(v2, v7, v8);
  }
  else
  {
    objc_msgSend_setStarted_(v2, v5, 1);
    objc_sync_exit(v2);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = v9;
      uint64_t v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      long long v21 = objc_msgSend_ckShortDescription(v2, v19, v20);
      int v22 = 138543874;
      uint64_t v23 = v18;
      __int16 v24 = 2048;
      uint64_t v25 = v2;
      __int16 v26 = 2114;
      int v27 = v21;
      _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Starting record fetch aggregator operation <%{public}@: %p; %{public}@>",
        (uint8_t *)&v22,
        0x20u);
    }
  }
}

- (id)_fetchRecord:(id)a3 recordReadyHandle:(BOOL *)a4 withRecordCompletion:(id)a5
{
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (objc_msgSend_isFinished(self, v11, v12))
  {
    v175 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v175, v176, (uint64_t)a2, self, @"CKDRecordFetchAggregator.m", 469, @"Can't enqueue a new fetch after we've already finished");
  }
  uint64_t v17 = objc_msgSend_recordID(v9, v13, v14);
  if (v17) {
    goto LABEL_4;
  }
  uint64_t v20 = objc_msgSend_record(v9, v15, v16);
  uint64_t v23 = objc_msgSend_recordID(v20, v21, v22);

  if (!v23)
  {
    uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v153, (uint64_t)a2, self, @"CKDRecordFetchAggregator.m", 470, @"Can't fetch a record without a record ID");
LABEL_4:
  }
  __int16 v24 = objc_msgSend_recordID(v9, v18, v19);
  int v27 = v24;
  if (v24)
  {
    id v28 = v24;
  }
  else
  {
    __int16 v29 = objc_msgSend_record(v9, v25, v26);
    objc_msgSend_recordID(v29, v30, v31);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v32 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v160 = v32;
    v163 = objc_msgSend_ckShortDescription(v28, v161, v162);
    *(_DWORD *)buf = 138412290;
    v182 = v163;
    _os_log_debug_impl(&dword_1C4CFF000, v160, OS_LOG_TYPE_DEBUG, "Enqueuing a record fetch for record %@", buf, 0xCu);
  }
  __int16 v33 = [CKDRecordFetchInfo alloc];
  uint64_t v35 = objc_msgSend_initWithAggregator_(v33, v34, (uint64_t)self);
  uint64_t v38 = objc_msgSend_curFetchOrder(self, v36, v37) + 1;
  objc_msgSend_setCurFetchOrder_(self, v39, v38);
  objc_msgSend_setFetchOrder_(v35, v40, v38);
  v180 = v28;
  objc_msgSend_setRecordID_(v35, v41, (uint64_t)v28);
  id v44 = objc_msgSend_record(v9, v42, v43);
  objc_msgSend_setRecord_(v35, v45, (uint64_t)v44);

  uint64_t v48 = objc_msgSend_etag(v9, v46, v47);
  objc_msgSend_setEtag_(v35, v49, (uint64_t)v48);

  uint64_t v52 = objc_msgSend_forceDecryptionAttempt(self, v50, v51);
  objc_msgSend_setIgnoreErrors_(v35, v53, v52);
  v56 = objc_msgSend_container(self, v54, v55);
  uint64_t v59 = objc_msgSend_entitlements(v56, v57, v58);
  uint64_t hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement((void *)v59, v60, v61);
  v65 = objc_msgSend_record(v35, v63, v64);
  objc_msgSend_setSerializeProtectionData_(v65, v66, hasProtectionDataEntitlement);

  v69 = objc_msgSend_record(v35, v67, v68);
  objc_opt_class();
  LOBYTE(v59) = objc_opt_isKindOfClass();

  if (v59)
  {
    v177 = a4;
    id v178 = v10;
    v72 = objc_msgSend_container(self, v70, v71);
    v75 = objc_msgSend_entitlements(v72, v73, v74);
    char hasOutOfProcessUIEntitlement = objc_msgSend_hasOutOfProcessUIEntitlement(v75, v76, v77);
    if (hasOutOfProcessUIEntitlement)
    {
      uint64_t hasParticipantPIIEntitlement = 1;
    }
    else
    {
      objc_msgSend_container(self, v78, v79);
      a4 = (BOOL *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend_entitlements(a4, v82, v83);
      uint64_t hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v69, v84, v85);
    }
    v86 = objc_msgSend_record(v35, v78, v79);
    objc_msgSend_setSerializePersonalInfo_(v86, v87, hasParticipantPIIEntitlement);

    if ((hasOutOfProcessUIEntitlement & 1) == 0)
    {
    }
    a4 = v177;
    id v10 = v178;
  }
  objc_msgSend_setCompletionBlock_(v35, v70, (uint64_t)v10);
  v90 = objc_msgSend_fetchGroup(self, v88, v89);
  dispatch_group_enter(v90);

  objc_msgSend_setState_(v35, v91, 1);
  uint64_t v94 = objc_msgSend_record(v9, v92, v93);
  if (!v94) {
    goto LABEL_26;
  }
  uint64_t v97 = (void *)v94;
  v98 = objc_msgSend_record(v9, v95, v96);
  if (objc_msgSend_containsAssetValues(v98, v99, v100))
  {
LABEL_25:

    goto LABEL_26;
  }
  id v103 = v10;
  v104 = objc_msgSend_record(v9, v101, v102);
  if ((objc_msgSend_hasEncryptedData(v104, v105, v106) & 1) != 0
    || (objc_msgSend_forceDecryptionAttempt(self, v107, v108) & 1) != 0)
  {

    id v10 = v103;
    goto LABEL_25;
  }
  v154 = objc_msgSend_record(v9, v109, v110);
  if (objc_msgSend_containsMergeableValues(v154, v155, v156))
  {
    char MergeableValues = objc_msgSend_fetchMergeableValues(self, v157, v158);

    id v10 = v103;
    if ((MergeableValues & 1) == 0) {
      goto LABEL_52;
    }
LABEL_26:
    id v113 = objc_msgSend_etag(v9, v95, v96);
    if (!v113) {
      goto LABEL_42;
    }
    int v114 = objc_msgSend_useRecordCache(self, v111, v112);

    if (!v114)
    {
      LOBYTE(v113) = 0;
      goto LABEL_42;
    }
    id v179 = v10;
    SEL v117 = a4;
    long long v118 = objc_msgSend_container(self, v115, v116);
    long long v121 = objc_msgSend_recordCache(v118, v119, v120);
    uint64_t v124 = objc_msgSend_databaseScope(self, v122, v123);
    v127 = objc_msgSend_recordID(v35, v125, v126);
    v130 = objc_msgSend_desiredKeys(self, v128, v129);
    v132 = objc_msgSend_etagForRecordID_container_requiredKeys_scope_(v121, v131, (uint64_t)v127, v118, v130, v124);

    v135 = objc_msgSend_etag(v9, v133, v134);
    LODWORD(v130) = objc_msgSend_isEqualToString_(v132, v136, (uint64_t)v135);

    if (!v130)
    {
      LOBYTE(v113) = 0;
      goto LABEL_41;
    }
    v139 = objc_msgSend_recordID(v35, v137, v138);
    v142 = objc_msgSend_desiredKeys(self, v140, v141);
    v144 = objc_msgSend_recordWithID_container_requiredKeys_scope_(v121, v143, (uint64_t)v139, v118, v142, v124);

    if (v144)
    {
      if ((objc_msgSend_containsAssetValues(v144, v145, v146) & 1) == 0
        && (objc_msgSend_hasEncryptedData(v144, v147, v148) & 1) == 0
        && !objc_msgSend_forceDecryptionAttempt(self, v149, v150))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v164 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          v171 = v164;
          v174 = objc_msgSend_recordID(v35, v172, v173);
          *(_DWORD *)buf = 138412290;
          v182 = v174;
          _os_log_debug_impl(&dword_1C4CFF000, v171, OS_LOG_TYPE_DEBUG, "Found record %@ in the cache. Returning that record", buf, 0xCu);
        }
        objc_msgSend_setRecord_(v35, v165, (uint64_t)v144);
        objc_msgSend_setState_(v35, v166, 3);
        LOBYTE(v113) = 1;
        goto LABEL_38;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v151 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v167 = v151;
        v170 = objc_msgSend_recordID(v35, v168, v169);
        *(_DWORD *)buf = 138412290;
        v182 = v170;
        _os_log_debug_impl(&dword_1C4CFF000, v167, OS_LOG_TYPE_DEBUG, "Found record %@ in the cache, but it needs decryption.  Going through the fetch flow.", buf, 0xCu);
      }
    }
    LOBYTE(v113) = 0;
LABEL_38:

LABEL_41:
    a4 = v117;

    id v10 = v179;
    goto LABEL_42;
  }

  id v10 = v103;
LABEL_52:
  objc_msgSend_setState_(v35, v95, 3);
  LOBYTE(v113) = 1;
LABEL_42:
  if (a4) {
    *a4 = (char)v113;
  }

  return v35;
}

- (void)fetchRecords:(id)a3 withPerRecordCompletion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v7;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v34, v38, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    SEL v32 = a2;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v35;
    unint64_t v19 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        unsigned __int8 v33 = 0;
        __int16 v24 = objc_msgSend__fetchRecord_recordReadyHandle_withRecordCompletion_(self, v15, v21, &v33, v8, v32);
        if (!v24)
        {
          uint64_t v25 = objc_msgSend_currentHandler(*(void **)(v19 + 2816), v22, v23);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)v32, self, @"CKDRecordFetchAggregator.m", 534, @"Failed to initialize fetchInfo");

          unint64_t v19 = 0x1E4F28000;
        }
        v17 += v33;
        objc_msgSend_addObject_(v11, v22, (uint64_t)v24);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v34, v38, 16);
    }
    while (v16);

    objc_msgSend__addRecordFetchInfos_(self, v27, (uint64_t)v11);
    if (v17)
    {
      uint64_t v30 = objc_msgSend_recordReadySource(self, v28, v29);
      dispatch_source_merge_data(v30, 1uLL);
    }
  }
  else
  {

    objc_msgSend__addRecordFetchInfos_(self, v31, (uint64_t)v11);
  }
}

- (void)finishIfAppropriate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    id v11 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Finishing fetch aggregator: %p", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (objc_msgSend_started(v4, v5, v6))
  {
    objc_sync_exit(v4);

    objc_msgSend__finishRecordFetchAggregator(v4, v8, v9);
  }
  else
  {
    objc_msgSend_setMarkedToFinishByParent_(v4, v7, 1);
    objc_sync_exit(v4);
  }
}

- (void)_finishRecordFetchAggregator
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isFinished(self, a2, v2))
  {
    uint64_t v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, @"CKDRecordFetchAggregator.m", 562, @"You can't finish a CKDRecordFetchAggregator twice");
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v7 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = v7;
    uint64_t v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    uint64_t v25 = objc_msgSend_ckShortDescription(self, v23, v24);
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v22;
    __int16 v31 = 2048;
    SEL v32 = self;
    __int16 v33 = 2114;
    long long v34 = v25;
    _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "Finishing fetch aggregator <%{public}@: %p; %{public}@>",
      buf,
      0x20u);
  }
  int v10 = objc_msgSend_fetchSource(self, v8, v9);
  dispatch_source_merge_data(v10, 1uLL);

  SEL v13 = objc_msgSend_recordReadySource(self, v11, v12);
  dispatch_source_merge_data(v13, 1uLL);

  uint64_t v16 = objc_msgSend_fetchGroup(self, v14, v15);
  unint64_t v19 = objc_msgSend_callbackQueue(self, v17, v18);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F1A4A0;
  block[3] = &unk_1E64F05C8;
  void block[4] = self;
  dispatch_group_notify(v16, v19, block);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_fetchAggregatorCompletionBlock(self, v5, v6);

  if (v7)
  {
    objc_msgSend_fetchAggregatorCompletionBlock(self, v8, v9);
    int v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v10)[2](v10, v4);

    objc_msgSend_setFetchAggregatorCompletionBlock_(self, v11, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)CKDRecordFetchAggregator;
  [(CKDOperation *)&v12 _finishOnCallbackQueueWithError:v4];
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)useRecordCache
{
  return self->_useRecordCache;
}

- (void)setUseRecordCache:(BOOL)a3
{
  self->_useRecordCache = a3;
}

- (id)fetchAggregatorCompletionBlock
{
  return self->_fetchAggregatorCompletionBlock;
}

- (void)setFetchAggregatorCompletionBlock:(id)a3
{
}

- (BOOL)fetchAssetContents
{
  return self->_fetchAssetContents;
}

- (void)setFetchAssetContents:(BOOL)a3
{
  self->_fetchuint64_t AssetContents = a3;
}

- (BOOL)fetchMergeableValues
{
  return self->_fetchMergeableValues;
}

- (void)setFetchMergeableValues:(BOOL)a3
{
  self->_fetchchar MergeableValues = a3;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
}

- (BOOL)preserveOrdering
{
  return self->_preserveOrdering;
}

- (void)setPreserveOrdering:(BOOL)a3
{
  self->_preserveOrdering = a3;
}

- (NSSet)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (OS_dispatch_source)recordReadySource
{
  return self->_recordReadySource;
}

- (void)setRecordReadySource:(id)a3
{
}

- (void)setFetchQueue:(id)a3
{
}

- (OS_dispatch_source)fetchSource
{
  return self->_fetchSource;
}

- (void)setFetchSource:(id)a3
{
}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (void)setFetchGroup:(id)a3
{
}

- (NSMutableDictionary)fetchInfosByOrder
{
  return self->_fetchInfosByOrder;
}

- (unint64_t)curFetchOrder
{
  return self->_curFetchOrder;
}

- (void)setCurFetchOrder:(unint64_t)a3
{
  self->_curFetchunint64_t Order = a3;
}

- (unint64_t)highestReturnedOrder
{
  return self->_highestReturnedOrder;
}

- (void)setHighestReturnedOrder:(unint64_t)a3
{
  self->_highestReturnedunint64_t Order = a3;
}

- (CKDFetchRecordsOperation)currentFetchOp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentFetchOp);
  return (CKDFetchRecordsOperation *)WeakRetained;
}

- (void)setCurrentFetchOp:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isMarkedToFinishByParent
{
  return self->_markedToFinishByParent;
}

- (void)setMarkedToFinishByParent:(BOOL)a3
{
  self->_markedToFinishByParent = a3;
}

- (BOOL)forceDecryptionAttempt
{
  return self->_forceDecryptionAttempt;
}

- (void)setForceDecryptionAttempt:(BOOL)a3
{
  self->_forceDecryptionAttempt = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentFetchOp);
  objc_storeStrong((id *)&self->_fetchInfosByOrder, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_fetchSource, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_recordReadySource, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong(&self->_fetchAggregatorCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordCache, 0);
}

@end