@interface CRKRequestPerformerBackedIDSPrimitives
- (CATOperationQueue)operationQueue;
- (CRKRequestPerformerBackedIDSPrimitives)initWithRequestPerformer:(id)a3 operationQueue:(id)a4;
- (CRKRequestPerformingProtocol)requestPerformer;
- (NSDictionary)debugInfo;
- (void)addAllowedAppleIDsToFirewall:(id)a3 completion:(id)a4;
- (void)fetchFirewallAllowedAppleIDs:(id)a3;
- (void)removeAllowedAppleIDsFromFirewall:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 completion:(id)a6;
- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)subscribeToMessagesWithHandler:(id)a3 completion:(id)a4;
@end

@implementation CRKRequestPerformerBackedIDSPrimitives

- (CRKRequestPerformerBackedIDSPrimitives)initWithRequestPerformer:(id)a3 operationQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKRequestPerformerBackedIDSPrimitives;
  v9 = [(CRKRequestPerformerBackedIDSPrimitives *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operationQueue, a4);
    objc_storeStrong((id *)&v10->_requestPerformer, a3);
  }

  return v10;
}

- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (id)objc_opt_new();
  [(CRKRequestPerformerBackedIDSPrimitives *)self sendMessage:v13 destinationAddress:v12 sourceAppleID:v11 options:v14 completion:v10];
}

- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7
{
  v33[1] = *MEMORY[0x263EF8340];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_opt_new();
  [v17 setDestinationAddress:v15];

  [v17 setSourceAppleID:v14];
  [v17 setMessage:v16];

  [v17 setOptions:v13];
  v18 = [(CRKRequestPerformerBackedIDSPrimitives *)self requestPerformer];
  v19 = [v18 operationForRequest:v17];

  v20 = (void *)MEMORY[0x263F086D0];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __106__CRKRequestPerformerBackedIDSPrimitives_sendMessage_destinationAddress_sourceAppleID_options_completion___block_invoke;
  v30 = &unk_2646F3488;
  id v31 = v19;
  id v32 = v12;
  id v21 = v19;
  id v22 = v12;
  v23 = [v20 blockOperationWithBlock:&v27];
  objc_msgSend(v23, "addDependency:", v21, v27, v28, v29, v30);
  v24 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  v33[0] = v21;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  [v24 addOperations:v25 waitUntilFinished:0];

  v26 = [MEMORY[0x263F08A48] mainQueue];
  [v26 addOperation:v23];
}

void __106__CRKRequestPerformerBackedIDSPrimitives_sendMessage_destinationAddress_sourceAppleID_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)subscribeToMessagesWithHandler:(id)a3 completion:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setHandlesNotifications:1];
  v9 = [(CRKRequestPerformerBackedIDSPrimitives *)self requestPerformer];
  id v10 = [v9 operationForRequest:v8];

  id v11 = [[CRKOperationBackedIDSMessageSubscription alloc] initWithListenOperation:v10 handler:v7];
  [v10 setNotificationDelegate:v11];
  id v12 = [CRKWaitForProgressOperation alloc];
  id v13 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  id v14 = [(CRKWaitForProgressOperation *)v12 initWithOperationQueue:v13 operation:v10 expectedCompletedUnitCount:1 expectedTotalUnitCount:2];

  id v15 = (void *)MEMORY[0x263F086D0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __84__CRKRequestPerformerBackedIDSPrimitives_subscribeToMessagesWithHandler_completion___block_invoke;
  v23[3] = &unk_2646F33D8;
  v25 = v11;
  id v26 = v6;
  v24 = v14;
  id v16 = v11;
  id v17 = v6;
  v18 = v14;
  v19 = [v15 blockOperationWithBlock:v23];
  [v19 addDependency:v18];
  v20 = [MEMORY[0x263F08A48] mainQueue];
  [v20 addOperation:v19];

  id v21 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  v27[0] = v18;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  [v21 addOperations:v22 waitUntilFinished:0];
}

void __84__CRKRequestPerformerBackedIDSPrimitives_subscribeToMessagesWithHandler_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v7);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = *(void (**)(uint64_t, uint64_t, void))(v3 + 16);
    uint64_t v6 = *(void *)(a1 + 48);
    v5(v6, v4, 0);
  }
}

- (NSDictionary)debugInfo
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = @"Class";
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  v7[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (void)fetchFirewallAllowedAppleIDs:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setAction:0];
  uint64_t v6 = [(CRKRequestPerformerBackedIDSPrimitives *)self requestPerformer];
  id v7 = [v6 operationForRequest:v5];

  id v8 = (void *)MEMORY[0x263F086D0];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __71__CRKRequestPerformerBackedIDSPrimitives_fetchFirewallAllowedAppleIDs___block_invoke;
  id v17 = &unk_2646F3570;
  id v18 = v7;
  id v19 = v4;
  id v9 = v4;
  id v10 = v7;
  id v11 = [v8 blockOperationWithBlock:&v14];
  objc_msgSend(v11, "addDependency:", v10, v14, v15, v16, v17);
  id v12 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  [v12 addOperation:v10];

  id v13 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  [v13 addOperation:v11];
}

void __71__CRKRequestPerformerBackedIDSPrimitives_fetchFirewallAllowedAppleIDs___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resultObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = [v4 allowedAppleIDs];

  uint64_t v6 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
}

- (void)addAllowedAppleIDsToFirewall:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setAction:1];
  [v8 setAllowedAppleIDs:v7];

  id v9 = [(CRKRequestPerformerBackedIDSPrimitives *)self requestPerformer];
  id v10 = [v9 operationForRequest:v8];

  id v11 = (void *)MEMORY[0x263F086D0];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __82__CRKRequestPerformerBackedIDSPrimitives_addAllowedAppleIDsToFirewall_completion___block_invoke;
  v20 = &unk_2646F3488;
  id v21 = v10;
  id v22 = v6;
  id v12 = v10;
  id v13 = v6;
  uint64_t v14 = [v11 blockOperationWithBlock:&v17];
  objc_msgSend(v14, "addDependency:", v12, v17, v18, v19, v20);
  uint64_t v15 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  [v15 addOperation:v12];

  id v16 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  [v16 addOperation:v14];
}

void __82__CRKRequestPerformerBackedIDSPrimitives_addAllowedAppleIDsToFirewall_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)removeAllowedAppleIDsFromFirewall:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setAction:2];
  [v8 setAllowedAppleIDs:v7];

  id v9 = [(CRKRequestPerformerBackedIDSPrimitives *)self requestPerformer];
  id v10 = [v9 operationForRequest:v8];

  id v11 = (void *)MEMORY[0x263F086D0];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __87__CRKRequestPerformerBackedIDSPrimitives_removeAllowedAppleIDsFromFirewall_completion___block_invoke;
  v20 = &unk_2646F3488;
  id v21 = v10;
  id v22 = v6;
  id v12 = v10;
  id v13 = v6;
  uint64_t v14 = [v11 blockOperationWithBlock:&v17];
  objc_msgSend(v14, "addDependency:", v12, v17, v18, v19, v20);
  uint64_t v15 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  [v15 addOperation:v12];

  id v16 = [(CRKRequestPerformerBackedIDSPrimitives *)self operationQueue];
  [v16 addOperation:v14];
}

void __87__CRKRequestPerformerBackedIDSPrimitives_removeAllowedAppleIDsFromFirewall_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (CRKRequestPerformingProtocol)requestPerformer
{
  return self->_requestPerformer;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_requestPerformer, 0);
}

@end