@interface ASDPurchaseManager
+ (id)interface;
+ (id)sharedManager;
- (ASDPurchaseManager)init;
- (id)adopt:(id)a3;
- (id)adoptableBundleIdentifiers;
- (void)adoptionStatus:(BOOL)a3 withReplyHandler:(id)a4;
- (void)checkAutomaticDownloadQueue;
- (void)checkPendingQueue;
- (void)checkPreflightForItemIdentifier:(id)a3 atURL:(id)a4 withReplyHandler:(id)a5;
- (void)processPurchase:(id)a3 withResponseHandler:(id)a4;
- (void)processPurchases:(id)a3 withResponseHandler:(id)a4;
- (void)purchaseBatch:(id)a3 additionalBuyParams:(id)a4 withResultHandler:(id)a5;
- (void)purchaseBatchWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 withResultHandler:(id)a5;
- (void)renewReceiptForApplicationAtURL:(id)a3 withAppleID:(id)a4 password:(id)a5 forceSandbox:(BOOL)a6 withCompletionHandler:(id)a7;
- (void)startPurchase:(id)a3 withResultHandler:(id)a4;
- (void)unadoptWithReplyHandler:(id)a3;
@end

@implementation ASDPurchaseManager

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C758];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_processPurchases_withReplyHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_startPurchase_withReplyHandler_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_startPurchase_withReplyHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ASDPurchaseManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6618 != -1) {
    dispatch_once(&qword_1EB4D6618, block);
  }
  v2 = (void *)_MergedGlobals_53;
  return v2;
}

uint64_t __35__ASDPurchaseManager_sharedManager__block_invoke(uint64_t a1)
{
  _MergedGlobals_53 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDPurchaseManager)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  id v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDPurchaseManager;
    v5 = [(ASDPurchaseManager *)&v7 init];
    self = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
    }
  }

  return self;
}

- (id)adopt:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__13;
  v17 = __Block_byref_object_dispose__13;
  id v18 = 0;
  id v4 = +[ASDServiceBroker defaultBroker];
  v5 = (id *)(v14 + 5);
  id obj = (id)v14[5];
  v6 = [v4 getPurchaseServiceWithError:&obj];
  objc_storeStrong(v5, obj);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__ASDPurchaseManager_adopt___block_invoke;
  v11[3] = &unk_1E58B3108;
  v11[4] = &v13;
  objc_super v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__ASDPurchaseManager_adopt___block_invoke_2;
  v10[3] = &unk_1E58B3108;
  v10[4] = &v13;
  [v7 adopt:v3 withReplyHandler:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __28__ASDPurchaseManager_adopt___block_invoke(uint64_t a1, void *a2)
{
}

void __28__ASDPurchaseManager_adopt___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)adoptableBundleIdentifiers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  id v26 = (id)MEMORY[0x1E4F1CBF0];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  v2 = +[ASDServiceBroker defaultBroker];
  id v3 = (id *)(v16 + 5);
  id obj = (id)v16[5];
  id v4 = [v2 getPurchaseServiceWithError:&obj];
  objc_storeStrong(v3, obj);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__ASDPurchaseManager_adoptableBundleIdentifiers__block_invoke;
  v13[3] = &unk_1E58B3108;
  v13[4] = &v15;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__ASDPurchaseManager_adoptableBundleIdentifiers__block_invoke_2;
  v12[3] = &unk_1E58B4720;
  v12[4] = &v21;
  [v5 adoptableBundleIdentifiersWithReplyHandler:v12];

  if (v16[5])
  {
    v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      uint64_t v10 = v16[5];
      *(_DWORD *)buf = 138543618;
      v28 = v9;
      __int16 v29 = 2114;
      uint64_t v30 = v10;
      id v11 = v9;
      _os_log_error_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for adoptableBundleIdentifiers error: %{public}@", buf, 0x16u);
    }
  }
  id v7 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v7;
}

void __48__ASDPurchaseManager_adoptableBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
}

void __48__ASDPurchaseManager_adoptableBundleIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)adoptionStatus:(BOOL)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke;
  v9[3] = &unk_1E58B4D40;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v9];
}

void __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke_3;
    v7[3] = &unk_1E58B2D80;
    id v8 = *(id *)(a1 + 32);
    [v4 adoptionStatus:v5 withReplyHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

uint64_t __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)purchaseBatch:(id)a3 additionalBuyParams:(id)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serviceBroker = self->_serviceBroker;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke;
  v15[3] = &unk_1E58B4D90;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v15];
}

void __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke_2;
    v10[3] = &unk_1E58B2CB8;
    id v11 = *(id *)(a1 + 48);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke_3;
    v8[3] = &unk_1E58B4D68;
    id v9 = *(id *)(a1 + 48);
    [v4 purchaseBatch:v5 additionalBuyParams:v6 withReplyHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

uint64_t __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)purchaseBatchWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serviceBroker = self->_serviceBroker;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke;
  v15[3] = &unk_1E58B4D90;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v15];
}

void __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke_2;
    v10[3] = &unk_1E58B2CB8;
    id v11 = *(id *)(a1 + 48);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke_3;
    v8[3] = &unk_1E58B4D68;
    id v9 = *(id *)(a1 + 48);
    [v4 purchaseBatchWithItemMetadata:v5 additionalBuyParams:v6 withReplyHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

uint64_t __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processPurchase:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke;
  v11[3] = &unk_1E58B4DB8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v11];
}

void __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke_3;
    v7[3] = &unk_1E58B4D68;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 processPurchase:v5 withReplyHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processPurchases:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke;
  v11[3] = &unk_1E58B4DB8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v11];
}

void __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke_3;
    v7[3] = &unk_1E58B4D68;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 processPurchases:v5 withReplyHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startPurchase:(id)a3 withResultHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[ASDStoreKitService shouldProcessStoreKitPurchase:v6])
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v9 = v20;
      _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing ASDPurchase with StoreKit service", buf, 0xCu);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke;
    v17[3] = &unk_1E58B4DE0;
    id v10 = &v18;
    id v18 = v7;
    id v11 = v7;
    +[ASDStoreKitService processStoreKitPurchase:v6 withResultHandler:v17];
  }
  else
  {
    serviceBroker = self->_serviceBroker;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_2;
    v14[3] = &unk_1E58B4DB8;
    id v10 = &v16;
    id v16 = v7;
    id v15 = v6;
    id v13 = v7;
    [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v14];
  }
}

uint64_t __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_3;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_4;
    v7[3] = &unk_1E58B4DE0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 startPurchase:v5 withReplyHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkAutomaticDownloadQueue
{
  serviceBroker = self->_serviceBroker;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__ASDPurchaseManager_checkAutomaticDownloadQueue__block_invoke;
  v3[3] = &unk_1E58B4E08;
  v3[4] = self;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v3];
}

void __49__ASDPurchaseManager_checkAutomaticDownloadQueue__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __49__ASDPurchaseManager_checkAutomaticDownloadQueue__block_invoke_2;
    v3[3] = &unk_1E58B2F08;
    v3[4] = *(void *)(a1 + 32);
    v2 = [a2 remoteObjectProxyWithErrorHandler:v3];
    [v2 checkStoreQueue:0];
  }
}

void __49__ASDPurchaseManager_checkAutomaticDownloadQueue__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error in checkAutomaticDownloadQueue: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)checkPendingQueue
{
  serviceBroker = self->_serviceBroker;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__ASDPurchaseManager_checkPendingQueue__block_invoke;
  v3[3] = &unk_1E58B4E08;
  v3[4] = self;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v3];
}

void __39__ASDPurchaseManager_checkPendingQueue__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __39__ASDPurchaseManager_checkPendingQueue__block_invoke_2;
    v3[3] = &unk_1E58B2F08;
    v3[4] = *(void *)(a1 + 32);
    id v2 = [a2 remoteObjectProxyWithErrorHandler:v3];
    [v2 checkStoreQueue:1];
  }
}

void __39__ASDPurchaseManager_checkPendingQueue__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error in checkPendingQueue: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)checkPreflightForItemIdentifier:(id)a3 atURL:(id)a4 withReplyHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
  }
}

- (void)renewReceiptForApplicationAtURL:(id)a3 withAppleID:(id)a4 password:(id)a5 forceSandbox:(BOOL)a6 withCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  serviceBroker = self->_serviceBroker;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E58B4E30;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  BOOL v26 = a6;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v21];
}

void __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E58B2CB8;
    id v13 = *(id *)(a1 + 56);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v12];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E58B2CB8;
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    [v4 renewReceiptForApplicationAtURL:v5 withAppleID:v6 password:v8 forceSandbox:v7 withReplyHandler:v10];
  }
  else
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v9();
  }
}

uint64_t __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unadoptWithReplyHandler:(id)a3
{
  id v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke;
  v7[3] = &unk_1E58B4E58;
  id v8 = v4;
  id v6 = v4;
  [(ASDServiceBroker *)serviceBroker getPurchaseServiceWithCompletionHandler:v7];
}

void __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke_3;
    v6[3] = &unk_1E58B2D80;
    id v7 = *(id *)(a1 + 32);
    [v4 unadoptWithReplyHandler:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end