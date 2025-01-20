@interface CKDProcessScopedStateManager
+ (id)sharedManager;
- (id)initInternal;
- (void)_globalDeviceIdentifierWithEntitlements:(id)a3 completionHandler:(id)a4;
- (void)_wipePersonaBasedClientCacheForAppRecord:(id)a3;
- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4;
- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4;
- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4;
- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4;
- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3;
- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4;
- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4;
- (void)globalDeviceIdentifierWithCompletionHandler:(id)a3;
- (void)kickOffPendingLongLivedOperations;
- (void)maxInlineMergeableDeltaSizeWithCompletionHandler:(id)a3;
- (void)updatePushTokens;
- (void)wipeAllCachesAndDie;
- (void)wipeServerConfigurationsAndDie;
@end

@implementation CKDProcessScopedStateManager

+ (id)sharedManager
{
  if (qword_1EBBD0168 != -1) {
    dispatch_once(&qword_1EBBD0168, &unk_1F2044C70);
  }
  v2 = (void *)qword_1EBBD0160;
  return v2;
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)CKDProcessScopedStateManager;
  return [(CKDProcessScopedStateManager *)&v3 init];
}

- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  v8 = objc_msgSend_sharedConnectionManager(CKDXPCConnectionManager, v6, v7);
  objc_msgSend_dumpStatusReportToFileHandle_(v8, v9, (uint64_t)v5);

  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
    v10 = v11;
  }
}

- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3
{
  id v6 = a3;
  objc_msgSend_evictPCSSQLCachesForKnownContainers(CKDPCSSQLCache, v3, v4);
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    id v5 = v6;
  }
}

- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_INFO, "accountsDidGrantAccessToBundleID:%@ containerIdentifiers:%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_INFO, "accountsDidRevokeAccessToBundleID:%@ containerIdentifiers:%@", buf, 0x16u);
  }
  id v9 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v8, (uint64_t)v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C5037738;
  v12[3] = &unk_1E64F0948;
  id v13 = v5;
  id v14 = v9;
  id v10 = v9;
  id v11 = v5;
  CKMuckingWithPersonas(v12);
}

- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  int v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  id v9 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "accountsWillDeleteAccount:%@", buf, 0xCu);
  }
  if (BYSetupAssistantNeedsToRun())
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Will not unregister any push token as we're in Buddy", buf, 2u);
    }
    if (v6) {
      v6[2](v6, 0);
    }
  }
  else
  {
    id v13 = objc_msgSend_defaultContext(CKDLogicalDeviceContext, v10, v11);
    id v16 = objc_msgSend_tokenRegistrationScheduler(v13, v14, v15);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1C5037BD0;
    v18[3] = &unk_1E64F63D8;
    uint64_t v19 = v6;
    objc_msgSend_unregisterAllTokensForAccountID_completionHandler_(v16, v17, (uint64_t)v5, v18);
  }
}

- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v6 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    id v9 = v6;
    id v10 = CKStringFromAccountChangeType();
    int v18 = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Account %@ changed with type %@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v11 = objc_msgSend_sharedAccountStore(CKDAccountStore, v7, v8);
  objc_msgSend_invalidateCache(v11, v12, v13);

  id v16 = objc_msgSend_sharedNotifier(CKDAccountNotifier, v14, v15);
  objc_msgSend_postAccountChangedNotificationWithAccountID_changeType_(v16, v17, (uint64_t)v5, a4);
}

- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  uint64_t v7 = [CKDAccount alloc];
  id inited = (id)objc_msgSend_initExplicitCredentialsAccountWithAccountOverrideInfo_(v7, v8, (uint64_t)v6);

  uint64_t isValidTestAccount = objc_msgSend_isValidTestAccount(inited, v9, v10);
  v5[2](v5, isValidTestAccount, 0);
}

- (void)_wipePersonaBasedClientCacheForAppRecord:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  objc_msgSend_identities(v3, v4, v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v24, v28, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1C5038098;
        aBlock[3] = &unk_1E64F05C8;
        id v23 = v3;
        uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
        uint64_t v15 = objc_msgSend_personaUniqueString(v11, v13, v14);
        id v16 = v15;
        if (v15)
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = sub_1C5038240;
          v19[3] = &unk_1E64F0E18;
          id v20 = v15;
          id v21 = v12;
          CKMuckingWithPersonas(v19);
        }
        else
        {
          v12[2](v12);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v24, v28, 16);
    }
    while (v8);
  }
}

- (void)wipeAllCachesAndDie
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_msgSend_enumeratorWithOptions_(MEMORY[0x1E4F223C8], a2, 0);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, v21, 16);
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend__wipePersonaBasedClientCacheForAppRecord_(self, v6, *(void *)(*((void *)&v17 + 1) + 8 * i));
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, v21, 16);
    }
    while (v7);
  }

  uint64_t v12 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v10, v11);
  uint64_t v13 = CKGetHomeCacheDir();
  objc_msgSend_removeItemAtPath_error_(v12, v14, (uint64_t)v13, 0);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v15 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v16 = 0;
    _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "It's time for cloudd to die...", v16, 2u);
  }
  exit(1);
}

- (void)wipeServerConfigurationsAndDie
{
  id v3 = objc_msgSend_sharedManager(CKDServerConfigurationManager, a2, v2);
  objc_msgSend_wipeAllConfigurations(v3, v4, v5);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v6 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_error_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_ERROR, "It's time for cloudd to die...", v7, 2u);
  }
  exit(1);
}

- (void)updatePushTokens
{
  objc_msgSend_defaultContext(CKDLogicalDeviceContext, a2, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_tokenRegistrationScheduler(v8, v3, v4);
  objc_msgSend_forceTokenRefreshForAllClients(v5, v6, v7);
}

- (void)kickOffPendingLongLivedOperations
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v5 = objc_msgSend_defaultContext(CKDLogicalDeviceContext, v3, v4);
  id v8 = objc_msgSend_operationInfoCache(v5, v6, v7);

  uint64_t v10 = objc_msgSend_resumableOperationInfosByAppContainerAccountTuplesWithProgressPurged_(v8, v9, 1);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1C503878C;
  v30[3] = &unk_1E64F0120;
  id v25 = v10;
  id v31 = v25;
  id v11 = v2;
  id v32 = v11;
  id v12 = v8;
  id v33 = v12;
  CKMuckingWithPersonas(v30);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v11;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, v36, 16);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    long long v18 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    long long v19 = (os_log_t *)MEMORY[0x1E4F1A500];
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * v20);
        if (*v18 != -1) {
          dispatch_once(v18, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v22 = *v19;
        if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v35 = v21;
          _os_log_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_INFO, "Forgetting all about operation %{public}@", buf, 0xCu);
        }
        objc_msgSend_deleteAllInfoForOperationWithID_(v12, v23, v21);
        ++v20;
      }
      while (v16 != v20);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v24, (uint64_t)&v26, v36, 16);
    }
    while (v16);
  }
}

- (void)maxInlineMergeableDeltaSizeWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, uint64_t))a3;
  id v6 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v4, v5);
  uint64_t v9 = objc_msgSend_lastKnownServerConfiguration(v6, v7, v8);

  if (v9)
  {
    uint64_t v11 = objc_msgSend_maxInlineMergeableDeltaSize_(v9, v10, 0);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v12 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134217984;
      uint64_t v15 = v11;
      id v13 = "Returning max inline mergeable delta size from configuration: %ld";
LABEL_11:
      _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = 92160;
    id v12 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134217984;
      uint64_t v15 = 92160;
      id v13 = "Returning default max inline mergeable delta size: %ld";
      goto LABEL_11;
    }
  }
  v3[2](v3, v11);
}

- (void)globalDeviceIdentifierWithCompletionHandler:(id)a3
{
}

- (void)_globalDeviceIdentifierWithEntitlements:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void))a4;
  if (objc_msgSend_hasSPIEntitlement(a3, v7, v8))
  {
    objc_msgSend_sharedManager(CKDDeviceIDManager, v9, v10);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_globalDeviceIdentifier(v14, v11, v12);
    v6[2](v6, v13, 0);

    id v6 = (void (**)(id, uint64_t, void))v13;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19C40], 8, @"Connection %@ is not entitled to call CloudKit SPI", self);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, uint64_t, void), void))v6[2])(v6, 0);
  }
}

@end