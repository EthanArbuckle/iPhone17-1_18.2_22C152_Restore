@interface BCSIconRemoteFetch
- (BCSCoalesceHelperProtocol)coalesceHelper;
- (id)initWithCoalesceHelper:(id *)a1;
- (void)fetchSquareIconDataForBusinessItem:(void *)a3 forClientBundleID:(void *)a4 completion:;
@end

@implementation BCSIconRemoteFetch

- (id)initWithCoalesceHelper:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BCSIconRemoteFetch;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (void)fetchSquareIconDataForBusinessItem:(void *)a3 forClientBundleID:(void *)a4 completion:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = [v7 squareLogoURL];
    if (v10)
    {
      v11 = [MEMORY[0x263F08BD8] requestWithURL:v10 cachePolicy:1 timeoutInterval:10.0];
      unsigned __int8 v27 = 0;
      v12 = NSString;
      v13 = [v7 bizID];
      v14 = [v12 stringWithFormat:@"squareLogoFetch__%@", v13];

      v15 = [[BCSCoalesceObjectData alloc] initWithCompletionBlock:v9 coalesceKey:v14];
      v16 = [a1 coalesceHelper];
      [v16 enqueueCoalesceObject:v15 isDuplicateRequest:&v27];

      int v17 = v27;
      v18 = ABSLogCommon();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[BCSIconRemoteFetch fetchSquareIconDataForBusinessItem:forClientBundleID:completion:]";
          _os_log_impl(&dword_2154F4000, v18, OS_LOG_TYPE_DEFAULT, "New request is duplicate and already in progress: %s", buf, 0xCu);
        }
      }
      else
      {
        if (v19)
        {
          v22 = [v7 bizID];
          *(_DWORD *)buf = 138412290;
          v29 = v22;
          _os_log_impl(&dword_2154F4000, v18, OS_LOG_TYPE_DEFAULT, "Remote Fetch icon data for business: %@", buf, 0xCu);
        }
        v18 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
        [v18 set_sourceApplicationBundleIdentifier:v8];
        v23 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v18];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __86__BCSIconRemoteFetch_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke;
        v25[3] = &unk_26424A110;
        v25[4] = a1;
        id v26 = v14;
        v24 = [v23 dataTaskWithRequest:v11 completionHandler:v25];
        [v24 resume];
      }
    }
    else
    {
      v20 = ABSLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v7 bizID];
        *(_DWORD *)buf = 138412290;
        v29 = v21;
        _os_log_impl(&dword_2154F4000, v20, OS_LOG_TYPE_DEFAULT, "No square logo URL set for business item with ID: %@", buf, 0xCu);
      }
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

void __86__BCSIconRemoteFetch_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) coalesceHelper];
  id v9 = [v8 dequeueCoalesceObjectsForCoalesceKey:*(void *)(a1 + 40)];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v15 dataCompletionBlock];
          (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v6, v7);
        }
        else
        {
          uint64_t v16 = ABSLogCommon();
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v22 = "-[BCSIconRemoteFetch fetchSquareIconDataForBusinessItem:forClientBundleID:completion:]_block_invoke";
            _os_log_error_impl(&dword_2154F4000, (os_log_t)v16, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to data pool: %s", buf, 0xCu);
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BCSCoalesceHelperProtocol)coalesceHelper
{
  return self->_coalesceHelper;
}

- (void).cxx_destruct
{
}

@end