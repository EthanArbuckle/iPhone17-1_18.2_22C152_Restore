@interface VCPHomeKitAnalysisSession
+ (id)sessionWithProperties:(id)a3 andResultsHandler:(id)a4;
+ (id)sessionWithProperties:(id)a3 withResultsHandler:(id)a4 andInterruptionHandler:(id)a5;
- (VCPHomeKitAnalysisSession)initWithProperties:(id)a3 withResultsHandler:(id)a4 andInterruptionHandler:(id)a5;
- (id).cxx_construct;
- (id)connection;
- (void)invalidate;
- (void)processMessageWithOptions:(id)a3 andCompletionHandler:(id)a4;
- (void)processResults:(id)a3 withReply:(id)a4;
- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5;
- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andErrorHandler:(id)a5;
@end

@implementation VCPHomeKitAnalysisSession

- (VCPHomeKitAnalysisSession)initWithProperties:(id)a3 withResultsHandler:(id)a4 andInterruptionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)VCPHomeKitAnalysisSession;
  v11 = [(VCPHomeKitAnalysisSession *)&v42 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  connection = v11->_connection;
  v11->_connection = 0;

  dispatch_queue_t v14 = dispatch_queue_create("com.apple.homekitanalysis.session.management", 0);
  managementQueue = v12->_managementQueue;
  v12->_managementQueue = (OS_dispatch_queue *)v14;

  dispatch_queue_t v16 = dispatch_queue_create("com.apple.homekitanalysis.session.handler", 0);
  handlerQueue = v12->_handlerQueue;
  v12->_handlerQueue = (OS_dispatch_queue *)v16;

  dispatch_queue_t v18 = dispatch_queue_create("com.apple.homekitanalysis.session.connection", 0);
  connectionQueue = v12->_connectionQueue;
  v12->_connectionQueue = (OS_dispatch_queue *)v18;

  v20 = _Block_copy(v9);
  id resultsHandler = v12->_resultsHandler;
  v12->_id resultsHandler = v20;

  v22 = _Block_copy(v10);
  id interruptionHander = v12->_interruptionHander;
  v12->_id interruptionHander = v22;

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__19;
  v40 = __Block_byref_object_dispose__19;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  v24 = [(VCPHomeKitAnalysisSession *)v12 connection];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __90__VCPHomeKitAnalysisSession_initWithProperties_withResultsHandler_andInterruptionHandler___block_invoke;
  v31[3] = &unk_1E6298D68;
  v31[4] = &v32;
  v31[5] = &v36;
  v25 = [v24 synchronousRemoteObjectProxyWithErrorHandler:v31];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __90__VCPHomeKitAnalysisSession_initWithProperties_withResultsHandler_andInterruptionHandler___block_invoke_194;
  v30[3] = &unk_1E6298D68;
  v30[4] = &v32;
  v30[5] = &v36;
  [v25 startSessionWithProperties:v8 andReply:v30];

  if (*((unsigned char *)v33 + 24))
  {
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);

LABEL_4:
    v26 = v12;
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v27 = VCPLogInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = v37[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v28;
      _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[HomeKit] VCPHomeKitAnalysisSession initialization fails (%@)", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  v26 = 0;
LABEL_10:

  return v26;
}

void __90__VCPHomeKitAnalysisSession_initWithProperties_withResultsHandler_andInterruptionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[HomeKit] Failed to connect to analysis service (%@)", (uint8_t *)&v7, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __90__VCPHomeKitAnalysisSession_initWithProperties_withResultsHandler_andInterruptionHandler___block_invoke_194(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 138412290;
        id v7 = v4;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[HomeKit] Failed to connect to analysis service (%@)", (uint8_t *)&v6, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

+ (id)sessionWithProperties:(id)a3 andResultsHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperties:v5 withResultsHandler:v6 andInterruptionHandler:&__block_literal_global_33];

  return v7;
}

+ (id)sessionWithProperties:(id)a3 withResultsHandler:(id)a4 andInterruptionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperties:v7 withResultsHandler:v8 andInterruptionHandler:v9];

  return v10;
}

- (id)connection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__19;
  id v10 = __Block_byref_object_dispose__19;
  id v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__VCPHomeKitAnalysisSession_connection__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__VCPHomeKitAnalysisSession_connection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaanalysisd.homekitsession" options:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v6 = objc_alloc_init(VCPHomeKitSessionExportedObject);
    [(VCPHomeKitSessionExportedObject *)v6 setWeakSession:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:v6];
    id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F16408F8];
    uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1603938];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    id v9 = (void *)getHMIVideoAnalyzerClass(void)::softClass;
    uint64_t v22 = getHMIVideoAnalyzerClass(void)::softClass;
    if (!getHMIVideoAnalyzerClass(void)::softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = ___ZL24getHMIVideoAnalyzerClassv_block_invoke;
      location[3] = &unk_1E62970F8;
      location[4] = &v19;
      ___ZL24getHMIVideoAnalyzerClassv_block_invoke((uint64_t)location);
      id v9 = (void *)v20[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v19, 8);
    id v11 = [v10 allowedClasses];
    [v7 setClasses:v11 forSelector:sel_processVideoFragmentAssetData_withOptions_andReply_ argumentIndex:1 ofReply:0];
    [v7 setClasses:v11 forSelector:sel_processVideoFragmentAssetData_withOptions_andReply_ argumentIndex:0 ofReply:1];
    [v7 setClasses:v11 forSelector:sel_processMessageWithOptions_andReply_ argumentIndex:0 ofReply:0];
    [v7 setClasses:v11 forSelector:sel_processMessageWithOptions_andReply_ argumentIndex:0 ofReply:1];
    [v7 setClasses:v11 forSelector:sel_startSessionWithProperties_andReply_ argumentIndex:0 ofReply:0];
    [v8 setClasses:v11 forSelector:sel_processResults_withReply_ argumentIndex:0 ofReply:0];
    [*(id *)(*(void *)(a1 + 32) + 8) setRemoteObjectInterface:v7];
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedInterface:v8];
    objc_initWeak(location, *(id *)(a1 + 32));
    v12 = *(void **)(*(void *)(a1 + 32) + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __39__VCPHomeKitAnalysisSession_connection__block_invoke_2;
    v16[3] = &unk_1E62981D8;
    objc_copyWeak(&v17, location);
    [v12 setInterruptionHandler:v16];
    v13 = *(void **)(*(void *)(a1 + 32) + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__VCPHomeKitAnalysisSession_connection__block_invoke_2_212;
    v14[3] = &unk_1E62981D8;
    objc_copyWeak(&v15, location);
    [v13 setInvalidationHandler:v14];
    [*(id *)(*(void *)(a1 + 32) + 8) resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(location);

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __39__VCPHomeKitAnalysisSession_connection__block_invoke_2(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "[HomeKit] Client XPC connection interrupted", buf, 2u);
    }
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__VCPHomeKitAnalysisSession_connection__block_invoke_211;
    block[3] = &unk_1E6296FF8;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __39__VCPHomeKitAnalysisSession_connection__block_invoke_211(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 8) = 0;

    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(*(void *)(v3 + 32) + 56) + 16);
    return v4();
  }
  return result;
}

void __39__VCPHomeKitAnalysisSession_connection__block_invoke_2_212(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "[HomeKit] Client XPC connection invalidated", buf, 2u);
    }
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__VCPHomeKitAnalysisSession_connection__block_invoke_213;
    block[3] = &unk_1E6296FF8;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __39__VCPHomeKitAnalysisSession_connection__block_invoke_213(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 8) = 0;

    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(*(void *)(v3 + 32) + 56) + 16);
    return v4();
  }
  return result;
}

- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andErrorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  managementQueue = self->_managementQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke;
  v15[3] = &unk_1E6298DB8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(managementQueue, v15);
}

void __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_215];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_216;
  v6[3] = &unk_1E6298D90;
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  [v3 processVideoFragmentAssetData:v4 withOptions:v5 andReply:v6];
}

void __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_2()
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEFAULT, "[HomeKit] Error connecting to background analysis service", v1, 2u);
    }
  }
}

void __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_216(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_2_217;
  v8[3] = &unk_1E6297880;
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, v8);
}

uint64_t __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_2_217(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  managementQueue = self->_managementQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke;
  v15[3] = &unk_1E6298DE0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_sync(managementQueue, v15);
}

void __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E6297C10;
    id v14 = *(id *)(a1 + 56);
    uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_225;
    v11[3] = &unk_1E6298D90;
    v11[4] = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 56);
    [v3 processVideoFragmentAssetData:v4 withOptions:v5 andReply:v11];

    id v6 = v14;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v6 = [NSString stringWithFormat:@"[HomeKit] XPC connection invalidated. Please restart the session."];
    v16[0] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v10 = [v8 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v10);
  }
}

void __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[HomeKit] Error connecting to background analysis service", v5, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_225(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_2_226;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_2_226(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)processMessageWithOptions:(id)a3 andCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6298E08;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(managementQueue, block);
}

void __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E6297C10;
    id v13 = *(id *)(a1 + 48);
    id v3 = [v2 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_227;
    v10[3] = &unk_1E6298D90;
    uint64_t v4 = *(void *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [v3 processMessageWithOptions:v4 andReply:v10];

    id v5 = v13;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v5 = [NSString stringWithFormat:@"[HomeKit] XPC connection invalidated. Please restart the session."];
    v15[0] = v5;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v9 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v8];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v9);
  }
}

void __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[HomeKit] Error connecting to background analysis service", v5, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_2_228;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_2_228(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)processResults:(id)a3 withReply:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (self->_resultsHandler)
  {
    handlerQueue = self->_handlerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__VCPHomeKitAnalysisSession_processResults_withReply___block_invoke;
    block[3] = &unk_1E62982E8;
    void block[4] = self;
    id v14 = v6;
    dispatch_async(handlerQueue, block);
    v7[2](v7, 0);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithFormat:@"No result handler registered"];
    v16[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v11];
    ((void (**)(id, void *))v7)[2](v7, v12);
  }
}

uint64_t __54__VCPHomeKitAnalysisSession_processResults_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHander, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_formatDescription.value_);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  return self;
}

@end