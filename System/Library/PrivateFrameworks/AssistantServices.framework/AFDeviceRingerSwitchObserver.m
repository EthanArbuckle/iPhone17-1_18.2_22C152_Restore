@interface AFDeviceRingerSwitchObserver
+ (id)sharedObserver;
- (AFDeviceRingerSwitchObserver)init;
- (int64_t)state;
- (void)_updateStateWithNotifyState:(unint64_t)a3;
- (void)addListener:(id)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)removeListener:(id)a3;
@end

@implementation AFDeviceRingerSwitchObserver

- (int64_t)state
{
  if (!self->_isActive) {
    return 0;
  }
  if ([(AFNotifyObserver *)self->_notifyObserver state]) {
    return 1;
  }
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_updateStateWithNotifyState:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_listeners;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "deviceRingerObserver:didChangeState:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  if (self->_notifyObserver == a3) {
    -[AFDeviceRingerSwitchObserver _updateStateWithNotifyState:](self, "_updateStateWithNotifyState:", a5, a4);
  }
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_isActive)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__AFDeviceRingerSwitchObserver_removeListener___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __47__AFDeviceRingerSwitchObserver_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_isActive)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__AFDeviceRingerSwitchObserver_addListener___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __44__AFDeviceRingerSwitchObserver_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (AFDeviceRingerSwitchObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)AFDeviceRingerSwitchObserver;
  v2 = [(AFDeviceRingerSwitchObserver *)&v12 init];
  if (v2)
  {
    if (AFHasRingerSwitch()) {
      goto LABEL_6;
    }
    if (AFIsPad_onceToken != -1) {
      dispatch_once(&AFIsPad_onceToken, &__block_literal_global_208);
    }
    if (AFIsPad_isPad)
    {
LABEL_6:
      v2->_isActive = 1;
LABEL_7:
      v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v4 = dispatch_queue_create("AFDeviceRingerSwitchObserver", v3);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v4;

      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
      listeners = v2->_listeners;
      v2->_listeners = (NSHashTable *)v6;

      id v8 = [[AFNotifyObserver alloc] initWithName:@"com.apple.springboard.ringerstate" options:1 queue:v2->_queue delegate:v2];
      notifyObserver = v2->_notifyObserver;
      v2->_notifyObserver = v8;

      return v2;
    }
    if (AFIsIPod_onceToken != -1) {
      dispatch_once(&AFIsIPod_onceToken, &__block_literal_global_213);
    }
    int v11 = AFIsIPod_isIPod;
    v2->_isActive = AFIsIPod_isIPod;
    if (v11) {
      goto LABEL_7;
    }
  }
  return v2;
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken_31029 != -1) {
    dispatch_once(&sharedObserver_onceToken_31029, &__block_literal_global_31030);
  }
  v2 = (void *)sharedObserver_sharedObserver_31031;
  return v2;
}

void __46__AFDeviceRingerSwitchObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(AFDeviceRingerSwitchObserver);
  v1 = (void *)sharedObserver_sharedObserver_31031;
  sharedObserver_sharedObserver_31031 = (uint64_t)v0;
}

@end