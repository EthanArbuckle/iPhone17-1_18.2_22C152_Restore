@interface CATRemoteTaskOperation
+ (BOOL)isCancelable;
+ (id)invalidRemoteTaskWithRequest:(id)a3 error:(id)a4;
- (BOOL)isAsynchronous;
- (CATRemoteTaskOperation)initWithRequest:(id)a3 client:(id)a4;
- (CATRemoteTaskOperation)initWithRequest:(id)a3 clientError:(id)a4;
- (CATTaskClient)client;
- (NSNumber)remotePhase;
- (void)cancel;
- (void)cancelOperationIfNeeded;
- (void)clientFailedWithError:(id)a3;
- (void)fetchProgress;
- (void)main;
- (void)operationWillFinish;
- (void)postNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)processMessage:(id)a3;
- (void)processNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)setRemotePhase:(id)a3;
- (void)updateCompletedUnitCount:(int64_t)a3 andTotalUnitCount:(int64_t)a4;
- (void)updateProgressWithRemoteProgress:(id)a3;
@end

@implementation CATRemoteTaskOperation

+ (id)invalidRemoteTaskWithRequest:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [CATRemoteTaskOperation alloc];
  v8 = v7;
  if (v6)
  {
    v9 = [(CATRemoteTaskOperation *)v7 initWithRequest:v5 clientError:v6];
  }
  else
  {
    v10 = CATErrorWithCodeAndUserInfo(501, 0);
    v9 = [(CATRemoteTaskOperation *)v8 initWithRequest:v5 clientError:v10];
  }

  return v9;
}

- (CATRemoteTaskOperation)initWithRequest:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CATRemoteTaskOperation.m", 42, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"CATRemoteTaskOperation.m", 43, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)CATRemoteTaskOperation;
  v10 = [(CATTaskOperation *)&v15 initWithRequest:v7];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_client, a4);
  }

  return v11;
}

- (CATRemoteTaskOperation)initWithRequest:(id)a3 clientError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CATRemoteTaskOperation.m", 55, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"CATRemoteTaskOperation.m", 56, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)CATRemoteTaskOperation;
  v10 = [(CATTaskOperation *)&v15 initWithRequest:v7];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->mClientError, a4);
  }

  return v11;
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (BOOL)isCancelable
{
  return 1;
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)CATRemoteTaskOperation;
  [(CATRemoteTaskOperation *)&v6 cancel];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__CATRemoteTaskOperation_cancel__block_invoke;
  v5[3] = &unk_2641DBE60;
  v5[4] = self;
  v3 = v5;
  v4 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_2641DBD98;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __32__CATRemoteTaskOperation_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelOperationIfNeeded];
}

- (void)cancelOperationIfNeeded
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if ([(CATOperation *)self isExecuting])
  {
    v4 = [CATTaskMessageCancel alloc];
    id v5 = [(CATOperation *)self UUID];
    id v7 = [(CATTaskMessage *)v4 initWithTaskUUID:v5];

    objc_super v6 = [(CATRemoteTaskOperation *)self client];
    [v6 remoteTaskOperation:self preparedMessage:v7];
  }
}

- (void)operationWillFinish
{
  v4.receiver = self;
  v4.super_class = (Class)CATRemoteTaskOperation;
  [(CATOperation *)&v4 operationWillFinish];
  client = self->_client;
  self->_client = 0;
}

- (void)main
{
  objc_super v4 = [(CATTaskOperation *)self request];

  if (!v4)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CATRemoteTaskOperation.m" lineNumber:109 description:@"Request must set before the remote task operation can be run"];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__CATRemoteTaskOperation_main__block_invoke;
  v8[3] = &unk_2641DBE60;
  v8[4] = self;
  id v5 = v8;
  objc_super v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_2641DBD98;
  id v10 = v5;
  dispatch_async(v6, block);
}

void __30__CATRemoteTaskOperation_main__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    if (*(void *)(*(void *)(a1 + 32) + 400))
    {
      v10.receiver = *(id *)(a1 + 32);
      v10.super_class = (Class)CATRemoteTaskOperation;
      objc_msgSendSuper2(&v10, sel_endOperationWithError_);
    }
    else
    {
      v2 = [CATTaskMessageStart alloc];
      v3 = [*(id *)(a1 + 32) UUID];
      objc_super v4 = [*(id *)(a1 + 32) request];
      id v5 = [(CATTaskMessageStart *)v2 initWithTaskUUID:v3 request:v4];

      objc_super v6 = [*(id *)(a1 + 32) client];
      [v6 remoteTaskOperation:*(void *)(a1 + 32) preparedMessage:v5];

      if (!v5)
      {
        id v7 = *(void **)(a1 + 32);
        id v8 = CATErrorWithCodeAndUserInfo(402, 0);
        v9.receiver = v7;
        v9.super_class = (Class)CATRemoteTaskOperation;
        objc_msgSendSuper2(&v9, sel_endOperationWithError_, v8);
      }
    }
  }
}

- (void)processNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CATTaskOperation *)self canSendNotificationWithName:v6 userInfo:v7])
  {
    id v8 = [(CATTaskOperation *)self notificationDelegate];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_5:

      goto LABEL_10;
    }
    BOOL v9 = [(CATTaskOperation *)self canSendNotificationWithName:v6 userInfo:v7];

    if (v9)
    {
      id v8 = [(CATTaskOperation *)self notificationDelegate];
      [v8 taskOperation:self didPostNotificationWithName:v6 userInfo:v7];
      goto LABEL_5;
    }
  }
  else
  {
    if (_CATLogGeneral_onceToken_6 != -1) {
      dispatch_once(&_CATLogGeneral_onceToken_6, &__block_literal_global_10);
    }
    objc_super v10 = _CATLogGeneral_logObj_6;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_6, OS_LOG_TYPE_ERROR)) {
      -[CATRemoteTaskOperation processNotificationWithName:userInfo:]((uint64_t)self, (uint64_t)v6, v10);
    }
  }
LABEL_10:
}

- (void)fetchProgress
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__CATRemoteTaskOperation_fetchProgress__block_invoke;
  v4[3] = &unk_2641DBE60;
  v4[4] = self;
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_2641DBD98;
  id v6 = v2;
  dispatch_async(v3, block);
}

void __39__CATRemoteTaskOperation_fetchProgress__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [CATTaskMessageFetchProgress alloc];
    v3 = [*(id *)(a1 + 32) UUID];
    id v5 = [(CATTaskMessage *)v2 initWithTaskUUID:v3];

    objc_super v4 = [*(id *)(a1 + 32) client];
    [v4 remoteTaskOperation:*(void *)(a1 + 32) preparedMessage:v5];
  }
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__CATRemoteTaskOperation_postNotificationWithName_userInfo___block_invoke;
  v13[3] = &unk_2641DBE10;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v13;
  id v9 = v7;
  id v10 = v6;
  v11 = CATGetCatalystQueue();
  v12 = v8;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_2641DBD98;
  id v17 = v12;
  dispatch_async(v11, block);
}

void __60__CATRemoteTaskOperation_postNotificationWithName_userInfo___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [CATNotificationMessage alloc];
    v3 = [*(id *)(a1 + 32) UUID];
    id v5 = [(CATNotificationMessage *)v2 initWithTaskUUID:v3 name:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];

    objc_super v4 = [*(id *)(a1 + 32) client];
    [v4 remoteTaskOperation:*(void *)(a1 + 32) preparedMessage:v5];
  }
}

- (void)processMessage:(id)a3
{
  id v12 = a3;
  objc_super v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v12 progress];
    [(CATRemoteTaskOperation *)self updateProgressWithRemoteProgress:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v12;
      uint64_t v7 = [v6 completedUnitCount];
      uint64_t v8 = [v6 totalUnitCount];

      [(CATRemoteTaskOperation *)self updateCompletedUnitCount:v7 andTotalUnitCount:v8];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v12;
        id v10 = [v9 name];
        v11 = [v9 userInfo];

        [(CATRemoteTaskOperation *)self processNotificationWithName:v10 userInfo:v11];
      }
    }
  }
}

- (void)clientFailedWithError:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CATRemoteTaskOperation.m", 196, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__CATRemoteTaskOperation_clientFailedWithError___block_invoke;
  v11[3] = &unk_2641DC000;
  v11[4] = self;
  id v12 = v5;
  id v6 = v11;
  id v7 = v5;
  uint64_t v8 = CATGetCatalystQueue();
  id v9 = v6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_2641DBD98;
  id v14 = v9;
  dispatch_async(v8, block);
}

void __48__CATRemoteTaskOperation_clientFailedWithError___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 endOperationWithError:v3];
  }
  else
  {
    objc_super v4 = *(void **)(a1 + 40);
    id v5 = (id *)(*(void *)(a1 + 32) + 400);
    objc_storeStrong(v5, v4);
  }
}

- (void)updateCompletedUnitCount:(int64_t)a3 andTotalUnitCount:(int64_t)a4
{
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  if ([(CATOperation *)self totalUnitCount] != a4) {
    [(CATOperation *)self setTotalUnitCount:a4];
  }
  if ([(CATOperation *)self completedUnitCount] != a3)
  {
    [(CATOperation *)self setCompletedUnitCount:a3];
  }
}

- (void)updateProgressWithRemoteProgress:(id)a3
{
  id v14 = a3;
  objc_super v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(CATOperation *)self isExecuting])
  {
    uint64_t v5 = [(CATRemoteTaskOperation *)self remotePhase];
    if (!v5
      || (id v6 = (void *)v5,
          uint64_t v7 = [v14 phase],
          [(CATRemoteTaskOperation *)self remotePhase],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 unsignedIntegerValue],
          v8,
          v6,
          v7 != v9))
    {
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "phase"));
      [(CATRemoteTaskOperation *)self setRemotePhase:v10];
    }
    uint64_t v11 = [v14 completedUnitCount];
    if (v11 != [(CATOperation *)self completedUnitCount]) {
      -[CATOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", [v14 completedUnitCount]);
    }
    uint64_t v12 = [v14 totalUnitCount];
    if (v12 != [(CATOperation *)self totalUnitCount]) {
      -[CATOperation setTotalUnitCount:](self, "setTotalUnitCount:", [v14 totalUnitCount]);
    }
    if ([v14 state] == 1)
    {
      v13 = [v14 resultObject];
      [(CATOperation *)self endOperationWithResultObject:v13];
    }
    else
    {
      if ([v14 state] != 2) {
        goto LABEL_14;
      }
      v13 = [v14 error];
      [(CATOperation *)self endOperationWithError:v13];
    }
  }
LABEL_14:
}

- (CATTaskClient)client
{
  return self->_client;
}

- (NSNumber)remotePhase
{
  return self->_remotePhase;
}

- (void)setRemotePhase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePhase, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->mClientError, 0);
}

- (void)processNotificationWithName:(os_log_t)log userInfo:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_213B7F000, log, OS_LOG_TYPE_ERROR, "%@ dropping notification '%@', either the client didn't expect it, or it wasn't allowlisted", (uint8_t *)&v3, 0x16u);
}

@end