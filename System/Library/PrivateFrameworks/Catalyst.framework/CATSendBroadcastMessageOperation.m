@interface CATSendBroadcastMessageOperation
- (BOOL)isAsynchronous;
- (CATSendBroadcastMessageOperation)initWithBroadcastPrimitive:(id)a3 message:(id)a4;
- (void)main;
- (void)sendMessage;
@end

@implementation CATSendBroadcastMessageOperation

- (CATSendBroadcastMessageOperation)initWithBroadcastPrimitive:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATSendBroadcastMessageOperation;
  v9 = [(CATOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mBroadcastPrimitives, a3);
    objc_storeStrong((id *)&v10->mMessage, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__CATSendBroadcastMessageOperation_main__block_invoke;
  v4[3] = &unk_2641DBE60;
  v4[4] = self;
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_13;
  block[3] = &unk_2641DBD98;
  id v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __40__CATSendBroadcastMessageOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendMessage];
}

- (void)sendMessage
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  if ([(CATSendBroadcastMessageOperation *)self isCancelled])
  {
    CATErrorWithCodeAndUserInfo(404, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(CATOperation *)self endOperationWithError:v6];
  }
  else
  {
    mBroadcastPrimitives = self->mBroadcastPrimitives;
    v5 = [(CATDictionaryCodable *)self->mMessage dictionaryValue];
    [(CATSharingBroadcastPrimitives *)mBroadcastPrimitives sendMessageToPairedDevice:v5];

    [(CATOperation *)self endOperationWithResultObject:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMessage, 0);

  objc_storeStrong((id *)&self->mBroadcastPrimitives, 0);
}

@end