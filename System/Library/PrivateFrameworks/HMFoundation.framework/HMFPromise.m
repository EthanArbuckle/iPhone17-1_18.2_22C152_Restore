@interface HMFPromise
- (BOOL)fulfillWithNoValue;
- (BOOL)fulfillWithValue:(id)a3;
- (BOOL)rejectWithError:(id)a3;
- (BOOL)resolveWithFuture:(id)a3;
- (id)errorOnlyResolverBlock;
- (id)resolverBlock;
- (id)voidResolverBlock;
- (uint64_t)resolveWithOutcome:(void *)a3;
- (void)_addCompletion:(uint64_t)a1;
- (void)dealloc;
@end

@implementation HMFPromise

- (uint64_t)resolveWithOutcome:(void *)a3
{
  v3 = a3;
  if (a1 && (atomic_exchange((atomic_uchar *volatile)(a1 + 24), 1u) & 1) == 0)
  {
    uint64_t v5 = a2;
    if (a2 == 3)
    {
      uint64_t v5 = [a3 outcomeIfSettled];
      v7 = v6;
      if (v5)
      {
        id v8 = v6;

        v3 = v8;
      }
      else
      {
        uint64_t v5 = 3;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v11 = WeakRetained;
    if (WeakRetained)
    {
      if (!-[HMFAsyncFuture _resolveWithState:value:]((uint64_t)WeakRetained, v5, v3))
      {
        uint64_t v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
      objc_storeWeak((id *)(a1 + 8), 0);
    }
    v12 = (void (**)(void, void, void))MEMORY[0x19F3A8A20](*(void *)(a1 + 16));
    if (v12)
    {
      v13 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;

      if (v5 == 1)
      {
        v14 = 0;
        v15 = v3;
      }
      else
      {
        if (v5 != 2)
        {
          if (v5 == 3) {
            uint64_t v9 = -[HMFAsyncFuture _callOrAddCompletionBlock:]((uint64_t)v3, v12);
          }
          else {
            uint64_t v9 = 0;
          }
          goto LABEL_22;
        }
        v15 = 0;
        v14 = v3;
      }
      ((void (**)(void, void *, void *))v12)[2](v12, v15, v14);
    }
    uint64_t v9 = 1;
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v9 = 0;
LABEL_24:

  return v9;
}

- (void)_addCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x19F3A8A20](*(void *)(a1 + 16));
    uint64_t v5 = v4;
    if (v4)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __29__HMFPromise__addCompletion___block_invoke;
      v10[3] = &unk_1E59577F8;
      id v11 = v4;
      id v12 = v3;
      uint64_t v8 = MEMORY[0x19F3A8A20](v10);
      uint64_t v9 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v8;

      v7 = v11;
    }
    else
    {
      uint64_t v6 = MEMORY[0x19F3A8A20](v3);
      v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;
    }
  }
}

- (void)dealloc
{
  __swp(self + 24, (unsigned int *)&self->_resolved);
  if (((self + 24) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_future);
    if (WeakRetained || self->_completion)
    {
      v4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:18];
      -[HMFAsyncFuture _resolveWithState:value:]((uint64_t)WeakRetained, 2, v4);
      completion = (void (**)(id, void, void *))self->_completion;
      if (completion) {
        completion[2](completion, 0, v4);
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)HMFPromise;
  [(HMFPromise *)&v6 dealloc];
}

void __29__HMFPromise__addCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  objc_super v6 = *(void (**)(uint64_t, id, id))(v5 + 16);
  id v7 = a3;
  id v9 = a2;
  v6(v5, v9, v7);
  uint64_t v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)fulfillWithValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self) {
    LOBYTE(self) = [(HMFPromise *)(uint64_t)self resolveWithOutcome:v4];
  }
  else {

  }
  return (char)self;
}

- (BOOL)rejectWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
  }
  id v7 = v6;

  if (self) {
    LOBYTE(self) = [(HMFPromise *)(uint64_t)self resolveWithOutcome:v7];
  }
  else {

  }
  return (char)self;
}

- (BOOL)resolveWithFuture:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure(@"future");
  }
  uint64_t v5 = v4;
  if (self) {
    LOBYTE(self) = [(HMFPromise *)(uint64_t)self resolveWithOutcome:v4];
  }
  else {

  }
  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_future);
}

- (BOOL)fulfillWithNoValue
{
  if (self) {
    LOBYTE(self) = [(HMFPromise *)(uint64_t)self resolveWithOutcome:0];
  }
  return (char)self;
}

- (id)resolverBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__HMFPromise_Convenience__resolverBlock__block_invoke;
  v4[3] = &unk_1E5957C58;
  v4[4] = self;
  v2 = (void *)MEMORY[0x19F3A8A20](v4, a2);
  return v2;
}

void __40__HMFPromise_Convenience__resolverBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = v10;
  }
  if (v5) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = v7;
  if (v6) {
    [(HMFPromise *)v6 resolveWithOutcome:v9];
  }
  else {
}
  }

- (id)errorOnlyResolverBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__HMFPromise_Convenience__errorOnlyResolverBlock__block_invoke;
  v4[3] = &unk_1E5957650;
  v4[4] = self;
  v2 = (void *)MEMORY[0x19F3A8A20](v4, a2);
  return v2;
}

void __49__HMFPromise_Convenience__errorOnlyResolverBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = 2;
    if (v4)
    {
LABEL_3:
      [(HMFPromise *)v4 resolveWithOutcome:v7];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 1;
    if (v4) {
      goto LABEL_3;
    }
  }

LABEL_6:
}

- (id)voidResolverBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__HMFPromise_Convenience__voidResolverBlock__block_invoke;
  v4[3] = &unk_1E5957698;
  v4[4] = self;
  v2 = (void *)MEMORY[0x19F3A8A20](v4, a2);
  return v2;
}

uint64_t __44__HMFPromise_Convenience__voidResolverBlock__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return [(HMFPromise *)result resolveWithOutcome:0];
  }
  return result;
}

@end