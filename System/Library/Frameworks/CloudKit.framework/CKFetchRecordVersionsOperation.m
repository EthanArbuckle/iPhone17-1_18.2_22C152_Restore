@interface CKFetchRecordVersionsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)isDeleted;
- (BOOL)shouldFetchAssetContent;
- (CKFetchRecordVersionsOperation)init;
- (CKFetchRecordVersionsOperation)initWithRecordIDs:(id)a3;
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (NSMutableDictionary)recordErrors;
- (NSString)minimumVersionETag;
- (id)activityCreate;
- (id)fetchRecordVersionsCompletionBlock;
- (id)fetchRecordVersionsProgressBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleFetchForRecordID:(id)a3 isDeleted:(BOOL)a4 versions:(id)a5 error:(id)a6;
- (void)setDesiredKeys:(id)a3;
- (void)setFetchRecordVersionsCompletionBlock:(id)a3;
- (void)setFetchRecordVersionsProgressBlock:(id)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setMinimumVersionETag:(id)a3;
- (void)setRecordErrors:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
@end

@implementation CKFetchRecordVersionsOperation

- (CKFetchRecordVersionsOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKFetchRecordVersionsOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v3;

    v2->_shouldFetchAssetContent = 1;
  }
  return v2;
}

- (CKFetchRecordVersionsOperation)initWithRecordIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = (CKFetchRecordVersionsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v8)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v4;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = [CKException alloc];
            id v25 = (id)objc_msgSend_initWithCode_format_(v23, v24, 12, @"%@ is not a valid record ID", v15);
            objc_exception_throw(v25);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v16, (uint64_t)&v26, (uint64_t)v30, 16);
      }
      while (v12);
    }

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    recordIDs = v8->_recordIDs;
    v8->_recordIDs = (NSArray *)v20;
  }
  return v8;
}

- (void)setFetchRecordVersionsProgressBlock:(id)a3
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
    v14[2] = sub_18B0FA90C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchRecordVersionsProgressBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchRecordVersionsProgressBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchRecordVersionsProgressBlock = self->_fetchRecordVersionsProgressBlock;
    self->_id fetchRecordVersionsProgressBlock = v11;
LABEL_9:
  }
}

- (id)fetchRecordVersionsProgressBlock
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
    id v15 = sub_18AF13F20;
    v16 = sub_18AF13938;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0FAB04;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordVersionsProgressBlock);
  }

  return v8;
}

- (void)setFetchRecordVersionsCompletionBlock:(id)a3
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
    v14[2] = sub_18B0FAC90;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchRecordVersionsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchRecordVersionsCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchRecordVersionsCompletionBlock = self->_fetchRecordVersionsCompletionBlock;
    self->_id fetchRecordVersionsCompletionBlock = v11;
LABEL_9:
  }
}

- (id)fetchRecordVersionsCompletionBlock
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
    id v15 = sub_18AF13F20;
    v16 = sub_18AF13938;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0FAE88;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordVersionsCompletionBlock);
  }

  return v8;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-record-versions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_recordIDs(self, v5, v6, v7);
  objc_msgSend_setRecordIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_desiredKeys(self, v11, v12, v13);
  objc_msgSend_setDesiredKeys_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_minimumVersionETag(self, v17, v18, v19);
  objc_msgSend_setMinimumVersionETag_(v4, v21, (uint64_t)v20, v22);

  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v23, v24, v25);
  objc_msgSend_setShouldFetchAssetContent_(v4, v27, AssetContent, v28);
  v29.receiver = self;
  v29.super_class = (Class)CKFetchRecordVersionsOperation;
  [(CKDatabaseOperation *)&v29 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CKFetchRecordVersionsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v29 fillFromOperationInfo:v4];
  v8 = objc_msgSend_recordIDs(v4, v5, v6, v7, v29.receiver, v29.super_class);
  objc_msgSend_setRecordIDs_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_desiredKeys(v4, v11, v12, v13);
  objc_msgSend_setDesiredKeys_(self, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_minimumVersionETag(v4, v17, v18, v19);
  objc_msgSend_setMinimumVersionETag_(self, v21, (uint64_t)v20, v22);

  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(v4, v23, v24, v25);
  objc_msgSend_setShouldFetchAssetContent_(self, v27, AssetContent, v28);
}

- (void)handleFetchForRecordID:(id)a3 isDeleted:(BOOL)a4 versions:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v15 = objc_msgSend_CKClientSuitableError(a6, v12, v13, v14);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v17 = signpost;

  if (v15)
  {
    if (v17)
    {
      if (self) {
        v21 = self->super.super._signpost;
      }
      else {
        v21 = 0;
      }
      uint64_t v22 = v21;
      long long v26 = objc_msgSend_log(v22, v23, v24, v25);

      if (self) {
        long long v27 = self->super.super._signpost;
      }
      else {
        long long v27 = 0;
      }
      uint64_t v28 = v27;
      os_signpost_id_t v32 = objc_msgSend_identifier(v28, v29, v30, v31);

      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        int v51 = 138412546;
        id v52 = v10;
        __int16 v53 = 2112;
        v54 = v15;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v26, OS_SIGNPOST_EVENT, v32, "CKFetchRecordVersionsOperation", "Record %@ fetched with error: %@", (uint8_t *)&v51, 0x16u);
      }
    }
    v33 = objc_msgSend_recordErrors(self, v18, v19, v20);
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v15, (uint64_t)v10);
LABEL_14:

    goto LABEL_15;
  }
  if (v17)
  {
    if (self) {
      v40 = self->super.super._signpost;
    }
    else {
      v40 = 0;
    }
    v41 = v40;
    v33 = objc_msgSend_log(v41, v42, v43, v44);

    if (self) {
      v45 = self->super.super._signpost;
    }
    else {
      v45 = 0;
    }
    v46 = v45;
    os_signpost_id_t v50 = objc_msgSend_identifier(v46, v47, v48, v49);

    if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      int v51 = 138412290;
      id v52 = v10;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v33, OS_SIGNPOST_EVENT, v50, "CKFetchRecordVersionsOperation", "Record %@ fetched", (uint8_t *)&v51, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  v35 = objc_msgSend_fetchRecordVersionsProgressBlock(self, v18, v19, v20);

  if (v35)
  {
    objc_msgSend_fetchRecordVersionsProgressBlock(self, v36, v37, v38);
    v39 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, BOOL, id, void *))v39)[2](v39, v10, v8, v11, v15);
  }
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKFetchRecordVersionsOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  id v10 = objc_msgSend_fetchRecordVersionsProgressBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v11 = objc_msgSend_fetchRecordVersionsCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_fetchRecordVersionsProgressBlock(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
    id v10 = (void *)v6;
    id v11 = objc_msgSend_recordIDs(self, v7, v8, v9);
    uint64_t v15 = objc_msgSend_count(v11, v12, v13, v14);

    if (v15)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v19 = objc_msgSend_recordIDs(self, v16, v17, v18);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v33, (uint64_t)v37, 16);
      if (v21)
      {
        uint64_t v25 = v21;
        uint64_t v26 = *(void *)v34;
        while (2)
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v19);
            }
            uint64_t v28 = objc_msgSend_zoneID(*(void **)(*((void *)&v33 + 1) + 8 * v27), v22, v23, v24);
            int v30 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v29, (uint64_t)v28, (uint64_t)a3);

            if (!v30)
            {

              goto LABEL_13;
            }
            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v33, (uint64_t)v37, 16);
          if (v25) {
            continue;
          }
          break;
        }
      }

      v32.receiver = self;
      v32.super_class = (Class)CKFetchRecordVersionsOperation;
      LOBYTE(v6) = [(CKDatabaseOperation *)&v32 CKOperationShouldRun:a3];
    }
    else
    {
LABEL_13:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordVersionsOperation_withBlock_;
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
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordVersionsOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    uint64_t v22 = objc_msgSend_recordErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_recordErrors(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to fetch some record versions");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  long long v34 = objc_msgSend_fetchRecordVersionsCompletionBlock(self, v7, v8, v9);

  if (v34)
  {
    objc_msgSend_fetchRecordVersionsCompletionBlock(self, v35, v36, v37);
    uint64_t v38 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_CKClientSuitableError(v4, v39, v40, v41);
    ((void (**)(void, void *))v38)[2](v38, v42);

    objc_msgSend_setFetchRecordVersionsCompletionBlock_(self, v43, 0, v44);
  }
  objc_msgSend_setFetchRecordVersionsProgressBlock_(self, v35, 0, v37);
  v45.receiver = self;
  v45.super_class = (Class)CKFetchRecordVersionsOperation;
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
      uint64_t v5 = self->super.super._signpost;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = v5;
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      id v11 = self->super.super._signpost;
    }
    else {
      id v11 = 0;
    }
    uint64_t v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      objc_super v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      objc_super v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      __int16 v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordVersionsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordVersionsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v11, (uint64_t)v10, (uint64_t)sel_handleFetchForRecordID_isDeleted_versions_error_, 2, 0);

  uint64_t v12 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v13, (uint64_t)v12, (uint64_t)sel_handleFetchForRecordID_isDeleted_versions_error_, 3, 0);

  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___CKFetchRecordVersionsOperation;
  objc_msgSendSuper2(&v14, sel_applyDaemonCallbackInterfaceTweaks_, v5);
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (NSString)minimumVersionETag
{
  return self->_minimumVersionETag;
}

- (void)setMinimumVersionETag:(id)a3
{
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_minimumVersionETag, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_fetchRecordVersionsCompletionBlock, 0);

  objc_storeStrong(&self->_fetchRecordVersionsProgressBlock, 0);
}

@end