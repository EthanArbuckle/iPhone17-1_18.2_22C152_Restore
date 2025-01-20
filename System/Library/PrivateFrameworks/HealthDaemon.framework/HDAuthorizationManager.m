@interface HDAuthorizationManager
- (BOOL)_hasRequiredAuthorizationStatusesForBundleIdentifier:(id)a3 requiredReadTypes:(id)a4 error:(id *)a5;
- (BOOL)isAuthorizedForObjectType:(id)a3 authorizationStatus:(id)a4 clientEntitlements:(id)a5 sharing:(BOOL)a6 error:(id *)a7;
- (BOOL)suppressAuthorizationPrompt;
- (HDAuthorizationManager)initWithProfile:(id)a3;
- (double)requestSessionTimeout;
- (id)_builtInSchemas;
- (id)_schemaProviderForType:(id)a3;
- (id)authorizationStatusForTypes:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (id)diagnosticDescription;
- (id)enqueueAuthorizationRequestForBundleIdentifier:(id)a3 writeTypes:(id)a4 readTypes:(id)a5 authorizationNeededHandler:(id)a6 completion:(id)a7;
- (id)enqueueObjectAuthorizationRequestForBundleIdentifier:(id)a3 context:(id)a4 promptIfNeeded:(BOOL)a5 authorizationNeededHandler:(id)a6 completion:(id)a7;
- (id)fetchAuthorizationContextForPromptSession:(id)a3 error:(id *)a4;
- (id)unitTest_schemaProviderMap;
- (int64_t)authorizationRequestStatusForClientBundleIdentifier:(id)a3 writeTypes:(id)a4 readTypes:(id)a5 error:(id *)a6;
- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)isClientAuthorizedToReadType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)isClientAuthorizedToWriteObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)isClientAuthorizedToWriteType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)objectAuthorizationRecordForSource:(id)a3 objectUUID:(id)a4 resolveAssociations:(BOOL)a5 error:(id *)a6;
- (uint64_t)_authorizationRequestStatusForClientBundleIdentifier:(void *)a3 writeTypes:(void *)a4 readTypes:(uint64_t)a5 updateAuthorizationStatuses:(uint64_t)a6 error:;
- (void)_isRecalibrateEstimatesRequestSessionExpiredWithCreationDate:(void *)result;
- (void)_queue_cancelAuthorizationRequestsWithIdentifiers:(uint64_t)a1;
- (void)_queue_handleNextAuthorizationRequestGroup;
- (void)_queue_requestGroupDidFinishPrompting:(void *)a3 error:;
- (void)applicationsUninstalledNotification:(id)a3;
- (void)beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 completion:(id)a4;
- (void)cancelAuthorizationRequestsWithIdentifiers:(id)a3;
- (void)createRecalibrateEstimatesRequestRecordForSource:(id)a3 sampleType:(id)a4 effectiveDate:(id)a5 handler:(id)a6;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4;
- (void)handleAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 completion:(id)a5;
- (void)handleObjectAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 completion:(id)a5;
- (void)openAppForAuthorization:(id)a3 sessionIdentifier:(id)a4 completion:(id)a5;
- (void)performObjectAuthorizationForSource:(id)a3 samples:(id)a4 associatedWithSamplesOfType:(id)a5 completion:(id)a6;
- (void)resetAllAuthorizationRecordsWithCompletion:(id)a3;
- (void)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7;
- (void)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7;
- (void)setRequestSessionTimeout:(double)a3;
- (void)setSuppressAuthorizationPrompt:(BOOL)a3;
- (void)validateRecalibrateEstimatesRequestRecord:(id)a3 completion:(id)a4;
@end

@implementation HDAuthorizationManager

- (HDAuthorizationManager)initWithProfile:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HDAuthorizationManager.m", 286, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)HDAuthorizationManager;
  v6 = [(HDAuthorizationManager *)&v29 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = HKCreateConcurrentDispatchQueue();
    completionQueue = v7->_completionQueue;
    v7->_completionQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = HKCreateSerialDispatchQueue();
    observationQueue = v7->_observationQueue;
    v7->_observationQueue = (OS_dispatch_queue *)v12;

    v7->_requestSessionTimeout = 10.0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestGroupsByBundleIdentifier = v7->_requestGroupsByBundleIdentifier;
    v7->_requestGroupsByBundleIdentifier = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingRequestGroups = v7->_pendingRequestGroups;
    v7->_pendingRequestGroups = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingObjectAuthorizationRequestsByBundleIdentifier = v7->_pendingObjectAuthorizationRequestsByBundleIdentifier;
    v7->_pendingObjectAuthorizationRequestsByBundleIdentifier = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeObjectPromptSessionsBySessionIdentifier = v7->_activeObjectPromptSessionsBySessionIdentifier;
    v7->_activeObjectPromptSessionsBySessionIdentifier = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeRecalibrateEstimatesRequestSessionsByBundleIdentifier = v7->_activeRecalibrateEstimatesRequestSessionsByBundleIdentifier;
    v7->_activeRecalibrateEstimatesRequestSessionsByBundleIdentifier = v22;

    v24 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v24 addObject:v7];

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v7 selector:sel_applicationsUninstalledNotification_ name:@"HDHealthDaemonApplicationsUninstalledNotification" object:0];
    v26 = [v5 daemon];
    [v26 registerDaemonReadyObserver:v7 queue:v7->_observationQueue];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HDAuthorizationManager;
  [(HDAuthorizationManager *)&v5 dealloc];
}

- (void)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __109__HDAuthorizationManager_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke;
  v21[3] = &unk_1E63015A8;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  unint64_t v26 = a6;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

void __109__HDAuthorizationManager_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v3;
  v9 = v4;
  if (!v1) {
    goto LABEL_9;
  }
  if (![v6 count])
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:sel__queue_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion_, v1, @"HDAuthorizationManager.m", 612, @"Invalid parameter not satisfying: %@", @"[authorizationStatuses count] > 0" object file lineNumber description];

    if (v8) {
      goto LABEL_4;
    }
LABEL_11:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel__queue_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion_, v1, @"HDAuthorizationManager.m", 613, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v10 = objc_alloc_init(HDDefaultAuthorizationSchemaProvider);
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 48));
    id v17 = 0;
    uint64_t v12 = [(HDDefaultAuthorizationSchemaProvider *)v10 setAuthorizationStatuses:v6 authorizationModes:v7 bundleIdentifier:v8 options:v5 profile:WeakRetained error:&v17];
    id v13 = v17;

    v9[2](v9, v12 == 1, v13);
  }
  else
  {
    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_FAULT, "Unexpectedly provider did not respond to a selector.", buf, 2u);
    }
  }

LABEL_9:
}

- (int64_t)authorizationRequestStatusForClientBundleIdentifier:(id)a3 writeTypes:(id)a4 readTypes:(id)a5 error:(id *)a6
{
  return -[HDAuthorizationManager _authorizationRequestStatusForClientBundleIdentifier:writeTypes:readTypes:updateAuthorizationStatuses:error:]((uint64_t)self, a3, a4, a5, 0, (uint64_t)a6);
}

- (uint64_t)_authorizationRequestStatusForClientBundleIdentifier:(void *)a3 writeTypes:(void *)a4 readTypes:(uint64_t)a5 updateAuthorizationStatuses:(uint64_t)a6 error:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  v27 = v10;
  if (a1)
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    char v44 = 0;
    id v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_setByUnioningSet:otherSet:", v11, v12);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __134__HDAuthorizationManager__authorizationRequestStatusForClientBundleIdentifier_writeTypes_readTypes_updateAuthorizationStatuses_error___block_invoke;
    aBlock[3] = &unk_1E6301670;
    id v34 = v10;
    id v15 = v13;
    id v35 = v15;
    uint64_t v36 = a1;
    v40 = &v45;
    id v37 = v11;
    id v38 = v12;
    id v16 = v14;
    id v39 = v16;
    v41 = v43;
    char v42 = a5;
    id v17 = _Block_copy(aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v19 = [WeakRetained database];

    id v20 = +[HDDatabaseTransactionContext highPriorityContext];
    if (a5) {
      v21 = 0;
    }
    else {
      v21 = v20;
    }
    id v22 = +[HDHealthEntity transactionContextForWriting:a5 baseContext:v21];
    if (![v19 performTransactionWithContext:v22 error:a6 block:v17 inaccessibilityHandler:0])goto LABEL_11; {
    if (![v16 count])
    }
      goto LABEL_17;
    id v23 = +[HDHealthEntity transactionContextForWriting:0 baseContext:v20];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __134__HDAuthorizationManager__authorizationRequestStatusForClientBundleIdentifier_writeTypes_readTypes_updateAuthorizationStatuses_error___block_invoke_390;
    v29[3] = &unk_1E62F5CB0;
    id v30 = v16;
    uint64_t v31 = a1;
    v32 = &v45;
    int v24 = [v19 performTransactionWithContext:v23 error:a6 block:v29 inaccessibilityHandler:0];

    if (v24)
    {
LABEL_17:
      if (*((unsigned char *)v46 + 24)) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = 2;
      }
    }
    else
    {
LABEL_11:
      uint64_t v25 = 0;
    }

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(&v45, 8);
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (BOOL)_hasRequiredAuthorizationStatusesForBundleIdentifier:(id)a3 requiredReadTypes:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = a4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        if (([*(id *)(*((void *)&v29 + 1) + 8 * i) isClinicalType] & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Required authorization check only permitted for clinical types");
          BOOL v23 = 0;
          id v15 = v9;
          goto LABEL_25;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v15 = +[HDAuthorizationEntity authorizationRecordsByTypeForBundleIdentifier:v8 types:v9 profile:WeakRetained error:a5];

  if (v15)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
          id v22 = objc_msgSend(v15, "objectForKeyedSubscript:", v21, (void)v25);
          if (!v22
            || [v16 containsObject:v21] && (objc_msgSend(v22, "readingEnabled") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 10, @"Required authorization not granted");

            BOOL v23 = 0;
            goto LABEL_23;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    BOOL v23 = 1;
LABEL_23:
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_25:

  return v23;
}

- (id)enqueueAuthorizationRequestForBundleIdentifier:(id)a3 writeTypes:(id)a4 readTypes:(id)a5 authorizationNeededHandler:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__HDAuthorizationManager_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_completion___block_invoke;
  block[3] = &unk_1E63015D0;
  block[4] = self;
  id v19 = v17;
  id v29 = v19;
  id v30 = v12;
  id v31 = v13;
  id v32 = v14;
  id v33 = v15;
  id v34 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  dispatch_async(queue, block);
  long long v25 = v34;
  id v26 = v19;

  return v26;
}

void __132__HDAuthorizationManager_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_completion___block_invoke(void *a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v1 = (void *)a1[5];
  v3 = (void *)a1[6];
  v4 = (void *)a1[7];
  uint64_t v5 = (void *)a1[8];
  id v6 = (void *)a1[9];
  id v7 = (void *)a1[10];
  id v8 = v1;
  id v9 = v3;
  id v69 = v4;
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = v12;
  if (v2)
  {
    v67 = v11;
    v68 = (void (**)(void, void, void, void))v12;
    if (!v9)
    {
      v60 = [MEMORY[0x1E4F28B00] currentHandler];
      [v60 handleFailureInMethod:sel__queue_enqueueAuthorizationRequestWithIdentifier_bundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_completion_, v2, @"HDAuthorizationManager.m", 644, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
    id v15 = [WeakRetained sourceManager];
    id v70 = 0;
    id v16 = [v15 clientSourceForBundleIdentifier:v9 error:&v70];
    id v17 = v70;

    if (!v16)
    {
      id v33 = v17;
      if (!v17)
      {
        id v33 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__queue_enqueueAuthorizationRequestWithIdentifier_bundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_completion_, @"Failed to look up source with bundle identifier \"%@\", v9);
      }
      id v13 = v68;
      if (v68) {
        ((void (**)(void, id, void, void *))v68)[2](v68, v8, 0, v33);
      }
      goto LABEL_37;
    }
    id v63 = v17;
    uint64_t v18 = [_HDAuthorizationRequest alloc];
    id v66 = v8;
    id v19 = v8;
    id v20 = v69;
    id v64 = v10;
    id v21 = v10;
    id v22 = v68;
    v65 = v19;
    if (v18)
    {
      if (!v19)
      {
        v61 = [MEMORY[0x1E4F28B00] currentHandler];
        [v61 handleFailureInMethod:sel_initWithIdentifier_typesToWrite_typesToRead_completionHandler_, v18, @"HDAuthorizationManager.m", 1666, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
      }
      *(void *)v71 = v18;
      *(void *)&v71[8] = _HDAuthorizationRequest;
      id v23 = (_HDAuthorizationRequest *)objc_msgSendSuper2((objc_super *)v71, sel_init);
      uint64_t v18 = v23;
      if (v23)
      {
        objc_storeStrong((id *)&v23->_identifier, v1);
        uint64_t v24 = [v20 copy];
        typesToWrite = v18->_typesToWrite;
        v18->_typesToWrite = (NSSet *)v24;

        uint64_t v26 = [v21 copy];
        typesToRead = v18->_typesToRead;
        v18->_typesToRead = (NSSet *)v26;

        uint64_t v28 = [v22 copy];
        id completionHandler = v18->_completionHandler;
        v18->_id completionHandler = (id)v28;
      }
    }

    uint64_t v30 = [*(id *)(v2 + 72) objectForKeyedSubscript:v9];
    if (v30)
    {
      id v31 = (_HDAuthorizationRequestGroup *)v30;
      id v32 = v18;
      id v8 = v66;
    }
    else
    {
      id v31 = [_HDAuthorizationRequestGroup alloc];
      id v34 = v16;
      id v8 = v66;
      if (v31)
      {
        *(void *)v71 = v31;
        *(void *)&v71[8] = _HDAuthorizationRequestGroup;
        id v31 = (_HDAuthorizationRequestGroup *)objc_msgSendSuper2((objc_super *)v71, sel_init);
        if (v31)
        {
          uint64_t v35 = [v34 copy];
          source = v31->_source;
          v31->_source = (HKSource *)v35;

          uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
          requests = v31->_requests;
          v31->_requests = (NSMutableArray *)v37;

          uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
          completions = v31->_completions;
          v31->_completions = (NSMutableArray *)v39;

          uint64_t v41 = [MEMORY[0x1E4F1CA80] set];
          char v42 = v31->_typesToWrite;
          v31->_typesToWrite = (NSMutableSet *)v41;

          uint64_t v43 = [MEMORY[0x1E4F1CA80] set];
          char v44 = v31->_typesToRead;
          v31->_typesToRead = (NSMutableSet *)v43;
        }
      }

      [*(id *)(v2 + 72) setObject:v31 forKeyedSubscript:v9];
      uint64_t v45 = v18;
      if (!v31)
      {
        char v48 = 1;
LABEL_26:

        _HKInitializeLogging();
        v49 = (id)*MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          if (v18) {
            identifier = v18->_identifier;
          }
          else {
            identifier = 0;
          }
          v51 = identifier;
          v52 = -[_HDAuthorizationRequestGroup bundleIdentifier]((id *)&v31->super.isa);
          if (v48) {
            uint64_t v53 = 0;
          }
          else {
            uint64_t v53 = [(NSMutableArray *)v31->_requests count];
          }
          *(_DWORD *)v71 = 138543874;
          *(void *)&v71[4] = v51;
          *(_WORD *)&v71[12] = 2114;
          *(void *)&v71[14] = v52;
          __int16 v72 = 2048;
          uint64_t v73 = v53;
          _os_log_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEFAULT, "Added authorization request %{public}@ to group for %{public}@. Request count: %ld", v71, 0x20u);

          id v8 = v66;
        }

        uint64_t v11 = v67;
        if (v67)
        {
          v54 = -[_HDAuthorizationRequestGroup bundleIdentifier]((id *)&v31->super.isa);
          if (v48)
          {
            v55 = 0;
            v56 = 0;
          }
          else
          {
            v55 = v31->_typesToWrite;
            v56 = v31->_typesToRead;
          }
          *(void *)v71 = 0;
          v57 = v56;
          uint64_t v58 = -[HDAuthorizationManager _authorizationRequestStatusForClientBundleIdentifier:writeTypes:readTypes:updateAuthorizationStatuses:error:](v2, v54, v55, v57, 0, (uint64_t)v71);
          id v59 = *(id *)v71;

          uint64_t v11 = v67;
          v67[2](v67, v65, v58 == 1, v59);

          id v8 = v66;
        }

        id v33 = v63;
        id v10 = v64;
        id v13 = v68;
LABEL_37:

        goto LABEL_38;
      }
    }
    if (v18)
    {
      [(NSMutableArray *)v31->_requests addObject:v18];
      v46 = v18->_typesToWrite;
    }
    else
    {
      v62 = [MEMORY[0x1E4F28B00] currentHandler];
      [v62 handleFailureInMethod:sel_addRequest_, v31, @"HDAuthorizationManager.m", 1731, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

      [(NSMutableArray *)v31->_requests addObject:0];
      v46 = 0;
    }
    [(NSMutableSet *)v31->_typesToWrite unionSet:v46];
    if (v18) {
      uint64_t v47 = v18->_typesToRead;
    }
    else {
      uint64_t v47 = 0;
    }
    [(NSMutableSet *)v31->_typesToRead unionSet:v47];
    char v48 = 0;
    goto LABEL_26;
  }
LABEL_38:
}

- (void)handleAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(void, void, void))v11;
  if (v9)
  {
    queue = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__HDAuthorizationManager_handleAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke;
    v15[3] = &unk_1E62F7088;
    v15[4] = self;
    id v16 = v9;
    id v17 = v10;
    uint64_t v18 = v12;
    dispatch_async(queue, v15);
  }
  else if (v11)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"nil bundle identifier"");
    ((void (**)(void, void, void *))v12)[2](v12, 0, v14);
  }
}

void __98__HDAuthorizationManager_handleAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke(uint64_t *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];
  v3 = v2;
  id v10 = v2;
  if (v2)
  {
    v4 = (void *)a1[6];
    if (v4)
    {
      objc_setProperty_nonatomic_copy(v2, (SEL)v2, v4, 72);
      v3 = v10;
    }
    uint64_t v5 = (void *)a1[7];
    if (v5)
    {
      id v6 = v5;
      id v7 = (void *)v10[5];
      id v8 = _Block_copy(v6);
      [v7 addObject:v8];

      v3 = v10;
    }
    if (([*(id *)(a1[4] + 80) containsObject:v3] & 1) == 0) {
      [*(id *)(a1[4] + 80) addObject:v10];
    }
    -[HDAuthorizationManager _queue_handleNextAuthorizationRequestGroup](a1[4]);
  }
  else
  {
    uint64_t v9 = a1[7];
    if (!v9) {
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1, 0);
  }
  v3 = v10;
LABEL_12:
}

- (void)_queue_handleNextAuthorizationRequestGroup
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (id *)(a1 + 88);
    if (!*(void *)(a1 + 88))
    {
      v3 = [*(id *)(a1 + 80) firstObject];
      v4 = -[_HDAuthorizationRequestGroup bundleIdentifier](v3);
      if (!v3)
      {
LABEL_15:

        return;
      }
      [*(id *)(a1 + 80) removeObjectAtIndex:0];
      [*(id *)(a1 + 72) removeObjectForKey:v4];
      _HKInitializeLogging();
      uint64_t v5 = (os_log_t *)MEMORY[0x1E4F29EF8];
      id v6 = (void *)*MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
      {
        id v25 = v3[1];
        uint64_t v26 = v6;
        long long v27 = [v25 allObjects];
        id v28 = v3[2];
        id v29 = [v28 allObjects];
        *(_DWORD *)buf = 138412802;
        uint64_t v35 = v3;
        __int16 v36 = 2112;
        id v37 = v27;
        __int16 v38 = 2112;
        uint64_t v39 = v29;
        _os_log_debug_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEBUG, "activating request group %@ (write: %@, read: %@)", buf, 0x20u);
      }
      id v7 = [v3[7] bundleIdentifier];
      id v9 = v3[1];
      id v8 = v3[2];
      id v33 = 0;
      id v10 = v8;
      id v11 = v9;
      uint64_t v12 = -[HDAuthorizationManager _authorizationRequestStatusForClientBundleIdentifier:writeTypes:readTypes:updateAuthorizationStatuses:error:](a1, v7, v11, v10, 1, (uint64_t)&v33);
      id v13 = v33;

      if (v12)
      {
        if (v12 == 1
          && (id v14 = v3[9]) != 0
          && (int v15 = *(unsigned __int8 *)(a1 + 40), v14, !v15))
        {
          _HKInitializeLogging();
          os_log_t v20 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
          {
            id v21 = v3[7];
            id v22 = v20;
            id v23 = [v21 bundleIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v23;
            _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_INFO, "prompting for authorization for \"%@\"", buf, 0xCu);
          }
          double v24 = *(double *)(a1 + 120);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __68__HDAuthorizationManager__queue_handleNextAuthorizationRequestGroup__block_invoke;
          v30[3] = &unk_1E62F2EF8;
          v30[4] = a1;
          id v31 = v3;
          id v32 = v4;
          if (-[_HDAuthorizationRequestGroup promptIfNecessaryWithTimeout:completion:]((uint64_t)v31, v30, v24))
          {
            objc_storeStrong(v2, v3);

            goto LABEL_14;
          }
        }
        else
        {
          _HKInitializeLogging();
          os_log_t v16 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
          {
            id v17 = v16;
            -[_HDAuthorizationRequestGroup bundleIdentifier](v3);
            uint64_t v18 = (id *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v18;
            _os_log_debug_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEBUG, "NOT prompting for authorization for \"%@\"", buf, 0xCu);
LABEL_23:
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v19 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          id v17 = v19;
          -[_HDAuthorizationRequestGroup bundleIdentifier](v3);
          uint64_t v18 = (id *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          uint64_t v35 = v18;
          __int16 v36 = 2114;
          id v37 = v13;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "failed to determine authorization request status for \"%{public}@\": %{public}@", buf, 0x16u);
          goto LABEL_23;
        }
      }
      -[HDAuthorizationManager _queue_requestGroupDidFinishPrompting:error:]((void *)a1, v3, v13);
LABEL_14:

      goto LABEL_15;
    }
  }
}

- (void)cancelAuthorizationRequestsWithIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HDAuthorizationManager_cancelAuthorizationRequestsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __69__HDAuthorizationManager_cancelAuthorizationRequestsWithIdentifiers___block_invoke(uint64_t a1)
{
}

- (void)_queue_cancelAuthorizationRequestsWithIdentifiers:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:sel__queue_cancelAuthorizationRequestsWithIdentifiers_, a1, @"HDAuthorizationManager.m", 686, @"Invalid parameter not satisfying: %@", @"identifiers != nil" object file lineNumber description];
    }
    id v22 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Authorization request canceled");
    -[_HDAuthorizationRequestGroup cancelRequestsWithIdentifiers:error:](*(void *)(a1 + 88), v5, v6);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [*(id *)(a1 + 72) allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          -[_HDAuthorizationRequestGroup cancelRequestsWithIdentifiers:error:](*(void *)(*((void *)&v27 + 1) + 8 * i), v5, v6);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = [*(id *)(a1 + 112) allKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          uint64_t v18 = [*(id *)(a1 + 112) objectForKeyedSubscript:v17];
          os_log_t v19 = v18;
          if (v18) {
            uint64_t v18 = (void *)v18[1];
          }
          os_log_t v20 = [v18 sessionIdentifier];

          if ([v5 containsObject:v20]) {
            [*(id *)(a1 + 112) removeObjectForKey:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v14);
    }

    id v4 = v22;
  }
}

- (void)beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__HDAuthorizationManager_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __96__HDAuthorizationManager_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion___block_invoke(uint64_t a1)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    uint64_t v5 = [*(id *)(v1 + 104) objectForKeyedSubscript:v3];
    if (v5)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v3;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "Beginning prompt session: %@", buf, 0xCu);
      }
      id v7 = v4;
      uint64_t v8 = v7;
      if (v5[32])
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __76___HDObjectAuthorizationPromptSession_beginPromptTransactionWithCompletion___block_invoke;
        long long v28 = &unk_1E62F2F20;
        id v9 = &v29;
        id v29 = v7;
      }
      else
      {
        v5[32] = 1;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __76___HDObjectAuthorizationPromptSession_beginPromptTransactionWithCompletion___block_invoke_2;
        long long v28 = &unk_1E62F3CA8;
        id v9 = (id *)v30;
        id v17 = v7;
        id v29 = v5;
        v30[0] = v17;
      }
      HKDispatchAsyncOnGlobalConcurrentQueue();

LABEL_25:
      goto LABEL_26;
    }
    id v10 = (id *)*(id *)(v1 + 88);
    uint64_t v11 = (uint64_t)v10;
    if (v10)
    {
      id v12 = v10[8];
      if (v12)
      {
        id v13 = v12;
        if ([v12 isEqual:v3])
        {
          if (!*(void *)(v11 + 64) || !*(unsigned char *)(v11 + 24))
          {
            os_log_t v20 = [*(id *)(v11 + 56) bundleIdentifier];
            if (!*(void *)(v11 + 64))
            {
              id v22 = [MEMORY[0x1E4F28B00] currentHandler];
              [v22 handleFailureInMethod:sel_beginTransaction, v11, @"HDAuthorizationManager.m", 1813, @"Invalid parameter not satisfying: %@", @"_promptSessionIdentifier != nil" object file lineNumber description];
            }
            if (*(unsigned char *)(v11 + 24))
            {
              long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
              [v23 handleFailureInMethod:sel_beginTransaction, v11, @"HDAuthorizationManager.m", 1814, @"Invalid parameter not satisfying: %@", @"!_inTransaction" object file lineNumber description];
            }
            *(unsigned char *)(v11 + 24) = 1;
            -[HDWorkoutLocationSmoother _queue_cancelTimeout](v11);
            _HKInitializeLogging();
            id v21 = *MEMORY[0x1E4F29EF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v20;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v3;
              _os_log_debug_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEBUG, "beginning authorization transaction for \"%@\" (%@)", buf, 0x16u);
            }
            uint64_t v18 = 0;
            if (v20) {
              goto LABEL_22;
            }
            goto LABEL_19;
          }
          uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v15 = objc_opt_class();
          os_log_t v16 = @"There is already an active authorization session transaction";
        }
        else
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v15 = objc_opt_class();
          os_log_t v16 = @"Session identifier does not match active authorization session identifier";
        }
        uint64_t v18 = objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v15, sel__queue_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion_, v16);
LABEL_19:
        _HKInitializeLogging();
        os_log_t v19 = *MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v18;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "cannot begin authorization transaction: %{public}@", buf, 0xCu);
        }
        os_log_t v20 = 0;
LABEL_22:
        if (v4) {
          (*((void (**)(id, void *, void *))v4 + 2))(v4, v20, v18);
        }

        goto LABEL_25;
      }
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__queue_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion_, @"There is no active authorization session"");
    }
    else
    {
      long long v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = objc_opt_class();
      long long v26 = [v3 UUIDString];
      uint64_t v18 = objc_msgSend(v24, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v25, sel__queue_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion_, @"Failed to find authorization session with identifier %@"", v26);
    }
    id v13 = 0;
    goto LABEL_19;
  }
LABEL_26:
}

- (void)endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDAuthorizationManager.m", 453, @"Invalid parameter not satisfying: %@", @"sessionIdentifier != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HDAuthorizationManager_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke;
  block[3] = &unk_1E62F30F8;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __89__HDAuthorizationManager_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    uint64_t v5 = [*(id *)(v1 + 104) objectForKeyedSubscript:v3];
    if (v5)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        id v20 = v3;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "Ending prompt session: %@", (uint8_t *)&v19, 0xCu);
      }
      -[_HDObjectAuthorizationPromptSession endPromptTransactionWithSuccess:error:]((uint64_t)v5, v4 == 0, v4);
    }
    else
    {
      id v7 = *(id *)(v1 + 88);
      id v8 = v7;
      if (v7) {
        id v7 = (void *)v7[8];
      }
      char v9 = [v7 isEqual:v3];
      if (v8) {
        char v10 = v9;
      }
      else {
        char v10 = 0;
      }
      if (!v8 || !v8[8]) {
        goto LABEL_19;
      }
      char v11 = v10 ^ 1;
      if (!*((unsigned char *)v8 + 24)) {
        char v11 = 1;
      }
      if ((v11 & 1) == 0)
      {
        _HKInitializeLogging();
        id v12 = (void *)*MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
        {
          os_log_t v16 = v12;
          id v17 = [(id)v8[7] bundleIdentifier];
          uint64_t v18 = [v3 UUIDString];
          int v19 = 138412546;
          id v20 = v17;
          __int16 v21 = 2112;
          id v22 = v18;
          _os_log_debug_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEBUG, "ending authorization transaction for \"%@\" (%@)", (uint8_t *)&v19, 0x16u);
        }
        -[HDAuthorizationManager _queue_requestGroupDidFinishPrompting:error:]((void *)v1, v8, v4);
      }
      else
      {
LABEL_19:
        _HKInitializeLogging();
        id v13 = (void *)*MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
        {
          id v14 = v13;
          id v15 = [v3 UUIDString];
          int v19 = 138412290;
          id v20 = v15;
          _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "cannot end transaction \"%@\"", (uint8_t *)&v19, 0xCu);
        }
      }
    }
  }
}

- (void)resetAllAuthorizationRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "Resetting all authorization records", buf, 2u);
  }
  id v6 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"ResetAllAuthorizationRecords"];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HDAuthorizationManager_resetAllAuthorizationRecordsWithCompletion___block_invoke;
  block[3] = &unk_1E62F69F0;
  id v11 = v6;
  id v12 = v4;
  block[4] = self;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(queue, block);
}

void __69__HDAuthorizationManager_resetAllAuthorizationRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __69__HDAuthorizationManager_resetAllAuthorizationRecordsWithCompletion___block_invoke_2;
  id v14 = &unk_1E62F69A0;
  id v16 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 40);
  id v3 = &v11;
  if (v2)
  {
    id v4 = (id *)(v2 + 48);
    id WeakRetained = objc_loadWeakRetained(v4);
    id v18 = 0;
    BOOL v6 = +[HDAuthorizationEntity resetAllAuthorizationStatusesWithProfile:error:](HDAuthorizationEntity, "resetAllAuthorizationStatusesWithProfile:error:", WeakRetained, &v18, v11, v12);
    id v7 = v18;

    if (v6)
    {
      id v8 = objc_loadWeakRetained(v4);
      id v17 = v7;
      BOOL v9 = +[HDObjectAuthorizationEntity resetAllObjectAuthorizationRecordsForProfile:v8 error:&v17];
      id v10 = v17;

      id v7 = v10;
    }
    else
    {
      BOOL v9 = 0;
    }
    v13((uint64_t)v3, v9, v7);
  }
}

void __69__HDAuthorizationManager_resetAllAuthorizationRecordsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to reset all authorization settings: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)openAppForAuthorization:(id)a3 sessionIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v9 placeholder:0];
  if (v12)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke;
    block[3] = &unk_1E6301620;
    block[4] = self;
    id v16 = v9;
    id v19 = v11;
    id v17 = v12;
    id v18 = v10;
    dispatch_async(queue, block);
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"No app with the requested bundle identifier."");
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
  }
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v7 = (id)v6;
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  int v8 = *(void **)(a1 + 64);
  if (v8)
  {
    id v9 = (void *)[v8 copy];
    id v10 = _Block_copy(v9);
    [v7 addObject:v10];
  }
  if (!v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_2;
    aBlock[3] = &unk_1E62F2EF8;
    id v11 = *(void **)(a1 + 40);
    void aBlock[4] = *(void *)(a1 + 32);
    id v39 = v11;
    id v40 = v7;
    uint64_t v33 = _Block_copy(aBlock);
    uint64_t v12 = [*(id *)(a1 + 48) localizedName];
    id v13 = v12;
    if (!v12) {
      id v13 = *(void **)(a1 + 40);
    }
    id v14 = v13;

    id v15 = objc_alloc_init(MEMORY[0x1E4F65D98]);
    id v16 = NSString;
    id v17 = HKHealthKitFrameworkBundle();
    uint64_t v18 = *MEMORY[0x1E4F29E58];
    id v19 = [v17 localizedStringForKey:@"OPEN_%@_TITLE" value:&stru_1F1728D60 table:*MEMORY[0x1E4F29E58]];
    id v20 = objc_msgSend(v16, "stringWithFormat:", v19, v14);
    [v15 setTitle:v20];

    __int16 v21 = NSString;
    id v22 = HKHealthKitFrameworkBundle();
    uint64_t v23 = [v22 localizedStringForKey:@"OPEN_%@_DESCRIPTION" value:&stru_1F1728D60 table:v18];
    long long v24 = objc_msgSend(v21, "stringWithFormat:", v23, v14);
    [v15 setMessage:v24];

    uint64_t v25 = NSString;
    long long v26 = HKHealthKitFrameworkBundle();
    long long v27 = [v26 localizedStringForKey:@"OPEN_%@" value:&stru_1F1728D60 table:v18];
    long long v28 = objc_msgSend(v25, "stringWithFormat:", v27, v14);
    [v15 setDefaultButton:v28];

    id v29 = HKHealthKitFrameworkBundle();
    long long v30 = [v29 localizedStringForKey:@"NOT_NOW" value:&stru_1F1728D60 table:v18];
    [v15 setCancelButton:v30];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_4;
    v34[3] = &unk_1E6301648;
    id v31 = *(void **)(a1 + 40);
    v34[4] = *(void *)(a1 + 32);
    id v35 = v31;
    id v37 = v33;
    id v36 = *(id *)(a1 + 56);
    id v32 = v33;
    [v15 presentWithResponseHandler:v34];
  }
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E62F77F0;
  block[4] = v6;
  id v11 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  char v14 = a2;
  id v12 = v8;
  id v13 = v5;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 48), "removeAllObjects", (void)v8);
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v25 = 0;
    long long v26 = &v25;
    uint64_t v27 = 0x2050000000;
    long long v9 = (void *)_MergedGlobals_206;
    uint64_t v28 = _MergedGlobals_206;
    if (!_MergedGlobals_206)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getUIHealthAuthorizationActionClass_block_invoke;
      v24[3] = &unk_1E62F6B28;
      v24[4] = &v25;
      __getUIHealthAuthorizationActionClass_block_invoke((uint64_t)v24);
      long long v9 = (void *)v26[3];
    }
    long long v10 = v9;
    _Block_object_dispose(&v25, 8);
    if (v10)
    {
      id v11 = objc_alloc_init(v10);
      uint64_t v12 = *MEMORY[0x1E4F625E0];
      id v29 = v11;
      uint64_t v30 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      v31[0] = v13;
      long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    }
    char v14 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_5;
    v18[3] = &unk_1E6301620;
    id v19 = *(id *)(a1 + 40);
    id v20 = v10;
    id v23 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 32);
    id v21 = v15;
    uint64_t v22 = v16;
    id v17 = v10;
    dispatch_async(v14, v18);
  }
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_5(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F629E0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_6;
  v7[3] = &unk_1E63015F8;
  id v11 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 32);
  objc_msgSend(v2, "hd_openApplication:optionsDictionary:completion:", v3, v4, v7);
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), a2 != 0);
  if (*(void *)(a1 + 32))
  {
    dispatch_time_t v3 = dispatch_time(0, 30000000000);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(NSObject **)(v4 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_7;
    block[3] = &unk_1E62F30F8;
    block[4] = v4;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    dispatch_after(v3, v5, block);
  }
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_7(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  v7[0] = a1[5];
  dispatch_time_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  -[HDAuthorizationManager _queue_cancelAuthorizationRequestsWithIdentifiers:](v2, v3);

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Application failed to prompt for authorization in a timely fashion.");
  id v5 = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[6]];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[5]];
  -[_HDAuthorizationRequestGroup cancelRequestsWithIdentifiers:error:]((uint64_t)v5, v6, v4);
}

- (void)applicationsUninstalledNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"HDHealthDaemonApplicationsUninstalledBundleIdentifiersKey"];

  uint64_t v6 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"ApplicationsUninstalled"];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HDAuthorizationManager_applicationsUninstalledNotification___block_invoke;
  block[3] = &unk_1E62F30F8;
  id v11 = v5;
  uint64_t v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(queue, block);
}

uint64_t __62__HDAuthorizationManager_applicationsUninstalledNotification___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v28;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v28 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v27 + 1) + 8 * v5);
        uint64_t v7 = *(void *)(a1 + 40);
        id v26 = 0;
        if (v7)
        {
          id v8 = (id *)(v7 + 48);
          id v9 = v6;
          id WeakRetained = objc_loadWeakRetained(v8);
          BOOL v11 = +[HDAuthorizationEntity resetAuthorizationStatusesForBundleIdentifier:v9 profile:WeakRetained error:&v26];

          uint64_t v12 = @"Authorization reset";
          id v13 = objc_loadWeakRetained(v8);
          char v14 = [v13 nanoSyncManager];
          [v14 syncHealthDataWithOptions:0 reason:@"Authorization reset" completion:0];

          id v15 = v9;
          id v16 = objc_loadWeakRetained(v8);
          id v17 = [v16 daemon];
          uint64_t v18 = [v17 xpcEventManager];
          [v18 authorizationChangedForBundleIdentifier:v15];

          id v19 = v26;
          id v20 = v19;
          if (v11)
          {
            _HKInitializeLogging();
            id v21 = *MEMORY[0x1E4F29EF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v15;
              _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "Reset authorization records for uninstalled application %@", buf, 0xCu);
            }
          }
          else if (v19)
          {
            if ((HKIsUnitTesting() & 1) == 0)
            {
              _HKInitializeLogging();
              uint64_t v22 = *MEMORY[0x1E4F29EF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v32 = v15;
                __int16 v33 = 2114;
                id v34 = v20;
                _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Error resetting authorization records for uninstalled application %@: %{public}@", buf, 0x16u);
              }
            }
          }
        }
        else
        {
          id v20 = 0;
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      uint64_t v3 = v23;
    }
    while (v23);
  }

  return [*(id *)(a1 + 48) invalidate];
}

- (void)daemonReady:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  uint64_t v4 = [(HDAuthorizationManager *)self _builtInSchemas];
  uint64_t v5 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
  schemaProviderMap = self->_schemaProviderMap;
  self->_schemaProviderMap = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained daemon];

  id v9 = [v8 pluginManager];
  id v10 = [v9 pluginsConformingToProtocol:&unk_1F18A86A8];
  BOOL v11 = [v10 allValues];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "schemaProviderMap", (void)v18);
        [(NSMutableDictionary *)self->_schemaProviderMap hk_addEntriesFromNonNilDictionary:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

uint64_t __134__HDAuthorizationManager__authorizationRequestStatusForClientBundleIdentifier_writeTypes_readTypes_updateAuthorizationStatuses_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 48));
  uint64_t v7 = +[HDAuthorizationEntity readAuthorizationStatusesByTypeForBundleIdentifier:v4 types:v5 profile:WeakRetained error:a3];

  if (v7)
  {
    uint64_t v45 = a3;
    uint64_t v8 = a1;
    if (![v7 count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
      {
        _HKInitializeLogging();
        id v9 = *MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "Authorization required. There are no authorization statuses", buf, 2u);
        }
      }
    }
    v49 = [MEMORY[0x1E4F1CA60] dictionary];
    char v48 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v51 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v51)
    {
      uint64_t v50 = *(void *)v54;
      uint64_t v47 = v7;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v54 != v50) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v12 = [v7 objectForKeyedSubscript:v11];
          uint64_t v13 = [v12 authorizationRecord];
          int v14 = [*(id *)(v8 + 56) containsObject:v11];
          int v15 = [*(id *)(v8 + 64) containsObject:v11];
          int v16 = [v13 requestedSharing];
          int v17 = [v13 requestedReading];
          if ([v13 readingEnabled] && objc_msgSend(v13, "mode") == 1)
          {
            long long v18 = [v12 objectLimitAnchor];
            [*(id *)(a1 + 72) setObject:v18 forKeyedSubscript:v11];
          }
          long long v19 = [v11 parentType];

          if (v19)
          {
            uint64_t v20 = [v11 parentType];
            long long v21 = v7;
            uint64_t v22 = (void *)v20;
            uint64_t v23 = [v21 objectForKeyedSubscript:v20];

            long long v24 = [v23 authorizationRecord];
            uint64_t v25 = v24;
            if (v15 && ([v24 deniedReading] & 1) != 0
              || v14 && [v25 deniedSharing])
            {
              uint64_t v26 = 201;
              if ((v14 & v15) != 0) {
                uint64_t v26 = 203;
              }
              uint64_t v27 = 200;
              if (v15) {
                uint64_t v27 = 202;
              }
              if (v14) {
                uint64_t v28 = v26;
              }
              else {
                uint64_t v28 = v27;
              }
              [v49 setObject:&unk_1F17ED338 forKeyedSubscript:v11];
              long long v29 = [NSNumber numberWithInteger:v28];
              [v48 setObject:v29 forKeyedSubscript:v11];

              uint64_t v8 = a1;
              *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;

              uint64_t v7 = v47;
              goto LABEL_43;
            }

            uint64_t v7 = v47;
          }
          BOOL v30 = (v14 ^ 1 | v16) != 1 || (v15 ^ 1 | v17) == 0;
          uint64_t v8 = a1;
          if (v30 || ([v12 isAuthorizationDetermined] & 1) == 0)
          {
            uint64_t v31 = 201;
            if ((v14 & v15) != 0) {
              uint64_t v31 = 203;
            }
            uint64_t v32 = 200;
            if (v15) {
              uint64_t v32 = 202;
            }
            if (v14) {
              uint64_t v33 = v31;
            }
            else {
              uint64_t v33 = v32;
            }
            [v49 setObject:&unk_1F17ED350 forKeyedSubscript:v11];
            id v34 = [NSNumber numberWithInteger:v33];
            [v48 setObject:v34 forKeyedSubscript:v11];

            *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
            if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
            {
              _HKInitializeLogging();
              id v35 = (void *)*MEMORY[0x1E4F29EF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v36 = v35;
                int v37 = [v12 isAuthorizationDetermined];
                *(_DWORD *)buf = 138413058;
                uint64_t v58 = v11;
                __int16 v59 = 1024;
                int v60 = v14;
                __int16 v61 = 1024;
                int v62 = v15;
                __int16 v63 = 1024;
                int v64 = v37;
                _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "Authorization required. Type: %@, ReqWrite: %i, ReqRead: %i, AuthNotDetermined: %i", buf, 0x1Eu);
              }
            }
          }
LABEL_43:
        }
        uint64_t v51 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v51);
    }

    if ((*(unsigned char *)(*(void *)(*(void *)(v8 + 80) + 8) + 24)
       || *(unsigned char *)(*(void *)(*(void *)(v8 + 88) + 8) + 24))
      && *(unsigned char *)(v8 + 96))
    {
      id v38 = objc_loadWeakRetained((id *)(*(void *)(v8 + 48) + 48));
      id v39 = [v38 sourceManager];
      id v40 = [v39 localSourceForBundleIdentifier:*(void *)(v8 + 32) copyIfNecessary:1 error:v45];

      if (v40)
      {
        id v41 = objc_loadWeakRetained((id *)(*(void *)(v8 + 48) + 48));
        int v42 = +[HDAuthorizationEntity setAuthorizationStatuses:v49 authorizationRequests:v48 authorizationModes:MEMORY[0x1E4F1CC08] sourceEntity:v40 options:0 profile:v41 error:v45];

        int v43 = v42 << 31 >> 31;
      }
      else
      {
        LOBYTE(v43) = 0;
      }
    }
    else
    {
      LOBYTE(v43) = 1;
    }
  }
  else
  {
    LOBYTE(v43) = 0;
  }

  return v43 & 1;
}

BOOL __134__HDAuthorizationManager__authorizationRequestStatusForClientBundleIdentifier_writeTypes_readTypes_updateAuthorizationStatuses_error___block_invoke_390(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v5)
  {
    char v15 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
      BOOL v11 = +[HDSampleEntity maxAnchorForSamplesWithType:v9 profile:WeakRetained error:a3];

      if (!v11)
      {
        char v15 = 1;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v12 = [v11 longLongValue];
      uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
      uint64_t v14 = [v13 longLongValue];

      if (v12 > v14)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]
          && (_HKInitializeLogging(),
              int v16 = *MEMORY[0x1E4F29EF8],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT)))
        {
          *(_WORD *)buf = 0;
          char v15 = 2;
          _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "Authorization required. Re-authorization for anchor-limited authorization", buf, 2u);
        }
        else
        {
          char v15 = 2;
        }
        goto LABEL_17;
      }
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    char v15 = 0;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_18:

  return (v15 & 1) == 0;
}

void __68__HDAuthorizationManager__queue_handleNextAuthorizationRequestGroup__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 48));
    uint64_t v8 = [WeakRetained daemon];
    uint64_t v9 = [v8 analyticsSubmissionCoordinator];
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    objc_msgSend(v9, "authorization_reportAuthRequestPromptedForBundleIdentifer:profileType:", v10, objc_msgSend(v11, "profileType"));
  }
  else
  {
    uint64_t v12 = *(NSObject **)(v6 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HDAuthorizationManager__queue_handleNextAuthorizationRequestGroup__block_invoke_2;
    block[3] = &unk_1E62F30F8;
    void block[4] = v6;
    id v14 = *(id *)(a1 + 40);
    id v15 = v5;
    dispatch_async(v12, block);
  }
}

void __68__HDAuthorizationManager__queue_handleNextAuthorizationRequestGroup__block_invoke_2(uint64_t a1)
{
}

- (void)_queue_requestGroupDidFinishPrompting:(void *)a3 error:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!a1) {
    goto LABEL_48;
  }
  if (v5)
  {
    if (v6) {
      goto LABEL_25;
    }
    uint64_t v8 = (void *)*((void *)v5 + 7);
  }
  else
  {
    id v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:sel__queue_requestGroupDidFinishPrompting_error_, a1, @"HDAuthorizationManager.m", 907, @"Invalid parameter not satisfying: %@", @"requestGroup != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_25;
    }
    uint64_t v8 = 0;
  }
  id v9 = v8;
  v49[0] = 0;
  uint64_t v10 = [v9 _fetchBundleWithError:v49];
  id v11 = v49[0];
  if (v10)
  {
    uint64_t v12 = *MEMORY[0x1E4F2A990];
    uint64_t v13 = [v10 objectForInfoDictionaryKey:*MEMORY[0x1E4F2A990]];
    if (!v13)
    {
      id v7 = 0;
LABEL_23:

      goto LABEL_24;
    }
    *(void *)&long long v45 = v11;
    id v14 = [MEMORY[0x1E4F2B2C0] _objectTypesFromIdentifierArray:v13 error:&v45];
    id v15 = (id)v45;

    if (v14)
    {
      if (![v14 count])
      {
        id v7 = 0;
        goto LABEL_22;
      }
      unint64_t v16 = [v14 count];
      if (v16 >= *MEMORY[0x1E4F2A250])
      {
        long long v19 = -[_HDAuthorizationRequestGroup bundleIdentifier](v5);
        *(void *)&long long v41 = v15;
        int v39 = [a1 _hasRequiredAuthorizationStatusesForBundleIdentifier:v19 requiredReadTypes:v14 error:&v41];
        id v20 = (id)v41;

        if (v39) {
          long long v21 = 0;
        }
        else {
          long long v21 = v20;
        }
        id v7 = v21;
        id v15 = v20;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__validateRequiredAuthorizationWithRequestGroup_, @"Must specify at least %lu identifiers for \"%@\", *MEMORY[0x1E4F2A250], v12);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = v15;
      id v15 = v17;
    }
    id v7 = v17;
LABEL_22:

    id v11 = v15;
    goto LABEL_23;
  }
  _HKInitializeLogging();
  long long v18 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v36 = v18;
    int v37 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    id v51 = v37;
    __int16 v52 = 2114;
    id v53 = v11;
    _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "Failed to look up bundle for \"%{public}@\": %{public}@", buf, 0x16u);
  }
  id v7 = 0;
LABEL_24:

  if (!v7)
  {
    _HKInitializeLogging();
    id v35 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEBUG, "authorization request finished successfully", buf, 2u);
    }
    id v7 = 0;
    goto LABEL_27;
  }
LABEL_25:
  _HKInitializeLogging();
  long long v22 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v51 = v7;
    _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "authorization request failed with error: %{public}@", buf, 0xCu);
  }
LABEL_27:
  id v7 = v7;
  if (v5)
  {
    if (v5[8])
    {
      -[HDWorkoutLocationSmoother _queue_cancelTimeout]((uint64_t)v5);
      *((unsigned char *)v5 + 24) = 0;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v23 = v5[4];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:buf count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(v23);
          }
          -[_HDAuthorizationRequest invokeCompletionHandlerWithSuccess:error:](*(void *)(*((void *)&v45 + 1) + 8 * i), v7 == 0, v7);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:buf count:16];
      }
      while (v25);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v28 = v5[5];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v28);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * j) + 16))();
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v30);
    }

    id v33 = v5[5];
    v5[5] = 0;
  }
  if ((id *)a1[11] == v5)
  {
    a1[11] = 0;
  }
  id v34 = a1[7];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HDAuthorizationManager__queue_requestGroupDidFinishPrompting_error___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = a1;
  dispatch_async(v34, block);
LABEL_48:
}

uint64_t __70__HDAuthorizationManager__queue_requestGroupDidFinishPrompting_error___block_invoke(uint64_t a1)
{
  return -[HDAuthorizationManager _queue_handleNextAuthorizationRequestGroup](*(void *)(a1 + 32));
}

- (void)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unint64_t v16 = (void (**)(id, BOOL, id))a7;
  id v17 = [(HDAuthorizationManager *)self _schemaProviderForType:v13];
  if (objc_opt_respondsToSelector())
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    }
    else {
      id WeakRetained = 0;
    }
    id v62 = 0;
    uint64_t v19 = [v17 setObjectAuthorizationStatuses:v12 forObjectType:v13 bundleIdentifier:v14 sessionIdentifier:v15 profile:WeakRetained error:&v62];
    id v20 = v62;

    v16[2](v16, v19 == 1, v20);
  }
  else
  {
    id v52 = v13;
    id v53 = v12;
    if (self)
    {
      long long v21 = self;
      id v22 = objc_loadWeakRetained((id *)&self->_profile);
    }
    else
    {
      long long v21 = 0;
      id v22 = 0;
    }
    id v23 = [v22 sourceManager];
    id v61 = 0;
    uint64_t v24 = [v23 localSourceForBundleIdentifier:v14 error:&v61];
    id v20 = v61;

    if (v24)
    {
      if (v21) {
        id v25 = objc_loadWeakRetained((id *)&v21->_profile);
      }
      else {
        id v25 = 0;
      }
      id v60 = v20;
      uint64_t v26 = [v24 sourceUUIDWithProfile:v25 error:&v60];
      id v27 = v60;

      uint64_t v54 = (void *)v26;
      if (v26)
      {
        long long v46 = v27;
        long long v47 = v21;
        long long v48 = v24;
        v49 = v17;
        uint64_t v50 = v16;
        id v51 = v14;
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v29 = v53;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              id v34 = v15;
              if (*(void *)v57 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v35 = *(void *)(*((void *)&v56 + 1) + 8 * i);
              id v36 = objc_alloc(MEMORY[0x1E4F2B2B8]);
              int v37 = [v29 objectForKeyedSubscript:v35];
              uint64_t v38 = HKObjectAuthorizationStatusForNumber();
              CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
              uint64_t v40 = v35;
              id v15 = v34;
              long long v41 = (void *)[v36 initWithObjectUUID:v40 sourceUUID:v54 sessionUUID:v34 status:v38 modificationDate:Current];

              [v28 addObject:v41];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v56 objects:v63 count:16];
          }
          while (v31);
        }

        if (v47)
        {
          id v42 = objc_loadWeakRetained((id *)&v47->_profile);
          uint64_t v43 = [v42 currentSyncIdentityPersistentID];
          id v44 = objc_loadWeakRetained((id *)&v47->_profile);
        }
        else
        {
          uint64_t v43 = [0 currentSyncIdentityPersistentID];
          id v42 = 0;
          id v44 = 0;
        }
        id v13 = v52;
        id v12 = v53;
        unint64_t v16 = v50;
        id v55 = v46;
        BOOL v45 = +[HDObjectAuthorizationEntity setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:](HDObjectAuthorizationEntity, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v28, 0, v43, v44, &v55, HDObjectAuthorizationEntity);
        id v20 = v55;

        v16[2](v16, v45, v20);
        id v14 = v51;
        uint64_t v24 = v48;
        id v17 = v49;
      }
      else
      {
        v16[2](v16, 0, v27);
        id v13 = v52;
        id v12 = v53;
        id v20 = v27;
      }
    }
    else
    {
      v16[2](v16, 0, v20);
      id v13 = v52;
      id v12 = v53;
    }
  }
}

- (id)enqueueObjectAuthorizationRequestForBundleIdentifier:(id)a3 context:(id)a4 promptIfNeeded:(BOOL)a5 authorizationNeededHandler:(id)a6 completion:(id)a7
{
  BOOL v83 = a5;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [_HDObjectAuthorizationRequest alloc];
  unint64_t v16 = [v12 samples];
  id v17 = [v12 metadata];
  id v18 = v16;
  id v19 = v17;
  id v20 = v14;
  if (v15)
  {
    v119.receiver = v15;
    v119.super_class = (Class)_HDObjectAuthorizationRequest;
    id v15 = [(HDAuthorizationManager *)&v119 init];
    if (v15)
    {
      uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
      identifier = v15->_identifier;
      v15->_identifier = (NSUUID *)v21;

      uint64_t v23 = [v18 copy];
      samples = v15->_samples;
      v15->_samples = (NSArray *)v23;

      uint64_t v25 = [v19 copy];
      metadata = v15->_metadata;
      v15->_metadata = (HKObjectAuthorizationPromptSessionMetadata *)v25;

      id v27 = _Block_copy(v20);
      id completion = v15->_completion;
      v15->_id completion = v27;
    }
  }

  char v29 = [v12 promptWithAllSamples];
  if (v15) {
    v15->_promptWithAllSamples = v29;
  }
  if (!v11)
  {
    uint64_t v74 = [MEMORY[0x1E4F28B00] currentHandler];
    [v74 handleFailureInMethod:a2, self, @"HDAuthorizationManager.m", 1130, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];

    completionQueue = self->_completionQueue;
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke;
    v116[3] = &unk_1E62F3CA8;
    id v118 = v20;
    v76 = v15;
    v117 = v76;
    dispatch_async(completionQueue, v116);
    if (v15) {
      v77 = v76->_identifier;
    }
    else {
      v77 = 0;
    }
    long long v46 = v77;

    id v42 = v118;
    goto LABEL_36;
  }
  v86 = v13;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v31 = [WeakRetained sourceManager];
  id v115 = 0;
  v87 = v11;
  uint64_t v32 = [v31 localSourceForBundleIdentifier:v11 error:&v115];
  id v33 = v115;

  if (!v32)
  {
    uint64_t v43 = self->_completionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_2;
    block[3] = &unk_1E62F61D0;
    id v114 = v20;
    id v44 = v15;
    v112 = v44;
    id v42 = v33;
    id v113 = v42;
    dispatch_async(v43, block);
    if (v15) {
      BOOL v45 = v44->_identifier;
    }
    else {
      BOOL v45 = 0;
    }
    id v13 = v86;
    long long v46 = v45;

    id v34 = v114;
    goto LABEL_35;
  }
  v82 = v20;
  id v34 = [MEMORY[0x1E4F29128] UUID];
  if ([v12 persistSession]) {
    uint64_t v35 = v34;
  }
  else {
    uint64_t v35 = 0;
  }
  id v37 = v35;
  if (v15) {
    objc_setProperty_nonatomic_copy(v15, v36, v37, 56);
  }
  id v85 = v37;
  uint64_t v38 = [v12 samples];
  id v39 = objc_loadWeakRetained((id *)&self->_profile);
  id v110 = v33;
  uint64_t v40 = +[HDObjectAuthorizationEntity authorizationRecordsForSamples:v38 sourceEntity:v32 sessionIdentifier:v37 profile:v39 error:&v110];
  id v81 = v110;

  int v41 = [v12 promptWithNoSamples];
  v84 = v40;
  if ([v12 promptWithAllSamples])
  {
    -[HDSmoothingTask setTransaction:]((uint64_t)v15, v40);
    id v42 = v81;
    if (!v83) {
      goto LABEL_39;
    }
  }
  else
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v47 = v40;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v106 objects:v122 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      v78 = v34;
      uint64_t v50 = *(void *)v107;
      while (2)
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v107 != v50) {
            objc_enumerationMutation(v47);
          }
          if (![*(id *)(*((void *)&v106 + 1) + 8 * i) status])
          {
            -[HDSmoothingTask setTransaction:]((uint64_t)v15, v47);
            int v41 = 1;
            goto LABEL_29;
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v106 objects:v122 count:16];
        if (v49) {
          continue;
        }
        break;
      }
LABEL_29:
      id v20 = v82;
      id v34 = v78;
    }

    id v42 = v81;
    id v37 = v85;
    if (!v41 || !v83)
    {
LABEL_39:
      if (!v40)
      {
        if (v15)
        {
          (*((void (**)(id, NSUUID *, void, id))v20 + 2))(v20, v15->_identifier, 0, v42);
          id v53 = v15->_identifier;
        }
        else
        {
          (*((void (**)(id, void, void, id))v20 + 2))(v20, 0, 0, v42);
          id v53 = 0;
        }
        id v13 = v86;
        goto LABEL_34;
      }
      v79 = v34;
      v80 = v32;
      id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v57 = [v12 samples];
      uint64_t v58 = [v57 countByEnumeratingWithState:&v97 objects:v121 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v98;
        do
        {
          for (uint64_t j = 0; j != v59; ++j)
          {
            if (*(void *)v98 != v60) {
              objc_enumerationMutation(v57);
            }
            id v62 = *(void **)(*((void *)&v97 + 1) + 8 * j);
            __int16 v63 = [v62 UUID];
            [v56 setObject:v62 forKeyedSubscript:v63];
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v97 objects:v121 count:16];
        }
        while (v59);
      }

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v64 = v84;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v93 objects:v120 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v94;
        do
        {
          for (uint64_t k = 0; k != v66; ++k)
          {
            if (*(void *)v94 != v67) {
              objc_enumerationMutation(v64);
            }
            id v69 = *(void **)(*((void *)&v93 + 1) + 8 * k);
            if ([v69 status] == 2)
            {
              id v70 = [v69 objectUUID];
              v71 = [v56 objectForKeyedSubscript:v70];
              [v55 addObject:v71];
            }
          }
          uint64_t v66 = [v64 countByEnumeratingWithState:&v93 objects:v120 count:16];
        }
        while (v66);
      }

      queue = self->_queue;
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_5;
      v89[3] = &unk_1E62F61D0;
      id v20 = v82;
      id v92 = v82;
      v90 = v15;
      id v91 = v55;
      id v73 = v55;
      dispatch_async(queue, v89);

      id v37 = v85;
      id v13 = v86;
      id v34 = v79;
      uint64_t v32 = v80;
      id v42 = v81;
      if (!v15) {
        goto LABEL_57;
      }
      goto LABEL_33;
    }
  }
  id v52 = self->_queue;
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_3;
  v101[3] = &unk_1E62FF660;
  v101[4] = self;
  id v102 = v87;
  id v103 = v34;
  v104 = v15;
  id v13 = v86;
  id v105 = v86;
  dispatch_async(v52, v101);

  if (!v15)
  {
LABEL_57:
    id v53 = 0;
    goto LABEL_34;
  }
LABEL_33:
  id v53 = v15->_identifier;
LABEL_34:
  long long v46 = v53;

LABEL_35:
  id v11 = v87;
LABEL_36:

  return v46;
}

void __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v1) {
    uint64_t v1 = (void *)v1[3];
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = v1;
  objc_msgSend(v3, "hk_error:description:", 3, @"Bundle identifier must be non-nil when requesting object authorization.");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void, id))(v2 + 16))(v2, v4, 0, v5);
}

uint64_t __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v2 + 16))(v2, v4, 0, a1[5]);
}

void __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2) {
    goto LABEL_6;
  }
  uint64_t v2 = [_HDObjectAuthorizationPromptSession alloc];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v6 = v4;
  id v7 = v3;
  id v8 = WeakRetained;
  if (v2)
  {
    v20.receiver = v2;
    v20.super_class = (Class)_HDObjectAuthorizationPromptSession;
    id v9 = (_HDObjectAuthorizationPromptSession *)objc_msgSendSuper2(&v20, sel_init);
    uint64_t v2 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_profile, v8);
      uint64_t v10 = [v7 copy];
      sessionIdentifier = v2->_sessionIdentifier;
      v2->_sessionIdentifier = (NSUUID *)v10;

      objc_storeStrong((id *)&v2->_bundleIdentifier, v4);
      id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      requests = v2->_requests;
      v2->_requests = v12;

      id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      completions = v2->_completions;
      v2->_completions = v14;
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 96) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
LABEL_6:
    [(NSMutableArray *)v2->_requests addObject:*(void *)(a1 + 56)];
  }
  unint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_4;
  v17[3] = &unk_1E62F3CA8;
  id v19 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 56);
  dispatch_async(v16, v17);
}

uint64_t __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v2 + 16))(v2, v4, 1, 0);
}

uint64_t __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_5(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v2 + 16))(v2, v4, a1[5], 0);
}

- (void)handleObjectAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke;
  v15[3] = &unk_1E62F7088;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = v4;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = *(id *)(v3 + 104);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:buf count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v37;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(v3 + 104) objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * v10)];
        id v12 = v11;
        if (v11) {
          id v11 = (void *)v11[6];
        }
        if ([v11 isEqualToString:v5]) {
          break;
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:buf count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      id v12 = 0;
    }

    if (v12)
    {
      if (v2 && [*(id *)(v2 + 16) count])
      {
        id v13 = *(const void **)(a1 + 48);
        id v14 = *(void **)(v2 + 24);
      }
      else
      {
        id v13 = *(const void **)(a1 + 48);
        id v14 = (void *)v12[3];
      }
      id v15 = _Block_copy(v13);
      [v14 addObject:v15];

      goto LABEL_27;
    }
  }
  else
  {
  }
  if (v2 && [*(id *)(v2 + 16) count])
  {
    id v16 = *(void **)(v2 + 24);
    id v17 = _Block_copy(*(const void **)(a1 + 48));
    [v16 addObject:v17];

    [*(id *)(*(void *)(a1 + 32) + 104) setObject:v2 forKeyedSubscript:*(void *)(v2 + 56)];
    [*(id *)(*(void *)(a1 + 32) + 96) removeObjectForKey:*(void *)(a1 + 40)];
    _HKInitializeLogging();
    id v18 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "Beginning a new prompt session.", (uint8_t *)buf, 2u);
    }
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_428;
    v34[3] = &unk_1E62F5D48;
    v34[4] = *(void *)(a1 + 32);
    id v19 = (id)v2;
    uint64_t v35 = v19;
    uint64_t v20 = [v34 copy];
    uint64_t v21 = (void *)v19[5];
    v19[5] = v20;

    id v22 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_3;
    block[3] = &unk_1E62F3CA8;
    id v33 = *(id *)(a1 + 56);
    uint64_t v23 = v19;
    id v32 = v23;
    dispatch_async(v22, block);
    objc_initWeak(buf, v23);
    dispatch_time_t v24 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(a1 + 32) + 120) * 1000000000.0));
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_5;
    v29[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v30, buf);
    dispatch_after(v24, MEMORY[0x1E4F14428], v29);
    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);

    uint64_t v25 = v35;
  }
  else
  {
    uint64_t v26 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_6;
    v27[3] = &unk_1E62F2F20;
    id v28 = *(id *)(a1 + 48);
    dispatch_async(v26, v27);
    uint64_t v25 = v28;
  }

  id v12 = 0;
LABEL_27:
}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_428(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_2;
  v3[3] = &unk_1E62F31C0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  if (v1) {
    uint64_t v3 = *(void *)(v1 + 56);
  }
  else {
    uint64_t v3 = 0;
  }
  return [v2 removeObjectForKey:v3];
}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F2B2A0]) initForBundleIdentifier:v2[6] sessionIdentifier:v2[7]];
    id v4 = *(void **)(a1 + 32);
  }
  else
  {
    id v4 = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_4;
  v5[3] = &unk_1E62F2978;
  id v6 = v4;
  (*(void (**)(uint64_t, void *, void *))(v1 + 16))(v1, v2, v5);
}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0) {
    -[_HDObjectAuthorizationPromptSession endPromptTransactionWithSuccess:error:](*(void *)(a1 + 32), 0, a3);
  }
}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[32])
  {
    id v4 = WeakRetained;
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "Timed out waiting on prompt transaction to begin.", buf, 2u);
    }
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Timed out waiting for authorization transaction to begin.");
    -[_HDObjectAuthorizationPromptSession endPromptTransactionWithSuccess:error:]((uint64_t)v4, 0, v3);

    id WeakRetained = v4;
  }
}

uint64_t __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchAuthorizationContextForPromptSession:(id)a3 error:(id *)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  activeObjectPromptSessionsBySessionIdentifier = self->_activeObjectPromptSessionsBySessionIdentifier;
  id v63 = v6;
  uint64_t v8 = [v6 sessionIdentifier];
  uint64_t v9 = [(NSMutableDictionary *)activeObjectPromptSessionsBySessionIdentifier objectForKeyedSubscript:v8];

  id v64 = (id *)v9;
  if (!v9) {
    goto LABEL_57;
  }
  id v10 = *(id *)(v9 + 48);
  uint64_t v11 = [v63 bundleIdentifier];
  if (v10 == (id)v11)
  {

LABEL_7:
    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obuint64_t j = *(id *)(v9 + 16);
    uint64_t v68 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
    if (!v68)
    {
LABEL_53:

      id v56 = objc_alloc(MEMORY[0x1E4F2B2A8]);
      uint64_t v57 = [v64[2] firstObject];
      uint64_t v58 = (void *)v57;
      if (v57) {
        uint64_t v59 = *(void *)(v57 + 40);
      }
      else {
        uint64_t v59 = 0;
      }
      uint64_t v60 = (void *)[v56 initWithSamplesRequiringAuthorization:v67 metadata:v59];

      goto LABEL_62;
    }
    uint64_t v66 = *(void *)v75;
LABEL_9:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v75 != v66) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v74 + 1) + 8 * v18);
      if (!v19)
      {
        id v33 = 0;
        goto LABEL_49;
      }
      uint64_t v69 = v18;
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      uint64_t v70 = v19;
      id v72 = *(id *)(v19 + 48);
      uint64_t v21 = [v72 countByEnumeratingWithState:&v82 objects:v88 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v83 != v23) {
              objc_enumerationMutation(v72);
            }
            uint64_t v25 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            id v26 = objc_alloc(MEMORY[0x1E4F2B2B8]);
            id v27 = [v25 objectUUID];
            id v28 = [v25 sourceUUID];
            char v29 = [v25 sessionUUID];
            uint64_t v30 = [v25 status];
            [v25 modificationDate];
            uint64_t v31 = objc_msgSend(v26, "initWithObjectUUID:sourceUUID:sessionUUID:status:modificationDate:", v27, v28, v29, v30);

            id v32 = [v25 objectUUID];
            [v20 setObject:v31 forKeyedSubscript:v32];
          }
          uint64_t v22 = [v72 countByEnumeratingWithState:&v82 objects:v88 count:16];
        }
        while (v22);
      }

      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (!*(unsigned char *)(v70 + 8)) {
        break;
      }
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v73 = *(id *)(v70 + 32);
      uint64_t v34 = [v73 countByEnumeratingWithState:&v78 objects:v87 count:16];
      uint64_t v18 = v69;
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v79;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v79 != v36) {
              objc_enumerationMutation(v73);
            }
            long long v38 = *(void **)(*((void *)&v78 + 1) + 8 * j);
            long long v39 = [v38 UUID];
            uint64_t v40 = [v20 objectForKeyedSubscript:v39];
            if (v40)
            {
              [v33 setObject:v40 forKeyedSubscript:v38];
            }
            else
            {
              id v41 = objc_alloc_init(MEMORY[0x1E4F2B2B8]);
              [v33 setObject:v41 forKeyedSubscript:v38];
            }
          }
          uint64_t v35 = [v73 countByEnumeratingWithState:&v78 objects:v87 count:16];
        }
        while (v35);
      }
LABEL_48:

LABEL_49:
      [v67 addEntriesFromDictionary:v33];

      if (++v18 == v68)
      {
        uint64_t v55 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
        uint64_t v68 = v55;
        if (!v55) {
          goto LABEL_53;
        }
        goto LABEL_9;
      }
    }
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v73 = *(id *)(v70 + 32);
    uint64_t v42 = [v73 countByEnumeratingWithState:&v78 objects:v87 count:16];
    if (!v42) {
      goto LABEL_47;
    }
    uint64_t v43 = v42;
    uint64_t v71 = *(void *)v79;
LABEL_34:
    uint64_t v44 = 0;
    while (1)
    {
      if (*(void *)v79 != v71) {
        objc_enumerationMutation(v73);
      }
      BOOL v45 = *(void **)(*((void *)&v78 + 1) + 8 * v44);
      long long v46 = [v45 UUID];
      uint64_t v47 = [v20 objectForKeyedSubscript:v46];
      if (!v47) {
        break;
      }
      uint64_t v48 = (void *)v47;
      uint64_t v49 = [v45 UUID];
      uint64_t v50 = [v20 objectForKeyedSubscript:v49];
      uint64_t v51 = [v50 status];

      if (!v51) {
        goto LABEL_41;
      }
LABEL_45:
      if (v43 == ++v44)
      {
        uint64_t v43 = [v73 countByEnumeratingWithState:&v78 objects:v87 count:16];
        if (!v43)
        {
LABEL_47:
          uint64_t v18 = v69;
          goto LABEL_48;
        }
        goto LABEL_34;
      }
    }

LABEL_41:
    id v52 = [v45 UUID];
    id v53 = [v20 objectForKeyedSubscript:v52];
    if (v53)
    {
      [v33 setObject:v53 forKeyedSubscript:v45];
    }
    else
    {
      id v54 = objc_alloc_init(MEMORY[0x1E4F2B2B8]);
      [v33 setObject:v54 forKeyedSubscript:v45];
    }
    goto LABEL_45;
  }
  id v12 = (void *)v11;
  uint64_t v13 = [v63 bundleIdentifier];
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = v64[6];
    id v16 = [v63 bundleIdentifier];
    char v17 = [v15 isEqualToString:v16];

    uint64_t v9 = (uint64_t)v64;
    if ((v17 & 1) == 0) {
      goto LABEL_57;
    }
    goto LABEL_7;
  }

LABEL_57:
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Could not locate prompt session");
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    if (a4) {
      *a4 = v61;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v60 = 0;
LABEL_62:

  return v60;
}

- (int64_t)objectAuthorizationRecordForSource:(id)a3 objectUUID:(id)a4 resolveAssociations:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v14 = [WeakRetained database];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __98__HDAuthorizationManager_objectAuthorizationRecordForSource_objectUUID_resolveAssociations_error___block_invoke;
  v26[3] = &unk_1E6301698;
  id v15 = v11;
  BOOL v31 = a5;
  id v27 = v15;
  id v28 = self;
  id v16 = v10;
  id v29 = v16;
  id v17 = v12;
  id v30 = v17;
  LODWORD(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a6 block:v26];

  if (!a6) {
    goto LABEL_11;
  }
  if (([v17 containsObject:&unk_1F17ED368] & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F17ED380];
    if (v17 == (id)v19)
    {
    }
    else
    {
      id v20 = (void *)v19;
      uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F17ED380];
      if (!v21)
      {

LABEL_11:
        int64_t v18 = 0;
        goto LABEL_12;
      }
      uint64_t v22 = (void *)v21;
      uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F17ED380];
      int v24 = [v17 isEqualToSet:v23];

      if (!v24) {
        goto LABEL_11;
      }
    }
    int64_t v18 = 2;
    goto LABEL_12;
  }
  int64_t v18 = 1;
LABEL_12:

  return v18;
}

BOOL __98__HDAuthorizationManager_objectAuthorizationRecordForSource_objectUUID_resolveAssociations_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA80] setWithObject:*(void *)(a1 + 32)];
  if (*(unsigned char *)(v4 + 64))
  {
    uint64_t v6 = *(void *)(v4 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v4 + 40) + 48));
    uint64_t v8 = +[HDAssociationEntity associationUUIDsForObjectUUID:v6 subObjectReference:0 excludeDeleted:1 profile:WeakRetained error:a3];

    if (v8) {
      [v5 addObjectsFromArray:v8];
    }
  }
  uint64_t v9 = *(void **)(v4 + 48);
  id v10 = objc_loadWeakRetained((id *)(*(void *)(v4 + 40) + 48));
  id v11 = [v9 sourceUUIDWithProfile:v10 error:a3];

  if (v11)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    BOOL v31 = v5;
    id v12 = v5;
    uint64_t v32 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v32)
    {
      uint64_t v13 = *(void *)v34;
      id v14 = off_1E62F0000;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * v15);
          id v17 = v14[132];
          id v18 = objc_loadWeakRetained((id *)(*(void *)(v4 + 40) + 48));
          uint64_t v19 = [(__objc2_class *)v17 authorizationRecordsBySourceForSampleWithUUID:v16 profile:v18 error:a3];

          if (v19)
          {
            id v20 = [v19 objectForKeyedSubscript:v11];
            uint64_t v21 = v20;
            if (v20)
            {
              uint64_t v22 = [v20 status];
              if (v22)
              {
                uint64_t v23 = *(void **)(v4 + 56);
                [NSNumber numberWithInteger:v22];
                uint64_t v24 = v13;
                uint64_t v25 = v4;
                uint64_t v26 = a3;
                id v27 = v12;
                id v29 = v28 = v11;
                [v23 addObject:v29];

                id v11 = v28;
                id v12 = v27;
                a3 = v26;
                uint64_t v4 = v25;
                uint64_t v13 = v24;
                id v14 = off_1E62F0000;
              }
            }
          }
          ++v15;
        }
        while (v32 != v15);
        uint64_t v32 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v32);
    }

    id v5 = v31;
  }

  return v11 != 0;
}

- (void)performObjectAuthorizationForSource:(id)a3 samples:(id)a4 associatedWithSamplesOfType:(id)a5 completion:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, id))a6;
  location = (id *)&self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v44 = 0;
  uint64_t v15 = +[HDObjectAuthorizationEntity authorizationStatusForSamplesOfType:v12 sourceEntity:v10 profile:WeakRetained error:&v44];
  id v16 = v44;

  if (v15)
  {
    BOOL v31 = v13;
    id v32 = v12;
    long long v33 = v11;
    id v34 = v10;
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v30 = v15;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        uint64_t v21 = 0;
        uint64_t v22 = v16;
        do
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8 * v21);
          if ([v23 status] == 2)
          {
            uint64_t v24 = [v23 objectUUID];
            id v25 = objc_loadWeakRetained(location);
            id v39 = v22;
            uint64_t v26 = +[HDAssociationEntity objectUUIDsAssociatedWithObjectUUID:v24 subObjectReference:0 excludeDeleted:1 profile:v25 error:&v39];
            id v16 = v39;

            if (v26)
            {
              [v35 addObjectsFromArray:v26];
            }
            else
            {
              _HKInitializeLogging();
              id v27 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                long long v46 = v24;
                __int16 v47 = 2112;
                id v48 = v16;
                _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_INFO, "Error looking up samples associated with %@: %@", buf, 0x16u);
              }
            }

            uint64_t v22 = v16;
          }
          else
          {
            id v16 = v22;
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v19);
    }

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __109__HDAuthorizationManager_performObjectAuthorizationForSource_samples_associatedWithSamplesOfType_completion___block_invoke;
    v37[3] = &unk_1E62F78D8;
    id v38 = v35;
    id v28 = v35;
    id v11 = v33;
    id v29 = objc_msgSend(v33, "hk_filter:", v37);
    uint64_t v13 = v31;
    ((void (**)(id, void *, id))v31)[2](v31, v29, 0);

    id v10 = v34;
    id v12 = v32;
    uint64_t v15 = v30;
  }
  else
  {
    v13[2](v13, 0, v16);
  }
}

uint64_t __109__HDAuthorizationManager_performObjectAuthorizationForSource_samples_associatedWithSamplesOfType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)createRecalibrateEstimatesRequestRecordForSource:(id)a3 sampleType:(id)a4 effectiveDate:(id)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v15 = [WeakRetained sourceManager];
  id v25 = 0;
  id v16 = [v15 clientSourceForSourceEntity:v13 error:&v25];

  id v17 = v25;
  if (v16)
  {
    queue = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __108__HDAuthorizationManager_createRecalibrateEstimatesRequestRecordForSource_sampleType_effectiveDate_handler___block_invoke;
    v19[3] = &unk_1E6301620;
    id v20 = v16;
    uint64_t v21 = self;
    id v24 = v12;
    id v22 = v10;
    id v23 = v11;
    dispatch_async(queue, v19);
  }
  else
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v17);
  }
}

void __108__HDAuthorizationManager_createRecalibrateEstimatesRequestRecordForSource_sampleType_effectiveDate_handler___block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) bundleIdentifier];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "objectForKeyedSubscript:");
  uint64_t v2 = (void **)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (!-[HDAuthorizationManager _isRecalibrateEstimatesRequestSessionExpiredWithCreationDate:](*(void **)(a1 + 40), v2[2]))
    {
      uint64_t v11 = *(void *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"An active recalibrate estimates request session already exists.");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v7);
      goto LABEL_9;
    }
    [*(id *)(*(void *)(a1 + 40) + 112) setObject:0 forKeyedSubscript:v12];
  }
  id v3 = objc_alloc(MEMORY[0x1E4F2B400]);
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = (void *)[v3 initWithSessionIdentifier:v4 source:*(void *)(a1 + 32) sampleType:*(void *)(a1 + 48) effectiveDate:*(void *)(a1 + 56)];

  uint64_t v6 = [_HDRecalibrateEstimatesRequestSession alloc];
  id v7 = v5;
  if (v6)
  {
    v13.receiver = v6;
    v13.super_class = (Class)_HDRecalibrateEstimatesRequestSession;
    uint64_t v8 = (_HDRecalibrateEstimatesRequestSession *)objc_msgSendSuper2(&v13, sel_init);
    uint64_t v6 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_requestRecord, v5);
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      creationDate = v6->_creationDate;
      v6->_creationDate = (NSDate *)v9;
    }
  }

  [*(id *)(*(void *)(a1 + 40) + 112) setObject:v6 forKeyedSubscript:v12];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

LABEL_9:
}

- (void)_isRecalibrateEstimatesRequestSessionExpiredWithCreationDate:(void *)result
{
  if (result)
  {
    uint64_t v2 = result;
    id v3 = (void *)MEMORY[0x1E4F1C9C8];
    id v4 = a2;
    id v5 = [v3 date];
    [v2 requestSessionTimeout];
    uint64_t v6 = objc_msgSend(v4, "dateByAddingTimeInterval:");

    uint64_t v7 = objc_msgSend(v5, "hk_isAfterDate:", v6);
    return (void *)v7;
  }
  return result;
}

- (id)authorizationStatusForTypes:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  p_profile = &self->_profile;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  uint64_t v11 = +[HDAuthorizationStatus authorizationStatusForTypes:v9 bundleIdentifier:v8 profile:WeakRetained error:a5];

  return v11;
}

- (BOOL)isAuthorizedForObjectType:(id)a3 authorizationStatus:(id)a4 clientEntitlements:(id)a5 sharing:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v13)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDAuthorizationManager.m", 1439, @"Invalid parameter not satisfying: %@", @"authorizationStatus != nil" object file lineNumber description];
  }
  uint64_t v15 = [v13 integerValue];
  char v16 = HKAuthorizationStatusAllowsSharing();
  char v17 = HKAuthorizationStatusAllowsReading();
  uint64_t v18 = *MEMORY[0x1E4F2A958];
  id v28 = v12;
  uint64_t v19 = [v12 identifier];
  int v20 = [v14 arrayEntitlement:v18 containsString:v19];

  if ((unint64_t)(v15 - 101) < 4)
  {
    if (v7) {
      char v21 = v16;
    }
    else {
      char v21 = v17;
    }
    if (v21) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  if (v15 != 100)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HDAuthorizationManager.m", 1461, @"Unexpected authorization status %@", v13 object file lineNumber description];

LABEL_14:
    id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Not authorized");
    goto LABEL_15;
  }
  if (v7 || v20 != 1)
  {
    id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 5, @"Authorization is not determined");
LABEL_15:
    BOOL v22 = 0;
    *a7 = v23;
    goto LABEL_16;
  }
LABEL_8:
  BOOL v22 = 1;
LABEL_16:

  return v22;
}

- (void)validateRecalibrateEstimatesRequestRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HDAuthorizationManager_validateRecalibrateEstimatesRequestRecord_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __79__HDAuthorizationManager_validateRecalibrateEstimatesRequestRecord_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) source];
  id v9 = [v2 bundleIdentifier];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 112) objectForKeyedSubscript:v9];
  id v4 = (void **)v3;
  if (!v3 || ![*(id *)(v3 + 8) isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Recalibrate estimates request record validation failed.");
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v7);
    goto LABEL_6;
  }
  [*(id *)(*(void *)(a1 + 40) + 112) setObject:0 forKeyedSubscript:v9];
  unsigned int v5 = -[HDAuthorizationManager _isRecalibrateEstimatesRequestSessionExpiredWithCreationDate:](*(void **)(a1 + 40), v4[2]);
  uint64_t v6 = *(void *)(a1 + 48);
  if (v5)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Recalibrate estimates request session timed out.");
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
LABEL_6:

    goto LABEL_7;
  }
  (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, 1, 0);
LABEL_7:
}

- (id)diagnosticDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = self->_promptingRequestGroup;
  if (v4)
  {
    [v3 appendFormat:@"Prompting request group:"];
    [v3 appendFormat:@"\n%@\n\n", v4];
  }
  unsigned int v5 = (void *)[(NSMutableArray *)self->_pendingRequestGroups copy];
  if ([v5 count])
  {
    [v3 appendFormat:@"Pending request groups:"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(id **)(*((void *)&v16 + 1) + 8 * v10);
          id v12 = -[_HDAuthorizationRequestGroup bundleIdentifier](v11);
          if (v11) {
            uint64_t v13 = [v11[4] count];
          }
          else {
            uint64_t v13 = 0;
          }
          [v3 appendFormat:@"\n\"%@\" (%lu requests)", v12, v13, (void)v16];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v14 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v8 = v14;
      }
      while (v14);
    }

    [v3 appendFormat:@"\n\n"];
  }

  return v3;
}

- (id)_schemaProviderForType:(id)a3
{
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code"));
  unsigned int v5 = [(NSMutableDictionary *)self->_schemaProviderMap objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = objc_alloc_init(HDDefaultAuthorizationSchemaProvider);
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)unitTest_schemaProviderMap
{
  return self->_schemaProviderMap;
}

- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = objc_msgSend(v12, "hd_sampleType");
  long long v17 = [(HDAuthorizationManager *)self _schemaProviderForType:v16];

  if (objc_opt_respondsToSelector()) {
    int64_t v18 = [v17 isClientAuthorizedToReadObject:v12 sourceBundleIdentifier:v13 clientEntitlements:v14 profile:v15 error:a7];
  }
  else {
    int64_t v18 = 0;
  }

  return v18;
}

- (int64_t)isClientAuthorizedToReadType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = [(HDAuthorizationManager *)self _schemaProviderForType:v12];
  if (objc_opt_respondsToSelector()) {
    int64_t v17 = [v16 isClientAuthorizedToReadType:v12 sourceBundleIdentifier:v13 clientEntitlements:v14 profile:v15 error:a7];
  }
  else {
    int64_t v17 = 0;
  }

  return v17;
}

- (int64_t)isClientAuthorizedToWriteObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = objc_msgSend(v12, "hd_sampleType");
  int64_t v17 = [(HDAuthorizationManager *)self _schemaProviderForType:v16];

  if (objc_opt_respondsToSelector()) {
    int64_t v18 = [v17 isClientAuthorizedToWriteObject:v12 sourceBundleIdentifier:v13 clientEntitlements:v14 profile:v15 error:a7];
  }
  else {
    int64_t v18 = 0;
  }

  return v18;
}

- (int64_t)isClientAuthorizedToWriteType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = [(HDAuthorizationManager *)self _schemaProviderForType:v12];
  if (objc_opt_respondsToSelector()) {
    int64_t v17 = [v16 isClientAuthorizedToWriteType:v12 sourceBundleIdentifier:v13 clientEntitlements:v14 profile:v15 error:a7];
  }
  else {
    int64_t v17 = 0;
  }

  return v17;
}

- (BOOL)suppressAuthorizationPrompt
{
  return self->_suppressAuthorizationPrompt;
}

- (void)setSuppressAuthorizationPrompt:(BOOL)a3
{
  self->_suppressAuthorizationPrompt = a3;
}

- (double)requestSessionTimeout
{
  return self->_requestSessionTimeout;
}

- (void)setRequestSessionTimeout:(double)a3
{
  self->_requestSessionTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRecalibrateEstimatesRequestSessionsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activeObjectPromptSessionsBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingObjectAuthorizationRequestsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_promptingRequestGroup, 0);
  objc_storeStrong((id *)&self->_pendingRequestGroups, 0);
  objc_storeStrong((id *)&self->_requestGroupsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_schemaProviderMap, 0);
  objc_storeStrong((id *)&self->_remoteAuthorizationRecordsByBundleID, 0);
  objc_storeStrong((id *)&self->_openAppCompletionHandlersByBundleID, 0);

  objc_storeStrong((id *)&self->_observationQueue, 0);
}

- (id)_builtInSchemas
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_alloc_init(HDVisionPrescriptionAuthorizationSchemaProvider);
  unsigned int v5 = &unk_1F17EEC28;
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

@end