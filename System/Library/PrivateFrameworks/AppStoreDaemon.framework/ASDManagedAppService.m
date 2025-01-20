@interface ASDManagedAppService
+ (id)defaultService;
+ (id)interface;
- (ASDManagedAppService)init;
- (id)showVPPInviteForCurrentUser:(id)a3 orgName:(id)a4;
- (void)requestStatusWithResultHandler:(id)a3;
- (void)submitManifestRequest:(id)a3 withResultHandler:(id)a4;
- (void)submitVPPRequest:(id)a3 withResultHandler:(id)a4;
@end

@implementation ASDManagedAppService

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C5D8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_submitVPPRequest_withReplyHandler_ argumentIndex:0 ofReply:0];

  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_submitManifestRequest_withReplyHandler_ argumentIndex:0 ofReply:0];

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_requestStatusWithReply_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)defaultService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ASDManagedAppService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D65F8 != -1) {
    dispatch_once(&qword_1EB4D65F8, block);
  }
  v2 = (void *)_MergedGlobals_51;
  return v2;
}

uint64_t __38__ASDManagedAppService_defaultService__block_invoke(uint64_t a1)
{
  _MergedGlobals_51 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDManagedAppService)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASDManagedAppService;
  v2 = [(ASDManagedAppService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ASDServiceBroker defaultBroker];
    serviceBroker = v2->_serviceBroker;
    v2->_serviceBroker = (ASDServiceBroker *)v3;
  }
  return v2;
}

- (void)requestStatusWithResultHandler:(id)a3
{
  id v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke;
  v7[3] = &unk_1E58B4A78;
  id v8 = v4;
  id v6 = v4;
  [(ASDServiceBroker *)serviceBroker getManagedAppServiceWithCompletionHandler:v7];
}

void __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke_3;
    v6[3] = &unk_1E58B4018;
    id v7 = *(id *)(a1 + 32);
    [v4 requestStatusWithReply:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)showVPPInviteForCurrentUser:(id)a3 orgName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12;
  v20 = __Block_byref_object_dispose__12;
  id v21 = 0;
  id v7 = +[ASDServiceBroker defaultBroker];
  id v8 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  id v9 = [v7 getManagedAppServiceWithError:&obj];
  objc_storeStrong(v8, obj);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__ASDManagedAppService_showVPPInviteForCurrentUser_orgName___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &v16;
  v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__ASDManagedAppService_showVPPInviteForCurrentUser_orgName___block_invoke_2;
  v13[3] = &unk_1E58B3108;
  v13[4] = &v16;
  [v10 showVPPInviteForCurrentUser:v5 orgName:v6 withReplyHandler:v13];

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __60__ASDManagedAppService_showVPPInviteForCurrentUser_orgName___block_invoke(uint64_t a1, void *a2)
{
}

void __60__ASDManagedAppService_showVPPInviteForCurrentUser_orgName___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)submitManifestRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B4AC8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(ASDServiceBroker *)serviceBroker getManagedAppServiceWithCompletionHandler:v11];
}

void __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke_2;
    v12[3] = &unk_1E58B33A8;
    id v14 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke_3;
    v10[3] = &unk_1E58B4AA0;
    uint64_t v7 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v6 submitManifestRequest:v7 withReplyHandler:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) requestIdentifier];
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);
  }
}

void __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 requestIdentifier];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v4, v5);
}

uint64_t __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)submitVPPRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke;
  v11[3] = &unk_1E58B4AC8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(ASDServiceBroker *)serviceBroker getManagedAppServiceWithCompletionHandler:v11];
}

void __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke_2;
    v14[3] = &unk_1E58B33A8;
    id v16 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke_3;
    v12[3] = &unk_1E58B4AF0;
    uint64_t v7 = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    [v6 submitVPPRequest:v7 withReplyHandler:v12];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) bundleIdentifier];
    id v10 = [*(id *)(a1 + 32) itemIdentifier];
    id v11 = [*(id *)(a1 + 32) requestIdentifier];
    (*(void (**)(uint64_t, id, void *, void *, void *))(v8 + 16))(v8, v5, v9, v10, v11);
  }
}

void __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  id v8 = [v4 bundleIdentifier];
  id v6 = [*(id *)(a1 + 32) itemIdentifier];
  uint64_t v7 = [*(id *)(a1 + 32) requestIdentifier];
  (*(void (**)(uint64_t, id, id, void *, void *))(v3 + 16))(v3, v5, v8, v6, v7);
}

uint64_t __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end