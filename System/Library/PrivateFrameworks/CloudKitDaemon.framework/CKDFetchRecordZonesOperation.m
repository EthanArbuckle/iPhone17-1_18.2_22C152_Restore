@interface CKDFetchRecordZonesOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)_locked_checkAndUpdateZonePCSIfNeededForZone:(id)a3 error:(id *)a4;
- (BOOL)ignorePCSFailures;
- (BOOL)isFetchAllRecordZonesOperation;
- (BOOL)makeStateTransition;
- (BOOL)onlyFetchPCSInfo;
- (BOOL)shouldRetry;
- (CKDFetchRecordZonesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)recordZoneIDs;
- (NSMutableArray)zoneIDsNeedingPCSUpdateRetry;
- (NSMutableDictionary)pcsUpdateErrorsByZoneID;
- (NSMutableDictionary)zonesToSaveForPCSUpdateByZoneID;
- (NSMutableSet)zoneIDsNeedingDugongKeyRoll;
- (id)activityCreate;
- (id)recordZoneFetchedProgressBlock;
- (int)operationType;
- (int64_t)numZoneSaveAttempts;
- (void)_cachePCSOnRecordZone:(id)a3;
- (void)_continueHandlingFetchedRecordZone:(id)a3 zoneID:(id)a4;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleAnonymousZoneDataObjects:(id)a3 responsecode:(id)a4;
- (void)_handleRecordZoneFetch:(id)a3 zoneID:(id)a4 responseCode:(id)a5 error:(id)a6;
- (void)_handleRecordZoneSaved:(id)a3 error:(id)a4;
- (void)_locked_callbackForRecordZone:(id)a3 zoneID:(id)a4 error:(id)a5;
- (void)_sendErrorForFailedZones;
- (void)fetchZonesFromServer;
- (void)fetchZonesFromServer:(id)a3;
- (void)main;
- (void)saveZonesWithUpdatedZonePCS;
- (void)setIgnorePCSFailures:(BOOL)a3;
- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3;
- (void)setNumZoneSaveAttempts:(int64_t)a3;
- (void)setOnlyFetchPCSInfo:(BOOL)a3;
- (void)setPcsUpdateErrorsByZoneID:(id)a3;
- (void)setRecordZoneFetchedProgressBlock:(id)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setShouldRetry:(BOOL)a3;
- (void)setZoneIDsNeedingDugongKeyRoll:(id)a3;
- (void)setZoneIDsNeedingPCSUpdateRetry:(id)a3;
- (void)setZonesToSaveForPCSUpdateByZoneID:(id)a3;
@end

@implementation CKDFetchRecordZonesOperation

- (CKDFetchRecordZonesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKDFetchRecordZonesOperation;
  v9 = [(CKDDatabaseOperation *)&v25 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordZoneIDs(v6, v7, v8);
    recordZoneIDs = v9->_recordZoneIDs;
    v9->_recordZoneIDs = (NSArray *)v10;

    v9->_isFetchAllRecordZonesOperation = objc_msgSend_isFetchAllRecordZonesOperation(v6, v12, v13);
    v9->_ignorePCSFailures = objc_msgSend_ignorePCSFailures(v6, v14, v15);
    uint64_t v16 = objc_opt_new();
    zonesToSaveForPCSUpdateByZoneID = v9->_zonesToSaveForPCSUpdateByZoneID;
    v9->_zonesToSaveForPCSUpdateByZoneID = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    zoneIDsNeedingPCSUpdateRetry = v9->_zoneIDsNeedingPCSUpdateRetry;
    v9->_zoneIDsNeedingPCSUpdateRetry = (NSMutableArray *)v18;

    uint64_t v20 = objc_opt_new();
    pcsUpdateErrorsByZoneID = v9->_pcsUpdateErrorsByZoneID;
    v9->_pcsUpdateErrorsByZoneID = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_opt_new();
    zoneIDsNeedingDugongKeyRoll = v9->_zoneIDsNeedingDugongKeyRoll;
    v9->_zoneIDsNeedingDugongKeyRoll = (NSMutableSet *)v22;
  }
  return v9;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      if (objc_msgSend_shouldRetry(self, v5, v6))
      {
        uint64_t v11 = objc_msgSend_numZoneSaveAttempts(self, v9, v10);
        v14 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v12, v13);
        if (v11 >= (int)objc_msgSend_PCSRetryCount(v14, v15, v16))
        {
        }
        else
        {
          v19 = objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v17, v18);
          uint64_t v22 = objc_msgSend_count(v19, v20, v21);

          if (v22)
          {
            objc_msgSend_setShouldRetry_(self, v9, 0);
            objc_super v25 = objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v23, v24);
            objc_msgSend_removeAllObjects(v25, v26, v27);

            v30 = objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v28, v29);
            v33 = objc_msgSend_copy(v30, v31, v32);
            objc_msgSend_setRecordZoneIDs_(self, v34, (uint64_t)v33);

            v37 = objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v35, v36);
            objc_msgSend_removeAllObjects(v37, v38, v39);

LABEL_4:
            objc_msgSend_setState_(self, v5, 2);
            objc_msgSend_fetchZonesFromServer(self, v7, v8);
            return 1;
          }
        }
      }
      objc_msgSend__sendErrorForFailedZones(self, v9, v10);
      objc_msgSend_setState_(self, v42, 0xFFFFFFFFLL);
      v45 = objc_msgSend_error(self, v43, v44);
      objc_msgSend_finishWithError_(self, v46, (uint64_t)v45);

      return 1;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend_saveZonesWithUpdatedZonePCS(self, v40, v41);
      return 1;
    case 1:
      goto LABEL_4;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Fetching Zones";
  }
  else if (a3 == 3)
  {
    v5 = @"Updating Zone PCS";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchRecordZonesOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-record-zones", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_sendErrorForFailedZones
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v4 = objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, a2, v2);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v52, v62, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    char v10 = 0;
    uint64_t v11 = *(void *)v53;
    uint64_t v46 = *MEMORY[0x1E4F19DD8];
    id obj = v4;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * v12);
        v14 = objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v7, v8);
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, v13);

        v19 = objc_msgSend_pcsUpdateErrorsByZoneID(self, v17, v18);
        uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v13);

        if (!v21)
        {
          uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v22, v46, 2037, 0, @"Error saving record zone %@ to server: Protection data didn't match", v13);
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v23 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          v26 = v23;
          uint64_t v29 = objc_msgSend_numZoneSaveAttempts(self, v27, v28);
          *(_DWORD *)buf = 138412802;
          uint64_t v57 = v13;
          __int16 v58 = 2048;
          uint64_t v59 = v29;
          __int16 v60 = 2112;
          v61 = v21;
          _os_log_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_INFO, "Failed to save zone %@ to the server %ld times with error %@", buf, 0x20u);
        }
        if (objc_msgSend_code(v21, v24, v25) == 2053) {
          v10 |= objc_msgSend_numZoneSaveAttempts(self, v30, v31) > 1;
        }
        uint64_t v32 = objc_msgSend_callbackQueue(self, v30, v31);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4FD75F0;
        block[3] = &unk_1E64F0DF0;
        block[4] = self;
        id v49 = v16;
        uint64_t v50 = v13;
        id v51 = v21;
        id v33 = v21;
        id v34 = v16;
        dispatch_async(v32, block);

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v52, v62, 16);
    }
    while (v9);

    if (v10)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v35 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
      {
        uint64_t v36 = v35;
        uint64_t v39 = objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v37, v38);
        uint64_t v42 = objc_msgSend_count(v39, v40, v41);
        v45 = objc_msgSend_operationID(self, v43, v44);
        *(_DWORD *)buf = 134218242;
        uint64_t v57 = v42;
        __int16 v58 = 2114;
        uint64_t v59 = (uint64_t)v45;
        _os_log_fault_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_FAULT, "Failed to save %lu zones for operation %{public}@ despite user key sync.", buf, 0x16u);
      }
    }
  }
  else
  {
  }
}

- (void)_locked_callbackForRecordZone:(id)a3 zoneID:(id)a4 error:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_callbackQueue(self, v11, v12);
  dispatch_assert_queue_V2(v13);

  uint64_t v16 = objc_msgSend_zoneID(v8, v14, v15);
  v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = (void *)v16;
  }
  else {
    uint64_t v18 = v9;
  }
  id v19 = v18;

  if (v19)
  {
    uint64_t v22 = objc_msgSend_zoneIDsNeedingDugongKeyRoll(self, v20, v21);
    int v24 = objc_msgSend_containsObject_(v22, v23, (uint64_t)v19);

    if (v24)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v25 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = v25;
        v35 = objc_msgSend_operationID(self, v33, v34);
        int v36 = 138543618;
        v37 = v35;
        __int16 v38 = 2114;
        uint64_t v39 = 0x1F2058370;
        _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", (uint8_t *)&v36, 0x16u);
      }
      uint64_t v27 = objc_msgSend_dugongKeyRollAnalyticsPayloadWithError_(self, v26, (uint64_t)v10);
      AnalyticsSendEvent();
    }
  }
  uint64_t v28 = objc_msgSend_recordZoneFetchedProgressBlock(self, v20, v21);

  if (v28)
  {
    objc_msgSend_recordZoneFetchedProgressBlock(self, v29, v30);
    uint64_t v31 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, id))v31)[2](v31, v8, v19, v10);
  }
}

- (BOOL)_locked_checkAndUpdateZonePCSIfNeededForZone:(id)a3 error:(id *)a4
{
  uint64_t v466 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v10 = objc_msgSend_callbackQueue(self, v8, v9);
  dispatch_assert_queue_V2(v10);

  if (objc_msgSend_databaseScope(self, v11, v12) != 2) {
    goto LABEL_4;
  }
  uint64_t v15 = objc_msgSend_container(self, v13, v14);
  uint64_t v18 = objc_msgSend_options(v15, v16, v17);
  if (objc_msgSend_useAnonymousToServerShareParticipants(v18, v19, v20))
  {
    v23 = objc_msgSend_zoneID(v7, v21, v22);
    v26 = objc_msgSend_zoneName(v23, v24, v25);
    char isEqualToString = objc_msgSend_isEqualToString_(v26, v27, *MEMORY[0x1E4F19D90]);

    if (isEqualToString)
    {
LABEL_4:
      BOOL v31 = 0;
      goto LABEL_118;
    }
  }
  else
  {
  }
  uint64_t v32 = objc_msgSend_container(self, v29, v30);
  v35 = objc_msgSend_pcsManager(v32, v33, v34);
  uint64_t v38 = objc_msgSend_zonePCS(v7, v36, v37);
  uint64_t v439 = objc_msgSend_zoneishPCS(v7, v39, v40);
  v441 = v32;
  v43 = objc_msgSend_deviceContext(v32, v41, v42);
  v48 = objc_msgSend_testDeviceReference(v43, v44, v45);
  if (v48)
  {
    id v49 = objc_msgSend_zoneID(v7, v46, v47);
    long long v52 = objc_msgSend_zoneName(v49, v50, v51);
    int v432 = objc_msgSend_isEqualToString_(v52, v53, @"UpdateBreakerZone");
  }
  else
  {
    int v432 = 0;
  }

  if (!*MEMORY[0x1E4F1A4E0])
  {
    SEL v425 = a2;
    v65 = self;
    v437 = a4;
    BOOL v434 = 0;
    int v428 = 0;
    BOOL v433 = 0;
    v61 = v441;
    goto LABEL_15;
  }
  v56 = objc_msgSend_unitTestOverrides(self, v54, v55);
  __int16 v58 = objc_msgSend_objectForKeyedSubscript_(v56, v57, @"ZonePCSIdentityRollPartialFailure");

  v61 = v441;
  if (!v58)
  {
    v437 = a4;
    v95 = objc_msgSend_unitTestOverrides(self, v59, v60);
    v97 = objc_msgSend_objectForKeyedSubscript_(v95, v96, @"RollZoneishMasterKeyOnFetch");

    BOOL v100 = v97 != 0;
    if (v97) {
      _PCSFPSetShouldRoll();
    }
    v101 = objc_msgSend_unitTestOverrides(self, v98, v99);
    v103 = objc_msgSend_objectForKeyedSubscript_(v101, v102, @"RollZoneAndZoneishPCSForShareDelete");

    BOOL v434 = v103 != 0;
    int v107 = objc_msgSend_checkAndClearUnitTestOverrides_(self, v104, @"ForceShouldRollOnceForZonePCSOnDecrypt");
    if (v107) {
      _PCSFPSetShouldRoll();
    }
    v108 = objc_msgSend_unitTestOverrides(self, v105, v106);
    v110 = objc_msgSend_objectForKeyedSubscript_(v108, v109, @"ForceShouldRollAlwaysForZonePCSOnDecrypt");

    if (v110)
    {
      int v107 = 1;
      _PCSFPSetShouldRoll();
    }
    v113 = objc_msgSend_unitTestOverrides(self, v111, v112);
    v115 = objc_msgSend_objectForKeyedSubscript_(v113, v114, @"ForceZoneResaveButNoKeysRolled");

    if (v115)
    {
      v118 = objc_msgSend_pcsManager(v441, v116, v117);
      id v458 = 0;
      v120 = objc_msgSend_dataFromZonePCS_error_(v118, v119, v38, &v458);
      id v64 = v458;

      if (v64 || !v120)
      {
        a4 = v437;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v263 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v460 = (uint64_t)v64;
          _os_log_error_impl(&dword_1C4CFF000, v263, OS_LOG_TYPE_ERROR, "Couldn't serialize zone PCS for tests: %@", buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend_setProtectionData_(v7, v121, (uint64_t)v120);
        v124 = objc_msgSend_protectionEtag(v7, v122, v123);
        objc_msgSend_setPreviousProtectionEtag_(v7, v125, (uint64_t)v124);

        v128 = objc_msgSend_pcsManager(v441, v126, v127);
        id v457 = 0;
        v130 = objc_msgSend_etagFromZonePCS_error_(v128, v129, v38, &v457);
        id v64 = v457;
        objc_msgSend_setProtectionEtag_(v7, v131, (uint64_t)v130);

        a4 = v437;
        if (!v64)
        {
          BOOL v31 = 1;
          goto LABEL_103;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v132 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          v133 = v132;
          v136 = objc_msgSend_zoneID(v7, v134, v135);
          *(_DWORD *)buf = 138412546;
          uint64_t v460 = (uint64_t)v136;
          __int16 v461 = 2112;
          id v462 = v64;
          _os_log_error_impl(&dword_1C4CFF000, v133, OS_LOG_TYPE_ERROR, "Couldn't create a PCS etag for zone for tests %@: %@", buf, 0x16u);
        }
      }
      BOOL v31 = 0;
LABEL_103:

      goto LABEL_104;
    }
    SEL v425 = a2;
    v65 = self;
    v166 = objc_msgSend_unitTestOverrides(self, v116, v117);
    v168 = objc_msgSend_objectForKeyedSubscript_(v166, v167, @"RollZoneIdentityOnFetch");

    if (v168)
    {
      v169 = objc_msgSend_pcsManager(v441, v54, v55);
      v172 = objc_msgSend_protectionData(v7, v170, v171);
      id v456 = 0;
      v174 = (const void *)objc_msgSend_createSharePCSFromData_ofType_withService_error_(v169, v173, (uint64_t)v172, 3, 3, &v456);
      id v64 = v456;

      objc_msgSend_setZonePCS_(v7, v175, (uint64_t)v174);
      if (v174) {
        CFRelease(v174);
      }
      if (v64)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        a4 = v437;
        v178 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v460 = (uint64_t)v64;
          _os_log_error_impl(&dword_1C4CFF000, v178, OS_LOG_TYPE_ERROR, "Couldn't create zone PCS from data: %@", buf, 0xCu);
        }
        goto LABEL_13;
      }
      BOOL v433 = v100;
      uint64_t v38 = objc_msgSend_zonePCS(v7, v176, v177);
      int v428 = 1;
    }
    else
    {
      int v428 = v107;
      BOOL v433 = v100;
    }
LABEL_15:
    v66 = objc_msgSend_zonePCSKeysToRemove(v7, v54, v55);
    v69 = objc_msgSend_protectionEtag(v7, v67, v68);
    uint64_t v71 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v35, v70, (uint64_t)v66, v38, v69, v65);

    v74 = objc_msgSend_zoneishPCSKeysToRemove(v7, v72, v73);
    v77 = objc_msgSend_zoneishProtectionData(v7, v75, v76);
    v79 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v78, (uint64_t)v77);
    v431 = v35;
    v80 = v35;
    uint64_t v81 = v439;
    v440 = v65;
    uint64_t v83 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v80, v82, (uint64_t)v74, v439, v79, v65);

    uint64_t v427 = v71;
    if (v71 | v83)
    {
      v455[0] = MEMORY[0x1E4F143A8];
      v455[1] = 3221225472;
      v455[2] = sub_1C4FD98F0;
      v455[3] = &unk_1E64F8268;
      v455[4] = v71;
      v455[5] = v83;
      objc_msgSend_updateCloudKitMetrics_(v440, v84, (uint64_t)v455);
    }
    v86 = objc_msgSend_pcsManager(v61, v84, v85);
    uint64_t v423 = v83;
    if (objc_msgSend_canRollShareKeys(v86, v87, v88))
    {
      v91 = objc_msgSend_invitedKeysToRemove(v7, v89, v90);
      if (objc_msgSend_count(v91, v92, v93)) {
        uint64_t v94 = 1;
      }
      else {
        uint64_t v94 = v434;
      }
    }
    else
    {
      uint64_t v94 = 0;
    }

    v139 = objc_msgSend_pcsManager(v61, v137, v138);
    v140 = (const void *)v38;
    int isZoneishZone_bypassAllowlistedContainers = objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(v139, v141, v38, v439 != 0, 0);

    v145 = objc_msgSend_pcsManager(v61, v143, v144);
    int isRemindersZoneThatNeedsUpdate = objc_msgSend_isRemindersZoneThatNeedsUpdate_(v145, v146, v38);

    v150 = objc_msgSend_containerID(v440, v148, v149);
    uint64_t v153 = objc_msgSend_specialContainerType(v150, v151, v152);

    uint64_t v430 = 0;
    int v156 = 0;
    unsigned int v426 = v94;
    if (v153 == 25 && (isRemindersZoneThatNeedsUpdate & 1) == 0)
    {
      v157 = objc_msgSend_container(v440, v154, v155);
      v160 = objc_msgSend_pcsManager(v157, v158, v159);
      id v454 = 0;
      v162 = objc_msgSend_dataFromZonePCS_error_(v160, v161, v38, &v454);
      id v64 = v454;

      if (v64)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v35 = v431;
        a4 = v437;
        v165 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v460 = (uint64_t)v64;
          _os_log_impl(&dword_1C4CFF000, v165, OS_LOG_TYPE_INFO, "Warn: Couldn't export protection data for decrypting with Reminders identity: %@", buf, 0xCu);
        }
        v140 = 0;
LABEL_109:

LABEL_110:
        v211 = 0;
LABEL_111:
        BOOL v31 = 0;
        goto LABEL_112;
      }
      v179 = objc_msgSend_container(v440, v163, v164);
      v182 = objc_msgSend_pcsManager(v179, v180, v181);
      id v453 = 0;
      v140 = (const void *)objc_msgSend_createSharePCSFromData_ofType_withService_error_(v182, v183, (uint64_t)v162, 3, 4, &v453);
      id v64 = v453;

      if (!v140 || v64)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v35 = v431;
        a4 = v437;
        v264 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          v392 = v264;
          v395 = objc_msgSend_zoneID(v7, v393, v394);
          *(_DWORD *)buf = 138412546;
          uint64_t v460 = (uint64_t)v395;
          __int16 v461 = 2112;
          id v462 = v64;
          _os_log_error_impl(&dword_1C4CFF000, v392, OS_LOG_TYPE_ERROR, "Couldn't decrypt zone %@ with Reminders identity: %@", buf, 0x16u);
        }
        goto LABEL_109;
      }
      uint64_t v81 = v439;
      v186 = objc_msgSend_pcsManager(v441, v184, v185);
      uint64_t v430 = (uint64_t)v140;
      int v156 = objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(v186, v187, (uint64_t)v140, v439 != 0, 0);

      v61 = v441;
      v140 = (const void *)v38;
      uint64_t v94 = v426;
    }
    int v188 = isZoneishZone_bypassAllowlistedContainers | v428 | v94;
    int v189 = v81 != 0;
    if (v81) {
      int v190 = isZoneishZone_bypassAllowlistedContainers | v428 | v94;
    }
    else {
      int v190 = 1;
    }
    if (!v190) {
      int v189 = v433 | v156;
    }
    int v429 = v189;
    int v424 = v188;
    if (((v188 | v156) & 1) != 0 || v189)
    {
      objc_msgSend_pcsManager(v61, v154, v155);
      id v191 = v7;
      v193 = int v192 = v156;
      uint64_t v195 = objc_msgSend_sizeOfPCS_(v193, v194, (uint64_t)v140);
      v198 = objc_msgSend_pcsManager(v61, v196, v197);
      uint64_t v200 = objc_msgSend_sizeOfPCS_(v198, v199, v81) + v195;

      v203 = objc_msgSend_pcsManager(v61, v201, v202);
      LODWORD(v200) = objc_msgSend_isPCSSizeTooBigForKeyRoll_(v203, v204, v200);

      int v156 = v192;
      id v7 = v191;
      uint64_t v94 = v426;
      if (v200)
      {
        v35 = v431;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        a4 = v437;
        v140 = (const void *)v430;
        v205 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          v207 = v205;
          v210 = objc_msgSend_zoneID(v7, v208, v209);
          *(_DWORD *)buf = 138412290;
          uint64_t v460 = (uint64_t)v210;
          _os_log_impl(&dword_1C4CFF000, v207, OS_LOG_TYPE_INFO, "Skipping PCS key roll for zone %@ because the combined PCS size is too big", buf, 0xCu);
        }
        objc_msgSend_updateCloudKitMetrics_(v440, v206, (uint64_t)&unk_1F2044910);
        v211 = 0;
        BOOL v31 = 0;
        id v64 = 0;
        goto LABEL_112;
      }
    }
    int v421 = isRemindersZoneThatNeedsUpdate;
    int v422 = v156;
    char v212 = v424;
    if (!v424)
    {
      v211 = 0;
      v35 = v431;
      a4 = v437;
      goto LABEL_131;
    }
    id v213 = (id)*MEMORY[0x1E4F1A548];
    v214 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    a4 = v437;
    v215 = (unsigned char *)MEMORY[0x1E4F1A4E0];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v213);
    }

    v216 = (id)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
    {
      v219 = objc_msgSend_zoneID(v7, v217, v218);
      *(_DWORD *)buf = 138412290;
      uint64_t v460 = (uint64_t)v219;
      _os_log_impl(&dword_1C4CFF000, v216, OS_LOG_TYPE_INFO, "Updating identity on zone PCS for zone %@", buf, 0xCu);
    }
    if (*v215)
    {
      v222 = objc_msgSend_unitTestOverrides(v440, v220, v221);
      v224 = objc_msgSend_objectForKeyedSubscript_(v222, v223, @"testUpdatingZonePCSAfterIdentityRoll");

      if (v224) {
        uint64_t v225 = 3;
      }
      else {
        uint64_t v225 = 0;
      }
      if (v94) {
        goto LABEL_79;
      }
    }
    else
    {
      uint64_t v225 = 0;
      if (v94)
      {
LABEL_79:
        objc_msgSend_setDidAttemptDugongKeyRoll_(v440, v220, 1);
        v228 = objc_msgSend_zoneIDsNeedingDugongKeyRoll(v440, v226, v227);
        v231 = objc_msgSend_zoneID(v7, v229, v230);
        objc_msgSend_addObject_(v228, v232, (uint64_t)v231);

        long long v451 = 0u;
        long long v452 = 0u;
        long long v449 = 0u;
        long long v450 = 0u;
        v435 = v7;
        v235 = objc_msgSend_invitedKeysToRemove(v7, v233, v234);
        uint64_t v237 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v236, (uint64_t)&v449, v465, 16);
        if (v237)
        {
          uint64_t v240 = v237;
          uint64_t v241 = *(void *)v450;
          do
          {
            uint64_t v242 = 0;
            do
            {
              if (*(void *)v450 != v241) {
                objc_enumerationMutation(v235);
              }
              uint64_t v243 = *(void *)(*((void *)&v449 + 1) + 8 * v242);
              v244 = objc_msgSend_pcsManager(v61, v238, v239);
              v246 = objc_msgSend_removePublicKeyID_fromPCS_(v244, v245, v243, v38);

              if (v246)
              {
                id v247 = (id)*MEMORY[0x1E4F1A548];
                if (*v214 != -1) {
                  dispatch_once(v214, v247);
                }

                v248 = (id)*MEMORY[0x1E4F1A528];
                if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
                {
                  v251 = objc_msgSend_zoneID(v435, v249, v250);
                  *(_DWORD *)buf = 138543874;
                  uint64_t v460 = v243;
                  __int16 v461 = 2112;
                  id v462 = v251;
                  __int16 v463 = 2112;
                  v464 = v246;
                  _os_log_error_impl(&dword_1C4CFF000, v248, OS_LOG_TYPE_ERROR, "Failed to remove server provided invited key %{public}@ from zone %@: %@", buf, 0x20u);

                  v61 = v441;
                }
              }
              ++v242;
            }
            while (v240 != v242);
            uint64_t v240 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v238, (uint64_t)&v449, v465, 16);
          }
          while (v240);
        }

        v254 = objc_msgSend_pcsManager(v61, v252, v253);
        id v448 = 0;
        v211 = objc_msgSend_rollIdentityForSharePCS_ofType_removeAllExistingPrivateKeys_error_(v254, v255, v38, 3, 0, &v448);
        id v64 = v448;

        if (v64)
        {
          a4 = v437;
          if (*v214 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v7 = v435;
          v140 = (const void *)v430;
          v35 = v431;
          v257 = (void *)*MEMORY[0x1E4F1A528];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
            goto LABEL_111;
          }
          v258 = v257;
          objc_msgSend_zoneID(v435, v259, v260);
          v262 = v261 = v211;
          *(_DWORD *)buf = 138412546;
          uint64_t v460 = (uint64_t)v262;
          __int16 v461 = 2112;
          id v462 = v64;
          _os_log_error_impl(&dword_1C4CFF000, v258, OS_LOG_TYPE_ERROR, "Failed to roll identity for zone PCS for zone %@: %@", buf, 0x16u);

          v211 = v261;
          goto LABEL_141;
        }
        objc_msgSend_updateCloudKitMetrics_(v440, v256, (uint64_t)&unk_1F2044930);
        id v7 = v435;
        a4 = v437;
        goto LABEL_130;
      }
    }
    v266 = objc_msgSend_pcsManager(v61, v220, v221);
    objc_msgSend_updateIdentityAndRollKeyForZonePCS_usingServiceIdentityWithType_forOperation_(v266, v267, v38, v225, v440);
    id v64 = (id)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      if (*v214 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v140 = (const void *)v430;
      v35 = v431;
      v268 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        v269 = v268;
        v272 = objc_msgSend_zoneID(v7, v270, v271);
        *(_DWORD *)buf = 138412546;
        uint64_t v460 = (uint64_t)v272;
        __int16 v461 = 2112;
        id v462 = v64;
        _os_log_error_impl(&dword_1C4CFF000, v269, OS_LOG_TYPE_ERROR, "Couldn't update identity on zone PCS for zone %@: %@", buf, 0x16u);
      }
      goto LABEL_110;
    }
    v211 = 0;
LABEL_130:
    v35 = v431;
    v140 = (const void *)v38;
    int v156 = v422;
    uint64_t v94 = v426;
    char v212 = v424;
LABEL_131:
    uint64_t v436 = (uint64_t)v211;
    if (v156)
    {
      v273 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
      id v274 = (id)*MEMORY[0x1E4F1A548];
      v275 = (void *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v274);
      }
      v140 = (const void *)v430;
      uint64_t v276 = v94;

      v277 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_zoneID(v7, v278, v279);
        v281 = v280 = v273;
        *(_DWORD *)buf = 138412290;
        uint64_t v460 = (uint64_t)v281;
        _os_log_impl(&dword_1C4CFF000, v277, OS_LOG_TYPE_INFO, "Reminders zone %@ needs to be rolled for the Reminders identity", buf, 0xCu);

        v273 = v280;
      }

      v284 = objc_msgSend_pcsManager(v61, v282, v283);
      objc_msgSend_updateIdentityAndRollKeyForZonePCS_usingServiceIdentityWithType_forOperation_(v284, v285, v430, 4, v440);
      id v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v275 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v273);
        }
        v211 = (void *)v436;
        v286 = (void *)*MEMORY[0x1E4F1A528];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
          goto LABEL_111;
        }
        v258 = v286;
        v289 = objc_msgSend_zoneID(v7, v287, v288);
        *(_DWORD *)buf = 138412546;
        uint64_t v460 = (uint64_t)v289;
        __int16 v461 = 2112;
        id v462 = v64;
        _os_log_error_impl(&dword_1C4CFF000, v258, OS_LOG_TYPE_ERROR, "Couldn't roll Reminders identity on zone PCS for zone %@: %@", buf, 0x16u);

        v211 = (void *)v436;
LABEL_141:

        goto LABEL_111;
      }
      char v212 = 1;
      v211 = (void *)v436;
      uint64_t v94 = v276;
    }
    v438 = a4;
    if (v429)
    {
      id v290 = (id)*MEMORY[0x1E4F1A548];
      v291 = (void *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v290);
      }
      v292 = v35;

      v293 = (os_log_t *)MEMORY[0x1E4F1A528];
      v294 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v294, OS_LOG_TYPE_DEBUG))
      {
        v391 = objc_msgSend_zoneID(v7, v295, v296);
        *(_DWORD *)buf = 138412290;
        uint64_t v460 = (uint64_t)v391;
        _os_log_debug_impl(&dword_1C4CFF000, v294, OS_LOG_TYPE_DEBUG, "Updating zoneish PCS on zone %@", buf, 0xCu);
      }
      v299 = objc_msgSend_pcsManager(v441, v297, v298);
      objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(v299, v300, v439, 1, v94, v440);
      uint64_t v301 = v94;
      id v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v291 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v211 = (void *)v436;
        a4 = v438;
        v140 = (const void *)v430;
        v35 = v292;
        v304 = *v293;
        if (!os_log_type_enabled(*v293, OS_LOG_TYPE_ERROR)) {
          goto LABEL_111;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v460 = (uint64_t)v64;
        v305 = "Couldn't roll master key for zoneish PCS: %@";
        goto LABEL_175;
      }
      v337 = v293;
      v338 = objc_msgSend_pcsManager(v441, v302, v303);
      id v447 = 0;
      v340 = objc_msgSend_dataFromRecordPCS_error_(v338, v339, v439, &v447);
      id v64 = v447;

      if (v64 || !v340)
      {
        v211 = (void *)v436;
        if (*v291 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        a4 = v438;
        v384 = *v337;
        if (os_log_type_enabled(*v337, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v460 = (uint64_t)v64;
          _os_log_error_impl(&dword_1C4CFF000, v384, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
        }
        goto LABEL_229;
      }
      v343 = objc_msgSend_pcsManager(v441, v341, v342);
      id v446 = 0;
      v345 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v343, v344, (uint64_t)v340, 1, v140, &v446);
      id v64 = v446;

      if (v64 || !v345)
      {
        v211 = (void *)v436;
        if (*v291 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        a4 = v438;
        v390 = *v337;
        if (os_log_type_enabled(*v337, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v460 = (uint64_t)v64;
          _os_log_error_impl(&dword_1C4CFF000, v390, OS_LOG_TYPE_ERROR, "Couldn't decode zoneishPCS data: %@", buf, 0xCu);
          if (!v345) {
            goto LABEL_229;
          }
        }
        else if (!v345)
        {
LABEL_229:

          BOOL v31 = 0;
          v140 = (const void *)v430;
          v35 = v431;
LABEL_112:
          if (v140) {
            CFRelease(v140);
          }
          goto LABEL_114;
        }
LABEL_228:
        CFRelease(v345);
        goto LABEL_229;
      }
      v348 = objc_msgSend_pcsManager(v441, v346, v347);
      objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(v348, v349, (uint64_t)v345, v140, 1, v301);
      id v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v291 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v211 = (void *)v436;
        a4 = v438;
        os_log_t v351 = *v337;
        if (os_log_type_enabled(*v337, OS_LOG_TYPE_ERROR))
        {
          v352 = v351;
          v355 = objc_msgSend_zoneID(v7, v353, v354);
          *(_DWORD *)buf = 138412546;
          uint64_t v460 = (uint64_t)v355;
          __int16 v461 = 2112;
          id v462 = v64;
          _os_log_error_impl(&dword_1C4CFF000, v352, OS_LOG_TYPE_ERROR, "Couldn't update identity on zoneish PCS for zone %@: %@", buf, 0x16u);

          v211 = (void *)v436;
        }
        goto LABEL_228;
      }
      objc_msgSend_setZoneishPCS_(v7, v350, (uint64_t)v345);
      CFRelease(v345);
      uint64_t v398 = objc_msgSend_zoneishPCS(v7, v396, v397);
      v401 = objc_msgSend_pcsManager(v441, v399, v400);
      id v445 = 0;
      uint64_t v439 = v398;
      v403 = objc_msgSend_dataFromRecordPCS_error_(v401, v402, v398, &v445);
      id v64 = v445;

      if (v64 || !v403)
      {
        v211 = (void *)v436;
        if (*v291 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        a4 = v438;
        v414 = *v337;
        if (os_log_type_enabled(*v337, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v460 = (uint64_t)v64;
          _os_log_error_impl(&dword_1C4CFF000, v414, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
        }
        goto LABEL_241;
      }
      objc_msgSend_setZoneishProtectionData_(v7, v404, (uint64_t)v403);
      v407 = objc_msgSend_pcsManager(v441, v405, v406);
      v211 = (void *)v436;
      objc_msgSend_removePrivateKeysForKeyIDs_fromPCS_(v407, v408, v436, v140);
      id v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v291 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        a4 = v438;
        os_log_t v409 = *v337;
        if (os_log_type_enabled(*v337, OS_LOG_TYPE_ERROR))
        {
          v410 = v409;
          v413 = objc_msgSend_zoneID(v7, v411, v412);
          *(_DWORD *)buf = 138412546;
          uint64_t v460 = (uint64_t)v413;
          __int16 v461 = 2112;
          id v462 = v64;
          _os_log_error_impl(&dword_1C4CFF000, v410, OS_LOG_TYPE_ERROR, "Couldn't clean up old private keys from PCS for zone %@: %@", buf, 0x16u);

          v211 = (void *)v436;
        }
LABEL_241:
        v340 = v403;
        goto LABEL_229;
      }

      char v420 = 1;
      v35 = v431;
      objc_msgSend_pcsManager(v441, v415, v416);
    }
    else
    {
      char v420 = v212;
      objc_msgSend_pcsManager(v61, v154, v155);
    v306 = };
    uint64_t v307 = (uint64_t)v140;
    int v309 = objc_msgSend_zonePCSNeedsUpdate_(v306, v308, (uint64_t)v140) | v432;

    if (v309 == 1)
    {
      v312 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
      id v313 = (id)*MEMORY[0x1E4F1A548];
      v314 = (void *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v313);
      }

      v315 = (os_log_t *)MEMORY[0x1E4F1A528];
      v316 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v316, OS_LOG_TYPE_INFO))
      {
        v319 = objc_msgSend_zoneID(v7, v317, v318);
        *(_DWORD *)buf = 138412290;
        uint64_t v460 = (uint64_t)v319;
        _os_log_impl(&dword_1C4CFF000, v316, OS_LOG_TYPE_INFO, "Updating service identity in zone PCS for zone %@", buf, 0xCu);

        v211 = (void *)v436;
      }

      v322 = objc_msgSend_pcsManager(v441, v320, v321);
      objc_msgSend_updateServiceIdentityOnZonePCS_(v322, v323, v307);
      id v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v314 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v312);
        }
        v324 = *v315;
        if (os_log_type_enabled(*v315, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v460 = (uint64_t)v64;
          _os_log_error_impl(&dword_1C4CFF000, v324, OS_LOG_TYPE_ERROR, "Couldn't add our updated service identity to zone PCS: %@", buf, 0xCu);
        }
        BOOL v31 = 0;
        a4 = v438;
        goto LABEL_189;
      }
    }
    if (v421)
    {
      v325 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
      id v326 = (id)*MEMORY[0x1E4F1A548];
      v327 = (void *)MEMORY[0x1E4F1A550];
      a4 = v438;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v326);
      }

      v328 = (os_log_t *)MEMORY[0x1E4F1A528];
      v329 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v329, OS_LOG_TYPE_INFO))
      {
        v332 = objc_msgSend_zoneID(v7, v330, v331);
        *(_DWORD *)buf = 138412290;
        uint64_t v460 = (uint64_t)v332;
        _os_log_impl(&dword_1C4CFF000, v329, OS_LOG_TYPE_INFO, "Adding Reminders specific identity for Reminders zone %@", buf, 0xCu);

        v211 = (void *)v436;
      }

      v335 = objc_msgSend_pcsManager(v441, v333, v334);
      objc_msgSend_addIdentityForService_toPCS_(v335, v336, 4, v307);
      id v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v327 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v325);
        }
        v304 = *v328;
        v140 = (const void *)v430;
        if (!os_log_type_enabled(*v328, OS_LOG_TYPE_ERROR)) {
          goto LABEL_111;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v460 = (uint64_t)v64;
        v305 = "Couldn't add Reminders specific identity for Reminders zone PCS: %@";
LABEL_175:
        _os_log_error_impl(&dword_1C4CFF000, v304, OS_LOG_TYPE_ERROR, v305, buf, 0xCu);
        goto LABEL_111;
      }
    }
    else
    {
      a4 = v438;
      if (!v427 && ((v429 | v424 | v422 | v309) & 1) == 0 && !v423)
      {
        BOOL v31 = 0;
        id v64 = 0;
LABEL_189:
        v140 = (const void *)v430;
        goto LABEL_112;
      }
    }
    char v356 = v420 ^ 1;
    if (!*MEMORY[0x1E4F1A4E0]) {
      char v356 = 1;
    }
    if ((v356 & 1) == 0)
    {
      v357 = objc_msgSend_unitTestOverrides(v440, v310, v311);
      v359 = objc_msgSend_objectForKeyedSubscript_(v357, v358, @"ShouldNotKeyRoll");

      if (v359)
      {
        v418 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v310, v311);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v418, v419, (uint64_t)v425, v440, @"CKDFetchRecordZonesOperation.m", 474, @"Did not expect a key roll");
      }
    }
    if (v423)
    {
      id v444 = 0;
      v360 = objc_msgSend_dataFromRecordPCS_error_(v35, v310, v439, &v444);
      id v64 = v444;
      if (v64 || !v360)
      {
        id v386 = (id)*MEMORY[0x1E4F1A548];
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v386);
        }
        v140 = (const void *)v430;

        v387 = (id)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled(v387, OS_LOG_TYPE_ERROR))
        {
          v417 = objc_msgSend_zoneID(v7, v388, v389);
          *(_DWORD *)buf = 138412546;
          uint64_t v460 = (uint64_t)v417;
          __int16 v461 = 2112;
          id v462 = v64;
          _os_log_error_impl(&dword_1C4CFF000, v387, OS_LOG_TYPE_ERROR, "Failed to serialize zoneish PCS for zone ID: %@: %@", buf, 0x16u);
        }
        BOOL v31 = 1;
        v211 = (void *)v436;
        goto LABEL_112;
      }
      objc_msgSend_setZoneishProtectionData_(v7, v361, (uint64_t)v360);
    }
    v362 = objc_msgSend_pcsManager(v441, v310, v311);
    id v443 = 0;
    v364 = objc_msgSend_dataFromZonePCS_error_(v362, v363, v307, &v443);
    id v64 = v443;

    if (v64 || !v364)
    {
      id v385 = (id)*MEMORY[0x1E4F1A548];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v385);
      }
      v140 = (const void *)v430;

      v380 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v380, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v460 = (uint64_t)v64;
        _os_log_error_impl(&dword_1C4CFF000, v380, OS_LOG_TYPE_ERROR, "Couldn't serialize zone PCS: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_setProtectionData_(v7, v365, (uint64_t)v364);
      v368 = objc_msgSend_protectionEtag(v7, v366, v367);
      objc_msgSend_setPreviousProtectionEtag_(v7, v369, (uint64_t)v368);

      v372 = objc_msgSend_pcsManager(v441, v370, v371);
      id v442 = 0;
      v374 = objc_msgSend_etagFromZonePCS_error_(v372, v373, v307, &v442);
      id v64 = v442;
      objc_msgSend_setProtectionEtag_(v7, v375, (uint64_t)v374);

      if (v432 && !objc_msgSend_numZoneSaveAttempts(v440, v376, v377)) {
        objc_msgSend_setPreviousProtectionEtag_(v7, v378, @"NO_ETAG_FOR_YOU");
      }
      v211 = (void *)v436;
      v140 = (const void *)v430;
      if (!v64) {
        goto LABEL_218;
      }
      id v379 = (id)*MEMORY[0x1E4F1A548];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v379);
      }

      v380 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v380, OS_LOG_TYPE_ERROR))
      {
        v383 = objc_msgSend_zoneID(v7, v381, v382);
        *(_DWORD *)buf = 138412546;
        uint64_t v460 = (uint64_t)v383;
        __int16 v461 = 2112;
        id v462 = v64;
        _os_log_error_impl(&dword_1C4CFF000, v380, OS_LOG_TYPE_ERROR, "Couldn't create a PCS etag for zone %@: %@", buf, 0x16u);
      }
    }

    v211 = (void *)v436;
LABEL_218:

    BOOL v31 = 1;
    goto LABEL_112;
  }
  v62 = (const void *)PCSFPCreatePrivateKey();
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v63, *MEMORY[0x1E4F19DD8], 5018, @"Partially failing zone identity update because unit tests");
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  if (v62) {
    CFRelease(v62);
  }
LABEL_13:
  BOOL v31 = 0;
LABEL_104:
  v211 = 0;
LABEL_114:
  if (a4 && v64) {
    *a4 = v64;
  }

LABEL_118:
  return v31;
}

- (void)_handleRecordZoneSaved:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = @" with error ";
    uint64_t v21 = &stru_1F2044F30;
    *(_DWORD *)buf = 138412802;
    id v33 = v6;
    if (v7) {
      uint64_t v21 = v7;
    }
    else {
      uint64_t v20 = &stru_1F2044F30;
    }
    __int16 v34 = 2114;
    v35 = v20;
    __int16 v36 = 2112;
    uint64_t v37 = v21;
    _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Saved updated zone %@%{public}@%@", buf, 0x20u);
    if (!v7) {
      goto LABEL_12;
    }
  }
  else if (!v7)
  {
    goto LABEL_12;
  }
  if (objc_msgSend_code(v7, v9, v10) == 2037 || objc_msgSend_code(v7, v9, v11) == 2053)
  {
    objc_msgSend_setShouldRetry_(self, v9, 1);
    uint64_t v14 = objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v12, v13);
    objc_msgSend_addObject_(v14, v15, (uint64_t)v6);

    objc_msgSend_pcsUpdateErrorsByZoneID(self, v16, v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v7, v6);
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v22 = objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v9, v10);
  int v24 = objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v6);

  if (!v7 && v24) {
    objc_msgSend__cachePCSOnRecordZone_(self, v25, (uint64_t)v24);
  }
  uint64_t v27 = objc_msgSend_callbackQueue(self, v25, v26);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4FD9C68;
  v28[3] = &unk_1E64F0DF0;
  v28[4] = self;
  id v29 = v24;
  id v30 = v6;
  BOOL v31 = v7;
  id v18 = v24;
  dispatch_async(v27, v28);

LABEL_16:
}

- (void)saveZonesWithUpdatedZonePCS
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_numZoneSaveAttempts(self, v8, v9);
    objc_msgSend_setNumZoneSaveAttempts_(self, v11, v10 + 1);
    uint64_t v14 = objc_msgSend_stateTransitionGroup(self, v12, v13);
    dispatch_group_enter(v14);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = v15;
      BOOL v31 = objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v29, v30);
      __int16 v34 = objc_msgSend_allKeys(v31, v32, v33);
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v34;
      _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Saving the following zones with updated zone PCS to the server:\n%@", buf, 0xCu);
    }
    uint64_t v16 = objc_opt_new();
    id v19 = objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v17, v18);
    uint64_t v22 = objc_msgSend_allValues(v19, v20, v21);
    objc_msgSend_setRecordZonesToSave_(v16, v23, (uint64_t)v22);

    objc_msgSend_setAllowDefaultZoneSave_(v16, v24, 1);
    objc_msgSend_setMaxZoneSaveAttempts_(v16, v25, 1);
    uint64_t v26 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1C4FD9E94;
    v35[3] = &unk_1E64F0210;
    v35[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v27, v26, v16, v35);
  }
}

- (void)_handleAnonymousZoneDataObjects:(id)a3 responsecode:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v36 = a4;
  id v8 = objc_msgSend_container(self, v6, v7);
  uint64_t v11 = objc_msgSend_options(v8, v9, v10);
  char v14 = objc_msgSend_useAnonymousToServerShareParticipants(v11, v12, v13);

  if (v14)
  {
    uint64_t v17 = objc_msgSend_stateTransitionGroup(self, v15, v16);
    dispatch_group_enter(v17);

    objc_initWeak(&location, self);
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    uint64_t v52 = 0;
    uint64_t v52 = objc_msgSend_count(v37, v18, v19);
    *(void *)buf = 0;
    uint64_t v46 = buf;
    uint64_t v47 = 0x3032000000;
    v48 = sub_1C4FDA4E4;
    id v49 = sub_1C4FDA4F4;
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v37;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v41, v54, 16);
    if (v23)
    {
      uint64_t v24 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v27 = objc_msgSend_container(self, v21, v22);
          uint64_t v30 = objc_msgSend_anonymousSharingManager(v27, v28, v29);
          uint64_t v33 = objc_msgSend_encryptedTupleData(v26, v31, v32);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = sub_1C4FDA4FC;
          v39[3] = &unk_1E64F8310;
          v39[5] = buf;
          v39[6] = v51;
          objc_copyWeak(&v40, &location);
          v39[4] = self;
          objc_msgSend_decryptShareTuple_withCompletionBlock_(v30, v34, (uint64_t)v33, v39);

          objc_destroyWeak(&v40);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v41, v54, 16);
      }
      while (v23);
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v51, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v35 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "useAnonymousToServerShareParticipants is not enabled", buf, 2u);
    }
  }
}

- (void)_handleRecordZoneFetch:(id)a3 zoneID:(id)a4 responseCode:(id)a5 error:(id)a6
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v14 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v81 = v14;
    *(_DWORD *)id location = 138412802;
    *(void *)&location[4] = v10;
    __int16 v92 = 2112;
    id v93 = v11;
    __int16 v94 = 2048;
    uint64_t v95 = (int)objc_msgSend_code(v12, v82, v83);
    _os_log_debug_impl(&dword_1C4CFF000, v81, OS_LOG_TYPE_DEBUG, "Fetched record zone %@ (id %@) with response code %ld", location, 0x20u);
  }
  int v17 = objc_msgSend_code(v12, v15, v16);
  if (v13 || v17 != 1)
  {
    if (!v13)
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v30 = sub_1C4E94D98(v12);
      uint64_t v33 = objc_msgSend_request(self, v31, v32);
      __int16 v34 = sub_1C4E940D0(v33, v12);
      id v37 = objc_msgSend_error(v12, v35, v36);
      id v40 = objc_msgSend_errorDescription(v37, v38, v39);
      objc_msgSend_errorWithDomain_code_userInfo_format_(v29, v41, *MEMORY[0x1E4F19DD8], v30, v34, @"Error fetching record zone %@ from server: %@", v11, v40);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend_CKIsNotFoundError(v13, v18, v19))
    {
      long long v42 = objc_msgSend_container(self, v20, v21);
      uint64_t v45 = objc_msgSend_options(v42, v43, v44);
      if (objc_msgSend_useAnonymousToServerShareParticipants(v45, v46, v47))
      {
        BOOL v50 = objc_msgSend_databaseScope(self, v48, v49) == 3;

        if (v50)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          long long v53 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)id location = 138412290;
            *(void *)&location[4] = v11;
            _os_log_debug_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", location, 0xCu);
          }
          objc_initWeak((id *)location, self);
          v56 = objc_msgSend_stateTransitionGroup(self, v54, v55);
          dispatch_group_enter(v56);

          uint64_t v59 = objc_msgSend_container(self, v57, v58);
          v62 = objc_msgSend_anonymousSharingManager(v59, v60, v61);
          id v90 = v11;
          id v64 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v63, (uint64_t)&v90, 1);
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v88[2] = sub_1C4FDAB40;
          v88[3] = &unk_1E64F22C0;
          objc_copyWeak(&v89, (id *)location);
          objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v62, v65, (uint64_t)v64, self, v88);

          objc_destroyWeak(&v89);
          objc_destroyWeak((id *)location);
        }
      }
      else
      {
      }
      v66 = objc_msgSend_container(self, v51, v52);
      v69 = objc_msgSend_recordCache(v66, v67, v68);
      objc_msgSend_clearAllRecordsForZoneWithID_(v69, v70, (uint64_t)v11);

      objc_msgSend_setPCSData_forFetchedZoneID_(self, v71, 0, v11);
      v74 = objc_msgSend_container(self, v72, v73);
      v77 = objc_msgSend_pcsCache(v74, v75, v76);
      objc_msgSend_removePCSDataForItemsInZoneWithID_(v77, v78, (uint64_t)v11);
    }
    goto LABEL_23;
  }
  objc_msgSend_protectionData(v10, v18, v19);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_23:
    v79 = objc_msgSend_callbackQueue(self, v20, v21);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4FDAC54;
    block[3] = &unk_1E64F0DF0;
    block[4] = self;
    id v85 = v10;
    id v86 = v11;
    id v87 = v13;
    id v80 = v13;
    dispatch_async(v79, block);

    goto LABEL_24;
  }
  uint64_t v22 = objc_msgSend_container(self, v20, v21);
  uint64_t v25 = objc_msgSend_options(v22, v23, v24);
  int v28 = objc_msgSend_bypassPCSEncryption(v25, v26, v27);

  if (v28)
  {
    id v13 = 0;
    goto LABEL_23;
  }
  objc_msgSend__continueHandlingFetchedRecordZone_zoneID_(self, v20, (uint64_t)v10, v11);
LABEL_24:
}

- (void)_continueHandlingFetchedRecordZone:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x2020000000;
  char v101 = 1;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x3032000000;
  v98[3] = sub_1C4FDA4E4;
  v98[4] = sub_1C4FDA4F4;
  id v99 = 0;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  v96[3] = sub_1C4FDA4E4;
  v96[4] = sub_1C4FDA4F4;
  id v97 = 0;
  id v8 = dispatch_group_create();
  id v11 = objc_msgSend_stateTransitionGroup(self, v9, v10);
  dispatch_group_enter(v11);

  char v14 = objc_msgSend_container(self, v12, v13);
  int v17 = objc_msgSend_entitlements(v14, v15, v16);
  uint64_t hasZoneProtectionDataEntitlement = objc_msgSend_hasZoneProtectionDataEntitlement(v17, v18, v19);
  objc_msgSend_setSerializeProtectionData_(v6, v21, hasZoneProtectionDataEntitlement);

  if (objc_msgSend_databaseScope(self, v22, v23) == 2)
  {
    dispatch_group_enter(v8);
    objc_msgSend_noteOperationWillWaitOnPCS(self, v26, v27);
    v78 = objc_msgSend_zonePCSModificationDate(v6, v28, v29);
    if (*MEMORY[0x1E4F1A4E0])
    {
      uint64_t v32 = objc_msgSend_unitTestOverrides(self, v30, v31);
      __int16 v34 = objc_msgSend_objectForKeyedSubscript_(v32, v33, @"OverrideZonePCSModificationDate");

      if (v34)
      {
        id v37 = objc_msgSend_unitTestOverrides(self, v35, v36);
        uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v37, v38, @"OverrideZonePCSModificationDate");

        v78 = (void *)v39;
      }
    }
    id v77 = v7;
    objc_initWeak(&location, self);
    long long v42 = objc_msgSend_topmostParentOperation(self, v40, v41);
    uint64_t v45 = objc_msgSend_operationID(v42, v43, v44);

    v48 = objc_msgSend_container(self, v46, v47);
    uint64_t v51 = objc_msgSend_pcsManager(v48, v49, v50);
    long long v54 = objc_msgSend_protectionData(v6, v52, v53);
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = sub_1C4FDB190;
    v88[3] = &unk_1E64F8338;
    objc_copyWeak(&v94, &location);
    __int16 v92 = v98;
    id v55 = v6;
    id v89 = v55;
    id v90 = self;
    id v93 = v96;
    v56 = v8;
    v91 = v56;
    objc_msgSend_createZonePCSFromData_usingServiceIdentityWithType_zonePCSModificationDate_requestorOperationID_completionHandler_(v51, v57, (uint64_t)v54, 0, v78, v45, v88);

    uint64_t v60 = objc_msgSend_containerID(self, v58, v59);
    uint64_t v63 = objc_msgSend_specialContainerType(v60, v61, v62);

    if (v63 == 25)
    {
      dispatch_group_enter(v56);
      v66 = objc_msgSend_container(self, v64, v65);
      v69 = objc_msgSend_pcsManager(v66, v67, v68);
      v72 = objc_msgSend_protectionData(v55, v70, v71);
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = sub_1C4FDB3DC;
      v85[3] = &unk_1E64F8360;
      id v86 = v55;
      id v87 = v56;
      objc_msgSend_createZonePCSFromData_usingServiceIdentityWithType_zonePCSModificationDate_requestorOperationID_completionHandler_(v69, v73, (uint64_t)v72, 4, v78, v45, v85);
    }
    objc_destroyWeak(&v94);

    objc_destroyWeak(&location);
    id v7 = v77;
  }
  v74 = objc_msgSend_callbackQueue(self, v24, v25, v77);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FDB518;
  block[3] = &unk_1E64F8388;
  block[4] = self;
  id v80 = v6;
  uint64_t v83 = v98;
  v84 = v100;
  id v81 = v7;
  v82 = v96;
  id v75 = v7;
  id v76 = v6;
  dispatch_group_notify(v8, v74, block);

  _Block_object_dispose(v96, 8);
  _Block_object_dispose(v98, 8);

  _Block_object_dispose(v100, 8);
}

- (void)_cachePCSOnRecordZone:(id)a3
{
  id v4 = a3;
  objc_msgSend_dataWithZone_(CKDZonePCSData, v5, (uint64_t)v4);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_zonePCS(v4, v6, v7);
  objc_msgSend_setPcs_(v18, v9, v8);
  uint64_t v12 = objc_msgSend_zoneishPCS(v4, v10, v11);
  objc_msgSend_setZoneishPCS_(v18, v13, v12);
  uint64_t v16 = objc_msgSend_zoneID(v4, v14, v15);

  objc_msgSend_setPCSData_forFetchedZoneID_(self, v17, (uint64_t)v18, v16);
}

- (int)operationType
{
  return 201;
}

- (void)fetchZonesFromServer
{
}

- (void)fetchZonesFromServer:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordZoneIDs(self, v5, v6);
  if (objc_msgSend_count(v4, v8, v9))
  {
    id v12 = v4;

    uint64_t v7 = v12;
  }
  if (objc_msgSend_count(v7, v10, v11) || objc_msgSend_isFetchAllRecordZonesOperation(self, v13, v14))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v44 = v15;
      uint64_t v45 = (objc_class *)objc_opt_class();
      uint64_t v46 = NSStringFromClass(v45);
      uint64_t v49 = objc_msgSend_ckShortDescription(self, v47, v48);
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v46;
      __int16 v64 = 2048;
      uint64_t v65 = self;
      __int16 v66 = 2114;
      v67 = v49;
      _os_log_debug_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_DEBUG, "Fetch record zones operation <%{public}@: %p; %{public}@> is starting",
        location,
        0x20u);
    }
    id v18 = objc_msgSend_stateTransitionGroup(self, v16, v17);
    dispatch_group_enter(v18);

    uint64_t v19 = [CKDFetchRecordZonesURLRequest alloc];
    uint64_t v21 = objc_msgSend_initWithOperation_recordZoneIDs_(v19, v20, (uint64_t)self, v7);
    uint64_t PCSInfo = objc_msgSend_onlyFetchPCSInfo(self, v22, v23);
    objc_msgSend_setOnlyFetchPCSInfo_(v21, v25, PCSInfo);
    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v21);
    int v28 = objc_msgSend_container(self, v26, v27);
    uint64_t v31 = objc_msgSend_options(v28, v29, v30);
    int v34 = objc_msgSend_useAnonymousToServerShareParticipants(v31, v32, v33);

    if (v34)
    {
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = sub_1C4FDBDBC;
      v60[3] = &unk_1E64F83B0;
      objc_copyWeak(&v61, (id *)location);
      objc_msgSend_setAnonymousRecordZoneTuplesFetchedBlock_(v21, v35, (uint64_t)v60);
      objc_destroyWeak(&v61);
    }
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1C4FDBF28;
    v58[3] = &unk_1E64F83D8;
    objc_copyWeak(&v59, (id *)location);
    objc_msgSend_setRecordZoneFetchedBlock_(v21, v36, (uint64_t)v58);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = sub_1C4FDBFD0;
    v56[3] = &unk_1E64F4B38;
    objc_copyWeak(&v57, (id *)location);
    objc_msgSend_setErrorFetchingAllRecordZonesBlock_(v21, v37, (uint64_t)v56);
    uint64_t v50 = MEMORY[0x1E4F143A8];
    uint64_t v51 = 3221225472;
    uint64_t v52 = sub_1C4FDC2A0;
    uint64_t v53 = &unk_1E64F0170;
    objc_copyWeak(&v54, (id *)location);
    objc_copyWeak(&v55, &from);
    objc_msgSend_setCompletionBlock_(v21, v38, (uint64_t)&v50);
    objc_msgSend_setRequest_(self, v39, (uint64_t)v21, v50, v51, v52, v53);
    long long v42 = objc_msgSend_container(self, v40, v41);
    objc_msgSend_performRequest_(v42, v43, (uint64_t)v21);

    objc_destroyWeak(&v55);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v57);
    objc_destroyWeak(&v59);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
}

- (void)main
{
  id v4 = objc_msgSend_recordZoneIDs(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6)) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = objc_msgSend_isFetchAllRecordZonesOperation(self, v7, v8) ^ 1;
  }

  objc_msgSend_makeStateTransition_(self, v10, v9);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_recordZoneIDs(self, v6, v7);
  uint64_t v10 = objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8);

  if (objc_msgSend_count(v10, v11, v12))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1C4FDC69C;
    v16[3] = &unk_1E64F1D18;
    id v17 = v10;
    objc_msgSend_updateCloudKitMetrics_(self, v14, (uint64_t)v16);
  }
  objc_msgSend_setRecordZoneFetchedProgressBlock_(self, v13, 0);
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchRecordZonesOperation;
  [(CKDOperation *)&v15 _finishOnCallbackQueueWithError:v5];
}

- (id)recordZoneFetchedProgressBlock
{
  return self->_recordZoneFetchedProgressBlock;
}

- (void)setRecordZoneFetchedProgressBlock:(id)a3
{
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
}

- (BOOL)isFetchAllRecordZonesOperation
{
  return self->_isFetchAllRecordZonesOperation;
}

- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3
{
  self->_isFetchAllRecordZonesOperation = a3;
}

- (NSMutableDictionary)zonesToSaveForPCSUpdateByZoneID
{
  return self->_zonesToSaveForPCSUpdateByZoneID;
}

- (void)setZonesToSaveForPCSUpdateByZoneID:(id)a3
{
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (NSMutableArray)zoneIDsNeedingPCSUpdateRetry
{
  return self->_zoneIDsNeedingPCSUpdateRetry;
}

- (void)setZoneIDsNeedingPCSUpdateRetry:(id)a3
{
}

- (NSMutableDictionary)pcsUpdateErrorsByZoneID
{
  return self->_pcsUpdateErrorsByZoneID;
}

- (void)setPcsUpdateErrorsByZoneID:(id)a3
{
}

- (int64_t)numZoneSaveAttempts
{
  return self->_numZoneSaveAttempts;
}

- (void)setNumZoneSaveAttempts:(int64_t)a3
{
  self->_numZoneSaveAttempts = a3;
}

- (BOOL)onlyFetchPCSInfo
{
  return self->_onlyFetchPCSInfo;
}

- (void)setOnlyFetchPCSInfo:(BOOL)a3
{
  self->_onlyFetchuint64_t PCSInfo = a3;
}

- (NSMutableSet)zoneIDsNeedingDugongKeyRoll
{
  return self->_zoneIDsNeedingDugongKeyRoll;
}

- (void)setZoneIDsNeedingDugongKeyRoll:(id)a3
{
}

- (BOOL)ignorePCSFailures
{
  return self->_ignorePCSFailures;
}

- (void)setIgnorePCSFailures:(BOOL)a3
{
  self->_ignorePCSFailures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIDsNeedingDugongKeyRoll, 0);
  objc_storeStrong((id *)&self->_pcsUpdateErrorsByZoneID, 0);
  objc_storeStrong((id *)&self->_zoneIDsNeedingPCSUpdateRetry, 0);
  objc_storeStrong((id *)&self->_zonesToSaveForPCSUpdateByZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong(&self->_recordZoneFetchedProgressBlock, 0);
}

@end