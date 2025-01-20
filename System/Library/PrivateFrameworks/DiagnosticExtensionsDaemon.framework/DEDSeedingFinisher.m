@interface DEDSeedingFinisher
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
- (BOOL)isPreparing;
- (BOOL)isUploading;
- (BOOL)shouldReportProgress;
- (BOOL)uploadFinished;
- (BOOL)uploadsAreComplete;
- (DEDBugSession)session;
- (DEDBugSessionConfiguration)config;
- (DEDSeedingClient)client;
- (DEDSeedingFinisher)initWithCoder:(id)a3;
- (DEDSeedingFinisher)initWithConfiguration:(id)a3 session:(id)a4;
- (NSMutableDictionary)promises;
- (NSMutableSet)uploads;
- (OS_os_log)log;
- (OS_os_transaction)transaction;
- (id)additionalStateInfo;
- (id)archiveItemsInDirectory:(id)a3;
- (id)attachmentHandler;
- (id)prepareSessionDirectoryForSubmission:(id)a3;
- (id)prepareUpload:(id)a3 forSubmissionWithSession:(id)a4 metadata:(id)a5;
- (id)uploadItemForTask:(id)a3;
- (int)uploadProgressCounter;
- (int64_t)bytesUploadedFromAllFiles;
- (int64_t)lastUploadPercentageReported;
- (int64_t)totalUploadSize;
- (void)cleanup;
- (void)didAdoptAttachmentGroup:(id)a3;
- (void)didCancelCollectionOnExtension:(id)a3;
- (void)didCollectAttachmentGroup:(id)a3;
- (void)didStartCollectingDiagnosticExtensionWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finishSession:(id)a3 withConfiguration:(id)a4;
- (void)save;
- (void)setBytesUploadedFromAllFiles:(int64_t)a3;
- (void)setClient:(id)a3;
- (void)setConfig:(id)a3;
- (void)setIsPreparing:(BOOL)a3;
- (void)setLastUploadPercentageReported:(int64_t)a3;
- (void)setLog:(id)a3;
- (void)setPromises:(id)a3;
- (void)setSession:(id)a3;
- (void)setTotalUploadSize:(int64_t)a3;
- (void)setTransaction:(id)a3;
- (void)setUploadProgressCounter:(int)a3;
- (void)setUploads:(id)a3;
- (void)shouldReportProgress;
- (void)updateUploadProgressOnSessionIfNeeded;
- (void)uploadTask:(id)a3 didCompleteWithError:(id)a4;
- (void)uploadTask:(id)a3 didSendBytes:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5;
@end

@implementation DEDSeedingFinisher

- (id)additionalStateInfo
{
  v17[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  [v3 setObject:&unk_26D1AF3F8 forKeyedSubscript:@"version"];
  v16[0] = @"total_bytes_to_upload";
  v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"));
  v16[1] = @"bytes_uploaded";
  v17[0] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[DEDSeedingFinisher bytesUploadedFromAllFiles](self, "bytesUploadedFromAllFiles"));
  v17[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v3 setObject:v6 forKeyedSubscript:@"finisher"];

  v7 = [(DEDSeedingFinisher *)self config];

  if (v7)
  {
    v14 = @"allows_cellular_upload";
    v8 = NSNumber;
    v9 = [(DEDSeedingFinisher *)self config];
    v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "allowsCellularUpload"));
    v15 = v10;
    v11 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [v3 setObject:v11 forKeyedSubscript:@"config"];
  }
  else
  {
    [v3 setObject:&stru_26D197018 forKeyedSubscript:@"config"];
  }
  v12 = [NSDictionary dictionaryWithDictionary:v3];

  return v12;
}

- (BOOL)isUploading
{
  v3 = [(DEDSeedingFinisher *)self client];
  v4 = [v3 ongoingUploads];

  v5 = [(DEDSeedingFinisher *)self promises];
  uint64_t v6 = [v5 count];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __33__DEDSeedingFinisher_isUploading__block_invoke;
  v12[3] = &unk_26453A7C0;
  v12[4] = self;
  v7 = objc_msgSend(v4, "ded_selectItemsPassingTest:", v12);
  uint64_t v8 = [v7 count];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;

  return v10;
}

uint64_t __33__DEDSeedingFinisher_isUploading__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  uint64_t v6 = [v5 log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __33__DEDSeedingFinisher_isUploading__block_invoke_cold_1(v4, v3, v6);
  }

  v7 = [v3 progress];
  uint64_t v8 = [v7 isFinished] ^ 1;

  return v8;
}

- (BOOL)uploadFinished
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(DEDSeedingFinisher *)self client];
  v4 = [v3 ongoingUploads];

  v5 = [(DEDSeedingFinisher *)self promises];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [v4 count];
  uint64_t v8 = objc_msgSend(v4, "ded_selectItemsPassingTest:", &__block_literal_global_4);
  uint64_t v9 = [v8 count];

  BOOL v10 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v15 = 134218496;
    uint64_t v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_INFO, "[%lu] file promises. [%lu] uploads. [%lu] uploads completed.", (uint8_t *)&v15, 0x20u);
  }

  if (v6) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v13 = !v11 && v9 == v6;

  return v13;
}

uint64_t __36__DEDSeedingFinisher_uploadFinished__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 progress];
  uint64_t v3 = [v2 isFinished];

  return v3;
}

- (void)finishSession:(id)a3 withConfiguration:(id)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(DEDSeedingFinisher *)self setConfig:a4];
  [(DEDSeedingFinisher *)self setSession:v6];
  uint64_t v7 = NSString;
  uint64_t v8 = [(DEDSeedingFinisher *)self config];
  uint64_t v9 = [v8 seedingSubmissionType];
  BOOL v10 = "Unknown";
  if (v9 == 2) {
    BOOL v10 = "FFU";
  }
  if (v9 == 1) {
    BOOL v11 = "FR";
  }
  else {
    BOOL v11 = v10;
  }
  v12 = [(DEDSeedingFinisher *)self config];
  BOOL v13 = objc_msgSend(v7, "stringWithFormat:", @"com.apple.diagnosticextensionsd-finishing-%s-%ld", v11, objc_msgSend(v12, "seedingSubmissionID"));

  id v73 = v13;
  [v73 UTF8String];
  v14 = (void *)os_transaction_create();
  [(DEDSeedingFinisher *)self setTransaction:v14];

  int v15 = [(DEDSeedingFinisher *)self client];

  if (!v15)
  {
    uint64_t v16 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v16, OS_LOG_TYPE_DEFAULT, "Initializing networking client for resuming finisher", buf, 2u);
    }

    __int16 v17 = [DEDSeedingClient alloc];
    uint64_t v18 = [(DEDSeedingFinisher *)self config];
    __int16 v19 = [v6 identifier];
    uint64_t v20 = [(DEDSeedingClient *)v17 initWithConfiguration:v18 sessionID:v19 delegate:self];
    [(DEDSeedingFinisher *)self setClient:v20];
  }
  uint64_t v21 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(DEDSeedingFinisher *)self session];
    v23 = [v22 identifier];
    *(_DWORD *)buf = 138543362;
    v89 = v23;
    _os_log_impl(&dword_21FE04000, v21, OS_LOG_TYPE_DEFAULT, "Will prepare submission directory for bug session [%{public}@]", buf, 0xCu);
  }
  v24 = [(DEDSeedingFinisher *)self prepareSessionDirectoryForSubmission:v6];
  v25 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [(DEDSeedingFinisher *)self session];
    v27 = [v26 identifier];
    *(_DWORD *)buf = 138543362;
    v89 = v27;
    _os_log_impl(&dword_21FE04000, v25, OS_LOG_TYPE_DEFAULT, "Did prepare submission directory for bug session [%{public}@]", buf, 0xCu);
  }
  v74 = v6;
  v72 = v24;
  if ([v24 count])
  {
    id v28 = [(DEDSeedingFinisher *)self uploads];
    [v28 addObjectsFromArray:v24];
  }
  else
  {
    v29 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      v89 = v30;
      _os_log_impl(&dword_21FE04000, v29, OS_LOG_TYPE_DEFAULT, "Prepared session directory but got zero upload items on [%{public}@]. Will not start any new uploads", buf, 0xCu);
    }
    v31 = [(DEDSeedingFinisher *)self client];
    v32 = [v31 ongoingUploads];

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v28 = v32;
    uint64_t v33 = [v28 countByEnumeratingWithState:&v83 objects:v94 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v84 != v35) {
            objc_enumerationMutation(v28);
          }
          v37 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          v38 = [(DEDSeedingFinisher *)self log];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = [(DEDSeedingFinisher *)self session];
            v40 = [v39 identifier];
            uint64_t v41 = [v37 taskIdentifier];
            v42 = [v37 progress];
            [v42 fractionCompleted];
            *(_DWORD *)buf = 138543874;
            v89 = v40;
            __int16 v90 = 2048;
            uint64_t v91 = v41;
            __int16 v92 = 2048;
            double v93 = v43 * 100.0;
            _os_log_impl(&dword_21FE04000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] found upload task [%lu] completion [%.2f%%]", buf, 0x20u);
          }
        }
        uint64_t v34 = [v28 countByEnumeratingWithState:&v83 objects:v94 count:16];
      }
      while (v34);
    }

    id v6 = v74;
  }

  v44 = dispatch_group_create();
  [(DEDSeedingFinisher *)self setTotalUploadSize:0];
  v45 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [v6 identifier];
    v47 = [(DEDSeedingFinisher *)self uploads];
    int v48 = [v47 count];
    *(_DWORD *)buf = 138543618;
    v89 = v46;
    __int16 v90 = 1024;
    LODWORD(v91) = v48;
    _os_log_impl(&dword_21FE04000, v45, OS_LOG_TYPE_DEFAULT, "will dispatch uploads for [%{public}@] with [%d] uploads", buf, 0x12u);
  }
  id v49 = objc_alloc(MEMORY[0x263EFFA08]);
  v50 = [(DEDSeedingFinisher *)self uploads];
  v51 = (void *)[v49 initWithSet:v50];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v51;
  uint64_t v52 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v80;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v80 != v54) {
          objc_enumerationMutation(obj);
        }
        v56 = *(void **)(*((void *)&v79 + 1) + 8 * j);
        dispatch_group_enter(v44);
        v57 = [(DEDSeedingFinisher *)self promises];
        v58 = [v56 extensionID];
        v59 = [v57 objectForKey:v58];

        v60 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = [v56 publicDescription];
          [v59 UUIDString];
          uint64_t v62 = v54;
          v64 = v63 = v44;
          *(_DWORD *)buf = 138543618;
          v89 = v61;
          __int16 v90 = 2114;
          uint64_t v91 = (uint64_t)v64;
          _os_log_impl(&dword_21FE04000, v60, OS_LOG_TYPE_DEFAULT, "will send file %{public}@ promise: [%{public}@]", buf, 0x16u);

          v44 = v63;
          uint64_t v54 = v62;
        }
        v65 = [(DEDSeedingFinisher *)self client];
        v66 = [v56 attachedPath];
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __54__DEDSeedingFinisher_finishSession_withConfiguration___block_invoke;
        v76[3] = &unk_26453A808;
        v76[4] = v56;
        v76[5] = self;
        id v77 = v59;
        v78 = v44;
        id v67 = v59;
        [v65 sendFile:v66 promise:v67 withCompletion:v76];
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
    }
    while (v53);
  }

  dispatch_group_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
  v68 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    v69 = [v74 identifier];
    *(_DWORD *)buf = 138543362;
    v89 = v69;
    _os_log_impl(&dword_21FE04000, v68, OS_LOG_TYPE_DEFAULT, "did dispatch all uploads for [%{public}@]", buf, 0xCu);
  }
  objc_msgSend(v74, "uploadProgress:total:", 0, -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"));
  v70 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    v71 = [v74 identifier];
    *(_DWORD *)buf = 138543362;
    v89 = v71;
    _os_log_impl(&dword_21FE04000, v70, OS_LOG_TYPE_INFO, "finishSession completed (uploads are dispatched) for session [%{public}@]", buf, 0xCu);
  }
}

void __54__DEDSeedingFinisher_finishSession_withConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      id v21 = v5;
      _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "Error sending file %{public}@", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v7 = [*(id *)(a1 + 40) client];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 32) promiseFilename];
    BOOL v10 = [*(id *)(a1 + 32) fileSize];
    uint64_t v11 = [v10 longLongValue];
    v12 = v7;
    uint64_t v13 = v8;
    v14 = v9;
    uint64_t v15 = 99;
  }
  else
  {
    [*(id *)(a1 + 32) setUploadTask:a2];
    uint64_t v16 = [*(id *)(a1 + 32) fileSize];
    objc_msgSend(*(id *)(a1 + 32), "setTotalBytesExpectedToSend:", objc_msgSend(v16, "longLongValue"));

    objc_msgSend(*(id *)(a1 + 40), "setTotalUploadSize:", objc_msgSend(*(id *)(a1 + 40), "totalUploadSize") + objc_msgSend(*(id *)(a1 + 32), "totalBytesExpectedToSend"));
    __int16 v17 = [*(id *)(a1 + 32) extensionID];

    if (!v17) {
      goto LABEL_7;
    }
    uint64_t v18 = *(void **)(a1 + 40);
    if (!*(void *)(a1 + 48))
    {
      uint64_t v7 = [v18 log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __54__DEDSeedingFinisher_finishSession_withConfiguration___block_invoke_cold_1();
      }
      goto LABEL_6;
    }
    uint64_t v7 = [v18 client];
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 32) promiseFilename];
    BOOL v10 = [*(id *)(a1 + 32) fileSize];
    uint64_t v11 = [v10 longLongValue];
    v12 = v7;
    uint64_t v13 = v19;
    v14 = v9;
    uint64_t v15 = 3;
  }
  [v12 updatePromise:v13 withFilename:v14 size:v11 status:v15 success:0 error:0];

LABEL_6:
LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (DEDSeedingFinisher)initWithConfiguration:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)DEDSeedingFinisher;
  uint64_t v9 = [(DEDSeedingFinisher *)&v22 init];
  if (v9)
  {
    BOOL v10 = [DEDSeedingClient alloc];
    uint64_t v11 = [v8 identifier];
    uint64_t v12 = [(DEDSeedingClient *)v10 initWithConfiguration:v7 sessionID:v11 delegate:v9];
    client = v9->_client;
    v9->_client = (DEDSeedingClient *)v12;

    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeWeak((id *)&v9->_session, v8);
    uint64_t v14 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
    promises = v9->_promises;
    v9->_promises = (NSMutableDictionary *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:2];
    uploads = v9->_uploads;
    v9->_uploads = (NSMutableSet *)v16;

    uint64_t v18 = +[DEDConfiguration sharedInstance];
    os_log_t v19 = os_log_create((const char *)[v18 loggingSubsystem], "seed-finish");
    log = v9->_log;
    v9->_log = (OS_os_log *)v19;

    v9->_isPreparing = 0;
    +[DEDFBKFeedbackUpload cleanUpIfNeeded];
  }

  return v9;
}

- (DEDSeedingFinisher)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DEDSeedingFinisher;
  id v5 = [(DEDSeedingFinisher *)&v20 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFF9C0];
    id v7 = +[DEDSeedingFinisher archivedClasses];
    id v8 = [v6 setWithSet:v7];

    uint64_t v9 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v8 minusSet:v9];

    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:@"promises"];
    promises = v5->_promises;
    v5->_promises = (NSMutableDictionary *)v10;

    v5->_totalUploadSize = [v4 decodeInt64ForKey:@"totalUploadSize"];
    v5->_bytesUploadedFromAllFiles = [v4 decodeInt64ForKey:@"bytesUploaded"];
    uint64_t v12 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:2];
    uploads = v5->_uploads;
    v5->_uploads = (NSMutableSet *)v12;

    uint64_t v14 = +[DEDConfiguration sharedInstance];
    os_log_t v15 = os_log_create((const char *)[v14 loggingSubsystem], "seed-finish");
    log = v5->_log;
    v5->_log = (OS_os_log *)v15;

    __int16 v17 = v5->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v5->_promises;
      *(_DWORD *)buf = 138412290;
      objc_super v22 = v18;
      _os_log_impl(&dword_21FE04000, v17, OS_LOG_TYPE_INFO, "Restoring Seeding Finisher with promises %@", buf, 0xCu);
    }
    v5->_isPreparing = 0;
    +[DEDFBKFeedbackUpload cleanUpIfNeeded];
  }
  return v5;
}

- (void)didStartCollectingDiagnosticExtensionWithIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v8 = [v4 UUID];
  id v6 = [(DEDSeedingFinisher *)self promises];
  [v6 setObject:v8 forKeyedSubscript:v5];

  [(DEDSeedingFinisher *)self save];
  id v7 = [(DEDSeedingFinisher *)self client];
  [v7 makePromiseWithUUID:v8 extensionID:v5 success:0 error:0];
}

- (void)didCollectAttachmentGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 extensionID];

  if (v5)
  {
    id v6 = [(DEDSeedingFinisher *)self promises];
    id v7 = [v4 extensionID];
    id v8 = [v6 objectForKey:v7];

    uint64_t v9 = [(DEDSeedingFinisher *)self client];
    [v9 updatePromise:v8 withAttachmentGroup:v4 status:2 success:0 error:0];
  }
  else
  {
    uint64_t v10 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingFinisher didCollectAttachmentGroup:]();
    }
  }
}

- (void)didCancelCollectionOnExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDSeedingFinisher *)self promises];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = [(DEDSeedingFinisher *)self client];
    [v7 cancelPromise:v6 withSuccess:0 error:0];

    id v8 = [(DEDSeedingFinisher *)self promises];
    [v8 removeObjectForKey:v4];
  }
  else
  {
    id v8 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingFinisher didCancelCollectionOnExtension:]();
    }
  }
}

- (void)didAdoptAttachmentGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 extensionID];

  if (v5)
  {
    id v6 = [MEMORY[0x263F08C38] UUID];
    id v7 = [(DEDSeedingFinisher *)self promises];
    id v8 = [v4 extensionID];
    [v7 setObject:v6 forKeyedSubscript:v8];

    [(DEDSeedingFinisher *)self save];
    uint64_t v9 = [(DEDSeedingFinisher *)self client];
    uint64_t v10 = [v4 extensionID];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__DEDSeedingFinisher_didAdoptAttachmentGroup___block_invoke;
    v12[3] = &unk_26453A830;
    v12[4] = self;
    id v13 = v6;
    id v14 = v4;
    id v11 = v6;
    [v9 makePromiseWithUUID:v11 extensionID:v10 success:v12 error:0];
  }
}

void __46__DEDSeedingFinisher_didAdoptAttachmentGroup___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 updatePromise:*(void *)(a1 + 40) withAttachmentGroup:*(void *)(a1 + 48) status:2 success:0 error:0];
}

- (void)cleanup
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DEDSeedingFinisher *)self promises];
  id v4 = [v3 allValues];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(DEDSeedingFinisher *)self promises];
      id v8 = [v7 allValues];
      uint64_t v9 = [v8 valueForKeyPath:@"UUIDString"];
      *(_DWORD *)buf = 138543362;
      v39 = v9;
      _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "Found promises on cleanup, will cancel [%{public}@]", buf, 0xCu);
    }
    uint64_t v10 = dispatch_group_create();
    id v11 = [(DEDSeedingFinisher *)self promises];
    uint64_t v12 = (void *)[v11 copy];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v26 = v12;
    obuint64_t j = [v12 allKeys];
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v18 = [v26 objectForKeyedSubscript:v17];
          os_log_t v19 = [(DEDSeedingFinisher *)self promises];
          [v19 removeObjectForKey:v17];

          dispatch_group_enter(v10);
          objc_super v20 = [(DEDSeedingFinisher *)self client];
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __29__DEDSeedingFinisher_cleanup__block_invoke;
          v30[3] = &unk_26453A830;
          v30[4] = self;
          id v21 = v18;
          id v31 = v21;
          v32 = v10;
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __29__DEDSeedingFinisher_cleanup__block_invoke_64;
          v27[3] = &unk_26453A858;
          v27[4] = self;
          id v28 = v21;
          v29 = v32;
          id v22 = v21;
          [v20 cancelPromise:v22 withSuccess:v30 error:v27];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v14);
    }

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v23 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v23, OS_LOG_TYPE_DEFAULT, "did finish cleanup cancel file promises", buf, 2u);
    }
  }
  v24 = [(DEDSeedingFinisher *)self client];
  [v24 cleanup];
}

void __29__DEDSeedingFinisher_cleanup__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 40) UUIDString];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "did cleanup cancel promise [%{public}@]", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __29__DEDSeedingFinisher_cleanup__block_invoke_64(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 40) UUIDString];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "did failed to cleanup cancel promise [%{public}@]", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  int v4 = [(DEDSeedingFinisher *)self promises];
  [v5 encodeObject:v4 forKey:@"promises"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"), @"totalUploadSize");
  objc_msgSend(v5, "encodeInt64:forKey:", -[DEDSeedingFinisher bytesUploadedFromAllFiles](self, "bytesUploadedFromAllFiles"), @"bytesUploaded");
}

+ (id)archivedClasses
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

- (void)uploadTask:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 134218240;
    uint64_t v32 = [v6 taskIdentifier];
    __int16 v33 = 1024;
    BOOL v34 = v7 != 0;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Upload Task: [%lu] did complete. Error? [%i]", (uint8_t *)&v31, 0x12u);
  }

  uint64_t v9 = [(DEDSeedingFinisher *)self uploadItemForTask:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [v9 fileSize];
    objc_msgSend(v10, "setBytesUploaded:", objc_msgSend(v11, "longLongValue"));

    [v10 setCompleted:1];
    [(DEDSeedingFinisher *)self updateUploadProgressOnSessionIfNeeded];
    uint64_t v12 = [(DEDSeedingFinisher *)self promises];
    uint64_t v13 = [v10 extensionID];
    uint64_t v14 = [v12 objectForKey:v13];

    if (v14)
    {
      if (v7)
      {
        uint64_t v15 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher uploadTask:didCompleteWithError:](v6);
        }

        uint64_t v16 = [(DEDSeedingFinisher *)self client];
        uint64_t v17 = [v10 promiseFilename];
        uint64_t v18 = [v10 fileSize];
        uint64_t v19 = [v18 longLongValue];
        objc_super v20 = v16;
        id v21 = v14;
        id v22 = v17;
        uint64_t v23 = 99;
      }
      else
      {
        uint64_t v16 = [(DEDSeedingFinisher *)self client];
        uint64_t v17 = [v10 promiseFilename];
        uint64_t v18 = [v10 fileSize];
        uint64_t v19 = [v18 longLongValue];
        objc_super v20 = v16;
        id v21 = v14;
        id v22 = v17;
        uint64_t v23 = 4;
      }
      [v20 updatePromise:v21 withFilename:v22 size:v19 status:v23 success:0 error:0];
    }
    else
    {
      uint64_t v16 = [(DEDSeedingFinisher *)self log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DEDSeedingFinisher uploadTask:didCompleteWithError:]();
      }
    }

    v24 = [v10 attachedPath];

    if (v24)
    {
      v25 = (void *)MEMORY[0x263F3A0A0];
      v26 = [v10 attachedPath];
      [v25 removeFile:v26];
    }
  }
  if ([(DEDSeedingFinisher *)self uploadsAreComplete])
  {
    [(DEDSeedingFinisher *)self setTransaction:0];
    v27 = objc_opt_new();
    [(DEDSeedingFinisher *)self setPromises:v27];

    id v28 = [(DEDSeedingFinisher *)self session];
    v29 = [v28 identifier];
    +[DEDFBKFeedbackUpload didFinishUploadOnBugSessionIdentifier:v29];

    v30 = [(DEDSeedingFinisher *)self session];
    [v30 didFinishAllUploads];
  }
}

- (void)uploadTask:(id)a3 didSendBytes:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(DEDSeedingFinisher *)self uploadItemForTask:v8];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 setBytesUploaded:a4];
  }
  else
  {
    id v11 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingFinisher uploadTask:didSendBytes:totalBytesExpectedToSend:](self, v8);
    }

    uint64_t v12 = objc_alloc_init(DEDSeedingUploadItem);
    [(DEDSeedingUploadItem *)v12 setUploadTask:v8];
    [(DEDSeedingUploadItem *)v12 setBytesUploaded:a4];
    [(DEDSeedingUploadItem *)v12 setTotalBytesExpectedToSend:a5];
    uint64_t v13 = [(DEDSeedingFinisher *)self uploads];
    [v13 addObject:v12];
  }
  [(DEDSeedingFinisher *)self updateUploadProgressOnSessionIfNeeded];
}

- (void)updateUploadProgressOnSessionIfNeeded
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [(DEDSeedingFinisher *)self uploads];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v17 + 1) + 8 * i) bytesUploaded];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v31 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(DEDSeedingFinisher *)self setBytesUploadedFromAllFiles:v6];
  if ([(DEDSeedingFinisher *)self shouldReportProgress])
  {
    [(DEDSeedingFinisher *)self setUploadProgressCounter:[(DEDSeedingFinisher *)self uploadProgressCounter] + 1];
    uint64_t v9 = [(DEDSeedingFinisher *)self session];
    objc_msgSend(v9, "uploadProgress:total:", -[DEDSeedingFinisher bytesUploadedFromAllFiles](self, "bytesUploadedFromAllFiles"), -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"));

    uint64_t v10 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(DEDSeedingFinisher *)self session];
      uint64_t v12 = [v11 identifier];
      int64_t v13 = [(DEDSeedingFinisher *)self lastUploadPercentageReported];
      int64_t v14 = [(DEDSeedingFinisher *)self bytesUploadedFromAllFiles];
      int64_t v15 = [(DEDSeedingFinisher *)self totalUploadSize];
      int v16 = [(DEDSeedingFinisher *)self uploadProgressCounter];
      *(_DWORD *)buf = 138544386;
      id v22 = v12;
      __int16 v23 = 2048;
      int64_t v24 = v13;
      __int16 v25 = 2048;
      int64_t v26 = v14;
      __int16 v27 = 2048;
      int64_t v28 = v15;
      __int16 v29 = 1024;
      int v30 = v16;
      _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_INFO, "[%{public}@] upload progress: %lu%% (sent: %lu total: %lu) updateCount: %i", buf, 0x30u);
    }
  }
}

- (BOOL)shouldReportProgress
{
  if ([(DEDSeedingFinisher *)self totalUploadSize])
  {
    float v3 = (float)[(DEDSeedingFinisher *)self bytesUploadedFromAllFiles];
    uint64_t v4 = 5
       * ((uint64_t)(float)((float)(v3 / (float)[(DEDSeedingFinisher *)self totalUploadSize]) * 100.0)
        / 5);
    BOOL v5 = v4 != [(DEDSeedingFinisher *)self lastUploadPercentageReported]
      && [(DEDSeedingFinisher *)self uploadProgressCounter] < 100;
    [(DEDSeedingFinisher *)self setLastUploadPercentageReported:v4];
  }
  else
  {
    uint64_t v6 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[DEDSeedingFinisher shouldReportProgress]();
    }

    return 0;
  }
  return v5;
}

- (BOOL)uploadsAreComplete
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(DEDSeedingFinisher *)self uploads];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    int v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v6 &= [*(id *)(*((void *)&v9 + 1) + 8 * i) completed];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)prepareSessionDirectoryForSubmission:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(DEDSeedingFinisher *)self setIsPreparing:1];
  v47 = self;
  uint64_t v5 = [(DEDSeedingFinisher *)self attachmentHandler];
  v42 = v4;
  int v6 = [v4 identifier];
  v38 = v5;
  uint64_t v7 = [v5 directoryForBugSessionIdentifier:v6];

  v37 = (void *)v7;
  id v8 = [MEMORY[0x263F3A0A0] lsDir:v7];
  v39 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
    uint64_t v12 = *MEMORY[0x263EFF6A8];
    uint64_t v40 = *MEMORY[0x263EFF6A8];
    uint64_t v41 = *(void *)v51;
    do
    {
      uint64_t v13 = 0;
      uint64_t v43 = v10;
      do
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
        id v48 = 0;
        id v49 = 0;
        [v14 getResourceValue:&v49 forKey:v12 error:&v48];
        id v15 = v49;
        id v16 = v48;
        if ([v15 BOOLValue]) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          long long v18 = NSString;
          long long v19 = [(DEDSeedingFinisher *)v47 config];
          uint64_t v20 = [v19 seedingSubmissionType];
          id v21 = "Unknown";
          if (v20 == 2) {
            id v21 = "feedback_followup_id";
          }
          if (v20 == 1) {
            id v22 = "feedback_id";
          }
          else {
            id v22 = v21;
          }
          __int16 v23 = [v18 stringWithUTF8String:v22];

          uint64_t v24 = [v14 lastPathComponent];
          __int16 v25 = [(DEDSeedingFinisher *)v47 promises];
          v46 = (void *)v24;
          int64_t v26 = [v25 objectForKey:v24];

          if (v26)
          {
            __int16 v27 = [v26 UUIDString];
            v45 = v23;
            v56[0] = v23;
            int64_t v28 = NSNumber;
            __int16 v29 = [(DEDSeedingFinisher *)v47 config];
            int v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "seedingSubmissionID"));
            v56[1] = @"promise_uuid";
            v57[0] = v30;
            v57[1] = v27;
            int v31 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];

            uint64_t v32 = [(DEDSeedingFinisher *)v47 prepareUpload:v14 forSubmissionWithSession:v42 metadata:v31];
            [v32 setFilePromiseUUID:v27];
            if (v32) {
              [v39 addObject:v32];
            }

            uint64_t v12 = v40;
            uint64_t v11 = v41;
            uint64_t v10 = v43;
            __int16 v23 = v45;
            __int16 v33 = v46;
          }
          else
          {
            __int16 v27 = [(DEDSeedingFinisher *)v47 log];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              __int16 v33 = v46;
              v55 = v46;
              _os_log_error_impl(&dword_21FE04000, v27, OS_LOG_TYPE_ERROR, "found no promise for extension ID [%{public}@]", buf, 0xCu);
              uint64_t v10 = v43;
            }
            else
            {
              uint64_t v10 = v43;
              __int16 v33 = v46;
            }
          }
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v34 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      uint64_t v10 = v34;
    }
    while (v34);
  }

  [(DEDSeedingFinisher *)v47 setIsPreparing:0];
  uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithArray:v39];

  return v35;
}

- (id)prepareUpload:(id)a3 forSubmissionWithSession:(id)a4 metadata:(id)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:]2();
  }

  uint64_t v12 = [(DEDSeedingFinisher *)self attachmentHandler];
  v66 = [v8 lastPathComponent];
  uint64_t v13 = [v9 objectForKeyedSubscript:@"promise_uuid"];
  if (v13)
  {
    uint64_t v14 = [v9 objectForKeyedSubscript:@"promise_uuid"];
  }
  else
  {
    id v15 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v15 UUIDString];
  }
  id v16 = NSString;
  BOOL v17 = [(DEDSeedingFinisher *)self config];
  uint64_t v18 = [v17 seedingSubmissionType];
  long long v19 = "Unknown";
  if (v18 == 2) {
    long long v19 = "FFU";
  }
  if (v18 == 1) {
    uint64_t v20 = "FR";
  }
  else {
    uint64_t v20 = v19;
  }
  id v21 = [(DEDSeedingFinisher *)self config];
  id v22 = [v16 stringWithFormat:@"%s-%ld-%@", v20, objc_msgSend(v21, "seedingSubmissionID"), v14];

  __int16 v23 = [v10 identifier];

  uint64_t v24 = [v12 directoryForBugSessionIdentifier:v23];
  __int16 v25 = [v24 URLByAppendingPathComponent:v22];

  uint64_t v26 = [MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:v25];
  if (!v26)
  {
    int64_t v28 = [MEMORY[0x263F3A0A0] lsDir:v8];
    if (![v28 count])
    {
      uint64_t v34 = [v8 lastPathComponent];
      uint64_t v35 = [v25 URLByAppendingPathComponent:v34];

      uint64_t v32 = v35;
      uint64_t v36 = [MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:v35];
      if (v36)
      {
        id v27 = (id)v36;
        v65 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.6(v27);
        }
        goto LABEL_63;
      }
      uint64_t v43 = [MEMORY[0x263F3A070] archiveDirectoryAt:v35];
      if (!v43)
      {
        v65 = [(DEDSeedingFinisher *)self log];
        if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
LABEL_62:
          id v27 = 0;
LABEL_63:
          __int16 v29 = 0;
          goto LABEL_64;
        }
LABEL_61:
        -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:]();
        goto LABEL_62;
      }
    }
    if ((unint64_t)[v28 count] >= 2)
    {
      int v30 = [v8 lastPathComponent];
      uint64_t v31 = [v25 URLByAppendingPathComponent:v30];

      uint64_t v32 = (__CFString *)v31;
      uint64_t v33 = [MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:v31];
      if (v33)
      {
        id v27 = (id)v33;
        v65 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.6(v27);
        }
        __int16 v29 = 0;
        goto LABEL_64;
      }
      if (([MEMORY[0x263F3A0A0] copyAllFilesFromDir:v8 toDir:v31] & 1) == 0)
      {
        v44 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.5();
        }

        uint64_t v32 = (__CFString *)v31;
      }
      v45 = [MEMORY[0x263F3A070] archiveDirectoryAt:v32];
      if (v45)
      {
        v38 = v45;
        v64 = v32;
        uint64_t v46 = [v45 lastPathComponent];
LABEL_41:

        v64 = (__CFString *)v46;
        goto LABEL_42;
      }
      v65 = [(DEDSeedingFinisher *)self log];
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    if ([v28 count] != 1)
    {
      v64 = 0;
LABEL_42:
      v65 = [v25 URLByAppendingPathComponent:@"__fileclerk.json"];
      id v67 = 0;
      v63 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:0 error:&v67];
      id v27 = v67;
      if (v27)
      {
        id v48 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.4(v27);
        }
      }
      [v63 writeToURL:v65 atomically:1];
      id v49 = [(DEDSeedingFinisher *)self archiveItemsInDirectory:v25];
      long long v50 = [(DEDSeedingFinisher *)self log];
      long long v51 = v50;
      if (v49)
      {
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          uint64_t v59 = [v49 lastPathComponent];
          v61 = v22;
          uint64_t v52 = [v8 lastPathComponent];
          *(_DWORD *)buf = 138543618;
          v70 = v59;
          __int16 v71 = 2114;
          uint64_t v72 = v52;
          long long v53 = (void *)v52;
          _os_log_impl(&dword_21FE04000, v51, OS_LOG_TYPE_INFO, "created upload file name [%{public}@] from directory [%{public}@]", buf, 0x16u);

          id v22 = v61;
        }

        [MEMORY[0x263F3A0A0] removeFile:v8];
        if (v64) {
          uint64_t v54 = v64;
        }
        else {
          uint64_t v54 = &stru_26D197018;
        }
        __int16 v29 = +[DEDSeedingUploadItem itemAtPath:v49 enclosedFilename:v54 extensionID:v66];
      }
      else
      {
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:]();
        }

        __int16 v29 = 0;
      }

      goto LABEL_57;
    }
    v37 = [v28 objectAtIndexedSubscript:0];
    id v68 = 0;
    [(__CFString *)v37 getResourceValue:&v68 forKey:*MEMORY[0x263EFF6A8] error:0];
    v38 = v68;
    v64 = v37;
    if ([v38 BOOLValue])
    {
      v65 = v38;
      v39 = [(__CFString *)v37 lastPathComponent];
      uint64_t v40 = [v25 URLByAppendingPathComponent:v39];

      uint64_t v41 = (void *)v40;
      id v27 = [MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:v40];
      v60 = v41;
      if (v27)
      {
        v42 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.6(v27);
        }
LABEL_29:

        __int16 v29 = 0;
LABEL_57:
        uint64_t v32 = v64;
LABEL_64:

        goto LABEL_65;
      }
      if (([MEMORY[0x263F3A0A0] copyAllFilesFromDir:v64 toDir:v41] & 1) == 0)
      {
        v56 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.5();
        }

        uint64_t v41 = v60;
      }
      v57 = [MEMORY[0x263F3A070] archiveDirectoryAt:v41];
      if (!v57)
      {
        v42 = [(DEDSeedingFinisher *)self log];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:]();
        }
        goto LABEL_29;
      }
      v58 = v57;
      uint64_t v62 = [v57 lastPathComponent];

      v38 = v65;
      v47 = v60;
    }
    else
    {
      v47 = (void *)[MEMORY[0x263F3A0A0] copyAndReturn:v37 toDir:v25];
      uint64_t v62 = [v47 lastPathComponent];
    }

    uint64_t v46 = v62;
    goto LABEL_41;
  }
  id v27 = (id)v26;
  int64_t v28 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.6(v27);
  }
  __int16 v29 = 0;
LABEL_65:

  return v29;
}

- (id)archiveItemsInDirectory:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DEDSeedingFinisher *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDSeedingFinisher archiveItemsInDirectory:](v4, v5);
  }

  int v6 = (void *)[objc_alloc(MEMORY[0x263F3A068]) initWithURL:v4];
  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v4;
    uint64_t v7 = [MEMORY[0x263F3A0A0] lsDir:v4];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [v12 lastPathComponent];
          if (([v6 addFile:v12 withPathName:v13] & 1) == 0)
          {
            uint64_t v14 = [(DEDSeedingFinisher *)self log];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              id v15 = [v6 tarGzUrl];
              *(_DWORD *)buf = 138543874;
              __int16 v25 = v12;
              __int16 v26 = 2114;
              id v27 = v13;
              __int16 v28 = 2114;
              __int16 v29 = v15;
              _os_log_error_impl(&dword_21FE04000, v14, OS_LOG_TYPE_ERROR, "failed to add [%{public}@] with path name [%{public}@] to [%{public}@]", buf, 0x20u);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v9);
    }

    [v6 closeArchive];
    id v4 = v19;
    [MEMORY[0x263F3A0A0] removeFile:v19];
    id v16 = [v6 tarGzUrl];
  }
  else
  {
    BOOL v17 = [(DEDSeedingFinisher *)self log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingFinisher archiveItemsInDirectory:]();
    }

    id v16 = 0;
  }

  return v16;
}

- (void)save
{
  id v2 = [(DEDSeedingFinisher *)self session];
  [v2 save];
}

- (id)attachmentHandler
{
  id v2 = objc_alloc_init(DEDAttachmentHandler);
  return v2;
}

- (id)uploadItemForTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDSeedingFinisher *)self uploads];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__DEDSeedingFinisher_uploadItemForTask___block_invoke;
  v9[3] = &unk_26453A880;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "ded_findWithBlock:", v9);

  return v7;
}

uint64_t __40__DEDSeedingFinisher_uploadItemForTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uploadTask];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (DEDBugSessionConfiguration)config
{
  return (DEDBugSessionConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSMutableSet)uploads
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUploads:(id)a3
{
}

- (int64_t)totalUploadSize
{
  return self->_totalUploadSize;
}

- (void)setTotalUploadSize:(int64_t)a3
{
  self->_totalUploadSize = a3;
}

- (int64_t)lastUploadPercentageReported
{
  return self->_lastUploadPercentageReported;
}

- (void)setLastUploadPercentageReported:(int64_t)a3
{
  self->_lastUploadPercentageReported = a3;
}

- (int64_t)bytesUploadedFromAllFiles
{
  return self->_bytesUploadedFromAllFiles;
}

- (void)setBytesUploadedFromAllFiles:(int64_t)a3
{
  self->_bytesUploadedFromAllFiles = a3;
}

- (int)uploadProgressCounter
{
  return self->_uploadProgressCounter;
}

- (void)setUploadProgressCounter:(int)a3
{
  self->_uploadProgressCounter = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLog:(id)a3
{
}

- (DEDBugSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (DEDBugSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransaction:(id)a3
{
}

- (BOOL)isPreparing
{
  return self->_isPreparing;
}

- (void)setIsPreparing:(BOOL)a3
{
  self->_isPreparing = a3;
}

- (DEDSeedingClient)client
{
  return (DEDSeedingClient *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClient:(id)a3
{
}

- (NSMutableDictionary)promises
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPromises:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promises, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_uploads, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

void __33__DEDSeedingFinisher_isUploading__block_invoke_cold_1(id *a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 session];
  id v6 = [v5 identifier];
  uint64_t v7 = [a2 taskIdentifier];
  uint64_t v8 = [a2 progress];
  [v8 fractionCompleted];
  int v10 = 138543874;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  __int16 v14 = 2048;
  double v15 = v9 * 100.0;
  _os_log_debug_impl(&dword_21FE04000, a3, OS_LOG_TYPE_DEBUG, "isUploading? | [%{public}@] found upload task [%lu] completion [%.2f%%]", (uint8_t *)&v10, 0x20u);
}

void __54__DEDSeedingFinisher_finishSession_withConfiguration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "did signal uploading but found no promise for DE identifier", v2, v3, v4, v5, v6);
}

- (void)didCollectAttachmentGroup:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "didCollect group but group has no DE identifier", v2, v3, v4, v5, v6);
}

- (void)didCancelCollectionOnExtension:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "did cancel collection but found no promise for DE identifier", v2, v3, v4, v5, v6);
}

- (void)uploadTask:didCompleteWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "finished upload but found no promise for  [%{public}@]", v1, 0xCu);
}

- (void)uploadTask:(void *)a1 didCompleteWithError:.cold.2(void *a1)
{
  [a1 taskIdentifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v1, v2, "Upload Task: [%lu] error: %{public}@", v3, v4, v5, v6, v7);
}

- (void)uploadTask:(void *)a1 didSendBytes:(void *)a2 totalBytesExpectedToSend:.cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 session];
  uint64_t v4 = [v3 identifier];
  [a2 taskIdentifier];
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v5, v6, "[%{public}@] No Upload Item for task: [%lu]", v7, v8, v9, v10, 2u);
}

- (void)shouldReportProgress
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "totalUploadSize is zero, will not send progress updates", v1, 2u);
}

- (void)prepareUpload:forSubmissionWithSession:metadata:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "archiveDirectoryAt error", v2, v3, v4, v5, v6);
}

- (void)prepareUpload:(void *)a1 forSubmissionWithSession:metadata:.cold.4(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "Error serializing filer token: %@", v4, v5, v6, v7, v8);
}

- (void)prepareUpload:forSubmissionWithSession:metadata:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "copyallFiles error", v2, v3, v4, v5, v6);
}

- (void)prepareUpload:(void *)a1 forSubmissionWithSession:metadata:.cold.6(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "prepare upload error [%{public}@]", v4, v5, v6, v7, v8);
}

- (void)prepareUpload:forSubmissionWithSession:metadata:.cold.12()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "_preparing upload for %@", v1, 0xCu);
}

- (void)archiveItemsInDirectory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "Failed to initialize archive at [%{public}@]", v1, 0xCu);
}

- (void)archiveItemsInDirectory:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 path];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "archiveItemsInDirectory [%{public}@]", v4, 0xCu);
}

@end