@interface MUAMSResultProvider
- (MUAMSResultProvider)initWithCache:(id)a3;
- (void)_finishWithResults:(id)a3 error:(id)a4 onCallbackQueue:(id)a5 completion:(id)a6;
- (void)fetchResultsForAdamIds:(id)a3 options:(id)a4 callbackQueue:(id)a5 completion:(id)a6;
- (void)fetchResultsForBundleIds:(id)a3 options:(id)a4 callbackQueue:(id)a5 completion:(id)a6;
@end

@implementation MUAMSResultProvider

- (MUAMSResultProvider)initWithCache:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUAMSResultProvider;
  v6 = [(MUAMSResultProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_amsResultCache, a3);
    uint64_t v8 = geo_dispatch_queue_create_with_qos();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)fetchResultsForAdamIds:(id)a3 options:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke;
  v19[3] = &unk_1E5751120;
  objc_copyWeak(&v24, &location);
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  id v15 = v11;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(queue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke(id *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 8;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    from = v2;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = a1[4];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v11 = [WeakRetained[1] amsResultForAdamId:v10];
          if (v11) {
            [v5 addObject:v11];
          }
          else {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [v4 count];
    id v13 = MUGetMUAMSResultProviderLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        id v15 = a1[4];
        *(_DWORD *)buf = 138412546;
        id v37 = v4;
        __int16 v38 = 2112;
        id v39 = v15;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_INFO, "These adam ids are not present %@. Requesting the service for adam ids %@.", buf, 0x16u);
      }

      id v16 = [MEMORY[0x1E4F30E48] sharedInstance];
      id v17 = (void *)[a1[4] copy];
      [a1[6] artworkSize];
      double v19 = v18;
      double v21 = v20;
      [a1[6] displayScale];
      double v23 = v22;
      uint64_t v24 = [a1[6] source];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke_52;
      v28[3] = &unk_1E57510F8;
      objc_copyWeak(&v31, from);
      v28[4] = WeakRetained;
      id v29 = a1[5];
      id v30 = a1[7];
      objc_msgSend(v16, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v17, 1, v24, v28, v19, v21, v23);

      objc_destroyWeak(&v31);
    }
    else
    {
      if (v14)
      {
        id v25 = a1[4];
        *(_DWORD *)buf = 138412290;
        id v37 = v25;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_INFO, "There is a cache hit for all requested adam ids %@.  Early return.", buf, 0xCu);
      }

      v26 = (void *)[v5 copy];
      [WeakRetained _finishWithResults:v26 error:0 onCallbackQueue:a1[5] completion:a1[7]];
    }
  }
}

void __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke_2;
    v11[3] = &unk_1E57510D0;
    id v12 = v6;
    id v13 = v5;
    BOOL v14 = v8;
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v10;
    id v17 = *(id *)(a1 + 48);
    dispatch_async(v9, v11);
  }
}

void __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = MUGetMUAMSResultProviderLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      double v22 = v3;
      _os_log_impl(&dword_1931EA000, v2, OS_LOG_TYPE_ERROR, "Error with fetching adam ids %@", buf, 0xCu);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = MUGetMUAMSResultProviderLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [v9 identifier];
          *(_DWORD *)buf = 138412290;
          double v22 = v11;
          _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_INFO, "Updating cache with adam id %@", buf, 0xCu);
        }
        id v12 = *(void **)(*(void *)(a1 + 48) + 8);
        id v13 = [v9 identifier];
        [v12 setAMSResult:v9 forAdamId:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  BOOL v14 = *(void **)(a1 + 56);
  uint64_t v15 = (void *)[*(id *)(a1 + 40) copy];
  [v14 _finishWithResults:v15 error:*(void *)(a1 + 32) onCallbackQueue:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

- (void)fetchResultsForBundleIds:(id)a3 options:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke;
  v19[3] = &unk_1E5751120;
  objc_copyWeak(&v24, &location);
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  id v15 = v11;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(queue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke(id *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 8;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    from = v2;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = a1[4];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v11 = objc_msgSend(WeakRetained[1], "amsResultForBundleId:", v10, from);
          if (v11) {
            [v5 addObject:v11];
          }
          else {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [v4 count];
    id v13 = MUGetMUAMSResultProviderLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        id v15 = a1[4];
        *(_DWORD *)buf = 138412546;
        id v37 = v4;
        __int16 v38 = 2112;
        id v39 = v15;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_INFO, "These bundle ids are not present %@. Requesting the service for bundle ids %@.", buf, 0x16u);
      }

      id v16 = [MEMORY[0x1E4F30E48] sharedInstance];
      id v17 = (void *)[a1[4] copy];
      [a1[6] artworkSize];
      double v19 = v18;
      double v21 = v20;
      [a1[6] displayScale];
      double v23 = v22;
      uint64_t v24 = [a1[6] source];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke_55;
      v28[3] = &unk_1E5751170;
      objc_copyWeak(&v31, from);
      id v29 = a1[5];
      id v30 = a1[7];
      objc_msgSend(v16, "appleMediaServicesResultsWithBundleIdentifiers:artworkSize:screenScale:source:completion:", v17, v24, v28, v19, v21, v23);

      objc_destroyWeak(&v31);
    }
    else
    {
      if (v14)
      {
        id v25 = a1[4];
        *(_DWORD *)buf = 138412290;
        id v37 = v25;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_INFO, "There is a cache hit for all requested bundle ids %@.  Early return.", buf, 0xCu);
      }

      v26 = (void *)[v5 copy];
      [WeakRetained _finishWithResults:v26 error:0 onCallbackQueue:a1[5] completion:a1[7]];
    }
  }
}

void __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke_55(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke_2;
    block[3] = &unk_1E5751148;
    id v11 = v6;
    id v12 = v5;
    id v13 = v8;
    id v14 = a1[4];
    id v15 = a1[5];
    dispatch_async(v9, block);
  }
}

void __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = MUGetMUAMSResultProviderLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      double v22 = v3;
      _os_log_impl(&dword_1931EA000, v2, OS_LOG_TYPE_ERROR, "Error with fetching bundle ids %@", buf, 0xCu);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = MUGetMUAMSResultProviderLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [v9 identifier];
          *(_DWORD *)buf = 138412290;
          double v22 = v11;
          _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_INFO, "Updating cache with bundle id %@", buf, 0xCu);
        }
        id v12 = *(void **)(*(void *)(a1 + 48) + 8);
        id v13 = [v9 iOSBundleIdentifier];
        [v12 setAMSResult:v9 forBundleId:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v14 = *(void **)(a1 + 48);
  id v15 = (void *)[*(id *)(a1 + 40) copy];
  [v14 _finishWithResults:v15 error:*(void *)(a1 + 32) onCallbackQueue:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)_finishWithResults:(id)a3 error:(id)a4 onCallbackQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MUAMSResultProvider__finishWithResults_error_onCallbackQueue_completion___block_invoke;
  block[3] = &unk_1E574ECA8;
  id v17 = v10;
  id v18 = v11;
  id v16 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  dispatch_async((dispatch_queue_t)a5, block);
}

uint64_t __75__MUAMSResultProvider__finishWithResults_error_onCallbackQueue_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_amsResultCache, 0);
}

@end