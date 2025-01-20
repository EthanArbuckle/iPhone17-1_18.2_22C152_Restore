@interface CKDQueuedZoneFetch
- (void)addRequestForZoneID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5;
- (void)createFetchOperationForItemIDs:(id)a3 operationQueue:(id)a4 operationConfigurationBlock:(id)a5;
@end

@implementation CKDQueuedZoneFetch

- (void)addRequestForZoneID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v32 = a3;
  id v9 = a4;
  id v12 = a5;
  if (!v32)
  {
    v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CKDQueuedZoneFetch.m", 21, @"Zone ID required when fetching zone PCS: %@", self);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, @"CKDQueuedZoneFetch.m", 22, @"Zone ID was submitted to the wrong kind of fetcher: %@", self);
  }
  objc_msgSend_addCallbackForItemWithID_operation_callback_(self, v13, (uint64_t)v32, v9, v12);
  v17 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v15, v16);
  objc_msgSend_setLastRequestDate_(self, v18, (uint64_t)v17);

  uint64_t v21 = objc_msgSend_qualityOfService(v9, v19, v20);
  if (v21 > objc_msgSend_highestQOS(self, v22, v23))
  {
    uint64_t v26 = objc_msgSend_qualityOfService(v9, v24, v25);
    objc_msgSend_setHighestQOS_(self, v27, v26);
  }
}

- (void)createFetchOperationForItemIDs:(id)a3 operationQueue:(id)a4 operationConfigurationBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  objc_msgSend_setRecordZoneIDs_(v11, v12, (uint64_t)v10);

  v15 = objc_msgSend_initialOperation(self, v13, v14);
  uint64_t v16 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4DF6B68;
  v19[3] = &unk_1E64F2310;
  v19[4] = self;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_operationConfigurationBlock_(v15, v18, v16, v11, v9, v19);
}

@end