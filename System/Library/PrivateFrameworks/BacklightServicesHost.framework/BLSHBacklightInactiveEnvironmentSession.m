@interface BLSHBacklightInactiveEnvironmentSession
+ (BLSHBacklightInactiveEnvironmentSession)sessionWithPresentation:(id)a3;
- (BLSHBacklightEnvironmentPresentation)presentation;
- (BLSHBacklightInactiveEnvironmentSession)initWithPresentation:(id)a3;
- (BLSHBacklightInactiveEnvironmentSessionUpdating)updater;
- (void)addEnvironmentsObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)hostEnvironment:(id)a3 clientDidUpdateEnabled:(BOOL)a4;
- (void)hostEnvironment:(id)a3 clientDidUpdateSupportsAlwaysOn:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSet1HzFlipbook:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSetAlwaysOnEnabledForEnvironment:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSetCacheFlipbookOnDisplayWake:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSetLiveUpdating:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4;
- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4;
- (void)notifyEnvironmentObserversWithBlock:(uint64_t)a1;
- (void)notifyObserversWithBlock:(uint64_t)a1;
- (void)removeEnvironmentsObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sessionDidEnd;
- (void)setPresentation:(id)a3;
- (void)setUpdater:(id)a3;
- (void)updaterDidBeginUpdateToBacklightState:(int64_t)a3;
- (void)updaterDidUpdateToPresentation:(id)a3;
@end

@implementation BLSHBacklightInactiveEnvironmentSession

+ (BLSHBacklightInactiveEnvironmentSession)sessionWithPresentation:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPresentation:v4];

  return (BLSHBacklightInactiveEnvironmentSession *)v5;
}

- (BLSHBacklightInactiveEnvironmentSession)initWithPresentation:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BLSHBacklightInactiveEnvironmentSession;
  v7 = [(BLSHBacklightInactiveEnvironmentSession *)&v25 init];
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v20 = [NSString stringWithFormat:@"presentation must not be nil"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHBacklightInactiveEnvironmentSession initWithPresentation:](a2);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD21C08);
    }
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_presentation, a3);
    uint64_t v9 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:2];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:2];
    environmentObservers = v8->_environmentObservers;
    v8->_environmentObservers = (NSHashTable *)v11;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v13 = objc_msgSend(v6, "presentationEntries", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v21 + 1) + 8 * v17) environment];
          [v18 addObserver:v8];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v15);
    }
  }
  return v8;
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BLSHBacklightInactiveEnvironmentSessionUpdating)updater
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_updater;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setUpdater:(id)a3
{
  uint64_t v4 = (BLSHBacklightInactiveEnvironmentSessionUpdating *)a3;
  os_unfair_lock_lock(&self->_lock);
  updater = self->_updater;
  self->_updater = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPresentation:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    os_unfair_lock_lock(&self->_lock);
    if ([v6 isEqual:self->_presentation])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      presentation = self->_presentation;
      uint64_t v8 = v6;
      uint8_t v9 = self->_presentation;
      self->_presentation = v8;
      v10 = presentation;

      os_unfair_lock_unlock(&self->_lock);
      uint64_t v11 = [(BLSHBacklightInactiveEnvironmentSession *)self updater];
      [v11 inactiveEnvironmentSession:self updateToPresentation:v8];

      v13[4] = self;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __59__BLSHBacklightInactiveEnvironmentSession_setPresentation___block_invoke;
      v14[3] = &unk_264532D38;
      v14[4] = self;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __59__BLSHBacklightInactiveEnvironmentSession_setPresentation___block_invoke_2;
      v13[3] = &unk_264532D38;
      [(BLSHBacklightEnvironmentPresentation *)v8 differenceFromPresentation:v10 forEachRemoval:v14 forEachAddition:v13];
    }
  }
  else
  {
    v12 = [NSString stringWithFormat:@"attempted to set presentation to nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightInactiveEnvironmentSession setPresentation:](a2);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __59__BLSHBacklightInactiveEnvironmentSession_setPresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObserver:*(void *)(a1 + 32)];
}

uint64_t __59__BLSHBacklightInactiveEnvironmentSession_setPresentation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addObserver:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)addEnvironmentsObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_environmentObservers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeEnvironmentsObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_environmentObservers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)updaterDidUpdateToPresentation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__BLSHBacklightInactiveEnvironmentSession_updaterDidUpdateToPresentation___block_invoke;
  v6[3] = &unk_264532D60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[BLSHBacklightInactiveEnvironmentSession notifyObserversWithBlock:]((uint64_t)self, v6);
}

uint64_t __74__BLSHBacklightInactiveEnvironmentSession_updaterDidUpdateToPresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 inactiveEnvironmentSession:*(void *)(a1 + 32) didUpdateToPresentation:*(void *)(a1 + 40)];
}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = a2;
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    id v5 = [*(id *)(a1 + 8) allObjects];
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

- (void)updaterDidBeginUpdateToBacklightState:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__BLSHBacklightInactiveEnvironmentSession_updaterDidBeginUpdateToBacklightState___block_invoke;
  v3[3] = &unk_264532D88;
  v3[4] = self;
  v3[5] = a3;
  -[BLSHBacklightInactiveEnvironmentSession notifyObserversWithBlock:]((uint64_t)self, v3);
}

void __81__BLSHBacklightInactiveEnvironmentSession_updaterDidBeginUpdateToBacklightState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inactiveEnvironmentSession:*(void *)(a1 + 32) didBeginUpdateToBacklightState:*(void *)(a1 + 40)];
  }
}

- (void)sessionDidEnd
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ended = 1;
  id v4 = [(BLSHBacklightEnvironmentPresentation *)self->_presentation presentationEntries];
  [(NSHashTable *)self->_environmentObservers removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) environment];
        [v10 removeObserver:self];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__BLSHBacklightInactiveEnvironmentSession_sessionDidEnd__block_invoke;
  v11[3] = &unk_264532DB0;
  v11[4] = self;
  -[BLSHBacklightInactiveEnvironmentSession notifyObserversWithBlock:]((uint64_t)self, v11);
}

uint64_t __56__BLSHBacklightInactiveEnvironmentSession_sessionDidEnd__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndInactiveEnvironmentSession:*(void *)(a1 + 32)];
}

- (void)hostEnvironment:(id)a3 clientDidUpdateEnabled:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_clientDidUpdateEnabled___block_invoke;
  v8[3] = &unk_264532C98;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);
}

void __82__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_clientDidUpdateEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) clientDidUpdateEnabled:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)notifyEnvironmentObserversWithBlock:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    id v5 = [*(id *)(a1 + 16) allObjects];
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

- (void)hostEnvironment:(id)a3 clientDidUpdateSupportsAlwaysOn:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_clientDidUpdateSupportsAlwaysOn___block_invoke;
  v8[3] = &unk_264532C98;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);
}

void __91__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_clientDidUpdateSupportsAlwaysOn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) clientDidUpdateSupportsAlwaysOn:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_invalidateContentForReason___block_invoke;
  v10[3] = &unk_264532CC0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v10);
}

void __86__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) invalidateContentForReason:*(void *)(a1 + 40)];
  }
}

- (void)hostEnvironment:(id)a3 hostDidSetAlwaysOnEnabledForEnvironment:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __99__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetAlwaysOnEnabledForEnvironment___block_invoke;
  v8[3] = &unk_264532C98;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);
}

void __99__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetAlwaysOnEnabledForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetAlwaysOnEnabledForEnvironment:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)hostEnvironment:(id)a3 hostDidSetLiveUpdating:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetLiveUpdating___block_invoke;
  v8[3] = &unk_264532C98;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);
}

void __82__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetLiveUpdating___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetLiveUpdating:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __98__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke;
  v8[3] = &unk_264532C98;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);
}

void __98__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetUnrestrictedFramerateUpdates:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)hostEnvironment:(id)a3 hostDidSet1HzFlipbook:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSet1HzFlipbook___block_invoke;
  v8[3] = &unk_264532C98;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);
}

void __81__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSet1HzFlipbook___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSet1HzFlipbook:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)hostEnvironment:(id)a3 hostDidSetCacheFlipbookOnDisplayWake:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetCacheFlipbookOnDisplayWake___block_invoke;
  v8[3] = &unk_264532C98;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  -[BLSHBacklightInactiveEnvironmentSession notifyEnvironmentObserversWithBlock:]((uint64_t)self, v8);
}

void __96__BLSHBacklightInactiveEnvironmentSession_hostEnvironment_hostDidSetCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hostEnvironment:*(void *)(a1 + 32) hostDidSetCacheFlipbookOnDisplayWake:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  return self->_presentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_environmentObservers, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)initWithPresentation:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setPresentation:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end