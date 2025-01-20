@interface CKDSerializeRecordModificationsOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4;
- (CKDProtocolTranslator)translator;
- (CKDSerializeRecordModificationsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSData)serializedModifications;
- (id)activityCreate;
- (id)serializeCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_preflightRecords;
- (void)_serialize;
- (void)_setupTranslator;
- (void)main;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setSerializeCompletionBlock:(id)a3;
- (void)setSerializedModifications:(id)a3;
- (void)setTranslator:(id)a3;
@end

@implementation CKDSerializeRecordModificationsOperation

- (CKDSerializeRecordModificationsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDSerializeRecordModificationsOperation;
  v9 = [(CKDDatabaseOperation *)&v17 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordsToSave(v6, v7, v8);
    recordsToSave = v9->_recordsToSave;
    v9->_recordsToSave = (NSArray *)v10;

    uint64_t v14 = objc_msgSend_recordIDsToDelete(v6, v12, v13);
    recordIDsToDelete = v9->_recordIDsToDelete;
    v9->_recordIDsToDelete = (NSArray *)v14;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/serialize-record-modifications", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__preflightRecords(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__setupTranslator(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__serialize(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      uint64_t v13 = objc_msgSend_error(self, v11, v12);
      objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDSerializeRecordModificationsOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F65D8[a3 - 2];
  }
  return v3;
}

- (void)main
{
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKDSerializeRecordModificationsOperation;
  if (![(CKDOperation *)&v23 validateAgainstLiveContainer:v6 error:a4]) {
    goto LABEL_9;
  }
  v9 = objc_msgSend_entitlements(v6, v7, v8);
  char hasAllowRealTimeOperationsEntitlement = objc_msgSend_hasAllowRealTimeOperationsEntitlement(v9, v10, v11);

  if ((hasAllowRealTimeOperationsEntitlement & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v20 = v13;
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_error_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_ERROR, "Operation %{public}@ is not allowed to run without an entitlement", buf, 0xCu);

      if (!a4) {
        goto LABEL_10;
      }
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v15 = *MEMORY[0x1E4F19C40];
    v16 = (objc_class *)objc_opt_class();
    objc_super v17 = NSStringFromClass(v16);
    objc_msgSend_errorWithDomain_code_format_(v14, v18, v15, 8, @"Operation %@ is not allowed to run without an entitlement", v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    LOBYTE(a4) = 0;
    goto LABEL_10;
  }
  LOBYTE(a4) = 1;
LABEL_10:

  return (char)a4;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_serializeCompletionBlock(self, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_serializeCompletionBlock(self, v8, v9);
    uint64_t v13 = (void (**)(void, void, void))v10;
    if (v4)
    {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v4);
    }
    else
    {
      uint64_t v14 = objc_msgSend_serializedModifications(self, v11, v12);
      ((void (**)(void, void *, void))v13)[2](v13, v14, 0);
    }
    objc_msgSend_setSerializeCompletionBlock_(self, v15, 0);
  }
  v16.receiver = self;
  v16.super_class = (Class)CKDSerializeRecordModificationsOperation;
  [(CKDOperation *)&v16 _finishOnCallbackQueueWithError:v4];
}

- (void)_preflightRecords
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_recordsToSave(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v36 = self;
    uint64_t v10 = objc_msgSend_recordsToSave(self, v8, v9);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v38, v43, 16);
    if (v12)
    {
      uint64_t v15 = v12;
      uint64_t v16 = *(void *)v39;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v10);
          }
          v18 = objc_msgSend_valueStore(*(void **)(*((void *)&v38 + 1) + 8 * v17), v13, v14);
          v42[0] = objc_opt_class();
          v42[1] = objc_opt_class();
          v42[2] = objc_opt_class();
          v42[3] = objc_opt_class();
          v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v42, 4);
          char v22 = objc_msgSend_containsValueOfClasses_passingTest_(v18, v21, (uint64_t)v20, &unk_1F2044270);

          if (v22)
          {
            v34 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19C40], 12, @"CKDSerializeRecordModificationsOperation does not support records with asset values");
            objc_msgSend_setError_(v36, v35, (uint64_t)v34);

            uint64_t v26 = v10;
            goto LABEL_12;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v38, v43, 16);
        if (v15) {
          continue;
        }
        break;
      }
    }

    v25 = objc_msgSend_stateTransitionGroup(v36, v23, v24);
    dispatch_group_enter(v25);

    uint64_t v26 = objc_opt_new();
    v29 = objc_msgSend_recordsToSave(v36, v27, v28);
    objc_msgSend_setRecordsToSave_(v26, v30, (uint64_t)v29);

    objc_msgSend_setShouldModifyRecordsInDatabase_(v26, v31, 0);
    uint64_t v32 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = sub_1C4F2BA84;
    v37[3] = &unk_1E64F0210;
    v37[4] = v36;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v36, v33, v32, v26, v37);
LABEL_12:
  }
}

- (void)_setupTranslator
{
  id v4 = objc_msgSend_container(self, a2, v2);
  uint64_t v7 = objc_msgSend_databaseScope(self, v5, v6);
  uint64_t v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
  dispatch_group_enter(v10);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4F2BDEC;
  v13[3] = &unk_1E64F1AB0;
  v13[4] = self;
  id v14 = v4;
  uint64_t v15 = v7;
  id v11 = v4;
  objc_msgSend_fetchImportantUserIDsForOperation_withCompletionHandler_(v11, v12, (uint64_t)self, v13);
}

- (void)_serialize
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v82 = v3;
    v85 = objc_msgSend_recordsToSave(self, v83, v84);
    *(_DWORD *)buf = 134217984;
    uint64_t v119 = objc_msgSend_count(v85, v86, v87);
    _os_log_debug_impl(&dword_1C4CFF000, v82, OS_LOG_TYPE_DEBUG, "Packaging SaveRecord (%lu records)", buf, 0xCu);
  }
  v104 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5);
  v103 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v10 = objc_msgSend_recordsToSave(self, v8, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v111, v117, 16);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v112;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v112 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v111 + 1) + 8 * v15);
        uint64_t v17 = objc_alloc_init(CKDPRealTimeMessageSaveRecord);
        v20 = objc_msgSend_translator(self, v18, v19);
        char v22 = objc_msgSend_pRecordFromRecord_forCache_(v20, v21, (uint64_t)v16, 1);

        if (!v22)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v74 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            v99 = v74;
            v102 = objc_msgSend_recordID(v16, v100, v101);
            *(_DWORD *)buf = 138412290;
            uint64_t v119 = (uint64_t)v102;
            _os_log_error_impl(&dword_1C4CFF000, v99, OS_LOG_TYPE_ERROR, "Internal error transforming record %@", buf, 0xCu);
          }
          v77 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v78 = *MEMORY[0x1E4F19C40];
          char v22 = objc_msgSend_recordID(v16, v75, v76);
          v80 = objc_msgSend_errorWithDomain_code_format_(v77, v79, v78, 1000, @"Internal error transforming record %@", v22);
          objc_msgSend_setError_(self, v81, (uint64_t)v80);

          goto LABEL_50;
        }
        objc_msgSend_setRecord_(v17, v23, (uint64_t)v22);
        objc_msgSend_addObject_(v104, v24, (uint64_t)v17);
        uint64_t v116 = objc_opt_class();
        uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)&v116, 1);
        v109[0] = MEMORY[0x1E4F143A8];
        v109[1] = 3221225472;
        v109[2] = sub_1C4F2C7EC;
        v109[3] = &unk_1E64F65B8;
        v109[4] = self;
        v109[5] = v16;
        id v27 = v103;
        id v110 = v27;
        objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v16, v28, (uint64_t)v26, v109);

        v31 = objc_msgSend_error(self, v29, v30);

        if (v31)
        {

          goto LABEL_50;
        }
        if (objc_msgSend_count(v27, v32, v33))
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v34 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v36 = v34;
            uint64_t v39 = objc_msgSend_count(v27, v37, v38);
            *(_DWORD *)buf = 134217984;
            uint64_t v119 = v39;
            _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Found and packaged AssociatedMergeableDeltas (%lu deltas)", buf, 0xCu);
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v35, (uint64_t)&v111, v117, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  long long v40 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v88 = v40;
    v91 = objc_msgSend_recordIDsToDelete(self, v89, v90);
    uint64_t v94 = objc_msgSend_count(v91, v92, v93);
    *(_DWORD *)buf = 134217984;
    uint64_t v119 = v94;
    _os_log_debug_impl(&dword_1C4CFF000, v88, OS_LOG_TYPE_DEBUG, "Packaging DeleteRecordID (%lu recordIDs)", buf, 0xCu);
  }
  uint64_t v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v41, v42);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v45 = objc_msgSend_recordIDsToDelete(self, v43, v44);
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v105, v115, 16);
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v106 != v49) {
          objc_enumerationMutation(v45);
        }
        uint64_t v51 = *(void *)(*((void *)&v105 + 1) + 8 * i);
        v52 = objc_alloc_init(CKDPRealTimeMessageDeleteRecordID);
        v55 = objc_msgSend_translator(self, v53, v54);
        v57 = objc_msgSend_pRecordIdentifierFromRecordID_(v55, v56, v51);

        objc_msgSend_setRecordIdentifier_(v52, v58, (uint64_t)v57);
        objc_msgSend_addObject_(v10, v59, (uint64_t)v52);
      }
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v60, (uint64_t)&v105, v115, 16);
    }
    while (v48);
  }

  uint64_t v17 = objc_alloc_init(CKDPRealTimeMessage);
  if (objc_msgSend_count(v104, v61, v62)) {
    objc_msgSend_setSaveRecords_(v17, v63, (uint64_t)v104);
  }
  else {
    objc_msgSend_setSaveRecords_(v17, v63, 0);
  }
  if (objc_msgSend_count(v10, v64, v65)) {
    objc_msgSend_setDeleteRecordids_(v17, v66, (uint64_t)v10);
  }
  else {
    objc_msgSend_setDeleteRecordids_(v17, v66, 0);
  }
  if (objc_msgSend_count(v103, v67, v68)) {
    objc_msgSend_setAssociatedMergeableDeltas_(v17, v69, (uint64_t)v103);
  }
  else {
    objc_msgSend_setAssociatedMergeableDeltas_(v17, v69, 0);
  }
  char v22 = objc_msgSend_data(v17, v70, v71);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v72 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v95 = v72;
    uint64_t v98 = objc_msgSend_length(v22, v96, v97);
    *(_DWORD *)buf = 134217984;
    uint64_t v119 = v98;
    _os_log_debug_impl(&dword_1C4CFF000, v95, OS_LOG_TYPE_DEBUG, "Total serialization of %lu bytes", buf, 0xCu);
  }
  objc_msgSend_setSerializedModifications_(self, v73, (uint64_t)v22);
LABEL_50:
}

- (id)serializeCompletionBlock
{
  return self->_serializeCompletionBlock;
}

- (void)setSerializeCompletionBlock:(id)a3
{
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (CKDProtocolTranslator)translator
{
  return (CKDProtocolTranslator *)objc_getProperty(self, a2, 480, 1);
}

- (void)setTranslator:(id)a3
{
}

- (NSData)serializedModifications
{
  return (NSData *)objc_getProperty(self, a2, 488, 1);
}

- (void)setSerializedModifications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedModifications, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong(&self->_serializeCompletionBlock, 0);
}

@end