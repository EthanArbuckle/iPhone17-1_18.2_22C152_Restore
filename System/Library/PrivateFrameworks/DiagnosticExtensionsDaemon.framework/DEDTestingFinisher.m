@interface DEDTestingFinisher
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
+ (id)log;
- (DEDBugSession)session;
- (DEDTestingFinisher)initWithCoder:(id)a3;
- (DEDTestingFinisher)initWithConfiguration:(id)a3 session:(id)a4;
- (id)flattenDirectories:(id)a3 progressHandler:(id)a4;
- (void)finishSession:(id)a3 withConfiguration:(id)a4;
- (void)setSession:(id)a3;
- (void)writeData:(id)a3 filename:(id)a4;
@end

@implementation DEDTestingFinisher

+ (id)log
{
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, &__block_literal_global_12);
  }
  v2 = (void *)log_log_0;
  return v2;
}

void __25__DEDTestingFinisher_log__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-testing-finisher");
  v1 = (void *)log_log_0;
  log_log_0 = (uint64_t)v0;
}

- (DEDTestingFinisher)initWithConfiguration:(id)a3 session:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DEDTestingFinisher;
  id v4 = a4;
  v5 = [(DEDTestingFinisher *)&v7 init];
  objc_storeWeak((id *)&v5->_session, v4);

  return v5;
}

- (void)finishSession:(id)a3 withConfiguration:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v62 = self;
  v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "Preparing to copy files to test directory.", buf, 2u);
  }

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v8 = [v5 allExtensionIdentifiers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v76 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v75 + 1) + 8 * i) stringValue];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v75 objects:v84 count:16];
    }
    while (v10);
  }

  v14 = objc_opt_new();
  v15 = [v5 identifier];
  uint64_t v16 = [v14 directoryForBugSessionIdentifier:v15];

  v56 = (void *)v16;
  v17 = [MEMORY[0x263F3A0A0] lsDir:v16];
  id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v72 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v71 + 1) + 8 * j);
        v23 = [v22 lastPathComponent];
        if ([v7 containsObject:v23])
        {
          char v24 = [MEMORY[0x263F3A0A0] isValidDirectory:v22];

          if (v24)
          {
            [v57 addObject:v22];
            continue;
          }
        }
        else
        {
        }
        v25 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[DEDTestingFinisher finishSession:withConfiguration:].cold.4((uint64_t)buf, (uint64_t)v22);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
    }
    while (v19);
  }

  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __54__DEDTestingFinisher_finishSession_withConfiguration___block_invoke;
  v69[3] = &unk_26453B208;
  id v26 = v5;
  id v70 = v26;
  v27 = (void *)MEMORY[0x223C5FFB0](v69);
  v28 = [[DEDCompressionDebouncer alloc] initWithTrigger:v27 interval:1.0];
  v29 = [(DEDCompressionDebouncer *)v28 handler];
  v30 = [(DEDTestingFinisher *)v62 flattenDirectories:v57 progressHandler:v29];

  v31 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v80 = 138543362;
    v81 = v30;
    _os_log_impl(&dword_21FE04000, v31, OS_LOG_TYPE_DEFAULT, "attachments = %{public}@", v80, 0xCu);
  }

  id v32 = objc_alloc_init(MEMORY[0x263F08850]);
  v33 = [v32 temporaryDirectory];
  v34 = [v26 identifier];
  uint64_t v35 = [v33 URLByAppendingPathComponent:v34];

  id v68 = 0;
  v60 = (void *)v35;
  v61 = v32;
  [v32 createDirectoryAtURL:v35 withIntermediateDirectories:1 attributes:0 error:&v68];
  id v36 = v68;
  if (v36)
  {
    v37 = v36;
    v38 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[DEDTestingFinisher finishSession:withConfiguration:](v37, v38);
    }
  }
  uint64_t v39 = [v30 count];
  if (v39)
  {
    uint64_t v40 = v39;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v55 = v30;
    id v58 = v30;
    uint64_t v41 = [v58 countByEnumeratingWithState:&v64 objects:v79 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      v53 = v28;
      v54 = v27;
      uint64_t v43 = 0;
      uint64_t v44 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v42; [v46 uploadProgress:k + v43 total:v40])
        {
          v46 = v26;
          if (*(void *)v65 != v44) {
            objc_enumerationMutation(v58);
          }
          v47 = *(void **)(*((void *)&v64 + 1) + 8 * k);
          v48 = objc_msgSend(v47, "lastPathComponent", v53, v54);
          v49 = [v60 URLByAppendingPathComponent:v48];
          id v63 = 0;
          [v61 copyItemAtURL:v47 toURL:v49 error:&v63];
          id v50 = v63;

          if (v50)
          {
            v51 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
              -[DEDTestingFinisher finishSession:withConfiguration:]((uint64_t)v80, (uint64_t)v50);
            }
          }
          ++k;
          id v26 = v46;
        }
        uint64_t v42 = [v58 countByEnumeratingWithState:&v64 objects:v79 count:16];
        v43 += k;
      }
      while (v42);
      v28 = v53;
      v27 = v54;
    }
    else
    {
      uint64_t v43 = 0;
    }

    if (v43 != v40)
    {
      v52 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        -[DEDTestingFinisher finishSession:withConfiguration:]();
      }
    }
    [v26 uploadProgress:v40 total:v40];
    v30 = v55;
  }
  else
  {
    [v26 uploadProgress:1 total:1];
  }
  [v26 didFinishAllUploads];
}

uint64_t __54__DEDTestingFinisher_finishSession_withConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) compressionProgress:a2 total:a3];
}

- (DEDTestingFinisher)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DEDTestingFinisher;
  return [(DEDTestingFinisher *)&v4 init];
}

+ (id)archivedClasses
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)flattenDirectories:(id)a3 progressHandler:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v32 = a4;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  uint64_t v7 = 0;
  if (v6)
  {
    uint64_t v8 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v60 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [MEMORY[0x263F3A0A0] lsDir:*(void *)(*((void *)&v59 + 1) + 8 * i)];
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v67 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v56 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v55 + 1) + 8 * j);
              if ([MEMORY[0x263F3A0A0] isValidDirectory:v14]) {
                v7 += [MEMORY[0x263F3A070] directorySizeOf:v14];
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v67 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v6);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v28 = obj;
  uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v66 count:16];
  if (v30)
  {
    uint64_t v15 = 0;
    uint64_t v29 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v52 != v29) {
          objc_enumerationMutation(v28);
        }
        uint64_t v16 = [MEMORY[0x263F3A0A0] lsDir:*(void *)(*((void *)&v51 + 1) + 8 * k)];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id obja = v16;
        uint64_t v17 = [obja countByEnumeratingWithState:&v47 objects:v65 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v48;
          do
          {
            for (uint64_t m = 0; m != v17; ++m)
            {
              if (*(void *)v48 != v18) {
                objc_enumerationMutation(obja);
              }
              uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8 * m);
              if ([MEMORY[0x263F3A0A0] isValidDirectory:v20])
              {
                uint64_t v43 = 0;
                uint64_t v44 = &v43;
                uint64_t v45 = 0x2020000000;
                uint64_t v46 = 0;
                v21 = [(id)objc_opt_class() log];
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v64 = v20;
                  _os_log_debug_impl(&dword_21FE04000, v21, OS_LOG_TYPE_DEBUG, "Compressing folder... (%{public}@)", buf, 0xCu);
                }

                v22 = (void *)MEMORY[0x263F3A070];
                v38[0] = MEMORY[0x263EF8330];
                v38[1] = 3221225472;
                v38[2] = __57__DEDTestingFinisher_flattenDirectories_progressHandler___block_invoke;
                v38[3] = &unk_26453B230;
                uint64_t v40 = &v43;
                id v39 = v32;
                uint64_t v41 = v15;
                uint64_t v42 = v7;
                v23 = [v22 archiveDirectoryAt:v20 deleteOriginal:1 progressHandler:v38];
                uint64_t v24 = v44[3];
                v25 = [(id)objc_opt_class() log];
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
                  -[DEDTestingFinisher flattenDirectories:progressHandler:](&v36, v37, v25);
                }

                if (v23)
                {
                  [v35 addObject:v23];
                }
                else
                {
                  id v26 = [(id)objc_opt_class() log];
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v64 = v20;
                    _os_log_error_impl(&dword_21FE04000, v26, OS_LOG_TYPE_ERROR, "Error compressing: %{public}@", buf, 0xCu);
                  }
                }
                v15 += v24;
                _Block_object_dispose(&v43, 8);
              }
              else
              {
                [v35 addObject:v20];
              }
            }
            uint64_t v17 = [obja countByEnumeratingWithState:&v47 objects:v65 count:16];
          }
          while (v17);
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v66 count:16];
    }
    while (v30);
  }

  return v35;
}

uint64_t __57__DEDTestingFinisher_flattenDirectories_progressHandler___block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24) + a1[6], a1[7]);
}

- (void)writeData:(id)a3 filename:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [(DEDTestingFinisher *)self session];
  uint64_t v10 = [v9 identifier];
  uint64_t v11 = [v8 directoryForBugSessionIdentifier:v10];

  uint64_t v12 = [v11 URLByAppendingPathComponent:@"sendData"];
  v13 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v14 = [v12 path];
  char v15 = [v13 fileExistsAtPath:v14];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
    id v23 = 0;
    [v16 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v17 = v23;

    if (v17)
    {
      uint64_t v18 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[DEDTestingFinisher writeData:filename:]();
      }
    }
  }
  uint64_t v19 = [v12 URLByAppendingPathComponent:v6];
  id v22 = 0;
  [v7 writeToURL:v19 options:2 error:&v22];

  id v20 = v22;
  if (v20)
  {
    v21 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[DEDTestingFinisher writeData:filename:]();
    }
  }
}

- (DEDBugSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (DEDBugSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)finishSession:withConfiguration:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21FE04000, v1, OS_LOG_TYPE_ERROR, "Expected to complete %lu files, but only completed %lu.", v2, 0x16u);
}

- (void)finishSession:(uint64_t)a1 withConfiguration:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "description");
  *__int16 v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_8(&dword_21FE04000, v5, v6, "Error copying to destination directory. %@");
}

- (void)finishSession:(void *)a1 withConfiguration:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  __int16 v3 = [a1 description];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Error creating destination directory. %@", v4, 0xCu);
}

- (void)finishSession:(uint64_t)a1 withConfiguration:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "lastPathComponent");
  *__int16 v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_8(&dword_21FE04000, v5, v6, "Error: Found folder that does not map to a completed extension: %{public}@");
}

- (void)flattenDirectories:(os_log_t)log progressHandler:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "Finished compressing", buf, 2u);
}

- (void)writeData:filename:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "Failed to save data: [%{public}@]", v1, 0xCu);
}

- (void)writeData:filename:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "Failed to create sendData directory: [%{public}@]", v1, 0xCu);
}

@end