@interface ASTConnectionSession
- (ASTConnectionSession)initWithIdentities:(id)a3 ticket:(id)a4 requestQueuedSuiteInfo:(BOOL)a5;
- (void)_addTokenToHeaderField;
@end

@implementation ASTConnectionSession

- (ASTConnectionSession)initWithIdentities:(id)a3 ticket:(id)a4 requestQueuedSuiteInfo:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ASTConnectionSession;
  v10 = [(ASTMaterializedConnection *)&v32 init];
  v11 = v10;
  if (v10)
  {
    v24 = v10;
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v8;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
          v18 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v24);
          v19 = [v17 json];
          [v18 setObject:v19 forKeyedSubscript:@"identifiers"];

          if (v9 && ([v9 isEqualToString:@"IN_CURRENT_SESSION"] & 1) == 0) {
            [v18 setObject:v9 forKeyedSubscript:@"ticketNumber"];
          }
          if (v5) {
            [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"queuedSuiteInfo"];
          }
          [v12 addObject:v18];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v14);
    }

    id v27 = 0;
    v20 = +[ASTEncodingUtilities jsonSerializeObject:v12 error:&v27];
    id v21 = v27;
    if (v20)
    {
      v11 = v24;
      [(ASTMaterializedConnection *)v24 addBody:v20 gzip:+[ASTConnectionUtilities isGzipEnabled]];
    }
    else
    {
      v22 = ASTLogHandleForCategory(0);
      v11 = v24;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ASTConnectionSession initWithIdentities:ticket:requestQueuedSuiteInfo:]((uint64_t)v21, v22);
      }
    }
    id v8 = v25;
    [(ASTConnectionSession *)v11 _addTokenToHeaderField];
  }
  return v11;
}

- (void)_addTokenToHeaderField
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F31AC0] isCheckerBoardActive])
  {
    v3 = [MEMORY[0x263F31AC0] proxyServer];
    v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 server];
      if (v5)
      {
        v6 = (void *)v5;
        uint64_t v7 = [v4 port];
        if (v7)
        {
          id v8 = (void *)v7;
          id v9 = [v4 token];

          if (v9)
          {
            v10 = ASTLogHandleForCategory(0);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              v11 = [v4 token];
              int v14 = 138412290;
              uint64_t v15 = v11;
              _os_log_impl(&dword_23CA80000, v10, OS_LOG_TYPE_DEFAULT, "Set token for session's header: %@", (uint8_t *)&v14, 0xCu);
            }
            id v12 = [(ASTMaterializedConnection *)self request];
            uint64_t v13 = [v4 token];
            [v12 setValue:v13 forHTTPHeaderField:@"Token"];
          }
        }
        else
        {
        }
      }
    }
  }
}

- (void)initWithIdentities:(uint64_t)a1 ticket:(NSObject *)a2 requestQueuedSuiteInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "JSON serialization failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end