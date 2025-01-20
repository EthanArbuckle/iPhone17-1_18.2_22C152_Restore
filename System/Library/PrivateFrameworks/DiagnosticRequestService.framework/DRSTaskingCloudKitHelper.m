@interface DRSTaskingCloudKitHelper
+ (id)prodContainerHelper;
+ (id)sandboxContainerHelper;
+ (id)taskingDeviceMetadata;
- (CKContainer)_targetContainer;
- (DRSTaskingCloudKitHelper)initWithContainer:(id)a3;
- (OS_dispatch_queue)workQueue;
- (id)_operationWithFunctionName:(id)a3;
- (id)_taskingConfigMetadataForTeamID:(id)a3 uuidString:(id)a4;
- (void)_recordPBMessage:(id)a3 forFunction:(id)a4;
- (void)_submitOperationWithName:(id)a3 requestObject:(id)a4 completionBlock:(id)a5;
- (void)reportTaskingConfigCompletion:(id)a3 uuidString:(id)a4 completionType:(id)a5 completionDescription:(id)a6 activeDuration:(double)a7 transaction:(id)a8 completionHandler:(id)a9;
- (void)reportTaskingConfigReceipt:(id)a3 uuidString:(id)a4 receiptResult:(id)a5 transaction:(id)a6 completionHandler:(id)a7;
- (void)reportTaskingSystemMessageReceipt:(id)a3 messageType:(id)a4 channelType:(id)a5 channelEnvironment:(id)a6 dateBroadcast:(id)a7 dateReceived:(id)a8 transaction:(id)a9 completionHandler:(id)a10;
@end

@implementation DRSTaskingCloudKitHelper

- (DRSTaskingCloudKitHelper)initWithContainer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DRSTaskingCloudKitHelper;
  v6 = [(DRSTaskingCloudKitHelper *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__targetContainer, a3);
    dispatch_queue_t v8 = dispatch_queue_create("TaskingCloudKitHelper work queue", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

+ (id)sandboxContainerHelper
{
  if (sandboxContainerHelper_onceToken_0 != -1) {
    dispatch_once(&sandboxContainerHelper_onceToken_0, &__block_literal_global_12);
  }
  v2 = (void *)sandboxContainerHelper_helper_0;

  return v2;
}

void __50__DRSTaskingCloudKitHelper_sandboxContainerHelper__block_invoke()
{
  v0 = [DRSTaskingCloudKitHelper alloc];
  DRSSandboxContainer();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(DRSTaskingCloudKitHelper *)v0 initWithContainer:v3];
  v2 = (void *)sandboxContainerHelper_helper_0;
  sandboxContainerHelper_helper_0 = v1;
}

+ (id)prodContainerHelper
{
  if (prodContainerHelper_onceToken_0 != -1) {
    dispatch_once(&prodContainerHelper_onceToken_0, &__block_literal_global_57_0);
  }
  v2 = (void *)prodContainerHelper_helper_0;

  return v2;
}

void __47__DRSTaskingCloudKitHelper_prodContainerHelper__block_invoke()
{
  v0 = [DRSTaskingCloudKitHelper alloc];
  DRSProductionContainer();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(DRSTaskingCloudKitHelper *)v0 initWithContainer:v3];
  v2 = (void *)prodContainerHelper_helper_0;
  prodContainerHelper_helper_0 = v1;
}

- (id)_operationWithFunctionName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFD600];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithServiceName:kDRSCloudKitDecisionServerName functionName:v5 responseClass:objc_opt_class()];

  dispatch_queue_t v8 = [(DRSTaskingCloudKitHelper *)self _targetContainer];
  DRSConfigureOperation(v7, v8, 0);

  return v7;
}

- (void)_submitOperationWithName:(id)a3 requestObject:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(DRSTaskingCloudKitHelper *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__DRSTaskingCloudKitHelper__submitOperationWithName_requestObject_completionBlock___block_invoke;
  v15[3] = &unk_263FCA8E0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __83__DRSTaskingCloudKitHelper__submitOperationWithName_requestObject_completionBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _operationWithFunctionName:*(void *)(a1 + 40)];
  [v2 setRequest:*(void *)(a1 + 48)];
  id v3 = (void *)os_transaction_create();
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __83__DRSTaskingCloudKitHelper__submitOperationWithName_requestObject_completionBlock___block_invoke_2;
  objc_super v11 = &unk_263FCA8B8;
  id v4 = *(id *)(a1 + 56);
  id v12 = v3;
  id v13 = v4;
  id v5 = v3;
  [v2 setCodeOperationCompletionBlock:&v8];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_targetContainer", v8, v9, v10, v11);
  v7 = [v6 publicCloudDatabase];
  [v7 addOperation:v2];
}

uint64_t __83__DRSTaskingCloudKitHelper__submitOperationWithName_requestObject_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)taskingDeviceMetadata
{
  if (taskingDeviceMetadata_onceToken != -1) {
    dispatch_once(&taskingDeviceMetadata_onceToken, &__block_literal_global_63_0);
  }
  v2 = (void *)taskingDeviceMetadata_taskingDeviceMetadata;

  return v2;
}

void __49__DRSTaskingCloudKitHelper_taskingDeviceMetadata__block_invoke()
{
  v0 = objc_alloc_init(DRSProtoTaskingDeviceMetadata);
  uint64_t v1 = (void *)taskingDeviceMetadata_taskingDeviceMetadata;
  taskingDeviceMetadata_taskingDeviceMetadata = (uint64_t)v0;

  v2 = DRSDeviceMetadata();
  [(id)taskingDeviceMetadata_taskingDeviceMetadata setDeviceMetadata:v2];

  id v4 = +[DRSSystemProfile sharedInstance];
  id v3 = [v4 build];
  [(id)taskingDeviceMetadata_taskingDeviceMetadata setBuild:v3];
}

- (void)_recordPBMessage:(id)a3 forFunction:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F08900];
  v7 = [a3 dictionaryRepresentation];
  id v12 = 0;
  uint64_t v8 = [v6 dataWithJSONObject:v7 options:1 error:&v12];
  id v9 = v12;

  if (v9)
  {
    id v10 = DPLogHandle_TaskingDSTelemetry();
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v9;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProtoBuffMessageJSONFailed", "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v10 = [[NSString alloc] initWithData:v8 encoding:4];
    objc_super v11 = DPLogHandle_TaskingDSTelemetry();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProtoBuffMessage", "%{public}@:\n%{public}@", buf, 0x16u);
    }
  }
}

- (void)reportTaskingSystemMessageReceipt:(id)a3 messageType:(id)a4 channelType:(id)a5 channelEnvironment:(id)a6 dateBroadcast:(id)a7 dateReceived:(id)a8 transaction:(id)a9 completionHandler:(id)a10
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v16 = (__CFString *)a3;
  uint64_t v17 = (__CFString *)a4;
  id v38 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v34 = a9;
  id v35 = a10;
  v37 = v19;
  if (v20)
  {
    v21 = NSNumber;
    [v20 timeIntervalSinceDate:v19];
    v22 = objc_msgSend(v21, "numberWithDouble:");
  }
  else
  {
    v22 = &unk_26BE05850;
  }
  v36 = v20;
  if (v16) {
    v23 = v16;
  }
  else {
    v23 = @"Unknown";
  }
  if (v17) {
    v24 = v17;
  }
  else {
    v24 = @"Unknown";
  }
  v25 = DPLogHandle_TaskingDSTelemetry();
  os_signpost_id_t v26 = os_signpost_id_generate(v25);

  v27 = DPLogHandle_TaskingDSTelemetry();
  v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 138544386;
    v44 = v23;
    __int16 v45 = 2114;
    v46 = v24;
    __int16 v47 = 2114;
    id v48 = v38;
    __int16 v49 = 2114;
    id v50 = v18;
    __int16 v51 = 2114;
    v52 = v22;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "TaskingSystemMessageReceipt", "\tUUID: %{public}@\n\tmessageType: %{public}@\n\tchannelType: %{public}@\n\tchannelEnvironment: %{public}@\n\tlatency: %{public}@", buf, 0x34u);
  }

  v29 = objc_alloc_init(DRSProtoTaskingSystemMessageReceipt);
  [(id)objc_opt_class() taskingDeviceMetadata];
  v31 = v30 = v18;
  [(DRSProtoTaskingSystemMessageReceipt *)v29 setTaskingDeviceMetadata:v31];

  [(DRSProtoTaskingSystemMessageReceipt *)v29 setUuid:v23];
  [(DRSProtoTaskingSystemMessageReceipt *)v29 setMessageType:v24];
  [(DRSProtoTaskingSystemMessageReceipt *)v29 setChannelType:v38];
  [(DRSProtoTaskingSystemMessageReceipt *)v29 setChannelEnvironment:v30];
  [v22 floatValue];
  -[DRSProtoTaskingSystemMessageReceipt setReceiptDelay:](v29, "setReceiptDelay:");
  [(DRSTaskingCloudKitHelper *)self _recordPBMessage:v29 forFunction:@"reportTaskingSystemMessageReceipt"];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __162__DRSTaskingCloudKitHelper_reportTaskingSystemMessageReceipt_messageType_channelType_channelEnvironment_dateBroadcast_dateReceived_transaction_completionHandler___block_invoke;
  v39[3] = &unk_263FCA908;
  id v41 = v35;
  os_signpost_id_t v42 = v26;
  id v40 = v34;
  id v32 = v34;
  id v33 = v35;
  [(DRSTaskingCloudKitHelper *)self _submitOperationWithName:@"reportTaskingSystemMessageReceipt" requestObject:v29 completionBlock:v39];
}

void __162__DRSTaskingCloudKitHelper_reportTaskingSystemMessageReceipt_messageType_channelType_channelEnvironment_dateBroadcast_dateReceived_transaction_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DPLogHandle_TaskingDSTelemetry();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v4)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      int v12 = 138543362;
      id v13 = v4;
      uint64_t v8 = "Failed with error: %{public}@";
      id v9 = v6;
      os_signpost_id_t v10 = v7;
      uint32_t v11 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_INTERVAL_END, v10, "TaskingSystemMessageReceipt", v8, (uint8_t *)&v12, v11);
    }
  }
  else if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    uint64_t v8 = "Succeeded";
    id v9 = v6;
    os_signpost_id_t v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_8;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
}

- (id)_taskingConfigMetadataForTeamID:(id)a3 uuidString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  os_signpost_id_t v7 = objc_alloc_init(DRSProtoTaskingConfigMetadata);
  uint64_t v8 = [(id)objc_opt_class() taskingDeviceMetadata];
  [(DRSProtoTaskingConfigMetadata *)v7 setTaskingDeviceMetadata:v8];

  [(DRSProtoTaskingConfigMetadata *)v7 setTeamId:v6];
  [(DRSProtoTaskingConfigMetadata *)v7 setUuid:v5];

  return v7;
}

- (void)reportTaskingConfigReceipt:(id)a3 uuidString:(id)a4 receiptResult:(id)a5 transaction:(id)a6 completionHandler:(id)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = DPLogHandle_TaskingDSTelemetry();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);

  id v19 = DPLogHandle_TaskingDSTelemetry();
  id v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138543874;
    id v30 = v13;
    __int16 v31 = 2114;
    id v32 = v12;
    __int16 v33 = 2114;
    id v34 = v14;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "TaskingConfigReceipt", "\tUUID: %{public}@\n\tteamID: %{public}@\n\treceiptResult: %{public}@\n", buf, 0x20u);
  }

  v21 = objc_alloc_init(DRSProtoTaskingConfigReceipt);
  v22 = [(DRSTaskingCloudKitHelper *)self _taskingConfigMetadataForTeamID:v12 uuidString:v13];
  [(DRSProtoTaskingConfigReceipt *)v21 setTaskingConfigMetadata:v22];

  [(DRSProtoTaskingConfigReceipt *)v21 setReceiptResult:v14];
  [(DRSTaskingCloudKitHelper *)self _recordPBMessage:v21 forFunction:@"reportTaskingConfigReceipt"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __110__DRSTaskingCloudKitHelper_reportTaskingConfigReceipt_uuidString_receiptResult_transaction_completionHandler___block_invoke;
  v25[3] = &unk_263FCA908;
  id v27 = v16;
  os_signpost_id_t v28 = v18;
  id v26 = v15;
  id v23 = v15;
  id v24 = v16;
  [(DRSTaskingCloudKitHelper *)self _submitOperationWithName:@"reportTaskingConfigReceipt" requestObject:v21 completionBlock:v25];
}

void __110__DRSTaskingCloudKitHelper_reportTaskingConfigReceipt_uuidString_receiptResult_transaction_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DPLogHandle_TaskingDSTelemetry();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v4)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      int v12 = 138543362;
      id v13 = v4;
      uint64_t v8 = "Failed with error: %{public}@";
      id v9 = v6;
      os_signpost_id_t v10 = v7;
      uint32_t v11 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_INTERVAL_END, v10, "TaskingConfigReceipt", v8, (uint8_t *)&v12, v11);
    }
  }
  else if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    uint64_t v8 = "Succeeded";
    id v9 = v6;
    os_signpost_id_t v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_8;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
}

- (void)reportTaskingConfigCompletion:(id)a3 uuidString:(id)a4 completionType:(id)a5 completionDescription:(id)a6 activeDuration:(double)a7 transaction:(id)a8 completionHandler:(id)a9
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  v22 = DPLogHandle_TaskingDSTelemetry();
  os_signpost_id_t v23 = os_signpost_id_generate(v22);

  id v24 = DPLogHandle_TaskingDSTelemetry();
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138544386;
    id v36 = v17;
    __int16 v37 = 2114;
    id v38 = v16;
    __int16 v39 = 2114;
    id v40 = v18;
    __int16 v41 = 2114;
    id v42 = v19;
    __int16 v43 = 2050;
    double v44 = a7;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, v23, "TaskingConfigCompletion", "\tUUID: %{public}@\n\tteamID: %{public}@\n\tcompletionType: %{public}@\n\tcompletionDescription: %{public}@\n\tactiveDuration: %{public}f\n", buf, 0x34u);
  }

  id v26 = objc_alloc_init(DRSProtoTaskingConfigCompletion);
  id v27 = [(DRSTaskingCloudKitHelper *)self _taskingConfigMetadataForTeamID:v16 uuidString:v17];
  [(DRSProtoTaskingConfigCompletion *)v26 setTaskingConfigMetadata:v27];

  [(DRSProtoTaskingConfigCompletion *)v26 setCompletionType:v18];
  [(DRSProtoTaskingConfigCompletion *)v26 setCompletionDescription:v19];
  *(float *)&double v28 = a7;
  [(DRSProtoTaskingConfigCompletion *)v26 setActiveDuration:v28];
  [(DRSTaskingCloudKitHelper *)self _recordPBMessage:v26 forFunction:@"reportTaskingConfigCompletion"];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __151__DRSTaskingCloudKitHelper_reportTaskingConfigCompletion_uuidString_completionType_completionDescription_activeDuration_transaction_completionHandler___block_invoke;
  v31[3] = &unk_263FCA908;
  id v33 = v21;
  os_signpost_id_t v34 = v23;
  id v32 = v20;
  id v29 = v20;
  id v30 = v21;
  [(DRSTaskingCloudKitHelper *)self _submitOperationWithName:@"reportTaskingConfigCompletion" requestObject:v26 completionBlock:v31];
}

void __151__DRSTaskingCloudKitHelper_reportTaskingConfigCompletion_uuidString_completionType_completionDescription_activeDuration_transaction_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DPLogHandle_TaskingDSTelemetry();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v4)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      int v12 = 138543362;
      id v13 = v4;
      uint64_t v8 = "Failed with error: %{public}@";
      id v9 = v6;
      os_signpost_id_t v10 = v7;
      uint32_t v11 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_INTERVAL_END, v10, "TaskingConfigCompletion", v8, (uint8_t *)&v12, v11);
    }
  }
  else if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    uint64_t v8 = "Succeeded";
    id v9 = v6;
    os_signpost_id_t v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_8;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
}

- (CKContainer)_targetContainer
{
  return self->__targetContainer;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->__targetContainer, 0);
}

@end