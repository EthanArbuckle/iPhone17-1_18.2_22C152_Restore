@interface HFAccessoryDiagnosticsUploadManager
+ (NSString)backgroundURLSessionIdentifier;
+ (id)sharedManager;
- (BOOL)_didPreviouslySubmitLog:(id)a3;
- (BOOL)_isValidFilenameIdentifier:(id)a3;
- (BOOL)_needsToPurgeOldLogs;
- (HFAccessoryDiagnosticsUploadManager)init;
- (NSMutableDictionary)diagnosticItems;
- (NSMutableOrderedSet)pendingIdentifiers;
- (NSMutableSet)failedUploadIdentifiers;
- (NSMutableSet)uploadedIdentifiers;
- (NSURLSession)backgroundSession;
- (id)_nextFilenameIdentifierToProcess;
- (id)backgroundUrlSessionCompletionHandler;
- (id)filePathForIdentifier:(id)a3;
- (id)fileURLForIdentifier:(id)a3;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)_addToPendingUploads:(id)a3;
- (void)_cleanUpLocalFilesForIdentifier:(id)a3;
- (void)_failAttemptToUploadCurrentIdentifier;
- (void)_finalizeHandlingOfIdentifier:(id)a3;
- (void)_submitNextPendingLog;
- (void)_updatePreviousLogIdentifiers:(id)a3 forKey:(id)a4;
- (void)purgeStaleSubmittedLogs;
- (void)resumeServiceForURLSessionIdentifier:(id)a3;
- (void)setBackgroundSession:(id)a3;
- (void)setBackgroundUrlSessionCompletionHandler:(id)a3;
- (void)setDiagnosticItems:(id)a3;
- (void)setFailedUploadIdentifiers:(id)a3;
- (void)setPendingIdentifiers:(id)a3;
- (void)setUploadedIdentifiers:(id)a3;
- (void)updateLastPurgeDate;
- (void)uploadDiagnosticLogUsingItem:(id)a3;
- (void)willResignActive:(id)a3;
@end

@implementation HFAccessoryDiagnosticsUploadManager

+ (id)sharedManager
{
  if (qword_26AB2EE18 != -1) {
    dispatch_once(&qword_26AB2EE18, &__block_literal_global_34);
  }
  v2 = (void *)_MergedGlobals_228;
  return v2;
}

uint64_t __52__HFAccessoryDiagnosticsUploadManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(HFAccessoryDiagnosticsUploadManager);
  uint64_t v1 = _MergedGlobals_228;
  _MergedGlobals_228 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFAccessoryDiagnosticsUploadManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)HFAccessoryDiagnosticsUploadManager;
  v2 = [(HFAccessoryDiagnosticsUploadManager *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9B0] orderedSet];
    pendingIdentifiers = v2->_pendingIdentifiers;
    v2->_pendingIdentifiers = (NSMutableOrderedSet *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    uploadedIdentifiers = v2->_uploadedIdentifiers;
    v2->_uploadedIdentifiers = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    failedUploadIdentifiers = v2->_failedUploadIdentifiers;
    v2->_failedUploadIdentifiers = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    diagnosticItems = v2->_diagnosticItems;
    v2->_diagnosticItems = (NSMutableDictionary *)v9;

    v11 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Accessory Diagnostics Upload service started", v15, 2u);
    }

    v12 = +[HFAccessoryDiagnosticsUploadManager backgroundURLSessionIdentifier];
    [(HFAccessoryDiagnosticsUploadManager *)v2 resumeServiceForURLSessionIdentifier:v12];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v2 selector:sel_willResignActive_ name:*MEMORY[0x263F1D0D8] object:0];
  }
  return v2;
}

- (void)resumeServiceForURLSessionIdentifier:(id)a3
{
  id v10 = a3;
  v4 = [(HFAccessoryDiagnosticsUploadManager *)self backgroundSession];
  uint64_t v5 = [v4 configuration];
  v6 = [v5 identifier];
  char v7 = [v6 isEqualToString:v10];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x263F08C00] backgroundSessionConfigurationWithIdentifier:v10];
    uint64_t v9 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v8 delegate:self delegateQueue:0];
    [(HFAccessoryDiagnosticsUploadManager *)self setBackgroundSession:v9];
  }
}

+ (NSString)backgroundURLSessionIdentifier
{
  return (NSString *)@"com.apple.home.accessoryDiagnosticsServiceIdentifier";
}

- (void)uploadDiagnosticLogUsingItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([v5 isEligibleForUpload] & 1) == 0)
  {
    objc_super v16 = [MEMORY[0x263F08690] currentHandler];
    v17 = [v5 filename];
    [v16 handleFailureInMethod:a2, self, @"HFAccessoryDiagnosticsUploadManager.m", 102, @"Attempting to upload a diagnostic item that is not eligible for uploading. Log: (%@)", v17 object file lineNumber description];
  }
  v6 = [v5 filename];
  BOOL v7 = [(HFAccessoryDiagnosticsUploadManager *)self _didPreviouslySubmitLog:v6];

  if (!v7)
  {
    v8 = [v5 filename];
    uint64_t v9 = [v5 metadata];
    id v10 = [(HFAccessoryDiagnosticsUploadManager *)self diagnosticItems];
    [v10 setObject:v9 forKeyedSubscript:v8];

    [(HFAccessoryDiagnosticsUploadManager *)self _addToPendingUploads:v8];
    v11 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v5 metadata];
      v13 = [v12 uploadDestination];
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Accessory Diagnostics upload requested for log %@  to URL %@", buf, 0x16u);
    }
  }
  v14 = [(HFAccessoryDiagnosticsUploadManager *)self pendingIdentifiers];
  unint64_t v15 = [v14 count];

  if (v15 <= 1) {
    [(HFAccessoryDiagnosticsUploadManager *)self _submitNextPendingLog];
  }
}

- (id)fileURLForIdentifier:(id)a3
{
  uint64_t v3 = [(HFAccessoryDiagnosticsUploadManager *)self filePathForIdentifier:a3];
  if (v3)
  {
    v4 = [NSURL fileURLWithPath:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)filePathForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryDiagnosticsUploadManager *)self diagnosticItems];
  v6 = [v5 objectForKey:v4];

  BOOL v7 = [v6 snapshotPath];

  return v7;
}

- (id)_nextFilenameIdentifierToProcess
{
  v2 = [(HFAccessoryDiagnosticsUploadManager *)self pendingIdentifiers];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (void)_submitNextPendingLog
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HFAccessoryDiagnosticsUploadManager *)self _nextFilenameIdentifierToProcess];
  if (v3)
  {
    id v4 = [(HFAccessoryDiagnosticsUploadManager *)self diagnosticItems];
    id v5 = [v4 objectForKey:v3];

    v6 = [v5 snapshotPath];
    BOOL v7 = [v5 hf_serviceURLWithParameters];
    if (v7 && v6)
    {
      v8 = HFLogForCategory(1uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v6;
        __int16 v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Preparing to upload %@ to %@", buf, 0x16u);
      }

      uint64_t v9 = [v6 lastPathComponent];
      id v10 = NSTemporaryDirectory();
      v11 = [v10 stringByAppendingPathComponent:v9];

      v12 = [MEMORY[0x263F08850] defaultManager];
      v25 = v12;
      v26 = (void *)v9;
      if ([v12 fileExistsAtPath:v11])
      {
        v24 = 0;
      }
      else
      {
        id v27 = 0;
        char v13 = [v12 copyItemAtPath:v6 toPath:v11 error:&v27];
        id v14 = v27;
        v24 = v14;
        if ((v13 & 1) == 0)
        {
          id v15 = v14;
          objc_super v16 = HFLogForCategory(1uLL);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v29 = v6;
            __int16 v30 = 2112;
            v31 = v11;
            __int16 v32 = 2112;
            id v33 = v15;
            _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Copying %@ to %@ failed:%@", buf, 0x20u);
          }
        }
      }
      v17 = [NSURL fileURLWithPath:v11];
      v18 = NSString;
      v19 = [v17 lastPathComponent];
      __int16 v20 = [v18 stringWithFormat:@"attachment filename=\"%@\"", v19];;

      v21 = [MEMORY[0x263F089E0] requestWithURL:v7];
      [v21 setHTTPMethod:@"POST"];
      [v21 setValue:@"application/zip" forHTTPHeaderField:@"Content-Type"];
      [v21 setValue:v20 forHTTPHeaderField:@"Content-Disposition"];
      uint64_t v22 = [(HFAccessoryDiagnosticsUploadManager *)self backgroundSession];
      v23 = [v22 uploadTaskWithRequest:v21 fromFile:v17];

      [v23 setTaskDescription:v3];
      [v23 resume];
    }
  }
  else
  {
    id v5 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "No pending logs to upload.", buf, 2u);
    }
  }
}

- (void)_addToPendingUploads:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HFAccessoryDiagnosticsUploadManager *)self pendingIdentifiers];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 count];
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Adding log:%@ to Accessory Diagnostics upload service pending queue %lu.", (uint8_t *)&v8, 0x16u);
  }
  BOOL v7 = [(HFAccessoryDiagnosticsUploadManager *)self pendingIdentifiers];
  [v7 addObject:v4];
}

- (BOOL)_didPreviouslySubmitLog:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFAccessoryDiagnosticsUploadManager *)self pendingIdentifiers];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    BOOL v7 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      int v8 = "Previously submitted. Pending identifiers contains log: %@";
LABEL_10:
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v9 = [(HFAccessoryDiagnosticsUploadManager *)self failedUploadIdentifiers];
    int v10 = [v9 containsObject:v4];

    if (v10)
    {
      BOOL v7 = HFLogForCategory(1uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v4;
        int v8 = "Previously submitted. Failed identifiers contains log: %@";
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v11 = [(HFAccessoryDiagnosticsUploadManager *)self uploadedIdentifiers];
      int v12 = [v11 containsObject:v4];

      if (!v12)
      {
        BOOL v13 = 0;
        goto LABEL_12;
      }
      BOOL v7 = HFLogForCategory(1uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v4;
        int v8 = "Previously submitted. Uploaded identifiers contains log: %@";
        goto LABEL_10;
      }
    }
  }

  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (void)_failAttemptToUploadCurrentIdentifier
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HFAccessoryDiagnosticsUploadManager__failAttemptToUploadCurrentIdentifier__block_invoke;
  block[3] = &unk_26408DDE0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__HFAccessoryDiagnosticsUploadManager__failAttemptToUploadCurrentIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) pendingIdentifiers];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) pendingIdentifiers];
    [v4 removeObject:v3];

    id v5 = [*(id *)(a1 + 32) failedUploadIdentifiers];
    [v5 addObject:v3];

    int v6 = *(void **)(a1 + 32);
    BOOL v7 = [v6 failedUploadIdentifiers];
    [v6 _updatePreviousLogIdentifiers:v7 forKey:@"HFAccessoryDiagnosticsFailed"];

    int v8 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      int v10 = v3;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Attempting next upload after failure to upload:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _submitNextPendingLog];
}

- (void)_finalizeHandlingOfIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__HFAccessoryDiagnosticsUploadManager__finalizeHandlingOfIdentifier___block_invoke;
  v6[3] = &unk_26408D450;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __69__HFAccessoryDiagnosticsUploadManager__finalizeHandlingOfIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingIdentifiers];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) failedUploadIdentifiers];
  [v3 removeObject:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) uploadedIdentifiers];
  [v4 addObject:*(void *)(a1 + 40)];

  id v5 = *(void **)(a1 + 32);
  int v6 = [v5 uploadedIdentifiers];
  [v5 _updatePreviousLogIdentifiers:v6 forKey:@"HFAccessoryDiagnosticsUploaded"];

  id v7 = *(void **)(a1 + 32);
  return [v7 _submitNextPendingLog];
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  int v8 = HFLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Received auth challenge:%@", (uint8_t *)&v9, 0xCu);
  }

  v7[2](v7, 1, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a4;
  if (a6 == a7)
  {
    uint64_t v11 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v10 taskDescription];
      int v14 = 138412546;
      int v15 = v12;
      __int16 v16 = 2048;
      int64_t v17 = a6;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Finished uploading task %@ of size:%lld", (uint8_t *)&v14, 0x16u);
    }
    BOOL v13 = [v10 taskDescription];
    [(HFAccessoryDiagnosticsUploadManager *)self _finalizeHandlingOfIdentifier:v13];
  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFAccessoryDiagnosticsUploadManager *)self pendingIdentifiers];
  uint64_t v6 = [v5 count];

  id v7 = HFLogForCategory(1uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Finished uploading task in background. Submitting next identifier.", (uint8_t *)&v12, 2u);
    }

    int v9 = [(HFAccessoryDiagnosticsUploadManager *)self _nextFilenameIdentifierToProcess];
    [(HFAccessoryDiagnosticsUploadManager *)self _finalizeHandlingOfIdentifier:v9];
  }
  else
  {
    if (v8)
    {
      id v10 = [v4 configuration];
      uint64_t v11 = [v10 identifier];
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      int v15 = v11;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Did finish all events for background url session:%@ identifier:%@", (uint8_t *)&v12, 0x16u);
    }
    int v9 = [(HFAccessoryDiagnosticsUploadManager *)self backgroundUrlSessionCompletionHandler];
    v9[2]();
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  int v9 = [v7 response];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v8)
  {
    int v12 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v7 taskDescription];
      int v17 = 138412546;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = (uint64_t)v8;
      __int16 v14 = "Unable to complete task:%@ with error:%@";
LABEL_16:
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v17, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ([v11 statusCode] < 200 || objc_msgSend(v11, "statusCode") >= 206)
  {
    int v12 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v7 taskDescription];
      int v17 = 138412546;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = [v11 statusCode];
      __int16 v14 = "Unable to complete task:%@ with statusCode:%ld";
      goto LABEL_16;
    }
LABEL_10:

    [(HFAccessoryDiagnosticsUploadManager *)self _failAttemptToUploadCurrentIdentifier];
    goto LABEL_11;
  }
  int v15 = HFLogForCategory(1uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v7 taskDescription];
    int v17 = 138412546;
    uint64_t v18 = v16;
    __int16 v19 = 2048;
    uint64_t v20 = [v11 statusCode];
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Did complete task:%@ with response:%ld", (uint8_t *)&v17, 0x16u);
  }
LABEL_11:
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = HFLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Session %@ Did Become Invalid with error:%@", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)_isValidFilenameIdentifier:(id)a3
{
  uint64_t v3 = [(HFAccessoryDiagnosticsUploadManager *)self filePathForIdentifier:a3];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

- (void)willResignActive:(id)a3
{
  id v4 = HFLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Resigning app.", v5, 2u);
  }

  [(HFAccessoryDiagnosticsUploadManager *)self purgeStaleSubmittedLogs];
}

- (void)purgeStaleSubmittedLogs
{
  if ([(HFAccessoryDiagnosticsUploadManager *)self _needsToPurgeOldLogs])
  {
    uint64_t v3 = [(HFAccessoryDiagnosticsUploadManager *)self uploadedIdentifiers];
    [(HFAccessoryDiagnosticsUploadManager *)self _updatePreviousLogIdentifiers:v3 forKey:@"HFAccessoryDiagnosticsUploaded"];

    id v4 = [(HFAccessoryDiagnosticsUploadManager *)self failedUploadIdentifiers];
    [(HFAccessoryDiagnosticsUploadManager *)self _updatePreviousLogIdentifiers:v4 forKey:@"HFAccessoryDiagnosticsFailed"];

    [(HFAccessoryDiagnosticsUploadManager *)self updateLastPurgeDate];
  }
}

- (BOOL)_needsToPurgeOldLogs
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 valueForKey:@"HFAccessoryDiagnosticsLastCheckedDate"];
  if (v3)
  {
    id v4 = [MEMORY[0x263EFF910] date];
    [v4 timeIntervalSinceDate:v3];
    BOOL v6 = v5 > 86400.0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)updateLastPurgeDate
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v2 = [MEMORY[0x263EFF910] date];
  [v3 setObject:v2 forKey:@"HFAccessoryDiagnosticsLastCheckedDate"];
}

- (void)_updatePreviousLogIdentifiers:(id)a3 forKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263EFF910] date];
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  __int16 v10 = [v9 valueForKey:v7];
  if (v10) {
    [v6 addObjectsFromArray:v10];
  }
  id v11 = HFLogForCategory(1uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = [v6 count];
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Begin update for previous identifiers with key: %@ with count: %lu", buf, 0x16u);
  }

  uint64_t v12 = [MEMORY[0x263EFF980] array];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__HFAccessoryDiagnosticsUploadManager__updatePreviousLogIdentifiers_forKey___block_invoke;
  v17[3] = &unk_26408F860;
  v17[4] = self;
  id v18 = v8;
  id v13 = v12;
  id v19 = v13;
  id v14 = v8;
  [v6 enumerateObjectsUsingBlock:v17];
  int v15 = HFLogForCategory(1uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v13 count];
    *(_DWORD *)buf = 138412546;
    id v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v16;
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Finish update for previous identifiers with key: %@ with count: %lu", buf, 0x16u);
  }

  [v6 removeAllObjects];
  [v6 addObjectsFromArray:v13];
  [v9 setObject:v13 forKey:v7];
}

void __76__HFAccessoryDiagnosticsUploadManager__updatePreviousLogIdentifiers_forKey___block_invoke(id *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] fileURLForIdentifier:v3];
  id v14 = 0;
  uint64_t v5 = *MEMORY[0x263EFF610];
  id v13 = 0;
  int v6 = [v4 getResourceValue:&v14 forKey:v5 error:&v13];
  id v7 = v14;
  id v8 = v13;
  if (v6 && ([a1[5] timeIntervalSinceDate:v7], v9 < 864000.0))
  {
    __int16 v10 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "NOT purging %@ with date = %@", buf, 0x16u);
    }

    [a1[6] addObject:v3];
  }
  else
  {
    id v11 = HFLogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Purging expired identifier %@ with date = %@", buf, 0x16u);
    }

    [a1[4] _cleanUpLocalFilesForIdentifier:v3];
    uint64_t v12 = [a1[4] diagnosticItems];
    [v12 removeObjectForKey:v3];
  }
}

- (void)_cleanUpLocalFilesForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HFAccessoryDiagnosticsUploadManager *)self filePathForIdentifier:a3];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v7 = 0;
    [v4 removeItemAtPath:v3 error:&v7];
    id v5 = v7;
    if (v5)
    {
      int v6 = HFLogForCategory(1uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v9 = v3;
        __int16 v10 = 2112;
        id v11 = v5;
        _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Failure to clean up file:%@ with error:%@", buf, 0x16u);
      }
    }
  }
}

- (id)backgroundUrlSessionCompletionHandler
{
  return self->_backgroundUrlSessionCompletionHandler;
}

- (void)setBackgroundUrlSessionCompletionHandler:(id)a3
{
}

- (NSMutableDictionary)diagnosticItems
{
  return self->_diagnosticItems;
}

- (void)setDiagnosticItems:(id)a3
{
}

- (NSMutableOrderedSet)pendingIdentifiers
{
  return self->_pendingIdentifiers;
}

- (void)setPendingIdentifiers:(id)a3
{
}

- (NSMutableSet)failedUploadIdentifiers
{
  return self->_failedUploadIdentifiers;
}

- (void)setFailedUploadIdentifiers:(id)a3
{
}

- (NSMutableSet)uploadedIdentifiers
{
  return self->_uploadedIdentifiers;
}

- (void)setUploadedIdentifiers:(id)a3
{
}

- (NSURLSession)backgroundSession
{
  return self->_backgroundSession;
}

- (void)setBackgroundSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_uploadedIdentifiers, 0);
  objc_storeStrong((id *)&self->_failedUploadIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingIdentifiers, 0);
  objc_storeStrong((id *)&self->_diagnosticItems, 0);
  objc_storeStrong(&self->_backgroundUrlSessionCompletionHandler, 0);
}

@end