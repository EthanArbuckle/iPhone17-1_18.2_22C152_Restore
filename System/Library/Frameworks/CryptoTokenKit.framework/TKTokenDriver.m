@interface TKTokenDriver
+ (id)createDriver;
+ (void)createDriver;
- (NSArray)tokenSessions;
- (NSDictionary)extensionAttributes;
- (NSMutableDictionary)tokenConnections;
- (NSString)classID;
- (TKSharedResourceSlot)keepAliveResourceSlot;
- (TKTokenDriver)init;
- (TKTokenDriverContext)context;
- (id)createTokenWithSlot:(id)a3 AID:(id)a4 error:(id *)a5;
- (id)delegate;
- (id)endpointForToken:(id)a3;
- (id)keepAlive;
- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4;
- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5;
- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5;
- (void)configureWithReply:(id)a3;
- (void)dealloc;
- (void)getTokenWithAttributes:(id)a3 reply:(id)a4;
- (void)releaseTokenWithInstanceID:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setExtensionAttributes:(id)a3;
- (void)setKeepAlive:(id)a3;
- (void)setKeepAliveResourceSlot:(id)a3;
- (void)terminate;
@end

@implementation TKTokenDriver

+ (id)createDriver
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!objc_opt_class()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Token plugins are not supported without PlugInKit"];
  }
  v4 = [MEMORY[0x1E4F914A0] defaultService];
  v5 = [v4 solePersonality];

  v6 = [v5 plugInDictionary];
  v7 = [v6 objectForKey:@"NSExtensionAttributes"];

  v8 = [v7 objectForKeyedSubscript:@"com.apple.ctk.driver-class"];
  v9 = TK_LOG_token();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[TKTokenDriver createDriver](v5);
  }

  id v10 = v8;
  v11 = -[objc_class init](-[objc_class alloc](objc_getClass((const char *)[v10 UTF8String]), "alloc"), "init");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = TK_LOG_token();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v15 = [v5 identifier];
      *(_DWORD *)buf = 138543874;
      v19 = v15;
      __int16 v20 = 2114;
      id v21 = v10;
      __int16 v22 = 2048;
      v23 = v11;
      _os_log_fault_impl(&dword_1BED55000, v12, OS_LOG_TYPE_FAULT, "extension %{public}@: cannot instantiate TKTokenDriver-based class '%{public}@' (%p)", buf, 0x20u);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [v5 identifier];
    [v16 handleFailureInMethod:a2, a1, @"TKToken.m", 99, @"extension %@: cannot instantiate TKTokenDriver-based class '%@' (%p)", v17, v10, v11 object file lineNumber description];
  }
  [(objc_class *)v11 setExtensionAttributes:v7];
  v13 = TK_LOG_token();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[TKTokenDriver createDriver]();
  }

  return v11;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "Destroying driver %{public}@", v2, v3, v4, v5, v6);
}

- (TKTokenDriver)init
{
  v7.receiver = self;
  v7.super_class = (Class)TKTokenDriver;
  uint64_t v2 = [(TKTokenDriver *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    if ([(TKTokenDriver *)v2 conformsToProtocol:&unk_1F1A01B68]) {
      objc_storeWeak((id *)&v3->_delegate, v3);
    }
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    tokenConnections = v3->_tokenConnections;
    v3->_tokenConnections = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (NSString)classID
{
  uint64_t v2 = [(TKTokenDriver *)self extensionAttributes];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"com.apple.ctk.class-id"];

  return (NSString *)v3;
}

- (id)keepAlive
{
  id keepAlive = self->_keepAlive;
  if (keepAlive)
  {
    id v3 = keepAlive;
  }
  else
  {
    id v3 = [(TKSharedResourceSlot *)self->_keepAliveResourceSlot resourceWithError:0];
  }

  return v3;
}

- (void)setKeepAlive:(id)a3
{
}

- (id)endpointForToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 tokenID];
  uint8_t v6 = [v5 instanceID];

  objc_super v7 = [(TKTokenDriver *)self tokenConnections];
  objc_sync_enter(v7);
  v8 = [(TKTokenDriver *)self tokenConnections];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v10 = TK_LOG_token();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenDriver endpointForToken:]();
    }

    [v9 invalidate];
  }
  v11 = [[TKTokenConnection alloc] initWithToken:v4];

  v12 = [(TKTokenDriver *)self tokenConnections];
  [v12 setObject:v11 forKeyedSubscript:v6];

  v13 = [(TKTokenConnection *)v11 listener];
  v14 = [v13 endpoint];

  objc_sync_exit(v7);

  return v14;
}

- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = (void (**)(id, void *, void))a4;
  v8 = [TKTokenID alloc];
  v9 = [(TKTokenDriver *)self classID];
  id v10 = [(TKTokenID *)v8 initWithClassID:v9 instanceID:v6];

  v11 = [(TKTokenDriver *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [TKTokenConfiguration alloc];
    v14 = [(TKTokenDriver *)self context];
    v15 = [v14 configurationConnection];
    v16 = [(TKTokenConfiguration *)v13 initWithTokenID:v10 configurationConnection:v15];

    v17 = [(TKTokenConfiguration *)v16 beginTransaction];
    v18 = [(TKTokenDriver *)self delegate];
    id v27 = 0;
    v19 = [v18 tokenDriver:self tokenForConfiguration:v16 error:&v27];
    id v20 = v27;

    if (v19)
    {
      [v17 commit];
      id v21 = [(TKTokenDriver *)self endpointForToken:v19];
      v7[2](v7, v21, 0);
    }
    else
    {
      uint64_t v24 = TK_LOG_token();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenDriver acquireTokenWithInstanceID:reply:]();
      }

      [v17 commit];
      ((void (**)(id, void *, id))v7)[2](v7, 0, v20);
    }
  }
  else
  {
    uint64_t v28 = *MEMORY[0x1E4F3B890];
    __int16 v22 = [(TKTokenID *)v10 stringRepresentation];
    v29[0] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __50__TKTokenDriver_acquireTokenWithInstanceID_reply___block_invoke;
    v25[3] = &unk_1E63C7FB0;
    v25[4] = self;
    v26 = v7;
    [(TKTokenDriver *)self getTokenWithAttributes:v23 reply:v25];

    id v20 = v26;
  }
}

void __50__TKTokenDriver_acquireTokenWithInstanceID_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) endpointForToken:a2];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    id v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4);
  }
}

- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5
{
  id v15 = 0;
  v8 = (void (**)(id, uint64_t, void *, void))a5;
  v9 = [(TKTokenDriver *)self createTokenWithSlot:a3 AID:a4 error:&v15];
  id v10 = v15;
  if (v9)
  {
    uint64_t v11 = [(TKTokenDriver *)self endpointForToken:v9];
    char v12 = [v9 tokenID];
    v13 = [v12 instanceID];
    v8[2](v8, v11, v13, 0);

    v8 = (void (**)(id, uint64_t, void *, void))v11;
  }
  else
  {
    v14 = TK_LOG_token();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenDriver acquireTokenWithSlot:AID:reply:]();
    }

    ((void (**)(id, uint64_t, void *, id))v8)[2](v8, 0, 0, v10);
  }
}

- (void)releaseTokenWithInstanceID:(id)a3
{
  id v4 = a3;
  id v5 = [(TKTokenDriver *)self tokenConnections];
  objc_sync_enter(v5);
  id v6 = [(TKTokenDriver *)self tokenConnections];
  objc_super v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    v8 = [(TKTokenDriver *)self tokenConnections];
    v9 = [v8 objectForKeyedSubscript:v4];
    [v9 invalidate];

    id v10 = [(TKTokenDriver *)self tokenConnections];
    [v10 removeObjectForKey:v4];
  }
  else
  {
    id v10 = TK_LOG_token();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TKTokenDriver releaseTokenWithInstanceID:]();
    }
  }

  objc_sync_exit(v5);
}

- (void)configureWithReply:(id)a3
{
  char v12 = (void (**)(id, uint64_t, void))a3;
  id v4 = [(TKTokenDriver *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [TKTokenDriverConfiguration alloc];
    objc_super v7 = [(TKTokenDriver *)self classID];
    v8 = [(TKTokenDriver *)self context];
    v9 = [v8 configurationConnection];
    id v10 = [(TKTokenDriverConfiguration *)v6 initWithClassID:v7 configurationConnection:v9];

    uint64_t v11 = [(TKTokenDriver *)self delegate];
    [v11 tokenDriver:self configure:v10];
  }
  v12[2](v12, 1, 0);
}

- (id)createTokenWithSlot:(id)a3 AID:(id)a4 error:(id *)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"token driver does not implement any way to create new slot-based token instances";
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    *a5 = [v6 errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v7];
  }
  return 0;
}

- (void)getTokenWithAttributes:(id)a3 reply:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  char v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = @"token driver does not implement any way to create new token instances";
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v9 = [v5 errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v8];
  (*((void (**)(id, void, void *))a4 + 2))(v7, 0, v9);
}

- (void)terminate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(TKTokenDriver *)self tokenConnections];
  objc_sync_enter(v3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(TKTokenDriver *)self tokenConnections];
  char v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) invalidate];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [(TKTokenDriver *)self tokenConnections];
  [v9 removeAllObjects];

  objc_sync_exit(v3);
}

- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(TKTokenDriver *)self context];
  long long v10 = *(_OWORD *)&a4->var0[4];
  v11[0] = *(_OWORD *)a4->var0;
  v11[1] = v10;
  [v9 auditAuthOperation:v8 auditToken:v11 success:v5];
}

- (NSArray)tokenSessions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  obuint64_t j = [(TKTokenDriver *)self tokenConnections];
  objc_sync_enter(obj);
  id v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(TKTokenDriver *)self tokenConnections];
  BOOL v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v19 = v5;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v19);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v9 = [v8 sessions];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * j);
              v14 = [v8 sessions];
              uint64_t v15 = [v14 objectForKey:v13];
              [v3 addObject:v15];
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v10);
        }
      }
      BOOL v5 = v19;
      uint64_t v6 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  v16 = (void *)[v3 copy];
  objc_sync_exit(obj);

  return (NSArray *)v16;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (TKTokenDriverContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (TKTokenDriverContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSMutableDictionary)tokenConnections
{
  return self->_tokenConnections;
}

- (TKSharedResourceSlot)keepAliveResourceSlot
{
  return self->_keepAliveResourceSlot;
}

- (void)setKeepAliveResourceSlot:(id)a3
{
}

- (NSDictionary)extensionAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong((id *)&self->_keepAliveResourceSlot, 0);
  objc_storeStrong((id *)&self->_tokenConnections, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_keepAlive, 0);
}

+ (void)createDriver
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_1BED55000, v2, v3, "extension %{public}@ instantiating driver class %{public}@", v4, v5, v6, v7, v8);
}

- (void)endpointForToken:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "replacing old token with newly acquired: %@", v2, v3, v4, v5, v6);
}

- (void)acquireTokenWithInstanceID:reply:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1BED55000, v1, OS_LOG_TYPE_DEBUG, "failed to instantiate token with instanceID %@, error: %@", v2, 0x16u);
}

- (void)acquireTokenWithSlot:AID:reply:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "failed to instantiate token with slot, error: %@", v2, v3, v4, v5, v6);
}

- (void)releaseTokenWithInstanceID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1BED55000, v0, OS_LOG_TYPE_ERROR, "An attempt to release nonexistent token with instanceID=%{public}@", v1, 0xCu);
}

@end