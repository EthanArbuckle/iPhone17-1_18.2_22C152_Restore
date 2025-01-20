@interface AKLiveValue
+ (id)liveValueWithAsyncProducer:(id)a3;
+ (id)liveValueWithSyncProducer:(id)a3;
- (AKLiveValue)init;
- (AKLiveValue)initWithAsyncProducer:(id)a3;
- (AKLiveValue)initWithSyncProducer:(id)a3;
- (id)captureCurrentValue;
- (id)newTrigger;
- (id)newTriggerWithCleanup:(id)a3;
- (void)_onqueue_updateValue;
- (void)_setValue:(id)a3;
- (void)_updateValue;
- (void)dealloc;
@end

@implementation AKLiveValue

- (AKLiveValue)init
{
  v8.receiver = self;
  v8.super_class = (Class)AKLiveValue;
  v2 = [(AKLiveValue *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.akd.live-value", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    cleanupBlocks = v2->_cleanupBlocks;
    v2->_cleanupBlocks = (NSMutableArray *)v5;
  }
  return v2;
}

- (AKLiveValue)initWithSyncProducer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AKLiveValue *)self init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1996FE880](v4);
    id syncProducer = v5->_syncProducer;
    v5->_id syncProducer = (id)v6;

    [(AKLiveValue *)v5 _updateValue];
  }

  return v5;
}

- (AKLiveValue)initWithAsyncProducer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AKLiveValue *)self init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1996FE880](v4);
    aid syncProducer = v5->_asyncProducer;
    v5->_aid syncProducer = (id)v6;

    [(AKLiveValue *)v5 _updateValue];
  }

  return v5;
}

+ (id)liveValueWithSyncProducer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithSyncProducer:v4];

  return v5;
}

+ (id)liveValueWithAsyncProducer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithAsyncProducer:v4];

  return v5;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cleanupBlocks = self->_cleanupBlocks;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __22__AKLiveValue_dealloc__block_invoke;
  v6[3] = &unk_1E57626F0;
  v6[4] = self;
  [(NSMutableArray *)cleanupBlocks enumerateObjectsUsingBlock:v6];
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)AKLiveValue;
  [(AKLiveValue *)&v5 dealloc];
}

uint64_t __22__AKLiveValue_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (id)newTrigger
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__AKLiveValue_newTrigger__block_invoke;
  v4[3] = &unk_1E575EA98;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1996FE880](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __25__AKLiveValue_newTrigger__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateValue];
}

- (id)newTriggerWithCleanup:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  cleanupBlocks = self->_cleanupBlocks;
  v7 = (void *)MEMORY[0x1996FE880](v5);

  [(NSMutableArray *)cleanupBlocks addObject:v7];
  os_unfair_lock_unlock(p_lock);

  return [(AKLiveValue *)self newTrigger];
}

- (id)captureCurrentValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_value;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_updateValue
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AKLiveValue__updateValue__block_invoke;
  block[3] = &unk_1E575EA70;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__AKLiveValue__updateValue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateValue");
}

- (void)_onqueue_updateValue
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_193494000, a2, OS_LOG_TYPE_FAULT, "%@: Expected nonnull sync or async producer", (uint8_t *)&v2, 0xCu);
}

void __35__AKLiveValue__onqueue_updateValue__block_invoke(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setValue:v3];
}

- (void)_setValue:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id value = self->_value;
  self->_id value = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupBlocks, 0);
  objc_storeStrong(&self->_asyncProducer, 0);
  objc_storeStrong(&self->_syncProducer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_value, 0);
}

@end