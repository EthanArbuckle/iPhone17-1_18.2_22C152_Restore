@interface C2SessionPool
- (BOOL)_cleanUp_job;
- (BOOL)_unsafe_isCreating:(id)a3;
- (BOOL)cleanUp_running;
- (BOOL)testBehavior_cleanUp;
- (BOOL)testBehavior_disableAutomaticCleanup;
- (C2RoutingTable)routingTable;
- (C2SessionPool)init;
- (C2SessionTLSCache)sessionTLSCache;
- (NSMapTable)useCountByObject;
- (NSMutableDictionary)sessionGroupForSessionConfigurationName;
- (OS_dispatch_queue)cleanUp_queue;
- (OS_dispatch_queue)sessionCreation_queue;
- (OS_dispatch_queue)underlyingDelegateQueue;
- (id)createDataTaskWithRequestIdentifer:(id)a3 request:(id)a4 options:(id)a5 delegate:(id)a6 sessionHandle:(id *)a7;
- (void)C2Session:(id)a3 originalHost:(id)a4 updatedRoute:(id)a5;
- (void)_cleanUpEmptySessionGroup_job_withThreshold:(unint64_t)a3;
- (void)_cleanUp_schedule;
- (void)_unsafe_didCreate:(id)a3;
- (void)_unsafe_removeSession:(id)a3;
- (void)_unsafe_removeSessionGroupIfEmpty:(id)a3;
- (void)_unsafe_willCreate:(id)a3;
- (void)ensureCleanUpRunning;
- (void)removeSession:(id)a3;
- (void)setCleanUp_queue:(id)a3;
- (void)setCleanUp_running:(BOOL)a3;
- (void)setRoutingTable:(id)a3;
- (void)setSessionCreation_queue:(id)a3;
- (void)setSessionGroupForSessionConfigurationName:(id)a3;
- (void)setSessionTLSCache:(id)a3;
- (void)setTestBehavior_disableAutomaticCleanup:(BOOL)a3;
- (void)setUnderlyingDelegateQueue:(id)a3;
- (void)setUseCountByObject:(id)a3;
- (void)testBehavior_cleanUpWithThreshold:(unint64_t)a3;
@end

@implementation C2SessionPool

uint64_t __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpEmptySessionGroup_job_withThreshold:", 3);
}

- (BOOL)_cleanUp_job
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v3)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"C2SessionPool.m", 270, @"cleanup allocation failure, crash." object file lineNumber description];
  }
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_cleanUp_running)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:v4 file:@"C2SessionPool.m" lineNumber:272 description:@"sanity check."];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = [(NSMutableDictionary *)v4->_sessionGroupForSessionConfigurationName allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [*(id *)(*((void *)&v30 + 1) + 8 * i) sessions];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        v15 = v4;
        objc_sync_enter(v15);
        if ([(C2SessionPool *)v15 _unsafe_isCreating:v14])
        {
          if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_106);
          }
          v16 = C2_DEFAULT_LOG_INTERNAL_7;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v35 = v14;
            _os_log_impl(&dword_1DD523000, v16, OS_LOG_TYPE_DEFAULT, "session (%{public}@) in use, not eligable for cleanup.", buf, 0xCu);
          }
        }
        else if ([v14 shouldInvalidateAndCancel])
        {
          [(C2SessionPool *)v15 _unsafe_removeSession:v14];
          objc_sync_exit(v15);

          [v14 invalidateAndCancel];
          goto LABEL_25;
        }
        objc_sync_exit(v15);

LABEL_25:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v11);
  }

  v17 = v4;
  objc_sync_enter(v17);
  sessionGroupForSessionConfigurationName = v4->_sessionGroupForSessionConfigurationName;
  if (!sessionGroupForSessionConfigurationName)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:v17 file:@"C2SessionPool.m" lineNumber:296 description:@"_sessionGroupForSessionConfigurationName must be initialized."];

    sessionGroupForSessionConfigurationName = v4->_sessionGroupForSessionConfigurationName;
  }
  uint64_t v19 = [(NSMutableDictionary *)sessionGroupForSessionConfigurationName count];
  if (!v19) {
    v4->_cleanUp_running = 0;
  }
  BOOL v20 = v19 != 0;
  objc_sync_exit(v17);

  return v20;
}

- (BOOL)_unsafe_isCreating:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:230 description:@"_unsafe_isCreating object cannot be nil"];
  }
  BOOL v6 = NSMapGet(self->_useCountByObject, v5) != 0;

  return v6;
}

- (OS_dispatch_queue)underlyingDelegateQueue
{
  return self->_underlyingDelegateQueue;
}

- (id)createDataTaskWithRequestIdentifer:(id)a3 request:(id)a4 options:(id)a5 delegate:(id)a6 sessionHandle:(id *)a7
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (C2SessionPool *)a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = v16;
  id v18 = 0;
  if (v13 && v14 && v15 && v16)
  {
    uint64_t v19 = [v14 URL];
    BOOL v20 = [v19 host];
    if (v20)
    {
      [v15 setOriginalHost:v20];
      id v18 = (id)[v15 copyAndDecorateRequest:v14];

      id v54 = v18;
      if (v18)
      {
        if (![v15 allowRouting])
        {
          id v18 = v20;
          v21 = 0;
          goto LABEL_14;
        }
        id v14 = [(C2RoutingTable *)self->_routingTable copyAndDecorateRequest:v18];

        if (v14)
        {
          v52 = [v14 URL];
          id v18 = [v52 host];
          if (!v18)
          {
LABEL_59:

            goto LABEL_60;
          }
          id v54 = v14;
          v21 = v52;
LABEL_14:
          v52 = v21;
          if (v21) {
            v22 = v21;
          }
          else {
            v22 = v19;
          }
          [v15 setInvokedURL:v22];
          v49 = v18;
          v50 = [v15 sessionConfigurationNameWithRouteHost:v18];
          v23 = v50;
          if (!v50)
          {
            id v18 = 0;
LABEL_58:

            id v14 = v54;
            goto LABEL_59;
          }
          uint64_t v64 = 0;
          v65 = &v64;
          uint64_t v66 = 0x3032000000;
          v67 = __Block_byref_object_copy_;
          v68 = __Block_byref_object_dispose_;
          id v69 = 0;
          v24 = self;
          objc_sync_enter(v24);
          obj = v24;
          v53 = [(NSMutableDictionary *)v24->_sessionGroupForSessionConfigurationName objectForKeyedSubscript:v50];
          if (!v53)
          {
            v53 = [[C2SessionGroup alloc] initWithConfigurationName:v50];
            if (!v53)
            {
              if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
                dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_27_0);
              }
              v44 = C2_DEFAULT_LOG_INTERNAL_7;
              if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v76) = 138543362;
                *(void *)((char *)&v76 + 4) = obj;
                _os_log_impl(&dword_1DD523000, v44, OS_LOG_TYPE_ERROR, "%{public}@ can't create a new session group", (uint8_t *)&v76, 0xCu);
              }
              objc_sync_exit(obj);

              v53 = 0;
              id v18 = 0;
              goto LABEL_57;
            }
            [(NSMutableDictionary *)v24->_sessionGroupForSessionConfigurationName setObject:v53 forKeyedSubscript:v50];
          }
          v25 = [(C2SessionGroup *)v53 configurationName];
          char v26 = [v25 isEqual:v50];

          if ((v26 & 1) == 0)
          {
            v46 = [MEMORY[0x1E4F28B00] currentHandler];
            v47 = [(C2SessionGroup *)v53 configurationName];
            [v46 handleFailureInMethod:a2, obj, @"C2SessionPool.m", 117, @"Expected session group with configurationName (%@) but found (%@)", v50, v47 object file lineNumber description];
          }
          uint64_t v27 = [(C2SessionGroup *)v53 sessionForOptions:v15];
          long long v28 = (void *)v65[5];
          v65[5] = v27;

          if (v65[5])
          {
            -[C2SessionPool _unsafe_willCreate:](obj, "_unsafe_willCreate:");
            if ([(C2SessionPool *)obj _unsafe_isCreating:v65[5]]) {
              goto LABEL_29;
            }
            long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
            [v29 handleFailureInMethod:a2 object:obj file:@"C2SessionPool.m" lineNumber:121 description:@"Expected session to be outstanding."];
          }
          else
          {
            [(C2SessionPool *)obj _unsafe_willCreate:v53];
            if ([(C2SessionPool *)obj _unsafe_isCreating:v53]) {
              goto LABEL_29;
            }
            long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
            [v29 handleFailureInMethod:a2 object:obj file:@"C2SessionPool.m" lineNumber:124 description:@"Expected session group to be outstanding."];
          }

LABEL_29:
          objc_sync_exit(obj);

          long long v30 = objc_msgSend(v15, "testBehavior_sessionGroupCreated");

          if (v30)
          {
            objc_msgSend(v15, "testBehavior_sessionGroupCreated");
            long long v31 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v31[2]();
          }
          *(void *)&long long v76 = 0;
          *((void *)&v76 + 1) = &v76;
          uint64_t v77 = 0x2020000000;
          long long v32 = (void *)v65[5];
          BOOL v78 = v32 != 0;
          if (!v32)
          {
            cleanUp_queue = obj->_cleanUp_queue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_41;
            block[3] = &unk_1E6CCBF00;
            block[4] = obj;
            dispatch_async(cleanUp_queue, block);
            queue = obj->_sessionCreation_queue;
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_2;
            v55[3] = &unk_1E6CCC750;
            v55[4] = obj;
            v56 = v53;
            v34 = v50;
            SEL v62 = a2;
            v57 = v34;
            v60 = &v64;
            id v58 = v15;
            v61 = &v76;
            id v59 = v49;
            dispatch_sync(queue, v55);

            long long v32 = (void *)v65[5];
            if (!v32)
            {
              if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
                dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_50_0);
              }
              v45 = C2_DEFAULT_LOG_INTERNAL_7;
              if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v71 = obj;
                __int16 v72 = 2114;
                v73 = v34;
                _os_log_impl(&dword_1DD523000, v45, OS_LOG_TYPE_ERROR, "%{public}@ can't create a new session with name: %{public}@", buf, 0x16u);
              }
              id v18 = 0;
              goto LABEL_56;
            }
          }
          v35 = [v32 createTaskWithOptions:v15 delegate:v17];
          if (v35)
          {
            id v18 = [(id)v65[5] addTask:v35 withDescription:v13 request:v54];
            if (v18)
            {
              char v36 = 0;
LABEL_45:
              v39 = obj;
              objc_sync_enter(v39);
              [(C2SessionPool *)v39 _unsafe_didCreate:v65[5]];
              objc_sync_exit(v39);

              if ((v36 & 1) == 0)
              {
                id v40 = (id)[v15 decorateTask:v18];
                [(C2SessionPool *)v39 ensureCleanUpRunning];
                if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
                  dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_59_1);
                }
                v41 = C2_DEFAULT_LOG_INTERNAL_7;
                if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
                {
                  if (*(unsigned char *)(*((void *)&v76 + 1) + 24)) {
                    v42 = @"T";
                  }
                  else {
                    v42 = @"F";
                  }
                  *(_DWORD *)buf = 138543874;
                  v71 = v13;
                  __int16 v72 = 2114;
                  v73 = v42;
                  __int16 v74 = 2114;
                  v75 = v50;
                  _os_log_impl(&dword_1DD523000, v41, OS_LOG_TYPE_DEFAULT, "created task (%{public}@). nsurlsessionCached (%{public}@). configurationName (%{public}@).", buf, 0x20u);
                }
                if (a7)
                {
                  *a7 = [(id)v65[5] session];
                }
              }

LABEL_56:
              _Block_object_dispose(&v76, 8);
LABEL_57:
              _Block_object_dispose(&v64, 8);

              v23 = v50;
              goto LABEL_58;
            }
          }
          else
          {
            if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
              dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_53_0);
            }
            v37 = C2_DEFAULT_LOG_INTERNAL_7;
            if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v71 = obj;
              _os_log_impl(&dword_1DD523000, v37, OS_LOG_TYPE_ERROR, "%{public}@ failed to create task", buf, 0xCu);
            }
          }
          if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_56_1);
          }
          uint64_t v38 = C2_DEFAULT_LOG_INTERNAL_7;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v71 = obj;
            _os_log_impl(&dword_1DD523000, v38, OS_LOG_TYPE_ERROR, "%{public}@ failed to add task", buf, 0xCu);
          }
          [v35 invalidate];

          id v18 = 0;
          v35 = 0;
          char v36 = 1;
          goto LABEL_45;
        }
        id v18 = 0;
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
LABEL_60:
  }
  return v18;
}

- (void)_unsafe_willCreate:(id)a3
{
  id v5 = a3;
  key = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:211 description:@"_unsafe_willCreate object cannot be nil"];

    id v5 = 0;
  }
  BOOL v6 = (char *)NSMapGet(self->_useCountByObject, v5);
  NSMapInsert(self->_useCountByObject, key, v6 + 1);
}

- (void)_unsafe_didCreate:(id)a3
{
  id v5 = a3;
  key = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:218 description:@"_unsafe_didCreate object cannot be nil"];

    id v5 = 0;
  }
  BOOL v6 = (char *)NSMapGet(self->_useCountByObject, v5);
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:220 description:@"_unsafe_didCreate invariant broken"];
  }
  useCountByObject = self->_useCountByObject;
  if (v6 == (char *)1) {
    NSMapRemove(useCountByObject, key);
  }
  else {
    NSMapInsert(useCountByObject, key, v6 - 1);
  }
}

void __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (v2 != v3)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = *(void *)(a1 + 88);
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 40);
    v25 = [*(id *)(v23 + 64) objectForKeyedSubscript:*(void *)(a1 + 48)];
    [v21 handleFailureInMethod:v22, v23, @"C2SessionPool.m", 141, @"Expected session group (%@) but found (%@).", v24, v25 object file lineNumber description];
  }
  uint64_t v4 = [*(id *)(a1 + 40) sessionForOptions:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_unsafe_didCreate:", *(void *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_unsafe_willCreate:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    if ((objc_msgSend(*(id *)(a1 + 32), "_unsafe_isCreating:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) & 1) == 0)
    {
      char v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 32) file:@"C2SessionPool.m" lineNumber:147 description:@"Expected session to be outstanding."];
    }
  }
  objc_sync_exit(obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v7 = [[C2Session alloc] initWithSessionConfigurationName:*(void *)(a1 + 48) routeHost:*(void *)(a1 + 64) options:*(void *)(a1 + 56) sessionDelegate:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v10 = [*(id *)(a1 + 56) useNWLoaderOverride];
      if (!v10
        || (uint64_t v11 = (void *)v10,
            [*(id *)(a1 + 56) useNWLoaderOverride],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            char v13 = [v12 BOOLValue],
            v12,
            v11,
            (v13 & 1) == 0))
      {
        id v14 = [*(id *)(a1 + 32) sessionTLSCache];
        id v15 = [v14 sessionForOptions:*(void *)(a1 + 56)];

        if (v15)
        {
          id v16 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) session];
          [v16 _useTLSSessionCacheFromSession:v15];
        }
      }
      id obja = *(id *)(a1 + 32);
      objc_sync_enter(obja);
      v17 = *(void **)(a1 + 40);
      id v18 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 48)];

      if (v17 != v18)
      {
        uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v28 = *(void *)(a1 + 88);
        uint64_t v29 = *(void *)(a1 + 32);
        uint64_t v30 = *(void *)(a1 + 40);
        long long v31 = [*(id *)(v29 + 64) objectForKeyedSubscript:*(void *)(a1 + 48)];
        [v27 handleFailureInMethod:v28, v29, @"C2SessionPool.m", 160, @"Expected session group (%@) but found (%@).", v30, v31 object file lineNumber description];
      }
      uint64_t v19 = [*(id *)(a1 + 40) sessionForOptions:*(void *)(a1 + 56)];

      if (v19)
      {
        long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v33 = *(void *)(a1 + 88);
        uint64_t v34 = *(void *)(a1 + 32);
        v35 = [*(id *)(a1 + 40) sessionForOptions:*(void *)(a1 + 56)];
        [v32 handleFailureInMethod:v33, v34, @"C2SessionPool.m", 161, @"Expected nil session but found (%@).", v35 object file lineNumber description];
      }
      [*(id *)(a1 + 40) setSession:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forOptions:*(void *)(a1 + 56)];
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_didCreate:", *(void *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_willCreate:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      if ((objc_msgSend(*(id *)(a1 + 32), "_unsafe_isCreating:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) & 1) == 0)
      {
        BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 32) file:@"C2SessionPool.m" lineNumber:165 description:@"Expected session to be outstanding."];
      }
    }
    else
    {
      id obja = *(id *)(a1 + 32);
      objc_sync_enter(obja);
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_didCreate:", *(void *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_removeSessionGroupIfEmpty:", *(void *)(a1 + 40));
    }
    objc_sync_exit(obja);
  }
}

- (C2SessionTLSCache)sessionTLSCache
{
  return self->_sessionTLSCache;
}

- (void)ensureCleanUpRunning
{
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_cleanUp_running)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_cleanUp_running = 1;
    objc_sync_exit(obj);

    if (!obj->_testBehavior_disableAutomaticCleanup)
    {
      [(C2SessionPool *)obj _cleanUp_schedule];
    }
  }
}

- (void)_cleanUp_schedule
{
  id v3 = _os_activity_create(&dword_1DD523000, "c2-session-pool-cleanup", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  dispatch_time_t v4 = dispatch_time(0, 60000000000);
  cleanUp_queue = self->_cleanUp_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__C2SessionPool__cleanUp_schedule__block_invoke;
  block[3] = &unk_1E6CCBF00;
  block[4] = self;
  dispatch_after(v4, cleanUp_queue, block);
  os_activity_scope_leave(&state);
}

- (void)_unsafe_removeSessionGroupIfEmpty:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(C2SessionPool *)self _unsafe_isCreating:v5])
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_82);
    }
    BOOL v6 = C2_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      _os_log_impl(&dword_1DD523000, v6, OS_LOG_TYPE_DEFAULT, "session group (%{public}@) in use, not eligable for cleanup.", buf, 0xCu);
    }
  }
  else if ([v5 isEmpty])
  {
    sessionGroupForSessionConfigurationName = self->_sessionGroupForSessionConfigurationName;
    uint64_t v8 = [v5 configurationName];
    [(NSMutableDictionary *)sessionGroupForSessionConfigurationName setObject:0 forKeyedSubscript:v8];

    v9 = self->_sessionGroupForSessionConfigurationName;
    uint64_t v10 = [v5 configurationName];
    uint64_t v11 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      char v13 = [v5 configurationName];
      [v12 handleFailureInMethod:a2, self, @"C2SessionPool.m", 238, @"sessionIdentifer(%@) should no longer be present", v13 object file lineNumber description];
    }
  }
}

- (void)_unsafe_removeSession:(id)a3
{
  id v5 = a3;
  id v14 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:246 description:@"session should not be nil"];

    id v5 = 0;
  }
  BOOL v6 = [v5 sessionConfigurationName];
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:248 description:@"sessionIdentifier should not be nil"];
  }
  sessionGroupForSessionConfigurationName = self->_sessionGroupForSessionConfigurationName;
  if (!sessionGroupForSessionConfigurationName)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:249 description:@"_sessionGroupForSessionConfigurationName must be initialized."];

    sessionGroupForSessionConfigurationName = self->_sessionGroupForSessionConfigurationName;
  }
  uint64_t v8 = [(NSMutableDictionary *)sessionGroupForSessionConfigurationName objectForKeyedSubscript:v6];
  if (([v8 removeSession:v14] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"C2SessionPool.m", 252, @"Could not identify session (%@) in sessionGroup (%@)", v14, v8 object file lineNumber description];
  }
  if ([v8 removeSession:v14])
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"C2SessionPool.m", 254, @"Session (%@) still in sessionGroup (%@)", v14, v8 object file lineNumber description];
  }
  [(C2SessionPool *)self _unsafe_removeSessionGroupIfEmpty:v8];
}

- (void)_cleanUpEmptySessionGroup_job_withThreshold:(unint64_t)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:311 description:@"Sanity check. Threshold should be positive."];
  }
  id v5 = self;
  objc_sync_enter(v5);
  unint64_t v6 = [(NSMutableDictionary *)v5->_sessionGroupForSessionConfigurationName count];
  objc_sync_exit(v5);
  uint64_t v33 = v5;

  if (v6 > a3)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v7)
    {
      long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, v5, @"C2SessionPool.m", 320, @"cleanup allocation failure, crash." object file lineNumber description];
    }
    id obj = v5;
    objc_sync_enter(obj);
    unint64_t v34 = [(NSMutableDictionary *)v5->_sessionGroupForSessionConfigurationName count];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = [(NSMutableDictionary *)v5->_sessionGroupForSessionConfigurationName allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          char v13 = [v12 sessions];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v52 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v38 != v15) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * j);
                if (v17 && [*(id *)(*((void *)&v37 + 1) + 8 * j) emptyTimestamp] != -1) {
                  [v7 addObject:v17];
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v52 count:16];
            }
            while (v14);
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v9);
    }

    objc_sync_exit(obj);
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"emptyTimestamp" ascending:1];
    v51 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    BOOL v20 = [v7 sortedArrayUsingDescriptors:v19];

    if (v34 > a3)
    {
      unint64_t v22 = 0;
      uint64_t v23 = 0;
      *(void *)&long long v21 = 138543362;
      long long v32 = v21;
      while (1)
      {
        if (v22 >= objc_msgSend(v20, "count", v32)) {
          goto LABEL_35;
        }
        uint64_t v24 = [v20 objectAtIndexedSubscript:v22];
        v25 = obj;
        objc_sync_enter(v25);
        if ([(C2SessionPool *)v25 _unsafe_isCreating:v24]) {
          break;
        }
        if (![(C2SessionPool *)v24 shouldRemoveEmptySession]) {
          goto LABEL_33;
        }
        [(C2SessionPool *)v25 _unsafe_removeSession:v24];
        objc_sync_exit(v25);

        [(C2SessionPool *)v24 invalidateAndCancel];
        ++v23;
LABEL_34:

        ++v22;
        if (v34 - v23 <= a3) {
          goto LABEL_35;
        }
      }
      if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_116);
      }
      char v26 = C2_DEFAULT_LOG_INTERNAL_7;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v32;
        v46 = v24;
        _os_log_impl(&dword_1DD523000, v26, OS_LOG_TYPE_DEFAULT, "session (%{public}@) in use, not eligable for cleanup.", buf, 0xCu);
      }
LABEL_33:
      objc_sync_exit(v25);

      goto LABEL_34;
    }
LABEL_35:
    uint64_t v27 = obj;
    objc_sync_enter(v27);
    if ([(NSMutableDictionary *)v33->_sessionGroupForSessionConfigurationName count] > a3)
    {
      if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_119);
      }
      uint64_t v28 = (id)C2_DEFAULT_LOG_INTERNAL_7;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = [(NSMutableDictionary *)v33->_sessionGroupForSessionConfigurationName count];
        *(_DWORD *)buf = 138543874;
        v46 = v27;
        __int16 v47 = 2048;
        unint64_t v48 = a3;
        __int16 v49 = 2048;
        uint64_t v50 = v29;
        _os_log_impl(&dword_1DD523000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ was unable to restrict number of C2SessionGroups to threshold of %llu. Current session group count is %llu.", buf, 0x20u);
      }
    }
    objc_sync_exit(v27);
  }
}

uint64_t __34__C2SessionPool__cleanUp_schedule__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_cleanUp_job");
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_cleanUp_schedule");
  }
  return result;
}

- (C2SessionPool)init
{
  v25.receiver = self;
  v25.super_class = (Class)C2SessionPool;
  v2 = [(C2SessionPool *)&v25 init];
  if (!v2) {
    goto LABEL_27;
  }
  id v3 = objc_alloc_init(C2RoutingTable);
  routingTable = v2->_routingTable;
  v2->_routingTable = v3;

  if (!v2->_routingTable)
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_13);
    }
    BOOL v20 = C2_DEFAULT_LOG_INTERNAL_7;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)uint64_t v24 = 0;
    long long v21 = "failed to create C2RoutingTable for C2SessionPool";
    goto LABEL_26;
  }
  id v5 = objc_alloc_init(C2SessionTLSCache);
  sessionTLSCache = v2->_sessionTLSCache;
  v2->_sessionTLSCache = v5;

  if (!v2->_sessionTLSCache)
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_7);
    }
    BOOL v20 = C2_DEFAULT_LOG_INTERNAL_7;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)uint64_t v24 = 0;
    long long v21 = "failed to create C2SessionTLSCache for C2SessionPool";
    goto LABEL_26;
  }
  id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sessionGroupForSessionConfigurationName = v2->_sessionGroupForSessionConfigurationName;
  v2->_sessionGroupForSessionConfigurationName = v7;

  if (!v2->_sessionGroupForSessionConfigurationName)
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_11_1);
    }
    BOOL v20 = C2_DEFAULT_LOG_INTERNAL_7;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)uint64_t v24 = 0;
    long long v21 = "failed to create NSMutableDictionary for C2SessionPool";
    goto LABEL_26;
  }
  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("c2-session-pool-cleanup", v9);
  cleanUp_queue = v2->_cleanUp_queue;
  v2->_cleanUp_queue = (OS_dispatch_queue *)v10;

  uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("c2-session-creation", v12);
  sessionCreation_queue = v2->_sessionCreation_queue;
  v2->_sessionCreation_queue = (OS_dispatch_queue *)v13;

  uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v16 = dispatch_queue_create("c2-delegate", v15);
  underlyingDelegateQueue = v2->_underlyingDelegateQueue;
  v2->_underlyingDelegateQueue = (OS_dispatch_queue *)v16;

  if (!v2->_underlyingDelegateQueue || !v2->_sessionCreation_queue || !v2->_cleanUp_queue)
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_17_1);
    }
    BOOL v20 = C2_DEFAULT_LOG_INTERNAL_7;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)uint64_t v24 = 0;
    long long v21 = "failed to create dispatch_queue for C2SessionPool";
    goto LABEL_26;
  }
  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:1282 capacity:0];
  useCountByObject = v2->_useCountByObject;
  v2->_useCountByObject = (NSMapTable *)v18;

  if (v2->_useCountByObject)
  {
    v2->_testBehavior_disableAutomaticCleanup = 0;
    return v2;
  }
  if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_21_1);
  }
  BOOL v20 = C2_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v24 = 0;
    long long v21 = "failed to create NSMapTable for C2SessionPool";
LABEL_26:
    _os_log_impl(&dword_1DD523000, v20, OS_LOG_TYPE_ERROR, v21, v24, 2u);
  }
LABEL_27:
  if (C2_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_24);
  }
  unint64_t v22 = C2_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_1DD523000, v22, OS_LOG_TYPE_ERROR, "failed to create C2SessionPool", v24, 2u);
  }

  return 0;
}

uint64_t __21__C2SessionPool_init__block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __21__C2SessionPool_init__block_invoke_5()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __21__C2SessionPool_init__block_invoke_9()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __21__C2SessionPool_init__block_invoke_15()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __21__C2SessionPool_init__block_invoke_19()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __21__C2SessionPool_init__block_invoke_22()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_3()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_51()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_54()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_57()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __51__C2SessionPool__unsafe_removeSessionGroupIfEmpty___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)removeSession:(id)a3
{
  id v5 = a3;
  dispatch_time_t v4 = self;
  objc_sync_enter(v4);
  [(C2SessionPool *)v4 _unsafe_removeSession:v5];
  objc_sync_exit(v4);
}

uint64_t __29__C2SessionPool__cleanUp_job__block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __61__C2SessionPool__cleanUpEmptySessionGroup_job_withThreshold___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __61__C2SessionPool__cleanUpEmptySessionGroup_job_withThreshold___block_invoke_117()
{
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (BOOL)testBehavior_cleanUp
{
  dispatch_time_t v4 = (void *)MEMORY[0x1E01B8AF0]();
  if (!self->_testBehavior_disableAutomaticCleanup)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:395 description:@"Testing invariant."];
  }
  id v5 = self;
  objc_sync_enter(v5);
  v5->_cleanUp_running = 1;
  objc_sync_exit(v5);

  LOBYTE(v5) = [(C2SessionPool *)v5 _cleanUp_job];
  return (char)v5;
}

- (void)testBehavior_cleanUpWithThreshold:(unint64_t)a3
{
  unint64_t v6 = (void *)MEMORY[0x1E01B8AF0]();
  if (!self->_testBehavior_disableAutomaticCleanup)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"C2SessionPool.m" lineNumber:413 description:@"Testing invariant."];
  }
  [(C2SessionPool *)self _cleanUpEmptySessionGroup_job_withThreshold:a3];
}

- (void)C2Session:(id)a3 originalHost:(id)a4 updatedRoute:(id)a5
{
}

- (void)setUnderlyingDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)sessionCreation_queue
{
  return self->_sessionCreation_queue;
}

- (void)setSessionCreation_queue:(id)a3
{
}

- (OS_dispatch_queue)cleanUp_queue
{
  return self->_cleanUp_queue;
}

- (void)setCleanUp_queue:(id)a3
{
}

- (BOOL)cleanUp_running
{
  return self->_cleanUp_running;
}

- (void)setCleanUp_running:(BOOL)a3
{
  self->_cleanUp_running = a3;
}

- (C2RoutingTable)routingTable
{
  return self->_routingTable;
}

- (void)setRoutingTable:(id)a3
{
}

- (void)setSessionTLSCache:(id)a3
{
}

- (NSMapTable)useCountByObject
{
  return self->_useCountByObject;
}

- (void)setUseCountByObject:(id)a3
{
}

- (NSMutableDictionary)sessionGroupForSessionConfigurationName
{
  return self->_sessionGroupForSessionConfigurationName;
}

- (void)setSessionGroupForSessionConfigurationName:(id)a3
{
}

- (BOOL)testBehavior_disableAutomaticCleanup
{
  return self->_testBehavior_disableAutomaticCleanup;
}

- (void)setTestBehavior_disableAutomaticCleanup:(BOOL)a3
{
  self->_testBehavior_disableAutomaticCleanup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionGroupForSessionConfigurationName, 0);
  objc_storeStrong((id *)&self->_useCountByObject, 0);
  objc_storeStrong((id *)&self->_sessionTLSCache, 0);
  objc_storeStrong((id *)&self->_routingTable, 0);
  objc_storeStrong((id *)&self->_cleanUp_queue, 0);
  objc_storeStrong((id *)&self->_sessionCreation_queue, 0);
  objc_storeStrong((id *)&self->_underlyingDelegateQueue, 0);
}

@end