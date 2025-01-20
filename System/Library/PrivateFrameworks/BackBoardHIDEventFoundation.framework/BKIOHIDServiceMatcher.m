@interface BKIOHIDServiceMatcher
- (BKIOHIDServiceMatcher)initWithMatchingDictionary:(id)a3 dataProvider:(id)a4;
- (BKIOHIDServiceMatcher)initWithSenderDescriptor:(id)a3 dataProvider:(id)a4;
- (BKIOHIDServiceMatcher)initWithUsagePage:(int)a3 usage:(int)a4 builtIn:(BOOL)a5 dataProvider:(id)a6;
- (id)existingServices;
- (void)_lock_servicesAdded:(uint64_t)a1;
- (void)_servicesForIOHIDServiceRefs:(void *)a1;
- (void)dealloc;
- (void)invalidate;
- (void)startObserving:(id)a3 queue:(id)a4;
@end

@implementation BKIOHIDServiceMatcher

void __45__BKIOHIDServiceMatcher__lock_servicesAdded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained matcher:*(void *)(a1 + 32) servicesDidMatch:*(void *)(a1 + 40)];
}

void __54__BKIOHIDServiceMatcher__servicesForIOHIDServiceRefs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = *(objc_class **)(a1 + 48);
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithHIDServiceRef:v4];

  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v9 = 0;
    goto LABEL_8;
  }
  v6 = [v5 senderDescriptor];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
  id v11 = 0;
  char v8 = [v6 matchesDescriptor:v7 failureReason:&v11];
  id v9 = v11;

  if (v8)
  {
LABEL_8:
    [*(id *)(a1 + 40) addObject:v5];
LABEL_9:

    goto LABEL_10;
  }
  if (v9)
  {
    v10 = BKLogHID();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v5;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_1CFDE2000, v10, OS_LOG_TYPE_DEFAULT, "service %{public}@ did not match: %{public}@", buf, 0x16u);
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)_lock_servicesAdded:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    id v4 = -[BKIOHIDServiceMatcher _servicesForIOHIDServiceRefs:]((void *)a1, v3);
    v5 = BKLogHID();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v4;
      _os_log_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_INFO, "Services added: %{public}@", buf, 0xCu);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v10++) setServiceStatus:1];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    objc_copyWeak((id *)buf, (id *)(a1 + 48));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__BKIOHIDServiceMatcher__lock_servicesAdded___block_invoke;
    block[3] = &unk_1E6871100;
    objc_copyWeak(&v15, (id *)buf);
    block[4] = a1;
    id v14 = v6;
    id v12 = v6;
    dispatch_async(WeakRetained, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_servicesForIOHIDServiceRefs:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = a2;
    v5 = [v3 array];
    uint64_t v6 = v2[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__BKIOHIDServiceMatcher__servicesForIOHIDServiceRefs___block_invoke;
    v10[3] = &unk_1E6871128;
    uint64_t v12 = v6;
    v10[4] = v2;
    id v7 = v5;
    id v11 = v7;
    [v4 enumerateObjectsUsingBlock:v10];

    uint64_t v8 = v11;
    v2 = v7;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_observerQueue);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_serviceClass, 0);
  objc_storeStrong((id *)&self->_matchingDictionary, 0);

  objc_storeStrong((id *)&self->_senderDescriptor, 0);
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_startedMatching)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    Class serviceClass = self->_serviceClass;
    uint64_t v6 = BKLogHID();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = objc_opt_class();
      matchingDictionary = self->_matchingDictionary;
      int v10 = 134218754;
      id v11 = self;
      __int16 v12 = 2114;
      v13 = v7;
      __int16 v14 = 2114;
      Class v15 = serviceClass;
      __int16 v16 = 2114;
      long long v17 = matchingDictionary;
      id v9 = v7;
      _os_log_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_INFO, "%p %{public}@ stopped matching %{public}@ with dictionary %{public}@", (uint8_t *)&v10, 0x2Au);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_observer, 0);
    objc_storeWeak((id *)&self->_observerQueue, 0);
    [(BKIOHIDServiceMatcherDataProviding *)self->_dataProvider unregisterIOHIDServicesCallback:_BKHIDServiceAdded matchingDictionary:self->_matchingDictionary target:self refCon:self->_matchingDictionary];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)startObserving:(id)a3 queue:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_startedMatching)
  {
    __int16 v16 = [NSString stringWithFormat:@"already started matching -- only one observer per matcher, plz"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      long long v17 = (BKIOHIDServiceMatcher *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = (objc_class *)objc_opt_class();
      long long v19 = NSStringFromClass(v18);
      int v24 = 138544642;
      v25 = v17;
      __int16 v26 = 2114;
      v27 = v19;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKIOHIDServiceMatcher.m";
      __int16 v32 = 1024;
      int v33 = 123;
      __int16 v34 = 2114;
      v35 = v16;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v24, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDF8DACLL);
  }
  self->_startedMatching = 1;
  objc_storeWeak((id *)&self->_observer, v7);
  objc_storeWeak((id *)&self->_observerQueue, v8);
  id v9 = BKLogHID();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = objc_opt_class();
    matchingDictionary = self->_matchingDictionary;
    Class serviceClass = self->_serviceClass;
    int v24 = 134218754;
    v25 = self;
    __int16 v26 = 2114;
    v27 = v10;
    __int16 v28 = 2114;
    v29 = (BKIOHIDServiceMatcher *)serviceClass;
    __int16 v30 = 2114;
    v31 = (__CFString *)matchingDictionary;
    id v13 = v10;
    _os_log_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_INFO, "%p %{public}@ started matching %{public}@ with dictionary %{public}@", (uint8_t *)&v24, 0x2Au);
  }
  dataProvider = self->_dataProvider;
  if (!dataProvider)
  {
    v20 = [NSString stringWithFormat:@"must have a data provider"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (BKIOHIDServiceMatcher *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      int v24 = 138544642;
      v25 = v21;
      __int16 v26 = 2114;
      v27 = v23;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKIOHIDServiceMatcher.m";
      __int16 v32 = 1024;
      int v33 = 133;
      __int16 v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v24, 0x3Au);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDF8E98);
  }
  [(BKIOHIDServiceMatcherDataProviding *)dataProvider registerIOHIDServicesCallback:_BKHIDServiceAdded matchingDictionary:self->_matchingDictionary target:self refCon:self->_matchingDictionary];
  Class v15 = [(BKIOHIDServiceMatcherDataProviding *)self->_dataProvider IOHIDServicesMatching:self->_matchingDictionary];
  if ([v15 count]) {
    -[BKIOHIDServiceMatcher _lock_servicesAdded:]((uint64_t)self, v15);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)existingServices
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(BKIOHIDServiceMatcherDataProviding *)self->_dataProvider IOHIDServicesMatching:self->_matchingDictionary];
  id v4 = -[BKIOHIDServiceMatcher _servicesForIOHIDServiceRefs:](self, v3);
  v5 = BKLogHID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    matchingDictionary = self->_matchingDictionary;
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2114;
    id v11 = matchingDictionary;
    _os_log_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_INFO, "Services discovered: %{public}@ for:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self && self->_startedMatching && !self->_invalidated)
  {
    id v3 = [NSString stringWithFormat:@"dealloc without invalidation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v4 = NSStringFromSelector(sel__expectDeallocation);
      v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138544642;
      id v9 = v4;
      __int16 v10 = 2114;
      id v11 = v6;
      __int16 v12 = 2048;
      id v13 = self;
      __int16 v14 = 2114;
      Class v15 = @"BKIOHIDServiceMatcher.m";
      __int16 v16 = 1024;
      int v17 = 86;
      __int16 v18 = 2114;
      long long v19 = v3;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v3 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDF9110);
  }
  v7.receiver = self;
  v7.super_class = (Class)BKIOHIDServiceMatcher;
  [(BKIOHIDServiceMatcher *)&v7 dealloc];
}

- (BKIOHIDServiceMatcher)initWithMatchingDictionary:(id)a3 dataProvider:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_class();
  id v10 = v8;
  id v11 = v7;
  if (self)
  {
    v16.receiver = self;
    v16.super_class = (Class)BKIOHIDServiceMatcher;
    __int16 v12 = [(BKIOHIDServiceMatcher *)&v16 init];
    self = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_serviceClass, v9);
      id v13 = (NSDictionary *)[v10 copy];
      matchingDictionary = self->_matchingDictionary;
      self->_matchingDictionary = v13;

      objc_storeStrong((id *)&self->_dataProvider, a4);
    }
  }

  return self;
}

- (BKIOHIDServiceMatcher)initWithUsagePage:(int)a3 usage:(int)a4 builtIn:(BOOL)a5 dataProvider:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  v26[3] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    v25[0] = @"DeviceUsagePage";
    id v10 = NSNumber;
    id v11 = a6;
    __int16 v12 = [v10 numberWithInt:v8];
    v26[0] = v12;
    v25[1] = @"DeviceUsage";
    id v13 = [NSNumber numberWithInt:v7];
    v25[2] = @"Built-In";
    v26[1] = v13;
    v26[2] = MEMORY[0x1E4F1CC38];
    __int16 v14 = (void *)MEMORY[0x1E4F1C9E8];
    Class v15 = v26;
    objc_super v16 = v25;
    uint64_t v17 = 3;
  }
  else
  {
    v23[0] = @"DeviceUsagePage";
    __int16 v18 = NSNumber;
    id v19 = a6;
    __int16 v12 = [v18 numberWithInt:v8];
    v23[1] = @"DeviceUsage";
    v24[0] = v12;
    id v13 = [NSNumber numberWithInt:v7];
    v24[1] = v13;
    __int16 v14 = (void *)MEMORY[0x1E4F1C9E8];
    Class v15 = v24;
    objc_super v16 = v23;
    uint64_t v17 = 2;
  }
  uint64_t v20 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];

  v21 = [(BKIOHIDServiceMatcher *)self initWithMatchingDictionary:v20 dataProvider:a6];
  return v21;
}

- (BKIOHIDServiceMatcher)initWithSenderDescriptor:(id)a3 dataProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = -[BKIOHIDServiceMatcher initWithUsagePage:usage:builtIn:dataProvider:](self, "initWithUsagePage:usage:builtIn:dataProvider:", [v7 primaryPage], objc_msgSend(v7, "primaryUsage"), 0, v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_senderDescriptor, a3);
  }

  return v9;
}

@end