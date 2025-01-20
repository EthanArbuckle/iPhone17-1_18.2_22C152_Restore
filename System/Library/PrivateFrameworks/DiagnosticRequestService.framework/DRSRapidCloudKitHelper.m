@interface DRSRapidCloudKitHelper
+ (id)devHelper;
+ (id)prodHelper;
- (DiagnosticPipelineRapidServiceFunctionsClientObjc)objcClient;
- (id)_initWithEnvironment:(int64_t)a3;
- (void)submitRapidPayload:(id)a3 replyHandler:(id)a4;
@end

@implementation DRSRapidCloudKitHelper

- (id)_initWithEnvironment:(int64_t)a3
{
  if (a3 == 3)
  {
    v4 = 0;
  }
  else
  {
    v5 = [[DiagnosticPipelineRapidServiceFunctionsClientObjc alloc] initWithEnvironment:a3];
    if (v5)
    {
      v9.receiver = self;
      v9.super_class = (Class)DRSRapidCloudKitHelper;
      v6 = [(DRSRapidCloudKitHelper *)&v9 init];
      v7 = v6;
      if (v6) {
        objc_storeStrong((id *)&v6->_objcClient, v5);
      }
      self = v7;
      v4 = self;
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

+ (id)devHelper
{
  if (devHelper_onceToken != -1) {
    dispatch_once(&devHelper_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)devHelper_devHelper;

  return v2;
}

void __35__DRSRapidCloudKitHelper_devHelper__block_invoke()
{
  id v0 = [[DRSRapidCloudKitHelper alloc] _initWithEnvironment:1];
  v1 = (void *)devHelper_devHelper;
  devHelper_devHelper = (uint64_t)v0;
}

+ (id)prodHelper
{
  if (prodHelper_onceToken != -1) {
    dispatch_once(&prodHelper_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)prodHelper_prodHelper;

  return v2;
}

void __36__DRSRapidCloudKitHelper_prodHelper__block_invoke()
{
  id v0 = [[DRSRapidCloudKitHelper alloc] _initWithEnvironment:2];
  v1 = (void *)prodHelper_prodHelper;
  prodHelper_prodHelper = (uint64_t)v0;
}

- (void)submitRapidPayload:(id)a3 replyHandler:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = DPLogHandle_CKCFUpload();
  if (os_signpost_enabled(v8))
  {
    objc_super v9 = [v6 description];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Upload for %{public}@", (uint8_t *)&buf, 0xCu);
  }
  if ([v6 requestState] == 1)
  {
    if (([v6 uploadStarted] & 1) == 0) {
      v10 = {;
    }
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v10);

      v11 = DPLogHandle_CKCFUpload();
      if (os_signpost_enabled(v11))
      {
        LOWORD(buf) = 0;
LABEL_18:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", v12, (uint8_t *)&buf, 2u);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
  }
  else if ([v6 requestState] != 2)
  {
    v34 = NSString;
    v35 = [v6 requestStateString];
    v11 = [v34 stringWithFormat:@"Unexpected request state: %@", v35];

    v36 = DRSRapidErrorWithDescription(v11);
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v36);

    v37 = DPLogHandle_CKCFUpload();
    if (os_signpost_enabled(v37))
    {
      v38 = [v6 requestStateString];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v38;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Request in unexpected state: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    if (![v6 requestOutcome]) {
      [v6 updateToState:4355 errorDescription:@"Attempted to upload while in unexpected state" errorOut:0];
    }
    goto LABEL_25;
  }
  if ([v6 hasUploadableContent])
  {
    v13 = (void *)MEMORY[0x263EFF8F8];
    v14 = [v6 logs];
    v15 = [v14 firstObject];
    v16 = [v15 path];
    v11 = [v13 dataWithContentsOfFile:v16];

    if (v11)
    {
      v17 = [v6 logs];
      v18 = [v17 firstObject];
      v19 = [v18 name];

      if (v19)
      {
        v20 = +[DRSSystemProfile sharedInstance];
        v21 = [v6 requestDate];
        [v21 timeIntervalSince1970];
        double v23 = v22;

        dispatch_queue_t v47 = dispatch_queue_create("DRSRapidCloudKitHelper sync queue", 0);
        dispatch_semaphore_t v49 = dispatch_semaphore_create(0);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v73 = 0x2020000000;
        char v74 = 0;
        v70[0] = 0;
        v70[1] = v70;
        v70[2] = 0x2020000000;
        char v71 = 0;
        uint64_t v24 = [(DRSRapidCloudKitHelper *)self objcClient];
        uint64_t v25 = [v20 buildVariant];
        v51 = [v20 deviceCategory];
        v56 = [v20 deviceModel];
        v55 = [v20 platformString];
        v54 = [v6 teamID];
        v50 = [v6 issueCategory];
        v53 = [v6 contextDictionaryData];
        v52 = [v6 build];
        v26 = [v6 logType];
        uint64_t v46 = [v11 length];
        int v44 = [v6 uploadAttemptCount];
        v45 = v20;
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke;
        v63[3] = &unk_263FC98F0;
        v27 = v47;
        v64 = v27;
        p_long long buf = &buf;
        v69 = v70;
        id v48 = v6;
        id v65 = v48;
        id v43 = v7;
        id v67 = v43;
        v28 = v49;
        v66 = v28;
        v29 = (void *)v24;
        v30 = (void *)v25;
        LODWORD(v42) = v44;
        v31 = v45;
        [v29 submitRapidPayloadWithBuildVariant:v30 deviceCategory:v51 deviceModel:v56 platform:v55 teamID:v54 issueCategory:v50 contextDictionaryData:v53 requestTime:(unint64_t)v23 build:v52 logType:v26 logSize:v46 fileName:v19 uploadAttempts:v42 payload:v11 completionHandler:v63];

        dispatch_time_t v32 = dispatch_time(0, 120000000000);
        intptr_t v33 = dispatch_semaphore_wait(v28, v32);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke_51;
        block[3] = &unk_263FC9918;
        v60 = v70;
        intptr_t v62 = v33;
        id v58 = v48;
        id v59 = v43;
        v61 = &buf;
        dispatch_sync(v27, block);

        _Block_object_dispose(v70, 8);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        v41 = DRSRapidErrorWithDescription(@"Could not determine file name");
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v41);

        v31 = DPLogHandle_CKCFUpload();
        if (os_signpost_enabled(v31))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Could not determine file name", (uint8_t *)&buf, 2u);
        }
      }
    }
    else
    {
      v40 = DRSRapidErrorWithDescription(@"Invalid payload");
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v40);

      v19 = DPLogHandle_CKCFUpload();
      if (os_signpost_enabled(v19))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Invalid payload", (uint8_t *)&buf, 2u);
      }
    }
  }
  else
  {
    v39 = DRSRapidErrorWithDescription(@"File not available");
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v39);

    v11 = DPLogHandle_CKCFUpload();
    if (os_signpost_enabled(v11))
    {
      LOWORD(buf) = 0;
      v12 = "Failed due to missing payload file.";
      goto LABEL_18;
    }
  }
LABEL_25:
}

void __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke_2;
  v14[3] = &unk_263FC98C8;
  long long v21 = *(_OWORD *)(a1 + 64);
  id v15 = v9;
  v10 = *(NSObject **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = v8;
  id v18 = v7;
  id v20 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 48);
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  dispatch_sync(v10, v14);
}

void *__58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke_2(void *result)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(result[10] + 8) + 24))
  {
    v1 = result;
    *(unsigned char *)(*(void *)(result[11] + 8) + 24) = 1;
    uint64_t v2 = result[4];
    v3 = DPLogHandle_CKCFUpload();
    BOOL v4 = os_signpost_enabled(v3);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = [(id)v1[4] localizedDescription];
        id v6 = (void *)v5;
        id v7 = @"Unknown";
        if (v5) {
          id v7 = (__CFString *)v5;
        }
        int v11 = 138543362;
        id v12 = v7;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Failed to upload due to CK layer error: %{public}@", (uint8_t *)&v11, 0xCu);
      }
      [(id)v1[5] uploadCompleteWithError:v1[4] ckRecordID:0];
    }
    else
    {
      if (v4)
      {
        id v8 = (__CFString *)v1[6];
        if (!v8) {
          id v8 = @"<None>";
        }
        int v11 = 138543362;
        id v12 = v8;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Reached CF endpoint successfully! Failure reason: %{public, name=failureReason}@", (uint8_t *)&v11, 0xCu);
      }

      [(id)v1[5] uploadCompleteWithError:0 ckRecordID:0];
      if (v1[6]) {
        uint64_t v9 = MEMORY[0x263EFFA80];
      }
      else {
        uint64_t v9 = MEMORY[0x263EFFA88];
      }
      [(id)v1[5] setCfDidSucceed:v9];
      [(id)v1[5] setCfFailureReason:v1[6]];
      v10 = (void *)v1[7];
      if (v10 && [v10 length]) {
        [(id)v1[5] setCfReplyPayload:v1[7]];
      }
    }
    (*(void (**)(void))(v1[9] + 16))();
    return (void *)dispatch_semaphore_signal((dispatch_semaphore_t)v1[8]);
  }
  return result;
}

void __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke_51(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && *(void *)(a1 + 64))
  {
    uint64_t v2 = DRSRapidErrorWithDescription(@"Timed out waiting for CF response");
    [*(id *)(a1 + 32) uploadCompleteWithError:v2 ckRecordID:0];
    v3 = DPLogHandle_CKCFUpload();
    if (os_signpost_enabled(v3))
    {
      int v4 = 134217984;
      uint64_t v5 = 120000000000;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Request to CKCF hit %llu second timeout", (uint8_t *)&v4, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (DiagnosticPipelineRapidServiceFunctionsClientObjc)objcClient
{
  return self->_objcClient;
}

- (void).cxx_destruct
{
}

@end