@interface CRKIDSWaitAndSendIDSMessageOperation
- (BOOL)isAsynchronous;
- (CATOperation)evaluateReadinessOperation;
- (CATOperation)sendMessageOperation;
- (CRKIDSLocalPrimitives)IDSLocalPrimitives;
- (CRKIDSMessageOptions)options;
- (CRKIDSReadinessEvaluating)readinessEvaluator;
- (CRKIDSWaitAndSendIDSMessageOperation)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4 message:(id)a5 destinationAddress:(id)a6 sourceAppleID:(id)a7 options:(id)a8;
- (NSDictionary)message;
- (NSString)destinationAddress;
- (NSString)sourceAppleID;
- (void)cancel;
- (void)evaluateReadinessOperationDidFinish:(id)a3;
- (void)main;
- (void)run;
- (void)sendMessage;
- (void)sendMessageOperationDidFinish:(id)a3;
- (void)setEvaluateReadinessOperation:(id)a3;
- (void)setSendMessageOperation:(id)a3;
@end

@implementation CRKIDSWaitAndSendIDSMessageOperation

- (CRKIDSWaitAndSendIDSMessageOperation)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4 message:(id)a5 destinationAddress:(id)a6 sourceAppleID:(id)a7 options:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CRKIDSWaitAndSendIDSMessageOperation;
  v21 = [(CRKIDSWaitAndSendIDSMessageOperation *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_IDSLocalPrimitives, a3);
    objc_storeStrong((id *)&v22->_readinessEvaluator, a4);
    uint64_t v23 = [v17 copy];
    message = v22->_message;
    v22->_message = (NSDictionary *)v23;

    uint64_t v25 = [v18 copy];
    destinationAddress = v22->_destinationAddress;
    v22->_destinationAddress = (NSString *)v25;

    uint64_t v27 = [v19 copy];
    sourceAppleID = v22->_sourceAppleID;
    v22->_sourceAppleID = (NSString *)v27;

    uint64_t v29 = [v20 copy];
    options = v22->_options;
    v22->_options = (CRKIDSMessageOptions *)v29;
  }
  return v22;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKIDSWaitAndSendIDSMessageOperation;
  [(CRKIDSWaitAndSendIDSMessageOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CRKIDSWaitAndSendIDSMessageOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__CRKIDSWaitAndSendIDSMessageOperation_cancel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) evaluateReadinessOperation];
  [v2 cancel];

  id v3 = [*(id *)(a1 + 32) sendMessageOperation];
  [v3 cancel];
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CRKIDSWaitAndSendIDSMessageOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __44__CRKIDSWaitAndSendIDSMessageOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) run];
}

- (void)run
{
  if ([(CRKIDSWaitAndSendIDSMessageOperation *)self isCanceled])
  {
    CATErrorWithCodeAndUserInfo();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKIDSWaitAndSendIDSMessageOperation endOperationWithError:](self, "endOperationWithError:");
  }
  else
  {
    id v3 = [(CRKIDSWaitAndSendIDSMessageOperation *)self readinessEvaluator];
    objc_super v4 = [v3 operationToEvaluateIDSReadiness];
    [(CRKIDSWaitAndSendIDSMessageOperation *)self setEvaluateReadinessOperation:v4];

    v5 = [(CRKIDSWaitAndSendIDSMessageOperation *)self evaluateReadinessOperation];
    [v5 addTarget:self selector:sel_evaluateReadinessOperationDidFinish_ forOperationEvents:6];

    objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = [(CRKIDSWaitAndSendIDSMessageOperation *)self evaluateReadinessOperation];
    [v7 addOperation:v6];
  }
}

- (void)evaluateReadinessOperationDidFinish:(id)a3
{
  id v7 = a3;
  if ([(CRKIDSWaitAndSendIDSMessageOperation *)self isCanceled])
  {
    uint64_t v4 = CATErrorWithCodeAndUserInfo();
LABEL_5:
    v6 = (void *)v4;
    [(CRKIDSWaitAndSendIDSMessageOperation *)self endOperationWithError:v4];

    goto LABEL_7;
  }
  v5 = [v7 error];

  if (v5)
  {
    uint64_t v4 = [v7 error];
    goto LABEL_5;
  }
  [(CRKIDSWaitAndSendIDSMessageOperation *)self sendMessage];
LABEL_7:
}

- (void)sendMessage
{
  id v3 = [CRKIDSSendMessageOperation alloc];
  uint64_t v4 = [(CRKIDSWaitAndSendIDSMessageOperation *)self IDSLocalPrimitives];
  v5 = [(CRKIDSWaitAndSendIDSMessageOperation *)self message];
  v6 = [(CRKIDSWaitAndSendIDSMessageOperation *)self destinationAddress];
  id v7 = [(CRKIDSWaitAndSendIDSMessageOperation *)self sourceAppleID];
  v8 = [(CRKIDSWaitAndSendIDSMessageOperation *)self options];
  v9 = [(CRKIDSSendMessageOperation *)v3 initWithIDSLocalPrimitives:v4 message:v5 destinationAddress:v6 sourceAppleID:v7 options:v8];
  [(CRKIDSWaitAndSendIDSMessageOperation *)self setSendMessageOperation:v9];

  v10 = [(CRKIDSWaitAndSendIDSMessageOperation *)self sendMessageOperation];
  [v10 addTarget:self selector:sel_sendMessageOperationDidFinish_ forOperationEvents:6];

  objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = [(CRKIDSWaitAndSendIDSMessageOperation *)self sendMessageOperation];
  [v12 addOperation:v11];
}

- (void)sendMessageOperationDidFinish:(id)a3
{
  id v7 = a3;
  if ([(CRKIDSWaitAndSendIDSMessageOperation *)self isCanceled])
  {
    uint64_t v4 = CATErrorWithCodeAndUserInfo();
LABEL_5:
    v6 = (void *)v4;
    [(CRKIDSWaitAndSendIDSMessageOperation *)self endOperationWithError:v4];

    goto LABEL_7;
  }
  v5 = [v7 error];

  if (v5)
  {
    uint64_t v4 = [v7 error];
    goto LABEL_5;
  }
  [(CRKIDSWaitAndSendIDSMessageOperation *)self endOperationWithResultObject:0];
LABEL_7:
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (CRKIDSReadinessEvaluating)readinessEvaluator
{
  return self->_readinessEvaluator;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (NSString)sourceAppleID
{
  return self->_sourceAppleID;
}

- (CRKIDSMessageOptions)options
{
  return self->_options;
}

- (CATOperation)evaluateReadinessOperation
{
  return self->_evaluateReadinessOperation;
}

- (void)setEvaluateReadinessOperation:(id)a3
{
}

- (CATOperation)sendMessageOperation
{
  return self->_sendMessageOperation;
}

- (void)setSendMessageOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendMessageOperation, 0);
  objc_storeStrong((id *)&self->_evaluateReadinessOperation, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sourceAppleID, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_readinessEvaluator, 0);

  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
}

@end