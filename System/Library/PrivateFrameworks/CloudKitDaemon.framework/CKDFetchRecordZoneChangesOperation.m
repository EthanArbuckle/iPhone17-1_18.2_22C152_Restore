@interface CKDFetchRecordZoneChangesOperation
- (BOOL)clientIsUsingLegacyCKFetchRecordChangesOperationAPI;
- (CKDFetchRecordZoneChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKServerChangeToken)resultServerChangeToken;
- (NSData)resultClientChangeTokenData;
- (NSDictionary)supplementalChangeTokenByZoneID;
- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4;
- (id)_optionsForZonesWithPendingChangesAfterRequest:(id)a3;
- (id)activityCreate;
- (id)analyticsPayload;
- (id)pipeliningDescription;
- (id)recordChangedBlock;
- (id)recordDeletedBlock;
- (id)serverChangeTokenUpdatedBlock;
- (id)zoneAttributesChangedBlock;
- (int)operationType;
- (int64_t)changeTypes;
- (int64_t)resultStatus;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_noteAttributesChangedForZone:(id)a3;
- (void)_noteChangedRecordWithID:(id)a3 record:(id)a4 error:(id)a5;
- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4;
- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4;
- (void)_noteOperationBeginning;
- (void)_noteOperationEnding;
- (void)_noteOperationFinishedBlockEnd;
- (void)setChangeTypes:(int64_t)a3;
- (void)setClientIsUsingLegacyCKFetchRecordChangesOperationAPI:(BOOL)a3;
- (void)setRecordChangedBlock:(id)a3;
- (void)setRecordDeletedBlock:(id)a3;
- (void)setResultClientChangeTokenData:(id)a3;
- (void)setResultServerChangeToken:(id)a3;
- (void)setResultStatus:(int64_t)a3;
- (void)setServerChangeTokenUpdatedBlock:(id)a3;
- (void)setSupplementalChangeTokenByZoneID:(id)a3;
- (void)setZoneAttributesChangedBlock:(id)a3;
@end

@implementation CKDFetchRecordZoneChangesOperation

- (CKDFetchRecordZoneChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  objc_msgSend_takeValuesFrom_(v8, v9, (uint64_t)v6);
  v12 = objc_msgSend_recordZoneIDs(v6, v10, v11);
  objc_msgSend_setRecordZoneIDs_(v8, v13, (uint64_t)v12);

  v16 = objc_msgSend_configurationsByRecordZoneID(v6, v14, v15);
  objc_msgSend_setConfigurationsByRecordZoneID_(v8, v17, (uint64_t)v16);

  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(v6, v18, v19);
  objc_msgSend_setShouldFetchAssetContents_(v8, v21, AssetContents);
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(v6, v22, v23);
  objc_msgSend_setFetchAllChanges_(v8, v25, AllChanges);
  v28 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v6, v26, v27);
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v8, v29, (uint64_t)v28);

  uint64_t v32 = objc_msgSend_forcePCSDecryptionAttempt(v6, v30, v31);
  objc_msgSend_setForcePCSDecryptionAttempt_(v8, v33, v32);
  uint64_t v36 = objc_msgSend_errorReportingStyle(v6, v34, v35);
  objc_msgSend_setErrorReportingStyle_(v8, v37, v36);
  v52.receiver = self;
  v52.super_class = (Class)CKDFetchRecordZoneChangesOperation;
  v38 = [(CKDFetchBatchedRecordsOperation *)&v52 initWithOperationInfo:v8 container:v7];

  if (v38)
  {
    v38->_changeTypes = objc_msgSend_changeTypes(v6, v39, v40);
    uint64_t v43 = objc_msgSend_supplementalChangeTokenByZoneID(v6, v41, v42);
    supplementalChangeTokenByZoneID = v38->_supplementalChangeTokenByZoneID;
    v38->_supplementalChangeTokenByZoneID = (NSDictionary *)v43;

    objc_msgSend_ckOperationClassName(v6, v45, v46);
    v47 = (NSString *)objc_claimAutoreleasedReturnValue();
    Class v48 = NSClassFromString(v47);
    uint64_t v49 = objc_opt_class();
    v38->_clientIsUsingLegacyCKFetchRecordChangesOperationAPI = objc_msgSend_isSubclassOfClass_(v48, v50, v49) ^ 1;
  }
  return v38;
}

- (id)pipeliningDescription
{
  return @"fetchAllZoneChanges";
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-record-changes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_noteCompletedURLRequest:(id)a3 withSchedulerInfo:(id)a4
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v111 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v107 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v107, v108, (uint64_t)a2, self, @"CKDFetchRecordZoneChangesOperation.m", 67, &stru_1F2044F30);
  }
  id v112 = v7;
  v114 = objc_msgSend_container(self, v10, v11);
  v14 = objc_msgSend_recordZoneIDs(v112, v12, v13);
  v110 = objc_msgSend_resultsByRecordZoneID(v112, v15, v16);
  uint64_t v19 = objc_msgSend_zoneErrorsByZoneID(v112, v17, v18);
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = v14;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v122, v131, 16);
  if (v22)
  {
    uint64_t v24 = *(void *)v123;
    *(void *)&long long v23 = 138412290;
    long long v109 = v23;
    while (2)
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v123 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v122 + 1) + 8 * v25);
        uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v19, v21, v26, v109);
        if (objc_msgSend_CKIsNotFoundError(v27, v28, v29))
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v32 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            uint64_t v35 = v32;
            v38 = objc_msgSend_operationID(self, v36, v37);
            *(_DWORD *)buf = 138412546;
            uint64_t v128 = v26;
            __int16 v129 = 2114;
            v130 = v38;
            _os_log_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_INFO, "Warn: Zone %@ wasn't found on the server for fetch changes request %{public}@. Wiping caches for that zone", buf, 0x16u);
          }
          v39 = objc_msgSend_options(v114, v33, v34);
          if (objc_msgSend_useAnonymousToServerShareParticipants(v39, v40, v41))
          {
            BOOL v44 = objc_msgSend_databaseScope(self, v42, v43) == 3;

            if (v44)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v47 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v109;
                uint64_t v128 = v26;
                _os_log_debug_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", buf, 0xCu);
              }
              objc_initWeak((id *)buf, self);
              v50 = objc_msgSend_fetchRecordsGroup(self, v48, v49);
              dispatch_group_enter(v50);

              v53 = objc_msgSend_anonymousSharingManager(v114, v51, v52);
              uint64_t v126 = v26;
              v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v54, (uint64_t)&v126, 1);
              v120[0] = MEMORY[0x1E4F143A8];
              v120[1] = 3221225472;
              v120[2] = sub_1C4F85FBC;
              v120[3] = &unk_1E64F22C0;
              objc_copyWeak(&v121, (id *)buf);
              objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v53, v56, (uint64_t)v55, self, v120);

              objc_destroyWeak(&v121);
              objc_destroyWeak((id *)buf);
            }
          }
          else
          {
          }
          v57 = objc_msgSend_container(self, v45, v46);
          v60 = objc_msgSend_recordCache(v57, v58, v59);
          objc_msgSend_clearAllRecordsForZoneWithID_(v60, v61, v26);

          objc_msgSend_setPCSData_forFetchedZoneID_(self, v62, 0, v26);
          v65 = objc_msgSend_pcsCache(v114, v63, v64);
          objc_msgSend_removePCSDataForItemsInZoneWithID_(v65, v66, v26);
        }
        if (objc_msgSend_clientIsUsingLegacyCKFetchRecordChangesOperationAPI(self, v30, v31))
        {
          v69 = objc_msgSend_error(self, v67, v68);
          BOOL v70 = v69 == 0;

          if (v70)
          {
            objc_msgSend_setError_(self, v71, (uint64_t)v27);

            goto LABEL_28;
          }
        }

        ++v25;
      }
      while (v22 != v25);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v122, v131, 16);
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_28:

  v76 = objc_msgSend_error(self, v72, v73);
  if (v76) {
    goto LABEL_31;
  }
  if (objc_msgSend_clientIsUsingLegacyCKFetchRecordChangesOperationAPI(self, v74, v75))
  {
    v79 = objc_msgSend_firstObject(obj, v77, v78);
    v76 = objc_msgSend_objectForKeyedSubscript_(v110, v80, (uint64_t)v79);

    id v81 = objc_alloc(MEMORY[0x1E4F1A388]);
    v84 = objc_msgSend_resultServerChangeTokenData(v76, v82, v83);
    v86 = objc_msgSend_initWithData_(v81, v85, (uint64_t)v84);
    objc_msgSend_setResultServerChangeToken_(self, v87, (uint64_t)v86);

    v90 = objc_msgSend_resultClientChangeTokenData(v76, v88, v89);
    objc_msgSend_setResultClientChangeTokenData_(self, v91, (uint64_t)v90);

    uint64_t v94 = objc_msgSend_status(v76, v92, v93);
    objc_msgSend_setResultStatus_(self, v95, v94);
LABEL_31:
  }
  v96 = objc_msgSend_fetchRecordsGroup(self, v77, v78);
  dispatch_group_enter(v96);

  v99 = objc_msgSend_perRequestCallbackGroup(v111, v97, v98);
  v102 = objc_msgSend_perRequestCallbackQueue(v111, v100, v101);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F860D0;
  block[3] = &unk_1E64F0198;
  block[4] = self;
  id v116 = obj;
  id v117 = v110;
  id v118 = v19;
  id v119 = v111;
  id v103 = v111;
  id v104 = v19;
  id v105 = v110;
  id v106 = obj;
  dispatch_group_notify(v99, v102, block);
}

- (void)_noteChangedRecordWithID:(id)a3 record:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_recordChangedBlock(self, v10, v11);

  if (v12)
  {
    objc_msgSend_recordChangedBlock(self, v13, v14);
    uint64_t v15 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, id))v15)[2](v15, v16, v8, v9);
  }
}

- (void)_noteDeletedRecordWithID:(id)a3 recordType:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_recordDeletedBlock(self, v7, v8);

  if (v9)
  {
    objc_msgSend_recordDeletedBlock(self, v10, v11);
    v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id))v12)[2](v12, v13, v6);
  }
}

- (void)_noteAttributesChangedForZone:(id)a3
{
  id v10 = a3;
  id v6 = objc_msgSend_zoneAttributesChangedBlock(self, v4, v5);

  if (v6)
  {
    objc_msgSend_zoneAttributesChangedBlock(self, v7, v8);
    id v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v9)[2](v9, v10);
  }
}

- (id)_optionsForZonesWithPendingChangesAfterRequest:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CKDFetchRecordZoneChangesOperation.m", 164, &stru_1F2044F30);
  }
  id v8 = v5;
  id v9 = objc_opt_new();
  v12 = objc_msgSend_zoneErrorsByZoneID(v8, v10, v11);
  uint64_t v15 = objc_msgSend_resultsByRecordZoneID(v8, v13, v14);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4F868E8;
  v25[3] = &unk_1E64F74E8;
  id v26 = v12;
  id v27 = v8;
  id v16 = v9;
  id v28 = v16;
  id v17 = v8;
  id v18 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v15, v19, (uint64_t)v25);

  v20 = v28;
  id v21 = v16;

  return v21;
}

- (int)operationType
{
  return 213;
}

- (id)_createAndConfigureURLRequestForZoneIDs:(id)a3 optionsByZoneID:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    uint64_t v12 = objc_msgSend_count(v6, v10, v11);
    uint64_t v15 = objc_msgSend_count(v6, v13, v14);
    id v16 = @"s";
    *(_DWORD *)buf = 134218498;
    uint64_t v81 = v12;
    if (v15 == 1) {
      id v16 = &stru_1F2044F30;
    }
    __int16 v82 = 2114;
    uint64_t v83 = v16;
    __int16 v84 = 2112;
    id v85 = v7;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Fetching changes from the server for %lu zone%{public}@ with options:\n%@", buf, 0x20u);
  }
  id v17 = [CKDFetchRecordZoneChangesURLRequest alloc];
  uint64_t v19 = objc_msgSend_initWithOperation_recordZoneIDs_configurationsByRecordZoneID_(v17, v18, (uint64_t)self, v6, v7);
  uint64_t v22 = objc_msgSend_changeTypes(self, v20, v21);
  objc_msgSend_setChangeTypes_(v19, v23, v22);
  id v26 = objc_msgSend_supplementalChangeTokenByZoneID(self, v24, v25);
  objc_msgSend_setSupplementalChangeTokenByZoneID_(v19, v27, (uint64_t)v26);

  v30 = objc_msgSend_container(self, v28, v29);
  v33 = objc_msgSend_options(v30, v31, v32);
  uint64_t ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(v33, v34, v35);
  objc_msgSend_setFetchChangesForMergeableValues_(v19, v37, ChangesForMergeableValues);

  uint64_t v40 = objc_msgSend_desiredAssetKeys(self, v38, v39);
  uint64_t v43 = objc_msgSend_count(v40, v41, v42);

  if (v43)
  {
    uint64_t v46 = objc_msgSend_desiredAssetKeys(self, v44, v45);
    uint64_t v49 = objc_msgSend_copy(v46, v47, v48);
    objc_msgSend_setDesiredAssetKeys_(v19, v50, (uint64_t)v49);
  }
  else
  {
    uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(self, v44, v45);
    objc_msgSend_setShouldFetchAssetContent_(v19, v52, AssetContents);
  }
  objc_initWeak((id *)buf, self);
  v53 = [CKDPipeliningInfo alloc];
  v55 = objc_msgSend_initWithRequest_operation_(v53, v54, (uint64_t)v19, self);
  objc_initWeak(&location, v55);
  v58 = objc_msgSend_recordChangedBlock(self, v56, v57);

  if (v58)
  {
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = sub_1C4F86F68;
    v76[3] = &unk_1E64F2298;
    objc_copyWeak(&v77, (id *)buf);
    objc_copyWeak(&v78, &location);
    objc_msgSend_setRecordsChangedBlock_(v19, v59, (uint64_t)v76);
    objc_destroyWeak(&v78);
    objc_destroyWeak(&v77);
  }
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = sub_1C4F86FF8;
  v73[3] = &unk_1E64F7510;
  objc_copyWeak(&v74, (id *)buf);
  objc_copyWeak(&v75, &location);
  objc_msgSend_setRecordDeletedBlock_(v19, v60, (uint64_t)v73);
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = sub_1C4F8708C;
  v70[3] = &unk_1E64F7538;
  objc_copyWeak(&v71, (id *)buf);
  objc_copyWeak(&v72, &location);
  objc_msgSend_setZoneAttributesChangedBlock_(v19, v61, (uint64_t)v70);
  v63 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v62, (uint64_t)v6);
  if (objc_msgSend_count(v63, v64, v65))
  {
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = sub_1C4F8710C;
    v68[3] = &unk_1E64F1D18;
    id v69 = v63;
    objc_msgSend_updateCloudKitMetrics_(self, v66, (uint64_t)v68);
  }
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v55;
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
  objc_msgSend_setRecordChangedBlock_(self, v5, 0);
  objc_msgSend_setRecordDeletedBlock_(self, v6, 0);
  objc_msgSend_setZoneAttributesChangedBlock_(self, v7, 0);
  v8.receiver = self;
  v8.super_class = (Class)CKDFetchRecordZoneChangesOperation;
  [(CKDFetchBatchedRecordsOperation *)&v8 _finishOnCallbackQueueWithError:v4];
}

- (id)analyticsPayload
{
  v35.receiver = self;
  v35.super_class = (Class)CKDFetchRecordZoneChangesOperation;
  v3 = [(CKDDatabaseOperation *)&v35 analyticsPayload];
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = objc_msgSend_operationInfo(self, v5, v6);
  id v10 = objc_msgSend_recordZoneIDs(v7, v8, v9);
  uint64_t v13 = objc_msgSend_count(v10, v11, v12);
  uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(v4, v14, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, 0x1F2058570);

  id v17 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v18, v19);
  uint64_t v22 = objc_msgSend_numberWithBool_(v17, v21, AllChanges);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v22, 0x1F2058590);

  uint64_t v24 = (void *)MEMORY[0x1E4F28ED0];
  id v27 = objc_msgSend_operationInfo(self, v25, v26);
  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(v27, v28, v29);
  uint64_t v32 = objc_msgSend_numberWithBool_(v24, v31, AssetContents);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, 0x1F2058530);

  return v3;
}

- (id)recordChangedBlock
{
  return self->_recordChangedBlock;
}

- (void)setRecordChangedBlock:(id)a3
{
}

- (id)recordDeletedBlock
{
  return self->_recordDeletedBlock;
}

- (void)setRecordDeletedBlock:(id)a3
{
}

- (id)zoneAttributesChangedBlock
{
  return self->_zoneAttributesChangedBlock;
}

- (void)setZoneAttributesChangedBlock:(id)a3
{
}

- (id)serverChangeTokenUpdatedBlock
{
  return self->_serverChangeTokenUpdatedBlock;
}

- (void)setServerChangeTokenUpdatedBlock:(id)a3
{
}

- (CKServerChangeToken)resultServerChangeToken
{
  return self->_resultServerChangeToken;
}

- (void)setResultServerChangeToken:(id)a3
{
}

- (NSData)resultClientChangeTokenData
{
  return self->_resultClientChangeTokenData;
}

- (void)setResultClientChangeTokenData:(id)a3
{
}

- (int64_t)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(int64_t)a3
{
  self->_resultStatus = a3;
}

- (int64_t)changeTypes
{
  return self->_changeTypes;
}

- (void)setChangeTypes:(int64_t)a3
{
  self->_changeTypes = a3;
}

- (BOOL)clientIsUsingLegacyCKFetchRecordChangesOperationAPI
{
  return self->_clientIsUsingLegacyCKFetchRecordChangesOperationAPI;
}

- (void)setClientIsUsingLegacyCKFetchRecordChangesOperationAPI:(BOOL)a3
{
  self->_clientIsUsingLegacyCKFetchRecordChangesOperationAPI = a3;
}

- (NSDictionary)supplementalChangeTokenByZoneID
{
  return self->_supplementalChangeTokenByZoneID;
}

- (void)setSupplementalChangeTokenByZoneID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_resultServerChangeToken, 0);
  objc_storeStrong(&self->_serverChangeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_zoneAttributesChangedBlock, 0);
  objc_storeStrong(&self->_recordDeletedBlock, 0);
  objc_storeStrong(&self->_recordChangedBlock, 0);
}

@end