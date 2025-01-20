@interface CRKWaitForKeyValueChangeOperation
- (BOOL)isAsynchronous;
- (BOOL)isObserving;
- (CRKWaitForKeyValueChangeOperation)initWithObject:(id)a3 keyPaths:(id)a4 conditionEvaluator:(id)a5;
- (NSObject)object;
- (NSSet)keyPaths;
- (id)conditionEvaluator;
- (void)beginObservingObject;
- (void)cancel;
- (void)endObservingObject;
- (void)evaluateConditions;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setConditionEvaluator:(id)a3;
- (void)setObserving:(BOOL)a3;
@end

@implementation CRKWaitForKeyValueChangeOperation

- (CRKWaitForKeyValueChangeOperation)initWithObject:(id)a3 keyPaths:(id)a4 conditionEvaluator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRKWaitForKeyValueChangeOperation;
  v12 = [(CRKWaitForKeyValueChangeOperation *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_object, a3);
    uint64_t v14 = [v10 copy];
    keyPaths = v13->_keyPaths;
    v13->_keyPaths = (NSSet *)v14;

    uint64_t v16 = MEMORY[0x22A620AF0](v11);
    id conditionEvaluator = v13->_conditionEvaluator;
    v13->_id conditionEvaluator = (id)v16;
  }
  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKWaitForKeyValueChangeOperation;
  [(CRKWaitForKeyValueChangeOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CRKWaitForKeyValueChangeOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __43__CRKWaitForKeyValueChangeOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    [*(id *)(a1 + 32) endObservingObject];
    [*(id *)(a1 + 32) setConditionEvaluator:0];
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 endOperationWithError:v3];
  }
}

- (void)main
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if ([(CRKWaitForKeyValueChangeOperation *)self isExecuting])
    {
      [(CRKWaitForKeyValueChangeOperation *)self beginObservingObject];
      [(CRKWaitForKeyValueChangeOperation *)self evaluateConditions];
    }
  }
  else
  {
    [(CRKWaitForKeyValueChangeOperation *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)beginObservingObject
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (![(CRKWaitForKeyValueChangeOperation *)self isObserving])
  {
    [(CRKWaitForKeyValueChangeOperation *)self setObserving:1];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = [(CRKWaitForKeyValueChangeOperation *)self keyPaths];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          id v9 = [(CRKWaitForKeyValueChangeOperation *)self object];
          [v9 addObserver:self forKeyPath:v8 options:0 context:@"WaitForKeyValueChangeOperationObservationContext"];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)endObservingObject
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(CRKWaitForKeyValueChangeOperation *)self isObserving])
  {
    [(CRKWaitForKeyValueChangeOperation *)self setObserving:0];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = [(CRKWaitForKeyValueChangeOperation *)self keyPaths];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          id v9 = [(CRKWaitForKeyValueChangeOperation *)self object];
          [v9 removeObserver:self forKeyPath:v8 context:@"WaitForKeyValueChangeOperationObservationContext"];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"WaitForKeyValueChangeOperationObservationContext")
  {
    [(CRKWaitForKeyValueChangeOperation *)self evaluateConditions];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKWaitForKeyValueChangeOperation;
    -[CRKWaitForKeyValueChangeOperation observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)evaluateConditions
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if ([(CRKWaitForKeyValueChangeOperation *)self isExecuting])
    {
      uint64_t v4 = [(CRKWaitForKeyValueChangeOperation *)self conditionEvaluator];
      int v5 = v4[2]();

      if (v5)
      {
        [(CRKWaitForKeyValueChangeOperation *)self endObservingObject];
        [(CRKWaitForKeyValueChangeOperation *)self setConditionEvaluator:0];
        [(CRKWaitForKeyValueChangeOperation *)self endOperationWithResultObject:0];
      }
    }
  }
  else
  {
    [(CRKWaitForKeyValueChangeOperation *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (NSObject)object
{
  return self->_object;
}

- (NSSet)keyPaths
{
  return self->_keyPaths;
}

- (id)conditionEvaluator
{
  return self->_conditionEvaluator;
}

- (void)setConditionEvaluator:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_conditionEvaluator, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);

  objc_storeStrong((id *)&self->_object, 0);
}

@end