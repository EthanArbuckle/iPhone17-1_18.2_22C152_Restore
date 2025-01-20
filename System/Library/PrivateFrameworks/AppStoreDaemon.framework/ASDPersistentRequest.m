@interface ASDPersistentRequest
- (void)cancelWithErrorHandler:(id)a3;
- (void)startWithErrorHandler:(id)a3;
@end

@implementation ASDPersistentRequest

- (void)cancelWithErrorHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ASDPersistentRequest_cancelWithErrorHandler___block_invoke;
  v6[3] = &unk_1E58B33A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ASDRequest *)self _cancelWithErrorHandler:v6];
}

void __47__ASDPersistentRequest_cancelWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = +[ASDRequest _sharedBroker];
  -[ASDRequestBroker markRequestAsComplete:](v3, *(void **)(a1 + 32));
}

- (void)startWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ASDRequest _sharedBroker];
  -[ASDRequestBroker markRequestAsActive:](v5, self);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ASDPersistentRequest_startWithErrorHandler___block_invoke;
  v7[3] = &unk_1E58B33A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ASDRequest *)self _startWithErrorHandler:v7];
}

void __46__ASDPersistentRequest_startWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = +[ASDRequest _sharedBroker];
  -[ASDRequestBroker markRequestAsComplete:](v3, *(void **)(a1 + 32));
}

@end