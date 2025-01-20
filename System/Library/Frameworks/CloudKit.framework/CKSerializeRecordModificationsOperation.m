@interface CKSerializeRecordModificationsOperation
+ (SEL)daemonInvocationSelector;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKSerializeRecordModificationsOperation)init;
- (CKSerializeRecordModificationsOperation)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSData)serializedModifications;
- (id)activityCreate;
- (id)serializeCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleSerialization:(id)a3 error:(id)a4;
- (void)performCKOperation;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setSerializeCompletionBlock:(id)a3;
- (void)setSerializedModifications:(id)a3;
@end

@implementation CKSerializeRecordModificationsOperation

- (CKSerializeRecordModificationsOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKSerializeRecordModificationsOperation;
  return [(CKOperation *)&v3 init];
}

- (CKSerializeRecordModificationsOperation)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14 = (CKSerializeRecordModificationsOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    recordsToSave = v14->_recordsToSave;
    v14->_recordsToSave = (NSArray *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    recordIDsToDelete = v14->_recordIDsToDelete;
    v14->_recordIDsToDelete = (NSArray *)v20;
  }
  return v14;
}

- (void)setSerializeCompletionBlock:(id)a3
{
  id v7 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B078128;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id serializeCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_serializeCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id serializeCompletionBlock = self->_serializeCompletionBlock;
    self->_id serializeCompletionBlock = v11;
LABEL_9:
  }
}

- (id)serializeCompletionBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13CB0;
    v16 = sub_18AF138A8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B078320;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_serializeCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_recordsToSave(self, v5, v6, v7);
  objc_msgSend_setRecordsToSave_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_recordIDsToDelete(self, v11, v12, v13);
  objc_msgSend_setRecordIDsToDelete_(v4, v15, (uint64_t)v14, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKSerializeRecordModificationsOperation;
  [(CKDatabaseOperation *)&v17 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKSerializeRecordModificationsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v17 fillFromOperationInfo:v4];
  v8 = objc_msgSend_recordsToSave(v4, v5, v6, v7, v17.receiver, v17.super_class);
  objc_msgSend_setRecordsToSave_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_recordIDsToDelete(v4, v11, v12, v13);

  objc_msgSend_setRecordIDsToDelete_(self, v15, (uint64_t)v14, v16);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v4.receiver = self;
  v4.super_class = (Class)CKSerializeRecordModificationsOperation;
  return [(CKOperation *)&v4 hasCKOperationCallbacksSet]
      || self->_serializeCompletionBlock != 0;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_recordsToSave(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
  }
  else
  {
    uint64_t v13 = objc_msgSend_recordIDsToDelete(self, v7, v8, v9);

    if (!v13)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v45 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v51 = v45;
        v52 = (objc_class *)objc_opt_class();
        v53 = NSStringFromClass(v52);
        v57 = objc_msgSend_ckShortDescription(self, v54, v55, v56);
        *(_DWORD *)buf = 138543874;
        v70 = v53;
        __int16 v71 = 2048;
        v72 = self;
        __int16 v73 = 2114;
        v74 = v57;
        _os_log_debug_impl(&dword_18AF10000, v51, OS_LOG_TYPE_DEBUG, "Not running operation <%{public}@: %p; %{public}@> due to nil inputs",
          buf,
          0x20u);

        if (!a3) {
          return 0;
        }
      }
      else if (!a3)
      {
        return 0;
      }
      v49 = objc_msgSend_operationID(self, v46, v47, v48);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v50, @"CKErrorDomain", 12, @"There are no inputs for operation %@.", v49);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v14 = objc_msgSend_recordsToSave(self, v10, v11, v12);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v63, (uint64_t)v68, 16);
  if (v16)
  {
    uint64_t v20 = v16;
    uint64_t v21 = *(void *)v64;
LABEL_6:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v64 != v21) {
        objc_enumerationMutation(v14);
      }
      v23 = objc_msgSend_recordID(*(void **)(*((void *)&v63 + 1) + 8 * v22), v17, v18, v19);
      v27 = objc_msgSend_zoneID(v23, v24, v25, v26);
      int v29 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v28, (uint64_t)v27, (uint64_t)a3);

      if (!v29) {
        break;
      }
      if (v20 == ++v22)
      {
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v63, (uint64_t)v68, 16);
        if (v20) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v14 = objc_msgSend_recordIDsToDelete(self, v30, v31, v32);
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v33, (uint64_t)&v59, (uint64_t)v67, 16);
    if (!v34)
    {
LABEL_20:

      v58.receiver = self;
      v58.super_class = (Class)CKSerializeRecordModificationsOperation;
      return [(CKDatabaseOperation *)&v58 CKOperationShouldRun:a3];
    }
    uint64_t v38 = v34;
    uint64_t v39 = *(void *)v60;
LABEL_14:
    uint64_t v40 = 0;
    while (1)
    {
      if (*(void *)v60 != v39) {
        objc_enumerationMutation(v14);
      }
      v41 = objc_msgSend_zoneID(*(void **)(*((void *)&v59 + 1) + 8 * v40), v35, v36, v37);
      int v43 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v42, (uint64_t)v41, (uint64_t)a3);

      if (!v43) {
        break;
      }
      if (v38 == ++v40)
      {
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v35, (uint64_t)&v59, (uint64_t)v67, 16);
        if (v38) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
    }
  }

  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performSerializeRecordModificationsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_recordsToSave(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v13 = objc_msgSend_database(self, v10, v11, v12);
    objc_super v17 = objc_msgSend_container(v13, v14, v15, v16);

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v21 = objc_msgSend_recordsToSave(self, v18, v19, v20);
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v34, (uint64_t)v38, 16);
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = *(void *)v35;
      while (2)
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v21);
          }
          v28 = *(void **)(*((void *)&v34 + 1) + 8 * v27);
          id v33 = 0;
          objc_msgSend_prepareMergeablesForUploadInContainer_useAssetsIfNecessary_error_(v28, v24, (uint64_t)v17, 0, &v33);
          id v29 = v33;
          if (v29)
          {
            uint64_t v31 = v29;
            objc_msgSend_finishWithError_(self, v24, (uint64_t)v29, v30);

            return;
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v34, (uint64_t)v38, 16);
        if (v25) {
          continue;
        }
        break;
      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)CKSerializeRecordModificationsOperation;
  [(CKOperation *)&v32 performCKOperation];
}

- (void)handleSerialization:(id)a3 error:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v12 = signpost;

  if (v10)
  {
    if (v12)
    {
      if (self) {
        uint64_t v15 = self->super.super._signpost;
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v16 = v15;
      uint64_t v20 = objc_msgSend_log(v16, v17, v18, v19);

      if (self) {
        uint64_t v21 = self->super.super._signpost;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = v21;
      os_signpost_id_t v26 = objc_msgSend_identifier(v22, v23, v24, v25);

      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        int v45 = 134218242;
        uint64_t v46 = objc_msgSend_length(v6, v27, v28, v29);
        __int16 v47 = 2112;
        uint64_t v48 = v10;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v20, OS_SIGNPOST_EVENT, v26, "CKSerializeRecordModificationsOperation", "Serialized results (%lu bytes) received with error: %@", (uint8_t *)&v45, 0x16u);
      }
    }
    objc_msgSend_finishWithError_(self, v13, (uint64_t)v10, v14);
  }
  else
  {
    if (v12)
    {
      if (self) {
        uint64_t v30 = self->super.super._signpost;
      }
      else {
        uint64_t v30 = 0;
      }
      uint64_t v31 = v30;
      long long v35 = objc_msgSend_log(v31, v32, v33, v34);

      if (self) {
        long long v36 = self->super.super._signpost;
      }
      else {
        long long v36 = 0;
      }
      long long v37 = v36;
      os_signpost_id_t v41 = objc_msgSend_identifier(v37, v38, v39, v40);

      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        int v45 = 134217984;
        uint64_t v46 = objc_msgSend_length(v6, v42, v43, v44);
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v35, OS_SIGNPOST_EVENT, v41, "CKSerializeRecordModificationsOperation", "Serialized results (%lu bytes) received", (uint8_t *)&v45, 0xCu);
      }
    }
    objc_msgSend_setSerializedModifications_(self, v13, (uint64_t)v6, v14);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super.super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    objc_super v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKSerializeRecordModificationsOperation", "Finishing", buf, 2u);
    }
  }
  uint64_t v22 = objc_msgSend_serializeCompletionBlock(self, v7, v8, v9);

  if (v22)
  {
    objc_msgSend_serializeCompletionBlock(self, v23, v24, v25);
    os_signpost_id_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = objc_msgSend_serializedModifications(self, v27, v28, v29);
    uint64_t v34 = objc_msgSend_CKClientSuitableError(v4, v31, v32, v33);
    ((void (**)(void, void *, void *))v26)[2](v26, v30, v34);

    objc_msgSend_setSerializedModifications_(self, v35, 0, v36);
    objc_msgSend_setSerializeCompletionBlock_(self, v37, 0, v38);
  }
  v39.receiver = self;
  v39.super_class = (Class)CKSerializeRecordModificationsOperation;
  [(CKOperation *)&v39 _finishOnCallbackQueueWithError:v4];
}

- (void)ckSignpostBegin
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v4 = signpost;

  if (v4)
  {
    if (self) {
      uint64_t v5 = self->super.super._signpost;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    uint64_t v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      uint64_t v11 = self->super.super._signpost;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      int v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      v57 = v24;
      __int16 v58 = 2112;
      long long v59 = v32;
      __int16 v60 = 2114;
      long long v61 = v36;
      __int16 v62 = 2114;
      long long v63 = v45;
      __int16 v64 = 2114;
      long long v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKSerializeRecordModificationsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v7 = self->super.super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7;
    uint64_t v12 = objc_msgSend_log(v8, v9, v10, v11);

    if (self) {
      uint64_t v13 = self->super.super._signpost;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    os_signpost_id_t v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKSerializeRecordModificationsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/serialize-record-modifications", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
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

- (NSData)serializedModifications
{
  return self->_serializedModifications;
}

- (void)setSerializedModifications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedModifications, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);

  objc_storeStrong(&self->_serializeCompletionBlock, 0);
}

@end