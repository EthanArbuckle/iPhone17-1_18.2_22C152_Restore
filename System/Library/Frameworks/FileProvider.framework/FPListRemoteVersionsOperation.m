@interface FPListRemoteVersionsOperation
- (BOOL)includeCachedVersions;
- (BOOL)isSandboxExtensionConsumed;
- (FPListRemoteVersionsOperation)initWithDocumentURL:(id)a3;
- (id)fp_prettyDescription;
- (void)isSandboxExtensionConsumed;
- (void)main;
- (void)setIncludeCachedVersions:(BOOL)a3;
@end

@implementation FPListRemoteVersionsOperation

- (FPListRemoteVersionsOperation)initWithDocumentURL:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"FPListRemoteVersionsOperation.m", 34, @"url can not be nil: %@", 0 object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)FPListRemoteVersionsOperation;
  v7 = [(FPOperation *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_documentURL, a3);
    uint64_t v9 = objc_opt_new();
    queue = v8->_queue;
    v8->_queue = (NSOperationQueue *)v9;

    [(NSOperationQueue *)v8->_queue setMaxConcurrentOperationCount:1];
  }

  return v8;
}

- (void)main
{
  v3 = +[FPDaemonConnection sharedConnectionProxy];
  documentURL = self->_documentURL;
  BOOL v5 = [(FPListRemoteVersionsOperation *)self includeCachedVersions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__FPListRemoteVersionsOperation_main__block_invoke;
  v6[3] = &unk_1E5AF52E8;
  v6[4] = self;
  [v3 listRemoteVersionsOfItemAtURL:documentURL includeCachedVersions:v5 completionHandler:v6];
}

void __37__FPListRemoteVersionsOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) finishedBlock];
    v11 = (void *)v10;
    if (v10)
    {
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v9);
      [*(id *)(a1 + 32) setFinishedBlock:0];
    }
LABEL_24:

    goto LABEL_25;
  }
  v12 = *(void **)(a1 + 32);
  if (v7)
  {
    if ([v12 isSandboxExtensionConsumed])
    {
      id v30 = v7;
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v29 = v8;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if ((objc_msgSend(v18, "hasThumbnail", v29) & 1) == 0)
            {
              v19 = [v18 version];
              v20 = [v19 contentVersion];
              [v11 setObject:v18 forKey:v20];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v15);
      }

      if ([v11 count])
      {
        v21 = +[FPItemManager defaultManager];
        v22 = [v11 allValues];
        v23 = objc_msgSend(v22, "fp_map:", &__block_literal_global_45);
        id v7 = v30;
        v24 = objc_msgSend(v21, "thumbnailsFetchOperationForItem:withVersions:withSize:scale:", v30, v23, 1024.0, 1024.0, 2.0);

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __37__FPListRemoteVersionsOperation_main__block_invoke_3;
        v32[3] = &unk_1E5AF52C0;
        id v33 = v11;
        [v24 setPerThumbnailWithVersionCompletionBlock:v32];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __37__FPListRemoteVersionsOperation_main__block_invoke_14;
        v31[3] = &unk_1E5AF1240;
        v31[4] = *(void *)(a1 + 32);
        [v24 setThumbnailsFetchCompletionBlock:v31];
        [*(id *)(a1 + 32) addDependency:v24];
        [*(id *)(*(void *)(a1 + 32) + 312) addOperation:v24];
        uint64_t v25 = [*(id *)(a1 + 32) finishedBlock];
        v26 = (void *)v25;
        if (v25)
        {
          (*(void (**)(uint64_t, id, void))(v25 + 16))(v25, v13, 0);
          [*(id *)(a1 + 32) setFinishedBlock:0];
        }
      }
      else
      {
        uint64_t v27 = [*(id *)(a1 + 32) finishedBlock];
        v28 = (void *)v27;
        id v7 = v30;
        if (v27)
        {
          (*(void (**)(uint64_t, id, void))(v27 + 16))(v27, v13, 0);
          [*(id *)(a1 + 32) setFinishedBlock:0];
        }

        [*(id *)(a1 + 32) completedWithResult:0 error:0];
      }
      id v8 = v29;
      goto LABEL_24;
    }
  }
  else
  {
    [v12 completedWithResult:MEMORY[0x1E4F1CBF0] error:0];
  }
LABEL_25:
}

uint64_t __37__FPListRemoteVersionsOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 version];
}

void __37__FPListRemoteVersionsOperation_main__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (v14)
  {
    v17 = *(void **)(a1 + 32);
    v18 = [v13 contentVersion];
    v19 = [v17 objectForKey:v18];

    v20 = [v19 physicalURL];
    id v38 = 0;
    int v21 = objc_msgSend(v20, "fp_associateThumbnailToVersionAtURL:thumbnailMetadata:error:", v14, v15, &v38);
    v22 = v38;

    v23 = fp_current_or_default_log();
    v24 = v23;
    if (v21)
    {
      id v37 = v16;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = [v19 url];
        v26 = [v19 physicalURL];
        *(_DWORD *)buf = 138413314;
        id v40 = v14;
        __int16 v41 = 2112;
        id v42 = v25;
        __int16 v43 = 2112;
        id v44 = v26;
        __int16 v45 = 2112;
        id v46 = v12;
        __int16 v47 = 2112;
        id v48 = v13;
        _os_log_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_INFO, "[INFO] Associated thumbnail %@ for %@ on the promised URL %@ for identifier: %@, version: %@", buf, 0x34u);
      }
      uint64_t v27 = NSString;
      v28 = [v19 url];
      id v29 = [v28 path];
      id v30 = [v27 stringWithFormat:@"com.apple.fileprovider.thumbnail-available.%@", v29];
      objc_msgSend(v30, "fp_libnotifyPerUserNotificationName");
      v32 = id v31 = v12;

      id v33 = (void *)v32;
      id v12 = v31;
      v24 = v33;
      notify_post((const char *)[v24 UTF8String]);
      id v16 = v37;
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      [v19 physicalURL];
      v35 = id v34 = v12;
      long long v36 = [v22 fp_prettyDescription];
      *(_DWORD *)buf = 138413314;
      id v40 = v35;
      __int16 v41 = 2112;
      id v42 = v34;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2112;
      id v46 = v14;
      __int16 v47 = 2114;
      id v48 = v36;
      _os_log_error_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_ERROR, "[ERROR] Failed to associate thumbnail data to promised URL %@ for identifier: %@, version: %@, thumbnailDataURL: %@, error: %{public}@", buf, 0x34u);

      id v12 = v34;
    }

    goto LABEL_11;
  }
  v22 = fp_current_or_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend(v16, "fp_prettyDescription");
    *(_DWORD *)buf = 138412802;
    id v40 = v12;
    __int16 v41 = 2112;
    id v42 = v13;
    __int16 v43 = 2112;
    id v44 = v19;
    _os_log_error_impl(&dword_1A33AE000, v22, OS_LOG_TYPE_ERROR, "[ERROR] No data for thumbnail with identifier: %@, version: %@, error: %@", buf, 0x20u);
LABEL_11:
  }
}

uint64_t __37__FPListRemoteVersionsOperation_main__block_invoke_14(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 304);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_INFO, "[INFO] finished fetching all thumbnails for: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) completedWithResult:0 error:0];
}

- (BOOL)isSandboxExtensionConsumed
{
  uint64_t v3 = [MEMORY[0x1E4F63BE8] manager];
  p_documentURL = (uint64_t *)&self->_documentURL;
  uint64_t v5 = *p_documentURL;
  id v10 = 0;
  id v6 = (id)[v3 permanentStorageForItemAtURL:v5 allocateIfNone:0 error:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(FPListRemoteVersionsOperation *)p_documentURL isSandboxExtensionConsumed];
    }
  }
  return v7 == 0;
}

- (id)fp_prettyDescription
{
  v2 = NSString;
  uint64_t v3 = [(NSURL *)self->_documentURL fp_shortDescription];
  v4 = [v2 stringWithFormat:@"list remote versions for URL (%@)", v3];

  return v4;
}

- (BOOL)includeCachedVersions
{
  return self->_includeCachedVersions;
}

- (void)setIncludeCachedVersions:(BOOL)a3
{
  self->_includeCachedVersions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_documentURL, 0);
}

- (void)isSandboxExtensionConsumed
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Failed to consume sandbox extension for URL %@. Error: %@", (uint8_t *)&v6, 0x16u);
}

@end