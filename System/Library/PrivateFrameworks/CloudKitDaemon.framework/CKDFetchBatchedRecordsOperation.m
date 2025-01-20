@interface CKDFetchBatchedRecordsOperation
- (BOOL)fetchAllChanges;
- (BOOL)forcePCSDecryptionAttempt;
- (BOOL)shouldFetchAssetContents;
- (BOOL)supportsClearAssetEncryption;
- (CKDFetchBatchedRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDRecordFetchAggregator)recordFetcher;
- (NSArray)recordZoneIDs;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)configurationsByRecordZoneID;
- (NSSet)desiredAssetKeys;
- (NSString)pipeliningDescription;
- (OS_dispatch_group)fetchRecordsGroup;
- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4;
- (id)_optionsForZonesWithPendingChangesAfterRequest:(id)a3;
- (id)_possiblyWrapError:(id)a3 forRecordWithID:(id)a4 withCode:(int64_t)a5 format:(id)a6;
- (id)activityCreate;
- (int)operationType;
- (int64_t)errorReportingStyle;
- (unint64_t)numRequestsSent;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleAttributesChangedForZone:(id)a3 perRequestSchedulerInfo:(id)a4;
- (void)_handleChangedRecords:(id)a3 perRequestSchedulerInfo:(id)a4;
- (void)_handleFetchChangesRequestFinishedWithSchedulerInfo:(id)a3;
- (void)_handleRecordDelete:(id)a3 recordType:(id)a4 perRequestSchedulerInfo:(id)a5;
- (void)_noteAttributesChangedForZone:(id)a3;
- (void)_noteChangedRecordWithID:(id)a3 record:(id)a4 error:(id)a5;
- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4;
- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4;
- (void)_noteOperationBeginning;
- (void)_noteOperationEnding;
- (void)_noteOperationFinishedBlockEnd;
- (void)_processZonePCSChanges:(id)a3;
- (void)_sendFetchChangesRequestForZoneIDs:(id)a3 withOptions:(id)a4 previousRequestSchedulerInfo:(id)a5;
- (void)main;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setConfigurationsByRecordZoneID:(id)a3;
- (void)setDesiredAssetKeys:(id)a3;
- (void)setErrorReportingStyle:(int64_t)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setFetchRecordsGroup:(id)a3;
- (void)setForcePCSDecryptionAttempt:(BOOL)a3;
- (void)setNumRequestsSent:(unint64_t)a3;
- (void)setRecordFetcher:(id)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setShouldFetchAssetContents:(BOOL)a3;
@end

@implementation CKDFetchBatchedRecordsOperation

- (CKDFetchBatchedRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKDFetchBatchedRecordsOperation;
  v9 = [(CKDDatabaseOperation *)&v31 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v9->_shouldFetchAssetContents = objc_msgSend_shouldFetchAssetContents(v6, v7, v8);
    v9->_fetchAllChanges = objc_msgSend_fetchAllChanges(v6, v10, v11);
    uint64_t v14 = objc_msgSend_recordZoneIDs(v6, v12, v13);
    recordZoneIDs = v9->_recordZoneIDs;
    v9->_recordZoneIDs = (NSArray *)v14;

    uint64_t v18 = objc_msgSend_configurationsByRecordZoneID(v6, v16, v17);
    configurationsByRecordZoneID = v9->_configurationsByRecordZoneID;
    v9->_configurationsByRecordZoneID = (NSDictionary *)v18;

    uint64_t v22 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v6, v20, v21);
    assetTransferOptionsByRecordTypeAndKey = v9->_assetTransferOptionsByRecordTypeAndKey;
    v9->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v22;

    v9->_errorReportingStyle = objc_msgSend_errorReportingStyle(v6, v24, v25);
    v9->_numRequestsSent = 0;
    dispatch_group_t v26 = dispatch_group_create();
    fetchRecordsGroup = v9->_fetchRecordsGroup;
    v9->_fetchRecordsGroup = (OS_dispatch_group *)v26;

    v9->_forcePCSDecryptionAttempt = objc_msgSend_forcePCSDecryptionAttempt(v6, v28, v29);
  }

  return v9;
}

- (void)_handleFetchChangesRequestFinishedWithSchedulerInfo:(id)a3
{
  id v4 = a3;
  objc_msgSend_request(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequest_(v4, v7, 0);
  objc_msgSend__noteCompletedURLRequest_withSchedulerInfo_(self, v8, (uint64_t)v9, v4);
}

- (void)_handleChangedRecords:(id)a3 perRequestSchedulerInfo:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v42 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v6;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v48, v54, 16);
  if (v11)
  {
    uint64_t v13 = *(void *)v49;
    uint64_t v14 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    *(void *)&long long v12 = 138412290;
    long long v40 = v12;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v48 + 1) + 8 * v15);
        v19 = objc_msgSend_recordID(v16, v9, v10, v40);
        if (v19)
        {
          v20 = objc_msgSend_record(v16, v17, v18);
          objc_msgSend_setObject_forKeyedSubscript_(v42, v21, (uint64_t)v20, v19);
        }
        uint64_t v22 = objc_msgSend_fetchRecordsGroup(self, v17, v18);
        dispatch_group_enter(v22);

        uint64_t v25 = objc_msgSend_perRequestCallbackGroup(v7, v23, v24);
        dispatch_group_enter(v25);

        if (*v14 != -1) {
          dispatch_once(v14, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        dispatch_group_t v26 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          v27 = v26;
          v30 = objc_msgSend_recordID(v16, v28, v29);
          v33 = objc_msgSend_ckShortDescription(v30, v31, v32);
          *(_DWORD *)buf = v40;
          v53 = v33;
          _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Handling record response for record %@", buf, 0xCu);
        }
        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v48, v54, 16);
    }
    while (v11);
  }

  objc_initWeak((id *)buf, self);
  v36 = objc_msgSend_recordFetcher(self, v34, v35);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1C4F82318;
  v43[3] = &unk_1E64F7448;
  id v37 = v7;
  id v44 = v37;
  objc_copyWeak(&v47, (id *)buf);
  id v38 = v42;
  id v45 = v38;
  v46 = self;
  objc_msgSend_fetchRecords_withPerRecordCompletion_(v36, v39, (uint64_t)obj, v43);

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);
}

- (void)_handleRecordDelete:(id)a3 recordType:(id)a4 perRequestSchedulerInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F82D28;
  block[3] = &unk_1E64F57B8;
  objc_copyWeak(&v36, &location);
  block[4] = self;
  id v11 = v8;
  id v34 = v11;
  id v12 = v9;
  id v35 = v12;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_msgSend_addPerRequestCallbackBlock_(v10, v14, (uint64_t)v13);
  if (objc_msgSend_isEqualToString_(v12, v15, *MEMORY[0x1E4F19DD0])) {
    objc_msgSend_setPCSData_forFetchedShareID_(self, v16, 0, v11);
  }
  else {
    objc_msgSend_setPCSData_forFetchedRecordID_(self, v16, 0, v11);
  }
  v19 = objc_msgSend_container(self, v17, v18);
  uint64_t v22 = objc_msgSend_recordCache(v19, v20, v21);
  uint64_t v25 = objc_msgSend_databaseScope(self, v23, v24);
  objc_msgSend_deleteRecordWithID_scope_(v22, v26, (uint64_t)v11, v25);

  uint64_t v29 = objc_msgSend_perRequestCallbackGroup(v10, v27, v28);
  uint64_t v32 = objc_msgSend_perRequestCallbackQueue(v10, v30, v31);
  dispatch_group_async(v29, v32, v13);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

- (void)_handleAttributesChangedForZone:(id)a3 perRequestSchedulerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend__processZonePCSChanges_(self, v8, (uint64_t)v6);
  objc_initWeak(&location, v7);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = sub_1C4F82EF0;
  uint64_t v21 = &unk_1E64F0238;
  objc_copyWeak(&v24, &location);
  uint64_t v22 = self;
  id v9 = v6;
  id v23 = v9;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v18);
  objc_msgSend_addPerRequestCallbackBlock_(v7, v11, (uint64_t)v10, v18, v19, v20, v21, v22);
  uint64_t v14 = objc_msgSend_perRequestCallbackGroup(v7, v12, v13);
  uint64_t v17 = objc_msgSend_perRequestCallbackQueue(v7, v15, v16);
  dispatch_group_async(v14, v17, v10);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_processZonePCSChanges:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_protectionData(v4, v5, v6);
  uint64_t v10 = objc_msgSend_length(v7, v8, v9);

  if (v10)
  {
    id v11 = [CKDApplyZoneAttributeChangesOperationInfo alloc];
    uint64_t v13 = objc_msgSend_initWithZone_(v11, v12, (uint64_t)v4);
    uint64_t v14 = objc_opt_class();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1C4F83044;
    v16[3] = &unk_1E64F0210;
    id v17 = v4;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v15, v14, v13, v16);
  }
}

- (void)_sendFetchChangesRequestForZoneIDs:(id)a3 withOptions:(id)a4 previousRequestSchedulerInfo:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v11 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v11;
    *(_DWORD *)buf = 134218242;
    uint64_t v60 = objc_msgSend_count(v8, v14, v15);
    __int16 v61 = 2112;
    id v62 = v9;
    _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Fetching changes from the server for %lu zones with options:\n%@", buf, 0x16u);
  }
  uint64_t v16 = objc_msgSend__createAndConfigureURLRequestForZoneIDs_optionsByZoneID_(self, v12, (uint64_t)v8, v9);
  uint64_t v19 = objc_msgSend_request(v16, v17, v18);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v19);
  if (!objc_msgSend_fetchAllChanges(self, v20, v21)
    || (objc_msgSend_request(self, v22, v23),
        id v24 = objc_claimAutoreleasedReturnValue(),
        BOOL v25 = v24 == 0,
        v24,
        v25))
  {
    char v26 = 0;
  }
  else
  {
    objc_msgSend_suspendCallbackQueue(v16, v22, v23);
    char v26 = 1;
  }
  v27 = objc_msgSend_fetchRecordsGroup(self, v22, v23);
  dispatch_group_enter(v27);

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v28 = v8;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v53, v58, 16);
  if (v32)
  {
    uint64_t v33 = *(void *)v54;
    while (1)
    {
      if (*(void *)v54 != v33) {
        objc_enumerationMutation(v28);
      }
      id v34 = objc_msgSend_perRequestGroup(v16, v30, v31);
      dispatch_group_enter(v34);

      if (!--v32)
      {
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v53, v58, 16);
        if (!v32) {
          break;
        }
      }
    }
  }

  if (v10)
  {
    uint64_t v37 = objc_msgSend_perRequestGroup(v10, v35, v36);
  }
  else
  {
    uint64_t v37 = (uint64_t)dispatch_group_create();
  }
  id v38 = (void *)v37;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = sub_1C4F83684;
  v47[3] = &unk_1E64F7498;
  objc_copyWeak(&v50, (id *)buf);
  objc_copyWeak(&v51, &location);
  id v39 = v16;
  id v48 = v39;
  id v40 = v38;
  id v49 = v40;
  char v52 = v26;
  objc_msgSend_setCompletionBlock_(v19, v41, (uint64_t)v47);
  objc_msgSend_setRequest_(self, v42, (uint64_t)v19);
  id v45 = objc_msgSend_container(self, v43, v44);
  objc_msgSend_performRequest_(v45, v46, (uint64_t)v19);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v50);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (id)_possiblyWrapError:(id)a3 forRecordWithID:(id)a4 withCode:(int64_t)a5 format:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((CKShouldWrapErrorFetchingRecords() & 1) == 0)
  {
    id v18 = v9;
    goto LABEL_5;
  }
  if (CKCanRetryForError())
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v15 = *MEMORY[0x1E4F19DD8];
    uint64_t v16 = objc_msgSend_code(v9, v12, v13);
    objc_msgSend_errorWithDomain_code_error_format_(v14, v17, v15, v16, v9, @"Encountered a transient error fetching record %@. Please try again.", v10);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    uint64_t v19 = v18;
    goto LABEL_9;
  }
  id v20 = [NSString alloc];
  uint64_t v23 = objc_msgSend_initWithFormat_arguments_(v20, v21, (uint64_t)v11, &v27);
  if (v9)
  {
    uint64_t v24 = objc_msgSend_stringWithFormat_(NSString, v22, @"%@: %@", v23, v9);

    uint64_t v23 = (void *)v24;
  }
  uint64_t v19 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], a5, v9, @"%@", v23);

LABEL_9:
  return v19;
}

- (void)main
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  objc_msgSend__noteOperationBeginning(self, a2, v2);
  objc_initWeak(&location, self);
  id v4 = objc_opt_new();
  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(self, v5, v6);
  objc_msgSend_setFetchAssetContents_(v4, v8, AssetContents);
  objc_msgSend_setFetchMergeableValues_(v4, v9, 0);
  objc_msgSend_setPreserveOrdering_(v4, v10, 0);
  uint64_t v13 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v11, v12);
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v4, v14, (uint64_t)v13);

  uint64_t v17 = objc_msgSend_forcePCSDecryptionAttempt(self, v15, v16);
  objc_msgSend_setForceDecryptionAttempt_(v4, v18, v17);
  v72 = objc_opt_new();
  if ((objc_msgSend_shouldFetchAssetContents(self, v19, v20) & 1) == 0)
  {
    uint64_t v23 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v21, v22);
    char v26 = objc_msgSend_allValues(v23, v24, v25);
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = sub_1C4F845B0;
    v81[3] = &unk_1E64F74C0;
    id v82 = v72;
    objc_msgSend_enumerateObjectsUsingBlock_(v26, v27, (uint64_t)v81);
  }
  if (objc_msgSend_count(v72, v21, v22)) {
    objc_msgSend_setDesiredAssetKeys_(self, v28, (uint64_t)v72);
  }
  v73 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v28, v29);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v32 = objc_msgSend_recordZoneIDs(self, v30, v31);
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v77, v84, 16);
  if (v36)
  {
    uint64_t v37 = *(void *)v78;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v78 != v37) {
          objc_enumerationMutation(v32);
        }
        uint64_t v39 = *(void *)(*((void *)&v77 + 1) + 8 * v38);
        id v40 = objc_msgSend_configurationsByRecordZoneID(self, v34, v35);
        v42 = objc_msgSend_objectForKeyedSubscript_(v40, v41, v39);

        if (v42)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v43 = v42;
            v46 = objc_msgSend_desiredKeys(v43, v44, v45);

            if (v46)
            {
              id v49 = objc_msgSend_desiredKeys(v43, v47, v48);
              objc_msgSend_addObjectsFromArray_(v73, v50, (uint64_t)v49);
            }
            int NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(v43, v47, v48);
            unsigned int v54 = objc_msgSend_preserveOrdering(v4, v52, v53);
            objc_msgSend_setPreserveOrdering_(v4, v55, NewestChangesFirst | v54);
          }
        }

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v77, v84, 16);
    }
    while (v36);
  }

  objc_msgSend_setDesiredKeys_(v4, v56, (uint64_t)v73);
  uint64_t v57 = objc_opt_class();
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = sub_1C4F846E0;
  v75[3] = &unk_1E64F22E8;
  v75[4] = self;
  objc_copyWeak(&v76, &location);
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v58, v57, v4, v75);
  __int16 v61 = objc_msgSend_recordZoneIDs(self, v59, v60);
  v64 = objc_msgSend_configurationsByRecordZoneID(self, v62, v63);
  objc_msgSend__sendFetchChangesRequestForZoneIDs_withOptions_previousRequestSchedulerInfo_(self, v65, (uint64_t)v61, v64, 0);

  v68 = objc_msgSend_fetchRecordsGroup(self, v66, v67);
  objc_msgSend_qualityOfService(self, v69, v70);
  v71 = CKGetGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F84948;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_group_notify(v68, v71, block);

  objc_destroyWeak(&v76);
  objc_destroyWeak(&location);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v8 = objc_msgSend_recordZoneIDs(self, v6, v7);
  id v10 = objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8);

  if (objc_msgSend_count(v10, v11, v12))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1C4F84B04;
    v17[3] = &unk_1E64F1D18;
    id v18 = v10;
    objc_msgSend_updateCloudKitMetrics_(self, v15, (uint64_t)v17);
  }
  objc_msgSend__noteOperationFinishedBlockEnd(self, v13, v14);
  v16.receiver = self;
  v16.super_class = (Class)CKDFetchBatchedRecordsOperation;
  [(CKDOperation *)&v16 _finishOnCallbackQueueWithError:v5];
}

- (int)operationType
{
  return 0;
}

- (NSString)pipeliningDescription
{
  id v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 512, @"Expect subclass to implement");

  return 0;
}

- (id)activityCreate
{
  id v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 516, @"Expect subclass to implement");

  return 0;
}

- (void)_noteChangedRecordWithID:(id)a3 record:(id)a4 error:(id)a5
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, a4, a5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v7, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 520, @"Expect subclass to implement");
}

- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 523, @"Expect subclass to implement");
}

- (void)_noteAttributesChangedForZone:(id)a3
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 526, @"Expect subclass to implement");
}

- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4
{
  id v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 529, @"Expect subclass to implement");

  return 0;
}

- (id)_optionsForZonesWithPendingChangesAfterRequest:(id)a3
{
  id v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 533, @"Expect subclass to implement");

  return 0;
}

- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 537, @"Expect subclass to implement");
}

- (void)_noteOperationBeginning
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 540, @"Expect subclass to implement");
}

- (void)_noteOperationEnding
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 543, @"Expect subclass to implement");
}

- (void)_noteOperationFinishedBlockEnd
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, @"CKDFetchBatchedRecordsOperation.m", 546, @"Expect subclass to implement");
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (OS_dispatch_group)fetchRecordsGroup
{
  return self->_fetchRecordsGroup;
}

- (void)setFetchRecordsGroup:(id)a3
{
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContents = a3;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (void)setDesiredAssetKeys:(id)a3
{
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
}

- (unint64_t)numRequestsSent
{
  return self->_numRequestsSent;
}

- (void)setNumRequestsSent:(unint64_t)a3
{
  self->_numRequestsSent = a3;
}

- (CKDRecordFetchAggregator)recordFetcher
{
  return self->_recordFetcher;
}

- (void)setRecordFetcher:(id)a3
{
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
}

- (BOOL)forcePCSDecryptionAttempt
{
  return self->_forcePCSDecryptionAttempt;
}

- (void)setForcePCSDecryptionAttempt:(BOOL)a3
{
  self->_forcePCSDecryptionAttempt = a3;
}

- (int64_t)errorReportingStyle
{
  return self->_errorReportingStyle;
}

- (void)setErrorReportingStyle:(int64_t)a3
{
  self->_errorReportingStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_recordFetcher, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_fetchRecordsGroup, 0);
}

@end