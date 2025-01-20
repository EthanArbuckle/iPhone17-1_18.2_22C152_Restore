@interface MUPlaceholderGridCache
+ (id)unretainedInstance;
- (MUPlaceholderGridCache)init;
- (UIImage)darkGrid;
- (UIImage)lightGrid;
- (void)_cancelSnapshots;
- (void)_saveDarkGrid:(id)a3;
- (void)_saveLightGrid:(id)a3;
- (void)loadPlaceholderGridImages;
@end

@implementation MUPlaceholderGridCache

+ (id)unretainedInstance
{
  WeakRetained = (MUPlaceholderGridCache *)objc_loadWeakRetained(unretainedInstance__sharedInstance);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(MUPlaceholderGridCache);
    objc_storeWeak(unretainedInstance__sharedInstance, WeakRetained);
  }
  return WeakRetained;
}

- (MUPlaceholderGridCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)MUPlaceholderGridCache;
  result = [(MUPlaceholderGridCache *)&v3 init];
  if (result) {
    *(void *)&result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)loadPlaceholderGridImages
{
  if (self->_lightGrid && self->_darkGrid)
  {
    objc_super v3 = MUGetShareSheetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1931EA000, v3, OS_LOG_TYPE_INFO, "Cache hit for both light and dark grid.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    p_snapshotterLock = &self->_snapshotterLock;
    os_unfair_lock_lock(&self->_snapshotterLock);
    [(MUPlaceholderGridCache *)self _cancelSnapshots];
    if (qword_1EB4F71F8 != -1) {
      dispatch_once(&qword_1EB4F71F8, &__block_literal_global_37);
    }
    objc_super v3 = (id)_MergedGlobals_128;
    objc_initWeak(buf, self);
    if (!self->_lightGrid)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F30F48]);
      v6 = createPlaceholderSnapshotOptions(1, 300.0, 300.0);
      v7 = (MKMapSnapshotter *)[v5 initWithOptions:v6];
      lightSnapshotter = self->_lightSnapshotter;
      self->_lightSnapshotter = v7;

      v9 = self->_lightSnapshotter;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__MUPlaceholderGridCache_loadPlaceholderGridImages__block_invoke;
      v17[3] = &unk_1E5750800;
      objc_copyWeak(&v18, buf);
      [(MKMapSnapshotter *)v9 startWithQueue:v3 completionHandler:v17];
      objc_destroyWeak(&v18);
    }
    if (!self->_darkGrid)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F30F48]);
      v11 = createPlaceholderSnapshotOptions(0, 300.0, 300.0);
      v12 = (MKMapSnapshotter *)[v10 initWithOptions:v11];
      darkSnapshotter = self->_darkSnapshotter;
      self->_darkSnapshotter = v12;

      v14 = self->_darkSnapshotter;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__MUPlaceholderGridCache_loadPlaceholderGridImages__block_invoke_14;
      v15[3] = &unk_1E5750800;
      objc_copyWeak(&v16, buf);
      [(MKMapSnapshotter *)v14 startWithQueue:v3 completionHandler:v15];
      objc_destroyWeak(&v16);
    }
    os_unfair_lock_unlock(p_snapshotterLock);
    objc_destroyWeak(buf);
  }
}

void __51__MUPlaceholderGridCache_loadPlaceholderGridImages__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = MUGetShareSheetLog();
    v8 = v7;
    if (a3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_ERROR, "Failed to render light placeholder grid", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_INFO, "Loaded and saving light grid", v9, 2u);
      }

      v8 = [v5 image];
      [WeakRetained _saveLightGrid:v8];
    }
  }
}

void __51__MUPlaceholderGridCache_loadPlaceholderGridImages__block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = MUGetShareSheetLog();
    v8 = v7;
    if (a3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_ERROR, "Failed to render dark placeholder grid", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_INFO, "Loaded and saving dark grid", v9, 2u);
      }

      v8 = [v5 image];
      [WeakRetained _saveDarkGrid:v8];
    }
  }
}

- (void)_saveLightGrid:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v5) {
    objc_storeStrong((id *)&self->_lightGrid, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_saveDarkGrid:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v5) {
    objc_storeStrong((id *)&self->_darkGrid, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_cancelSnapshots
{
  [(MKMapSnapshotter *)self->_lightSnapshotter cancel];
  darkSnapshotter = self->_darkSnapshotter;
  [(MKMapSnapshotter *)darkSnapshotter cancel];
}

- (UIImage)lightGrid
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lightGrid)
  {
    v4 = MUGetShareSheetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_INFO, "Loaded cached light grid", v9, 2u);
    }
  }
  else
  {
    [(MUPlaceholderGridCache *)self _cancelSnapshots];
    createMapPlaceholderGrid(1, 300.0, 300.0);
    id v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    lightGrid = self->_lightGrid;
    self->_lightGrid = v5;
  }
  v7 = self->_lightGrid;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (UIImage)darkGrid
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_darkGrid)
  {
    v4 = MUGetShareSheetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_INFO, "Loaded cached dark grid", v9, 2u);
    }
  }
  else
  {
    [(MUPlaceholderGridCache *)self _cancelSnapshots];
    createMapPlaceholderGrid(0, 300.0, 300.0);
    id v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    darkGrid = self->_darkGrid;
    self->_darkGrid = v5;
  }
  v7 = self->_darkGrid;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkGrid, 0);
  objc_storeStrong((id *)&self->_lightGrid, 0);
  objc_storeStrong((id *)&self->_darkSnapshotter, 0);
  objc_storeStrong((id *)&self->_lightSnapshotter, 0);
}

@end