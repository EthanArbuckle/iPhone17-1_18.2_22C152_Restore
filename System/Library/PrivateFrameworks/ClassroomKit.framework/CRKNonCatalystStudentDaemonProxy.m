@interface CRKNonCatalystStudentDaemonProxy
- (CRKNonCatalystStudentDaemonProxy)init;
- (CRKNonCatalystStudentDaemonProxy)initWithCallbackQueue:(id)a3;
- (CRKValidXPCConnectionProvider)connectionProvider;
- (OS_dispatch_queue)callbackQueue;
- (id)setOfActiveRestrictionUUIDs:(id)a3;
- (void)_fetchAdHocConfiguration:(id)a3;
- (void)_fetchConfiguration:(id)a3;
- (void)_fetchConfigurationType:(id)a3;
- (void)_fetchResourceFromURL:(id)a3 completion:(id)a4;
- (void)_fetchSetOfActiveRestrictionUUIDsForClientType:(id)a3 completion:(id)a4;
- (void)_setActiveStudentIdentifier:(id)a3 completion:(id)a4;
- (void)_setAdHocConfiguration:(id)a3 completion:(id)a4;
- (void)_setConfiguration:(id)a3 completion:(id)a4;
- (void)_studentDidAuthenticate:(id)a3 completion:(id)a4;
- (void)fetchAdHocConfiguration:(id)a3;
- (void)fetchConfiguration:(id)a3;
- (void)fetchConfigurationType:(id)a3;
- (void)fetchResourceFromURL:(id)a3 completion:(id)a4;
- (void)fetchSetOfActiveRestrictionUUIDsForClientType:(id)a3 completion:(id)a4;
- (void)setActiveStudentIdentifier:(id)a3 completion:(id)a4;
- (void)setAdHocConfiguration:(id)a3 completion:(id)a4;
- (void)setConfiguration:(id)a3 completion:(id)a4;
- (void)studentDidAuthenticate:(id)a3 completion:(id)a4;
@end

@implementation CRKNonCatalystStudentDaemonProxy

- (CRKNonCatalystStudentDaemonProxy)init
{
  return [(CRKNonCatalystStudentDaemonProxy *)self initWithCallbackQueue:MEMORY[0x263EF83A0]];
}

- (CRKNonCatalystStudentDaemonProxy)initWithCallbackQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKNonCatalystStudentDaemonProxy;
  v6 = [(CRKNonCatalystStudentDaemonProxy *)&v10 init];
  if (v6)
  {
    v7 = [[CRKValidXPCConnectionProvider alloc] initWithBuilder:&__block_literal_global_57];
    connectionProvider = v6->_connectionProvider;
    v6->_connectionProvider = v7;

    objc_storeStrong((id *)&v6->_callbackQueue, a3);
  }

  return v6;
}

uint64_t __58__CRKNonCatalystStudentDaemonProxy_initWithCallbackQueue___block_invoke()
{
  return objc_msgSend(MEMORY[0x263F08D68], "crk_studentDaemonNonCatalystConnection");
}

- (id)setOfActiveRestrictionUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = __Block_byref_object_copy_;
  v17[3] = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  v6 = [v5 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__CRKNonCatalystStudentDaemonProxy_setOfActiveRestrictionUUIDs___block_invoke;
  v15[3] = &unk_2646F4740;
  v15[4] = &v16;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__CRKNonCatalystStudentDaemonProxy_setOfActiveRestrictionUUIDs___block_invoke_2;
  v14[3] = &unk_2646F4768;
  v14[4] = &v19;
  v14[5] = &v16;
  [v7 fetchSetOfActiveRestrictionUUIDsForClientType:v4 completion:v14];

  v8 = (void *)v20[5];
  if (!v8)
  {
    if (_CRKLogGeneral_onceToken_15 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_15, &__block_literal_global_53);
    }
    v9 = _CRKLogGeneral_logObj_15;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_15, OS_LOG_TYPE_ERROR)) {
      -[CRKNonCatalystStudentDaemonProxy setOfActiveRestrictionUUIDs:]((uint64_t)v17, v9);
    }
    uint64_t v10 = objc_opt_new();
    v11 = (void *)v20[5];
    v20[5] = v10;

    v8 = (void *)v20[5];
  }
  id v12 = v8;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v19, 8);

  return v12;
}

void __64__CRKNonCatalystStudentDaemonProxy_setOfActiveRestrictionUUIDs___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CRKNonCatalystStudentDaemonProxy_setOfActiveRestrictionUUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)fetchConfigurationType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__CRKNonCatalystStudentDaemonProxy_fetchConfigurationType___block_invoke;
  v6[3] = &unk_2646F4790;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKNonCatalystStudentDaemonProxy *)self _fetchConfigurationType:v6];
}

void __59__CRKNonCatalystStudentDaemonProxy_fetchConfigurationType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(id *)(a1 + 32);
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchConfigurationType:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v6 = [v5 connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke;
  v12[3] = &unk_2646F3EA0;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_3;
  v10[3] = &unk_2646F4790;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 fetchConfigurationType:v10];
}

void __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_4;
  block[3] = &unk_2646F47B8;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)setAdHocConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__CRKNonCatalystStudentDaemonProxy_setAdHocConfiguration_completion___block_invoke;
  v8[3] = &unk_2646F3EA0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CRKNonCatalystStudentDaemonProxy *)self _setAdHocConfiguration:a3 completion:v8];
}

void __69__CRKNonCatalystStudentDaemonProxy_setAdHocConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setAdHocConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke;
  v15[3] = &unk_2646F3EA0;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_3;
  v13[3] = &unk_2646F3EA0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 setAdHocConfiguration:v7 completion:v13];
}

void __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_4;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchAdHocConfiguration:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__CRKNonCatalystStudentDaemonProxy_fetchAdHocConfiguration___block_invoke;
  v6[3] = &unk_2646F47E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKNonCatalystStudentDaemonProxy *)self _fetchAdHocConfiguration:v6];
}

void __60__CRKNonCatalystStudentDaemonProxy_fetchAdHocConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchAdHocConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v6 = [v5 connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke;
  v12[3] = &unk_2646F3EA0;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_3;
  v10[3] = &unk_2646F47E0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 fetchAdHocConfiguration:v10];
}

void __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_4;
  block[3] = &unk_2646F3B00;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__CRKNonCatalystStudentDaemonProxy_setConfiguration_completion___block_invoke;
  v8[3] = &unk_2646F3EA0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CRKNonCatalystStudentDaemonProxy *)self _setConfiguration:a3 completion:v8];
}

void __64__CRKNonCatalystStudentDaemonProxy_setConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke;
  v15[3] = &unk_2646F3EA0;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_3;
  v13[3] = &unk_2646F3EA0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 setConfiguration:v7 completion:v13];
}

void __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_4;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchConfiguration:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CRKNonCatalystStudentDaemonProxy_fetchConfiguration___block_invoke;
  v6[3] = &unk_2646F47E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKNonCatalystStudentDaemonProxy *)self _fetchConfiguration:v6];
}

void __55__CRKNonCatalystStudentDaemonProxy_fetchConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v6 = [v5 connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke;
  v12[3] = &unk_2646F3EA0;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_3;
  v10[3] = &unk_2646F47E0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 fetchConfiguration:v10];
}

void __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_4;
  block[3] = &unk_2646F3B00;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setActiveStudentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__CRKNonCatalystStudentDaemonProxy_setActiveStudentIdentifier_completion___block_invoke;
  v8[3] = &unk_2646F3EA0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CRKNonCatalystStudentDaemonProxy *)self _setActiveStudentIdentifier:a3 completion:v8];
}

void __74__CRKNonCatalystStudentDaemonProxy_setActiveStudentIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setActiveStudentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke;
  v15[3] = &unk_2646F3EA0;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_3;
  v13[3] = &unk_2646F3EA0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 setActiveStudentIdentifier:v7 completion:v13];
}

void __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_4;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)studentDidAuthenticate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CRKNonCatalystStudentDaemonProxy_studentDidAuthenticate_completion___block_invoke;
  v8[3] = &unk_2646F3EA0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CRKNonCatalystStudentDaemonProxy *)self _studentDidAuthenticate:a3 completion:v8];
}

void __70__CRKNonCatalystStudentDaemonProxy_studentDidAuthenticate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_studentDidAuthenticate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke;
  v15[3] = &unk_2646F3EA0;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_3;
  v13[3] = &unk_2646F3EA0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 studentDidAuthenticate:v7 completion:v13];
}

void __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_4;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchResourceFromURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__CRKNonCatalystStudentDaemonProxy_fetchResourceFromURL_completion___block_invoke;
  v8[3] = &unk_2646F4808;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CRKNonCatalystStudentDaemonProxy *)self _fetchResourceFromURL:a3 completion:v8];
}

void __68__CRKNonCatalystStudentDaemonProxy_fetchResourceFromURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchResourceFromURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke;
  v15[3] = &unk_2646F3EA0;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_3;
  v13[3] = &unk_2646F4808;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 fetchResourceFromURL:v7 completion:v13];
}

void __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_4;
  block[3] = &unk_2646F3B00;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchSetOfActiveRestrictionUUIDsForClientType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__CRKNonCatalystStudentDaemonProxy_fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke;
  v8[3] = &unk_2646F4830;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CRKNonCatalystStudentDaemonProxy *)self _fetchSetOfActiveRestrictionUUIDsForClientType:a3 completion:v8];
}

void __93__CRKNonCatalystStudentDaemonProxy_fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchSetOfActiveRestrictionUUIDsForClientType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKNonCatalystStudentDaemonProxy *)self connectionProvider];
  id v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke;
  v15[3] = &unk_2646F3EA0;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_3;
  v13[3] = &unk_2646F4830;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 fetchSetOfActiveRestrictionUUIDsForClientType:v7 completion:v13];
}

void __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_2;
  v7[3] = &unk_2646F3488;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_4;
  block[3] = &unk_2646F3B00;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (CRKValidXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_connectionProvider, 0);
}

- (void)setOfActiveRestrictionUUIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch setOfActiveRestrictionUUIDs: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end