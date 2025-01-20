@interface BLSHBacklightFBSceneHostEnvironment
+ (id)amendSceneSettingsDelegate;
+ (void)setAmendSceneSettingsDelegate:(id)a3;
- (BLSBacklightSceneVisualState)visualState;
- (BLSHBacklightFBSceneHostEnvironment)initWithFBScene:(id)a3;
- (BOOL)cacheFlipbookOnDisplayWake;
- (BOOL)clientHasDelegate;
- (BOOL)clientSupportsAlwaysOn;
- (BOOL)hasUnrestrictedFramerateUpdates;
- (BOOL)is1HzFlipbook;
- (BOOL)isAlwaysOnEnabledForEnvironment;
- (BOOL)isAtLeastOneMinuteOld;
- (BOOL)isClientActive;
- (BOOL)isDisplayBlanked;
- (BOOL)isLiveUpdating;
- (BOOL)isLocal;
- (BOOL)readAndClearShouldInvalidateWhenActivated;
- (BOOL)wantsStateUpdateToActiveAfterRemovalFromPresentation;
- (NSDate)presentationDate;
- (NSString)description;
- (NSString)identifier;
- (RBSProcessIdentity)budgetProcessIdentity;
- (os_unfair_lock_s)clientSettingsDiffInspector;
- (uint64_t)incrementRequestDateSpecifierFailureCount;
- (uint64_t)sceneWantsProcessAssertion:(void *)a3 withSceneSettings:;
- (void)addObserver:(id)a3;
- (void)amendSceneSettings:(id)a3;
- (void)clearPresentationDate;
- (void)deactivateClient;
- (void)dealloc;
- (void)invalidateContentForReason:(id)a3;
- (void)notifyObserversWithBlock:(uint64_t)a1;
- (void)removeObserver:(id)a3;
- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6;
- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3;
- (void)resetRequestDateSpecifierFailureCount;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)set1HzFlipbook:(BOOL)a3;
- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3;
- (void)setCacheFlipbookOnDisplayWake:(BOOL)a3;
- (void)setDisplayBlanked:(BOOL)a3;
- (void)setLiveUpdating:(BOOL)a3;
- (void)setShouldInvalidateWhenActivated;
- (void)setUnrestrictedFramerateUpdates:(BOOL)a3;
- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4;
- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4;
- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10;
- (void)wantsStateUpdateToActiveAfterRemovalFromPresentation;
- (void)willBeginRenderSession:(id)a3;
- (void)willEndRenderSession:(id)a3;
@end

@implementation BLSHBacklightFBSceneHostEnvironment

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v7 = a4;
  v8 = -[BLSHBacklightFBSceneHostEnvironment clientSettingsDiffInspector]((os_unfair_lock_s *)self);
  char v9 = [v8 inspectDiff:v7];

  if (v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __113__BLSHBacklightFBSceneHostEnvironment_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    v11[3] = &unk_264533B50;
    v11[4] = self;
    -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v11);
  }
  if ((v9 & 2) != 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __113__BLSHBacklightFBSceneHostEnvironment_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2;
    v10[3] = &unk_264533B50;
    v10[4] = self;
    -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v10);
  }
}

- (os_unfair_lock_s)clientSettingsDiffInspector
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 16;
    os_unfair_lock_lock(a1 + 16);
    v3 = *(void **)&v1[4]._os_unfair_lock_opaque;
    if (!v3)
    {
      v4 = objc_alloc_init(BLSHBacklightSceneClientSettingsDiffInspector);
      v5 = *(void **)&v1[4]._os_unfair_lock_opaque;
      *(void *)&v1[4]._os_unfair_lock_opaque = v4;

      v3 = *(void **)&v1[4]._os_unfair_lock_opaque;
    }
    v1 = v3;
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (BLSHBacklightFBSceneHostEnvironment)initWithFBScene:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BLSHBacklightFBSceneHostEnvironment;
  v5 = [(BLSHBacklightFBSceneHostEnvironment *)&v23 init];
  if (v5)
  {
    v5->_creationMachTime = mach_continuous_time();
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:2];
    lock_observers = v5->_lock_observers;
    v5->_lock_observers = (NSHashTable *)v6;

    v5->_lock_renderSeed = 1;
    v5->_lock_requestDateSpecifierFailureCount = 0;
    if (initWithFBScene__onceToken != -1) {
      dispatch_once(&initWithFBScene__onceToken, &__block_literal_global_15);
    }
    if (__disableFrontBoardRBAssertions)
    {
      v8 = bls_scenes_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = v5;
        _os_log_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEFAULT, "%p: DisableFrontBoardRBAssertions=YES", buf, 0xCu);
      }
    }
    char v9 = bls_scenes_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightFBSceneHostEnvironment initWithFBScene:]((uint64_t)v5, v4);
    }

    objc_storeWeak((id *)&v5->_fbScene, v4);
    v10 = NSString;
    v11 = [v4 identifier];
    uint64_t v12 = [v10 stringWithFormat:@"<nil scene>:%@", v11];
    nilSceneIdentifier = v5->_nilSceneIdentifier;
    v5->_nilSceneIdentifier = (NSString *)v12;

    v14 = [v4 definition];
    v15 = [v14 clientIdentity];
    uint64_t v16 = [v15 processIdentity];
    budgetProcessIdentity = v5->_budgetProcessIdentity;
    v5->_budgetProcessIdentity = (RBSProcessIdentity *)v16;

    [v4 addObserver:v5];
    v18 = [v4 delegate];
    if (objc_opt_respondsToSelector())
    {
      v19 = objc_alloc_init(BLSHBacklightFBSceneEnvironmentActionHandler);
      [v18 addActionHandler:v19 forScene:v4];
    }
    else
    {
      bls_scenes_log();
      v19 = (BLSHBacklightFBSceneEnvironmentActionHandler *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v4 identifier];
        v21 = [v4 debugDescription];
        *(_DWORD *)buf = 134218754;
        v25 = v5;
        __int16 v26 = 2114;
        v27 = v20;
        __int16 v28 = 2114;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v21;
        _os_log_impl(&dword_21FCFC000, &v19->super, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ sceneDelegate:%{public}@ does not respond to @selector(addActionHandler:) - cannot invalidate from client, scene:%{public}@", buf, 0x2Au);
      }
    }
  }
  return v5;
}

void __55__BLSHBacklightFBSceneHostEnvironment_initWithFBScene___block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  v1 = [v0 objectForKey:@"DisableFrontBoardRBAssertions"];
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v6 = v4;

  v5 = v6;
  if (v6)
  {
    __disableFrontBoardRBAssertions = [v6 BOOLValue];
    v5 = v6;
  }
}

- (void)dealloc
{
  [(BLSHAggregatedProcessAssertion *)self->_lock_secondsFidelityAssertion invalidate];
  [(BLSHAggregatedProcessAssertion *)self->_lock_renderSessionAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightFBSceneHostEnvironment;
  [(BLSHBacklightFBSceneHostEnvironment *)&v3 dealloc];
}

- (NSString)identifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  nilSceneIdentifier = [WeakRetained identifier];
  v5 = nilSceneIdentifier;
  if (!nilSceneIdentifier) {
    nilSceneIdentifier = self->_nilSceneIdentifier;
  }
  id v6 = nilSceneIdentifier;

  return v6;
}

- (RBSProcessIdentity)budgetProcessIdentity
{
  return self->_budgetProcessIdentity;
}

- (BOOL)clientHasDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_super v3 = [WeakRetained clientSettings];
  char v4 = objc_msgSend(v3, "bls_hasDelegate");

  return v4;
}

- (BOOL)isClientActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_super v3 = [WeakRetained settings];
  char v4 = objc_msgSend(v3, "bls_isDelegateActive");

  return v4;
}

- (BLSBacklightSceneVisualState)visualState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_super v3 = [WeakRetained settings];
  char v4 = objc_msgSend(v3, "bls_visualState");

  return (BLSBacklightSceneVisualState *)v4;
}

- (NSDate)presentationDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_super v3 = [WeakRetained settings];
  char v4 = objc_msgSend(v3, "bls_presentationDate");

  return (NSDate *)v4;
}

- (BOOL)clientSupportsAlwaysOn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_super v3 = [WeakRetained clientSettings];
  char v4 = objc_msgSend(v3, "bls_supportsAlwaysOn");

  return v4;
}

- (BOOL)isLocal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_super v3 = [WeakRetained definition];
  char v4 = [v3 clientIdentity];
  char v5 = [v4 isLocal];

  return v5;
}

- (BOOL)isDisplayBlanked
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_super v3 = [WeakRetained settings];
  char v4 = objc_msgSend(v3, "bls_isBlanked");

  return v4;
}

- (BOOL)isAlwaysOnEnabledForEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_super v3 = [WeakRetained settings];
  char v4 = objc_msgSend(v3, "bls_isAlwaysOnEnabledForEnvironment");

  return v4;
}

- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3
{
  int v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained settings];
    int v8 = objc_msgSend(v7, "bls_isAlwaysOnEnabledForEnvironment");

    if (v8 != v3)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __72__BLSHBacklightFBSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke;
      v11[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
      char v12 = v3;
      [v6 updateSettingsWithBlock:v11];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __72__BLSHBacklightFBSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke_2;
      v9[3] = &unk_264532C98;
      v9[4] = self;
      char v10 = v3;
      -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v9);
    }
  }
}

uint64_t __72__BLSHBacklightFBSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setAlwaysOnEnabledForEnvironment:", *(unsigned __int8 *)(a1 + 32));
}

void __72__BLSHBacklightFBSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetAlwaysOnEnabledForEnvironment:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    char v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    char v5 = [*(id *)(a1 + 56) allObjects];
    os_unfair_lock_unlock(v4);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v3[2](v3, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)isLiveUpdating
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  id v3 = [WeakRetained settings];
  char v4 = objc_msgSend(v3, "bls_isLiveUpdating");

  return v4;
}

- (void)setLiveUpdating:(BOOL)a3
{
  int v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained settings];
    int v8 = objc_msgSend(v7, "bls_isLiveUpdating");

    if (v8 != v3)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __55__BLSHBacklightFBSceneHostEnvironment_setLiveUpdating___block_invoke;
      v11[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
      char v12 = v3;
      [v6 updateSettingsWithBlock:v11];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __55__BLSHBacklightFBSceneHostEnvironment_setLiveUpdating___block_invoke_2;
      v9[3] = &unk_264532C98;
      v9[4] = self;
      char v10 = v3;
      -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v9);
    }
  }
}

uint64_t __55__BLSHBacklightFBSceneHostEnvironment_setLiveUpdating___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setLiveUpdating:", *(unsigned __int8 *)(a1 + 32));
}

void __55__BLSHBacklightFBSceneHostEnvironment_setLiveUpdating___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetLiveUpdating:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  id v3 = [WeakRetained settings];
  char v4 = objc_msgSend(v3, "bls_hasUnrestrictedFramerateUpdates");

  return v4;
}

- (void)setUnrestrictedFramerateUpdates:(BOOL)a3
{
  int v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained settings];
    int v8 = objc_msgSend(v7, "bls_hasUnrestrictedFramerateUpdates");

    if (v8 != v3)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __71__BLSHBacklightFBSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke;
      v11[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
      char v12 = v3;
      [v6 updateSettingsWithBlock:v11];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __71__BLSHBacklightFBSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke_2;
      v9[3] = &unk_264532C98;
      v9[4] = self;
      char v10 = v3;
      -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v9);
    }
  }
}

uint64_t __71__BLSHBacklightFBSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setUnrestrictedFramerateUpdates:", *(unsigned __int8 *)(a1 + 32));
}

void __71__BLSHBacklightFBSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetUnrestrictedFramerateUpdates:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)is1HzFlipbook
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_1HzFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set1HzFlipbook:(BOOL)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_1HzFlipbook = self->_lock_1HzFlipbook;
  self->_int lock_1HzFlipbook = v3;
  os_unfair_lock_unlock(p_lock);
  uint64_t v7 = bls_scenes_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
    *(_DWORD *)buf = 134218754;
    char v12 = self;
    __int16 v13 = 2114;
    long long v14 = v8;
    __int16 v15 = 1024;
    int v16 = v3;
    __int16 v17 = 1024;
    BOOL v18 = lock_1HzFlipbook != v3;
    _os_log_debug_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_DEBUG, "%p:%{public}@ set1HzFlipbook:%{BOOL}u didChange:%{BOOL}u", buf, 0x22u);
  }
  if (lock_1HzFlipbook != v3)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__BLSHBacklightFBSceneHostEnvironment_set1HzFlipbook___block_invoke;
    v9[3] = &unk_264532C98;
    v9[4] = self;
    char v10 = v3;
    -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v9);
  }
}

void __54__BLSHBacklightFBSceneHostEnvironment_set1HzFlipbook___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSet1HzFlipbook:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)cacheFlipbookOnDisplayWake
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cacheFlipbookOnDisplayWake;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCacheFlipbookOnDisplayWake:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_cacheFlipbookOnDisplayWake = self->_lock_cacheFlipbookOnDisplayWake;
  self->_int lock_cacheFlipbookOnDisplayWake = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_cacheFlipbookOnDisplayWake != v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__BLSHBacklightFBSceneHostEnvironment_setCacheFlipbookOnDisplayWake___block_invoke;
    v7[3] = &unk_264532C98;
    v7[4] = self;
    char v8 = v3;
    -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v7);
  }
}

void __69__BLSHBacklightFBSceneHostEnvironment_setCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetCacheFlipbookOnDisplayWake:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)isAtLeastOneMinuteOld
{
  if (result)
  {
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    return v1 > 60.0;
  }
  return result;
}

- (void)amendSceneSettings:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_renderSeed = self->_lock_renderSeed;
  os_unfair_lock_unlock(&self->_lock);
  char v5 = +[BLSHBacklightFBSceneHostEnvironment amendSceneSettingsDelegate]();
  if ([v5 hostEnvironment:self didAmendSceneSettings:v6]) {
    objc_msgSend(v6, "bls_setRenderSeed:", lock_renderSeed);
  }
}

+ (id)amendSceneSettingsDelegate
{
  self;
  os_unfair_lock_lock(&_classLock_3);
  id v0 = (id)_amendSceneSettingsDelegate;
  os_unfair_lock_unlock(&_classLock_3);

  return v0;
}

- (void)setDisplayBlanked:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__BLSHBacklightFBSceneHostEnvironment_setDisplayBlanked___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  BOOL v6 = a3;
  [WeakRetained updateSettingsWithBlock:v5];
}

uint64_t __57__BLSHBacklightFBSceneHostEnvironment_setDisplayBlanked___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setBlanked:", *(unsigned __int8 *)(a1 + 32));
}

- (void)deactivateClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  [WeakRetained updateSettingsWithBlock:&__block_literal_global_30];
}

uint64_t __55__BLSHBacklightFBSceneHostEnvironment_deactivateClient__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setDelegateActive:", 0);
}

- (void)invalidateContentForReason:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  ++self->_lock_renderSeed;
  os_unfair_lock_unlock(&self->_lock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__BLSHBacklightFBSceneHostEnvironment_invalidateContentForReason___block_invoke;
  v6[3] = &unk_264532CC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v6);
}

void __66__BLSHBacklightFBSceneHostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) invalidateContentForReason:*(void *)(a1 + 40)];
  }
}

- (uint64_t)incrementRequestDateSpecifierFailureCount
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a1 + 16;
  os_unfair_lock_lock(a1 + 16);
  uint64_t v3 = a1[22]._os_unfair_lock_opaque + 1;
  a1[22]._os_unfair_lock_opaque = v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

- (void)resetRequestDateSpecifierFailureCount
{
  if (a1)
  {
    uint64_t v2 = a1 + 16;
    os_unfair_lock_lock(a1 + 16);
    a1[22]._os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
  [v3 appendString:v4 withName:@"identifier"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  id v6 = (id)[v3 appendPointer:WeakRetained withName:@"scene"];

  id v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment clientHasDelegate](self, "clientHasDelegate"), @"clientEnabled", 0);
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment isClientActive](self, "isClientActive"), @"clientActive", 0);
  uint64_t v9 = [(BLSHBacklightFBSceneHostEnvironment *)self visualState];
  id v10 = (id)[v3 appendObject:v9 withName:@"visualState"];

  long long v11 = [(BLSHBacklightFBSceneHostEnvironment *)self presentationDate];
  char v12 = objc_msgSend(v11, "bls_shortLoggingString");
  [v3 appendString:v12 withName:@"presentationDate"];

  id v13 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment isAlwaysOnEnabledForEnvironment](self, "isAlwaysOnEnabledForEnvironment"), @"alwaysOnEnabled", 0);
  id v14 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment isLiveUpdating](self, "isLiveUpdating"), @"liveUpdating", 1);
  id v15 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment hasUnrestrictedFramerateUpdates](self, "hasUnrestrictedFramerateUpdates"), @"hasUnrestrictedFramerateUpdates", 1);
  id v16 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment isDisplayBlanked](self, "isDisplayBlanked"), @"displayBlanked", 1);
  __int16 v17 = [v3 build];

  return (NSString *)v17;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)readAndClearShouldInvalidateWhenActivated
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  BOOL v3 = *(unsigned char *)(a1 + 92) != 0;
  *(unsigned char *)(a1 + 92) = 0;
  os_unfair_lock_unlock(v2);
  return v3;
}

- (void)setShouldInvalidateWhenActivated
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 92) = 1;
    os_unfair_lock_unlock(v2);
  }
}

- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  id v6 = WeakRetained;
  if (!WeakRetained)
  {
    id v7 = bls_scenes_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightFBSceneHostEnvironment requestedFidelityForInactiveContentWithCompletion:]();
    }

    goto LABEL_10;
  }
  if (([WeakRetained isActive] & 1) == 0)
  {
    id v8 = bls_scenes_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightFBSceneHostEnvironment requestedFidelityForInactiveContentWithCompletion:]();
    }

    -[BLSHBacklightFBSceneHostEnvironment setShouldInvalidateWhenActivated]((uint64_t)self);
LABEL_10:
    v4[2](v4, 1);
    goto LABEL_11;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke;
  v9[3] = &unk_264533998;
  v9[4] = self;
  long long v11 = v4;
  id v10 = v6;
  [v10 updateSettingsWithTransitionBlock:v9];

LABEL_11:
}

id __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F299D8]);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  __int16 v17 = __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_2;
  BOOL v18 = &unk_264533970;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v3 = (id *)(a1 + 32);
  uint64_t v19 = v4;
  id v20 = v3[2];
  id v5 = (void *)[v2 initWithCompletion:&v15];
  id v6 = objc_msgSend(v3[1], "definition", v15, v16, v17, v18, v19);
  id v7 = [v6 specification];
  id v8 = (objc_class *)[v7 transitionContextClass];

  id v9 = objc_alloc_init(v8);
  id v10 = (void *)MEMORY[0x263EFFA08];
  v21[0] = v5;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  char v12 = [v10 setWithArray:v11];
  [v9 setActions:v12];

  id v13 = bls_scenes_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_cold_1(v3);
  }

  return v9;
}

void __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 error];
  if (v4)
  {
    id v5 = bls_scenes_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [v8 identifier];
      int v10 = 134218754;
      long long v11 = v8;
      __int16 v12 = 2114;
      id v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v4;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_error_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_ERROR, "%p:%{public}@ client desired fidelity action failed error:%{public}@ response:%{public}@, requestedFidelityForInactiveContent:Minutes", (uint8_t *)&v10, 0x2Au);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [v3 desiredFidelity];
    id v7 = bls_scenes_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_2_cold_1(a1);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

- (uint64_t)sceneWantsProcessAssertion:(void *)a3 withSceneSettings:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (v5)
    {
      id v7 = [v5 clientSettings];
      int v8 = objc_msgSend(v7, "bls_optsOutOfProcessAssertions");

      int v9 = [v6 activityMode];
      int v10 = [v5 definition];
      long long v11 = [v10 clientIdentity];
      int v12 = [v11 isLocal];

      if (v9 == 7) {
        int v13 = 1;
      }
      else {
        int v13 = v8;
      }
      uint64_t v14 = (v13 | v12) ^ 1u;
      uint64_t v15 = bls_scenes_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        BOOL v16 = v9 == 7;
        id v17 = [a1 identifier];
        int v19 = 134219522;
        id v20 = a1;
        __int16 v21 = 2114;
        v22 = v17;
        __int16 v23 = 2048;
        id v24 = v5;
        __int16 v25 = 1024;
        int v26 = v14;
        __int16 v27 = 1024;
        int v28 = v8;
        __int16 v29 = 1024;
        BOOL v30 = v16;
        __int16 v31 = 1024;
        int v32 = v12;
        _os_log_debug_impl(&dword_21FCFC000, v15, OS_LOG_TYPE_DEBUG, "%p:%{public}@ scene:%p wantsProcessAssertions:%{BOOL}u optsOut:%{BOOL}u externalManaged:%{BOOL}u local:%{BOOL}u", (uint8_t *)&v19, 0x38u);
      }
    }
    else
    {
      uint64_t v15 = bls_scenes_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:]();
      }
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10
{
  BOOL v38 = a7;
  BOOL v12 = a5;
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v39 = a6;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  id v18 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v41 = [v18 date];

  if (v16 && !v12)
  {
    id v20 = bls_scenes_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightFBSceneHostEnvironment updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:]();
    }
  }
  __int16 v21 = v40;
  if ((((v17 == 0) ^ v12) & 1) == 0)
  {
    v22 = bls_scenes_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightFBSceneHostEnvironment updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:]();
    }
  }
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke;
  v54[3] = &unk_2645339C0;
  id v23 = v15;
  id v55 = v23;
  id v24 = v16;
  id v56 = v24;
  BOOL v58 = v12;
  id v25 = v17;
  id v57 = v25;
  int v26 = (void (**)(void))MEMORY[0x223C5E2B0](v54);
  if (WeakRetained)
  {
    os_unfair_lock_lock(&self->_lock);
    unint64_t lock_renderSeed = self->_lock_renderSeed;
    os_unfair_lock_unlock(&self->_lock);
    int v28 = bls_scenes_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v37 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
      v36 = objc_msgSend(v40, "bls_shortLoggingString");
      uint64_t v34 = objc_msgSend(v39, "bls_shortLoggingString");
      *(_DWORD *)buf = 138543874;
      v60 = v37;
      __int16 v61 = 2114;
      v62 = v36;
      __int16 v63 = 2114;
      uint64_t v64 = v34;
      v35 = (void *)v34;
      _os_log_debug_impl(&dword_21FCFC000, v28, OS_LOG_TYPE_DEBUG, "FBSceneHostEnv.updateToVisualState: sending update from host to scene:%{public}@ to state:%{public}@ for event:%{public}@", buf, 0x20u);

      __int16 v21 = v40;
    }

    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_69;
    v42[3] = &unk_264533A60;
    id v43 = v21;
    id v44 = v41;
    unint64_t v51 = lock_renderSeed;
    id v29 = WeakRetained;
    id v45 = v29;
    v46 = self;
    BOOL v30 = v39;
    id v47 = v39;
    BOOL v52 = v12;
    BOOL v53 = v38;
    id v48 = v23;
    id v49 = v24;
    id v50 = v25;
    [v29 updateSettingsWithTransitionBlock:v42];
    if (([v29 isActive] & 1) == 0) {
      v26[2](v26);
    }
  }
  else
  {
    __int16 v31 = bls_scenes_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      int v32 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
      uint64_t v33 = objc_msgSend(v41, "bls_shortLoggingString");
      *(_DWORD *)buf = 134219778;
      v60 = self;
      __int16 v61 = 2114;
      v62 = v32;
      __int16 v63 = 2114;
      uint64_t v64 = 0;
      __int16 v65 = 2114;
      id v66 = v40;
      __int16 v67 = 2114;
      v68 = v33;
      __int16 v69 = 1024;
      BOOL v70 = v12;
      __int16 v71 = 2114;
      id v72 = v39;
      __int16 v73 = 1024;
      BOOL v74 = v38;
      _os_log_impl(&dword_21FCFC000, v31, OS_LOG_TYPE_INFO, "%p:%{public}@ nil scene, will not update scene:%{public}@ to visualState:%{public}@ presentationDate:%{public}@ animated:%{BOOL}u event:%{public}@ touchTarget:%{BOOL}u", buf, 0x4Au);

      __int16 v21 = v40;
    }

    v26[2](v26);
    BOOL v30 = v39;
  }
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    v2.n128_u64[0] = 0.5;
    if (!*(unsigned char *)(a1 + 56)) {
      v2.n128_f64[0] = 0.0;
    }
    (*(void (**)(__n128))(v3 + 16))(v2);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      dispatch_time_t v5 = dispatch_time(0, 500000000);
      id v6 = *(void **)(a1 + 48);
      id v7 = MEMORY[0x263EF83A0];
      dispatch_after(v5, v7, v6);
    }
    else
    {
      int v8 = *(void (**)(void))(v4 + 16);
      v8();
    }
  }
}

id __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_msgSend(v3, "bls_setDelegateActive:", 1);
  objc_msgSend(v3, "bls_setVisualState:", *(void *)(a1 + 32));
  objc_msgSend(v3, "bls_setPresentationDate:", *(void *)(a1 + 40));
  objc_msgSend(v3, "bls_setRenderSeed:", *(void *)(a1 + 96));
  char v4 = [*(id *)(a1 + 48) isActive];
  dispatch_time_t v5 = *(void **)(a1 + 56);
  if (v4)
  {
    if (-[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](v5, *(void **)(a1 + 48), v3))
    {
      if ([*(id *)(a1 + 32) adjustedLuminance] == 1
        && [*(id *)(a1 + 32) updateFidelity] == 2)
      {
        int v6 = [*(id *)(a1 + 56) isLiveUpdating];
      }
      else
      {
        int v6 = 0;
      }
      int v10 = [*(id *)(a1 + 48) definition];
      long long v11 = [v10 clientIdentity];
      BOOL v12 = [v11 processIdentity];

      if (v12)
      {
        if (v6)
        {
          os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 56) + 64));
          uint64_t v13 = *(void *)(a1 + 56);
          if (!*(void *)(v13 + 32))
          {
            uint64_t v14 = bls_scenes_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = *(void **)(a1 + 56);
              id v16 = [v15 identifier];
              uint64_t v17 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 134218498;
              v96 = v15;
              __int16 v97 = 2114;
              v98 = v16;
              __int16 v99 = 2048;
              uint64_t v100 = v17;
              _os_log_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ taking CPU/GPU grant process assertion \"1FPSFlipbook\" for scene %p", buf, 0x20u);
            }
            id v18 = [BLSHAggregatedProcessAssertion alloc];
            int v19 = NSString;
            id v20 = [*(id *)(a1 + 56) identifier];
            __int16 v21 = [v19 stringWithFormat:@"1FPSFlipbook forScene:%@", v20];
            uint64_t v22 = [(BLSHAggregatedProcessAssertion *)v18 initWithExplanation:v21 processIdentity:v12 duration:1.79769313e308];
            uint64_t v23 = *(void *)(a1 + 56);
            id v24 = *(void **)(v23 + 32);
            *(void *)(v23 + 32) = v22;

            [*(id *)(*(void *)(a1 + 56) + 32) setShouldFaultOnFailureToAcquire:-[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld](*(void *)(a1 + 56))];
            [*(id *)(*(void *)(a1 + 56) + 32) acquireWithCompletion:0];
            uint64_t v13 = *(void *)(a1 + 56);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 64));

          int v9 = 0;
LABEL_29:
          id v40 = objc_alloc(MEMORY[0x263F299A0]);
          uint64_t v41 = *(void *)(a1 + 64);
          uint64_t v42 = *(unsigned __int8 *)(a1 + 104);
          uint64_t v43 = *(unsigned __int8 *)(a1 + 105);
          v86[0] = MEMORY[0x263EF8330];
          v86[1] = 3221225472;
          v86[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_78;
          v86[3] = &unk_2645339E8;
          char v93 = v42;
          id v7 = v9;
          v87 = v7;
          int8x16_t v70 = *(int8x16_t *)(a1 + 48);
          id v44 = (id)v70.i64[0];
          int8x16_t v88 = vextq_s8(v70, v70, 8uLL);
          id v89 = *(id *)(a1 + 32);
          id v90 = *(id *)(a1 + 40);
          char v94 = *(unsigned char *)(a1 + 105);
          id v91 = *(id *)(a1 + 64);
          id v92 = *(id *)(a1 + 72);
          id v45 = (void *)[v40 initWithBacklightChangeEvent:v41 animated:v42 touchTargetable:v43 isUpdateToDateSpecifier:0 completion:v86];
          v46 = [MEMORY[0x263EFF980] arrayWithObject:v45];
          if (*(void *)(a1 + 80))
          {
            id v47 = objc_alloc(MEMORY[0x263F299B0]);
            v80[0] = MEMORY[0x263EF8330];
            v80[1] = 3221225472;
            v80[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_82;
            v80[3] = &unk_264533A10;
            v80[4] = *(void *)(a1 + 56);
            id v81 = *(id *)(a1 + 32);
            id v82 = *(id *)(a1 + 40);
            char v85 = *(unsigned char *)(a1 + 104);
            id v83 = *(id *)(a1 + 64);
            id v84 = *(id *)(a1 + 80);
            id v48 = (void *)[v47 initWithCompletion:v80];
            [v46 addObject:v48];
          }
          if (*(void *)(a1 + 88))
          {
            id v49 = objc_alloc(MEMORY[0x263F299A8]);
            v72[0] = MEMORY[0x263EF8330];
            v72[1] = 3221225472;
            v72[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_86;
            v72[3] = &unk_264533A38;
            id v50 = v7;
            uint64_t v51 = *(void *)(a1 + 56);
            __int16 v73 = v50;
            uint64_t v74 = v51;
            id v75 = *(id *)(a1 + 32);
            id v76 = *(id *)(a1 + 40);
            char v79 = *(unsigned char *)(a1 + 104);
            id v77 = *(id *)(a1 + 64);
            id v78 = *(id *)(a1 + 88);
            BOOL v52 = (void *)[v49 initWithCompletion:v72];
            [v46 addObject:v52];
          }
          BOOL v53 = [*(id *)(a1 + 48) definition];
          v54 = [v53 specification];
          id v55 = (objc_class *)[v54 transitionContextClass];

          id v8 = objc_alloc_init(v55);
          id v56 = [MEMORY[0x263EFFA08] setWithArray:v46];
          [v8 setActions:v56];

          if (__disableFrontBoardRBAssertions) {
            [v8 setRunningBoardAssertionDisabled:1];
          }
          id v57 = bls_scenes_log();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            __int16 v65 = *(void **)(a1 + 56);
            id v66 = [v65 identifier];
            uint64_t v71 = *(void *)(a1 + 40);
            uint64_t v68 = *(void *)(a1 + 32);
            uint64_t v69 = *(void *)(a1 + 48);
            int v67 = [*(id *)(a1 + 56) clientHasDelegate];
            *(_DWORD *)buf = 134219522;
            v96 = v65;
            __int16 v97 = 2114;
            v98 = v66;
            __int16 v99 = 2114;
            uint64_t v100 = v68;
            __int16 v101 = 2048;
            uint64_t v102 = v69;
            __int16 v103 = 2114;
            uint64_t v104 = v71;
            __int16 v105 = 1024;
            int v106 = v67;
            __int16 v107 = 2114;
            v108 = v46;
            _os_log_debug_impl(&dword_21FCFC000, v57, OS_LOG_TYPE_DEBUG, "%p:%{public}@ updateToVisualState:%{public}@ scene:%p to presentationDate:%{public}@ clientHasDelegate:%{BOOL}u with:%{public}@", buf, 0x44u);
          }
          goto LABEL_38;
        }
        id v29 = NSString;
        uint64_t v30 = *(void *)(a1 + 32);
        __int16 v31 = [*(id *)(a1 + 56) identifier];
        int v32 = [v29 stringWithFormat:@"updateToSceneVisualState:%@ forScene:%@", v30, v31];

        int v9 = [[BLSHAggregatedProcessAssertion alloc] initWithExplanation:v32 processIdentity:v12 duration:2.75];
        -[BLSHAggregatedProcessAssertion setShouldFaultOnFailureToAcquire:](v9, "setShouldFaultOnFailureToAcquire:", -[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld](*(void *)(a1 + 56)));
        [(BLSHAggregatedProcessAssertion *)v9 acquireWithCompletion:0];
      }
      else
      {
        id v25 = bls_scenes_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = *(void **)(a1 + 56);
          __int16 v27 = [v26 identifier];
          uint64_t v28 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 134218498;
          v96 = v26;
          __int16 v97 = 2114;
          v98 = v27;
          __int16 v99 = 2048;
          uint64_t v100 = v28;
          _os_log_impl(&dword_21FCFC000, v25, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ couldn't get a client processIdentity for scene %p. cannot take CPU/GPU grant process assertion \"1FPSFlipbook\"", buf, 0x20u);
        }
        int v9 = 0;
        if (v6) {
          goto LABEL_29;
        }
      }
    }
    else
    {
      int v9 = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 56) + 64));
    if (*(void *)(*(void *)(a1 + 56) + 32))
    {
      uint64_t v33 = bls_scenes_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = *(void **)(a1 + 56);
        v35 = [v34 identifier];
        uint64_t v36 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134218498;
        v96 = v34;
        __int16 v97 = 2114;
        v98 = v35;
        __int16 v99 = 2048;
        uint64_t v100 = v36;
        _os_log_impl(&dword_21FCFC000, v33, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ dropping CPU/GPU grant process assertion \"1FPSFlipbook\" for scene %p", buf, 0x20u);
      }
      v37 = *(void **)(*(void *)(a1 + 56) + 32);
    }
    else
    {
      v37 = 0;
    }
    [v37 invalidate];
    uint64_t v38 = *(void *)(a1 + 56);
    id v39 = *(void **)(v38 + 32);
    *(void *)(v38 + 32) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 56) + 64));
    goto LABEL_29;
  }
  -[BLSHBacklightFBSceneHostEnvironment setShouldInvalidateWhenActivated]((uint64_t)v5);
  id v7 = bls_scenes_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v59 = *(void **)(a1 + 56);
    v60 = [v59 identifier];
    uint64_t v61 = *(void *)(a1 + 32);
    uint64_t v62 = *(void *)(a1 + 40);
    uint64_t v63 = *(void *)(a1 + 48);
    int v64 = [*(id *)(a1 + 56) clientHasDelegate];
    *(_DWORD *)buf = 134219266;
    v96 = v59;
    __int16 v97 = 2114;
    v98 = v60;
    __int16 v99 = 2114;
    uint64_t v100 = v61;
    __int16 v101 = 2048;
    uint64_t v102 = v63;
    __int16 v103 = 2114;
    uint64_t v104 = v62;
    __int16 v105 = 1024;
    int v106 = v64;
    _os_log_debug_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_DEBUG, "%p:%{public}@ updateToVisualState:%{public}@ inactive scene:%p to presentationDate:%{public}@ clientHasDelegate:%{BOOL}u", buf, 0x3Au);
  }
  id v8 = 0;
LABEL_38:

  return v8;
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 88)) {
    [*(id *)(a1 + 32) invalidate];
  }
  char v4 = [v3 error];
  dispatch_time_t v5 = bls_scenes_log();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = [v7 identifier];
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      long long v11 = objc_msgSend(*(id *)(a1 + 64), "bls_shortLoggingString");
      int v12 = *(unsigned __int8 *)(a1 + 88);
      int v13 = *(unsigned __int8 *)(a1 + 89);
      uint64_t v14 = *(void *)(a1 + 72);
      int v15 = 134220290;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v4;
      __int16 v21 = 2114;
      id v22 = v3;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      uint64_t v28 = v11;
      __int16 v29 = 1024;
      int v30 = v12;
      __int16 v31 = 1024;
      int v32 = v13;
      __int16 v33 = 2114;
      uint64_t v34 = v14;
      _os_log_error_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_ERROR, "%p:%{public}@ client update action failed error:%{public}@ response:%{public}@, will not update scene:%{public}@ to visualState:%{public}@ presentationDate:%{public}@, animated:%{BOOL}u touchTarget:%{BOOL}u event:%{public}@", (uint8_t *)&v15, 0x5Eu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_78_cold_1(a1, (unsigned __int8 *)(a1 + 88), v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = bls_scenes_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = *(void **)(a1 + 32);
    int v6 = [v5 identifier];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v8 = *(void *)(a1 + 40);
    int v20 = 134219010;
    __int16 v21 = v5;
    __int16 v22 = 2114;
    __int16 v23 = v6;
    __int16 v24 = 2114;
    id v25 = v3;
    __int16 v26 = 1024;
    *(_DWORD *)__int16 v27 = isKindOfClass & 1;
    *(_WORD *)&v27[4] = 2114;
    *(void *)&v27[6] = v8;
    _os_log_impl(&dword_21FCFC000, v4, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ client ramp action response:%{public}@ isKindBLSBacklightSceneUpdateBacklightRampResponse:%{BOOL}u for update to visualState:%{public}@", (uint8_t *)&v20, 0x30u);
  }
  uint64_t v9 = [v3 error];
  if (v9)
  {
    uint64_t v10 = bls_scenes_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void **)(a1 + 32);
      int v15 = [v14 identifier];
      uint64_t v16 = *(void *)(a1 + 40);
      __int16 v17 = objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
      int v18 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v19 = *(void *)(a1 + 56);
      int v20 = 134219778;
      __int16 v21 = v14;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      __int16 v24 = 2114;
      id v25 = v9;
      __int16 v26 = 2114;
      *(void *)__int16 v27 = v3;
      *(_WORD *)&v27[8] = 2114;
      *(void *)&v27[10] = v16;
      __int16 v28 = 2114;
      __int16 v29 = v17;
      __int16 v30 = 1024;
      int v31 = v18;
      __int16 v32 = 2114;
      uint64_t v33 = v19;
      _os_log_error_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_ERROR, "%p:%{public}@ client ramp action failed error:%{public}@ response:%{public}@, for update to visualState:%{public}@ presentationDate:%{public}@, animated:%{BOOL}u event:%{public}@", (uint8_t *)&v20, 0x4Eu);
    }
    if (*(unsigned char *)(a1 + 72)) {
      double v11 = 0.5;
    }
    else {
      double v11 = 0.0;
    }
  }
  else
  {
    [v3 rampDuration];
    double v11 = v12;
    int v13 = bls_scenes_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_82_cold_1(a1);
    }
  }
  (*(void (**)(double))(*(void *)(a1 + 64) + 16))(v11);
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  char v4 = [v3 error];
  dispatch_time_t v5 = bls_scenes_log();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = [v7 identifier];
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = objc_msgSend(*(id *)(a1 + 56), "bls_shortLoggingString");
      int v11 = *(unsigned __int8 *)(a1 + 80);
      uint64_t v12 = *(void *)(a1 + 64);
      int v13 = 134219778;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      int v18 = v4;
      __int16 v19 = 2114;
      id v20 = v3;
      __int16 v21 = 2114;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      __int16 v24 = v10;
      __int16 v25 = 1024;
      int v26 = v11;
      __int16 v27 = 2114;
      uint64_t v28 = v12;
      _os_log_error_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_ERROR, "%p:%{public}@ client animation action failed error:%{public}@ response:%{public}@, for update to visualState:%{public}@ presentationDate:%{public}@, animated:%{BOOL}u event:%{public}@", (uint8_t *)&v13, 0x4Eu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_86_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, id, void *))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  uint64_t v14 = WeakRetained;
  if (!WeakRetained)
  {
    __int16 v15 = bls_scenes_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
      __int16 v17 = objc_msgSend(v10, "bls_shortLoggingString");
      int v18 = objc_msgSend(v11, "bls_shortLoggingString");
      *(_DWORD *)buf = 134219010;
      id v39 = self;
      __int16 v40 = 2114;
      uint64_t v41 = v16;
      __int16 v42 = 2114;
      uint64_t v43 = v17;
      __int16 v44 = 2114;
      id v45 = v18;
      __int16 v46 = 1024;
      BOOL v47 = v7;
      _os_log_impl(&dword_21FCFC000, v15, OS_LOG_TYPE_INFO, "%p:%{public}@ nil scene, will return only now date for interval:%{public}@ previous:%{public}@ reset:%{BOOL}u", buf, 0x30u);
    }
    id v19 = objc_alloc(MEMORY[0x263F29940]);
    id v20 = [MEMORY[0x263EFF910] now];
    __int16 v21 = (void *)[v19 initWithDate:v20 fidelity:0];
    v37 = v21;
    uint64_t v22 = (void *)MEMORY[0x263EFF8C0];
    __int16 v23 = &v37;
    goto LABEL_10;
  }
  if (([WeakRetained isActive] & 1) == 0)
  {
    __int16 v24 = bls_scenes_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
      int v26 = objc_msgSend(v10, "bls_shortLoggingString");
      __int16 v27 = objc_msgSend(v11, "bls_shortLoggingString");
      *(_DWORD *)buf = 134219010;
      id v39 = self;
      __int16 v40 = 2114;
      uint64_t v41 = v25;
      __int16 v42 = 2114;
      uint64_t v43 = v26;
      __int16 v44 = 2114;
      id v45 = v27;
      __int16 v46 = 1024;
      BOOL v47 = v7;
      _os_log_impl(&dword_21FCFC000, v24, OS_LOG_TYPE_INFO, "%p:%{public}@ inactive scene, will return only now date for interval:%{public}@ previous:%{public}@ reset:%{BOOL}u", buf, 0x30u);
    }
    -[BLSHBacklightFBSceneHostEnvironment setShouldInvalidateWhenActivated]((uint64_t)self);
    id v28 = objc_alloc(MEMORY[0x263F29940]);
    id v20 = [MEMORY[0x263EFF910] now];
    __int16 v21 = (void *)[v28 initWithDate:v20 fidelity:0];
    uint64_t v36 = v21;
    uint64_t v22 = (void *)MEMORY[0x263EFF8C0];
    __int16 v23 = &v36;
LABEL_10:
    uint64_t v29 = [v22 arrayWithObjects:v23 count:1];
    v12[2](v12, v10, v29);

    goto LABEL_11;
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke;
  v30[3] = &unk_264533AB0;
  v30[4] = self;
  id v31 = v14;
  id v32 = v10;
  id v33 = v11;
  BOOL v35 = v7;
  uint64_t v34 = v12;
  [v31 updateSettingsWithTransitionBlock:v30];

LABEL_11:
}

id __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke(uint64_t a1, void *a2)
{
  v66[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v46 = 0;
  BOOL v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = __Block_byref_object_copy__7;
  id v50 = __Block_byref_object_dispose__7;
  id v51 = 0;
  if (-[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](*(void **)(a1 + 32), *(void **)(a1 + 40), v3))
  {
    char v4 = NSString;
    dispatch_time_t v5 = objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
    int v6 = [*(id *)(a1 + 32) identifier];
    BOOL v7 = [v4 stringWithFormat:@"requestPresentationDatesForDateInterval:%@ forScene:%@", v5, v6];

    uint64_t v8 = [*(id *)(a1 + 40) definition];
    uint64_t v9 = [v8 clientIdentity];
    id v10 = [v9 processIdentity];

    if (v10)
    {
      id v11 = [[BLSHAggregatedProcessAssertion alloc] initWithExplanation:v7 processIdentity:v10 duration:1.25];
      uint64_t v12 = (void *)v47[5];
      v47[5] = (uint64_t)v11;

      [(id)v47[5] setShouldFaultOnFailureToAcquire:-[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld](*(void *)(a1 + 32))];
      [(id)v47[5] acquireWithCompletion:0];
    }
    else
    {
      int v13 = bls_scenes_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void **)(a1 + 32);
        __int16 v15 = [v14 identifier];
        uint64_t v16 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        BOOL v53 = v14;
        __int16 v54 = 2114;
        id v55 = v15;
        __int16 v56 = 2048;
        id v57 = v16;
        _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ couldn't get a client processIdentity for scene %p. cannot take CPU grant process assertion", buf, 0x20u);
      }
    }
  }
  id v17 = objc_alloc(MEMORY[0x263F29A28]);
  int v18 = *(void **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(unsigned __int8 *)(a1 + 72);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke_93;
  v39[3] = &unk_264533A88;
  __int16 v44 = &v46;
  id v21 = v18;
  uint64_t v22 = *(void *)(a1 + 32);
  id v40 = v21;
  uint64_t v41 = v22;
  id v42 = *(id *)(a1 + 56);
  char v45 = *(unsigned char *)(a1 + 72);
  id v43 = *(id *)(a1 + 64);
  __int16 v23 = (void *)[v17 initWithDateInterval:v21 previousPresentationDate:v19 shouldReset:v20 completion:v39];
  __int16 v24 = [*(id *)(a1 + 40) definition];
  __int16 v25 = [v24 specification];
  int v26 = (objc_class *)[v25 transitionContextClass];

  id v27 = objc_alloc_init(v26);
  id v28 = (void *)MEMORY[0x263EFFA08];
  v66[0] = v23;
  uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:1];
  __int16 v30 = [v28 setWithArray:v29];
  [v27 setActions:v30];

  if (__disableFrontBoardRBAssertions) {
    [v27 setRunningBoardAssertionDisabled:1];
  }
  id v31 = bls_scenes_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = *(void **)(a1 + 32);
    id v33 = [v32 identifier];
    objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "bls_shortLoggingString");
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    int v36 = *(unsigned __int8 *)(a1 + 72);
    int v37 = [*(id *)(a1 + 32) clientHasDelegate];
    *(_DWORD *)buf = 134219522;
    BOOL v53 = v32;
    __int16 v54 = 2114;
    id v55 = v33;
    __int16 v56 = 2114;
    id v57 = v34;
    __int16 v58 = 2114;
    id v59 = v35;
    __int16 v60 = 1024;
    int v61 = v36;
    __int16 v62 = 1024;
    int v63 = v37;
    __int16 v64 = 2114;
    __int16 v65 = v23;
    _os_log_impl(&dword_21FCFC000, v31, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ request presentation dates for interval:%{public}@ previous:%{public}@ reset:%{BOOL}u clientHasDelegate:%{BOOL}u created action:%{public}@", buf, 0x40u);
  }
  _Block_object_dispose(&v46, 8);

  return v27;
}

void __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) invalidate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  dispatch_time_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  int v6 = [v3 error];
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(os_unfair_lock_s **)(a1 + 40);
  if (v6)
  {
    unsigned int v9 = -[BLSHBacklightFBSceneHostEnvironment incrementRequestDateSpecifierFailureCount](v8);
    unsigned int v10 = v9;
    if (*(void *)(a1 + 40))
    {
      double v11 = 10.0;
      if (v9 >= 2)
      {
        if (v9 >= 5) {
          double v11 = 900.0;
        }
        else {
          double v11 = 60.0;
        }
      }
    }
    else
    {
      double v11 = 0.0;
    }
    uint64_t v12 = bls_scenes_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      id v32 = *(void **)(a1 + 40);
      uint64_t v38 = [v32 identifier];
      id v39 = [MEMORY[0x263F29C30] sharedInstance];
      id v33 = [v39 formatDuration:v11];
      id v34 = objc_msgSend(*(id *)(a1 + 32), "bls_shortLoggingString");
      id v35 = objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
      int v36 = *(unsigned __int8 *)(a1 + 72);
      *(_DWORD *)buf = 134220034;
      id v42 = v32;
      __int16 v43 = 2114;
      __int16 v44 = v38;
      __int16 v45 = 1024;
      *(_DWORD *)uint64_t v46 = v10;
      *(_WORD *)&v46[4] = 2114;
      *(void *)&v46[6] = v33;
      *(_WORD *)&v46[14] = 2114;
      *(void *)&v46[16] = v6;
      *(_WORD *)&v46[24] = 2114;
      *(void *)&v46[26] = v3;
      __int16 v47 = 2114;
      uint64_t v48 = v34;
      __int16 v49 = 2114;
      id v50 = v35;
      __int16 v51 = 1024;
      int v52 = v36;
      _os_log_fault_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_FAULT, "%p:%{public}@ date specifier request failed (%d times). May retry after %{public}@ : error:%{public}@ response:%{public}@, for interval:%{public}@ previous:%{public}@ reset:%{BOOL}u", buf, 0x54u);
    }
    id v13 = objc_alloc(MEMORY[0x263F29940]);
    uint64_t v14 = [MEMORY[0x263EFF910] now];
    __int16 v15 = (void *)[v13 initWithDate:v14 fidelity:0];
    id v40 = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];

    id v17 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v11];
    id v18 = objc_alloc(MEMORY[0x263F08798]);
    uint64_t v19 = [*(id *)(a1 + 32) startDate];
    uint64_t v20 = [*(id *)(a1 + 32) endDate];
    id v21 = [v20 laterDate:v17];
    uint64_t v22 = [v18 initWithStartDate:v19 endDate:v21];

    id v7 = (id)v22;
  }
  else
  {
    -[BLSHBacklightFBSceneHostEnvironment resetRequestDateSpecifierFailureCount](v8);
    uint64_t v16 = [v3 dateSpecifiers];
    unint64_t v23 = [v16 count];
    if (v23 < 0xB)
    {
      os_log_type_t v26 = OS_LOG_TYPE_INFO;
    }
    else
    {
      double v24 = (double)v23;
      [v7 duration];
      if (v24 / v25 <= 4.0) {
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
      }
      else {
        os_log_type_t v26 = OS_LOG_TYPE_FAULT;
      }
    }
    id v17 = bls_scenes_log();
    if (os_log_type_enabled(v17, v26))
    {
      id v27 = *(void **)(a1 + 40);
      int v37 = [v27 identifier];
      id v28 = objc_msgSend(v16, "bls_boundedDescriptionWithMax:transformer:", 12, &__block_literal_global_99);
      uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "bls_shortLoggingString");
      __int16 v30 = objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
      int v31 = *(unsigned __int8 *)(a1 + 72);
      *(_DWORD *)buf = 134219266;
      id v42 = v27;
      __int16 v43 = 2114;
      __int16 v44 = v37;
      __int16 v45 = 2114;
      *(void *)uint64_t v46 = v28;
      *(_WORD *)&v46[8] = 2114;
      *(void *)&v46[10] = v29;
      *(_WORD *)&v46[18] = 2114;
      *(void *)&v46[20] = v30;
      *(_WORD *)&v46[28] = 1024;
      *(_DWORD *)&v46[30] = v31;
      _os_log_impl(&dword_21FCFC000, v17, v26, "%p:%{public}@ client dates:%{public}@ animation interval:%{public}@ previous:%{public}@ reset:%{BOOL}u", buf, 0x3Au);

      int v6 = 0;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

id __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke_96(uint64_t a1, void *a2)
{
  __n128 v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v3 date];
  dispatch_time_t v5 = objc_msgSend(v4, "bls_shortLoggingString");
  [v3 fidelity];

  int v6 = NSStringFromBLSUpdateFidelity();
  id v7 = [v2 stringWithFormat:@"%@, fidelity:%@", v5, v6];

  return v7;
}

- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  unsigned int v9 = [WeakRetained settings];
  unsigned int v10 = objc_msgSend(v9, "bls_visualState");

  if (!WeakRetained)
  {
    uint64_t v16 = bls_scenes_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
      *(_DWORD *)buf = 134218754;
      id v33 = self;
      __int16 v34 = 2114;
      id v35 = v17;
      __int16 v36 = 2114;
      id v37 = 0;
      __int16 v38 = 2114;
      id v39 = v6;
      id v18 = "%p:%{public}@ nil scene, will not update scene:%{public}@ to dateSpecifier:%{public}@";
      goto LABEL_8;
    }
LABEL_9:

    v7[2](v7);
    goto LABEL_14;
  }
  double v11 = [WeakRetained settings];
  uint64_t v12 = objc_msgSend(v11, "bls_presentationDate");
  id v13 = [v6 date];
  if ([v12 isEqualToDate:v13])
  {
    uint64_t v14 = [v10 updateFidelity];
    uint64_t v15 = [v6 fidelity];

    if (v14 == v15)
    {
      uint64_t v16 = bls_scenes_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
        *(_DWORD *)buf = 134218754;
        id v33 = self;
        __int16 v34 = 2114;
        id v35 = v17;
        __int16 v36 = 2114;
        id v37 = WeakRetained;
        __int16 v38 = 2114;
        id v39 = v6;
        id v18 = "%p:%{public}@ scene:%{public}@ already at dateSpecifier:%{public}@";
LABEL_8:
        _os_log_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_INFO, v18, buf, 0x2Au);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_renderSeed = self->_lock_renderSeed;
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  double v24 = __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke;
  double v25 = &unk_264533B00;
  id v26 = v6;
  id v27 = v10;
  unint64_t v31 = lock_renderSeed;
  id v20 = WeakRetained;
  id v28 = v20;
  uint64_t v29 = self;
  id v21 = v7;
  id v30 = v21;
  [v20 updateSettingsWithTransitionBlock:&v22];
  if ((objc_msgSend(v20, "isActive", v22, v23, v24, v25) & 1) == 0) {
    v21[2](v21);
  }

LABEL_14:
}

id __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_msgSend(v3, "bls_setDelegateActive:", 1);
  uint64_t v4 = [*(id *)(a1 + 32) date];
  objc_msgSend(v3, "bls_setPresentationDate:", v4);

  dispatch_time_t v5 = objc_msgSend(*(id *)(a1 + 40), "newVisualStateWithUpdateFidelity:", objc_msgSend(*(id *)(a1 + 32), "fidelity"));
  objc_msgSend(v3, "bls_setVisualState:", v5);
  objc_msgSend(v3, "bls_setRenderSeed:", *(void *)(a1 + 72));
  char v6 = [*(id *)(a1 + 48) isActive];
  id v7 = *(void **)(a1 + 56);
  if (v6)
  {
    if (-[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](v7, *(void **)(a1 + 48), v3))
    {
      uint64_t v8 = NSString;
      uint64_t v9 = *(void *)(a1 + 32);
      unsigned int v10 = [*(id *)(a1 + 56) identifier];
      double v11 = [v8 stringWithFormat:@"updateTo:%@ forScene:%@", v9, v10];

      uint64_t v12 = [*(id *)(a1 + 48) definition];
      id v13 = [v12 clientIdentity];
      uint64_t v14 = [v13 processIdentity];

      if (v14)
      {
        uint64_t v15 = [[BLSHAggregatedProcessAssertion alloc] initWithExplanation:v11 processIdentity:v14 duration:1.25];
        -[BLSHAggregatedProcessAssertion setShouldFaultOnFailureToAcquire:](v15, "setShouldFaultOnFailureToAcquire:", -[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld](*(void *)(a1 + 56)));
        [(BLSHAggregatedProcessAssertion *)v15 acquireWithCompletion:0];
      }
      else
      {
        uint64_t v23 = bls_scenes_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          double v24 = *(void **)(a1 + 56);
          double v25 = [v24 identifier];
          uint64_t v26 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 134218498;
          uint64_t v48 = v24;
          __int16 v49 = 2114;
          id v50 = v25;
          __int16 v51 = 2048;
          uint64_t v52 = v26;
          _os_log_impl(&dword_21FCFC000, v23, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ couldn't get a client processIdentity for scene %p. cannot take CPU/GPU grant process assertion", buf, 0x20u);
        }
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    id v27 = objc_alloc(MEMORY[0x263F299A0]);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke_107;
    v42[3] = &unk_264533AD8;
    uint64_t v16 = v15;
    __int16 v43 = v16;
    int8x16_t v40 = *(int8x16_t *)(a1 + 48);
    id v28 = (id)v40.i64[0];
    int8x16_t v44 = vextq_s8(v40, v40, 8uLL);
    id v45 = *(id *)(a1 + 32);
    id v46 = *(id *)(a1 + 64);
    uint64_t v29 = (void *)[v27 initWithBacklightChangeEvent:0 animated:0 touchTargetable:0 isUpdateToDateSpecifier:1 completion:v42];
    id v30 = [*(id *)(a1 + 48) definition];
    unint64_t v31 = [v30 specification];
    id v32 = (objc_class *)[v31 transitionContextClass];

    id v22 = objc_alloc_init(v32);
    id v33 = [MEMORY[0x263EFFA08] setWithObject:v29];
    [v22 setActions:v33];

    if (__disableFrontBoardRBAssertions) {
      [v22 setRunningBoardAssertionDisabled:1];
    }
    __int16 v34 = bls_scenes_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = *(void **)(a1 + 56);
      __int16 v36 = [v35 identifier];
      uint64_t v41 = *(void *)(a1 + 32);
      uint64_t v37 = *(void *)(a1 + 48);
      int v38 = [*(id *)(a1 + 56) clientHasDelegate];
      *(_DWORD *)buf = 134219266;
      uint64_t v48 = v35;
      __int16 v49 = 2114;
      id v50 = v36;
      __int16 v51 = 2048;
      uint64_t v52 = v37;
      __int16 v53 = 2114;
      uint64_t v54 = v41;
      __int16 v55 = 1024;
      int v56 = v38;
      __int16 v57 = 2114;
      __int16 v58 = v29;
      _os_log_impl(&dword_21FCFC000, v34, OS_LOG_TYPE_INFO, "%p:%{public}@ request to update scene:%p to dateSpecifier:%{public}@ clientHasDelegate:%{BOOL}u action:%{public}@", buf, 0x3Au);
    }
  }
  else
  {
    -[BLSHBacklightFBSceneHostEnvironment setShouldInvalidateWhenActivated]((uint64_t)v7);
    uint64_t v16 = bls_scenes_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = *(void **)(a1 + 56);
      id v18 = [v17 identifier];
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 48);
      int v21 = [*(id *)(a1 + 56) clientHasDelegate];
      *(_DWORD *)buf = 134219010;
      uint64_t v48 = v17;
      __int16 v49 = 2114;
      id v50 = v18;
      __int16 v51 = 2048;
      uint64_t v52 = v20;
      __int16 v53 = 2114;
      uint64_t v54 = v19;
      __int16 v55 = 1024;
      int v56 = v21;
      _os_log_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_INFO, "%p:%{public}@ request to update inactive scene:%p to dateSpecifier:%{public}@ clientHasDelegate:%{BOOL}u", buf, 0x30u);
    }
    id v22 = 0;
  }

  return v22;
}

void __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v4 = [v3 error];
  dispatch_time_t v5 = bls_scenes_log();
  char v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = [v7 identifier];
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      int v11 = 134219266;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v4;
      __int16 v17 = 2114;
      id v18 = v3;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      _os_log_error_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_ERROR, "%p:%{public}@ client update action failed error:%{public}@ response:%{public}@ will not update scene:%{public}@ to dateSpecifier:%{public}@", (uint8_t *)&v11, 0x3Eu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke_107_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)clearPresentationDate
{
  id v7 = [a1 identifier];
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v1, v2, "%p:%{public}@ scene:%{public}@ already at presentationDate nil", v3, v4, v5, v6, 2u);
}

void __60__BLSHBacklightFBSceneHostEnvironment_clearPresentationDate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = bls_scenes_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __60__BLSHBacklightFBSceneHostEnvironment_clearPresentationDate__block_invoke_cold_1();
  }

  objc_msgSend(v2, "bls_setPresentationDate:", 0);
}

- (void)willBeginRenderSession:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = bls_scenes_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
    lock_renderSessionAssertion = self->_lock_renderSessionAssertion;
    *(_DWORD *)buf = 134218754;
    id v32 = self;
    __int16 v33 = 2114;
    __int16 v34 = v7;
    __int16 v35 = 2048;
    id v36 = v5;
    __int16 v37 = 2048;
    int v38 = lock_renderSessionAssertion;
    _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "%p:%{public}@ willBeginRenderSession:%p oldAssertion:%p", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  uint64_t v10 = [WeakRetained settings];
  int v11 = -[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](self, WeakRetained, v10);

  if (v11)
  {
    uint64_t v12 = [WeakRetained definition];
    __int16 v13 = [v12 clientIdentity];
    uint64_t v14 = [v13 processIdentity];

    if (v14)
    {
      if (self->_lock_renderSessionAssertion)
      {
        uint64_t v23 = NSString;
        double v24 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
        double v25 = [v23 stringWithFormat:@"%p:%@ willBeginRenderSession – nonnil existing renderSessionAssertion:%@ newRenderSession:%@", self, v24, self->_lock_renderSessionAssertion, v5];

        BLSHRecordCriticalAssertFailure(v25);
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __62__BLSHBacklightFBSceneHostEnvironment_willBeginRenderSession___block_invoke;
        v28[3] = &unk_2645324E8;
        v28[4] = self;
        id v29 = v5;
        SEL v30 = a2;
        uint64_t v26 = (void (**)(void))MEMORY[0x223C5E2B0](v28);
        if (BLSHIsUnitTestRunning())
        {
          v26[2](v26);
        }
        else
        {
          dispatch_time_t v27 = dispatch_time(0, 1000000000);
          dispatch_after(v27, MEMORY[0x263EF83A0], v26);
        }
      }
      __int16 v15 = [BLSHAggregatedProcessAssertion alloc];
      uint64_t v16 = NSString;
      __int16 v17 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
      id v18 = [v16 stringWithFormat:@"RenderSession:%p forScene:%@", v5, v17];
      __int16 v19 = [(BLSHAggregatedProcessAssertion *)v15 initWithExplanation:v18 processIdentity:v14 duration:1.79769313e308];
      uint64_t v20 = self->_lock_renderSessionAssertion;
      self->_lock_renderSessionAssertion = v19;

      -[BLSHAggregatedProcessAssertion setShouldFaultOnFailureToAcquire:](self->_lock_secondsFidelityAssertion, "setShouldFaultOnFailureToAcquire:", -[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld]((BOOL)self));
      [(BLSHAggregatedProcessAssertion *)self->_lock_renderSessionAssertion acquireWithCompletion:0];
    }
    else
    {
      __int16 v21 = bls_scenes_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
        *(_DWORD *)buf = 134218498;
        id v32 = self;
        __int16 v33 = 2114;
        __int16 v34 = v22;
        __int16 v35 = 2048;
        id v36 = WeakRetained;
        _os_log_impl(&dword_21FCFC000, v21, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ couldn't get a client processIdentity for scene %p. cannot take CPU/GPU grant process assertion for render session", buf, 0x20u);
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

void __62__BLSHBacklightFBSceneHostEnvironment_willBeginRenderSession___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  uint64_t v3 = NSString;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v4 identifier];
  uint64_t v6 = [v3 stringWithFormat:@"%p:%@ willBeginRenderSession – nonnil existing renderSessionAssertion:%@ newRenderSession:%@", v4, v5, *(void *)(*(void *)(a1 + 32) + 40), *(void *)(a1 + 40)];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    id v18 = @"BLSHBacklightFBSceneHostEnvironment.m";
    __int16 v19 = 1024;
    int v20 = 749;
    __int16 v21 = 2114;
    uint64_t v22 = v6;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)willEndRenderSession:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = bls_scenes_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
    lock_renderSessionAssertion = self->_lock_renderSessionAssertion;
    *(_DWORD *)buf = 134218754;
    double v24 = self;
    __int16 v25 = 2114;
    uint64_t v26 = v6;
    __int16 v27 = 2048;
    id v28 = v4;
    __int16 v29 = 2048;
    SEL v30 = lock_renderSessionAssertion;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_INFO, "%p:%{public}@ willEndRenderSession:%p assertion:%p", buf, 0x2Au);
  }
  uint64_t v8 = self->_lock_renderSessionAssertion;
  if (!v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
    uint64_t v10 = [WeakRetained settings];
    if (-[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](self, WeakRetained, v10))
    {
      int v11 = [WeakRetained clientSettings];
      int v12 = objc_msgSend(v11, "bls_optsOutOfProcessAssertions");

      int v13 = [(BLSHAggregatedProcessAssertion *)v10 activityMode];
      uint64_t v14 = [WeakRetained definition];
      __int16 v15 = [v14 clientIdentity];
      int v16 = [v15 isLocal];

      __int16 v17 = bls_scenes_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        BOOL v22 = v13 == 7;
        if (v13 == 7) {
          int v19 = 1;
        }
        else {
          int v19 = v12;
        }
        int v20 = (v19 | v16) ^ 1;
        __int16 v21 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
        *(_DWORD *)buf = 134219778;
        double v24 = self;
        __int16 v25 = 2114;
        uint64_t v26 = v21;
        __int16 v27 = 2048;
        id v28 = WeakRetained;
        __int16 v29 = 2048;
        SEL v30 = v10;
        __int16 v31 = 1024;
        int v32 = v20;
        __int16 v33 = 1024;
        int v34 = v12;
        __int16 v35 = 1024;
        BOOL v36 = v22;
        __int16 v37 = 1024;
        int v38 = v16;
        _os_log_fault_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_FAULT, "%p:%{public}@ renderSessionAssertion=nil but scene:%p settings:%p wantsProcessAssertions:%{BOOL}u optsOut:%{BOOL}u externalManaged:%{BOOL}u local:%{BOOL}u", buf, 0x42u);
      }
    }

    uint64_t v8 = self->_lock_renderSessionAssertion;
  }
  [(BLSHAggregatedProcessAssertion *)v8 invalidate];
  id v18 = self->_lock_renderSessionAssertion;
  self->_lock_renderSessionAssertion = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)wantsStateUpdateToActiveAfterRemovalFromPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  id v4 = [WeakRetained settings];
  char v5 = -[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](self, WeakRetained, v4);

  uint64_t v6 = bls_scenes_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BLSHBacklightFBSceneHostEnvironment wantsStateUpdateToActiveAfterRemovalFromPresentation](self);
  }

  return v5 ^ 1;
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  uint64_t v9 = [v7 date];

  uint64_t v10 = bls_scenes_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
    uint64_t v14 = objc_msgSend(v6, "bls_shortLoggingString");
    __int16 v15 = objc_msgSend(v9, "bls_shortLoggingString");
    *(_DWORD *)buf = 138543874;
    int v20 = v13;
    __int16 v21 = 2114;
    BOOL v22 = v14;
    __int16 v23 = 2114;
    double v24 = v15;
    _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "FBSceneHostEnv.updateToVisualState: (direct) sending scene settings from host to scene:%{public}@ state:%{public}@ presentationDate:%{public}@", buf, 0x20u);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __85__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier___block_invoke;
  v16[3] = &unk_264533B28;
  id v17 = v6;
  id v18 = v9;
  id v11 = v9;
  id v12 = v6;
  [WeakRetained updateSettingsWithBlock:v16];
}

void __85__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "bls_setVisualState:", v3);
  objc_msgSend(v4, "bls_setPresentationDate:", *(void *)(a1 + 40));
}

void __113__BLSHBacklightFBSceneHostEnvironment_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "hostEnvironment:clientDidUpdateEnabled:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "clientHasDelegate"));
  }
}

void __113__BLSHBacklightFBSceneHostEnvironment_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "hostEnvironment:clientDidUpdateSupportsAlwaysOn:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "clientSupportsAlwaysOn"));
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);

  if (WeakRetained == v4)
  {
    id v6 = bls_scenes_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
      int v8 = 134218498;
      uint64_t v9 = self;
      __int16 v10 = 2114;
      id v11 = v7;
      __int16 v12 = 2048;
      id v13 = v4;
      _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "%p:%{public}@ scene:%p did invalidate", (uint8_t *)&v8, 0x20u);
    }
    objc_storeWeak((id *)&self->_fbScene, 0);
  }
}

- (void)sceneDidActivate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);

  if (WeakRetained == v4)
  {
    BOOL ShouldInvalidateWhen = -[BLSHBacklightFBSceneHostEnvironment readAndClearShouldInvalidateWhenActivated]((uint64_t)self);
    id v7 = bls_scenes_log();
    int v8 = v7;
    if (ShouldInvalidateWhen) {
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
    }
    else {
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    }
    if (os_log_type_enabled(v7, v9))
    {
      __int16 v10 = [(BLSHBacklightFBSceneHostEnvironment *)self identifier];
      int v11 = 134218498;
      __int16 v12 = self;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      id v16 = v4;
      _os_log_impl(&dword_21FCFC000, v8, v9, "%p:%{public}@ scene:%p did activate", (uint8_t *)&v11, 0x20u);
    }
    if (ShouldInvalidateWhen) {
      [(BLSHBacklightFBSceneHostEnvironment *)self invalidateContentForReason:@"wasInPresentationWhileInactive"];
    }
  }
}

+ (void)setAmendSceneSettingsDelegate:(id)a3
{
  os_unfair_lock_lock(&_classLock_3);
  _amendSceneSettingsDelegate = (uint64_t)a3;

  os_unfair_lock_unlock(&_classLock_3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_budgetProcessIdentity, 0);
  objc_storeStrong((id *)&self->_lock_renderSessionAssertion, 0);
  objc_storeStrong((id *)&self->_lock_secondsFidelityAssertion, 0);
  objc_storeStrong((id *)&self->_nilSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_diffInspector, 0);

  objc_destroyWeak((id *)&self->_fbScene);
}

- (void)initWithFBScene:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(v5, v6, v7, v8, v9, 0x2Au);
}

- (void)requestedFidelityForInactiveContentWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = [v0 identifier];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_21FCFC000, v2, v3, "%p:%{public}@ nil scene, requestedFidelityForInactiveContent:Minutes", v4, v5, v6, v7, v8);
}

- (void)requestedFidelityForInactiveContentWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = [v0 identifier];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_21FCFC000, v2, v3, "%p:%{public}@ inactive scene, requestedFidelityForInactiveContent:Minutes", v4, v5, v6, v7, v8);
}

void __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 identifier];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_21FCFC000, v2, v3, "%p:%{public}@ querying requestedFidelityForInactiveContent", v4, v5, v6, v7, v8);
}

void __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifier];
  uint64_t v2 = NSStringFromBLSUpdateFidelity();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v3, v4, "%p:%{public}@ requestedFidelityForInactiveContent:%{public}@", v5, v6, v7, v8, v9);
}

- (void)sceneWantsProcessAssertion:withSceneSettings:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = [v0 identifier];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v2, v3, "%p:%{public}@ scene:%p wantsProcessAssertions:NO", v4, v5, v6, v7, v8);
}

- (void)updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:.cold.1()
{
  uint64_t v6 = (void *)MEMORY[0x223C5E2B0]();
  OUTLINED_FUNCTION_8_1(&dword_21FCFC000, v0, v1, "animated=%{BOOL}u but animationCompleteBlock=%{public}@", v2, v3, v4, v5, 2u);
}

- (void)updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:.cold.2()
{
  uint64_t v6 = (void *)MEMORY[0x223C5E2B0]();
  OUTLINED_FUNCTION_8_1(&dword_21FCFC000, v0, v1, "animated=%{BOOL}u but performBacklightRampBlock=%{public}@", v2, v3, v4, v5, 2u);
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_78_cold_1(uint64_t a1, unsigned __int8 *a2, NSObject *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  __int16 v10 = objc_msgSend(*(id *)(a1 + 64), "bls_shortLoggingString");
  int v11 = *a2;
  int v12 = *(unsigned __int8 *)(a1 + 89);
  uint64_t v13 = *(void *)(a1 + 72);
  int v14 = 134219778;
  __int16 v15 = v6;
  __int16 v16 = 2114;
  uint64_t v17 = v7;
  __int16 v18 = 2114;
  uint64_t v19 = v8;
  __int16 v20 = 2114;
  uint64_t v21 = v9;
  __int16 v22 = 2114;
  __int16 v23 = v10;
  __int16 v24 = 1024;
  int v25 = v11;
  __int16 v26 = 1024;
  int v27 = v12;
  __int16 v28 = 2114;
  uint64_t v29 = v13;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%p:%{public}@ client did update scene:%{public}@ to visualState:%{public}@ presentationDate:%{public}@ animated:%{BOOL}u touchTarget:%{BOOL}u event:%{public}@", (uint8_t *)&v14, 0x4Au);
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_82_cold_1(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x44u);
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = [*(id *)(v1 + 40) identifier];
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 56), "bls_shortLoggingString");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x3Au);
}

void __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke_107_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = [*(id *)(v0 + 40) identifier];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v2, v3, "%p:%{public}@ client did update to dateSpecifier:%{public}@", v4, v5, v6, v7, v8);
}

void __60__BLSHBacklightFBSceneHostEnvironment_clearPresentationDate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = [*(id *)(v0 + 32) identifier];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v2, v3, "%p:%{public}@ update to presentationDate nil for scene:%{public}@", v4, v5, v6, v7, v8);
}

- (void)wantsStateUpdateToActiveAfterRemovalFromPresentation
{
  uint64_t v6 = [a1 identifier];
  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x12u);
}

@end