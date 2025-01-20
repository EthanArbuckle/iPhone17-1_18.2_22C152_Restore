@interface CKMarkAssetBrokenOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)bypassPCSEncryptionForTouchRepairZone;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)simulateCorruptAsset;
- (BOOL)touchRepairZone;
- (BOOL)writeRepairRecord;
- (CKMarkAssetBrokenOperation)initWithNoRecord;
- (CKMarkAssetBrokenOperation)initWithRecordID:(id)a3 field:(id)a4;
- (CKMarkAssetBrokenOperation)initWithRecordID:(id)a3 field:(id)a4 listIndex:(int64_t)a5;
- (CKRecordID)recordID;
- (CKRecordID)repairRecordID;
- (CKUploadRequestConfiguration)resolvedUploadRequestConfiguration;
- (CKUploadRequestConfiguration)uploadRequestConfiguration;
- (NSString)field;
- (id)activityCreate;
- (id)markAssetBrokenCompletionBlock;
- (int64_t)listIndex;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleMarkAssetBrokenCompletionWithRepairRecordID:(id)a3 error:(id)a4;
- (void)setBypassPCSEncryptionForTouchRepairZone:(BOOL)a3;
- (void)setField:(id)a3;
- (void)setListIndex:(int64_t)a3;
- (void)setMarkAssetBrokenCompletionBlock:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRepairRecordID:(id)a3;
- (void)setSimulateCorruptAsset:(BOOL)a3;
- (void)setTouchRepairZone:(BOOL)a3;
- (void)setUploadRequestConfiguration:(id)a3;
- (void)setWriteRepairRecord:(BOOL)a3;
@end

@implementation CKMarkAssetBrokenOperation

- (CKMarkAssetBrokenOperation)initWithNoRecord
{
  v2 = (CKMarkAssetBrokenOperation *)(id)objc_msgSend_initWithRecordID_field_(self, a2, 0, 0);
  objc_msgSend_setTouchRepairZone_(v2, v3, 1, v4);

  return v2;
}

- (CKMarkAssetBrokenOperation)initWithRecordID:(id)a3 field:(id)a4
{
  return (CKMarkAssetBrokenOperation *)MEMORY[0x1F4181798](self, sel_initWithRecordID_field_listIndex_, a3, a4);
}

- (CKMarkAssetBrokenOperation)initWithRecordID:(id)a3 field:(id)a4 listIndex:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKMarkAssetBrokenOperation;
  v15 = [(CKOperation *)&v20 init];
  if (v15)
  {
    if ((v10 == 0) != (v11 == 0))
    {
      v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v14);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)v15, @"CKMarkAssetBrokenOperation.m", 51, @"Expected both or none of recordID and field to be nil");
    }
    objc_storeStrong((id *)&v15->_recordID, a3);
    objc_storeStrong((id *)&v15->_field, a4);
    if (a5 < 0) {
      int64_t v16 = -1;
    }
    else {
      int64_t v16 = a5;
    }
    v15->_listIndex = v16;
    v15->_touchRepairZone = 1;
    v15->_bypassPCSEncryptionForTouchRepairZone = 0;
    v15->_simulateCorruptAsset = 1;
    v15->_writeRepairRecord = 1;
  }

  return v15;
}

- (CKUploadRequestConfiguration)resolvedUploadRequestConfiguration
{
  v5 = objc_msgSend_database(self, a2, v2, v3);
  v9 = objc_msgSend_container(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_uploadRequestConfiguration(self, v10, v11, v12);
  v15 = objc_msgSend_resolvedConfigurationWithBaseContainer_overrides_(CKUploadRequestConfiguration, v14, (uint64_t)v9, (uint64_t)v13);

  return (CKUploadRequestConfiguration *)v15;
}

- (void)setMarkAssetBrokenCompletionBlock:(id)a3
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
    v14[2] = sub_18B016100;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id markAssetBrokenCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_markAssetBrokenCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id markAssetBrokenCompletionBlock = self->_markAssetBrokenCompletionBlock;
    self->_id markAssetBrokenCompletionBlock = v11;
LABEL_9:
  }
}

- (id)markAssetBrokenCompletionBlock
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
    id v15 = sub_18AF13A98;
    int64_t v16 = sub_18AF13828;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0162F8;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    uint64_t v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = _Block_copy(self->_markAssetBrokenCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_recordID(self, v5, v6, v7);
  objc_msgSend_setRecordID_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_field(self, v11, v12, v13);
  objc_msgSend_setField_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_listIndex(self, v17, v18, v19);
  objc_msgSend_setListIndex_(v4, v21, v20, v22);
  uint64_t v26 = objc_msgSend_touchRepairZone(self, v23, v24, v25);
  objc_msgSend_setTouchRepairZone_(v4, v27, v26, v28);
  uint64_t v32 = objc_msgSend_simulateCorruptAsset(self, v29, v30, v31);
  objc_msgSend_setSimulateCorruptAsset_(v4, v33, v32, v34);
  uint64_t v38 = objc_msgSend_bypassPCSEncryptionForTouchRepairZone(self, v35, v36, v37);
  objc_msgSend_setBypassPCSEncryptionForTouchRepairZone_(v4, v39, v38, v40);
  uint64_t v44 = objc_msgSend_writeRepairRecord(self, v41, v42, v43);
  objc_msgSend_setWriteRepairRecord_(v4, v45, v44, v46);
  v50 = objc_msgSend_resolvedUploadRequestConfiguration(self, v47, v48, v49);
  objc_msgSend_setUploadRequestConfiguration_(v4, v51, (uint64_t)v50, v52);

  v53.receiver = self;
  v53.super_class = (Class)CKMarkAssetBrokenOperation;
  [(CKDatabaseOperation *)&v53 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v53.receiver = self;
  v53.super_class = (Class)CKMarkAssetBrokenOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v53 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_recordID(v4, v5, v6, v7, v53.receiver, v53.super_class);
  objc_msgSend_setRecordID_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_field(v4, v11, v12, v13);
  objc_msgSend_setField_(self, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_listIndex(v4, v17, v18, v19);
  objc_msgSend_setListIndex_(self, v21, v20, v22);
  uint64_t v26 = objc_msgSend_touchRepairZone(v4, v23, v24, v25);
  objc_msgSend_setTouchRepairZone_(self, v27, v26, v28);
  uint64_t v32 = objc_msgSend_simulateCorruptAsset(v4, v29, v30, v31);
  objc_msgSend_setSimulateCorruptAsset_(self, v33, v32, v34);
  uint64_t v38 = objc_msgSend_bypassPCSEncryptionForTouchRepairZone(v4, v35, v36, v37);
  objc_msgSend_setBypassPCSEncryptionForTouchRepairZone_(self, v39, v38, v40);
  uint64_t v44 = objc_msgSend_writeRepairRecord(v4, v41, v42, v43);
  objc_msgSend_setWriteRepairRecord_(self, v45, v44, v46);
  v50 = objc_msgSend_uploadRequestConfiguration(v4, v47, v48, v49);

  objc_msgSend_setUploadRequestConfiguration_(self, v51, (uint64_t)v50, v52);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v9.receiver = self;
  v9.super_class = (Class)CKMarkAssetBrokenOperation;
  if ([(CKOperation *)&v9 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_markAssetBrokenCompletionBlock(self, v3, v4, v5);
  BOOL v6 = v7 != 0;

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  BOOL v6 = objc_msgSend_database(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_scope(v6, v7, v8, v9);

  if (v10 == 2)
  {
    uint64_t v14 = objc_msgSend_recordID(self, v11, v12, v13);
    uint64_t v18 = objc_msgSend_zoneID(v14, v15, v16, v17);
    int v20 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v19, (uint64_t)v18, (uint64_t)a3);

    if (v20)
    {
      v23.receiver = self;
      v23.super_class = (Class)CKMarkAssetBrokenOperation;
      return [(CKDatabaseOperation *)&v23 CKOperationShouldRun:a3];
    }
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v11, @"CKInternalErrorDomain", 1019, @"This operation should only be called on the private database");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v22;
    return result;
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performMarkAssetBrokenOperation_withBlock_;
}

- (void)handleMarkAssetBrokenCompletionWithRepairRecordID:(id)a3 error:(id)a4
{
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKMarkAssetBrokenOperation", "Finishing", buf, 2u);
    }
  }
  id v22 = objc_msgSend_CKClientSuitableError(v4, v7, v8, v9);
  uint64_t v26 = objc_msgSend_markAssetBrokenCompletionBlock(self, v23, v24, v25);

  if (v26)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v30 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v70 = v30;
      v71 = (objc_class *)objc_opt_class();
      v72 = NSStringFromClass(v71);
      v76 = objc_msgSend_ckShortDescription(self, v73, v74, v75);
      *(_DWORD *)buf = 138544130;
      v79 = v72;
      __int16 v80 = 2048;
      v81 = self;
      __int16 v82 = 2114;
      v83 = v76;
      __int16 v84 = 2112;
      v85 = v22;
      _os_log_debug_impl(&dword_18AF10000, v70, OS_LOG_TYPE_DEBUG, "Calling markAssetBrokenCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    objc_msgSend_markAssetBrokenCompletionBlock(self, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_repairRecordID(self, v35, v36, v37);
    ((void (**)(void, void *, void *))v34)[2](v34, v38, v22);

    objc_msgSend_setMarkAssetBrokenCompletionBlock_(self, v39, 0, v40);
  }
  v41 = objc_msgSend_recordID(self, v27, v28, v29);
  v45 = objc_msgSend_zoneID(v41, v42, v43, v44);

  if (v45)
  {
    uint64_t v49 = (void *)MEMORY[0x1E4F1CA80];
    v50 = (void *)MEMORY[0x1E4F1C978];
    v51 = objc_msgSend_recordID(self, v46, v47, v48);
    v55 = objc_msgSend_zoneID(v51, v52, v53, v54);
    v58 = objc_msgSend_arrayWithObjects_(v50, v56, (uint64_t)v55, v57, 0);
    v61 = objc_msgSend_setWithArray_(v49, v59, (uint64_t)v58, v60);

    v64 = objc_msgSend_zoneIDsToZoneNamesString_(self, v62, (uint64_t)v61, v63);
    v68 = objc_msgSend_operationMetric(self, v65, v66, v67);
    objc_msgSend_setObject_forKeyedSubscript_(v68, v69, (uint64_t)v64, @"zoneNames");
  }
  v77.receiver = self;
  v77.super_class = (Class)CKMarkAssetBrokenOperation;
  [(CKOperation *)&v77 _finishOnCallbackQueueWithError:v4];
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
      v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKMarkAssetBrokenOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKMarkAssetBrokenOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/break-assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleMarkAssetBrokenCompletionWithRepairRecordID_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKMarkAssetBrokenOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (BOOL)touchRepairZone
{
  return self->_touchRepairZone;
}

- (void)setTouchRepairZone:(BOOL)a3
{
  self->_touchRepairZone = a3;
}

- (BOOL)bypassPCSEncryptionForTouchRepairZone
{
  return self->_bypassPCSEncryptionForTouchRepairZone;
}

- (void)setBypassPCSEncryptionForTouchRepairZone:(BOOL)a3
{
  self->_bypassPCSEncryptionForTouchRepairZone = a3;
}

- (BOOL)simulateCorruptAsset
{
  return self->_simulateCorruptAsset;
}

- (void)setSimulateCorruptAsset:(BOOL)a3
{
  self->_simulateCorruptAsset = a3;
}

- (BOOL)writeRepairRecord
{
  return self->_writeRepairRecord;
}

- (void)setWriteRepairRecord:(BOOL)a3
{
  self->_writeRepairRecord = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(int64_t)a3
{
  self->_listIndex = a3;
}

- (CKRecordID)repairRecordID
{
  return self->_repairRecordID;
}

- (void)setRepairRecordID:(id)a3
{
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_repairRecordID, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_recordID, 0);

  objc_storeStrong(&self->_markAssetBrokenCompletionBlock, 0);
}

@end