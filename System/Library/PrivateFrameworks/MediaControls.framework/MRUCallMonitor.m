@interface MRUCallMonitor
+ (MRUCallMonitor)sharedMonitor;
- (BOOL)isCallActive;
- (BOOL)isOnCall;
- (CXCallObserver)callObserver;
- (MRUCallMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCallObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOnCall:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)updateOnCall;
@end

@implementation MRUCallMonitor

+ (MRUCallMonitor)sharedMonitor
{
  if (sharedMonitor___once != -1) {
    dispatch_once(&sharedMonitor___once, &__block_literal_global_42);
  }
  v2 = (void *)sharedMonitor___sharedMonitor;

  return (MRUCallMonitor *)v2;
}

void __31__MRUCallMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(MRUCallMonitor);
  v1 = (void *)sharedMonitor___sharedMonitor;
  sharedMonitor___sharedMonitor = (uint64_t)v0;
}

- (MRUCallMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRUCallMonitor;
  v2 = [(MRUCallMonitor *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.amp.MediaRemote.UI.MRUCallMonitor.shared", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E4F19198]);
    callObserver = v2->_callObserver;
    v2->_callObserver = v8;

    [(CXCallObserver *)v2->_callObserver setDelegate:v2 queue:v2->_queue];
    [(MRUCallMonitor *)v2 updateOnCall];
  }
  return v2;
}

- (BOOL)isCallActive
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CXCallObserver *)self->_callObserver calls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) hasEnded])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setOnCall:(BOOL)a3
{
  if (self->_onCall != a3)
  {
    self->_onCall = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __28__MRUCallMonitor_setOnCall___block_invoke;
    v3[3] = &unk_1E5F0D8C0;
    v3[4] = self;
    BOOL v4 = a3;
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

void __28__MRUCallMonitor_setOnCall___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) callMonitorDidUpdateOnCall:*(void *)(a1 + 32) isOnCall:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)updateOnCall
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MRUCallMonitor_updateOnCall__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__MRUCallMonitor_updateOnCall__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isCallActive];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setOnCall:v2];
}

- (BOOL)isOnCall
{
  return self->_onCall;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end