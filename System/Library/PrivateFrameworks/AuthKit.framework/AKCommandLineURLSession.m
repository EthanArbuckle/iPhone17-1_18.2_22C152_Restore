@interface AKCommandLineURLSession
+ (id)sharedServerUIURLSession;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
@end

@implementation AKCommandLineURLSession

+ (id)sharedServerUIURLSession
{
  if (sharedServerUIURLSession_onceToken != -1) {
    dispatch_once(&sharedServerUIURLSession_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)sharedServerUIURLSession_sharedURLSession;

  return v2;
}

uint64_t __51__AKCommandLineURLSession_sharedServerUIURLSession__block_invoke()
{
  sharedServerUIURLSession_sharedURLSession = objc_alloc_init(AKCommandLineURLSession);

  return MEMORY[0x1F41817F8]();
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  v11 = (void (**)(id, void *))a7;
  v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[AKCommandLineURLSession URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:](v9, v10, v12);
  }

  if (v9)
  {
    if (v10)
    {
      v13 = [v9 allHeaderFields];
      v14 = objc_msgSend(v13, "aaf_filter:", &__block_literal_global_29);

      if (v14
        && ([v14 allKeys],
            v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = [v15 count],
            v15,
            v16))
      {
        id v26 = v10;
        v17 = (void *)[v10 mutableCopy];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v18 = [v14 allKeys];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              v24 = [v14 objectForKey:v23];
              [v17 setValue:v24 forHTTPHeaderField:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v20);
        }

        if (v11) {
          v11[2](v11, v17);
        }

        id v10 = v26;
      }
      else
      {
        v25 = _AKLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[AKCommandLineURLSession URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:](v25);
        }

        if (v11) {
          v11[2](v11, v10);
        }
      }
    }
    else if (v11)
    {
      v11[2](v11, 0);
    }
  }
  else if (v11)
  {
    v11[2](v11, v10);
  }
}

uint64_t __99__AKCommandLineURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"X-Apple-I-Cont"];
}

- (void)URLSession:(os_log_t)log task:willPerformHTTPRedirection:newRequest:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Redirect session is missing continuation header's.", v1, 2u);
}

- (void)URLSession:(NSObject *)a3 task:willPerformHTTPRedirection:newRequest:completionHandler:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = [a1 URL];
  v6 = [a2 URL];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl(&dword_193494000, a3, OS_LOG_TYPE_DEBUG, "Session processing redirect from %@ to %@", (uint8_t *)&v7, 0x16u);
}

@end