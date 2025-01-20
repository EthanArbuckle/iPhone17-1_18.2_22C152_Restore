@interface CPLResetTracker
+ (BOOL)shouldIgnoreDefaultsCPLKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (CPLResetTracker)currentTracker;
+ (NSArray)currentReasonDescriptions;
+ (id)registerTentativeResetReasonIfCrashing:(id)a3;
+ (void)_registerReasonLocked:(id)a3;
+ (void)_storeReasonsLocked;
+ (void)discardTentativeResetReason:(id)a3;
+ (void)discardTracker:(id)a3;
+ (void)initialize;
+ (void)registerLikelyResetReason:(id)a3;
+ (void)registerLikelyResetReason:(id)a3 arguments:(char *)a4;
- (BOOL)hasReasons;
- (CPLResetTracker)initWithCoder:(id)a3;
- (CPLResetTracker)initWithResetReasons:(id)a3;
- (NSArray)resetReasons;
- (NSDate)earliestReasonDate;
- (NSDate)likelyResetDate;
- (id)likelyResetReasonWithImmediateReason:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLResetTracker

- (void).cxx_destruct
{
}

- (NSArray)resetReasons
{
  return self->_resetReasons;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CPLResetTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  if (initWithCoder__onceToken_6012 != -1) {
    dispatch_once(&initWithCoder__onceToken_6012, &__block_literal_global_12);
  }
  v5 = [v4 decodeObjectOfClasses:initWithCoder__arrayForResetReasonClasses forKey:@"r"];
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLResetTracker;
    v6 = [(CPLResetTracker *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_resetReasons, v5);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __33__CPLResetTracker_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = initWithCoder__arrayForResetReasonClasses;
  initWithCoder__arrayForResetReasonClasses = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

- (BOOL)hasReasons
{
  return [(NSArray *)self->_resetReasons count] != 0;
}

- (NSDate)likelyResetDate
{
  uint64_t v2 = [(NSArray *)self->_resetReasons firstObject];
  uint64_t v3 = [v2 date];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (id)likelyResetReasonWithImmediateReason:(id)a3
{
  resetReasons = self->_resetReasons;
  id v4 = a3;
  id v5 = [(NSArray *)resetReasons firstObject];
  v6 = [v5 reason];
  v7 = v6;
  if (!v6) {
    v6 = v4;
  }
  id v8 = v6;

  return v8;
}

- (NSDate)earliestReasonDate
{
  uint64_t v2 = [(NSArray *)self->_resetReasons firstObject];
  uint64_t v3 = [v2 date];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (CPLResetTracker)initWithResetReasons:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLResetTracker;
  id v5 = [(CPLResetTracker *)&v10 init];
  if (v5)
  {
    v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_6017];
    uint64_t v7 = [v6 copy];
    resetReasons = v5->_resetReasons;
    v5->_resetReasons = (NSArray *)v7;
  }
  return v5;
}

uint64_t __40__CPLResetTracker_initWithResetReasons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 date];
  v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (BOOL)shouldIgnoreDefaultsCPLKey:(id)a3
{
  return [a3 isEqualToString:@"CPLResetReasons"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)discardTentativeResetReason:(id)a3
{
  id v4 = a3;
  id v5 = _CPLResetTrackerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CPLResetTracker_discardTentativeResetReason___block_invoke;
  v7[3] = &unk_1E60A6598;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __47__CPLResetTracker_discardTentativeResetReason___block_invoke(uint64_t a1)
{
  uint64_t result = [(id)_currentReasons indexOfObject:*(void *)(a1 + 32)];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(id)_currentReasons removeObject:*(void *)(a1 + 32)];
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 _storeReasonsLocked];
  }
  return result;
}

+ (id)registerTentativeResetReasonIfCrashing:(id)a3
{
  id v4 = a3;
  id v5 = [CPLResetReason alloc];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [(CPLResetReason *)v5 initWithDate:v6 reason:v4];

  [(CPLResetReason *)v7 setTentative:1];
  id v8 = _CPLResetTrackerQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CPLResetTracker_registerTentativeResetReasonIfCrashing___block_invoke;
  v11[3] = &unk_1E60A6598;
  id v13 = a1;
  id v9 = v7;
  v12 = v9;
  dispatch_sync(v8, v11);

  return v9;
}

uint64_t __58__CPLResetTracker_registerTentativeResetReasonIfCrashing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _registerReasonLocked:*(void *)(a1 + 32)];
}

+ (NSArray)currentReasonDescriptions
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__6041;
  v14 = __Block_byref_object_dispose__6042;
  id v15 = 0;
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = _CPLResetTrackerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CPLResetTracker_currentReasonDescriptions__block_invoke;
  v7[3] = &unk_1E60A5CE8;
  id v8 = v2;
  id v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (NSArray *)v5;
}

void __44__CPLResetTracker_currentReasonDescriptions__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend((id)_currentReasons, "count"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)_currentReasons;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "tentative", (void)v14) & 1) == 0)
        {
          uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          id v13 = [v11 reasonDescriptionWithNow:*(void *)(a1 + 32)];
          [v12 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (void)discardTracker:(id)a3
{
  id v4 = a3;
  id v5 = _CPLResetTrackerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CPLResetTracker_discardTracker___block_invoke;
  v7[3] = &unk_1E60A6598;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __34__CPLResetTracker_discardTracker___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) resetReasons];
  if ([v2 count])
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * v8) uuid];
          [v3 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    uint64_t v10 = (void *)_currentReasons;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__CPLResetTracker_discardTracker___block_invoke_2;
    v13[3] = &unk_1E60A7540;
    id v11 = v3;
    id v14 = v11;
    uint64_t v12 = [v10 indexesOfObjectsPassingTest:v13];
    if ([v12 count])
    {
      [(id)_currentReasons removeObjectsAtIndexes:v12];
      [*(id *)(a1 + 40) _storeReasonsLocked];
    }
  }
}

uint64_t __34__CPLResetTracker_discardTracker___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (CPLResetTracker)currentTracker
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6041;
  id v9 = __Block_byref_object_dispose__6042;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CPLResetTracker_currentTracker__block_invoke;
  block[3] = &unk_1E60A69C0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)_CPLResetTrackerQueue, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CPLResetTracker *)v2;
}

uint64_t __33__CPLResetTracker_currentTracker__block_invoke(uint64_t a1)
{
  id v2 = [CPLResetTracker alloc];
  uint64_t v3 = [(CPLResetTracker *)v2 initWithResetReasons:_currentReasons];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

+ (void)registerLikelyResetReason:(id)a3 arguments:(char *)a4
{
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:a4];

  id v9 = [CPLResetReason alloc];
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [(CPLResetReason *)v9 initWithDate:v10 reason:v8];

  uint64_t v12 = _CPLResetTrackerQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__CPLResetTracker_registerLikelyResetReason_arguments___block_invoke;
  v14[3] = &unk_1E60A6598;
  long long v15 = v11;
  id v16 = a1;
  id v13 = v11;
  dispatch_sync(v12, v14);
}

uint64_t __55__CPLResetTracker_registerLikelyResetReason_arguments___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _registerReasonLocked:*(void *)(a1 + 32)];
}

+ (void)registerLikelyResetReason:(id)a3
{
  [a1 registerLikelyResetReason:a3 arguments:&v3];
}

+ (void)_registerReasonLocked:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[(id)_currentReasons count] <= 9)
  {
    [(id)_currentReasons addObject:v4];
    [a1 _storeReasonsLocked];
  }
}

+ (void)_storeReasonsLocked
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([(id)_currentReasons count])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v4 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend((id)_currentReasons, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = (id)_currentReasons;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "asPlist", (void)v11);
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [v2 setObject:v4 forKey:@"CPLResetReasons"];
  }
  else
  {
    [v2 removeObjectForKey:@"CPLResetReasons"];
  }
  objc_msgSend(v2, "synchronize", (void)v11);
}

+ (void)initialize
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.cpl.resettracker", 0);
  id v3 = (void *)_CPLResetTrackerQueue;
  _CPLResetTrackerQueue = (uint64_t)v2;

  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 arrayForKey:@"CPLResetReasons"];

  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  uint64_t v7 = (void *)_currentReasons;
  _currentReasons = v6;

  if ([v5 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          long long v15 = [CPLResetReason alloc];
          uint64_t v16 = -[CPLResetReason initWithPlist:](v15, "initWithPlist:", v14, (void)v17);
          if (v16)
          {
            [(id)_currentReasons addObject:v16];
            if (++v11 == 10)
            {

              goto LABEL_13;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

@end