@interface DRSCloudKitHelper
+ (id)helperForCKConfig:(id)a3;
+ (id)prodContainerHelper;
+ (id)sandboxContainerHelper;
- (BOOL)_handleRAPIDRequests:(id)a3 xpcActivity:(id)a4 errorsOut:(id)a5;
- (CKContainer)_targetContainer;
- (DRSCloudKitHelper)initWithContainerEnvironment:(int64_t)a3 rapidEnvironment:(int64_t)a4;
- (DRSCloudKitHelper)initWithEnvironment:(int64_t)a3;
- (DRSRapidCloudKitHelper)rapidHelper;
- (id)_requestsPassingUploadSizeCap:(id)a3 remainingQuota:(unint64_t)a4;
- (int64_t)environment;
- (int64_t)rapidEnvironment;
- (void)_configureOperation:(id)a3 container:(id)a4 xpcActivity:(id)a5;
- (void)_sendDecisionServerRequests:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5;
- (void)_uploadRecords:(id)a3 containerName:(id)a4 xpcActivity:(id)a5 completionHandler:(id)a6;
- (void)reportTerminalRequestStats:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5;
- (void)set_targetContainer:(id)a3;
- (void)shouldEnableDataGathering:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5;
- (void)shouldUploadRequests:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5;
- (void)uploadRequests:(id)a3 contactDecisionServer:(BOOL)a4 xpcActivity:(id)a5 remainingUploadQuota:(unint64_t)a6 backingPersistentContainer:(id)a7 completionHandler:(id)a8;
@end

@implementation DRSCloudKitHelper

+ (id)helperForCKConfig:(id)a3
{
  id v3 = a3;
  v4 = [DRSCloudKitHelper alloc];
  uint64_t v5 = [v3 ckContainerEnvironment];
  uint64_t v6 = [v3 ckRapidEnvironment];

  v7 = [(DRSCloudKitHelper *)v4 initWithContainerEnvironment:v5 rapidEnvironment:v6];

  return v7;
}

- (DRSCloudKitHelper)initWithEnvironment:(int64_t)a3
{
  return [(DRSCloudKitHelper *)self initWithContainerEnvironment:a3 rapidEnvironment:a3];
}

- (DRSCloudKitHelper)initWithContainerEnvironment:(int64_t)a3 rapidEnvironment:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)DRSCloudKitHelper;
  uint64_t v6 = [(DRSCloudKitHelper *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_environment = a3;
    v6->_rapidEnvironment = a4;
    if ([(DRSCloudKitHelper *)v6 environment] == 1) {
      DRSProductionContainer();
    }
    else {
    uint64_t v8 = DRSSandboxContainer();
    }
    targetContainer = v7->__targetContainer;
    v7->__targetContainer = (CKContainer *)v8;

    if ([(DRSCloudKitHelper *)v7 rapidEnvironment] == 1) {
      +[DRSRapidCloudKitHelper prodHelper];
    }
    else {
    uint64_t v10 = +[DRSRapidCloudKitHelper devHelper];
    }
    rapidHelper = v7->_rapidHelper;
    v7->_rapidHelper = (DRSRapidCloudKitHelper *)v10;
  }
  return v7;
}

+ (id)sandboxContainerHelper
{
  if (sandboxContainerHelper_onceToken != -1) {
    dispatch_once(&sandboxContainerHelper_onceToken, &__block_literal_global_214);
  }
  v2 = (void *)sandboxContainerHelper_helper;

  return v2;
}

void __43__DRSCloudKitHelper_sandboxContainerHelper__block_invoke()
{
  v0 = [[DRSCloudKitHelper alloc] initWithEnvironment:2];
  v1 = (void *)sandboxContainerHelper_helper;
  sandboxContainerHelper_helper = (uint64_t)v0;
}

+ (id)prodContainerHelper
{
  if (prodContainerHelper_onceToken != -1) {
    dispatch_once(&prodContainerHelper_onceToken, &__block_literal_global_216);
  }
  v2 = (void *)prodContainerHelper_helper;

  return v2;
}

void __40__DRSCloudKitHelper_prodContainerHelper__block_invoke()
{
  v0 = [[DRSCloudKitHelper alloc] initWithEnvironment:1];
  v1 = (void *)prodContainerHelper_helper;
  prodContainerHelper_helper = (uint64_t)v0;
}

- (void)_configureOperation:(id)a3 container:(id)a4 xpcActivity:(id)a5
{
}

- (void)_uploadRecords:(id)a3 containerName:(id)a4 xpcActivity:(id)a5 completionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  v12 = (objc_class *)MEMORY[0x263EFD748];
  id v13 = a5;
  id v14 = a3;
  v15 = (void *)[[v12 alloc] initWithRecordsToSave:v14 recordIDsToDelete:0];

  if ([v10 isEqualToString:kDRSCloudKitContainerName])
  {
    v16 = [(DRSCloudKitHelper *)self _targetContainer];
  }
  else
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFD620]), "initWithContainerIdentifier:environment:", v10, -[DRSCloudKitHelper environment](self, "environment"));
    v16 = (void *)[objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v17];
  }
  [(DRSCloudKitHelper *)self _configureOperation:v15 container:v16 xpcActivity:v13];

  v18 = [v15 operationID];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __80__DRSCloudKitHelper__uploadRecords_containerName_xpcActivity_completionHandler___block_invoke;
  v29 = &unk_263FC9A30;
  id v19 = v18;
  id v30 = v19;
  id v31 = v11;
  id v20 = v11;
  v21 = _Block_copy(&v26);
  objc_msgSend(v15, "setModifyRecordsCompletionBlock:", v21, v26, v27, v28, v29);
  v22 = DPLogHandle_CKRecordUpload();
  uint64_t v23 = [v19 hash];
  if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 138543618;
      id v33 = v19;
      __int16 v34 = 2114;
      id v35 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "CKRecordUpload", "Upload operation ID: %{public}@, target container: %{public}@", buf, 0x16u);
    }
  }

  v25 = [v16 publicCloudDatabase];
  [v25 addOperation:v15];
}

void __80__DRSCloudKitHelper__uploadRecords_containerName_xpcActivity_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a2;
  uint64_t v8 = DPLogHandle_CKRecordUpload();
  uint64_t v9 = [*(id *)(a1 + 32) hash];
  os_signpost_id_t v10 = v9;
  if (v6)
  {
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v11 = [v6 localizedDescription];
      int v12 = 138412290;
      id v13 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_INTERVAL_END, v10, "CKRecordUpload", "Failed due to error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_INTERVAL_END, v10, "CKRecordUpload", "Completed successfully", (uint8_t *)&v12, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_handleRAPIDRequests:(id)a3 xpcActivity:(id)a4 errorsOut:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (_xpc_activity_s *)a4;
  id v22 = a5;
  os_signpost_id_t v10 = DPLogHandle_CKCFUpload();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v31 = objc_msgSend(v8, "count", v22);
    _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsUploadSession", "Beginning upload session of %{public}llu requests", buf, 0xCu);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (v9 && xpc_activity_should_defer(v9))
        {
          id v20 = DPLogHandle_CKCFUpload();
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsUploadSession", "Ending upload session due to deferral request", buf, 2u);
          }

          BOOL v19 = 0;
          v18 = v11;
          goto LABEL_18;
        }
        v17 = [(DRSCloudKitHelper *)self rapidHelper];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __64__DRSCloudKitHelper__handleRAPIDRequests_xpcActivity_errorsOut___block_invoke;
        v23[3] = &unk_263FC9A58;
        id v24 = v22;
        [v17 submitRapidPayload:v16 replyHandler:v23];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v18 = DPLogHandle_CKCFUpload();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsUploadSession", "Successful!", buf, 2u);
  }
  BOOL v19 = 1;
LABEL_18:

  return v19;
}

uint64_t __64__DRSCloudKitHelper__handleRAPIDRequests_xpcActivity_errorsOut___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    return [*(id *)(result + 32) addObject:a4];
  }
  return result;
}

- (id)_requestsPassingUploadSizeCap:(id)a3 remainingQuota:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[a3 mutableCopy];
  [v5 sortUsingComparator:&__block_literal_global_224];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138543874;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unint64_t v14 = objc_msgSend(v13, "totalLogSizeBytes", v20, (void)v21);
        if (v14)
        {
          unint64_t v15 = v14;
          unint64_t v16 = a4 - v14;
          if (a4 >= v14)
          {
            [v6 addObject:v13];
            a4 = v16;
          }
          else
          {
            v17 = DPLogHandle_CKRecordUpload();
            if (os_signpost_enabled(v17))
            {
              v18 = [v13 requestID];
              *(_DWORD *)buf = v20;
              long long v26 = v18;
              __int16 v27 = 2048;
              unint64_t v28 = v15;
              __int16 v29 = 2048;
              unint64_t v30 = a4;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadSkippedDueToSizeLimits", "Skipping upload of request %{public}@ due to upload size limits: %zu (size B) > %llu (remaining quota B)", buf, 0x20u);
            }
          }
        }
        else
        {
          [v13 makeTerminalDueToMissingLog];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v10);
  }

  return v6;
}

uint64_t __66__DRSCloudKitHelper__requestsPassingUploadSizeCap_remainingQuota___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 requestDate];
  id v6 = [v4 requestDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)uploadRequests:(id)a3 contactDecisionServer:(BOOL)a4 xpcActivity:(id)a5 remainingUploadQuota:(unint64_t)a6 backingPersistentContainer:(id)a7 completionHandler:(id)a8
{
  BOOL v40 = a4;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v42 = a5;
  id v44 = a7;
  id v41 = a8;
  uint64_t v13 = +[DRSSystemProfile sharedInstance];
  char v14 = [v13 isLogUploadEnabled];

  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v70 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        if ([v20 requestState] == 1)
        {
          if ([v20 hasUploadableContent])
          {
            if (v14) {
              [v15 addObject:v20];
            }
            else {
              [v20 updateToState:4103 errorDescription:0 errorOut:0];
            }
          }
          else
          {
            [v20 makeTerminalDueToMissingLog];
          }
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v76 count:16];
    }
    while (v17);
  }

  long long v21 = [(DRSCloudKitHelper *)self _requestsPassingUploadSizeCap:v15 remainingQuota:a6];
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v23 = v21;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v66 != v25) {
          objc_enumerationMutation(v23);
        }
        __int16 v27 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        if ([v27 uploadStarted]) {
          [v22 addObject:v27];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v24);
  }

  if (v44)
  {
    unint64_t v28 = (void *)[v44 newBackgroundContext];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__0;
    v63 = __Block_byref_object_dispose__0;
    id v64 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    char v58 = 0;
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke;
    v52[3] = &unk_263FC9AA0;
    id v29 = v23;
    id v53 = v29;
    id v30 = v28;
    id v54 = v30;
    v55 = v57;
    v56 = &v59;
    [v30 performBlockAndWait:v52];
    if (v60[5])
    {
      uint64_t v31 = DPLogHandle_CKRecordUpload();
      if (os_signpost_enabled(v31))
      {
        uint64_t v32 = [(id)v60[5] localizedDescription];
        id v33 = (void *)v32;
        __int16 v34 = @"Unknown";
        if (v32) {
          __int16 v34 = (__CFString *)v32;
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v74 = (uint64_t)v34;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PreDPDSAndUploadSaveFailed", "Failed to save records prior to DPDS submission due to error: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v31 = DPLogHandle_CKRecordUpload();
      if (os_signpost_enabled(v31))
      {
        uint64_t v35 = [v29 count];
        *(_DWORD *)buf = 134349056;
        uint64_t v74 = v35;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PreDPDSAndUploadSaveSuccess", "Successfully saved updated state for %{public}llu requests that will be passed along to the DPDPS", buf, 0xCu);
      }
    }

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(&v59, 8);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_228;
  aBlock[3] = &unk_263FC9B18;
  id v36 = v41;
  id v51 = v36;
  aBlock[4] = self;
  id v37 = v42;
  id v50 = v37;
  v38 = _Block_copy(aBlock);
  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v40)
  {
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_238;
    v45[3] = &unk_263FC9B40;
    id v46 = v22;
    id v47 = v39;
    id v48 = v38;
    [(DRSCloudKitHelper *)self shouldUploadRequests:v46 xpcActivity:v37 replyHandler:v45];
  }
  else
  {
    (*((void (**)(void *, id, void))v38 + 2))(v38, v22, 0);
  }
}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v6++), "updateContextWithRequest_ON_MOC_QUEUE:", *(void *)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v8 + 40);
  char v9 = [v7 save:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_228(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!a3)
  {
    uint64_t v55 = a1;
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v52 = [MEMORY[0x263EFF980] array];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v50 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v66 objects:v75 count:16];
    id v51 = v6;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v67 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          long long v13 = [v12 targetContainerName];

          if (v13)
          {
            long long v14 = [v12 recordRepresentation];
            if (v14)
            {
              id v15 = [v12 targetContainerName];
              uint64_t v16 = [v6 objectForKeyedSubscript:v15];

              if (!v16)
              {
                uint64_t v16 = [MEMORY[0x263EFF980] array];
                uint64_t v17 = [v12 targetContainerName];
                [v6 setObject:v16 forKeyedSubscript:v17];
              }
              [v16 addObject:v14];
              uint64_t v18 = [v14 recordID];
              [v56 setObject:v12 forKeyedSubscript:v18];

              BOOL v19 = DPLogHandle_CKRecord();
              if (os_signpost_enabled(v19))
              {
                long long v20 = [v14 recordID];
                long long v21 = [v20 recordName];
                id v22 = [v12 debugDescription];
                *(_DWORD *)buf = 138543618;
                uint64_t v72 = (uint64_t)v21;
                __int16 v73 = 2112;
                uint64_t v74 = v22;
                _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKRecordGenerated", "Generated CK record with name %{public}@ for request %@", buf, 0x16u);

                uint64_t v6 = v51;
              }
            }
            else
            {
              id v23 = DPLogHandle_CKRecordError();
              if (os_signpost_enabled(v23))
              {
                uint64_t v24 = [v12 debugDescription];
                *(_DWORD *)buf = 138543362;
                uint64_t v72 = (uint64_t)v24;
                _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CouldNotCreateCKRecord", "Failed to generate CKRecord for request %{public}@", buf, 0xCu);
              }
              [v12 updateToState:4355 errorDescription:@"Could not create CKRecord for request" errorOut:0];
            }
          }
          else
          {
            [v52 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v9);
    }

    uint64_t v25 = [MEMORY[0x263EFF980] array];
    long long v26 = v52;
    if ([v52 count])
    {
      uint64_t v27 = v55;
      char v28 = [*(id *)(v55 + 32) _handleRAPIDRequests:v52 xpcActivity:*(void *)(v55 + 40) errorsOut:v25];
      if ([v25 count])
      {
        if ((v28 & 1) == 0) {
          goto LABEL_48;
        }
      }
      else
      {

        uint64_t v25 = 0;
        if ((v28 & 1) == 0)
        {
LABEL_48:
          (*(void (**)(void))(*(void *)(v55 + 48) + 16))();
          id v48 = DPLogHandle_CKRecordUpload();
          id v5 = v50;
          if (os_signpost_enabled(v48))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKCFUploadDeferred", (const char *)&unk_209EEADD1, buf, 2u);
          }

LABEL_52:
          goto LABEL_53;
        }
      }
    }
    else
    {
      uint64_t v27 = v55;
    }
    if (![v25 count])
    {

      uint64_t v25 = 0;
    }
    id v5 = v50;
    if ([v6 count])
    {
      v49 = v25;
      id v54 = [MEMORY[0x263EFF980] array];
      dispatch_semaphore_t v53 = dispatch_semaphore_create(0);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v29 = v6;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v63 != v32) {
              objc_enumerationMutation(v29);
            }
            __int16 v34 = *(void **)(*((void *)&v62 + 1) + 8 * j);
            uint64_t v35 = [v29 objectForKeyedSubscript:v34];
            id v36 = DPLogHandle_CKRecordUpload();
            uint64_t v37 = [v34 hash];
            if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v38 = v37;
              if (os_signpost_enabled(v36))
              {
                uint64_t v39 = [v35 count];
                *(_DWORD *)buf = 134218242;
                uint64_t v72 = v39;
                __int16 v73 = 2114;
                uint64_t v74 = v34;
                _os_signpost_emit_with_name_impl(&dword_209E70000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v38, "PerContainerUploadSession", "Starting upload session for %lu requests for container %{public}@", buf, 0x16u);
              }
            }

            BOOL v40 = *(void **)(v55 + 32);
            uint64_t v41 = *(void *)(v55 + 40);
            v57[0] = MEMORY[0x263EF8330];
            v57[1] = 3221225472;
            v57[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_233;
            void v57[3] = &unk_263FC9AF0;
            id v58 = v56;
            id v42 = v53;
            uint64_t v59 = v42;
            id v43 = v35;
            id v60 = v43;
            id v61 = v54;
            [v40 _uploadRecords:v43 containerName:v34 xpcActivity:v41 completionHandler:v57];
            dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
            id v44 = DPLogHandle_CKRecordUpload();
            uint64_t v45 = [v34 hash];
            if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v46 = v45;
              if (os_signpost_enabled(v44))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_209E70000, v44, OS_SIGNPOST_INTERVAL_END, v46, "PerContainerUploadSession", (const char *)&unk_209EEADD1, buf, 2u);
              }
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v62 objects:v70 count:16];
        }
        while (v31);
      }

      if ([v54 count]) {
        id v47 = v54;
      }
      else {
        id v47 = 0;
      }
      uint64_t v25 = v49;
      (*(void (**)(void, void, void *, void *))(*(void *)(v55 + 48) + 16))(*(void *)(v55 + 48), 0, v49, v47);

      id v5 = v50;
      uint64_t v6 = v51;
      long long v26 = v52;
    }
    else
    {
      (*(void (**)(void))(*(void *)(v27 + 48) + 16))();
    }
    goto LABEL_52;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_53:
}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v12 = *(void **)(a1 + 32);
        long long v13 = [v11 recordID];
        long long v14 = [v12 objectForKeyedSubscript:v13];
        id v15 = [v11 recordID];
        uint64_t v16 = [v15 recordName];
        [v14 uploadCompleteWithError:0 ckRecordID:v16];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v8);
  }
  if (!v6) {
    goto LABEL_20;
  }
  if ([v6 code] != 2)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v19 = *(id *)(a1 + 48);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(a1 + 32);
          uint64_t v25 = [*(id *)(*((void *)&v44 + 1) + 8 * j) recordID];
          long long v26 = [v24 objectForKeyedSubscript:v25];
          [v26 uploadCompleteWithError:v6 ckRecordID:0];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v21);
    }

    [*(id *)(a1 + 56) addObject:v6];
LABEL_20:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    goto LABEL_32;
  }
  uint64_t v17 = [v6 userInfo];
  uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];

  if (v18)
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_234;
    v36[3] = &unk_263FC9AC8;
    id v37 = *(id *)(a1 + 32);
    id v38 = *(id *)(a1 + 56);
    [v18 enumerateKeysAndObjectsUsingBlock:v36];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    uint64_t v27 = DPLogHandle_CKRecordError();
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingPartialErrorInfo", "Upload encountered partial error, but no partial error dict was provided", buf, 2u);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v28 = *(id *)(a1 + 48);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(a1 + 32);
          __int16 v34 = [*(id *)(*((void *)&v39 + 1) + 8 * k) recordID];
          uint64_t v35 = [v33 objectForKeyedSubscript:v34];
          [v35 uploadCompleteWithError:v6 ckRecordID:0];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v30);
    }

    [*(id *)(a1 + 56) addObject:v6];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

LABEL_32:
}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_234(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 uploadCompleteWithError:v5 ckRecordID:0];
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    uint64_t v8 = DPLogHandle_CKRecordError();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingRequestForError", "Could not find request that was reported to have errored", v9, 2u);
    }
  }
}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_238(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = DPLogHandle_CKInvernessError();
    if (os_signpost_enabled(v7))
    {
      uint64_t v8 = [v6 localizedDescription];
      uint64_t v9 = (void *)v8;
      uint64_t v10 = @"Unknown";
      if (v8) {
        uint64_t v10 = (__CFString *)v8;
      }
      *(_DWORD *)buf = 138543362;
      id v36 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvernessDecisionServerError", "Encountered decision server error: %{public}@", buf, 0xCu);
    }
  }
  id v28 = v6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    id v15 = @"Missing reply";
    id v29 = v11;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v17, "decisionServerDecision", v28) == 2)
        {
          [*(id *)(a1 + 40) addObject:v17];
        }
        else
        {
          uint64_t v18 = [v17 requestID];
          id v19 = [v5 objectForKeyedSubscript:v18];

          if (v19)
          {
            if ([v19 requestAccepted])
            {
              [v17 setDecisionServerDecision:2];
              [*(id *)(a1 + 40) addObject:v17];
            }
            else
            {
              uint64_t v25 = [v19 rejectionReason];
              long long v26 = (void *)v25;
              if (v25) {
                uint64_t v27 = (__CFString *)v25;
              }
              else {
                uint64_t v27 = @"Unknown";
              }
              [v17 uploadDeniedByDecisionServerWithReason:v27];

              [v17 setDecisionServerDecision:1];
            }
          }
          else
          {
            uint64_t v20 = DPLogHandle_CKInvernessError();
            if (os_signpost_enabled(v20))
            {
              [v17 debugDescription];
              uint64_t v21 = a1;
              id v22 = v5;
              id v23 = v15;
              uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              id v36 = v24;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingReply", "Missing reply from DS for %{public}@", buf, 0xCu);

              id v15 = v23;
              id v5 = v22;
              a1 = v21;
              id v11 = v29;
            }

            [v17 uploadDeniedByDecisionServerWithReason:v15];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)shouldUploadRequests:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (!objc_msgSend(v17, "decisionServerDecision", (void)v18)) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  [(DRSCloudKitHelper *)self _sendDecisionServerRequests:v11 xpcActivity:v9 replyHandler:v10];
}

- (void)shouldEnableDataGathering:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v18 submitQuery]) {
          long long v19 = v12;
        }
        else {
          long long v19 = v11;
        }
        [v19 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __72__DRSCloudKitHelper_shouldEnableDataGathering_xpcActivity_replyHandler___block_invoke;
  long long v26 = &unk_263FC9B68;
  id v27 = v11;
  id v28 = v10;
  id v20 = v10;
  id v21 = v11;
  id v22 = _Block_copy(&v23);
  -[DRSCloudKitHelper _sendDecisionServerRequests:xpcActivity:replyHandler:](self, "_sendDecisionServerRequests:xpcActivity:replyHandler:", v12, v9, v22, v23, v24, v25, v26);
}

void __72__DRSCloudKitHelper_shouldEnableDataGathering_xpcActivity_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [v5 allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v13 = [v12 request];
        [v13 queryFinishedWithDecision:v12 error:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v22 = a1;
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        id v20 = [[DRSDecisionServerRequestReply alloc] initWithOriginalRequest:v19 requestAccepted:0 rejectionReason:@"Invalid query state"];
        id v21 = [v19 queryID];
        [v5 setObject:v20 forKeyedSubscript:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  (*(void (**)(void))(*(void *)(v22 + 40) + 16))();
}

- (void)_sendDecisionServerRequests:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    long long v66 = (void (**)(void, void, void))v10;
    id v67 = v9;
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v12 = +[DRSSystemProfile sharedInstance];
    char v13 = [v12 isLogUploadEnabled];

    if (v13)
    {
      long long v63 = self;
      id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v65 = v8;
      id v15 = v8;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v79 objects:v94 count:16];
      long long v68 = v14;
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v80;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v80 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            id v21 = objc_msgSend(v20, "pbRequest", v63);
            if (v21)
            {
              [v69 addObject:v21];
              [v14 addObject:v20];
            }
            else
            {
              uint64_t v22 = [[DRSDecisionServerRequestReply alloc] initWithOriginalRequest:v20 requestAccepted:0 rejectionReason:@"Invalid upload request"];
              long long v23 = [v20 uniqueID];
              [v11 setObject:v22 forKeyedSubscript:v23];

              id v14 = v68;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v79 objects:v94 count:16];
        }
        while (v17);
      }

      uint64_t v24 = [v11 count];
      if (v24 == [v15 count])
      {
        long long v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v92 = *MEMORY[0x263F08320];
        v93 = @"Could not create any valid upload requests";
        long long v26 = [NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        long long v27 = [v25 errorWithDomain:@"DiagnosticPipelineInvernessError" code:0 userInfo:v26];

        id v10 = v66;
        ((void (**)(void, id, void *))v66)[2](v66, v11, v27);
        id v9 = v67;
      }
      else
      {
        id v37 = objc_alloc(MEMORY[0x263EFD600]);
        id v38 = kDRSCloudKitDecisionServerName;
        long long v39 = [v68 firstObject];
        long long v40 = [v39 functionName];
        long long v41 = [v68 firstObject];
        long long v27 = objc_msgSend(v37, "initWithServiceName:functionName:responseClass:", v38, v40, objc_msgSend(v41, "pbBatchResponseClass"));

        if (v27)
        {
          long long v42 = [(DRSCloudKitHelper *)v63 _targetContainer];
          id v9 = v67;
          [(DRSCloudKitHelper *)v63 _configureOperation:v27 container:v42 xpcActivity:v67];

          id v43 = [v68 firstObject];
          long long v44 = [v43 pbBatchInstance];

          long long v45 = DRSDeviceMetadata();
          [v44 setClientMetadata:v45];

          [v44 setRequests:v69];
          [v27 setRequest:v44];
          v70[0] = MEMORY[0x263EF8330];
          v70[1] = 3221225472;
          v70[2] = __74__DRSCloudKitHelper__sendDecisionServerRequests_xpcActivity_replyHandler___block_invoke;
          v70[3] = &unk_263FC9B90;
          id v71 = v68;
          id v72 = v11;
          id v73 = v15;
          id v10 = v66;
          uint64_t v74 = v66;
          [v27 setCodeOperationCompletionBlock:v70];
          long long v46 = [(DRSCloudKitHelper *)v63 _targetContainer];
          long long v47 = [v46 publicCloudDatabase];
          [v47 addOperation:v27];
        }
        else
        {
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v48 = v68;
          uint64_t v49 = [v48 countByEnumeratingWithState:&v75 objects:v91 count:16];
          if (v49)
          {
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v76;
            do
            {
              for (uint64_t j = 0; j != v50; ++j)
              {
                if (*(void *)v76 != v51) {
                  objc_enumerationMutation(v48);
                }
                dispatch_semaphore_t v53 = *(void **)(*((void *)&v75 + 1) + 8 * j);
                id v54 = [[DRSDecisionServerRequestReply alloc] initWithOriginalRequest:v53 requestAccepted:0 rejectionReason:@"Could not create upload request operation"];
                uint64_t v55 = [v53 uniqueID];
                [v11 setObject:v54 forKeyedSubscript:v55];
              }
              uint64_t v50 = [v48 countByEnumeratingWithState:&v75 objects:v91 count:16];
            }
            while (v50);
          }

          uint64_t v56 = [v11 count];
          uint64_t v57 = [v15 count];
          id v58 = (void *)MEMORY[0x263F087E8];
          if (v56 == v57)
          {
            uint64_t v87 = *MEMORY[0x263F08320];
            v88 = @"Failed to create CKCodeOperation instance to query DS";
            uint64_t v59 = NSDictionary;
            id v60 = &v88;
            id v61 = &v87;
          }
          else
          {
            uint64_t v89 = *MEMORY[0x263F08320];
            v90 = @"Didn't have a error reply for every request after failing to create upload request operation";
            uint64_t v59 = NSDictionary;
            id v60 = &v90;
            id v61 = &v89;
          }
          long long v62 = objc_msgSend(v59, "dictionaryWithObjects:forKeys:count:", v60, v61, 1, 0);
          id v9 = v67;
          long long v27 = v64;
          long long v44 = [v58 errorWithDomain:@"DiagnosticPipelineInvernessError" code:0 userInfo:v62];

          id v10 = v66;
          ((void (**)(void, id, void *))v66)[2](v66, v11, v44);
        }
      }
      id v8 = v65;
    }
    else
    {
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v29 = v8;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v83 objects:v95 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v84;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v84 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void **)(*((void *)&v83 + 1) + 8 * k);
            uint64_t v35 = [[DRSDecisionServerRequestReply alloc] initWithOriginalRequest:v34 requestAccepted:0 rejectionReason:@"Log upload is disabled"];
            id v36 = [v34 uniqueID];
            [v11 setObject:v35 forKeyedSubscript:v36];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v83 objects:v95 count:16];
        }
        while (v31);
      }

      id v10 = v66;
      ((void (**)(void, id, void))v66)[2](v66, v11, 0);
    }
  }
  else
  {
    id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    (*((void (**)(id, id, void))v10 + 2))(v10, v28, 0);
  }
}

void __74__DRSCloudKitHelper__sendDecisionServerRequests_xpcActivity_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v7;
  uint64_t v9 = a1;
  if (!v6)
  {
    long long v26 = [v7 decisionResults];
    uint64_t v27 = [v26 count];
    uint64_t v28 = [*(id *)(a1 + 32) count];

    if (v27 == v28)
    {
      if ([*(id *)(a1 + 32) count])
      {
        unint64_t v29 = 0;
        do
        {
          uint64_t v30 = [DRSDecisionServerRequestReply alloc];
          uint64_t v31 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v29];
          uint64_t v32 = [v8 decisionResults];
          uint64_t v33 = [v32 objectAtIndexedSubscript:v29];
          uint64_t v34 = [(DRSDecisionServerRequestReply *)v30 initWithOriginalRequest:v31 reply:v33];

          uint64_t v35 = *(void **)(a1 + 40);
          id v36 = [(DRSDecisionServerRequestReply *)v34 request];
          id v37 = [v36 uniqueID];
          [v35 setObject:v34 forKeyedSubscript:v37];

          ++v29;
        }
        while (v29 < [*(id *)(a1 + 32) count]);
      }
      uint64_t v38 = [*(id *)(a1 + 40) count];
      if (v38 == [*(id *)(a1 + 48) count]) {
        goto LABEL_33;
      }
      long long v39 = DPLogHandle_CKInvernessError();
      if (!os_signpost_enabled(v39))
      {
LABEL_32:

LABEL_33:
        long long v25 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      long long v40 = "Didn't have reply for every request on successful reply";
    }
    else
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obja = *(id *)(a1 + 32);
      uint64_t v41 = [obja countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v55 != v43) {
              objc_enumerationMutation(obja);
            }
            long long v45 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            long long v46 = [[DRSDecisionServerRequestReply alloc] initWithOriginalRequest:v45 requestAccepted:0 rejectionReason:@"Reply from decision server did not properly map to request array"];
            long long v47 = *(void **)(v9 + 40);
            id v48 = [v45 uniqueID];
            uint64_t v49 = v47;
            a1 = v9;
            [v49 setObject:v46 forKeyedSubscript:v48];
          }
          uint64_t v42 = [obja countByEnumeratingWithState:&v54 objects:v63 count:16];
        }
        while (v42);
      }

      uint64_t v50 = [*(id *)(a1 + 40) count];
      if (v50 == [*(id *)(a1 + 48) count]) {
        goto LABEL_33;
      }
      long long v39 = DPLogHandle_CKInvernessError();
      if (!os_signpost_enabled(v39)) {
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      long long v40 = "Didn't have reply for every request when confusing answer from DS received";
    }
    _os_signpost_emit_with_name_impl(&dword_209E70000, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InconsistentReplyCount", v40, buf, 2u);
    goto LABEL_32;
  }
  id v51 = v7;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v10 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v60 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        id v15 = [DRSDecisionServerRequestReply alloc];
        id v16 = [NSString alloc];
        [v6 localizedDescription];
        v18 = id v17 = v6;
        long long v19 = (void *)[v16 initWithFormat:@"CKOperationError: %@", v18];
        id v20 = [(DRSDecisionServerRequestReply *)v15 initWithOriginalRequest:v14 requestAccepted:0 rejectionReason:v19];
        id v21 = *(void **)(v9 + 40);
        uint64_t v22 = [v14 uniqueID];
        [v21 setObject:v20 forKeyedSubscript:v22];

        id v6 = v17;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v11);
  }

  uint64_t v23 = [*(id *)(v9 + 40) count];
  id v8 = v51;
  if (v23 != [*(id *)(v9 + 48) count])
  {
    uint64_t v24 = DPLogHandle_CKInvernessError();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InconsistentReplyCount", "Didn't have reply for every request when CKOperation error encountered", buf, 2u);
    }
  }
  long long v25 = *(void (**)(void))(*(void *)(v9 + 56) + 16);
LABEL_34:
  v25();
}

- (void)reportTerminalRequestStats:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v11 = +[DRSRequestAllStats statsForRequests:v8];
    uint64_t v12 = [v11 generateCoreAnalyticsEvents:1];
    char v13 = DPLogHandle_Telemetry();
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v30 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStatsBatchCoreAnalyticsEvents", "Reported %{public}llu CA events", buf, 0xCu);
    }

    id v14 = +[DRSSystemProfile sharedInstance];
    int v15 = [v14 isInternal];

    if (v15)
    {
      id v16 = [v11 terminalRequestProtobufRepresentation];
      if (v16)
      {
        id v17 = objc_alloc(MEMORY[0x263EFD600]);
        uint64_t v18 = (void *)[v17 initWithServiceName:kDRSCloudKitDecisionServerName functionName:@"reportDiagnosticRequestStatsBatch" responseClass:objc_opt_class()];
        long long v19 = [(DRSCloudKitHelper *)self _targetContainer];
        [(DRSCloudKitHelper *)self _configureOperation:v18 container:v19 xpcActivity:v9];

        [v18 setRequest:v16];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __73__DRSCloudKitHelper_reportTerminalRequestStats_xpcActivity_replyHandler___block_invoke;
        v25[3] = &unk_263FC9BB8;
        id v26 = v10;
        [v18 setCodeOperationCompletionBlock:v25];
        id v20 = [(DRSCloudKitHelper *)self _targetContainer];
        id v21 = [v20 publicCloudDatabase];
        [v21 addOperation:v18];
      }
      else
      {
        uint64_t v22 = DPLogHandle_CKInvernessError();
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStatsBatchProtobufError", "Could not create stats batch protobuf object", buf, 2u);
        }

        uint64_t v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08320];
        uint64_t v28 = @"Failed to create protobuf object to report stats to DecisionServer";
        uint64_t v24 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        uint64_t v18 = [v23 errorWithDomain:@"DiagnosticPipelineRequestStatsBatchError" code:0 userInfo:v24];

        (*((void (**)(id, void *))v10 + 2))(v10, v18);
      }
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __73__DRSCloudKitHelper_reportTerminalRequestStats_xpcActivity_replyHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = DPLogHandle_CKInvernessError();
    if (os_signpost_enabled(v5))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStatsBatchError", "Inverness error for 'reportDiagnosticRequestStatsBatch': %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)environment
{
  return self->_environment;
}

- (int64_t)rapidEnvironment
{
  return self->_rapidEnvironment;
}

- (CKContainer)_targetContainer
{
  return self->__targetContainer;
}

- (void)set_targetContainer:(id)a3
{
}

- (DRSRapidCloudKitHelper)rapidHelper
{
  return self->_rapidHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapidHelper, 0);

  objc_storeStrong((id *)&self->__targetContainer, 0);
}

@end