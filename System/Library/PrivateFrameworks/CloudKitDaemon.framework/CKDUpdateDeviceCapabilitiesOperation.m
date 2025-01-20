@interface CKDUpdateDeviceCapabilitiesOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)didSynchronizeSigningIdentities;
- (BOOL)makeStateTransition;
- (BOOL)needsSynchronizeSigningIdentities;
- (CKDPResponseOperationResult)deviceCapabiltiesUpdateResult;
- (NSMutableDictionary)shareUsageResults;
- (NSMutableDictionary)zoneUsageResults;
- (id)activityCreate;
- (id)errorForResult:(id)a3 fallbackDescription:(id)a4;
- (id)lastSentCapabilities;
- (id)payloadDescription;
- (id)perShareUsageCompletionBlock;
- (id)perZoneUsageCompletionBlock;
- (id)shareUsages;
- (id)supportedCapabilities;
- (id)updateDeviceCapabilitiesCompletionBlock;
- (id)zoneUsages;
- (void)handleRequestCompleted:(id)a3;
- (void)invokeCompletionHandlers;
- (void)main;
- (void)sendSupportedCapabilitiesToServer;
- (void)setDeviceCapabiltiesUpdateResult:(id)a3;
- (void)setDidSynchronizeSigningIdentities:(BOOL)a3;
- (void)setNeedsSynchronizeSigningIdentities:(BOOL)a3;
- (void)setPerShareUsageCompletionBlock:(id)a3;
- (void)setPerZoneUsageCompletionBlock:(id)a3;
- (void)setShareUsageResults:(id)a3;
- (void)setUpdateDeviceCapabilitiesCompletionBlock:(id)a3;
- (void)setZoneUsageResults:(id)a3;
- (void)synchronizeSigningIdentities;
@end

@implementation CKDUpdateDeviceCapabilitiesOperation

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDUpdateDeviceCapabilitiesOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F6A48[a3 - 2];
  }
  return v3;
}

- (id)supportedCapabilities
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  v6 = objc_msgSend_supportedCapabilities(v3, v4, v5);

  return v6;
}

- (id)lastSentCapabilities
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  v6 = objc_msgSend_lastSentCapabilities(v3, v4, v5);

  return v6;
}

- (id)zoneUsages
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  v6 = objc_msgSend_zoneUsages(v3, v4, v5);

  return v6;
}

- (id)shareUsages
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  v6 = objc_msgSend_shareUsages(v3, v4, v5);

  return v6;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/update-device-capabilities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v9 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    v12 = objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    v14 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    v17 = objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    int v18 = 138544130;
    v19 = v7;
    __int16 v20 = 2048;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v12;
    __int16 v24 = 2112;
    v25 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Starting  <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);
  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      goto LABEL_5;
    case 2:
      if (!objc_msgSend_needsSynchronizeSigningIdentities(self, v4, v5)
        || (objc_msgSend_didSynchronizeSigningIdentities(self, v8, v15) & 1) != 0)
      {
        goto LABEL_9;
      }
      objc_msgSend_setState_(self, v8, 3);
      objc_msgSend_synchronizeSigningIdentities(self, v19, v20);
      break;
    case 3:
      if (objc_msgSend_didSynchronizeSigningIdentities(self, v4, v5))
      {
        objc_msgSend_setState_(self, v8, 2);
        objc_msgSend_setError_(self, v9, 0);
        objc_msgSend_setNeedsSynchronizeSigningIdentities_(self, v10, 0);
LABEL_5:
        objc_msgSend_sendSupportedCapabilitiesToServer(self, v6, v7);
      }
      else
      {
LABEL_9:
        objc_msgSend_setState_(self, v8, 4);
        objc_msgSend_invokeCompletionHandlers(self, v16, v17);
      }
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      v13 = objc_msgSend_error(self, v11, v12);
      objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);

      break;
    default:
      return 1;
  }
  return 1;
}

- (void)sendSupportedCapabilitiesToServer
{
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  uint64_t v5 = [CKDUpdateDeviceCapabilitiesURLRequest alloc];
  v8 = objc_msgSend_supportedCapabilities(self, v6, v7);
  uint64_t v11 = objc_msgSend_zoneUsages(self, v9, v10);
  v14 = objc_msgSend_shareUsages(self, v12, v13);
  uint64_t v16 = objc_msgSend_initWithOperation_supportedCapabilities_zoneUsages_shareUsages_(v5, v15, (uint64_t)self, v8, v11, v14);

  objc_initWeak(&location, v16);
  objc_initWeak(&from, self);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4F4749C;
  v33[3] = &unk_1E64F4B38;
  objc_copyWeak(&v34, &from);
  objc_msgSend_setDeviceCapabilitiesUpdatedBlock_(v16, v17, (uint64_t)v33);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4F47500;
  v31[3] = &unk_1E64F6960;
  objc_copyWeak(&v32, &from);
  v31[4] = self;
  objc_msgSend_setZoneUsageUpdatedBlock_(v16, v18, (uint64_t)v31);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C4F475C8;
  v29[3] = &unk_1E64F6988;
  objc_copyWeak(&v30, &from);
  v29[4] = self;
  objc_msgSend_setShareUsageUpdatedBlock_(v16, v19, (uint64_t)v29);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1C4F47690;
  v26[3] = &unk_1E64F0170;
  objc_copyWeak(&v27, &from);
  objc_copyWeak(&v28, &location);
  objc_msgSend_setCompletionBlock_(v16, v20, (uint64_t)v26);
  objc_msgSend_setRequest_(self, v21, (uint64_t)v16);
  __int16 v24 = objc_msgSend_container(self, v22, v23);
  objc_msgSend_performRequest_(v24, v25, (uint64_t)v16);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (id)errorForResult:(id)a3 fallbackDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_code(v6, v8, v9) == 1)
  {
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  uint64_t v13 = objc_msgSend_error(v6, v10, v11);
  uint64_t v16 = objc_msgSend_clientError(v13, v14, v15);
  char hasType = objc_msgSend_hasType(v16, v17, v18);

  if (hasType) {
    goto LABEL_9;
  }
  __int16 v22 = objc_msgSend_error(v6, v20, v21);
  if ((objc_msgSend_hasExtensionError(v22, v23, v24) & 1) == 0)
  {

LABEL_9:
    v39 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v40 = *MEMORY[0x1E4F19C40];
    v41 = objc_msgSend_request(self, v20, v21);
    v42 = sub_1C4E940D0(v41, v6);
    uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_format_(v39, v43, v40, 1, v42, @"%@", v7);

    goto LABEL_10;
  }
  id v27 = objc_msgSend_error(v6, v25, v26);
  id v30 = objc_msgSend_extensionError(v27, v28, v29);
  int hasTypeCode = objc_msgSend_hasTypeCode(v30, v31, v32);

  if (!hasTypeCode) {
    goto LABEL_9;
  }
  id v34 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v35 = *MEMORY[0x1E4F19DD8];
  v36 = objc_msgSend_request(self, v20, v21);
  v37 = sub_1C4E940D0(v36, v6);
  uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_format_(v34, v38, v35, 6000, v37, @"Plugin-Specific Error");

  if (!v12) {
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

- (id)payloadDescription
{
  v3 = objc_opt_new();
  id v6 = objc_msgSend_supportedCapabilities(self, v4, v5);

  if (v6) {
    objc_msgSend_appendString_(v3, v7, @"supported device capabilities");
  }
  uint64_t v9 = objc_msgSend_zoneUsages(self, v7, v8);
  uint64_t v12 = objc_msgSend_count(v9, v10, v11);

  if (v12)
  {
    if (objc_msgSend_length(v3, v13, v14)) {
      objc_msgSend_appendString_(v3, v15, @", ");
    }
    objc_msgSend_appendString_(v3, v15, @"zone usage");
  }
  uint64_t v16 = objc_msgSend_shareUsages(self, v13, v14);
  uint64_t v19 = objc_msgSend_count(v16, v17, v18);

  if (v19)
  {
    if (objc_msgSend_length(v3, v20, v21)) {
      objc_msgSend_appendString_(v3, v22, @", ");
    }
    objc_msgSend_appendString_(v3, v22, @"share usage");
  }
  return v3;
}

- (void)handleRequestCompleted:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_error(a3, a2, (uint64_t)a3);
  if (*MEMORY[0x1E4F1A4E0])
  {
    id v7 = objc_msgSend_unitTestOverrides(self, v4, v5);
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"forceDeviceCapabilityUpdateFailure");

    if (v9)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v11 = *MEMORY[0x1E4F19C40];
      uint64_t v12 = objc_msgSend_operationID(self, v4, v5);
      uint64_t v14 = objc_msgSend_errorWithDomain_code_format_(v10, v13, v11, 1, @"Forcing a failure for operation %@", v12);

      id v6 = (void *)v14;
    }
  }
  if (v6)
  {
    if (objc_msgSend_needsSynchronizeSigningIdentities(self, v4, v5))
    {
LABEL_24:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v50 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v51 = v50;
        v54 = objc_msgSend_payloadDescription(self, v52, v53);
        v57 = objc_msgSend_container(self, v55, v56);
        v60 = objc_msgSend_containerID(v57, v58, v59);
        *(_DWORD *)buf = 138412802;
        v62 = v54;
        __int16 v63 = 2112;
        v64 = v60;
        __int16 v65 = 2112;
        v66 = v6;
        _os_log_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_INFO, "Warn: Failed to send %@ to the server for container ID %@: %@", buf, 0x20u);
      }
LABEL_28:
      objc_msgSend_setError_(self, v49, (uint64_t)v6);
      goto LABEL_29;
    }
    uint64_t v17 = objc_msgSend_domain(v6, v15, v16);
    uint64_t v20 = v17;
    if (v17 != (void *)*MEMORY[0x1E4F19DD8])
    {

      goto LABEL_24;
    }
    uint64_t v45 = objc_msgSend_code(v6, v18, v19);

    if (v45 != 5023) {
      goto LABEL_24;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v46 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v6;
      _os_log_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_INFO, "Signing identity missing: %@", buf, 0xCu);
    }
    if (objc_msgSend_didSynchronizeSigningIdentities(self, v47, v48)) {
      goto LABEL_28;
    }
    objc_msgSend_setNeedsSynchronizeSigningIdentities_(self, v49, 1);
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v22 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v23 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = v23;
      uint64_t v29 = objc_msgSend_payloadDescription(self, v27, v28);
      uint64_t v32 = objc_msgSend_container(self, v30, v31);
      uint64_t v35 = objc_msgSend_containerID(v32, v33, v34);
      *(_DWORD *)buf = 138412546;
      v62 = v29;
      __int16 v63 = 2112;
      v64 = v35;
      _os_log_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_INFO, "Successfully sent %@ to the server for container ID %@", buf, 0x16u);
    }
    v36 = objc_msgSend_supportedCapabilities(self, v24, v25);

    if (v36)
    {
      if (*v21 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v37 = *v22;
      if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEBUG))
      {
        v38 = v37;
        v41 = objc_msgSend_supportedCapabilities(self, v39, v40);
        v44 = objc_msgSend_lastSentCapabilities(self, v42, v43);
        *(_DWORD *)buf = 138412546;
        v62 = v41;
        __int16 v63 = 2112;
        v64 = v44;
        _os_log_debug_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_DEBUG, "\n\tSent: %@\n\tPrevious: %@\n", buf, 0x16u);
      }
    }
  }
LABEL_29:
}

- (void)synchronizeSigningIdentities
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_needsSynchronizeSigningIdentities(self, a2, v2)
    || objc_msgSend_didSynchronizeSigningIdentities(self, v5, v6))
  {
    uint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, @"CKDUpdateDeviceCapabilitiesOperation.m", 270, @"User key sync for signing identities should not have been triggered");
  }
  id v7 = objc_msgSend_topmostParentOperation(self, v5, v6);
  uint64_t v10 = objc_msgSend_operationID(v7, v8, v9);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v11 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v10;
    _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Will attempt user key sync to update signing identities for operation %{public}@.", buf, 0xCu);
  }
  uint64_t v14 = objc_msgSend_stateTransitionGroup(self, v12, v13);
  dispatch_group_enter(v14);

  objc_initWeak((id *)buf, self);
  objc_msgSend_noteOperationWillWaitOnPCS(self, v15, v16);
  uint64_t v19 = objc_msgSend_container(self, v17, v18);
  __int16 v22 = objc_msgSend_pcsManager(v19, v20, v21);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4F48158;
  v27[3] = &unk_1E64F3C78;
  objc_copyWeak(&v29, (id *)buf);
  id v23 = v10;
  id v28 = v23;
  objc_msgSend_synchronizeUserKeyRegistryForSigningIdentitiesForRequestorOperationID_completionHandler_(v22, v24, (uint64_t)v23, v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

- (void)invokeCompletionHandlers
{
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  objc_initWeak(&location, self);
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F48400;
  block[3] = &unk_1E64F01E8;
  objc_copyWeak(&v9, &location);
  block[4] = self;
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)updateDeviceCapabilitiesCompletionBlock
{
  return self->_updateDeviceCapabilitiesCompletionBlock;
}

- (void)setUpdateDeviceCapabilitiesCompletionBlock:(id)a3
{
}

- (id)perZoneUsageCompletionBlock
{
  return self->_perZoneUsageCompletionBlock;
}

- (void)setPerZoneUsageCompletionBlock:(id)a3
{
}

- (id)perShareUsageCompletionBlock
{
  return self->_perShareUsageCompletionBlock;
}

- (void)setPerShareUsageCompletionBlock:(id)a3
{
}

- (BOOL)needsSynchronizeSigningIdentities
{
  return self->_needsSynchronizeSigningIdentities;
}

- (void)setNeedsSynchronizeSigningIdentities:(BOOL)a3
{
  self->_needsSynchronizeSigningIdentities = a3;
}

- (BOOL)didSynchronizeSigningIdentities
{
  return self->_didSynchronizeSigningIdentities;
}

- (void)setDidSynchronizeSigningIdentities:(BOOL)a3
{
  self->_didSynchronizeSigningIdentities = a3;
}

- (CKDPResponseOperationResult)deviceCapabiltiesUpdateResult
{
  return self->_deviceCapabiltiesUpdateResult;
}

- (void)setDeviceCapabiltiesUpdateResult:(id)a3
{
}

- (NSMutableDictionary)zoneUsageResults
{
  return self->_zoneUsageResults;
}

- (void)setZoneUsageResults:(id)a3
{
}

- (NSMutableDictionary)shareUsageResults
{
  return self->_shareUsageResults;
}

- (void)setShareUsageResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareUsageResults, 0);
  objc_storeStrong((id *)&self->_zoneUsageResults, 0);
  objc_storeStrong((id *)&self->_deviceCapabiltiesUpdateResult, 0);
  objc_storeStrong(&self->_perShareUsageCompletionBlock, 0);
  objc_storeStrong(&self->_perZoneUsageCompletionBlock, 0);
  objc_storeStrong(&self->_updateDeviceCapabilitiesCompletionBlock, 0);
}

@end