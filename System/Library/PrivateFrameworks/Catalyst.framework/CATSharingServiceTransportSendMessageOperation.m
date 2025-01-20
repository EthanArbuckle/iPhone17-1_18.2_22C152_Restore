@interface CATSharingServiceTransportSendMessageOperation
- (BOOL)isAsynchronous;
- (CATSharingServiceTransportSendMessageOperation)initWithConnection:(id)a3 message:(id)a4;
- (void)cancel;
- (void)didSendMessageWithError:(id)a3;
- (void)main;
- (void)sendMessage;
@end

@implementation CATSharingServiceTransportSendMessageOperation

- (CATSharingServiceTransportSendMessageOperation)initWithConnection:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATSharingServiceTransportSendMessageOperation;
  v9 = [(CATOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mConnection, a3);
    objc_storeStrong((id *)&v10->mMessage, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)CATSharingServiceTransportSendMessageOperation;
  [(CATSharingServiceTransportSendMessageOperation *)&v6 cancel];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__CATSharingServiceTransportSendMessageOperation_cancel__block_invoke;
  v5[3] = &unk_2641DBE60;
  v5[4] = self;
  v3 = v5;
  v4 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_17;
  block[3] = &unk_2641DBD98;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __56__CATSharingServiceTransportSendMessageOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo(404, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 endOperationWithError:v3];
  }
}

- (void)main
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__CATSharingServiceTransportSendMessageOperation_main__block_invoke;
  v4[3] = &unk_2641DBE60;
  v4[4] = self;
  v2 = v4;
  id v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_17;
  block[3] = &unk_2641DBD98;
  id v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __54__CATSharingServiceTransportSendMessageOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendMessage];
}

- (void)sendMessage
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if ([(CATOperation *)self isExecuting])
  {
    v4 = objc_msgSend(MEMORY[0x263F08910], "cat_archivedDataWithRootObject:", self->mMessage);
    if (v4)
    {
      objc_initWeak(&location, self);
      mConnection = self->mConnection;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __61__CATSharingServiceTransportSendMessageOperation_sendMessage__block_invoke;
      v7[3] = &unk_2641DC028;
      objc_copyWeak(&v8, &location);
      [(CATSharingConnection *)mConnection sendData:v4 completion:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      id v6 = CATErrorWithCodeAndUserInfo(301, 0);
      [(CATOperation *)self endOperationWithError:v6];
    }
  }
}

void __61__CATSharingServiceTransportSendMessageOperation_sendMessage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CATSharingServiceTransportSendMessageOperation_sendMessage__block_invoke_2;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_17;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __61__CATSharingServiceTransportSendMessageOperation_sendMessage__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didSendMessageWithError:*(void *)(a1 + 32)];
}

- (void)didSendMessageWithError:(id)a3
{
  id v5 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(CATOperation *)self isExecuting])
  {
    if (v5) {
      [(CATOperation *)self endOperationWithError:v5];
    }
    else {
      [(CATOperation *)self endOperationWithResultObject:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMessage, 0);

  objc_storeStrong((id *)&self->mConnection, 0);
}

@end