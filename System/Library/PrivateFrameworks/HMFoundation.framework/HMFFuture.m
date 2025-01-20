@interface HMFFuture
+ (HMFAsyncFuture)_inContext:(void *)a3 transform:(void *)a4 with:;
+ (id)_futureWithNilValue;
+ (id)_futureWithOutcome:(void *)a3;
+ (id)all:(id)a3;
+ (id)allSettled:(id)a3;
+ (id)any:(id)a3;
+ (id)anySettled:(id)a3;
+ (id)futureForOperation:(id)a3;
+ (id)futureWithDelay:(double)a3;
+ (id)futureWithDelay:(uint64_t)a3 outcome:(void *)a4;
+ (id)futureWithError:(id)a3;
+ (id)futureWithNoValue;
+ (id)futureWithPromise:(id *)a3;
+ (id)futureWithValue:(id)a3;
+ (id)inContext:(id)a3 perform:(id)a4;
- (BOOL)isPending;
- (BOOL)waitForResult:(id *)a3 orError:(id *)a4 withTimeout:(double)a5;
- (_HMFFutureBlockOutcome)outcomeIfSettled;
- (id)description;
- (id)finally:(id)a3;
- (id)ignoreErrors;
- (id)ignoreOutcome;
- (id)ignoreResult;
- (id)inContext:(id)a3 finally:(id)a4;
- (id)inContext:(id)a3 recover:(id)a4;
- (id)inContext:(id)a3 then:(id)a4;
- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5;
- (id)recover:(id)a3;
- (id)then:(id)a3;
- (id)then:(id)a3 orRecover:(id)a4;
- (id)timeout:(double)a3;
- (void)getResultWithCompletion:(id)a3;
@end

@implementation HMFFuture

+ (id)futureWithValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [HMFFulfilledFuture alloc];
    -[HMFFulfilledFuture initWithValue:]((id *)&v4->super.super.isa, v3);
  }
  else
  {
    +[HMFFuture _futureWithNilValue]();
    v4 = (HMFFulfilledFuture *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)_futureWithNilValue
{
  self;
  if (_MergedGlobals_54 != -1) {
    dispatch_once(&_MergedGlobals_54, &__block_literal_global_2);
  }
  v0 = (void *)qword_1EB4EEC90;
  return v0;
}

+ (id)futureWithError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [HMFRejectedFuture alloc];
    -[HMFRejectedFuture initWithError:]((id *)&v4->super.super.isa, v3);
  }
  else
  {
    self;
    if (qword_1EB4EEC98 != -1) {
      dispatch_once(&qword_1EB4EEC98, &__block_literal_global_4);
    }
    v4 = (HMFRejectedFuture *)(id)qword_1EB4EECA0;
  }

  return v4;
}

uint64_t __32__HMFFuture__futureWithNilValue__block_invoke()
{
  qword_1EB4EEC90 = (uint64_t)-[HMFFulfilledFuture initWithValue:]((id *)[HMFFulfilledFuture alloc], 0);
  return MEMORY[0x1F41817F8]();
}

void __40__HMFFuture__futureWithUnspecifiedError__block_invoke()
{
  v0 = [HMFRejectedFuture alloc];
  id v2 = [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
  -[HMFRejectedFuture initWithError:]((id *)&v0->super.super.isa, v2);
  v1 = (void *)qword_1EB4EECA0;
  qword_1EB4EECA0 = (uint64_t)v0;
}

+ (id)_futureWithOutcome:(void *)a3
{
  self;
  switch(a2)
  {
    case 1:
      id v5 = +[HMFFuture futureWithValue:a3];
      goto LABEL_7;
    case 2:
      id v5 = +[HMFFuture futureWithError:a3];
      goto LABEL_7;
    case 3:
      id v5 = a3;
LABEL_7:
      v6 = v5;
      goto LABEL_9;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

+ (id)futureWithPromise:(id *)a3
{
  id v3 = (void *)-[HMFAsyncFuture initWithPromise:]((uint64_t)[HMFAsyncFuture alloc], a3);
  return v3;
}

+ (id)inContext:(id)a3 perform:(id)a4
{
  id v5 = a4;
  v15 = 0;
  id v6 = a3;
  v7 = [HMFAsyncFuture alloc];
  -[HMFAsyncFuture initWithPromise:]((uint64_t)v7, &v15);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__HMFFuture_inContext_perform___block_invoke;
  v12[3] = &unk_1E5957780;
  v8 = v15;
  id v13 = v15;
  id v14 = v5;
  id v9 = v5;
  id v10 = v8;
  [v6 performBlock:v12];

  return v7;
}

void __31__HMFFuture_inContext_perform___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v1)
  {
    [(HMFPromise *)v1 resolveWithOutcome:v3];
  }
  else
  {
  }
}

+ (HMFAsyncFuture)_inContext:(void *)a3 transform:(void *)a4 with:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  self;
  v19 = 0;
  id v9 = [HMFAsyncFuture alloc];
  -[HMFAsyncFuture initWithPromise:]((uint64_t)v9, &v19);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__HMFFuture__inContext_transform_with___block_invoke;
  v15[3] = &unk_1E59577A8;
  id v10 = v19;
  id v17 = v6;
  id v18 = v7;
  id v16 = v19;
  id v11 = v6;
  id v12 = v7;
  id v13 = v10;
  [v8 performBlock:v15];

  return v9;
}

void __39__HMFFuture__inContext_transform_with___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = (*(uint64_t (**)(void, void))(a1[6] + 16))(a1[6], a1[5]);
  if (v1)
  {
    [(HMFPromise *)v1 resolveWithOutcome:v3];
  }
  else
  {
  }
}

- (id)description
{
  id v3 = NSString;
  BOOL v4 = [(HMFFuture *)self isPending];
  id v5 = @"settled";
  if (v4) {
    id v5 = @"pending";
  }
  return (id)[v3 stringWithFormat:@"<HMFFuture %p (%@)>", self, v5];
}

- (BOOL)isPending
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (_HMFFutureBlockOutcome)outcomeIfSettled
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)getResultWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)then:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)recover:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)then:(id)a3 orRecover:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  id v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)inContext:(id)a3 then:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  id v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)inContext:(id)a3 recover:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  id v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  id v13 = NSString;
  id v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

+ (id)futureWithDelay:(double)a3
{
  uint64_t v3 = HMFFuture;
  if (HMFFuture)
  {
    uint64_t v3 = +[HMFFuture futureWithDelay:1 outcome:0];
  }
  return v3;
}

+ (id)futureWithDelay:(uint64_t)a3 outcome:(void *)a4
{
  self;
  id v16 = 0;
  id v7 = +[HMFFuture futureWithPromise:&v16];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
  id v9 = dispatch_get_global_queue(21, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3254779904;
  v12[2] = __46__HMFFuture_Timeout__futureWithDelay_outcome___block_invoke;
  v12[3] = &unk_1EEF0E6B0;
  id v13 = v16;
  uint64_t v14 = a3;
  id v15 = a4;
  id v10 = a4;
  dispatch_after(v8, v9, v12);

  return v7;
}

- (id)timeout:(double)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_57 != -1) {
    dispatch_once(&_MergedGlobals_57, &__block_literal_global_5);
  }
  v13[0] = self;
  id v5 = (id)qword_1EB4EECD0;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
  }
  dispatch_time_t v8 = v7;

  if (HMFFuture)
  {
    id v9 = +[HMFFuture futureWithDelay:2 outcome:v8];
  }
  else
  {

    id v9 = 0;
  }
  v13[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v11 = +[HMFFuture anySettled:v10];

  return v11;
}

uint64_t __30__HMFFuture_Timeout__timeout___block_invoke()
{
  qword_1EB4EECD0 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:13];
  return MEMORY[0x1F41817F8]();
}

void __46__HMFFuture_Timeout__futureWithDelay_outcome___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  if (v1)
  {
    [(HMFPromise *)v1 resolveWithOutcome:v3];
  }
  else
  {
  }
}

+ (id)futureWithNoValue
{
  return +[HMFFuture _futureWithNilValue]();
}

- (id)finally:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __thenBlockForFinallyBlock_block_invoke;
  id v13 = &unk_1E5957CA8;
  id v14 = v4;
  id v5 = (void *)MEMORY[0x19F3A8A20](&v10);

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __recoverBlockForFinallyBlock_block_invoke;
  id v13 = &unk_1E5957CD0;
  id v14 = v4;
  id v6 = v4;
  id v7 = (void *)MEMORY[0x19F3A8A20](&v10);

  dispatch_time_t v8 = [(HMFFuture *)self then:v5 orRecover:v7];

  return v8;
}

- (id)inContext:(id)a3 finally:(id)a4
{
  id v6 = a4;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __thenBlockForFinallyBlock_block_invoke;
  id v16 = &unk_1E5957CA8;
  id v17 = v6;
  id v7 = a3;
  dispatch_time_t v8 = (void *)MEMORY[0x19F3A8A20](&v13);

  id v9 = v6;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __recoverBlockForFinallyBlock_block_invoke;
  id v16 = &unk_1E5957CD0;
  id v17 = v9;
  uint64_t v10 = (void *)MEMORY[0x19F3A8A20](&v13);

  uint64_t v11 = [(HMFFuture *)self inContext:v7 then:v8 orRecover:v10];

  return v11;
}

- (id)ignoreErrors
{
  id v3 = HMFCallerAsyncContext();
  id v4 = [(HMFFuture *)self inContext:v3 recover:&__block_literal_global_13];

  return v4;
}

- (id)ignoreResult
{
  id v3 = HMFCallerAsyncContext();
  id v4 = [(HMFFuture *)self inContext:v3 then:&__block_literal_global_13];

  return v4;
}

- (id)ignoreOutcome
{
  id v3 = HMFCallerAsyncContext();
  id v4 = [(HMFFuture *)self inContext:v3 then:&__block_literal_global_13 orRecover:&__block_literal_global_13];

  return v4;
}

- (BOOL)waitForResult:(id *)a3 orError:(id *)a4 withTimeout:(double)a5
{
  uint64_t v9 = [(HMFFuture *)self outcomeIfSettled];
  uint64_t v11 = v10;
  if (v9 == 2)
  {
    id v13 = *a3;
    *a3 = 0;

    objc_storeStrong(a4, v11);
    goto LABEL_5;
  }
  if (v9 == 1)
  {
    objc_storeStrong(a3, v10);
    id v12 = *a4;
    *a4 = 0;

LABEL_5:
    BOOL v14 = 1;
    goto LABEL_10;
  }
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__HMFFuture_Waiting__waitForResult_orError_withTimeout___block_invoke;
  v19[3] = &unk_1E5957D20;
  v21 = a3;
  v22 = a4;
  id v16 = v15;
  v20 = v16;
  [(HMFFuture *)self getResultWithCompletion:v19];
  if (a5 == 1.79769313e308) {
    dispatch_time_t v17 = -1;
  }
  else {
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  }
  BOOL v14 = dispatch_semaphore_wait(v16, v17) == 0;

LABEL_10:
  return v14;
}

void __56__HMFFuture_Waiting__waitForResult_orError_withTimeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void ***)(a1 + 40);
  dispatch_time_t v8 = *v7;
  void *v7 = v5;
  id v12 = v5;

  uint64_t v9 = *(void ***)(a1 + 48);
  uint64_t v10 = *v9;
  *uint64_t v9 = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)all:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 copy];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    id v24 = 0;
    id v6 = +[HMFFuture futureWithPromise:&v24];
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = v5;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __30__HMFFuture_Combinators__all___block_invoke;
    v18[3] = &unk_1E59584A0;
    id v19 = v24;
    v21 = v23;
    uint64_t v22 = v5;
    id v7 = v3;
    id v20 = v7;
    dispatch_time_t v8 = (void *)MEMORY[0x19F3A8A20](v18);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "getResultWithCompletion:", v8, (void)v14);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
      }
      while (v10);
    }

    _Block_object_dispose(v23, 8);
  }
  else
  {
    id v6 = +[HMFFuture futureWithValue:MEMORY[0x1E4F1CBF0]];
  }

  return v6;
}

void __30__HMFFuture_Combinators__all___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) rejectWithError:v6];
  }
  else if (atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1)
  {
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(a1 + 56)];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) outcomeIfSettled];
          id v13 = v12;
          long long v14 = v12;
          if (!v12)
          {
            id v3 = [MEMORY[0x1E4F1CA98] null];
            long long v14 = v3;
          }
          [v7 addObject:v14];
          if (!v13) {
        }
          }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    long long v15 = *(void **)(a1 + 32);
    long long v16 = (void *)[v7 copy];
    [v15 fulfillWithValue:v16];
  }
}

+ (id)allSettled:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 copy];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    id v24 = 0;
    id v6 = +[HMFFuture futureWithPromise:&v24];
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = v5;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__HMFFuture_Combinators__allSettled___block_invoke;
    v18[3] = &unk_1E59584A0;
    long long v21 = v23;
    uint64_t v22 = v5;
    id v7 = v3;
    id v19 = v7;
    id v20 = v24;
    id v8 = (void *)MEMORY[0x19F3A8A20](v18);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "getResultWithCompletion:", v8, (void)v14);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
      }
      while (v10);
    }

    _Block_object_dispose(v23, 8);
  }
  else
  {
    id v6 = +[HMFFuture futureWithValue:MEMORY[0x1E4F1CBF0]];
  }

  return v6;
}

void __37__HMFFuture_Combinators__allSettled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v6 = a3;
  if (atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1)
  {
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(a1 + 56)];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) outcomeIfSettled];
          id v13 = v12;
          long long v14 = v12;
          if (!v12)
          {
            id v3 = [MEMORY[0x1E4F1CA98] null];
            long long v14 = v3;
          }
          [v7 addObject:v14];
          if (!v13) {
        }
          }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    long long v15 = *(void **)(a1 + 40);
    long long v16 = (void *)[v7 copy];
    [v15 fulfillWithValue:v16];
  }
}

+ (id)any:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 copy];
  uint64_t v4 = [v3 count];
  if (!v4) {
    _HMFPreconditionFailure(@"count >= 1");
  }
  uint64_t v5 = v4;
  id v24 = 0;
  id v6 = +[HMFFuture futureWithPromise:&v24];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = v5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __30__HMFFuture_Combinators__any___block_invoke;
  v18[3] = &unk_1E59584A0;
  id v19 = v24;
  long long v21 = v23;
  uint64_t v22 = v5;
  id v7 = v3;
  id v20 = v7;
  id v8 = (void *)MEMORY[0x19F3A8A20](v18);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "getResultWithCompletion:", v8, (void)v14);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(v23, 8);
  return v6;
}

void __30__HMFFuture_Combinators__any___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1)
    {
      id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(a1 + 56)];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "outcomeIfSettled", (void)v19);
            id v13 = v12;
            [v7 addObject:v12];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v9);
      }

      long long v14 = *(void **)(a1 + 32);
      long long v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = @"HMFDetailedErrorsKey";
      long long v16 = (void *)[v7 copy];
      id v24 = v16;
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      long long v18 = [v15 hmfErrorWithCode:17 userInfo:v17];
      [v14 rejectWithError:v18];
    }
  }
  else
  {
    [*(id *)(a1 + 32) fulfillWithValue:v5];
  }
}

+ (id)anySettled:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count]) {
    _HMFPreconditionFailure(@"futures.count >= 1");
  }
  id v16 = 0;
  uint64_t v4 = +[HMFFuture futureWithPromise:&v16];
  id v5 = [v16 resolverBlock];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "getResultWithCompletion:", v5, (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)futureForOperation:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock_with_options();
  objc_getAssociatedObject(v3, &futureForOperation__lock);
  uint64_t v4 = (HMFOperationFutureAdapter *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&futureForOperation__lock);
  }
  else
  {
    uint64_t v4 = [HMFOperationFutureAdapter alloc];
    id v7 = v3;
    if (v4)
    {
      v13.receiver = v4;
      v13.super_class = (Class)HMFOperationFutureAdapter;
      uint64_t v4 = objc_msgSendSuper2(&v13, sel_init);
      if (v4)
      {
        uint64_t v8 = +[HMFFuture futureWithPromise:&v4->_promise];
        future = v4->_future;
        v4->_future = (HMFFuture *)v8;

        [v7 addObserver:v4 forKeyPath:@"isFinished" options:1 context:HMFOperationFutureAdapterKVOContext];
        if ([v7 isFinished]) {
          -[HMFOperationFutureAdapter _handleFinishedOperation:]((uint64_t)v4, v7);
        }
      }
    }

    objc_setAssociatedObject(v7, &futureForOperation__lock, v4, (void *)1);
    os_unfair_lock_unlock((os_unfair_lock_t)&futureForOperation__lock);
    if (!v4)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
  }
  uint64_t v10 = v4->_future;
LABEL_12:
  uint64_t v11 = v10;

  return v11;
}

@end