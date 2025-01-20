@interface DMTWaitForKVOChangeOperation
- (BOOL)isAsynchronous;
- (BOOL)isObserving;
- (BOOL)requireExpectedValue;
- (DMTWaitForKVOChangeOperation)initWithObservedObject:(id)a3 keyPath:(id)a4 expectedValue:(id)a5 requireExpectedValue:(BOOL)a6;
- (NSObject)expectedValue;
- (NSObject)initialValue;
- (NSObject)observedObject;
- (NSString)keyPath;
- (void)beginObserving;
- (void)cancel;
- (void)compareExpectedValueWithChangedValue:(id)a3;
- (void)endObservingIfNeeded;
- (void)endOperationAndTearDownWithError:(id)a3 resultObject:(id)a4;
- (void)handleKVOChangeWithValueOfKeyPath:(id)a3;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setInitialValue:(id)a3;
- (void)setObserving:(BOOL)a3;
@end

@implementation DMTWaitForKVOChangeOperation

- (DMTWaitForKVOChangeOperation)initWithObservedObject:(id)a3 keyPath:(id)a4 expectedValue:(id)a5 requireExpectedValue:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMTWaitForKVOChangeOperation;
  v14 = [(DMTWaitForKVOChangeOperation *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_observedObject, a3);
    uint64_t v16 = [v12 copy];
    keyPath = v15->_keyPath;
    v15->_keyPath = (NSString *)v16;

    objc_storeStrong((id *)&v15->_expectedValue, a5);
    v15->_requireExpectedValue = a6;
  }

  return v15;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)DMTWaitForKVOChangeOperation;
  [(DMTWaitForKVOChangeOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DMTWaitForKVOChangeOperation_cancel__block_invoke;
  block[3] = &unk_2649A9730;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__DMTWaitForKVOChangeOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
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
    if ([(DMTWaitForKVOChangeOperation *)self isExecuting])
    {
      if ([(DMTWaitForKVOChangeOperation *)self isCancelled])
      {
        CATErrorWithCodeAndUserInfo();
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        [(DMTWaitForKVOChangeOperation *)self endOperationWithError:v4];
      }
      else
      {
        [(DMTWaitForKVOChangeOperation *)self beginObserving];
      }
    }
  }
  else
  {
    [(DMTWaitForKVOChangeOperation *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)beginObserving
{
  id v3 = [(DMTWaitForKVOChangeOperation *)self observedObject];
  id v4 = [(DMTWaitForKVOChangeOperation *)self keyPath];
  v5 = [v3 valueForKeyPath:v4];
  [(DMTWaitForKVOChangeOperation *)self setInitialValue:v5];

  [(DMTWaitForKVOChangeOperation *)self setObserving:1];
  id v7 = [(DMTWaitForKVOChangeOperation *)self observedObject];
  v6 = [(DMTWaitForKVOChangeOperation *)self keyPath];
  [v7 addObserver:self forKeyPath:v6 options:4 context:@"WaitForKVOChangeContext"];
}

- (void)endObservingIfNeeded
{
  if ([(DMTWaitForKVOChangeOperation *)self isObserving])
  {
    id v3 = [(DMTWaitForKVOChangeOperation *)self observedObject];
    id v4 = [(DMTWaitForKVOChangeOperation *)self keyPath];
    [v3 removeObserver:self forKeyPath:v4 context:@"WaitForKVOChangeContext"];

    [(DMTWaitForKVOChangeOperation *)self setObserving:0];
  }
}

- (void)handleKVOChangeWithValueOfKeyPath:(id)a3
{
  id v10 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    [(DMTWaitForKVOChangeOperation *)self performSelectorOnMainThread:a2 withObject:v10 waitUntilDone:0];
LABEL_14:
    v9 = v10;
    goto LABEL_15;
  }
  id v6 = [(DMTWaitForKVOChangeOperation *)self initialValue];
  if (v6 == v10)
  {

    goto LABEL_14;
  }
  if (!v10)
  {
    id v3 = [(DMTWaitForKVOChangeOperation *)self initialValue];
    if (!v3)
    {

      goto LABEL_14;
    }
  }
  id v7 = [(DMTWaitForKVOChangeOperation *)self initialValue];
  char v8 = [v10 isEqual:v7];

  if (!v10) {
  v9 = v10;
  }
  if ((v8 & 1) == 0)
  {
    if ([(DMTWaitForKVOChangeOperation *)self requireExpectedValue]) {
      [(DMTWaitForKVOChangeOperation *)self compareExpectedValueWithChangedValue:v10];
    }
    else {
      [(DMTWaitForKVOChangeOperation *)self endOperationAndTearDownWithError:0 resultObject:0];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)compareExpectedValueWithChangedValue:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v3 = [(DMTWaitForKVOChangeOperation *)self expectedValue];
    if (!v3) {
      goto LABEL_7;
    }
  }
  id v6 = [(DMTWaitForKVOChangeOperation *)self expectedValue];
  int v7 = [v5 isEqual:v6];

  if (!v5)
  {

    if ((v7 & 1) == 0)
    {
      v13[0] = @"DMTWaitForKVOChangeOperationUnexpectedValue";
      char v8 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_9;
    }
LABEL_7:
    [(DMTWaitForKVOChangeOperation *)self endOperationAndTearDownWithError:0 resultObject:0];
    goto LABEL_16;
  }
  if (v7) {
    goto LABEL_7;
  }
  v13[0] = @"DMTWaitForKVOChangeOperationUnexpectedValue";
  char v8 = v5;
LABEL_9:
  v13[1] = @"kDMTWaitForKVOChangeOperationExpectedValue";
  v14[0] = v8;
  v9 = [(DMTWaitForKVOChangeOperation *)self expectedValue];
  id v10 = v9;
  if (!v9)
  {
    id v10 = [MEMORY[0x263EFF9D0] null];
  }
  v14[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  if (!v9) {

  }
  if (!v5) {
  id v12 = DMTErrorWithCodeAndUserInfo(3, v11);
  }
  [(DMTWaitForKVOChangeOperation *)self endOperationAndTearDownWithError:v12 resultObject:0];

LABEL_16:
}

- (void)endOperationAndTearDownWithError:(id)a3 resultObject:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(DMTWaitForKVOChangeOperation *)self endObservingIfNeeded];
  if (v7) {
    [(DMTWaitForKVOChangeOperation *)self endOperationWithError:v7];
  }
  else {
    [(DMTWaitForKVOChangeOperation *)self endOperationWithResultObject:v6];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a6 == @"WaitForKVOChangeContext")
  {
    id v12 = [(DMTWaitForKVOChangeOperation *)self keyPath];
    int v13 = [v10 isEqualToString:v12];

    if (v13)
    {
      v14 = [v11 valueForKeyPath:v10];
      [(DMTWaitForKVOChangeOperation *)self handleKVOChangeWithValueOfKeyPath:v14];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DMTWaitForKVOChangeOperation;
    [(DMTWaitForKVOChangeOperation *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

- (NSObject)observedObject
{
  return self->_observedObject;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSObject)expectedValue
{
  return self->_expectedValue;
}

- (BOOL)requireExpectedValue
{
  return self->_requireExpectedValue;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (NSObject)initialValue
{
  return self->_initialValue;
}

- (void)setInitialValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_expectedValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_observedObject, 0);
}

@end