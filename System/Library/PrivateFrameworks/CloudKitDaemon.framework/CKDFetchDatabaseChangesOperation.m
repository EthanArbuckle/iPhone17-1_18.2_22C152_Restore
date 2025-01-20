@interface CKDFetchDatabaseChangesOperation
- (BOOL)fetchAllChanges;
- (BOOL)shouldReturnServerChangeTokensToAdopter;
- (CKDFetchDatabaseChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKServerChangeToken)previousServerChangeToken;
- (NSMutableArray)requestInfos;
- (NSString)pipeliningDescription;
- (OS_dispatch_group)fetchZonesGroup;
- (id)activityCreate;
- (id)analyticsPayload;
- (id)recordZoneWithIDChangedBlock;
- (id)recordZoneWithIDWasDeletedBlock;
- (id)recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock;
- (id)recordZoneWithIDWasPurgedBlock;
- (id)serverChangeTokenUpdatedBlock;
- (int)operationType;
- (unint64_t)numRequestsSent;
- (unint64_t)resultsLimit;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleAnonymousZoneDataObjects:(id)a3 schedulerInfo:(id)a4;
- (void)_handleFetchDatabaseChangesRequestFinishedWithSchedulerInfo:(id)a3;
- (void)_sendFetchDatabaseChangesRequestWithChangeToken:(id)a3 previousRequestSchedulerInfo:(id)a4;
- (void)main;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setFetchZonesGroup:(id)a3;
- (void)setNumRequestsSent:(unint64_t)a3;
- (void)setPreviousServerChangeToken:(id)a3;
- (void)setRecordZoneWithIDChangedBlock:(id)a3;
- (void)setRecordZoneWithIDWasDeletedBlock:(id)a3;
- (void)setRecordZoneWithIDWasDeletedDueToEncryptedDataResetBlock:(id)a3;
- (void)setRecordZoneWithIDWasPurgedBlock:(id)a3;
- (void)setRequestInfos:(id)a3;
- (void)setResultsLimit:(unint64_t)a3;
- (void)setServerChangeTokenUpdatedBlock:(id)a3;
@end

@implementation CKDFetchDatabaseChangesOperation

- (CKDFetchDatabaseChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CKDFetchDatabaseChangesOperation;
  v10 = [(CKDDatabaseOperation *)&v35 initWithOperationInfo:v6 container:v7];
  if (v10)
  {
    v11 = objc_msgSend_options(v7, v8, v9);
    if (objc_msgSend_useAnonymousToServerShareParticipants(v11, v12, v13))
    {
      uint64_t v16 = objc_msgSend_databaseScope(v10, v14, v15);

      if (v16 == 3)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v19 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          v22 = v19;
          v25 = objc_msgSend_operationID(v10, v23, v24);
          *(_DWORD *)buf = 138412290;
          v37 = v25;
          _os_log_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_INFO, "Ignoring initial metasync token in shared db from adopter using anonymous-to-server share participants for operation %@", buf, 0xCu);
        }
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v26 = objc_msgSend_previousServerChangeToken(v6, v17, v18);
    previousServerChangeToken = v10->_previousServerChangeToken;
    v10->_previousServerChangeToken = (CKServerChangeToken *)v26;

LABEL_10:
    v10->_resultsLimit = objc_msgSend_resultsLimit(v6, v20, v21);
    v10->_fetchAllChanges = objc_msgSend_fetchAllChanges(v6, v28, v29);
    v10->_numRequestsSent = 0;
    dispatch_group_t v30 = dispatch_group_create();
    fetchZonesGroup = v10->_fetchZonesGroup;
    v10->_fetchZonesGroup = (OS_dispatch_group *)v30;

    uint64_t v32 = objc_opt_new();
    requestInfos = v10->_requestInfos;
    v10->_requestInfos = (NSMutableArray *)v32;
  }
  return v10;
}

- (BOOL)shouldReturnServerChangeTokensToAdopter
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_container(self, a2, v2);
  id v7 = objc_msgSend_options(v4, v5, v6);
  if (!objc_msgSend_useAnonymousToServerShareParticipants(v7, v8, v9))
  {

    goto LABEL_8;
  }
  uint64_t v12 = objc_msgSend_databaseScope(self, v10, v11);

  if (v12 != 3)
  {
LABEL_8:
    LOBYTE(v14) = 1;
    return v14;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
  BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO);
  if (v14)
  {
    uint64_t v15 = v13;
    uint64_t v18 = objc_msgSend_operationID(self, v16, v17);
    int v20 = 138412290;
    uint64_t v21 = v18;
    _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Not returning metasync token in shared db to adopter using anonymous-to-server share participants for operation %@", (uint8_t *)&v20, 0xCu);

    LOBYTE(v14) = 0;
  }
  return v14;
}

- (NSString)pipeliningDescription
{
  return (NSString *)@"fetchAllDatabaseChanges";
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-changed-record-zones", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_handleFetchDatabaseChangesRequestFinishedWithSchedulerInfo:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_request(v4, v5, v6);
  objc_msgSend_setRequest_(v4, v8, 0);
  uint64_t v11 = objc_msgSend_serverChangeTokenData(v7, v9, v10);

  if (v11)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1A388]);
    uint64_t v17 = objc_msgSend_serverChangeTokenData(v7, v15, v16);
    uint64_t v11 = objc_msgSend_initWithData_(v14, v18, (uint64_t)v17);
  }
  uint64_t v19 = objc_msgSend_status(v7, v12, v13);
  uint64_t v22 = objc_msgSend_fetchZonesGroup(self, v20, v21);
  dispatch_group_enter(v22);

  v25 = objc_msgSend_perRequestCallbackGroup(v4, v23, v24);
  v28 = objc_msgSend_perRequestCallbackQueue(v4, v26, v27);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4F87AA0;
  v31[3] = &unk_1E64F6DE8;
  v31[4] = self;
  id v32 = v11;
  id v33 = v4;
  uint64_t v34 = v19;
  id v29 = v4;
  id v30 = v11;
  dispatch_group_notify(v25, v28, v31);
}

- (int)operationType
{
  return 203;
}

- (void)_sendFetchDatabaseChangesRequestWithChangeToken:(id)a3 previousRequestSchedulerInfo:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  id v6 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v70 = v6;
  id v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v96 = v71;
    _os_log_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_INFO, "Fetching database changes from the server with change token %{public}@", buf, 0xCu);
  }
  v8 = [CKDFetchDatabaseChangesURLRequest alloc];
  uint64_t v10 = objc_msgSend_initWithOperation_previousServerChangeTokenData_(v8, v9, (uint64_t)self, v71);
  uint64_t v13 = objc_msgSend_resultsLimit(self, v11, v12);
  objc_msgSend_setResultsLimit_(v10, v14, v13);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v10);
  uint64_t v15 = [CKDPipeliningInfo alloc];
  uint64_t v17 = objc_msgSend_initWithRequest_operation_(v15, v16, (uint64_t)v10, self);
  int v20 = objc_msgSend_requestInfos(self, v18, v19);
  objc_msgSend_addObject_(v20, v21, (uint64_t)v17);

  objc_initWeak(&from, v17);
  if (!objc_msgSend_fetchAllChanges(self, v22, v23)
    || (objc_msgSend_request(self, v24, v25),
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        BOOL v27 = v26 == 0,
        v26,
        v27))
  {
    char v28 = 0;
  }
  else
  {
    objc_msgSend_suspendCallbackQueue(v17, v24, v25);
    char v28 = 1;
  }
  id v29 = objc_msgSend_fetchZonesGroup(self, v24, v25);
  dispatch_group_enter(v29);

  id v32 = objc_msgSend_perRequestGroup(v17, v30, v31);
  dispatch_group_enter(v32);

  if (v70)
  {
    uint64_t v35 = objc_msgSend_perRequestGroup(v70, v33, v34);
  }
  else
  {
    uint64_t v35 = (uint64_t)dispatch_group_create();
  }
  v36 = (void *)v35;
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = sub_1C4F88424;
  v87[3] = &unk_1E64F2270;
  objc_copyWeak(&v89, (id *)buf);
  objc_copyWeak(&v90, &location);
  objc_copyWeak(&v91, &from);
  id v37 = v36;
  id v88 = v37;
  char v92 = v28;
  objc_msgSend_setCompletionBlock_(v10, v38, (uint64_t)v87);
  v41 = objc_msgSend_recordZoneWithIDChangedBlock(self, v39, v40);

  if (v41)
  {
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = sub_1C4F88D84;
    v84[3] = &unk_1E64F7588;
    objc_copyWeak(&v85, (id *)buf);
    objc_copyWeak(&v86, &from);
    objc_msgSend_setZoneChangedBlock_(v10, v44, (uint64_t)v84);
    objc_destroyWeak(&v86);
    objc_destroyWeak(&v85);
  }
  v45 = objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v42, v43);

  if (v45)
  {
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = sub_1C4F88F98;
    v81[3] = &unk_1E64F7588;
    objc_copyWeak(&v82, (id *)buf);
    objc_copyWeak(&v83, &from);
    objc_msgSend_setZoneDeletedBlock_(v10, v48, (uint64_t)v81);
    objc_destroyWeak(&v83);
    objc_destroyWeak(&v82);
  }
  v49 = objc_msgSend_recordZoneWithIDWasPurgedBlock(self, v46, v47);

  if (v49)
  {
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = sub_1C4F891D8;
    v78[3] = &unk_1E64F7588;
    objc_copyWeak(&v79, (id *)buf);
    objc_copyWeak(&v80, &from);
    objc_msgSend_setZonePurgedBlock_(v10, v52, (uint64_t)v78);
    objc_destroyWeak(&v80);
    objc_destroyWeak(&v79);
  }
  v53 = objc_msgSend_recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock(self, v50, v51);

  if (v53)
  {
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = sub_1C4F89418;
    v75[3] = &unk_1E64F7588;
    objc_copyWeak(&v76, (id *)buf);
    objc_copyWeak(&v77, &from);
    objc_msgSend_setZoneDeletedDueToEncryptedDataResetBlock_(v10, v56, (uint64_t)v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&v76);
  }
  v57 = objc_msgSend_container(self, v54, v55);
  v60 = objc_msgSend_options(v57, v58, v59);
  int v63 = objc_msgSend_useAnonymousToServerShareParticipants(v60, v61, v62);

  if (v63)
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = sub_1C4F89658;
    v72[3] = &unk_1E64F75B0;
    objc_copyWeak(&v73, (id *)buf);
    objc_copyWeak(&v74, &from);
    objc_msgSend_setAnonymousShareProcessingBlock_(v10, v65, (uint64_t)v72);
    objc_destroyWeak(&v74);
    objc_destroyWeak(&v73);
  }
  objc_msgSend_setRequest_(self, v64, (uint64_t)v10);
  v68 = objc_msgSend_container(self, v66, v67);
  objc_msgSend_performRequest_(v68, v69, (uint64_t)v10);

  objc_destroyWeak(&v91);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&v89);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (void)_handleAnonymousZoneDataObjects:(id)a3 schedulerInfo:(id)a4
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v8 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v29 = v8;
    LODWORD(location[0]) = 134217984;
    *(id *)((char *)location + 4) = (id)objc_msgSend_count(v6, v30, v31);
    _os_log_debug_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_DEBUG, "Handling encrypted anonymous share processing for: %lu number of anonymous zone data objects", (uint8_t *)location, 0xCu);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v39, v43, 16);
  if (v12)
  {
    uint64_t v33 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_fetchZonesGroup(self, v10, v11);
        dispatch_group_enter(v15);

        uint64_t v18 = objc_msgSend_perRequestCallbackGroup(v7, v16, v17);
        dispatch_group_enter(v18);

        objc_initWeak(location, self);
        uint64_t v21 = objc_msgSend_container(self, v19, v20);
        uint64_t v24 = objc_msgSend_anonymousSharingManager(v21, v22, v23);
        BOOL v27 = objc_msgSend_encryptedTupleData(v14, v25, v26);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = sub_1C4F89B30;
        v34[3] = &unk_1E64F7600;
        id v35 = v7;
        v36 = self;
        objc_copyWeak(&v38, location);
        id v37 = v14;
        objc_msgSend_decryptShareTuple_withCompletionBlock_(v24, v28, (uint64_t)v27, v34);

        objc_destroyWeak(&v38);
        objc_destroyWeak(location);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v39, v43, 16);
    }
    while (v12);
  }
}

- (void)main
{
  id v4 = objc_msgSend_previousServerChangeToken(self, a2, v2);
  id v7 = objc_msgSend_data(v4, v5, v6);
  objc_msgSend__sendFetchDatabaseChangesRequestWithChangeToken_previousRequestSchedulerInfo_(self, v8, (uint64_t)v7, 0);

  objc_initWeak(&location, self);
  uint64_t v11 = objc_msgSend_fetchZonesGroup(self, v9, v10);
  objc_msgSend_qualityOfService(self, v12, v13);
  id v14 = CKGetGlobalQueue();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4F8A338;
  v15[3] = &unk_1E64F09E0;
  objc_copyWeak(&v16, &location);
  dispatch_group_notify(v11, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setRecordZoneWithIDChangedBlock_(self, v5, 0);
  objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(self, v6, 0);
  objc_msgSend_setRecordZoneWithIDWasPurgedBlock_(self, v7, 0);
  objc_msgSend_setRecordZoneWithIDWasDeletedDueToEncryptedDataResetBlock_(self, v8, 0);
  v9.receiver = self;
  v9.super_class = (Class)CKDFetchDatabaseChangesOperation;
  [(CKDOperation *)&v9 _finishOnCallbackQueueWithError:v4];
}

- (id)analyticsPayload
{
  v26.receiver = self;
  v26.super_class = (Class)CKDFetchDatabaseChangesOperation;
  v3 = [(CKDDatabaseOperation *)&v26 analyticsPayload];
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = objc_msgSend_previousServerChangeToken(self, v5, v6);
  objc_super v9 = objc_msgSend_numberWithInt_(v4, v8, v7 != 0);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, 0x1F2058630);

  uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v12, v13);
  id v16 = objc_msgSend_numberWithBool_(v11, v15, AllChanges);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, 0x1F2058590);

  uint64_t v18 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v21 = objc_msgSend_resultsLimit(self, v19, v20);
  uint64_t v23 = objc_msgSend_numberWithUnsignedInteger_(v18, v22, v21);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, 0x1F2058650);

  return v3;
}

- (id)recordZoneWithIDChangedBlock
{
  return self->_recordZoneWithIDChangedBlock;
}

- (void)setRecordZoneWithIDChangedBlock:(id)a3
{
}

- (id)recordZoneWithIDWasDeletedBlock
{
  return self->_recordZoneWithIDWasDeletedBlock;
}

- (void)setRecordZoneWithIDWasDeletedBlock:(id)a3
{
}

- (id)recordZoneWithIDWasPurgedBlock
{
  return self->_recordZoneWithIDWasPurgedBlock;
}

- (void)setRecordZoneWithIDWasPurgedBlock:(id)a3
{
}

- (id)recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock
{
  return self->_recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock;
}

- (void)setRecordZoneWithIDWasDeletedDueToEncryptedDataResetBlock:(id)a3
{
}

- (id)serverChangeTokenUpdatedBlock
{
  return self->_serverChangeTokenUpdatedBlock;
}

- (void)setServerChangeTokenUpdatedBlock:(id)a3
{
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchuint64_t AllChanges = a3;
}

- (unint64_t)numRequestsSent
{
  return self->_numRequestsSent;
}

- (void)setNumRequestsSent:(unint64_t)a3
{
  self->_numRequestsSent = a3;
}

- (OS_dispatch_group)fetchZonesGroup
{
  return self->_fetchZonesGroup;
}

- (void)setFetchZonesGroup:(id)a3
{
}

- (NSMutableArray)requestInfos
{
  return self->_requestInfos;
}

- (void)setRequestInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfos, 0);
  objc_storeStrong((id *)&self->_fetchZonesGroup, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong(&self->_serverChangeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasPurgedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDChangedBlock, 0);
}

@end