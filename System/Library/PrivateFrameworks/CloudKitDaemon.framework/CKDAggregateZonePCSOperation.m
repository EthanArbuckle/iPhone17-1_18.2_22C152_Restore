@interface CKDAggregateZonePCSOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)_saveTargetZone;
- (BOOL)didSynchronizeSigningIdentities;
- (BOOL)isHandlingRetryableError;
- (BOOL)makeStateTransition;
- (BOOL)needsSynchronizeSigningIdentities;
- (CKDAggregateZonePCSOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDPCSKeySyncCoreAnalytics)keySyncAnalytics;
- (CKRecordZone)targetZone;
- (CKRecordZoneID)zoneWaitingOnKeyRegistrySync;
- (NSArray)sourceZoneIDs;
- (NSError)currentError;
- (NSMutableDictionary)zonePCSDataByZoneID;
- (id)activityCreate;
- (id)relevantZoneIDs;
- (int)operationType;
- (int64_t)maxZoneSaveAttempts;
- (int64_t)numZoneSaveAttempts;
- (void)_fetchPCSDataForZoneID:(id)a3;
- (void)_fetchZonePCS;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleZoneSavedWithID:(id)a3 responseCode:(id)a4;
- (void)_prepareTargetZonePCS;
- (void)_sendCoreAnalyticsEventForKeySync;
- (void)_setPermanentFailure;
- (void)_sychronizeUserKeyRegistryIfNeeded;
- (void)_synchronizeSigningIdentitiesIfNeeded;
- (void)main;
- (void)setCurrentError:(id)a3;
- (void)setDidSynchronizeSigningIdentities:(BOOL)a3;
- (void)setIsHandlingRetryableError:(BOOL)a3;
- (void)setKeySyncAnalytics:(id)a3;
- (void)setMaxZoneSaveAttempts:(int64_t)a3;
- (void)setNeedsSynchronizeSigningIdentities:(BOOL)a3;
- (void)setNumZoneSaveAttempts:(int64_t)a3;
- (void)setSourceZoneIDs:(id)a3;
- (void)setTargetZone:(id)a3;
- (void)setZonePCSDataByZoneID:(id)a3;
- (void)setZoneWaitingOnKeyRegistrySync:(id)a3;
@end

@implementation CKDAggregateZonePCSOperation

- (CKDAggregateZonePCSOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKDAggregateZonePCSOperation;
  v9 = [(CKDDatabaseOperation *)&v24 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_sourceZoneIDs(v6, v7, v8);
    sourceZoneIDs = v9->_sourceZoneIDs;
    v9->_sourceZoneIDs = (NSArray *)v10;

    uint64_t v14 = objc_msgSend_targetZone(v6, v12, v13);
    targetZone = v9->_targetZone;
    v9->_targetZone = (CKRecordZone *)v14;

    uint64_t v16 = objc_opt_new();
    zonePCSDataByZoneID = v9->_zonePCSDataByZoneID;
    v9->_zonePCSDataByZoneID = (NSMutableDictionary *)v16;

    v20 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v18, v19);
    v9->_maxZoneSaveAttempts = (int)objc_msgSend_PCSRetryCount(v20, v21, v22);
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/aggregate-zone-pcs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (id)relevantZoneIDs
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_sourceZoneIDs(self, a2, v2);
  v7 = objc_msgSend_targetZone(self, v5, v6);
  uint64_t v10 = objc_msgSend_zoneID(v7, v8, v9);

  uint64_t v13 = objc_msgSend_count(v4, v11, v12);
  if (v13)
  {
    uint64_t v15 = v13;
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    if (v10) {
      v18 = objc_msgSend_initWithCapacity_(v16, v17, v15 + 1);
    }
    else {
      v18 = objc_msgSend_initWithCapacity_(v16, v17, v15);
    }
    v20 = v18;
    objc_msgSend_addObjectsFromArray_(v18, v19, (uint64_t)v4);
    if (v10) {
      objc_msgSend_addObject_(v20, v21, (uint64_t)v10);
    }
  }
  else if (v10)
  {
    v23[0] = v10;
    v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v23, 1);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      goto LABEL_2;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__prepareTargetZonePCS(self, v8, v9);
      return 1;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      uint64_t v12 = objc_msgSend_numZoneSaveAttempts(self, v10, v11);
      objc_msgSend_setNumZoneSaveAttempts_(self, v13, v12 + 1);
      return MEMORY[0x1F4181798](self, sel__saveTargetZone, v14);
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__synchronizeSigningIdentitiesIfNeeded(self, v15, v16);
      return 1;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__sychronizeUserKeyRegistryIfNeeded(self, v17, v18);
      return 1;
    case 6:
      uint64_t v19 = objc_msgSend_numZoneSaveAttempts(self, v4, v5);
      if (v19 < objc_msgSend_maxZoneSaveAttempts(self, v20, v21)
        && objc_msgSend_isHandlingRetryableError(self, v4, v22)
        && (objc_msgSend_zoneWaitingOnKeyRegistrySync(self, v4, v22),
            v23 = objc_claimAutoreleasedReturnValue(),
            v23,
            !v23))
      {
LABEL_2:
        objc_msgSend_setState_(self, v4, 2);
        objc_msgSend__fetchZonePCS(self, v6, v7);
      }
      else
      {
        if (objc_msgSend_isHandlingRetryableError(self, v4, v22)) {
          objc_msgSend__setPermanentFailure(self, v24, v25);
        }
        objc_msgSend__sendCoreAnalyticsEventForKeySync(self, v24, v25);
        objc_msgSend_setState_(self, v26, 0xFFFFFFFFLL);
        v29 = objc_msgSend_error(self, v27, v28);
        objc_msgSend_finishWithError_(self, v30, (uint64_t)v29);
      }
      return 1;
    default:
      return 1;
  }
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 5)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDAggregateZonePCSOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F6CC8[a3 - 2];
  }
  return v3;
}

- (void)main
{
}

- (void)_fetchZonePCS
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_sourceZoneIDs(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_sourceZoneIDs(self, v8, v9);
    uint64_t v13 = objc_msgSend_targetZone(self, v11, v12);
    uint64_t v16 = objc_msgSend_zoneID(v13, v14, v15);
    uint64_t v18 = objc_msgSend_arrayByAddingObject_(v10, v17, (uint64_t)v16);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v19 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = objc_msgSend_count(v18, v21, v22);
      _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Fetching PCS data for %ld zones", buf, 0xCu);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v18;
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v30, v34, 16);
    if (v25)
    {
      uint64_t v27 = v25;
      uint64_t v28 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v31 != v28) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend__fetchPCSDataForZoneID_(self, v26, *(void *)(*((void *)&v30 + 1) + 8 * i), (void)v30);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v30, v34, 16);
      }
      while (v27);
    }
  }
}

- (void)_fetchPCSDataForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_stateTransitionGroup(self, v5, v6);
  dispatch_group_enter(v7);

  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend_container(self, v8, v9);
  uint64_t v13 = objc_msgSend_pcsCache(v10, v11, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4F55784;
  v16[3] = &unk_1E64F6C80;
  objc_copyWeak(&v18, &location);
  v16[4] = self;
  id v14 = v4;
  id v17 = v14;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v13, v15, (uint64_t)v14, self, 0, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_prepareTargetZonePCS
{
  v3 = self;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  id v4 = objc_msgSend_zonePCSDataByZoneID(self, a2, v2);
  uint64_t v7 = objc_msgSend_targetZone(v3, v5, v6);
  uint64_t v10 = objc_msgSend_zoneID(v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)v10);

  v78 = v12;
  objc_msgSend_pcs(v12, v13, v14);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v17 = objc_msgSend_sourceZoneIDs(v3, v15, v16);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v87, v95, 16);
  if (!v19)
  {
LABEL_24:

    v64 = 0;
    goto LABEL_31;
  }
  uint64_t v22 = *(void *)v88;
  uint64_t v72 = *MEMORY[0x1E4F19DD8];
  v80 = v3;
  v74 = v17;
  uint64_t v70 = *(void *)v88;
LABEL_3:
  uint64_t v23 = 0;
  uint64_t v71 = v19;
LABEL_4:
  if (*(void *)v88 != v22) {
    objc_enumerationMutation(v17);
  }
  uint64_t v73 = v23;
  uint64_t v24 = *(void *)(*((void *)&v87 + 1) + 8 * v23);
  uint64_t v25 = objc_msgSend_zonePCSDataByZoneID(v3, v20, v21);
  uint64_t v75 = v24;
  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v25, v26, v24);

  uint64_t v82 = objc_msgSend_pcs(v27, v28, v29);
  long long v30 = (void *)PCSFPCopyKeyIDs();
  v76 = v30;
  if (objc_msgSend_count(v30, v31, v32))
  {
    v77 = v27;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = v30;
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v83, v94, 16);
    if (!v35) {
      goto LABEL_22;
    }
    uint64_t v36 = v35;
    uint64_t v81 = *(void *)v84;
LABEL_9:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v84 != v81) {
        objc_enumerationMutation(obj);
      }
      uint64_t v38 = *(void *)(*((void *)&v83 + 1) + 8 * v37);
      v40 = (const void *)PCSFPCopyPrivateKey();
      if (!v40) {
        break;
      }
      if ((PCSFPAddPrivateKey() & 1) == 0)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v41, v72, 5005, @"Failed to add identity to the target zone PCS from zone %@", v75);
        goto LABEL_27;
      }
      v43 = objc_msgSend_container(v3, v41, v42);
      v46 = objc_msgSend_deviceContext(v43, v44, v45);
      uint64_t v49 = objc_msgSend_testDeviceReference(v46, v47, v48);
      if (v49)
      {
        v52 = (void *)v49;
        v53 = objc_msgSend_targetZone(v3, v50, v51);
        v56 = objc_msgSend_zoneID(v53, v54, v55);
        v59 = objc_msgSend_zoneName(v56, v57, v58);
        int isEqualToString = objc_msgSend_isEqualToString_(v59, v60, @"PCS_PREPARE_FAILURE");

        if (isEqualToString)
        {
          v64 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v62, v72, 5005, @"Failed to add identity to the target zone PCS from zone %@", v75);
          v3 = v80;
LABEL_28:

          id v17 = v74;
          uint64_t v27 = v77;
          goto LABEL_29;
        }
      }
      else
      {
      }
      CFRelease(v40);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      ++v37;
      v3 = v80;
      if (v36 == v37)
      {
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v83, v94, 16);
        if (v36) {
          goto LABEL_9;
        }
LABEL_22:

        id v17 = v74;
        uint64_t v23 = v73 + 1;
        uint64_t v22 = v70;
        if (v73 + 1 == v71)
        {
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v20, (uint64_t)&v87, v95, 16);
          if (!v19) {
            goto LABEL_24;
          }
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v39, v72, 5005, @"Couldn't get PCS identity with key ID %@ from zone %@", v38, v75);
    v64 = LABEL_27:;
    goto LABEL_28;
  }
  v64 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v33, v72, 5005, @"Couldn't get key IDs from zone PCS %@ for zone %@", v82, v75);
  v40 = 0;
LABEL_29:

  if (v40) {
    CFRelease(v40);
  }
LABEL_31:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v64)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v65 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v64;
      _os_log_impl(&dword_1C4CFF000, v65, OS_LOG_TYPE_INFO, "Warn: Error preparing target zone PCS: %@", buf, 0xCu);
    }
    v68 = objc_msgSend_error(v3, v66, v67);

    if (!v68) {
      objc_msgSend_setError_(v3, v69, (uint64_t)v64);
    }
  }
}

- (BOOL)_saveTargetZone
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_zonePCSDataByZoneID(self, a2, v2);
  uint64_t v7 = objc_msgSend_targetZone(self, v5, v6);
  uint64_t v10 = objc_msgSend_zoneID(v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)v10);

  uint64_t v15 = objc_msgSend_container(self, v13, v14);
  id v18 = objc_msgSend_pcsManager(v15, v16, v17);
  uint64_t v21 = objc_msgSend_pcs(v12, v19, v20);
  id v75 = 0;
  uint64_t v23 = objc_msgSend_dataFromZonePCS_error_(v18, v22, v21, &v75);
  id v24 = v75;

  if (v24)
  {
    uint64_t v27 = objc_msgSend_error(self, v25, v26);
    BOOL v28 = v27 == 0;

    if (v28) {
      objc_msgSend_setError_(self, v29, (uint64_t)v24);
    }
  }
  else
  {
    long long v30 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v25, (uint64_t)v23);
    long long v33 = objc_msgSend_targetZone(self, v31, v32);
    objc_msgSend_setProtectionData_(v33, v34, (uint64_t)v23);

    uint64_t v37 = objc_msgSend_targetZone(self, v35, v36);
    objc_msgSend_setProtectionEtag_(v37, v38, (uint64_t)v30);

    v41 = objc_msgSend_etag(v12, v39, v40);
    v44 = objc_msgSend_targetZone(self, v42, v43);
    objc_msgSend_setPreviousProtectionEtag_(v44, v45, (uint64_t)v41);

    uint64_t v48 = objc_msgSend_stateTransitionGroup(self, v46, v47);
    dispatch_group_enter(v48);

    uint64_t v49 = [CKDModifyRecordZonesURLRequest alloc];
    v52 = objc_msgSend_targetZone(self, v50, v51);
    v76[0] = v52;
    v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v53, (uint64_t)v76, 1);
    v56 = objc_msgSend_initWithOperation_recordZonesToSave_recordZoneIDsToDelete_(v49, v55, (uint64_t)self, v54, 0);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v56);
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = sub_1C4F563F8;
    v71[3] = &unk_1E64F3CF0;
    objc_copyWeak(&v72, &location);
    objc_msgSend_setRecordZoneModifiedBlock_(v56, v57, (uint64_t)v71);
    uint64_t v65 = MEMORY[0x1E4F143A8];
    uint64_t v66 = 3221225472;
    uint64_t v67 = sub_1C4F56470;
    v68 = &unk_1E64F0170;
    objc_copyWeak(&v69, &location);
    objc_copyWeak(&v70, &from);
    objc_msgSend_setCompletionBlock_(v56, v58, (uint64_t)&v65);
    objc_msgSend_setRequest_(self, v59, (uint64_t)v56, v65, v66, v67, v68);
    v62 = objc_msgSend_container(self, v60, v61);
    objc_msgSend_performRequest_(v62, v63, (uint64_t)v56);

    objc_destroyWeak(&v70);
    objc_destroyWeak(&v69);
    objc_destroyWeak(&v72);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v24 == 0;
}

- (int)operationType
{
  return 200;
}

- (void)_synchronizeSigningIdentitiesIfNeeded
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_needsSynchronizeSigningIdentities(self, a2, v2)
    && (objc_msgSend_didSynchronizeSigningIdentities(self, v4, v5) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_topmostParentOperation(self, v6, v7);
    uint64_t v11 = objc_msgSend_operationID(v8, v9, v10);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v11;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Will attempt user key sync to update signing identities for operation %{public}@.", buf, 0xCu);
    }
    uint64_t v15 = objc_msgSend_stateTransitionGroup(self, v13, v14);
    dispatch_group_enter(v15);

    objc_initWeak((id *)buf, self);
    id v18 = objc_msgSend_container(self, v16, v17);
    uint64_t v21 = objc_msgSend_pcsManager(v18, v19, v20);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1C4F568F8;
    v24[3] = &unk_1E64F3C78;
    objc_copyWeak(&v26, (id *)buf);
    id v22 = v11;
    id v25 = v22;
    objc_msgSend_synchronizeUserKeyRegistryForSigningIdentitiesForRequestorOperationID_completionHandler_(v21, v23, (uint64_t)v22, v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_sychronizeUserKeyRegistryIfNeeded
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_zoneWaitingOnKeyRegistrySync(self, a2, v2);

  if (v4)
  {
    uint64_t v7 = objc_msgSend_topmostParentOperation(self, v5, v6);
    uint64_t v10 = objc_msgSend_operationID(v7, v8, v9);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v10;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Will attempt user key sync for operation %{public}@.", buf, 0xCu);
    }
    uint64_t v14 = objc_msgSend_stateTransitionGroup(self, v12, v13);
    dispatch_group_enter(v14);

    objc_initWeak((id *)buf, self);
    uint64_t v17 = objc_msgSend_container(self, v15, v16);
    uint64_t v20 = objc_msgSend_pcsManager(v17, v18, v19);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = sub_1C4F56CE0;
    v23[3] = &unk_1E64F3CA0;
    objc_copyWeak(&v25, (id *)buf);
    id v21 = v10;
    id v24 = v21;
    objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(v20, v22, 0, 1, 0x1F20587B0, v21, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_sendCoreAnalyticsEventForKeySync
{
  id v4 = objc_msgSend_keySyncAnalytics(self, a2, v2);

  if (!v4) {
    return;
  }
  uint64_t v7 = objc_msgSend_error(self, v5, v6);

  if (!v7)
  {
    uint64_t v20 = objc_msgSend_keySyncAnalytics(self, v8, v9);
    objc_msgSend_setOverallResult_(v20, v25, @"success");
    goto LABEL_7;
  }
  uint64_t v10 = objc_msgSend_keySyncAnalytics(self, v8, v9);
  objc_msgSend_setOverallResult_(v10, v11, @"failure");

  uint64_t v14 = objc_msgSend_keySyncAnalytics(self, v12, v13);
  uint64_t v17 = objc_msgSend_error(v14, v15, v16);

  if (!v17)
  {
    uint64_t v20 = objc_msgSend_error(self, v18, v19);
    uint64_t v23 = objc_msgSend_keySyncAnalytics(self, v21, v22);
    objc_msgSend_setError_(v23, v24, (uint64_t)v20);

LABEL_7:
  }
  objc_msgSend_container(self, v18, v19);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = objc_msgSend_pcsManager(v33, v26, v27);
  long long v31 = objc_msgSend_keySyncAnalytics(self, v29, v30);
  objc_msgSend_sendCoreAnalyticsEventForKeySync_(v28, v32, (uint64_t)v31);
}

- (void)_handleZoneSavedWithID:(id)a3 responseCode:(id)a4
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_targetZone(self, v9, v10);
  uint64_t v14 = objc_msgSend_zoneID(v11, v12, v13);
  char isEqual = objc_msgSend_isEqual_(v7, v15, (uint64_t)v14);

  if ((isEqual & 1) == 0)
  {
    v133 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v133, v134, (uint64_t)a2, self, @"CKDAggregateZonePCSOperation.m", 399, @"Only the target zone must be saved");
  }
  objc_msgSend_setIsHandlingRetryableError_(self, v17, 0);
  uint64_t v21 = sub_1C4E94D98(v8);
  if (*MEMORY[0x1E4F1A4E0])
  {
    if (objc_msgSend_checkAndClearUnitTestOverrides_(self, v19, @"SwizzleZoneSaveResponseToErrorZonePCSIdentityUnknown"))
    {
      objc_msgSend_setCode_(v8, v22, 3);
      uint64_t v21 = 2053;
    }
    if (objc_msgSend_checkAndClearUnitTestOverrides_(self, v22, @"CKUnderlyingErrorPCSOplockFailed"))
    {
      objc_msgSend_setCode_(v8, v19, 3);
      uint64_t v21 = 2037;
    }
  }
  int v23 = objc_msgSend_code(v8, v19, v20);
  if (v7 && v23 == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v26 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = v26;
      uint64_t v32 = objc_msgSend_targetZone(self, v30, v31);
      *(_DWORD *)buf = 138412290;
      *(void *)v139 = v32;
      _os_log_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_INFO, "Target zone %@ was successfully saved to the server", buf, 0xCu);
    }
    id v33 = objc_msgSend_targetZone(self, v27, v28);
    uint64_t v36 = objc_msgSend_protectionData(v33, v34, v35);

    if (v36)
    {
      v39 = objc_msgSend_stateTransitionGroup(self, v37, v38);
      dispatch_group_enter(v39);

      objc_initWeak((id *)buf, self);
      uint64_t v42 = objc_msgSend_container(self, v40, v41);
      uint64_t v45 = objc_msgSend_pcsManager(v42, v43, v44);
      uint64_t v48 = objc_msgSend_targetZone(self, v46, v47);
      uint64_t v51 = objc_msgSend_protectionData(v48, v49, v50);
      v135[0] = MEMORY[0x1E4F143A8];
      v135[1] = 3221225472;
      v135[2] = sub_1C4F57814;
      v135[3] = &unk_1E64F6CA8;
      objc_copyWeak(&v137, (id *)buf);
      id v136 = v7;
      objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v45, v52, (uint64_t)v51, 3, 0, v135);

      objc_destroyWeak(&v137);
      objc_destroyWeak((id *)buf);
    }
    goto LABEL_37;
  }
  switch(v21)
  {
    case 2036:
      uint64_t v55 = objc_msgSend_container(self, v24, v25);
      uint64_t v58 = objc_msgSend_recordCache(v55, v56, v57);
      objc_msgSend_clearAllRecordsForZoneWithID_(v58, v59, (uint64_t)v7);

      objc_msgSend_setPCSData_forFetchedZoneID_(self, v60, 0, v7);
      v63 = objc_msgSend_container(self, v61, v62);
      uint64_t v66 = objc_msgSend_pcsCache(v63, v64, v65);
      objc_msgSend_removePCSDataForItemsInZoneWithID_(v66, v67, (uint64_t)v7);

      break;
    case 2053:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v97 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v99 = v97;
        v102 = objc_msgSend_operationID(self, v100, v101);
        *(_DWORD *)buf = 138412546;
        *(void *)v139 = v7;
        *(_WORD *)&v139[8] = 2114;
        *(void *)&v139[10] = v102;
        _os_log_impl(&dword_1C4CFF000, v99, OS_LOG_TYPE_INFO, "Zone PCS for %@ failed server validation. Will attempt user key sync for operation %{public}@ before trying again.", buf, 0x16u);
      }
      objc_msgSend_setZoneWaitingOnKeyRegistrySync_(self, v98, (uint64_t)v7);
      goto LABEL_36;
    case 2037:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v53 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v139 = v7;
        _os_log_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_INFO, "Received a PCS oplock failure for save of zone %@. Re-fetching the zone PCS and trying again", buf, 0xCu);
      }
LABEL_36:
      objc_msgSend_setIsHandlingRetryableError_(self, v54, 1);
      v103 = (void *)MEMORY[0x1E4F1A280];
      v106 = objc_msgSend_request(self, v104, v105);
      v107 = sub_1C4E940D0(v106, v8);
      v110 = objc_msgSend_targetZone(self, v108, v109);
      v113 = objc_msgSend_error(v8, v111, v112);
      v116 = objc_msgSend_errorDescription(v113, v114, v115);
      v118 = objc_msgSend_errorWithDomain_code_userInfo_format_(v103, v117, *MEMORY[0x1E4F19DD8], v21, v107, @"Error saving record zone %@ to server: %@", v110, v116);
      objc_msgSend_setCurrentError_(self, v119, (uint64_t)v118);

      v122 = objc_msgSend_targetZone(self, v120, v121);
      objc_msgSend_setProtectionData_(v122, v123, 0);

      v126 = objc_msgSend_targetZone(self, v124, v125);
      objc_msgSend_setProtectionEtag_(v126, v127, 0);

      v130 = objc_msgSend_targetZone(self, v128, v129);
      objc_msgSend_setPreviousProtectionEtag_(v130, v131, 0);

      objc_msgSend_setPCSData_forFetchedZoneID_(self, v132, 0, v7);
LABEL_37:
      v91 = 0;
      goto LABEL_38;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v68 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v71 = v68;
    int v74 = objc_msgSend_code(v8, v72, v73);
    v77 = objc_msgSend_targetZone(self, v75, v76);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v139 = v74;
    *(_WORD *)&v139[4] = 2112;
    *(void *)&v139[6] = v77;
    _os_log_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_INFO, "Error %d when saving record zone %@ to the server", buf, 0x12u);
  }
  v78 = (void *)MEMORY[0x1E4F1A280];
  v79 = objc_msgSend_request(self, v69, v70);
  v80 = sub_1C4E940D0(v79, v8);
  long long v83 = objc_msgSend_targetZone(self, v81, v82);
  long long v86 = objc_msgSend_error(v8, v84, v85);
  long long v89 = objc_msgSend_errorDescription(v86, v87, v88);
  v91 = objc_msgSend_errorWithDomain_code_userInfo_format_(v78, v90, *MEMORY[0x1E4F19DD8], v21, v80, @"Error saving record zone %@ to server: %@", v83, v89);

  if (v91)
  {
    v94 = objc_msgSend_error(self, v92, v93);
    BOOL v95 = v94 == 0;

    if (v95) {
      objc_msgSend_setError_(self, v96, (uint64_t)v91);
    }
  }
LABEL_38:
}

- (void)_setPermanentFailure
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_keySyncAnalytics(self, a2, v2);
  if (v4)
  {
    id v7 = (void *)v4;
    id v8 = objc_msgSend_keySyncAnalytics(self, v5, v6);
    uint64_t v11 = objc_msgSend_error(v8, v9, v10);
    if (v11)
    {

LABEL_10:
      goto LABEL_11;
    }
    uint64_t v14 = objc_msgSend_numZoneSaveAttempts(self, v12, v13);

    if (v14 >= 2)
    {
      id v7 = objc_msgSend_container(self, v5, v6);
      id v8 = objc_msgSend_processName(v7, v15, v16);
      uint64_t v19 = objc_msgSend_containerID(v7, v17, v18);
      uint64_t v22 = objc_msgSend_containerIdentifier(v19, v20, v21);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      int v23 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
      {
        id v26 = v23;
        uint64_t v29 = objc_msgSend_operationID(self, v27, v28);
        int v30 = 138543874;
        uint64_t v31 = v29;
        __int16 v32 = 2114;
        id v33 = v8;
        __int16 v34 = 2114;
        uint64_t v35 = v22;
        _os_log_fault_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_FAULT, "Failed to save target zone for operation %{public}@ despite user key sync. procName=%{public}@, containerID=%{public}@", (uint8_t *)&v30, 0x20u);
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  id v24 = objc_msgSend_currentError(self, v5, v6);
  objc_msgSend_setError_(self, v25, (uint64_t)v24);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = objc_msgSend_sourceZoneIDs(self, v6, v7);
  uint64_t v10 = objc_msgSend_setWithArray_(v5, v9, (uint64_t)v8);

  if (objc_msgSend_count(v10, v11, v12))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1C4F57CC4;
    v15[3] = &unk_1E64F1D18;
    id v16 = v10;
    objc_msgSend_updateCloudKitMetrics_(self, v13, (uint64_t)v15);
  }
  v14.receiver = self;
  v14.super_class = (Class)CKDAggregateZonePCSOperation;
  [(CKDOperation *)&v14 _finishOnCallbackQueueWithError:v4];
}

- (NSArray)sourceZoneIDs
{
  return self->_sourceZoneIDs;
}

- (void)setSourceZoneIDs:(id)a3
{
}

- (CKRecordZone)targetZone
{
  return self->_targetZone;
}

- (void)setTargetZone:(id)a3
{
}

- (NSMutableDictionary)zonePCSDataByZoneID
{
  return self->_zonePCSDataByZoneID;
}

- (void)setZonePCSDataByZoneID:(id)a3
{
}

- (BOOL)isHandlingRetryableError
{
  return self->_isHandlingRetryableError;
}

- (void)setIsHandlingRetryableError:(BOOL)a3
{
  self->_isHandlingRetryableError = a3;
}

- (NSError)currentError
{
  return (NSError *)objc_getProperty(self, a2, 488, 1);
}

- (void)setCurrentError:(id)a3
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

- (int64_t)maxZoneSaveAttempts
{
  return self->_maxZoneSaveAttempts;
}

- (void)setMaxZoneSaveAttempts:(int64_t)a3
{
  self->_maxZoneSaveAttempts = a3;
}

- (CKRecordZoneID)zoneWaitingOnKeyRegistrySync
{
  return self->_zoneWaitingOnKeyRegistrySync;
}

- (void)setZoneWaitingOnKeyRegistrySync:(id)a3
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
  objc_storeStrong((id *)&self->_zoneWaitingOnKeyRegistrySync, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_zonePCSDataByZoneID, 0);
  objc_storeStrong((id *)&self->_targetZone, 0);
  objc_storeStrong((id *)&self->_sourceZoneIDs, 0);
}

@end