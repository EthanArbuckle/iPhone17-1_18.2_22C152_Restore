@interface HMFAsyncFuture
- (BOOL)_resolveWithState:(void *)a3 value:;
- (BOOL)isPending;
- (HMFAsyncFuture)_inContext:(void *)a3 then:(void *)a4 orRecover:;
- (_HMFFutureBlockOutcome)outcomeIfSettled;
- (id)inContext:(id)a3 recover:(id)a4;
- (id)inContext:(id)a3 then:(id)a4;
- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5;
- (id)recover:(id)a3;
- (id)then:(id)a3;
- (id)then:(id)a3 orRecover:(id)a4;
- (uint64_t)_callOrAddCompletionBlock:(uint64_t)a1;
- (uint64_t)initWithPromise:(uint64_t)a1;
- (void)getResultWithCompletion:(id)a3;
@end

@implementation HMFAsyncFuture

- (uint64_t)initWithPromise:(uint64_t)a1
{
  if (a1)
  {
    v4 = [HMFPromise alloc];
    *(_DWORD *)(a1 + 12) = 0;
    *(void *)(a1 + 16) = v4;
    objc_storeWeak((id *)&v4->_future, (id)a1);
    v5 = *a2;
    *a2 = v4;

    id v6 = (id)a1;
  }

  return a1;
}

- (BOOL)_resolveWithState:(void *)a3 value:
{
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    int v7 = *(_DWORD *)(a1 + 12);
    BOOL v8 = v7 == 0;
    if (!v7)
    {
      *(_DWORD *)(a1 + 12) = a2;
      *(void *)(a1 + 16) = 0;
      objc_storeStrong((id *)(a1 + 24), a3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isPending
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if ((unint64_t)(state - 1) < 2) {
    return 0;
  }
  if (!state) {
    return 1;
  }
  if (state != 3) {
    return 0;
  }
  id value = self->_value;
  return [value isPending];
}

- (_HMFFutureBlockOutcome)outcomeIfSettled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  switch(state)
  {
    case 3:
      int64_t v6 = [self->_value outcomeIfSettled];
      id v5 = v7;
      break;
    case 2:
      id v8 = self->_value;
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
      }
      id v5 = v10;

      int64_t v6 = 2;
      break;
    case 1:
      id v5 = self->_value;
      int64_t v6 = 1;
      break;
    default:
      int64_t v6 = 0;
      id v5 = 0;
      break;
  }
  v11 = v5;
  result.var1 = v11;
  result.var0 = v6;
  return result;
}

- (void)getResultWithCompletion:(id)a3
{
}

- (uint64_t)_callOrAddCompletionBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = *(int *)(a1 + 12);
    if (!v4)
    {
      -[HMFPromise _addCompletion:](*(void *)(a1 + 16), v3);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
LABEL_10:
      a1 = 1;
      goto LABEL_11;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v4 != 3)
    {
      if (v4 == 2)
      {
        (*((void (**)(id, void, void))v3 + 2))(v3, 0, *(void *)(a1 + 24));
      }
      else
      {
        if (v4 != 1)
        {
          a1 = 0;
          goto LABEL_11;
        }
        (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 24), 0);
      }
      goto LABEL_10;
    }
    a1 = -[HMFAsyncFuture _callOrAddCompletionBlock:](*(void *)(a1 + 24), v3);
  }
LABEL_11:

  return a1;
}

- (id)then:(id)a3
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, 0, a3, 0);
}

- (HMFAsyncFuture)_inContext:(void *)a3 then:(void *)a4 orRecover:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_25;
  }
  id v10 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock_with_options();
  uint64_t v11 = *(int *)(a1 + 12);
  if (!v11)
  {
    if (v7)
    {
      id v15 = v7;
    }
    else
    {
      HMFRequireCurrentAsyncContext();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v15;
    v31 = 0;
    v18 = [HMFAsyncFuture alloc];
    -[HMFAsyncFuture initWithPromise:]((uint64_t)v18, &v31);
    uint64_t v19 = *(void *)(a1 + 16);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke;
    v26[3] = &unk_1E59577D0;
    id v28 = v17;
    id v29 = v8;
    v20 = v31;
    id v27 = v31;
    id v30 = v9;
    id v21 = v17;
    id v22 = v20;
    -[HMFPromise _addCompletion:](v19, v26);

    os_unfair_lock_unlock(v10);
    goto LABEL_26;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  if (v11 == 3)
  {
    -[HMFAsyncFuture _inContext:then:orRecover:](*(void *)(a1 + 24), v7, v8, v9);
    v16 = (HMFAsyncFuture *)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v18 = v16;
    goto LABEL_26;
  }
  if (v11 == 2)
  {
    if (v9)
    {
      if (v7)
      {
        v12 = *(void **)(a1 + 24);
        v13 = v7;
        v14 = v9;
        goto LABEL_15;
      }
      uint64_t v23 = (*((uint64_t (**)(id, void))v9 + 2))(v9, *(void *)(a1 + 24));
      goto LABEL_21;
    }
LABEL_18:
    v16 = (HMFAsyncFuture *)(id)a1;
    goto LABEL_23;
  }
  if (v11 != 1) {
    goto LABEL_25;
  }
  if (!v8) {
    goto LABEL_18;
  }
  if (v7)
  {
    v12 = *(void **)(a1 + 24);
    v13 = v7;
    v14 = v8;
LABEL_15:
    +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, v13, v12, v14);
    v16 = (HMFAsyncFuture *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  uint64_t v23 = (*((uint64_t (**)(id, void))v8 + 2))(v8, *(void *)(a1 + 24));
LABEL_21:
  if (HMFFuture)
  {
    v16 = +[HMFFuture _futureWithOutcome:v24];
    goto LABEL_23;
  }

LABEL_25:
  v18 = 0;
LABEL_26:

  return v18;
}

- (id)inContext:(id)a3 then:(id)a4
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, a3, a4, 0);
}

- (id)recover:(id)a3
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, 0, 0, a3);
}

- (id)inContext:(id)a3 recover:(id)a4
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, a3, 0, a4);
}

- (id)then:(id)a3 orRecover:(id)a4
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, 0, a3, a4);
}

- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, a3, a4, a5);
}

void __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!*(void *)(a1 + 56))
    {
      [*(id *)(a1 + 32) rejectWithError:v6];
      goto LABEL_9;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke_3;
    v10[3] = &unk_1E59577A8;
    id v7 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    id v12 = v6;
    [v7 performBlock:v10];

    id v8 = v11;
  }
  else
  {
    if (!*(void *)(a1 + 48))
    {
      [*(id *)(a1 + 32) fulfillWithValue:v5];
      goto LABEL_9;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke_2;
    v14[3] = &unk_1E59577A8;
    id v9 = *(void **)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    id v16 = v5;
    [v9 performBlock:v14];

    id v8 = v15;
  }

LABEL_9:
}

void __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke_2(void *a1)
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

void __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke_3(void *a1)
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

- (void).cxx_destruct
{
}

@end