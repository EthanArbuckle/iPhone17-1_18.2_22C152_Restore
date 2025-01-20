@interface CRKInvalidateTransportOperation
- (BOOL)isAsynchronous;
- (CATTransport)transport;
- (CRKInvalidateTransportOperation)initWithTransport:(id)a3;
- (void)main;
- (void)transportDidInvalidate:(id)a3;
@end

@implementation CRKInvalidateTransportOperation

- (CRKInvalidateTransportOperation)initWithTransport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKInvalidateTransportOperation;
  v6 = [(CRKInvalidateTransportOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transport, a3);
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CRKInvalidateTransportOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __39__CRKInvalidateTransportOperation_main__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 transport];
  [v3 setDelegate:v2];

  id v4 = [*(id *)(a1 + 32) transport];
  [v4 invalidate];
}

- (void)transportDidInvalidate:(id)a3
{
  if ([(CRKInvalidateTransportOperation *)self isExecuting])
  {
    [(CRKInvalidateTransportOperation *)self endOperationWithResultObject:0];
  }
}

- (CATTransport)transport
{
  return self->_transport;
}

- (void).cxx_destruct
{
}

@end