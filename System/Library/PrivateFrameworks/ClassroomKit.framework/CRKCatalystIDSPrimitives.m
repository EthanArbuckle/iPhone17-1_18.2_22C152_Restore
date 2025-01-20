@interface CRKCatalystIDSPrimitives
+ (id)crkOptionsFromOptions:(id)a3;
- (CRKCatalystIDSPrimitives)initWithPrimitives:(id)a3 addressTranslator:(id)a4;
- (CRKIDSAddressTranslator)addressTranslator;
- (CRKIDSPrimitives)primitives;
- (id)addressForAppleID:(id)a3;
- (void)addMessageHandler:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 toAddress:(id)a4 fromID:(id)a5 options:(id)a6 completion:(id)a7;
@end

@implementation CRKCatalystIDSPrimitives

- (CRKCatalystIDSPrimitives)initWithPrimitives:(id)a3 addressTranslator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKCatalystIDSPrimitives;
  v9 = [(CRKCatalystIDSPrimitives *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primitives, a3);
    objc_storeStrong((id *)&v10->_addressTranslator, a4);
  }

  return v10;
}

- (void)addMessageHandler:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke;
  v19[3] = &unk_2646F5AF8;
  id v20 = v6;
  id v8 = v6;
  v9 = (void *)MEMORY[0x22A620AF0](v19);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke_2;
  v17[3] = &unk_2646F5B20;
  id v18 = v7;
  id v10 = v7;
  v11 = (void *)MEMORY[0x22A620AF0](v17);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke_3;
  block[3] = &unk_2646F5B48;
  block[4] = self;
  id v15 = v9;
  id v16 = v11;
  id v12 = v11;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = [[CRKCancelableBackedCatalystIDSSubscription alloc] initWithCancelable:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __57__CRKCatalystIDSPrimitives_addMessageHandler_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) primitives];
  [v2 subscribeToMessagesWithHandler:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)addressForAppleID:(id)a3
{
  id v4 = a3;
  v5 = [(CRKCatalystIDSPrimitives *)self addressTranslator];
  id v6 = [v5 destinationAddressForAppleID:v4];

  return v6;
}

- (void)sendMessage:(id)a3 toAddress:(id)a4 fromID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v18 = [(id)objc_opt_class() crkOptionsFromOptions:v13];

  v17 = [(CRKCatalystIDSPrimitives *)self primitives];
  [v17 sendMessage:v16 destinationAddress:v15 sourceAppleID:v14 options:v18 completion:v12];
}

+ (id)crkOptionsFromOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setFireAndForget:", objc_msgSend(v3, "shouldFireAndForget"));
  v5 = [v3 deliveryTimeout];

  [v4 setDeliveryTimeout:v5];

  return v4;
}

- (CRKIDSPrimitives)primitives
{
  return self->_primitives;
}

- (CRKIDSAddressTranslator)addressTranslator
{
  return self->_addressTranslator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressTranslator, 0);

  objc_storeStrong((id *)&self->_primitives, 0);
}

@end