@interface AFMachServiceSiriTaskDeliverer
+ (id)machServiceSiriTaskDelivererForAppWithBundleIdentifier:(id)a3;
- (AFMachServiceSiriTaskDeliverer)initWithMachServiceName:(id)a3;
- (NSString)description;
- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4;
@end

@implementation AFMachServiceSiriTaskDeliverer

- (void).cxx_destruct
{
}

- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__34591;
  v47 = __Block_byref_object_dispose__34592;
  id v48 = (id)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_machServiceName options:0];
  v8 = (void *)v44[5];
  v9 = objc_msgSend(MEMORY[0x1E4F29280], "af_siriTaskDeliveringInterface");
  [v8 setRemoteObjectInterface:v9];

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__34591;
  v39[4] = __Block_byref_object_dispose__34592;
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v40 = dispatch_queue_create("Mach Service Task Delivery Completion Handler", v10);

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke;
  v34[3] = &unk_1E592A180;
  v36 = v39;
  v37 = v41;
  id v11 = v7;
  id v35 = v11;
  v38 = &v43;
  v12 = (void *)MEMORY[0x19F3A50D0](v34);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_3;
  v32[3] = &unk_1E592C360;
  id v13 = v12;
  id v33 = v13;
  v14 = (void *)MEMORY[0x19F3A50D0](v32);
  v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v50 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]";
    __int16 v51 = 2112;
    v52 = self;
    __int16 v53 = 2080;
    v54 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]";
    __int16 v55 = 2112;
    id v56 = v6;
    _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s %@ %s %@", buf, 0x2Au);
  }
  v16 = (void *)v44[5];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_36;
  v30[3] = &unk_1E592C6E8;
  v30[4] = self;
  id v17 = v14;
  id v31 = v17;
  [v16 setInvalidationHandler:v30];
  v18 = (void *)v44[5];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_37;
  v28[3] = &unk_1E592C6E8;
  v28[4] = self;
  id v19 = v17;
  id v29 = v19;
  [v18 setInterruptionHandler:v28];
  [(id)v44[5] resume];
  v20 = (void *)v44[5];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_38;
  v26 = &unk_1E592B9A0;
  id v21 = v13;
  id v27 = v21;
  v22 = [v20 remoteObjectProxyWithErrorHandler:&v23];
  objc_msgSend(v22, "deliverSiriTask:completionHandler:", v6, v21, v23, v24, v25, v26);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);
}

void __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_2;
  v7[3] = &unk_1E592A158;
  uint64_t v10 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  uint64_t v11 = *(void *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[AFError errorWithCode:701];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 136315394;
    id v6 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s connection to task service %{public}@ was invalidated", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_37(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 136315394;
    id v6 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s connection to task service %{public}@ was interrupted", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s task service was unable to deliver task: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v1 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
    [*(id *)(*(void *)(a1[7] + 8) + 40) setInvalidationHandler:0];
    [*(id *)(*(void *)(a1[7] + 8) + 40) setInterruptionHandler:0];
    [*(id *)(*(void *)(a1[7] + 8) + 40) invalidate];
    uint64_t v3 = *(void *)(a1[7] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (NSString)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
  [v3 appendFormat:@"%@: %p; ", objc_opt_class(), self];
  [v3 appendString:@"machServiceName="];
  [v3 appendString:self->_machServiceName];
  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (AFMachServiceSiriTaskDeliverer)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFMachServiceSiriTaskDeliverer;
  int v5 = [(AFMachServiceSiriTaskDeliverer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v6;
  }
  return v5;
}

+ (id)machServiceSiriTaskDelivererForAppWithBundleIdentifier:(id)a3
{
  id v4 = +[AFSiriTaskService _machServiceNameForAppTaskServiceWithBundleIdentifier:a3];
  int v5 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:v4];

  return v5;
}

@end