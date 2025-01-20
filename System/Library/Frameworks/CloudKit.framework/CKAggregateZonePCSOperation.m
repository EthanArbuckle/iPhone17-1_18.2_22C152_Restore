@interface CKAggregateZonePCSOperation
+ (SEL)daemonInvocationSelector;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKAggregateZonePCSOperation)init;
- (CKAggregateZonePCSOperation)initWithSourceZoneIDs:(id)a3 targetZone:(id)a4;
- (CKRecordZone)targetZone;
- (NSArray)sourceZoneIDs;
- (id)activityCreate;
- (id)aggregateZonePCSCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)setAggregateZonePCSCompletionBlock:(id)a3;
- (void)setSourceZoneIDs:(id)a3;
- (void)setTargetZone:(id)a3;
@end

@implementation CKAggregateZonePCSOperation

- (CKAggregateZonePCSOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKAggregateZonePCSOperation;
  return [(CKOperation *)&v3 init];
}

- (CKAggregateZonePCSOperation)initWithSourceZoneIDs:(id)a3 targetZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14 = (CKAggregateZonePCSOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    sourceZoneIDs = v14->_sourceZoneIDs;
    v14->_sourceZoneIDs = (NSArray *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    targetZone = v14->_targetZone;
    v14->_targetZone = (CKRecordZone *)v20;
  }
  return v14;
}

- (void)setAggregateZonePCSCompletionBlock:(id)a3
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
    v14[2] = sub_18B103EE0;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id aggregateZonePCSCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_aggregateZonePCSCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id aggregateZonePCSCompletionBlock = self->_aggregateZonePCSCompletionBlock;
    self->_id aggregateZonePCSCompletionBlock = v11;
LABEL_9:
  }
}

- (id)aggregateZonePCSCompletionBlock
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
    id v15 = sub_18AF13F88;
    v16 = sub_18AF13950;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1040D8;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_aggregateZonePCSCompletionBlock);
  }

  return v8;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performAggregateZonePCSOperation_withBlock_;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_sourceZoneIDs(self, v5, v6, v7);
  objc_msgSend_setSourceZoneIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_targetZone(self, v11, v12, v13);
  objc_msgSend_setTargetZone_(v4, v15, (uint64_t)v14, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKAggregateZonePCSOperation;
  [(CKDatabaseOperation *)&v17 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKAggregateZonePCSOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v17 fillFromOperationInfo:v4];
  v8 = objc_msgSend_sourceZoneIDs(v4, v5, v6, v7, v17.receiver, v17.super_class);
  objc_msgSend_setSourceZoneIDs_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_targetZone(v4, v11, v12, v13);

  objc_msgSend_setTargetZone_(self, v15, (uint64_t)v14, v16);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v9.receiver = self;
  v9.super_class = (Class)CKAggregateZonePCSOperation;
  if ([(CKOperation *)&v9 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_aggregateZonePCSCompletionBlock(self, v3, v4, v5);
  BOOL v6 = v7 != 0;

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_database(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_scope(v6, v7, v8, v9);

  if (v10 == 1)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v11, @"CKErrorDomain", 12, @"You can't execute this operation in the public database");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v14;
      return result;
    }
    return 0;
  }
  uint64_t v16 = objc_msgSend_sourceZoneIDs(self, v11, v12, v13);
  if (!objc_msgSend_count(v16, v17, v18, v19)) {
    goto LABEL_16;
  }
  v23 = objc_msgSend_targetZone(self, v20, v21, v22);

  if (v23)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v16 = objc_msgSend_sourceZoneIDs(self, v24, v25, v26);
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v27, (uint64_t)&v44, (uint64_t)v48, 16);
    if (v28)
    {
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)v45;
LABEL_8:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v16);
        }
        if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v29, *(void *)(*((void *)&v44 + 1) + 8 * v32), (uint64_t)a3))break; {
        if (v30 == ++v32)
        }
        {
          uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v29, (uint64_t)&v44, (uint64_t)v48, 16);
          if (v30) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
LABEL_16:

      return 0;
    }
LABEL_14:

    v36 = objc_msgSend_targetZone(self, v33, v34, v35);
    v40 = objc_msgSend_zoneID(v36, v37, v38, v39);
    int v42 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v41, (uint64_t)v40, (uint64_t)a3);

    if (v42)
    {
      v43.receiver = self;
      v43.super_class = (Class)CKAggregateZonePCSOperation;
      return [(CKDatabaseOperation *)&v43 CKOperationShouldRun:a3];
    }
  }
  return 0;
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
  BOOL v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super.super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    v11 = v10;
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKAggregateZonePCSOperation", "Finishing", buf, 2u);
    }
  }
  uint64_t v22 = objc_msgSend_targetZone(self, v7, v8, v9);

  if (v22)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA80];
    v27 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v28 = objc_msgSend_targetZone(self, v23, v24, v25);
    uint64_t v32 = objc_msgSend_zoneID(v28, v29, v30, v31);
    uint64_t v35 = objc_msgSend_arrayWithObjects_(v27, v33, (uint64_t)v32, v34, 0);
    uint64_t v38 = objc_msgSend_setWithArray_(v26, v36, (uint64_t)v35, v37);

    v41 = objc_msgSend_zoneIDsToZoneNamesString_(self, v39, (uint64_t)v38, v40);
    long long v45 = objc_msgSend_operationMetric(self, v42, v43, v44);
    objc_msgSend_setObject_forKeyedSubscript_(v45, v46, (uint64_t)v41, @"zoneNames");
  }
  long long v47 = objc_msgSend_aggregateZonePCSCompletionBlock(self, v23, v24, v25);

  if (v47)
  {
    objc_msgSend_aggregateZonePCSCompletionBlock(self, v48, v49, v50);
    v54 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v55 = 0;
    }
    else
    {
      v55 = objc_msgSend_targetZone(self, v51, v52, v53);
    }
    v56 = objc_msgSend_CKClientSuitableError(v4, v51, v52, v53);
    ((void (**)(void, void *, void *))v54)[2](v54, v55, v56);

    if (!v4) {
    objc_msgSend_setAggregateZonePCSCompletionBlock_(self, v57, 0, v58);
    }
  }
  v59.receiver = self;
  v59.super_class = (Class)CKAggregateZonePCSOperation;
  [(CKOperation *)&v59 _finishOnCallbackQueueWithError:v4];
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
    BOOL v6 = v5;
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
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      long long v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
      __int16 v56 = 2112;
      v57 = v24;
      __int16 v58 = 2112;
      objc_super v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKAggregateZonePCSOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  BOOL v6 = signpost;

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKAggregateZonePCSOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/aggregate-zone-pcs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetZone, 0);
  objc_storeStrong((id *)&self->_sourceZoneIDs, 0);

  objc_storeStrong(&self->_aggregateZonePCSCompletionBlock, 0);
}

@end