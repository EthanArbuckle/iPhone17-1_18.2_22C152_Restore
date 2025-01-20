@interface SKRequest
- (SKPaymentQueueClient)paymentQueueClient;
- (SKRequest)init;
- (id)delegate;
- (id)errorFromCFObject:(id)a3;
- (void)_beginBackgroundTask;
- (void)_endBackgroundTask;
- (void)_start;
- (void)cancel;
- (void)setDelegate:(id)delegate;
- (void)setPaymentQueueClient:(id)a3;
- (void)start;
@end

@implementation SKRequest

- (void)start
{
  requestInternal = self->_requestInternal;
  if (requestInternal[4])
  {
    NSLog(&cfstr_IgnoringStartA.isa, a2, self);
  }
  else
  {
    requestInternal[4] = 1;
    [(SKRequest *)self _beginBackgroundTask];
    [(SKRequest *)self _start];
  }
}

- (void)setPaymentQueueClient:(id)a3
{
  requestInternal = self->_requestInternal;
  if ((id)requestInternal[2] != a3)
  {
    v7 = requestInternal;
    uint64_t v5 = [a3 copy];
    v6 = (void *)requestInternal[2];
    requestInternal[2] = v5;
  }
}

- (void)setDelegate:(id)delegate
{
}

- (SKRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKRequest;
  v2 = [(SKRequest *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKRequestInternal);
    id requestInternal = v2->_requestInternal;
    v2->_id requestInternal = v3;
  }
  return v2;
}

- (void)_beginBackgroundTask
{
  if (MGGetSInt32Answer() != 4)
  {
    v3 = (void *)MEMORY[0x1E4FB1438];
    v4 = self->_requestInternal;
    uint64_t v5 = [v3 sharedApplication];
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__SKRequest__beginBackgroundTask__block_invoke;
    v8[3] = &unk_1E5FA9A08;
    v8[4] = self;
    v4[1] = [v5 beginBackgroundTaskWithName:v7 expirationHandler:v8];
  }
}

- (void)cancel
{
  id requestInternal = self->_requestInternal;
  if (requestInternal[4] == 1) {
    requestInternal[4] = 2;
  }
  [(SKRequest *)self _endBackgroundTask];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)self->_requestInternal + 3);

  return WeakRetained;
}

- (SKPaymentQueueClient)paymentQueueClient
{
  v2 = (void *)[*((id *)self->_requestInternal + 2) copy];

  return (SKPaymentQueueClient *)v2;
}

- (id)errorFromCFObject:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];

      id v3 = (id)v4;
    }
  }

  return v3;
}

- (void)_start
{
  id requestInternal = self->_requestInternal;
  requestInternal[4] = 3;
  uint64_t v4 = requestInternal;
  uint64_t v5 = [(SKRequest *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SKRequest *)self delegate];
    [v7 requestDidFinish:self];
  }

  [(SKRequest *)self _endBackgroundTask];
}

uint64_t __33__SKRequest__beginBackgroundTask__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = *(void **)(a1 + 32);

  return [v2 _endBackgroundTask];
}

- (void)_endBackgroundTask
{
  id requestInternal = self->_requestInternal;
  uint64_t v3 = requestInternal[1];
  if (v3 != *MEMORY[0x1E4FB2748])
  {
    requestInternal[1] = *MEMORY[0x1E4FB2748];
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v4 endBackgroundTask:v3];
  }
}

- (void).cxx_destruct
{
}

@end