@interface BCChatAction
+ (void)openTranscript:(NSString *)businessIdentifier intentParameters:(NSDictionary *)intentParameters;
@end

@implementation BCChatAction

+ (void)openTranscript:(NSString *)businessIdentifier intentParameters:(NSDictionary *)intentParameters
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v5 = intentParameters;
  v21 = [@"https://bcrw.apple.com/urn:biz:" stringByAppendingString:businessIdentifier];
  v6 = objc_msgSend(NSURL, "URLWithString:");
  v7 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v6 resolvingAgainstBaseURL:0];
  v8 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = v5;
  uint64_t v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v15 = [(NSDictionary *)v9 objectForKey:v14];
        v16 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:v14 value:v15];
        [v8 addObject:v16];
      }
      uint64_t v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  [v7 setQueryItems:v8];
  v17 = [MEMORY[0x263F01880] defaultWorkspace];
  v18 = [v7 URL];
  v19 = objc_opt_new();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __48__BCChatAction_openTranscript_intentParameters___block_invoke;
  v22[3] = &unk_2648520F0;
  id v23 = v7;
  id v20 = v7;
  [v17 openURL:v18 configuration:v19 completionHandler:v22];
}

void __48__BCChatAction_openTranscript_intentParameters___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = LogCategory_Daemon();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = [*(id *)(a1 + 32) URL];
      int v8 = 138412546;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl(&dword_228C26000, v6, OS_LOG_TYPE_ERROR, "BCChatAction: Failed to open chat url: %@. Error %@", (uint8_t *)&v8, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [*(id *)(a1 + 32) URL];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_228C26000, v6, OS_LOG_TYPE_DEFAULT, "BCChatAction: Success opening chat url: %@", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }
}

@end