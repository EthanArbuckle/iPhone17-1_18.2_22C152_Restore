@interface _CATIDSServiceTransportSendMessageOperation
- (BOOL)isAsynchronous;
- (_CATIDSServiceTransportSendMessageOperation)initWithConnection:(id)a3 message:(id)a4;
- (void)cancel;
- (void)didSendDataWithError:(id)a3;
- (void)main;
- (void)sendData;
@end

@implementation _CATIDSServiceTransportSendMessageOperation

- (_CATIDSServiceTransportSendMessageOperation)initWithConnection:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CATIDSServiceTransportSendMessageOperation;
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
  v6.super_class = (Class)_CATIDSServiceTransportSendMessageOperation;
  [(_CATIDSServiceTransportSendMessageOperation *)&v6 cancel];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53___CATIDSServiceTransportSendMessageOperation_cancel__block_invoke;
  v5[3] = &unk_2641DBE60;
  v5[4] = self;
  v3 = v5;
  v4 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_4;
  block[3] = &unk_2641DBD98;
  id v8 = v3;
  dispatch_async(v4, block);
}

- (void)main
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51___CATIDSServiceTransportSendMessageOperation_main__block_invoke;
  v4[3] = &unk_2641DBE60;
  v4[4] = self;
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_4;
  block[3] = &unk_2641DBD98;
  id v6 = v2;
  dispatch_async(v3, block);
}

- (void)sendData
{
  v3 = CATGetCatalystQueue();
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
      v7[2] = __55___CATIDSServiceTransportSendMessageOperation_sendData__block_invoke;
      v7[3] = &unk_2641DC028;
      objc_copyWeak(&v8, &location);
      [(CATIDSServiceConnection *)mConnection sendData:v4 completion:v7];
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

- (void)didSendDataWithError:(id)a3
{
  id v5 = a3;
  v4 = CATGetCatalystQueue();
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

  objc_storeStrong((id *)&self->mTransport, 0);
}

@end