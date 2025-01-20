@interface HUApplier
+ (void)registerStandaloneApplier:(id)a3;
+ (void)unregisterStandaloneApplier:(id)a3;
- (BOOL)_hasCompleted;
- (BOOL)cancel;
- (BOOL)complete:(BOOL)a3;
- (BOOL)isInteractive;
- (BOOL)start;
- (HUApplier)init;
- (double)progress;
- (unint64_t)state;
- (void)addApplierBlock:(id)a3;
- (void)addCompletionBlock:(id)a3;
- (void)updateProgress:(double)a3;
@end

@implementation HUApplier

+ (void)registerStandaloneApplier:(id)a3
{
  uint64_t v3 = _MergedGlobals_615;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_once(&_MergedGlobals_615, &__block_literal_global_33);
    id v5 = v6;
  }
  [(id)qword_1EBA477B8 addObject:v5];
}

void __39__HUApplier_registerStandaloneApplier___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)qword_1EBA477B8;
  qword_1EBA477B8 = v0;
}

+ (void)unregisterStandaloneApplier:(id)a3
{
}

- (HUApplier)init
{
  v8.receiver = self;
  v8.super_class = (Class)HUApplier;
  v2 = [(HUApplier *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    applierBlocks = v2->_applierBlocks;
    v2->_applierBlocks = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = (NSMutableArray *)v5;
  }
  return v2;
}

- (BOOL)isInteractive
{
  return 0;
}

- (void)addApplierBlock:(id)a3
{
  v9 = (void (**)(void))a3;
  if (!v9)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HUApplier.m", 49, @"Invalid parameter not satisfying: %@", @"applier" object file lineNumber description];
  }
  if ([(HUApplier *)self state])
  {
    [(HUApplier *)self progress];
    v9[2]();
  }
  if (![(HUApplier *)self _hasCompleted])
  {
    applierBlocks = self->_applierBlocks;
    id v6 = (void *)[v9 copy];
    v7 = _Block_copy(v6);
    [(NSMutableArray *)applierBlocks addObject:v7];
  }
}

- (void)addCompletionBlock:(id)a3
{
  v9 = (void (**)(id, BOOL))a3;
  if (!v9)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HUApplier.m", 60, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if ([(HUApplier *)self _hasCompleted])
  {
    v9[2](v9, [(HUApplier *)self state] == 3);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    id v6 = (void *)[v9 copy];
    v7 = _Block_copy(v6);
    [(NSMutableArray *)completionBlocks addObject:v7];
  }
}

- (BOOL)start
{
  unint64_t v3 = [(HUApplier *)self state];
  if (!v3) {
    self->_state = 1;
  }
  return v3 == 0;
}

- (void)updateProgress:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(HUApplier *)self state] == 1)
  {
    self->_progress = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_applierBlocks;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          (*(void (**)(double))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))(a3);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)cancel
{
  return [(HUApplier *)self complete:0];
}

- (BOOL)_hasCompleted
{
  return [(HUApplier *)self state] == 2 || [(HUApplier *)self state] == 3;
}

- (BOOL)complete:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(HUApplier *)self _hasCompleted];
  if (!v5)
  {
    unint64_t v6 = 2;
    if (v3) {
      unint64_t v6 = 3;
    }
    self->_state = v6;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = self->_completionBlocks;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  }
  return !v5;
}

- (unint64_t)state
{
  return self->_state;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);

  objc_storeStrong((id *)&self->_applierBlocks, 0);
}

@end