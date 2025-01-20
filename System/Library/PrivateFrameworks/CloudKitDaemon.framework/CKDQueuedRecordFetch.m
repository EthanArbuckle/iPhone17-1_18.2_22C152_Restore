@interface CKDQueuedRecordFetch
- (void)addRequestForRecordID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5;
- (void)createFetchOperationForItemIDs:(id)a3 operationQueue:(id)a4 operationConfigurationBlock:(id)a5;
@end

@implementation CKDQueuedRecordFetch

- (void)addRequestForRecordID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v32 = a3;
  id v9 = a4;
  id v12 = a5;
  if (!v32)
  {
    v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CKDQueuedRecordFetch.m", 18, @"Record ID required when fetching record PCS: %@", self);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, @"CKDQueuedRecordFetch.m", 19, @"Record ID was submitted to the wrong kind of fetcher: %@", self);
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
  objc_msgSend_setRequestOriginator_(v11, v12, 1);
  objc_msgSend_setRecordIDs_(v11, v13, (uint64_t)v10);

  objc_msgSend_setDesiredKeys_(v11, v14, MEMORY[0x1E4F1CBF0]);
  v17 = objc_msgSend_initialOperation(self, v15, v16);
  uint64_t v18 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4DA2A4C;
  v21[3] = &unk_1E64F2310;
  v21[4] = self;
  id v22 = v8;
  id v19 = v8;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_operationConfigurationBlock_(v17, v20, v18, v11, v9, v21);
}

@end