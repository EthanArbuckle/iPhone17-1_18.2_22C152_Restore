@interface VCPHomeKitAnalysisService
+ (id)analysisService;
- (VCPHomeKitAnalysisService)init;
- (id)connection;
- (int)requestAnalysis:(unint64_t)a3 ofAssetData:(id)a4 withProperties:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)requestAnalysis:(unint64_t)a3 ofAssetSurface:(id)a4 withProperties:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)requestResidentMaintenanceWithOptions:(id)a3 andCompletionHandler:(id)a4;
- (void)cancelAllRequests;
- (void)cancelRequest:(int)a3;
- (void)reportProgress:(double)a3 forRequest:(int)a4;
@end

@implementation VCPHomeKitAnalysisService

- (VCPHomeKitAnalysisService)init
{
  v13.receiver = self;
  v13.super_class = (Class)VCPHomeKitAnalysisService;
  v2 = [(VCPHomeKitAnalysisService *)&v13 init];
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.homekitanalysis.service.management", 0);
    managementQueue = v3->_managementQueue;
    v3->_managementQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.homekitanalysis.service.handler", 0);
    handlerQueue = v3->_handlerQueue;
    v3->_handlerQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    progressBlocks = v3->_progressBlocks;
    v3->_progressBlocks = (NSMutableDictionary *)v9;

    v3->_nextRequestID = 1;
    v11 = v3;
  }

  return v3;
}

+ (id)analysisService
{
  v2 = objc_alloc_init(VCPHomeKitAnalysisService);
  return v2;
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaanalysisd.homekit" options:0];
    dispatch_queue_t v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F16409B8];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    dispatch_queue_t v7 = (void *)getHMIAnalysisServiceClass_softClass;
    uint64_t v27 = getHMIAnalysisServiceClass_softClass;
    if (!getHMIAnalysisServiceClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getHMIAnalysisServiceClass_block_invoke;
      v22 = &unk_1E629B028;
      v23 = &v24;
      __getHMIAnalysisServiceClass_block_invoke((uint64_t)&v19);
      dispatch_queue_t v7 = (void *)v25[3];
    }
    v8 = v7;
    _Block_object_dispose(&v24, 8);
    id v9 = objc_alloc_init(v8);
    v10 = [v9 expectedClasses];

    [v6 setClasses:v10 forSelector:sel_requestAnalysis_ofFragmentData_withRequestID_properties_andReply_ argumentIndex:3 ofReply:0];
    [v6 setClasses:v10 forSelector:sel_requestAnalysis_ofFragmentData_withRequestID_properties_andReply_ argumentIndex:0 ofReply:1];
    [v6 setClasses:v10 forSelector:sel_requestAnalysis_ofFragmentSurface_withRequestID_properties_andReply_ argumentIndex:3 ofReply:0];
    [v6 setClasses:v10 forSelector:sel_requestAnalysis_ofFragmentSurface_withRequestID_properties_andReply_ argumentIndex:0 ofReply:1];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v11 = (void *)getHMITaskServiceClass_softClass;
    uint64_t v27 = getHMITaskServiceClass_softClass;
    if (!getHMITaskServiceClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getHMITaskServiceClass_block_invoke;
      v22 = &unk_1E629B028;
      v23 = &v24;
      __getHMITaskServiceClass_block_invoke((uint64_t)&v19);
      v11 = (void *)v25[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v24, 8);
    objc_super v13 = [v12 allowedClasses];
    [v6 setClasses:v13 forSelector:sel_requestResidentMaintenance_withOptions_andReply_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];
    v14 = self->_connection;
    v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1618620];
    [(NSXPCConnection *)v14 setExportedInterface:v15];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_81];
    v16 = self->_connection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__VCPHomeKitAnalysisService_connection__block_invoke_213;
    v18[3] = &unk_1E6296FD0;
    v18[4] = self;
    [(NSXPCConnection *)v16 setInvalidationHandler:v18];
    [(NSXPCConnection *)self->_connection resume];

    connection = self->_connection;
  }
  return connection;
}

void __39__VCPHomeKitAnalysisService_connection__block_invoke()
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEBUG, "HomeKit analysis client XPC connection interrupted", v1, 2u);
    }
  }
}

void __39__VCPHomeKitAnalysisService_connection__block_invoke_213(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "HomeKit analysis client XPC connection invalidated", v5, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
}

- (int)requestAnalysis:(unint64_t)a3 ofAssetData:(id)a4 withProperties:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E629C4E8;
  id v26 = v15;
  uint64_t v27 = &v29;
  unint64_t v28 = a3;
  block[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  id v20 = v14;
  dispatch_sync(managementQueue, block);
  LODWORD(a3) = *((_DWORD *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  return a3;
}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    dispatch_queue_t v5 = *(const void **)(a1 + 56);
  }
  else {
    dispatch_queue_t v5 = &__block_literal_global_216;
  }
  v6 = _Block_copy(v5);
  dispatch_queue_t v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  v8 = [*(id *)(a1 + 32) connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E629C448;
  v20[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v16;
  long long v21 = v16;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(unsigned int *)(*(void *)(v11 + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_3_221;
  v17[3] = &unk_1E629C4C0;
  v17[4] = *(void *)(a1 + 32);
  uint64_t v19 = v11;
  id v18 = *(id *)(a1 + 64);
  [v10 requestAnalysis:v12 ofFragmentData:v14 withRequestID:v13 properties:v15 andReply:v17];
}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Error connecting to background analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_218;
  block[3] = &unk_1E629C420;
  block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_218(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_2_219;
  v5[3] = &unk_1E629C3F8;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_2_219(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_3_221(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E629C498;
  block[4] = v7;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v16 = v12;
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_5;
  block[3] = &unk_1E629C470;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAnalysis:(unint64_t)a3 ofAssetSurface:(id)a4 withProperties:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E629C4E8;
  id v26 = v15;
  uint64_t v27 = &v29;
  unint64_t v28 = a3;
  void block[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  id v20 = v14;
  dispatch_sync(managementQueue, block);
  LODWORD(a3) = *((_DWORD *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  return a3;
}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_224;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  id v8 = [*(id *)(a1 + 32) connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E629C448;
  v20[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v16;
  long long v21 = v16;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(unsigned int *)(*(void *)(v11 + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_3_227;
  v17[3] = &unk_1E629C4C0;
  v17[4] = *(void *)(a1 + 32);
  uint64_t v19 = v11;
  id v18 = *(id *)(a1 + 64);
  [v10 requestAnalysis:v12 ofFragmentSurface:v14 withRequestID:v13 properties:v15 andReply:v17];
}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Error connecting to background analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_225;
  block[3] = &unk_1E629C420;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_225(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_2_226;
  v5[3] = &unk_1E629C3F8;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_2_226(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_3_227(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E629C498;
  void block[4] = v7;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v16 = v12;
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_5;
  block[3] = &unk_1E629C470;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)reportProgress:(double)a3 forRequest:(int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      int v12 = a4;
      __int16 v13 = 2048;
      double v14 = a3;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[HomeKitAnalysis] Request %d is %.2f%% complete", buf, 0x12u);
    }
  }
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VCPHomeKitAnalysisService_reportProgress_forRequest___block_invoke;
  block[3] = &unk_1E629C538;
  void block[4] = self;
  int v10 = a4;
  *(double *)&void block[5] = a3;
  dispatch_async(managementQueue, block);
}

void __55__VCPHomeKitAnalysisService_reportProgress_forRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__VCPHomeKitAnalysisService_reportProgress_forRequest___block_invoke_2;
    v6[3] = &unk_1E629C510;
    id v7 = v4;
    uint64_t v8 = *(void *)(a1 + 40);
    dispatch_async(v5, v6);
  }
}

uint64_t __55__VCPHomeKitAnalysisService_reportProgress_forRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)cancelRequest:(int)a3
{
  managementQueue = self->_managementQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__VCPHomeKitAnalysisService_cancelRequest___block_invoke;
  v4[3] = &unk_1E629C560;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(managementQueue, v4);
}

void __43__VCPHomeKitAnalysisService_cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v8 = [*(id *)(a1 + 32) connection];
    int v5 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_229_0];
    [v5 cancelRequest:*(unsigned int *)(a1 + 40)];
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 67109120;
      int v10 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Unknown analysis request %d; dropping cancellation request",
        buf,
        8u);
    }
  }
}

void __43__VCPHomeKitAnalysisService_cancelRequest___block_invoke_2()
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Error connecting to background analysis service", v1, 2u);
    }
  }
}

- (void)cancelAllRequests
{
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCPHomeKitAnalysisService_cancelAllRequests__block_invoke;
  block[3] = &unk_1E6296FD0;
  void block[4] = self;
  dispatch_sync(managementQueue, block);
}

void __46__VCPHomeKitAnalysisService_cancelAllRequests__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v4 = [*(id *)(a1 + 32) connection];
    uint64_t v2 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_231];
    [v2 cancelAllRequests];
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] No active analysis requests; dropping cancellation request",
        buf,
        2u);
    }
  }
}

void __46__VCPHomeKitAnalysisService_cancelAllRequests__block_invoke_2()
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Error connecting to background analysis service", v1, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBlocks, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (int)requestResidentMaintenanceWithOptions:(id)a3 andCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = -1;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke;
  v12[3] = &unk_1E629C5B0;
  id v14 = v7;
  uint64_t v15 = &v16;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(managementQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  int v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:&__block_literal_global_252_1 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E629C4C0;
  aBlock[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v11;
  long long v15 = v11;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_6;
  v12[3] = &unk_1E629C588;
  id v13 = v7;
  id v9 = v7;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v12];
  [v10 requestResidentMaintenance:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) withOptions:*(void *)(a1 + 40) andReply:v9];
}

void __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E629C498;
  void block[4] = v7;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v16 = v12;
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

void __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  int v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_5;
  block[3] = &unk_1E629C470;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[HomeKit] Error connecting to background analysis service", v5, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end