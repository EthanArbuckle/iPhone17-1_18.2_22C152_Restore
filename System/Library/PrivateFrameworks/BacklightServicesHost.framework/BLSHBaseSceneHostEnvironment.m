@interface BLSHBaseSceneHostEnvironment
- (BLSBacklightSceneVisualState)visualState;
- (BLSHBaseSceneHostEnvironment)initWithIdentifier:(id)a3;
- (BOOL)cacheFlipbookOnDisplayWake;
- (BOOL)clientHasDelegate;
- (BOOL)clientSupportsAlwaysOn;
- (BOOL)hasUnrestrictedFramerateUpdates;
- (BOOL)is1HzFlipbook;
- (BOOL)isAlwaysOnEnabledForEnvironment;
- (BOOL)isClientActive;
- (BOOL)isDisplayBlanked;
- (BOOL)isLiveUpdating;
- (BOOL)isLocal;
- (NSDate)presentationDate;
- (NSString)description;
- (NSString)identifier;
- (RBSProcessIdentity)budgetProcessIdentity;
- (os_unfair_lock_s)lock;
- (void)addObserver:(id)a3;
- (void)clearPresentationDate;
- (void)invalidateContentForReason:(id)a3;
- (void)notifyObserversWithBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6;
- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3;
- (void)set1HzFlipbook:(BOOL)a3;
- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3;
- (void)setCacheFlipbookOnDisplayWake:(BOOL)a3;
- (void)setDisplayBlanked:(BOOL)a3;
- (void)setLiveUpdating:(BOOL)a3;
- (void)setUnrestrictedFramerateUpdates:(BOOL)a3;
- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10;
@end

@implementation BLSHBaseSceneHostEnvironment

- (BLSHBaseSceneHostEnvironment)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLSHBaseSceneHostEnvironment;
  v5 = [(BLSHBaseSceneHostEnvironment *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F299C0]) initWithActiveAppearance:1 updateFidelity:3 adjustedLuminance:2];
    lock_visualState = v6->_lock_visualState;
    v6->_lock_visualState = (BLSBacklightSceneVisualState *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
    lock_observers = v6->_lock_observers;
    v6->_lock_observers = (NSHashTable *)v11;
  }
  return v6;
}

- (RBSProcessIdentity)budgetProcessIdentity
{
  return 0;
}

- (BOOL)clientHasDelegate
{
  return 1;
}

- (BOOL)isClientActive
{
  return 1;
}

- (BOOL)clientSupportsAlwaysOn
{
  return 0;
}

- (BOOL)isLocal
{
  return 1;
}

- (BOOL)isAlwaysOnEnabledForEnvironment
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnEnabledForEnvironment;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_alwaysOnEnabledForEnvironment = self->_lock_alwaysOnEnabledForEnvironment;
  self->_int lock_alwaysOnEnabledForEnvironment = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_alwaysOnEnabledForEnvironment != v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__BLSHBaseSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke;
    v7[3] = &unk_264532C98;
    v7[4] = self;
    char v8 = v3;
    [(BLSHBaseSceneHostEnvironment *)self notifyObserversWithBlock:v7];
  }
}

void __65__BLSHBaseSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetAlwaysOnEnabledForEnvironment:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)isLiveUpdating
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_liveUpdating;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLiveUpdating:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_liveUpdating = self->_lock_liveUpdating;
  self->_int lock_liveUpdating = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_liveUpdating != v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__BLSHBaseSceneHostEnvironment_setLiveUpdating___block_invoke;
    v7[3] = &unk_264532C98;
    v7[4] = self;
    char v8 = v3;
    [(BLSHBaseSceneHostEnvironment *)self notifyObserversWithBlock:v7];
  }
}

void __48__BLSHBaseSceneHostEnvironment_setLiveUpdating___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetLiveUpdating:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_unrestrictedFramerateUpdates;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUnrestrictedFramerateUpdates:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_unrestrictedFramerateUpdates = self->_lock_unrestrictedFramerateUpdates;
  self->_int lock_unrestrictedFramerateUpdates = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_unrestrictedFramerateUpdates != v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__BLSHBaseSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke;
    v7[3] = &unk_264532C98;
    v7[4] = self;
    char v8 = v3;
    [(BLSHBaseSceneHostEnvironment *)self notifyObserversWithBlock:v7];
  }
}

void __64__BLSHBaseSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetUnrestrictedFramerateUpdates:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)is1HzFlipbook
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_1HzFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set1HzFlipbook:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_1HzFlipbook = self->_lock_1HzFlipbook;
  self->_int lock_1HzFlipbook = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_1HzFlipbook != v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__BLSHBaseSceneHostEnvironment_set1HzFlipbook___block_invoke;
    v7[3] = &unk_264532C98;
    v7[4] = self;
    char v8 = v3;
    [(BLSHBaseSceneHostEnvironment *)self notifyObserversWithBlock:v7];
  }
}

void __47__BLSHBaseSceneHostEnvironment_set1HzFlipbook___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSet1HzFlipbook:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)cacheFlipbookOnDisplayWake
{
  v2 = self;
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
    v7[2] = __62__BLSHBaseSceneHostEnvironment_setCacheFlipbookOnDisplayWake___block_invoke;
    v7[3] = &unk_264532C98;
    v7[4] = self;
    char v8 = v3;
    [(BLSHBaseSceneHostEnvironment *)self notifyObserversWithBlock:v7];
  }
}

void __62__BLSHBaseSceneHostEnvironment_setCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetCacheFlipbookOnDisplayWake:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)invalidateContentForReason:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__BLSHBaseSceneHostEnvironment_invalidateContentForReason___block_invoke;
  v6[3] = &unk_264532CC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BLSHBaseSceneHostEnvironment *)self notifyObserversWithBlock:v6];
}

void __59__BLSHBaseSceneHostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) invalidateContentForReason:*(void *)(a1 + 40)];
  }
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

- (void)notifyObserversWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3
{
}

- (BLSBacklightSceneVisualState)visualState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_visualState;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10
{
  BOOL v11 = a5;
  long long v14 = (BLSBacklightSceneVisualState *)a3;
  v23 = (void (**)(void, __n128))a9;
  long long v15 = (void (**)(void))a10;
  v16 = (void (**)(void))a8;
  id v17 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_visualState = self->_lock_visualState;
  self->_lock_visualState = v14;
  v19 = v14;

  v20 = [v17 date];

  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = v20;

  os_unfair_lock_unlock(&self->_lock);
  v16[2](v16);

  if (v23)
  {
    v22.n128_u64[0] = 0;
    if (v11) {
      v22.n128_f64[0] = 0.25;
    }
    v23[2](v23, v22);
  }
  if (v15) {
    v15[2](v15);
  }
}

- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = (objc_class *)MEMORY[0x263F29940];
  id v9 = a6;
  id v10 = a3;
  id v11 = [v8 alloc];
  long long v12 = [v10 startDate];
  long long v13 = (void *)[v11 initWithDate:v12 fidelity:0];
  v15[0] = v13;
  long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  (*((void (**)(id, id, void *))a6 + 2))(v9, v10, v14);
}

- (NSDate)presentationDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_presentationDate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)clearPresentationDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = 0;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(BLSHBaseSceneHostEnvironment *)self identifier];
  [v3 appendString:v4 withName:@"identifier"];

  id v5 = [v3 build];

  return (NSString *)v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isDisplayBlanked
{
  return self->_displayBlanked;
}

- (void)setDisplayBlanked:(BOOL)a3
{
  self->_displayBlanked = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lock_presentationDate, 0);
  objc_storeStrong((id *)&self->_lock_visualState, 0);

  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end