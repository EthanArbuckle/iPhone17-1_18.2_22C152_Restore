@interface ASDFairPlayService
+ (ASDFairPlayService)defaultService;
+ (id)interface;
- (BOOL)importKeybag:(id)a3 error:(id *)a4;
- (BOOL)importSubscriptionKeybag:(id)a3 error:(id *)a4;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(uint64_t)a1;
- (id)generateKeybagRequestForDSID:(unint64_t)a3 error:(id *)a4;
- (id)generateSubscriptionRequestForDSID:(unint64_t)a3 error:(id *)a4;
@end

@implementation ASDFairPlayService

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C398];
}

+ (ASDFairPlayService)defaultService
{
  if (qword_1EB4D6578 != -1) {
    dispatch_once(&qword_1EB4D6578, &__block_literal_global_17);
  }
  v2 = (void *)_MergedGlobals_43;
  return (ASDFairPlayService *)v2;
}

void __36__ASDFairPlayService_defaultService__block_invoke()
{
  v0 = [ASDFairPlayService alloc];
  v1 = +[ASDServiceBroker defaultBroker];
  id v4 = v1;
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)ASDFairPlayService;
    v2 = (ASDFairPlayService *)objc_msgSendSuper2(&v5, sel_init);
    v0 = v2;
    if (v2) {
      objc_storeStrong((id *)&v2->_serviceBroker, v1);
    }
  }

  v3 = (void *)_MergedGlobals_43;
  _MergedGlobals_43 = (uint64_t)v0;
}

- (id)generateKeybagRequestForDSID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__ASDFairPlayService_generateKeybagRequestForDSID_error___block_invoke;
  v11[3] = &unk_1E58B3108;
  v11[4] = &v12;
  v6 = -[ASDFairPlayService _synchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ASDFairPlayService_generateKeybagRequestForDSID_error___block_invoke_2;
  v10[3] = &unk_1E58B4590;
  v10[4] = &v18;
  v10[5] = &v12;
  [v6 generateKeybagRequestForDSID:a3 completionHandler:v10];
  if (a4)
  {
    v7 = (void *)v13[5];
    if (v7) {
      *a4 = v7;
    }
  }
  id v8 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __57__ASDFairPlayService_generateKeybagRequestForDSID_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 8);
    id v9 = 0;
    objc_super v5 = [v4 getFairPlayServiceWithError:&v9];
    id v6 = v9;
    if (v5)
    {
      v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v3];
    }
    else
    {
      v3[2](v3, v6);
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __57__ASDFairPlayService_generateKeybagRequestForDSID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)generateSubscriptionRequestForDSID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__ASDFairPlayService_generateSubscriptionRequestForDSID_error___block_invoke;
  v11[3] = &unk_1E58B3108;
  v11[4] = &v12;
  id v6 = -[ASDFairPlayService _synchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__ASDFairPlayService_generateSubscriptionRequestForDSID_error___block_invoke_2;
  v10[3] = &unk_1E58B4590;
  v10[4] = &v18;
  v10[5] = &v12;
  [v6 generateSubscriptionRequestForDSID:a3 completionHandler:v10];
  if (a4)
  {
    uint64_t v7 = (void *)v13[5];
    if (v7) {
      *a4 = v7;
    }
  }
  id v8 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __63__ASDFairPlayService_generateSubscriptionRequestForDSID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__ASDFairPlayService_generateSubscriptionRequestForDSID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)importKeybag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__8;
  uint64_t v18 = __Block_byref_object_dispose__8;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__ASDFairPlayService_importKeybag_error___block_invoke;
  v13[3] = &unk_1E58B3108;
  v13[4] = &v14;
  uint64_t v7 = -[ASDFairPlayService _synchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v13);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__ASDFairPlayService_importKeybag_error___block_invoke_2;
  v12[3] = &unk_1E58B3108;
  v12[4] = &v14;
  [v7 importKeybag:v6 completionHandler:v12];
  id v8 = v15;
  if (a4)
  {
    uint64_t v9 = (void *)v15[5];
    if (v9)
    {
      *a4 = v9;
      id v8 = v15;
    }
  }
  BOOL v10 = v8[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __41__ASDFairPlayService_importKeybag_error___block_invoke(uint64_t a1, void *a2)
{
}

void __41__ASDFairPlayService_importKeybag_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)importSubscriptionKeybag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__8;
  uint64_t v18 = __Block_byref_object_dispose__8;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ASDFairPlayService_importSubscriptionKeybag_error___block_invoke;
  v13[3] = &unk_1E58B3108;
  v13[4] = &v14;
  uint64_t v7 = -[ASDFairPlayService _synchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v13);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__ASDFairPlayService_importSubscriptionKeybag_error___block_invoke_2;
  v12[3] = &unk_1E58B3108;
  v12[4] = &v14;
  [v7 importSubscriptionKeybag:v6 completionHandler:v12];
  id v8 = v15;
  if (a4)
  {
    uint64_t v9 = (void *)v15[5];
    if (v9)
    {
      *a4 = v9;
      id v8 = v15;
    }
  }
  BOOL v10 = v8[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __53__ASDFairPlayService_importSubscriptionKeybag_error___block_invoke(uint64_t a1, void *a2)
{
}

void __53__ASDFairPlayService_importSubscriptionKeybag_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
}

@end