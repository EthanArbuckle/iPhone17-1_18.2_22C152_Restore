@interface DEDFBKFeedbackUpload
+ (void)cleanUpIfNeeded;
+ (void)cleanUpIfNeededWithDefaults:(id)a3;
+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(id)a3 block:(id)a4;
+ (void)didFinishUploadOnBugSessionIdentifier:(id)a3;
+ (void)didFinishUploadOnBugSessionIdentifier:(id)a3 withDefaults:(id)a4;
@end

@implementation DEDFBKFeedbackUpload

+ (void)cleanUpIfNeeded
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__DEDFBKFeedbackUpload_cleanUpIfNeeded__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cleanUpIfNeeded_onceToken != -1) {
    dispatch_once(&cleanUpIfNeeded_onceToken, block);
  }
}

void __39__DEDFBKFeedbackUpload_cleanUpIfNeeded__block_invoke(uint64_t a1)
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v3 = dispatch_queue_create("com.apple.diagnosticextensionsd.uploadCleanUp", v2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__DEDFBKFeedbackUpload_cleanUpIfNeeded__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

void __39__DEDFBKFeedbackUpload_cleanUpIfNeeded__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"group.com.apple.feedback"];
  [v1 cleanUpIfNeededWithDefaults:v2];
}

+ (void)cleanUpIfNeededWithDefaults:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF918];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setDay:-1];
  v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v8 = objc_alloc_init(MEMORY[0x263EFF910]);
  v9 = [v7 dateByAddingComponents:v6 toDate:v8 options:0];

  v10 = Log_1();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_INFO, "Will cleanup FBK Feedback uploads ", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke;
  v12[3] = &unk_26453B3A8;
  id v13 = v9;
  id v11 = v9;
  [a1 compactMapOnFeedbackUploadsWithUserDefaults:v5 block:v12];
}

id __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:@"dateCreated"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = Log_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke_cold_2(v7);
    }
    goto LABEL_7;
  }
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v6 = [v5 compareDate:*(void *)(a1 + 32) toDate:v4 toUnitGranularity:128];

  if (v6 == 1)
  {
    v7 = Log_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke_cold_1((uint64_t)v4, v7);
    }
LABEL_7:

    id v8 = 0;
    goto LABEL_9;
  }
  id v8 = v3;
LABEL_9:

  return v8;
}

+ (void)didFinishUploadOnBugSessionIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFFA40];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithSuiteName:@"group.com.apple.feedback"];
  [a1 didFinishUploadOnBugSessionIdentifier:v5 withDefaults:v6];
}

+ (void)didFinishUploadOnBugSessionIdentifier:(id)a3 withDefaults:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = Log_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "didFinishUploadOnBugSessionIdentifier: [%{public}@] ", buf, 0xCu);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__DEDFBKFeedbackUpload_didFinishUploadOnBugSessionIdentifier_withDefaults___block_invoke;
  v10[3] = &unk_26453B3A8;
  id v11 = v6;
  id v9 = v6;
  [a1 compactMapOnFeedbackUploadsWithUserDefaults:v7 block:v10];
}

id __75__DEDFBKFeedbackUpload_didFinishUploadOnBugSessionIdentifier_withDefaults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:@"bugSessions"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v17 = v3;
    uint64_t v7 = *(void *)v19;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v10 objectForKeyedSubscript:@"sessionIdentifier"];
        int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

        if (v12) {
          uint64_t v8 = [v4 indexOfObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
    id v3 = v17;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v13 = Log_1();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v14;
        _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_DEFAULT, "Removing finished upload with Bug Session identifier [%{public}@] from Feedback upload", buf, 0xCu);
      }

      [v4 removeObjectAtIndex:v8];
    }
  }
  if ([v4 count]) {
    id v15 = v3;
  }
  else {
    id v15 = 0;
  }

  return v15;
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(id)a3 block:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v35 = (void (**)(id, void *))a4;
  v29 = v5;
  uint64_t v6 = [v5 objectForKey:@"FeedbackUploads"];
  v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v38 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v51;
    unint64_t v11 = 0x263F08000uLL;
    id v39 = v7;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(NSObject **)(*((void *)&v50 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v13 dataUsingEncoding:4];
          id v49 = 0;
          id v15 = [MEMORY[0x263F08900] JSONObjectWithData:v14 options:1 error:&v49];
          v16 = v49;
          if (v16)
          {
            id v17 = Log_1();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v57 = v13;
              _os_log_error_impl(&dword_21FE04000, v17, OS_LOG_TYPE_ERROR, "Failed to parse JSON data. Cannot map Feedback upload [%{public}@]", buf, 0xCu);
            }
            goto LABEL_43;
          }
          id v17 = [v15 objectForKeyedSubscript:@"dateCreated"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v18 = [v38 dateFromString:v17];
            if (v18)
            {
              [v15 setObject:v18 forKeyedSubscript:@"dateCreated"];
              long long v19 = Log_1();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v57 = v15;
                _os_log_debug_impl(&dword_21FE04000, v19, OS_LOG_TYPE_DEBUG, "Loaded Feedback upload [%{public}@]", buf, 0xCu);
              }

              long long v20 = v35[2](v35, v15);
              if (v20)
              {
                uint64_t v21 = [v15 objectForKeyedSubscript:@"dateCreated"];
                v37 = (void *)v21;
                if (v21)
                {
                  uint64_t v22 = [v38 stringFromDate:v21];
                  v36 = v22;
                  if (v22)
                  {
                    [v15 setObject:v22 forKeyedSubscript:@"dateCreated"];
                    id v42 = 0;
                    v32 = v20;
                    uint64_t v23 = [MEMORY[0x263F08900] dataWithJSONObject:v20 options:0 error:&v42];
                    v24 = v42;
                    v33 = (void *)v23;
                    v34 = v24;
                    if (!v23 || v24)
                    {
                      uint64_t v25 = Log_1();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                        +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:&v55 block:v25];
                      }
LABEL_36:
                      v27 = v25;
                      long long v20 = v32;
                    }
                    else
                    {
                      uint64_t v25 = [objc_alloc(*(Class *)(v11 + 2880)) initWithData:v23 encoding:4];
                      if (v25)
                      {
                        [v31 addObject:v25];
                        goto LABEL_36;
                      }
                      v30 = Log_1();
                      long long v20 = v32;
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                        +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:].cold.4(&v40, v41);
                      }

                      v27 = 0;
                    }
                  }
                  else
                  {
                    v34 = Log_1();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                      +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:](&v43, v44);
                    }
                  }
                }
                else
                {
                  v36 = Log_1();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                    +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:](&v45, v46);
                  }
                }
              }
              else
              {
                v26 = Log_1();
                v37 = v26;
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21FE04000, v26, OS_LOG_TYPE_DEFAULT, "Will not keep this Feedback upload", buf, 2u);
                }
                unint64_t v11 = 0x263F08000;
              }
            }
            else
            {
              long long v20 = Log_1();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v57 = v17;
                _os_log_error_impl(&dword_21FE04000, v20, OS_LOG_TYPE_ERROR, "Cannot create NSDate from string [%{public}@], will remove stored Feedback upload", buf, 0xCu);
              }
            }
          }
          else
          {
            long long v18 = Log_1();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:].cold.5(&v47, v48);
            }
          }

          id v7 = v39;
LABEL_43:

          goto LABEL_44;
        }
        v16 = Log_1();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v13;
          _os_log_error_impl(&dword_21FE04000, v16, OS_LOG_TYPE_ERROR, "Feedback upload in defaults is not a String: [%{public}@]", buf, 0xCu);
        }
LABEL_44:

        ++v12;
      }
      while (v9 != v12);
      uint64_t v28 = [v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
      uint64_t v9 = v28;
    }
    while (v28);
  }

  [v29 setObject:v31 forKey:@"FeedbackUploads"];
}

void __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Feedback upload created on [%{public}@] is stale. Will delete", (uint8_t *)&v2, 0xCu);
}

void __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "Cannot decode date created on given Feedback upload. Will delete", v1, 2u);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(unsigned char *)a1 block:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_21FE04000, v2, v3, "mappedDate is nil, will remove Feedback upload", v4);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(unsigned char *)a1 block:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_21FE04000, v2, v3, "mappedDateString is nil, will remove Feedback upload", v4);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(void *)a3 block:(NSObject *)a4 .cold.3(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 description];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_21FE04000, a4, OS_LOG_TYPE_ERROR, "Failed to encode mapped Feedback upload back to JSON. [%{public}@]", a1, 0xCu);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(unsigned char *)a1 block:(unsigned char *)a2 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_21FE04000, v2, v3, "Failed to encode mapped Feedback upload JSON into String.", v4);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(unsigned char *)a1 block:(unsigned char *)a2 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_21FE04000, v2, v3, "dateCreated  is not String,  will remove stored Feedback upload", v4);
}

@end