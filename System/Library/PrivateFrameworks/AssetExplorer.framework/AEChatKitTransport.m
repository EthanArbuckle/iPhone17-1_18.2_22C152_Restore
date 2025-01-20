@interface AEChatKitTransport
- (AEChatKitTransport)init;
- (NSMutableDictionary)_alternateURLsByIdentifier;
- (NSMutableDictionary)_primaryURLsByIdentifier;
- (OS_dispatch_group)_packagePreparationGroup;
- (OS_dispatch_queue)_urlSidetableIsolationQueue;
- (id)_chatkitPackageForIdentifer:(id)a3;
- (id)_persistedURLsFromURLs:(id)a3 inBaseDirectory:(id)a4 outError:(id *)a5;
- (id)_preparePackageForCommit:(id)a3 inBaseDirectory:(id)a4 outError:(id *)a5;
- (id)_workQueue;
- (id)finalizePackage:(id)a3 error:(id *)a4;
- (id)orderedStagedPayloads;
- (id)payloadForIdentifier:(id)a3;
- (void)_beginStagingWorkForPackage:(id)a3;
- (void)_evictPersistedURLs:(id)a3;
- (void)_evictPersistedURLsForPackageIdentifier:(id)a3 evictFiles:(BOOL)a4;
- (void)_notifyDelegateOfStagingCompleteForIdentifier:(id)a3;
- (void)_stagePackage:(id)a3 initiateStagingWork:(BOOL)a4;
- (void)_unstagePackagesWithIdentifiers:(id)a3 evictFiles:(BOOL)a4;
- (void)_updatePrimaryURLsForPackageIdentifier:(id)a3 urls:(id)a4;
- (void)commitPackage:(id)a3;
- (void)stagePackage:(id)a3;
- (void)stagePackages:(id)a3;
- (void)stagePersistedPayloads:(id)a3;
- (void)unstagePackageWithIdentifier:(id)a3 andNotify:(BOOL)a4;
- (void)unstagePackagesWithIdentifiers:(id)a3;
- (void)unstagePackagesWithIdentifiers:(id)a3 evictFiles:(BOOL)a4;
@end

@implementation AEChatKitTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__primaryURLsByIdentifier, 0);
  objc_storeStrong((id *)&self->__alternateURLsByIdentifier, 0);
  objc_storeStrong((id *)&self->__urlSidetableIsolationQueue, 0);
  objc_storeStrong((id *)&self->__packagePreparationGroup, 0);
}

- (NSMutableDictionary)_primaryURLsByIdentifier
{
  return self->__primaryURLsByIdentifier;
}

- (NSMutableDictionary)_alternateURLsByIdentifier
{
  return self->__alternateURLsByIdentifier;
}

- (OS_dispatch_queue)_urlSidetableIsolationQueue
{
  return self->__urlSidetableIsolationQueue;
}

- (OS_dispatch_group)_packagePreparationGroup
{
  return self->__packagePreparationGroup;
}

- (id)payloadForIdentifier:(id)a3
{
  v3 = [(AEChatKitTransport *)self _chatkitPackageForIdentifer:a3];
  v4 = [v3 browserItemPayload];

  return v4;
}

- (id)orderedStagedPayloads
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(AEPackageTransport *)self orderedStagedIdentifiers];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138412290;
    long long v15 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = -[AEChatKitTransport payloadForIdentifier:](self, "payloadForIdentifier:", v11, v15, (void)v16);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          v13 = PLAssetExplorerGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            uint64_t v21 = v11;
            _os_log_impl(&dword_22B526000, v13, OS_LOG_TYPE_ERROR, "Failed to generate browser payload for package identifier %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)unstagePackagesWithIdentifiers:(id)a3
{
}

- (void)unstagePackagesWithIdentifiers:(id)a3 evictFiles:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4)
  {
    [(AEChatKitTransport *)self _unstagePackagesWithIdentifiers:v6 evictFiles:1];
  }
  else
  {
    long long v7 = [(AEChatKitTransport *)self orderedStagedPayloads];
    [(AEChatKitTransport *)self _unstagePackagesWithIdentifiers:v6 evictFiles:0];
    id v8 = v7;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) userInfo];
          long long v15 = [v14 objectForKey:kAEChatKitPayloadSendSource];

          if (v15)
          {
            ++v11;
            AEChatKitSendAnalyticsEventAssetSentFromSource([v15 integerValue]);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    AEChatKitSendAnalyticsEventAssetsSentCount(v11);
  }
}

- (void)_unstagePackagesWithIdentifiers:(id)a3 evictFiles:(BOOL)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AEChatKitTransport;
  [(AEPackageTransport *)&v14 unstagePackagesWithIdentifiers:v6];
  long long v7 = [(AEChatKitTransport *)self _packagePreparationGroup];
  id v8 = [(AEChatKitTransport *)self _workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__AEChatKitTransport__unstagePackagesWithIdentifiers_evictFiles___block_invoke;
  block[3] = &unk_26489B840;
  id v11 = v6;
  uint64_t v12 = self;
  BOOL v13 = a4;
  id v9 = v6;
  dispatch_group_async(v7, v8, block);
}

void __65__AEChatKitTransport__unstagePackagesWithIdentifiers_evictFiles___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_evictPersistedURLsForPackageIdentifier:evictFiles:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), *(unsigned __int8 *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)unstagePackageWithIdentifier:(id)a3 andNotify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AEChatKitTransport;
  [(AEPackageTransport *)&v12 unstagePackageWithIdentifier:v6 andNotify:v4];
  long long v7 = [(AEChatKitTransport *)self _packagePreparationGroup];
  long long v8 = [(AEChatKitTransport *)self _workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__AEChatKitTransport_unstagePackageWithIdentifier_andNotify___block_invoke;
  v10[3] = &unk_26489BB68;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_async(v7, v8, v10);
}

uint64_t __61__AEChatKitTransport_unstagePackageWithIdentifier_andNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evictPersistedURLsForPackageIdentifier:*(void *)(a1 + 40) evictFiles:1];
}

- (void)stagePackages:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AEChatKitTransport;
  [(AEPackageTransport *)&v14 stagePackages:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[AEChatKitTransport _beginStagingWorkForPackage:](self, "_beginStagingWorkForPackage:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_stagePackage:(id)a3 initiateStagingWork:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AEChatKitTransport;
  [(AEPackageTransport *)&v7 stagePackage:v6];
  if (v4) {
    [(AEChatKitTransport *)self _beginStagingWorkForPackage:v6];
  }
}

- (void)stagePackage:(id)a3
{
}

- (void)commitPackage:(id)a3
{
  BOOL v4 = [a3 browserItemPayload];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__AEChatKitTransport_commitPackage___block_invoke;
  v6[3] = &unk_26489BB68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __36__AEChatKitTransport_commitPackage___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 chatKitTransport:*(void *)(a1 + 32) commitPayload:*(void *)(a1 + 40)];
}

- (id)finalizePackage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  uint64_t v8 = [v7 lastPathComponent];
  uint64_t v9 = NSTemporaryDirectory();
  long long v10 = [v9 stringByAppendingPathComponent:v8];

  long long v11 = DCIM_MakeUniqueDirectoryWithPath();
  long long v12 = [(AEChatKitTransport *)self _preparePackageForCommit:v6 inBaseDirectory:v11 outError:a4];

  return v12;
}

- (id)_workQueue
{
  return dispatch_get_global_queue(25, 0);
}

- (id)_chatkitPackageForIdentifer:(id)a3
{
  id v4 = a3;
  id v5 = [(AEPackageTransport *)self stagedPackageForIdentifier:v4];
  if (v5)
  {
    id v6 = [(AEChatKitTransport *)self _packagePreparationGroup];
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x3032000000;
    long long v19 = __Block_byref_object_copy__933;
    v20 = __Block_byref_object_dispose__934;
    id v21 = 0;
    id v7 = [(AEChatKitTransport *)self _urlSidetableIsolationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__AEChatKitTransport__chatkitPackageForIdentifer___block_invoke;
    block[3] = &unk_26489B818;
    void block[4] = self;
    long long v15 = &v16;
    id v8 = v4;
    id v14 = v8;
    dispatch_sync(v7, block);

    uint64_t v9 = [v5 sidecarSnapshot];
    long long v10 = [AEChatKitAssetPackage alloc];
    long long v11 = [(AEAssetPackage *)v10 initWithAssetIdentifier:v8 durableURLs:v17[5] sidecar:v9];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

void __50__AEChatKitTransport__chatkitPackageForIdentifer___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _alternateURLsByIdentifier];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_notifyDelegateOfStagingCompleteForIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [(AEPackageTransport *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 chatKitTransport:self didUpdatePersistedURLsForPackageIdentifier:v5];
  }
}

- (void)_updatePrimaryURLsForPackageIdentifier:(id)a3 urls:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AEPackageTransport *)self stagedPackageForIdentifier:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    long long v10 = [v8 mutableCopy];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v17 = [v11 objectForKeyedSubscript:v16];
          [v10 replaceURLForType:v16 withURL:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [(AEChatKitTransport *)self _stagePackage:v10 initiateStagingWork:0];
    id v7 = v18;
  }
  else
  {
    long long v10 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_22B526000, v10, OS_LOG_TYPE_ERROR, "Staging work ending early; couldn't find staged package with identifier %@",
        buf,
        0xCu);
    }
  }
}

- (void)_beginStagingWorkForPackage:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 durableURLsSnapshotApplyingSuppression:1];
  id v6 = [v4 identifier];

  id v7 = [(AEPackageTransport *)self delegate];
  id v8 = [v7 workingDirForDraft];
  uint64_t v9 = [v6 lastPathComponent];
  long long v10 = [v8 path];
  id v11 = [v10 stringByAppendingPathComponent:v9];

  if ([v11 length])
  {
    uint64_t v12 = [(AEChatKitTransport *)self _packagePreparationGroup];
    uint64_t v13 = [(AEChatKitTransport *)self _workQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke;
    v15[3] = &unk_26489BB40;
    v15[4] = self;
    id v16 = v6;
    id v17 = v11;
    id v18 = v5;
    dispatch_group_async(v12, v13, v15);
  }
  else
  {
    uint64_t v14 = PXAssertGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v20 = v8;
      _os_log_fault_impl(&dword_22B526000, v14, OS_LOG_TYPE_FAULT, "Draft directory is empty or nil. Unable to persist attachments for staging: %@", buf, 0xCu);
    }
  }
}

void __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__933;
  v65 = __Block_byref_object_dispose__934;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__933;
  v59 = __Block_byref_object_dispose__934;
  id v60 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _urlSidetableIsolationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_2;
  block[3] = &unk_26489B7C8;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  v53 = &v61;
  id v52 = v3;
  v54 = &v55;
  dispatch_barrier_sync(v2, block);

  id v4 = DCIM_MakeUniqueDirectoryWithPath();
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v50 = 0;
  id v7 = [v5 _persistedURLsFromURLs:v6 inBaseDirectory:v4 outError:&v50];
  id v8 = v50;
  uint64_t v9 = v56[5];
  if (!v9)
  {
    uint64_t v10 = +[AEAssetPackage unsuppressedURLsFromURLs:v7];
    id v11 = (void *)v56[5];
    v56[5] = v10;
  }
  if (v7)
  {
    uint64_t v12 = [*(id *)(a1 + 32) _urlSidetableIsolationQueue];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_308;
    v43[3] = &unk_26489B7F0;
    v43[4] = *(void *)(a1 + 32);
    id v44 = v7;
    id v13 = *(id *)(a1 + 40);
    BOOL v46 = v9 == 0;
    v45[0] = v13;
    v45[1] = &v55;
    dispatch_barrier_sync(v12, v43);

    uint64_t v14 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v69 = v15;
      __int16 v70 = 2114;
      v71 = v4;
      _os_log_impl(&dword_22B526000, v14, OS_LOG_TYPE_DEFAULT, "Successfully staged package with identifier %{public}@ using base directory %{public}@", buf, 0x16u);
    }
    BOOL v16 = v9 == 0;

    id v17 = &v44;
    id v18 = (id *)v45;
    if (v16)
    {
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_309;
      v40[3] = &unk_26489B818;
      long long v19 = *(void **)(a1 + 40);
      v40[4] = *(void *)(a1 + 32);
      id v41 = v19;
      v42 = &v55;
      dispatch_async(MEMORY[0x263EF83A0], v40);
    }
  }
  else
  {
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_3;
    v47[3] = &unk_26489BB18;
    long long v20 = *(void **)(a1 + 40);
    v47[4] = *(void *)(a1 + 32);
    id v48 = v20;
    id v21 = v8;
    id v49 = v21;
    dispatch_async(MEMORY[0x263EF83A0], v47);
    long long v22 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 40);
      v24 = [v21 localizedDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v69 = v23;
      __int16 v70 = 2114;
      v71 = v4;
      __int16 v72 = 2114;
      v73 = v24;
      _os_log_impl(&dword_22B526000, v22, OS_LOG_TYPE_ERROR, "Error occurred while staging package with identifier %{public}@ using base directory %{public}@: %{public}@", buf, 0x20u);
    }
    id v17 = &v48;
    id v18 = &v49;
  }

  id v25 = (void *)v62[5];
  if (v25)
  {
    uint64_t v26 = (void *)MEMORY[0x263EFF9C0];
    v27 = [v25 allValues];
    v28 = [v26 setWithArray:v27];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v29 = [(id)v56[5] allValues];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v36 objects:v67 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v37;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v29);
          }
          [v28 removeObject:*(void *)(*((void *)&v36 + 1) + 8 * v32++)];
        }
        while (v30 != v32);
        uint64_t v30 = [v29 countByEnumeratingWithState:&v36 objects:v67 count:16];
      }
      while (v30);
    }

    [*(id *)(a1 + 32) _evictPersistedURLs:v28];
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_2_310;
  v34[3] = &unk_26489BB68;
  v33 = *(void **)(a1 + 40);
  v34[4] = *(void *)(a1 + 32);
  id v35 = v33;
  dispatch_async(MEMORY[0x263EF83A0], v34);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);
}

void __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_2(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _alternateURLsByIdentifier];
  uint64_t v2 = [v9 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    [v9 removeObjectForKey:*(void *)(a1 + 40)];
  }
  id v5 = [*(id *)(a1 + 32) _primaryURLsByIdentifier];
  uint64_t v6 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) unstagePackageWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 reportError:v3];
}

void __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_308(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _alternateURLsByIdentifier];
  [v3 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _primaryURLsByIdentifier];
    [v2 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(a1 + 48)];
  }
}

uint64_t __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_309(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePrimaryURLsForPackageIdentifier:*(void *)(a1 + 40) urls:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

uint64_t __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_2_310(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfStagingCompleteForIdentifier:*(void *)(a1 + 40)];
}

- (id)_preparePackageForCommit:(id)a3 inBaseDirectory:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 durableURLsSnapshotApplyingSuppression:1];
  id v11 = [(AEChatKitTransport *)self _persistedURLsFromURLs:v10 inBaseDirectory:v9 outError:a5];

  if (v11)
  {
    uint64_t v12 = [v8 identifier];
    id v13 = [v8 sidecarSnapshot];
    uint64_t v14 = [(AEAssetPackage *)[AEChatKitAssetPackage alloc] initWithAssetIdentifier:v12 durableURLs:v11 sidecar:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_evictPersistedURLs:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isFileURL])
        {
          id v9 = [MEMORY[0x263F5E468] defaultManager];
          [v9 removeItemAtURL:v8 completion:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_evictPersistedURLsForPackageIdentifier:(id)a3 evictFiles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__933;
  id v35 = __Block_byref_object_dispose__934;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__933;
  v29 = __Block_byref_object_dispose__934;
  id v30 = 0;
  uint64_t v7 = [(AEChatKitTransport *)self _urlSidetableIsolationQueue];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __73__AEChatKitTransport__evictPersistedURLsForPackageIdentifier_evictFiles___block_invoke;
  long long v20 = &unk_26489B7C8;
  id v21 = self;
  uint64_t v23 = &v31;
  id v8 = v6;
  id v22 = v8;
  v24 = &v25;
  dispatch_barrier_sync(v7, &v17);

  if (v4)
  {
    id v9 = (void *)v32[5];
    if (v9 || v26[5])
    {
      long long v10 = (void *)MEMORY[0x263EFF9C0];
      uint64_t v11 = objc_msgSend(v9, "count", v17, v18, v19, v20, v21);
      long long v12 = objc_msgSend(v10, "setWithCapacity:", objc_msgSend((id)v26[5], "count") + v11);
      long long v13 = (void *)v32[5];
      if (v13)
      {
        uint64_t v14 = [v13 allValues];
        [v12 addObjectsFromArray:v14];
      }
      uint64_t v15 = (void *)v26[5];
      if (v15)
      {
        BOOL v16 = [v15 allValues];
        [v12 addObjectsFromArray:v16];
      }
      [(AEChatKitTransport *)self _evictPersistedURLs:v12];
    }
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void __73__AEChatKitTransport__evictPersistedURLsForPackageIdentifier_evictFiles___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _alternateURLsByIdentifier];
  uint64_t v2 = [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [v9 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 32) _primaryURLsByIdentifier];
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [v5 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)_persistedURLsFromURLs:(id)a3 inBaseDirectory:(id)a4 outError:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v39 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v6 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    unint64_t v11 = 0x263F08000uLL;
    uint64_t v36 = *(void *)v47;
    id v37 = v6;
    while (2)
    {
      uint64_t v12 = 0;
      uint64_t v38 = v9;
      do
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v46 + 1) + 8 * v12);
        uint64_t v14 = [v6 objectForKeyedSubscript:v13];
        if ([v14 isFileURL])
        {
          uint64_t v15 = [v14 lastPathComponent];
          BOOL v16 = [v15 pathExtension];
          v42 = v16;
          v43 = v7;
          if ([v16 isEqualToString:@"mov"])
          {
            uint64_t v17 = [v15 stringByDeletingPathExtension];
            uint64_t v18 = [v16 uppercaseString];
            uint64_t v19 = [v17 stringByAppendingPathExtension:v18];

            uint64_t v15 = (void *)v19;
          }
          uint64_t v20 = [v13 lastPathComponent];
          id v21 = NSURL;
          v50[0] = v39;
          v50[1] = v20;
          id v41 = (void *)v20;
          id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
          uint64_t v23 = [v21 fileURLWithPathComponents:v22];

          v24 = [*(id *)(v11 + 2128) defaultManager];
          id v45 = 0;
          char v25 = [v24 createDirectoryAtURL:v23 withIntermediateDirectories:0 attributes:0 error:&v45];
          id v26 = v45;

          if (v25)
          {
            uint64_t v27 = [v23 URLByAppendingPathComponent:v15];
            v28 = [*(id *)(v11 + 2128) defaultManager];
            id v44 = 0;
            char v29 = [v28 copyItemAtURL:v14 toURL:v27 error:&v44];
            id v30 = v44;

            if (v29)
            {
              id v31 = v27;
              int v32 = 0;
            }
            else
            {
              if (a5) {
                *a5 = v30;
              }

              id v31 = 0;
              v43 = 0;
              int v32 = 2;
            }
          }
          else
          {
            id v31 = 0;
            if (a5) {
              *a5 = v26;
            }
            int v32 = 2;
            uint64_t v27 = v43;
            v43 = 0;
          }

          if (v32)
          {

            id v6 = v37;
            id v7 = v43;
            goto LABEL_26;
          }
          uint64_t v10 = v36;
          id v6 = v37;
          id v7 = v43;
          uint64_t v9 = v38;
          unint64_t v11 = 0x263F08000;
        }
        else
        {
          id v31 = v14;
        }
        [v7 setObject:v31 forKey:v13];

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  uint64_t v33 = (void *)[v7 copy];
  return v33;
}

- (void)stagePersistedPayloads:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          uint64_t v12 = [AEChatKitAssetPackage alloc];
          long long v13 = -[AEChatKitAssetPackage initWithPayload:](v12, "initWithPayload:", v11, (void)v14);
          [v5 addObject:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [(AEChatKitTransport *)self stagePackages:v5];
  }
}

- (AEChatKitTransport)init
{
  v12.receiver = self;
  v12.super_class = (Class)AEChatKitTransport;
  uint64_t v2 = [(AEPackageTransport *)&v12 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    packagePreparationGroup = v2->__packagePreparationGroup;
    v2->__packagePreparationGroup = (OS_dispatch_group *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AssetExplorer.AEChatKitTransport.sidetable-isolation", MEMORY[0x263EF83A8]);
    urlSidetableIsolationQueue = v2->__urlSidetableIsolationQueue;
    v2->__urlSidetableIsolationQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    alternateURLsByIdentifier = v2->__alternateURLsByIdentifier;
    v2->__alternateURLsByIdentifier = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    primaryURLsByIdentifier = v2->__primaryURLsByIdentifier;
    v2->__primaryURLsByIdentifier = v9;
  }
  return v2;
}

@end