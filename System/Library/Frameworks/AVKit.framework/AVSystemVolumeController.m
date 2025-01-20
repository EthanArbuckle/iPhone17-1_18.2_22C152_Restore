@interface AVSystemVolumeController
+ (NSMutableSet)windowSceneVolumeHUDAssertions;
+ (id)volumeController;
- (AVSystemController)sharedSystemController;
- (AVSystemVolumeController)init;
- (BOOL)currentRouteHasVolumeControl;
- (BOOL)isChangingVolume;
- (BOOL)isFullyInitialized;
- (BOOL)prefersSystemVolumeHUDHidden;
- (BOOL)volumeChangesThrottled;
- (NSNumber)maximumTargetVolumeSinceChangingVolumeBegan;
- (NSNumber)targetVolumeInternal;
- (NSString)uniqueIdentifier;
- (NSString)volumeCategory;
- (NSString)windowSceneSessionIdentifier;
- (float)volume;
- (id)_requestSharedSystemController;
- (void)_applyProposedVolumeIfNeeded;
- (void)_applyProposedVolumeImmediately;
- (void)_handleCurrentRouteHasVolumeControlDidChangeNotification:(id)a3;
- (void)_handleSystemControllerServerDiedNotification;
- (void)_handleSystemVolumeDidChangeNotification:(id)a3;
- (void)_observeSystemControllerIfNeeded;
- (void)_performOnMainThread:(id)a3;
- (void)_postNotificationForNameIfFullyInitialized:(id)a3 userInfo:(id)a4;
- (void)_removeVolumeHUDAssertionsForClientID:(id)a3;
- (void)_setupSystemController;
- (void)_unobserveSystemControllerIfNeeded;
- (void)beginChangingVolume;
- (void)dealloc;
- (void)endChangingVolume;
- (void)setChangingVolume:(BOOL)a3;
- (void)setClientWithIdentifier:(id)a3 forWindowSceneSessionWithIdentifier:(id)a4;
- (void)setCurrentRouteHasVolumeControl:(BOOL)a3;
- (void)setFullyInitialized:(BOOL)a3;
- (void)setMaximumTargetVolumeSinceChangingVolumeBegan:(id)a3;
- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3;
- (void)setSharedSystemController:(id)a3;
- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forSceneVolumeHudAssertion:(id)a4;
- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forWindowSceneSessionIdentifier:(id)a4;
- (void)setTargetVolume:(float)a3;
- (void)setTargetVolumeInternal:(id)a3;
- (void)setVolume:(float)a3;
- (void)setVolume:(float)a3 shouldShowHUD:(BOOL)a4;
- (void)setVolumeChangesThrottled:(BOOL)a3;
@end

@implementation AVSystemVolumeController

uint64_t __49__AVSystemVolumeController__performOnMainThread___block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_handleSystemVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F74AC0]];
  v7 = [(AVSystemVolumeController *)self volumeCategory];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = [v4 userInfo];
    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F74AF0]];
    [v10 floatValue];
    int v12 = v11;

    v13 = [v4 userInfo];
    v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F74AE0]];

    char v15 = [v14 isEqualToString:@"ExplicitVolumeChange"];
    char v16 = [v14 isEqualToString:@"RouteChange"];
    int v17 = [v14 isEqualToString:@"VolumeLimitChange"];
    if ((v15 & 1) != 0 || (v16 & 1) != 0 || v17)
    {
      v18 = [v4 userInfo];
      v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F74AD8]];
      char v20 = [v19 BOOLValue] ^ 1;

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __69__AVSystemVolumeController__handleSystemVolumeDidChangeNotification___block_invoke;
      v21[3] = &__block_descriptor_38_e34_v16__0__AVSystemVolumeController_8l;
      char v23 = v16;
      int v22 = v12;
      char v24 = v20;
      [(AVSystemVolumeController *)self _performOnMainThread:v21];
    }
  }
}

- (NSString)volumeCategory
{
  return self->_volumeCategory;
}

- (void)_performOnMainThread:(id)a3
{
  id v4 = (void (**)(id, AVSystemVolumeController *))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v4[2](v4, self);
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__AVSystemVolumeController__performOnMainThread___block_invoke;
    block[3] = &unk_1E5FC4138;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __69__AVSystemVolumeController__handleSystemVolumeDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!*(unsigned char *)(a1 + 36))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 32);
LABEL_7:
    [v8 setVolume:*(unsigned __int8 *)(a1 + 37) shouldShowHUD:v4];
    v5 = v8;
    goto LABEL_8;
  }
  [v3 volume];
  v5 = v8;
  float v6 = *(float *)&v4;
  LODWORD(v4) = *(_DWORD *)(a1 + 32);
  float v7 = v6 - *(float *)&v4;
  if (v7 < 0.0) {
    float v7 = -v7;
  }
  if (v7 > 0.001) {
    goto LABEL_7;
  }
LABEL_8:
}

- (float)volume
{
  return self->_volume;
}

void __50__AVSystemVolumeController__setupSystemController__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = [WeakRetained _requestSharedSystemController];
    int v5 = [v4 currentRouteHasVolumeControl];
    char v6 = v5;
    int v14 = 0;
    if (v5) {
      [v4 getVolume:&v14 forCategory:@"Audio/Video"];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AVSystemVolumeController__setupSystemController__block_invoke_2;
    block[3] = &unk_1E5FC3BE8;
    objc_copyWeak(&v11, v1);
    id v9 = v4;
    v10 = @"Audio/Video";
    char v13 = v6;
    int v12 = v14;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v11);
  }
}

- (id)_requestSharedSystemController
{
  return (id)[MEMORY[0x1E4F74F68] sharedAVSystemController];
}

- (BOOL)currentRouteHasVolumeControl
{
  return self->_currentRouteHasVolumeControl;
}

- (void)setVolume:(float)a3 shouldShowHUD:(BOOL)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0 || a3 == 1.0) {
    goto LABEL_8;
  }
  float v6 = self->_volume - a3;
  if (v6 < 0.0) {
    float v6 = -v6;
  }
  if (v6 > 0.001)
  {
LABEL_8:
    self->_volume = a3;
    id v9 = @"AVVolumeControllerVolumeDidChangeNotificationShowHUDKey";
    id v7 = [NSNumber numberWithBool:a4];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [(AVSystemVolumeController *)self _postNotificationForNameIfFullyInitialized:@"AVVolumeControllerVolumeChangedNotification" userInfo:v8];
  }
}

void __50__AVSystemVolumeController__setupSystemController__block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _observeSystemControllerIfNeeded];
    [v3 setSharedSystemController:*(void *)(a1 + 32)];
    objc_storeStrong(v3 + 7, *(id *)(a1 + 40));
    [v3 setCurrentRouteHasVolumeControl:*(unsigned __int8 *)(a1 + 60)];
    LODWORD(v4) = *(_DWORD *)(a1 + 56);
    [v3 setVolume:1 shouldShowHUD:v4];
    [v3 setFullyInitialized:1];
    float v6 = @"AVVolumeControllerVolumeDidChangeNotificationIsInitialValueKey";
    v7[0] = MEMORY[0x1E4F1CC38];
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v3 _postNotificationForNameIfFullyInitialized:@"AVVolumeControllerVolumeChangedNotification" userInfo:v5];

    [v3 _postNotificationForNameIfFullyInitialized:@"AVVolumeControllerCurrentRouteHasVolumeControlChangedNotification" userInfo:0];
  }
}

- (void)_postNotificationForNameIfFullyInitialized:(id)a3 userInfo:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(AVSystemVolumeController *)self isFullyInitialized])
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:v8 object:self userInfo:v6];
  }
}

- (BOOL)isFullyInitialized
{
  return self->_fullyInitialized;
}

- (void)setSharedSystemController:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  int v5 = (AVSystemController *)a3;
  sharedSystemController = self->_sharedSystemController;
  p_sharedSystemController = &self->_sharedSystemController;
  if (sharedSystemController != v5)
  {
    objc_storeStrong((id *)p_sharedSystemController, a3);
    if (*p_sharedSystemController)
    {
      uint64_t v8 = *MEMORY[0x1E4F74B68];
      v10[0] = *MEMORY[0x1E4F74E30];
      v10[1] = v8;
      void v10[2] = *MEMORY[0x1E4F74ED8];
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
      [(AVSystemController *)*p_sharedSystemController setAttribute:v9 forKey:*MEMORY[0x1E4F74EA8] error:0];
    }
  }
}

- (void)setFullyInitialized:(BOOL)a3
{
  self->_fullyInitialized = a3;
}

- (void)setCurrentRouteHasVolumeControl:(BOOL)a3
{
  self->_currentRouteHasVolumeControl = a3;
}

- (void)_observeSystemControllerIfNeeded
{
  if (!self->_observingSystemController)
  {
    self->_observingSystemController = 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__handleSystemControllerServerDiedNotification name:*MEMORY[0x1E4F74E30] object:0];

    double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__handleCurrentRouteHasVolumeControlDidChangeNotification_ name:*MEMORY[0x1E4F74B68] object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handleSystemVolumeDidChangeNotification_ name:*MEMORY[0x1E4F74ED8] object:0];
  }
}

uint64_t __44__AVSystemVolumeController_volumeController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = volumeController_volumeController;
  volumeController_volumeController = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (AVSystemVolumeController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVSystemVolumeController;
  uint64_t v2 = [(AVSystemVolumeController *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AVKit.AVSystemVolumeControllerQueue", v3);
    systemControllerQueue = v2->_systemControllerQueue;
    v2->_systemControllerQueue = (OS_dispatch_queue *)v4;

    [(AVSystemVolumeController *)v2 _setupSystemController];
  }
  return v2;
}

- (void)_setupSystemController
{
  objc_initWeak(&location, self);
  systemControllerQueue = self->_systemControllerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AVSystemVolumeController__setupSystemController__block_invoke;
  v4[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(systemControllerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setClientWithIdentifier:(id)a3 forWindowSceneSessionWithIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
  objc_storeStrong((id *)&self->_windowSceneSessionIdentifier, a4);
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__AVSystemVolumeController_setClientWithIdentifier_forWindowSceneSessionWithIdentifier___block_invoke;
    block[3] = &unk_1E5FC3B98;
    void block[4] = self;
    id v10 = v7;
    id v11 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  self->_prefersSystemVolumeHUDHidden = a3;
  if (!self->_uniqueIdentifier || !self->_windowSceneSessionIdentifier)
  {
    dispatch_queue_t v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[AVSystemVolumeController setPrefersSystemVolumeHUDHidden:]";
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s Attempted to set SystemVolumeHUD visibility before setting Client Identifier or Scene Identifier.", buf, 0xCu);
    }
  }
  id v5 = [(id)objc_opt_class() windowSceneVolumeHUDAssertions];
  id v6 = (void *)[v5 copy];

  if (self->_prefersSystemVolumeHUDHidden)
  {
    if (self->_windowSceneSessionIdentifier)
    {
      id v7 = [[AVVolumeHUDAssertion alloc] initWithSceneIdentifier:self->_windowSceneSessionIdentifier clientIdentifier:self->_uniqueIdentifier];
      [(AVVolumeHUDAssertion *)v7 setDelegate:self];
      [(AVVolumeHUDAssertion *)v7 setPrefersSystemVolumeHUDHidden:1];
      id v8 = [(id)objc_opt_class() windowSceneVolumeHUDAssertions];
      [v8 addObject:v7];
    }
  }
  else
  {
    [(AVSystemVolumeController *)self _removeVolumeHUDAssertionsForClientID:self->_uniqueIdentifier];
  }
  id v9 = [(id)objc_opt_class() windowSceneVolumeHUDAssertions];
  id v10 = (void *)[v9 mutableCopy];
  [v10 minusSet:v6];
  id v11 = (void *)[v6 mutableCopy];
  [v11 minusSet:v9];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AVSystemVolumeController *)self setSystemVolumeHUDEnabled:0 forSceneVolumeHudAssertion:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v11;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[AVSystemVolumeController setSystemVolumeHUDEnabled:forSceneVolumeHudAssertion:](self, "setSystemVolumeHUDEnabled:forSceneVolumeHudAssertion:", 1, *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void)_removeVolumeHUDAssertionsForClientID:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = [(id)objc_opt_class() windowSceneVolumeHUDAssertions];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__AVSystemVolumeController__removeVolumeHUDAssertionsForClientID___block_invoke;
  v8[3] = &unk_1E5FC3BC0;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 objectsPassingTest:v8];

  id v7 = [(id)objc_opt_class() windowSceneVolumeHUDAssertions];
  [v7 minusSet:v6];
}

+ (NSMutableSet)windowSceneVolumeHUDAssertions
{
  if (windowSceneVolumeHUDAssertions_onceToken != -1) {
    dispatch_once(&windowSceneVolumeHUDAssertions_onceToken, &__block_literal_global_18812);
  }
  uint64_t v2 = (void *)windowSceneVolumeHUDAssertions_windowSceneVolumeHUDAssertions;

  return (NSMutableSet *)v2;
}

+ (id)volumeController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVSystemVolumeController_volumeController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (volumeController_onceToken != -1) {
    dispatch_once(&volumeController_onceToken, block);
  }
  uint64_t v2 = (void *)volumeController_volumeController;

  return v2;
}

uint64_t __58__AVSystemVolumeController_windowSceneVolumeHUDAssertions__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v1 = windowSceneVolumeHUDAssertions_windowSceneVolumeHUDAssertions;
  windowSceneVolumeHUDAssertions_windowSceneVolumeHUDAssertions = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_volumeCategory, 0);
  objc_storeStrong((id *)&self->_maximumTargetVolumeSinceChangingVolumeBegan, 0);
  objc_storeStrong((id *)&self->_targetVolumeInternal, 0);
  objc_storeStrong((id *)&self->_sharedSystemController, 0);

  objc_storeStrong((id *)&self->_systemControllerQueue, 0);
}

- (NSString)windowSceneSessionIdentifier
{
  return self->_windowSceneSessionIdentifier;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setMaximumTargetVolumeSinceChangingVolumeBegan:(id)a3
{
}

- (NSNumber)maximumTargetVolumeSinceChangingVolumeBegan
{
  return self->_maximumTargetVolumeSinceChangingVolumeBegan;
}

- (void)setTargetVolumeInternal:(id)a3
{
}

- (NSNumber)targetVolumeInternal
{
  return self->_targetVolumeInternal;
}

- (void)setVolumeChangesThrottled:(BOOL)a3
{
  self->_volumeChangesThrottled = a3;
}

- (BOOL)volumeChangesThrottled
{
  return self->_volumeChangesThrottled;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (void)setChangingVolume:(BOOL)a3
{
  self->_changingVolume = a3;
}

- (BOOL)isChangingVolume
{
  return self->_changingVolume;
}

- (AVSystemController)sharedSystemController
{
  return self->_sharedSystemController;
}

- (BOOL)prefersSystemVolumeHUDHidden
{
  return self->_prefersSystemVolumeHUDHidden;
}

- (void)_applyProposedVolumeImmediately
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v4 = [(AVSystemVolumeController *)self targetVolumeInternal];
    [v4 floatValue];
    double v6 = v5;
    id v7 = [(AVSystemVolumeController *)self volumeCategory];
    int v14 = 136315650;
    uint64_t v15 = "-[AVSystemVolumeController _applyProposedVolumeImmediately]";
    __int16 v16 = 2048;
    double v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting volume on AVSystemController to: %.2f for category: %@", (uint8_t *)&v14, 0x20u);
  }
  id v8 = [(AVSystemVolumeController *)self sharedSystemController];
  id v9 = [(AVSystemVolumeController *)self targetVolumeInternal];
  [v9 floatValue];
  int v11 = v10;
  id v12 = [(AVSystemVolumeController *)self volumeCategory];
  LODWORD(v13) = v11;
  [v8 setVolumeTo:v12 forCategory:v13];
}

- (void)_applyProposedVolumeIfNeeded
{
  uint64_t v3 = [(AVSystemVolumeController *)self targetVolumeInternal];
  if (!v3) {
    return;
  }
  id v20 = (id)v3;
  dispatch_queue_t v4 = [(AVSystemVolumeController *)self targetVolumeInternal];
  [v4 floatValue];
  float v6 = v5;
  [(AVSystemVolumeController *)self volume];
  if (v6 == v7)
  {
  }
  else
  {
    id v8 = [(AVSystemVolumeController *)self targetVolumeInternal];
    [v8 floatValue];
    if (v9 == 0.0)
    {

LABEL_11:
      if ([(AVSystemVolumeController *)self volumeChangesThrottled]
        || ![(AVSystemVolumeController *)self isChangingVolume])
      {
        if (![(AVSystemVolumeController *)self isChangingVolume])
        {
          [(AVSystemVolumeController *)self _applyProposedVolumeImmediately];
        }
      }
      else
      {
        [(AVSystemVolumeController *)self setVolumeChangesThrottled:1];
        [(AVSystemVolumeController *)self _applyProposedVolumeImmediately];
        objc_initWeak(&location, self);
        double v17 = (void *)MEMORY[0x1E4F1CB00];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __56__AVSystemVolumeController__applyProposedVolumeIfNeeded__block_invoke;
        v21[3] = &unk_1E5FC4480;
        objc_copyWeak(&v22, &location);
        __int16 v18 = [v17 timerWithTimeInterval:0 repeats:v21 block:0.1];
        [v18 setTolerance:0.025];
        uint64_t v19 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        [v19 addTimer:v18 forMode:*MEMORY[0x1E4F1C4B0]];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      return;
    }
    [(AVSystemVolumeController *)self volume];
    float v11 = v10;
    id v12 = [(AVSystemVolumeController *)self targetVolumeInternal];
    [v12 floatValue];
    float v14 = v11 - v13;

    float v15 = -v14;
    if (v14 >= 0.0) {
      float v15 = v14;
    }
    double v16 = v15;

    if (v16 > 0.01) {
      goto LABEL_11;
    }
  }
}

void __56__AVSystemVolumeController__applyProposedVolumeIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setVolumeChangesThrottled:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _applyProposedVolumeIfNeeded];
}

- (void)_handleCurrentRouteHasVolumeControlDidChangeNotification:(id)a3
{
  dispatch_queue_t v4 = [a3 userInfo];
  float v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74B70]];
  char v6 = [v5 BOOLValue];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __85__AVSystemVolumeController__handleCurrentRouteHasVolumeControlDidChangeNotification___block_invoke;
  v7[3] = &__block_descriptor_33_e34_v16__0__AVSystemVolumeController_8l;
  char v8 = v6;
  [(AVSystemVolumeController *)self _performOnMainThread:v7];
}

void __85__AVSystemVolumeController__handleCurrentRouteHasVolumeControlDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 32);
  id v3 = a2;
  [v3 setCurrentRouteHasVolumeControl:v2];
  [v3 _postNotificationForNameIfFullyInitialized:@"AVVolumeControllerCurrentRouteHasVolumeControlChangedNotification" userInfo:0];
}

- (void)_handleSystemControllerServerDiedNotification
{
  [(AVSystemVolumeController *)self setSharedSystemController:0];
  [(AVSystemVolumeController *)self setFullyInitialized:0];

  [(AVSystemVolumeController *)self _setupSystemController];
}

- (void)_unobserveSystemControllerIfNeeded
{
  if (self->_observingSystemController)
  {
    self->_observingSystemController = 0;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F74E30] object:0];

    dispatch_queue_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F74B68] object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x1E4F74ED8] object:0];
  }
}

- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forWindowSceneSessionIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)a4;
  char v6 = (id *)MEMORY[0x1E4FB2608];
  float v7 = objc_msgSend((id)*MEMORY[0x1E4FB2608], "avkit_windowSceneWithSessionIdentifier:", v5);
  char v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    float v9 = @"Disabling";
    *(_DWORD *)buf = 136315906;
    long long v25 = "-[AVSystemVolumeController setSystemVolumeHUDEnabled:forWindowSceneSessionIdentifier:]";
    if (v4) {
      float v9 = @"Enabling";
    }
    __int16 v26 = 2112;
    long long v27 = v9;
    __int16 v28 = 2112;
    long long v29 = v7;
    __int16 v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ volume HUD for windowScene: %@ with ID: %@", buf, 0x2Au);
  }

  if (!v7)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    float v11 = objc_msgSend(*v6, "openSessions", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = [*(id *)(*((void *)&v19 + 1) + 8 * v15) persistentIdentifier];
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    double v17 = _AVLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v10 componentsJoinedByString:@","];
      *(_DWORD *)buf = 136315650;
      long long v25 = "-[AVSystemVolumeController setSystemVolumeHUDEnabled:forWindowSceneSessionIdentifier:]";
      __int16 v26 = 2112;
      long long v27 = v5;
      __int16 v28 = 2112;
      long long v29 = v18;
      _os_log_impl(&dword_1B05B7000, v17, OS_LOG_TYPE_DEFAULT, "%s WindowScene with ID: %@ is nonexist. Existing session identifiers are %@", buf, 0x20u);
    }
  }
  [v7 _setSystemVolumeHUDEnabled:v4];
}

- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forSceneVolumeHudAssertion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  float v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      char v8 = @"Enabling";
    }
    else {
      char v8 = @"Disabling";
    }
    float v9 = [v6 sceneIdentifier];
    id v10 = [v6 clientIdentifier];
    int v13 = 136315906;
    uint64_t v14 = "-[AVSystemVolumeController setSystemVolumeHUDEnabled:forSceneVolumeHudAssertion:]";
    __int16 v15 = 2112;
    double v16 = v8;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    long long v20 = v10;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ volume HUD for windowScene with scene ID: %@, unique ID: %@", (uint8_t *)&v13, 0x2Au);
  }
  if ([(id)*MEMORY[0x1E4FB2608] _appAdoptsUISceneLifecycle])
  {
    float v11 = [getMPVolumeHUDControllerClass() sharedInstance];
    [v11 addVolumeDisplay:v6];

    [v6 setPrefersSystemVolumeHUDHidden:v4 ^ 1];
    uint64_t v12 = [getMPVolumeHUDControllerClass() sharedInstance];
    [v12 setNeedsUpdate];
  }
  else
  {
    uint64_t v12 = [v6 sceneIdentifier];
    [(AVSystemVolumeController *)self setSystemVolumeHUDEnabled:v4 forWindowSceneSessionIdentifier:v12];
  }
}

BOOL __66__AVSystemVolumeController__removeVolumeHUDAssertionsForClientID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 clientIdentifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    BOOL v5 = 1;
  }
  else if (*(void *)(a1 + 32))
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v3 clientIdentifier];
    BOOL v5 = v6 == 0;
  }
  return v5;
}

uint64_t __88__AVSystemVolumeController_setClientWithIdentifier_forWindowSceneSessionWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClientWithIdentifier:*(void *)(a1 + 40) forWindowSceneSessionWithIdentifier:*(void *)(a1 + 48)];
}

- (void)endChangingVolume
{
  [(AVSystemVolumeController *)self setChangingVolume:0];
  [(AVSystemVolumeController *)self setVolumeChangesThrottled:0];
  [(AVSystemVolumeController *)self _applyProposedVolumeIfNeeded];
  [(AVSystemVolumeController *)self setTargetVolumeInternal:0];

  [(AVSystemVolumeController *)self setMaximumTargetVolumeSinceChangingVolumeBegan:0];
}

- (void)beginChangingVolume
{
  if (![(AVSystemVolumeController *)self isChangingVolume])
  {
    [(AVSystemVolumeController *)self setChangingVolume:1];
    id v3 = NSNumber;
    [(AVSystemVolumeController *)self volume];
    BOOL v4 = objc_msgSend(v3, "numberWithFloat:");
    [(AVSystemVolumeController *)self setTargetVolumeInternal:v4];

    [(AVSystemVolumeController *)self setMaximumTargetVolumeSinceChangingVolumeBegan:0];
    BOOL prefersSystemVolumeHUDHidden = self->_prefersSystemVolumeHUDHidden;
    [(AVSystemVolumeController *)self setPrefersSystemVolumeHUDHidden:prefersSystemVolumeHUDHidden];
  }
}

- (void)setTargetVolume:(float)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(AVSystemVolumeController *)self isChangingVolume])
  {
    BOOL v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v16 = _AVMethodProem(self);
      int v17 = 138412290;
      __int16 v18 = v16;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "%@: It is an error to set the target volume without calling -[AVVolumeController begin/endChangingVolume].", (uint8_t *)&v17, 0xCu);
    }
  }
  id v6 = [(AVSystemVolumeController *)self maximumTargetVolumeSinceChangingVolumeBegan];
  char v8 = v6;
  if (v6)
  {
    id v9 = v6;
  }
  else
  {
    *(float *)&double v7 = a3;
    id v9 = [NSNumber numberWithFloat:v7];
  }
  id v10 = v9;

  *(float *)&double v11 = a3;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  [(AVSystemVolumeController *)self setTargetVolumeInternal:v12];

  int v13 = NSNumber;
  [v10 floatValue];
  if (*(float *)&v14 <= a3) {
    *(float *)&double v14 = a3;
  }
  __int16 v15 = [v13 numberWithFloat:v14];
  [(AVSystemVolumeController *)self setMaximumTargetVolumeSinceChangingVolumeBegan:v15];

  [(AVSystemVolumeController *)self _postNotificationForNameIfFullyInitialized:@"AVVolumeControllerVolumeChangedNotification" userInfo:0];
  [(AVSystemVolumeController *)self _applyProposedVolumeIfNeeded];
}

- (void)dealloc
{
  [(AVSystemVolumeController *)self _unobserveSystemControllerIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)AVSystemVolumeController;
  [(AVSystemVolumeController *)&v3 dealloc];
}

@end