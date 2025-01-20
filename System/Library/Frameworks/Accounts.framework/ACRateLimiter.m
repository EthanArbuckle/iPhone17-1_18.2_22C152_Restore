@interface ACRateLimiter
- (ACRateLimiter)initWithMaximum:(unint64_t)a3 inTimeInterval:(double)a4;
- (BOOL)_vacuumQueue_vacuumKey:(id)a3;
- (BOOL)isVacuumInProgress;
- (BOOL)reservePerformActionForKey:(id)a3;
- (NSDate)nextVacuumDate;
- (NSMutableDictionary)keyToSimpleRateLimiter;
- (OS_dispatch_queue)instanceQueue;
- (OS_dispatch_queue)vacuumQueue;
- (double)timeInterval;
- (double)vacuumTimeInterval;
- (id)simpleRateLimiterForKey:(id)a3;
- (unint64_t)maximum;
- (void)_vacuumQueue_vacuum;
- (void)setIsVacuumInProgress:(BOOL)a3;
- (void)setKeyToSimpleRateLimiter:(id)a3;
- (void)setNextVacuumDate:(id)a3;
- (void)vacuumIfNeeded;
@end

@implementation ACRateLimiter

- (ACRateLimiter)initWithMaximum:(unint64_t)a3 inTimeInterval:(double)a4
{
  v21.receiver = self;
  v21.super_class = (Class)ACRateLimiter;
  v6 = [(ACRateLimiter *)&v21 init];
  v7 = v6;
  if (v6)
  {
    v6->_maximum = a3;
    v6->_timeInterval = a4;
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    keyToSimpleRateLimiter = v7->_keyToSimpleRateLimiter;
    v7->_keyToSimpleRateLimiter = (NSMutableDictionary *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("ACRateLimiter queue", v11);
    instanceQueue = v7->_instanceQueue;
    v7->_instanceQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, (dispatch_qos_class_t)0xFFFF8000, 0);
    dispatch_queue_t v16 = dispatch_queue_create("ACRateLimiter vacuum queue", v15);
    vacuumQueue = v7->_vacuumQueue;
    v7->_vacuumQueue = (OS_dispatch_queue *)v16;

    v7->_vacuumTimeInterval = fmax(a4, 3600.0);
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
    nextVacuumDate = v7->_nextVacuumDate;
    v7->_nextVacuumDate = (NSDate *)v18;
  }
  return v7;
}

- (BOOL)reservePerformActionForKey:(id)a3
{
  v4 = [(ACRateLimiter *)self simpleRateLimiterForKey:a3];
  char v5 = [v4 reservePerformActionNow];
  [(ACRateLimiter *)self vacuumIfNeeded];

  return v5;
}

- (id)simpleRateLimiterForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  dispatch_queue_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  char v5 = [(ACRateLimiter *)self instanceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ACRateLimiter_simpleRateLimiterForKey___block_invoke;
  block[3] = &unk_1E5BCEA20;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__ACRateLimiter_simpleRateLimiterForKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) keyToSimpleRateLimiter];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [ACSimpleRateLimiter alloc];
    uint64_t v7 = [*(id *)(a1 + 32) maximum];
    [*(id *)(a1 + 32) timeInterval];
    uint64_t v8 = -[ACSimpleRateLimiter initWithMaximum:inTimeInterval:](v6, "initWithMaximum:inTimeInterval:", v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v12 = [*(id *)(a1 + 32) keyToSimpleRateLimiter];
    [v12 setObject:v11 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

- (void)vacuumIfNeeded
{
  if (![(ACRateLimiter *)self isVacuumInProgress])
  {
    uint64_t v3 = [(ACRateLimiter *)self nextVacuumDate];
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = [v3 compare:v4];

    if (v5 == -1)
    {
      [(ACRateLimiter *)self setIsVacuumInProgress:1];
      vacuumQueue = self->_vacuumQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__ACRateLimiter_vacuumIfNeeded__block_invoke;
      block[3] = &unk_1E5BCD220;
      block[4] = self;
      dispatch_async(vacuumQueue, block);
    }
  }
}

uint64_t __31__ACRateLimiter_vacuumIfNeeded__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nextVacuumDate];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [v2 compare:v3];

  if (v4 == -1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_vacuumQueue_vacuum");
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
    [*(id *)(a1 + 32) vacuumTimeInterval];
    id v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
    [*(id *)(a1 + 32) setNextVacuumDate:v6];
  }
  uint64_t v7 = *(void **)(a1 + 32);

  return [v7 setIsVacuumInProgress:0];
}

- (void)_vacuumQueue_vacuum
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  objc_super v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v3 = [(ACRateLimiter *)self instanceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ACRateLimiter__vacuumQueue_vacuum__block_invoke;
  block[3] = &unk_1E5BCEA48;
  block[4] = self;
  void block[5] = &v18;
  dispatch_sync(v3, block);

  uint64_t v4 = _ACLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v19[5], "count"));
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    _os_log_impl(&dword_1A57C5000, v4, OS_LOG_TYPE_DEFAULT, "\"Started rate limiter vacuuming (%{public}@ keys)\"", buf, 0xCu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)v19[5];
  uint64_t v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v7 += -[ACRateLimiter _vacuumQueue_vacuumKey:](self, "_vacuumQueue_vacuumKey:", *(void *)(*((void *)&v13 + 1) + 8 * v10++), (void)v13);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
    }
    while (v8);
  }

  uint64_t v11 = _ACLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [NSNumber numberWithUnsignedInteger:v7];
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl(&dword_1A57C5000, v11, OS_LOG_TYPE_DEFAULT, "\"Finished rate limiter vacuuming (removed %{public}@ keys)\"", buf, 0xCu);
  }
  _Block_object_dispose(&v18, 8);
}

void __36__ACRateLimiter__vacuumQueue_vacuum__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) keyToSimpleRateLimiter];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_vacuumQueue_vacuumKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(ACRateLimiter *)self instanceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ACRateLimiter__vacuumQueue_vacuumKey___block_invoke;
  block[3] = &unk_1E5BCEA70;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __40__ACRateLimiter__vacuumQueue_vacuumKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyToSimpleRateLimiter];
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if ([v4 isEmptyAfterFlushing])
  {
    uint64_t v3 = [*(id *)(a1 + 32) keyToSimpleRateLimiter];
    [v3 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (OS_dispatch_queue)instanceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)vacuumQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)keyToSimpleRateLimiter
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKeyToSimpleRateLimiter:(id)a3
{
}

- (double)vacuumTimeInterval
{
  return self->_vacuumTimeInterval;
}

- (BOOL)isVacuumInProgress
{
  return self->_isVacuumInProgress;
}

- (void)setIsVacuumInProgress:(BOOL)a3
{
  self->_isVacuumInProgress = a3;
}

- (NSDate)nextVacuumDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNextVacuumDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextVacuumDate, 0);
  objc_storeStrong((id *)&self->_keyToSimpleRateLimiter, 0);
  objc_storeStrong((id *)&self->_vacuumQueue, 0);

  objc_storeStrong((id *)&self->_instanceQueue, 0);
}

@end