@interface INImageProxyInjectionOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (INImageProxyInjecting)injector;
- (id)copyReturnBlock;
- (id)imageProxyRequestBlock;
- (void)setCopyReturnBlock:(id)a3;
- (void)setImageProxyRequestBlock:(id)a3;
- (void)setInjector:(id)a3;
- (void)start;
@end

@implementation INImageProxyInjectionOperation

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setInjector:(id)a3
{
}

- (void)setImageProxyRequestBlock:(id)a3
{
}

- (void)setCopyReturnBlock:(id)a3
{
}

void __39__INImageProxyInjectionOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  v3 = [*(id *)(a1 + 32) copyReturnBlock];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) copyReturnBlock];
    ((void (**)(void, id))v4)[2](v4, v7);
  }
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 1;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isFinished"];
  v5 = [*(id *)(a1 + 32) completionBlock];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) completionBlock];
    v6[2]();
  }
}

- (id)copyReturnBlock
{
  return self->_copyReturnBlock;
}

- (void)start
{
  self->_isExecuting = 1;
  v3 = [(INImageProxyInjectionOperation *)self injector];
  v4 = [(INImageProxyInjectionOperation *)self imageProxyRequestBlock];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__INImageProxyInjectionOperation_start__block_invoke;
  v5[3] = &unk_1E551E178;
  v5[4] = self;
  [v3 _injectProxiesForImages:v4 completion:v5];
}

- (INImageProxyInjecting)injector
{
  return self->_injector;
}

- (id)imageProxyRequestBlock
{
  return self->_imageProxyRequestBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyReturnBlock, 0);
  objc_storeStrong(&self->_imageProxyRequestBlock, 0);

  objc_storeStrong((id *)&self->_injector, 0);
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end