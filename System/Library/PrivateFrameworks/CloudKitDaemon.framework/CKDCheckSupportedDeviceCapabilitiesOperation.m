@interface CKDCheckSupportedDeviceCapabilitiesOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDCheckSupportedDeviceCapabilitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDeviceCapabilityCheckOptions)options;
- (NSArray)desiredCapabilitySets;
- (NSArray)zoneIDs;
- (NSMutableArray)results;
- (id)activityCreate;
- (id)checkSupportedDeviceCapabilitiesProgressBlock;
- (int)operationType;
- (void)_handleError:(id)a3 forZoneID:(id)a4 capabilitySet:(id)a5;
- (void)_handleSupportedDeviceCapabilitiesCheckedForZoneID:(id)a3 capabilitySet:(id)a4 result:(id)a5 responseCode:(id)a6;
- (void)checkSupportedCapabilitiesWithServer;
- (void)invokeCompletionHandlers;
- (void)main;
- (void)setCheckSupportedDeviceCapabilitiesProgressBlock:(id)a3;
- (void)setDesiredCapabilitySets:(id)a3;
- (void)setOptions:(id)a3;
- (void)setResults:(id)a3;
- (void)setZoneIDs:(id)a3;
- (void)validateShareParticipants;
- (void)validateSigningIdentities;
@end

@implementation CKDCheckSupportedDeviceCapabilitiesOperation

- (CKDCheckSupportedDeviceCapabilitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKDCheckSupportedDeviceCapabilitiesOperation;
  v9 = [(CKDDatabaseOperation *)&v31 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_zoneIDs(v6, v7, v8);
    zoneIDs = v9->_zoneIDs;
    v9->_zoneIDs = (NSArray *)v10;

    uint64_t v14 = objc_msgSend_desiredCapabilitySets(v6, v12, v13);
    desiredCapabilitySets = v9->_desiredCapabilitySets;
    v9->_desiredCapabilitySets = (NSArray *)v14;

    uint64_t v18 = objc_msgSend_options(v6, v16, v17);
    options = v9->_options;
    v9->_options = (CKDeviceCapabilityCheckOptions *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = objc_msgSend_count(v9->_zoneIDs, v21, v22);
    uint64_t v26 = objc_msgSend_count(v9->_desiredCapabilitySets, v24, v25);
    uint64_t v28 = objc_msgSend_initWithCapacity_(v20, v27, v26 * v23);
    results = v9->_results;
    v9->_results = (NSMutableArray *)v28;
  }
  return v9;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend_checkSupportedCapabilitiesWithServer(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend_validateShareParticipants(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend_validateSigningIdentities(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend_invokeCompletionHandlers(self, v11, v12);
      break;
    case 5:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      v15 = objc_msgSend_error(self, v13, v14);
      objc_msgSend_finishWithError_(self, v16, (uint64_t)v15);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 4)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDCheckSupportedDeviceCapabilitiesOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F7390[a3 - 2];
  }
  return v3;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/check-device-capabilities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 408;
}

- (void)checkSupportedCapabilitiesWithServer
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = v3;
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v33 = objc_msgSend_ckShortDescription(self, v31, v32);
    *(_DWORD *)location = 138543874;
    *(void *)&location[4] = v30;
    __int16 v44 = 2048;
    v45 = self;
    __int16 v46 = 2114;
    v47 = v33;
    _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Check supported device capabilities operation <%{public}@: %p; %{public}@> is starting",
      location,
      0x20u);
  }
  uint64_t v6 = objc_msgSend_stateTransitionGroup(self, v4, v5);
  dispatch_group_enter(v6);

  v7 = [CKDCheckSupportedDeviceCapabilitiesURLRequest alloc];
  uint64_t v10 = objc_msgSend_zoneIDs(self, v8, v9);
  uint64_t v13 = objc_msgSend_desiredCapabilitySets(self, v11, v12);
  v16 = objc_msgSend_options(self, v14, v15);
  uint64_t v18 = objc_msgSend_initWithOperation_zoneIDs_desiredCapabilitySets_options_(v7, v17, (uint64_t)self, v10, v13, v16);

  objc_initWeak((id *)location, self);
  objc_initWeak(&from, v18);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1C4F7C808;
  v40[3] = &unk_1E64F7320;
  objc_copyWeak(&v41, (id *)location);
  v40[4] = self;
  objc_msgSend_setSupportedDeviceCapabilitiesCheckedForZoneBlock_(v18, v19, (uint64_t)v40);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1C4F7C8B8;
  v38[3] = &unk_1E64F7348;
  objc_copyWeak(&v39, (id *)location);
  v38[4] = self;
  objc_msgSend_setErrorFromServerBlock_(v18, v20, (uint64_t)v38);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1C4F7CB10;
  v37[3] = &unk_1E64F7370;
  v37[4] = self;
  objc_msgSend_setErrorFromClientValidationBlock_(v18, v21, (uint64_t)v37);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C4F7CCA8;
  v34[3] = &unk_1E64F33C0;
  objc_copyWeak(&v35, (id *)location);
  objc_copyWeak(&v36, &from);
  v34[4] = self;
  objc_msgSend_setCompletionBlock_(v18, v22, (uint64_t)v34);
  objc_msgSend_setRequest_(self, v23, (uint64_t)v18);
  uint64_t v26 = objc_msgSend_container(self, v24, v25);
  objc_msgSend_performRequest_(v26, v27, (uint64_t)v18);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);
}

- (void)_handleError:(id)a3 forZoneID:(id)a4 capabilitySet:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [CKDDeviceCapabilityCheckPerRequestResult alloc];
  id v17 = (id)objc_msgSend_initWithZoneID_capabilitySet_result_error_(v11, v12, (uint64_t)v9, v8, 0, v10);

  uint64_t v15 = objc_msgSend_results(self, v13, v14);
  objc_msgSend_addObject_(v15, v16, (uint64_t)v17);
}

- (void)_handleSupportedDeviceCapabilitiesCheckedForZoneID:(id)a3 capabilitySet:(id)a4 result:(id)a5 responseCode:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [CKDDeviceCapabilityCheckPerRequestResult alloc];
  id v18 = (id)objc_msgSend_initWithZoneID_capabilitySet_result_error_(v12, v13, (uint64_t)v11, v10, v9, 0);

  v16 = objc_msgSend_results(self, v14, v15);
  objc_msgSend_addObject_(v16, v17, (uint64_t)v18);
}

- (void)validateShareParticipants
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  uint64_t v48 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v47 = self;
  id v8 = objc_msgSend_results(self, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v52, v57, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v53 != v14) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v17 = objc_msgSend_error(v16, v11, v12);

        if (!v17)
        {
          id v18 = objc_msgSend_result(v16, v11, v12);
          v21 = objc_msgSend_shareID(v18, v19, v20);

          if (v21)
          {
            v24 = objc_msgSend_recordName(v21, v22, v23);
            char isEqualToString = objc_msgSend_isEqualToString_(v24, v25, @"(rdar://136681514)");

            if ((isEqualToString & 1) == 0)
            {
              objc_msgSend_addObject_(v48, v27, (uint64_t)v21);
              objc_msgSend_addObject_(v5, v28, (uint64_t)v16);
            }
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v52, v57, 16);
    }
    while (v13);
  }

  if (objc_msgSend_count(v48, v29, v30))
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F1A0B0]);
    id v36 = objc_msgSend_allObjects(v48, v34, v35);
    objc_msgSend_setRecordIDs_(v33, v37, (uint64_t)v36);

    uint64_t v56 = *MEMORY[0x1E4F19D68];
    id v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v38, (uint64_t)&v56, 1);
    objc_msgSend_setDesiredKeys_(v33, v40, (uint64_t)v39);

    v43 = objc_msgSend_stateTransitionGroup(v47, v41, v42);
    dispatch_group_enter(v43);

    uint64_t v44 = objc_opt_class();
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_1C4F7D2E8;
    v49[3] = &unk_1E64F0260;
    id v50 = v5;
    v51 = v47;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v47, v45, v44, v33, v49);
  }
  __int16 v46 = objc_msgSend_stateTransitionGroup(v47, v31, v32);
  dispatch_group_leave(v46);
}

- (void)validateSigningIdentities
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v7 = objc_msgSend_results(self, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v36, v40, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v16 = objc_msgSend_error(v15, v10, v11);

        if (!v16)
        {
          id v17 = objc_msgSend_result(v15, v10, v11);
          uint64_t v20 = objc_msgSend_publicKeys(v17, v18, v19);

          if (objc_msgSend_count(v20, v21, v22))
          {
            uint64_t v25 = objc_msgSend_result(v15, v23, v24);
            objc_msgSend_canValidateWithKT(v25, v26, v27);

            uint64_t v30 = objc_msgSend_result(v15, v28, v29);
            objc_msgSend_shareID(v30, v31, v32);
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v36, v40, 16);
    }
    while (v12);
  }

  uint64_t v35 = objc_msgSend_stateTransitionGroup(self, v33, v34);
  dispatch_group_leave(v35);
}

- (void)invokeCompletionHandlers
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  uint64_t v7 = objc_msgSend_checkSupportedDeviceCapabilitiesProgressBlock(self, v5, v6);

  if (v7)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v10 = objc_msgSend_results(self, v8, v9, 0);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v35, v39, 16);
    if (v12)
    {
      uint64_t v15 = v12;
      uint64_t v16 = *(void *)v36;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v10);
          }
          id v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
          objc_msgSend_checkSupportedDeviceCapabilitiesProgressBlock(self, v13, v14);
          uint64_t v19 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
          uint64_t v22 = objc_msgSend_zoneID(v18, v20, v21);
          uint64_t v25 = objc_msgSend_capabilitySet(v18, v23, v24);
          uint64_t v28 = objc_msgSend_result(v18, v26, v27);
          objc_super v31 = objc_msgSend_error(v18, v29, v30);
          ((void (**)(void, void *, void *, void *, void *))v19)[2](v19, v22, v25, v28, v31);

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v35, v39, 16);
      }
      while (v15);
    }

    uint64_t v32 = (void *)MEMORY[0x1C8789E70]();
    objc_msgSend_setResults_(self, v33, 0);
  }
  uint64_t v34 = objc_msgSend_stateTransitionGroup(self, v8, v9);
  dispatch_group_leave(v34);
}

- (void)main
{
}

- (id)checkSupportedDeviceCapabilitiesProgressBlock
{
  return self->_checkSupportedDeviceCapabilitiesProgressBlock;
}

- (void)setCheckSupportedDeviceCapabilitiesProgressBlock:(id)a3
{
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
}

- (NSArray)desiredCapabilitySets
{
  return self->_desiredCapabilitySets;
}

- (void)setDesiredCapabilitySets:(id)a3
{
}

- (CKDeviceCapabilityCheckOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_desiredCapabilitySets, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong(&self->_checkSupportedDeviceCapabilitiesProgressBlock, 0);
}

@end