@interface CPLConfigurationFetcher
- (CPLConfigurationFetcher)initWithConfigurationURL:(id)a3 delegate:(id)a4 queue:(id)a5;
- (CPLConfigurationFetcherDelegate)delegate;
- (NSURL)configurationURL;
- (OS_dispatch_queue)queue;
- (void)_updateConfigurationWithFetchData:(id)a3 fetchError:(id)a4 fetchURL:(id)a5 fromConfigurationDictionary:(id)a6;
- (void)fetchConfigurationDictionary:(id)a3;
- (void)fetchConfigurationDictionary:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
@end

@implementation CPLConfigurationFetcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CPLConfigurationFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLConfigurationFetcherDelegate *)WeakRetained;
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)invalidate
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CPLConfigurationFetcher_invalidate__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18642;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __37__CPLConfigurationFetcher_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 8) invalidateAndCancel];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeAllObjects", (void)v10);
}

- (void)fetchConfigurationDictionary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke;
  v14[3] = &unk_1E60AA5C0;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18642;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  long long v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke(uint64_t a1)
{
  v1 = (id *)a1;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
    v3 = (void *)MEMORY[0x1BA994060]();
    [v2 addObject:v3];
  }
  if (!*((void *)v1[4] + 1))
  {
    if (os_variant_has_internal_content())
    {
      id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v5 = [v4 stringForKey:@"CPLLocalConfigurationPrefix"];

      if (v5
        && ([v5 hasPrefix:@"."] & 1) == 0
        && [v5 rangeOfString:@"/"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v6 = [NSString alloc];
        id v7 = [*((id *)v1[4] + 3) lastPathComponent];
        uint64_t v8 = (void *)[v6 initWithFormat:@"%@-%@", v5, v7];

        id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/AppleInternal/Library/Photos/Backend/CPL/LocalConfigurations" isDirectory:1];
        long long v10 = [v9 URLByAppendingPathComponent:v8 isDirectory:0];
        id v24 = 0;
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v10 options:1 error:&v24];
        id v12 = v24;
        [v1[4] _updateConfigurationWithFetchData:v11 fetchError:v12 fetchURL:v10 fromConfigurationDictionary:v1[5]];

LABEL_20:
        return;
      }
    }
    uint64_t v5 = [MEMORY[0x1E4F290D0] requestWithURL:*((void *)v1[4] + 3)];
    uint64_t v8 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    dispatch_block_t v13 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v8];
    objc_storeStrong((id *)v1[4] + 1, v13);
    v14 = v1[4];
    id v15 = (void *)v14[1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke_2;
    v21[3] = &unk_1E60AA598;
    v21[4] = v14;
    id v9 = v13;
    id v22 = v9;
    id v23 = v1[5];
    id v16 = [v15 dataTaskWithRequest:v5 completionHandler:v21];
    [v16 resume];
    if (!_CPLSilentLogging)
    {
      v17 = __CPLConfigurationOSLogDomain_18656();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *((void *)v1[4] + 3);
        v19 = [v1[5] lastUpdateDate];
        if (v19)
        {
          v1 = [v1[5] lastUpdateDate];
          v20 = +[CPLDateFormatter stringFromDateAgo:v1 now:0];
        }
        else
        {
          v20 = @"never";
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Updating configuration from %{public}@ - last update: %@", buf, 0x16u);
        if (v19)
        {
        }
      }
    }
    goto LABEL_20;
  }
}

void __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke_3;
  v16[3] = &unk_1E60A66D8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v17 = v9;
  uint64_t v18 = v10;
  id v19 = v6;
  id v20 = v7;
  id v21 = *(id *)(a1 + 48);
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18642;
  block[3] = &unk_1E60A6978;
  id v23 = v11;
  id v12 = v8;
  id v13 = v7;
  id v14 = v6;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

uint64_t __74__CPLConfigurationFetcher_fetchConfigurationDictionary_completionHandler___block_invoke_3(uint64_t result)
{
  v1 = *(void **)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v1 == *(void **)(v2 + 8))
  {
    v3 = (void *)result;
    *(void *)(v2 + 8) = 0;

    id v4 = (void *)v3[5];
    uint64_t v5 = v3[6];
    uint64_t v6 = v4[3];
    uint64_t v7 = v3[7];
    uint64_t v8 = v3[8];
    return [v4 _updateConfigurationWithFetchData:v5 fetchError:v7 fetchURL:v6 fromConfigurationDictionary:v8];
  }
  return result;
}

- (void)_updateConfigurationWithFetchData:(id)a3 fetchError:(id)a4 fetchURL:(id)a5 fromConfigurationDictionary:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v11)
  {
    if (_CPLSilentLogging) {
      goto LABEL_25;
    }
    id v14 = __CPLConfigurationOSLogDomain_18656();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138543618;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v11;
    dispatch_block_t v15 = "Could not fetch configuration from %{public}@. Will retry later: %@";
    id v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_5;
  }
  if (v10)
  {
    uint64_t v18 = [CPLConfigurationDictionary alloc];
    id v19 = [v13 refreshIntervalKey];
    [v13 minRefreshInterval];
    id v36 = 0;
    id v20 = -[CPLConfigurationDictionary initWithData:refreshIntervalKey:minRefreshInterval:error:](v18, "initWithData:refreshIntervalKey:minRefreshInterval:error:", v10, v19, &v36);
    id v14 = v36;

    if (v20)
    {
      int v21 = [v20 matchesConfigurationDictionary:v13];
      if (v21)
      {
        uint64_t v22 = [v13 copyConfigurationDictionaryWithUpdatedDate];

        id v20 = v22;
      }
      uint64_t v23 = v21 ^ 1u;
      if (!_CPLSilentLogging)
      {
        id v24 = __CPLConfigurationOSLogDomain_18656();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = @"configuration has changed";
          if (v21) {
            v25 = @"configuration has not changed";
          }
          *(_DWORD *)buf = 138543618;
          id v39 = v12;
          __int16 v40 = 2112;
          id v41 = v25;
          _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "Fetched configuration from %{public}@ successfully - %@", buf, 0x16u);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained configurationFetcher:self didUpdateConfigurationDictionary:v20 configurationHasChanged:v23];
    }
    else
    {
      if (_CPLSilentLogging) {
        goto LABEL_24;
      }
      id v20 = __CPLConfigurationOSLogDomain_18656();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v39 = v12;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Fetched configuration from %{public}@ is invalid. Will retry later: %@", buf, 0x16u);
      }
    }

    goto LABEL_24;
  }
  if (_CPLSilentLogging) {
    goto LABEL_25;
  }
  id v14 = __CPLConfigurationOSLogDomain_18656();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = 0;
    dispatch_block_t v15 = "Fetched configuration from %{public}@ is empty. Will retry later: %@";
    id v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
LABEL_5:
    _os_log_impl(&dword_1B4CAC000, v16, v17, v15, buf, 0x16u);
  }
LABEL_24:

LABEL_25:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  __int16 v27 = self->_completionHandlers;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v32 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v32 + 1) + 8 * i));
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v29);
  }

  [(NSMutableArray *)self->_completionHandlers removeAllObjects];
}

- (void)fetchConfigurationDictionary:(id)a3
{
}

- (CPLConfigurationFetcher)initWithConfigurationURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPLConfigurationFetcher;
  id v11 = [(CPLConfigurationFetcher *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    configurationURL = v11->_configurationURL;
    v11->_configurationURL = (NSURL *)v12;

    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v14;
  }
  return v11;
}

@end