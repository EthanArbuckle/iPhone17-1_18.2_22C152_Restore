@interface CKDPCSCache
- (BOOL)beginContentAccess;
- (BOOL)hasStatusToReport;
- (BOOL)isContentDiscarded;
- (CKAccountOverrideInfo)accountOverrideInfo;
- (CKContainerID)containerID;
- (CKDLogicalDeviceContext)deviceContext;
- (CKDPCSCache)initWithDeviceContext:(id)a3 containerID:(id)a4 accountOverrideInfo:(id)a5 accountID:(id)a6 encryptionServiceName:(id)a7;
- (CKDPCSMemoryCache)recordMemoryCache;
- (CKDPCSMemoryCache)shareMemoryCache;
- (CKDPCSMemoryCache)zoneMemoryCache;
- (CKDPCSSQLCache)sqlCache;
- (NSMutableDictionary)outstandingFetches;
- (NSString)accountID;
- (NSString)encryptionServiceName;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)fetchQueue;
- (id)CKStatusReportArray;
- (id)_lockedGetOutstandingFetchForOperation:(id)a3 options:(unint64_t)a4 itemIDString:(id)a5;
- (unint64_t)accessCount;
- (void)_discardSQLCache;
- (void)_lockedAddOutstandingFetch:(id)a3 forItemIDString:(id)a4 databaseScope:(int64_t)a5;
- (void)_lockedCreatePCSCacheFetchOfItem:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 fetchCreator:(id)a6 withCompletionHandler:(id)a7;
- (void)_lockedFetchPCSForItem:(id)a3 memoryCache:(id)a4 forOperation:(id)a5 options:(unint64_t)a6 fetchCreator:(id)a7 withCompletionHandler:(id)a8;
- (void)_lockedGetSQLCacheWithCompletionHandler:(id)a3;
- (void)_lockedHandleMemoryFetchOfItem:(id)a3 pcsData:(id)a4 forOperation:(id)a5 options:(unint64_t)a6 fetchCreator:(id)a7 withCompletionHandler:(id)a8;
- (void)_lockedInvalidateAllOutstandingPCSFetchesForItemIDString:(id)a3 databaseScope:(int64_t)a4;
- (void)_lockedRemoveOutstandingFetch:(id)a3 forItemIDString:(id)a4 databaseScope:(int64_t)a5;
- (void)_setPCSData:(id)a3 forFetchedRecordID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)_setPCSData:(id)a3 forFetchedShareID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)_setPCSData:(id)a3 forFetchedZoneID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)_updateMemoryCacheWithPCSData:(id)a3 forItemWithID:(id)a4 inMemoryCache:(id)a5 databaseScope:(int64_t)a6 withCompletionHandler:(id)a7;
- (void)clearInvalidatedPCSSQLCacheEntriesWithSkipZonePCS:(BOOL)a3 completionHandler:(id)a4;
- (void)clearPCSCaches;
- (void)clearPCSMemoryCaches;
- (void)dealloc;
- (void)discardContentIfPossible;
- (void)endContentAccess;
- (void)fetchPCSForRecordWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6;
- (void)fetchPCSForShareWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6;
- (void)fetchPCSForZoneWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6;
- (void)getSQLCache:(id)a3;
- (void)removePCSDataForItemsInShareWithID:(id)a3;
- (void)removePCSDataForItemsInZoneWithID:(id)a3;
- (void)runMemoryCacheEviction;
- (void)setAccessCount:(unint64_t)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setOutstandingFetches:(id)a3;
- (void)updateMemoryCacheWithRecordPCSData:(id)a3 forRecordWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)updateMemoryCacheWithSharePCSData:(id)a3 forShareWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)updateMemoryCacheWithZonePCSData:(id)a3 forZoneWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6;
@end

@implementation CKDPCSCache

- (CKDPCSCache)initWithDeviceContext:(id)a3 containerID:(id)a4 accountOverrideInfo:(id)a5 accountID:(id)a6 encryptionServiceName:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v54 = a7;
  v55.receiver = self;
  v55.super_class = (Class)CKDPCSCache;
  v17 = [(CKDPCSCache *)&v55 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deviceContext, a3);
    objc_storeStrong((id *)&v18->_containerID, a4);
    objc_storeStrong((id *)&v18->_accountOverrideInfo, a5);
    objc_storeStrong((id *)&v18->_accountID, a6);
    objc_storeStrong((id *)&v18->_encryptionServiceName, a7);
    v19 = NSString;
    v22 = objc_msgSend_containerIdentifier(v14, v20, v21);
    objc_msgSend_stringWithFormat_(v19, v23, @"%@.%@", @"com.apple.CloudKit.PCSCache.fetchQueue", v22);
    id v24 = objc_claimAutoreleasedReturnValue();
    v27 = (const char *)objc_msgSend_UTF8String(v24, v25, v26);
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
    fetchQueue = v18->_fetchQueue;
    v18->_fetchQueue = (OS_dispatch_queue *)v29;

    dispatch_queue_set_specific((dispatch_queue_t)v18->_fetchQueue, "com.apple.CloudKit.PCSCache.fetchQueue", (void *)1, 0);
    v31 = NSString;
    v34 = objc_msgSend_containerIdentifier(v14, v32, v33);
    objc_msgSend_stringWithFormat_(v31, v35, @"%@.%@", @"com.apple.CloudKit.PCSCache.callbackQueue", v34);
    id v36 = objc_claimAutoreleasedReturnValue();
    v39 = (const char *)objc_msgSend_UTF8String(v36, v37, v38);
    v40 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v41 = dispatch_queue_create(v39, v40);
    callbackQueue = v18->_callbackQueue;
    v18->_callbackQueue = (OS_dispatch_queue *)v41;

    v18->_accessCount = 1;
    uint64_t v43 = objc_opt_new();
    recordMemoryCache = v18->_recordMemoryCache;
    v18->_recordMemoryCache = (CKDPCSMemoryCache *)v43;

    uint64_t v45 = objc_opt_new();
    zoneMemoryCache = v18->_zoneMemoryCache;
    v18->_zoneMemoryCache = (CKDPCSMemoryCache *)v45;

    objc_msgSend_setMinAge_(v18->_zoneMemoryCache, v47, v48, 300.0);
    uint64_t v49 = objc_opt_new();
    shareMemoryCache = v18->_shareMemoryCache;
    v18->_shareMemoryCache = (CKDPCSMemoryCache *)v49;

    uint64_t v51 = objc_opt_new();
    outstandingFetches = v18->_outstandingFetches;
    v18->_outstandingFetches = (NSMutableDictionary *)v51;
  }
  return v18;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "PCS cache deallocating: %p", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSCache;
  [(CKDPCSCache *)&v4 dealloc];
}

- (void)runMemoryCacheEviction
{
  objc_msgSend_runCacheEviction(self->_recordMemoryCache, a2, v2);
  objc_msgSend_runCacheEviction(self->_zoneMemoryCache, v4, v5);
  shareMemoryCache = self->_shareMemoryCache;
  objc_msgSend_runCacheEviction(shareMemoryCache, v6, v7);
}

- (void)_lockedGetSQLCacheWithCompletionHandler:(id)a3
{
  id v28 = a3;
  v6 = objc_msgSend_fetchQueue(self, v4, v5);
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = (void (**)(void, void, void))v28;
  if (v28)
  {
    sqlCache = self->_sqlCache;
    if (!sqlCache)
    {
      v9 = [CKDPCSSQLCache alloc];
      v12 = objc_msgSend_deviceContext(self, v10, v11);
      id v15 = objc_msgSend_containerID(self, v13, v14);
      v18 = objc_msgSend_accountOverrideInfo(self, v16, v17);
      uint64_t v21 = objc_msgSend_accountID(self, v19, v20);
      id v24 = objc_msgSend_encryptionServiceName(self, v22, v23);
      uint64_t v26 = (CKDPCSSQLCache *)objc_msgSend_initWithDeviceContext_containerID_accountOverrideInfo_accountID_encryptionServiceName_(v9, v25, (uint64_t)v12, v15, v18, v21, v24);
      v27 = self->_sqlCache;
      self->_sqlCache = v26;

      uint64_t v7 = (void (**)(void, void, void))v28;
      sqlCache = self->_sqlCache;
    }
    ((void (**)(id, CKDPCSSQLCache *, void))v7)[2](v28, sqlCache, 0);
    uint64_t v7 = (void (**)(void, void, void))v28;
  }
}

- (void)_discardSQLCache
{
  objc_super v4 = objc_msgSend_fetchQueue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D544F8;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)getSQLCache:(id)a3
{
  id v4 = a3;
  if (dispatch_get_specific("com.apple.CloudKit.PCSCache.fetchQueue"))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1C4D54818;
    v9[3] = &unk_1E64F0740;
    v9[4] = self;
    id v10 = v4;
    objc_msgSend__lockedGetSQLCacheWithCompletionHandler_(self, v5, (uint64_t)v9);
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = objc_msgSend_fetchQueue(self, v6, v7);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4D54670;
    block[3] = &unk_1E64F0768;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    dispatch_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_lockedHandleMemoryFetchOfItem:(id)a3 pcsData:(id)a4 forOperation:(id)a5 options:(unint64_t)a6 fetchCreator:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v21 = objc_msgSend_fetchQueue(self, v19, v20);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D54A7C;
  block[3] = &unk_1E64F07B8;
  id v33 = v17;
  unint64_t v34 = a6;
  id v28 = v15;
  id v29 = v14;
  v30 = self;
  id v31 = v16;
  id v32 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v18;
  id v25 = v14;
  id v26 = v15;
  dispatch_async(v21, block);
}

- (void)_lockedRemoveOutstandingFetch:(id)a3 forItemIDString:(id)a4 databaseScope:(int64_t)a5
{
  id v26 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_fetchQueue(self, v9, v10);
  dispatch_assert_queue_V2(v11);

  if (v26)
  {
    id v13 = objc_msgSend_stringWithFormat_(NSString, v12, @"%lu-%@", a5, v8);
    id v16 = objc_msgSend_outstandingFetches(self, v14, v15);
    id v18 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v13);

    if (v18)
    {
      objc_msgSend_removeObject_(v18, v19, (uint64_t)v26);
      if (!objc_msgSend_count(v18, v20, v21))
      {
        id v24 = objc_msgSend_outstandingFetches(self, v22, v23);
        objc_msgSend_removeObjectForKey_(v24, v25, (uint64_t)v13);
      }
    }
  }
}

- (id)_lockedGetOutstandingFetchForOperation:(id)a3 options:(unint64_t)a4 itemIDString:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v12 = objc_msgSend_fetchQueue(self, v10, v11);
  dispatch_assert_queue_V2(v12);

  if (v9)
  {
    uint64_t v15 = objc_msgSend_outstandingFetches(self, v13, v14);
    uint64_t v18 = objc_msgSend_databaseScope(v8, v16, v17);
    uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v19, @"%lu-%@", v18, v9);
    id v22 = objc_msgSend_objectForKeyedSubscript_(v15, v21, (uint64_t)v20);

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v23 = v22;
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v33, v37, 16);
    if (v25)
    {
      uint64_t v27 = v25;
      uint64_t v28 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v23);
          }
          v30 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_msgSend_canBeUsedForOperation_withOptions_(v30, v26, (uint64_t)v8, a4))
          {
            id v31 = v30;
            goto LABEL_12;
          }
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v33, v37, 16);
        if (v27) {
          continue;
        }
        break;
      }
    }
    id v31 = 0;
LABEL_12:
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (void)_lockedAddOutstandingFetch:(id)a3 forItemIDString:(id)a4 databaseScope:(int64_t)a5
{
  id v24 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_fetchQueue(self, v9, v10);
  dispatch_assert_queue_V2(v11);

  id v13 = objc_msgSend_stringWithFormat_(NSString, v12, @"%lu-%@", a5, v8);

  id v16 = objc_msgSend_outstandingFetches(self, v14, v15);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v13);

  if (!v18)
  {
    uint64_t v18 = objc_opt_new();
    id v22 = objc_msgSend_outstandingFetches(self, v20, v21);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v18, v13);
  }
  objc_msgSend_addObject_(v18, v19, (uint64_t)v24);
}

- (void)_lockedInvalidateAllOutstandingPCSFetchesForItemIDString:(id)a3 databaseScope:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = objc_msgSend_fetchQueue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v10, @"%lu-%@", a4, v6);
  uint64_t v14 = objc_msgSend_outstandingFetches(self, v12, v13);
  id v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v11);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = v16;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v24, v28, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend_setPcsDataInvalidated_(*(void **)(*((void *)&v24 + 1) + 8 * v23++), v20, 1);
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v24, v28, 16);
    }
    while (v21);
  }
}

- (void)_lockedCreatePCSCacheFetchOfItem:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 fetchCreator:(id)a6 withCompletionHandler:(id)a7
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(id, void *))a6;
  id v74 = a7;
  uint64_t v17 = objc_msgSend_databaseScope(v13, v15, v16);
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = sub_1C4D55B98;
  v87 = sub_1C4D55BA8;
  objc_msgSend__lockedGetOutstandingFetchForOperation_options_itemIDString_(self, v18, (uint64_t)v13, a5, v12);
  id v88 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = objc_msgSend_parentOperation(v13, v19, v20);
  if (v23)
  {
    long long v24 = objc_msgSend_operationID((void *)v84[5], v21, v22);
    long long v27 = objc_msgSend_operationID(v23, v25, v26);
    int isEqualToString = objc_msgSend_isEqualToString_(v24, v28, (uint64_t)v27);
  }
  else
  {
    int isEqualToString = 0;
  }
  v30 = objc_msgSend_operationID((void *)v84[5], v21, v22);
  long long v33 = objc_msgSend_operationID(v13, v31, v32);
  int v35 = objc_msgSend_isEqualToString_(v30, v34, (uint64_t)v33);

  uint64_t v38 = (void *)v84[5];
  if (!v38
    || (objc_msgSend_isPCSDataInvalidated(v38, v36, v37) & 1) != 0
    || ((objc_msgSend_isCancelled((void *)v84[5], v39, v40) | isEqualToString | v35) & 1) != 0)
  {
LABEL_13:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v54 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v90 = (uint64_t)v12;
      _os_log_debug_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_DEBUG, "Creating a new fetch operation for %{public}@", buf, 0xCu);
    }
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = sub_1C4D55C4C;
    v75[3] = &unk_1E64F0830;
    v78 = &v83;
    v75[4] = self;
    id v76 = v12;
    uint64_t v79 = v17;
    id v77 = v74;
    v14[2](v14, v75);

    goto LABEL_18;
  }
  uint64_t v43 = objc_msgSend_parentOperation((void *)v84[5], v41, v42);
  v46 = objc_msgSend_container(v43, v44, v45);
  uint64_t v49 = objc_msgSend_fetchAggregator(v46, v47, v48);

  if (objc_msgSend_fetchRequestForExistingOperation_isDependentOnOperation_(v49, v50, (uint64_t)v43, v13))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v51 = (id)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v64 = objc_msgSend_operationID((void *)v84[5], v52, v53);
      uint64_t v67 = objc_msgSend_operationID(v13, v65, v66);
      *(_DWORD *)buf = 138543618;
      uint64_t v90 = v64;
      __int16 v91 = 2114;
      uint64_t v92 = v67;
      v73 = (void *)v64;
      v68 = (void *)v67;
      _os_log_debug_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_DEBUG, "Not adding callback to existing fetch operation %{public}@ for operation %{public}@ as it would create a dependency cycle", buf, 0x16u);
    }
    goto LABEL_13;
  }

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  objc_super v55 = (id)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    v69 = objc_msgSend_operationID((void *)v84[5], v56, v57);
    v72 = objc_msgSend_operationID(v13, v70, v71);
    *(_DWORD *)buf = 138543618;
    uint64_t v90 = (uint64_t)v69;
    __int16 v91 = 2114;
    uint64_t v92 = (uint64_t)v72;
    _os_log_debug_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_DEBUG, "Adding callback to existing fetch operation %{public}@ for operation %{public}@", buf, 0x16u);
  }
  v60 = objc_msgSend_fetchGroup((void *)v84[5], v58, v59);
  v63 = objc_msgSend_callbackQueue(self, v61, v62);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D55BB0;
  block[3] = &unk_1E64F07E0;
  id v81 = v74;
  v82 = &v83;
  dispatch_group_notify(v60, v63, block);

LABEL_18:
  _Block_object_dispose(&v83, 8);
}

- (void)_lockedFetchPCSForItem:(id)a3 memoryCache:(id)a4 forOperation:(id)a5 options:(unint64_t)a6 fetchCreator:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v21 = objc_msgSend_fetchQueue(self, v19, v20);
  dispatch_assert_queue_V2(v21);

  uint64_t v24 = objc_msgSend_databaseScope(v16, v22, v23);
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1C4D562FC;
  v30[3] = &unk_1E64F0858;
  objc_copyWeak(v35, &location);
  id v25 = v14;
  id v31 = v25;
  id v26 = v16;
  id v32 = v26;
  v35[1] = (id)a6;
  id v27 = v17;
  id v33 = v27;
  id v28 = v18;
  id v34 = v28;
  objc_msgSend_getPCSDataFromCacheForID_databaseScope_withCompletionHandler_(v15, v29, (uint64_t)v25, v24, v30);

  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
}

- (void)fetchPCSForRecordWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDPCSCache.m", 329, @"Invalid record ID: %@", v11);
  }
  unint64_t v16 = a5 | 0x800;
  id v17 = objc_msgSend_fetchQueue(self, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D564E4;
  block[3] = &unk_1E64F08A8;
  id v24 = v11;
  id v25 = v12;
  id v27 = v13;
  unint64_t v28 = v16;
  id v26 = self;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v17, block);
}

- (void)fetchPCSForZoneWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDPCSCache.m", 351, @"Invalid zone ID: %@", v11);
  }
  unint64_t v16 = a5 | 0x400;
  id v17 = objc_msgSend_fetchQueue(self, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D56910;
  block[3] = &unk_1E64F08A8;
  id v24 = v11;
  id v25 = v12;
  id v27 = v13;
  unint64_t v28 = v16;
  id v26 = self;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v17, block);
}

- (void)fetchPCSForShareWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDPCSCache.m", 375, @"Invalid share ID: %@", v11);
  }
  unint64_t v16 = a5 | 0x1000;
  id v17 = objc_msgSend_fetchQueue(self, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D56D3C;
  block[3] = &unk_1E64F08A8;
  id v24 = v11;
  id v25 = v12;
  id v27 = v13;
  unint64_t v28 = v16;
  id v26 = self;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v17, block);
}

- (void)_setPCSData:(id)a3 forFetchedRecordID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v15 = a6;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v23, (uint64_t)a2, self, @"CKDPCSCache.m", 401, @"PCS data is of the wrong class: %@", v22);
    }
  }
  unint64_t v16 = objc_msgSend_fetchQueue(self, v13, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D57184;
  block[3] = &unk_1E64F08A8;
  id v25 = v12;
  id v26 = v11;
  id v28 = v15;
  int64_t v29 = a5;
  id v27 = self;
  id v17 = v15;
  id v18 = v11;
  id v19 = v12;
  dispatch_async(v16, block);
}

- (void)_setPCSData:(id)a3 forFetchedZoneID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v15 = a6;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v23, (uint64_t)a2, self, @"CKDPCSCache.m", 440, @"PCS data is of the wrong class: %@", v22);
    }
  }
  unint64_t v16 = objc_msgSend_fetchQueue(self, v13, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D57800;
  block[3] = &unk_1E64F08A8;
  id v25 = v12;
  id v26 = v11;
  id v28 = v15;
  int64_t v29 = a5;
  id v27 = self;
  id v17 = v15;
  id v18 = v11;
  id v19 = v12;
  dispatch_async(v16, block);
}

- (void)_setPCSData:(id)a3 forFetchedShareID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v15 = a6;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v23, (uint64_t)a2, self, @"CKDPCSCache.m", 479, @"PCS data is of the wrong class: %@", v22);
    }
  }
  unint64_t v16 = objc_msgSend_fetchQueue(self, v13, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D57EAC;
  block[3] = &unk_1E64F08A8;
  id v25 = v12;
  id v26 = v11;
  id v28 = v15;
  int64_t v29 = a5;
  id v27 = self;
  id v17 = v15;
  id v18 = v11;
  id v19 = v12;
  dispatch_async(v16, block);
}

- (void)_updateMemoryCacheWithPCSData:(id)a3 forItemWithID:(id)a4 inMemoryCache:(id)a5 databaseScope:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  objc_msgSend_sqliteRepresentation(a4, v14, v15);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forItemID_databaseScope_withCompletionHandler_(v12, v16, (uint64_t)v13, v17, a6, v11);
}

- (void)updateMemoryCacheWithZonePCSData:(id)a3 forZoneWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v21 = a3;
  id v11 = a4;
  id v14 = a6;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v20, (uint64_t)a2, self, @"CKDPCSCache.m", 524, @"PCS data is of the wrong class: %@", v19);
    }
  }
  uint64_t v15 = objc_msgSend_zoneMemoryCache(self, v12, v13);
  objc_msgSend__updateMemoryCacheWithPCSData_forItemWithID_inMemoryCache_databaseScope_withCompletionHandler_(self, v16, (uint64_t)v21, v11, v15, a5, v14);
}

- (void)updateMemoryCacheWithRecordPCSData:(id)a3 forRecordWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v21 = a3;
  id v11 = a4;
  id v14 = a6;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v20, (uint64_t)a2, self, @"CKDPCSCache.m", 529, @"PCS data is of the wrong class: %@", v19);
    }
  }
  uint64_t v15 = objc_msgSend_recordMemoryCache(self, v12, v13);
  objc_msgSend__updateMemoryCacheWithPCSData_forItemWithID_inMemoryCache_databaseScope_withCompletionHandler_(self, v16, (uint64_t)v21, v11, v15, a5, v14);
}

- (void)updateMemoryCacheWithSharePCSData:(id)a3 forShareWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v21 = a3;
  id v11 = a4;
  id v14 = a6;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v20, (uint64_t)a2, self, @"CKDPCSCache.m", 534, @"PCS data is of the wrong class: %@", v19);
    }
  }
  uint64_t v15 = objc_msgSend_shareMemoryCache(self, v12, v13);
  objc_msgSend__updateMemoryCacheWithPCSData_forItemWithID_inMemoryCache_databaseScope_withCompletionHandler_(self, v16, (uint64_t)v21, v11, v15, a5, v14);
}

- (void)removePCSDataForItemsInZoneWithID:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_fetchQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D588D8;
  v9[3] = &unk_1E64F0948;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)removePCSDataForItemsInShareWithID:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_fetchQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D58AD8;
  v9[3] = &unk_1E64F0948;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (BOOL)hasStatusToReport
{
  id v4 = objc_msgSend_zoneMemoryCache(self, a2, v2);
  if (objc_msgSend_hasStatusToReport(v4, v5, v6))
  {
    char hasStatusToReport = 1;
  }
  else
  {
    id v10 = objc_msgSend_recordMemoryCache(self, v7, v8);
    if (objc_msgSend_hasStatusToReport(v10, v11, v12))
    {
      char hasStatusToReport = 1;
    }
    else
    {
      uint64_t v15 = objc_msgSend_shareMemoryCache(self, v13, v14);
      if (objc_msgSend_hasStatusToReport(v15, v16, v17)) {
        char hasStatusToReport = 1;
      }
      else {
        char hasStatusToReport = objc_msgSend_hasStatusToReport(self->_sqlCache, v18, v19);
      }
    }
  }

  return hasStatusToReport;
}

- (id)CKStatusReportArray
{
  v3 = objc_opt_new();
  id v4 = self->_sqlCache;
  uint64_t v7 = objc_msgSend_fetchQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D58DB4;
  block[3] = &unk_1E64F0120;
  void block[4] = self;
  id v8 = v3;
  id v14 = v8;
  uint64_t v15 = v4;
  id v9 = v4;
  dispatch_sync(v7, block);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

- (BOOL)beginContentAccess
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v5 = objc_msgSend_accessCount(v2, v3, v4);
  objc_msgSend_setAccessCount_(v2, v6, v5 + 1);
  v2->_contentDiscarded = 0;
  objc_sync_exit(v2);

  return 1;
}

- (void)endContentAccess
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = objc_msgSend_accessCount(obj, v2, v3);
  objc_msgSend_setAccessCount_(obj, v5, v4 - 1);
  objc_sync_exit(obj);
}

- (void)discardContentIfPossible
{
  obj = self;
  objc_sync_enter(obj);
  if (!objc_msgSend_accessCount(obj, v2, v3))
  {
    obj->_contentDiscarded = 1;
    objc_msgSend__discardSQLCache(obj, v4, v5);
    objc_msgSend_clearPCSMemoryCaches(obj, v6, v7);
  }
  objc_sync_exit(obj);
}

- (BOOL)isContentDiscarded
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL contentDiscarded = v2->_contentDiscarded;
  objc_sync_exit(v2);

  return contentDiscarded;
}

- (CKDPCSSQLCache)sqlCache
{
  return self->_sqlCache;
}

- (CKDPCSMemoryCache)recordMemoryCache
{
  return self->_recordMemoryCache;
}

- (CKDPCSMemoryCache)zoneMemoryCache
{
  return self->_zoneMemoryCache;
}

- (CKDPCSMemoryCache)shareMemoryCache
{
  return self->_shareMemoryCache;
}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (CKAccountOverrideInfo)accountOverrideInfo
{
  return self->_accountOverrideInfo;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)encryptionServiceName
{
  return self->_encryptionServiceName;
}

- (unint64_t)accessCount
{
  return self->_accessCount;
}

- (void)setAccessCount:(unint64_t)a3
{
  self->_accessCount = a3;
}

- (NSMutableDictionary)outstandingFetches
{
  return self->_outstandingFetches;
}

- (void)setOutstandingFetches:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_outstandingFetches, 0);
  objc_storeStrong((id *)&self->_encryptionServiceName, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountOverrideInfo, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_shareMemoryCache, 0);
  objc_storeStrong((id *)&self->_zoneMemoryCache, 0);
  objc_storeStrong((id *)&self->_recordMemoryCache, 0);
  objc_storeStrong((id *)&self->_sqlCache, 0);
}

- (void)clearPCSCaches
{
  uint64_t v4 = objc_msgSend_fetchQueue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D5942C;
  block[3] = &unk_1E64F05C8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)clearPCSMemoryCaches
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Clearing memory-based PCS caches", v19, 2u);
  }
  uint64_t v6 = objc_msgSend_zoneMemoryCache(self, v4, v5);
  objc_msgSend_clearCache(v6, v7, v8);

  id v11 = objc_msgSend_recordMemoryCache(self, v9, v10);
  objc_msgSend_clearCache(v11, v12, v13);

  unint64_t v16 = objc_msgSend_shareMemoryCache(self, v14, v15);
  objc_msgSend_clearCache(v16, v17, v18);
}

- (void)clearInvalidatedPCSSQLCacheEntriesWithSkipZonePCS:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = @"NO";
    if (v4) {
      uint64_t v10 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v10;
    _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "Clearing invalidated PCS SQL cache entries. Skipping zone pcs: %@", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4D59828;
  v11[3] = &unk_1E64F0998;
  BOOL v13 = v4;
  id v12 = v6;
  id v8 = v6;
  objc_msgSend_getSQLCache_(self, v9, (uint64_t)v11);
}

@end