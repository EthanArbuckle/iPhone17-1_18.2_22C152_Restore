@interface LACCacheAsync
- (LACCacheAsync)initWithTimeout:(double)a3 block:(id)a4;
- (void)valueWithParameter:(id)a3 completion:(id)a4;
@end

@implementation LACCacheAsync

- (LACCacheAsync)initWithTimeout:(double)a3 block:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LACCacheAsync;
  v7 = [(LACCache *)&v11 initWithTimeout:a3];
  if (v7)
  {
    v8 = _Block_copy(v6);
    id block = v7->_block;
    v7->_id block = v8;
  }
  return v7;
}

- (void)valueWithParameter:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [(LACCache *)self cachedValueWithParameter:v6];
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    id block = (void (**)(id, id, void *))self->_block;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__LACCacheAsync_valueWithParameter_completion___block_invoke;
    v10[3] = &unk_2653B7158;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    v12 = v7;
    block[2](block, v11, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __47__LACCacheAsync_valueWithParameter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCachedValue:v8 withParameter:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void).cxx_destruct
{
}

@end