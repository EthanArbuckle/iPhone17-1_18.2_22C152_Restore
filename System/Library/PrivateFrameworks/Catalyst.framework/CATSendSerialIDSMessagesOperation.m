@interface CATSendSerialIDSMessagesOperation
- (BOOL)isAsynchronous;
- (CATSendSerialIDSMessagesOperation)initWithIDSPrimitives:(id)a3 workQueue:(id)a4 messages:(id)a5 destinationAddress:(id)a6 sourceAppleID:(id)a7 options:(id)a8;
- (void)didSendMessagesWithError:(id)a3;
- (void)sendMessages;
@end

@implementation CATSendSerialIDSMessagesOperation

- (CATSendSerialIDSMessagesOperation)initWithIDSPrimitives:(id)a3 workQueue:(id)a4 messages:(id)a5 destinationAddress:(id)a6 sourceAppleID:(id)a7 options:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CATSendSerialIDSMessagesOperation;
  v21 = [(CATOperation *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->mPrimitives, a3);
    objc_storeStrong((id *)&v22->mWorkQueue, a4);
    uint64_t v23 = [v17 copy];
    mMessages = v22->mMessages;
    v22->mMessages = (NSArray *)v23;

    uint64_t v25 = [v18 copy];
    mDestinationAddress = v22->mDestinationAddress;
    v22->mDestinationAddress = (NSString *)v25;

    uint64_t v27 = [v19 copy];
    mSourceAppleID = v22->mSourceAppleID;
    v22->mSourceAppleID = (NSString *)v27;

    uint64_t v29 = [v20 copy];
    mOptions = v22->mOptions;
    v22->mOptions = (CATIDSMessageOptions *)v29;

    v22->mLock._os_unfair_lock_opaque = 0;
  }

  return v22;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)sendMessages
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__0;
  v22[4] = __Block_byref_object_dispose__0;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  NSUInteger v21 = 0;
  NSUInteger v21 = [(NSArray *)self->mMessages count];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->mMessages;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x2166930C0]();
        v8 = [[CATIDSMessagePayload alloc] initWithMessage:v6];
        mPrimitives = self->mPrimitives;
        v10 = [(CATIDSMessagePayload *)v8 dictionaryValue];
        mDestinationAddress = self->mDestinationAddress;
        mSourceAppleID = self->mSourceAppleID;
        mOptions = self->mOptions;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __49__CATSendSerialIDSMessagesOperation_sendMessages__block_invoke;
        v15[3] = &unk_2641DC2C8;
        v15[4] = self;
        v15[5] = v20;
        v15[6] = v22;
        [(CATIDSPrimitives *)mPrimitives sendMessage:v10 toAddress:mDestinationAddress fromID:mSourceAppleID options:mOptions completion:v15];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v3);
  }

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __49__CATSendSerialIDSMessagesOperation_sendMessages__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 424));
  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    uint64_t v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) didSendMessagesWithError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 424));
}

- (void)didSendMessagesWithError:(id)a3
{
  if (a3) {
    -[CATOperation endOperationWithError:](self, "endOperationWithError:");
  }
  else {
    -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOptions, 0);
  objc_storeStrong((id *)&self->mSourceAppleID, 0);
  objc_storeStrong((id *)&self->mDestinationAddress, 0);
  objc_storeStrong((id *)&self->mMessages, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);

  objc_storeStrong((id *)&self->mPrimitives, 0);
}

@end