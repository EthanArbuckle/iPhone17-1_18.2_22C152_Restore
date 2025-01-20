@interface AFPineBoardSystemStateObserver
+ (id)defaultObserver;
- (AFPineBoardSystemStateObserver)initWithQueue:(id)a3;
- (int64_t)pineBoardSystemState;
- (void)_beginGroup;
- (void)_endGroup;
- (void)_handlePineBoardStateChange:(int64_t)a3;
- (void)_startObservingPineBoardSystemState;
- (void)addListener:(id)a3;
- (void)removeListener:(id)a3;
@end

@implementation AFPineBoardSystemStateObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_pineBoardStateGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (int64_t)pineBoardSystemState
{
  return self->_pineBoardSystemState;
}

- (void)_endGroup
{
  p_pineBoardStateGroup = &self->_pineBoardStateGroup;
  pineBoardStateGroup = self->_pineBoardStateGroup;
  self->_pineBoardStateGroupDepth = (int64_t)p_pineBoardStateGroup[1] - 1;
  dispatch_group_leave(pineBoardStateGroup);
  if (!self->_pineBoardStateGroupDepth)
  {
    v5 = self->_pineBoardStateGroup;
    self->_pineBoardStateGroup = 0;
  }
}

- (void)_beginGroup
{
  pineBoardStateGroup = self->_pineBoardStateGroup;
  if (!pineBoardStateGroup)
  {
    v4 = (OS_dispatch_group *)dispatch_group_create();
    v5 = self->_pineBoardStateGroup;
    self->_pineBoardStateGroup = v4;

    pineBoardStateGroup = self->_pineBoardStateGroup;
  }
  dispatch_group_enter(pineBoardStateGroup);
  ++self->_pineBoardStateGroupDepth;
}

- (void)_handlePineBoardStateChange:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t pineBoardSystemState = self->_pineBoardSystemState;
  if (pineBoardSystemState != a3)
  {
    self->_int64_t pineBoardSystemState = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = self->_listeners;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v11, "pineBoardSystemStateObserver:pineBoardStateDidChangeFrom:to:", self, pineBoardSystemState, self->_pineBoardSystemState, (void)v12);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_startObservingPineBoardSystemState
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[AFPineBoardSystemStateObserver _startObservingPineBoardSystemState]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
    v2 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[AFPineBoardSystemStateObserver _startObservingPineBoardSystemState]";
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s PineBoard is not available", (uint8_t *)&v3, 0xCu);
  }
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__AFPineBoardSystemStateObserver_removeListener___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __49__AFPineBoardSystemStateObserver_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__AFPineBoardSystemStateObserver_addListener___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __46__AFPineBoardSystemStateObserver_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

- (AFPineBoardSystemStateObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFPineBoardSystemStateObserver;
  v6 = [(AFPineBoardSystemStateObserver *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_pineBoardStateGroupDepth = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    listeners = v7->_listeners;
    v7->_listeners = (NSHashTable *)v8;

    [(AFPineBoardSystemStateObserver *)v7 _beginGroup];
    queue = v7->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AFPineBoardSystemStateObserver_initWithQueue___block_invoke;
    block[3] = &unk_1E592C678;
    long long v13 = v7;
    dispatch_async(queue, block);
  }
  return v7;
}

uint64_t __48__AFPineBoardSystemStateObserver_initWithQueue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startObservingPineBoardSystemState];
  v2 = *(void **)(a1 + 32);
  return [v2 _endGroup];
}

+ (id)defaultObserver
{
  if (defaultObserver_onceToken != -1) {
    dispatch_once(&defaultObserver_onceToken, &__block_literal_global_20994);
  }
  v2 = (void *)defaultObserver_defaultObserver;
  return v2;
}

void __49__AFPineBoardSystemStateObserver_defaultObserver__block_invoke()
{
  v0 = [AFPineBoardSystemStateObserver alloc];
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v5 = dispatch_queue_create("AFPineBoardSystemStateObserver.defaultObserver", v2);
  uint64_t v3 = [(AFPineBoardSystemStateObserver *)v0 initWithQueue:v5];
  id v4 = (void *)defaultObserver_defaultObserver;
  defaultObserver_defaultObserver = v3;
}

@end