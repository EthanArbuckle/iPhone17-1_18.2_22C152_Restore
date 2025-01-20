@interface _NSISLinearExpressionObservable
+ (id)observableForExpression:(id)a3 inEngine:(id)a4;
- (BOOL)_overrideUseFastBlockObservers;
- (id)addObserver:(id)a3;
- (id)addObserverBlock:(id)a3;
- (uint64_t)emitValueIfNeeded;
- (uint64_t)receiveObservedValue:(uint64_t)result fromVariable:;
- (void)_lazilyObserveVariablesIfNeeded;
- (void)dealloc;
- (void)initWithExpression:(uint64_t)a3 inEngine:;
@end

@implementation _NSISLinearExpressionObservable

+ (id)observableForExpression:(id)a3 inEngine:(id)a4
{
  v4 = -[_NSISLinearExpressionObservable initWithExpression:inEngine:]([_NSISLinearExpressionObservable alloc], a3, (uint64_t)a4);
  return v4;
}

- (void)initWithExpression:(uint64_t)a3 inEngine:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_NSISLinearExpressionObservable;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[7] = a3;
    v5[6] = a2;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSISLinearExpressionObservable;
  [(NSObservationSource *)&v3 dealloc];
}

- (void)_lazilyObserveVariablesIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(void *)(a1 + 64))
  {
    *(void *)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "variableCount"));
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3052000000;
    v16[3] = __Block_byref_object_copy_;
    v16[4] = __Block_byref_object_dispose_;
    v16[5] = a1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v2)
    {
      uint64_t v3 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v13 != v3) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          v6 = *(void **)(a1 + 64);
          v7 = (void *)[*(id *)(a1 + 56) observableForVariable:v5];
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __66___NSISLinearExpressionObservable__lazilyObserveVariablesIfNeeded__block_invoke;
          v11[3] = &unk_1E5C56840;
          v11[4] = v5;
          v11[5] = v16;
          objc_msgSend(v6, "addObject:", objc_msgSend(v7, "addObserverBlock:", v11));
        }
        uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v2);
    }
    if (_NSConstraintBasedLayoutVariableChangeTransactions())
    {
      objc_super v8 = (void *)[*(id *)(a1 + 56) variableChangeTransactionSignal];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66___NSISLinearExpressionObservable__lazilyObserveVariablesIfNeeded__block_invoke_2;
      v10[3] = &unk_1E5C56868;
      v10[4] = v16;
      *(void *)(a1 + 72) = (id)[v8 addObserverBlock:v10];
    }
    _Block_object_dispose(v16, 8);
  }
}

- (uint64_t)receiveObservedValue:(uint64_t)result fromVariable:
{
  if (result)
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 80) = 1;
    result = _NSConstraintBasedLayoutVariableChangeTransactions();
    if ((result & 1) == 0)
    {
      return -[_NSISLinearExpressionObservable emitValueIfNeeded](v1);
    }
  }
  return result;
}

- (uint64_t)emitValueIfNeeded
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    if (*(unsigned char *)(result + 80))
    {
      [*(id *)(result + 56) valueForExpression:*(void *)(result + 48)];
      double v3 = v2;
      v4 = (void *)v1[5];
      if (v4)
      {
        result = [v4 floatValue];
        if (v3 == v5) {
          return result;
        }
        v6 = (void *)v1[5];
      }
      else
      {
        v6 = 0;
      }

      id v7 = (id)[NSNumber numberWithDouble:v3];
      v1[5] = v7;
      return [v1 receiveObservedValue:v7];
    }
  }
  return result;
}

- (BOOL)_overrideUseFastBlockObservers
{
  return 1;
}

- (id)addObserverBlock:(id)a3
{
  -[_NSISLinearExpressionObservable _lazilyObserveVariablesIfNeeded]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_NSISLinearExpressionObservable;
  return [(_NSISLinearExpressionObservable *)&v6 addObserverBlock:a3];
}

- (id)addObserver:(id)a3
{
  -[_NSISLinearExpressionObservable _lazilyObserveVariablesIfNeeded]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_NSISLinearExpressionObservable;
  return [(_NSISLinearExpressionObservable *)&v6 addObserver:a3];
}

@end