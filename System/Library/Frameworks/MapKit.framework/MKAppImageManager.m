@interface MKAppImageManager
+ (id)sharedCollectionCoverImageManager;
+ (id)sharedImageManager;
+ (id)sharedImageManagerWithAuditToken:(id)a3;
- (MKAppImageManager)init;
- (MKAppImageManager)initWithURLCache:(id)a3;
- (MKAppImageManager)initWithURLCache:(id)a3 auditToken:(id)a4;
- (id)cachedImageAtURL:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_dispatchOnManThread:(id)a3;
- (void)cancelLoadAppImageAtURL:(id)a3;
- (void)clearImageCache;
- (void)loadAppImageAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation MKAppImageManager

+ (id)sharedCollectionCoverImageManager
{
  if (qword_1EB315C10 != -1) {
    dispatch_once(&qword_1EB315C10, &__block_literal_global_1);
  }
  v2 = (void *)qword_1EB315C08;

  return v2;
}

uint64_t __57__MKAppImageManager_loadAppImageAtURL_completionHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 32) setObject:a1[5] forKey:a1[6]];
}

uint64_t __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_64(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  v9 = (void (**)(id, void))a6;
  v7 = [a5 MIMEType];
  unsigned int v8 = [v7 containsString:@"image"];

  v9[2](v9, v8);
}

uint64_t __42__MKAppImageManager__dispatchOnManThread___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 1, 0);
}

void __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v10 || [v10 code] != -999)
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__1;
    v49 = __Block_byref_object_dispose__1;
    id v50 = 0;
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    v40 = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke;
    v41 = &unk_1E54B8298;
    v44 = &v45;
    v42 = self;
    id v12 = v9;
    id v43 = v12;
    geo_isolate_sync();
    v13 = (void *)v46[5];
    if (v11)
    {
      if (v13)
      {
        v14 = MKGetAppImageManagerLog();
        os_signpost_id_t v15 = [(id)v46[5] signpostID];
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18BAEC000, v14, OS_SIGNPOST_INTERVAL_END, v15, "DownloadImage", (const char *)&unk_18BD3917F, buf, 2u);
        }

        iconCache = self->_iconCache;
        v17 = [(id)v46[5] urlString];
        v18 = [(NSCache *)iconCache objectForKey:v17];

        v19 = [(id)v46[5] completionHandler];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_60;
        v33[3] = &unk_1E54B8338;
        id v20 = v18;
        id v34 = v20;
        id v21 = v19;
        id v36 = v21;
        id v35 = v11;
        [(MKAppImageManager *)self _dispatchOnManThread:v33];
        v31[12] = MEMORY[0x1E4F143A8];
        v31[13] = 3221225472;
        v31[14] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2;
        v31[15] = &unk_1E54B8248;
        v31[16] = self;
        id v32 = v12;
        geo_isolate_sync();
        v31[6] = MEMORY[0x1E4F143A8];
        v31[7] = 3221225472;
        v31[8] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_3;
        v31[9] = &unk_1E54B8310;
        v31[10] = self;
        v31[11] = &v45;
        geo_isolate_sync();

        v22 = v34;
LABEL_20:
      }
    }
    else if (v13)
    {
      id v20 = [v13 completionHandler];
      id v21 = [(id)v46[5] data];
      if ([v21 length]) {
        v22 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v21];
      }
      else {
        v22 = 0;
      }
      v23 = MKGetAppImageManagerLog();
      os_signpost_id_t v24 = [(id)v46[5] signpostID];
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18BAEC000, v23, OS_SIGNPOST_INTERVAL_END, v24, "DownloadImage", (const char *)&unk_18BD3917F, buf, 2u);
      }

      if (v22)
      {
        v25 = self->_iconCache;
        v26 = [(id)v46[5] urlString];
        [(NSCache *)v25 setObject:v22 forKey:v26];

        v27 = v31;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_62;
        v31[3] = &unk_1E54B8360;
        v31[5] = v20;
        v31[4] = v22;
        [(MKAppImageManager *)self _dispatchOnManThread:v31];
      }
      else
      {
        v27 = v30;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2_63;
        v30[3] = &unk_1E54B8388;
        v30[6] = &v45;
        id v28 = v20;
        v30[4] = 0;
        v30[5] = v28;
        [(MKAppImageManager *)self _dispatchOnManThread:v30];
      }

      id v29 = v12;
      geo_isolate_sync();
      geo_isolate_sync();

      goto LABEL_20;
    }

    _Block_object_dispose(&v45, 8);
  }
}

- (void)loadAppImageAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, uint64_t, uint64_t, void))a4;
  id v8 = [v6 absoluteString];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    iconCache = self->_iconCache;
    v11 = [v6 absoluteString];
    id v12 = [(NSCache *)iconCache objectForKey:v11];

    if (v12)
    {
      v13 = MKGetAppImageManagerLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = [v6 absoluteString];
        *(_DWORD *)buf = 138412290;
        v37 = v14;
        _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_DEBUG, "[✔]Returning Cached image for url: %@", buf, 0xCu);
      }
      v7[2](v7, v12, 1, 1, 0);
    }
    else
    {
      os_signpost_id_t v15 = objc_alloc_init(_MKAppImageManagerContainer);
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [(_MKAppImageManagerContainer *)v15 setData:v16];

      [(_MKAppImageManagerContainer *)v15 setCompletionHandler:v7];
      v17 = [v6 absoluteString];
      [(_MKAppImageManagerContainer *)v15 setUrlString:v17];

      v18 = MKGetAppImageManagerLog();
      [(_MKAppImageManagerContainer *)v15 setSignpostID:os_signpost_id_generate(v18)];

      v19 = (void *)[objc_alloc(MEMORY[0x1E4F290D0]) initWithURL:v6 cachePolicy:0 timeoutInterval:5.0];
      id v20 = [(NSURLSession *)self->_session dataTaskWithRequest:v19];
      if (v20
        && ([v6 absoluteString], id v21 = objc_claimAutoreleasedReturnValue(),
                                                v21,
                                                v21))
      {
        id v34 = v15;
        id v35 = v20;
        geo_isolate_sync();
        uint64_t v31 = MEMORY[0x1E4F143A8];
        id v32 = self;
        id v22 = v35;
        id v33 = v6;
        geo_isolate_sync();
        v23 = MKGetAppImageManagerLog();
        uint64_t v24 = [(_MKAppImageManagerContainer *)v34 signpostID];
        if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v25 = v24;
          if (os_signpost_enabled(v23))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18BAEC000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v25, "DownloadImage", (const char *)&unk_18BD3917F, buf, 2u);
          }
        }

        [v22 resume];
      }
      else
      {
        v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MKAppImageManager" code:1001 userInfo:0];
        v27 = MKGetAppImageManagerLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v28 = [v6 absoluteString];
          *(_DWORD *)buf = 138412546;
          v37 = v26;
          __int16 v38 = 2112;
          uint64_t v39 = v28;
          _os_log_impl(&dword_18BAEC000, v27, OS_LOG_TYPE_ERROR, "[X] Error: %@ for Url: %@", buf, 0x16u);
        }
        ((void (**)(id, void *, uint64_t, uint64_t, void *))v7)[2](v7, 0, 0, 0, v26);
      }
      id v12 = 0;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MKAppImageManager" code:1001 userInfo:0];
    id v29 = MKGetAppImageManagerLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = [v6 absoluteString];
      *(_DWORD *)buf = 138412546;
      v37 = v12;
      __int16 v38 = 2112;
      uint64_t v39 = v30;
      _os_log_impl(&dword_18BAEC000, v29, OS_LOG_TYPE_ERROR, "[X] Error: %@ for Url: %@", buf, 0x16u);
    }
    ((void (**)(id, void *, uint64_t, uint64_t, void *))v7)[2](v7, 0, 0, 0, v12);
  }
}

void __57__MKAppImageManager_loadAppImageAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = [*(id *)(a1 + 48) absoluteString];
  [v2 setObject:v1 forKey:v3];
}

void __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2_65(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) urlString];
  [v1 removeObjectForKey:v2];
}

- (void)_dispatchOnManThread:(id)a3
{
  id v3 = (void (**)(void))a3;
  if (v3)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v3[2](v3);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__MKAppImageManager__dispatchOnManThread___block_invoke;
      block[3] = &unk_1E54B82E8;
      v5 = v3;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: block", buf, 2u);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v10 = a5;
  v7 = [(NSMapTable *)self->_containers objectForKey:a4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 data];
    [v9 appendData:v10];
  }
}

- (MKAppImageManager)initWithURLCache:(id)a3 auditToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MKAppImageManager;
  id v8 = [(MKAppImageManager *)&v25 init];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v9 setName:@"com.apple.MapKit.AppImageManager.URLSession"];
    [v9 setQualityOfService:25];
    [v9 setMaxConcurrentOperationCount:2];
    id v10 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    v11 = v10;
    if (v6) {
      [v10 setURLCache:v6];
    }
    if (v7) {
      objc_msgSend(v11, "geo_setApplicationAttribution:", v7);
    }
    uint64_t v12 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v11 delegate:v8 delegateQueue:v9];
    session = v8->_session;
    v8->_session = (NSURLSession *)v12;

    v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    iconCache = v8->_iconCache;
    v8->_iconCache = v14;

    uint64_t v16 = geo_isolater_create();
    containersLock = v8->_containersLock;
    v8->_containersLock = (geo_isolater *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    containers = v8->_containers;
    v8->_containers = (NSMapTable *)v18;

    uint64_t v20 = geo_isolater_create();
    urlConnectionsLock = v8->_urlConnectionsLock;
    v8->_urlConnectionsLock = (geo_isolater *)v20;

    id v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    urlConnections = v8->_urlConnections;
    v8->_urlConnections = v22;
  }
  return v8;
}

+ (id)sharedImageManager
{
  return (id)[a1 sharedImageManagerWithAuditToken:0];
}

+ (id)sharedImageManagerWithAuditToken:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MKAppImageManager_sharedImageManagerWithAuditToken___block_invoke;
  block[3] = &unk_1E54B8188;
  id v9 = v3;
  uint64_t v4 = qword_1EB315C00;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB315C00, block);
  }
  id v6 = (id)_MergedGlobals_125;

  return v6;
}

void __54__MKAppImageManager_sharedImageManagerWithAuditToken___block_invoke(uint64_t a1)
{
  uint64_t v1 = [[MKAppImageManager alloc] initWithURLCache:0 auditToken:*(void *)(a1 + 32)];
  id v2 = (void *)_MergedGlobals_125;
  _MergedGlobals_125 = (uint64_t)v1;
}

void __54__MKAppImageManager_sharedCollectionCoverImageManager__block_invoke()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v1 = [v0 URLsForDirectory:13 inDomains:1];
  id v2 = [v1 firstObject];

  id v3 = [v2 URLByAppendingPathComponent:@"MKCollectionCoverPhotoCache"];
  if (v3)
  {
    uint64_t UInteger = GEOConfigGetUInteger();
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F29078]) initWithMemoryCapacity:UInteger diskCapacity:GEOConfigGetUInteger() directoryURL:v3];
  }
  else
  {
    id v7 = 0;
  }
  id v5 = [[MKAppImageManager alloc] initWithURLCache:v7];
  id v6 = (void *)qword_1EB315C08;
  qword_1EB315C08 = (uint64_t)v5;
}

- (MKAppImageManager)initWithURLCache:(id)a3
{
  return [(MKAppImageManager *)self initWithURLCache:a3 auditToken:0];
}

- (MKAppImageManager)init
{
  return [(MKAppImageManager *)self initWithURLCache:0 auditToken:0];
}

- (void)clearImageCache
{
  id v3 = MKGetAppImageManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_ERROR, "Clearing image cache.", v4, 2u);
  }

  [(NSCache *)self->_iconCache removeAllObjects];
}

- (id)cachedImageAtURL:(id)a3
{
  iconCache = self->_iconCache;
  uint64_t v4 = [a3 absoluteString];
  id v5 = [(NSCache *)iconCache objectForKey:v4];

  return v5;
}

- (void)cancelLoadAppImageAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = __Block_byref_object_copy__1;
  uint64_t v39 = __Block_byref_object_dispose__1;
  id v40 = 0;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke;
  uint64_t v31 = &unk_1E54B8298;
  id v34 = &v35;
  id v32 = self;
  id v5 = v4;
  id v33 = v5;
  geo_isolate_sync();
  id v6 = (void *)v36[5];
  if (v6)
  {
    [v6 cancel];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    objc_super v25 = __Block_byref_object_copy__1;
    v26 = __Block_byref_object_dispose__1;
    id v27 = 0;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_2;
    uint64_t v18 = &unk_1E54B82C0;
    v19 = self;
    uint64_t v20 = &v22;
    id v21 = &v35;
    geo_isolate_sync();
    id v7 = MKGetAppImageManagerLog();
    os_signpost_id_t v8 = [(id)v23[5] signpostID];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v7, OS_SIGNPOST_EVENT, v8, "DownloadCancelled", (const char *)&unk_18BD3917F, buf, 2u);
    }

    id v9 = [(id)v23[5] completionHandler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_54;
    v12[3] = &unk_1E54B82E8;
    id v10 = v9;
    id v13 = v10;
    [(MKAppImageManager *)self _dispatchOnManThread:v12];
    geo_isolate_sync();
    id v11 = v5;
    geo_isolate_sync();

    _Block_object_dispose(&v22, 8);
  }

  _Block_object_dispose(&v35, 8);
}

void __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = [*(id *)(a1 + 40) absoluteString];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKey:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_2_55(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __45__MKAppImageManager_cancelLoadAppImageAtURL___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = [*(id *)(a1 + 40) absoluteString];
  [v1 removeObjectForKey:v2];
}

uint64_t __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

void __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) urlString];
  [v1 removeObjectForKey:v2];
}

void __58__MKAppImageManager_URLSession_task_didCompleteWithError___block_invoke_2_63(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MKAppImageManager" code:1002 userInfo:0];
  uint64_t v3 = MKGetAppImageManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) urlString];
    int v5 = 138412546;
    id v6 = v2;
    __int16 v7 = 2112;
    os_signpost_id_t v8 = v4;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_ERROR, "[X] Formatting Error: %@ for Url: %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlConnections, 0);
  objc_storeStrong((id *)&self->_urlConnectionsLock, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_containersLock, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_iconCache, 0);
}

@end