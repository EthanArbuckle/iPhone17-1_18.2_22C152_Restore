@interface EDUpdateThrottler
+ (EFLocked)instances;
+ (void)_registerInstance:(id)a3;
+ (void)resetAllInstances;
- (BOOL)hasChangesSinceLastUpdate;
- (EDResumable)resumable;
- (EDUpdateThrottler)initWithDelayInterval:(double)a3 scalingFactor:(int64_t)a4;
- (EDUpdateThrottler)initWithName:(id)a3 delayInterval:(double)a4 resumable:(id)a5;
- (EDUpdateThrottler)initWithName:(id)a3 delayInterval:(double)a4 scalingFactor:(int64_t)a5;
- (EFDebouncer)resumeClientDebouncer;
- (EFScheduler)resumeClientScheduler;
- (NSDate)lastAcknowledgementDate;
- (NSDate)lastUpdateDate;
- (NSString)name;
- (double)delayInterval;
- (id)updateWithBlock:(id)a3 unacknowledgedUpdatesCount:(unint64_t *)a4;
- (int64_t)scalingFactor;
- (int64_t)updateCounter;
- (unint64_t)unacknowledgedUpdatesCountAndTimeSinceLastAcknowledgement:(double *)a3;
- (void)_reset;
- (void)dealloc;
- (void)setHasChangesSinceLastUpdate:(BOOL)a3;
- (void)setLastAcknowledgementDate:(id)a3;
- (void)setLastUpdateDate:(id)a3;
- (void)setResumable:(id)a3;
- (void)setResumeClientDebouncer:(id)a3;
- (void)setResumeClientScheduler:(id)a3;
- (void)setUpdateCounter:(int64_t)a3;
@end

@implementation EDUpdateThrottler

void __64__EDUpdateThrottler_updateWithBlock_unacknowledgedUpdatesCount___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (os_unfair_lock_s *)(WeakRetained + 8);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    [*((id *)WeakRetained + 2) removeObject:v2];
    if ([*((id *)WeakRetained + 2) count])
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      [WeakRetained setLastAcknowledgementDate:v4];

      os_unfair_lock_unlock(v3);
    }
    else
    {
      [WeakRetained setLastAcknowledgementDate:0];
      [WeakRetained hasChangesSinceLastUpdate];
      os_unfair_lock_unlock(v3);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)setLastAcknowledgementDate:(id)a3
{
}

- (BOOL)hasChangesSinceLastUpdate
{
  return self->_hasChangesSinceLastUpdate;
}

uint64_t __39__EDUpdateThrottler__registerInstance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (EDUpdateThrottler)initWithName:(id)a3 delayInterval:(double)a4 scalingFactor:(int64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EDUpdateThrottler;
  v9 = [(EDUpdateThrottler *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v9->_delayInterval = a4;
    v9->_scalingFactor = a5;
    v9->_updatesLock._os_unfair_lock_opaque = 0;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unacknowledgedUpdates = v9->_unacknowledgedUpdates;
    v9->_unacknowledgedUpdates = v12;

    [(id)objc_opt_class() _registerInstance:v9];
  }

  return v9;
}

void __38__EDUpdateThrottler_resetAllInstances__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 setRepresentation];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)resetAllInstances
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__47;
  v16 = __Block_byref_object_dispose__47;
  id v17 = 0;
  id v2 = [a1 instances];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__EDUpdateThrottler_resetAllInstances__block_invoke;
  v11[3] = &unk_1E6C078F0;
  v11[4] = &v12;
  [v2 performWhileLocked:v11];

  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)v13[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_reset", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_reset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_updatesLock = &self->_updatesLock;
  os_unfair_lock_lock(&self->_updatesLock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_unacknowledgedUpdates copy];
  os_unfair_lock_unlock(p_updatesLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "invoke", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (void)_registerInstance:(id)a3
{
  id v4 = a3;
  id v5 = [a1 instances];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__EDUpdateThrottler__registerInstance___block_invoke;
  v7[3] = &unk_1E6C04D18;
  id v6 = v4;
  id v8 = v6;
  [v5 performWhileLocked:v7];
}

+ (EFLocked)instances
{
  if (instances_onceToken != -1) {
    dispatch_once(&instances_onceToken, &__block_literal_global_89);
  }
  id v2 = (void *)instances_instances;

  return (EFLocked *)v2;
}

- (id)updateWithBlock:(id)a3 unacknowledgedUpdatesCount:(unint64_t *)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_updatesLock);
  unint64_t v7 = [(NSMutableArray *)self->_unacknowledgedUpdates count];
  if (v7)
  {
    [(EDUpdateThrottler *)self delayInterval];
    double v9 = v8 * pow((double)[(EDUpdateThrottler *)self scalingFactor], (double)v7 + -1.0);
  }
  else
  {
    double v9 = 0.0;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  long long v11 = [(EDUpdateThrottler *)self lastUpdateDate];
  objc_msgSend(v10, "ef_timeIntervalSinceDate:", v11);
  double v13 = v12;

  if (v13 >= v9)
  {
    objc_super v15 = [(EDUpdateThrottler *)self name];

    if (v15)
    {
      id v16 = [NSString alloc];
      id v17 = [(EDUpdateThrottler *)self name];
      int64_t v18 = [(EDUpdateThrottler *)self updateCounter];
      [(EDUpdateThrottler *)self setUpdateCounter:v18 + 1];
      uint64_t v19 = (void *)[v16 initWithFormat:@"%@ %ld", v17, v18];
    }
    else
    {
      id v20 = [NSString alloc];
      int64_t v21 = [(EDUpdateThrottler *)self updateCounter];
      [(EDUpdateThrottler *)self setUpdateCounter:v21 + 1];
      uint64_t v19 = objc_msgSend(v20, "initWithFormat:", @"%ld", v21);
    }
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F60D80]) initWithLabel:v19];
    [(NSMutableArray *)self->_unacknowledgedUpdates addObject:v14];
    [(EDUpdateThrottler *)self setLastUpdateDate:v10];
    [(EDUpdateThrottler *)self setHasChangesSinceLastUpdate:0];
    v22 = [(EDUpdateThrottler *)self resumeClientDebouncer];
    v23 = [MEMORY[0x1E4F1CA98] null];
    [v22 debounceResult:v23];
  }
  else
  {
    [(EDUpdateThrottler *)self setHasChangesSinceLastUpdate:1];
    uint64_t v14 = 0;
  }

  os_unfair_lock_unlock(&self->_updatesLock);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v14);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__EDUpdateThrottler_updateWithBlock_unacknowledgedUpdatesCount___block_invoke;
  v26[3] = &unk_1E6C07940;
  objc_copyWeak(&v28, &location);
  objc_copyWeak(&v29, &from);
  id v24 = v6;
  id v27 = v24;
  [v14 addInvocationBlock:v26];
  if (a4) {
    *a4 = v7;
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)updateCounter
{
  return self->_updateCounter;
}

- (void)setUpdateCounter:(int64_t)a3
{
  self->_updateCounter = a3;
}

- (void)setLastUpdateDate:(id)a3
{
}

- (void)setHasChangesSinceLastUpdate:(BOOL)a3
{
  self->_hasChangesSinceLastUpdate = a3;
}

- (EFDebouncer)resumeClientDebouncer
{
  return self->_resumeClientDebouncer;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (EDUpdateThrottler)initWithName:(id)a3 delayInterval:(double)a4 resumable:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(EDUpdateThrottler *)self initWithDelayInterval:1 scalingFactor:a4];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    objc_storeStrong((id *)&v10->_resumable, a5);
    uint64_t v13 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.EmailDaemon.EDUpdateThrotller.resumeClientScheduler"];
    resumeClientScheduler = v10->_resumeClientScheduler;
    v10->_resumeClientScheduler = (EFScheduler *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F60D50]);
    id v16 = v10->_resumeClientScheduler;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__EDUpdateThrottler_initWithName_delayInterval_resumable___block_invoke;
    v20[3] = &unk_1E6C07918;
    id v21 = v9;
    uint64_t v17 = [v15 initWithTimeInterval:v16 scheduler:0 startAfter:v20 block:a4];
    resumeClientDebouncer = v10->_resumeClientDebouncer;
    v10->_resumeClientDebouncer = (EFDebouncer *)v17;
  }
  return v10;
}

- (EDUpdateThrottler)initWithDelayInterval:(double)a3 scalingFactor:(int64_t)a4
{
  return [(EDUpdateThrottler *)self initWithName:0 delayInterval:a4 scalingFactor:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeClientScheduler, 0);
  objc_storeStrong((id *)&self->_resumeClientDebouncer, 0);
  objc_storeStrong((id *)&self->_resumable, 0);
  objc_storeStrong((id *)&self->_lastAcknowledgementDate, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_unacknowledgedUpdates, 0);
}

- (void)dealloc
{
  [(EFDebouncer *)self->_resumeClientDebouncer cancel];
  v3.receiver = self;
  v3.super_class = (Class)EDUpdateThrottler;
  [(EDUpdateThrottler *)&v3 dealloc];
}

void __30__EDUpdateThrottler_instances__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F60DA0]);
  id v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t v1 = objc_msgSend(v0, "initWithObject:");
  id v2 = (void *)instances_instances;
  instances_instances = v1;
}

uint64_t __58__EDUpdateThrottler_initWithName_delayInterval_resumable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeForUpdates];
}

- (unint64_t)unacknowledgedUpdatesCountAndTimeSinceLastAcknowledgement:(double *)a3
{
  p_updatesLock = &self->_updatesLock;
  os_unfair_lock_lock(&self->_updatesLock);
  unint64_t v6 = [(NSMutableArray *)self->_unacknowledgedUpdates count];
  unint64_t v7 = [(EDUpdateThrottler *)self lastAcknowledgementDate];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(EDUpdateThrottler *)self lastUpdateDate];
  }
  id v10 = v9;

  os_unfair_lock_unlock(p_updatesLock);
  if (a3)
  {
    if (v6)
    {
      [v10 timeIntervalSinceNow];
      double v12 = -v11;
    }
    else
    {
      double v12 = 0.0;
    }
    *a3 = v12;
  }

  return v6;
}

- (double)delayInterval
{
  return self->_delayInterval;
}

- (int64_t)scalingFactor
{
  return self->_scalingFactor;
}

- (NSDate)lastAcknowledgementDate
{
  return self->_lastAcknowledgementDate;
}

- (EDResumable)resumable
{
  return self->_resumable;
}

- (void)setResumable:(id)a3
{
}

- (void)setResumeClientDebouncer:(id)a3
{
}

- (EFScheduler)resumeClientScheduler
{
  return self->_resumeClientScheduler;
}

- (void)setResumeClientScheduler:(id)a3
{
}

@end