@interface _DKSync2State
- (void)addCompletionBlock:(uint64_t)a1;
- (void)finishWithError:(uint64_t)a1;
- (void)initWithType:(void *)a3 completion:;
@end

@implementation _DKSync2State

- (void)addCompletionBlock:(uint64_t)a1
{
  if (a1 && a2)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = (id)MEMORY[0x192FB31A0](a2);
    [v2 addObject:v3];
  }
}

- (void)initWithType:(void *)a3 completion:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)_DKSync2State;
    id v8 = objc_msgSendSuper2(&v14, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 2, a2);
      v9 = (void *)MEMORY[0x1E4F1CA48];
      v10 = (void *)MEMORY[0x192FB31A0](v7);
      uint64_t v11 = objc_msgSend(v9, "arrayWithObjects:", v10, 0);
      v12 = (void *)a1[4];
      a1[4] = v11;
    }
  }

  return a1;
}

- (void)finishWithError:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        v10 = v7;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          id v7 = (void (**)(void, void))MEMORY[0x192FB31A0](*(void *)(*((void *)&v12 + 1) + 8 * v9));

          ((void (**)(void, id))v7)[2](v7, v3);
          ++v9;
          v10 = v7;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (void)v12);
    uint64_t v11 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end