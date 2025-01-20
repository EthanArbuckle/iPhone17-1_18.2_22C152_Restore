@interface MPPlayableContentManager
+ (BOOL)_deviceIsCarplayCapable;
+ (MPPlayableContentManager)sharedContentManager;
- (BOOL)_areContentLimitsEnforced;
- (BOOL)_contentItemWasSentToMediaRemote:(id)a3;
- (BOOL)_musicListsLimited;
- (BOOL)_onQueueContentItemWasSentToMediaRemote:(id)a3;
- (MPPlayableContentManager)init;
- (MPPlayableContentManagerContext)context;
- (NSArray)nowPlayingIdentifiers;
- (id)_init;
- (id)dataSource;
- (id)delegate;
- (void)_browsableContentEndpointChanged:(id)a3;
- (void)_contentItemChangedNotification:(id)a3;
- (void)_enqueueArtworkUpdate:(id)a3 size:(CGSize)a4 withCompletion:(id)a5;
- (void)_enqueueArtworkUpdate:(id)a3 withCompletion:(id)a4;
- (void)_handlePlaybackInitializationCompletedWithContext:(id)a3 error:(id)a4;
- (void)_limitedUIChanged:(id)a3;
- (void)_markContentItemsAsSentToMediaRemote:(id)a3;
- (void)_pushContentItemsUpdate;
- (void)_scheduleUpdateSupportedAPIs;
- (void)_setupMediaRemoteEndpoint;
- (void)_setupNotifications;
- (void)_tearDownMediaRemoteEndpoint;
- (void)_tearDownNotifications;
- (void)_updateSupportedAPIs;
- (void)beginUpdates;
- (void)dealloc;
- (void)endUpdates;
- (void)reloadData;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)dataSource;
- (void)setDelegate:(id)delegate;
- (void)setNowPlayingIdentifiers:(NSArray *)nowPlayingIdentifiers;
@end

@implementation MPPlayableContentManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingIdentifiers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentSessionStatus, 0);
  objc_storeStrong((id *)&self->_artworkUpdateQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifiersSentToMediaRemote, 0);

  objc_storeStrong((id *)&self->_mutatedContentItems, 0);
}

- (NSArray)nowPlayingIdentifiers
{
  return self->_nowPlayingIdentifiers;
}

- (void)setContext:(id)a3
{
}

- (MPPlayableContentManagerContext)context
{
  return self->_context;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (id)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return WeakRetained;
}

- (void)_scheduleUpdateSupportedAPIs
{
  if (!self->_scheduledSupportedAPIsChange)
  {
    self->_scheduledSupportedAPIsChange = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MPPlayableContentManager__scheduleUpdateSupportedAPIs__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__MPPlayableContentManager__scheduleUpdateSupportedAPIs__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateSupportedAPIs];
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
  return result;
}

- (void)_updateSupportedAPIs
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(MPPlayableContentManager *)self delegate];
  objc_opt_respondsToSelector();
  objc_opt_respondsToSelector();
  v4 = [(MPPlayableContentManager *)self dataSource];
  objc_opt_respondsToSelector();
  objc_opt_respondsToSelector();
  objc_opt_respondsToSelector();
  v5 = (void *)MRMediaRemoteCopyBrowsableContentAPIMaskDescription();
  v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "Updating supported browsable content APIs: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  MRMediaRemoteSetSupportedBrowsableContentAPIs();
}

void __48__MPPlayableContentManager__updateSupportedAPIs__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 134217984;
      uint64_t v5 = a2;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "Error updating browsable content APIs. MediaRemote error %ld", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (BOOL)_areContentLimitsEnforced
{
  v3 = [(CARSessionStatus *)self->_currentSessionStatus currentSession];
  int v4 = [v3 limitUserInterfaces];
  if ([v4 BOOLValue]) {
    BOOL v5 = [(MPPlayableContentManager *)self _musicListsLimited];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_musicListsLimited
{
  v2 = [(CARSessionStatus *)self->_currentSessionStatus currentSession];
  v3 = [v2 configuration];
  unint64_t v4 = ((unint64_t)[v3 limitableUserInterfaces] >> 3) & 1;

  return v4;
}

- (void)_browsableContentEndpointChanged:(id)a3
{
  id v12 = [(CARSessionStatus *)self->_currentSessionStatus currentSession];
  unint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  BOOL v5 = getCARSessionLimitUserInterfacesChangedNotification();
  [v4 removeObserver:self name:v5 object:0];

  uint64_t v6 = [(MPPlayableContentManager *)self context];
  if (v12)
  {
    [v6 setEndpointAvailable:1];

    uint64_t v6 = getCARSessionLimitUserInterfacesChangedNotification();
    [v4 addObserver:self selector:sel__limitedUIChanged_ name:v6 object:0];
  }
  else
  {
    [v6 setEndpointAvailable:0];
  }

  int v7 = [(MPPlayableContentManager *)self context];
  objc_msgSend(v7, "setContentLimitsEnforced:", -[MPPlayableContentManager _areContentLimitsEnforced](self, "_areContentLimitsEnforced"));

  v8 = [(MPPlayableContentManager *)self context];
  if ([(MPPlayableContentManager *)self _musicListsLimited]) {
    uint64_t v9 = 12;
  }
  else {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v8 setEnforcedContentItemsCount:v9];

  v10 = [(MPPlayableContentManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v11 = [(MPPlayableContentManager *)self context];
    [v10 playableContentManager:self didUpdateContext:v11];
  }
}

- (void)_limitedUIChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(MPPlayableContentManager *)self context];
  objc_msgSend(v4, "setContentLimitsEnforced:", -[MPPlayableContentManager _areContentLimitsEnforced](self, "_areContentLimitsEnforced"));

  BOOL v5 = [(MPPlayableContentManager *)self context];
  if ([(MPPlayableContentManager *)self _musicListsLimited]) {
    uint64_t v6 = 12;
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v5 setEnforcedContentItemsCount:v6];

  int v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MPPlayableContentManager _musicListsLimited](self, "_musicListsLimited"));
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Content manager updated limited UI: %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = [(MPPlayableContentManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v10 = [(MPPlayableContentManager *)self context];
    [v9 playableContentManager:self didUpdateContext:v10];
  }
}

- (void)_markContentItemsAsSentToMediaRemote:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MPPlayableContentManager__markContentItemsAsSentToMediaRemote___block_invoke;
  v7[3] = &unk_1E57F9F98;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __65__MPPlayableContentManager__markContentItemsAsSentToMediaRemote___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v9);

        if (v7 != v8) {
          [*(id *)(*(void *)(a1 + 40) + 16) addObject:MRContentItemGetIdentifier()];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (BOOL)_onQueueContentItemWasSentToMediaRemote:(id)a3
{
  contentItemIdentifiersSentToMediaRemote = self->_contentItemIdentifiersSentToMediaRemote;
  uint64_t v4 = [a3 identifier];
  LOBYTE(contentItemIdentifiersSentToMediaRemote) = [(NSMutableSet *)contentItemIdentifiersSentToMediaRemote containsObject:v4];

  return (char)contentItemIdentifiersSentToMediaRemote;
}

- (BOOL)_contentItemWasSentToMediaRemote:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MPPlayableContentManager__contentItemWasSentToMediaRemote___block_invoke;
  block[3] = &unk_1E57F9F48;
  id v9 = v4;
  long long v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

uint64_t __61__MPPlayableContentManager__contentItemWasSentToMediaRemote___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _onQueueContentItemWasSentToMediaRemote:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_handlePlaybackInitializationCompletedWithContext:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 serviced])
  {
    int v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(sel_playableContentManager_initiatePlaybackOfContentItemAtIndexPath_completionHandler_);
      int v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "The completion handler for the current %{public}@ procedure has already been called once. You should only call MediaPlayer's completion handler once after servicing the call.", (uint8_t *)&v16, 0xCu);
    }
  }
  id v9 = [v5 indexPath];
  unint64_t v10 = [v9 length];
  uint64_t v11 = (void **)malloc_type_malloc(0x10uLL, 0x1010040FDD9F14CuLL);
  v11[1] = (void *)v10;
  if (v10)
  {
    uint64_t v12 = 0;
    void *v11 = malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
    unsigned int v13 = 1;
    do
    {
      *((void *)*v11 + v12) = [v9 indexAtPosition:v12];
      uint64_t v12 = v13;
    }
    while (v10 > v13++);
  }
  else
  {
    void *v11 = 0;
  }
  MRMediaRemoteFinishedPlaybackInitialization();
  v15 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    v17 = v9;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, "Playback initialization completed at index path: %{public}@, error: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  free(*v11);
  free(v11);
  [v5 setServiced:1];
}

- (void)_pushContentItemsUpdate
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MPPlayableContentManager__pushContentItemsUpdate__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __51__MPPlayableContentManager__pushContentItemsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    id v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v3;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Pushing content items update with items: %@", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) waitUntilAllOperationsAreFinished];
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(id *)(*((void *)&v11 + 1) + 8 * v9);
          objc_msgSend(v4, "addObject:", objc_msgSend(v10, "_mediaRemoteContentItem", (void)v11));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    MRMediaRemoteUpdateBrowsableContentItems();
    [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  }
}

- (void)_tearDownNotifications
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"_MPContentItemDidChangeNotification" object:0];
  uint64_t v3 = getCARSessionLimitUserInterfacesChangedNotification();
  [v4 removeObserver:self name:v3 object:0];

  [v4 removeObserver:self name:*MEMORY[0x1E4F77228] object:0];
}

- (void)_setupNotifications
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__contentItemChangedNotification_ name:@"_MPContentItemDidChangeNotification" object:0];
  uint64_t v3 = getCARSessionLimitUserInterfacesChangedNotification();
  [v4 addObserver:self selector:sel__limitedUIChanged_ name:v3 object:0];

  [v4 addObserver:self selector:sel__browsableContentEndpointChanged_ name:*MEMORY[0x1E4F77228] object:0];
}

- (void)_tearDownMediaRemoteEndpoint
{
}

- (void)_setupMediaRemoteEndpoint
{
  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Content manager setting up media remote endpoint.", v4, 2u);
  }

  _setupMediaRemoteEndpoint___endpoint = (uint64_t)self;
  MRMediaRemoteSetBrowsableContentEndpoint();
}

- (void)_enqueueArtworkUpdate:(id)a3 size:(CGSize)a4 withCompletion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  artworkUpdateQueue = self->_artworkUpdateQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__MPPlayableContentManager__enqueueArtworkUpdate_size_withCompletion___block_invoke;
  v14[3] = &unk_1E57F0D08;
  CGFloat v17 = width;
  CGFloat v18 = height;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [(NSOperationQueue *)artworkUpdateQueue addOperationWithBlock:v14];
}

void __70__MPPlayableContentManager__enqueueArtworkUpdate_size_withCompletion___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = v2;
  if (v2 == -1.0)
  {
    [*(id *)(a1 + 32) bounds];
    double v4 = v5;
  }
  double v6 = v3;
  if (v3 == -1.0)
  {
    [*(id *)(a1 + 32) bounds];
    double v6 = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "imageWithSize:", v4, v6);
  uint64_t v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    [(UIImage *)v8 size];
    if (v10 > 0.0)
    {
      [(UIImage *)v9 size];
      if (v11 > 0.0)
      {
        [(UIImage *)v9 size];
        double v13 = v12;
        [(UIImage *)v9 size];
        if (v2 == -1.0 && v3 == -1.0)
        {
          [(UIImage *)v9 size];
          double v2 = v15;
          [(UIImage *)v9 size];
          double v3 = v16;
        }
        else
        {
          double v17 = v13 / v14;
          if (v2 == -1.0)
          {
            double v2 = v3 * v17;
          }
          else if (v3 == -1.0)
          {
            double v3 = v2 / v17;
          }
        }
      }
    }
    [(UIImage *)v9 size];
    if (v18 > v2 || ([(UIImage *)v9 size], v19 > v3))
    {
      v24.CGFloat width = v2;
      v24.CGFloat height = v3;
      UIGraphicsBeginImageContextWithOptions(v24, 0, 0.0);
      -[UIImage drawInRect:](v9, "drawInRect:", 0.0, 0.0, v2, v3);
      uint64_t v20 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();

      id v9 = (UIImage *)v20;
    }
    UIImagePNGRepresentation(v9);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }
  uint64_t v21 = *(void *)(a1 + 40);
  [(UIImage *)v9 size];
  (*(void (**)(uint64_t, id))(v21 + 16))(v21, v22);
}

- (void)_enqueueArtworkUpdate:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  artworkUpdateQueue = self->_artworkUpdateQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MPPlayableContentManager__enqueueArtworkUpdate_withCompletion___block_invoke;
  v11[3] = &unk_1E57F9140;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSOperationQueue *)artworkUpdateQueue addOperationWithBlock:v11];
}

void __65__MPPlayableContentManager__enqueueArtworkUpdate_withCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pngDataWithSize:", 768.0, 768.0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sessionDidDisconnect:(id)a3
{
  [(MPPlayableContentManager *)self _tearDownMediaRemoteEndpoint];

  [(MPPlayableContentManager *)self _tearDownNotifications];
}

- (void)sessionDidConnect:(id)a3
{
  double v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Content manager session connected.", buf, 2u);
    }

    if (!self->_context)
    {
      id v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Content manager initializing context.", v12, 2u);
      }

      uint64_t v8 = objc_alloc_init(MPPlayableContentManagerContext);
      context = self->_context;
      self->_context = v8;

      [(MPPlayableContentManagerContext *)self->_context setContentLimitsEnforced:[(MPPlayableContentManager *)self _areContentLimitsEnforced]];
      id v10 = self->_context;
      if ([(MPPlayableContentManager *)self _musicListsLimited]) {
        uint64_t v11 = 12;
      }
      else {
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      [(MPPlayableContentManagerContext *)v10 setEnforcedContentItemsCount:v11];
      [(MPPlayableContentManagerContext *)self->_context setEnforcedContentTreeDepth:5];
      [(MPPlayableContentManagerContext *)self->_context setEndpointAvailable:1];
    }
    [(MPPlayableContentManager *)self _setupMediaRemoteEndpoint];
    [(MPPlayableContentManager *)self _setupNotifications];
    [(MPPlayableContentManager *)self _scheduleUpdateSupportedAPIs];
    [(MPPlayableContentManager *)self reloadData];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Content manager has no available session.", v14, 2u);
    }
  }
}

- (void)_contentItemChangedNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MPPlayableContentManager__contentItemChangedNotification___block_invoke;
  v7[3] = &unk_1E57F9F98;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __60__MPPlayableContentManager__contentItemChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  if (([*(id *)(*(void *)(a1 + 40) + 8) containsObject:v2] & 1) == 0
    && [*(id *)(a1 + 40) _onQueueContentItemWasSentToMediaRemote:v2])
  {
    double v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[PlayableContentManager] Content item %@ mutated. Enqueueing for update.", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 40) + 8) addObject:v2];
    id v4 = *(unsigned char **)(a1 + 40);
    if (!v4[40]) {
      [v4 _pushContentItemsUpdate];
    }
  }
}

- (void)setNowPlayingIdentifiers:(NSArray *)nowPlayingIdentifiers
{
  int v5 = nowPlayingIdentifiers;
  if (!v5)
  {
    if (dyld_program_sdk_at_least())
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"MPPlayableContentManager.m" lineNumber:216 description:@"-[MPPlayableContentManager setNowPlayingIdentifiers:] nowPlayingIdentifiers cannot be nil."];

      int v5 = 0;
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Warning: -[MPPlayableContentManager setNowPlayingIdentifiers:] nowPlayingIdentifiers cannot be nil. The argument has been replaced with an empty array, please change usage to match this expectation. An assertion will be triggered for apps built on or after the iOS 12.2 SDK.", buf, 2u);
      }

      int v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  serialQueue = self->_serialQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__MPPlayableContentManager_setNowPlayingIdentifiers___block_invoke;
  v10[3] = &unk_1E57F9F98;
  v10[4] = self;
  uint64_t v11 = v5;
  id v9 = v5;
  dispatch_sync(serialQueue, v10);
}

uint64_t __53__MPPlayableContentManager_setNowPlayingIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  int v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Content manager updated now playing identifiers. Pushing new identifiers.", v7, 2u);
  }

  return MRMediaRemoteUpdateNowPlayingIdentifiers();
}

- (void)endUpdates
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MPPlayableContentManager_endUpdates__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __38__MPPlayableContentManager_endUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Content manager stopped coalescing content item updates. Pushing changes, if any.", v4, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return [*(id *)(a1 + 32) _pushContentItemsUpdate];
}

- (void)beginUpdates
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MPPlayableContentManager_beginUpdates__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __40__MPPlayableContentManager_beginUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Content manager beginning to coalesce content item updates.", v3, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
}

- (void)reloadData
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MPPlayableContentManager_reloadData__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __38__MPPlayableContentManager_reloadData__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Content manager invalidating browsable content...", v4, 2u);
  }

  return MRMediaRemoteInvalidateBrowsableContent();
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);

  [(MPPlayableContentManager *)self _scheduleUpdateSupportedAPIs];
}

- (void)setDataSource:(id)dataSource
{
  objc_storeWeak((id *)&self->_dataSource, dataSource);
  [(MPPlayableContentManager *)self _scheduleUpdateSupportedAPIs];
  if (self->_context)
  {
    [(MPPlayableContentManager *)self reloadData];
  }
  else
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Content manager skipping dataSource reload; awaiting context.",
        v5,
        2u);
    }
  }
}

- (void)dealloc
{
  [(MPPlayableContentManager *)self _tearDownMediaRemoteEndpoint];
  [(MPPlayableContentManager *)self _tearDownNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MPPlayableContentManager;
  [(MPPlayableContentManager *)&v3 dealloc];
}

- (MPPlayableContentManager)init
{
  return 0;
}

- (id)_init
{
  v18.receiver = self;
  v18.super_class = (Class)MPPlayableContentManager;
  uint64_t v2 = [(MPPlayableContentManager *)&v18 init];
  if (v2)
  {
    objc_super v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Content manager initialized, awaiting session status.", buf, 2u);
    }

    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutatedContentItems = v2->_mutatedContentItems;
    v2->_mutatedContentItems = v4;

    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    contentItemIdentifiersSentToMediaRemote = v2->_contentItemIdentifiersSentToMediaRemote;
    v2->_contentItemIdentifiersSentToMediaRemote = v6;

    nowPlayingIdentifiers = v2->_nowPlayingIdentifiers;
    v2->_nowPlayingIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaRemote.MPPlayableContentManagerSerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    artworkUpdateQueue = v2->_artworkUpdateQueue;
    v2->_artworkUpdateQueue = v11;

    [(NSOperationQueue *)v2->_artworkUpdateQueue setMaxConcurrentOperationCount:5];
    v2->_scheduledSupportedAPIsChange = 0;
    if ([(id)objc_opt_class() _deviceIsCarplayCapable])
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2050000000;
      id v13 = (void *)getCARSessionStatusClass_softClass;
      uint64_t v27 = getCARSessionStatusClass_softClass;
      if (!getCARSessionStatusClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        uint64_t v21 = __getCARSessionStatusClass_block_invoke;
        id v22 = &unk_1E57FA300;
        v23 = &v24;
        __getCARSessionStatusClass_block_invoke((uint64_t)buf);
        id v13 = (void *)v25[3];
      }
      double v14 = v13;
      _Block_object_dispose(&v24, 8);
      double v15 = (CARSessionStatus *)objc_alloc_init(v14);
      currentSessionStatus = v2->_currentSessionStatus;
      v2->_currentSessionStatus = v15;
    }
    else
    {
      currentSessionStatus = v2->_currentSessionStatus;
      v2->_currentSessionStatus = 0;
    }

    [(CARSessionStatus *)v2->_currentSessionStatus setSessionObserver:v2];
  }
  return v2;
}

+ (BOOL)_deviceIsCarplayCapable
{
  if (_deviceIsCarplayCapable_onceToken != -1) {
    dispatch_once(&_deviceIsCarplayCapable_onceToken, &__block_literal_global_27_18220);
  }
  return _deviceIsCarplayCapable__MGDeviceIsCarplayCapable;
}

uint64_t __51__MPPlayableContentManager__deviceIsCarplayCapable__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _deviceIsCarplayCapable__MGDeviceIsCarplayCapable = result;
  return result;
}

+ (MPPlayableContentManager)sharedContentManager
{
  if (sharedContentManager___once != -1) {
    dispatch_once(&sharedContentManager___once, &__block_literal_global_18225);
  }
  uint64_t v2 = (void *)sharedContentManager___instance;

  return (MPPlayableContentManager *)v2;
}

void __48__MPPlayableContentManager_sharedContentManager__block_invoke()
{
  id v0 = [[MPPlayableContentManager alloc] _init];
  v1 = (void *)sharedContentManager___instance;
  sharedContentManager___instance = (uint64_t)v0;
}

@end