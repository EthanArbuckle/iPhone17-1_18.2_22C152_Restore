@interface ATDownloadProgressManager
+ (id)sharedInstance;
- (ATDownloadProgressManager)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)assetLinkController:(id)a3 didChangeDownloadStateForAssets:(id)a4;
- (void)assetLinkController:(id)a3 didEnqueueAsset:(id)a4;
- (void)assetLinkController:(id)a3 didProcessFinishedAsset:(id)a4;
- (void)assetLinkController:(id)a3 didUpdateAsset:(id)a4;
- (void)getAllDownloadsWithReplyBlock:(id)a3;
- (void)prioritizeDownloadWithStoreForLibraryIdentifier:(int64_t)a3 withReplyBlock:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation ATDownloadProgressManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadObservers, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)prioritizeDownloadWithStoreForLibraryIdentifier:(int64_t)a3 withReplyBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void))a4;
  v6 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_DEFAULT, "got request to prioritize download with library identifier:%lld", (uint8_t *)&buf, 0xCu);
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1217;
  v16 = __Block_byref_object_dispose__1218;
  id v17 = 0;
  v8 = +[ATAssetLinkController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__ATDownloadProgressManager_prioritizeDownloadWithStoreForLibraryIdentifier_withReplyBlock___block_invoke;
  v10[3] = &unk_1E6B8C108;
  p_long long buf = &buf;
  v9 = v7;
  v11 = v9;
  [v8 prioritizeAssetWithStoreForLibraryIdentifier:a3 withCompletion:v10];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (v5) {
    v5[2](v5, *(void *)(*((void *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
}

void __92__ATDownloadProgressManager_prioritizeDownloadWithStoreForLibraryIdentifier_withReplyBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getAllDownloadsWithReplyBlock:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void *, void))a3;
  id v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "got request to get all downloads", (uint8_t *)v9, 2u);
  }

  if (v3)
  {
    v5 = +[ATAssetLinkController sharedInstance];
    v6 = [v5 allAssets];

    dispatch_semaphore_t v7 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v6 count];
      v9[0] = 67109120;
      v9[1] = v8;
      _os_log_impl(&dword_1D9BC7000, v7, OS_LOG_TYPE_DEFAULT, "total number of downloads in ATC queue (%d)", (uint8_t *)v9, 8u);
    }

    v3[2](v3, v6, 0);
  }
}

- (void)assetLinkController:(id)a3 didChangeDownloadStateForAssets:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  dispatch_semaphore_t v7 = (void *)[[v5 alloc] initWithArray:v6 copyItems:1];

  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__ATDownloadProgressManager_assetLinkController_didChangeDownloadStateForAssets___block_invoke;
  v10[3] = &unk_1E6B8C5A0;
  id v11 = v7;
  v12 = self;
  id v9 = v7;
  dispatch_sync(queue, v10);
}

void __81__ATDownloadProgressManager_assetLinkController_didChangeDownloadStateForAssets___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v23 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v33;
    id v22 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v9, "assetParts", v22))
        {
          if (v6 > 199)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v10 = *(id *)(*(void *)(v23 + 40) + 24);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v29;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v29 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  v15 = [*(id *)(*((void *)&v28 + 1) + 8 * j) remoteObjectProxyWithErrorHandler:&__block_literal_global_82];
                  [v15 atcDidUpdateDownloadStateForAssets:v2];
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
              }
              while (v12);
            }

            [v2 removeAllObjects];
            int v6 = 0;
            id v3 = v22;
          }
          else
          {
            ++v6;
            [v2 addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = *(id *)(*(void *)(v23 + 40) + 24);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v24 + 1) + 8 * k) remoteObjectProxyWithErrorHandler:&__block_literal_global_85];
          [v21 atcDidUpdateDownloadStateForAssets:v2];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v18);
    }

    [v2 removeAllObjects];
  }
}

void __81__ATDownloadProgressManager_assetLinkController_didChangeDownloadStateForAssets___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_ERROR, "failed to obtain remote proxy. err=%{public}@. could not send atcDidUpdateDownloadStateForAsset", (uint8_t *)&v4, 0xCu);
  }
}

void __81__ATDownloadProgressManager_assetLinkController_didChangeDownloadStateForAssets___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_ERROR, "failed to obtain remote proxy. err=%{public}@. could not send atcDidUpdateDownloadStateForAsset", (uint8_t *)&v4, 0xCu);
  }
}

- (void)assetLinkController:(id)a3 didProcessFinishedAsset:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ATDownloadProgressManager_assetLinkController_didProcessFinishedAsset___block_invoke;
  v8[3] = &unk_1E6B8C5A0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __73__ATDownloadProgressManager_assetLinkController_didProcessFinishedAsset___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) assetParts])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 24);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_78, (void)v11);
          int v8 = *(void **)(a1 + 32);
          id v9 = [v8 error];
          id v10 = objc_msgSend(v9, "msv_errorByRemovingUnsafeUserInfo");
          [v7 atcDidDownloadAsset:v8 withError:v10];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
}

void __73__ATDownloadProgressManager_assetLinkController_didProcessFinishedAsset___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_ERROR, "failed to obtain remote proxy. err=%{public}@. could not send atcDidDownloadAsset", (uint8_t *)&v4, 0xCu);
  }
}

- (void)assetLinkController:(id)a3 didUpdateAsset:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ATDownloadProgressManager_assetLinkController_didUpdateAsset___block_invoke;
  v8[3] = &unk_1E6B8C5A0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __64__ATDownloadProgressManager_assetLinkController_didUpdateAsset___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) assetParts])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 24);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_76, (void)v9);
          int v8 = *(void **)(a1 + 32);
          [v8 downloadProgress];
          objc_msgSend(v7, "atcDidUpdateAsset:withProgress:", v8);
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
}

void __64__ATDownloadProgressManager_assetLinkController_didUpdateAsset___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_ERROR, "failed to obtain remote proxy. err=%{public}@. could not send atcDidUpdateAsset", (uint8_t *)&v4, 0xCu);
  }
}

- (void)assetLinkController:(id)a3 didEnqueueAsset:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__ATDownloadProgressManager_assetLinkController_didEnqueueAsset___block_invoke;
  v8[3] = &unk_1E6B8C5A0;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __65__ATDownloadProgressManager_assetLinkController_didEnqueueAsset___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) assetParts])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 24);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_74, (void)v8);
          [v7 atcDidEnqueueAsset:*(void *)(a1 + 32)];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

void __65__ATDownloadProgressManager_assetLinkController_didEnqueueAsset___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_ERROR, "error sending did enqueue asset notification. failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 processIdentifier];
  long long v9 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    long long v27 = self;
    __int16 v28 = 1024;
    int v29 = v8;
    _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ got connection from pid %i", buf, 0x12u);
  }

  long long v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33EB1F0];
  long long v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v10 setClasses:v11 forSelector:sel_atcDidEnqueueAsset_ argumentIndex:0 ofReply:0];

  long long v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v10 setClasses:v12 forSelector:sel_atcDidDownloadAsset_withError_ argumentIndex:0 ofReply:0];

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v10 setClasses:v13 forSelector:sel_atcDidUpdateAsset_withProgress_ argumentIndex:0 ofReply:0];

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v10 setClasses:v14 forSelector:sel_atcDidUpdateDownloadStateForAssets_ argumentIndex:0 ofReply:0];

  v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33E5E88];
  [v7 setExportedInterface:v15];

  [v7 setRemoteObjectInterface:v10];
  [v7 setExportedObject:self];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E6B8C5A0;
  block[4] = self;
  id v17 = v7;
  id v25 = v17;
  dispatch_sync(queue, block);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_2;
  v22[3] = &unk_1E6B8C2E8;
  v22[4] = self;
  int v23 = v8;
  [v17 setInterruptionHandler:v22];
  objc_initWeak((id *)buf, v17);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_70;
  v19[3] = &unk_1E6B8C380;
  v19[4] = self;
  int v21 = v8;
  objc_copyWeak(&v20, (id *)buf);
  [v17 setInvalidationHandler:v19];
  [v17 resume];
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

  return 1;
}

uint64_t __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

void __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ connection interrupted from pid: %i", (uint8_t *)&v5, 0x12u);
  }
}

void __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_2_71;
  block[3] = &unk_1E6B8C380;
  block[4] = v1;
  int v5 = *(_DWORD *)(a1 + 48);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_sync(v2, block);
  objc_destroyWeak(&v4);
}

void __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_2_71(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 48);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ connection invalidated from pid: %i", (uint8_t *)&v7, 0x12u);
  }

  int v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 removeObject:WeakRetained];
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v6, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener invalidate];
    [(NSXPCListener *)self->_listener setDelegate:0];
  }
  int v5 = +[ATAssetLinkController sharedInstance];
  [v5 removeObserver:self];
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    __int16 v9 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v8, 0xCu);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F29290]);
  int v5 = (NSXPCListener *)[v4 initWithMachServiceName:*MEMORY[0x1E4F4A260]];
  listener = self->_listener;
  self->_listener = v5;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  int v7 = +[ATAssetLinkController sharedInstance];
  [v7 addObserver:self];
}

- (ATDownloadProgressManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATDownloadProgressManager;
  id v2 = [(ATDownloadProgressManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_t v5 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    downloadObservers = v2->_downloadObservers;
    v2->_downloadObservers = (NSMutableSet *)v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1252 != -1) {
    dispatch_once(&sharedInstance_onceToken_1252, &__block_literal_global_1253);
  }
  id v2 = (void *)__sharedInstance_1254;

  return v2;
}

uint64_t __43__ATDownloadProgressManager_sharedInstance__block_invoke()
{
  __sharedInstance_1254 = objc_alloc_init(ATDownloadProgressManager);

  return MEMORY[0x1F41817F8]();
}

@end