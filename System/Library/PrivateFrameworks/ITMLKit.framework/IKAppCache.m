@interface IKAppCache
+ (id)_appContextDelegateSelectors;
- (BOOL)appContext:(id)a3 shouldStartWithScript:(id)a4 scriptURL:(id)a5 loadedFromFallback:(BOOL)a6;
- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6;
- (BOOL)isOurDispatchQueue;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldIgnoreHTTPCache;
- (IKAppCache)initWithApplication:(id)a3;
- (IKAppCacheDelegate)delegate;
- (IKAppContext)validationContext;
- (IKAppContextDelegate)appContextDelegate;
- (IKApplication)app;
- (NSArray)appJSChecksumHistory;
- (NSString)appJSChecksum;
- (NSString)appLocalJSChecksum;
- (NSString)currentAppJSChecksum;
- (NSURL)appJSFileURL;
- (NSURL)appLocalJSFileURL;
- (NSURL)currentAppJSURL;
- (id)_cacheFileURLForAppJS:(id)a3 checksum:(id)a4 error:(id *)a5;
- (id)_validatedChecksumForScript:(id)a3 error:(id *)a4;
- (id)deviceConfigForContext:(id)a3;
- (id)modalControllerForContext:(id)a3;
- (id)navigationControllerForContext:(id)a3;
- (id)objectForMediaItem:(id)a3;
- (id)objectForPlayer:(id)a3;
- (id)objectForPlaylist:(id)a3;
- (id)tabBarForContext:(id)a3;
- (id)validationCompletionHandler;
- (unint64_t)status;
- (void)_checkManifest;
- (void)_cleanupValidationContext;
- (void)_loadManifest;
- (void)_performAsync:(id)a3;
- (void)_storeManifest;
- (void)appContext:(id)a3 didFailWithError:(id)a4;
- (void)appContext:(id)a3 didStartWithOptions:(id)a4 validatedJSString:(id)a5;
- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5;
- (void)appJSURLWithCompletion:(id)a3;
- (void)cleanBlobStorageWithCompletion:(id)a3;
- (void)refreshWithCompletion:(id)a3;
- (void)setApp:(id)a3;
- (void)setAppContextDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldIgnoreHTTPCache:(BOOL)a3;
- (void)setValidationCompletionHandler:(id)a3;
- (void)updateCacheWithValidatedJS:(id)a3 completion:(id)a4;
@end

@implementation IKAppCache

- (IKAppCache)initWithApplication:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 appJSCachePath];
  }
  else
  {
    v5 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    v6 = [v4 appLocalJSURL];
  }
  else
  {
    v6 = 0;
  }
  if ([v5 isFileURL])
  {
    v7 = [v5 path];
    if (v7)
    {
      char v36 = 0;
      v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v9 = [v8 fileExistsAtPath:v7 isDirectory:&v36];

      if (v9) {
        goto LABEL_30;
      }
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v35 = 0;
      int v11 = [v10 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v35];
      id v12 = v35;

      char v36 = v11;
      if ((v11 & 1) == 0)
      {
        v13 = ITMLKitGetLogObject(2);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[IKAppCache initWithApplication:]();
        }
      }
      if (((v11 ^ 1) & 1) == 0)
      {
LABEL_30:
        if (v36)
        {
          v34.receiver = self;
          v34.super_class = (Class)IKAppCache;
          v14 = [(IKAppCache *)&v34 init];
          self = v14;
          if (v14)
          {
            v14->_status = 0;
            objc_storeWeak((id *)&v14->_app, v4);
            self->_shouldIgnoreHTTPCache = 1;
            v15 = NSString;
            v16 = [MEMORY[0x1E4F28B50] mainBundle];
            v17 = [v16 bundleIdentifier];
            v18 = [v15 stringWithFormat:@"%@.ITML.cache", v17];

            id v19 = v18;
            v20 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v19 cStringUsingEncoding:1], 0);
            appCacheQueue = self->_appCacheQueue;
            self->_appCacheQueue = v20;

            v22 = self->_appCacheQueue;
            v23 = dispatch_get_global_queue(17, 0);
            dispatch_set_target_queue(v22, v23);

            dispatch_queue_set_specific((dispatch_queue_t)self->_appCacheQueue, "kIKAppCacheQueueTag", self, 0);
            v24 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
            appJSFileURL = self->_appJSFileURL;
            self->_appJSFileURL = v24;

            v26 = [MEMORY[0x1E4F28CB8] defaultManager];
            v27 = [(IKAppCache *)v6 path];
            LODWORD(v23) = [v26 fileExistsAtPath:v27];

            if (v23)
            {
              v28 = v6;
              p_super = &self->_appLocalJSFileURL->super;
              self->_appLocalJSFileURL = v28;
            }
            else
            {
              p_super = ITMLKitGetLogObject(2);
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v6;
                _os_log_impl(&dword_1E2ACE000, p_super, OS_LOG_TYPE_INFO, "Bundle JS does not exist at %@", buf, 0xCu);
              }
            }

            v30 = ITMLKitGetLogObject(2);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v7;
              _os_log_impl(&dword_1E2ACE000, v30, OS_LOG_TYPE_INFO, "Cache created with cache path: %@", buf, 0xCu);
            }

            objc_initWeak((id *)buf, self);
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __34__IKAppCache_initWithApplication___block_invoke;
            v32[3] = &unk_1E6DE3C70;
            objc_copyWeak(&v33, (id *)buf);
            [(IKAppCache *)self _performAsync:v32];
            objc_destroyWeak(&v33);
            objc_destroyWeak((id *)buf);
          }
        }
      }
      self = self;

      v7 = self;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __34__IKAppCache_initWithApplication___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _loadManifest];
    id WeakRetained = v2;
  }
}

- (BOOL)isOurDispatchQueue
{
  specific = (IKAppCache *)dispatch_get_specific("kIKAppCacheQueueTag");
  return specific && specific == self;
}

- (void)_performAsync:(id)a3
{
}

- (void)appJSURLWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__IKAppCache_appJSURLWithCompletion___block_invoke;
    v5[3] = &unk_1E6DE3C98;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    [(IKAppCache *)self _performAsync:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __37__IKAppCache_appJSURLWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained status];

  if (v4 != 2)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 _loadManifest];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  id v7 = [v10 currentAppJSURL];
  id v8 = objc_loadWeakRetained(v2);
  char v9 = [v8 currentAppJSChecksum];
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v9);
}

- (void)_storeManifest
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1E2ACE000, v0, v1, "IKAppCache manifest.json could not be written to %@", v2, v3, v4, v5, v6);
}

- (void)_loadManifest
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1E2ACE000, v0, v1, "IKAppCache manifest.json could not be parsed: %@", v2, v3, v4, v5, v6);
}

- (void)_checkManifest
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E2ACE000, v0, v1, "Unable to get file attributes for bundleJS (%@): %@");
}

- (void)refreshWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__IKAppCache_refreshWithCompletion___block_invoke;
  v6[3] = &unk_1E6DE3C98;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(IKAppCache *)self _performAsync:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __36__IKAppCache_refreshWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained validationContext];

    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        uint8_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IKAppCacheErrorDomain" code:2 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
      }
    }
    else
    {
      id v7 = ITMLKitGetLogObject(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2ACE000, v7, OS_LOG_TYPE_INFO, "Creating validation context for cache refresh...", buf, 2u);
      }

      uint64_t v8 = MEMORY[0x1E4E65800](*(void *)(a1 + 32));
      char v9 = (void *)*((void *)v3 + 15);
      *((void *)v3 + 15) = v8;

      id v10 = [v3 app];
      if (objc_opt_respondsToSelector())
      {
        int v11 = [v10 bagBootURLKey];
      }
      else
      {
        int v11 = 0;
      }
      id v12 = ITMLKitGetLogObject(2);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        if (v11) {
          [NSString stringWithFormat:@"bagBootURLKey: %@", v11];
        }
        else {
        v13 = [v10 appJSURL];
        }
        *(_DWORD *)buf = 138412290;
        id v19 = v13;
        _os_log_impl(&dword_1E2ACE000, v12, OS_LOG_TYPE_INFO, "Using %@ for cache refresh validation context...", buf, 0xCu);
      }
      v14 = [[IKAppContext alloc] initWithApplication:v10 mode:1000 cache:0 delegate:v3];
      [(IKAppContext *)v14 setRemoteInspectionEnabled:0];
      objc_storeStrong((id *)v3 + 14, v14);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__IKAppCache_refreshWithCompletion___block_invoke_51;
      block[3] = &unk_1E6DE3CC0;
      v17 = v14;
      v15 = v14;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __36__IKAppCache_refreshWithCompletion___block_invoke_51(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)cleanBlobStorageWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__IKAppCache_cleanBlobStorageWithCompletion___block_invoke;
  v6[3] = &unk_1E6DE3CE8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  void v6[4] = self;
  id v7 = v5;
  [(IKAppCache *)self _performAsync:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__IKAppCache_cleanBlobStorageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained appJSChecksumHistory];
  id v5 = (void *)[v4 copy];

  uint8_t v6 = ITMLKitGetLogObject(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v42 = [v5 count];
    _os_log_impl(&dword_1E2ACE000, v6, OS_LOG_TYPE_INFO, "Blob Storage clean of %lu entries requested...", buf, 0xCu);
  }

  id v7 = objc_loadWeakRetained(v2);
  id v8 = v7;
  if (v7)
  {
    char v9 = [v7 validationContext];

    if (!v9)
    {
      id v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v32 = v5;
      id v13 = v5;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v36;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * v17);
            id v19 = [*(id *)(a1 + 32) appJSFileURL];
            uint64_t v20 = [v19 URLByAppendingPathComponent:v18];
            v21 = [v20 path];

            v22 = [MEMORY[0x1E4F28CB8] defaultManager];
            LODWORD(v19) = [v22 fileExistsAtPath:v21];

            if (v19)
            {
              v23 = [MEMORY[0x1E4F28CB8] defaultManager];
              id v34 = 0;
              char v24 = [v23 removeItemAtPath:v21 error:&v34];
              id v25 = v34;

              if ((v24 & 1) == 0)
              {
                [v33 addObject:v25];
                v26 = ITMLKitGetLogObject(2);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v42 = (uint64_t)v21;
                  __int16 v43 = 2112;
                  id v44 = v25;
                  _os_log_error_impl(&dword_1E2ACE000, v26, OS_LOG_TYPE_ERROR, "Failed to remove %@ when cleaning blob storage: %@", buf, 0x16u);
                }
              }
            }

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v45 count:16];
        }
        while (v15);
      }

      v27 = [v8 appJSChecksumHistory];
      [v27 removeAllObjects];

      v28 = ITMLKitGetLogObject(2);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2ACE000, v28, OS_LOG_TYPE_INFO, "Blob Storage clean completed...", buf, 2u);
      }

      id v12 = v33;
      if (*(void *)(a1 + 40))
      {
        if ([v33 count])
        {
          v29 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v39 = @"IKAppCacheUnderlyingErrorsKey";
          v40 = v33;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
          v31 = [v29 errorWithDomain:@"IKAppCacheErrorDomain" code:0 userInfo:v30];
        }
        else
        {
          v31 = 0;
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      id v5 = v32;
      goto LABEL_30;
    }
    id v10 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2ACE000, v10, OS_LOG_TYPE_INFO, "Blob Storage clean stopped because of ongoing validation...", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IKAppCacheErrorDomain" code:2 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
LABEL_30:
    }
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v5 = [(id)objc_opt_class() _appContextDelegateSelectors];
  uint8_t v6 = NSStringFromSelector(a3);
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v8 = [(IKAppCache *)self appContextDelegate];
    unsigned __int8 v9 = objc_opt_respondsToSelector();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IKAppCache;
    unsigned __int8 v9 = [(IKAppCache *)&v11 respondsToSelector:a3];
  }
  return v9 & 1;
}

- (BOOL)appContext:(id)a3 shouldStartWithScript:(id)a4 scriptURL:(id)a5 loadedFromFallback:(BOOL)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  uint8_t v6 = -[IKAppCache _validatedChecksumForScript:error:](self, "_validatedChecksumForScript:error:", a4, &v10, a5, a6);
  id v7 = v10;
  if (!v6)
  {
    id v8 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1E2ACE000, v8, OS_LOG_TYPE_INFO, "Refused start of evaluation for validation context: %@", buf, 0xCu);
    }
  }
  return v6 != 0;
}

- (void)appContext:(id)a3 didStartWithOptions:(id)a4 validatedJSString:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = ITMLKitGetLogObject(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 resolvedBootURL];
    *(_DWORD *)buf = 138412290;
    id v19 = v12;
    _os_log_impl(&dword_1E2ACE000, v11, OS_LOG_TYPE_INFO, "Validation context succeeded for %@...", buf, 0xCu);
  }
  uint64_t v13 = [(IKAppCache *)self validationCompletionHandler];
  [v8 stop];
  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__IKAppCache_appContext_didStartWithOptions_validatedJSString___block_invoke;
  v15[3] = &unk_1E6DE3D10;
  id v14 = v13;
  id v16 = v14;
  objc_copyWeak(&v17, (id *)buf);
  v15[4] = self;
  [(IKAppCache *)self updateCacheWithValidatedJS:v10 completion:v15];
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
}

void __63__IKAppCache_appContext_didStartWithOptions_validatedJSString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v12, v5);
  }
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v8 = [WeakRetained delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_super v11 = [v10 delegate];
      [v11 appCache:*(void *)(a1 + 32) didUpdateWithChecksum:v12];
    }
  }
}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ITMLKitGetLogObject(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[IKAppCache appContext:didFailWithError:](v6, (uint64_t)v7, v8);
  }

  char v9 = [(IKAppCache *)self validationCompletionHandler];
  [v6 stop];
  if (v9) {
    ((void (**)(void, void, id))v9)[2](v9, 0, v7);
  }
  [(IKAppCache *)self _cleanupValidationContext];
}

- (void)_cleanupValidationContext
{
  id v3 = ITMLKitGetLogObject(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E2ACE000, v3, OS_LOG_TYPE_INFO, "Cleaning up validation context...", v5, 2u);
  }

  validationContext = self->_validationContext;
  self->_validationContext = 0;

  [(IKAppCache *)self setValidationCompletionHandler:0];
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(IKAppCache *)self appContextDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(IKAppCache *)self appContextDelegate];
    [v9 appContext:v10 evaluateAppJavaScriptInContext:v6];
  }
}

- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(IKAppCache *)self appContextDelegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(IKAppCache *)self appContextDelegate];
    char v16 = [v15 appContext:v10 validateDOMDocument:v11 inContext:v12 error:a6];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)deviceConfigForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppCache *)self appContextDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IKAppCache *)self appContextDelegate];
    char v8 = [v7 deviceConfigForContext:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)navigationControllerForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppCache *)self appContextDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IKAppCache *)self appContextDelegate];
    char v8 = [v7 navigationControllerForContext:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)tabBarForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppCache *)self appContextDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IKAppCache *)self appContextDelegate];
    char v8 = [v7 tabBarForContext:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)modalControllerForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppCache *)self appContextDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IKAppCache *)self appContextDelegate];
    char v8 = [v7 navigationControllerForContext:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)objectForPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppCache *)self appContextDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IKAppCache *)self appContextDelegate];
    char v8 = [v7 objectForPlayer:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)objectForPlaylist:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppCache *)self appContextDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IKAppCache *)self appContextDelegate];
    char v8 = [v7 objectForPlaylist:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)objectForMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppCache *)self appContextDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IKAppCache *)self appContextDelegate];
    char v8 = [v7 objectForMediaItem:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  char v9 = [(IKAppCache *)self appContextDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(IKAppCache *)self appContextDelegate];
    [v11 appContext:v12 needsReloadWithUrgency:a4 options:v8];
  }
}

- (id)_validatedChecksumForScript:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v6 = _IKStringHash(a3);
  id v7 = [(IKAppCache *)self appLocalJSChecksum];
  int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    char v9 = ITMLKitGetLogObject(2);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    int v14 = 138412290;
    uint64_t v15 = v6;
    char v10 = "New AppJS checksum matched current appLocalJS checksum: %@";
    goto LABEL_7;
  }
  id v11 = [(IKAppCache *)self appJSChecksum];
  int v12 = [v11 isEqualToString:v6];

  if (!v12) {
    goto LABEL_11;
  }
  char v9 = ITMLKitGetLogObject(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    uint64_t v15 = v6;
    char v10 = "New AppJS checksum matched currently cached AppJS checksum: %@";
LABEL_7:
    _os_log_impl(&dword_1E2ACE000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, 0xCu);
  }
LABEL_8:

  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"IKAppCacheErrorDomain" code:1 userInfo:0];
    char v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v6 = 0;
  }
LABEL_11:
  return v6;
}

- (void)updateCacheWithValidatedJS:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__IKAppCache_updateCacheWithValidatedJS_completion___block_invoke;
  v10[3] = &unk_1E6DE3D38;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(IKAppCache *)self _performAsync:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__IKAppCache_updateCacheWithValidatedJS_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = 0;
  id v5 = [WeakRetained _validatedChecksumForScript:v4 error:&v13];
  id v6 = v13;

  if (v5)
  {
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = *(void *)(a1 + 32);
    id v12 = v6;
    id v9 = (id)[v7 _cacheFileURLForAppJS:v8 checksum:v5 error:&v12];
    id v10 = v12;

    id v6 = v10;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v5, v6);
  }
}

- (id)_cacheFileURLForAppJS:(id)a3 checksum:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v11 = [(IKAppCache *)self appJSFileURL];
    id v12 = [v11 path];
    id v13 = [v12 stringByAppendingPathComponent:v9];
    int v14 = [v10 fileURLWithPath:v13];

    uint64_t v15 = [v8 dataUsingEncoding:4];
    uint64_t v16 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v14;
      _os_log_impl(&dword_1E2ACE000, v16, OS_LOG_TYPE_INFO, "Writing validated Javascript to %@", buf, 0xCu);
    }

    id v17 = [v14 path];
    char v18 = [v15 writeToFile:v17 atomically:1];

    if (v18)
    {
      id v33 = v15;
      id obj = v14;
      id v19 = [(IKAppCache *)self appJSChecksum];

      if (v19)
      {
        uint64_t v20 = [(IKAppCache *)self appJSChecksumHistory];
        v21 = [(IKAppCache *)self appJSChecksum];
        [v20 addObject:v21];
      }
      v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v23 = [(IKAppCache *)self appJSChecksumHistory];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if ([v28 isEqualToString:v9]) {
              [v22 addObject:v28];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v25);
      }

      v29 = [(IKAppCache *)self appJSChecksumHistory];
      [v29 removeObjectsInArray:v22];

      objc_storeStrong((id *)&self->_appJSChecksum, a4);
      int v14 = obj;
      objc_storeStrong((id *)&self->_currentAppJSURL, obj);
      objc_storeStrong((id *)&self->_currentAppJSChecksum, a4);
      [(IKAppCache *)self _storeManifest];
      id v30 = obj;

      uint64_t v15 = v33;
    }
    else
    {
      v31 = ITMLKitGetLogObject(2);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[IKAppCache _cacheFileURLForAppJS:checksum:error:]();
      }

      if (a5)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"IKAppCacheErrorDomain" code:0 userInfo:0];
        id v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v30 = 0;
      }
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"IKAppCacheErrorDomain" code:0 userInfo:0];
    id v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

+ (id)_appContextDelegateSelectors
{
  if (_appContextDelegateSelectors_onceToken != -1) {
    dispatch_once(&_appContextDelegateSelectors_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = (void *)_appContextDelegateSelectors_selectors;
  return v2;
}

void __42__IKAppCache__appContextDelegateSelectors__block_invoke()
{
  unsigned int outCount = 0;
  objc_getProtocol("IKAppContextDelegate");
  uint64_t v0 = (Protocol *)objc_claimAutoreleasedReturnValue();
  os_log_t v1 = protocol_copyMethodDescriptionList(v0, 0, 1, &outCount);

  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:outCount];
  id v3 = (void *)_appContextDelegateSelectors_selectors;
  _appContextDelegateSelectors_selectors = v2;

  if (outCount)
  {
    unint64_t v4 = 0;
    p_name = &v1->name;
    do
    {
      id v6 = *p_name;
      p_name += 2;
      id v7 = (void *)_appContextDelegateSelectors_selectors;
      id v8 = NSStringFromSelector(v6);
      [v7 addObject:v8];

      ++v4;
    }
    while (v4 < outCount);
  }
  free(v1);
  objc_getProtocol("IKAppContextDelegate");
  id v9 = (Protocol *)objc_claimAutoreleasedReturnValue();
  id v10 = protocol_copyMethodDescriptionList(v9, 1, 1, &outCount);

  if (outCount)
  {
    unint64_t v11 = 0;
    id v12 = &v10->name;
    do
    {
      id v13 = *v12;
      v12 += 2;
      int v14 = (void *)_appContextDelegateSelectors_selectors;
      uint64_t v15 = NSStringFromSelector(v13);
      [v14 addObject:v15];

      ++v11;
    }
    while (v11 < outCount);
  }
  free(v10);
}

- (BOOL)shouldIgnoreHTTPCache
{
  return self->_shouldIgnoreHTTPCache;
}

- (void)setShouldIgnoreHTTPCache:(BOOL)a3
{
  self->_shouldIgnoreHTTPCache = a3;
}

- (IKAppContextDelegate)appContextDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContextDelegate);
  return (IKAppContextDelegate *)WeakRetained;
}

- (void)setAppContextDelegate:(id)a3
{
}

- (IKAppCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKAppCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)currentAppJSURL
{
  return self->_currentAppJSURL;
}

- (NSString)currentAppJSChecksum
{
  return self->_currentAppJSChecksum;
}

- (NSURL)appLocalJSFileURL
{
  return self->_appLocalJSFileURL;
}

- (NSString)appLocalJSChecksum
{
  return self->_appLocalJSChecksum;
}

- (NSURL)appJSFileURL
{
  return self->_appJSFileURL;
}

- (NSString)appJSChecksum
{
  return self->_appJSChecksum;
}

- (NSArray)appJSChecksumHistory
{
  return self->_appJSChecksumHistory;
}

- (IKApplication)app
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_app);
  return (IKApplication *)WeakRetained;
}

- (void)setApp:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (IKAppContext)validationContext
{
  return self->_validationContext;
}

- (id)validationCompletionHandler
{
  return self->_validationCompletionHandler;
}

- (void)setValidationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_validationContext, 0);
  objc_destroyWeak((id *)&self->_app);
  objc_storeStrong((id *)&self->_appJSChecksumHistory, 0);
  objc_storeStrong((id *)&self->_appJSChecksum, 0);
  objc_storeStrong((id *)&self->_appJSFileURL, 0);
  objc_storeStrong((id *)&self->_appLocalJSChecksum, 0);
  objc_storeStrong((id *)&self->_appLocalJSFileURL, 0);
  objc_storeStrong((id *)&self->_currentAppJSChecksum, 0);
  objc_storeStrong((id *)&self->_currentAppJSURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContextDelegate);
  objc_storeStrong((id *)&self->_appCacheQueue, 0);
}

- (void)initWithApplication:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E2ACE000, v0, v1, "IKAppCache directory could not be created at %@: %@");
}

- (void)appContext:(NSObject *)a3 didFailWithError:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 resolvedBootURL];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1E2ACE000, a3, OS_LOG_TYPE_ERROR, "Validation context failed for %@: %@", (uint8_t *)&v6, 0x16u);
}

- (void)_cacheFileURLForAppJS:checksum:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1E2ACE000, v0, v1, "Unable to write validated Javascript to %@", v2, v3, v4, v5, v6);
}

@end