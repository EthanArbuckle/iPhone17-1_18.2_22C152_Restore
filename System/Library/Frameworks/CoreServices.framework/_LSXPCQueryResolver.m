@interface _LSXPCQueryResolver
- (_LSXPCQueryResolver)init;
- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (id)resolveExpensiveRemoteQueriesInSet:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (id)resolveWhatWeCanLocallyWithQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (void)_enumerateResolvedResultsOfQuery:(id)a3 XPCConnection:(id)a4 withBlock:(id)a5;
@end

@implementation _LSXPCQueryResolver

- (_LSXPCQueryResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_LSXPCQueryResolver;
  v2 = [(_LSXPCQueryResolver *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_LSLocalQueryResolver);
    localResolver = v2->_localResolver;
    v2->_localResolver = v3;
  }
  return v2;
}

- (id)resolveWhatWeCanLocallyWithQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"LSQueryContext.mm" lineNumber:338 description:@"Hit the client-side query resolution codepath from within lsd! This is a serious bug! Please file a radar against Launch Services."];
  }
  v11 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v16 _canResolveLocallyWithoutMappingDatabase]) {
          [v11 addObject:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  if ([v11 count])
  {
    localResolver = self->_localResolver;
    id v23 = 0;
    v18 = [(_LSLocalQueryResolver *)localResolver _resolveQueries:v11 XPCConnection:v10 error:&v23];
    id v19 = v23;
    id v20 = v19;
    if (a5 && !v18)
    {
      id v20 = v19;
      v18 = 0;
      *a5 = v20;
    }
  }
  else
  {
    id v20 = 0;
    v18 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v18;
}

- (id)resolveExpensiveRemoteQueriesInSet:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"LSQueryContext.mm" lineNumber:372 description:@"Hit the client-side remote-expensive query resolution codepath from within lsd! This is a serious bug! Please file a radar against Launch Services."];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v19;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v9)
  {
    char v10 = 0;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v13 _remoteResolutionIsExpensive])
        {
          if ((v10 & 1) == 0) {
            __LAUNCH_SERVICES_IS_FAULTING_BECAUSE_THIS_PROCESS_IS_USING_VERY_EXPENSIVE_SPI__();
          }
          id v20 = 0;
          uint64_t v14 = [v13 resolveExpensiveQueryRemotelyUsingResolver:self error:&v20];
          id v15 = v20;
          if (v14)
          {
            [v7 setObject:v14 forKeyedSubscript:v13];
          }
          else
          {
            v16 = _LSDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v26 = v15;
              _os_log_fault_impl(&dword_182959000, v16, OS_LOG_TYPE_FAULT, "Could not resolve expensive query remotely! This may lead to lsd jetsams! %@", buf, 0xCu);
            }
          }
          char v10 = 1;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v50 = 0;
  v51 = (id *)&v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__44;
  v54 = __Block_byref_object_dispose__44;
  id v55 = 0;
  uint64_t v47 = 0;
  v48[0] = &v47;
  v48[1] = 0x3032000000;
  v48[2] = __Block_byref_object_copy__44;
  v48[3] = __Block_byref_object_dispose__44;
  id v49 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v43 + 1) + 8 * i) isLegacy])
        {
          char v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v58 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  char v14 = 0;
LABEL_11:

  id v15 = (id *)(v48[0] + 40);
  id obj = *(id *)(v48[0] + 40);
  uint64_t v16 = [(_LSXPCQueryResolver *)self resolveWhatWeCanLocallyWithQueries:v10 XPCConnection:v9 error:&obj];
  objc_storeStrong(v15, obj);
  id v17 = v51[5];
  v51[5] = (id)v16;

  id v18 = v51[5];
  if (v18)
  {
    id v19 = (void *)[v10 mutableCopy];
    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    long long v21 = [v51[5] allKeys];
    long long v22 = [v20 setWithArray:v21];
    [v19 minusSet:v22];

    if ([v19 count])
    {
      long long v23 = (id *)(v48[0] + 40);
      id v41 = *(id *)(v48[0] + 40);
      long long v24 = [(_LSXPCQueryResolver *)self resolveExpensiveRemoteQueriesInSet:v19 XPCConnection:v9 error:&v41];
      objc_storeStrong(v23, v41);
      if (v24)
      {
        long long v25 = (void *)[v51[5] mutableCopy];
        [v25 addEntriesFromDictionary:v24];
        objc_storeStrong(v51 + 5, v25);
        id v26 = (void *)MEMORY[0x1E4F1CAD0];
        long long v27 = [v24 allKeys];
        uint64_t v28 = [v26 setWithArray:v27];
        [v19 minusSet:v28];
      }
    }
    if ([v19 count])
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke;
      v36[3] = &unk_1E5230500;
      v38 = &v47;
      char v40 = v14;
      id v37 = v19;
      v39 = &v50;
      uint64_t v29 = (void (**)(void))MEMORY[0x18530F950](v36);
      int v30 = 0;
      while (1)
      {
        v29[2](v29);
        if (!_LSNSErrorIsXPCConnectionInterrupted(*(void **)(v48[0] + 40))) {
          break;
        }
        v31 = _LSDefaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[_LSXPCQueryResolver _resolveQueries:XPCConnection:error:](buf, (uint64_t)v48, &v57, v31);
        }

        v32 = *(void **)(v48[0] + 40);
        *(void *)(v48[0] + 40) = 0;

        if (++v30 == 5) {
          goto LABEL_27;
        }
      }
      if (v30)
      {
        v33 = _LSDefaultLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[_LSXPCQueryResolver _resolveQueries:XPCConnection:error:](v30, v33);
        }
      }
LABEL_27:
    }
    id v18 = v51[5];
  }
  if (a5 && !v18)
  {
    *a5 = *(id *)(v48[0] + 40);
    id v18 = v51[5];
  }
  id v34 = v18;
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v50, 8);

  return v34;
}

- (void)_enumerateResolvedResultsOfQuery:(id)a3 XPCConnection:(id)a4 withBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v18 = 0;
  uint64_t v11 = [(_LSXPCQueryResolver *)self _resolveQueries:v10 XPCConnection:v8 error:&v18];
  id v12 = v18;

  if (v11)
  {
    uint64_t v13 = [v11 allValues];
    char v14 = [v13 firstObject];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80___LSXPCQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke;
    v16[3] = &unk_1E5230528;
    id v17 = v9;
    [v14 enumerateObjectsUsingBlock:v16];
  }
  else
  {
    char v15 = 0;
    (*((void (**)(id, void, id, char *))v9 + 2))(v9, 0, v12, &v15);
  }
}

- (void).cxx_destruct
{
}

- (void)_resolveQueries:(void *)a3 XPCConnection:(os_log_t)log error:.cold.1(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138543362;
  *a3 = v4;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Re-trying failed xpc message to lsd: %{public}@", buf, 0xCu);
}

- (void)_resolveQueries:(int)a1 XPCConnection:(NSObject *)a2 error:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "Got result for query with attempt %d", (uint8_t *)v2, 8u);
}

@end