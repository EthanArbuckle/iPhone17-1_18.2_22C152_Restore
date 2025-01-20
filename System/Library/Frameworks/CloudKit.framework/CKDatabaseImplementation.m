@interface CKDatabaseImplementation
- (CKContainerImplementation)containerImplementation;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)underlyingDispatchQueue;
- (id)CKPropertiesDescription;
- (id)CKStatusReportArray;
- (id)description;
- (id)initInternalWithContainerImplementation:(id)a3 scope:(int64_t)a4;
- (int64_t)scope;
- (unint64_t)countAssetCacheItems;
- (void)_addOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 isConvenience:(BOOL)a6;
- (void)_scheduleConvenienceOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5;
- (void)addOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5;
- (void)checkSupportedDeviceCapabilitiesInZone:(id)a3 desiredCapabilities:(id)a4 options:(id)a5 wrappingDatabase:(id)a6 convenienceConfiguration:(id)a7 completionHandler:(id)a8;
- (void)clearAssetCache;
- (void)clearAuthTokensForRecordWithID:(id)a3;
- (void)clearCacheEntriesForRecord:(id)a3 completionHandler:(id)a4;
- (void)clearCacheEntriesForZone:(id)a3 completionHandler:(id)a4;
- (void)clearCachesWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)clearInvalidatedPCSCacheEntriesIfNeeded;
- (void)clearRecordCache;
- (void)deleteRecordWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)deleteRecordZoneWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)deleteSubscriptionWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)fetchAllRecordZonesWithWrappingDatabase:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5;
- (void)fetchAllSubscriptionsWithWrappingDatabase:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5;
- (void)fetchPCSFromCacheForRecordWithID:(id)a3 completionHandler:(id)a4;
- (void)fetchPCSFromCacheForShareWithID:(id)a3 completionHandler:(id)a4;
- (void)fetchPCSFromCacheForZoneWithID:(id)a3 localCacheOnly:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchRecordWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordZoneWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)fetchSubscriptionWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)getCorruptRecordsForAllZonesWithCompletionHandler:(id)a3;
- (void)performQuery:(id)a3 inZoneWithID:(id)a4 wrappingDatabase:(id)a5 convenienceConfiguration:(id)a6 completionHandler:(id)a7;
- (void)saveRecord:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)saveRecordZone:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)saveSubscription:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)showAssetCache;
@end

@implementation CKDatabaseImplementation

- (int64_t)scope
{
  return self->_scope;
}

- (id)initInternalWithContainerImplementation:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKDatabaseImplementation;
  v7 = [(CKDatabaseImplementation *)&v29 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_containerImplementation, v6);
    v8->_scope = a4;
    v9 = NSString;
    v13 = objc_msgSend_containerIdentifier(v6, v10, v11, v12);
    objc_msgSend_stringWithFormat_(v9, v14, @"%@.%@", v15, @"com.apple.cloudkit.database-queue", v13);
    id v16 = objc_claimAutoreleasedReturnValue();
    v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create(v20, v21);
    underlyingDispatchQueue = v8->_underlyingDispatchQueue;
    v8->_underlyingDispatchQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = objc_opt_new();
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = (NSOperationQueue *)v24;

    objc_msgSend_setUnderlyingQueue_(v8->_operationQueue, v26, (uint64_t)v8->_underlyingDispatchQueue, v27);
  }

  return v8;
}

- (id)CKPropertiesDescription
{
  v5 = NSString;
  unint64_t v6 = objc_msgSend_scope(self, a2, v2, v3);
  if (v6 > 4) {
    v10 = @"INVALID_SCOPE";
  }
  else {
    v10 = off_1E5464CB0[v6];
  }
  uint64_t v11 = objc_msgSend_containerImplementation(self, v7, v8, v9);
  v14 = objc_msgSend_stringWithFormat_(v5, v12, @"databaseScope=%@, containerImplementation=%@", v13, v10, v11);

  return v14;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDatabaseImplementation *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (void)_addOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 isConvenience:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = [CKException alloc];
    id v39 = (id)objc_msgSend_initWithCode_format_(v37, v38, 12, @"Only CKDatabaseOperations must be submitted to a CKDatabase");
    objc_exception_throw(v39);
  }
  objc_msgSend_databaseScope(self, v13, v14, v15);
  objc_msgSend_setDatabase_(v10, v16, (uint64_t)v11, v17);
  objc_msgSend_applyConvenienceConfiguration_(v10, v18, (uint64_t)v12, v19);
  v23 = objc_msgSend_containerImplementation(self, v20, v21, v22);
  uint64_t v27 = v23;
  if (!v6) {
    goto LABEL_9;
  }
  if (!v23)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v28 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v32 = v28;
      v36 = objc_msgSend_operationID(v10, v33, v34, v35);
      int v40 = 138412290;
      v41 = v36;
      _os_log_error_impl(&dword_18AF10000, v32, OS_LOG_TYPE_ERROR, "No container found while enqueuing CKDatabase convenience operation %@", (uint8_t *)&v40, 0xCu);
    }
LABEL_9:
    objc_super v29 = objc_msgSend_operationQueue(self, v24, v25, v26);
    objc_msgSend_addOperation_(v29, v30, (uint64_t)v10, v31);

    goto LABEL_10;
  }
  objc_msgSend__addPreparedConvenienceOperation_(v23, v24, (uint64_t)v10, v26);
LABEL_10:
}

- (void)addOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5
{
}

- (unint64_t)countAssetCacheItems
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = -1;
  v5 = objc_msgSend_containerImplementation(self, a2, v2, v3);
  BOOL v6 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B10DBAC;
  v9[3] = &unk_1E5464B50;
  v9[4] = self;
  v9[5] = &v10;
  if (v5) {
    sub_18AF3C510(v5, 1, (void *)1, 0, &unk_1ED7EF3B8, v9);
  }

  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)clearAssetCache
{
  v5 = objc_msgSend_containerImplementation(self, a2, v2, v3);
  BOOL v6 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B10DE9C;
  v7[3] = &unk_1E5461300;
  v7[4] = self;
  if (v5) {
    sub_18AF3C510(v5, 1, (void *)1, 0, &unk_1ED7F0018, v7);
  }
}

- (void)showAssetCache
{
  v5 = objc_msgSend_containerImplementation(self, a2, v2, v3);
  BOOL v6 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B10E12C;
  v7[3] = &unk_1E5461300;
  v7[4] = self;
  if (v5) {
    sub_18AF3C510(v5, 0, (void *)1, 0, &unk_1ED7F01B8, v7);
  }
}

- (void)clearRecordCache
{
  v5 = objc_msgSend_containerImplementation(self, a2, v2, v3);
  BOOL v6 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B10E2D0;
  v7[3] = &unk_1E5461300;
  v7[4] = self;
  if (v5) {
    sub_18AF3C510(v5, 0, (void *)1, 0, &unk_1ED7F0238, v7);
  }
}

- (void)clearAuthTokensForRecordWithID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_containerImplementation(self, v5, v6, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B10E444;
  v13[3] = &unk_1E5460240;
  id v14 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B10E534;
  v10[3] = &unk_1E5461240;
  id v11 = v14;
  uint64_t v12 = self;
  id v9 = v14;
  if (v8) {
    sub_18AF3C510(v8, 0, (void *)1, 0, v13, v10);
  }
}

- (void)getCorruptRecordsForAllZonesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_containerImplementation(self, v5, v6, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B10E6FC;
  v10[3] = &unk_1E54611A0;
  id v11 = v4;
  id v9 = v4;
  if (v8) {
    sub_18AF3C510(v8, 0, (void *)1, 0, &unk_1ED7F0358, v10);
  }
}

- (void)clearCachesWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v10 = objc_msgSend_containerImplementation(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B10E884;
  v12[3] = &unk_1E5464B78;
  id v13 = v6;
  unint64_t v14 = a3;
  v12[4] = self;
  id v11 = v6;
  if (v10) {
    sub_18AF3C510(v10, 0, (void *)1, 0, &unk_1ED7F03B8, v12);
  }
}

- (void)clearCacheEntriesForRecord:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = objc_msgSend_containerImplementation(self, v8, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B10EA8C;
  v14[3] = &unk_1E5461828;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  if (v11) {
    sub_18AF3C510(v11, 0, (void *)1, 0, &unk_1ED7F0438, v14);
  }
}

- (void)clearCacheEntriesForZone:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = objc_msgSend_containerImplementation(self, v8, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B10EC90;
  v14[3] = &unk_1E5461828;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  if (v11) {
    sub_18AF3C510(v11, 0, (void *)1, 0, &unk_1ED7F0498, v14);
  }
}

- (void)fetchPCSFromCacheForZoneWithID:(id)a3 localCacheOnly:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v13 = objc_msgSend_containerImplementation(self, v10, v11, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B10EEA4;
  v16[3] = &unk_1E5464BA0;
  id v17 = v8;
  uint64_t v18 = self;
  BOOL v20 = a4;
  id v19 = v9;
  id v14 = v9;
  id v15 = v8;
  if (v13) {
    sub_18AF3C510(v13, 0, (void *)1, 0, &unk_1ED7F0518, v16);
  }
}

- (void)fetchPCSFromCacheForShareWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_containerImplementation(self, v8, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B10F0AC;
  v14[3] = &unk_1E5461828;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  if (v11) {
    sub_18AF3C510(v11, 0, (void *)1, 0, &unk_1ED7F0618, v14);
  }
}

- (void)fetchPCSFromCacheForRecordWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_containerImplementation(self, v8, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B10F2B0;
  v14[3] = &unk_1E5461828;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  if (v11) {
    sub_18AF3C510(v11, 0, (void *)1, 0, &unk_1ED7F0738, v14);
  }
}

- (void)clearInvalidatedPCSCacheEntriesIfNeeded
{
  id v4 = objc_msgSend_containerImplementation(self, a2, v2, v3);
  if (v4)
  {
    id v5 = v4;
    sub_18AF3C510(v4, 0, (void *)1, 0, &unk_1ED7F0878, &unk_1ED7F0938);
    id v4 = v5;
  }
}

- (id)CKStatusReportArray
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = NSString;
  id v8 = objc_msgSend_operationQueue(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_operationCount(v8, v9, v10, v11);
  id v16 = objc_msgSend_operationQueue(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_maxConcurrentOperationCount(v16, v17, v18, v19);
  v23 = objc_msgSend_stringWithFormat_(v4, v21, @"%@, %lu/%ld operations", v22, self, v12, v20);
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23, v25);

  objc_super v29 = objc_msgSend_operationQueue(self, v26, v27, v28);
  uint64_t v33 = objc_msgSend_operationCount(v29, v30, v31, v32);

  if (v33)
  {
    objc_msgSend_addObject_(v3, v34, @"\nOperations: {", v35);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v39 = objc_msgSend_operationQueue(self, v36, v37, v38);
    v43 = objc_msgSend_operations(v39, v40, v41, v42);

    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v57, (uint64_t)v61, 16);
    if (v45)
    {
      uint64_t v48 = v45;
      uint64_t v49 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v58 != v49) {
            objc_enumerationMutation(v43);
          }
          v51 = objc_msgSend_stringWithFormat_(NSString, v46, @"\t%@", v47, *(void *)(*((void *)&v57 + 1) + 8 * i));
          objc_msgSend_addObject_(v3, v52, (uint64_t)v51, v53);
        }
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v57, (uint64_t)v61, 16);
      }
      while (v48);
    }

    objc_msgSend_addObject_(v3, v54, @"}", v55);
  }

  return v3;
}

- (void)_scheduleConvenienceOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v16 = a3;
  objc_msgSend_databaseScope(self, v10, v11, v12);
  objc_msgSend_configureConvenience_(v16, v13, (uint64_t)v8, v14);
  objc_msgSend__addOperation_wrappingDatabase_convenienceConfiguration_isConvenience_(self, v15, (uint64_t)v16, (uint64_t)v9, v8, 1);
}

- (void)fetchRecordWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v42 = 0;
  char v14 = _CKCheckArgument((uint64_t)"recordID", v10, 0, 1, 0, &v42);
  id v15 = v42;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    uint64_t v28 = [CKException alloc];
    uint64_t v32 = objc_msgSend_code(v16, v29, v30, v31);
    v36 = objc_msgSend_localizedDescription(v16, v33, v34, v35);
    id v38 = (id)objc_msgSend_initWithCode_format_(v28, v37, v32, @"%@", v36);

    objc_exception_throw(v38);
  }

  id v17 = [CKFetchRecordsOperation alloc];
  v43[0] = v10;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v43, 1);
  uint64_t v22 = objc_msgSend_initWithRecordIDs_(v17, v20, (uint64_t)v19, v21);

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_18B10F8E4;
  v39[3] = &unk_1E5464C40;
  id v40 = v10;
  id v41 = v13;
  id v23 = v13;
  id v24 = v10;
  objc_msgSend_setFetchRecordsCompletionBlock_(v22, v25, (uint64_t)v39, v26);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v27, (uint64_t)v22, (uint64_t)v11, v12);
}

- (void)saveRecord:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v41 = 0;
  char v14 = _CKCheckArgument((uint64_t)"record", v10, 0, 0, 0, &v41);
  id v15 = v41;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    uint64_t v27 = [CKException alloc];
    uint64_t v31 = objc_msgSend_code(v16, v28, v29, v30);
    uint64_t v35 = objc_msgSend_localizedDescription(v16, v32, v33, v34);
    id v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, @"%@", v35);

    objc_exception_throw(v37);
  }

  id v17 = [CKModifyRecordsOperation alloc];
  v42[0] = v10;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v42, 1);
  uint64_t v21 = objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v17, v20, (uint64_t)v19, 0);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_18B10FCA8;
  v38[3] = &unk_1E5464BC8;
  id v39 = v10;
  id v40 = v13;
  id v22 = v13;
  id v23 = v10;
  objc_msgSend_setModifyRecordsCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);
}

- (void)deleteRecordWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v41 = 0;
  char v14 = _CKCheckArgument((uint64_t)"recordID", v10, 0, 1, 0, &v41);
  id v15 = v41;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    uint64_t v27 = [CKException alloc];
    uint64_t v31 = objc_msgSend_code(v16, v28, v29, v30);
    uint64_t v35 = objc_msgSend_localizedDescription(v16, v32, v33, v34);
    id v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, @"%@", v35);

    objc_exception_throw(v37);
  }

  id v17 = [CKModifyRecordsOperation alloc];
  v42[0] = v10;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v42, 1);
  uint64_t v21 = objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v17, v20, 0, (uint64_t)v19);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_18B11005C;
  v38[3] = &unk_1E5464BC8;
  id v39 = v10;
  id v40 = v13;
  id v22 = v13;
  id v23 = v10;
  objc_msgSend_setModifyRecordsCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);
}

- (void)performQuery:(id)a3 inZoneWithID:(id)a4 wrappingDatabase:(id)a5 convenienceConfiguration:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v51 = 0;
  char v17 = _CKCheckArgument((uint64_t)"query", v12, 0, 0, 0, &v51);
  id v18 = v51;
  uint64_t v19 = v18;
  if ((v17 & 1) == 0)
  {
    uint64_t v35 = [CKException alloc];
    uint64_t v39 = objc_msgSend_code(v19, v36, v37, v38);
    v43 = objc_msgSend_localizedDescription(v19, v40, v41, v42);
    id v45 = (id)objc_msgSend_initWithCode_format_(v35, v44, v39, @"%@", v43);

    objc_exception_throw(v45);
  }

  uint64_t v20 = objc_opt_new();
  uint64_t v21 = [CKQueryOperation alloc];
  id v24 = objc_msgSend_initWithQuery_(v21, v22, (uint64_t)v12, v23);
  objc_msgSend_setZoneID_(v24, v25, (uint64_t)v13, v26);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_18B110410;
  v49[3] = &unk_1E5464BF0;
  id v27 = v20;
  id v50 = v27;
  objc_msgSend_setRecordMatchedBlock_(v24, v28, (uint64_t)v49, v29);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_18B1104BC;
  v46[3] = &unk_1E5464C18;
  id v47 = v27;
  id v48 = v16;
  id v30 = v27;
  id v31 = v16;
  objc_msgSend_setQueryCompletionBlock_(v24, v32, (uint64_t)v46, v33);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v34, (uint64_t)v24, (uint64_t)v14, v15);
}

- (void)fetchAllRecordZonesWithWrappingDatabase:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = objc_msgSend_fetchAllRecordZonesOperation(CKFetchRecordZonesOperation, v11, v12, v13);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B1105D4;
  v19[3] = &unk_1E5461850;
  id v20 = v8;
  id v15 = v8;
  objc_msgSend_setFetchRecordZonesCompletionBlock_(v14, v16, (uint64_t)v19, v17);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v18, (uint64_t)v14, (uint64_t)v10, v9);
}

- (void)fetchRecordZoneWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v42 = 0;
  char v14 = _CKCheckArgument((uint64_t)"zoneID", v10, 0, 1, 0, &v42);
  id v15 = v42;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    uint64_t v28 = [CKException alloc];
    uint64_t v32 = objc_msgSend_code(v16, v29, v30, v31);
    v36 = objc_msgSend_localizedDescription(v16, v33, v34, v35);
    id v38 = (id)objc_msgSend_initWithCode_format_(v28, v37, v32, @"%@", v36);

    objc_exception_throw(v38);
  }

  uint64_t v17 = [CKFetchRecordZonesOperation alloc];
  v43[0] = v10;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v43, 1);
  id v22 = objc_msgSend_initWithRecordZoneIDs_(v17, v20, (uint64_t)v19, v21);

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_18B110874;
  v39[3] = &unk_1E5464C40;
  id v40 = v10;
  id v41 = v13;
  id v23 = v10;
  id v24 = v13;
  objc_msgSend_setFetchRecordZonesCompletionBlock_(v22, v25, (uint64_t)v39, v26);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v27, (uint64_t)v22, (uint64_t)v11, v12);
}

- (void)saveRecordZone:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v41 = 0;
  char v14 = _CKCheckArgument((uint64_t)"zone", v10, 0, 0, 0, &v41);
  id v15 = v41;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    id v27 = [CKException alloc];
    uint64_t v31 = objc_msgSend_code(v16, v28, v29, v30);
    uint64_t v35 = objc_msgSend_localizedDescription(v16, v32, v33, v34);
    id v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, @"%@", v35);

    objc_exception_throw(v37);
  }

  uint64_t v17 = [CKModifyRecordZonesOperation alloc];
  v42[0] = v10;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v42, 1);
  uint64_t v21 = objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v17, v20, (uint64_t)v19, 0);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_18B110B48;
  v38[3] = &unk_1E5463FF0;
  id v39 = v10;
  id v40 = v13;
  id v22 = v10;
  id v23 = v13;
  objc_msgSend_setModifyRecordZonesCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);
}

- (void)deleteRecordZoneWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v41 = 0;
  char v14 = _CKCheckArgument((uint64_t)"zoneID", v10, 0, 1, 0, &v41);
  id v15 = v41;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    id v27 = [CKException alloc];
    uint64_t v31 = objc_msgSend_code(v16, v28, v29, v30);
    uint64_t v35 = objc_msgSend_localizedDescription(v16, v32, v33, v34);
    id v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, @"%@", v35);

    objc_exception_throw(v37);
  }

  uint64_t v17 = [CKModifyRecordZonesOperation alloc];
  v42[0] = v10;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v42, 1);
  uint64_t v21 = objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v17, v20, 0, (uint64_t)v19);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_18B110E1C;
  v38[3] = &unk_1E5463FF0;
  id v39 = v10;
  id v40 = v13;
  id v22 = v10;
  id v23 = v13;
  objc_msgSend_setModifyRecordZonesCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);
}

- (void)saveSubscription:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v41 = 0;
  char v14 = _CKCheckArgument((uint64_t)"subscription", v10, 0, 0, 0, &v41);
  id v15 = v41;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    id v27 = [CKException alloc];
    uint64_t v31 = objc_msgSend_code(v16, v28, v29, v30);
    uint64_t v35 = objc_msgSend_localizedDescription(v16, v32, v33, v34);
    id v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, @"%@", v35);

    objc_exception_throw(v37);
  }

  uint64_t v17 = [CKModifySubscriptionsOperation alloc];
  v42[0] = v10;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v42, 1);
  uint64_t v21 = objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(v17, v20, (uint64_t)v19, 0);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_18B1110DC;
  v38[3] = &unk_1E5464BC8;
  id v39 = v10;
  id v40 = v13;
  id v22 = v13;
  id v23 = v10;
  objc_msgSend_setModifySubscriptionsCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);
}

- (void)checkSupportedDeviceCapabilitiesInZone:(id)a3 desiredCapabilities:(id)a4 options:(id)a5 wrappingDatabase:(id)a6 convenienceConfiguration:(id)a7 completionHandler:(id)a8
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v68 = 0;
  char v20 = _CKCheckArgument((uint64_t)"zone", v14, 0, 0, 0, &v68);
  id v21 = v68;
  id v22 = v21;
  if ((v20 & 1) == 0)
  {
    id v47 = [CKException alloc];
    uint64_t v51 = objc_msgSend_code(v22, v48, v49, v50);
    uint64_t v55 = objc_msgSend_localizedDescription(v22, v52, v53, v54);
    id v57 = (id)objc_msgSend_initWithCode_format_(v47, v56, v51, @"%@", v55);

    objc_exception_throw(v57);
  }

  id v23 = [CKCheckSupportedDeviceCapabilitiesOperation alloc];
  id v27 = objc_msgSend_zoneID(v14, v24, v25, v26);
  v69[0] = v27;
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v69, 1);
  uint64_t v31 = objc_msgSend_initWithDesiredCapabilities_zoneIDs_options_(v23, v30, (uint64_t)v15, (uint64_t)v29, v16);

  uint64_t v35 = objc_msgSend_resolvedConfiguration(v31, v32, v33, v34);
  objc_msgSend_setRequestOriginator_(v35, v36, 4, v37);

  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  BOOL v67 = v19 != 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = sub_18B1115A0;
  v63[3] = &unk_1E5464C68;
  v65 = v66;
  id v38 = v19;
  id v64 = v38;
  objc_msgSend_setPerResultBlock_(v31, v39, (uint64_t)v63, v40);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = sub_18B1117A4;
  v58[3] = &unk_1E5464C90;
  uint64_t v62 = v66;
  id v41 = v14;
  id v59 = v41;
  id v42 = v15;
  id v60 = v42;
  id v43 = v38;
  id v61 = v43;
  objc_msgSend_setCheckSupportedDeviceCapabilitiesCompletionBlock_(v31, v44, (uint64_t)v58, v45);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v46, (uint64_t)v31, (uint64_t)v17, v18);

  _Block_object_dispose(v66, 8);
}

- (void)deleteSubscriptionWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v41 = 0;
  char v14 = _CKCheckArgument((uint64_t)"subscriptionID", v10, 0, 1, 0, &v41);
  id v15 = v41;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    id v27 = [CKException alloc];
    uint64_t v31 = objc_msgSend_code(v16, v28, v29, v30);
    uint64_t v35 = objc_msgSend_localizedDescription(v16, v32, v33, v34);
    id v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, @"%@", v35);

    objc_exception_throw(v37);
  }

  id v17 = [CKModifySubscriptionsOperation alloc];
  v42[0] = v10;
  id v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v42, 1);
  id v21 = objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(v17, v20, 0, (uint64_t)v19);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_18B111B44;
  v38[3] = &unk_1E5464BC8;
  id v39 = v10;
  id v40 = v13;
  id v22 = v13;
  id v23 = v10;
  objc_msgSend_setModifySubscriptionsCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);
}

- (void)fetchSubscriptionWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v42 = 0;
  char v14 = _CKCheckArgument((uint64_t)"subscriptionID", v10, 0, 1, 0, &v42);
  id v15 = v42;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    uint64_t v28 = [CKException alloc];
    uint64_t v32 = objc_msgSend_code(v16, v29, v30, v31);
    v36 = objc_msgSend_localizedDescription(v16, v33, v34, v35);
    id v38 = (id)objc_msgSend_initWithCode_format_(v28, v37, v32, @"%@", v36);

    objc_exception_throw(v38);
  }

  id v17 = [CKFetchSubscriptionsOperation alloc];
  v43[0] = v10;
  id v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v43, 1);
  id v22 = objc_msgSend_initWithSubscriptionIDs_(v17, v20, (uint64_t)v19, v21);

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_18B111EC0;
  v39[3] = &unk_1E5464C40;
  id v40 = v10;
  id v41 = v13;
  id v23 = v13;
  id v24 = v10;
  objc_msgSend_setFetchSubscriptionCompletionBlock_(v22, v25, (uint64_t)v39, v26);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v27, (uint64_t)v22, (uint64_t)v11, v12);
}

- (void)fetchAllSubscriptionsWithWrappingDatabase:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v14 = objc_msgSend_fetchAllSubscriptionsOperation(CKFetchSubscriptionsOperation, v11, v12, v13);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B11212C;
  v19[3] = &unk_1E5461850;
  id v20 = v8;
  id v15 = v8;
  objc_msgSend_setFetchSubscriptionCompletionBlock_(v14, v16, (uint64_t)v19, v17);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v18, (uint64_t)v14, (uint64_t)v10, v9);
}

- (OS_dispatch_queue)underlyingDispatchQueue
{
  return self->_underlyingDispatchQueue;
}

- (CKContainerImplementation)containerImplementation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerImplementation);

  return (CKContainerImplementation *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_containerImplementation);

  objc_storeStrong((id *)&self->_underlyingDispatchQueue, 0);
}

@end