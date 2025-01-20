@interface MRUMediaSuggestionsController
- (BOOL)isPlaying;
- (BOOL)isQueueHandoffActive;
- (MRUEndpointController)endpointController;
- (MRULockScreenMonitor)lockscreenMonitor;
- (MRUMediaSuggestionsController)initWithEndpointController:(id)a3 metadataController:(id)a4 dataSource:(id)a5;
- (MRUMediaSuggestionsControllerDelegate)delegate;
- (MRUMediaSuggestionsDataSource)dataSource;
- (MRUMetadataController)metadataController;
- (NSArray)mediaSuggestions;
- (NSDate)lastPlayingDate;
- (NSString)context;
- (OS_dispatch_queue)requestQueue;
- (void)metadataController:(id)a3 didChangeNowPlayingInfo:(id)a4;
- (void)playSuggestion:(id)a3 completion:(id)a4;
- (void)refreshMediaSuggestions;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setIsQueueHandoffActive:(BOOL)a3;
- (void)setLastPlayingDate:(id)a3;
- (void)setLockscreenMonitor:(id)a3;
- (void)setMediaSuggestions:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)updateLastPlayedDate;
- (void)updateMediaSuggestions;
- (void)updatePlayingState;
@end

@implementation MRUMediaSuggestionsController

- (MRUMediaSuggestionsController)initWithEndpointController:(id)a3 metadataController:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MRUMediaSuggestionsController;
  v12 = [(MRUMediaSuggestionsController *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpointController, a3);
    if ([v9 updatesActiveEndpointInPlace]) {
      [(MRUEndpointController *)v13->_endpointController addObserver:v13];
    }
    objc_storeStrong((id *)&v13->_metadataController, a4);
    [(MRUMetadataController *)v13->_metadataController addObserver:v13];
    objc_storeStrong((id *)&v13->_dataSource, a5);
    [(MRUMediaSuggestionsDataSource *)v13->_dataSource setDelegate:v13];
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MediaControls.MRUMediaSuggestionsController/requestQueue", 0);
    requestQueue = v13->_requestQueue;
    v13->_requestQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_context, (id)*MEMORY[0x1E4F76F98]);
    uint64_t v16 = +[MRULockScreenMonitor sharedMonitor];
    lockscreenMonitor = v13->_lockscreenMonitor;
    v13->_lockscreenMonitor = (MRULockScreenMonitor *)v16;

    [(MRULockScreenMonitor *)v13->_lockscreenMonitor addObserver:v13];
    v18 = [v10 nowPlayingInfo];
    v13->_isPlaying = [v18 isPlaying];

    [(MRUMediaSuggestionsController *)v13 updateLastPlayedDate];
  }

  return v13;
}

- (void)setContext:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_context, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_context, a3);
    [(MRUMediaSuggestionsController *)self updateMediaSuggestions];
  }
}

- (void)setIsQueueHandoffActive:(BOOL)a3
{
  if (self->_isQueueHandoffActive != a3)
  {
    self->_isQueueHandoffActive = a3;
    [(MRUMediaSuggestionsController *)self updateMediaSuggestions];
  }
}

- (void)setMediaSuggestions:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_mediaSuggestions, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_mediaSuggestions, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained mediaSuggestionsController:self didChangeMediaSuggestions:v6];
  }
}

- (void)refreshMediaSuggestions
{
}

- (void)playSuggestion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MRUEndpointController *)self->_endpointController route];
  id v9 = [v8 endpoint];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__MRUMediaSuggestionsController_playSuggestion_completion___block_invoke;
  v12[3] = &unk_1E5F10200;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v11 playOnEndpoint:v9 completion:v12];
}

void __59__MRUMediaSuggestionsController_playSuggestion_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = MCLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Error trying to play suggestion: %{public}@ error: %{public}@", buf, 0x20u);
    }
  }
  if (*(void *)(a1 + 48))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__MRUMediaSuggestionsController_playSuggestion_completion___block_invoke_1;
    v7[3] = &unk_1E5F0DFB8;
    id v9 = *(id *)(a1 + 48);
    id v8 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __59__MRUMediaSuggestionsController_playSuggestion_completion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)metadataController:(id)a3 didChangeNowPlayingInfo:(id)a4
{
  [(MRUMediaSuggestionsController *)self updatePlayingState];

  [(MRUMediaSuggestionsController *)self updateMediaSuggestions];
}

- (void)updatePlayingState
{
  id v3 = [(MRUMetadataController *)self->_metadataController nowPlayingInfo];
  v4 = v3;
  id v8 = v3;
  if (self->_isPlaying)
  {
    char v5 = [v3 isPlaying];
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
      lastPlayingDate = self->_lastPlayingDate;
      self->_lastPlayingDate = v6;

      v4 = v8;
    }
  }
  self->_isPlaying = [v4 isPlaying];
}

- (void)updateMediaSuggestions
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUMetadataController *)self->_metadataController nowPlayingInfo];
  v4 = [(MRUMediaSuggestionsDataSource *)self->_dataSource mediaSuggestions];
  char v5 = [v4 objectForKeyedSubscript:self->_context];
  uint64_t v6 = (void *)[v5 copy];

  unint64_t v7 = [v6 count];
  lastPlayingDate = self->_lastPlayingDate;
  if (lastPlayingDate)
  {
    [(NSDate *)lastPlayingDate timeIntervalSinceNow];
    BOOL v10 = -v9 >= 480.0;
  }
  else
  {
    BOOL v10 = 0;
  }
  if ([(MRUEndpointController *)self->_endpointController isEndpointDiscovered]) {
    BOOL v32 = [(MRUEndpointController *)self->_endpointController state] == 3;
  }
  else {
    BOOL v32 = 0;
  }
  BOOL v11 = [(MRULockScreenMonitor *)self->_lockscreenMonitor isDeviceLocked];
  int v12 = [v3 isPlaying];
  v33 = v3;
  int v13 = [v3 showPlaceholder];
  BOOL isQueueHandoffActive = self->_isQueueHandoffActive;
  BOOL v15 = +[MRUFeatureFlagProvider isMediaSuggestionsDevEnabled];
  unint64_t v16 = v7;
  int v17 = !v11;
  int v18 = v7 >= 4 || v15;
  int v19 = v15 || v10;
  if (v17)
  {
    objc_super v20 = 0;
    int v23 = v18 ^ 1;
    if (isQueueHandoffActive) {
      int v23 = 1;
    }
    if (((v23 | v12) & 1) == 0) {
      goto LABEL_14;
    }
LABEL_21:
    unint64_t v22 = v16;
    goto LABEL_22;
  }
  objc_super v20 = 0;
  int v21 = MRUseInternalUI() ^ 1;
  if (isQueueHandoffActive) {
    int v21 = 1;
  }
  if ((v21 | v12 | v18 ^ 1)) {
    goto LABEL_21;
  }
LABEL_14:
  unint64_t v22 = v16;
  if (v32)
  {
    if (v19 | v13) {
      objc_super v20 = v6;
    }
    else {
      objc_super v20 = 0;
    }
  }
LABEL_22:
  id v24 = v20;

  if (![(NSArray *)self->_mediaSuggestions isEqualToArray:v24])
  {
    objc_storeStrong((id *)&self->_mediaSuggestions, v20);
    v25 = MCLogCategoryDefault();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = objc_opt_class();
      BOOL v27 = self->_isQueueHandoffActive;
      int v28 = [v33 isPlaying];
      int v29 = [v33 showPlaceholder];
      context = self->_context;
      *(_DWORD *)buf = 138545410;
      uint64_t v35 = v26;
      __int16 v36 = 2048;
      unint64_t v37 = v22;
      __int16 v38 = 1024;
      int v39 = v17;
      __int16 v40 = 1024;
      BOOL v41 = v27;
      __int16 v42 = 1024;
      int v43 = v28;
      __int16 v44 = 1024;
      BOOL v45 = v32;
      __int16 v46 = 1024;
      int v47 = v19;
      __int16 v48 = 1024;
      int v49 = v29;
      __int16 v50 = 2114;
      v51 = context;
      _os_log_impl(&dword_1AE7DF000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ update media suggestions: #%lu | unlocked: %{BOOL}u | QHO: %{BOOL}u | playing: %{BOOL}u, connected: %{BOOL}u | elapsed: %{BOOL}u | placeholder: %{BOOL}u | context: %{public}@", buf, 0x44u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained mediaSuggestionsController:self didChangeMediaSuggestions:v24];
  }
}

- (void)updateLastPlayedDate
{
  id v3 = [(MRUEndpointController *)self->_endpointController route];
  v4 = objc_msgSend((id)objc_msgSend(v3, "endpoint"), "origin");

  char v5 = (void *)[objc_alloc(MEMORY[0x1E4F77090]) initWithOrigin:v4];
  objc_initWeak(&location, self);
  requestQueue = self->_requestQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__MRUMediaSuggestionsController_updateLastPlayedDate__block_invoke;
  v8[3] = &unk_1E5F10228;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [v5 requestDeviceLastPlayingDateOnQueue:requestQueue completion:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __53__MRUMediaSuggestionsController_updateLastPlayedDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MCLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_ERROR, "%@, failed to get the last playing date for origin: %@, error: %@", buf, 0x20u);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__MRUMediaSuggestionsController_updateLastPlayedDate__block_invoke_7;
  v11[3] = &unk_1E5F0D870;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  id v12 = v5;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v13);
}

void __53__MRUMediaSuggestionsController_updateLastPlayedDate__block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setLastPlayingDate:v1];

  id v4 = objc_loadWeakRetained(v2);
  [v4 updateMediaSuggestions];
}

- (MRUEndpointController)endpointController
{
  return self->_endpointController;
}

- (MRUMetadataController)metadataController
{
  return self->_metadataController;
}

- (MRUMediaSuggestionsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (MRUMediaSuggestionsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUMediaSuggestionsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)mediaSuggestions
{
  return self->_mediaSuggestions;
}

- (NSString)context
{
  return self->_context;
}

- (BOOL)isQueueHandoffActive
{
  return self->_isQueueHandoffActive;
}

- (MRULockScreenMonitor)lockscreenMonitor
{
  return self->_lockscreenMonitor;
}

- (void)setLockscreenMonitor:(id)a3
{
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (NSDate)lastPlayingDate
{
  return self->_lastPlayingDate;
}

- (void)setLastPlayingDate:(id)a3
{
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_lockscreenMonitor, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mediaSuggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_metadataController, 0);

  objc_storeStrong((id *)&self->_endpointController, 0);
}

@end