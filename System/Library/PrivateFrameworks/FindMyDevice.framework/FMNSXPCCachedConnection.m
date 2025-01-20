@interface FMNSXPCCachedConnection
- (FMNSXPCCachedConnection)initWithFMNSXPCConnection:(id)a3;
- (FMNSXPCConnection)connection;
- (OS_dispatch_queue)serialQueue;
- (id)didInvalidate;
- (id)failureBlock;
- (id)remoteObjectProxy;
- (void)_invalidate;
- (void)addFailureBlock:(id)a3;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setDidInvalidate:(id)a3;
- (void)setFailureBlock:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMNSXPCCachedConnection

void __37__FMNSXPCCachedConnection_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_didInvalidate, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  v3 = [(FMNSXPCCachedConnection *)self serialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__FMNSXPCCachedConnection_invalidate__block_invoke;
  v4[3] = &unk_1E689C3E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (FMNSXPCCachedConnection)initWithFMNSXPCConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMNSXPCCachedConnection;
  id v5 = [(FMNSXPCCachedConnection *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(FMNSXPCCachedConnection *)v5 setConnection:v4];
    dispatch_queue_t v7 = dispatch_queue_create("FMNSXPCCachedConnectionSerialQueue", 0);
    [(FMNSXPCCachedConnection *)v6 setSerialQueue:v7];
  }
  return v6;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)addFailureBlock:(id)a3
{
  id v4 = a3;
  [(FMNSXPCCachedConnection *)self setFailureBlock:v4];
  objc_initWeak(&location, self);
  id v5 = [(FMNSXPCCachedConnection *)self connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke;
  v6[3] = &unk_1E689C3C0;
  objc_copyWeak(&v7, &location);
  [v5 addFailureBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setFailureBlock:(id)a3
{
}

- (id)remoteObjectProxy
{
  v2 = [(FMNSXPCCachedConnection *)self connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (FMNSXPCConnection)connection
{
  return self->_connection;
}

void __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained serialQueue];
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke_2;
    v6[3] = &unk_1E689C398;
    void v6[4] = WeakRetained;
    v6[5] = a2;
    dispatch_async(v4, v6);
  }
}

void __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) failureBlock];
  v3 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke_3;
  v6[3] = &unk_1E689C370;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)_invalidate
{
  v3 = [(FMNSXPCCachedConnection *)self connection];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = [(FMNSXPCCachedConnection *)self failureBlock];

    if (!v4) {
      return;
    }
  }
  [(FMNSXPCCachedConnection *)self setFailureBlock:0];
  [(FMNSXPCCachedConnection *)self setConnection:0];
  id v5 = [(FMNSXPCCachedConnection *)self didInvalidate];

  if (v5)
  {
    v6 = [(FMNSXPCCachedConnection *)self didInvalidate];
    v6[2]();

    [(FMNSXPCCachedConnection *)self setDidInvalidate:0];
  }
}

- (id)didInvalidate
{
  return self->_didInvalidate;
}

- (void)setDidInvalidate:(id)a3
{
}

- (id)failureBlock
{
  return self->_failureBlock;
}

@end