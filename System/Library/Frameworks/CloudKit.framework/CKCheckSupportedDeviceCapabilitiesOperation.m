@interface CKCheckSupportedDeviceCapabilitiesOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKCheckSupportedDeviceCapabilitiesOperation)init;
- (CKCheckSupportedDeviceCapabilitiesOperation)initWithDesiredCapabilities:(id)a3 zoneIDs:(id)a4 options:(id)a5;
- (CKCheckSupportedDeviceCapabilitiesOperation)initWithDesiredCapabilitySets:(id)a3 zoneIDs:(id)a4 options:(id)a5;
- (CKDeviceCapabilityCheckOptions)options;
- (NSArray)desiredCapabilitySets;
- (NSArray)zoneIDs;
- (id)activityCreate;
- (id)checkSupportedDeviceCapabilitiesCompletionBlock;
- (id)checkSupportedDeviceCapabilitiesCompletionBlock_wrapper;
- (id)perResultBlock;
- (id)perResultBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleSupportedDeviceCapabilityCheckResultForRecordZoneID:(id)a3 capabilitySet:(id)a4 result:(id)a5 error:(id)a6;
- (void)performCKOperation;
- (void)setCheckSupportedDeviceCapabilitiesCompletionBlock:(id)a3;
- (void)setCheckSupportedDeviceCapabilitiesCompletionBlockIVar:(id)a3;
- (void)setCheckSupportedDeviceCapabilitiesCompletionBlock_wrapper:(id)a3;
- (void)setPerResultBlock:(id)a3;
- (void)setPerResultBlock_wrapper:(id)a3;
@end

@implementation CKCheckSupportedDeviceCapabilitiesOperation

- (CKCheckSupportedDeviceCapabilitiesOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  v2 = [(CKOperation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordZoneErrors = v2->_recordZoneErrors;
    v2->_recordZoneErrors = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    resultsByRecordZoneID = v2->_resultsByRecordZoneID;
    v2->_resultsByRecordZoneID = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (CKCheckSupportedDeviceCapabilitiesOperation)initWithDesiredCapabilities:(id)a3 zoneIDs:(id)a4 options:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17 = (CKCheckSupportedDeviceCapabilitiesOperation *)objc_msgSend_init(self, v11, v12, v13);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_copy(v9, v14, v15, v16);
    zoneIDs = v17->_zoneIDs;
    v17->_zoneIDs = (NSArray *)v18;

    v23 = objc_msgSend_copy(v8, v20, v21, v22);
    v33[0] = v23;
    uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v33, 1);
    desiredCapabilitySets = v17->_desiredCapabilitySets;
    v17->_desiredCapabilitySets = (NSArray *)v25;

    uint64_t v30 = objc_msgSend_copy(v10, v27, v28, v29);
    options = v17->_options;
    v17->_options = (CKDeviceCapabilityCheckOptions *)v30;
  }
  return v17;
}

- (CKCheckSupportedDeviceCapabilitiesOperation)initWithDesiredCapabilitySets:(id)a3 zoneIDs:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17 = (CKCheckSupportedDeviceCapabilitiesOperation *)objc_msgSend_init(self, v11, v12, v13);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_copy(v9, v14, v15, v16);
    zoneIDs = v17->_zoneIDs;
    v17->_zoneIDs = (NSArray *)v18;

    uint64_t v23 = objc_msgSend_copy(v8, v20, v21, v22);
    desiredCapabilitySets = v17->_desiredCapabilitySets;
    v17->_desiredCapabilitySets = (NSArray *)v23;

    uint64_t v28 = objc_msgSend_copy(v10, v25, v26, v27);
    options = v17->_options;
    v17->_options = (CKDeviceCapabilityCheckOptions *)v28;
  }
  return v17;
}

- (void)setPerResultBlock:(id)a3
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
    v14[2] = sub_18B17D8C4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perResultBlock = v15;
    goto LABEL_9;
  }
  if (self->_perResultBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perResultBlock = self->_perResultBlock;
    self->_id perResultBlock = v11;
LABEL_9:
  }
}

- (id)perResultBlock
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
    id v15 = sub_18AF142B4;
    uint64_t v16 = sub_18AF139F8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B17DABC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_perResultBlock);
  }

  return v8;
}

- (void)setCheckSupportedDeviceCapabilitiesCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B17DC48;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id checkSupportedDeviceCapabilitiesCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_checkSupportedDeviceCapabilitiesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id checkSupportedDeviceCapabilitiesCompletionBlock = self->_checkSupportedDeviceCapabilitiesCompletionBlock;
    self->_id checkSupportedDeviceCapabilitiesCompletionBlock = v11;
LABEL_9:
  }
}

- (id)checkSupportedDeviceCapabilitiesCompletionBlock
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
    id v15 = sub_18AF142B4;
    uint64_t v16 = sub_18AF139F8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B17DE40;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_checkSupportedDeviceCapabilitiesCompletionBlock);
  }

  return v8;
}

- (void)setCheckSupportedDeviceCapabilitiesCompletionBlock:(id)a3
{
  BOOL v4 = a3 == 0;
  id v9 = a3;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setCheckSupportedDeviceCapabilitiesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_zoneIDs(self, v5, v6, v7);
  objc_msgSend_setZoneIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_desiredCapabilitySets(self, v11, v12, v13);
  objc_msgSend_setDesiredCapabilitySets_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_options(self, v17, v18, v19);
  objc_msgSend_setOptions_(v4, v21, (uint64_t)v20, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  [(CKDatabaseOperation *)&v23 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v20 fillFromOperationInfo:v4];
  objc_msgSend_zoneIDs(v4, v5, v6, v7, v20.receiver, v20.super_class);
  uint64_t v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  zoneIDs = self->_zoneIDs;
  self->_zoneIDs = v8;

  objc_msgSend_desiredCapabilitySets(v4, v10, v11, v12);
  uint64_t v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  desiredCapabilitySets = self->_desiredCapabilitySets;
  self->_desiredCapabilitySets = v13;

  objc_msgSend_options(v4, v15, v16, v17);
  uint64_t v18 = (CKDeviceCapabilityCheckOptions *)objc_claimAutoreleasedReturnValue();

  options = self->_options;
  self->_options = v18;
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perResultBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_checkSupportedDeviceCapabilitiesCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_zoneIDs(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (!v10)
  {
    if (!a3) {
      return 0;
    }
    v62 = (objc_class *)objc_opt_class();
    v63 = NSStringFromClass(v62);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v64, @"CKErrorDomain", 12, @"At least one zone ID must be passed to %@", v63);
LABEL_25:
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v14 = objc_msgSend_zoneIDs(self, v11, v12, v13);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v82, (uint64_t)v87, 16);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v83;
LABEL_4:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v83 != v18) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void *)(*((void *)&v82 + 1) + 8 * v19);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v21, v20, (uint64_t)a3)) {
        goto LABEL_30;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v22, (uint64_t)&v82, (uint64_t)v87, 16);
        if (v17) {
          goto LABEL_4;
        }
        goto LABEL_11;
      }
    }
    if (!a3) {
      goto LABEL_30;
    }
    v65 = (objc_class *)objc_opt_class();
    v67 = NSStringFromClass(v65);
    v75 = v67;
    v76 = (void *)v20;
    v68 = @"Unexpected zoneID passed to %@: %@";
LABEL_28:
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v66, @"CKErrorDomain", 12, v68, v75, v76);
    goto LABEL_29;
  }
LABEL_11:

  uint64_t v26 = objc_msgSend_desiredCapabilitySets(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_count(v26, v27, v28, v29);

  if (!v30)
  {
    if (!a3) {
      return 0;
    }
    v69 = (objc_class *)objc_opt_class();
    v63 = NSStringFromClass(v69);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v70, @"CKErrorDomain", 12, @"desiredCapabilitySets must not be empty for %@", v63);
    goto LABEL_25;
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v14 = objc_msgSend_desiredCapabilitySets(self, v31, v32, v33);
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v34, (uint64_t)&v78, (uint64_t)v86, 16);
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v79;
LABEL_14:
    uint64_t v38 = 0;
    while (1)
    {
      if (*(void *)v79 != v37) {
        objc_enumerationMutation(v14);
      }
      v39 = *(void **)(*((void *)&v78 + 1) + 8 * v38);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a3) {
          goto LABEL_30;
        }
        v71 = (objc_class *)objc_opt_class();
        v67 = NSStringFromClass(v71);
        v75 = v67;
        v76 = v39;
        v68 = @"Unexpected capability set passed to %@: %@";
        goto LABEL_28;
      }
      if (!objc_msgSend_count(v39, v40, v41, v42)) {
        break;
      }
      if (v36 == ++v38)
      {
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v43, (uint64_t)&v78, (uint64_t)v86, 16);
        if (v36) {
          goto LABEL_14;
        }
        goto LABEL_21;
      }
    }
    if (!a3) {
      goto LABEL_30;
    }
    v72 = (objc_class *)objc_opt_class();
    v67 = NSStringFromClass(v72);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v73, @"CKErrorDomain", 12, @"At least one capability is required in each capability set passed to %@.", v67);
LABEL_29:
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_30:
    return 0;
  }
LABEL_21:

  v47 = objc_msgSend_configuration(self, v44, v45, v46);
  v51 = objc_msgSend_container(v47, v48, v49, v50);
  v55 = objc_msgSend_untrustedEntitlements(v51, v52, v53, v54);
  char hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v55, v56, v57, v58);

  if (hasTemporaryDeviceCapabilitiesEntitlement)
  {
    v77.receiver = self;
    v77.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
    return [(CKDatabaseOperation *)&v77 CKOperationShouldRun:a3];
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v60, @"CKInternalErrorDomain", 1017, @"Un-entitled client is not allowed access to temporary implementation of device capabilties");
    id v74 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v74;
    return result;
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performCheckSupportedDeviceCapabilitiesOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    uint64_t v8 = objc_msgSend_operationID(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_zoneIDs(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_desiredCapabilitySets(self, v13, v14, v15);
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    objc_super v23 = v16;
    _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "Checking supported device capabilities in zones with operation %{public}@ zoneIDs=%@ capabilitySets=%@", buf, 0x20u);
  }
  v17.receiver = self;
  v17.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  [(CKOperation *)&v17 performCKOperation];
}

- (void)handleSupportedDeviceCapabilityCheckResultForRecordZoneID:(id)a3 capabilitySet:(id)a4 result:(id)a5 error:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
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
    if (!v18)
    {
      if (objc_msgSend_canDropItemResultsEarly(self, v19, v20, v21)) {
        goto LABEL_37;
      }
LABEL_25:
      if (self) {
        objc_msgSend_setObject_forKeyedSubscript_(self->_recordZoneErrors, v52, (uint64_t)v16, (uint64_t)v10, *(_OWORD *)v71, *(void *)&v71[16], v72);
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(0, v52, (uint64_t)v16, (uint64_t)v10, *(_OWORD *)v71, *(void *)&v71[16], v72);
      }
      goto LABEL_37;
    }
    if (self) {
      __int16 v22 = self->super.super._signpost;
    }
    else {
      __int16 v22 = 0;
    }
    objc_super v23 = v22;
    uint64_t v27 = objc_msgSend_log(v23, v24, v25, v26);

    if (self) {
      uint64_t v28 = self->super.super._signpost;
    }
    else {
      uint64_t v28 = 0;
    }
    uint64_t v29 = v28;
    uint64_t v33 = objc_msgSend_identifier(v29, v30, v31, v32);

    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)v71 = 138412802;
      *(void *)&v71[4] = v10;
      *(_WORD *)&v71[12] = 2112;
      *(void *)&v71[14] = v11;
      *(_WORD *)&v71[22] = 2112;
      v72 = v16;
      v34 = "Record zone %@ supported device capabilities check failed for capability set %@ with error: %@";
      uint64_t v35 = v27;
      os_signpost_id_t v36 = v33;
      uint32_t v37 = 32;
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v35, OS_SIGNPOST_EVENT, v36, "CKCheckSupportedDeviceCapabilitiesOperation", v34, v71, v37);
    }
  }
  else
  {
    if (!v18)
    {
      if (objc_msgSend_canDropItemResultsEarly(self, v19, v20, v21)) {
        goto LABEL_37;
      }
      goto LABEL_28;
    }
    if (self) {
      uint64_t v38 = self->super.super._signpost;
    }
    else {
      uint64_t v38 = 0;
    }
    v39 = v38;
    uint64_t v27 = objc_msgSend_log(v39, v40, v41, v42);

    if (self) {
      v43 = self->super.super._signpost;
    }
    else {
      v43 = 0;
    }
    v44 = v43;
    uint64_t v48 = objc_msgSend_identifier(v44, v45, v46, v47);

    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)v71 = 138412546;
      *(void *)&v71[4] = v10;
      *(_WORD *)&v71[12] = 2112;
      *(void *)&v71[14] = v11;
      v34 = "Record zone %@ supported device capabilities %@ checked";
      uint64_t v35 = v27;
      os_signpost_id_t v36 = v48;
      uint32_t v37 = 22;
      goto LABEL_20;
    }
  }

  if (objc_msgSend_canDropItemResultsEarly(self, v49, v50, v51)) {
    goto LABEL_37;
  }
  if (v16) {
    goto LABEL_25;
  }
LABEL_28:
  if (self) {
    objc_msgSend_objectForKeyedSubscript_(self->_resultsByRecordZoneID, v52, (uint64_t)v10, v54, *(void *)v71, *(_OWORD *)&v71[8], v72);
  }
  else {
  v55 = objc_msgSend_objectForKeyedSubscript_(0, v52, (uint64_t)v10, v54, *(void *)v71, *(_OWORD *)&v71[8], v72);
  }

  if (!v55)
  {
    uint64_t v57 = objc_opt_new();
    if (self) {
      objc_msgSend_setObject_forKeyedSubscript_(self->_resultsByRecordZoneID, v56, (uint64_t)v57, (uint64_t)v10);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(0, v56, (uint64_t)v57, (uint64_t)v10);
    }
  }
  if (self) {
    resultsByRecordZoneID = self->_resultsByRecordZoneID;
  }
  else {
    resultsByRecordZoneID = 0;
  }
  v59 = resultsByRecordZoneID;
  v62 = objc_msgSend_objectForKeyedSubscript_(v59, v60, (uint64_t)v10, v61);
  objc_msgSend_setObject_forKey_(v62, v63, (uint64_t)v12, (uint64_t)v11);

LABEL_37:
  v64 = objc_msgSend_perResultBlock_wrapper(self, v52, v53, v54, *(void *)v71, *(_OWORD *)&v71[8]);
  v68 = v64;
  if (v64)
  {
    v69 = (void (**)(void *, id, id, id, void *))_Block_copy(v64);
  }
  else
  {
    v70 = objc_msgSend_perResultBlock(self, v65, v66, v67);
    v69 = (void (**)(void *, id, id, id, void *))_Block_copy(v70);
  }
  if (v69) {
    v69[2](v69, v10, v11, v12, v16);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
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
    objc_super v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKCheckSupportedDeviceCapabilitiesOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    if (self) {
      uint64_t v22 = objc_msgSend_count(self->_recordZoneErrors, v7, v8, v9);
    }
    else {
      uint64_t v22 = objc_msgSend_count(0, v7, v8, v9);
    }
    if (v22)
    {
      objc_super v23 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v25 = v23;
      if (self) {
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)self->_recordZoneErrors, @"CKPartialErrors");
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, 0, @"CKPartialErrors");
      }
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 1011, v25, @"Couldn't check supported device capabilities in some record zones");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint64_t v27 = objc_msgSend_checkSupportedDeviceCapabilitiesCompletionBlock(self, v7, v8, v9);

  if (v27)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v28 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v53 = objc_msgSend_operationID(self, v29, v30, v31);
      uint64_t v54 = &stru_1ED7F5C98;
      if (v4) {
        v55 = @" Error was: ";
      }
      else {
        v55 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v50, v51, v52);
        uint64_t v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v64 = v53;
      __int16 v65 = 2112;
      uint64_t v66 = v55;
      __int16 v67 = 2112;
      v68 = v54;
      _os_log_debug_impl(&dword_18AF10000, v28, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed.%@%@", buf, 0x20u);
      if (v4) {
    }
      }
    objc_msgSend_checkSupportedDeviceCapabilitiesCompletionBlock(self, v32, v33, v34);
    uint64_t v38 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v39 = 0;
    }
    else
    {
      if (self) {
        resultsByRecordZoneID = self->_resultsByRecordZoneID;
      }
      else {
        resultsByRecordZoneID = 0;
      }
      v39 = resultsByRecordZoneID;
    }
    uint64_t v47 = objc_msgSend_CKClientSuitableError(v4, v35, v36, v37);
    ((void (**)(void, NSMutableDictionary *, void *))v38)[2](v38, v39, v47);

    if (!v4) {
    objc_msgSend_setCheckSupportedDeviceCapabilitiesCompletionBlock_(self, v48, 0, v49);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v40 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v59 = objc_msgSend_operationID(self, v41, v42, v43);
      v60 = &stru_1ED7F5C98;
      if (v4) {
        uint64_t v61 = @" Error was: ";
      }
      else {
        uint64_t v61 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v56, v57, v58);
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v64 = v59;
      __int16 v65 = 2114;
      uint64_t v66 = v61;
      __int16 v67 = 2112;
      v68 = v60;
      _os_log_debug_impl(&dword_18AF10000, v40, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no checkSupportedDeviceCapabilitiesCompletionBlock was set.%{public}@%@", buf, 0x20u);
      if (v4) {
    }
      }
  }
  objc_msgSend_setPerResultBlock_(self, v44, 0, v45);
  v62.receiver = self;
  v62.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  [(CKOperation *)&v62 _finishOnCallbackQueueWithError:v4];
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
    id v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      __int16 v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKCheckSupportedDeviceCapabilitiesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKCheckSupportedDeviceCapabilitiesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/check-supported-capabilities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v12 = objc_msgSend_setWithObjects_(v4, v10, v6, v11, v7, v8, v9, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v13, (uint64_t)v12, (uint64_t)sel_handleSupportedDeviceCapabilityCheckResultForRecordZoneID_capabilitySet_result_error_, 1, 0);

  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  os_signpost_id_t v18 = objc_msgSend_setWithObjects_(v14, v16, v15, v17, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v19, (uint64_t)v18, (uint64_t)sel_handleSupportedDeviceCapabilityCheckResultForRecordZoneID_capabilitySet_result_error_, 2, 0);

  id v20 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v21, (uint64_t)v20, (uint64_t)sel_handleSupportedDeviceCapabilityCheckResultForRecordZoneID_capabilitySet_result_error_, 3, 0);

  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___CKCheckSupportedDeviceCapabilitiesOperation;
  objc_msgSendSuper2(&v22, sel_applyDaemonCallbackInterfaceTweaks_, v5);
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (NSArray)desiredCapabilitySets
{
  return self->_desiredCapabilitySets;
}

- (CKDeviceCapabilityCheckOptions)options
{
  return self->_options;
}

- (id)perResultBlock_wrapper
{
  return self->_perResultBlock_wrapper;
}

- (void)setPerResultBlock_wrapper:(id)a3
{
}

- (id)checkSupportedDeviceCapabilitiesCompletionBlock_wrapper
{
  return self->_checkSupportedDeviceCapabilitiesCompletionBlock_wrapper;
}

- (void)setCheckSupportedDeviceCapabilitiesCompletionBlock_wrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_checkSupportedDeviceCapabilitiesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perResultBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_resultsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneErrors, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_desiredCapabilitySets, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong(&self->_checkSupportedDeviceCapabilitiesCompletionBlock, 0);

  objc_storeStrong(&self->_perResultBlock, 0);
}

@end