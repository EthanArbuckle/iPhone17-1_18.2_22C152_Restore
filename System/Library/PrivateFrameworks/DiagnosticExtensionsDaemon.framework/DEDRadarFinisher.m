@interface DEDRadarFinisher
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
- (BOOL)allUploadsComplete;
- (BOOL)allVerificationTasksComplete;
- (DEDBugSession)session;
- (DEDBugSessionConfiguration)configuration;
- (DEDRadarFinisher)initWithCoder:(id)a3;
- (DEDRadarFinisher)initWithConfiguration:(id)a3 session:(id)a4;
- (NSMutableSet)uploadItems;
- (NSMutableSet)verificationTasks;
- (NSURLSession)urlSession;
- (OS_os_log)log;
- (float)percentComplete;
- (id)createUploadTaskForAttachment:(id)a3 atRadarURL:(id)a4;
- (id)folderNameForAttachmentGroup:(id)a3;
- (id)getUploadItemForTask:(id)a3;
- (id)getVerificationTaskForDataTask:(id)a3;
- (int)retryAttemptCount;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)finishRadarUploadSession;
- (void)finishSession:(id)a3 withConfiguration:(id)a4;
- (void)processVerifyTaskResults;
- (void)setConfiguration:(id)a3;
- (void)setLog:(id)a3;
- (void)setPercentComplete:(float)a3;
- (void)setRetryAttemptCount:(int)a3;
- (void)setSession:(id)a3;
- (void)setUploadItems:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)setVerificationTasks:(id)a3;
- (void)startAttachmentVerificationTasks;
@end

@implementation DEDRadarFinisher

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDRadarFinisher)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DEDRadarFinisher;
  return [(DEDRadarFinisher *)&v4 init];
}

- (DEDRadarFinisher)initWithConfiguration:(id)a3 session:(id)a4
{
  id v5 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DEDRadarFinisher;
  v6 = [(DEDRadarFinisher *)&v12 init];
  if (v6)
  {
    v7 = +[DEDConfiguration sharedInstance];
    os_log_t v8 = os_log_create((const char *)[v7 loggingSubsystem], "ded-radar-finisher");
    [(DEDRadarFinisher *)v6 setLog:v8];

    [(DEDRadarFinisher *)v6 setSession:v5];
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(DEDRadarFinisher *)v6 setUploadItems:v9];

    id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(DEDRadarFinisher *)v6 setVerificationTasks:v10];
  }
  return v6;
}

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (void)finishSession:(id)a3 withConfiguration:(id)a4
{
  v104[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = [(DEDRadarFinisher *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Starting Tap-to-Radar finishSession...", buf, 2u);
  }

  id v9 = [(DEDRadarFinisher *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 radarProblemID];
    *(_DWORD *)buf = 138543362;
    v98 = v10;
    _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "config.radarProblemID = %{public}@", buf, 0xCu);
  }
  v11 = [(DEDRadarFinisher *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = [v7 radarAuthToken];
    *(_DWORD *)buf = 138543362;
    v98 = v12;
    _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "config.radarAuthToken = %{public}@", buf, 0xCu);
  }
  uint64_t v13 = [v7 radarProblemID];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [v7 radarAuthToken];

    if (v15)
    {
      [(DEDRadarFinisher *)self setSession:v6];
      [(DEDRadarFinisher *)self setConfiguration:v7];
      [(DEDRadarFinisher *)self setPercentComplete:0.0];
      [(DEDRadarFinisher *)self setRetryAttemptCount:0];
      id v16 = objc_alloc_init(MEMORY[0x263F08A48]);
      [v16 setQualityOfService:25];
      [v16 setMaxConcurrentOperationCount:1];
      v17 = (void *)MEMORY[0x263F08C00];
      v18 = [v6 identifier];
      v19 = [v17 backgroundSessionConfigurationWithIdentifier:v18];

      [v19 setUpDataUsageWithConfiguration:v7];
      [v19 setRequestCachePolicy:1];
      v103[0] = @"Accept";
      v103[1] = @"Content-Type";
      v104[0] = @"application/json";
      v104[1] = @"application/json; charset=utf-8";
      v103[2] = @"Radar-Authentication";
      v20 = [v7 radarAuthToken];
      v104[2] = v20;
      v21 = [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:3];
      [v19 setHTTPAdditionalHeaders:v21];

      v76 = v19;
      v77 = v16;
      v22 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v19 delegate:self delegateQueue:v16];
      [(DEDRadarFinisher *)self setUrlSession:v22];

      id v23 = [NSString alloc];
      v24 = [v7 radarProblemID];
      v25 = (void *)[v23 initWithFormat:@"Tap-to-Radar upload for rdar://%@ via diagnosticextensionsd", v24];
      [(DEDRadarFinisher *)self urlSession];
      v27 = v26 = v6;
      [v27 setSessionDescription:v25];

      v28 = objc_alloc_init(DEDDiagnosticCollector);
      uint64_t v29 = [(DEDDiagnosticCollector *)v28 availableDiagnosticExtensions];

      v30 = objc_opt_new();
      v78 = v26;
      v31 = [v26 identifier];
      v75 = (void *)v29;
      v32 = [v30 collectedGroupsWithSessionIdentifier:v31 matchingExtensions:v29];

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id obj = v32;
      uint64_t v81 = [obj countByEnumeratingWithState:&v93 objects:v102 count:16];
      if (!v81) {
        goto LABEL_41;
      }
      uint64_t v80 = *(void *)v94;
      id v83 = v7;
      while (1)
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v94 != v80) {
            objc_enumerationMutation(obj);
          }
          uint64_t v82 = v33;
          v34 = *(void **)(*((void *)&v93 + 1) + 8 * v33);
          v87 = [(DEDRadarFinisher *)self folderNameForAttachmentGroup:v34];
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          v35 = (void *)MEMORY[0x263F3A0A0];
          v36 = [v34 rootURL];
          v37 = [v35 findAllfiles:v36];

          id v84 = v37;
          uint64_t v86 = [v37 countByEnumeratingWithState:&v89 objects:v101 count:16];
          if (v86)
          {
            uint64_t v85 = *(void *)v90;
            do
            {
              uint64_t v38 = 0;
              do
              {
                if (*(void *)v90 != v85) {
                  objc_enumerationMutation(v84);
                }
                v39 = *(void **)(*((void *)&v89 + 1) + 8 * v38);
                v40 = [(DEDRadarFinisher *)self log];
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v98 = v39;
                  _os_log_impl(&dword_21FE04000, v40, OS_LOG_TYPE_DEFAULT, "Starting upload for %{public}@", buf, 0xCu);
                }

                v41 = [v39 lastPathComponent];
                v42 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
                v43 = [v41 stringByAddingPercentEncodingWithAllowedCharacters:v42];

                v44 = [NSURL URLWithString:@"https://radar-webservices-ext.apple.com"];
                v45 = NSString;
                v46 = [v7 radarProblemID];
                v47 = [v45 stringWithFormat:@"problems/%@/attachments/%@/%@", v46, v87, v43];
                v48 = [v44 URLByAppendingPathComponent:v47];

                v49 = [(DEDRadarFinisher *)self log];
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v98 = v48;
                  _os_log_impl(&dword_21FE04000, v49, OS_LOG_TYPE_DEFAULT, "Calculated Radar API URL: %{public}@", buf, 0xCu);
                }

                id v88 = 0;
                char v50 = [v39 checkResourceIsReachableAndReturnError:&v88];
                id v51 = v88;
                if (v50)
                {
                  v52 = self;
                  v53 = [MEMORY[0x263F08850] defaultManager];
                  v54 = [v39 path];
                  v55 = [v53 attributesOfItemAtPath:v54 error:0];
                  uint64_t v56 = [v55 fileSize];

                  self = v52;
                  if (v56)
                  {
                    v57 = [(DEDRadarFinisher *)v52 createUploadTaskForAttachment:v39 atRadarURL:v48];
                    v58 = [[DEDRadarUploadItem alloc] initWithUploadTask:v57 andAttachment:v39];
                    v59 = NSString;
                    v60 = [v39 lastPathComponent];
                    v61 = [v59 stringWithFormat:@"%@/%@", v87, v60];
                    [(DEDRadarUploadItem *)v58 setRadarAttachmentName:v61];

                    [(DEDRadarUploadItem *)v58 setRadarURL:v48];
                    v62 = [(DEDRadarFinisher *)v52 uploadItems];
                    [v62 addObject:v58];

                    v63 = [(DEDRadarFinisher *)v52 log];
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                    {
                      v64 = [(DEDRadarFinisher *)v52 uploadItems];
                      *(_DWORD *)buf = 138543362;
                      v98 = v64;
                      _os_log_impl(&dword_21FE04000, v63, OS_LOG_TYPE_DEFAULT, "self.uploadItems: %{public}@", buf, 0xCu);
                    }
                    [v57 resume];

                    goto LABEL_28;
                  }
                  v57 = [(DEDRadarFinisher *)v52 log];
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v98 = v39;
                    _os_log_error_impl(&dword_21FE04000, v57, OS_LOG_TYPE_ERROR, "File at URL %{public}@ is zero bytes in size, skipping", buf, 0xCu);
LABEL_28:
                    id v7 = v83;
                    goto LABEL_35;
                  }
                  id v7 = v83;
                }
                else
                {
                  v57 = [(DEDRadarFinisher *)self log];
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
                  {
                    uint64_t v65 = [v51 localizedDescription];
                    v66 = (void *)v65;
                    *(_DWORD *)buf = 138543618;
                    v67 = @"unknown";
                    if (v65) {
                      v67 = (__CFString *)v65;
                    }
                    v98 = v39;
                    __int16 v99 = 2114;
                    v100 = v67;
                    _os_log_fault_impl(&dword_21FE04000, v57, OS_LOG_TYPE_FAULT, "File at URL %{public}@ encountered reachable error: %{public}@, skipping", buf, 0x16u);
                  }
                }
LABEL_35:

                ++v38;
              }
              while (v86 != v38);
              uint64_t v68 = [v84 countByEnumeratingWithState:&v89 objects:v101 count:16];
              uint64_t v86 = v68;
            }
            while (v68);
          }

          uint64_t v33 = v82 + 1;
        }
        while (v82 + 1 != v81);
        uint64_t v81 = [obj countByEnumeratingWithState:&v93 objects:v102 count:16];
        if (!v81)
        {
LABEL_41:

          v69 = [(DEDRadarFinisher *)self uploadItems];
          uint64_t v70 = [v69 count];

          id v6 = v78;
          if (!v70)
          {
            v71 = [(DEDRadarFinisher *)self log];
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21FE04000, v71, OS_LOG_TYPE_DEFAULT, "No attachments were sent to radar finisher", buf, 2u);
            }

            v72 = [(DEDRadarFinisher *)self session];
            [v72 uploadProgress:1 total:1];

            v73 = [(DEDRadarFinisher *)self session];
            [v73 didFinishAllUploads];
          }
          goto LABEL_49;
        }
      }
    }
  }
  v74 = [(DEDRadarFinisher *)self log];
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
    -[DEDRadarFinisher finishSession:withConfiguration:]();
  }

  [v6 didFinishAllUploads];
LABEL_49:
}

- (id)createUploadTaskForAttachment:(id)a3 atRadarURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F089E0] requestWithURL:a4 cachePolicy:1 timeoutInterval:120.0];
  [v7 setHTTPMethod:@"PUT"];
  [v7 addValue:@"true" forHTTPHeaderField:@"X-Override-File"];
  os_log_t v8 = [(DEDRadarFinisher *)self urlSession];
  id v9 = [v8 uploadTaskWithRequest:v7 fromFile:v6];

  id v10 = [(DEDRadarFinisher *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Starting upload for %{public}@ with task: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

- (id)folderNameForAttachmentGroup:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[DEDDevice currentDeviceWithDaemonInfo];
  id v5 = [v4 name];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"/" withString:@"∕"];

  id v7 = [v6 stringByReplacingOccurrencesOfString:@"?" withString:@"﹖"];

  os_log_t v8 = [v7 stringByReplacingOccurrencesOfString:@"|" withString:@"｜"];

  id v9 = v8;
  if ([v4 mediaSystemRole] == 2)
  {
    id v10 = @" (L)";
  }
  else
  {
    v11 = v9;
    if ([v4 mediaSystemRole] != 3) {
      goto LABEL_6;
    }
    id v10 = @" (R)";
  }
  v11 = [v9 stringByAppendingString:v10];

LABEL_6:
  id v12 = [v4 deviceClass];

  if (v9 != v12)
  {
    id v13 = [v4 deviceClass];
    uint64_t v14 = [v11 stringByAppendingFormat:@" - %@", v13];

    v11 = (void *)v14;
  }
  v15 = [v4 hardwareCodename];
  uint64_t v16 = [v4 build];
  v17 = [v11 stringByAppendingFormat:@" (%@) - %@", v15, v16];

  v18 = [v3 extensionID];
  LODWORD(v15) = [v18 isEqualToString:@"com.apple.DiagnosticExtensions.sysdiagnose"];

  if (v15)
  {
    id v19 = v17;
  }
  else
  {
    v20 = [v3 displayName];
    v21 = [v20 stringByReplacingOccurrencesOfString:@"log" withString:@"Log"];

    id v19 = [NSString stringWithFormat:@"%@/%@", v17, v21];
  }
  return v19;
}

- (id)getUploadItemForTask:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(DEDRadarFinisher *)self uploadItems];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v9 taskIdentifier];
        if (v10 == [v4 taskIdentifier])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)allUploadsComplete
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(DEDRadarFinisher *)self uploadItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isUploaded])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)getVerificationTaskForDataTask:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(DEDRadarFinisher *)self verificationTasks];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 dataTask];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)allVerificationTasksComplete
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(DEDRadarFinisher *)self verificationTasks];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isFinished])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)startAttachmentVerificationTasks
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Max number of retries hit in finisher. Ending upload session.", v2, v3, v4, v5, v6);
}

- (void)processVerifyTaskResults
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Hit an error while attempting to verify attachments; skipping verification",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [v5 response];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    os_log_t v8 = [v5 response];
    unint64_t v9 = [v8 statusCode] - 299;

    if (v9 <= 0xFFFFFFFFFFFFFF9CLL)
    {
      long long v10 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_3(v5);
      }
LABEL_12:

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_24;
    }
  }
  long long v11 = [v5 data];

  if (!v11)
  {
    long long v10 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_1();
    }
    goto LABEL_12;
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v13 = (void *)MEMORY[0x263F08900];
  uint64_t v14 = [v5 data];
  id v29 = 0;
  long long v15 = [v13 JSONObjectWithData:v14 options:4 error:&v29];
  id v16 = v29;

  if (v16)
  {
    uint64_t v17 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_2(v16);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v24 = v15;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [[DEDRadarAttachment alloc] initWithDictionary:*(void *)(*((void *)&v25 + 1) + 8 * v22)];
          if (v23) {
            [v12 addObject:v23];
          }

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v20);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) unionSet:v12];
    long long v15 = v24;
  }

LABEL_24:
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_167(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  long long v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_2;
  id v18 = &unk_26453A438;
  id v5 = v3;
  id v19 = v5;
  uint64_t v20 = &v21;
  [v4 enumerateObjectsUsingBlock:&v15];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v22[5])
  {
    BOOL v7 = objc_msgSend(v6, "log", v15, v16, v17, v18);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v8 = [*(id *)(a1 + 32) configuration];
      unint64_t v9 = [v8 radarProblemID];
      long long v10 = [v5 radarAttachmentName];
      *(_DWORD *)buf = 138543618;
      long long v28 = v9;
      __int16 v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Attachment verification (%{public}@): (SUCCESS) %{public}@", buf, 0x16u);
    }
  }
  else
  {
    long long v11 = objc_msgSend(v6, "log", v15, v16, v17, v18);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [*(id *)(a1 + 32) configuration];
      long long v13 = [v12 radarProblemID];
      uint64_t v14 = [v5 radarAttachmentName];
      *(_DWORD *)buf = 138543618;
      long long v28 = v13;
      __int16 v29 = 2114;
      v30 = v14;
      _os_log_error_impl(&dword_21FE04000, v11, OS_LOG_TYPE_ERROR, "Attachment verification (%{public}@): (FAILURE) %{public}@", buf, 0x16u);
    }
    [v5 setIsUploaded:0];
  }

  _Block_object_dispose(&v21, 8);
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  uint64_t v6 = [v9 fileName];
  BOOL v7 = [*(id *)(a1 + 32) radarAttachmentName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_170(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 isUploaded] & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v7 attachedPath];
    id v5 = [v7 radarURL];
    uint64_t v6 = [v3 createUploadTaskForAttachment:v4 atRadarURL:v5];

    [v7 setTotalBytesSent:0];
    objc_msgSend(v7, "setTaskIdentifier:", objc_msgSend(v6, "taskIdentifier"));
    [v6 resume];
  }
}

- (void)finishRadarUploadSession
{
  id v3 = [(DEDRadarFinisher *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "All attachments finished! Clean up time!", v7, 2u);
  }

  uint64_t v4 = [(DEDRadarFinisher *)self session];
  [v4 uploadProgress:1 total:1];

  id v5 = [(DEDRadarFinisher *)self urlSession];
  [v5 finishTasksAndInvalidate];

  uint64_t v6 = [(DEDRadarFinisher *)self session];
  [v6 didFinishAllUploads];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(DEDRadarFinisher *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v6;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "urlSessionTask complete: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  int v8 = [(DEDRadarFinisher *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 response];
    int v17 = 138543362;
    id v18 = v9;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v17, 0xCu);
  }
  long long v10 = [(DEDRadarFinisher *)self getUploadItemForTask:v6];
  long long v11 = [(DEDRadarFinisher *)self getVerificationTaskForDataTask:v6];
  id v12 = v11;
  if (v10)
  {
    [v10 setIsUploaded:1];
    long long v13 = [(DEDRadarFinisher *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v10;
      _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_DEFAULT, "Finished upload item: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v14 = [(DEDRadarFinisher *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(DEDRadarFinisher *)self uploadItems];
      int v17 = 138543362;
      id v18 = v15;
      _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_DEFAULT, "self.uploadItems: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    if ([(DEDRadarFinisher *)self allUploadsComplete]) {
      [(DEDRadarFinisher *)self startAttachmentVerificationTasks];
    }
  }
  else if (v11)
  {
    [v11 setIsFinished:1];
    uint64_t v16 = [(DEDRadarFinisher *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_21FE04000, v16, OS_LOG_TYPE_DEFAULT, "Finished verification task: %@", (uint8_t *)&v17, 0xCu);
    }

    if ([(DEDRadarFinisher *)self allVerificationTasksComplete]) {
      [(DEDRadarFinisher *)self processVerifyTaskResults];
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v10 = [(DEDRadarFinisher *)self getUploadItemForTask:a4];
  [v10 setTotalBytesSent:a6];
  [v10 setTotalBytesExpectedToSend:a7];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v11 = [(DEDRadarFinisher *)self uploadItems];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v11);
        }
        id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v15 += [v18 totalBytesSent];
        v14 += [v18 totalBytesExpectedToSend];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }

  int v19 = (int)(float)((float)((float)v15 / (float)v14) * 100.0);
  [(DEDRadarFinisher *)self percentComplete];
  if (v19 != (int)(float)(v20 * 100.0) && v19 != 100)
  {
    uint64_t v21 = [(DEDRadarFinisher *)self log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [(DEDRadarFinisher *)self session];
      uint64_t v23 = [v22 config];
      v24 = [v23 radarProblemID];
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      __int16 v33 = 1026;
      int v34 = (int)(float)((float)((float)v15 / (float)v14) * 100.0);
      _os_log_impl(&dword_21FE04000, v21, OS_LOG_TYPE_DEFAULT, "DEDRadarFinisher upload percentComplete (%{public}@): %{public}i%%", buf, 0x12u);
    }
    *(float *)&double v25 = (float)v15 / (float)v14;
    [(DEDRadarFinisher *)self setPercentComplete:v25];
    id v26 = [(DEDRadarFinisher *)self session];
    [v26 uploadProgress:v15 total:v14];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v12 = a5;
  id v7 = [(DEDRadarFinisher *)self getVerificationTaskForDataTask:a4];
  int v8 = v7;
  if (v7)
  {
    id v9 = [v7 data];

    if (v9)
    {
      long long v10 = [v8 data];
      long long v11 = (void *)[v10 mutableCopy];

      [v11 appendData:v12];
      [v8 setData:v11];
    }
    else
    {
      [v8 setData:v12];
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v12 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  long long v10 = [(DEDRadarFinisher *)self getVerificationTaskForDataTask:a4];
  long long v11 = v10;
  if (v10) {
    [v10 setResponse:v12];
  }
  v9[2](v9, 1);
}

- (DEDBugSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (DEDBugSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (DEDBugSessionConfiguration)configuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  return (DEDBugSessionConfiguration *)WeakRetained;
}

- (void)setConfiguration:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
}

- (float)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(float)a3
{
  self->_percentComplete = a3;
}

- (int)retryAttemptCount
{
  return self->_retryAttemptCount;
}

- (void)setRetryAttemptCount:(int)a3
{
  self->_retryAttemptCount = a3;
}

- (NSMutableSet)uploadItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUploadItems:(id)a3
{
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUrlSession:(id)a3
{
}

- (NSMutableSet)verificationTasks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVerificationTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationTasks, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_uploadItems, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_destroyWeak((id *)&self->_configuration);
  objc_destroyWeak((id *)&self->_session);
}

- (void)finishSession:withConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Can't perform finishSession as either the problem ID or auth token are nil", v2, v3, v4, v5, v6);
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Data response for verification task is nil", v2, v3, v4, v5, v6);
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "DEDRadarFinisher failed to deserialize attachments response: %{public}@", v4, v5, v6, v7, 2u);
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_3(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F088A0];
  uint64_t v2 = [a1 response];
  uint64_t v3 = objc_msgSend(v1, "localizedStringForStatusCode:", objc_msgSend(v2, "statusCode"));
  OUTLINED_FUNCTION_2(&dword_21FE04000, v4, v5, "Response headers for verification task indicate an invalid response code: %@", v6, v7, v8, v9, 2u);
}

@end