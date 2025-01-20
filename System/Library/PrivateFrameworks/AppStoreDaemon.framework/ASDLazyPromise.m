@interface ASDLazyPromise
- (id)initOnScheduler:(id)a3 withExecutor:(id)a4;
- (id)joinWithPromise:(id)a3;
- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5;
@end

@implementation ASDLazyPromise

- (id)initOnScheduler:(id)a3 withExecutor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASDLazyPromise;
  v9 = [(ASDPromise *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id executor = v9->_executor;
    v9->_id executor = (id)v10;

    objc_storeStrong((id *)&v9->_scheduler, a3);
  }

  return v9;
}

- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5
{
  stateLock = self->super._stateLock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__ASDLazyPromise_thenPerform_orCatchError_onScheduler___block_invoke;
  v13[3] = &unk_1E58B2EB8;
  v13[4] = self;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  ASDWithLock(stateLock, v13);
  v12.receiver = self;
  v12.super_class = (Class)ASDLazyPromise;
  [(ASDPromise *)&v12 thenPerform:v11 orCatchError:v10 onScheduler:v9];
}

void __55__ASDLazyPromise_thenPerform_orCatchError_onScheduler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    -[ASDPromise _invokeExecutor:onScheduler:](v2, v3, *(void **)(v2 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

- (id)joinWithPromise:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  objc_super v12 = __34__ASDLazyPromise_joinWithPromise___block_invoke;
  objc_super v13 = &unk_1E58B4CF0;
  v14 = self;
  id v15 = v4;
  id v5 = v4;
  v6 = (void *)MEMORY[0x19F393180](&v10);
  id v7 = +[ASDSyncTaskScheduler sharedInstance]();
  id v8 = +[ASDPromise onScheduler:usingBlock:](ASDLazyPromise, "onScheduler:usingBlock:", v7, v6, v10, v11, v12, v13, v14);

  return v8;
}

void __34__ASDLazyPromise_joinWithPromise___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__ASDLazyPromise_joinWithPromise___block_invoke_2;
  v13[3] = &unk_1E58B4CC8;
  id v7 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__ASDLazyPromise_joinWithPromise___block_invoke_5;
  v11[3] = &unk_1E58B2CB8;
  id v12 = v16;
  id v8 = v16;
  id v9 = v5;
  uint64_t v10 = objc_opt_new();
  [v7 thenPerform:v13 orCatchError:v11 onScheduler:v10];
}

void __34__ASDLazyPromise_joinWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__ASDLazyPromise_joinWithPromise___block_invoke_3;
  v10[3] = &unk_1E58B4888;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__ASDLazyPromise_joinWithPromise___block_invoke_4;
  v8[3] = &unk_1E58B2CB8;
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  id v7 = objc_opt_new();
  [v4 thenPerform:v10 orCatchError:v8 onScheduler:v7];
}

void __34__ASDLazyPromise_joinWithPromise___block_invoke_3(uint64_t a1, void *a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v6[1] = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v6 count:2];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

uint64_t __34__ASDLazyPromise_joinWithPromise___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __34__ASDLazyPromise_joinWithPromise___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_executor, 0);
}

@end