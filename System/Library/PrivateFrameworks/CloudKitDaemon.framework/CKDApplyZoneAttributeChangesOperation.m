@interface CKDApplyZoneAttributeChangesOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDApplyZoneAttributeChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKRecordZone)zone;
- (id)relevantZoneIDs;
- (unint64_t)pcsKeysRemoved;
- (void)decryptPCSs;
- (void)main;
- (void)removePCSKeys;
- (void)savePCSChanges;
- (void)setPcsKeysRemoved:(unint64_t)a3;
- (void)setZone:(id)a3;
- (void)updatePCSCache;
@end

@implementation CKDApplyZoneAttributeChangesOperation

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 4)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDApplyZoneAttributeChangesOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F82B0[a3 - 2];
  }
  return v3;
}

- (CKDApplyZoneAttributeChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDApplyZoneAttributeChangesOperation;
  v9 = [(CKDDatabaseOperation *)&v13 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_zone(v6, v7, v8);
    zone = v9->_zone;
    v9->_zone = (CKRecordZone *)v10;

    v9->_pcsKeysRemoved = 0;
  }

  return v9;
}

- (id)relevantZoneIDs
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_zone(self, a2, v2);
  id v6 = objc_msgSend_zoneID(v3, v4, v5);

  if (v6)
  {
    v10[0] = v6;
    uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v10, 1);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      id v6 = objc_msgSend_zone(self, v4, v5);
      v9 = objc_msgSend_protectionData(v6, v7, v8);
      uint64_t v12 = objc_msgSend_length(v9, v10, v11);

      if (!v12) {
        goto LABEL_7;
      }
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend_decryptPCSs(self, v13, v14);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend_removePCSKeys(self, v15, v16);
      break;
    case 3:
      if (!objc_msgSend_pcsKeysRemoved(self, v4, v5)) {
        goto LABEL_7;
      }
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend_savePCSChanges(self, v17, v18);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend_updatePCSCache(self, v23, v24);
      break;
    case 5:
LABEL_7:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      v21 = objc_msgSend_error(self, v19, v20);
      objc_msgSend_finishWithError_(self, v22, (uint64_t)v21);

      break;
    default:
      return 1;
  }
  return 1;
}

- (void)decryptPCSs
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_container(self, a2, v2);
  v7 = objc_msgSend_options(v4, v5, v6);
  int v10 = objc_msgSend_bypassPCSEncryption(v7, v8, v9);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    objc_super v13 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      v67 = v13;
      v70 = objc_msgSend_container(self, v68, v69);
      v73 = objc_msgSend_containerID(v70, v71, v72);
      v76 = objc_msgSend_zone(self, v74, v75);
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v73;
      __int16 v80 = 2112;
      v81 = v76;
      _os_log_error_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_ERROR, "Unexpected zone PCS data! Encryption should not be used in container %@. zone: %@", location, 0x16u);
    }
    v15 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 5004, 0, @"Encryption should not be used in this container.");
    objc_msgSend_setError_(self, v16, (uint64_t)v15);
  }
  else
  {
    v17 = objc_msgSend_stateTransitionGroup(self, v11, v12);
    dispatch_group_enter(v17);

    uint64_t v20 = objc_msgSend_container(self, v18, v19);
    v23 = objc_msgSend_entitlements(v20, v21, v22);
    uint64_t hasZoneProtectionDataEntitlement = objc_msgSend_hasZoneProtectionDataEntitlement(v23, v24, v25);
    v29 = objc_msgSend_zone(self, v27, v28);
    objc_msgSend_setSerializeProtectionData_(v29, v30, hasZoneProtectionDataEntitlement);

    objc_msgSend_noteOperationWillWaitOnPCS(self, v31, v32);
    v35 = objc_msgSend_zone(self, v33, v34);
    v15 = objc_msgSend_zonePCSModificationDate(v35, v36, v37);

    if (*MEMORY[0x1E4F1A4E0])
    {
      v40 = objc_msgSend_unitTestOverrides(self, v38, v39);
      v42 = objc_msgSend_objectForKeyedSubscript_(v40, v41, @"OverrideZonePCSModificationDate");

      if (v42)
      {
        v45 = objc_msgSend_unitTestOverrides(self, v43, v44);
        uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"OverrideZonePCSModificationDate");

        v15 = (void *)v47;
      }
    }
    objc_initWeak((id *)location, self);
    v50 = objc_msgSend_container(self, v48, v49);
    v53 = objc_msgSend_pcsManager(v50, v51, v52);
    v56 = objc_msgSend_zone(self, v54, v55);
    v59 = objc_msgSend_protectionData(v56, v57, v58);
    v62 = objc_msgSend_topmostParentOperation(self, v60, v61);
    v65 = objc_msgSend_operationID(v62, v63, v64);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = sub_1C4FD101C;
    v77[3] = &unk_1E64F52D0;
    objc_copyWeak(&v78, (id *)location);
    v77[4] = self;
    objc_msgSend_createZonePCSFromData_usingServiceIdentityWithType_zonePCSModificationDate_requestorOperationID_completionHandler_(v53, v66, (uint64_t)v59, 0, v15, v65, v77);

    objc_destroyWeak(&v78);
    objc_destroyWeak((id *)location);
  }
}

- (void)removePCSKeys
{
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  v7 = objc_msgSend_zone(self, v5, v6);
  uint64_t v12 = objc_msgSend_zonePCSKeysToRemove(v7, v8, v9);
  if (v12)
  {
    objc_super v13 = objc_msgSend_zone(self, v10, v11);
    uint64_t v16 = objc_msgSend_zonePCSKeysToRemove(v13, v14, v15);
    char isEmpty = objc_msgSend_isEmpty(v16, v17, v18);

    if (isEmpty)
    {
      uint64_t v12 = 0;
      goto LABEL_6;
    }
    uint64_t v22 = objc_msgSend_zone(self, v20, v21);
    uint64_t v25 = objc_msgSend_zonePCS(v22, v23, v24);

    v7 = objc_msgSend_container(self, v26, v27);
    v30 = objc_msgSend_pcsManager(v7, v28, v29);
    v33 = objc_msgSend_zone(self, v31, v32);
    v36 = objc_msgSend_zonePCSKeysToRemove(v33, v34, v35);
    uint64_t v39 = objc_msgSend_zone(self, v37, v38);
    v42 = objc_msgSend_protectionEtag(v39, v40, v41);
    uint64_t v12 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v30, v43, (uint64_t)v36, v25, v42, self);
  }
LABEL_6:
  uint64_t v44 = objc_msgSend_zone(self, v20, v21);
  uint64_t v49 = objc_msgSend_zoneishPCSKeysToRemove(v44, v45, v46);
  if (v49)
  {
    v50 = objc_msgSend_zone(self, v47, v48);
    v53 = objc_msgSend_zoneishPCSKeysToRemove(v50, v51, v52);
    char v56 = objc_msgSend_isEmpty(v53, v54, v55);

    if (v56)
    {
      uint64_t v49 = 0;
      goto LABEL_11;
    }
    v59 = objc_msgSend_zone(self, v57, v58);
    uint64_t v62 = objc_msgSend_zoneishPCS(v59, v60, v61);

    uint64_t v44 = objc_msgSend_container(self, v63, v64);
    v67 = objc_msgSend_pcsManager(v44, v65, v66);
    v70 = objc_msgSend_zone(self, v68, v69);
    v73 = objc_msgSend_zoneishPCSKeysToRemove(v70, v71, v72);
    v76 = objc_msgSend_zone(self, v74, v75);
    v79 = objc_msgSend_zoneishProtectionData(v76, v77, v78);
    v81 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v80, (uint64_t)v79);
    uint64_t v49 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v67, v82, (uint64_t)v73, v62, v81, self);
  }
LABEL_11:
  objc_msgSend_setPcsKeysRemoved_(self, v57, (uint64_t)v12 + (void)v49);
  if (objc_msgSend_pcsKeysRemoved(self, v83, v84))
  {
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = sub_1C4FD1690;
    v90[3] = &unk_1E64F8268;
    v90[4] = v12;
    v90[5] = v49;
    objc_msgSend_updateCloudKitMetrics_(self, v85, (uint64_t)v90);
    objc_msgSend_updatePCSCache(self, v87, v88);
  }
  v89 = objc_msgSend_stateTransitionGroup(self, v85, v86);
  dispatch_group_leave(v89);
}

- (void)savePCSChanges
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = v3;
    uint64_t v21 = objc_msgSend_zone(self, v19, v20);
    uint64_t v24 = objc_msgSend_zoneID(v21, v22, v23);
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v24;
    _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Saving PCS changes to the server for zone %@", buf, 0xCu);
  }
  uint64_t v6 = objc_msgSend_stateTransitionGroup(self, v4, v5);
  dispatch_group_enter(v6);

  v7 = objc_opt_new();
  int v10 = objc_msgSend_zone(self, v8, v9);
  v26 = v10;
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)&v26, 1);
  objc_msgSend_setRecordZonesToSave_(v7, v13, (uint64_t)v12);

  objc_msgSend_setAllowDefaultZoneSave_(v7, v14, 1);
  objc_msgSend_setMaxZoneSaveAttempts_(v7, v15, 1);
  uint64_t v16 = objc_opt_class();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4FD1900;
  v25[3] = &unk_1E64F0210;
  v25[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v17, v16, v7, v25);
}

- (void)updatePCSCache
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v36 = v3;
    uint64_t v39 = objc_msgSend_zone(self, v37, v38);
    v42 = objc_msgSend_zoneID(v39, v40, v41);
    int v43 = 138412290;
    uint64_t v44 = v42;
    _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Updating PCS cache for zone %@", (uint8_t *)&v43, 0xCu);
  }
  uint64_t v6 = objc_msgSend_stateTransitionGroup(self, v4, v5);
  dispatch_group_enter(v6);

  uint64_t v9 = objc_msgSend_zone(self, v7, v8);
  uint64_t v11 = objc_msgSend_dataWithZone_(CKDZonePCSData, v10, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_zone(self, v12, v13);
  uint64_t v17 = objc_msgSend_zonePCS(v14, v15, v16);
  objc_msgSend_setPcs_(v11, v18, v17);

  uint64_t v21 = objc_msgSend_zone(self, v19, v20);
  uint64_t v24 = objc_msgSend_zoneishPCS(v21, v22, v23);
  objc_msgSend_setZoneishPCS_(v11, v25, v24);

  uint64_t v28 = objc_msgSend_zone(self, v26, v27);
  v31 = objc_msgSend_zoneID(v28, v29, v30);
  objc_msgSend_setPCSData_forFetchedZoneID_(self, v32, (uint64_t)v11, v31);

  uint64_t v35 = objc_msgSend_stateTransitionGroup(self, v33, v34);
  dispatch_group_leave(v35);
}

- (void)main
{
}

- (unint64_t)pcsKeysRemoved
{
  return self->_pcsKeysRemoved;
}

- (void)setPcsKeysRemoved:(unint64_t)a3
{
  self->_pcsKeysRemoved = a3;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
}

- (void).cxx_destruct
{
}

@end