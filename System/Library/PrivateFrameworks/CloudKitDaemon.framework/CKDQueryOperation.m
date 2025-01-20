@interface CKDQueryOperation
- (BOOL)fetchAllResults;
- (BOOL)hasCalledQueryCursorUpdatedBlock;
- (BOOL)shouldFetchAssetContent;
- (CKDQueryOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDRecordFetchAggregator)recordFetcher;
- (CKQuery)query;
- (CKQueryCursor)cursor;
- (CKQueryCursor)resultsCursor;
- (CKRecordZoneID)zoneID;
- (NSDictionary)assetTransferOptionsByKey;
- (NSMutableArray)requestInfos;
- (NSSet)desiredKeySet;
- (NSString)pipeliningDescription;
- (OS_dispatch_group)fetchRecordsGroup;
- (id)_wrapError:(id)a3 format:(id)a4;
- (id)activityCreate;
- (id)queryCursorUpdatedBlock;
- (id)recordFetchCompletionBlock;
- (id)relevantZoneIDs;
- (int)operationType;
- (unint64_t)numRequestsSent;
- (unint64_t)resultsLimit;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleQueryRequestFinishedWithSchedulerInfo:(id)a3;
- (void)_handleRecordResponses:(id)a3 perRequestSchedulerInfo:(id)a4;
- (void)_sendQueryRequestWithCursor:(id)a3 previousRequestSchedulerInfo:(id)a4;
- (void)main;
- (void)setAssetTransferOptionsByKey:(id)a3;
- (void)setDesiredKeySet:(id)a3;
- (void)setFetchAllResults:(BOOL)a3;
- (void)setFetchRecordsGroup:(id)a3;
- (void)setHasCalledQueryCursorUpdatedBlock:(BOOL)a3;
- (void)setNumRequestsSent:(unint64_t)a3;
- (void)setQueryCursorUpdatedBlock:(id)a3;
- (void)setRecordFetchCompletionBlock:(id)a3;
- (void)setRecordFetcher:(id)a3;
- (void)setRequestInfos:(id)a3;
- (void)setResultsCursor:(id)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKDQueryOperation

- (CKDQueryOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  v6 = (CKQueryCursor *)a3;
  v55.receiver = self;
  v55.super_class = (Class)CKDQueryOperation;
  v9 = [(CKDDatabaseOperation *)&v55 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_query(v6, v7, v8);
    query = v9->_query;
    v9->_query = (CKQuery *)v10;

    uint64_t v14 = objc_msgSend_cursor(v6, v12, v13);
    cursor = v9->_cursor;
    v9->_cursor = (CKQueryCursor *)v14;

    v9->_resultsLimit = objc_msgSend_resultsLimit(v6, v16, v17);
    v20 = v9->_cursor;
    if (!v20) {
      v20 = v6;
    }
    v21 = objc_msgSend_zoneID(v20, v18, v19);
    objc_storeStrong((id *)&v9->_zoneID, v21);

    v9->_shouldFetchAssetContent = objc_msgSend_shouldFetchAssetContent(v6, v22, v23);
    uint64_t v26 = objc_msgSend_desiredKeys(v6, v24, v25);
    if (v26
      && (v29 = (void *)v26,
          objc_msgSend_desiredKeys(v6, v27, v28),
          v30 = objc_claimAutoreleasedReturnValue(),
          uint64_t v33 = objc_msgSend_count(v30, v31, v32),
          v30,
          v29,
          !v33))
    {
      v40 = (void *)MEMORY[0x1E4F1CAD0];
      v56[0] = *MEMORY[0x1E4F19D58];
      uint64_t v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v56, 1);
    }
    else
    {
      v34 = objc_msgSend_desiredKeys(v6, v27, v28);
      uint64_t v37 = objc_msgSend_count(v34, v35, v36);

      if (!v37)
      {
LABEL_10:
        v9->_fetchAllResults = objc_msgSend_fetchAllResults(v6, v38, v39);
        dispatch_group_t v46 = dispatch_group_create();
        fetchRecordsGroup = v9->_fetchRecordsGroup;
        v9->_fetchRecordsGroup = (OS_dispatch_group *)v46;

        v9->_numRequestsSent = 0;
        uint64_t v48 = objc_opt_new();
        requestInfos = v9->_requestInfos;
        v9->_requestInfos = (NSMutableArray *)v48;

        uint64_t v52 = objc_msgSend_assetTransferOptionsByKey(v6, v50, v51);
        assetTransferOptionsByKey = v9->_assetTransferOptionsByKey;
        v9->_assetTransferOptionsByKey = (NSDictionary *)v52;

        goto LABEL_11;
      }
      v40 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v41 = objc_msgSend_desiredKeys(v6, v38, v39);
    }
    v43 = (void *)v41;
    uint64_t v44 = objc_msgSend_setWithArray_(v40, v42, v41);
    desiredKeySet = v9->_desiredKeySet;
    v9->_desiredKeySet = (NSSet *)v44;

    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (int)operationType
{
  return 220;
}

- (NSString)pipeliningDescription
{
  return (NSString *)@"fetchAllQueryResults";
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/query", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_handleQueryRequestFinishedWithSchedulerInfo:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_request(v4, v5, v6);
  objc_msgSend_setRequest_(v4, v8, 0);
  v11 = objc_msgSend_resultsCursor(v7, v9, v10);

  if (v11)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1A2A8]);
    uint64_t v17 = objc_msgSend_resultsCursor(v7, v15, v16);
    v20 = objc_msgSend_zoneID(self, v18, v19);
    v11 = objc_msgSend_initWithData_zoneID_(v14, v21, (uint64_t)v17, v20);
  }
  v22 = objc_msgSend_fetchRecordsGroup(self, v12, v13);
  dispatch_group_enter(v22);

  uint64_t v25 = objc_msgSend_perRequestCallbackGroup(v4, v23, v24);
  uint64_t v28 = objc_msgSend_perRequestCallbackQueue(v4, v26, v27);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D9F620;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v32 = v11;
  id v33 = v4;
  id v29 = v4;
  id v30 = v11;
  dispatch_group_notify(v25, v28, block);
}

- (id)_wrapError:(id)a3 format:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  if (!v5) {
    goto LABEL_5;
  }
  v9 = objc_msgSend_domain(v5, v6, v7);
  uint64_t v10 = *MEMORY[0x1E4F19DD8];
  if (objc_msgSend_isEqualToString_(v9, v11, *MEMORY[0x1E4F19DD8]))
  {

LABEL_5:
    id v17 = v5;
    goto LABEL_6;
  }
  id v14 = objc_msgSend_domain(v5, v12, v13);
  int isEqualToString = objc_msgSend_isEqualToString_(v14, v15, *MEMORY[0x1E4F289A0]);

  if (isEqualToString) {
    goto LABEL_5;
  }
  id v19 = [NSString alloc];
  v21 = objc_msgSend_initWithFormat_arguments_(v19, v20, (uint64_t)v8, &v24);
  objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v22, v10, 1000, v5, @"%@", v21);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v17;
}

- (void)_handleRecordResponses:(id)a3 perRequestSchedulerInfo:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = a4;
  if ((objc_msgSend_isCancelled(self, v7, v8) & 1) == 0)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = v32;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v37, v43, 16);
    if (v13)
    {
      uint64_t v14 = *(void *)v38;
      v15 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
      uint64_t v16 = (os_log_t *)MEMORY[0x1E4F1A500];
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v9);
          }
          v18 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
          id v19 = objc_msgSend_fetchRecordsGroup(self, v11, v12);
          dispatch_group_enter(v19);

          v22 = objc_msgSend_perRequestCallbackGroup(v6, v20, v21);
          dispatch_group_enter(v22);

          if (*v15 != -1) {
            dispatch_once(v15, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          os_log_t v23 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v24 = v23;
            uint64_t v27 = objc_msgSend_recordID(v18, v25, v26);
            *(_DWORD *)buf = 138412290;
            v42 = v27;
            _os_log_debug_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_DEBUG, "Handling record response for record %@", buf, 0xCu);
          }
          ++v17;
        }
        while (v13 != v17);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v37, v43, 16);
      }
      while (v13);
    }

    objc_initWeak((id *)buf, self);
    id v30 = objc_msgSend_recordFetcher(self, v28, v29);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1C4D9FE00;
    v33[3] = &unk_1E64F21F8;
    objc_copyWeak(&v36, (id *)buf);
    id v34 = v6;
    v35 = self;
    objc_msgSend_fetchRecords_withPerRecordCompletion_(v30, v31, (uint64_t)v9, v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_sendQueryRequestWithCursor:(id)a3 previousRequestSchedulerInfo:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  id v6 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v72 = v6;
  uint64_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v91 = v76;
    _os_log_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_INFO, "Executing query with cursor %@", buf, 0xCu);
  }
  v75 = objc_msgSend_zoneID(self, v8, v9, v72);
  uint64_t v12 = objc_msgSend_cursor(self, v10, v11);

  if (v12)
  {
    v15 = objc_msgSend_cursor(self, v13, v14);
    uint64_t v18 = objc_msgSend_zoneID(v15, v16, v17);

    v75 = (void *)v18;
  }
  if (v76)
  {
    v74 = 0;
  }
  else
  {
    v74 = objc_msgSend_query(self, v13, v14);
  }
  id v19 = [CKDQueryURLRequest alloc];
  uint64_t v22 = objc_msgSend_resultsLimit(self, v20, v21);
  uint64_t v25 = objc_msgSend_desiredKeySet(self, v23, v24);
  uint64_t v28 = objc_msgSend_allObjects(v25, v26, v27);
  cursor_limit_requestedFields_zoneID = objc_msgSend_initWithOperation_query_cursor_limit_requestedFields_zoneID_(v19, v29, (uint64_t)self, v74, v76, v22, v28, v75);

  v31 = objc_opt_new();
  if ((objc_msgSend_shouldFetchAssetContent(self, v32, v33) & 1) == 0)
  {
    id v36 = objc_msgSend_assetTransferOptionsByKey(self, v34, v35);
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = sub_1C4DA0AF0;
    v88[3] = &unk_1E64F2220;
    id v89 = v31;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v36, v37, (uint64_t)v88);
  }
  if (objc_msgSend_count(v31, v34, v35))
  {
    objc_msgSend_setDesiredAssetKeys_(cursor_limit_requestedFields_zoneID, v38, (uint64_t)v31);
  }
  else
  {
    uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v38, v39);
    objc_msgSend_setShouldFetchAssetContent_(cursor_limit_requestedFields_zoneID, v41, AssetContent);
  }
  v42 = [CKDPipeliningInfo alloc];
  uint64_t v44 = objc_msgSend_initWithRequest_operation_(v42, v43, (uint64_t)cursor_limit_requestedFields_zoneID, self);
  v47 = objc_msgSend_requestInfos(self, v45, v46);
  objc_msgSend_addObject_(v47, v48, (uint64_t)v44);

  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, cursor_limit_requestedFields_zoneID);
  objc_initWeak(&from, v44);
  if (!objc_msgSend_fetchAllResults(self, v49, v50)
    || (objc_msgSend_request(self, v51, v52),
        v53 = objc_claimAutoreleasedReturnValue(),
        BOOL v54 = v53 == 0,
        v53,
        v54))
  {
    char v55 = 0;
  }
  else
  {
    objc_msgSend_suspendCallbackQueue(v44, v51, v52);
    char v55 = 1;
  }
  v56 = objc_msgSend_fetchRecordsGroup(self, v51, v52);
  dispatch_group_enter(v56);

  v59 = objc_msgSend_perRequestGroup(v44, v57, v58);
  dispatch_group_enter(v59);

  if (v73)
  {
    uint64_t v62 = objc_msgSend_perRequestGroup(v73, v60, v61);
  }
  else
  {
    uint64_t v62 = (uint64_t)dispatch_group_create();
  }
  v63 = (void *)v62;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = sub_1C4DA0B94;
  v80[3] = &unk_1E64F2270;
  objc_copyWeak(&v82, (id *)buf);
  objc_copyWeak(&v83, &location);
  objc_copyWeak(&v84, &from);
  id v64 = v63;
  id v81 = v64;
  char v85 = v55;
  objc_msgSend_setCompletionBlock_(cursor_limit_requestedFields_zoneID, v65, (uint64_t)v80);
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = sub_1C4DA14A4;
  v77[3] = &unk_1E64F2298;
  objc_copyWeak(&v78, (id *)buf);
  objc_copyWeak(&v79, &from);
  objc_msgSend_setRecordsParsedBlock_(cursor_limit_requestedFields_zoneID, v66, (uint64_t)v77);
  objc_msgSend_setRequest_(self, v67, (uint64_t)cursor_limit_requestedFields_zoneID);
  v70 = objc_msgSend_container(self, v68, v69);
  objc_msgSend_performRequest_(v70, v71, (uint64_t)cursor_limit_requestedFields_zoneID);

  objc_destroyWeak(&v79);
  objc_destroyWeak(&v78);

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v82);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (void)main
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_query(self, a2, v2);

  if (v4)
  {
    uint64_t v7 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v8 = [CKDProtocolTranslator alloc];
    uint64_t v11 = objc_msgSend_container(self, v9, v10);
    uint64_t v14 = objc_msgSend_databaseScope(self, v12, v13);
    uint64_t v16 = objc_msgSend_initWithContainer_databaseScope_requireContainerScopedUserID_(v8, v15, (uint64_t)v11, v14, 0);

    id v19 = objc_msgSend_query(self, v17, v18);
    id v87 = 0;
    uint64_t v21 = objc_msgSend_pQueryFromQuery_error_(v16, v20, (uint64_t)v19, &v87);
    id v22 = v87;

    if (v21)
    {

      goto LABEL_5;
    }
    v75 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v76 = *MEMORY[0x1E4F19DD8];
    if (v22)
    {
      v77 = objc_msgSend_localizedDescription(v22, v23, v24);
      objc_msgSend_errorWithDomain_code_format_(v75, v78, v76, 1009, @"Invalid predicate: %@", v77);
    }
    else
    {
      v77 = objc_msgSend_query(self, v23, v24);
      objc_msgSend_errorWithDomain_code_format_(v75, v79, v76, 1000, @"Unexpected error while encoding query %@", v77);
    v80 = };
    objc_msgSend_finishWithError_(self, v81, (uint64_t)v80);
  }
  else
  {
    uint64_t v25 = objc_msgSend_cursor(self, v5, v6);

    if (v25)
    {
LABEL_5:
      objc_initWeak(&location, self);
      uint64_t v27 = objc_opt_new();
      uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v28, v29);
      objc_msgSend_setFetchAssetContents_(v27, v31, AssetContent);
      objc_msgSend_setPreserveOrdering_(v27, v32, 1);
      uint64_t v35 = objc_msgSend_desiredKeySet(self, v33, v34);
      objc_msgSend_setDesiredKeys_(v27, v36, (uint64_t)v35);

      uint64_t v41 = objc_msgSend_query(self, v37, v38);
      if (v41)
      {
        v42 = objc_msgSend_query(self, v39, v40);
        v47 = objc_msgSend_recordType(v42, v43, v44);
        if (!v47)
        {
LABEL_9:

          goto LABEL_10;
        }
        uint64_t v48 = objc_msgSend_assetTransferOptionsByKey(self, v45, v46);
        BOOL v49 = v48 == 0;

        if (!v49)
        {
          uint64_t v41 = objc_msgSend_query(self, v50, v51);
          v42 = objc_msgSend_recordType(v41, v52, v53);
          v88 = v42;
          v56 = objc_msgSend_assetTransferOptionsByKey(self, v54, v55);
          v89[0] = v56;
          uint64_t v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v57, (uint64_t)v89, &v88, 1);
          objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v27, v59, (uint64_t)v58);

          goto LABEL_9;
        }
      }
LABEL_10:
      uint64_t v60 = objc_opt_class();
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = sub_1C4DA1A3C;
      v84[3] = &unk_1E64F22E8;
      v84[4] = self;
      objc_copyWeak(&v85, &location);
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v61, v60, v27, v84);
      id v64 = objc_msgSend_cursor(self, v62, v63);
      v67 = objc_msgSend_data(v64, v65, v66);
      objc_msgSend__sendQueryRequestWithCursor_previousRequestSchedulerInfo_(self, v68, (uint64_t)v67, 0);

      v71 = objc_msgSend_fetchRecordsGroup(self, v69, v70);
      objc_msgSend_qualityOfService(self, v72, v73);
      v74 = CKGetGlobalQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4DA1C58;
      block[3] = &unk_1E64F05C8;
      block[4] = self;
      dispatch_group_notify(v71, v74, block);

      objc_destroyWeak(&v85);
      objc_destroyWeak(&location);
      return;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v26, *MEMORY[0x1E4F19C40], 12, @"No query or cursor supplied for query operation");
    id v82 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v82, (uint64_t)v82);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setRecordFetchCompletionBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDQueryOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)relevantZoneIDs
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_zoneID(self, a2, v2);
  id v5 = (void *)v3;
  if (v3)
  {
    v8[0] = v3;
    objc_super v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v8, 1);
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (CKQuery)query
{
  return self->_query;
}

- (CKQueryCursor)cursor
{
  return self->_cursor;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (CKQueryCursor)resultsCursor
{
  return self->_resultsCursor;
}

- (void)setResultsCursor:(id)a3
{
}

- (id)recordFetchCompletionBlock
{
  return self->_recordFetchCompletionBlock;
}

- (void)setRecordFetchCompletionBlock:(id)a3
{
}

- (id)queryCursorUpdatedBlock
{
  return self->_queryCursorUpdatedBlock;
}

- (void)setQueryCursorUpdatedBlock:(id)a3
{
}

- (NSSet)desiredKeySet
{
  return self->_desiredKeySet;
}

- (void)setDesiredKeySet:(id)a3
{
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContent = a3;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (CKDRecordFetchAggregator)recordFetcher
{
  return self->_recordFetcher;
}

- (void)setRecordFetcher:(id)a3
{
}

- (BOOL)fetchAllResults
{
  return self->_fetchAllResults;
}

- (void)setFetchAllResults:(BOOL)a3
{
  self->_fetchAllResults = a3;
}

- (OS_dispatch_group)fetchRecordsGroup
{
  return self->_fetchRecordsGroup;
}

- (void)setFetchRecordsGroup:(id)a3
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

- (NSMutableArray)requestInfos
{
  return self->_requestInfos;
}

- (void)setRequestInfos:(id)a3
{
}

- (NSDictionary)assetTransferOptionsByKey
{
  return self->_assetTransferOptionsByKey;
}

- (void)setAssetTransferOptionsByKey:(id)a3
{
}

- (BOOL)hasCalledQueryCursorUpdatedBlock
{
  return self->_hasCalledQueryCursorUpdatedBlock;
}

- (void)setHasCalledQueryCursorUpdatedBlock:(BOOL)a3
{
  self->_hasCalledQueryCursorUpdatedBlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByKey, 0);
  objc_storeStrong((id *)&self->_requestInfos, 0);
  objc_storeStrong((id *)&self->_fetchRecordsGroup, 0);
  objc_storeStrong((id *)&self->_recordFetcher, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_desiredKeySet, 0);
  objc_storeStrong(&self->_queryCursorUpdatedBlock, 0);
  objc_storeStrong(&self->_recordFetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_resultsCursor, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end