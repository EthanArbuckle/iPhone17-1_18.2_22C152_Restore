@interface CKDModifyRecordZonesOperation
+ (id)nameForState:(unint64_t)a3;
+ (int64_t)isPredominatelyDownload;
- (BOOL)_saveZonesToServer;
- (BOOL)allowDefaultZoneSave;
- (BOOL)didSynchronizeSigningIdentities;
- (BOOL)didSynchronizeUserKeyRegistry;
- (BOOL)dontFetchFromServer;
- (BOOL)isOperationType:(int)a3;
- (BOOL)makeStateTransition;
- (BOOL)markZonesAsUserPurged;
- (BOOL)needsSynchronizeSigningIdentities;
- (BOOL)supportsClearAssetEncryption;
- (CKDModifyRecordZonesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDPCSKeySyncCoreAnalytics)keySyncAnalytics;
- (NSArray)recordZoneIDsToDelete;
- (NSMutableArray)recordZonesToSave;
- (NSMutableArray)zonesWaitingOnKeyRegistrySync;
- (NSMutableDictionary)recordZonesByZoneID;
- (NSMutableDictionary)retryableErrorsByZoneID;
- (id)activityCreate;
- (id)deleteCompletionBlock;
- (id)relevantZoneIDs;
- (id)saveCompletionBlock;
- (int)numZoneSaveAttempts;
- (int)operationType;
- (int64_t)maxZoneSaveAttempts;
- (void)_checkAndPrepareZones;
- (void)_createNewPCSForZone:(id)a3 completionHandler:(id)a4;
- (void)_fetchPCSDataForZone:(id)a3 fromServer:(BOOL)a4;
- (void)_fetchPCSDataForZonesFromServer:(BOOL)a3;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleRecordZoneDeleted:(id)a3 responseCode:(id)a4;
- (void)_handleRecordZoneSaved:(id)a3 responseCode:(id)a4 serverCapabilities:(unint64_t)a5 expirationDate:(id)a6 expired:(BOOL)a7;
- (void)_sendCoreAnalyticsEventForKeySync;
- (void)_sendErrorForFailedZones;
- (void)_synchronizeSigningIdentitiesIfNeeded;
- (void)_synchronizeUserKeyRegistryIfNeeded;
- (void)main;
- (void)setAllowDefaultZoneSave:(BOOL)a3;
- (void)setDeleteCompletionBlock:(id)a3;
- (void)setDidSynchronizeSigningIdentities:(BOOL)a3;
- (void)setDidSynchronizeUserKeyRegistry:(BOOL)a3;
- (void)setDontFetchFromServer:(BOOL)a3;
- (void)setKeySyncAnalytics:(id)a3;
- (void)setMarkZonesAsUserPurged:(BOOL)a3;
- (void)setMaxZoneSaveAttempts:(int64_t)a3;
- (void)setNeedsSynchronizeSigningIdentities:(BOOL)a3;
- (void)setNumZoneSaveAttempts:(int)a3;
- (void)setRecordZoneIDsToDelete:(id)a3;
- (void)setRecordZonesByZoneID:(id)a3;
- (void)setRecordZonesToSave:(id)a3;
- (void)setRetryableErrorsByZoneID:(id)a3;
- (void)setSaveCompletionBlock:(id)a3;
- (void)setZonesWaitingOnKeyRegistrySync:(id)a3;
@end

@implementation CKDModifyRecordZonesOperation

- (CKDModifyRecordZonesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CKDModifyRecordZonesOperation;
  v9 = [(CKDDatabaseOperation *)&v58 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v10 = objc_msgSend_recordZonesToSave(v6, v7, v8);
    uint64_t v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    recordZonesToSave = v9->_recordZonesToSave;
    v9->_recordZonesToSave = (NSMutableArray *)v13;

    v9->_hasZoneSaves = objc_msgSend_count(v9->_recordZonesToSave, v15, v16) != 0;
    uint64_t v19 = objc_msgSend_recordZoneIDsToDelete(v6, v17, v18);
    recordZoneIDsToDelete = v9->_recordZoneIDsToDelete;
    v9->_recordZoneIDsToDelete = (NSArray *)v19;

    v9->_hasZoneDeletes = objc_msgSend_count(v9->_recordZoneIDsToDelete, v21, v22) != 0;
    v9->_allowDefaultZoneSave = objc_msgSend_allowDefaultZoneSave(v6, v23, v24);
    v9->_markZonesAsUserPurged = objc_msgSend_markZonesAsUserPurged(v6, v25, v26);
    uint64_t v29 = objc_msgSend_maxZoneSaveAttempts(v6, v27, v28);
    v9->_maxZoneSaveAttempts = v29;
    if (v29 <= 0)
    {
      v32 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v30, v31);
      v9->_maxZoneSaveAttempts = (int)objc_msgSend_PCSRetryCount(v32, v33, v34);
    }
    v9->_dontFetchFromServer = objc_msgSend_dontFetchFromServer(v6, v30, v31);
    uint64_t v35 = objc_opt_new();
    recordZonesByZoneID = v9->_recordZonesByZoneID;
    v9->_recordZonesByZoneID = (NSMutableDictionary *)v35;

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v37 = v9->_recordZonesToSave;
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v54, v59, 16);
    if (v39)
    {
      uint64_t v42 = v39;
      uint64_t v43 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v55 != v43) {
            objc_enumerationMutation(v37);
          }
          v45 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v46 = v9->_recordZonesByZoneID;
          v47 = objc_msgSend_zoneID(v45, v40, v41, (void)v54);
          objc_msgSend_setObject_forKeyedSubscript_(v46, v48, (uint64_t)v45, v47);
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v54, v59, 16);
      }
      while (v42);
    }

    uint64_t v49 = objc_opt_new();
    retryableErrorsByZoneID = v9->_retryableErrorsByZoneID;
    v9->_retryableErrorsByZoneID = (NSMutableDictionary *)v49;

    uint64_t v51 = objc_opt_new();
    zonesWaitingOnKeyRegistrySync = v9->_zonesWaitingOnKeyRegistrySync;
    v9->_zonesWaitingOnKeyRegistrySync = (NSMutableArray *)v51;
  }
  return v9;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      goto LABEL_12;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      int v8 = objc_msgSend_numZoneSaveAttempts(self, v6, v7);
      objc_msgSend_setNumZoneSaveAttempts_(self, v9, (v8 + 1));
      return MEMORY[0x1F4181798](self, sel__saveZonesToServer, v10);
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__synchronizeSigningIdentitiesIfNeeded(self, v20, v21);
      return 1;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__synchronizeUserKeyRegistryIfNeeded(self, v22, v23);
      return 1;
    case 5:
      int v11 = objc_msgSend_numZoneSaveAttempts(self, v4, v5);
      if (objc_msgSend_maxZoneSaveAttempts(self, v12, v13) <= v11)
      {
        BOOL v19 = 0;
      }
      else
      {
        uint64_t v16 = objc_msgSend_recordZonesToSave(self, v14, v15);
        BOOL v19 = objc_msgSend_count(v16, v17, v18) != 0;
      }
      uint64_t v24 = objc_msgSend_zonesWaitingOnKeyRegistrySync(self, v14, v15);
      uint64_t v27 = objc_msgSend_count(v24, v25, v26);

      if (v27 || !v19)
      {
        objc_msgSend__sendErrorForFailedZones(self, v4, v28);
        objc_msgSend__sendCoreAnalyticsEventForKeySync(self, v30, v31);
        objc_msgSend_setState_(self, v32, 0xFFFFFFFFLL);
        uint64_t v35 = objc_msgSend_error(self, v33, v34);
        objc_msgSend_finishWithError_(self, v36, (uint64_t)v35);
      }
      else
      {
LABEL_12:
        objc_msgSend_setState_(self, v4, 2);
        objc_msgSend__fetchPCSDataForZonesFromServer_(self, v29, 1);
      }
      return 1;
    default:
      return 1;
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/modify-record-zones", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 4)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDModifyRecordZonesOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F3DB0[a3 - 2];
  }
  return v3;
}

- (id)relevantZoneIDs
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_recordZonesToSave(self, a2, v2);
  uint64_t v7 = objc_msgSend_recordZoneIDsToDelete(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v4, v8, v9);
  uint64_t v13 = (void *)(objc_msgSend_count(v7, v11, v12) + v10);
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v13 = objc_msgSend_initWithCapacity_(v14, v15, (uint64_t)v13);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v4;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v28, v32, 16);
    if (v18)
    {
      uint64_t v21 = v18;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v16);
          }
          v25 = objc_msgSend_zoneID(*(void **)(*((void *)&v28 + 1) + 8 * i), v19, v20, (void)v28);
          if (v25) {
            objc_msgSend_addObject_(v13, v24, (uint64_t)v25);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v28, v32, 16);
      }
      while (v21);
    }

    objc_msgSend_addObjectsFromArray_(v13, v26, (uint64_t)v7);
  }

  return v13;
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (void)_synchronizeSigningIdentitiesIfNeeded
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_needsSynchronizeSigningIdentities(self, a2, v2)
    && (objc_msgSend_didSynchronizeSigningIdentities(self, v4, v5) & 1) == 0)
  {
    int v8 = objc_msgSend_topmostParentOperation(self, v6, v7);
    int v11 = objc_msgSend_operationID(v8, v9, v10);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      long long v30 = v11;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Will attempt user key sync to update signing identities for operation %{public}@.", buf, 0xCu);
    }
    uint64_t v15 = objc_msgSend_stateTransitionGroup(self, v13, v14);
    dispatch_group_enter(v15);

    objc_initWeak((id *)buf, self);
    objc_msgSend_noteOperationWillWaitOnPCS(self, v16, v17);
    uint64_t v20 = objc_msgSend_container(self, v18, v19);
    uint64_t v23 = objc_msgSend_pcsManager(v20, v21, v22);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1C4E1B7F8;
    v26[3] = &unk_1E64F3C78;
    objc_copyWeak(&v28, (id *)buf);
    id v24 = v11;
    id v27 = v24;
    objc_msgSend_synchronizeUserKeyRegistryForSigningIdentitiesForRequestorOperationID_completionHandler_(v23, v25, (uint64_t)v24, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_synchronizeUserKeyRegistryIfNeeded
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_zonesWaitingOnKeyRegistrySync(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_topmostParentOperation(self, v8, v9);
    uint64_t v13 = objc_msgSend_operationID(v10, v11, v12);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v14 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v13;
      _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_INFO, "Will attempt user key sync for operation %{public}@.", buf, 0xCu);
    }
    uint64_t v17 = objc_msgSend_stateTransitionGroup(self, v15, v16);
    dispatch_group_enter(v17);

    objc_initWeak((id *)buf, self);
    objc_msgSend_noteOperationWillWaitOnPCS(self, v18, v19);
    uint64_t v22 = objc_msgSend_container(self, v20, v21);
    v25 = objc_msgSend_pcsManager(v22, v23, v24);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1C4E1BBF0;
    v28[3] = &unk_1E64F3CA0;
    objc_copyWeak(&v30, (id *)buf);
    id v26 = v13;
    id v29 = v26;
    objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(v25, v27, 0, 1, 0x1F20587B0, v26, v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_sendCoreAnalyticsEventForKeySync
{
  v4 = objc_msgSend_keySyncAnalytics(self, a2, v2);

  if (!v4) {
    return;
  }
  uint64_t v7 = objc_msgSend_recordZonesToSave(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);

  if (!v10)
  {
    uint64_t v23 = objc_msgSend_keySyncAnalytics(self, v11, v12);
    objc_msgSend_setOverallResult_(v23, v28, @"success");
    goto LABEL_7;
  }
  uint64_t v13 = objc_msgSend_keySyncAnalytics(self, v11, v12);
  objc_msgSend_setOverallResult_(v13, v14, @"failure");

  uint64_t v17 = objc_msgSend_keySyncAnalytics(self, v15, v16);
  uint64_t v20 = objc_msgSend_error(v17, v18, v19);

  if (!v20)
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v21, *MEMORY[0x1E4F19DD8], 2037, 0, @"Error saving record zone to server: Protection data didn't match");
    id v26 = objc_msgSend_keySyncAnalytics(self, v24, v25);
    objc_msgSend_setError_(v26, v27, (uint64_t)v23);

LABEL_7:
  }
  objc_msgSend_container(self, v21, v22);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = objc_msgSend_pcsManager(v36, v29, v30);
  uint64_t v34 = objc_msgSend_keySyncAnalytics(self, v32, v33);
  objc_msgSend_sendCoreAnalyticsEventForKeySync_(v31, v35, (uint64_t)v34);
}

- (void)_sendErrorForFailedZones
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_recordZonesToSave(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6) && objc_msgSend_didSynchronizeUserKeyRegistry(self, v7, v8))
  {
    int v11 = objc_msgSend_numZoneSaveAttempts(self, v9, v10);

    if (v11 < 2) {
      goto LABEL_10;
    }
    v4 = objc_msgSend_container(self, v12, v13);
    uint64_t v16 = objc_msgSend_processName(v4, v14, v15);
    uint64_t v19 = objc_msgSend_containerID(v4, v17, v18);
    uint64_t v22 = objc_msgSend_containerIdentifier(v19, v20, v21);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v23 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      objc_super v58 = v23;
      v61 = objc_msgSend_recordZonesToSave(self, v59, v60);
      uint64_t v64 = objc_msgSend_count(v61, v62, v63);
      v67 = objc_msgSend_operationID(self, v65, v66);
      *(_DWORD *)buf = 134218754;
      uint64_t v78 = v64;
      __int16 v79 = 2114;
      *(void *)v80 = v67;
      *(_WORD *)&v80[8] = 2114;
      *(void *)&v80[10] = v16;
      __int16 v81 = 2114;
      v82 = v22;
      _os_log_fault_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_FAULT, "Failed to save %lu zones for operation %{public}@ despite user key sync. procName=%{public}@, containerID=%{public}@", buf, 0x2Au);
    }
  }

LABEL_10:
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  objc_msgSend_recordZonesToSave(self, v12, v13);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v72, v76, 16);
  if (v25)
  {
    uint64_t v28 = v25;
    uint64_t v29 = *(void *)v73;
    uint64_t v68 = *MEMORY[0x1E4F19DD8];
    uint64_t v30 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v73 != v29) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v72 + 1) + 8 * v31);
        uint64_t v33 = objc_msgSend_retryableErrorsByZoneID(self, v26, v27);
        id v36 = objc_msgSend_zoneID(v32, v34, v35);
        v38 = objc_msgSend_objectForKeyedSubscript_(v33, v37, (uint64_t)v36);

        if (!v38)
        {
          uint64_t v41 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v42 = objc_msgSend_zoneID(v32, v39, v40);
          v38 = objc_msgSend_errorWithDomain_code_userInfo_format_(v41, v43, v68, 2037, 0, @"Error saving record zone %@ to server: Protection data didn't match", v42);
        }
        if (*v30 != -1) {
          dispatch_once(v30, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v44 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          v47 = v44;
          v50 = objc_msgSend_zoneID(v32, v48, v49);
          int v53 = objc_msgSend_numZoneSaveAttempts(self, v51, v52);
          *(_DWORD *)buf = 138412802;
          uint64_t v78 = (uint64_t)v50;
          __int16 v79 = 1024;
          *(_DWORD *)v80 = v53;
          *(_WORD *)&v80[4] = 2112;
          *(void *)&v80[6] = v38;
          _os_log_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_INFO, "Failed to save zone %@ to the server %d times. Bailing with error: %@.", buf, 0x1Cu);
        }
        long long v54 = objc_msgSend_saveCompletionBlock(self, v45, v46);

        if (v54)
        {
          long long v57 = objc_msgSend_callbackQueue(self, v55, v56);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1C4E1C4E0;
          block[3] = &unk_1E64F0120;
          block[4] = self;
          block[5] = v32;
          id v71 = v38;
          dispatch_async(v57, block);
        }
        ++v31;
      }
      while (v28 != v31);
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v72, v76, 16);
    }
    while (v28);
  }
}

- (void)_handleRecordZoneSaved:(id)a3 responseCode:(id)a4 serverCapabilities:(unint64_t)a5 expirationDate:(id)a6 expired:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v217 = *MEMORY[0x1E4F143B8];
  id v199 = a3;
  id v198 = a4;
  id v197 = a6;
  uint64_t v14 = objc_msgSend_recordZonesByZoneID(self, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v199);

  if (v16)
  {
    uint64_t v19 = sub_1C4E94D98(v198);
    uint64_t v20 = (unsigned char *)MEMORY[0x1E4F1A4E0];
    if (*MEMORY[0x1E4F1A4E0])
    {
      if (objc_msgSend_checkAndClearUnitTestOverrides_(self, v17, @"SwizzleZoneSaveResponseToErrorZonePCSIdentityUnknown"))
      {
        objc_msgSend_setCode_(v198, v17, 3);
        uint64_t v19 = 2053;
      }
      if (*v20
        && objc_msgSend_checkAndClearUnitTestOverrides_(self, v17, @"SwizzleZoneSaveResponseToErrorZoneNotFound"))
      {
        objc_msgSend_setCode_(v198, v17, 3);
        uint64_t v19 = 2036;
      }
    }
    int v21 = objc_msgSend_code(v198, v17, v18);
    if (v199 && v21 == 1)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v24 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v216 = v16;
        _os_log_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_INFO, "RecordZone %@ was successfully saved to the server", buf, 0xCu);
      }
      objc_msgSend_setCapabilities_(v16, v25, a5);
      objc_msgSend_setExpirationDate_(v16, v26, (uint64_t)v197);
      objc_msgSend_setExpired_(v16, v27, v7);
      objc_msgSend_setHasUpdatedExpirationTimeInterval_(v16, v28, 0);
      objc_msgSend_setUpdatedExpirationTimeInterval_(v16, v29, 0);
      v32 = objc_msgSend_originalRequiredFeatures(v16, v30, v31);
      uint64_t v35 = objc_msgSend_requiredFeatures(v16, v33, v34);
      char isEqual = objc_msgSend_isEqual_(v32, v36, (uint64_t)v35);

      if ((isEqual & 1) == 0)
      {
        uint64_t v40 = objc_msgSend_requiredFeatures(v16, v38, v39);
        objc_msgSend_setOriginalRequiredFeatures_(v16, v41, (uint64_t)v40);
      }
      uint64_t v42 = objc_msgSend_recordZonesToSave(self, v38, v39);
      objc_sync_enter(v42);
      v45 = objc_msgSend_recordZonesToSave(self, v43, v44);
      objc_msgSend_removeObject_(v45, v46, (uint64_t)v16);

      objc_sync_exit(v42);
      uint64_t v49 = objc_msgSend_protectionData(v16, v47, v48);

      if (v49)
      {
        uint64_t v52 = objc_msgSend_stateTransitionGroup(self, v50, v51);
        dispatch_group_enter(v52);

        objc_initWeak((id *)buf, self);
        long long v55 = objc_msgSend_container(self, v53, v54);
        objc_super v58 = objc_msgSend_pcsManager(v55, v56, v57);
        v61 = objc_msgSend_protectionData(v16, v59, v60);
        v209[0] = MEMORY[0x1E4F143A8];
        v209[1] = 3221225472;
        v209[2] = sub_1C4E1D2D0;
        v209[3] = &unk_1E64F3CC8;
        objc_copyWeak(&v213, (id *)buf);
        id v210 = v199;
        id v211 = v16;
        v212 = self;
        objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v58, v62, (uint64_t)v61, 3, 0, v209);

        objc_destroyWeak(&v213);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v117 = objc_msgSend_saveCompletionBlock(self, v50, v51);

        if (v117)
        {
          v120 = objc_msgSend_callbackQueue(self, v118, v119);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1C4E1D744;
          block[3] = &unk_1E64F0120;
          block[4] = self;
          id v207 = v199;
          id v208 = v16;
          dispatch_async(v120, block);
        }
      }
      goto LABEL_63;
    }
    if (v19 == 2036)
    {
      v121 = objc_msgSend_container(self, v22, v23);
      v124 = objc_msgSend_options(v121, v122, v123);
      if (((v199 != 0) & objc_msgSend_useAnonymousToServerShareParticipants(v124, v125, v126)) == 1)
      {
        uint64_t v129 = objc_msgSend_databaseScope(self, v127, v128);

        if (v129 == 3)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v132 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v216 = v199;
            _os_log_debug_impl(&dword_1C4CFF000, v132, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", buf, 0xCu);
          }
          objc_initWeak((id *)buf, self);
          v135 = objc_msgSend_stateTransitionGroup(self, v133, v134);
          dispatch_group_enter(v135);

          v138 = objc_msgSend_container(self, v136, v137);
          v141 = objc_msgSend_anonymousSharingManager(v138, v139, v140);
          id v214 = v199;
          v143 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v142, (uint64_t)&v214, 1);
          v204[0] = MEMORY[0x1E4F143A8];
          v204[1] = 3221225472;
          v204[2] = sub_1C4E1D7CC;
          v204[3] = &unk_1E64F22C0;
          objc_copyWeak(&v205, (id *)buf);
          objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v141, v144, (uint64_t)v143, self, v204);

          objc_destroyWeak(&v205);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
      }
      v149 = objc_msgSend_container(self, v130, v131);
      v152 = objc_msgSend_recordCache(v149, v150, v151);
      objc_msgSend_clearAllRecordsForZoneWithID_(v152, v153, (uint64_t)v199);

      if (objc_msgSend_databaseScope(self, v154, v155) != 1 && objc_msgSend_databaseScope(self, v156, v157) != 4)
      {
        objc_msgSend_setPCSData_forFetchedZoneID_(self, v158, 0, v199);
        v161 = objc_msgSend_container(self, v159, v160);
        v164 = objc_msgSend_pcsCache(v161, v162, v163);
        objc_msgSend_removePCSDataForItemsInZoneWithID_(v164, v165, (uint64_t)v199);
      }
    }
    else if (v19 == 2053 || v19 == 2037)
    {
      uint64_t v64 = (void *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v65 = (os_log_t *)MEMORY[0x1E4F1A500];
      uint64_t v66 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v69 = v66;
        *(_DWORD *)buf = 138412546;
        *(void *)v216 = v199;
        *(_WORD *)&v216[8] = 1024;
        *(_DWORD *)&v216[10] = objc_msgSend_code(v198, v70, v71);
        _os_log_impl(&dword_1C4CFF000, v69, OS_LOG_TYPE_INFO, "Received a failure for save of zone %@ with error code %d. Re-fetching the zone PCS and trying again", buf, 0x12u);
      }
      if (v19 == 2053) {
        goto LABEL_31;
      }
      long long v72 = objc_msgSend_error(v198, v67, v68);
      long long v75 = objc_msgSend_errorDescription(v72, v73, v74);
      uint64_t v78 = objc_msgSend_lowercaseString(v75, v76, v77);
      int hasPrefix = objc_msgSend_hasPrefix_(v78, v79, @"zone pcs is created without the user's public key");

      if (hasPrefix)
      {
LABEL_31:
        if (*v64 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        os_log_t v82 = *v65;
        if (os_log_type_enabled(*v65, OS_LOG_TYPE_INFO))
        {
          v85 = v82;
          v88 = objc_msgSend_operationID(self, v86, v87);
          *(_DWORD *)buf = 138412546;
          *(void *)v216 = v199;
          *(_WORD *)&v216[8] = 2114;
          *(void *)&v216[10] = v88;
          _os_log_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_INFO, "Zone PCS for %@ failed server validation. Will attempt user key sync for operation %{public}@ before trying again.", buf, 0x16u);
        }
        if (!v199) {
          __assert_rtn("-[CKDModifyRecordZonesOperation _handleRecordZoneSaved:responseCode:serverCapabilities:expirationDate:expired:]", "CKDModifyRecordZonesOperation.m", 388, "zoneID");
        }
        v89 = objc_msgSend_zonesWaitingOnKeyRegistrySync(self, v83, v84);
        objc_msgSend_addObject_(v89, v90, (uint64_t)v199);
      }
      objc_msgSend_setProtectionData_(v16, v81, 0);
      objc_msgSend_setZoneishProtectionData_(v16, v91, 0);
      objc_msgSend_setProtectionEtag_(v16, v92, 0);
      objc_msgSend_setPreviousProtectionEtag_(v16, v93, 0);
      objc_msgSend_setZonePCS_(v16, v94, 0);
      objc_msgSend_setZoneishPCS_(v16, v95, 0);
      objc_msgSend_setPCSData_forFetchedZoneID_(self, v96, 0, v199);
      v97 = (void *)MEMORY[0x1E4F1A280];
      v100 = objc_msgSend_request(self, v98, v99);
      v101 = sub_1C4E940D0(v100, v198);
      v104 = objc_msgSend_error(v198, v102, v103);
      char hasErrorDescription = objc_msgSend_hasErrorDescription(v104, v105, v106);
      uint64_t v110 = *MEMORY[0x1E4F19DD8];
      if (hasErrorDescription)
      {
        v111 = objc_msgSend_error(v198, v108, v109);
        v114 = objc_msgSend_errorDescription(v111, v112, v113);
        v116 = objc_msgSend_errorWithDomain_code_userInfo_format_(v97, v115, v110, v19, v101, @"Error saving record zone %@ to server: %@", v16, v114);
      }
      else
      {
        v116 = objc_msgSend_errorWithDomain_code_userInfo_format_(v97, v108, v110, v19, v101, @"Error saving record zone %@ to server: %@", v16, @"Protection data didn't match");
      }

      if (v199)
      {
        v147 = objc_msgSend_retryableErrorsByZoneID(self, v145, v146);
        objc_msgSend_setObject_forKeyedSubscript_(v147, v148, (uint64_t)v116, v199);
      }
      goto LABEL_63;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v166 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v169 = v166;
      int v172 = objc_msgSend_code(v198, v170, v171);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v216 = v172;
      *(_WORD *)&v216[4] = 2112;
      *(void *)&v216[6] = v16;
      _os_log_impl(&dword_1C4CFF000, v169, OS_LOG_TYPE_INFO, "Error %d when saving record zone %@ to the server", buf, 0x12u);
    }
    v173 = (void *)MEMORY[0x1E4F1A280];
    v174 = objc_msgSend_request(self, v167, v168);
    v175 = sub_1C4E940D0(v174, v198);
    v178 = objc_msgSend_error(v198, v176, v177);
    v181 = objc_msgSend_errorDescription(v178, v179, v180);
    v183 = objc_msgSend_errorWithDomain_code_userInfo_format_(v173, v182, *MEMORY[0x1E4F19DD8], v19, v175, @"Error saving record zone %@ to server: %@", v16, v181);

    v186 = objc_msgSend_recordZonesToSave(self, v184, v185);
    objc_sync_enter(v186);
    v189 = objc_msgSend_recordZonesToSave(self, v187, v188);
    objc_msgSend_removeObject_(v189, v190, (uint64_t)v16);

    objc_sync_exit(v186);
    v193 = objc_msgSend_saveCompletionBlock(self, v191, v192);

    if (v193)
    {
      v196 = objc_msgSend_callbackQueue(self, v194, v195);
      v200[0] = MEMORY[0x1E4F143A8];
      v200[1] = 3221225472;
      v200[2] = sub_1C4E1D8E0;
      v200[3] = &unk_1E64F0DF0;
      v200[4] = self;
      id v201 = v199;
      id v202 = v16;
      id v203 = v183;
      dispatch_async(v196, v200);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v63 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v216 = v199;
      _os_log_error_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_ERROR, "Got a response for record zone with ID %@, but we didn't try to put that record zone.", buf, 0xCu);
    }
  }
LABEL_63:
}

- (void)_handleRecordZoneDeleted:(id)a3 responseCode:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v10 = objc_msgSend_code(v7, v8, v9);
  int v11 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v12 = *MEMORY[0x1E4F1A550];
  if (v10 == 1)
  {
    if (v12 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v6;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "RecordZone %@ was successfully deleted from the server", buf, 0xCu);
    }
    objc_msgSend_setPCSData_forFetchedZoneID_(self, v14, 0, v6);
    uint64_t v17 = objc_msgSend_container(self, v15, v16);
    uint64_t v20 = objc_msgSend_pcsCache(v17, v18, v19);
    objc_msgSend_removePCSDataForItemsInZoneWithID_(v20, v21, (uint64_t)v6);

    uint64_t v24 = objc_msgSend_container(self, v22, v23);
    uint64_t v27 = objc_msgSend_recordCache(v24, v25, v26);
    objc_msgSend_clearAllRecordsForZoneWithID_(v27, v28, (uint64_t)v6);
    uint64_t v29 = 0;
  }
  else
  {
    if (v12 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    uint64_t v30 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v53 = v7;
      __int16 v54 = 2112;
      id v55 = v6;
      _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "Error %@ when deleting record zone %@ from the server", buf, 0x16u);
    }
    uint64_t v31 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v32 = *MEMORY[0x1E4F19DD8];
    uint64_t v33 = sub_1C4E94D98(v7);
    uint64_t v24 = objc_msgSend_request(self, v34, v35);
    uint64_t v27 = sub_1C4E940D0(v24, v7);
    v38 = objc_msgSend_error(v7, v36, v37);
    uint64_t v41 = objc_msgSend_errorDescription(v38, v39, v40);
    uint64_t v29 = objc_msgSend_errorWithDomain_code_userInfo_format_(v31, v42, v32, v33, v27, @"Error deleting record zone %@: %@", v6, v41);
  }
  v45 = objc_msgSend_deleteCompletionBlock(self, v43, v44);

  if (v45)
  {
    uint64_t v48 = objc_msgSend_callbackQueue(self, v46, v47);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4E1DC98;
    block[3] = &unk_1E64F0120;
    block[4] = self;
    id v50 = v6;
    id v51 = v29;
    dispatch_async(v48, block);
  }
}

- (BOOL)_saveZonesToServer
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_recordZonesToSave(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6))
  {

    goto LABEL_4;
  }
  uint64_t v9 = objc_msgSend_recordZoneIDsToDelete(self, v7, v8);
  uint64_t v12 = objc_msgSend_count(v9, v10, v11);

  if (v12)
  {
LABEL_4:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v13;
      uint64_t v19 = objc_msgSend_recordZonesToSave(self, v17, v18);
      uint64_t v22 = objc_msgSend_count(v19, v20, v21);
      uint64_t v25 = objc_msgSend_recordZoneIDsToDelete(self, v23, v24);
      *(_DWORD *)buf = 134218240;
      uint64_t v138 = v22;
      __int16 v139 = 2048;
      uint64_t v140 = objc_msgSend_count(v25, v26, v27);
      _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "Saving %ld, deleting %ld record zones on the server.", buf, 0x16u);
    }
    if (*MEMORY[0x1E4F1A4E0])
    {
      uint64_t v28 = objc_msgSend_unitTestOverrides(self, v14, v15);
      uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v28, v29, @"AddRandomShareeIdentityToZonePCS");
      BOOL v31 = v30 == 0;

      if (!v31)
      {
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        uint64_t v32 = objc_msgSend_recordZonesToSave(self, v14, v15);
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v132, v136, 16);
        if (v36)
        {
          uint64_t v38 = *(void *)v133;
          *(void *)&long long v37 = 138412290;
          long long v124 = v37;
          do
          {
            uint64_t v39 = 0;
            do
            {
              if (*(void *)v133 != v38) {
                objc_enumerationMutation(v32);
              }
              uint64_t v40 = *(void **)(*((void *)&v132 + 1) + 8 * v39);
              uint64_t v43 = objc_msgSend_zonePCS(v40, v34, v35, v124);
              if (v43)
              {
                uint64_t v44 = objc_msgSend_container(self, v41, v42);
                uint64_t v47 = objc_msgSend_pcsManager(v44, v45, v46);
                int v49 = objc_msgSend_addRandomShareeToPCS_(v47, v48, v43);

                if (v49)
                {
                  objc_msgSend_setZonePCS_(v40, v34, v43);
                  uint64_t v52 = objc_msgSend_container(self, v50, v51);
                  id v55 = objc_msgSend_pcsManager(v52, v53, v54);
                  id v131 = 0;
                  uint64_t v57 = objc_msgSend_dataFromZonePCS_error_(v55, v56, v43, &v131);
                  id v58 = v131;

                  if (!v57 || v58)
                  {
                    if (*MEMORY[0x1E4F1A550] != -1) {
                      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                    }
                    uint64_t v64 = *MEMORY[0x1E4F1A500];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = v124;
                      uint64_t v138 = (uint64_t)v58;
                      _os_log_error_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_ERROR, "Failed to create PCS data, skipping AddRandomShareeIdentityToZonePCS. error: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    objc_msgSend_setProtectionData_(v40, v59, (uint64_t)v57);
                    v61 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v60, (uint64_t)v57);
                    objc_msgSend_setProtectionEtag_(v40, v62, (uint64_t)v61);
                  }
                }
              }
              else
              {
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                uint64_t v63 = *MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_INFO, "Warn: PCS not available for the zone, skipping AddRandomShareeIdentityToZonePCS", buf, 2u);
                }
              }
              ++v39;
            }
            while (v36 != v39);
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v132, v136, 16);
          }
          while (v36);
        }
      }
    }
    v65 = objc_msgSend_stateTransitionGroup(self, v14, v15);
    dispatch_group_enter(v65);

    uint64_t v66 = [CKDModifyRecordZonesURLRequest alloc];
    v69 = objc_msgSend_recordZonesToSave(self, v67, v68);
    long long v72 = objc_msgSend_recordZoneIDsToDelete(self, v70, v71);
    uint64_t v74 = objc_msgSend_initWithOperation_recordZonesToSave_recordZoneIDsToDelete_(v66, v73, (uint64_t)self, v69, v72);

    uint64_t v77 = objc_msgSend_markZonesAsUserPurged(self, v75, v76);
    objc_msgSend_setMarkZonesAsUserPurged_(v74, v78, v77);
    __int16 v81 = objc_msgSend_container(self, v79, v80);
    uint64_t v84 = objc_msgSend_options(v81, v82, v83);
    if ((objc_msgSend_bypassPCSEncryption(v84, v85, v86) & 1) == 0)
    {
      v89 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v87, v88);
      int v92 = objc_msgSend_useEncryption(v89, v90, v91);

      if (!v92) {
        goto LABEL_36;
      }
      __int16 v81 = objc_msgSend_container(self, v93, v94);
      uint64_t v84 = objc_msgSend_pcsManager(v81, v95, v96);
      uint64_t v99 = objc_msgSend_lastMissingManateeIdentityErrorDateForCurrentService(v84, v97, v98);
      objc_msgSend_setLastMissingManateeIdentityErrorDate_(v74, v100, (uint64_t)v99);
    }
    if (!*MEMORY[0x1E4F1A4E0]) {
      goto LABEL_39;
    }
    v101 = objc_msgSend_unitTestOverrides(self, v93, v94);
    uint64_t v103 = objc_msgSend_objectForKeyedSubscript_(v101, v102, @"EnsureLastMissingManateeIdentityErrorDateOnZoneDelete");

    if (!v103) {
      goto LABEL_39;
    }
LABEL_36:
    uint64_t v106 = objc_msgSend_lastMissingManateeIdentityErrorDate(v74, v104, v105);
    BOOL v107 = v106 == 0;

    if (v107)
    {
      uint64_t v119 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v108, *MEMORY[0x1E4F19DD8], 1, @"Failing zone delete for unit tests because we should have had a lastMissingManateeIdentityErrorDate");
      objc_msgSend_setError_(self, v120, (uint64_t)v119);

      uint64_t v123 = objc_msgSend_stateTransitionGroup(self, v121, v122);
      dispatch_group_leave(v123);

      BOOL v116 = 0;
    }
    else
    {
LABEL_39:
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v74);
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = sub_1C4E1E52C;
      v128[3] = &unk_1E64F3CF0;
      objc_copyWeak(&v129, (id *)buf);
      objc_msgSend_setRecordZoneModifiedBlock_(v74, v109, (uint64_t)v128);
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = sub_1C4E1E61C;
      v125[3] = &unk_1E64F0170;
      objc_copyWeak(&v126, (id *)buf);
      objc_copyWeak(&v127, &location);
      objc_msgSend_setCompletionBlock_(v74, v110, (uint64_t)v125);
      objc_msgSend_setRequest_(self, v111, (uint64_t)v74);
      v114 = objc_msgSend_container(self, v112, v113);
      objc_msgSend_performRequest_(v114, v115, (uint64_t)v74);

      objc_destroyWeak(&v127);
      objc_destroyWeak(&v126);
      objc_destroyWeak(&v129);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
      BOOL v116 = 1;
    }

    return v116;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v118 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v118, OS_LOG_TYPE_INFO, "Skipping save of zones because there is nothing to do", buf, 2u);
  }
  return 0;
}

- (int)operationType
{
  BOOL hasZoneSaves = self->_hasZoneSaves;
  int result = 200;
  if (!hasZoneSaves)
  {
    if (self->_hasZoneDeletes) {
      return 202;
    }
    else {
      return 200;
    }
  }
  return result;
}

- (BOOL)isOperationType:(int)a3
{
  if (a3 == 200)
  {
    v3 = &OBJC_IVAR___CKDModifyRecordZonesOperation__hasZoneSaves;
    return *((unsigned char *)&self->super.super.super.super.isa + *v3) != 0;
  }
  if (a3 == 202)
  {
    v3 = &OBJC_IVAR___CKDModifyRecordZonesOperation__hasZoneDeletes;
    return *((unsigned char *)&self->super.super.super.super.isa + *v3) != 0;
  }
  return 0;
}

- (void)_createNewPCSForZone:(id)a3 completionHandler:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_1C4E1ECEC;
  v49[4] = sub_1C4E1ECFC;
  id v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = sub_1C4E1ECEC;
  v47[4] = sub_1C4E1ECFC;
  id v48 = 0;
  int v10 = objc_msgSend_container(self, v8, v9);
  uint64_t v11 = dispatch_group_create();
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v12 = (id)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_msgSend_zoneID(v6, v13, v14);
    *(_DWORD *)buf = 138412290;
    uint64_t v52 = v15;
    _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Creating new PCS data for zone %@", buf, 0xCu);
  }
  dispatch_group_enter(v11);
  objc_msgSend_noteOperationWillWaitOnPCS(self, v16, v17);
  objc_initWeak((id *)buf, self);
  uint64_t v20 = objc_msgSend_pcsManager(v10, v18, v19);
  uint64_t v23 = objc_msgSend_topmostParentOperation(self, v21, v22);
  uint64_t v26 = objc_msgSend_operationID(v23, v24, v25);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1C4E1ED04;
  v42[3] = &unk_1E64F3D18;
  objc_copyWeak(&v46, (id *)buf);
  uint64_t v44 = v49;
  v45 = v47;
  uint64_t v27 = v11;
  uint64_t v43 = v27;
  objc_msgSend_createZonePCSWithRequestorOperationID_completionHandler_(v20, v28, (uint64_t)v26, v42);

  BOOL v31 = objc_msgSend_callbackQueue(self, v29, v30);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1C4E1EDB4;
  v35[3] = &unk_1E64F3D40;
  id v36 = v10;
  id v37 = v6;
  uint64_t v40 = v47;
  uint64_t v41 = v49;
  uint64_t v38 = self;
  id v39 = v7;
  id v32 = v7;
  id v33 = v6;
  id v34 = v10;
  dispatch_group_notify(v27, v31, v35);

  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
}

- (void)_fetchPCSDataForZone:(id)a3 fromServer:(BOOL)a4
{
  id v5 = a3;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_1C4E1ECEC;
  v39[4] = sub_1C4E1ECFC;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_1C4E1ECEC;
  v37[4] = sub_1C4E1ECFC;
  id v38 = 0;
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v9 = objc_msgSend_stateTransitionGroup(self, v7, v8);
  dispatch_group_enter(v9);

  uint64_t v12 = objc_msgSend_container(self, v10, v11);
  uint64_t v15 = objc_msgSend_pcsCache(v12, v13, v14);
  uint64_t v18 = objc_msgSend_zoneID(v5, v16, v17);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4E1F8F4;
  v31[3] = &unk_1E64F3D68;
  uint64_t v35 = v37;
  id v19 = v5;
  id v32 = v19;
  id v33 = self;
  id v36 = v39;
  uint64_t v20 = v6;
  id v34 = v20;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v15, v21, (uint64_t)v18, self, 0, v31);

  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E1FE70;
  block[3] = &unk_1E64F3D90;
  uint64_t v29 = v39;
  uint64_t v30 = v37;
  id v27 = v19;
  uint64_t v28 = self;
  id v25 = v19;
  dispatch_group_notify(v20, v24, block);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
}

- (void)_fetchPCSDataForZonesFromServer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_dontFetchFromServer(self, a2, a3))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v7 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = v7;
      uint64_t v11 = objc_msgSend_operationID(self, v9, v10);
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = (uint64_t)v11;
      _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Skipping fetch of zones from the server for operation %{public}@ because it has dontFetchFromServer set", buf, 0xCu);
    }
    return;
  }
  if (objc_msgSend_useEncryption(self, v5, v6))
  {
    uint64_t v14 = objc_msgSend_recordZonesToSave(self, v12, v13);
    uint64_t v17 = objc_msgSend_count(v14, v15, v16);

    uint64_t v18 = (void *)*MEMORY[0x1E4F1A548];
    id v19 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    if (v17)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v18);
      }
      uint64_t v20 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = v20;
        uint64_t v26 = objc_msgSend_recordZonesToSave(self, v24, v25);
        *(_DWORD *)buf = 134217984;
        uint64_t v59 = objc_msgSend_count(v26, v27, v28);
        _os_log_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_INFO, "Preparing PCS data for %ld zones", buf, 0xCu);
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v29 = objc_msgSend_recordZonesToSave(self, v21, v22);
      id v32 = objc_msgSend_copy(v29, v30, v31);

      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v53, v57, 16);
      if (v34)
      {
        uint64_t v38 = v34;
        uint64_t v39 = *(void *)v54;
        id v40 = (os_log_t *)MEMORY[0x1E4F1A528];
        *(void *)&long long v37 = 138412290;
        long long v52 = v37;
        do
        {
          uint64_t v41 = 0;
          do
          {
            if (*(void *)v54 != v39) {
              objc_enumerationMutation(v32);
            }
            uint64_t v42 = *(void **)(*((void *)&v53 + 1) + 8 * v41);
            uint64_t v43 = objc_msgSend_protectionData(v42, v35, v36, v52);

            if (v43)
            {
              if (*v19 != -1) {
                dispatch_once(v19, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              os_log_t v45 = *v40;
              if (os_log_type_enabled(*v40, OS_LOG_TYPE_INFO))
              {
                id v46 = v45;
                int v49 = objc_msgSend_zoneID(v42, v47, v48);
                *(_DWORD *)buf = v52;
                uint64_t v59 = (uint64_t)v49;
                _os_log_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_INFO, "Zone %@ already has PCS data.", buf, 0xCu);
              }
            }
            else
            {
              objc_msgSend__fetchPCSDataForZone_fromServer_(self, v44, (uint64_t)v42, v3);
            }
            ++v41;
          }
          while (v38 != v41);
          uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v53, v57, 16);
        }
        while (v38);
      }

      if (*v19 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v50 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v51 = "Waiting to fetch zone PCS data";
LABEL_37:
        _os_log_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_INFO, v51, buf, 2u);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v18);
      }
      id v50 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v51 = "No zone to save in this operation.";
        goto LABEL_37;
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v50 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v51 = "Skipping zone PCS stuff because encryption is disabled";
      goto LABEL_37;
    }
  }
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)_checkAndPrepareZones
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_allowDefaultZoneSave(self, a2, v2) & 1) == 0)
  {
    uint64_t v6 = objc_msgSend_recordZonesToSave(self, v4, v5);
    uint64_t v41 = objc_msgSend_mutableCopy(v6, v7, v8);

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v11 = objc_msgSend_recordZonesToSave(self, v9, v10);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v44, v48, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v45;
      uint64_t v18 = *MEMORY[0x1E4F19DD8];
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v11);
          }
          uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v21 = objc_msgSend_zoneID(v20, v14, v15, v41);
          int isDefaultRecordZoneID = objc_msgSend_isDefaultRecordZoneID(v21, v22, v23);

          if (isDefaultRecordZoneID)
          {
            uint64_t v25 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, v18, 1017, @"You can't save the default zone");
            uint64_t v28 = objc_msgSend_callbackQueue(self, v26, v27);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1C4E2078C;
            block[3] = &unk_1E64F0120;
            void block[4] = self;
            void block[5] = v20;
            id v43 = v25;
            id v29 = v25;
            dispatch_async(v28, block);

            objc_msgSend_removeObject_(v41, v30, (uint64_t)v20);
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v44, v48, 16);
      }
      while (v16);
    }

    uint64_t v33 = objc_msgSend_count(v41, v31, v32);
    uint64_t v36 = objc_msgSend_recordZonesToSave(self, v34, v35);
    uint64_t v39 = objc_msgSend_count(v36, v37, v38);

    if (v33 != v39) {
      objc_msgSend_setRecordZonesToSave_(self, v40, (uint64_t)v41);
    }
  }
}

- (void)main
{
  objc_msgSend__checkAndPrepareZones(self, a2, v2);
  uint64_t v6 = objc_msgSend_recordZonesToSave(self, v4, v5);
  if (objc_msgSend_count(v6, v7, v8))
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend_recordZoneIDsToDelete(self, v9, v10);
    BOOL v11 = objc_msgSend_count(v12, v13, v14) == 0;
  }
  objc_msgSend_makeStateTransition_(self, v15, v11);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_recordZonesByZoneID(self, v6, v7);
  BOOL v11 = objc_msgSend_allKeys(v8, v9, v10);
  uint64_t v13 = objc_msgSend_setWithArray_(v4, v12, (uint64_t)v11);

  if (objc_msgSend_count(v13, v14, v15))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1C4E209E0;
    v20[3] = &unk_1E64F1D18;
    id v21 = v13;
    objc_msgSend_updateCloudKitMetrics_(self, v17, (uint64_t)v20);
  }
  objc_msgSend_setSaveCompletionBlock_(self, v16, 0);
  objc_msgSend_setDeleteCompletionBlock_(self, v18, 0);
  v19.receiver = self;
  v19.super_class = (Class)CKDModifyRecordZonesOperation;
  [(CKDOperation *)&v19 _finishOnCallbackQueueWithError:v5];
}

- (id)saveCompletionBlock
{
  return self->_saveCompletionBlock;
}

- (void)setSaveCompletionBlock:(id)a3
{
}

- (id)deleteCompletionBlock
{
  return self->_deleteCompletionBlock;
}

- (void)setDeleteCompletionBlock:(id)a3
{
}

- (NSMutableArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
}

- (NSMutableDictionary)recordZonesByZoneID
{
  return self->_recordZonesByZoneID;
}

- (void)setRecordZonesByZoneID:(id)a3
{
}

- (NSMutableDictionary)retryableErrorsByZoneID
{
  return self->_retryableErrorsByZoneID;
}

- (void)setRetryableErrorsByZoneID:(id)a3
{
}

- (BOOL)allowDefaultZoneSave
{
  return self->_allowDefaultZoneSave;
}

- (void)setAllowDefaultZoneSave:(BOOL)a3
{
  self->_allowDefaultZoneSave = a3;
}

- (BOOL)markZonesAsUserPurged
{
  return self->_markZonesAsUserPurged;
}

- (void)setMarkZonesAsUserPurged:(BOOL)a3
{
  self->_markZonesAsUserPurged = a3;
}

- (int)numZoneSaveAttempts
{
  return self->_numZoneSaveAttempts;
}

- (void)setNumZoneSaveAttempts:(int)a3
{
  self->_numZoneSaveAttempts = a3;
}

- (int64_t)maxZoneSaveAttempts
{
  return self->_maxZoneSaveAttempts;
}

- (void)setMaxZoneSaveAttempts:(int64_t)a3
{
  self->_maxZoneSaveAttempts = a3;
}

- (BOOL)dontFetchFromServer
{
  return self->_dontFetchFromServer;
}

- (void)setDontFetchFromServer:(BOOL)a3
{
  self->_dontFetchFromServer = a3;
}

- (BOOL)didSynchronizeUserKeyRegistry
{
  return self->_didSynchronizeUserKeyRegistry;
}

- (void)setDidSynchronizeUserKeyRegistry:(BOOL)a3
{
  self->_didSynchronizeUserKeyRegistry = a3;
}

- (NSMutableArray)zonesWaitingOnKeyRegistrySync
{
  return self->_zonesWaitingOnKeyRegistrySync;
}

- (void)setZonesWaitingOnKeyRegistrySync:(id)a3
{
}

- (CKDPCSKeySyncCoreAnalytics)keySyncAnalytics
{
  return self->_keySyncAnalytics;
}

- (void)setKeySyncAnalytics:(id)a3
{
}

- (BOOL)needsSynchronizeSigningIdentities
{
  return self->_needsSynchronizeSigningIdentities;
}

- (void)setNeedsSynchronizeSigningIdentities:(BOOL)a3
{
  self->_needsSynchronizeSigningIdentities = a3;
}

- (BOOL)didSynchronizeSigningIdentities
{
  return self->_didSynchronizeSigningIdentities;
}

- (void)setDidSynchronizeSigningIdentities:(BOOL)a3
{
  self->_didSynchronizeSigningIdentities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySyncAnalytics, 0);
  objc_storeStrong((id *)&self->_zonesWaitingOnKeyRegistrySync, 0);
  objc_storeStrong((id *)&self->_retryableErrorsByZoneID, 0);
  objc_storeStrong((id *)&self->_recordZonesByZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
  objc_storeStrong(&self->_deleteCompletionBlock, 0);
  objc_storeStrong(&self->_saveCompletionBlock, 0);
}

@end