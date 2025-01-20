@interface FPAggregateProgress
- (void)addChild:(id)a3;
- (void)cancel;
- (void)startReportingProgress;
@end

@implementation FPAggregateProgress

- (void)addChild:(id)a3
{
  id v10 = a3;
  if ([(FPAggregateProgress *)self totalUnitCount]
    && [(FPAggregateProgress *)self totalUnitCount])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"FPAggregateProgress.m" lineNumber:20 description:@"addChild: method should only be invoked while progress is indeterminate"];
  }
  if ([(FPAggregateProgress *)self isCancelled])
  {
    [v10 cancel];
  }
  else
  {
    childProgresses = self->_childProgresses;
    id v6 = v10;
    if (!childProgresses)
    {
      v7 = (NSMutableArray *)objc_opt_new();
      v8 = self->_childProgresses;
      self->_childProgresses = v7;

      id v6 = v10;
      childProgresses = self->_childProgresses;
    }
    [(NSMutableArray *)childProgresses addObject:v6];
  }
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_childProgresses;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FPAggregateProgress;
  [(FPAggregateProgress *)&v8 cancel];
}

- (void)startReportingProgress
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(FPAggregateProgress *)self totalUnitCount] <= 0
    && ([(FPAggregateProgress *)self isCancelled] & 1) == 0)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    childProgresses = self->_childProgresses;
    uint64_t v4 = 0;
    uint64_t v5 = [(NSMutableArray *)childProgresses countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(childProgresses);
          }
          objc_super v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (![v8 totalUnitCount])
          {
            uint64_t v21 = 0;
            v22 = &v21;
            uint64_t v23 = 0x3032000000;
            v24 = __Block_byref_object_copy__8;
            v25 = __Block_byref_object_dispose__8;
            id v26 = 0;
            v13 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v8 path:"totalUnitCount"];
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __45__FPAggregateProgress_startReportingProgress__block_invoke;
            v20[3] = &unk_1E5AF2E78;
            v20[5] = self;
            v20[6] = &v21;
            v20[4] = v8;
            uint64_t v14 = [v13 addObserverBlock:v20];
            v15 = (void *)v22[5];
            v22[5] = v14;

            _Block_object_dispose(&v21, 8);
            goto LABEL_20;
          }
          v4 += [v8 totalUnitCount];
        }
        uint64_t v5 = [(NSMutableArray *)childProgresses countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    [(FPAggregateProgress *)self setTotalUnitCount:v4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v9 = self->_childProgresses;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          -[FPAggregateProgress addChild:withPendingUnitCount:](self, "addChild:withPendingUnitCount:", *(void *)(*((void *)&v16 + 1) + 8 * j), objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "totalUnitCount", (void)v16));
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v31 count:16];
      }
      while (v10);
    }

    childProgresses = self->_childProgresses;
    self->_childProgresses = 0;
LABEL_20:
  }
}

uint64_t __45__FPAggregateProgress_startReportingProgress__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) totalUnitCount];
  if (result >= 1)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishObserving];
    v3 = *(void **)(a1 + 40);
    return [v3 startReportingProgress];
  }
  return result;
}

- (void).cxx_destruct
{
}

@end