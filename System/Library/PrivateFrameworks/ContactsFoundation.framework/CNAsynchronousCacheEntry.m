@interface CNAsynchronousCacheEntry
- (CNAsynchronousCacheEntry)init;
- (CNAsynchronousCacheEntry)initWithSchedulerProvider:(id)a3;
- (CNSchedulerProvider)schedulerProvider;
- (CNWeakArray)delegates;
- (double)timestampOfCurrentValue;
- (id)currentValue;
- (id)description;
- (void)addDelegate:(id)a3;
- (void)removeDelegates:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)updateValue:(id)a3;
- (void)withLock_addDelegate:(id)a3;
- (void)withLock_compactAndRemoveDelegates:(id)a3;
- (void)withLock_compactDelegates;
@end

@implementation CNAsynchronousCacheEntry

- (CNAsynchronousCacheEntry)init
{
  v3 = +[CNEnvironmentBase currentEnvironment];
  v4 = [v3 schedulerProvider];
  v5 = [(CNAsynchronousCacheEntry *)self initWithSchedulerProvider:v4];

  return v5;
}

- (CNAsynchronousCacheEntry)initWithSchedulerProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNAsynchronousCacheEntry;
  v6 = [(CNAsynchronousCacheEntry *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_schedulerProvider, a3);
    id currentValue = v7->_currentValue;
    v7->_id currentValue = 0;

    v7->_timestampOfCurrentValue = 0.0;
    v9 = objc_alloc_init(CNWeakArray);
    delegates = v7->_delegates;
    v7->_delegates = v9;

    v11 = v7;
  }

  return v7;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"currentValue" object:self->_currentValue];
  id v5 = [v3 build];

  return v5;
}

- (void)addDelegate:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(CNAsynchronousCacheEntry *)v4 withLock_compactDelegates];
  [(CNAsynchronousCacheEntry *)v4 withLock_addDelegate:v8];
  id v5 = v4->_currentValue;
  v6 = [(CNSchedulerProvider *)v4->_schedulerProvider immediateScheduler];
  [v6 timestamp];
  v4->_timestampOfCurrentValue = v7;

  objc_sync_exit(v4);
  if (v5) {
    [v8 cacheEntryDidUpdateValue:v4];
  }
}

- (void)withLock_addDelegate:(id)a3
{
}

- (void)removeDelegates:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(CNAsynchronousCacheEntry *)v4 withLock_compactAndRemoveDelegates:v5];
  objc_sync_exit(v4);
}

- (void)updateValue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  [(CNAsynchronousCacheEntry *)v6 withLock_compactDelegates];
  double v7 = [(CNWeakArray *)v6->_delegates allObjects];
  objc_storeStrong(&v6->_currentValue, a3);
  objc_sync_exit(v6);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "cacheEntryDidUpdateValue:", v6, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)withLock_compactDelegates
{
}

- (void)withLock_compactAndRemoveDelegates:(id)a3
{
  delegates = self->_delegates;
  id v5 = a3;
  v6 = [(CNWeakArray *)delegates allObjects];
  id v7 = (id)[v6 mutableCopy];

  [v7 removeObjectsInArray:v5];
  [(CNWeakArray *)self->_delegates setArray:v7];
}

- (id)currentValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentValue:(id)a3
{
}

- (double)timestampOfCurrentValue
{
  return self->_timestampOfCurrentValue;
}

- (CNSchedulerProvider)schedulerProvider
{
  return (CNSchedulerProvider *)objc_getProperty(self, a2, 24, 1);
}

- (CNWeakArray)delegates
{
  return (CNWeakArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);

  objc_storeStrong(&self->_currentValue, 0);
}

@end