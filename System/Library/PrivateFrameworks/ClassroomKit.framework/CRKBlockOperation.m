@interface CRKBlockOperation
+ (id)blockOperationWithBlock:(id)a3;
- (BOOL)isAsynchronous;
- (CRKBlockOperation)initWithOperationBlock:(id)a3;
- (id)operationBlock;
- (void)cancel;
- (void)main;
@end

@implementation CRKBlockOperation

- (CRKBlockOperation)initWithOperationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKBlockOperation;
  v5 = [(CRKBlockOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A620AF0](v4);
    id operationBlock = v5->_operationBlock;
    v5->_id operationBlock = (id)v6;
  }
  return v5;
}

+ (id)blockOperationWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOperationBlock:v3];

  return v4;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v7.receiver = self;
  v7.super_class = (Class)CRKBlockOperation;
  [(CRKBlockOperation *)&v7 cancel];
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x263EFF9F0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__CRKBlockOperation_cancel__block_invoke;
  v4[3] = &unk_2646F3D40;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "cat_performBlockOnMainRunLoop:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __27__CRKBlockOperation_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isExecuting])
  {
    v1 = CATErrorWithCodeAndUserInfo();
    [WeakRetained endOperationWithError:v1];
  }
}

- (void)main
{
  objc_initWeak(&location, self);
  id v3 = [(CRKBlockOperation *)self operationBlock];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__CRKBlockOperation_main__block_invoke;
  v6[3] = &unk_2646F4DA8;
  objc_copyWeak(&v7, &location);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__CRKBlockOperation_main__block_invoke_2;
  v4[3] = &unk_2646F4DD0;
  objc_copyWeak(&v5, &location);
  ((void (**)(void, void *, void *))v3)[2](v3, v6, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __25__CRKBlockOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isExecuting])
  {
    id v5 = objc_loadWeakRetained(v3);
    [v5 endOperationWithResultObject:v6];
  }
}

void __25__CRKBlockOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isExecuting])
  {
    id v5 = objc_loadWeakRetained(v3);
    [v5 endOperationWithError:v6];
  }
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (void).cxx_destruct
{
}

@end