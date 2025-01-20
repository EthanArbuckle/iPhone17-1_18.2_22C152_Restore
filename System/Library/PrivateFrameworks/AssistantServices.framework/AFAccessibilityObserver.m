@interface AFAccessibilityObserver
+ (id)sharedObserver;
- (AFAccessibilityObserver)init;
- (AFAccessibilityState)state;
- (BOOL)_fetchIsVibrationDisabled;
- (BOOL)_fetchIsVoiceOverTouchEnabled;
- (id)currentState;
- (void)_setState:(id)a3 clearDirtyFlags:(unint64_t)a4;
- (void)_updateVibrationDisabledPreference;
- (void)_updateVoiceOverTouchEnabledPreference;
- (void)addListener:(id)a3;
- (void)getStateWithCompletion:(id)a3;
- (void)removeListener:(id)a3;
- (void)vibrationDisabledPreferenceDidChange:(id)a3;
- (void)voiceOverTouchEnabledPreferenceDidChange:(id)a3;
@end

@implementation AFAccessibilityObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_setState:(id)a3 clearDirtyFlags:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v7 = (AFAccessibilityState *)a3;
  state = self->_state;
  if (state != v7 && ![(AFAccessibilityState *)state isEqual:v7])
  {
    v9 = self->_state;
    v17 = v7;
    v10 = v7;
    os_unfair_lock_lock(&self->_stateLock);
    objc_storeStrong((id *)&self->_state, a3);
    self->_stateDirtyFlags &= ~a4;
    os_unfair_lock_unlock(&self->_stateLock);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v11 = [(NSHashTable *)self->_listeners setRepresentation];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 accessibilityObserver:self stateDidChangeFrom:v9 to:v10];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    v7 = v17;
  }
}

- (void)_updateVibrationDisabledPreference
{
  if (AFSupportsVibration())
  {
    BOOL v3 = [(AFAccessibilityObserver *)self _fetchIsVibrationDisabled];
    state = self->_state;
    if (state)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __61__AFAccessibilityObserver__updateVibrationDisabledPreference__block_invoke;
      v9[3] = &__block_descriptor_33_e40_v16__0___AFAccessibilityStateMutating__8l;
      BOOL v10 = v3;
      id v5 = [(AFAccessibilityState *)state mutatedCopyWithMutator:v9];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __61__AFAccessibilityObserver__updateVibrationDisabledPreference__block_invoke_2;
      v7[3] = &__block_descriptor_33_e40_v16__0___AFAccessibilityStateMutating__8l;
      BOOL v8 = v3;
      id v5 = +[AFAccessibilityState newWithBuilder:v7];
    }
    v6 = v5;
    [(AFAccessibilityObserver *)self _setState:v5 clearDirtyFlags:2];
  }
}

uint64_t __61__AFAccessibilityObserver__updateVibrationDisabledPreference__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setIsVibrationDisabled:v2];
}

uint64_t __61__AFAccessibilityObserver__updateVibrationDisabledPreference__block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setIsVibrationDisabled:v2];
}

- (void)_updateVoiceOverTouchEnabledPreference
{
  BOOL v3 = [(AFAccessibilityObserver *)self _fetchIsVoiceOverTouchEnabled];
  state = self->_state;
  if (state)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__AFAccessibilityObserver__updateVoiceOverTouchEnabledPreference__block_invoke;
    v9[3] = &__block_descriptor_33_e40_v16__0___AFAccessibilityStateMutating__8l;
    BOOL v10 = v3;
    id v5 = [(AFAccessibilityState *)state mutatedCopyWithMutator:v9];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__AFAccessibilityObserver__updateVoiceOverTouchEnabledPreference__block_invoke_2;
    v7[3] = &__block_descriptor_33_e40_v16__0___AFAccessibilityStateMutating__8l;
    BOOL v8 = v3;
    id v5 = +[AFAccessibilityState newWithBuilder:v7];
  }
  v6 = v5;
  [(AFAccessibilityObserver *)self _setState:v5 clearDirtyFlags:1];
}

uint64_t __65__AFAccessibilityObserver__updateVoiceOverTouchEnabledPreference__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setIsVoiceOverTouchEnabled:v2];
}

uint64_t __65__AFAccessibilityObserver__updateVoiceOverTouchEnabledPreference__block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setIsVoiceOverTouchEnabled:v2];
}

- (BOOL)_fetchIsVibrationDisabled
{
  BOOL v2 = AFSupportsVibration();
  if (v2) {
    LOBYTE(v2) = softLink_AXSVibrationDisabled() != 0;
  }
  return v2;
}

- (BOOL)_fetchIsVoiceOverTouchEnabled
{
  return softLink_AXSVoiceOverTouchEnabled() != 0;
}

- (void)vibrationDisabledPreferenceDidChange:(id)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_stateDirtyFlags |= 2uLL;
  os_unfair_lock_unlock(p_stateLock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AFAccessibilityObserver_vibrationDisabledPreferenceDidChange___block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__AFAccessibilityObserver_vibrationDisabledPreferenceDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVibrationDisabledPreference];
}

- (void)voiceOverTouchEnabledPreferenceDidChange:(id)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_stateDirtyFlags |= 1uLL;
  os_unfair_lock_unlock(p_stateLock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AFAccessibilityObserver_voiceOverTouchEnabledPreferenceDidChange___block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __68__AFAccessibilityObserver_voiceOverTouchEnabledPreferenceDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVoiceOverTouchEnabledPreference];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__AFAccessibilityObserver_removeListener___block_invoke;
    v7[3] = &unk_1E592C710;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __42__AFAccessibilityObserver_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__AFAccessibilityObserver_addListener___block_invoke;
    v7[3] = &unk_1E592C710;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __39__AFAccessibilityObserver_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

- (void)getStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__AFAccessibilityObserver_getStateWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __50__AFAccessibilityObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 24));
}

- (AFAccessibilityState)state
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__48386;
  BOOL v10 = __Block_byref_object_dispose__48387;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AFAccessibilityObserver_state__block_invoke;
  v5[3] = &unk_1E592C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AFAccessibilityState *)v3;
}

void __32__AFAccessibilityObserver_state__block_invoke(uint64_t a1)
{
}

- (id)currentState
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = (void *)[(AFAccessibilityState *)self->_state copy];
  unint64_t stateDirtyFlags = self->_stateDirtyFlags;
  os_unfair_lock_unlock(p_stateLock);
  if (stateDirtyFlags)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__AFAccessibilityObserver_currentState__block_invoke;
    v9[3] = &__block_descriptor_40_e40_v16__0___AFAccessibilityStateMutating__8l;
    void v9[4] = stateDirtyFlags;
    id v6 = [v4 mutatedCopyWithMutator:v9];
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;

  return v7;
}

void __39__AFAccessibilityObserver_currentState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  if (v4)
  {
    [v3 setIsVoiceOverTouchEnabled:0];
    id v3 = v5;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if ((v4 & 2) != 0)
  {
    [v5 setIsVibrationDisabled:0];
    id v3 = v5;
  }
}

- (AFAccessibilityObserver)init
{
  v15.receiver = self;
  v15.super_class = (Class)AFAccessibilityObserver;
  BOOL v2 = [(AFAccessibilityObserver *)&v15 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("AFAccessibilityObserver", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_stateLock._os_unfair_lock_opaque = 0;
    v7 = +[AFAccessibilityState newWithBuilder:&__block_literal_global_5_48392];
    state = v2->_state;
    v2->_state = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v9;

    id v11 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__AFAccessibilityObserver_init__block_invoke_2;
    block[3] = &unk_1E592C678;
    uint64_t v14 = v2;
    dispatch_async(v11, block);
  }
  return v2;
}

void __31__AFAccessibilityObserver_init__block_invoke_2(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = getkAXSVoiceOverTouchEnabledNotification();
  if (v3) {
    [v2 addObserver:*(void *)(a1 + 32) selector:sel_voiceOverTouchEnabledPreferenceDidChange_ name:v3 object:0];
  }
  if (AFSupportsVibration())
  {
    uint64_t v4 = getkAXSVibrationDisabledPreferenceDidChangeNotification();
    if (v4) {
      [v2 addObserver:*(void *)(a1 + 32) selector:sel_vibrationDisabledPreferenceDidChange_ name:v4 object:0];
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__AFAccessibilityObserver_init__block_invoke_3;
  v6[3] = &unk_1E592C650;
  id v7 = *(id *)(a1 + 32);
  id v5 = +[AFAccessibilityState newWithBuilder:v6];
  [*(id *)(a1 + 32) _setState:v5 clearDirtyFlags:3];
}

void __31__AFAccessibilityObserver_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  if ([v3 _fetchIsVoiceOverTouchEnabled]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v6 setIsVoiceOverTouchEnabled:v4];
  if ([*(id *)(a1 + 32) _fetchIsVibrationDisabled]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v6 setIsVibrationDisabled:v5];
}

void __31__AFAccessibilityObserver_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsVoiceOverTouchEnabled:0];
  [v2 setIsVibrationDisabled:0];
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken_48404 != -1) {
    dispatch_once(&sharedObserver_onceToken_48404, &__block_literal_global_48405);
  }
  id v2 = (void *)sharedObserver_sharedObserver_48406;
  return v2;
}

void __41__AFAccessibilityObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(AFAccessibilityObserver);
  v1 = (void *)sharedObserver_sharedObserver_48406;
  sharedObserver_sharedObserver_48406 = (uint64_t)v0;
}

@end