@interface ATConcreteAssetLink
- (ATAssetLinkDelegate)delegate;
- (ATConcreteAssetLink)initWithMessageLink:(id)a3;
- (BOOL)canEnqueueAsset:(id)a3;
- (BOOL)isOpen;
- (BOOL)linkIsReady;
- (BOOL)open;
- (id)_keyForATAssetInReaderMap:(id)a3;
- (id)_urlForWritingAsset:(id)a3 withFileName:(id)a4;
- (id)enqueueAssets:(id)a3 force:(BOOL)a4;
- (unint64_t)maximumBatchSize;
- (unint64_t)priority;
- (void)_finishAsset:(id)a3 withError:(id)a4;
- (void)_requestAsset:(id)a3;
- (void)cancelAssets:(id)a3;
- (void)close;
- (void)setDelegate:(id)a3;
@end

@implementation ATConcreteAssetLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWriteSemaphore, 0);
  objc_storeStrong((id *)&self->_readersPendingStopGroup, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_fileIOQueue, 0);
  objc_storeStrong((id *)&self->_readerQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_readersToAssetsMap, 0);
  objc_storeStrong((id *)&self->_readersPendingStop, 0);
  objc_storeStrong((id *)&self->_readers, 0);
  objc_storeStrong((id *)&self->_outstandingAssets, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_messageLink, 0);
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

- (id)_keyForATAssetInReaderMap:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v4 identifier];
  uint64_t v6 = [v4 assetParts];

  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [v7 UUIDString];
  v9 = [v3 stringWithFormat:@"%@-%ld-%@", v5, v6, v8];

  return v9;
}

- (void)_requestAsset:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[v4 copy];
  uint64_t v6 = [v4 storeInfo];
  v7 = [v6 syncID];
  [v5 setIdentifier:v7];

  v8 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    __int16 v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Cloning %{public}@ to %{public}@ to request asset from the companion", buf, 0x20u);
  }

  id v9 = objc_alloc(MEMORY[0x1E4F4A2D0]);
  v10 = [v4 dataclass];
  v11 = [v5 serializedAsset];
  v12 = (void *)[v9 initWithCommand:@"RequestAsset" dataClass:v10 parameters:v11];

  messageLink = self->_messageLink;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke;
  v15[3] = &unk_1E6B8C690;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [(ATMessageLink *)messageLink sendRequest:v12 withCompletion:v15];
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 72);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_2;
  v11[3] = &unk_1E6B8C550;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_2(uint64_t a1)
{
  v81[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)
    || ([*(id *)(a1 + 40) error], v2 = objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    v3 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      id v4 = *(void **)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [*(id *)(a1 + 40) error];
      *(_DWORD *)buf = 138544130;
      uint64_t v72 = v5;
      __int16 v73 = 2114;
      v74 = v4;
      __int16 v75 = 2114;
      uint64_t v76 = v6;
      __int16 v77 = 2114;
      v78 = v7;
      _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Finishing %{public}@ because of stream error %{public}@ response error %{public}@", buf, 0x2Au);
    }
    v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 48), "_finishAsset:withError:", *(void *)(a1 + 56));
    }
    else
    {
      id v10 = [*(id *)(a1 + 40) error];
      [v8 _finishAsset:v9 withError:v10];
    }
  }
  else
  {
    [*(id *)(a1 + 56) setAssetState:1];
    v11 = [*(id *)(a1 + 48) delegate];
    uint64_t v12 = *(void *)(a1 + 48);
    v81[0] = *(void *)(a1 + 56);
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
    [v11 assetLink:v12 didTransitionAssetStates:v13];

    uint64_t v14 = +[ATAssetLinkPowerLogger sharedInstance];
    [v14 logAssetLinkOfType:1 didBeginDownloadingAsset:*(void *)(a1 + 56)];

    id v15 = [*(id *)(a1 + 40) parameters];
    v47 = [v15 objectForKey:@"_AssetClientParams"];

    if (v47) {
      [*(id *)(a1 + 56) setClientParams:v47];
    }
    id v16 = [*(id *)(a1 + 40) parameters];
    v46 = [v16 objectForKey:@"_AssetFileName"];

    v17 = [*(id *)(a1 + 40) parameters];
    v18 = [v17 objectForKey:@"_AssetSize"];

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 56), "setTotalBytes:", objc_msgSend(v18, "unsignedLongLongValue"));
      objc_msgSend(*(id *)(a1 + 56), "setBytesRemaining:", objc_msgSend(*(id *)(a1 + 56), "totalBytes"));
    }
    __int16 v19 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 48);
      __int16 v21 = [*(id *)(a1 + 56) shortDescription];
      *(_DWORD *)buf = 138544130;
      uint64_t v72 = v20;
      __int16 v73 = 2114;
      v74 = v21;
      __int16 v75 = 2050;
      uint64_t v76 = [v18 unsignedLongLongValue];
      __int16 v77 = 2114;
      v78 = v46;
      _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ starting download of asset %{public}@. size=%{public}lld, name=%{public}@", buf, 0x2Au);
    }
    v22 = [*(id *)(a1 + 48) _urlForWritingAsset:*(void *)(a1 + 56) withFileName:v46];
    uint64_t v23 = [MEMORY[0x1E4F1C9B8] data];
    [v23 writeToURL:v22 options:0 error:0];

    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__2139;
    v69 = __Block_byref_object_dispose__2140;
    id v64 = 0;
    v24 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v22 error:&v64];
    id v45 = v64;
    id v70 = v24;
    if (v66[5])
    {
      v25 = [v22 path];
      [*(id *)(a1 + 56) setPath:v25];

      id v26 = objc_alloc(MEMORY[0x1E4F77A08]);
      v27 = [*(id *)(a1 + 40) dataStream];
      v28 = (void *)[v26 initWithInputStream:v27 queue:*(void *)(*(void *)(a1 + 48) + 72)];

      v29 = [*(id *)(a1 + 48) _keyForATAssetInReaderMap:*(void *)(a1 + 56)];
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x2020000000;
      v63[3] = 0;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_43;
      v59[3] = &unk_1E6B8C578;
      v59[4] = *(void *)(a1 + 48);
      v62 = &v65;
      id v60 = *(id *)(a1 + 56);
      id v30 = v29;
      id v61 = v30;
      v31 = (void *)MEMORY[0x1E016C2E0](v59);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_47;
      v54[3] = &unk_1E6B8C618;
      v54[4] = *(void *)(a1 + 48);
      id v55 = *(id *)(a1 + 56);
      v57 = &v65;
      v58 = v63;
      id v32 = v31;
      id v56 = v32;
      [v28 setDidReadDataBlock:v54];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_51;
      v51[3] = &unk_1E6B8C640;
      v33 = *(void **)(a1 + 56);
      v51[4] = *(void *)(a1 + 48);
      id v52 = v33;
      id v34 = v32;
      id v53 = v34;
      [v28 setDidFinishReadingBlock:v51];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_52;
      v48[3] = &unk_1E6B8C668;
      v35 = *(void **)(a1 + 56);
      v48[4] = *(void *)(a1 + 48);
      id v49 = v35;
      id v36 = v34;
      id v50 = v36;
      [v28 setDidEncounterErrorBlock:v48];
      [*(id *)(*(void *)(a1 + 48) + 40) addObject:v28];
      [*(id *)(*(void *)(a1 + 48) + 56) setObject:v28 forKey:v30];
      v37 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = *(void *)(a1 + 48);
        uint64_t v39 = *(void *)(a1 + 56);
        v40 = *(void **)(v38 + 40);
        uint64_t v41 = *(void *)(v38 + 56);
        *(_DWORD *)buf = 138544386;
        uint64_t v72 = v38;
        __int16 v73 = 2114;
        v74 = v28;
        __int16 v75 = 2114;
        uint64_t v76 = v39;
        __int16 v77 = 2114;
        v78 = v40;
        __int16 v79 = 2114;
        uint64_t v80 = v41;
        _os_log_impl(&dword_1D9BC7000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding reader %{public}@ for %{public}@ activeReaders %{public}@, readerToAssetMap %{public}@", buf, 0x34u);
      }

      [v28 start];
      _Block_object_dispose(v63, 8);
    }
    else
    {
      v42 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = *(void *)(a1 + 48);
        v44 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        uint64_t v72 = v43;
        __int16 v73 = 2114;
        v74 = v44;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v45;
        _os_log_impl(&dword_1D9BC7000, v42, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get file handle for writing asset %{public}@ - error %{public}@", buf, 0x20u);
      }

      [*(id *)(a1 + 48) _finishAsset:*(void *)(a1 + 56) withError:v45];
    }
    _Block_object_dispose(&v65, 8);
  }
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_43(uint64_t a1, void *a2, int a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_2_44;
  block[3] = &unk_1E6B8C528;
  uint64_t v39 = *(void *)(a1 + 56);
  block[4] = v6;
  id v38 = *(id *)(a1 + 40);
  id v8 = a2;
  dispatch_barrier_sync(v7, block);
  [*(id *)(a1 + 32) _finishAsset:*(void *)(a1 + 40) withError:v8];

  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v9 + 16))
  {
    v11 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v19;
      __int16 v42 = 2114;
      uint64_t v43 = v20;
      _os_log_impl(&dword_1D9BC7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Not handling completion block for %{public}@ as the link is already closed", buf, 0x16u);
    }
    goto LABEL_20;
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v10 = objc_msgSend(*(id *)(v9 + 56), "objectForKey:");
    if (!v10)
    {
      __int16 v21 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 40);
        uint64_t v24 = *(void *)(v22 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v41 = v22;
        __int16 v42 = 2114;
        uint64_t v43 = v23;
        __int16 v44 = 2114;
        uint64_t v45 = v24;
        _os_log_impl(&dword_1D9BC7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not materialize reader for %{public}@ - active readers %{public}@", buf, 0x20u);
      }

      v11 = 0;
      goto LABEL_20;
    }
    v11 = v10;
    uint64_t v12 = *(void *)(a1 + 32);
    if (a3)
    {
      if (([*(id *)(v12 + 48) containsObject:*(void *)(a1 + 48)] & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 48)];
        dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 96));
        v29 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = *(void *)(a1 + 32);
          uint64_t v31 = *(void *)(a1 + 40);
          uint64_t v32 = *(void *)(v30 + 48);
          *(_DWORD *)buf = 138543874;
          uint64_t v41 = v30;
          __int16 v42 = 2114;
          uint64_t v43 = v31;
          __int16 v44 = 2114;
          uint64_t v45 = v32;
          _os_log_impl(&dword_1D9BC7000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping stream reader for %{public}@ readersPendingStop %{public}@", buf, 0x20u);
        }

        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_45;
        v33[3] = &unk_1E6B8C550;
        v33[4] = *(void *)(a1 + 32);
        v11 = v11;
        id v34 = v11;
        id v35 = *(id *)(a1 + 48);
        id v36 = *(id *)(a1 + 40);
        [v11 stopWithCompletion:v33];

        goto LABEL_20;
      }
      id v13 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v14;
        __int16 v42 = 2114;
        uint64_t v43 = v15;
        id v16 = "%{public}@ Reader for %{public}@ is already pending stop";
        v17 = v13;
        uint32_t v18 = 22;
LABEL_15:
        _os_log_impl(&dword_1D9BC7000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {
      [*(id *)(v12 + 40) removeObject:v10];
      [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 48)];
      id v13 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void *)(a1 + 40);
        uint64_t v27 = *(void *)(v25 + 40);
        uint64_t v28 = *(void *)(v25 + 56);
        *(_DWORD *)buf = 138544130;
        uint64_t v41 = v25;
        __int16 v42 = 2114;
        uint64_t v43 = v26;
        __int16 v44 = 2114;
        uint64_t v45 = v27;
        __int16 v46 = 2114;
        uint64_t v47 = v28;
        id v16 = "%{public}@ Removed reader for %{public}@ from our list - active readers %{public}@, readerMap %{public}@";
        v17 = v13;
        uint32_t v18 = 42;
        goto LABEL_15;
      }
    }

LABEL_20:
  }
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_47(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1[4] + 32) containsObject:a1[5]])
  {
    unsigned int v4 = [v3 length];
    int v5 = atomic_fetch_add_explicit((atomic_uint *volatile)(a1[4] + 104), v4, memory_order_relaxed) + v4;
    uint64_t v6 = *(NSObject **)(a1[4] + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_2_48;
    block[3] = &unk_1E6B8C5F0;
    uint64_t v19 = a1[7];
    id v7 = v3;
    uint64_t v8 = a1[4];
    uint64_t v9 = (void *)a1[5];
    id v16 = v7;
    uint64_t v17 = v8;
    id v10 = v9;
    uint64_t v11 = a1[8];
    id v18 = v10;
    uint64_t v20 = v11;
    dispatch_async(v6, block);
    if (v5 >= 0x200000) {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 112), 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    uint64_t v12 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = a1[4];
      uint64_t v14 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1D9BC7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ handling didReadDataBlock for %{public}@ that's not in our list", buf, 0x16u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t __37__ATConcreteAssetLink__requestAsset___block_invoke_51(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished reading asset %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_52(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not sync %{public}@ - error %{public}@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_2_48(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) writeData:*(void *)(a1 + 32)];
  int v2 = [*(id *)(a1 + 32) length];
  int add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 40) + 104), -v2, memory_order_relaxed);
  if (add_explicit >= 0x200000 && add_explicit - v2 < 0x200000) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 112));
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 72);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_3;
  v8[3] = &unk_1E6B8C5C8;
  id v9 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  dispatch_async(v4, v8);
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) bytesRemaining])
  {
    objc_msgSend(*(id *)(a1 + 32), "setBytesRemaining:", objc_msgSend(*(id *)(a1 + 32), "bytesRemaining") - objc_msgSend(*(id *)(a1 + 40), "length"));
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v2 - *(double *)(v3 + 24) > 0.5)
    {
      *(double *)(v3 + 24) = v2;
      uint64_t v4 = *(void *)(a1 + 48);
      id v5 = *(NSObject **)(v4 + 88);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_4;
      v6[3] = &unk_1E6B8C5A0;
      v6[4] = v4;
      id v7 = *(id *)(a1 + 32);
      dispatch_async(v5, v6);
    }
  }
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "assetLink:didUpdateAsset:progress:", *(void *)(a1 + 32), *(void *)(a1 + 40), (double)(objc_msgSend(*(id *)(a1 + 40), "totalBytes")/ (unint64_t)objc_msgSend(*(id *)(a1 + 40), "bytesRemaining")));
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_2_44(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (v2)
  {
    [v2 closeFile];
    uint64_t v3 = *(void *)(a1[6] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    id v5 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Closing write fileHandle for %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_45(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 72));
  [*(id *)(a1[4] + 40) removeObject:a1[5]];
  [*(id *)(a1[4] + 56) removeObjectForKey:a1[6]];
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 96));
  id v2 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[7];
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 56);
    int v7 = 138544130;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing stop message for %{public}@ - active readers %{public}@, readerMap %{public}@", (uint8_t *)&v7, 0x2Au);
  }
}

- (id)_urlForWritingAsset:(id)a3 withFileName:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x1E4F4A2A8] sharedInstance];
  uint64_t v8 = [v5 dataclass];
  __int16 v9 = [v7 pathForDataclass:v8];

  uint64_t v10 = [MEMORY[0x1E4F4A2A8] sharedInstance];
  __int16 v11 = [v5 dataclass];
  v32[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v10 createAirlockForDataclasses:v12];

  __int16 v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v30 = v6;
  uint64_t v31 = v5;
  if (v6 && [v6 length])
  {
    id v14 = v6;
  }
  else
  {
    uint64_t v15 = [v5 prettyName];
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [v5 identifier];
    }
    id v14 = v17;
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  do
  {
    if (v18)
    {
      uint64_t v20 = NSString;
      __int16 v21 = [v14 stringByDeletingPathExtension];
      uint64_t v22 = [v14 pathExtension];
      id v23 = [v20 stringWithFormat:@"%@_%d.%@", v21, v18, v22];
    }
    else
    {
      id v23 = v14;
    }
    uint64_t v24 = [v9 stringByAppendingPathComponent:v23];

    char v25 = [v13 fileExistsAtPath:v24];
    ++v18;

    uint64_t v19 = v24;
  }
  while ((v25 & 1) != 0);
  uint64_t v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24];
  uint64_t v27 = [MEMORY[0x1E4F1C9B8] data];
  [v27 writeToURL:v26 options:0 error:0];

  uint64_t v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24];

  return v28;
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->_outstandingAssets containsObject:v6])
  {
    uint64_t v8 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished asset %{public}@: %{public}@", buf, 0x20u);
    }

    __int16 v9 = +[ATAssetLinkPowerLogger sharedInstance];
    [v9 logAssetLinkOfType:1 didFinishAsset:v6 withError:v7];

    [(NSMutableArray *)self->_outstandingAssets removeObject:v6];
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__ATConcreteAssetLink__finishAsset_withError___block_invoke;
    block[3] = &unk_1E6B8C500;
    void block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(callbackQueue, block);
  }
}

void __46__ATConcreteAssetLink__finishAsset_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLink:*(void *)(a1 + 32) didFinishAsset:*(void *)(a1 + 40) error:*(void *)(a1 + 48) retryable:1];
}

- (unint64_t)priority
{
  return 0;
}

- (BOOL)linkIsReady
{
  return [(ATMessageLink *)self->_messageLink isOpen];
}

- (unint64_t)maximumBatchSize
{
  return 2;
}

- (void)cancelAssets:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2139;
  void v11[4] = __Block_byref_object_dispose__2140;
  id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  readerQueue = self->_readerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ATConcreteAssetLink_cancelAssets___block_invoke;
  block[3] = &unk_1E6B8C528;
  id v8 = v4;
  __int16 v9 = self;
  uint64_t v10 = v11;
  id v6 = v4;
  dispatch_async(readerQueue, block);

  _Block_object_dispose(v11, 8);
}

void __36__ATConcreteAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([*(id *)(*(void *)(a1 + 40) + 32) containsObject:v7]) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * j);
        id v14 = *(void **)(a1 + 40);
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ATError", 2, 0, (void)v16);
        [v14 _finishAsset:v13 withError:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }
}

- (BOOL)canEnqueueAsset:(id)a3
{
  return 0;
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__2139;
  v33 = __Block_byref_object_dispose__2140;
  id v34 = [MEMORY[0x1E4F1C978] array];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  readerQueue = self->_readerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E6B8C490;
  void block[4] = self;
  void block[5] = v28;
  dispatch_sync(readerQueue, block);
  accessQueue = self->_accessQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke_2;
  v22[3] = &unk_1E6B8C4D8;
  v22[4] = self;
  uint64_t v24 = v28;
  BOOL v26 = a4;
  id v9 = v6;
  id v23 = v9;
  char v25 = &v29;
  dispatch_sync(accessQueue, v22);
  uint64_t v10 = self->_readerQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke_3;
  v21[3] = &unk_1E6B8C490;
  v21[4] = self;
  v21[5] = &v29;
  dispatch_sync(v10, v21);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = (id)v30[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        -[ATConcreteAssetLink _requestAsset:](self, "_requestAsset:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v35 count:16];
    }
    while (v12);
  }

  id v15 = (id)v30[5];
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

unint64_t __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke_2(unint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 16)) {
    return result;
  }
  unint64_t v1 = result;
  unint64_t v2 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24);
  if (v2 >= 2)
  {
    if (!*(unsigned char *)(result + 64)) {
      return result;
    }
LABEL_10:
    uint64_t result = [*(id *)(result + 40) count];
    if (!result) {
      return result;
    }
    goto LABEL_11;
  }
  if (*(unsigned char *)(result + 64)) {
    goto LABEL_10;
  }
  unint64_t v3 = 2 - v2;
  uint64_t result = [*(id *)(result + 40) count];
  if (v3 >= result) {
    unint64_t v4 = result;
  }
  else {
    unint64_t v4 = v3;
  }
  if (v4)
  {
LABEL_11:
    *(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) = [*(id *)(v1 + 40) subarrayWithRange:0];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

uint64_t __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)close
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__2139;
  v4[4] = __Block_byref_object_dispose__2140;
  id v5 = 0;
  accessQueue = self->_accessQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__ATConcreteAssetLink_close__block_invoke;
  v3[3] = &unk_1E6B8C490;
  v3[4] = self;
  v3[5] = v4;
  dispatch_sync(accessQueue, v3);
  _Block_object_dispose(v4, 8);
}

void __28__ATConcreteAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 16))
  {
    unint64_t v3 = *(NSObject **)(v1 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__ATConcreteAssetLink_close__block_invoke_2;
    block[3] = &unk_1E6B8C490;
    uint64_t v4 = *(void *)(a1 + 40);
    void block[4] = v1;
    void block[5] = v4;
    dispatch_sync(v3, block);
    id v5 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v6;
      __int16 v29 = 2048;
      uint64_t v30 = v7;
      _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Closing .... outstanding asset count:%ld", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeObserver:");
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = 0;

    uint64_t v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __28__ATConcreteAssetLink_close__block_invoke_11;
      v24[3] = &unk_1E6B8C490;
      long long v25 = *(_OWORD *)(a1 + 32);
      dispatch_async(*(dispatch_queue_t *)(v25 + 88), v24);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(NSObject **)(v12 + 72);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __28__ATConcreteAssetLink_close__block_invoke_2_12;
    v23[3] = &unk_1E6B8C468;
    v23[4] = v12;
    dispatch_sync(v13, v23);
    dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 96), 0xFFFFFFFFFFFFFFFFLL);
    id v14 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v15;
      _os_log_impl(&dword_1D9BC7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished waiting for readers to process their stop messages", buf, 0xCu);
    }

    dispatch_barrier_sync(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 72), &__block_literal_global_2180);
    long long v16 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v17;
      _os_log_impl(&dword_1D9BC7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished waiting for readerQueue to drain", buf, 0xCu);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    long long v19 = *(NSObject **)(v18 + 72);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __28__ATConcreteAssetLink_close__block_invoke_15;
    v22[3] = &unk_1E6B8C468;
    v22[4] = v18;
    dispatch_sync(v19, v22);
    long long v20 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v21;
      _os_log_impl(&dword_1D9BC7000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Wrapped up ...", buf, 0xCu);
    }
  }
}

uint64_t __28__ATConcreteAssetLink_close__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v5 removeAllObjects];
}

void __28__ATConcreteAssetLink_close__block_invoke_11(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLink:*(void *)(a1 + 32) didCloseWithOutstandingAssets:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __28__ATConcreteAssetLink_close__block_invoke_2_12(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v4 = 138543618;
    long long v12 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "containsObject:", v8, v12) & 1) == 0)
        {
          id v9 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v12;
            uint64_t v19 = v10;
            __int16 v20 = 2114;
            uint64_t v21 = v8;
            _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping reader for assetID/Part %{public}@", buf, 0x16u);
          }

          dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 96));
          char v11 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v8];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __28__ATConcreteAssetLink_close__block_invoke_13;
          v13[3] = &unk_1E6B8C468;
          v13[4] = *(void *)(a1 + 32);
          [v11 stopWithCompletion:v13];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v5);
  }
}

uint64_t __28__ATConcreteAssetLink_close__block_invoke_15(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(v3 + 40) count];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing %ld readers from our collection", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
}

void __28__ATConcreteAssetLink_close__block_invoke_13(uint64_t a1)
{
}

- (BOOL)open
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ATConcreteAssetLink_open__block_invoke;
  block[3] = &unk_1E6B8C468;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
  return 1;
}

void __27__ATConcreteAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addObserver:");
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__ATConcreteAssetLink_open__block_invoke_2;
    block[3] = &unk_1E6B8C468;
    void block[4] = v3;
    dispatch_async(v4, block);
  }
}

void __27__ATConcreteAssetLink_open__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 assetLink:*(void *)(a1 + 32) didOpenWithPendingAssets:0];
  }
}

- (ATConcreteAssetLink)initWithMessageLink:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ATConcreteAssetLink;
  int v6 = [(ATConcreteAssetLink *)&v29 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageLink, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.AirTraffic.ATFoundation.ATConcreteAssetLink.accessQueue", 0);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.AirTraffic.ATFoundation.ATConcreteAssetLink.fileIOQueue", 0);
    fileIOQueue = v7->_fileIOQueue;
    v7->_fileIOQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AirTraffic.ATFoundation.ATConcreteAssetLink.callbackQueue", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.AirTraffic.ATFoundation.ATConcreteAssetLink.streamReaderQueue", 0);
    readerQueue = v7->_readerQueue;
    v7->_readerQueue = (OS_dispatch_queue *)v14;

    dispatch_group_t v16 = dispatch_group_create();
    readersPendingStopGroup = v7->_readersPendingStopGroup;
    v7->_readersPendingStopGroup = (OS_dispatch_group *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    outstandingAssets = v7->_outstandingAssets;
    v7->_outstandingAssets = (NSMutableArray *)v18;

    uint64_t v20 = objc_opt_new();
    readers = v7->_readers;
    v7->_readers = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    readersPendingStop = v7->_readersPendingStop;
    v7->_readersPendingStop = (NSMutableSet *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    readersToAssetsMap = v7->_readersToAssetsMap;
    v7->_readersToAssetsMap = (NSMutableDictionary *)v24;

    dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
    pendingWriteSemaphore = v7->_pendingWriteSemaphore;
    v7->_pendingWriteSemaphore = (OS_dispatch_semaphore *)v26;

    v7->_pendingWriteAmount = 0;
  }

  return v7;
}

@end