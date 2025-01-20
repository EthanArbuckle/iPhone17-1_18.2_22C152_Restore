@interface ASDPromise
+ (ASDPromise)promiseWithError:(id)a3;
+ (ASDPromise)promiseWithValue:(id)a3;
+ (id)onScheduler:(id)a3 usingBlock:(id)a4;
- (ASDPromise)init;
- (ASDPromise)initWithError:(id)a3;
- (ASDPromise)initWithValue:(id)a3;
- (ASDPromiseResult)result;
- (BOOL)isResolved;
- (id)completionHandlerAdapter;
- (id)flatMapUsingTransformer:(id)a3 onScheduler:(id)a4;
- (id)initOnScheduler:(id)a3 withExecutor:(id)a4;
- (id)initWithState:(void *)a3 result:;
- (id)joinWithPromise:(id)a3;
- (id)mapUsingTransformer:(id)a3 onScheduler:(id)a4;
- (void)_invokeExecutor:(void *)a3 onScheduler:;
- (void)alwaysPerform:(id)a3 onScheduler:(id)a4;
- (void)catchError:(id)a3 onScheduler:(id)a4;
- (void)rejectWithError:(id)a3;
- (void)resolveWithValue:(id)a3;
- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5;
@end

@implementation ASDPromise

uint64_t __51__ASDPromise_thenPerform_orCatchError_onScheduler___block_invoke(void *a1)
{
  v2 = [[ASDPromiseObserver alloc] initWithValueBlock:a1[6] errorBlock:a1[7] scheduler:a1[4]];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(v3 + 16);
  switch(v4)
  {
    case 2:
      v8 = v2;
      v5 = [(id)v3 result];
      v6 = [v5 error];
      [(ASDPromiseObserver *)v8 notifyRejectedWithError:v6];
LABEL_7:

      break;
    case 1:
      v9 = v2;
      v5 = [(id)v3 result];
      v6 = [v5 value];
      [(ASDPromiseObserver *)v9 notifyResolvedWithValue:v6];
      goto LABEL_7;
    case 0:
      [*(id *)(v3 + 8) addObject:v2];
      break;
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __31__ASDPromise_resolveWithValue___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Promises may only be resolved once!"];
  }
  uint64_t v2 = +[ASDPromiseResult resultWithValue:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  *(void *)(*(void *)(a1 + 32) + 16) = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 8);
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "notifyResolvedWithValue:", *(void *)(a1 + 40), (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

uint64_t __40__ASDPromise_alwaysPerform_onScheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __38__ASDPromise_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 resolveWithValue:a2];
  }
  else {
    return objc_msgSend(v2, "rejectWithError:");
  }
}

- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  stateLock = self->_stateLock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__ASDPromise_thenPerform_orCatchError_onScheduler___block_invoke;
  v15[3] = &unk_1E58B4C00;
  id v18 = v8;
  id v19 = v9;
  id v16 = v10;
  v17 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  ASDWithLock(stateLock, v15);
}

- (ASDPromise)init
{
  return (ASDPromise *)-[ASDPromise initWithState:result:]((id *)&self->super.isa, 0, 0);
}

- (id)initWithState:(void *)a3 result:
{
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)ASDPromise;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28FD0]);
      id v8 = a1[3];
      a1[3] = v7;

      a1[2] = a2;
      objc_storeStrong(a1 + 4, a3);
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v10 = a1[1];
      a1[1] = v9;
    }
  }

  return a1;
}

- (id)completionHandlerAdapter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__ASDPromise_completionHandlerAdapter__block_invoke;
  v4[3] = &unk_1E58B4CA0;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x19F393180](v4, a2);
  return v2;
}

- (void)alwaysPerform:(id)a3 onScheduler:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__ASDPromise_alwaysPerform_onScheduler___block_invoke;
  v10[3] = &unk_1E58B4BB8;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__ASDPromise_alwaysPerform_onScheduler___block_invoke_2;
  v8[3] = &unk_1E58B2CB8;
  id v9 = v11;
  id v7 = v11;
  [(ASDPromise *)self thenPerform:v10 orCatchError:v8 onScheduler:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)resolveWithValue:(id)a3
{
  id v4 = a3;
  stateLock = self->_stateLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__ASDPromise_resolveWithValue___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(stateLock, v7);
}

+ (id)onScheduler:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initOnScheduler:v7 withExecutor:v6];

  return v8;
}

+ (ASDPromise)promiseWithValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4];

  return (ASDPromise *)v5;
}

+ (ASDPromise)promiseWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithError:v4];

  return (ASDPromise *)v5;
}

- (ASDPromise)initWithValue:(id)a3
{
  id v4 = +[ASDPromiseResult resultWithValue:a3];
  id v5 = (ASDPromise *)-[ASDPromise initWithState:result:]((id *)&self->super.isa, (void *)1, v4);

  return v5;
}

- (ASDPromise)initWithError:(id)a3
{
  id v4 = +[ASDPromiseResult resultWithError:a3];
  id v5 = (ASDPromise *)-[ASDPromise initWithState:result:]((id *)&self->super.isa, (void *)2, v4);

  return v5;
}

- (id)initOnScheduler:(id)a3 withExecutor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASDPromise *)self init];
  id v9 = v8;
  if (v8) {
    -[ASDPromise _invokeExecutor:onScheduler:]((uint64_t)v8, v7, v6);
  }

  return v9;
}

- (void)_invokeExecutor:(void *)a3 onScheduler:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__ASDPromise__invokeExecutor_onScheduler___block_invoke;
    v7[3] = &unk_1E58B2E18;
    v7[4] = a1;
    id v8 = v5;
    [a3 scheduleBlock:v7];
  }
}

- (BOOL)isResolved
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateLock = self->_stateLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__ASDPromise_isResolved__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(stateLock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__ASDPromise_isResolved__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16) != 0;
  return result;
}

uint64_t __40__ASDPromise_alwaysPerform_onScheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)catchError:(id)a3 onScheduler:(id)a4
{
}

- (id)mapUsingTransformer:(id)a3 onScheduler:(id)a4
{
  id v6 = a3;
  id v7 = (ASDSyncTaskScheduler *)a4;
  uint64_t v8 = objc_alloc_init(ASDPromise);
  if (!v7) {
    id v7 = objc_alloc_init(ASDSyncTaskScheduler);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__ASDPromise_mapUsingTransformer_onScheduler___block_invoke;
  v16[3] = &unk_1E58B4888;
  id v18 = v6;
  v17 = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__ASDPromise_mapUsingTransformer_onScheduler___block_invoke_2;
  v14[3] = &unk_1E58B2F08;
  char v9 = v17;
  v15 = v9;
  id v10 = v6;
  [(ASDPromise *)self thenPerform:v16 orCatchError:v14 onScheduler:v7];
  id v11 = v15;
  objc_super v12 = v9;

  return v12;
}

void __46__ASDPromise_mapUsingTransformer_onScheduler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) resolveWithValue:v2];
}

uint64_t __46__ASDPromise_mapUsingTransformer_onScheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rejectWithError:a2];
}

- (id)flatMapUsingTransformer:(id)a3 onScheduler:(id)a4
{
  id v6 = a3;
  id v7 = (ASDSyncTaskScheduler *)a4;
  uint64_t v8 = objc_alloc_init(ASDPromise);
  if (!v7) {
    id v7 = objc_alloc_init(ASDSyncTaskScheduler);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke;
  v17[3] = &unk_1E58B4C50;
  id v20 = v6;
  id v18 = v8;
  id v19 = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_4;
  v15[3] = &unk_1E58B2F08;
  char v9 = v18;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  [(ASDPromise *)self thenPerform:v17 orCatchError:v15 onScheduler:v10];
  objc_super v12 = v16;
  id v13 = v9;

  return v13;
}

void __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke(uint64_t a1)
{
  id v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_2;
  v5[3] = &unk_1E58B4C28;
  id v6 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_3;
  v3[3] = &unk_1E58B2F08;
  id v4 = *(id *)(a1 + 32);
  [v2 thenPerform:v5 orCatchError:v3 onScheduler:*(void *)(a1 + 40)];
}

uint64_t __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolveWithValue:a2];
}

uint64_t __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rejectWithError:a2];
}

uint64_t __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rejectWithError:a2];
}

- (id)joinWithPromise:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ASDPromise);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __30__ASDPromise_joinWithPromise___block_invoke;
  v14[3] = &unk_1E58B4C78;
  id v15 = v4;
  id v16 = v5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __30__ASDPromise_joinWithPromise___block_invoke_4;
  v12[3] = &unk_1E58B2F08;
  id v6 = v16;
  id v13 = v6;
  id v7 = v4;
  uint64_t v8 = objc_opt_new();
  [(ASDPromise *)self thenPerform:v14 orCatchError:v12 onScheduler:v8];

  char v9 = v13;
  id v10 = v6;

  return v10;
}

void __30__ASDPromise_joinWithPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__ASDPromise_joinWithPromise___block_invoke_2;
  v9[3] = &unk_1E58B4C78;
  id v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__ASDPromise_joinWithPromise___block_invoke_3;
  v7[3] = &unk_1E58B2F08;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = objc_opt_new();
  [v4 thenPerform:v9 orCatchError:v7 onScheduler:v6];
}

void __30__ASDPromise_joinWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v6[0] = *(void *)(a1 + 40);
  v6[1] = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v6 count:2];
  [v2 resolveWithValue:v5];
}

uint64_t __30__ASDPromise_joinWithPromise___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rejectWithError:a2];
}

uint64_t __30__ASDPromise_joinWithPromise___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rejectWithError:a2];
}

- (void)rejectWithError:(id)a3
{
  id v4 = a3;
  stateLock = self->_stateLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__ASDPromise_rejectWithError___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(stateLock, v7);
}

uint64_t __30__ASDPromise_rejectWithError___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Promises may only be resolved once!"];
  }
  uint64_t v2 = +[ASDPromiseResult resultWithError:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  *(void *)(*(void *)(a1 + 32) + 16) = 2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 8);
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "notifyRejectedWithError:", *(void *)(a1 + 40), (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

uint64_t __42__ASDPromise__invokeExecutor_onScheduler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__ASDPromise__invokeExecutor_onScheduler___block_invoke_2;
  v4[3] = &unk_1E58B4C28;
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__ASDPromise__invokeExecutor_onScheduler___block_invoke_3;
  v3[3] = &unk_1E58B2F08;
  void v3[4] = v5;
  return (*(uint64_t (**)(uint64_t, void *, void *))(v1 + 16))(v1, v4, v3);
}

uint64_t __42__ASDPromise__invokeExecutor_onScheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolveWithValue:a2];
}

uint64_t __42__ASDPromise__invokeExecutor_onScheduler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rejectWithError:a2];
}

- (ASDPromiseResult)result
{
  return (ASDPromiseResult *)objc_getProperty(self, a2, 32, 1);
}

@end