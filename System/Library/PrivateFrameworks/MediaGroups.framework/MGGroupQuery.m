@interface MGGroupQuery
+ (id)queryWithPredicate:(id)a3 updateHandler:(id)a4;
- (MGClientService)service;
- (MGGroupQuery)initWithConnectionProvider:(id)a3 predicate:(id)a4 updateHandler:(id)a5;
- (MGGroupQuery)initWithPredicate:(id)a3 updateHandler:(id)a4;
- (NSPredicate)predicate;
- (NSUUID)query;
- (id)updateHandler;
- (void)dealloc;
- (void)setQuery:(id)a3;
@end

@implementation MGGroupQuery

- (MGGroupQuery)initWithConnectionProvider:(id)a3 predicate:(id)a4 updateHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MGGroupQuery;
  v11 = [(MGGroupQuery *)&v22 init];
  if (v11)
  {
    uint64_t v12 = +[MGClientService clientServiceWithConnectionProvider:v8];
    service = v11->_service;
    v11->_service = (MGClientService *)v12;

    objc_storeStrong((id *)&v11->_predicate, a4);
    uint64_t v14 = [v10 copy];
    id updateHandler = v11->_updateHandler;
    v11->_id updateHandler = (id)v14;

    v16 = MGLogForCategory(3);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v11->_service;
      *(_DWORD *)buf = 134218240;
      v24 = v11;
      __int16 v25 = 2048;
      v26 = v17;
      _os_log_impl(&dword_222D6E000, v16, OS_LOG_TYPE_DEFAULT, "%p query initializing with service %p", buf, 0x16u);
    }

    objc_initWeak((id *)buf, v11);
    v18 = [(MGGroupQuery *)v11 service];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__MGGroupQuery_initWithConnectionProvider_predicate_updateHandler___block_invoke;
    v20[3] = &unk_26466EB20;
    objc_copyWeak(&v21, (id *)buf);
    [v18 startQueryWithPredicate:v9 completion:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

void __67__MGGroupQuery_initWithConnectionProvider_predicate_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      uint64_t v12 = MGLogForCategory(3);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v19 = 134218498;
        v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = (uint64_t)v7;
        __int16 v23 = 2112;
        id v24 = v9;
        _os_log_error_impl(&dword_222D6E000, v12, OS_LOG_TYPE_ERROR, "%p query %@ failed (%@)", (uint8_t *)&v19, 0x20u);
      }
LABEL_5:

      v13 = [v11 updateHandler];
      v13[2]();

      goto LABEL_17;
    }
    uint64_t v14 = [WeakRetained query];

    if (v14)
    {
      v15 = [v11 query];
      char v16 = [v7 isEqual:v15];

      if (v16)
      {
        if (!v8) {
          goto LABEL_17;
        }
        uint64_t v12 = MGLogForCategory(3);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 134218498;
          v20 = v11;
          __int16 v21 = 2048;
          uint64_t v22 = [v8 count];
          __int16 v23 = 2112;
          id v24 = v7;
          _os_log_impl(&dword_222D6E000, v12, OS_LOG_TYPE_DEFAULT, "%p received %ld items in an update for %@", (uint8_t *)&v19, 0x20u);
        }
        goto LABEL_5;
      }
      v17 = MGLogForCategory(3);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v11 query];
        int v19 = 134218498;
        v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = (uint64_t)v7;
        __int16 v23 = 2112;
        id v24 = v18;
        _os_log_impl(&dword_222D6E000, v17, OS_LOG_TYPE_DEFAULT, "%p query %@ restarted (was %@)", (uint8_t *)&v19, 0x20u);
      }
    }
    else
    {
      v17 = MGLogForCategory(3);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134218242;
        v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = (uint64_t)v7;
        _os_log_impl(&dword_222D6E000, v17, OS_LOG_TYPE_DEFAULT, "%p query %@ started", (uint8_t *)&v19, 0x16u);
      }
    }

    [v11 setQuery:v7];
  }
LABEL_17:
}

- (MGGroupQuery)initWithPredicate:(id)a3 updateHandler:(id)a4
{
  return [(MGGroupQuery *)self initWithConnectionProvider:0 predicate:a3 updateHandler:a4];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(MGGroupQuery *)self query];
  if (v3)
  {
    v4 = MGLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v11 = self;
      __int16 v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_222D6E000, v4, OS_LOG_TYPE_DEFAULT, "%p query %@ stopping", buf, 0x16u);
    }

    v5 = [(MGGroupQuery *)self service];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __23__MGGroupQuery_dealloc__block_invoke;
    v7[3] = &unk_26466EB48;
    id v9 = self;
    id v8 = v3;
    [v5 stopQuery:v8 completion:v7];
  }
  v6.receiver = self;
  v6.super_class = (Class)MGGroupQuery;
  [(MGGroupQuery *)&v6 dealloc];
}

void __23__MGGroupQuery_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = MGLogForCategory(3);
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 134218242;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_222D6E000, v5, OS_LOG_TYPE_DEFAULT, "%p query %@ stopped", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 134218498;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    _os_log_error_impl(&dword_222D6E000, v5, OS_LOG_TYPE_ERROR, "%p query stop %@ failed (%@)", (uint8_t *)&v10, 0x20u);
  }
}

+ (id)queryWithPredicate:(id)a3 updateHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithPredicate:v7 updateHandler:v6];

  return v8;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (MGClientService)service
{
  return self->_service;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (NSUUID)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end