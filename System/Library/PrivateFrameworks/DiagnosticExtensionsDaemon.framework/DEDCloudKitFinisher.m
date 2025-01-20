@interface DEDCloudKitFinisher
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
- (BOOL)isCompressing;
- (BOOL)isUploading;
- (BOOL)sandboxEnvironment;
- (DEDBugSession)session;
- (DEDCloudKitAttachmentGroupModel)attachmentGroupModel;
- (DEDCloudKitClient)cloudKitClient;
- (DEDCloudKitFinisher)initWithCoder:(id)a3;
- (DEDCloudKitFinisher)initWithConfiguration:(id)a3 session:(id)a4;
- (ELSManager)elsManager;
- (NSDictionary)queuePayload;
- (NSMutableArray)attachments;
- (NSMutableDictionary)uploadedBytes;
- (NSString)timberLorryUUID;
- (OS_os_log)log;
- (id)additionalStateInfo;
- (id)createAttachmentGroupStatusWithAttachmentGroupModel:(id)a3;
- (id)createAttachmentGroupWithData:(id)a3;
- (id)createAttachmentModelWithURL:(id)a3 andQueueItem:(id)a4 attachmentGroupModel:(id)a5;
- (id)encryptLogsForExtensionIdentifier:(id)a3 withAttachmentUrl:(id)a4;
- (id)encryptLogsIfNecessary:(id)a3;
- (id)extractExtensionIdentifierFromAttachmentUrl:(id)a3;
- (id)getAttachmentURLs;
- (id)getAttachmentURLsWithProgressHandler:(id)a3;
- (id)parsePayloadData:(id)a3 forIdentifier:(id)a4;
- (int64_t)state;
- (unint64_t)totalUploadSize;
- (void)createAttachmentGroupStatusForAttachmentGroup:(id)a3 completionHandler:(id)a4;
- (void)didCancelCollectionOnExtension:(id)a3;
- (void)didCollectAttachmentGroup:(id)a3;
- (void)didFinishAllCollections;
- (void)didStartCollectingDiagnosticExtensionWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finishSession:(id)a3 withConfiguration:(id)a4;
- (void)localCleanup;
- (void)processAttachmentsWithRecord:(id)a3 withProgress:(double)a4;
- (void)setAttachmentGroupModel:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setCloudKitClient:(id)a3;
- (void)setElsManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueuePayload:(id)a3;
- (void)setSandboxEnvironment:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTimberLorryUUID:(id)a3;
- (void)setTotalUploadSize:(unint64_t)a3;
- (void)setUploadedBytes:(id)a3;
- (void)uploadAttachments:(id)a3 inAttachmentGroup:(id)a4 completionHandler:(id)a5;
- (void)writeData:(id)a3 filename:(id)a4;
@end

@implementation DEDCloudKitFinisher

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDCloudKitFinisher state](self, "state"), @"state");
}

- (DEDCloudKitFinisher)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DEDCloudKitFinisher;
  v5 = [(DEDCloudKitFinisher *)&v7 init];
  if (v5) {
    -[DEDCloudKitFinisher setState:](v5, "setState:", [v4 decodeIntegerForKey:@"state"]);
  }

  return v5;
}

- (DEDCloudKitFinisher)initWithConfiguration:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DEDCloudKitFinisher;
  v8 = [(DEDCloudKitFinisher *)&v15 init];
  v9 = v8;
  if (v8)
  {
    [(DEDCloudKitFinisher *)v8 setState:0];
    v10 = +[DEDConfiguration sharedInstance];
    os_log_t v11 = os_log_create((const char *)[v10 loggingSubsystem], "ded-cloudkit-finisher");
    [(DEDCloudKitFinisher *)v9 setLog:v11];

    [(DEDCloudKitFinisher *)v9 setSession:v7];
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(DEDCloudKitFinisher *)v9 setAttachments:v12];

    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(DEDCloudKitFinisher *)v9 setUploadedBytes:v13];

    -[DEDCloudKitFinisher setSandboxEnvironment:](v9, "setSandboxEnvironment:", [v6 cloudkitUseDevelopmentEnvironment]);
  }

  return v9;
}

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (void)finishSession:(id)a3 withConfiguration:(id)a4
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(DEDCloudKitFinisher *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 cloudkitContainer];
    *(_DWORD *)buf = 138543362;
    v77 = v9;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Starting CloudKit finishSession with container: %{public}@", buf, 0xCu);
  }
  v10 = [(DEDCloudKitFinisher *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [v7 allowsCellularUpload];
    *(_DWORD *)buf = 67240192;
    LODWORD(v77) = v11;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "allowsCellularUpload: %{public}d", buf, 8u);
  }

  [(DEDCloudKitFinisher *)self setState:1];
  id v12 = [v7 cloudkitContainer];

  if (v12)
  {
    id v13 = [MEMORY[0x263F3B748] sharedManager];
    [(DEDCloudKitFinisher *)self setElsManager:v13];

    [(DEDCloudKitFinisher *)self setSession:v6];
    [(DEDCloudKitFinisher *)self setTotalUploadSize:0];
    v14 = [[DEDCloudKitClient alloc] initWithBugSession:v6 configuration:v7];
    [(DEDCloudKitFinisher *)self setCloudKitClient:v14];

    objc_super v15 = [v7 cloudkitData];
    v16 = [v15 objectForKeyedSubscript:@"payload"];

    v59 = v16;
    [v16 dataUsingEncoding:4];
    v58 = v75[5] = 0;
    v17 = objc_msgSend(MEMORY[0x263F08900], "JSONObjectWithData:options:error:");
    id v18 = 0;
    [(DEDCloudKitFinisher *)self setQueuePayload:v17];

    if (v18)
    {
      v19 = [(DEDCloudKitFinisher *)self log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[DEDCloudKitFinisher finishSession:withConfiguration:]();
      }
    }
    id v57 = v18;
    id v61 = v6;
    v20 = [v7 cloudkitData];
    v21 = [v20 objectForKeyedSubscript:@"gigafilesToken"];
    [(DEDCloudKitFinisher *)self setTimberLorryUUID:v21];

    v22 = [v7 cloudkitData];
    v23 = [v22 objectForKeyedSubscript:@"enrollmentTicketNumber"];

    if (v23)
    {
      v24 = [v7 cloudkitData];
      v25 = [v24 objectForKeyedSubscript:@"enrollmentTicketNumber"];
      [(DEDCloudKitFinisher *)self setTimberLorryUUID:v25];
    }
    id v60 = v7;
    v26 = [v7 cloudkitData];
    v27 = [(DEDCloudKitFinisher *)self createAttachmentGroupWithData:v26];
    [(DEDCloudKitFinisher *)self setAttachmentGroupModel:v27];

    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __55__DEDCloudKitFinisher_finishSession_withConfiguration___block_invoke;
    v75[3] = &unk_26453B208;
    v75[4] = self;
    v56 = (void *)MEMORY[0x223C5FFB0](v75);
    v55 = [[DEDCompressionDebouncer alloc] initWithTrigger:v56 interval:1.0];
    v28 = [(DEDCompressionDebouncer *)v55 handler];
    v29 = [(DEDCloudKitFinisher *)self getAttachmentURLsWithProgressHandler:v28];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = v29;
    uint64_t v63 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v63)
    {
      uint64_t v62 = *(void *)v72;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v72 != v62) {
            objc_enumerationMutation(obj);
          }
          uint64_t v65 = v30;
          uint64_t v31 = *(void *)(*((void *)&v71 + 1) + 8 * v30);
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          v32 = [obj objectForKey:v31];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v67 objects:v82 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v68;
            do
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v68 != v35) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v37 = *(void *)(*((void *)&v67 + 1) + 8 * i);
                v38 = [(DEDCloudKitFinisher *)self uploadedBytes];
                v39 = [v38 allKeys];
                char v40 = [v39 containsObject:v37];

                if ((v40 & 1) == 0)
                {
                  v41 = [(DEDCloudKitFinisher *)self attachmentGroupModel];
                  v42 = [(DEDCloudKitFinisher *)self createAttachmentModelWithURL:v37 andQueueItem:v31 attachmentGroupModel:v41];

                  v43 = [(DEDCloudKitFinisher *)self attachments];
                  [v43 addObject:v42];

                  v44 = [(DEDCloudKitFinisher *)self log];
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    v45 = [v42 cloudKitModel];
                    *(_DWORD *)buf = 138412802;
                    v77 = v45;
                    __int16 v78 = 2114;
                    uint64_t v79 = v37;
                    __int16 v80 = 2114;
                    uint64_t v81 = v31;
                    _os_log_impl(&dword_21FE04000, v44, OS_LOG_TYPE_DEFAULT, "Created record %@ for %{public}@ with queue destination %{public}@", buf, 0x20u);
                  }
                  v46 = [v42 fileSize];
                  -[DEDCloudKitFinisher setTotalUploadSize:](self, "setTotalUploadSize:", -[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize")+ [v46 unsignedLongLongValue]);

                  v47 = [NSNumber numberWithInt:0];
                  v48 = [(DEDCloudKitFinisher *)self uploadedBytes];
                  v49 = [v42 url];
                  [v48 setObject:v47 forKeyedSubscript:v49];
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v67 objects:v82 count:16];
            }
            while (v34);
          }

          uint64_t v30 = v65 + 1;
        }
        while (v65 + 1 != v63);
        uint64_t v63 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v63);
    }

    [(DEDCloudKitFinisher *)self setState:2];
    v50 = [(DEDCloudKitFinisher *)self session];
    objc_msgSend(v50, "uploadProgress:total:", 0, -[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize"));

    [MEMORY[0x263F3B740] createLoggingEventWith:*MEMORY[0x263F3B728]];
    v51 = [(DEDCloudKitFinisher *)self attachments];
    v52 = [(DEDCloudKitFinisher *)self attachmentGroupModel];
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __55__DEDCloudKitFinisher_finishSession_withConfiguration___block_invoke_105;
    v66[3] = &unk_26453B2D8;
    v66[4] = self;
    [(DEDCloudKitFinisher *)self uploadAttachments:v51 inAttachmentGroup:v52 completionHandler:v66];

    id v7 = v60;
    id v6 = v61;
    v53 = v57;
  }
  else
  {
    v54 = [(DEDCloudKitFinisher *)self log];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      -[DEDCloudKitFinisher finishSession:withConfiguration:](v54);
    }

    [MEMORY[0x263F3B740] createLoggingEventWith:*MEMORY[0x263F3B710]];
    v53 = [(DEDCloudKitFinisher *)self session];
    [v53 didFinishAllUploads];
  }
}

void __55__DEDCloudKitFinisher_finishSession_withConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) session];
  [v5 compressionProgress:a2 total:a3];
}

void __55__DEDCloudKitFinisher_finishSession_withConfiguration___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    id v4 = NSString;
    id v5 = [v3 domain];
    id v6 = [v4 stringWithFormat:@"%@,%ld", v5, objc_msgSend(v9, "code")];

    [MEMORY[0x263F3B740] createLoggingEventWith:*MEMORY[0x263F3B718] postfix:v6];
    id v7 = [*(id *)(a1 + 32) elsManager];
    [v7 finishWithFailure];
  }
  else
  {
    [MEMORY[0x263F3B740] createLoggingEventWith:*MEMORY[0x263F3B720]];
  }
  v8 = [*(id *)(a1 + 32) session];
  [v8 uploadProgress:1 total:1];

  [*(id *)(a1 + 32) localCleanup];
}

- (void)uploadAttachments:(id)a3 inAttachmentGroup:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [MEMORY[0x263EFF980] array];
  id v12 = [v9 cloudKitModel];
  [v11 addObject:v12];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v34;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = [*(id *)(*((void *)&v33 + 1) + 8 * v16) cloudKitModel];
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }

  objc_initWeak(&location, self);
  id v18 = NSString;
  v19 = [(DEDCloudKitFinisher *)self session];
  v20 = [v19 identifier];
  v21 = [v18 stringWithFormat:@"com.apple.diagnosticextensionsd.%@.CloudKitUploadAttachments", v20];

  v22 = [(DEDCloudKitFinisher *)self cloudKitClient];
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize"));
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __77__DEDCloudKitFinisher_uploadAttachments_inAttachmentGroup_completionHandler___block_invoke;
  v30[3] = &unk_26453B300;
  objc_copyWeak(&v31, &location);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __77__DEDCloudKitFinisher_uploadAttachments_inAttachmentGroup_completionHandler___block_invoke_2;
  v26[3] = &unk_26453B350;
  id v24 = v10;
  id v28 = v24;
  v26[4] = self;
  id v25 = v9;
  id v27 = v25;
  objc_copyWeak(&v29, &location);
  [v22 uploadRecords:v11 taskIdentifier:v21 totalUploadSize:v23 perRecordProgressBlock:v30 perRecordSaveBlock:0 completionBlock:v26];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);
}

void __77__DEDCloudKitFinisher_uploadAttachments_inAttachmentGroup_completionHandler___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained processAttachmentsWithRecord:v5 withProgress:a3];
}

void __77__DEDCloudKitFinisher_uploadAttachments_inAttachmentGroup_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __77__DEDCloudKitFinisher_uploadAttachments_inAttachmentGroup_completionHandler___block_invoke_3;
    v6[3] = &unk_26453B328;
    objc_copyWeak(&v8, (id *)(a1 + 56));
    id v7 = *(id *)(a1 + 48);
    [v4 createAttachmentGroupStatusForAttachmentGroup:v5 completionHandler:v6];

    objc_destroyWeak(&v8);
  }
}

void __77__DEDCloudKitFinisher_uploadAttachments_inAttachmentGroup_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setState:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createAttachmentModelWithURL:(id)a3 andQueueItem:(id)a4 attachmentGroupModel:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[DEDCloudKitAttachmentModel alloc] initWithURL:v9 withQueueItem:v8 parameters:0];

  [(DEDCloudKitBaseModel *)v10 addReferenceForModel:v7 referenceKey:@"attachmentGroup"];
  return v10;
}

- (id)createAttachmentGroupStatusWithAttachmentGroupModel:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [NSNumber numberWithInt:0];
  [v4 setObject:v5 forKeyedSubscript:@"processingState"];

  id v6 = [(DEDCloudKitBaseModel *)[DEDCloudKitAttachmentGroupStatusModel alloc] initModelWithDictionary:v4];
  [v6 addReferenceForModel:v3 referenceKey:@"attachmentGroup"];

  return v6;
}

- (id)createAttachmentGroupWithData:(id)a3
{
  id v3 = a3;
  id v4 = [(DEDCloudKitBaseModel *)[DEDCloudKitAttachmentGroupModel alloc] initModelWithDictionary:v3];

  return v4;
}

- (void)createAttachmentGroupStatusForAttachmentGroup:(id)a3 completionHandler:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(DEDCloudKitFinisher *)self createAttachmentGroupStatusWithAttachmentGroupModel:a3];
  id v8 = NSString;
  id v9 = [(DEDCloudKitFinisher *)self session];
  id v10 = [v9 identifier];
  int v11 = [v8 stringWithFormat:@"com.apple.diagnosticextensionsd.%@.CloudKitMarkAttachmentUploadComplete", v10];

  id v12 = [(DEDCloudKitFinisher *)self cloudKitClient];
  id v13 = [v7 cloudKitModel];
  v15[0] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v12 uploadRecords:v14 taskIdentifier:v11 totalUploadSize:0 perRecordProgressBlock:0 perRecordSaveBlock:0 completionBlock:v6];
}

- (void)processAttachmentsWithRecord:(id)a3 withProgress:(double)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"asset"];

  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"asset"];
    id v9 = [(DEDCloudKitFinisher *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[DEDCloudKitFinisher processAttachmentsWithRecord:withProgress:](v8, v9, a4);
    }

    id v10 = [MEMORY[0x263F08850] defaultManager];
    int v11 = [v8 fileURL];
    id v12 = [v11 path];
    id v13 = [v10 attributesOfItemAtPath:v12 error:0];
    unint64_t v14 = [v13 fileSize];

    uint64_t v15 = [NSNumber numberWithDouble:(double)v14 * a4];
    uint64_t v16 = [(DEDCloudKitFinisher *)self uploadedBytes];
    v17 = [v8 fileURL];
    [v16 setObject:v15 forKeyedSubscript:v17];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v18 = [(DEDCloudKitFinisher *)self attachments];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      double v22 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          id v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v25 = [(DEDCloudKitFinisher *)self uploadedBytes];
          v26 = [v24 url];
          id v27 = [v25 objectForKeyedSubscript:v26];
          [v27 doubleValue];
          double v22 = v22 + v28;
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v20);
    }
    else
    {
      double v22 = 0.0;
    }

    id v29 = [(DEDCloudKitFinisher *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      int v32 = (int)(v22 / (double)[(DEDCloudKitFinisher *)self totalUploadSize] * 100.0);
      unint64_t v30 = (unint64_t)v22;
      unint64_t v33 = [(DEDCloudKitFinisher *)self totalUploadSize];
      *(_DWORD *)buf = 67240704;
      int v39 = v32;
      __int16 v40 = 2050;
      unint64_t v41 = (unint64_t)v22;
      __int16 v42 = 2050;
      unint64_t v43 = v33;
      _os_log_debug_impl(&dword_21FE04000, v29, OS_LOG_TYPE_DEBUG, "CloudKit upload progress: %{public}d%% (%{public}llu / %{public}llu)", buf, 0x1Cu);
    }
    else
    {
      unint64_t v30 = (unint64_t)v22;
    }

    id v31 = [(DEDCloudKitFinisher *)self session];
    objc_msgSend(v31, "uploadProgress:total:", v30, -[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize"));
  }
}

- (id)getAttachmentURLs
{
  return [(DEDCloudKitFinisher *)self getAttachmentURLsWithProgressHandler:0];
}

- (id)getAttachmentURLsWithProgressHandler:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v4 = [(DEDCloudKitFinisher *)self session];
  uint64_t v5 = [v4 allExtensionIdentifiers];
  uint64_t v6 = +[DEDCloudKitExtensionsUtil getCompletedExtensionFromAllExtensions:v5];

  id v7 = [(DEDCloudKitFinisher *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(DEDCloudKitFinisher *)self session];
    id v9 = [v8 identifier];
    *(_DWORD *)buf = 138412546;
    v64 = v9;
    __int16 v65 = 2112;
    uint64_t v66 = v6;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Getting DED session attachments on %@ for [%@]", buf, 0x16u);
  }
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  int v11 = [(DEDCloudKitFinisher *)self session];
  id v12 = [v11 identifier];
  id v13 = +[DEDCloudKitExtensionsUtil getAllFilesInSessionDirectoryForSessionID:v12];

  if (v13 && [v13 count])
  {
    unint64_t v14 = [(DEDCloudKitFinisher *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_DEFAULT, "Adding ELS category files (files are uncompressed)...", buf, 2u);
    }

    uint64_t v15 = objc_opt_new();
    uint64_t v16 = [(DEDCloudKitFinisher *)self session];
    v17 = [v16 identifier];
    id v18 = [v15 directoryForBugSessionIdentifier:v17];

    uint64_t v19 = [v18 URLByAppendingPathComponent:@"els"];
    uint64_t v20 = [MEMORY[0x263F08850] defaultManager];
    id v60 = 0;
    [v20 createDirectoryAtURL:v19 withIntermediateDirectories:0 attributes:0 error:&v60];
    id v21 = v60;

    if (v21)
    {
      double v22 = [(DEDCloudKitFinisher *)self log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[DEDCloudKitFinisher getAttachmentURLsWithProgressHandler:]();
      }
    }
    id v23 = +[DEDCloudKitExtensionsUtil copyFiles:v13 toDirectory:v19];
    if (v23)
    {
      uint64_t v24 = [MEMORY[0x263F3A070] archiveDirectoryAt:v19 deleteOriginal:1 progressHandler:0];
      id v25 = (void *)v24;
      if (v24)
      {
        uint64_t v62 = v24;
        [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
        v26 = v18;
        v28 = id v27 = v13;
        [v10 setValue:v28 forKey:@"els"];

        id v13 = v27;
        id v18 = v26;
      }
    }
  }
  v51 = v10;
  id v29 = [(DEDCloudKitFinisher *)self session];
  v52 = (void *)v6;
  unint64_t v30 = +[DEDCloudKitExtensionsUtil getVerifiedExtensionDirectoriesFromCompletedExtensions:v6 forSession:v29];

  v55 = [MEMORY[0x263EFF9A0] dictionary];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v30;
  uint64_t v31 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v57 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        long long v36 = [(DEDCloudKitFinisher *)self queuePayload];
        long long v37 = [(DEDCloudKitFinisher *)self parsePayloadData:v36 forIdentifier:v35];
        uint64_t v38 = (void *)[v37 mutableCopy];

        int v39 = [v38 objectForKey:@"packaging"];
        __int16 v40 = [v38 objectForKey:@"encryptor"];
        if (!v39) {
          int v39 = @"flat-directories";
        }
        [MEMORY[0x263EFF9A0] dictionary];
        v42 = unint64_t v41 = self;
        [v42 setObject:v39 forKey:@"package"];
        unint64_t v43 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v40, "isEqualToString:", @"AppleEncryptedArchive") ^ 1);
        [v42 setObject:v43 forKey:@"compression"];

        [v55 setValue:v42 forKey:v35];
        self = v41;
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v32);
  }

  v44 = [(DEDCloudKitFinisher *)self log];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v44, OS_LOG_TYPE_DEFAULT, "Getting Attachment URLs", buf, 2u);
  }

  uint64_t v45 = +[DEDCloudKitExtensionsUtil getOutputDirectories:obj withProcessingMap:v55 progressHandler:v53];
  v46 = [(DEDCloudKitFinisher *)self log];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v46, OS_LOG_TYPE_DEFAULT, "Adding the DED file URLs", buf, 2u);
  }

  [v51 addEntriesFromDictionary:v45];
  v47 = [(DEDCloudKitFinisher *)self log];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v64 = v51;
    _os_log_impl(&dword_21FE04000, v47, OS_LOG_TYPE_DEFAULT, "attachments = %{public}@", buf, 0xCu);
  }

  v48 = [(DEDCloudKitFinisher *)self encryptLogsIfNecessary:v51];

  return v48;
}

- (void)localCleanup
{
  id v3 = [(DEDCloudKitFinisher *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "All uploads are complete, cleaning up...", v7, 2u);
  }

  id v4 = [(DEDCloudKitFinisher *)self session];
  [v4 didFinishAllUploads];

  uint64_t v5 = [(DEDCloudKitFinisher *)self attachments];
  [v5 removeAllObjects];

  uint64_t v6 = [(DEDCloudKitFinisher *)self uploadedBytes];
  [v6 removeAllObjects];
}

- (void)didStartCollectingDiagnosticExtensionWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F3B750] findEntryForDEDIdentifier:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263F3B740];
    uint64_t v8 = *MEMORY[0x263F3B6E8];
    id v9 = [v5 parameterName];
    [v7 createLoggingEventWith:v8 postfix:v9];
  }
  else
  {
    id v10 = [(DEDCloudKitFinisher *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Failed to find whitelist entry for: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)didCancelCollectionOnExtension:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F3B750] findEntryForDEDIdentifier:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263F3B740];
    uint64_t v8 = *MEMORY[0x263F3B6D0];
    id v9 = [v5 parameterName];
    [v7 createLoggingEventWith:v8 postfix:v9];
  }
  else
  {
    id v10 = [(DEDCloudKitFinisher *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Failed to find whitelist entry for: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)didCollectAttachmentGroup:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F3B750];
  uint64_t v6 = [v4 extensionID];
  id v7 = [v5 findEntryForDEDIdentifier:v6];

  if (v7)
  {
    uint64_t v8 = [v4 attachmentItems];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = (void *)MEMORY[0x263F3B740];
      int v11 = (uint64_t *)MEMORY[0x263F3B6D8];
LABEL_4:
      uint64_t v12 = *v11;
      uint64_t v13 = [v7 parameterName];
      [v10 createLoggingEventWith:v12 postfix:v13];

      goto LABEL_9;
    }
    unint64_t v14 = [v4 attachmentItems];
    uint64_t v15 = [v14 count];

    if (!v15)
    {
      id v10 = (void *)MEMORY[0x263F3B740];
      int v11 = (uint64_t *)MEMORY[0x263F3B6E0];
      goto LABEL_4;
    }
  }
  uint64_t v16 = [(DEDCloudKitFinisher *)self log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v4 dedExtensionIdentifier];
    id v18 = [v17 stringValue];
    int v19 = 138412290;
    uint64_t v20 = v18;
    _os_log_impl(&dword_21FE04000, v16, OS_LOG_TYPE_DEFAULT, "Failed to find whitelist entry for: %@", (uint8_t *)&v19, 0xCu);
  }
LABEL_9:
}

- (void)didFinishAllCollections
{
}

- (id)encryptLogsIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke;
  v7[3] = &unk_26453B378;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(a1 + 32), "encryptLogsForExtensionIdentifier:withAttachmentUrl:", v5, *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  if ([v5 isEqualToString:@"els"])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:v7 forKey:@"els"];
  }
  else
  {
    unint64_t v14 = [[DEDExtensionIdentifier alloc] initWithString:v5];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = (void *)MEMORY[0x263F3B750];
      v17 = [(DEDExtensionIdentifier *)v14 extensionIdentifier];
      id v18 = [v16 findEntryForBundleIdentifier:v17];

      if (v18)
      {
        int v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v20 = [v18 parameterName];
        [v19 setValue:v7 forKey:v20];
      }
      else
      {
        uint64_t v20 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke_cold_2();
        }
      }
    }
    else
    {
      id v18 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke_cold_1();
      }
    }
  }
}

- (id)extractExtensionIdentifierFromAttachmentUrl:(id)a3
{
  id v3 = [a3 pathComponents];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeLastObject];
  id v5 = [v4 lastObject];
  id v6 = [[DEDExtensionIdentifier alloc] initWithString:v5];
  id v7 = [(DEDExtensionIdentifier *)v6 extensionIdentifier];

  return v7;
}

- (id)encryptLogsForExtensionIdentifier:(id)a3 withAttachmentUrl:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDCloudKitFinisher *)self queuePayload];
  uint64_t v9 = [(DEDCloudKitFinisher *)self parsePayloadData:v8 forIdentifier:v6];
  uint64_t v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v10 objectForKey:@"encryption"];
  uint64_t v12 = [v10 objectForKey:@"encryptor"];
  id v13 = +[DEDEncryptorFactory getEncryptorForExtensionIdentifier:v12];
  if (v13)
  {
    unint64_t v14 = [(DEDCloudKitFinisher *)self timberLorryUUID];

    if (v14)
    {
      uint64_t v15 = [(DEDCloudKitFinisher *)self timberLorryUUID];
      [v10 setObject:v15 forKey:@"timberLorryUUID"];
    }
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[DEDCloudKitFinisher sandboxEnvironment](self, "sandboxEnvironment"));
    [v10 setObject:v16 forKey:@"cloudKitEnv"];

    v17 = [v7 URLByDeletingLastPathComponent];
    id v18 = [v13 encryptLogsAtPath:v7 outputDirectory:v17 withMetadata:v10];
  }
  else if (v11)
  {
    int v19 = [(DEDCloudKitFinisher *)self log];
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);
    if (v12)
    {
      if (v20) {
        -[DEDCloudKitFinisher encryptLogsForExtensionIdentifier:withAttachmentUrl:]();
      }
    }
    else if (v20)
    {
      -[DEDCloudKitFinisher encryptLogsForExtensionIdentifier:withAttachmentUrl:]();
    }

    id v18 = 0;
  }
  else
  {
    long long v21 = [(DEDCloudKitFinisher *)self log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_21FE04000, v21, OS_LOG_TYPE_DEFAULT, "No encryption required on %@", (uint8_t *)&v23, 0xCu);
    }

    id v18 = v7;
  }

  return v18;
}

- (id)parsePayloadData:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKey:*MEMORY[0x263F3B730]];
  if ([v6 isEqualToString:@"els"])
  {
    id v8 = [v7 objectForKeyedSubscript:v6];
  }
  else
  {
    uint64_t v9 = [[DEDExtensionIdentifier alloc] initWithString:v6];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = (void *)MEMORY[0x263F3B750];
      uint64_t v12 = [(DEDExtensionIdentifier *)v9 extensionIdentifier];
      id v13 = [v11 findEntryForBundleIdentifier:v12];

      unint64_t v14 = [v13 parameterName];
      id v8 = [v7 objectForKeyedSubscript:v14];
    }
    else
    {
      uint64_t v15 = [(DEDCloudKitFinisher *)self log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[DEDCloudKitFinisher parsePayloadData:forIdentifier:]();
      }

      id v8 = 0;
    }
  }
  return v8;
}

- (void)writeData:(id)a3 filename:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  uint64_t v9 = [(DEDCloudKitFinisher *)self session];
  uint64_t v10 = [v9 identifier];
  uint64_t v11 = [v8 directoryForBugSessionIdentifier:v10 createIfNeeded:1];
  uint64_t v12 = [v11 URLByAppendingPathComponent:v6];

  id v13 = [MEMORY[0x263F3B738] sharedHelper];
  unint64_t v14 = [v13 saveData:v7 toFilePath:v12];

  if (v14)
  {
    uint64_t v15 = [(DEDCloudKitFinisher *)self log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[DEDCloudKitFinisher writeData:filename:](v15);
    }
  }
}

- (BOOL)isCompressing
{
  return [(DEDCloudKitFinisher *)self state] == 1;
}

- (BOOL)isUploading
{
  return [(DEDCloudKitFinisher *)self state] == 2;
}

- (id)additionalStateInfo
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v29 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v3 = 0x264539000uLL;
  id v4 = +[DEDDeferredExtensionInfo allInfo];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = [(DEDCloudKitFinisher *)self session];
  id v6 = [v5 allExtensionIdentifiers];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    double v28 = self;
    do
    {
      uint64_t v10 = 0;
      uint64_t v30 = v8;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        uint64_t v12 = *(void **)(v3 + 3856);
        id v13 = [(DEDCloudKitFinisher *)self session];
        unint64_t v14 = [v13 identifier];
        uint64_t v15 = [v12 activityStringForBugSessionIdentifier:v14 dedIdentifier:v11];

        uint64_t v16 = [v4 objectForKeyedSubscript:v15];
        v17 = v16;
        if (v16 && ([v16 isOverdue] & 1) == 0)
        {
          uint64_t v32 = [v17 parameters];
          v37[0] = v32;
          id v18 = NSNumber;
          int v19 = [v17 triggerDate];
          [v19 timeIntervalSinceNow];
          BOOL v20 = objc_msgSend(v18, "numberWithDouble:");
          v37[1] = v20;
          [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
          uint64_t v21 = v9;
          unint64_t v22 = v3;
          id v24 = v23 = v4;
          uint64_t v25 = [v11 stringValue];
          [v29 setObject:v24 forKey:v25];

          id v4 = v23;
          unint64_t v3 = v22;
          uint64_t v9 = v21;

          uint64_t v8 = v30;
          self = v28;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v8);
  }

  uint64_t v26 = [NSDictionary dictionaryWithObject:v29 forKey:@"queued-extensions"];

  return v26;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (DEDBugSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (DEDBugSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
}

- (unint64_t)totalUploadSize
{
  return self->_totalUploadSize;
}

- (void)setTotalUploadSize:(unint64_t)a3
{
  self->_totalUploadSize = a3;
}

- (DEDCloudKitAttachmentGroupModel)attachmentGroupModel
{
  return (DEDCloudKitAttachmentGroupModel *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttachmentGroupModel:(id)a3
{
}

- (NSMutableArray)attachments
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAttachments:(id)a3
{
}

- (NSMutableDictionary)uploadedBytes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUploadedBytes:(id)a3
{
}

- (DEDCloudKitClient)cloudKitClient
{
  return self->_cloudKitClient;
}

- (void)setCloudKitClient:(id)a3
{
}

- (NSDictionary)queuePayload
{
  return self->_queuePayload;
}

- (void)setQueuePayload:(id)a3
{
}

- (NSString)timberLorryUUID
{
  return self->_timberLorryUUID;
}

- (void)setTimberLorryUUID:(id)a3
{
}

- (BOOL)sandboxEnvironment
{
  return self->_sandboxEnvironment;
}

- (void)setSandboxEnvironment:(BOOL)a3
{
  self->_sandboxEnvironment = a3;
}

- (ELSManager)elsManager
{
  return self->_elsManager;
}

- (void)setElsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elsManager, 0);
  objc_storeStrong((id *)&self->_timberLorryUUID, 0);
  objc_storeStrong((id *)&self->_queuePayload, 0);
  objc_storeStrong((id *)&self->_cloudKitClient, 0);
  objc_storeStrong((id *)&self->_uploadedBytes, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_attachmentGroupModel, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (void)finishSession:(os_log_t)log withConfiguration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "No cloudkitContainer provided in bug session configuration, cleaning up...", v1, 2u);
}

- (void)finishSession:withConfiguration:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "Error parsing the Payload from CloudKit Data. Error: %{public}@", v1, 0xCu);
}

- (void)processAttachmentsWithRecord:(double)a3 withProgress:.cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [a1 fileURL];
  id v6 = [v5 lastPathComponent];
  int v7 = 134218242;
  double v8 = a3;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "Upload progress is %f for asset: %@", (uint8_t *)&v7, 0x16u);
}

- (void)getAttachmentURLsWithProgressHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "Error creating ELS Directory %@", v1, 0xCu);
}

void __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_21FE04000, v0, v1, "Could not identify diagnostic extension with id %@. Skipping the following files: %@");
}

void __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_21FE04000, v0, v1, "Could not find correlated queue item name for %@. Skipping the following files: %@");
}

- (void)encryptLogsForExtensionIdentifier:withAttachmentUrl:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_21FE04000, v0, OS_LOG_TYPE_FAULT, "No encryptor specified for DE: %@ which requires encryption. Dropping file attachment", v1, 0xCu);
}

- (void)encryptLogsForExtensionIdentifier:withAttachmentUrl:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_21FE04000, v0, v1, "Could not locate an encryptor for: %@ for the DE: %@. Dropping attachment");
}

- (void)parsePayloadData:forIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_21FE04000, v0, OS_LOG_TYPE_FAULT, "Could not identify diagnostic extension with id %@. No paylaod returned", v1, 0xCu);
}

- (void)writeData:(os_log_t)log filename:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "Unable to add Data to the bug session", v1, 2u);
}

@end