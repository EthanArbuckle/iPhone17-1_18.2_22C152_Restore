@interface AMSBinaryPromise
+ (id)promiseWithAll:(id)a3;
+ (id)promiseWithAny:(id)a3;
+ (id)promiseWithError:(id)a3;
+ (id)promiseWithFlattenedPromises:(id)a3;
+ (id)promiseWithPromise:(id)a3;
+ (id)promiseWithSuccess;
- (AMSBinaryPromise)init;
- (AMSBinaryPromise)initWithBackingPromise:(id)a3;
- (AMSBinaryPromise)retainedSelf;
- (AMSMutablePromise)backingPromise;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithPromise:(id)a3;
- (BOOL)finishWithSuccess;
- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4;
- (BOOL)resultWithError:(id *)a3;
- (BOOL)resultWithTimeout:(double)a3 error:(id *)a4;
- (id)catchWithBlock:(id)a3;
- (id)catchWithPromiseBlock:(id)a3 successValue:(id)a4;
- (id)completionHandlerAdapter;
- (id)continueWithBlock:(id)a3;
- (id)continueWithPromiseBlock:(id)a3;
- (id)promiseAdapter;
- (id)thenWithBlock:(id)a3;
- (id)thenWithPromiseBlock:(id)a3;
- (void)addErrorBlock:(id)a3;
- (void)addFinishBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)resultWithTimeout:(double)a3 completion:(id)a4;
- (void)setRetainedSelf:(id)a3;
- (void)stopRetainingSelf;
- (void)waitUntilFinished;
- (void)waitUntilFinishedWithTimeout:(double)a3;
@end

@implementation AMSBinaryPromise

void __35__AMSBinaryPromise_addFinishBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

uint64_t __34__AMSBinaryPromise_promiseAdapter__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __35__AMSBinaryPromise_promiseWithAll___block_invoke(uint64_t a1, void *a2)
{
  return [a2 promiseAdapter];
}

- (id)catchWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBinaryPromise *)self backingPromise];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__AMSBinaryPromise_catchWithBlock___block_invoke;
  v10[3] = &unk_1E55A03D8;
  id v11 = v4;
  id v6 = v4;
  v7 = [v5 catchWithBlock:v10];
  v8 = [v7 binaryPromiseAdapterForClass:objc_opt_class()];

  return v8;
}

- (id)promiseAdapter
{
  v3 = objc_alloc_init(AMSMutablePromise);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__AMSBinaryPromise_promiseAdapter__block_invoke;
  v11[3] = &unk_1E559EA90;
  id v4 = v3;
  v12 = v4;
  [(AMSBinaryPromise *)self addSuccessBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__AMSBinaryPromise_promiseAdapter__block_invoke_2;
  v9[3] = &unk_1E559F028;
  id v5 = v4;
  v10 = v5;
  [(AMSBinaryPromise *)self addErrorBlock:v9];
  id v6 = v10;
  v7 = v5;

  return v7;
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBinaryPromise *)self backingPromise];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__AMSBinaryPromise_addSuccessBlock___block_invoke;
  v7[3] = &unk_1E55A0360;
  id v8 = v4;
  id v6 = v4;
  [v5 addSuccessBlock:v7];
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBinaryPromise *)self backingPromise];
  [v5 addErrorBlock:v4];
}

- (AMSMutablePromise)backingPromise
{
  return self->_backingPromise;
}

uint64_t __36__AMSBinaryPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __34__AMSBinaryPromise_promiseAdapter__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
}

- (void)stopRetainingSelf
{
  v3 = self;
  os_unfair_lock_lock_with_options();
  [(AMSBinaryPromise *)v3 setRetainedSelf:0];
  os_unfair_lock_unlock(&self->_backingPromise->super._stateLock);
}

- (void)setRetainedSelf:(id)a3
{
}

id __35__AMSBinaryPromise_catchWithBlock___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = [v1 promiseAdapter];

  return v2;
}

+ (id)promiseWithSuccess
{
  if ((id)objc_opt_class() == a1)
  {
    if (_MergedGlobals_87 != -1) {
      dispatch_once(&_MergedGlobals_87, &__block_literal_global_13_0);
    }
    id v5 = (id)qword_1EB38D6D8;
  }
  else
  {
    id v3 = objc_alloc((Class)a1);
    id v4 = +[AMSFinishedPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
    id v5 = (id)[v3 initWithBackingPromise:v4];
  }
  return v5;
}

id __38__AMSBinaryPromise_continueWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = [v5 BOOLValue];
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v8, v6);
  v10 = [v9 promiseAdapter];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingPromise, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
}

BOOL __44__AMSBinaryPromise_completionHandlerAdapter__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    return +[AMSMutableBinaryPromise finishPromise:v4 withSuccess:1];
  }
  else {
    return +[AMSMutableBinaryPromise finishPromise:v4 withError:a3];
  }
}

- (id)continueWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBinaryPromise *)self backingPromise];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__AMSBinaryPromise_continueWithBlock___block_invoke;
  v10[3] = &unk_1E55A0428;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 continueWithBlock:v10];
  uint64_t v8 = [v7 binaryPromiseAdapterForClass:objc_opt_class()];

  return v8;
}

- (id)completionHandlerAdapter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__AMSBinaryPromise_completionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E55A0478;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

void __38__AMSBinaryPromise_promiseWithSuccess__block_invoke()
{
  v0 = [AMSBinaryPromise alloc];
  id v3 = +[AMSFinishedPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  uint64_t v1 = [(AMSBinaryPromise *)v0 initWithBackingPromise:v3];
  v2 = (void *)qword_1EB38D6D8;
  qword_1EB38D6D8 = v1;
}

+ (id)promiseWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = +[AMSFinishedPromise promiseWithError:v4];

  uint64_t v7 = (void *)[v5 initWithBackingPromise:v6];
  return v7;
}

- (AMSBinaryPromise)init
{
  id v3 = objc_alloc_init(AMSMutablePromise);
  id v4 = [(AMSBinaryPromise *)self initWithBackingPromise:v3];

  return v4;
}

- (AMSBinaryPromise)initWithBackingPromise:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSBinaryPromise;
  id v6 = [(AMSBinaryPromise *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingPromise, a3);
    if ([v5 isFinished]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    objc_storeStrong((id *)&v7->_retainedSelf, v8);
  }

  return v7;
}

- (void)addFinishBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBinaryPromise *)self backingPromise];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__AMSBinaryPromise_addFinishBlock___block_invoke;
  v7[3] = &unk_1E55A0338;
  id v8 = v4;
  id v6 = v4;
  [v5 addFinishBlock:v7];
}

+ (id)promiseWithAll:(id)a3
{
  id v4 = objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_19);
  id v5 = +[AMSPromise promiseWithAll:v4];
  id v6 = [v5 binaryPromiseAdapterForClass:a1];

  return v6;
}

- (BOOL)resultWithError:(id *)a3
{
  id v4 = [(AMSBinaryPromise *)self backingPromise];
  id v5 = [v4 resultWithError:a3];
  LOBYTE(a3) = v5 != 0;

  return (char)a3;
}

+ (id)promiseWithAny:(id)a3
{
  id v4 = objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_3_0);
  id v5 = +[AMSPromise promiseWithAny:v4];
  id v6 = [v5 binaryPromiseAdapterForClass:a1];

  return v6;
}

uint64_t __35__AMSBinaryPromise_promiseWithAny___block_invoke(uint64_t a1, void *a2)
{
  return [a2 promiseAdapter];
}

+ (id)promiseWithFlattenedPromises:(id)a3
{
  id v4 = objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_6);
  id v5 = +[AMSPromise promiseWithAll:v4];
  id v6 = [v5 binaryPromiseAdapterForClass:a1];

  return v6;
}

uint64_t __49__AMSBinaryPromise_promiseWithFlattenedPromises___block_invoke(uint64_t a1, void *a2)
{
  return [a2 promiseAdapter];
}

+ (id)promiseWithPromise:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AMSMutableBinaryPromise);
  objc_initWeak(&location, v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__AMSBinaryPromise_promiseWithPromise___block_invoke;
  v8[3] = &unk_1E55A02E8;
  objc_copyWeak(&v9, &location);
  [v3 addSuccessBlock:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__AMSBinaryPromise_promiseWithPromise___block_invoke_2;
  v6[3] = &unk_1E55A0310;
  objc_copyWeak(&v7, &location);
  [v3 addErrorBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v4;
}

void __39__AMSBinaryPromise_promiseWithPromise___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishWithSuccess];
}

void __39__AMSBinaryPromise_promiseWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained finishWithError:v3];
}

- (void)resultWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(AMSBinaryPromise *)self backingPromise];
  id v8 = [v7 promiseWithTimeout:a3];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__AMSBinaryPromise_resultWithTimeout_completion___block_invoke;
  v13[3] = &unk_1E55A0388;
  id v9 = v6;
  id v14 = v9;
  [v8 addErrorBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__AMSBinaryPromise_resultWithTimeout_completion___block_invoke_2;
  v11[3] = &unk_1E55A03B0;
  id v12 = v9;
  id v10 = v9;
  [v8 addSuccessBlock:v11];
}

uint64_t __49__AMSBinaryPromise_resultWithTimeout_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__AMSBinaryPromise_resultWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = [(AMSBinaryPromise *)self backingPromise];
  id v7 = [v6 resultWithTimeout:a4 error:a3];
  LOBYTE(a4) = v7 != 0;

  return (char)a4;
}

- (void)waitUntilFinished
{
  id v2 = [(AMSBinaryPromise *)self backingPromise];
  [v2 waitUntilFinished];
}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v4 = [(AMSBinaryPromise *)self backingPromise];
  [v4 waitUntilFinishedWithTimeout:a3];
}

- (id)catchWithPromiseBlock:(id)a3 successValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSBinaryPromise *)self backingPromise];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__AMSBinaryPromise_catchWithPromiseBlock_successValue___block_invoke;
  v13[3] = &unk_1E55A0400;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = [v8 continueWithBlock:v13];

  return v11;
}

id __55__AMSBinaryPromise_catchWithPromiseBlock_successValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 BOOLValue]) {
    +[AMSPromise promiseWithResult:*(void *)(a1 + 32)];
  }
  else {
  id v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v6;
}

- (id)continueWithPromiseBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBinaryPromise *)self backingPromise];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__AMSBinaryPromise_continueWithPromiseBlock___block_invoke;
  v9[3] = &unk_1E55A0428;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 continueWithBlock:v9];

  return v7;
}

id __45__AMSBinaryPromise_continueWithPromiseBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);

  return v6;
}

- (id)thenWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBinaryPromise *)self backingPromise];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__AMSBinaryPromise_thenWithBlock___block_invoke;
  v10[3] = &unk_1E55A0450;
  id v11 = v4;
  id v6 = v4;
  id v7 = [v5 thenWithBlock:v10];
  id v8 = [v7 binaryPromiseAdapterForClass:objc_opt_class()];

  return v8;
}

id __34__AMSBinaryPromise_thenWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [v1 promiseAdapter];

  return v2;
}

- (id)thenWithPromiseBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBinaryPromise *)self backingPromise];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__AMSBinaryPromise_thenWithPromiseBlock___block_invoke;
  v9[3] = &unk_1E55A0450;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 thenWithBlock:v9];

  return v7;
}

uint64_t __41__AMSBinaryPromise_thenWithPromiseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AMSBinaryPromise)retainedSelf
{
  return self->_retainedSelf;
}

- (BOOL)cancel
{
  return +[AMSMutableBinaryPromise cancelPromise:self];
}

- (BOOL)finishWithError:(id)a3
{
  return +[AMSMutableBinaryPromise finishPromise:self withError:a3];
}

- (BOOL)finishWithPromise:(id)a3
{
  return +[AMSMutableBinaryPromise finishPromise:self withPromise:a3];
}

- (BOOL)finishWithSuccess
{
  return +[AMSMutableBinaryPromise finishPromise:self withSuccess:1];
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  return +[AMSMutableBinaryPromise finishPromise:self withSuccess:a3 error:a4];
}

@end