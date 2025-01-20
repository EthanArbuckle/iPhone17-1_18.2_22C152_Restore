@interface CESRSpeechProfileResourceMonitor
+ (id)sharedMonitor;
- (CESRSpeechProfileResourceMonitor)init;
- (NSHashTable)observers;
- (id)_initWithQueue:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CESRSpeechProfileResourceMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CESRSpeechProfileResourceMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E61C3C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __51__CESRSpeechProfileResourceMonitor_removeObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) observers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    v5 = *(void **)(a1 + 32);
    [v5 _stopSession];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CESRSpeechProfileResourceMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E61C3C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__CESRSpeechProfileResourceMonitor_addObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) observers];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    [*(id *)(a1 + 32) _registerLaunchOnDemand];
    v5 = *(void **)(a1 + 32);
    [v5 _startSession];
  }
}

- (id)_initWithQueue:(id)a3
{
  return 0;
}

- (CESRSpeechProfileResourceMonitor)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

+ (id)sharedMonitor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CESRSpeechProfileResourceMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, block);
  }
  id v2 = (void *)sharedMonitor_sharedMonitor;

  return v2;
}

void __49__CESRSpeechProfileResourceMonitor_sharedMonitor__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = objc_claimAutoreleasedReturnValue();
  id v2 = (const char *)[v1 cStringUsingEncoding:4];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v7 = dispatch_queue_create(v2, v4);

  id v5 = [[CESRSpeechProfileResourceMonitor alloc] _initWithQueue:v7];
  id v6 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v5;
}

@end