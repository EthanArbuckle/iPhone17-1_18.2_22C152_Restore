@interface CKDFetchArchivedRecordsOperation
- (CKDFetchArchivedRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSString)pipeliningDescription;
- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4;
- (id)_optionsForZonesWithPendingChangesAfterRequest:(id)a3;
- (id)activityCreate;
- (id)recordFetchedBlock;
- (id)serverChangeTokenUpdatedBlock;
- (int)operationType;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_noteAttributesChangedForZone:(id)a3;
- (void)_noteChangedRecordWithID:(id)a3 record:(id)a4 error:(id)a5;
- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4;
- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4;
- (void)_noteOperationBeginning;
- (void)_noteOperationEnding;
- (void)_noteOperationFinishedBlockEnd;
- (void)setRecordFetchedBlock:(id)a3;
- (void)setServerChangeTokenUpdatedBlock:(id)a3;
@end

@implementation CKDFetchArchivedRecordsOperation

- (CKDFetchArchivedRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  objc_msgSend_takeValuesFrom_(v8, v9, (uint64_t)v7);
  v12 = objc_msgSend_recordZoneIDs(v7, v10, v11);
  objc_msgSend_setRecordZoneIDs_(v8, v13, (uint64_t)v12);

  v16 = objc_msgSend_configurationsByRecordZoneID(v7, v14, v15);
  objc_msgSend_setConfigurationsByRecordZoneID_(v8, v17, (uint64_t)v16);

  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(v7, v18, v19);
  objc_msgSend_setShouldFetchAssetContents_(v8, v21, AssetContents);
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(v7, v22, v23);
  objc_msgSend_setFetchAllChanges_(v8, v25, AllChanges);
  v28 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v7, v26, v27);

  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v8, v29, (uint64_t)v28);
  v32.receiver = self;
  v32.super_class = (Class)CKDFetchArchivedRecordsOperation;
  v30 = [(CKDFetchBatchedRecordsOperation *)&v32 initWithOperationInfo:v8 container:v6];

  return v30;
}

- (NSString)pipeliningDescription
{
  return (NSString *)@"fetchArchivedRecords";
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-archived-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v66 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v63 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v63, v64, (uint64_t)a2, self, @"CKDFetchArchivedRecordsOperation.m", 49, &stru_1F2044F30);
  }
  id v10 = v7;
  v13 = objc_msgSend_recordZoneIDs(v10, v11, v12);
  v65 = objc_msgSend_resultsByRecordZoneID(v10, v14, v15);
  v67 = v10;
  v18 = objc_msgSend_zoneErrorsByZoneID(v10, v16, v17);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v19 = v13;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v73, v81, 16);
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v74;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v74 != v24) {
          objc_enumerationMutation(v19);
        }
        uint64_t v26 = *(void *)(*((void *)&v73 + 1) + 8 * v25);
        uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v18, v22, v26);
        if (objc_msgSend_CKIsNotFoundError(v27, v28, v29))
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v30 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            v33 = v30;
            v36 = objc_msgSend_operationID(self, v34, v35);
            *(_DWORD *)buf = 138412546;
            uint64_t v78 = v26;
            __int16 v79 = 2114;
            v80 = v36;
            _os_log_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_INFO, "Warn: Zone %@ wasn't found on the server for fetch changes request %{public}@. Wiping caches for that zone", buf, 0x16u);
          }
          v37 = objc_msgSend_container(self, v31, v32);
          v40 = objc_msgSend_recordCache(v37, v38, v39);
          objc_msgSend_clearAllRecordsForZoneWithID_(v40, v41, v26);

          objc_msgSend_setPCSData_forFetchedZoneID_(self, v42, 0, v26);
          v45 = objc_msgSend_container(self, v43, v44);
          v48 = objc_msgSend_pcsCache(v45, v46, v47);
          objc_msgSend_removePCSDataForItemsInZoneWithID_(v48, v49, v26);
        }
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v73, v81, 16);
    }
    while (v23);
  }

  v52 = objc_msgSend_fetchRecordsGroup(self, v50, v51);
  dispatch_group_enter(v52);

  v55 = objc_msgSend_perRequestCallbackGroup(v66, v53, v54);
  v58 = objc_msgSend_perRequestCallbackQueue(v66, v56, v57);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C5033434;
  block[3] = &unk_1E64F0198;
  block[4] = self;
  id v69 = v19;
  id v70 = v65;
  id v71 = v18;
  id v72 = v66;
  id v59 = v66;
  id v60 = v18;
  id v61 = v65;
  id v62 = v19;
  dispatch_group_notify(v55, v58, block);
}

- (void)_noteChangedRecordWithID:(id)a3 record:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_recordFetchedBlock(self, v10, v11);

  if (v12)
  {
    objc_msgSend_recordFetchedBlock(self, v13, v14);
    uint64_t v15 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, id))v15)[2](v15, v16, v8, v9);
  }
}

- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, self, @"CKDFetchArchivedRecordsOperation.m", 101, @"Not expected to get here");
}

- (void)_noteAttributesChangedForZone:(id)a3
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, @"CKDFetchArchivedRecordsOperation.m", 105, @"Not expected to get here");
}

- (id)_optionsForZonesWithPendingChangesAfterRequest:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CKDFetchArchivedRecordsOperation.m", 109, &stru_1F2044F30);
  }
  id v8 = v5;
  id v9 = objc_opt_new();
  uint64_t v12 = objc_msgSend_zoneErrorsByZoneID(v8, v10, v11);
  uint64_t v15 = objc_msgSend_resultsByRecordZoneID(v8, v13, v14);

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C5033B84;
  v24[3] = &unk_1E64F8AF0;
  id v25 = v12;
  id v16 = v9;
  id v26 = v16;
  id v17 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v15, v18, (uint64_t)v24);

  id v19 = v26;
  id v20 = v16;

  return v20;
}

- (int)operationType
{
  return 217;
}

- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    *(_DWORD *)buf = 134218242;
    uint64_t v43 = objc_msgSend_count(v6, v10, v11);
    __int16 v44 = 2112;
    id v45 = v7;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Fetching archived records from the server for %lu zones with options:\n%@", buf, 0x16u);
  }
  uint64_t v12 = [CKDFetchArchivedRecordsURLRequest alloc];
  uint64_t v14 = objc_msgSend_initWithOperation_recordZoneIDs_configurationsByRecordZoneID_(v12, v13, (uint64_t)self, v6, v7);
  id v17 = objc_msgSend_desiredAssetKeys(self, v15, v16);
  uint64_t v20 = objc_msgSend_count(v17, v18, v19);

  if (v20)
  {
    uint64_t v23 = objc_msgSend_desiredAssetKeys(self, v21, v22);
    id v26 = objc_msgSend_copy(v23, v24, v25);
    objc_msgSend_setDesiredAssetKeys_(v14, v27, (uint64_t)v26);
  }
  else
  {
    uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(self, v21, v22);
    objc_msgSend_setShouldFetchAssetContent_(v14, v29, AssetContents);
  }
  objc_initWeak((id *)buf, self);
  v30 = [CKDPipeliningInfo alloc];
  uint64_t v32 = objc_msgSend_initWithRequest_operation_(v30, v31, (uint64_t)v14, self);
  objc_initWeak(&location, v32);
  uint64_t v35 = objc_msgSend_recordFetchedBlock(self, v33, v34);

  if (v35)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_1C5033F4C;
    v38[3] = &unk_1E64F8B18;
    objc_copyWeak(&v39, (id *)buf);
    objc_copyWeak(&v40, &location);
    objc_msgSend_setRecordFetchedBlock_(v14, v36, (uint64_t)v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);
  }
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v32;
}

- (void)_noteOperationBeginning
{
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (void)_noteOperationEnding
{
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (void)_noteOperationFinishedBlockEnd
{
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setRecordFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchArchivedRecordsOperation;
  [(CKDFetchBatchedRecordsOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
}

- (id)serverChangeTokenUpdatedBlock
{
  return self->_serverChangeTokenUpdatedBlock;
}

- (void)setServerChangeTokenUpdatedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverChangeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end