@interface MRUMediaSuggestionsPullDataSource
- (BOOL)requestActive;
- (MRMediaSuggestionPreferences)preferences;
- (MRMediaSuggestionRequest)request;
- (MRUMediaSuggestionsDataSourceDelegate)delegate;
- (MRUMediaSuggestionsPullDataSource)init;
- (NSDate)lastRequestDate;
- (NSDictionary)mediaSuggestions;
- (OS_dispatch_queue)requestQueue;
- (void)refreshMediaSuggestions;
- (void)setDelegate:(id)a3;
- (void)setLastRequestDate:(id)a3;
- (void)setMediaSuggestions:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestActive:(BOOL)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation MRUMediaSuggestionsPullDataSource

- (MRUMediaSuggestionsPullDataSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)MRUMediaSuggestionsPullDataSource;
  v2 = [(MRUMediaSuggestionsPullDataSource *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F77070] defaultRequestWithArtwork];
    request = v2->_request;
    v2->_request = (MRMediaSuggestionRequest *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaControls.MRUMediaSuggestionsPullDataSource/requestQueue", 0);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v5;

    v7 = (MRMediaSuggestionPreferences *)objc_alloc_init(MEMORY[0x1E4F77068]);
    preferences = v2->_preferences;
    v2->_preferences = v7;

    objc_initWeak(&location, v2);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__MRUMediaSuggestionsPullDataSource_init__block_invoke;
    v10[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v11, &location);
    [(MRMediaSuggestionPreferences *)v2->_preferences setUserDisplayPreferencesDidChangeCallback:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__MRUMediaSuggestionsPullDataSource_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshMediaSuggestions];
}

- (NSDictionary)mediaSuggestions
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSDictionary *)v2->_mediaSuggestions copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)refreshMediaSuggestions
{
  objc_initWeak(&location, self);
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke;
  block[3] = &unk_1E5F0FC88;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(requestQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    BOOL v5 = -v4 < 60.0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    BOOL v5 = 0;
  }
  if (!*(unsigned char *)(v2 + 8) && !v5)
  {
    *(unsigned char *)(v2 + 8) = 1;
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    uint64_t v11 = *(void *)(v9 + 56);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_2;
    v12[3] = &unk_1E5F0FC60;
    v12[4] = v9;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    [v10 performWithPreferences:v11 completion:v12];
    objc_destroyWeak(&v13);
  }
}

void __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_3;
  v11[3] = &unk_1E5F0FC38;
  v11[4] = v7;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
}

void __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_sync_enter(v2);
  [v2 setMediaSuggestions:*(void *)(a1 + 40)];
  objc_sync_exit(v2);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_4;
  v8[3] = &unk_1E5F0D8E8;
  v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v8);
  uint64_t v3 = MCLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "%@, %@ request retrieved media suggestions: %@, error: %@", buf, 0x2Au);
  }
}

void __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaSuggestionsDataSource:*(void *)(a1 + 32) didChangeMediaSuggestions:*(void *)(a1 + 40)];
}

- (MRUMediaSuggestionsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUMediaSuggestionsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setMediaSuggestions:(id)a3
{
}

- (MRMediaSuggestionRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSDate)lastRequestDate
{
  return self->_lastRequestDate;
}

- (void)setLastRequestDate:(id)a3
{
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (MRMediaSuggestionPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (BOOL)requestActive
{
  return self->_requestActive;
}

- (void)setRequestActive:(BOOL)a3
{
  self->_requestActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_mediaSuggestions, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end