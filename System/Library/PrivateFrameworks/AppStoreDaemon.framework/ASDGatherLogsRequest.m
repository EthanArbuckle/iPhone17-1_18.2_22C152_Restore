@interface ASDGatherLogsRequest
+ (void)clearHARFiles;
- (ASDGatherLogsRequest)initWithOptions:(id)a3;
- (id)_combineAllLogs;
- (id)_createCombinedHarFile;
- (void)_copyDB:(void *)a1 fullSourcePath:(void *)a2 toDir:(void *)a3 datbaseBase:(void *)a4;
- (void)createHARFileArchiveWithCompletionBlock:(id)a3;
- (void)createLogFileArchiveWithCompletionBlock:(id)a3;
- (void)gatherLogsWithCompletionBlock:(id)a3;
@end

@implementation ASDGatherLogsRequest

- (ASDGatherLogsRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDGatherLogsRequest;
  v5 = [(ASDGatherLogsRequest *)&v15 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDGatherLogsRequest.access", v6);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDGatherLogsRequest.callout", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v4 copy];
    options = v5->_options;
    v5->_options = (ASDGatherLogsRequestOptions *)v12;
  }
  return v5;
}

+ (void)clearHARFiles
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self;
  self;
  id v2 = (id)[NSString stringWithFormat:@"/var/mobile/Library/Logs/%@/HTTPArchives", @"com.apple.StoreServices"];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v3 contentsOfDirectoryAtPath:v2 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    dispatch_queue_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        dispatch_queue_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v10 hasSuffix:@".har.compressed"] & 1) != 0
          || [v10 hasSuffix:@".har"])
        {
          v11 = [v2 stringByAppendingPathComponent:v10];
          id v13 = v7;
          [v3 removeItemAtPath:v11 error:&v13];
          id v12 = v13;

          dispatch_queue_t v7 = v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    dispatch_queue_t v7 = 0;
  }
}

- (void)createLogFileArchiveWithCompletionBlock:(id)a3
{
  uint64_t v5 = self->_options;
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__ASDGatherLogsRequest__sendRequestWithOptions_completionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  dispatch_async(accessQueue, v9);
}

- (void)createHARFileArchiveWithCompletionBlock:(id)a3
{
  uint64_t v5 = self->_options;
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ASDGatherLogsRequest__sendHarFileRequestWithOptions_completionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  dispatch_async(accessQueue, v9);
}

- (void)gatherLogsWithCompletionBlock:(id)a3
{
  uint64_t v5 = self->_options;
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__ASDGatherLogsRequest__sendGatherRequestWithOptions_completionBlock___block_invoke;
  v9[3] = &unk_1E58B33D0;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  dispatch_async(accessQueue, v9);
}

void __47__ASDGatherLogsRequest__appstoredContainerPath__block_invoke()
{
  uint64_t v0 = container_system_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    uint64_t v2 = [[NSString alloc] initWithUTF8String:v0];
    v3 = (void *)_MergedGlobals_55;
    _MergedGlobals_55 = v2;

    free(v1);
  }
}

- (id)_combineAllLogs
{
  v50[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = [@"/var/mobile/Library/Caches/com.apple.appstored/" stringByAppendingPathComponent:@"scratch"];
    [MEMORY[0x1E4F28CB8] defaultManager];
    v38 = uint64_t v42 = 0;
    [v38 removeItemAtPath:v1 error:&v42];
    uint64_t v2 = @"appstored";
    id v3 = v1;
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v39 = v3;
    uint64_t v5 = [v3 stringByAppendingPathComponent:@"appstored"];
    id v6 = [NSString stringWithFormat:@"%@.log", @"appstored"];
    uint64_t v7 = [v5 stringByAppendingPathComponent:v6];

    id v44 = 0;
    v40 = (void *)v7;
    [v4 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v44];
    id v8 = v44;
    v9 = [NSString stringWithFormat:@"/var/mobile/Library/Logs/com.apple.%@/", @"appstored"];
    id v10 = [NSString stringWithFormat:@"%@.log", @"appstored"];
    v50[0] = v10;
    v11 = [NSString stringWithFormat:@"%@.1.log", @"appstored"];
    v50[1] = v11;
    id v12 = [NSString stringWithFormat:@"%@.2.log", @"appstored"];
    v50[2] = v12;
    id v13 = [NSString stringWithFormat:@"%@.3.log", @"appstored"];
    v50[3] = v13;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v14;
    uint64_t v15 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          v20 = [v9 stringByAppendingPathComponent:v19];
          if ([v4 fileExistsAtPath:v20])
          {
            v21 = [v40 stringByAppendingPathComponent:v19];
            id v43 = v8;
            [v4 copyItemAtPath:v20 toPath:v21 error:&v43];
            id v22 = v43;

            if (v22)
            {
              v23 = (FILE *)*MEMORY[0x1E4F143C8];
              id v24 = [v22 localizedDescription];
              fprintf(v23, "\nError copying file: %s", (const char *)[v24 UTF8String]);
            }
            id v8 = v22;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
      }
      while (v16);
    }

    v25 = [MEMORY[0x1E4F1CB10] URLWithString:v39];
    -[ASDGatherLogsRequest _copyDB:fullSourcePath:toDir:datbaseBase:](@"itunesstored", @"/var/mobile/Media/Downloads/", v39, @"downloads.28");
    if (qword_1EB4D6638 != -1) {
      dispatch_once(&qword_1EB4D6638, &__block_literal_global_30);
    }
    id v26 = (id)_MergedGlobals_55;
    v27 = [v26 stringByAppendingPathComponent:@"Documents"];

    -[ASDGatherLogsRequest _copyDB:fullSourcePath:toDir:datbaseBase:](@"appstored", v27, v39, @"appstored");
    -[ASDGatherLogsRequest _copyDB:fullSourcePath:toDir:datbaseBase:](@"appstored", v27, v39, @"updates");
    id v28 = v25;
    if (BOMCopierNew())
    {
      v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToMemory];
      [v29 open];
      *(void *)&long long v46 = @"createPKZip";
      v30 = [NSNumber numberWithBool:1];
      *((void *)&v46 + 1) = @"outputStream";
      v45[0] = v30;
      v45[1] = v29;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v46 count:2];

      id v32 = [v28 path];
      [v32 fileSystemRepresentation];
      int v33 = BOMCopierCopyWithOptions();

      if (v33)
      {
        fwrite("Error copying and zipping\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
        v34 = 0;
      }
      else
      {
        v34 = [v29 propertyForKey:*MEMORY[0x1E4F1C4C0]];
        BOMCopierFree();
      }
      v35 = v38;
    }
    else
    {
      fwrite("\nCouldn't create BomCopier for zipping", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      v34 = 0;
      v35 = v38;
    }

    v36 = [@"/var/mobile/Library/Caches/com.apple.appstored/" stringByAppendingPathComponent:@"appstored.zip"];
    [v34 writeToFile:v36 atomically:1];
  }
  else
  {
    v36 = 0;
  }
  return v36;
}

- (void)_copyDB:(void *)a1 fullSourcePath:(void *)a2 toDir:(void *)a3 datbaseBase:(void *)a4
{
  v43[3] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v32 = v9;
  int v33 = v7;
  id v12 = [v9 stringByAppendingPathComponent:v7];
  id v13 = [NSString stringWithFormat:@"%@.sqlitedb", v10];
  uint64_t v14 = [v12 stringByAppendingPathComponent:v13];

  id v41 = 0;
  v34 = (void *)v14;
  [v11 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v41];
  id v15 = v41;
  uint64_t v16 = [NSString stringWithFormat:@"%@.sqlitedb", v10];
  v43[0] = v16;
  uint64_t v17 = [NSString stringWithFormat:@"%@.sqlitedb-shm", v10];
  v43[1] = v17;
  v31 = v10;
  v18 = [NSString stringWithFormat:@"%@.sqlitedb-wal", v10];
  v43[2] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v19;
  uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        v25 = [v8 stringByAppendingPathComponent:v24];
        if ([v11 fileExistsAtPath:v25])
        {
          id v26 = [v34 stringByAppendingPathComponent:v24];
          id v36 = v15;
          [v11 copyItemAtPath:v25 toPath:v26 error:&v36];
          id v27 = v36;

          if (v27)
          {
            id v28 = (FILE *)*MEMORY[0x1E4F143C8];
            [v27 localizedDescription];
            id v29 = v8;
            id v30 = objc_claimAutoreleasedReturnValue();
            fprintf(v28, "\nError copying file: %s", (const char *)[v30 UTF8String]);

            id v8 = v29;
          }

          id v15 = v27;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v21);
  }
}

- (id)_createCombinedHarFile
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    self;
    id v2 = (id)[NSString stringWithFormat:@"/var/mobile/Library/Logs/%@/HTTPArchives", @"com.apple.StoreServices"];
    uint64_t v3 = [*(id *)(v1 + 32) fileName];
    id v4 = (void *)v3;
    if (v3) {
      uint64_t v5 = (__CFString *)v3;
    }
    else {
      uint64_t v5 = @"combined.har";
    }
    uint64_t v58 = [v2 stringByAppendingPathComponent:v5];

    v61 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v61 contentsOfDirectoryAtPath:v2 error:0];
    if ([*(id *)(v1 + 32) verbose])
    {
      uint64_t v7 = objc_opt_class();
      NSLog(&cfstr_CheckingForLdF.isa, v7, [v6 count], v2);
    }
    id v60 = v2;
    id v73 = (id)objc_opt_new();
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v91 objects:v102 count:16];
    uint64_t v71 = v1;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v92;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v92 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v91 + 1) + 8 * v11);
          if (([v12 hasSuffix:@".har.compressed"] & 1) == 0
            && ![v12 hasSuffix:@".har"])
          {
            goto LABEL_17;
          }
          if ([v12 isEqualToString:@"combined.har"]) {
            goto LABEL_17;
          }
          uint64_t v13 = [*(id *)(v1 + 32) fileName];
          if (v13)
          {
            uint64_t v14 = (void *)v13;
            id v15 = [*(id *)(v1 + 32) fileName];
            char v16 = [v12 isEqualToString:v15];

            uint64_t v1 = v71;
            if (v16)
            {
LABEL_17:
              int v17 = [*(id *)(v1 + 32) verbose];
              v18 = @"Skipping file: %@";
              if (!v17) {
                goto LABEL_19;
              }
LABEL_18:
              NSLog(&v18->isa, v12);
              goto LABEL_19;
            }
          }
          [v73 addObject:v12];
          char v19 = [*(id *)(v1 + 32) verbose];
          v18 = @"Including har file: %@";
          if (v19) {
            goto LABEL_18;
          }
LABEL_19:
          ++v11;
        }
        while (v9 != v11);
        uint64_t v20 = [obj countByEnumeratingWithState:&v91 objects:v102 count:16];
        uint64_t v9 = v20;
      }
      while (v20);
    }

    uint64_t v21 = objc_opt_new();
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v22 = v73;
    unint64_t v23 = 0x1E4F1C000uLL;
    v59 = v22;
    uint64_t v65 = [v22 countByEnumeratingWithState:&v87 objects:v101 count:16];
    id v24 = 0;
    if (v65)
    {
      uint64_t v64 = *(void *)v88;
      id v26 = v60;
      v25 = v61;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v88 != v64) {
            objc_enumerationMutation(v22);
          }
          uint64_t v69 = v27;
          uint64_t v28 = [v26 stringByAppendingPathComponent:*(void *)(*((void *)&v87 + 1) + 8 * v27)];
          id v86 = v24;
          v68 = (void *)v28;
          uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:options:error:");
          id v30 = v86;

          id v85 = v30;
          v67 = (void *)v29;
          v31 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v29 options:0 error:&v85];
          id v66 = v85;

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v32 = [v31 objectForKeyedSubscript:@"log"];
            int v33 = [v32 objectForKeyedSubscript:@"entries"];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = [*(id *)(v1 + 32) urlFilters];

              if (v34)
              {
                v62 = v31;
                long long v83 = 0u;
                long long v84 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                id v74 = v33;
                uint64_t v35 = [v74 countByEnumeratingWithState:&v81 objects:v100 count:16];
                if (v35)
                {
                  uint64_t v36 = v35;
                  uint64_t v37 = *(void *)v82;
                  uint64_t v70 = *(void *)v82;
                  do
                  {
                    uint64_t v38 = 0;
                    uint64_t v72 = v36;
                    do
                    {
                      if (*(void *)v82 != v37) {
                        objc_enumerationMutation(v74);
                      }
                      long long v39 = *(void **)(*((void *)&v81 + 1) + 8 * v38);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v40 = v33;
                        unint64_t v41 = v23;
                        uint64_t v42 = [v39 objectForKeyedSubscript:@"request"];
                        id v43 = [v42 objectForKeyedSubscript:@"url"];

                        long long v79 = 0u;
                        long long v80 = 0u;
                        long long v77 = 0u;
                        long long v78 = 0u;
                        id v44 = [*(id *)(v71 + 32) urlFilters];
                        uint64_t v45 = [v44 countByEnumeratingWithState:&v77 objects:v99 count:16];
                        if (v45)
                        {
                          uint64_t v46 = v45;
                          uint64_t v47 = *(void *)v78;
                          do
                          {
                            for (uint64_t i = 0; i != v46; ++i)
                            {
                              if (*(void *)v78 != v47) {
                                objc_enumerationMutation(v44);
                              }
                              if ([v43 containsString:*(void *)(*((void *)&v77 + 1) + 8 * i)])objc_msgSend(v21, "addObject:", v39); {
                            }
                              }
                            uint64_t v46 = [v44 countByEnumeratingWithState:&v77 objects:v99 count:16];
                          }
                          while (v46);
                        }

                        unint64_t v23 = v41;
                        int v33 = v40;
                        uint64_t v37 = v70;
                        uint64_t v36 = v72;
                      }
                      ++v38;
                    }
                    while (v38 != v36);
                    uint64_t v36 = [v74 countByEnumeratingWithState:&v81 objects:v100 count:16];
                  }
                  while (v36);
                }

                id v26 = v60;
                v25 = v61;
                uint64_t v1 = v71;
                id v22 = v59;
                v31 = v62;
              }
              else
              {
                [v21 addObjectsFromArray:v33];
              }
            }
          }
          id v76 = v66;
          [v25 removeItemAtPath:v68 error:&v76];
          long long v49 = v31;
          id v24 = v76;

          uint64_t v27 = v69 + 1;
        }
        while (v69 + 1 != v65);
        uint64_t v65 = [v22 countByEnumeratingWithState:&v87 objects:v101 count:16];
      }
      while (v65);
    }
    else
    {
      id v26 = v60;
    }

    v96[2] = v21;
    v97 = @"log";
    v95[0] = @"version";
    v95[1] = @"creator";
    v96[0] = @"1.2";
    v96[1] = &unk_1EEC56570;
    v95[2] = @"entries";
    v50 = [*(id *)(v23 + 2536) dictionaryWithObjects:v96 forKeys:v95 count:3];
    v98 = v50;
    v51 = [*(id *)(v23 + 2536) dictionaryWithObjects:&v98 forKeys:&v97 count:1];

    id v75 = v24;
    v52 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v51 options:0 error:&v75];
    id v53 = v75;

    if (v53)
    {
      uint64_t v54 = objc_opt_class();
      NSLog(&cfstr_ErrorMergingHa.isa, v54, v53);
      v55 = (void *)v58;
    }
    else
    {
      v55 = (void *)v58;
      if ([*(id *)(v1 + 32) verbose])
      {
        uint64_t v56 = objc_opt_class();
        NSLog(&cfstr_CreatedMergedH.isa, v56, v58);
      }
    }
    [v52 writeToFile:v55 atomically:1];
  }
  else
  {
    v55 = 0;
  }
  return v55;
}

void __70__ASDGatherLogsRequest__sendGatherRequestWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = -[ASDGatherLogsRequest _combineAllLogs](*(void *)(a1 + 32));
  uint64_t v3 = -[ASDGatherLogsRequest _createCombinedHarFile](*(void *)(a1 + 32));
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ASDGatherLogsRequest__sendGatherRequestWithOptions_completionBlock___block_invoke_2;
  block[3] = &unk_1E58B3068;
  id v5 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v5;
  id v9 = v2;
  id v6 = v3;
  id v7 = v2;
  dispatch_async(v4, block);
}

uint64_t __70__ASDGatherLogsRequest__sendGatherRequestWithOptions_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, void))(a1[6] + 16))(a1[6], 1, a1[4], a1[5], 0);
}

void __64__ASDGatherLogsRequest__sendRequestWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = -[ASDGatherLogsRequest _combineAllLogs](*(void *)(a1 + 32));
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ASDGatherLogsRequest__sendRequestWithOptions_completionBlock___block_invoke_2;
  v6[3] = &unk_1E58B2E18;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __64__ASDGatherLogsRequest__sendRequestWithOptions_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32), 0);
}

void __71__ASDGatherLogsRequest__sendHarFileRequestWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = -[ASDGatherLogsRequest _createCombinedHarFile](*(void *)(a1 + 32));
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__ASDGatherLogsRequest__sendHarFileRequestWithOptions_completionBlock___block_invoke_2;
  v6[3] = &unk_1E58B2E18;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __71__ASDGatherLogsRequest__sendHarFileRequestWithOptions_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end