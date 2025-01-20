@interface CATBlockOperationObserver
- (CATBlockOperationObserver)init;
- (OS_dispatch_queue)delegateQueue;
- (id)didFinish;
- (id)didProgress;
- (id)didStart;
- (void)invokeBlock:(id)a3 operation:(id)a4;
- (void)operationDidFinish:(id)a3;
- (void)operationDidProgress:(id)a3;
- (void)operationDidStart:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDidFinish:(id)a3;
- (void)setDidProgress:(id)a3;
- (void)setDidStart:(id)a3;
@end

@implementation CATBlockOperationObserver

- (void)setDelegateQueue:(id)a3
{
  v6 = (OS_dispatch_queue *)a3;
  if (self->_delegateQueue != v6)
  {
    objc_storeStrong((id *)&self->_delegateQueue, a3);
    v5 = v6;
    if (!v6) {
      v5 = MEMORY[0x263EF83A0];
    }
    dispatch_set_target_queue((dispatch_object_t)self->mQueue, v5);
  }
}

- (CATBlockOperationObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)CATBlockOperationObserver;
  id v2 = [(CATBlockOperationObserver *)&v7 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 1), MEMORY[0x263EF83A0]);
  }
  return (CATBlockOperationObserver *)v2;
}

- (void)operationDidStart:(id)a3
{
  id v4 = a3;
  id v5 = [(CATBlockOperationObserver *)self didStart];
  [(CATBlockOperationObserver *)self invokeBlock:v5 operation:v4];
}

- (void)operationDidProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(CATBlockOperationObserver *)self didProgress];
  [(CATBlockOperationObserver *)self invokeBlock:v5 operation:v4];
}

- (void)operationDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(CATBlockOperationObserver *)self didFinish];
  [(CATBlockOperationObserver *)self invokeBlock:v5 operation:v4];
}

- (void)invokeBlock:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    mQueue = self->mQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__CATBlockOperationObserver_invokeBlock_operation___block_invoke;
    v11[3] = &unk_2641DBD70;
    id v13 = v6;
    id v12 = v7;
    v9 = v11;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke;
    block[3] = &unk_2641DBD98;
    id v15 = v9;
    v10 = mQueue;
    dispatch_async(v10, block);
  }
}

uint64_t __51__CATBlockOperationObserver_invokeBlock_operation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (id)didStart
{
  return self->_didStart;
}

- (void)setDidStart:(id)a3
{
}

- (id)didProgress
{
  return self->_didProgress;
}

- (void)setDidProgress:(id)a3
{
}

- (id)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinish, 0);
  objc_storeStrong(&self->_didProgress, 0);
  objc_storeStrong(&self->_didStart, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_storeStrong((id *)&self->mQueue, 0);
}

@end