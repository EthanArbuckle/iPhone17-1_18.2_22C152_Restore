@interface CKMomentSharePreviewAssetsDataSourceManager
- (CKMomentSharePreviewAssetsDataSourceManager)init;
- (CKMomentSharePreviewAssetsDataSourceManager)initWithMomentShareURL:(id)a3;
- (NSURL)momentShareURL;
- (PHMomentShare)momentShare;
- (id)createInitialDataSource;
- (void)_fetchMomentShare;
- (void)_handleFetchedMomentShare:(id)a3 error:(id)a4;
- (void)_momentShareCacheDidChange:(id)a3;
- (void)createInitialDataSource;
@end

@implementation CKMomentSharePreviewAssetsDataSourceManager

- (CKMomentSharePreviewAssetsDataSourceManager)init
{
  return [(CKMomentSharePreviewAssetsDataSourceManager *)self initWithMomentShareURL:0];
}

- (CKMomentSharePreviewAssetsDataSourceManager)initWithMomentShareURL:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKMomentSharePreviewAssetsDataSourceManager;
  v6 = [(PXSectionedDataSourceManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    p_momentShareURL = &v6->_momentShareURL;
    objc_storeStrong((id *)&v6->_momentShareURL, a3);
    if (*p_momentShareURL)
    {
      uint64_t v9 = [MEMORY[0x1E4F6BD40] sharedInstance];
      momentShareCache = v7->_momentShareCache;
      v7->_momentShareCache = (IMMomentShareCache *)v9;

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:v7 selector:sel__momentShareCacheDidChange_ name:*MEMORY[0x1E4F6BB38] object:v7->_momentShareCache];

      [(CKMomentSharePreviewAssetsDataSourceManager *)v7 _fetchMomentShare];
    }
  }

  return v7;
}

- (id)createInitialDataSource
{
  currentDataSource = self->_currentDataSource;
  if (!currentDataSource)
  {
    v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CKMomentSharePreviewAssetsDataSourceManager createInitialDataSource]((uint64_t)self);
    }

    _CreateDataSourceForMomentShare(self->_momentShare);
    id v5 = (PXStaticDisplayAssetsDataSource *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentDataSource;
    self->_currentDataSource = v5;

    currentDataSource = self->_currentDataSource;
  }

  return currentDataSource;
}

- (void)_fetchMomentShare
{
  id location = 0;
  objc_initWeak(&location, self);
  momentShareCache = self->_momentShareCache;
  v4 = [(NSURL *)self->_momentShareURL absoluteString];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CKMomentSharePreviewAssetsDataSourceManager__fetchMomentShare__block_invoke;
  v5[3] = &unk_1E562B570;
  objc_copyWeak(&v6, &location);
  [(IMMomentShareCache *)momentShareCache momentShareForURLString:v4 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __64__CKMomentSharePreviewAssetsDataSourceManager__fetchMomentShare__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleFetchedMomentShare:v6 error:v5];
}

- (void)_handleFetchedMomentShare:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = IMLogHandleForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v10) {
      -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.6((uint64_t)self, v7);
    }
  }
  else if (v10)
  {
    -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.5();
  }

  if (CKIsEqual(self->_momentShare, v7))
  {
    v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:]((uint64_t)self, v7);
    }
LABEL_15:

    goto LABEL_19;
  }
  objc_storeStrong((id *)&self->_momentShare, a3);
  currentDataSource = self->_currentDataSource;
  v11 = IMLogHandleForCategory();
  BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (!currentDataSource)
  {
    if (v13) {
      -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:]((uint64_t)self, v11);
    }
    goto LABEL_15;
  }
  if (v7)
  {
    if (v13) {
      -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.4((uint64_t)self, v7);
    }
  }
  else if (v13)
  {
    -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:]();
  }

  _CreateDataSourceForMomentShare(self->_momentShare);
  v14 = (PXStaticDisplayAssetsDataSource *)objc_claimAutoreleasedReturnValue();
  v15 = self->_currentDataSource;
  self->_currentDataSource = v14;

  [(PXSectionedDataSourceManager *)self setDataSource:self->_currentDataSource changeDetails:0];
LABEL_19:
}

- (void)_momentShareCacheDidChange:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6BB40]];

  id v6 = [(NSURL *)self->_momentShareURL absoluteString];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CKMomentSharePreviewAssetsDataSourceManager _momentShareCacheDidChange:]();
    }

    [(CKMomentSharePreviewAssetsDataSourceManager *)self _fetchMomentShare];
  }
}

- (NSURL)momentShareURL
{
  return self->_momentShareURL;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_momentShareURL, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);

  objc_storeStrong((id *)&self->_momentShareCache, 0);
}

- (void)createInitialDataSource
{
  v1 = [*(id *)(a1 + 192) uuid];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_18EF18000, v2, v3, "<%p> Create initial data source for moment share: %{public}@, URL: %@", v4, v5, v6, v7, v8);
}

- (void)_handleFetchedMomentShare:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uuid];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_18EF18000, v3, v4, "<%p> Ignoring redundant update for moment share: %{public}@, URL: %@", v5, v6, v7, v8, v9);
}

- (void)_handleFetchedMomentShare:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18EF18000, a2, OS_LOG_TYPE_DEBUG, "<%p> Waiting to create the initial data source", (uint8_t *)&v2, 0xCu);
}

- (void)_handleFetchedMomentShare:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_18EF18000, v0, OS_LOG_TYPE_DEBUG, "<%p> Provide placeholder for URL: %@", v1, 0x16u);
}

- (void)_handleFetchedMomentShare:(uint64_t)a1 error:(void *)a2 .cold.4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uuid];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_18EF18000, v3, v4, "<%p> Provide preview for moment share: %{public}@, URL: %@", v5, v6, v7, v8, v9);
}

- (void)_handleFetchedMomentShare:error:.cold.5()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_3();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_18EF18000, v2, OS_LOG_TYPE_DEBUG, "<%p> Failed to fetch moment share for URL: %@, error: %@", v3, 0x20u);
}

- (void)_handleFetchedMomentShare:(uint64_t)a1 error:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  os_log_t v2 = [a2 uuid];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_18EF18000, v3, v4, "<%p> Fetched moment share: %{public}@ for URL: %@", v5, v6, v7, v8, v9);
}

- (void)_momentShareCacheDidChange:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_18EF18000, v0, OS_LOG_TYPE_DEBUG, "<%p> Re-fetch changed moment share for URL: %@", v1, 0x16u);
}

@end