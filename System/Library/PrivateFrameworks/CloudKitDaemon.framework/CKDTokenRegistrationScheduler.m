@interface CKDTokenRegistrationScheduler
- (CKDLogicalDeviceContext)deviceContext;
- (CKDTokenRegistrationScheduler)initWithDeviceContext:(id)a3;
- (NSMutableDictionary)callbackBlocks;
- (NSMutableDictionary)callbackTimers;
- (NSMutableDictionary)unitTestingPushTokens;
- (NSMutableSet)operations;
- (OS_dispatch_queue)queue;
- (void)_handlePushToken:(id)a3 forContainer:(id)a4 completionBlock:(id)a5;
- (void)_refreshApsToken:(id)a3 container:(id)a4 completionBlock:(id)a5;
- (void)_removeApsToken:(id)a3 appContainerAccountTuple:(id)a4 completionBlock:(id)a5;
- (void)dealloc;
- (void)forceTokenRefreshForAllClients;
- (void)handlePublicPushTokenDidUpdate:(id)a3;
- (void)refreshAllClientsNow:(BOOL)a3;
- (void)registerTokenForAdopterContainer:(id)a3 completionBlock:(id)a4;
- (void)registerTokenRefreshActivity;
- (void)tokenRefreshChanged;
- (void)unregisterAllTokensForAccountID:(id)a3 completionHandler:(id)a4;
- (void)unregisterTokenForAppContainerAccountTuple:(id)a3;
@end

@implementation CKDTokenRegistrationScheduler

- (CKDTokenRegistrationScheduler)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKDTokenRegistrationScheduler;
  v5 = [(CKDTokenRegistrationScheduler *)&v31 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_deviceContext, v4);
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v11 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_opt_new();
    callbackBlocks = v6->_callbackBlocks;
    v6->_callbackBlocks = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    callbackTimers = v6->_callbackTimers;
    v6->_callbackTimers = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    operations = v6->_operations;
    v6->_operations = (NSMutableSet *)v19;

    v23 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v21, v22);
    objc_msgSend_addObserver_selector_name_object_(v23, v24, (uint64_t)v6, sel_handlePublicPushTokenDidUpdate_, @"CKDPushConnectionDidReceivePublicTokenNotification", 0);

    v27 = objc_msgSend_testDeviceReference(v4, v25, v26);

    if (v27)
    {
      uint64_t v28 = objc_opt_new();
      unitTestingPushTokens = v6->_unitTestingPushTokens;
      v6->_unitTestingPushTokens = (NSMutableDictionary *)v28;
    }
  }

  return v6;
}

- (void)dealloc
{
  id v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)CKDTokenRegistrationScheduler;
  [(CKDTokenRegistrationScheduler *)&v6 dealloc];
}

- (void)registerTokenRefreshActivity
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_unitTestingPushTokens(self, a2, v2);

  if (!v4)
  {
    objc_msgSend_currentProcess(CKDDaemonProcess, v5, v6);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isSystemInstalledBinary(v35, v7, v8))
    {
      v11 = objc_msgSend_currentProcess(CKDDaemonProcess, v9, v10);
      uint64_t v14 = objc_msgSend_processType(v11, v12, v13);

      if (v14 != 2)
      {
        if (CKIsRunningInSyncBubble())
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v17 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Running in sync bubble. Ignoring registerTokenRefreshActivity", buf, 2u);
          }
        }
        else
        {
          v18 = objc_msgSend_deviceContext(self, v15, v16);
          v21 = objc_msgSend_metadataCache(v18, v19, v20);
          v24 = objc_msgSend_globalConfiguration(v21, v22, v23);
          uint64_t v26 = objc_msgSend_tokenRegisterDays_(v24, v25, 0);

          if (v26 <= 1) {
            uint64_t v27 = 1;
          }
          else {
            uint64_t v27 = v26;
          }
          os_activity_t v28 = _os_activity_create(&dword_1C4CFF000, "tokenRegistration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
          uint64_t v29 = *MEMORY[0x1E4F141E8];
          uint64_t v30 = *MEMORY[0x1E4F141E8] * v27;
          v32 = objc_msgSend_stringWithUTF8String_(NSString, v31, *MEMORY[0x1E4F14338]);
          v37 = v32;
          v38[0] = MEMORY[0x1E4F1CC38];
          v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v38, &v37, 1);
          CKRegisterRepeatingXPCActivity("com.apple.cloudkit.tokenregistration", v28, v30, v29, v34, &unk_1F2043EF0);
        }
      }
    }
    else
    {
    }
  }
}

- (void)tokenRefreshChanged
{
}

- (void)_refreshApsToken:(id)a3 container:(id)a4 completionBlock:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v13 = a5;
  if (!v9)
  {
    v58 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v58, v59, (uint64_t)a2, self, @"CKDTokenRegistrationScheduler.m", 108, @"token must not be nil");
  }
  uint64_t v14 = objc_msgSend_unitTestingPushTokens(self, v11, v12);

  uint64_t v15 = (void *)*MEMORY[0x1E4F1A548];
  if (v14)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v15);
    }
    uint64_t v16 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = v16;
      uint64_t v22 = objc_msgSend_account(v10, v20, v21);
      v25 = objc_msgSend_accountID(v22, v23, v24);
      *(_DWORD *)buf = 138543874;
      id v64 = v9;
      __int16 v65 = 2112;
      id v66 = v10;
      __int16 v67 = 2112;
      v68 = v25;
      _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Refreshing token %{public}@ for container %@ using unit test account ID %@", buf, 0x20u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v15);
    }
    uint64_t v26 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v64 = v9;
      __int16 v65 = 2112;
      id v66 = v10;
      _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "Refreshing token %@ for container %@", buf, 0x16u);
    }
  }
  uint64_t v27 = objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E4F1A208], v17, v18);
  objc_msgSend_setDiscretionaryNetworkBehavior_(v27, v28, 1);
  objc_msgSend_setQualityOfService_(v27, v29, 17);
  uint64_t v30 = objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v30, v31, (uint64_t)v27);
  v32 = [CKDOperationInfoHolderOperation alloc];
  v34 = objc_msgSend_initWithOperationInfo_container_operationType_(v32, v33, (uint64_t)v30, v10, 800);
  id v35 = [CKDTokenRegistrationURLRequest alloc];
  v38 = objc_msgSend_apsEnvironmentString(v10, v36, v37);
  v41 = objc_msgSend_applicationBundleIdentifierForPush(v10, v39, v40);
  BOOL v44 = objc_msgSend_adopterProcessType(v10, v42, v43) == 3;
  v46 = objc_msgSend_initWithOperation_apsToken_apsEnvironmentString_bundleID_skipBundleIDCheck_(v35, v45, (uint64_t)v34, v9, v38, v41, v44);

  objc_msgSend_setRequest_(v34, v47, (uint64_t)v46);
  objc_initWeak((id *)buf, v46);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = sub_1C4EEC940;
  v60[3] = &unk_1E64F4698;
  objc_copyWeak(&v62, (id *)buf);
  v60[4] = self;
  id v48 = v13;
  id v61 = v48;
  objc_msgSend_setCompletionBlock_(v46, v49, (uint64_t)v60);
  v52 = objc_msgSend_operations(self, v50, v51);
  objc_sync_enter(v52);
  v55 = objc_msgSend_operations(self, v53, v54);
  objc_msgSend_addObject_(v55, v56, (uint64_t)v34);

  objc_sync_exit(v52);
  objc_msgSend_performRequest_(v10, v57, (uint64_t)v46);

  objc_destroyWeak(&v62);
  objc_destroyWeak((id *)buf);
}

- (void)_removeApsToken:(id)a3 appContainerAccountTuple:(id)a4 completionBlock:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v54 = a4;
  id v12 = a5;
  if (!v9)
  {
    v52 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, @"CKDTokenRegistrationScheduler.m", 158, @"token must not be nil");
  }
  id v13 = objc_msgSend_deviceContext(self, v10, v11, v54);
  uint64_t v16 = objc_msgSend_sharedInternalUseContainers(CKDContainer, v14, v15);
  uint64_t v18 = objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v17, (uint64_t)v55, v13, v16);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v19 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v48 = v19;
    uint64_t v51 = objc_msgSend_applicationBundleIdentifierForPush(v18, v49, v50);
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v9;
    __int16 v60 = 2112;
    id v61 = v55;
    __int16 v62 = 2114;
    v63 = v51;
    _os_log_debug_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_DEBUG, "Removing token %@ for container %@ push bundle identifier %{public}@", location, 0x20u);
  }
  uint64_t v22 = objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E4F1A208], v20, v21);
  uint64_t v23 = objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v23, v24, (uint64_t)v22);
  v25 = [CKDOperationInfoHolderOperation alloc];
  uint64_t v27 = objc_msgSend_initWithOperationInfo_container_operationType_(v25, v26, (uint64_t)v23, v18, 801);
  os_activity_t v28 = [CKDTokenDeletionURLRequest alloc];
  objc_super v31 = objc_msgSend_apsEnvironmentString(v18, v29, v30);
  v34 = objc_msgSend_applicationBundleIdentifierForPush(v18, v32, v33);
  v36 = objc_msgSend_initWithOperation_apsToken_apsEnvironmentString_bundleID_(v28, v35, (uint64_t)v27, v9, v31, v34);

  objc_msgSend_setRequest_(v27, v37, (uint64_t)v36);
  objc_initWeak((id *)location, v36);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1C4EECED8;
  v56[3] = &unk_1E64F4698;
  objc_copyWeak(&v58, (id *)location);
  v56[4] = self;
  id v38 = v12;
  id v57 = v38;
  objc_msgSend_setCompletionBlock_(v36, v39, (uint64_t)v56);
  v42 = objc_msgSend_operations(self, v40, v41);
  objc_sync_enter(v42);
  v45 = objc_msgSend_operations(self, v43, v44);
  objc_msgSend_addObject_(v45, v46, (uint64_t)v27);

  objc_sync_exit(v42);
  objc_msgSend_performRequest_(v18, v47, (uint64_t)v36);

  objc_destroyWeak(&v58);
  objc_destroyWeak((id *)location);
}

- (void)refreshAllClientsNow:(BOOL)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_unitTestingPushTokens(self, a2, a3);

  if (!v5)
  {
    if (CKIsRunningInSyncBubble())
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v8 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Ignoring refresh of all clients", buf, 2u);
      }
    }
    else
    {
      id v38 = objc_msgSend_deviceContext(self, v6, v7);
      uint64_t v11 = objc_msgSend_metadataCache(v38, v9, v10);
      uint64_t v14 = objc_msgSend_knownAppContainerAccountTuples(v11, v12, v13);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v15 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v14;
        _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "Refreshing all client push tokens. Known app containers are %@", buf, 0xCu);
      }
      uint64_t v16 = dispatch_group_create();
      v36 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = v14;
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v47, v51, 16);
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v48 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            dispatch_group_enter(v16);
            uint64_t v27 = objc_msgSend_queue(self, v25, v26);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1C4EED440;
            block[3] = &unk_1E64F5600;
            block[4] = v24;
            os_activity_t v28 = v16;
            uint64_t v43 = v28;
            id v44 = v38;
            v45 = self;
            BOOL v46 = a3;
            dispatch_async(v27, block);

            dispatch_time_t v29 = dispatch_time(0, 60000000000);
            dispatch_group_wait(v28, v29);
          }
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v47, v51, 16);
        }
        while (v21);
      }

      uint64_t v33 = objc_msgSend_queue(self, v31, v32);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = sub_1C4EEDB94;
      v39[3] = &unk_1E64F0948;
      id v40 = v38;
      id v41 = v36;
      id v34 = v36;
      id v35 = v38;
      dispatch_async(v33, v39);
    }
  }
}

- (void)_handlePushToken:(id)a3 forContainer:(id)a4 completionBlock:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_1C4CFF000, "tokenRegistrationScheduler/handlePushTokenDidUpdate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  uint64_t v14 = objc_msgSend_appContainerTuple(v9, v12, v13);
  uint64_t v17 = objc_msgSend_appContainerAccountTuple(v9, v15, v16);
  id v44 = v11;
  uint64_t v18 = [CKDPushToken alloc];
  uint64_t v21 = objc_msgSend_apsEnvironmentString(v9, v19, v20);
  uint64_t v23 = objc_msgSend_initWithAPSEnvironmentString_apsToken_(v18, v22, (uint64_t)v21, v8);
  BOOL v46 = v8;

  long long v47 = objc_msgSend_applicationBundleIdentifierForPush(v9, v24, v25);
  os_activity_t v28 = objc_msgSend_deviceContext(self, v26, v27);
  objc_super v31 = objc_msgSend_metadataCache(v28, v29, v30);
  uint64_t v33 = objc_msgSend_appContainerAccountMetadataForAppContainerAccountTuple_(v31, v32, (uint64_t)v17);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v34 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v57 = v8;
    __int16 v58 = 2112;
    v59 = v14;
    __int16 v60 = 2114;
    id v61 = v47;
    _os_log_debug_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_DEBUG, "Handling token %@ for container tuple %@, push bundle identifier %{public}@", buf, 0x20u);
  }
  uint64_t v37 = objc_msgSend_queue(self, v35, v36, v44);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4EEDF8C;
  block[3] = &unk_1E64F5650;
  block[4] = self;
  id v49 = v17;
  id v50 = v14;
  id v51 = v23;
  id v53 = v9;
  id v54 = v10;
  id v52 = v33;
  id v38 = v9;
  id v39 = v10;
  id v40 = v33;
  id v41 = v23;
  id v42 = v14;
  id v43 = v17;
  dispatch_async(v37, block);

  os_activity_scope_leave(&state);
}

- (void)unregisterTokenForAppContainerAccountTuple:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_unitTestingPushTokens(self, v5, v6);

  if (!v7)
  {
    if (CKIsRunningInSyncBubble())
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v10 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v4;
        _os_log_debug_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEBUG, "Running in sync bubble. Ignoring unregister for container %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = objc_msgSend_deviceContext(self, v8, v9);
      uint64_t v14 = objc_msgSend_sharedInternalUseContainers(CKDContainer, v12, v13);
      uint64_t v16 = objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v15, (uint64_t)v4, v11, v14);

      uint64_t v19 = objc_msgSend_sharedClient(CKDPDSClient, v17, v18);
      id v29 = 0;
      char v21 = objc_msgSend_unregisterTokenForContainer_outError_(v19, v20, (uint64_t)v16, &v29);
      id v22 = v29;

      if ((v21 & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v25 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v31 = v4;
          __int16 v32 = 2112;
          id v33 = v22;
          _os_log_error_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_ERROR, "Failed to unregister with PDS, but continuing with CKDeviceService unregistration for %@: %@", buf, 0x16u);
        }
      }
      uint64_t v26 = objc_msgSend_queue(self, v23, v24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4EEEA5C;
      block[3] = &unk_1E64F0948;
      block[4] = self;
      id v28 = v4;
      dispatch_async(v26, block);
    }
  }
}

- (void)unregisterAllTokensForAccountID:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v10 = objc_msgSend_unitTestingPushTokens(self, v8, v9);

  if (v10)
  {
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  if (CKIsRunningInSyncBubble())
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "Running in sync bubble. Ignoring unregister", buf, 2u);
    }
LABEL_9:
    v7[2](v7, 0);
    goto LABEL_16;
  }
  uint64_t v14 = objc_msgSend_sharedClient(CKDPDSClient, v11, v12);
  id v25 = 0;
  char v16 = objc_msgSend_unregisterAllTokensForAccountID_outError_(v14, v15, (uint64_t)v6, &v25);
  id v17 = v25;

  if ((v16 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v20 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_error_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_ERROR, "Failed to unregister with PDS, but continuing with CKDeviceService unregistration for %@", buf, 0xCu);
    }
  }
  char v21 = objc_msgSend_queue(self, v18, v19);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C4EEEF84;
  v22[3] = &unk_1E64F0FA0;
  v22[4] = self;
  id v23 = v6;
  uint64_t v24 = v7;
  dispatch_async(v21, v22);

LABEL_16:
}

- (void)forceTokenRefreshForAllClients
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_INFO, "Refreshing all push tokens", v5, 2u);
  }
  objc_msgSend_refreshAllClientsNow_(self, v4, 1);
}

- (void)handlePublicPushTokenDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_currentProcess(CKDDaemonProcess, v5, v6);
  if ((objc_msgSend_isSystemInstalledBinary(v7, v8, v9) & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v12 = objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
  uint64_t v15 = objc_msgSend_processType(v12, v13, v14);

  if (v15 != 2)
  {
    uint64_t v7 = _os_activity_create(&dword_1C4CFF000, "tokenRegistrationScheduler/handlePublicPushTokenDidUpdate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v17.opaque[0] = 0;
    v17.opaque[1] = 0;
    os_activity_scope_enter(v7, &v17);
    objc_msgSend_refreshAllClientsNow_(self, v16, 0);
    os_activity_scope_leave(&v17);
LABEL_4:
  }
}

- (void)registerTokenForAdopterContainer:(id)a3 completionBlock:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v10 = objc_msgSend_deviceContext(self, v8, v9);
  uint64_t v13 = objc_msgSend_account(v6, v11, v12);
  char v16 = objc_msgSend_dsid(v13, v14, v15);

  if (v16)
  {
    uint64_t v19 = objc_msgSend_metadataCache(v10, v17, v18);
    id v22 = objc_msgSend_account(v6, v20, v21);
    id v25 = objc_msgSend_accountID(v22, v23, v24);
    objc_msgSend_setCachedDSID_forAccountID_(v19, v26, (uint64_t)v16, v25);
  }
  if (CKIsRunningInSyncBubble())
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v29 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      BOOL v46 = v29;
      id v49 = objc_msgSend_appContainerTuple(v6, v47, v48);
      *(_DWORD *)buf = 138412290;
      __int16 v58 = v49;
      _os_log_debug_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_DEBUG, "Running in sync bubble. Ignoring token refresh for tuple %@", buf, 0xCu);
    }
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v30 = objc_msgSend_appContainerAccountTuple(v6, v27, v28);
    id v33 = objc_msgSend_appContainerTuple(v6, v31, v32);
    uint64_t v36 = objc_msgSend_sharedClient(CKDPDSClient, v34, v35);
    id v56 = 0;
    char v38 = objc_msgSend_ensureRegistrationForContainer_outError_(v36, v37, (uint64_t)v6, &v56);
    id v39 = v56;

    if ((v38 & 1) == 0 && v39)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v42 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v58 = v33;
        _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "Failed to ensure PDS registration, but continuing with CKDeviceService registration for %@", buf, 0xCu);
      }
    }
    id v43 = objc_msgSend_queue(self, v40, v41);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4EEFAEC;
    block[3] = &unk_1E64F56C8;
    block[4] = self;
    id v51 = v30;
    v55 = v7;
    id v52 = v33;
    id v53 = v6;
    id v54 = v10;
    id v44 = v33;
    id v45 = v30;
    dispatch_async(v43, block);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)callbackBlocks
{
  return self->_callbackBlocks;
}

- (NSMutableDictionary)callbackTimers
{
  return self->_callbackTimers;
}

- (NSMutableSet)operations
{
  return self->_operations;
}

- (CKDLogicalDeviceContext)deviceContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceContext);
  return (CKDLogicalDeviceContext *)WeakRetained;
}

- (NSMutableDictionary)unitTestingPushTokens
{
  return self->_unitTestingPushTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestingPushTokens, 0);
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_callbackTimers, 0);
  objc_storeStrong((id *)&self->_callbackBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end