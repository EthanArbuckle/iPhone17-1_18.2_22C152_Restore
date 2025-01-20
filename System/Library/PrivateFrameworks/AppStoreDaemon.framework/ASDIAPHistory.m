@interface ASDIAPHistory
+ (id)interface;
+ (id)sharedInstance;
- (ASDIAPHistory)init;
- (void)getAllIAPsForActiveAccountWithResultHandler:(id)a3;
- (void)getIAPsForActiveAccountWithAdamIDs:(id)a3 withResultHandler:(id)a4;
- (void)refreshIAPsForActiveAccountWithCompletionHandler:(id)a3;
@end

@implementation ASDIAPHistory

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C4B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getAllIAPsForActiveAccountWithReplyHandler_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_getIAPsForActiveAccountWithAdamIDs_withReplyHandler_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withReplyHandler_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withReplyHandler_ argumentIndex:0 ofReply:1];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v2 setClasses:v17 forSelector:sel_getCachedSubscriptionEntitlementsForSegment_withReplyHandler_ argumentIndex:0 ofReply:1];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v2 setClasses:v20 forSelector:sel_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withReplyHandler_ argumentIndex:3 ofReply:1];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v2 setClasses:v23 forSelector:sel_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withReplyHandler_ argumentIndex:3 ofReply:1];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  [v2 setClasses:v26 forSelector:sel_getCachedSubscriptionEntitlementsForSegment_withReplyHandler_ argumentIndex:2 ofReply:1];

  return v2;
}

void __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E58B2CB8;
    uint64_t v7 = &v17;
    id v17 = *(id *)(a1 + 32);
    v8 = [v5 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_4;
    v14[3] = &unk_1E58B2CB8;
    v9 = &v15;
    id v15 = *(id *)(a1 + 32);
    [v8 refreshIAPsForActiveAccountWithReplyHandler:v14];
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v8 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_6;
    v11[3] = &unk_1E58B2E18;
    uint64_t v7 = &v13;
    id v13 = v10;
    v9 = &v12;
    id v12 = v6;
    dispatch_async(v8, v11);
    goto LABEL_5;
  }
LABEL_6:
}

void __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_2;
    v14[3] = &unk_1E58B2CB8;
    id v6 = &v15;
    id v15 = *(id *)(a1 + 32);
    uint64_t v7 = [a2 remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_4;
    v12[3] = &unk_1E58B2D30;
    v8 = &v13;
    id v13 = *(id *)(a1 + 32);
    [v7 getAllIAPsForActiveAccountWithReplyHandler:v12];
  }
  else
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_6;
    v9[3] = &unk_1E58B2E18;
    id v6 = &v11;
    id v11 = *(id *)(a1 + 32);
    v8 = &v10;
    id v10 = v5;
    dispatch_async(v7, v9);
  }
}

uint64_t __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ASDIAPHistory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D65A8 != -1) {
    dispatch_once(&qword_1EB4D65A8, block);
  }
  v2 = (void *)_MergedGlobals_46;
  return v2;
}

uint64_t __31__ASDIAPHistory_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_46 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDIAPHistory)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  id v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDIAPHistory;
    id v5 = [(ASDIAPHistory *)&v7 init];
    self = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
    }
  }

  return self;
}

- (void)refreshIAPsForActiveAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B3888;
  id v8 = v4;
  id v6 = v4;
  [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v7];
}

- (void)getAllIAPsForActiveAccountWithResultHandler:(id)a3
{
  id v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke;
  v7[3] = &unk_1E58B3888;
  id v8 = v4;
  id v6 = v4;
  [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v7];
}

void __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_5;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_5;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __61__ASDIAPHistory_getAllIAPsForActiveAccountWithResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)getIAPsForActiveAccountWithAdamIDs:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B46D0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v11];
}

void __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_2;
    v15[3] = &unk_1E58B2CB8;
    id v6 = &v16;
    id v16 = *(id *)(a1 + 40);
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_4;
    v13[3] = &unk_1E58B2D30;
    id v8 = &v14;
    uint64_t v9 = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    [v7 getIAPsForActiveAccountWithAdamIDs:v9 withReplyHandler:v13];
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_6;
    v10[3] = &unk_1E58B2E18;
    id v6 = &v12;
    id v12 = *(id *)(a1 + 40);
    id v8 = &v11;
    id v11 = v5;
    dispatch_async(v7, v10);
  }
}

void __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_5;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __70__ASDIAPHistory_getIAPsForActiveAccountWithAdamIDs_withResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __66__ASDIAPHistory_refreshIAPsForActiveAccountWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end