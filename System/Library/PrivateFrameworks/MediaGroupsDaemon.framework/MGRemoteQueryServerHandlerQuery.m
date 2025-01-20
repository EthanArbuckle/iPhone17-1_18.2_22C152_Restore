@interface MGRemoteQueryServerHandlerQuery
+ (id)handlerForRequest:(id)a3;
+ (id)urlPath;
- (BOOL)pendingUpdate;
- (BOOL)validateRequest;
- (MGGroupQuery)query;
- (NSArray)queryGroups;
- (NSError)queryError;
- (NSPredicate)requestPredicate;
- (NSString)description;
- (NSString)responseBoundary;
- (NSURLRequest)request;
- (id)_initWithRequest:(id)a3;
- (id)payloadProvider;
- (int)prepareResponse:(id)a3;
- (void)_queryHandleResults:(id)a3 error:(id)a4;
- (void)_querySendResults;
- (void)_queryStart;
- (void)_requestParse;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)provideResponseData:(id)a3;
- (void)setPayloadProvider:(id)a3;
- (void)setPendingUpdate:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setQueryError:(id)a3;
- (void)setQueryGroups:(id)a3;
- (void)setRequestPredicate:(id)a3;
- (void)setResponseBoundary:(id)a3;
@end

@implementation MGRemoteQueryServerHandlerQuery

- (id)_initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MGRemoteQueryServerHandlerQuery;
  v6 = [(MGRemoteQueryServerHandlerQuery *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_request, a3);
    [(MGRemoteQueryServerHandlerQuery *)v7 _requestParse];
  }

  return v7;
}

- (void)dealloc
{
  [(MGRemoteQueryServerHandlerQuery *)self setQuery:0];
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryServerHandlerQuery;
  [(MGRemoteQueryServerHandlerQuery *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(MGRemoteQueryServerHandlerQuery *)self requestPredicate];
  v7 = [(MGRemoteQueryServerHandlerQuery *)self query];
  v8 = [v3 stringWithFormat:@"<%@: %p, _predicate = %@, _query = %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

+ (id)urlPath
{
  return @"/mgquery";
}

+ (id)handlerForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initWithRequest:v4];

  return v5;
}

- (BOOL)validateRequest
{
  objc_super v3 = [(id)objc_opt_class() urlPath];
  uint64_t v4 = [(MGRemoteQueryServerHandlerQuery *)self request];
  id v5 = [(id)v4 URL];
  v6 = [v5 path];
  char v7 = [v3 isEqual:v6];

  v8 = [(MGRemoteQueryServerHandlerQuery *)self requestPredicate];
  LOBYTE(v4) = v8 != 0;

  objc_super v9 = [(MGRemoteQueryServerHandlerQuery *)self requestPredicate];
  LOBYTE(v3) = objc_msgSend(v9, "mg_containsCurrentDevice");

  return v4 & ~(_BYTE)v3 & v7;
}

- (int)prepareResponse:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  v6 = [v4 UUID];
  char v7 = [v6 UUIDString];
  [(MGRemoteQueryServerHandlerQuery *)self setResponseBoundary:v7];

  v8 = NSString;
  objc_super v9 = [(MGRemoteQueryServerHandlerQuery *)self responseBoundary];
  v10 = [v8 stringWithFormat:@"multipart/x-mixed-replace boundary=\"%@\"", v9];;

  id v11 = v10;
  [v11 UTF8String];
  nw_http_fields_append();

  [(MGRemoteQueryServerHandlerQuery *)self _queryStart];
  return 200;
}

- (void)provideResponseData:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__MGRemoteQueryServerHandlerQuery_provideResponseData___block_invoke;
  v6[3] = &unk_26485E620;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  v8 = &v9;
  [(MGRemoteQueryServerHandlerQuery *)self _withLock:v6];
  if (*((unsigned char *)v10 + 24)) {
    [(MGRemoteQueryServerHandlerQuery *)self _querySendResults];
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __55__MGRemoteQueryServerHandlerQuery_provideResponseData___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPayloadProvider:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) pendingUpdate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_requestParse
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [(MGRemoteQueryServerHandlerQuery *)self request];
  objc_super v3 = [v2 URL];

  if (v3)
  {
    id v4 = [MEMORY[0x263F08BA0] componentsWithURL:v3 resolvingAgainstBaseURL:0];
  }
  else
  {
    id v4 = 0;
  }
  v18 = v4;
  [v4 queryItems];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v7 = 134218498;
    long long v16 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "name", v16);
        int v12 = [@"predicate" isEqual:v11];

        if (v12)
        {
          v13 = [v10 value];
          v14 = v13;
          if (v13)
          {
            if ([v13 length])
            {
              v15 = [MEMORY[0x263F08A98] predicateWithFormat:v14];
              if (v15)
              {
                [(MGRemoteQueryServerHandlerQuery *)self setRequestPredicate:v15];

                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)_queryStart
{
  v26[5] = *MEMORY[0x263EF8340];
  objc_super v3 = [(MGRemoteQueryServerHandlerQuery *)self query];

  if (v3)
  {
    id v4 = MGLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v23 = self;
      _os_log_error_impl(&dword_229257000, v4, OS_LOG_TYPE_ERROR, "%p handler already started query", buf, 0xCu);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F08730];
    uint64_t v6 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForHaveCurrentHome");
    v26[0] = v6;
    long long v7 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForLocal");
    v26[1] = v7;
    uint64_t v8 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForRestrictedTypes");
    v26[2] = v8;
    uint64_t v9 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForInCurrentHome");
    v26[3] = v9;
    v10 = [(MGRemoteQueryServerHandlerQuery *)self requestPredicate];
    v26[4] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:5];
    id v4 = [v5 andPredicateWithSubpredicates:v11];

    int v12 = MGLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v4;
      _os_log_debug_impl(&dword_229257000, v12, OS_LOG_TYPE_DEBUG, "%p handler starting query with predicate %@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x263F546F0];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __46__MGRemoteQueryServerHandlerQuery__queryStart__block_invoke;
    long long v19 = &unk_26485E648;
    objc_copyWeak(&v20, &location);
    v14 = [v13 queryWithPredicate:v4 updateHandler:&v16];
    -[MGRemoteQueryServerHandlerQuery setQuery:](self, "setQuery:", v14, v16, v17, v18, v19);
    v15 = MGLogForCategory(5);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_229257000, v15, OS_LOG_TYPE_DEFAULT, "%p handler started query %@", buf, 0x16u);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __46__MGRemoteQueryServerHandlerQuery__queryStart__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _queryHandleResults:v8 error:v5];
  }
}

- (void)_queryHandleResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__3;
  long long v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  int v12 = __61__MGRemoteQueryServerHandlerQuery__queryHandleResults_error___block_invoke;
  v13 = &unk_26485E670;
  v14 = self;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  uint64_t v17 = &v18;
  [(MGRemoteQueryServerHandlerQuery *)self _withLock:&v10];
  if (v19[5]) {
    [(MGRemoteQueryServerHandlerQuery *)self _querySendResults];
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __61__MGRemoteQueryServerHandlerQuery__queryHandleResults_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setQueryGroups:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setQueryError:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setPendingUpdate:1];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) payloadProvider];
  return MEMORY[0x270F9A758]();
}

- (void)_querySendResults
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__21;
  v34 = __Block_byref_object_dispose__22;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__21;
  v28 = __Block_byref_object_dispose__22;
  id v29 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__3;
  long long v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__MGRemoteQueryServerHandlerQuery__querySendResults__block_invoke;
  v17[3] = &unk_26485E698;
  v17[4] = self;
  v17[5] = &v30;
  v17[6] = &v24;
  v17[7] = &v18;
  [(MGRemoteQueryServerHandlerQuery *)self _withLock:v17];
  if (v19[5])
  {
    if (v31[5])
    {
      uint64_t v3 = +[MGRemoteQueryReply replyWithGroups:](MGRemoteQueryReply, "replyWithGroups:");
    }
    else
    {
      if (!v25[5])
      {
        id v4 = 0;
        goto LABEL_9;
      }
      uint64_t v3 = +[MGRemoteQueryReply replyWithError:](MGRemoteQueryReply, "replyWithError:");
    }
    id v4 = v3;
LABEL_9:
    id v5 = (void *)MEMORY[0x263F08900];
    id v6 = [v4 rq_coded];
    id v16 = 0;
    id v7 = [v5 dataWithJSONObject:v6 options:0 error:&v16];
    id v8 = v16;

    if (v8)
    {
      (*(void (**)(void))(v19[5] + 16))();
    }
    else
    {
      id v9 = NSString;
      uint64_t v10 = [(MGRemoteQueryServerHandlerQuery *)self responseBoundary];
      uint64_t v11 = [v9 stringWithFormat:@"\r\n--%@\r\n", v10];

      objc_msgSend(NSString, "stringWithFormat:", @"content-length: %lu\r\ncontent-type: application/json; charset=utf8\r\n\r\n",
      int v12 = [v7 length]);
      v13 = [v11 dataUsingEncoding:5];
      v14 = [v12 dataUsingEncoding:5];
      id v15 = (void *)[v13 mutableCopy];
      [v15 appendData:v14];
      [v15 appendData:v7];
      (*(void (**)(void))(v19[5] + 16))();
    }
    goto LABEL_13;
  }
  id v4 = MGLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v37 = self;
    _os_log_error_impl(&dword_229257000, v4, OS_LOG_TYPE_ERROR, "%p handler not sending query results without payload provider", buf, 0xCu);
  }
LABEL_13:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __52__MGRemoteQueryServerHandlerQuery__querySendResults__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) pendingUpdate] & 1) == 0)
  {
    int v12 = MGLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 134217984;
      uint64_t v16 = v14;
      _os_log_debug_impl(&dword_229257000, v12, OS_LOG_TYPE_DEBUG, "%p transaction not sending query results without update", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_10;
  }
  uint64_t v2 = [*(id *)(a1 + 32) queryGroups];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) queryError];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    int v12 = MGLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 134217984;
      uint64_t v16 = v13;
      _os_log_error_impl(&dword_229257000, v12, OS_LOG_TYPE_ERROR, "%p transaction has no result or error to send", (uint8_t *)&v15, 0xCu);
    }
LABEL_10:

    return;
  }
  uint64_t v8 = [*(id *)(a1 + 32) payloadProvider];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(a1 + 32) setPayloadProvider:0];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    [v11 setPendingUpdate:0];
  }
}

- (NSArray)queryGroups
{
  os_unfair_lock_assert_owner(&self->_lock);
  queryGroups = self->_queryGroups;
  return queryGroups;
}

- (void)setQueryGroups:(id)a3
{
  id v7 = (NSArray *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  queryGroups = self->_queryGroups;
  p_queryGroups = &self->_queryGroups;
  if (queryGroups != v7 && (-[NSArray isEqual:](v7, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_queryGroups, a3);
  }
  MEMORY[0x270F9A758]();
}

- (NSError)queryError
{
  os_unfair_lock_assert_owner(&self->_lock);
  queryError = self->_queryError;
  return queryError;
}

- (void)setQueryError:(id)a3
{
  id v7 = (NSError *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  queryError = self->_queryError;
  p_queryError = &self->_queryError;
  if (queryError != v7 && (-[NSError isEqual:](v7, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_queryError, a3);
  }
  MEMORY[0x270F9A758]();
}

- (id)payloadProvider
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = (void *)MEMORY[0x22A6B39E0](self->_payloadProvider);
  return v3;
}

- (void)setPayloadProvider:(id)a3
{
  id v7 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v4 = v7;
  if (self->_payloadProvider != v7)
  {
    uint64_t v5 = (void *)MEMORY[0x22A6B39E0](v7);
    id payloadProvider = self->_payloadProvider;
    self->_id payloadProvider = v5;

    id v4 = v7;
  }
}

- (BOOL)pendingUpdate
{
  return self->_pendingUpdate;
}

- (void)setPendingUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_pendingUpdate != v3) {
    self->_pendingUpdate = v3;
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSPredicate)requestPredicate
{
  return self->_requestPredicate;
}

- (void)setRequestPredicate:(id)a3
{
}

- (NSString)responseBoundary
{
  return self->_responseBoundary;
}

- (void)setResponseBoundary:(id)a3
{
}

- (MGGroupQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_responseBoundary, 0);
  objc_storeStrong((id *)&self->_requestPredicate, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_payloadProvider, 0);
  objc_storeStrong((id *)&self->_queryError, 0);
  objc_storeStrong((id *)&self->_queryGroups, 0);
}

@end