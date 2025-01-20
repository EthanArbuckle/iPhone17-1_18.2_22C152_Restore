@interface AAFPromise
+ (id)all:(id)a3;
- (AAFPromise)initWithBlock:(id)a3;
- (AAFPromise)initWithError:(id)a3;
- (AAFPromise)initWithValue:(id)a3;
- (id)_chain:(id)a3;
- (id)_placeBlock:(id)a3 onQueue:(id)a4;
- (id)catch;
- (id)catch:(id)a3;
- (id)catch:(id)a3 onQueue:(id)a4;
- (id)catchOnQueue;
- (id)then;
- (id)then:(id)a3;
- (id)then:(id)a3 onQueue:(id)a4;
- (id)thenOnQueue;
- (void)_completeWithValue:(id)a3 error:(id)a4;
- (void)_handleChainingResult:(id)a3 withCompletion:(id)a4;
- (void)_startWithBlock:(id)a3;
- (void)abortWithError:(id)a3;
- (void)onComplete:(id)a3;
- (void)onComplete:(id)a3 onQueue:(id)a4;
@end

@implementation AAFPromise

uint64_t __18__AAFPromise_then__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) then:a2];
}

- (id)then
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __18__AAFPromise_then__block_invoke;
  v4[3] = &unk_1E6CFAE30;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1E01C0AA0](v4, a2);
  return v2;
}

void __25__AAFPromise_onComplete___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    v4 = v2;
    v5 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __25__AAFPromise_onComplete___block_invoke_2;
    v11 = &unk_1E6CFACA0;
    id v12 = v4;
    id v13 = *(id *)(a1 + 40);
    v6 = v4;
    v7 = (void *)MEMORY[0x1E01C0AA0](&v8);
    objc_msgSend(v5, "addObject:", v7, v8, v9, v10, v11);
  }
}

- (id)catch:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __20__AAFPromise_catch___block_invoke;
  v8[3] = &unk_1E6CFAD18;
  id v9 = v4;
  id v5 = v4;
  v6 = [(AAFPromise *)self _chain:v8];

  return v6;
}

- (AAFPromise)initWithError:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__AAFPromise_initWithError___block_invoke;
  v8[3] = &unk_1E6CFAB88;
  id v9 = v4;
  id v5 = v4;
  v6 = [(AAFPromise *)self initWithBlock:v8];

  return v6;
}

- (AAFPromise)initWithValue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__AAFPromise_initWithValue___block_invoke;
  v8[3] = &unk_1E6CFAB88;
  id v9 = v4;
  id v5 = v4;
  v6 = [(AAFPromise *)self initWithBlock:v8];

  return v6;
}

- (id)then:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __19__AAFPromise_then___block_invoke;
  v8[3] = &unk_1E6CFAD18;
  id v9 = v4;
  id v5 = v4;
  v6 = [(AAFPromise *)self _chain:v8];

  return v6;
}

- (id)_chain:(id)a3
{
  id v4 = a3;
  id v5 = [AAFPromise alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __21__AAFPromise__chain___block_invoke;
  v9[3] = &unk_1E6CFAC28;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [(AAFPromise *)v5 initWithBlock:v9];

  return v7;
}

void __39__AAFPromise__completeWithValue_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 48));
    id v3 = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __25__AAFPromise_onComplete___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __21__AAFPromise__chain___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _handleChainingResult:v2 withCompletion:*(void *)(a1 + 48)];
}

id __19__AAFPromise_then___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;

  return v7;
}

id __20__AAFPromise_catch___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (AAFPromise)initWithBlock:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAFPromise;
  id v5 = [(AAFPromise *)&v12 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.AAAFoundation.AAFPromise", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    callbacks = v5->_callbacks;
    v5->_callbacks = (NSMutableArray *)v9;

    [(AAFPromise *)v5 _startWithBlock:v4];
  }

  return v5;
}

- (void)_startWithBlock:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AAFPromise__startWithBlock___block_invoke;
  v5[3] = &unk_1E6CFABB0;
  v5[4] = self;
  id v3 = (void (**)(id, void *))a3;
  id v4 = (void *)MEMORY[0x1E01C0AA0](v5);
  v3[2](v3, v4);
}

void __21__AAFPromise__chain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__AAFPromise__chain___block_invoke_2;
  v7[3] = &unk_1E6CFAC00;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  [v4 onComplete:v7];
}

- (void)onComplete:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__AAFPromise_onComplete___block_invoke;
  v7[3] = &unk_1E6CFACC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleChainingResult:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 onComplete:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = 0;
      id v8 = v9;
    }
    else
    {
      id v6 = v5;
      id v7 = v9;
      id v8 = 0;
    }
    (*((void (**)(id, id, id))v5 + 2))(v6, v7, v8);
  }
}

uint64_t __30__AAFPromise__startWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _completeWithValue:a2 error:a3];
}

- (void)_completeWithValue:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AAFPromise__completeWithValue_error___block_invoke;
  block[3] = &unk_1E6CFABD8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __28__AAFPromise_initWithValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0);
}

uint64_t __28__AAFPromise_initWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t __19__AAFPromise_catch__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) catch:a2];
}

- (id)catch
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __19__AAFPromise_catch__block_invoke;
  v4[3] = &unk_1E6CFAE80;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x1E01C0AA0](v4, a2);
  return v2;
}

- (void)abortWithError:(id)a3
{
}

- (id)_placeBlock:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [AAFPromise alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__AAFPromise__placeBlock_onQueue___block_invoke;
  v13[3] = &unk_1E6CFAC78;
  id v14 = v7;
  v15 = self;
  id v16 = v6;
  id v9 = v6;
  id v10 = v7;
  long long v11 = [(AAFPromise *)v8 initWithBlock:v13];

  return v11;
}

void __34__AAFPromise__placeBlock_onQueue___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AAFPromise__placeBlock_onQueue___block_invoke_2;
  block[3] = &unk_1E6CFAC50;
  id v4 = a1[4];
  id v5 = (void *)a1[6];
  block[4] = a1[5];
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __34__AAFPromise__placeBlock_onQueue___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  (*(void (**)(void))(a1[5] + 16))();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _handleChainingResult:v3 withCompletion:a1[6]];
}

- (void)onComplete:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__AAFPromise_onComplete_onQueue___block_invoke;
  v10[3] = &unk_1E6CFACA0;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(AAFPromise *)self onComplete:v10];
}

void __33__AAFPromise_onComplete_onQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AAFPromise_onComplete_onQueue___block_invoke_2;
  block[3] = &unk_1E6CFACF0;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __33__AAFPromise_onComplete_onQueue___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)then:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __27__AAFPromise_then_onQueue___block_invoke;
  v12[3] = &unk_1E6CFAD68;
  id v13 = v7;
  id v14 = v6;
  v12[4] = self;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(AAFPromise *)self then:v12];

  return v10;
}

id __27__AAFPromise_then_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__AAFPromise_then_onQueue___block_invoke_2;
  v10[3] = &unk_1E6CFAD40;
  id v5 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v5;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v3;
  id v8 = [v4 _placeBlock:v10 onQueue:v6];

  return v8;
}

uint64_t __27__AAFPromise_then_onQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)catch:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__AAFPromise_catch_onQueue___block_invoke;
  v12[3] = &unk_1E6CFAD68;
  id v13 = v7;
  id v14 = v6;
  v12[4] = self;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(AAFPromise *)self catch:v12];

  return v10;
}

id __28__AAFPromise_catch_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__AAFPromise_catch_onQueue___block_invoke_2;
  v10[3] = &unk_1E6CFAD40;
  id v5 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v5;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v3;
  id v8 = [v4 _placeBlock:v10 onQueue:v6];

  return v8;
}

uint64_t __28__AAFPromise_catch_onQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)all:(id)a3
{
  id v3 = (void *)[a3 copy];
  id v4 = [AAFPromise alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __18__AAFPromise_all___block_invoke;
  v8[3] = &unk_1E6CFAB88;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [(AAFPromise *)v4 initWithBlock:v8];

  return v6;
}

void __18__AAFPromise_all___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v5 = dispatch_group_create();
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.AAAFoundation.AAFPromise.all", 0);
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [MEMORY[0x1E4F1CA98] null];
      [v4 addObject:v8];

      dispatch_group_enter(v5);
      ++v7;
    }
    while ([*(id *)(a1 + 32) count] > v7);
  }
  id v9 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __18__AAFPromise_all___block_invoke_2;
  v20[3] = &unk_1E6CFADE0;
  id v10 = v3;
  id v24 = v10;
  dispatch_queue_t v21 = v6;
  id v11 = v4;
  id v22 = v11;
  v23 = v5;
  id v12 = v5;
  id v13 = v6;
  [v9 enumerateObjectsUsingBlock:v20];
  id v14 = dispatch_get_global_queue(21, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __18__AAFPromise_all___block_invoke_5;
  v17[3] = &unk_1E6CFAE08;
  id v18 = v11;
  id v19 = v10;
  id v15 = v11;
  id v16 = v10;
  dispatch_group_notify(v12, v14, v17);
}

void __18__AAFPromise_all___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __18__AAFPromise_all___block_invoke_3;
  v6[3] = &unk_1E6CFADB8;
  id v10 = a1[7];
  id v7 = a1[4];
  id v8 = a1[5];
  uint64_t v11 = a3;
  id v9 = a1[6];
  [a2 onComplete:v6];
}

void __18__AAFPromise_all___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __18__AAFPromise_all___block_invoke_4;
    block[3] = &unk_1E6CFAD90;
    id v7 = *(NSObject **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 64);
    id v11 = v8;
    uint64_t v13 = v9;
    id v12 = v5;
    dispatch_sync(v7, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __18__AAFPromise_all___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) atIndexedSubscript:*(void *)(a1 + 48)];
}

void __18__AAFPromise_all___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (id)thenOnQueue
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__AAFPromise_thenOnQueue__block_invoke;
  v4[3] = &unk_1E6CFAE58;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x1E01C0AA0](v4, a2);
  return v2;
}

uint64_t __25__AAFPromise_thenOnQueue__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) then:a3 onQueue:a2];
}

- (id)catchOnQueue
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__AAFPromise_catchOnQueue__block_invoke;
  v4[3] = &unk_1E6CFAE58;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x1E01C0AA0](v4, a2);
  return v2;
}

uint64_t __26__AAFPromise_catchOnQueue__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) catch:a3 onQueue:a2];
}

@end