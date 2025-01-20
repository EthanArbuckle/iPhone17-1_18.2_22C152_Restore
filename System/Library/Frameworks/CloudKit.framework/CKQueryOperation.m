@interface CKQueryOperation
+ (SEL)daemonCallbackCompletionSelector;
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)fetchAllResults;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)shouldFetchAssetContent;
- (CKQuery)query;
- (CKQueryCursor)cursor;
- (CKQueryCursor)resultsCursor;
- (CKQueryOperation)init;
- (CKQueryOperation)initWithCursor:(CKQueryCursor *)cursor;
- (CKQueryOperation)initWithQuery:(CKQuery *)query;
- (CKRecordZoneID)zoneID;
- (NSArray)desiredKeys;
- (NSDictionary)assetTransferOptionsByKey;
- (NSMutableDictionary)recordErrors;
- (NSUInteger)resultsLimit;
- (id)activityCreate;
- (id)queryCompletionBlock_wrapper;
- (id)queryCursorFetchedBlock;
- (id)recordMatchedBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleOperationDidCompleteWithCursor:(id)a3 metrics:(id)a4 error:(id)a5;
- (void)handleQueryDidFetchCursor:(id)a3 reply:(id)a4;
- (void)handleQueryDidFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5;
- (void)queryCompletionBlock;
- (void)recordFetchedBlock;
- (void)recordMatchedBlock;
- (void)setAssetTransferOptionsByKey:(id)a3;
- (void)setCursor:(CKQueryCursor *)cursor;
- (void)setDesiredKeys:(NSArray *)desiredKeys;
- (void)setFetchAllResults:(BOOL)a3;
- (void)setQuery:(CKQuery *)query;
- (void)setQueryCompletionBlock:(void *)queryCompletionBlock;
- (void)setQueryCompletionBlockIVar:(id)a3;
- (void)setQueryCompletionBlock_wrapper:(id)a3;
- (void)setQueryCursorFetchedBlock:(id)a3;
- (void)setRecordErrors:(id)a3;
- (void)setRecordFetchedBlock:(void *)recordFetchedBlock;
- (void)setRecordMatchedBlock:(void *)recordMatchedBlock;
- (void)setRecordMatchedBlock_wrapper:(id)a3;
- (void)setResultsCursor:(id)a3;
- (void)setResultsLimit:(NSUInteger)resultsLimit;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setZoneID:(CKRecordZoneID *)zoneID;
@end

@implementation CKQueryOperation

- (CKQueryOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKQueryOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v3;

    v2->_shouldFetchAssetContent = 1;
    v2->_resultsLimit = 0;
  }
  return v2;
}

- (CKQueryOperation)initWithQuery:(CKQuery *)query
{
  v4 = query;
  v11 = (CKQueryOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_query;
    v11->_query = (CKQuery *)v12;
  }
  return v11;
}

- (CKQueryOperation)initWithCursor:(CKQueryCursor *)cursor
{
  v4 = cursor;
  v11 = (CKQueryOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_cursor;
    v11->_cursor = (CKQueryCursor *)v12;
  }
  return v11;
}

- (void)setRecordFetchedBlock:(void *)recordFetchedBlock
{
  id v7 = recordFetchedBlock;
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
    v14[2] = sub_18B0EC5A0;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordFetchedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordFetchedBlock;
    self->_recordFetchedBlock = v11;
LABEL_9:
  }
}

- (void)recordFetchedBlock
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
    id v15 = sub_18AF13EB8;
    v16 = sub_18AF13920;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0EC798;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordFetchedBlock);
  }

  return v8;
}

- (void)setRecordMatchedBlock:(void *)recordMatchedBlock
{
  id v7 = recordMatchedBlock;
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
    v14[2] = sub_18B0EC924;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordMatchedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordMatchedBlock;
    self->_recordMatchedBlock = v11;
LABEL_9:
  }
}

- (void)recordMatchedBlock
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
    id v15 = sub_18AF13EB8;
    v16 = sub_18AF13920;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0ECB1C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordMatchedBlock);
  }

  return v8;
}

- (void)setQueryCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B0ECCA8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id queryCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_queryCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id queryCompletionBlock = self->_queryCompletionBlock;
    self->_id queryCompletionBlock = v11;
LABEL_9:
  }
}

- (void)queryCompletionBlock
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
    id v15 = sub_18AF13EB8;
    v16 = sub_18AF13920;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0ECEA0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_queryCompletionBlock);
  }

  return v8;
}

- (void)setQueryCursorFetchedBlock:(id)a3
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
    v14[2] = sub_18B0ED02C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id queryCursorFetchedBlock = v15;
    goto LABEL_9;
  }
  if (self->_queryCursorFetchedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id queryCursorFetchedBlock = self->_queryCursorFetchedBlock;
    self->_id queryCursorFetchedBlock = v11;
LABEL_9:
  }
}

- (id)queryCursorFetchedBlock
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
    id v15 = sub_18AF13EB8;
    v16 = sub_18AF13920;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0ED224;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_queryCursorFetchedBlock);
  }

  return v8;
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
  v4 = signpost;

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
      v11 = self->super.super._signpost;
    }
    else {
      v11 = 0;
    }
    uint64_t v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      v20 = objc_msgSend_operationID(self, v17, v18, v19);
      v24 = objc_msgSend_containerID(self, v21, v22, v23);
      v28 = objc_msgSend_group(self, v25, v26, v27);
      v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKQueryOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      v13 = self->super.super._signpost;
    }
    else {
      v13 = 0;
    }
    uint64_t v14 = v13;
    os_signpost_id_t v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKQueryOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/query", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (BOOL)hasCKOperationCallbacksSet
{
  v21.receiver = self;
  v21.super_class = (Class)CKQueryOperation;
  if ([(CKOperation *)&v21 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_recordFetchedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_recordMatchedBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      os_signpost_id_t v18 = objc_msgSend_queryCursorFetchedBlock(self, v11, v12, v13);
      if (v18)
      {
        BOOL v6 = 1;
      }
      else
      {
        int v19 = objc_msgSend_queryCompletionBlock(self, v15, v16, v17);
        BOOL v6 = v19 != 0;
      }
    }
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  BOOL v6 = objc_msgSend_query(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_recordType(v6, v7, v8, v9);
  if (objc_msgSend_length(v10, v11, v12, v13))
  {
  }
  else
  {
    id v20 = objc_msgSend_cursor(self, v14, v15, v16);

    if (!v20)
    {
      if (a3)
      {
        uint64_t v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v37, @"CKErrorDomain", 12, @"either a query or query cursor must be provided for %@", v36);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_16;
    }
  }
  objc_super v21 = objc_msgSend_recordFetchedBlock(self, v17, v18, v19);
  if (v21
    || (objc_msgSend_recordMatchedBlock(self, v22, v23, v24), (objc_super v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_7;
  }
  uint64_t v38 = objc_msgSend_queryCompletionBlock(self, v25, v26, v27);

  if (v38)
  {
LABEL_7:
    uint64_t v31 = objc_msgSend_zoneID(self, v28, v29, v30);
    int v33 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v32, (uint64_t)v31, (uint64_t)a3);

    if (v33)
    {
      v41.receiver = self;
      v41.super_class = (Class)CKQueryOperation;
      LOBYTE(v34) = [(CKDatabaseOperation *)&v41 CKOperationShouldRun:a3];
      return v34;
    }
LABEL_16:
    LOBYTE(v34) = 0;
    return v34;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v39 = ck_log_facility_ck;
  BOOL v34 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO);
  if (v34)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AF10000, v39, OS_LOG_TYPE_INFO, "Warn: There's no point in running a query if there are no progress or completion blocks set. Bailing early.", buf, 2u);
    goto LABEL_16;
  }
  return v34;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performQueryOperation_withBlock_;
}

- (void)setQueryCompletionBlock:(void *)queryCompletionBlock
{
  BOOL v4 = queryCompletionBlock == 0;
  id v9 = queryCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setQueryCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)handleQueryDidFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v15 = signpost;

  if (v13)
  {
    if (!v15) {
      goto LABEL_22;
    }
    if (self) {
      uint64_t v18 = self->super.super._signpost;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = v18;
    uint64_t v23 = objc_msgSend_log(v19, v20, v21, v22);

    if (self) {
      uint64_t v24 = self->super.super._signpost;
    }
    else {
      uint64_t v24 = 0;
    }
    v25 = v24;
    uint64_t v29 = objc_msgSend_identifier(v25, v26, v27, v28);

    if ((unint64_t)(v29 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v23)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412546;
    id v101 = v8;
    __int16 v102 = 2112;
    v103 = v13;
    uint64_t v30 = "Record %@ fetched with error: %@";
    uint64_t v31 = v23;
    os_signpost_id_t v32 = v29;
    uint32_t v33 = 22;
    goto LABEL_20;
  }
  if (!v15) {
    goto LABEL_22;
  }
  if (self) {
    BOOL v34 = self->super.super._signpost;
  }
  else {
    BOOL v34 = 0;
  }
  uint64_t v35 = v34;
  uint64_t v23 = objc_msgSend_log(v35, v36, v37, v38);

  if (self) {
    uint64_t v39 = self->super.super._signpost;
  }
  else {
    uint64_t v39 = 0;
  }
  v40 = v39;
  uint64_t v44 = objc_msgSend_identifier(v40, v41, v42, v43);

  if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_DWORD *)buf = 138412290;
    id v101 = v8;
    uint64_t v30 = "Record %@ fetched";
    uint64_t v31 = v23;
    os_signpost_id_t v32 = v44;
    uint32_t v33 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v31, OS_SIGNPOST_EVENT, v32, "CKQueryOperation", v30, buf, v33);
  }
LABEL_21:

LABEL_22:
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = sub_18B0EDE90;
  v99[3] = &unk_1E5464380;
  v99[4] = self;
  objc_msgSend_countMergeableValueMetrics_(v9, v16, (uint64_t)v99, v17);
  uint64_t v48 = objc_msgSend_recordMatchedBlock_wrapper(self, v45, v46, v47);
  uint64_t v52 = v48;
  if (v48)
  {
    v53 = (void (**)(void *, id, id, void *))_Block_copy(v48);
  }
  else
  {
    int v54 = objc_msgSend_recordMatchedBlock(self, v49, v50, v51);
    v53 = (void (**)(void *, id, id, void *))_Block_copy(v54);
  }
  if (v53)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    __int16 v58 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v73 = v58;
      v77 = objc_msgSend_operationID(self, v74, v75, v76);
      v81 = objc_msgSend_recordID(v9, v78, v79, v80);
      v85 = objc_msgSend_recordChangeTag(v9, v82, v83, v84);
      *(_DWORD *)buf = 138544130;
      id v101 = v77;
      __int16 v102 = 2112;
      v103 = v81;
      __int16 v104 = 2112;
      v105 = v85;
      __int16 v106 = 2112;
      v107 = v13;
      _os_log_debug_impl(&dword_18AF10000, v73, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about matched record with ID %@ etag=%@: %@", buf, 0x2Au);
    }
    v53[2](v53, v8, v9, v13);
  }
  else
  {
    __int16 v62 = objc_msgSend_recordFetchedBlock(self, v55, v56, v57);

    if (v9 && v62)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v63 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v86 = v63;
        v90 = objc_msgSend_operationID(self, v87, v88, v89);
        v94 = objc_msgSend_recordID(v9, v91, v92, v93);
        v98 = objc_msgSend_recordChangeTag(v9, v95, v96, v97);
        *(_DWORD *)buf = 138544130;
        id v101 = v90;
        __int16 v102 = 2112;
        v103 = v94;
        __int16 v104 = 2112;
        v105 = v98;
        __int16 v106 = 2112;
        v107 = v13;
        _os_log_debug_impl(&dword_18AF10000, v86, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about matched record with ID %@ etag=%@: %@", buf, 0x2Au);
      }
      objc_msgSend_recordFetchedBlock(self, v64, v65, v66);
      v67 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v67)[2](v67, v9);
    }
  }
  if (v8 && v13 && (objc_msgSend_canDropItemResultsEarly(self, v59, v60, v61) & 1) == 0)
  {
    v71 = objc_msgSend_recordErrors(self, v68, v69, v70);
    objc_msgSend_setObject_forKeyedSubscript_(v71, v72, (uint64_t)v13, (uint64_t)v8);
  }
}

- (void)handleQueryDidFetchCursor:(id)a3 reply:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v9 = signpost;

  if (v9)
  {
    if (self) {
      uint64_t v13 = self->super.super._signpost;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    uint64_t v18 = objc_msgSend_log(v14, v15, v16, v17);

    if (self) {
      uint64_t v19 = self->super.super._signpost;
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;
    os_signpost_id_t v24 = objc_msgSend_identifier(v20, v21, v22, v23);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      int v36 = 138412290;
      id v37 = v6;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v18, OS_SIGNPOST_EVENT, v24, "CKQueryOperation", "Cursor %@ fetched", (uint8_t *)&v36, 0xCu);
    }
  }
  v25 = objc_msgSend_queryCursorFetchedBlock(self, v10, v11, v12);

  if (v25)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v26 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = v26;
      uint64_t v35 = objc_msgSend_operationID(self, v32, v33, v34);
      int v36 = 138543618;
      id v37 = v35;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_debug_impl(&dword_18AF10000, v31, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a query cursor %@", (uint8_t *)&v36, 0x16u);
    }
    objc_msgSend_queryCursorFetchedBlock(self, v27, v28, v29);
    uint64_t v30 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v30)[2](v30, v6);
  }
  v7[2](v7, 0);
}

- (void)handleOperationDidCompleteWithCursor:(id)a3 metrics:(id)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ((objc_msgSend_isCancelled(self, v11, v12, v13) & 1) == 0) {
    objc_msgSend_setResultsCursor_(self, v14, (uint64_t)v8, v15);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v16 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = v16;
    uint64_t v21 = objc_msgSend_operationID(self, v18, v19, v20);
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v24 = v21;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_debug_impl(&dword_18AF10000, v17, OS_LOG_TYPE_DEBUG, "Received completion callback for operation %{public}@ with cursor %@", buf, 0x16u);
  }
  v22.receiver = self;
  v22.super_class = (Class)CKQueryOperation;
  [(CKOperation *)&v22 handleOperationDidCompleteWithMetrics:v10 error:v9];
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
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
    uint64_t v11 = v10;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKQueryOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    objc_super v22 = objc_msgSend_recordErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_recordErrors(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to fetch some query results");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_msgSend_CKClientSuitableError(v4, v7, v8, v9);
  uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __int16 v38 = objc_msgSend_queryCompletionBlock_wrapper(self, v35, v36, v37);
  uint64_t v42 = v38;
  if (v38)
  {
    uint64_t v43 = (void (**)(void *, void *, void *))_Block_copy(v38);
  }
  else
  {
    uint64_t v44 = objc_msgSend_queryCompletionBlock(self, v39, v40, v41);
    uint64_t v43 = (void (**)(void *, void *, void *))_Block_copy(v44);
  }
  if (v43)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v45 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v103 = v45;
      v107 = objc_msgSend_operationID(self, v104, v105, v106);
      uint64_t v111 = objc_msgSend_resultsCursor(self, v108, v109, v110);
      v112 = (void *)v111;
      v113 = @" Error was: ";
      *(_DWORD *)buf = 138544130;
      v114 = &stru_1ED7F5C98;
      v124 = v107;
      __int16 v125 = 2112;
      if (!v34) {
        v113 = &stru_1ED7F5C98;
      }
      uint64_t v126 = v111;
      if (v34) {
        v114 = v34;
      }
      __int16 v127 = 2114;
      v128 = v113;
      __int16 v129 = 2112;
      v130 = v114;
      _os_log_debug_impl(&dword_18AF10000, v103, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. Query cursor is %@.%{public}@%@", buf, 0x2Au);
    }
    uint64_t v49 = objc_msgSend_resultsCursor(self, v46, v47, v48);
    v43[2](v43, v49, v34);

    objc_msgSend_setQueryCompletionBlock_(self, v50, 0, v51);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    int v54 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v115 = v54;
      v119 = objc_msgSend_operationID(self, v116, v117, v118);
      v120 = @" Error was: ";
      v121 = &stru_1ED7F5C98;
      *(_DWORD *)buf = 138543874;
      v124 = v119;
      if (v34) {
        v121 = v34;
      }
      else {
        v120 = &stru_1ED7F5C98;
      }
      __int16 v125 = 2114;
      uint64_t v126 = (uint64_t)v120;
      __int16 v127 = 2112;
      v128 = v121;
      _os_log_debug_impl(&dword_18AF10000, v115, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no queryCompletionBlock was set.%{public}@%@", buf, 0x20u);
    }
  }
  objc_msgSend_setRecordFetchedBlock_(self, v52, 0, v53);
  objc_msgSend_setRecordMatchedBlock_(self, v55, 0, v56);
  objc_msgSend_setQueryCursorFetchedBlock_(self, v57, 0, v58);
  if (self)
  {
    unint64_t mergeableValueCount = self->_mergeableValueCount;
    if (mergeableValueCount)
    {
      v63 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v59, mergeableValueCount, v61);
      v67 = objc_msgSend_operationMetric(self, v64, v65, v66);
      objc_msgSend_setObject_forKeyedSubscript_(v67, v68, (uint64_t)v63, @"mergeable_valueCount");
    }
    unint64_t mergeableDeltaCount = self->_mergeableDeltaCount;
    if (mergeableDeltaCount)
    {
      uint64_t v70 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v59, mergeableDeltaCount, v61);
      v74 = objc_msgSend_operationMetric(self, v71, v72, v73);
      objc_msgSend_setObject_forKeyedSubscript_(v74, v75, (uint64_t)v70, @"mergeable_fetchedDeltaCount");
    }
    unint64_t assetBackedMergeableDeltaCount = self->_assetBackedMergeableDeltaCount;
    if (assetBackedMergeableDeltaCount)
    {
      uint64_t v76 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v59, assetBackedMergeableDeltaCount, v61);
      uint64_t v80 = objc_msgSend_operationMetric(self, v77, v78, v79);
      objc_msgSend_setObject_forKeyedSubscript_(v80, v81, (uint64_t)v76, @"mergeable_assetCount");
    }
  }
  v82 = objc_msgSend_zoneID(self, v59, assetBackedMergeableDeltaCount, v61);

  if (v82)
  {
    v86 = (void *)MEMORY[0x1E4F1CA80];
    v87 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v88 = objc_msgSend_zoneID(self, v83, v84, v85);
    v91 = objc_msgSend_arrayWithObjects_(v87, v89, (uint64_t)v88, v90, 0);
    v94 = objc_msgSend_setWithArray_(v86, v92, (uint64_t)v91, v93);

    uint64_t v97 = objc_msgSend_zoneIDsToZoneNamesString_(self, v95, (uint64_t)v94, v96);
    id v101 = objc_msgSend_operationMetric(self, v98, v99, v100);
    objc_msgSend_setObject_forKeyedSubscript_(v101, v102, (uint64_t)v97, @"zoneNames");
  }
  v122.receiver = self;
  v122.super_class = (Class)CKQueryOperation;
  [(CKOperation *)&v122 _finishOnCallbackQueueWithError:v4];
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v8 = objc_msgSend_query(self, v5, v6, v7);
  id v9 = v8;
  if (v4) {
    objc_storeStrong(v4 + 19, v8);
  }

  uint64_t v13 = objc_msgSend_zoneID(self, v10, v11, v12);
  id v14 = v13;
  if (v4) {
    objc_storeStrong(v4 + 20, v13);
  }

  uint64_t v18 = objc_msgSend_cursor(self, v15, v16, v17);
  id v19 = v18;
  if (v4) {
    objc_storeStrong(v4 + 21, v18);
  }

  uint64_t v23 = objc_msgSend_resultsLimit(self, v20, v21, v22);
  if (v4) {
    v4[22] = (id)v23;
  }
  uint64_t v27 = objc_msgSend_desiredKeys(self, v24, v25, v26);
  id v28 = v27;
  if (v4) {
    objc_storeStrong(v4 + 23, v27);
  }

  os_signpost_id_t v32 = objc_msgSend_assetTransferOptionsByKey(self, v29, v30, v31);
  id v33 = v32;
  if (v4) {
    objc_storeStrong(v4 + 24, v32);
  }

  char AssetContent = objc_msgSend_shouldFetchAssetContent(self, v34, v35, v36);
  if (v4)
  {
    *((unsigned char *)v4 + 144) = AssetContent;
    *((unsigned char *)v4 + 145) = objc_msgSend_fetchAllResults(self, v38, v39, v40);
  }
  else
  {
    objc_msgSend_fetchAllResults(self, v38, v39, v40);
  }
  v41.receiver = self;
  v41.super_class = (Class)CKQueryOperation;
  [(CKDatabaseOperation *)&v41 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v53.receiver = self;
  v53.super_class = (Class)CKQueryOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v53 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_query(v4, v5, v6, v7, v53.receiver, v53.super_class);
  objc_msgSend_setQuery_(self, v9, (uint64_t)v8, v10);

  id v14 = objc_msgSend_zoneID(v4, v11, v12, v13);
  objc_msgSend_setZoneID_(self, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_cursor(v4, v17, v18, v19);
  objc_msgSend_setCursor_(self, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_resultsLimit(v4, v23, v24, v25);
  objc_msgSend_setResultsLimit_(self, v27, v26, v28);
  os_signpost_id_t v32 = objc_msgSend_desiredKeys(v4, v29, v30, v31);
  objc_msgSend_setDesiredKeys_(self, v33, (uint64_t)v32, v34);

  __int16 v38 = objc_msgSend_assetTransferOptionsByKey(v4, v35, v36, v37);
  objc_msgSend_setAssetTransferOptionsByKey_(self, v39, (uint64_t)v38, v40);

  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(v4, v41, v42, v43);
  objc_msgSend_setShouldFetchAssetContent_(self, v45, AssetContent, v46);
  uint64_t AllResults = objc_msgSend_fetchAllResults(v4, v47, v48, v49);

  objc_msgSend_setFetchAllResults_(self, v51, AllResults, v52);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleOperationDidCompleteWithCursor_metrics_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKQueryOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

+ (SEL)daemonCallbackCompletionSelector
{
  return sel_handleOperationDidCompleteWithCursor_metrics_error_;
}

- (CKQuery)query
{
  return self->_query;
}

- (void)setQuery:(CKQuery *)query
{
}

- (CKQueryCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(CKQueryCursor *)cursor
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(CKRecordZoneID *)zoneID
{
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
}

- (id)recordMatchedBlock_wrapper
{
  return self->_recordMatchedBlock_wrapper;
}

- (void)setRecordMatchedBlock_wrapper:(id)a3
{
}

- (id)queryCompletionBlock_wrapper
{
  return self->_queryCompletionBlock_wrapper;
}

- (void)setQueryCompletionBlock_wrapper:(id)a3
{
}

- (CKQueryCursor)resultsCursor
{
  return self->_resultsCursor;
}

- (void)setResultsCursor:(id)a3
{
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContent = a3;
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
}

- (BOOL)fetchAllResults
{
  return self->_fetchAllResults;
}

- (void)setFetchAllResults:(BOOL)a3
{
  self->_fetchuint64_t AllResults = a3;
}

- (NSDictionary)assetTransferOptionsByKey
{
  return self->_assetTransferOptionsByKey;
}

- (void)setAssetTransferOptionsByKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByKey, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_resultsCursor, 0);
  objc_storeStrong(&self->_queryCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_recordMatchedBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong(&self->_queryCursorFetchedBlock, 0);
  objc_storeStrong(&self->_queryCompletionBlock, 0);
  objc_storeStrong(&self->_recordMatchedBlock, 0);

  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end