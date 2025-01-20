@interface CKDPCSSQLCache
+ (void)evictPCSSQLCachesForKnownContainers;
- (BOOL)hasStatusToReport;
- (CKDPCSSQLCache)initWithDeviceContext:(id)a3 containerID:(id)a4 accountOverrideInfo:(id)a5 accountID:(id)a6 encryptionServiceName:(id)a7;
- (id)CKStatusReportArray;
- (id)_lockedFetchPCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5;
- (void)_lockedSetPCSData:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 forID:(id)a6;
- (void)_setPCSData:(id)a3 forItemWithID:(id)a4 databaseScope:(int64_t)a5 itemType:(unint64_t)a6 withCompletionHandler:(id)a7;
- (void)clearCache;
- (void)clearInvalidatedCacheEntriesWithSkipZonePCS:(BOOL)a3 completionHandler:(id)a4;
- (void)fetchPCSDataForRecordWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)fetchPCSDataForShareWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)fetchPCSDataForZoneWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)removePCSDataForItemsInShareWithID:(id)a3 withCompletionHandler:(id)a4;
- (void)removePCSDataForItemsInZoneWithID:(id)a3 withCompletionHandler:(id)a4;
- (void)setRecordPCSData:(id)a3 forRecordWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)setSharePCSData:(id)a3 forShareWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)setZonePCSData:(id)a3 forZoneWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6;
@end

@implementation CKDPCSSQLCache

+ (void)evictPCSSQLCachesForKnownContainers
{
  objc_msgSend_defaultContext(CKDLogicalDeviceContext, a2, v2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_deviceScopedDatabase(v7, v3, v4);
  objc_msgSend_enumerateGroupsInDatabase_block_(CKDPCSSQLCacheTableGroup, v6, (uint64_t)v5, &unk_1F20449B0);
}

- (CKDPCSSQLCache)initWithDeviceContext:(id)a3 containerID:(id)a4 accountOverrideInfo:(id)a5 accountID:(id)a6 encryptionServiceName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)CKDPCSSQLCache;
  v17 = [(CKDPCSSQLCache *)&v32 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_containerID, a4);
    objc_storeStrong((id *)&v18->_accountID, a6);
    objc_storeStrong((id *)&v18->_encryptionServiceName, a7);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("PCSSQLCache", v19);
    asyncQueue = v18->_asyncQueue;
    v18->_asyncQueue = (OS_dispatch_queue *)v20;

    v23 = objc_msgSend_groupNameForContainerID_accountOverrideInfo_(CKDPCSSQLCacheTableGroup, v22, (uint64_t)v13, v14);
    v24 = v18->_asyncQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1C4FDE69C;
    v27[3] = &unk_1E64F0DF0;
    id v28 = v12;
    id v29 = v13;
    id v30 = v23;
    v31 = v18;
    id v25 = v23;
    dispatch_async(v24, v27);
  }
  return v18;
}

- (BOOL)hasStatusToReport
{
  return self->_cacheRequestCount != 0;
}

- (id)_lockedFetchPCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5
{
  atomic_fetch_add_explicit((atomic_uint *volatile)&self->_cacheRequestCount, 1u, memory_order_relaxed);
  id result = (id)objc_msgSend_PCSDataForID_databaseScope_itemType_accountID_serviceName_(self->_table, a2, (uint64_t)a3, a4, a5, self->_accountID, self->_encryptionServiceName);
  if (result) {
    atomic_fetch_add_explicit((atomic_uint *volatile)&self->_cacheHitCount, 1u, memory_order_relaxed);
  }
  return result;
}

- (void)fetchPCSDataForRecordWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  asyncQueue = self->_asyncQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4FDE94C;
  v13[3] = &unk_1E64F1A10;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(asyncQueue, v13);
}

- (void)fetchPCSDataForZoneWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  asyncQueue = self->_asyncQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4FDEAA4;
  v13[3] = &unk_1E64F1A10;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(asyncQueue, v13);
}

- (void)fetchPCSDataForShareWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  asyncQueue = self->_asyncQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4FDEBFC;
  v13[3] = &unk_1E64F1A10;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(asyncQueue, v13);
}

- (void)_lockedSetPCSData:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 forID:(id)a6
{
  id v61 = a3;
  id v12 = a6;
  if (!v61)
  {
    table = self->_table;
    objc_msgSend_sqliteRepresentation(v12, v10, v11);
    id v13 = (CKDPCSSQLCacheEntry *)objc_claimAutoreleasedReturnValue();
    id v27 = (id)objc_msgSend_deletePCSDataForID_databaseScope_itemType_accountID_serviceName_(table, v26, (uint64_t)v13, a4, a5, self->_accountID, self->_encryptionServiceName);
    goto LABEL_14;
  }
  id v13 = objc_alloc_init(CKDPCSSQLCacheEntry);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v16 = objc_msgSend_zoneID(v61, v28, v29);
      if (objc_msgSend_specialContainerType(self->_containerID, v30, v31) != 5)
      {
LABEL_11:
        v24 = 0;
        v19 = 0;
        goto LABEL_13;
      }
      objc_super v32 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v22, v23, 1209600.0);
      objc_msgSend_setExpirationDate_(v13, v33, (uint64_t)v32);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = 0;
        v19 = 0;
        int64_t v16 = 0;
        goto LABEL_13;
      }
      objc_super v32 = objc_msgSend_shareID(v61, v22, v23);
      int64_t v16 = objc_msgSend_zoneID(v32, v34, v35);
    }

    goto LABEL_11;
  }
  int64_t v16 = objc_msgSend_zoneID(v61, v14, v15);
  v19 = objc_msgSend_shareID(v61, v17, v18);
  v24 = objc_msgSend_parentID(v61, v20, v21);
LABEL_13:
  v36 = objc_msgSend_sqliteRepresentation(v12, v22, v23);
  objc_msgSend_setIdentifier_(v13, v37, (uint64_t)v36);

  v39 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v38, a4);
  objc_msgSend_setDatabaseScope_(v13, v40, (uint64_t)v39);

  v42 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v41, a5);
  objc_msgSend_setItemType_(v13, v43, (uint64_t)v42);

  objc_msgSend_setCKDPCSData_(v13, v44, (uint64_t)v61);
  objc_msgSend_setAccountID_(v13, v45, (uint64_t)self->_accountID);
  objc_msgSend_setServiceName_(v13, v46, (uint64_t)self->_encryptionServiceName);
  v49 = objc_msgSend_sqliteRepresentation(v16, v47, v48);
  objc_msgSend_setZoneID_(v13, v50, (uint64_t)v49);

  v53 = objc_msgSend_sqliteRepresentation(v19, v51, v52);
  objc_msgSend_setShareID_(v13, v54, (uint64_t)v53);

  v57 = objc_msgSend_sqliteRepresentation(v24, v55, v56);
  objc_msgSend_setParentID_(v13, v58, (uint64_t)v57);

  id v60 = (id)objc_msgSend_insertObject_orUpdateProperties_label_(self->_table, v59, (uint64_t)v13, 0, off_1E64F8478);
LABEL_14:
}

- (void)_setPCSData:(id)a3 forItemWithID:(id)a4 databaseScope:(int64_t)a5 itemType:(unint64_t)a6 withCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  asyncQueue = self->_asyncQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4FDF07C;
  v19[3] = &unk_1E64F8498;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a5;
  unint64_t v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_barrier_async(asyncQueue, v19);
}

- (void)setZonePCSData:(id)a3 forZoneWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
}

- (void)setRecordPCSData:(id)a3 forRecordWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
}

- (void)setSharePCSData:(id)a3 forShareWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
}

- (void)removePCSDataForItemsInZoneWithID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FDF1C4;
  block[3] = &unk_1E64F0FA0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(asyncQueue, block);
}

- (void)removePCSDataForItemsInShareWithID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FDF320;
  block[3] = &unk_1E64F0FA0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(asyncQueue, block);
}

- (void)clearCache
{
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FDF494;
  block[3] = &unk_1E64F05C8;
  void block[4] = self;
  dispatch_barrier_async(asyncQueue, block);
}

- (void)clearInvalidatedCacheEntriesWithSkipZonePCS:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FDF53C;
  block[3] = &unk_1E64F0A80;
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_async(asyncQueue, block);
}

- (id)CKStatusReportArray
{
  uint64_t v4 = objc_opt_new();
  uint64_t cacheRequestCount = self->_cacheRequestCount;
  if (cacheRequestCount) {
    objc_msgSend_stringWithFormat_(NSString, v3, @"[Hit rate %0.2f%% (%lu/%lu)]", (float)((float)self->_cacheHitCount / (float)cacheRequestCount) * 100.0, self->_cacheHitCount, cacheRequestCount);
  }
  else {
  id v6 = objc_msgSend_stringWithFormat_(NSString, v3, @"[Hit rate %0.2f%% (%lu/%lu)]", 0, self->_cacheHitCount, cacheRequestCount);
  }
  objc_msgSend_addObject_(v4, v7, (uint64_t)v6);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_cacheGroupName, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_cacheGroup, 0);
  objc_storeStrong((id *)&self->_encryptionServiceName, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end