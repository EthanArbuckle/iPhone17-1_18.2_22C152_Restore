@interface AEProgressViewModel
- (AEProgressViewModel)initWithDataSourceManager:(id)a3;
- (AEProgressViewModelSnapshot)progressSnapshot;
- (NSDictionary)_progressByAsset;
- (PXAssetsDataSourceManager)_dataSourceManager;
- (id)_createSnapshot;
- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3;
- (void)_setProgressByAsset:(id)a3;
- (void)cancelProgressForAssetUUIDs:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setProgress:(id)a3 forAssetReference:(id)a4;
@end

@implementation AEProgressViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progressByAsset, 0);
  objc_storeStrong((id *)&self->__dataSourceManager, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
}

- (NSDictionary)_progressByAsset
{
  return self->__progressByAsset;
}

- (PXAssetsDataSourceManager)_dataSourceManager
{
  return self->__dataSourceManager;
}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ((v6 & 1) != 0 && (void *)AEProgressViewModelDataSourceManagerObserverContext == a5)
  {
    id v29 = v8;
    v9 = [v8 dataSource];
    v28 = self;
    v10 = [(AEProgressViewModel *)self _progressByAsset];
    v11 = [MEMORY[0x263EFF9A0] dictionary];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v12 = [v10 allKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        uint64_t v16 = 0;
        uint64_t v30 = v14;
        do
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
          v18 = [v9 assetReferenceForAssetReference:v17];
          if (v18)
          {
            v19 = [v10 objectForKey:v17];
            [v11 setObject:v19 forKey:v18];
          }
          else
          {
            v19 = PLAssetExplorerGetLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = [v17 asset];
              [v20 uuid];
              uint64_t v21 = v15;
              v22 = v9;
              v23 = v11;
              v24 = v12;
              v26 = v25 = v10;
              *(_DWORD *)buf = 138543362;
              v38 = v26;
              _os_log_impl(&dword_22B526000, v19, OS_LOG_TYPE_DEFAULT, "Forgetting in-flight progress for asset %{public}@", buf, 0xCu);

              v10 = v25;
              v12 = v24;
              v11 = v23;
              v9 = v22;
              uint64_t v15 = v21;
              uint64_t v14 = v30;
            }
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v14);
    }

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __52__AEProgressViewModel_observable_didChange_context___block_invoke;
    v31[3] = &unk_26489BC68;
    v31[4] = v28;
    id v32 = v11;
    id v27 = v11;
    [(AEProgressViewModel *)v28 performChanges:v31];

    id v8 = v29;
  }
}

uint64_t __52__AEProgressViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setProgressByAsset:*(void *)(a1 + 40)];
}

- (void)cancelProgressForAssetUUIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    [(AEProgressViewModel *)self _progressByAsset];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "asset", (void)v16);
          uint64_t v13 = [v12 uuid];

          if ([v4 containsObject:v13])
          {
            uint64_t v14 = [v5 objectForKey:v11];
            [v14 cancel];
            ++v8;
            uint64_t v15 = [v4 count];

            if (v15 == v8)
            {

              goto LABEL_13;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (void)setProgress:(id)a3 forAssetReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AEProgressViewModel *)self _dataSourceManager];
  uint64_t v9 = [v8 dataSource];
  v10 = [v9 assetReferenceForAssetReference:v7];

  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__AEProgressViewModel_setProgress_forAssetReference___block_invoke;
    v11[3] = &unk_26489BC40;
    v11[4] = self;
    id v12 = v6;
    id v13 = v10;
    [(AEProgressViewModel *)self performChanges:v11];
  }
}

void __53__AEProgressViewModel_setProgress_forAssetReference___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _progressByAsset];
  id v4 = (id)[v2 mutableCopy];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v4 setObject:v3 forKey:*(void *)(a1 + 48)];
  }
  else {
    [v4 removeObjectForKey:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) _setProgressByAsset:v4];
}

- (id)_createSnapshot
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AEProgressViewModel *)self _progressByAsset];
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = [v3 keyEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          v11 = [(AEProgressViewModel *)self _dataSourceManager];
          id v12 = [v11 dataSource];
          id v13 = v12;
          if (v12)
          {
            [v12 indexPathForAssetReference:v10];
          }
          else
          {
            long long v21 = 0u;
            long long v22 = 0u;
          }

          uint64_t v14 = PXIndexPathFromSimpleIndexPath();
          uint64_t v15 = [(AEProgressViewModel *)self _progressByAsset];
          long long v16 = [v15 objectForKey:v10];

          [v4 setObject:v16 forKey:v14];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }
  long long v17 = [(AEProgressViewModel *)self _dataSourceManager];
  long long v18 = [v17 dataSource];
  long long v19 = -[AEProgressViewModelSnapshot initWithProgressByIndexPath:dataSourceIdenfitier:]([AEProgressViewModelSnapshot alloc], "initWithProgressByIndexPath:dataSourceIdenfitier:", v4, [v18 identifier]);

  return v19;
}

- (AEProgressViewModelSnapshot)progressSnapshot
{
  return self->_currentSnapshot;
}

- (void)_setProgressByAsset:(id)a3
{
  id v5 = (NSDictionary *)a3;
  p_progressByAsset = &self->__progressByAsset;
  if (self->__progressByAsset != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)p_progressByAsset, a3);
    uint64_t v7 = [(AEProgressViewModel *)self _createSnapshot];
    currentSnapshot = self->_currentSnapshot;
    self->_currentSnapshot = v7;

    p_progressByAsset = (NSDictionary **)[(AEProgressViewModel *)self signalChange:1];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](p_progressByAsset, v5);
}

- (AEProgressViewModel)initWithDataSourceManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AEProgressViewModel;
  uint64_t v6 = [(AEProgressViewModel *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__dataSourceManager, a3);
    [v5 registerChangeObserver:v7 context:AEProgressViewModelDataSourceManagerObserverContext];
    uint64_t v8 = [NSDictionary dictionary];
    progressByAsset = v7->__progressByAsset;
    v7->__progressByAsset = (NSDictionary *)v8;
  }
  return v7;
}

@end