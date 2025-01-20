@interface ASDRepairService
+ (id)defaultService;
+ (id)interface;
- (BOOL)isCoastGuardUnrepairableAppWithItemID:(unint64_t)a3 externalVersionID:(unint64_t)a4;
- (id)_asynchronousRemoteObjectProxyWithErrorHandler:(uint64_t)a1;
- (void)refreshKeybagWithReplyHandler:(id)a3;
- (void)repairAppWithOptions:(id)a3 replyHandler:(id)a4;
@end

@implementation ASDRepairService

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C818];
}

+ (id)defaultService
{
  if (qword_1EB4D6628 != -1) {
    dispatch_once(&qword_1EB4D6628, &__block_literal_global_29);
  }
  v2 = (void *)_MergedGlobals_54;
  return v2;
}

void __34__ASDRepairService_defaultService__block_invoke()
{
  v0 = [ASDRepairService alloc];
  v1 = +[ASDServiceBroker defaultBroker];
  id v4 = v1;
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)ASDRepairService;
    v2 = (ASDRepairService *)objc_msgSendSuper2(&v5, sel_init);
    v0 = v2;
    if (v2) {
      objc_storeStrong((id *)&v2->_serviceBroker, v1);
    }
  }

  v3 = (void *)_MergedGlobals_54;
  _MergedGlobals_54 = (uint64_t)v0;
}

- (void)refreshKeybagWithReplyHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ASDRepairService_refreshKeybagWithReplyHandler___block_invoke;
  v8[3] = &unk_1E58B3108;
  v8[4] = &v9;
  objc_super v5 = -[ASDRepairService _asynchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v8);
  if (v10[5])
  {
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__ASDRepairService_refreshKeybagWithReplyHandler___block_invoke_2;
    v6[3] = &unk_1E58B2CE0;
    v7 = v4;
    [v5 refreshKeybagWithReplyHandler:v6];
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __50__ASDRepairService_refreshKeybagWithReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (v7)
  {
    id v9 = v4;
    objc_storeStrong(v6, a2);
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v6, v4);
}

- (id)_asynchronousRemoteObjectProxyWithErrorHandler:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 8);
    id v9 = 0;
    uint64_t v5 = [v4 getRepairServiceWithError:&v9];
    id v6 = v9;
    if (v5)
    {
      uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v3];
    }
    else
    {
      v3[2](v3, v6);
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __50__ASDRepairService_refreshKeybagWithReplyHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)repairAppWithOptions:(id)a3 replyHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (self)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__ASDRepairService__callRepairServiceWithOptions_replyHandler___block_invoke;
    v13[3] = &unk_1E58B2CB8;
    id v9 = v7;
    id v14 = v9;
    v10 = -[ASDRepairService _asynchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v13);
    if (v10)
    {
      uint64_t v11 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = -[ASDRepairOptions copyUserInfoDictionary](v6);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_19BF6A000, v11, OS_LOG_TYPE_DEFAULT, "(RepairService) Calling repair service with options: %@", (uint8_t *)&buf, 0xCu);
      }
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v16 = __63__ASDRepairService__callRepairServiceWithOptions_replyHandler___block_invoke_12;
      v17 = &unk_1E58B5058;
      id v18 = v9;
      [v10 repairAppWithOptions:v6 replyHandler:&buf];
    }
  }
}

- (BOOL)isCoastGuardUnrepairableAppWithItemID:(unint64_t)a3 externalVersionID:(unint64_t)a4
{
  id v6 = objc_alloc_init(ASDCoastGuard);
  LOBYTE(a4) = [(ASDCoastGuard *)v6 isUnrepairableAppWithItemID:a3 externalVersionID:a4];

  return a4;
}

void __63__ASDRepairService__callRepairServiceWithOptions_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "(RepairService) Repair service call failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

void __63__ASDRepairService__callRepairServiceWithOptions_replyHandler___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = ASDLogHandleForCategory(13);
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_DEFAULT, "(RepairService) Repair service call completed sucessfully", (uint8_t *)&v12, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543362;
    id v13 = v8;
    _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "(RepairService) Repair service call returned error: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v11 + 16))(v11, a2, v7, v8);
  }
}

- (void).cxx_destruct
{
}

@end