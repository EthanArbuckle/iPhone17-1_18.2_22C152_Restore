@interface CKFetchRecordZonesOperation
+ (CKFetchRecordZonesOperation)fetchAllRecordZonesOperation;
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)ignorePCSFailures;
- (BOOL)isFetchAllRecordZonesOperation;
- (CKFetchRecordZonesOperation)init;
- (CKFetchRecordZonesOperation)initWithRecordZoneIDs:(NSArray *)zoneIDs;
- (NSArray)recordZoneIDs;
- (NSMutableDictionary)recordZoneErrors;
- (NSMutableDictionary)recordZonesByZoneID;
- (id)activityCreate;
- (id)fetchRecordZonesCompletionBlock_wrapper;
- (id)perRecordZoneCompletionBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchRecordZonesCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleFetchForRecordZoneID:(id)a3 recordZone:(id)a4 error:(id)a5;
- (void)perRecordZoneCompletionBlock;
- (void)performCKOperation;
- (void)setFetchRecordZonesCompletionBlock:(void *)fetchRecordZonesCompletionBlock;
- (void)setFetchRecordZonesCompletionBlockIVar:(id)a3;
- (void)setFetchRecordZonesCompletionBlock_wrapper:(id)a3;
- (void)setIgnorePCSFailures:(BOOL)a3;
- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3;
- (void)setPerRecordZoneCompletionBlock:(void *)perRecordZoneCompletionBlock;
- (void)setPerRecordZoneCompletionBlock_wrapper:(id)a3;
- (void)setRecordZoneErrors:(id)a3;
- (void)setRecordZoneIDs:(NSArray *)recordZoneIDs;
- (void)setRecordZonesByZoneID:(id)a3;
@end

@implementation CKFetchRecordZonesOperation

- (CKFetchRecordZonesOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKFetchRecordZonesOperation;
  v2 = [(CKOperation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordZonesByZoneID = v2->_recordZonesByZoneID;
    v2->_recordZonesByZoneID = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    recordZoneErrors = v2->_recordZoneErrors;
    v2->_recordZoneErrors = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (CKFetchRecordZonesOperation)fetchAllRecordZonesOperation
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_setIsFetchAllRecordZonesOperation_(v2, v3, 1, v4);

  return (CKFetchRecordZonesOperation *)v2;
}

- (CKFetchRecordZonesOperation)initWithRecordZoneIDs:(NSArray *)zoneIDs
{
  uint64_t v4 = zoneIDs;
  id v29 = 0;
  char v5 = _CKCheckArgument((uint64_t)"zoneIDs", v4, 0, 0, 0, &v29);
  id v6 = v29;
  if ((v5 & 1) == 0)
  {
    v17 = v6;
    v18 = [CKException alloc];
    uint64_t v22 = objc_msgSend_code(v17, v19, v20, v21);
    v26 = objc_msgSend_localizedDescription(v17, v23, v24, v25);
    id v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, @"%@", v26);

    objc_exception_throw(v28);
  }

  v13 = (CKFetchRecordZonesOperation *)objc_msgSend_init(self, v7, v8, v9);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v4, v10, v11, v12);
    recordZoneIDs = v13->_recordZoneIDs;
    v13->_recordZoneIDs = (NSArray *)v14;
  }
  return v13;
}

- (void)setPerRecordZoneCompletionBlock:(void *)perRecordZoneCompletionBlock
{
  id v7 = perRecordZoneCompletionBlock;
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
    v14[2] = sub_18B067794;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perRecordZoneCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perRecordZoneCompletionBlock;
    self->_perRecordZoneCompletionBlock = v11;
LABEL_9:
  }
}

- (void)perRecordZoneCompletionBlock
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
    id v15 = sub_18AF13BD4;
    v16 = sub_18AF13880;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B06798C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    uint64_t v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = _Block_copy(self->_perRecordZoneCompletionBlock);
  }

  return v8;
}

- (void)setFetchRecordZonesCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B067B18;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchRecordZonesCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchRecordZonesCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchRecordZonesCompletionBlock = self->_fetchRecordZonesCompletionBlock;
    self->_id fetchRecordZonesCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchRecordZonesCompletionBlock
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
    id v15 = sub_18AF13BD4;
    v16 = sub_18AF13880;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B067D10;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    uint64_t v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = _Block_copy(self->_fetchRecordZonesCompletionBlock);
  }

  return v8;
}

- (void)setFetchRecordZonesCompletionBlock:(void *)fetchRecordZonesCompletionBlock
{
  BOOL v4 = fetchRecordZonesCompletionBlock == 0;
  id v9 = fetchRecordZonesCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchRecordZonesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_recordZoneIDs(self, v5, v6, v7);
  objc_msgSend_setRecordZoneIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t AllRecordZonesOperation = objc_msgSend_isFetchAllRecordZonesOperation(self, v11, v12, v13);
  objc_msgSend_setIsFetchAllRecordZonesOperation_(v4, v15, AllRecordZonesOperation, v16);
  uint64_t v20 = objc_msgSend_ignorePCSFailures(self, v17, v18, v19);
  objc_msgSend_setIgnorePCSFailures_(v4, v21, v20, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKFetchRecordZonesOperation;
  [(CKDatabaseOperation *)&v23 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKFetchRecordZonesOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v23 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_recordZoneIDs(v4, v5, v6, v7, v23.receiver, v23.super_class);
  objc_msgSend_setRecordZoneIDs_(self, v9, (uint64_t)v8, v10);

  uint64_t AllRecordZonesOperation = objc_msgSend_isFetchAllRecordZonesOperation(v4, v11, v12, v13);
  objc_msgSend_setIsFetchAllRecordZonesOperation_(self, v15, AllRecordZonesOperation, v16);
  uint64_t v20 = objc_msgSend_ignorePCSFailures(v4, v17, v18, v19);

  objc_msgSend_setIgnorePCSFailures_(self, v21, v20, v22);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKFetchRecordZonesOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perRecordZoneCompletionBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_fetchRecordZonesCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_recordZoneIDs(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
  }
  else if ((objc_msgSend_isFetchAllRecordZonesOperation(self, v7, v8, v9) & 1) == 0)
  {
    if (a3)
    {
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v43, @"CKErrorDomain", 12, @"property recordZoneIDs must not be nil for %@", v42);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  objc_super v13 = objc_msgSend_recordZoneIDs(self, v10, v11, v12);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v46, (uint64_t)v50, 16);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v47;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v37 = (objc_class *)objc_opt_class();
            v38 = NSStringFromClass(v37);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, @"CKErrorDomain", 12, @"Unexpected zoneID passed to %@: %@", v38, v19);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_19:

          return 0;
        }
        if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v20, v19, (uint64_t)a3)) {
          goto LABEL_19;
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v21, (uint64_t)&v46, (uint64_t)v50, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }

  if ((objc_msgSend_isFetchAllRecordZonesOperation(self, v22, v23, v24) & 1) == 0)
  {
    id v28 = objc_msgSend_recordZoneIDs(self, v25, v26, v27);
    uint64_t v32 = objc_msgSend_count(v28, v29, v30, v31);

    if (!v32) {
      return 0;
    }
  }
  v33 = objc_msgSend_fetchRecordZonesCompletionBlock(self, v25, v26, v27);
  if (!v33)
  {
    v44 = objc_msgSend_perRecordZoneCompletionBlock(self, v34, v35, v36);

    if (v44) {
      goto LABEL_24;
    }
    return 0;
  }

LABEL_24:
  v45.receiver = self;
  v45.super_class = (Class)CKFetchRecordZonesOperation;
  return [(CKDatabaseOperation *)&v45 CKOperationShouldRun:a3];
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordZonesOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    uint64_t v8 = objc_msgSend_operationID(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_recordZoneIDs(self, v9, v10, v11);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "Fetching record zones with operation %{public}@ zoneIDs=%@", buf, 0x16u);
  }
  v13.receiver = self;
  v13.super_class = (Class)CKFetchRecordZonesOperation;
  [(CKOperation *)&v13 performCKOperation];
}

- (void)handleFetchForRecordZoneID:(id)a3 recordZone:(id)a4 error:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_super v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v15 = signpost;

  if (!v13)
  {
    if (!v15)
    {
      char canDropItemResultsEarly = objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18);
      if (!v8 || (canDropItemResultsEarly & 1) != 0) {
        goto LABEL_32;
      }
LABEL_30:
      v54 = objc_msgSend_recordZonesByZoneID(self, v50, v51, v52, *(void *)v73, *(_OWORD *)&v73[8]);
      objc_msgSend_setObject_forKeyedSubscript_(v54, v57, (uint64_t)v9, (uint64_t)v8);
      goto LABEL_31;
    }
    if (self) {
      uint64_t v35 = self->super.super._signpost;
    }
    else {
      uint64_t v35 = 0;
    }
    uint64_t v36 = v35;
    uint64_t v24 = objc_msgSend_log(v36, v37, v38, v39);

    if (self) {
      v40 = self->super.super._signpost;
    }
    else {
      v40 = 0;
    }
    v41 = v40;
    uint64_t v45 = objc_msgSend_identifier(v41, v42, v43, v44);

    if ((unint64_t)(v45 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_21;
    }
    *(_DWORD *)v73 = 138412290;
    *(void *)&v73[4] = v8;
    uint64_t v31 = "Record zone %@ fetched";
    uint64_t v32 = v24;
    os_signpost_id_t v33 = v45;
    uint32_t v34 = 12;
    goto LABEL_20;
  }
  if (!v15)
  {
    char v53 = objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18);
    if (!v8 || (v53 & 1) != 0) {
      goto LABEL_32;
    }
    goto LABEL_27;
  }
  if (self) {
    uint64_t v19 = self->super.super._signpost;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = v19;
  uint64_t v24 = objc_msgSend_log(v20, v21, v22, v23);

  if (self) {
    uint64_t v25 = self->super.super._signpost;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = v25;
  uint64_t v30 = objc_msgSend_identifier(v26, v27, v28, v29);

  if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)v73 = 138412546;
    *(void *)&v73[4] = v8;
    *(_WORD *)&v73[12] = 2112;
    *(void *)&v73[14] = v13;
    uint64_t v31 = "Record zone %@ fetched with error: %@";
    uint64_t v32 = v24;
    os_signpost_id_t v33 = v30;
    uint32_t v34 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v32, OS_SIGNPOST_EVENT, v33, "CKFetchRecordZonesOperation", v31, v73, v34);
  }
LABEL_21:

  char v49 = objc_msgSend_canDropItemResultsEarly(self, v46, v47, v48);
  if (!v8 || (v49 & 1) != 0) {
    goto LABEL_32;
  }
  if (!v13) {
    goto LABEL_30;
  }
LABEL_27:
  v54 = objc_msgSend_recordZoneErrors(self, v50, v51, v52, *(_OWORD *)v73, *(void *)&v73[16]);
  objc_msgSend_setObject_forKeyedSubscript_(v54, v55, (uint64_t)v13, (uint64_t)v8);
LABEL_31:

LABEL_32:
  v58 = objc_msgSend_perRecordZoneCompletionBlock_wrapper(self, v50, v51, v52, *(void *)v73, *(void *)&v73[8]);
  v62 = v58;
  if (v58)
  {
    v63 = (void (**)(void *, id, void *, void *))_Block_copy(v58);
  }
  else
  {
    v64 = objc_msgSend_perRecordZoneCompletionBlock(self, v59, v60, v61);
    v63 = (void (**)(void *, id, void *, void *))_Block_copy(v64);
  }
  if (v63)
  {
    id v65 = v9;
    v66 = v65;
    if (v13)
    {

      v66 = 0;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v67 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v68 = v67;
      v72 = objc_msgSend_operationID(self, v69, v70, v71);
      *(_DWORD *)v73 = 138543874;
      *(void *)&v73[4] = v72;
      *(_WORD *)&v73[12] = 2112;
      *(void *)&v73[14] = v8;
      *(_WORD *)&v73[22] = 2112;
      v74 = v13;
      _os_log_debug_impl(&dword_18AF10000, v68, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched zone with ID %@: %@", v73, 0x20u);
    }
    v63[2](v63, v8, v66, v13);
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
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      __int16 v16 = self->super.super._signpost;
    }
    else {
      __int16 v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordZonesOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    uint64_t v22 = objc_msgSend_recordZoneErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_recordZoneErrors(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to fetch some record zones");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint32_t v34 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v35 = objc_msgSend_recordZoneIDs(self, v7, v8, v9);
  uint64_t v38 = objc_msgSend_setWithArray_(v34, v36, (uint64_t)v35, v37);

  if (objc_msgSend_count(v38, v39, v40, v41))
  {
    uint64_t v45 = objc_msgSend_zoneIDsToZoneNamesString_(self, v42, (uint64_t)v38, v44);
    char v49 = objc_msgSend_operationMetric(self, v46, v47, v48);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v45, @"zoneNames");
  }
  uint64_t v51 = objc_msgSend_fetchRecordZonesCompletionBlock_wrapper(self, v42, v43, v44);
  v55 = v51;
  if (v51)
  {
    v56 = (void (**)(void *, void *, void *))_Block_copy(v51);
  }
  else
  {
    v57 = objc_msgSend_fetchRecordZonesCompletionBlock(self, v52, v53, v54);
    v56 = (void (**)(void *, void *, void *))_Block_copy(v57);
  }
  if (v56)
  {
    uint64_t v61 = objc_msgSend_recordZonesByZoneID(self, v58, v59, v60);
    id v65 = objc_msgSend_CKClientSuitableError(v4, v62, v63, v64);
    v56[2](v56, v61, v65);

    objc_msgSend_setFetchRecordZonesCompletionBlock_(self, v66, 0, v67);
  }
  objc_msgSend_setPerRecordZoneCompletionBlock_(self, v58, 0, v60);
  v68.receiver = self;
  v68.super_class = (Class)CKFetchRecordZonesOperation;
  [(CKOperation *)&v68 _finishOnCallbackQueueWithError:v4];
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
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
      __int16 v56 = 2112;
      v57 = v24;
      __int16 v58 = 2112;
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      id v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordZonesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordZonesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-record-zones", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleFetchForRecordZoneID_recordZone_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchRecordZonesOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(NSArray *)recordZoneIDs
{
}

- (id)perRecordZoneCompletionBlock_wrapper
{
  return self->_perRecordZoneCompletionBlock_wrapper;
}

- (void)setPerRecordZoneCompletionBlock_wrapper:(id)a3
{
}

- (id)fetchRecordZonesCompletionBlock_wrapper
{
  return self->_fetchRecordZonesCompletionBlock_wrapper;
}

- (void)setFetchRecordZonesCompletionBlock_wrapper:(id)a3
{
}

- (NSMutableDictionary)recordZonesByZoneID
{
  return self->_recordZonesByZoneID;
}

- (void)setRecordZonesByZoneID:(id)a3
{
}

- (NSMutableDictionary)recordZoneErrors
{
  return self->_recordZoneErrors;
}

- (void)setRecordZoneErrors:(id)a3
{
}

- (BOOL)isFetchAllRecordZonesOperation
{
  return self->_isFetchAllRecordZonesOperation;
}

- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3
{
  self->_isFetchuint64_t AllRecordZonesOperation = a3;
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
  objc_storeStrong((id *)&self->_recordZoneErrors, 0);
  objc_storeStrong((id *)&self->_recordZonesByZoneID, 0);
  objc_storeStrong(&self->_fetchRecordZonesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordZoneCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong(&self->_fetchRecordZonesCompletionBlock, 0);

  objc_storeStrong(&self->_perRecordZoneCompletionBlock, 0);
}

@end