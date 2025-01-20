@interface DEDCloudKitClient
- (CKContainer)container;
- (DEDBugSession)bugSession;
- (DEDBugSessionConfiguration)bugSessionConfig;
- (DEDCloudKitClient)initWithBugSession:(id)a3 configuration:(id)a4;
- (OS_os_log)log;
- (void)setBugSession:(id)a3;
- (void)setBugSessionConfig:(id)a3;
- (void)setContainer:(id)a3;
- (void)setLog:(id)a3;
- (void)uploadRecords:(id)a3 taskIdentifier:(id)a4 totalUploadSize:(id)a5 perRecordProgressBlock:(id)a6 perRecordSaveBlock:(id)a7 completionBlock:(id)a8;
@end

@implementation DEDCloudKitClient

- (DEDCloudKitClient)initWithBugSession:(id)a3 configuration:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)DEDCloudKitClient;
  v9 = [(DEDCloudKitClient *)&v25 init];
  if (v9)
  {
    v10 = +[DEDConfiguration sharedInstance];
    os_log_t v11 = os_log_create((const char *)[v10 loggingSubsystem], "ded-cloudkit-client");
    log = v9->_log;
    v9->_log = (OS_os_log *)v11;

    objc_storeStrong((id *)&v9->_bugSession, a3);
    objc_storeStrong((id *)&v9->_bugSessionConfig, a4);
    v13 = [v8 cloudkitData];

    v14 = v9->_log;
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        v16 = v14;
        v17 = [v8 cloudkitData];
        *(_DWORD *)buf = 138543362;
        v27 = v17;
        _os_log_impl(&dword_21FE04000, v16, OS_LOG_TYPE_DEFAULT, "cloudkitData: %{public}@", buf, 0xCu);
      }
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_DEFAULT, "No additional CloudKit data was provided", buf, 2u);
    }
    if ([v8 cloudkitUseDevelopmentEnvironment]) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    id v19 = objc_alloc(MEMORY[0x263EFD620]);
    v20 = [v8 cloudkitContainer];
    v21 = (void *)[v19 initWithContainerIdentifier:v20 environment:v18];

    uint64_t v22 = [objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v21];
    container = v9->_container;
    v9->_container = (CKContainer *)v22;
  }
  return v9;
}

- (void)uploadRecords:(id)a3 taskIdentifier:(id)a4 totalUploadSize:(id)a5 perRecordProgressBlock:(id)a6 perRecordSaveBlock:(id)a7 completionBlock:(id)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = [MEMORY[0x263F29900] sharedScheduler];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke;
  v34[3] = &unk_26453BB78;
  v34[4] = self;
  id v21 = v15;
  id v35 = v21;
  id v31 = v14;
  id v36 = v31;
  id v22 = v17;
  id v37 = v22;
  id v23 = v18;
  id v38 = v23;
  id v24 = v19;
  id v39 = v24;
  [v20 registerForTaskWithIdentifier:v21 usingQueue:0 launchHandler:v34];

  objc_super v25 = (void *)[objc_alloc(MEMORY[0x263F298E0]) initWithIdentifier:v21];
  [v25 setPriority:2];
  [v25 setRequiresNetworkConnectivity:1];
  if (v16) {
    objc_msgSend(v25, "setNetworkUploadSize:", objc_msgSend(v16, "integerValue", v31));
  }
  v26 = objc_msgSend(MEMORY[0x263F29900], "sharedScheduler", v31);
  id v33 = 0;
  int v27 = [v26 submitTaskRequest:v25 error:&v33];
  id v28 = v33;

  v29 = [(DEDCloudKitClient *)self log];
  v30 = v29;
  if (v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = v21;
      _os_log_impl(&dword_21FE04000, v30, OS_LOG_TYPE_DEFAULT, "Submitted task %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[DEDCloudKitClient uploadRecords:taskIdentifier:totalUploadSize:perRecordProgressBlock:perRecordSaveBlock:completionBlock:]((uint64_t)v21, (uint64_t)v28, v30);
    }

    if (v24) {
      (*((void (**)(id, id))v24 + 2))(v24, v28);
    }
  }
}

void __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_2;
  v27[3] = &unk_26453BB00;
  v4 = *(void **)(a1 + 40);
  v27[4] = *(void *)(a1 + 32);
  id v28 = v4;
  v29 = &v30;
  [v3 setExpirationHandler:v27];
  if (!*((unsigned char *)v31 + 24))
  {
    v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v6;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Task %{public}@ is running", buf, 0xCu);
    }

    id v7 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 48) count];
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v35 = v8;
      __int16 v36 = 2112;
      uint64_t v37 = v9;
      _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Uploading %lu records: %@", buf, 0x16u);
    }

    id v10 = objc_alloc_init(MEMORY[0x263EFD778]);
    [v10 setQualityOfService:17];
    [v10 setAllowsCellularAccess:1];
    [v10 setAllowsExpensiveNetworkAccess:1];
    [v10 setSystemTask:v3];
    os_log_t v11 = (void *)[objc_alloc(MEMORY[0x263EFD748]) initWithRecordsToSave:*(void *)(a1 + 48) recordIDsToDelete:0];
    [v11 setConfiguration:v10];
    v12 = (void *)[*(id *)(a1 + 56) copy];
    [v11 setPerRecordProgressBlock:v12];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_17;
    v25[3] = &unk_26453BB28;
    v25[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 64);
    [v11 setPerRecordSaveBlock:v25];
    objc_initWeak((id *)buf, v11);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_19;
    id v19 = &unk_26453BB50;
    objc_copyWeak(&v24, (id *)buf);
    v13 = *(void **)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = v13;
    id v22 = v3;
    id v23 = *(id *)(a1 + 72);
    [v11 setCompletionBlock:&v16];
    id v14 = objc_msgSend(*(id *)(a1 + 32), "container", v16, v17, v18, v19, v20);
    id v15 = [v14 publicCloudDatabase];
    [v15 addOperation:v11];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(&v30, 8);
}

void __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Task %{public}@ was expired by DAS", (uint8_t *)&v4, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) log];
  os_log_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_17_cold_1((uint64_t)v8, (uint64_t)v9, v11);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "CloudKit successfully saved record: %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  }
}

void __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_19(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained error];

  int v4 = [*(id *)(a1 + 32) log];
  uint64_t v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = WeakRetained;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Operation completed successfully: %@", buf, 0xCu);
    }

    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
    }
    id v18 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      id v24 = v19;
      _os_log_impl(&dword_21FE04000, v18, OS_LOG_TYPE_DEFAULT, "Task %{public}@ completed", buf, 0xCu);
    }

    goto LABEL_25;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_19_cold_2(WeakRetained, v5);
  }

  uint64_t v6 = [WeakRetained error];
  id v7 = [v6 domain];
  if (([v7 isEqualToString:*MEMORY[0x263EFD498]] & 1) == 0)
  {

LABEL_23:
    uint64_t v20 = *(void *)(a1 + 56);
    if (v20)
    {
      id v21 = [WeakRetained error];
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);
    }
LABEL_25:
    [*(id *)(a1 + 48) setTaskCompleted];
    goto LABEL_26;
  }
  id v8 = [WeakRetained error];
  uint64_t v9 = [v8 code];

  if (v9 != 132) {
    goto LABEL_23;
  }
  id v10 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v11 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    id v24 = v11;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Expiring task %{public}@", buf, 0xCu);
  }

  uint64_t v12 = *(void **)(a1 + 48);
  id v22 = 0;
  char v13 = [v12 setTaskExpiredWithRetryAfter:&v22 error:0.0];
  id v14 = v22;
  if ((v13 & 1) == 0)
  {
    uint64_t v15 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_19_cold_1(a1, v15);
    }

    uint64_t v16 = *(void *)(a1 + 56);
    if (v16) {
      (*(void (**)(uint64_t, id))(v16 + 16))(v16, v14);
    }
    [*(id *)(a1 + 48) setTaskCompleted];
  }

LABEL_26:
}

- (DEDBugSession)bugSession
{
  return self->_bugSession;
}

- (void)setBugSession:(id)a3
{
}

- (DEDBugSessionConfiguration)bugSessionConfig
{
  return self->_bugSessionConfig;
}

- (void)setBugSessionConfig:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_bugSessionConfig, 0);
  objc_storeStrong((id *)&self->_bugSession, 0);
}

- (void)uploadRecords:(NSObject *)a3 taskIdentifier:totalUploadSize:perRecordProgressBlock:perRecordSaveBlock:completionBlock:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_9_0(&dword_21FE04000, a2, a3, "Failed to submit task %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_17_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_9_0(&dword_21FE04000, a2, a3, "CloudKit failed to save record: %@ with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_19_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Failed to expire task %{public}@", (uint8_t *)&v3, 0xCu);
}

void __124__DEDCloudKitClient_uploadRecords_taskIdentifier_totalUploadSize_perRecordProgressBlock_perRecordSaveBlock_completionBlock___block_invoke_19_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Operation failed with error: %@", (uint8_t *)&v4, 0xCu);
}

@end