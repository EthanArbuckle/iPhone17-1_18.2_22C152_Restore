@interface MRUImageUtilitiesCacheEntry
- (CGSize)fittingSize;
- (MSVTimer)evictionTimer;
- (NSString)identifier;
- (UIImage)image;
- (void)cancelEvictionTimer;
- (void)dealloc;
- (void)setEvictionTimer:(id)a3;
- (void)setFittingSize:(CGSize)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)startEvictionTimer;
@end

@implementation MRUImageUtilitiesCacheEntry

- (void)startEvictionTimer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F770F0] currentSettings];
  int v4 = [v3 verboseImageLoadingLogging];

  if (v4)
  {
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(MRUImageUtilitiesCacheEntry *)self identifier];
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] Start eviction timer for entry with id: %@", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  v7 = (void *)MEMORY[0x1E4F77A30];
  id v8 = MEMORY[0x1E4F14428];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__MRUImageUtilitiesCacheEntry_startEvictionTimer__block_invoke;
  v10[3] = &unk_1E5F0DA00;
  objc_copyWeak(&v11, (id *)buf);
  v9 = [v7 timerWithInterval:0 repeats:MEMORY[0x1E4F14428] queue:v10 block:300.0];
  [(MRUImageUtilitiesCacheEntry *)self setEvictionTimer:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __49__MRUImageUtilitiesCacheEntry_startEvictionTimer__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[MRUImageLoaderCoordinator sharedCoordinator];
    v3 = [v2 registeredLoaderArtworkIdentifiers];
    int v4 = [WeakRetained identifier];
    char v5 = [v3 containsObject:v4];

    if ((v5 & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F770F0] currentSettings];
      int v7 = [v6 verboseImageLoadingLogging];

      if (v7)
      {
        id v8 = MCLogCategoryDefault();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = [WeakRetained identifier];
          int v12 = 138412290;
          v13 = v9;
          _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] Evicting entry with id: %@", (uint8_t *)&v12, 0xCu);
        }
      }
      v10 = +[MRUImageUtilities cache];
      id v11 = [WeakRetained identifier];
      [v10 removeObjectForKey:v11];
    }
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F770F0] currentSettings];
  int v4 = [v3 verboseImageLoadingLogging];

  if (v4)
  {
    char v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(MRUImageUtilitiesCacheEntry *)self identifier];
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] Dealloc entry with id: %@", buf, 0xCu);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)MRUImageUtilitiesCacheEntry;
  [(MRUImageUtilitiesCacheEntry *)&v7 dealloc];
}

- (void)cancelEvictionTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(MRUImageUtilitiesCacheEntry *)self evictionTimer];

  if (v3)
  {
    int v4 = [MEMORY[0x1E4F770F0] currentSettings];
    int v5 = [v4 verboseImageLoadingLogging];

    if (v5)
    {
      v6 = MCLogCategoryDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v7 = [(MRUImageUtilitiesCacheEntry *)self identifier];
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] Cancel eviction timer for entry with id: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    id v8 = [(MRUImageUtilitiesCacheEntry *)self evictionTimer];
    [v8 invalidate];

    [(MRUImageUtilitiesCacheEntry *)self setEvictionTimer:0];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGSize)fittingSize
{
  double width = self->_fittingSize.width;
  double height = self->_fittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFittingSize:(CGSize)a3
{
  self->_fittingSize = a3;
}

- (MSVTimer)evictionTimer
{
  return self->_evictionTimer;
}

- (void)setEvictionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictionTimer, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end