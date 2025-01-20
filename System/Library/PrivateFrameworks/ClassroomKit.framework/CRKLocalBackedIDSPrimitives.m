@interface CRKLocalBackedIDSPrimitives
- (CATOperationQueue)operationQueue;
- (CRKIDSLocalPrimitives)IDSLocalPrimitives;
- (CRKIDSReadinessEvaluating)IDSReadinessEvaluator;
- (CRKLocalBackedIDSPrimitives)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4;
- (CRKLocalBackedIDSPrimitives)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4 operationQueue:(id)a5;
- (NSDictionary)debugInfo;
- (id)operationDebugInfo;
- (void)addAllowedAppleIDsToFirewall:(id)a3 completion:(id)a4;
- (void)fetchFirewallAllowedAppleIDs:(id)a3;
- (void)removeAllowedAppleIDsFromFirewall:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 completion:(id)a6;
- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)subscribeToMessagesWithHandler:(id)a3 completion:(id)a4;
@end

@implementation CRKLocalBackedIDSPrimitives

- (CRKLocalBackedIDSPrimitives)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4
{
  v6 = (void *)MEMORY[0x263F39C90];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "crk_backgroundQueue");
  v10 = [(CRKLocalBackedIDSPrimitives *)self initWithIDSLocalPrimitives:v8 IDSReadinessEvaluator:v7 operationQueue:v9];

  return v10;
}

- (CRKLocalBackedIDSPrimitives)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRKLocalBackedIDSPrimitives;
  v12 = [(CRKLocalBackedIDSPrimitives *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_IDSLocalPrimitives, a3);
    objc_storeStrong((id *)&v13->_IDSReadinessEvaluator, a4);
    objc_storeStrong((id *)&v13->_operationQueue, a5);
  }

  return v13;
}

- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (id)objc_opt_new();
  [(CRKLocalBackedIDSPrimitives *)self sendMessage:v13 destinationAddress:v12 sourceAppleID:v11 options:v14 completion:v10];
}

- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [CRKIDSWaitAndSendIDSMessageOperation alloc];
  v18 = [(CRKLocalBackedIDSPrimitives *)self IDSLocalPrimitives];
  v19 = [(CRKLocalBackedIDSPrimitives *)self IDSReadinessEvaluator];
  v20 = [(CRKIDSWaitAndSendIDSMessageOperation *)v17 initWithIDSLocalPrimitives:v18 IDSReadinessEvaluator:v19 message:v16 destinationAddress:v15 sourceAppleID:v14 options:v13];

  v21 = (void *)MEMORY[0x263F086D0];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __95__CRKLocalBackedIDSPrimitives_sendMessage_destinationAddress_sourceAppleID_options_completion___block_invoke;
  v30 = &unk_2646F3488;
  v31 = v20;
  id v32 = v12;
  v22 = v20;
  id v23 = v12;
  v24 = [v21 blockOperationWithBlock:&v27];
  objc_msgSend(v24, "addDependency:", v22, v27, v28, v29, v30);
  v25 = [(CRKLocalBackedIDSPrimitives *)self operationQueue];
  [v25 addOperation:v22];

  v26 = [MEMORY[0x263F08A48] mainQueue];
  [v26 addOperation:v24];
}

void __95__CRKLocalBackedIDSPrimitives_sendMessage_destinationAddress_sourceAppleID_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)subscribeToMessagesWithHandler:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  id v8 = [(CRKLocalBackedIDSPrimitives *)self IDSLocalPrimitives];
  id v9 = [v8 subscribeToMessageReceivesWithHandler:v7];

  v6[2](v6, v9, 0);
  [v9 resume];
}

- (NSDictionary)debugInfo
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"Operations";
  v3 = [(CRKLocalBackedIDSPrimitives *)self operationDebugInfo];
  v11[0] = v3;
  v10[1] = @"LocalPrimitives";
  v4 = [(CRKLocalBackedIDSPrimitives *)self IDSLocalPrimitives];
  v5 = [v4 debugInfo];
  v11[1] = v5;
  v10[2] = @"IDSReadinessEvaluator";
  v6 = [(CRKLocalBackedIDSPrimitives *)self IDSReadinessEvaluator];
  id v7 = [v6 debugInfo];
  v11[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return (NSDictionary *)v8;
}

- (id)operationDebugInfo
{
  id v2 = [(CRKLocalBackedIDSPrimitives *)self operationQueue];
  v3 = [v2 operations];
  v4 = objc_msgSend(v3, "crk_mapUsingBlock:", &__block_literal_global_75);

  return v4;
}

uint64_t __49__CRKLocalBackedIDSPrimitives_operationDebugInfo__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (void)fetchFirewallAllowedAppleIDs:(id)a3
{
  id v4 = a3;
  v5 = [(CRKLocalBackedIDSPrimitives *)self IDSLocalPrimitives];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CRKLocalBackedIDSPrimitives_fetchFirewallAllowedAppleIDs___block_invoke;
  v7[3] = &unk_2646F4F50;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchFirewallWithCompletion:v7];
}

uint64_t __60__CRKLocalBackedIDSPrimitives_fetchFirewallAllowedAppleIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    return [a2 fetchAllowedAppleIDsWithCompletion:v2];
  }
  else {
    return (*(uint64_t (**)(void))(v2 + 16))(*(void *)(a1 + 32));
  }
}

- (void)addAllowedAppleIDsToFirewall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRKLocalBackedIDSPrimitives *)self IDSLocalPrimitives];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__CRKLocalBackedIDSPrimitives_addAllowedAppleIDsToFirewall_completion___block_invoke;
  v11[3] = &unk_2646F4F78;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 fetchFirewallWithCompletion:v11];
}

uint64_t __71__CRKLocalBackedIDSPrimitives_addAllowedAppleIDsToFirewall_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 addAllowedAppleIDs:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)removeAllowedAppleIDsFromFirewall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRKLocalBackedIDSPrimitives *)self IDSLocalPrimitives];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__CRKLocalBackedIDSPrimitives_removeAllowedAppleIDsFromFirewall_completion___block_invoke;
  v11[3] = &unk_2646F4F78;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 fetchFirewallWithCompletion:v11];
}

uint64_t __76__CRKLocalBackedIDSPrimitives_removeAllowedAppleIDsFromFirewall_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 removeAllowedAppleIDs:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (CRKIDSReadinessEvaluating)IDSReadinessEvaluator
{
  return self->_IDSReadinessEvaluator;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_IDSReadinessEvaluator, 0);

  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
}

@end