@interface ASDPurchaseHistory
+ (id)interface;
+ (id)sharedInstance;
- (ASDPurchaseHistory)init;
- (void)dealloc;
- (void)executeQuery:(id)a3 withResultHandler:(id)a4;
- (void)setHidden:(BOOL)a3 forStoreItemID:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)showAllWithCompletionHandler:(id)a3;
- (void)updateForAccountID:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)updateForAccountID:(int64_t)a3 withContext:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)updateWithCompletionHandler:(id)a3;
- (void)updateWithContext:(unint64_t)a3 withCompletionHandler:(id)a4;
@end

@implementation ASDPurchaseHistory

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C338];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_executeQuery_withReplyHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

void __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E58B2CB8;
    id v13 = *(id *)(a1 + 32);
    v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E58B2CB8;
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    [v7 updateWithContext:v8 withReplyHandler:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    }
  }
}

uint64_t __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateWithContext:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke;
  v9[3] = &unk_1E58B4568;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ASDServiceBroker *)serviceBroker getPurchaseHistoryServiceWithCompletionHandler:v9];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ASDPurchaseHistory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6568 != -1) {
    dispatch_once(&qword_1EB4D6568, block);
  }
  v2 = (void *)_MergedGlobals_42;
  return v2;
}

uint64_t __36__ASDPurchaseHistory_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_42 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDPurchaseHistory)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  id v4 = v3;
  if (self
    && (v11.receiver = self,
        v11.super_class = (Class)ASDPurchaseHistory,
        (id v5 = [(ASDPurchaseHistory *)&v11 init]) != 0))
  {
    id v6 = v5;
    objc_storeStrong((id *)&v5->_serviceBroker, v3);

    objc_initWeak(&v11.receiver, v6);
    v6->_databaseChangedNotificationToken = -1;
    v7 = dispatch_get_global_queue(21, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __26__ASDPurchaseHistory_init__block_invoke;
    handler[3] = &unk_1E58B36F8;
    objc_copyWeak(&v10, &v11.receiver);
    notify_register_dispatch("com.apple.appstored.PurchaseHistoryDatabaseUpdated", &v6->_databaseChangedNotificationToken, v7, handler);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v11.receiver);
  }
  else
  {

    return 0;
  }
  return v6;
}

void __26__ASDPurchaseHistory_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDPurchaseHistoryDidChangeNotification" object:WeakRetained];
}

- (void)dealloc
{
  notify_cancel(self->_databaseChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)ASDPurchaseHistory;
  [(ASDPurchaseHistory *)&v3 dealloc];
}

- (void)executeQuery:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B44C8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(ASDServiceBroker *)serviceBroker getPurchaseHistoryServiceWithCompletionHandler:v11];
}

void __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke_3;
    v7[3] = &unk_1E58B2D30;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 executeQuery:v5 withReplyHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__ASDPurchaseHistory_executeQuery_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setHidden:(BOOL)a3 forStoreItemID:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E58B44F0;
  BOOL v14 = a3;
  id v12 = v8;
  int64_t v13 = a4;
  id v10 = v8;
  [(ASDServiceBroker *)serviceBroker getPurchaseHistoryServiceWithCompletionHandler:v11];
}

void __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E58B2CB8;
    id v14 = *(id *)(a1 + 32);
    id v7 = [v5 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E58B2CB8;
    uint64_t v9 = *(void *)(a1 + 40);
    id v12 = *(id *)(a1 + 32);
    [v7 setHidden:v8 forStoreItemID:v9 withReplyHandler:v11];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
  }
}

uint64_t __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __69__ASDPurchaseHistory_setHidden_forStoreItemID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)showAllWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B4518;
  id v8 = v4;
  id v6 = v4;
  [(ASDServiceBroker *)serviceBroker getPurchaseHistoryServiceWithCompletionHandler:v7];
}

void __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E58B2CB8;
    id v12 = *(id *)(a1 + 32);
    id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 32);
    [v7 showAllWithReplyHandler:v9];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    }
  }
}

uint64_t __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__ASDPurchaseHistory_showAllWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateForAccountID:(int64_t)a3 withCompletionHandler:(id)a4
{
}

- (void)updateForAccountID:(int64_t)a3 withContext:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E58B4540;
  id v12 = v8;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  id v10 = v8;
  [(ASDServiceBroker *)serviceBroker getPurchaseHistoryServiceWithCompletionHandler:v11];
}

void __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E58B2CB8;
    id v14 = *(id *)(a1 + 32);
    id v7 = [v5 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E58B2CB8;
    id v12 = *(id *)(a1 + 32);
    [v7 updateForAccountID:v8 withContext:v9 withReplyHandler:v11];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
  }
}

uint64_t __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __75__ASDPurchaseHistory_updateForAccountID_withContext_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateWithCompletionHandler:(id)a3
{
}

uint64_t __62__ASDPurchaseHistory_updateWithContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end