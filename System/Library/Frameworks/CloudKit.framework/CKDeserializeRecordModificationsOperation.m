@interface CKDeserializeRecordModificationsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKDeserializeRecordModificationsOperation)init;
- (CKDeserializeRecordModificationsOperation)initWithSerializedModifications:(id)a3;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSData)serializedModifications;
- (id)activityCreate;
- (id)deserializeCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleDeserializationOfSaves:(id)a3 deletes:(id)a4 error:(id)a5;
- (void)setDeserializeCompletionBlock:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setSerializedModifications:(id)a3;
@end

@implementation CKDeserializeRecordModificationsOperation

- (CKDeserializeRecordModificationsOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKDeserializeRecordModificationsOperation;
  return [(CKOperation *)&v3 init];
}

- (CKDeserializeRecordModificationsOperation)initWithSerializedModifications:(id)a3
{
  id v4 = a3;
  v11 = (CKDeserializeRecordModificationsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    serializedModifications = v11->_serializedModifications;
    v11->_serializedModifications = (NSData *)v12;
  }
  return v11;
}

- (void)setDeserializeCompletionBlock:(id)a3
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
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B04071C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id deserializeCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_deserializeCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id deserializeCompletionBlock = self->_deserializeCompletionBlock;
    self->_id deserializeCompletionBlock = v11;
LABEL_9:
  }
}

- (id)deserializeCompletionBlock
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
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13B20;
    v16 = sub_18AF13850;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B040914;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_deserializeCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_serializedModifications(self, v5, v6, v7);
  objc_msgSend_setSerializedModifications_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKDeserializeRecordModificationsOperation;
  [(CKDatabaseOperation *)&v11 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKDeserializeRecordModificationsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v11 fillFromOperationInfo:v4];
  v8 = objc_msgSend_serializedModifications(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setSerializedModifications_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v4.receiver = self;
  v4.super_class = (Class)CKDeserializeRecordModificationsOperation;
  return [(CKOperation *)&v4 hasCKOperationCallbacksSet]
      || self->_deserializeCompletionBlock != 0;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_serializedModifications(self, a2, (uint64_t)a3, v3);

  if (v6)
  {
    v21.receiver = self;
    v21.super_class = (Class)CKDeserializeRecordModificationsOperation;
    return [(CKDatabaseOperation *)&v21 CKOperationShouldRun:a3];
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v8 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v8;
    id v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v20 = objc_msgSend_ckShortDescription(self, v17, v18, v19);
    *(_DWORD *)buf = 138543874;
    v23 = v16;
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 2114;
    v27 = v20;
    _os_log_debug_impl(&dword_18AF10000, v14, OS_LOG_TYPE_DEBUG, "Not running operation <%{public}@: %p; %{public}@> due to nil inputs",
      buf,
      0x20u);

    if (!a3) {
      return 0;
    }
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    uint64_t v12 = objc_msgSend_operationID(self, v9, v10, v11);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, @"CKErrorDomain", 12, @"There are no inputs for operation %@.", v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performDeserializeRecordModificationsOperation_withBlock_;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v11, (uint64_t)v10, (uint64_t)sel_handleDeserializationOfSaves_deletes_error_, 0, 0);

  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v17 = objc_msgSend_setWithObjects_(v12, v15, v13, v16, v14, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v18, (uint64_t)v17, (uint64_t)sel_handleDeserializationOfSaves_deletes_error_, 1, 0);

  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___CKDeserializeRecordModificationsOperation;
  objc_msgSendSuper2(&v19, sel_applyDaemonCallbackInterfaceTweaks_, v5);
}

- (void)handleDeserializationOfSaves:(id)a3 deletes:(id)a4 error:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v15 = signpost;

  if (v13)
  {
    if (v15)
    {
      if (self) {
        uint64_t v18 = self->super.super._signpost;
      }
      else {
        uint64_t v18 = 0;
      }
      objc_super v19 = v18;
      v23 = objc_msgSend_log(v19, v20, v21, v22);

      if (self) {
        __int16 v24 = self->super.super._signpost;
      }
      else {
        __int16 v24 = 0;
      }
      v25 = v24;
      os_signpost_id_t v29 = objc_msgSend_identifier(v25, v26, v27, v28);

      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        uint64_t v33 = objc_msgSend_count(v8, v30, v31, v32);
        int v58 = 134218242;
        uint64_t v59 = objc_msgSend_count(v9, v34, v35, v36) + v33;
        __int16 v60 = 2112;
        v61 = v13;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v23, OS_SIGNPOST_EVENT, v29, "CKDeserializeRecordModificationsOperation", "Deserialized results (%lu items) received with error: %@", (uint8_t *)&v58, 0x16u);
      }
    }
    objc_msgSend_finishWithError_(self, v16, (uint64_t)v13, v17);
  }
  else
  {
    if (v15)
    {
      if (self) {
        v37 = self->super.super._signpost;
      }
      else {
        v37 = 0;
      }
      v38 = v37;
      v42 = objc_msgSend_log(v38, v39, v40, v41);

      if (self) {
        v43 = self->super.super._signpost;
      }
      else {
        v43 = 0;
      }
      v44 = v43;
      os_signpost_id_t v48 = objc_msgSend_identifier(v44, v45, v46, v47);

      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        uint64_t v52 = objc_msgSend_count(v8, v49, v50, v51);
        int v58 = 134217984;
        uint64_t v59 = objc_msgSend_count(v9, v53, v54, v55) + v52;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v42, OS_SIGNPOST_EVENT, v48, "CKDeserializeRecordModificationsOperation", "Deserialized results (%lu items) received", (uint8_t *)&v58, 0xCu);
      }
    }
    objc_msgSend_setRecordsToSave_(self, v16, (uint64_t)v8, v17);
    objc_msgSend_setRecordIDsToDelete_(self, v56, (uint64_t)v9, v57);
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
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super.super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKDeserializeRecordModificationsOperation", "Finishing", buf, 2u);
    }
  }
  uint64_t v22 = objc_msgSend_deserializeCompletionBlock(self, v7, v8, v9);

  if (v22)
  {
    objc_msgSend_deserializeCompletionBlock(self, v23, v24, v25);
    __int16 v26 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_recordsToSave(self, v27, v28, v29);
    v34 = objc_msgSend_recordIDsToDelete(self, v31, v32, v33);
    v38 = objc_msgSend_CKClientSuitableError(v4, v35, v36, v37);
    ((void (**)(void, void *, void *, void *))v26)[2](v26, v30, v34, v38);

    objc_msgSend_setRecordsToSave_(self, v39, 0, v40);
    objc_msgSend_setRecordIDsToDelete_(self, v41, 0, v42);
    objc_msgSend_setDeserializeCompletionBlock_(self, v43, 0, v44);
  }
  v45.receiver = self;
  v45.super_class = (Class)CKDeserializeRecordModificationsOperation;
  [(CKOperation *)&v45 _finishOnCallbackQueueWithError:v4];
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
      id v5 = self->super.super._signpost;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
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
      objc_super v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKDeserializeRecordModificationsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  uint64_t v6 = signpost;

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKDeserializeRecordModificationsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/deserialize-record-modifications", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (NSData)serializedModifications
{
  return self->_serializedModifications;
}

- (void)setSerializedModifications:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_serializedModifications, 0);

  objc_storeStrong(&self->_deserializeCompletionBlock, 0);
}

@end