@interface CPUINowPlayingManager
+ (id)sharedManager;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (CARObserverHashTable)stateObservers;
- (CPUINowPlayingManager)initWithBundleIdentifier:(id)a3;
- (CPUINowPlayingSnapshot)snapshot;
- (CPUIThrottle)metadataThrottle;
- (MPRequestResponseController)requestController;
- (NSString)bundleIdentifier;
- (NSString)lastContentItemIdentifier;
- (NSString)lastContentItemTitle;
- (unint64_t)throttleBehavior;
- (void)_setupRequestController;
- (void)addNowPlayingObserver:(id)a3;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)performCommandRequest:(id)a3 completion:(id)a4;
- (void)removeNowPlayingObserver:(id)a3;
- (void)setLastContentItemIdentifier:(id)a3;
- (void)setLastContentItemTitle:(id)a3;
- (void)setMetadataThrottle:(id)a3;
- (void)setRequestController:(id)a3;
- (void)setStateObservers:(id)a3;
- (void)setThrottleBehavior:(unint64_t)a3;
@end

@implementation CPUINowPlayingManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CPUINowPlayingManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager___manager;
  return v2;
}

uint64_t __38__CPUINowPlayingManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager___manager = [objc_alloc(*(Class *)(a1 + 32)) initWithBundleIdentifier:0];
  return MEMORY[0x270F9A758]();
}

- (CPUINowPlayingManager)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPUINowPlayingManager;
  v6 = [(CPUINowPlayingManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_throttleBehavior = 0;
    id v8 = objc_alloc(MEMORY[0x263F30E18]);
    uint64_t v9 = [v8 initWithProtocol:&unk_26DC45E18 callbackQueue:MEMORY[0x263EF83A0]];
    stateObservers = v7->_stateObservers;
    v7->_stateObservers = (CARObserverHashTable *)v9;

    objc_storeStrong((id *)&v7->_bundleIdentifier, a3);
    [(CPUINowPlayingManager *)v7 _setupRequestController];
  }

  return v7;
}

- (void)setThrottleBehavior:(unint64_t)a3
{
  if (self->_throttleBehavior != a3)
  {
    self->_throttleBehavior = a3;
    if (a3)
    {
      metadataThrottle = self->_metadataThrottle;
      if (metadataThrottle)
      {
        [(CPUIThrottle *)metadataThrottle unthrottle];
      }
      else
      {
        self->_metadataThrottle = [[CPUIThrottle alloc] initWithBase:15.0 factor:1.5 max:90.0];
        MEMORY[0x270F9A758]();
      }
    }
  }
}

- (void)_setupRequestController
{
  v58[1] = *MEMORY[0x263EF8340];
  v3 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x263F121E0]);
  v42 = self;
  requestController = self->_requestController;
  self->_requestController = v3;

  MRMediaRemoteSetWantsNowPlayingNotifications();
  id v39 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v57 = *MEMORY[0x263F11A18];
  id v38 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v5 = *MEMORY[0x263F11820];
  v56[0] = *MEMORY[0x263F11880];
  v56[1] = v5;
  uint64_t v6 = *MEMORY[0x263F11818];
  v56[2] = *MEMORY[0x263F117F8];
  v56[3] = v6;
  v56[4] = *MEMORY[0x263F11870];
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:5];
  v54[0] = *MEMORY[0x263F11AA8];
  v7 = (void *)MEMORY[0x263F12180];
  uint64_t v53 = *MEMORY[0x263F114F8];
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
  v40 = [v7 propertySetWithProperties:v41];
  v55[0] = v40;
  v54[1] = *MEMORY[0x263F11A98];
  id v8 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v52 = *MEMORY[0x263F114C0];
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
  uint64_t v50 = *MEMORY[0x263F11990];
  uint64_t v9 = (void *)MEMORY[0x263F12180];
  uint64_t v49 = *MEMORY[0x263F114F0];
  uint64_t v10 = v49;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  objc_super v12 = [v9 propertySetWithProperties:v11];
  v51 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  v14 = (void *)[v8 initWithProperties:v37 relationships:v13];
  v55[1] = v14;
  v54[2] = *MEMORY[0x263F11AA0];
  v15 = (void *)MEMORY[0x263F12180];
  uint64_t v48 = v10;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  v17 = [v15 propertySetWithProperties:v16];
  v55[2] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:3];
  v19 = (void *)[v38 initWithProperties:v43 relationships:v18];
  v58[0] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
  v21 = (void *)[v39 initWithProperties:0 relationships:v20];

  id v22 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v46 = *MEMORY[0x263F119F8];
  v23 = (void *)MEMORY[0x263F12180];
  uint64_t v24 = *MEMORY[0x263F11720];
  v45[0] = *MEMORY[0x263F11770];
  v45[1] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
  v26 = [v23 propertySetWithProperties:v25];
  v47 = v26;
  v27 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  v28 = (void *)[v22 initWithProperties:0 relationships:v27];

  id v29 = objc_alloc_init(MEMORY[0x263F54820]);
  objc_msgSend(v29, "setTracklistRange:", 1, 1);
  [v29 setQueueItemProperties:v21];
  [v29 setPlayingItemProperties:v21];
  v30 = (void *)MEMORY[0x263F54818];
  v31 = [(CPUINowPlayingManager *)v42 bundleIdentifier];
  v32 = [v30 pathWithRoute:0 bundleID:v31 playerID:0];
  [v29 setPlayerPath:v32];

  [v29 setQueueSectionProperties:v28];
  v33 = [(CPUINowPlayingManager *)v42 requestController];
  [v33 setRequest:v29];

  v34 = [(CPUINowPlayingManager *)v42 requestController];
  [v34 setDelegate:v42];

  v35 = CarPlayUIGeneralLogging();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227AC2000, v35, OS_LOG_TYPE_DEFAULT, "Beginning automatic mediaplayer response loading.", buf, 2u);
  }

  v36 = [(CPUINowPlayingManager *)v42 requestController];
  [v36 beginAutomaticResponseLoading];
}

- (void)dealloc
{
  v3 = CarPlayUIGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227AC2000, v3, OS_LOG_TYPE_DEFAULT, "Ending automatic mediaplayer response loading.", buf, 2u);
  }

  MRMediaRemoteSetWantsNowPlayingNotifications();
  v4.receiver = self;
  v4.super_class = (Class)CPUINowPlayingManager;
  [(CPUINowPlayingManager *)&v4 dealloc];
}

- (void)addNowPlayingObserver:(id)a3
{
  id v4 = a3;
  [(CARObserverHashTable *)self->_stateObservers registerObserver:v4];
  uint64_t v5 = [(CPUINowPlayingManager *)self snapshot];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __47__CPUINowPlayingManager_addNowPlayingObserver___block_invoke;
      v8[3] = &unk_26482D558;
      id v9 = v4;
      uint64_t v10 = self;
      dispatch_async(MEMORY[0x263EF83A0], v8);
    }
  }
}

void __47__CPUINowPlayingManager_addNowPlayingObserver___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 snapshot];
  [v1 nowPlayingManager:v2 didUpdateSnapshot:v3];
}

- (void)removeNowPlayingObserver:(id)a3
{
}

- (void)performCommandRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x263F54808];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__CPUINowPlayingManager_performCommandRequest_completion___block_invoke;
  v8[3] = &unk_26482D5A8;
  id v9 = v5;
  id v7 = v5;
  [v6 performRequest:a3 options:0x10000 completion:v8];
}

void __58__CPUINowPlayingManager_performCommandRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __58__CPUINowPlayingManager_performCommandRequest_completion___block_invoke_2;
    v4[3] = &unk_26482D580;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

uint64_t __58__CPUINowPlayingManager_performCommandRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CPUINowPlayingManager_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_26482D5D0;
  objc_super v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__CPUINowPlayingManager_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) response];
  id v4 = [[CPUINowPlayingSnapshot alloc] initWithResponse:v3];
  if ([*(id *)(a1 + 40) throttleBehavior] != 1) {
    goto LABEL_24;
  }
  id v5 = [(CPUINowPlayingSnapshot *)v4 song];
  id v6 = [v5 identifiers];

  id v7 = [v6 contentItemID];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = NSNumber;
    id v11 = [v6 library];
    objc_super v12 = objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
    id v9 = [v12 stringValue];
  }
  id v13 = [(CPUINowPlayingSnapshot *)v4 song];
  v14 = [v13 title];

  if (![v9 length] || !objc_msgSend(v14, "length"))
  {
LABEL_23:

LABEL_24:
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), v4);
    id v6 = [*(id *)(a1 + 40) stateObservers];
    [v6 nowPlayingManager:*(void *)(a1 + 40) didUpdateSnapshot:v4];
    goto LABEL_25;
  }
  v15 = [*(id *)(a1 + 40) lastContentItemIdentifier];
  if (![v15 length]) {
    goto LABEL_21;
  }
  v16 = [*(id *)(a1 + 40) lastContentItemIdentifier];
  if (![v9 isEqualToString:v16])
  {
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v17 = [*(id *)(a1 + 40) lastContentItemTitle];
  if (![v17 length])
  {

    goto LABEL_20;
  }
  v18 = [*(id *)(a1 + 40) lastContentItemTitle];
  char v30 = [v14 isEqualToString:v18];

  if (v30)
  {
LABEL_22:
    [*(id *)(a1 + 40) setLastContentItemIdentifier:v9];
    [*(id *)(a1 + 40) setLastContentItemTitle:v14];
    v28 = [*(id *)(a1 + 40) metadataThrottle];
    [v28 unthrottle];

    id v29 = [*(id *)(a1 + 40) metadataThrottle];
    [v29 incrementAttempts];

    goto LABEL_23;
  }
  v19 = [*(id *)(a1 + 40) metadataThrottle];
  char v20 = [v19 incrementAttempts];

  if (v20) {
    goto LABEL_23;
  }
  v21 = CarPlayUIGeneralLogging();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [(CPUINowPlayingSnapshot *)v4 bundleIdentifier];
    v23 = (void *)v22;
    uint64_t v24 = @"[all]";
    if (v22) {
      uint64_t v24 = (__CFString *)v22;
    }
    *(_DWORD *)buf = 138412546;
    v32 = v24;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl(&dword_227AC2000, v21, OS_LOG_TYPE_DEFAULT, "Throttling snapshot update for app %@ with content item identifier %@", buf, 0x16u);
  }
  v25 = [*(id *)(a1 + 40) stateObservers];
  uint64_t v26 = *(void *)(a1 + 40);
  v27 = [(CPUINowPlayingSnapshot *)v4 bundleIdentifier];
  [v25 nowPlayingManager:v26 didThrottleUpdateForBundleIdentifier:v27];

LABEL_25:
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return 1;
}

- (unint64_t)throttleBehavior
{
  return self->_throttleBehavior;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CPUINowPlayingSnapshot)snapshot
{
  return self->_snapshot;
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (void)setRequestController:(id)a3
{
}

- (CARObserverHashTable)stateObservers
{
  return self->_stateObservers;
}

- (void)setStateObservers:(id)a3
{
}

- (CPUIThrottle)metadataThrottle
{
  return self->_metadataThrottle;
}

- (void)setMetadataThrottle:(id)a3
{
}

- (NSString)lastContentItemIdentifier
{
  return self->_lastContentItemIdentifier;
}

- (void)setLastContentItemIdentifier:(id)a3
{
}

- (NSString)lastContentItemTitle
{
  return self->_lastContentItemTitle;
}

- (void)setLastContentItemTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastContentItemTitle, 0);
  objc_storeStrong((id *)&self->_lastContentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataThrottle, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end