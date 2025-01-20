@interface ATLocalCloudAssetLink
- (ATAssetLinkDelegate)delegate;
- (ATLocalCloudAssetLink)initWithMessageLink:(id)a3;
- (BOOL)canEnqueueAsset:(id)a3;
- (BOOL)isOpen;
- (BOOL)linkIsReady;
- (BOOL)open;
- (id)enqueueAssets:(id)a3 force:(BOOL)a4;
- (unint64_t)maximumBatchSize;
- (unint64_t)priority;
- (void)_finishAsset:(id)a3 withError:(id)a4;
- (void)_handleLocalCloudDownloadResponse:(id)a3;
- (void)_requestNextDownload;
- (void)cancelAssets:(id)a3;
- (void)close;
- (void)dealloc;
- (void)messageLinkWasInitialized:(id)a3;
- (void)prioritizeAsset:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATLocalCloudAssetLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_queuedAssets, 0);
  objc_storeStrong((id *)&self->_messageLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ATAssetLinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATAssetLinkDelegate *)WeakRetained;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)_requestNextDownload
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 48) count] <= 1)
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectEnumerator];
    v3 = [v2 nextObject];

    if (v3)
    {
      [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v3];
      v20 = objc_alloc_init(ATLocalCloudAssetRequest);
      [(ATLocalCloudAssetRequest *)v20 setAsset:v3];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[ATLocalCloudAssetRequest setStartTime:](v20, "setStartTime:");
      v4 = *(void **)(*(void *)(a1 + 32) + 48);
      v5 = [v3 identifier];
      [v4 setObject:v20 forKey:v5];

      [v3 setAssetState:1];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
      uint64_t v7 = *(void *)(a1 + 32);
      v25[0] = v3;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [WeakRetained assetLink:v7 didTransitionAssetStates:v8];

      v23[0] = @"AssetID";
      v9 = [v3 identifier];
      v24[0] = v9;
      v23[1] = @"Dataclass";
      v10 = [v3 dataclass];
      v24[1] = v10;
      v23[2] = @"DSID";
      v11 = [v3 storeInfo];
      v12 = [v11 cloudDSID];
      v24[2] = v12;
      v23[3] = @"StoreSagaId";
      v13 = NSNumber;
      v14 = [v3 storeInfo];
      v15 = [v14 sagaID];
      v16 = objc_msgSend(v13, "numberWithLongLong:", objc_msgSend(v15, "longLongValue"));
      v24[3] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

      v18 = *(void **)(*(void *)(a1 + 32) + 32);
      v19 = [MEMORY[0x1E4F4A2C0] messageWithName:@"LocalCloudDownloadRequest" parameters:v17];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke_2;
      v21[3] = &unk_1E6B88BE0;
      v21[4] = *(void *)(a1 + 32);
      id v22 = v3;
      [v18 sendMessage:v19 withCompletion:v21];
    }
  }
}

void __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke_3;
  block[3] = &unk_1E6B88BB8;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = _ATLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_ERROR, "failed to send asset request message. err=%@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    [v4 _finishAsset:v5 withError:v6];

    [*(id *)(*(void *)(a1 + 40) + 32) close];
  }
  return [*(id *)(a1 + 40) _requestNextDownload];
}

- (void)_handleLocalCloudDownloadResponse:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ATLocalCloudAssetLink__handleLocalCloudDownloadResponse___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __59__ATLocalCloudAssetLink__handleLocalCloudDownloadResponse___block_invoke(uint64_t a1)
{
  v56[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) parameters];
  uint64_t v3 = [v2 objectForKey:@"AssetID"];

  id v4 = [*(id *)(a1 + 32) parameterForKey:@"ErrorCode"];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKey:v3];
  id v6 = [v5 asset];
  if (!v5)
  {
    uint64_t v9 = _ATLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v3;
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "ignoring unexpected identifier in local cloud response '%@'", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (!v4)
  {
    uint64_t v9 = [*(id *)(a1 + 32) parameterForKey:@"Data"];
    v45 = [*(id *)(a1 + 32) parameterForKey:@"EOF"];
    v47 = [*(id *)(a1 + 32) parameterForKey:@"AssetProgress"];
    v11 = [*(id *)(a1 + 32) parameters];
    v12 = [v11 objectForKey:@"_AssetFileName"];

    v13 = [MEMORY[0x1E4F4A2A8] sharedInstance];
    v14 = [v6 dataclass];
    v56[0] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    [v13 createAirlockForDataclasses:v15];

    v16 = [MEMORY[0x1E4F4A2A8] sharedInstance];
    v17 = [v6 dataclass];
    v18 = [v16 pathForDataclass:v17];

    v44 = v12;
    v19 = [v12 pathExtension];
    uint64_t v20 = [v3 stringByAppendingPathExtension:v19];

    v42 = (void *)v20;
    v43 = v18;
    v21 = [v18 stringByAppendingPathComponent:v20];
    v46 = [*(id *)(a1 + 32) parameterForKey:@"FileSize"];
    if (v9)
    {
      id v22 = [v5 fileHandle];

      id v4 = 0;
      if (v22)
      {
        id v10 = 0;
      }
      else
      {
        v23 = [MEMORY[0x1E4F4A2A8] sharedInstance];
        v24 = [v6 dataclass];
        v55 = v24;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
        [v23 createAirlockForDataclasses:v25];

        v26 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v26 removeItemAtPath:v21 error:0];

        v27 = [MEMORY[0x1E4F1C9B8] data];
        id v48 = 0;
        [v27 writeToFile:v21 options:0 error:&v48];
        id v10 = v48;

        v28 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v21];
        [v5 setFileHandle:v28];

        if (!v28)
        {
          v39 = _ATLogCategoryDefault();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = (uint64_t)v6;
            _os_log_impl(&dword_1D9A2D000, v39, OS_LOG_TYPE_ERROR, "failed to create file handle for asset %@", buf, 0xCu);
          }

          v40 = *(void **)(a1 + 40);
          v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:13 userInfo:0];
          [v40 _finishAsset:v6 withError:v41];

          v32 = v45;
          goto LABEL_19;
        }
      }
      v29 = [v5 fileHandle];
      [v29 writeData:v9];
    }
    else
    {
      id v10 = 0;
      id v4 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
    uint64_t v31 = *(void *)(a1 + 40);
    [v47 doubleValue];
    objc_msgSend(WeakRetained, "assetLink:didUpdateAsset:progress:", v31, v6);

    v32 = v45;
    if ([v45 BOOLValue])
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v34 = v33;
      [v5 startTime];
      double v36 = v35;
      v37 = _ATLogCategoryDefault();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = [v46 longLongValue];
        *(_DWORD *)buf = 138412802;
        uint64_t v50 = (uint64_t)v6;
        __int16 v51 = 2048;
        double v52 = v34 - v36;
        __int16 v53 = 2048;
        double v54 = (double)v38 / (v34 - v36);
        _os_log_impl(&dword_1D9A2D000, v37, OS_LOG_TYPE_DEFAULT, "finished asset %@ in %.2f seconds (%f b/s)", buf, 0x20u);
      }

      [v6 setPath:v21];
      [*(id *)(a1 + 40) _finishAsset:v6 withError:0];
    }
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v7 = _ATLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = [v4 longValue];
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_ERROR, "received error in local cloud response. errorCode=%ld", buf, 0xCu);
  }

  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ATError", objc_msgSend(v4, "integerValue"), 0);
  [v8 _finishAsset:v6 withError:v9];
LABEL_8:
  id v10 = 0;
LABEL_20:
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ATLocalCloudAssetLink__finishAsset_withError___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(callbackQueue, block);
}

uint64_t __48__ATLocalCloudAssetLink__finishAsset_withError___block_invoke(id *a1)
{
  [a1[4] setAssetState:2];
  v2 = (void *)*((void *)a1[5] + 6);
  uint64_t v3 = [a1[4] identifier];
  [v2 removeObjectForKey:v3];

  id v4 = [a1[5] delegate];
  id v6 = a1[4];
  id v5 = a1[5];
  id v7 = a1[6];
  BOOL v8 = [v7 code] != 3 && objc_msgSend(a1[6], "code") != 16;
  [v4 assetLink:v5 didFinishAsset:v6 error:v7 retryable:v8];

  id v9 = a1[5];

  return [v9 _requestNextDownload];
}

- (void)messageLinkWasInitialized:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F47890], "sharedInstance", a3);
  [v4 addAssetLink:self];

  [(ATLocalCloudAssetLink *)self open];
}

- (unint64_t)priority
{
  return 150;
}

- (BOOL)linkIsReady
{
  return self->_open;
}

- (unint64_t)maximumBatchSize
{
  return -1;
}

- (void)prioritizeAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ATLocalCloudAssetLink_prioritizeAsset___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __41__ATLocalCloudAssetLink_prioritizeAsset___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 40);
    return [v4 insertObject:v3 atIndex:0];
  }
  return result;
}

- (void)cancelAssets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ATLocalCloudAssetLink_cancelAssets___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__ATLocalCloudAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v8 = [*(id *)(*(void *)(a1 + 40) + 40) containsObject:v7];
        uint64_t v9 = *(void *)(a1 + 40);
        if (v8)
        {
          [*(id *)(v9 + 40) removeObject:v7];
          id v10 = *(void **)(a1 + 40);
          v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
          [v10 _finishAsset:v7 withError:v11];
        }
        else
        {
          id v12 = *(void **)(v9 + 48);
          v13 = [v7 identifier];
          v11 = [v12 objectForKey:v13];

          if (v11)
          {
            id v14 = *(void **)(*(void *)(a1 + 40) + 48);
            v15 = [v7 identifier];
            [v14 removeObjectForKey:v15];

            v26[0] = @"AssetID";
            v16 = [v7 identifier];
            v27[0] = v16;
            v26[1] = @"Dataclass";
            v17 = [v7 dataclass];
            v26[2] = @"ErrorCode";
            v27[1] = v17;
            v27[2] = &unk_1F33DCB90;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

            v19 = *(void **)(*(void *)(a1 + 40) + 32);
            uint64_t v20 = [MEMORY[0x1E4F4A2C0] messageWithName:@"LocalCloudDownloadCancelRequest" parameters:v18];
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __38__ATLocalCloudAssetLink_cancelAssets___block_invoke_56;
            v21[3] = &unk_1E6B88BE0;
            v21[4] = *(void *)(a1 + 40);
            void v21[5] = v7;
            [v19 sendMessage:v20 withCompletion:v21];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v4);
  }
}

void __38__ATLocalCloudAssetLink_cancelAssets___block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = __38__ATLocalCloudAssetLink_cancelAssets___block_invoke_2;
  block[3] = &unk_1E6B88BB8;
  long long v8 = v4;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

void __38__ATLocalCloudAssetLink_cancelAssets___block_invoke_2(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  long long v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
  [v2 _finishAsset:v3 withError:v4];

  if (a1[6])
  {
    uint64_t v5 = _ATLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[6];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "failed to send asset cancelled message. err=%@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1[4] + 32) close];
  }
}

- (BOOL)canEnqueueAsset:(id)a3
{
  id v4 = a3;
  if (![(ATLegacyMessageLink *)self->_messageLink hostSupportsLocalCloudDownloads]
    || ![v4 isDownload])
  {
    goto LABEL_7;
  }
  uint64_t v5 = [v4 storeInfo];
  uint64_t v6 = [v5 cloudDSID];
  if (![v6 longLongValue])
  {

    goto LABEL_7;
  }
  int v7 = [v4 storeInfo];
  uint64_t v8 = [v7 sagaID];
  uint64_t v9 = [v8 longLongValue];

  if (!v9)
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4940;
  v17 = __Block_byref_object_dispose__4941;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ATLocalCloudAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E6B88B90;
  void block[4] = self;
  id v11 = v5;
  id v12 = &v13;
  id v7 = v5;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __45__ATLocalCloudAssetLink_enqueueAssets_force___block_invoke(uint64_t result)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 56) && *(void *)(v1 + 32))
  {
    uint64_t v2 = result;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(result + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
LABEL_5:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        objc_msgSend(*(id *)(*(void *)(v2 + 32) + 40), "addObject:", v8, (void)v10);
        [*(id *)(*(void *)(*(void *)(v2 + 48) + 8) + 40) addObject:v8];
        unint64_t v9 = [*(id *)(*(void *)(v2 + 32) + 40) count];
        if (v9 >= [*(id *)(v2 + 32) maximumBatchSize]) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v5) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    return [*(id *)(v2 + 32) _requestNextDownload];
  }
  return result;
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ATLocalCloudAssetLink_close__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __30__ATLocalCloudAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 56))
  {
    id v3 = [*(id *)(v1 + 48) allValues];
    [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = *(void **)(a1 + 32);
          long long v10 = [*(id *)(*((void *)&v21 + 1) + 8 * v8) asset];
          long long v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:16 userInfo:0];
          [v9 _finishAsset:v10 withError:v11];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = [*(id *)(*(void *)(a1 + 32) + 40) array];
    [v12 addObjectsFromArray:v13];

    [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObserver:");
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 32);
    *(void *)(v14 + 32) = 0;

    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 8);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __30__ATLocalCloudAssetLink_close__block_invoke_2;
    v19[3] = &unk_1E6B88B68;
    v19[4] = v16;
    id v20 = v12;
    id v18 = v12;
    dispatch_async(v17, v19);
  }
}

void __30__ATLocalCloudAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 assetLink:*(void *)(a1 + 32) didCloseWithOutstandingAssets:*(void *)(a1 + 40)];
  }
}

- (BOOL)open
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__ATLocalCloudAssetLink_open__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
  return self->_open;
}

void __29__ATLocalCloudAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 56))
  {
    *(unsigned char *)(v1 + 56) = 1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v3 = *(void **)(*(void *)(a1 + 32) + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__ATLocalCloudAssetLink_open__block_invoke_2;
    v7[3] = &unk_1E6B88B18;
    objc_copyWeak(&v8, &location);
    [v3 setHandlerForMessage:@"LocalCloudDownloadResponse" handler:v7];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__ATLocalCloudAssetLink_open__block_invoke_3;
    block[3] = &unk_1E6B88B40;
    void block[4] = v4;
    dispatch_async(v5, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __29__ATLocalCloudAssetLink_open__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleLocalCloudDownloadResponse:v4];
}

void __29__ATLocalCloudAssetLink_open__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 assetLink:*(void *)(a1 + 32) didOpenWithPendingAssets:0];
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ATLocalCloudAssetLink;
  [(ATLocalCloudAssetLink *)&v2 dealloc];
}

- (ATLocalCloudAssetLink)initWithMessageLink:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATLocalCloudAssetLink;
  uint64_t v6 = [(ATLocalCloudAssetLink *)&v16 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.atc.ATLocalCloudAssetLink", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.atc.ATLocalCloudAssetLink.callback", 0);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_messageLink, a3);
    [(ATConcreteMessageLink *)v6->_messageLink addObserver:v6];
    uint64_t v11 = [MEMORY[0x1E4F1CA70] orderedSet];
    queuedAssets = v6->_queuedAssets;
    v6->_queuedAssets = (NSMutableOrderedSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    activeRequests = v6->_activeRequests;
    v6->_activeRequests = (NSMutableDictionary *)v13;
  }
  return v6;
}

@end