@interface PUPhotosFileProviderItemProvider
- (BOOL)_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler;
- (NSDictionary)progressURLSandboxExtensionTokens;
- (NSDictionary)progressURLs;
- (NSMutableDictionary)_progressByUUID;
- (NSMutableDictionary)_progressProxyByUUID;
- (NSMutableDictionary)_progressSubscriberByUUID;
- (PUPhotosFileProviderItemProvider)initWithProgressURLs:(id)a3 progressURLSandboxExtensionTokens:(id)a4;
- (id)_progressURLForTypeIdentifier:(id)a3;
- (id)_startProgressForURL:(id)a3 UUID:(id)a4 cancellationHandler:(id)a5;
- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4;
- (id)loadFileRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4;
- (id)loadInPlaceFileRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4;
- (id)loadObjectOfClass:(Class)a3 completionHandler:(id)a4;
- (void)_completeProgressWithUUID:(id)a3 success:(BOOL)a4 completionHandler:(id)a5;
- (void)_startObservingProgressProxyIfNeeded:(id)a3 UUID:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setProgressURLSandboxExtensionTokens:(id)a3;
- (void)setProgressURLs:(id)a3;
- (void)set_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler:(BOOL)a3;
- (void)set_progressByUUID:(id)a3;
- (void)set_progressProxyByUUID:(id)a3;
- (void)set_progressSubscriberByUUID:(id)a3;
@end

@implementation PUPhotosFileProviderItemProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progressSubscriberByUUID, 0);
  objc_storeStrong((id *)&self->__progressProxyByUUID, 0);
  objc_storeStrong((id *)&self->__progressByUUID, 0);
  objc_storeStrong((id *)&self->_progressURLSandboxExtensionTokens, 0);

  objc_storeStrong((id *)&self->_progressURLs, 0);
}

- (void)set_progressSubscriberByUUID:(id)a3
{
}

- (NSMutableDictionary)_progressSubscriberByUUID
{
  return self->__progressSubscriberByUUID;
}

- (void)set_progressProxyByUUID:(id)a3
{
}

- (NSMutableDictionary)_progressProxyByUUID
{
  return self->__progressProxyByUUID;
}

- (void)set_progressByUUID:(id)a3
{
}

- (NSMutableDictionary)_progressByUUID
{
  return self->__progressByUUID;
}

- (void)setProgressURLSandboxExtensionTokens:(id)a3
{
}

- (NSDictionary)progressURLSandboxExtensionTokens
{
  return self->_progressURLSandboxExtensionTokens;
}

- (void)setProgressURLs:(id)a3
{
}

- (NSDictionary)progressURLs
{
  return self->_progressURLs;
}

- (void)set_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler:(BOOL)a3
{
  self->__copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler = a3;
}

- (BOOL)_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler
{
  return self->__copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if ((void *)PUPhotosFileProviderItemProviderContext == a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (NSStringFromSelector(sel_fractionCompleted),
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v10 isEqualToString:v12],
          v12,
          v13))
    {
      id v28 = v11;
      id v29 = v10;
      id v14 = v11;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v15 = [(PUPhotosFileProviderItemProvider *)self _progressProxyByUUID];
      v16 = [v15 allKeysForObject:v14];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v32 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            v22 = [(PUPhotosFileProviderItemProvider *)self _progressByUUID];
            v23 = [v22 objectForKeyedSubscript:v21];

            if (v23)
            {
              if ([v23 isCancelled])
              {
                v24 = PLUIGetLog();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  id v36 = v23;
                  _os_log_impl(&dword_217C33000, v24, OS_LOG_TYPE_DEBUG, "Ignored progress updates for local progress (%@) because it's already cancelled.", buf, 0xCu);
                }
              }
              else
              {
                [v14 fractionCompleted];
                objc_msgSend(v23, "setCompletedUnitCount:", (uint64_t)(v26 * (double)objc_msgSend(v23, "totalUnitCount")));
              }
            }
            else
            {
              v25 = PLUIGetLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v36 = v14;
                __int16 v37 = 2112;
                id v38 = v21;
                _os_log_impl(&dword_217C33000, v25, OS_LOG_TYPE_DEFAULT, "No matching local progress is found for remote progress (%@) with UUID (%@).", buf, 0x16u);
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v18);
      }

      id v11 = v28;
      id v10 = v29;
    }
    else
    {
      v27 = PLUIGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v36 = v11;
        __int16 v37 = 2112;
        id v38 = v10;
        _os_log_impl(&dword_217C33000, v27, OS_LOG_TYPE_DEFAULT, "Received invalid object (%@) or keypath (%@) for the progress context.", buf, 0x16u);
      }
    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PUPhotosFileProviderItemProvider;
    [(PUPhotosFileProviderItemProvider *)&v30 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

- (id)_progressURLForTypeIdentifier:(id)a3
{
  v4 = [(PUPhotosFileProviderItemProvider *)self _representationConformingToType:a3];
  v5 = [v4 typeIdentifier];

  if (v5)
  {
    v6 = [(PUPhotosFileProviderItemProvider *)self progressURLs];
    v7 = [v4 typeIdentifier];
    v8 = [v6 objectForKeyedSubscript:v7];

    v9 = [(PUPhotosFileProviderItemProvider *)self progressURLSandboxExtensionTokens];
    id v10 = [v4 typeIdentifier];
    id v11 = [v9 objectForKeyedSubscript:v10];

    if (v8 && v11)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x263F5DB80]) initWithURL:v8 sandboxExtensionToken:v11 consume:1];

      goto LABEL_11;
    }
    int v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217C33000, v13, OS_LOG_TYPE_DEBUG, "Can't find progress URL or its sandbox extension token.", buf, 2u);
    }
  }
  else
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_217C33000, v8, OS_LOG_TYPE_DEBUG, "Can't find item provider representation for the progress URL.", v15, 2u);
    }
  }

  v12 = 0;
LABEL_11:

  return v12;
}

- (void)_completeProgressWithUUID:(id)a3 success:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v19 = a3;
  v8 = (void (**)(void))a5;
  v9 = [(PUPhotosFileProviderItemProvider *)self _progressSubscriberByUUID];
  id v10 = [v9 objectForKeyedSubscript:v19];

  if (v10) {
    [MEMORY[0x263F08AB8] removeSubscriber:v10];
  }
  id v11 = [(PUPhotosFileProviderItemProvider *)self _progressSubscriberByUUID];
  [v11 setObject:0 forKeyedSubscript:v19];

  v12 = [(PUPhotosFileProviderItemProvider *)self _progressProxyByUUID];
  int v13 = [v12 objectForKeyedSubscript:v19];

  id v14 = NSStringFromSelector(sel_fractionCompleted);
  [v13 removeObserver:self forKeyPath:v14 context:PUPhotosFileProviderItemProviderContext];

  v15 = [(PUPhotosFileProviderItemProvider *)self _progressProxyByUUID];
  [v15 setObject:0 forKeyedSubscript:v19];

  v16 = [(PUPhotosFileProviderItemProvider *)self _progressByUUID];
  uint64_t v17 = [v16 objectForKeyedSubscript:v19];

  uint64_t v18 = [(PUPhotosFileProviderItemProvider *)self _progressByUUID];
  [v18 setObject:0 forKeyedSubscript:v19];

  if (([v17 isCancelled] & 1) == 0)
  {
    if (v6) {
      objc_msgSend(v17, "setCompletedUnitCount:", objc_msgSend(v17, "totalUnitCount"));
    }
    v8[2](v8);
  }
}

- (void)_startObservingProgressProxyIfNeeded:(id)a3 UUID:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [(PUPhotosFileProviderItemProvider *)self _progressProxyByUUID];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    v9 = [(PUPhotosFileProviderItemProvider *)self _progressProxyByUUID];

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [(PUPhotosFileProviderItemProvider *)self set_progressProxyByUUID:v10];
    }
    id v11 = [(PUPhotosFileProviderItemProvider *)self _progressProxyByUUID];
    [v11 setObject:v13 forKeyedSubscript:v6];

    v12 = NSStringFromSelector(sel_fractionCompleted);
    [v13 addObserver:self forKeyPath:v12 options:4 context:PUPhotosFileProviderItemProviderContext];
  }
}

- (id)_startProgressForURL:(id)a3 UUID:(id)a4 cancellationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:10000];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __82__PUPhotosFileProviderItemProvider__startProgressForURL_UUID_cancellationHandler___block_invoke;
  v32[3] = &unk_2642C54C0;
  id v12 = v10;
  id v33 = v12;
  [v11 setCancellationHandler:v32];
  id v13 = [(PUPhotosFileProviderItemProvider *)self _progressByUUID];

  if (!v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(PUPhotosFileProviderItemProvider *)self set_progressByUUID:v14];
  }
  v15 = [(PUPhotosFileProviderItemProvider *)self _progressByUUID];
  [v15 setObject:v11 forKeyedSubscript:v9];

  v16 = [(PUPhotosFileProviderItemProvider *)self _progressSubscriberByUUID];

  if (!v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(PUPhotosFileProviderItemProvider *)self set_progressSubscriberByUUID:v17];
  }
  uint64_t v18 = (void *)MEMORY[0x263F08AB8];
  id v19 = NSURL;
  v20 = [v8 path];
  v21 = [v19 fileURLWithPath:v20];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  id v28 = __82__PUPhotosFileProviderItemProvider__startProgressForURL_UUID_cancellationHandler___block_invoke_2;
  id v29 = &unk_2642C5388;
  objc_copyWeak(&v31, &location);
  id v22 = v9;
  id v30 = v22;
  v23 = [v18 addSubscriberForFileURL:v21 withPublishingHandler:&v26];
  v24 = [(PUPhotosFileProviderItemProvider *)self _progressSubscriberByUUID];
  [v24 setObject:v23 forKeyedSubscript:v22];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v11;
}

void __82__PUPhotosFileProviderItemProvider__startProgressForURL_UUID_cancellationHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08188] code:3072 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__PUPhotosFileProviderItemProvider__startProgressForURL_UUID_cancellationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _startObservingProgressProxyIfNeeded:v4 UUID:*(void *)(a1 + 32)];

  return 0;
}

- (id)loadInPlaceFileRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLUIGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_217C33000, v8, OS_LOG_TYPE_DEFAULT, "PUPhotosFileProviderItemProvider: loadInPlaceFileRepresentationForTypeIdentifier: %@", buf, 0xCu);
  }

  if (dyld_program_sdk_at_least()
    && ![(PUPhotosFileProviderItemProvider *)self _copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler])
  {
    id v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217C33000, v9, OS_LOG_TYPE_FAULT, "loadInPlaceFileRepresentationForTypeIdentifier: is not supported. Use loadFileRepresentationForTypeIdentifier: instead.", buf, 2u);
    }
  }
  id v10 = [(PUPhotosFileProviderItemProvider *)self _progressURLForTypeIdentifier:v6];
  id v11 = [v10 lastPathComponent];

  id v12 = [(PUPhotosFileProviderItemProvider *)self _sanitizedSuggestedName];
  if (v6)
  {
    id v13 = [MEMORY[0x263F1D920] typeWithIdentifier:v6];
  }
  else
  {
    id v13 = 0;
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __101__PUPhotosFileProviderItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
  v20[3] = &unk_2642C5360;
  id v23 = v13;
  id v24 = v7;
  v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v7;
  uint64_t v18 = [(PUPhotosFileProviderItemProvider *)self loadFileRepresentationForTypeIdentifier:v6 completionHandler:v20];

  return v18;
}

void __101__PUPhotosFileProviderItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 64))
  {
    if (!v5
      || dyld_program_sdk_at_least()
      && ![*(id *)(a1 + 32) _copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler])
    {
LABEL_28:
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_29;
    }
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = dyld_program_sdk_at_least() ^ 1;
      unsigned int v9 = [*(id *)(a1 + 32) _copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v42 = 2048;
      uint64_t v43 = v8;
      __int16 v44 = 2048;
      uint64_t v45 = v9;
      _os_log_impl(&dword_217C33000, v7, OS_LOG_TYPE_DEFAULT, "Copying URL (%@) because (old SDK: %ld, explicit: %ld) (loadInPlaceFileRepresentationForTypeIdentifier:)", buf, 0x20u);
    }

    id v10 = *(void **)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    id v12 = *(void **)(a1 + 56);
    id v13 = v5;
    id v14 = v10;
    id v15 = v11;
    id v39 = v12;
    id v16 = [MEMORY[0x263F08850] defaultManager];
    id v17 = [v16 temporaryDirectory];
    uint64_t v18 = [v17 URLByAppendingPathComponent:@"com.apple.Photos.NSItemProvider" isDirectory:1];

    if ([v14 length])
    {
      id v19 = [v18 URLByAppendingPathComponent:v14 isDirectory:1];
    }
    else
    {
      v20 = [MEMORY[0x263F08C38] UUID];
      id v21 = [v20 UUIDString];
      id v19 = [v18 URLByAppendingPathComponent:v21 isDirectory:1];

      uint64_t v18 = v20;
    }

    id v22 = [MEMORY[0x263F08850] defaultManager];
    *(void *)buf = 0;
    int v23 = [v22 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:buf];
    id v24 = *(id *)buf;

    if (!v23)
    {
      id v28 = v24;
      id v5 = 0;
      goto LABEL_25;
    }
    if (v15)
    {
      v25 = [v19 URLByAppendingPathComponent:v15];

      id v26 = [v13 pathExtension];

      if (v26)
      {
        uint64_t v27 = [v13 pathExtension];
        id v19 = [v25 URLByAppendingPathExtension:v27];

        v25 = (void *)v27;
      }
      else
      {
        if (!v39)
        {
          id v19 = v25;
          goto LABEL_21;
        }
        id v19 = objc_msgSend(v25, "URLByAppendingPathExtensionForType:");
      }
    }
    else
    {
      id v29 = [v13 lastPathComponent];

      if (v29)
      {
        v25 = [v13 lastPathComponent];
        uint64_t v30 = [v19 URLByAppendingPathComponent:v25];

        id v19 = (void *)v30;
      }
      else
      {
        v25 = [MEMORY[0x263F08C38] UUID];
        id v31 = [v25 UUIDString];
        uint64_t v38 = [v19 URLByAppendingPathComponent:v31];

        id v19 = (void *)v38;
      }
    }

LABEL_21:
    long long v32 = [MEMORY[0x263F08850] defaultManager];
    [v32 removeItemAtURL:v19 error:0];

    id v33 = [MEMORY[0x263F08850] defaultManager];
    id v40 = 0;
    int v34 = [v33 copyItemAtURL:v13 toURL:v19 error:&v40];
    id v35 = v40;

    if (v34)
    {
      id v5 = v19;
      id v28 = v6;
    }
    else
    {
      id v28 = v35;
      id v5 = 0;
    }

LABEL_25:
    id v36 = v28;

    __int16 v37 = PLUIGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_217C33000, v37, OS_LOG_TYPE_DEFAULT, "Copied to URL (%@) (loadInPlaceFileRepresentationForTypeIdentifier:)", buf, 0xCu);
    }

    id v6 = v36;
    goto LABEL_28;
  }
LABEL_29:
}

- (id)loadFileRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PUPhotosFileProviderItemProvider *)self _progressURLForTypeIdentifier:v6];
  unsigned int v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_217C33000, v9, OS_LOG_TYPE_DEFAULT, "PUPhotosFileProviderItemProvider: loadFileRepresentationForTypeIdentifier: %@", buf, 0xCu);
  }

  if (v8)
  {
    id v10 = [MEMORY[0x263F08C38] UUID];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v22[3] = &unk_2642C52C0;
    id v11 = v7;
    id v23 = v11;
    id v12 = [(PUPhotosFileProviderItemProvider *)self _startProgressForURL:v8 UUID:v10 cancellationHandler:v22];
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2;
    v18[3] = &unk_2642C5338;
    objc_copyWeak(&v21, (id *)buf);
    id v13 = v10;
    id v19 = v13;
    id v20 = v11;
    v17.receiver = self;
    v17.super_class = (Class)PUPhotosFileProviderItemProvider;
    id v14 = [(PUPhotosFileProviderItemProvider *)&v17 loadFileRepresentationForTypeIdentifier:v6 completionHandler:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PUPhotosFileProviderItemProvider;
    id v12 = [(PUPhotosFileProviderItemProvider *)&v16 loadFileRepresentationForTypeIdentifier:v6 completionHandler:v7];
  }

  return v12;
}

uint64_t __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3;
  v12[3] = &unk_2642C56B0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [WeakRetained _completeProgressWithUUID:v8 success:v5 != 0 completionHandler:v12];
}

uint64_t __94__PUPhotosFileProviderItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLUIGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_217C33000, v8, OS_LOG_TYPE_DEFAULT, "PUPhotosFileProviderItemProvider: loadDataRepresentationForTypeIdentifier: %@", buf, 0xCu);
  }

  id v9 = [(PUPhotosFileProviderItemProvider *)self _progressURLForTypeIdentifier:v6];
  if (v9)
  {
    id v10 = [MEMORY[0x263F08C38] UUID];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v22[3] = &unk_2642C52C0;
    id v11 = v7;
    id v23 = v11;
    id v12 = [(PUPhotosFileProviderItemProvider *)self _startProgressForURL:v9 UUID:v10 cancellationHandler:v22];
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2;
    v18[3] = &unk_2642C5310;
    objc_copyWeak(&v21, (id *)buf);
    id v13 = v10;
    id v19 = v13;
    id v20 = v11;
    v17.receiver = self;
    v17.super_class = (Class)PUPhotosFileProviderItemProvider;
    id v14 = [(PUPhotosFileProviderItemProvider *)&v17 loadDataRepresentationForTypeIdentifier:v6 completionHandler:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PUPhotosFileProviderItemProvider;
    id v12 = [(PUPhotosFileProviderItemProvider *)&v16 loadDataRepresentationForTypeIdentifier:v6 completionHandler:v7];
  }

  return v12;
}

uint64_t __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3;
  v12[3] = &unk_2642C56B0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [WeakRetained _completeProgressWithUUID:v8 success:v5 != 0 completionHandler:v12];
}

uint64_t __94__PUPhotosFileProviderItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (id)loadObjectOfClass:(Class)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromClass(a3);
    *(_DWORD *)buf = 138412290;
    id v28 = v8;
    _os_log_impl(&dword_217C33000, v7, OS_LOG_TYPE_DEFAULT, "PUPhotosFileProviderItemProvider: loadObjectOfClass: %@", buf, 0xCu);
  }
  if ((Class)objc_opt_class() == a3)
  {
    id v10 = [(id)*MEMORY[0x263F1DB18] identifier];
    if (v10) {
      goto LABEL_6;
    }
  }
  else if ((Class)objc_opt_class() == a3)
  {
    id v9 = PFCurrentPlatformLivePhotoBundleType();
    id v10 = [v9 identifier];

    if (v10)
    {
LABEL_6:
      id v11 = [(PUPhotosFileProviderItemProvider *)self _progressURLForTypeIdentifier:v10];
      if (v11)
      {
        id v12 = [MEMORY[0x263F08C38] UUID];
        objc_initWeak((id *)buf, self);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke;
        v25[3] = &unk_2642C52C0;
        id v13 = v6;
        id v26 = v13;
        id v14 = [(PUPhotosFileProviderItemProvider *)self _startProgressForURL:v11 UUID:v12 cancellationHandler:v25];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke_2;
        v21[3] = &unk_2642C52E8;
        objc_copyWeak(&v24, (id *)buf);
        id v15 = v12;
        id v22 = v15;
        id v23 = v13;
        v20.receiver = self;
        v20.super_class = (Class)PUPhotosFileProviderItemProvider;
        id v16 = [(PUPhotosFileProviderItemProvider *)&v20 loadObjectOfClass:a3 completionHandler:v21];

        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v19.receiver = self;
        v19.super_class = (Class)PUPhotosFileProviderItemProvider;
        id v14 = [(PUPhotosFileProviderItemProvider *)&v19 loadObjectOfClass:a3 completionHandler:v6];
      }

      goto LABEL_12;
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PUPhotosFileProviderItemProvider;
  id v14 = [(PUPhotosFileProviderItemProvider *)&v18 loadObjectOfClass:a3 completionHandler:v6];
LABEL_12:

  return v14;
}

uint64_t __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke_3;
  v12[3] = &unk_2642C56B0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [WeakRetained _completeProgressWithUUID:v8 success:v5 != 0 completionHandler:v12];
}

uint64_t __72__PUPhotosFileProviderItemProvider_loadObjectOfClass_completionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(PUPhotosFileProviderItemProvider *)self _progressSubscriberByUUID];

  if (v3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = [(PUPhotosFileProviderItemProvider *)self _progressSubscriberByUUID];
    id v5 = [v4 allValues];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          [MEMORY[0x263F08AB8] removeSubscriber:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }
  }
  id v10 = [(PUPhotosFileProviderItemProvider *)self _progressProxyByUUID];

  if (v10)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = [(PUPhotosFileProviderItemProvider *)self _progressProxyByUUID];
    id v12 = [v11 allValues];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_super v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          objc_super v18 = NSStringFromSelector(sel_fractionCompleted);
          [v17 removeObserver:self forKeyPath:v18 context:PUPhotosFileProviderItemProviderContext];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)PUPhotosFileProviderItemProvider;
  [(PUPhotosFileProviderItemProvider *)&v19 dealloc];
}

- (PUPhotosFileProviderItemProvider)initWithProgressURLs:(id)a3 progressURLSandboxExtensionTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUPhotosFileProviderItemProvider;
  uint64_t v8 = [(PUPhotosFileProviderItemProvider *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    progressURLs = v8->_progressURLs;
    v8->_progressURLs = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    progressURLSandboxExtensionTokens = v8->_progressURLSandboxExtensionTokens;
    v8->_progressURLSandboxExtensionTokens = (NSDictionary *)v11;
  }
  return v8;
}

@end