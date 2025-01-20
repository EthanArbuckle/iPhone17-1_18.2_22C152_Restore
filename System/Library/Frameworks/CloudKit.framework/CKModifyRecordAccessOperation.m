@interface CKModifyRecordAccessOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKModifyRecordAccessOperation)initWithRecordIDsToGrantAccess:(id)a3 recordIDsToRevokeAccess:(id)a4;
- (NSArray)recordIDsToGrant;
- (NSArray)recordIDsToRevoke;
- (NSMutableArray)grantedRecordIDs;
- (NSMutableArray)revokedRecordIDs;
- (NSMutableDictionary)recordErrors;
- (id)activityCreate;
- (id)recordAccessCompletionBlock;
- (id)recordAccessGrantedBlock;
- (id)recordAccessRevokedBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleRecordAccessInitiationForRecordID:(id)a3 accessToken:(id)a4 referenceIdentifier:(id)a5 error:(id)a6;
- (void)handleRecordAccessRevocationForRecordID:(id)a3 error:(id)a4;
- (void)setGrantedRecordIDs:(id)a3;
- (void)setRecordAccessCompletionBlock:(id)a3;
- (void)setRecordAccessGrantedBlock:(id)a3;
- (void)setRecordAccessRevokedBlock:(id)a3;
- (void)setRecordErrors:(id)a3;
- (void)setRecordIDsToGrant:(id)a3;
- (void)setRecordIDsToRevoke:(id)a3;
- (void)setRevokedRecordIDs:(id)a3;
@end

@implementation CKModifyRecordAccessOperation

- (CKModifyRecordAccessOperation)initWithRecordIDsToGrantAccess:(id)a3 recordIDsToRevokeAccess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CKModifyRecordAccessOperation;
  v11 = [(CKOperation *)&v26 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    recordIDsToGrant = v11->_recordIDsToGrant;
    v11->_recordIDsToGrant = (NSArray *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    recordIDsToRevoke = v11->_recordIDsToRevoke;
    v11->_recordIDsToRevoke = (NSArray *)v17;

    uint64_t v19 = objc_opt_new();
    grantedRecordIDs = v11->_grantedRecordIDs;
    v11->_grantedRecordIDs = (NSMutableArray *)v19;

    uint64_t v21 = objc_opt_new();
    revokedRecordIDs = v11->_revokedRecordIDs;
    v11->_revokedRecordIDs = (NSMutableArray *)v21;

    uint64_t v23 = objc_opt_new();
    recordErrors = v11->_recordErrors;
    v11->_recordErrors = (NSMutableDictionary *)v23;
  }
  return v11;
}

- (void)setRecordAccessGrantedBlock:(id)a3
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
    v14[2] = sub_18B1706F8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id recordAccessGrantedBlock = v15;
    goto LABEL_9;
  }
  if (self->_recordAccessGrantedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id recordAccessGrantedBlock = self->_recordAccessGrantedBlock;
    self->_id recordAccessGrantedBlock = v11;
LABEL_9:
  }
}

- (id)recordAccessGrantedBlock
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
    id v15 = sub_18AF1425C;
    uint64_t v16 = sub_18AF139E8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1708F0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordAccessGrantedBlock);
  }

  return v8;
}

- (void)setRecordAccessRevokedBlock:(id)a3
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
    v14[2] = sub_18B170A7C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id recordAccessRevokedBlock = v15;
    goto LABEL_9;
  }
  if (self->_recordAccessRevokedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id recordAccessRevokedBlock = self->_recordAccessRevokedBlock;
    self->_id recordAccessRevokedBlock = v11;
LABEL_9:
  }
}

- (id)recordAccessRevokedBlock
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
    id v15 = sub_18AF1425C;
    uint64_t v16 = sub_18AF139E8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B170C74;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordAccessRevokedBlock);
  }

  return v8;
}

- (void)setRecordAccessCompletionBlock:(id)a3
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
    v14[2] = sub_18B170E00;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id recordAccessCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_recordAccessCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id recordAccessCompletionBlock = self->_recordAccessCompletionBlock;
    self->_id recordAccessCompletionBlock = v11;
LABEL_9:
  }
}

- (id)recordAccessCompletionBlock
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
    id v15 = sub_18AF1425C;
    uint64_t v16 = sub_18AF139E8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B170FF8;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordAccessCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_recordIDsToGrant(self, v5, v6, v7);
  objc_msgSend_setRecordIDsToGrant_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_recordIDsToRevoke(self, v11, v12, v13);
  objc_msgSend_setRecordIDsToRevoke_(v4, v15, (uint64_t)v14, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKModifyRecordAccessOperation;
  [(CKDatabaseOperation *)&v17 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKModifyRecordAccessOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v17 fillFromOperationInfo:v4];
  v8 = objc_msgSend_recordIDsToGrant(v4, v5, v6, v7, v17.receiver, v17.super_class);
  objc_msgSend_setRecordIDsToGrant_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_recordIDsToRevoke(v4, v11, v12, v13);

  objc_msgSend_setRecordIDsToRevoke_(self, v15, (uint64_t)v14, v16);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v17.receiver = self;
  v17.super_class = (Class)CKModifyRecordAccessOperation;
  if ([(CKOperation *)&v17 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_recordAccessGrantedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_recordAccessRevokedBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v15 = objc_msgSend_recordAccessCompletionBlock(self, v11, v12, v13);
      BOOL v6 = v15 != 0;
    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v4 = a3;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_recordIDsToGrant(self, a2, (uint64_t)a3, v3);
  if (objc_msgSend_count(v6, v7, v8, v9))
  {
  }
  else
  {
    uint64_t v16 = objc_msgSend_recordIDsToRevoke(self, v10, v11, v12);
    uint64_t v20 = objc_msgSend_count(v16, v17, v18, v19);

    if (!v20) {
      return 0;
    }
  }
  uint64_t v21 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v13, v14, v15);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v25 = objc_msgSend_recordIDsToGrant(self, v22, v23, v24);
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v85, (uint64_t)v90, 16);
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v86;
    obuint64_t j = v25;
    do
    {
      v30 = v4;
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v86 != v29) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v30)
          {
            v71 = (objc_class *)objc_opt_class();
            v72 = NSStringFromClass(v71);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v73, @"CKErrorDomain", 12, @"Unexpected recordID to grant access passed to %@: %@", v72, v32);
            id *v30 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_30;
        }
        v36 = objc_msgSend_zoneID(v32, v33, v34, v35);
        int v38 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v37, (uint64_t)v36, (uint64_t)v30);

        if (!v38) {
          goto LABEL_30;
        }
        if (objc_msgSend_containsObject_(v21, v39, (uint64_t)v32, v40))
        {
          if (v30)
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, @"CKErrorDomain", 12, @"You can't grant access to the same record ID twice in a single operation: %@", v32);
            BOOL v70 = 0;
            id *v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
            v47 = obj;
            goto LABEL_41;
          }
LABEL_30:
          BOOL v70 = 0;
          goto LABEL_31;
        }
        objc_msgSend_addObject_(v21, v41, (uint64_t)v32, v42);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v85, (uint64_t)v90, 16);
      uint64_t v4 = v30;
      v25 = obj;
    }
    while (v28);
  }

  v47 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v44, v45, v46);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  objc_msgSend_recordIDsToRevoke(self, v48, v49, v50);
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v51, (uint64_t)&v81, (uint64_t)v89, 16);
  if (!v52) {
    goto LABEL_25;
  }
  uint64_t v53 = v52;
  uint64_t v54 = *(void *)v82;
  while (2)
  {
    for (uint64_t j = 0; j != v53; ++j)
    {
      if (*(void *)v82 != v54) {
        objc_enumerationMutation(obja);
      }
      v56 = *(void **)(*((void *)&v81 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v4)
        {
          v74 = (objc_class *)objc_opt_class();
          v75 = NSStringFromClass(v74);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v76, @"CKErrorDomain", 12, @"Unexpected recordID to revoke access passed to %@: %@", v75, v56);
          id *v4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_40;
      }
      v60 = objc_msgSend_zoneID(v56, v57, v58, v59);
      int v62 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v61, (uint64_t)v60, (uint64_t)v4);

      if (!v62) {
        goto LABEL_40;
      }
      if (objc_msgSend_containsObject_(v21, v63, (uint64_t)v56, v64))
      {
        if (v4)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v65, @"CKErrorDomain", 12, @"You can't grant and revoke access to the same record ID in a single operation: %@", v56);
          goto LABEL_39;
        }
LABEL_40:

        BOOL v70 = 0;
        goto LABEL_41;
      }
      if (objc_msgSend_containsObject_(v47, v65, (uint64_t)v56, v66))
      {
        if (v4)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v67, @"CKErrorDomain", 12, @"You can't revoke access to the same record ID twice in a single operation: %@", v56);
LABEL_39:
          id *v4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_40;
      }
      objc_msgSend_addObject_(v47, v67, (uint64_t)v56, v68);
    }
    uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v69, (uint64_t)&v81, (uint64_t)v89, 16);
    if (v53) {
      continue;
    }
    break;
  }
LABEL_25:

  v80.receiver = self;
  v80.super_class = (Class)CKModifyRecordAccessOperation;
  BOOL v70 = [(CKDatabaseOperation *)&v80 CKOperationShouldRun:v4];
LABEL_41:

  return v70;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifyRecordAccessOperation_withBlock_;
}

- (void)handleRecordAccessInitiationForRecordID:(id)a3 accessToken:(id)a4 referenceIdentifier:(id)a5 error:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = objc_msgSend_CKClientSuitableError(a6, v13, v14, v15);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v18 = signpost;

  if (v16)
  {
    if (v18)
    {
      if (self) {
        v22 = self->super.super._signpost;
      }
      else {
        v22 = 0;
      }
      uint64_t v23 = v22;
      uint64_t v27 = objc_msgSend_log(v23, v24, v25, v26);

      if (self) {
        uint64_t v28 = self->super.super._signpost;
      }
      else {
        uint64_t v28 = 0;
      }
      uint64_t v29 = v28;
      os_signpost_id_t v33 = objc_msgSend_identifier(v29, v30, v31, v32);

      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        int v58 = 138412546;
        id v59 = v10;
        __int16 v60 = 2112;
        v61 = v16;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v27, OS_SIGNPOST_EVENT, v33, "CKModifyRecordAccessOperation", "Record %@ access granted with error: %@", (uint8_t *)&v58, 0x16u);
      }
    }
    uint64_t v34 = objc_msgSend_recordErrors(self, v19, v20, v21);
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v16, (uint64_t)v10);
  }
  else
  {
    if (v18)
    {
      if (self) {
        v36 = self->super.super._signpost;
      }
      else {
        v36 = 0;
      }
      v37 = v36;
      v41 = objc_msgSend_log(v37, v38, v39, v40);

      if (self) {
        uint64_t v42 = self->super.super._signpost;
      }
      else {
        uint64_t v42 = 0;
      }
      v43 = v42;
      os_signpost_id_t v47 = objc_msgSend_identifier(v43, v44, v45, v46);

      if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        int v58 = 138412290;
        id v59 = v10;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v41, OS_SIGNPOST_EVENT, v47, "CKModifyRecordAccessOperation", "Record %@ access granted", (uint8_t *)&v58, 0xCu);
      }
    }
    uint64_t v34 = objc_msgSend_grantedRecordIDs(self, v19, v20, v21);
    objc_msgSend_addObject_(v34, v48, (uint64_t)v10, v49);
  }

  uint64_t v53 = objc_msgSend_recordAccessGrantedBlock(self, v50, v51, v52);

  if (v53)
  {
    objc_msgSend_recordAccessGrantedBlock(self, v54, v55, v56);
    v57 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, id, void *))v57)[2](v57, v10, v11, v12, v16);
  }
}

- (void)handleRecordAccessRevocationForRecordID:(id)a3 error:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v12 = signpost;

  if (v10)
  {
    if (v12)
    {
      if (self) {
        uint64_t v16 = self->super.super._signpost;
      }
      else {
        uint64_t v16 = 0;
      }
      objc_super v17 = v16;
      uint64_t v21 = objc_msgSend_log(v17, v18, v19, v20);

      if (self) {
        v22 = self->super.super._signpost;
      }
      else {
        v22 = 0;
      }
      uint64_t v23 = v22;
      os_signpost_id_t v27 = objc_msgSend_identifier(v23, v24, v25, v26);

      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        int v52 = 138412546;
        id v53 = v6;
        __int16 v54 = 2112;
        uint64_t v55 = v10;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v21, OS_SIGNPOST_EVENT, v27, "CKModifyRecordAccessOperation", "Record %@ access revoked with error: %@", (uint8_t *)&v52, 0x16u);
      }
    }
    uint64_t v28 = objc_msgSend_recordErrors(self, v13, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v10, (uint64_t)v6);
  }
  else
  {
    if (v12)
    {
      if (self) {
        v30 = self->super.super._signpost;
      }
      else {
        v30 = 0;
      }
      uint64_t v31 = v30;
      uint64_t v35 = objc_msgSend_log(v31, v32, v33, v34);

      if (self) {
        v36 = self->super.super._signpost;
      }
      else {
        v36 = 0;
      }
      v37 = v36;
      os_signpost_id_t v41 = objc_msgSend_identifier(v37, v38, v39, v40);

      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        int v52 = 138412290;
        id v53 = v6;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v35, OS_SIGNPOST_EVENT, v41, "CKModifyRecordAccessOperation", "Record %@ access revoked", (uint8_t *)&v52, 0xCu);
      }
    }
    uint64_t v28 = objc_msgSend_revokedRecordIDs(self, v13, v14, v15);
    objc_msgSend_addObject_(v28, v42, (uint64_t)v6, v43);
  }

  os_signpost_id_t v47 = objc_msgSend_recordAccessRevokedBlock(self, v44, v45, v46);

  if (v47)
  {
    objc_msgSend_recordAccessRevokedBlock(self, v48, v49, v50);
    uint64_t v51 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void *))v51)[2](v51, v6, v10);
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
      id v10 = self->super.super._signpost;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKModifyRecordAccessOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    v22 = objc_msgSend_recordErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      os_signpost_id_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_recordErrors(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to grant/revoke access to some records");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint64_t v34 = objc_msgSend_recordAccessCompletionBlock(self, v7, v8, v9);

  if (v34)
  {
    objc_msgSend_recordAccessCompletionBlock(self, v35, v36, v37);
    int v38 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v42 = objc_msgSend_grantedRecordIDs(self, v39, v40, v41);
    uint64_t v46 = objc_msgSend_revokedRecordIDs(self, v43, v44, v45);
    uint64_t v50 = objc_msgSend_CKClientSuitableError(v4, v47, v48, v49);
    ((void (**)(void, void *, void *, void *))v38)[2](v38, v42, v46, v50);

    objc_msgSend_setRecordAccessCompletionBlock_(self, v51, 0, v52);
  }
  objc_msgSend_setRecordAccessGrantedBlock_(self, v35, 0, v37);
  objc_msgSend_setRecordAccessRevokedBlock_(self, v53, 0, v54);
  v55.receiver = self;
  v55.super_class = (Class)CKModifyRecordAccessOperation;
  [(CKOperation *)&v55 _finishOnCallbackQueueWithError:v4];
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
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      id v11 = self->super.super._signpost;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
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
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      id v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      objc_super v55 = v20;
      __int16 v56 = 2112;
      v57 = v24;
      __int16 v58 = 2112;
      id v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifyRecordAccessOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
    id v12 = objc_msgSend_log(v8, v9, v10, v11);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifyRecordAccessOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/modify-record-access", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleRecordAccessInitiationForRecordID_accessToken_referenceIdentifier_error_, 3, 0);

  uint64_t v7 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleRecordAccessRevocationForRecordID_error_, 1, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKModifyRecordAccessOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)recordIDsToGrant
{
  return self->_recordIDsToGrant;
}

- (void)setRecordIDsToGrant:(id)a3
{
}

- (NSArray)recordIDsToRevoke
{
  return self->_recordIDsToRevoke;
}

- (void)setRecordIDsToRevoke:(id)a3
{
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
}

- (NSMutableArray)grantedRecordIDs
{
  return self->_grantedRecordIDs;
}

- (void)setGrantedRecordIDs:(id)a3
{
}

- (NSMutableArray)revokedRecordIDs
{
  return self->_revokedRecordIDs;
}

- (void)setRevokedRecordIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revokedRecordIDs, 0);
  objc_storeStrong((id *)&self->_grantedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_recordIDsToRevoke, 0);
  objc_storeStrong((id *)&self->_recordIDsToGrant, 0);
  objc_storeStrong(&self->_recordAccessCompletionBlock, 0);
  objc_storeStrong(&self->_recordAccessRevokedBlock, 0);

  objc_storeStrong(&self->_recordAccessGrantedBlock, 0);
}

@end