@interface HMDEventCounterGroup
- (BOOL)_resetEventCounterForEventName:(id)a3;
- (HMDEventCounterContext)context;
- (HMDEventCounterGroup)initWithContext:(id)a3 serializedEventCounters:(id)a4;
- (HMDEventCounterGroup)initWithContext:(id)a3 serializedEventCounters:(id)a4 uptimeProvider:(id)a5;
- (HMMUptimeProvider)uptimeProvider;
- (NSDictionary)eventCounters;
- (double)durationForCounter:(id)a3;
- (id)_getOrCreateEventCounterForEventName:(id)a3;
- (unint64_t)fetchEventCounterForEventName:(id)a3;
- (unint64_t)maxCounterName:(id *)a3;
- (unint64_t)summedEventCounters;
- (void)_incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4;
- (void)addDuration:(double)a3 toCounter:(id)a4;
- (void)addObserver:(id)a3 forEventName:(id)a4;
- (void)addValue:(unint64_t)a3 toStatisticsName:(id)a4;
- (void)forceSave;
- (void)incrementEventCounterForEventName:(id)a3;
- (void)incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4;
- (void)pauseDurationCounter:(id)a3;
- (void)resetEventCounters;
- (void)resumeDurationCounter:(id)a3;
- (void)updateAllDurationCounters;
- (void)updateDurationCounter:(id)a3;
@end

@implementation HMDEventCounterGroup

- (void)incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4
{
  [(HMDEventCounterGroup *)self _incrementEventCounterForEventName:a3 withValue:a4];
  id v5 = [(HMDEventCounterGroup *)self context];
  [v5 counterChanged];
}

- (HMDEventCounterContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDEventCounterContext *)WeakRetained;
}

- (void)_incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8 = [(HMDEventCounterGroup *)self _getOrCreateEventCounterForEventName:v6];
  objc_msgSend(v8, "setCount:", objc_msgSend(v8, "count") + a4);
  v9 = [v8 observers];
  if (v9)
  {
    uint64_t v10 = [v8 count];
    uint64_t v11 = [v8 count];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    v13 = [WeakRetained workQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__HMDEventCounterGroup__incrementEventCounterForEventName_withValue___block_invoke;
    v14[3] = &unk_1E6A15460;
    id v15 = v9;
    id v16 = v6;
    unint64_t v17 = v10 - a4;
    uint64_t v18 = v11;
    dispatch_async(v13, v14);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_getOrCreateEventCounterForEventName:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_mutableEventCounters objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(HMDEventCounter);
    mutableEventCounters = self->_mutableEventCounters;
    if (!mutableEventCounters)
    {
      v7 = [MEMORY[0x1E4F1CA60] dictionary];
      v8 = self->_mutableEventCounters;
      self->_mutableEventCounters = v7;

      mutableEventCounters = self->_mutableEventCounters;
    }
    [(NSMutableDictionary *)mutableEventCounters setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (void)incrementEventCounterForEventName:(id)a3
{
}

- (HMDEventCounterGroup)initWithContext:(id)a3 serializedEventCounters:(id)a4 uptimeProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDEventCounterGroup;
  uint64_t v11 = [(HMDEventCounterGroup *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_context, v8);
    objc_storeStrong((id *)&v12->_uptimeProvider, a5);
    if ([v9 count])
    {
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
      mutableEventCounters = v12->_mutableEventCounters;
      v12->_mutableEventCounters = (NSMutableDictionary *)v13;

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__HMDEventCounterGroup_initWithContext_serializedEventCounters_uptimeProvider___block_invoke;
      v17[3] = &unk_1E6A0D988;
      uint64_t v18 = v12;
      [v9 enumerateKeysAndObjectsUsingBlock:v17];
      if (![(NSMutableDictionary *)v12->_mutableEventCounters count])
      {
        id v15 = v12->_mutableEventCounters;
        v12->_mutableEventCounters = 0;
      }
    }
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uptimeProvider, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_runningDurationCounters, 0);
  objc_storeStrong((id *)&self->_mutableEventCounters, 0);
}

- (HMMUptimeProvider)uptimeProvider
{
  return self->_uptimeProvider;
}

- (void)forceSave
{
  id v2 = [(HMDEventCounterGroup *)self context];
  [v2 forceSave];
}

- (void)resetEventCounters
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(NSMutableDictionary *)self->_mutableEventCounters allKeys];
  int v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v5 |= [(HMDEventCounterGroup *)self _resetEventCounterForEventName:*(void *)(*((void *)&v21 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  id v9 = NSNumber;
  id v10 = [(HMDEventCounterGroup *)self uptimeProvider];
  [v10 uptime];
  uint64_t v11 = objc_msgSend(v9, "numberWithDouble:");

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = [(NSMutableDictionary *)self->_runningDurationCounters allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        [(NSMutableDictionary *)self->_runningDurationCounters setObject:v11 forKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(p_lock);
  if (v5)
  {
    id v16 = [(HMDEventCounterGroup *)self context];
    [v16 counterChanged];
  }
}

- (BOOL)_resetEventCounterForEventName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  int v5 = [(NSMutableDictionary *)self->_mutableEventCounters objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5 && (uint64_t v7 = [v5 count], objc_msgSend(v6, "setCount:", 0), v7))
  {
    uint64_t v8 = [v6 observers];
    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
      id v10 = [WeakRetained workQueue];

      if (v10)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__HMDEventCounterGroup__resetEventCounterForEventName___block_invoke;
        block[3] = &unk_1E6A16D78;
        id v19 = v8;
        id v20 = v4;
        uint64_t v21 = v7;
        dispatch_async(v10, block);
      }
      else
      {
        uint64_t v13 = (void *)MEMORY[0x1D9452090]();
        uint64_t v14 = self;
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v23 = v16;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Can't call observers; context has been deallocated",
            buf,
            0xCu);
        }
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_mutableEventCounters setObject:0 forKeyedSubscript:v4];
      if (![(NSMutableDictionary *)self->_mutableEventCounters count])
      {
        mutableEventCounters = self->_mutableEventCounters;
        self->_mutableEventCounters = 0;
      }
    }

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __55__HMDEventCounterGroup__resetEventCounterForEventName___block_invoke(uint64_t a1)
{
}

- (unint64_t)maxCounterName:(id *)a3
{
  [(HMDEventCounterGroup *)self updateAllDurationCounters];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__84506;
  long long v17 = __Block_byref_object_dispose__84507;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  os_unfair_lock_lock_with_options();
  mutableEventCounters = self->_mutableEventCounters;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__HMDEventCounterGroup_maxCounterName___block_invoke;
  v8[3] = &unk_1E6A0DA00;
  v8[4] = &v9;
  v8[5] = &v13;
  [(NSMutableDictionary *)mutableEventCounters enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(&self->_lock);
  if (a3) {
    *a3 = (id) v14[5];
  }
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __39__HMDEventCounterGroup_maxCounterName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  unint64_t v6 = [a3 count];
  if (v6 > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    unint64_t v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  }
}

- (unint64_t)summedEventCounters
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(HMDEventCounterGroup *)self updateAllDurationCounters];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableDictionary *)self->_mutableEventCounters allValues];
  unint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v5 += [*(id *)(*((void *)&v10 + 1) + 8 * v8++) count];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSDictionary)eventCounters
{
  [(HMDEventCounterGroup *)self updateAllDurationCounters];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  mutableEventCounters = self->_mutableEventCounters;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__HMDEventCounterGroup_eventCounters__block_invoke;
  v9[3] = &unk_1E6A0D9D8;
  id v6 = v4;
  id v10 = v6;
  [(NSMutableDictionary *)mutableEventCounters enumerateKeysAndObjectsUsingBlock:v9];
  if ([v6 count]) {
    uint64_t v7 = (void *)[v6 copy];
  }
  else {
    uint64_t v7 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v7;
}

void __37__HMDEventCounterGroup_eventCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    [v6 setValue:v7 forKey:v8];
  }
}

- (double)durationForCounter:(id)a3
{
  id v4 = a3;
  [(HMDEventCounterGroup *)self updateDurationCounter:v4];
  unint64_t v5 = [(HMDEventCounterGroup *)self fetchEventCounterForEventName:v4];

  return (double)v5;
}

- (void)addDuration:(double)a3 toCounter:(id)a4
{
}

- (void)updateAllDurationCounters
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDEventCounterGroup *)self uptimeProvider];
  [v3 uptime];
  double v5 = v4;

  id v6 = [NSNumber numberWithDouble:v5];
  os_unfair_lock_lock_with_options();
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_runningDurationCounters copy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(NSMutableDictionary *)self->_runningDurationCounters allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        [(NSMutableDictionary *)self->_runningDurationCounters setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_lock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__HMDEventCounterGroup_updateAllDurationCounters__block_invoke;
  v12[3] = &unk_1E6A0D9B0;
  v12[4] = self;
  *(double *)&v12[5] = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
}

void __49__HMDEventCounterGroup_updateAllDurationCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 40);
  id v7 = a2;
  [a3 doubleValue];
  [v4 addDuration:v7 toCounter:v5 - v6];
}

- (void)updateDurationCounter:(id)a3
{
  id v12 = a3;
  os_unfair_lock_lock_with_options();
  double v4 = [(NSMutableDictionary *)self->_runningDurationCounters objectForKeyedSubscript:v12];
  double v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
    id v8 = [(HMDEventCounterGroup *)self uptimeProvider];
    [v8 uptime];
    double v10 = v9;

    uint64_t v11 = [NSNumber numberWithDouble:v10];
    [(NSMutableDictionary *)self->_runningDurationCounters setObject:v11 forKeyedSubscript:v12];

    os_unfair_lock_unlock(&self->_lock);
    [(HMDEventCounterGroup *)self addDuration:v12 toCounter:v10 - v7];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (unint64_t)fetchEventCounterForEventName:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double v6 = [(NSMutableDictionary *)self->_mutableEventCounters objectForKeyedSubscript:v4];
  unint64_t v7 = [v6 count];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)addValue:(unint64_t)a3 toStatisticsName:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  unint64_t v7 = [(HMDEventCounterGroup *)self _getOrCreateEventCounterForEventName:v6];
  if ([v7 count] < a3)
  {
    uint64_t v8 = [v7 count];
    [v7 setCount:a3];
    double v9 = [v7 observers];
    if (v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
      uint64_t v11 = [WeakRetained workQueue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__HMDEventCounterGroup_addValue_toStatisticsName___block_invoke;
      v13[3] = &unk_1E6A15460;
      id v14 = v9;
      id v15 = v6;
      uint64_t v16 = v8;
      unint64_t v17 = a3;
      dispatch_async(v11, v13);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  id v12 = [(HMDEventCounterGroup *)self context];
  [v12 counterChanged];
}

void __50__HMDEventCounterGroup_addValue_toStatisticsName___block_invoke(uint64_t a1)
{
}

- (void)pauseDurationCounter:(id)a3
{
  id v5 = a3;
  [(HMDEventCounterGroup *)self updateDurationCounter:v5];
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_runningDurationCounters setObject:0 forKeyedSubscript:v5];
  if (![(NSMutableDictionary *)self->_runningDurationCounters count])
  {
    runningDurationCounters = self->_runningDurationCounters;
    self->_runningDurationCounters = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)resumeDurationCounter:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_runningDurationCounters objectForKeyedSubscript:v10];

  if (!v4)
  {
    if (!self->_runningDurationCounters)
    {
      id v5 = [MEMORY[0x1E4F1CA60] dictionary];
      runningDurationCounters = self->_runningDurationCounters;
      self->_runningDurationCounters = v5;
    }
    unint64_t v7 = NSNumber;
    uint64_t v8 = [(HMDEventCounterGroup *)self uptimeProvider];
    [v8 uptime];
    double v9 = objc_msgSend(v7, "numberWithDouble:");
    [(NSMutableDictionary *)self->_runningDurationCounters setObject:v9 forKeyedSubscript:v10];
  }
  os_unfair_lock_unlock(&self->_lock);
}

void __69__HMDEventCounterGroup__incrementEventCounterForEventName_withValue___block_invoke(uint64_t a1)
{
}

- (void)addObserver:(id)a3 forEventName:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = [(HMDEventCounterGroup *)self _getOrCreateEventCounterForEventName:v6];
  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v10 = [v8 observers];
  uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count") + 1);

  id v12 = [v8 observers];

  if (v12)
  {
    long long v13 = [v8 observers];
    [v11 addObjectsFromArray:v13];
  }
  [v11 addObject:v15];
  id v14 = (void *)[v11 copy];
  [v8 setObservers:v14];

  os_unfair_lock_unlock(p_lock);
}

void __79__HMDEventCounterGroup_initWithContext_serializedEventCounters_uptimeProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 unsignedIntegerValue])
  {
    id v6 = -[HMDEventCounter initWithCount:]([HMDEventCounter alloc], "initWithCount:", [v5 unsignedIntegerValue]);
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v6 forKeyedSubscript:v7];
  }
}

- (HMDEventCounterGroup)initWithContext:(id)a3 serializedEventCounters:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F6A2B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedInstance];
  id v10 = [(HMDEventCounterGroup *)self initWithContext:v8 serializedEventCounters:v7 uptimeProvider:v9];

  return v10;
}

@end