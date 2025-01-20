@interface CSSearchConnection
+ (id)sharedCSUserFSConnection;
+ (id)sharedSearchConnection;
- (CSSearchConnection)init;
- (CSSearchConnection)initWithMachServiceName:(id)a3;
- (NSMutableDictionary)queries;
- (id)createXPCDictionaryForQuery:(id)a3 queryID:(int64_t)a4 queryContext:(id)a5 needsInitialization:(BOOL)a6;
- (id)queryForID:(id)a3;
- (id)removeQueryForID:(id)a3;
- (void)cancelQuery:(unint64_t)a3;
- (void)handleError:(id)a3;
- (void)handleReply:(id)a3;
- (void)preheat:(id)a3;
- (void)sendMessageAsync:(id)a3 completion:(id)a4;
- (void)setQueries:(id)a3;
- (void)setQuery:(id)a3 forID:(id)a4;
- (void)startQuery:(id)a3 context:(id)a4;
- (void)waitForGameModeEnd:(id)a3 queryID:(int64_t)a4;
@end

@implementation CSSearchConnection

- (void)startQuery:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 queryString];
  uint64_t v9 = [v7 queryID];
  v10 = [NSNumber numberWithInteger:v9];
  [(CSSearchConnection *)self setQuery:v6 forID:v10];

  [v7 setQos:qos_class_self()];
  v11 = [(CSSearchConnection *)self createXPCDictionaryForQuery:v8 queryID:v9 queryContext:v7 needsInitialization:[(CSXPCConnection *)self previouslyInitialized] ^ 1];
  v12 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v6 debugDescriptionWithQueryString:0];
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v9;
    __int16 v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_18D0E3000, v12, OS_LOG_TYPE_DEFAULT, "qid=%ld - Starting %@", buf, 0x16u);
  }
  v14 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = [v6 debugDescriptionWithQueryString:0];
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v9;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_18D0E3000, v14, OS_LOG_TYPE_INFO, "qid=%ld - %@", buf, 0x16u);
  }
  v16 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchConnection startQuery:context:](v6, v9, v16);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CSSearchConnection_startQuery_context___block_invoke;
  aBlock[3] = &unk_1E554C768;
  aBlock[4] = self;
  uint64_t v22 = v9;
  id v17 = v11;
  id v21 = v17;
  v18 = _Block_copy(aBlock);
  v19 = v18;
  if (sGameModeSuspended == 1) {
    [(CSSearchConnection *)self waitForGameModeEnd:v18 queryID:v9];
  }
  else {
    (*((void (**)(void *))v18 + 2))(v18);
  }

  objc_destroyWeak((id *)buf);
}

- (void)setQuery:(id)a3 forID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self->_queries;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)self->_queries setObject:v8 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (id)createXPCDictionaryForQuery:(id)a3 queryID:(int64_t)a4 queryContext:(id)a5 needsInitialization:(BOOL)a6
{
  id v8 = a5;
  id v9 = a3;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "command-type", "search-type");
  xpc_dictionary_set_string(v10, "command", "startQuery");
  id v11 = v9;
  v12 = (const char *)[v11 UTF8String];

  if (v12) {
    xpc_dictionary_set_string(v10, "query", v12);
  }
  xpc_dictionary_set_uint64(v10, "qid", a4);
  v13 = objc_msgSend(v8, "xpc_dictionary");

  xpc_dictionary_set_value(v10, "context", v13);

  return v10;
}

uint64_t __50__CSSearchConnection_sendMessageAsync_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__CSSearchConnection_startQuery_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = csquery_xpc_dictionary_decode_status_with_error(v3);
  if (v4)
  {
    v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 134218498;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      v14 = v4;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_18D0E3000, v5, OS_LOG_TYPE_ERROR, "### qid=%ld error %@ reply:%@", (uint8_t *)&v11, 0x20u);
    }

    id v6 = *(void **)(a1 + 32);
    id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    id v8 = [v6 removeQueryForID:v7];

    [v8 didFinishWithError:v4];
  }
  id v9 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __41__CSSearchConnection_startQuery_context___block_invoke_2_cold_1();
  }
}

void __41__CSSearchConnection_startQuery_context___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v4 = [v2 queryForID:v3];

  if (v4)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__CSSearchConnection_startQuery_context___block_invoke_2;
    v15[3] = &unk_1E554C740;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v15[4] = *(void *)(a1 + 32);
    v15[5] = v6;
    [v2 sendMessageAsync:v5 completion:v15];
  }
  else
  {
    id v7 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __41__CSSearchConnection_startQuery_context___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)handleReply:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "qid");
  uint64_t v6 = [NSNumber numberWithInteger:uint64];
  id v7 = [(CSSearchConnection *)self queryForID:v6];

  uint64_t v8 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchConnection handleReply:]();
  }

  if (v7)
  {
    uint64_t v9 = xpc_dictionary_get_uint64(v4, "t");
    uint64_t v10 = +[CSXPCConnection dataWrapperForKey:"rd" sizeKey:"rdl" fromXPCDictionary:v4];
    uint64_t v11 = +[CSXPCConnection dataWrapperForKey:"od" sizeKey:"odl" fromXPCDictionary:v4];
    string = xpc_dictionary_get_string(v4, "pc");
    uint64_t v13 = (uint64_t)string;
    if (string && !strncmp(string, "Priority", 9uLL) && (hasInternalCSEntitlement() & 1) == 0) {
      uint64_t v13 = [(id)*MEMORY[0x1E4F28358] UTF8String];
    }
    if (v9 == 2)
    {
      uint64_t v14 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchConnection handleReply:]();
      }
    }
    else
    {
      if (v9 != 1 || ([v7 live] & 1) != 0)
      {
LABEL_15:
        id v16 = [v10 data];
        uint64_t v17 = [v11 data];
        if (v13)
        {
          v18 = [NSString stringWithUTF8String:v13];
        }
        else
        {
          v18 = 0;
        }
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __34__CSSearchConnection_handleReply___block_invoke;
        v25[3] = &unk_1E554C4D0;
        id v26 = v10;
        id v27 = v11;
        id v28 = v4;
        uint64_t v29 = uint64;
        id v19 = v11;
        id v20 = v10;
        [v7 didReturnResults:v9 resultsData:v16 oidData:v17 protectionClass:v18 completionHandler:v25];
        if (v13) {

        }
        goto LABEL_21;
      }
      uint64_t v14 = [NSNumber numberWithInteger:uint64];
      id v15 = [(CSSearchConnection *)self removeQueryForID:v14];
    }

    goto LABEL_15;
  }
LABEL_21:
  xpc_dictionary_get_remote_connection(v4);
  id v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  v23 = reply;
  if (v21 && reply)
  {
    if (v7) {
      int64_t v24 = 0;
    }
    else {
      int64_t v24 = -1;
    }
    xpc_dictionary_set_int64(reply, "status", v24);
    xpc_connection_send_message(v21, v23);
  }
}

- (id)queryForID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_queries;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)self->_queries objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__CSSearchConnection_sendMessageAsync_completion___block_invoke;
  v9[3] = &unk_1E55499F0;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)CSSearchConnection;
  id v7 = v6;
  [(CSXPCConnection *)&v8 sendMessageAsync:a3 completion:v9];
}

- (id)removeQueryForID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_queries;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_queries objectForKeyedSubscript:v4];
  if (v6) {
    [(NSMutableDictionary *)self->_queries removeObjectForKey:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

+ (id)sharedSearchConnection
{
  if (onceTokenShared != -1) {
    dispatch_once(&onceTokenShared, &__block_literal_global_1335);
  }
  id v2 = (void *)sCSSearchConnection;

  return v2;
}

void __34__CSSearchConnection_handleReply___block_invoke()
{
  id v0 = self;
  id v1 = self;
  id v2 = self;
  id v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __34__CSSearchConnection_handleReply___block_invoke_cold_1();
  }
}

uint64_t __44__CSSearchConnection_sharedSearchConnection__block_invoke()
{
  sCSSearchConnection = objc_alloc_init(CSSearchConnection);

  return MEMORY[0x1F41817F8]();
}

- (CSSearchConnection)init
{
  return [(CSSearchConnection *)self initWithMachServiceName:sConnectionName_0];
}

- (CSSearchConnection)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  if (initWithMachServiceName__onceToken != -1) {
    dispatch_once(&initWithMachServiceName__onceToken, &__block_literal_global_1339);
  }
  v9.receiver = self;
  v9.super_class = (Class)CSSearchConnection;
  uint64_t v5 = [(CSXPCConnection *)&v9 initWithMachServiceName:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    queries = v5->_queries;
    v5->_queries = (NSMutableDictionary *)v6;
  }
  return v5;
}

void __46__CSSearchConnection_initWithMachServiceName___block_invoke()
{
}

void __46__CSSearchConnection_initWithMachServiceName___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    sGameModeSuspended = 1;
  }
  else
  {
    sGameModeSuspended = 0;
    id v2 = (void *)sGameModeEndBlocks;
    if (sGameModeEndBlocks)
    {
      sGameModeEndBlocks = 0;
      id v3 = v2;

      [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1345];
    }
  }
}

+ (id)sharedCSUserFSConnection
{
  if (sharedCSUserFSConnection_onceToken != -1) {
    dispatch_once(&sharedCSUserFSConnection_onceToken, &__block_literal_global_1337);
  }
  id v2 = (void *)sCSUserFSConnection;

  return v2;
}

uint64_t __46__CSSearchConnection_sharedCSUserFSConnection__block_invoke()
{
  sCSUserFSConnection = [[CSSearchConnection alloc] initWithMachServiceName:@"com.apple.spotlight.userfs"];

  return MEMORY[0x1F41817F8]();
}

void __46__CSSearchConnection_initWithMachServiceName___block_invoke_3(int a1, int a2, void *aBlock)
{
  id v3 = (void (**)(void))_Block_copy(aBlock);
  v3[2]();
}

- (void)handleError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSSearchConnection;
  [(CSXPCConnection *)&v16 handleError:v4];
  uint64_t v5 = self->_queries;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)self->_queries allValues];
  [(NSMutableDictionary *)self->_queries removeAllObjects];
  objc_sync_exit(v5);

  if ([v6 count])
  {
    if (v4 == (id)MEMORY[0x1E4F14520]) {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];
    }
    else {
    id v7 = +[CSSearchQuery _makeQueryErrorWithErrorCode:-2001 description:0 underlyingError:0];
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "handleError:", v7, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)preheat:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command-type", "search-type");
  xpc_dictionary_set_string(v5, "command", "preheat");
  if (v4)
  {
    +[CSXPCConnection dictionary:v5 setStringArray:v4 forKey:"pcs"];
    uint64_t v6 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      id v7 = "issue preheat %@";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    uint64_t v6 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      id v7 = "issue preheat";
      id v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_6;
    }
  }

  [(CSXPCConnection *)self sendMessageAsync:v5];
}

- (void)waitForGameModeEnd:(id)a3 queryID:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = gGameModeNotificationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__CSSearchConnection_waitForGameModeEnd_queryID___block_invoke;
  v8[3] = &unk_1E554C718;
  id v9 = v5;
  int64_t v10 = a4;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __49__CSSearchConnection_waitForGameModeEnd_queryID___block_invoke(uint64_t a1)
{
  if (sGameModeSuspended == 1)
  {
    id v2 = (void *)sGameModeEndBlocks;
    if (!sGameModeEndBlocks)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v4 = (void *)sGameModeEndBlocks;
      sGameModeEndBlocks = (uint64_t)v3;

      id v2 = (void *)sGameModeEndBlocks;
    }
    id v7 = _Block_copy(*(const void **)(a1 + 32));
    id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    [v2 setObject:v7 forKey:v5];
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

- (void)cancelQuery:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command-type", "search-type");
  xpc_dictionary_set_string(v5, "command", "cancelQuery");
  xpc_dictionary_set_uint64(v5, "qid", a3);
  if (sGameModeSuspended == 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__CSSearchConnection_cancelQuery___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)gGameModeNotificationQueue, block);
  }
  uint64_t v6 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v10 = a3;
    _os_log_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_DEFAULT, "qid=%ld - Canceling", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CSSearchConnection_cancelQuery___block_invoke_1359;
  v7[3] = &unk_1E554C740;
  v7[4] = self;
  v7[5] = a3;
  [(CSSearchConnection *)self sendMessageAsync:v5 completion:v7];
}

void __34__CSSearchConnection_cancelQuery___block_invoke(uint64_t a1)
{
  id v1 = (void *)sGameModeEndBlocks;
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  [v1 removeObjectForKey:v2];
}

void __34__CSSearchConnection_cancelQuery___block_invoke_1359(uint64_t a1, void *a2)
{
  id v3 = csquery_xpc_dictionary_decode_status_with_error(a2);
  if (v3)
  {
    id v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __34__CSSearchConnection_cancelQuery___block_invoke_1359_cold_1();
    }
  }
  xpc_object_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v7 = (id)[v5 removeQueryForID:v6];
}

- (NSMutableDictionary)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)handleReply:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  qos_class_self();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_6(&dword_18D0E3000, v0, v1, "[QoS] %u qid=%ld - gather ended", v2, v3, v4, v5, v6);
}

- (void)handleReply:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  qos_class_self();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_6(&dword_18D0E3000, v0, v1, "[QoS] %u qid=%ld - handleReply", v2, v3, v4, v5, v6);
}

void __34__CSSearchConnection_handleReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_3();
  qos_class_self();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_6(&dword_18D0E3000, v0, v1, "[QoS] %u qid=%ld didReturnResults", v2, v3, v4, v5, v6);
}

- (void)startQuery:(NSObject *)a3 context:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  qos_class_t v6 = qos_class_self();
  id v7 = [a1 debugDescriptionWithQueryString:1];
  v8[0] = 67109634;
  v8[1] = v6;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  _os_log_debug_impl(&dword_18D0E3000, a3, OS_LOG_TYPE_DEBUG, "[QoS] %u qid=%ld - Starting %@", (uint8_t *)v8, 0x1Cu);
}

void __41__CSSearchConnection_startQuery_context___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__CSSearchConnection_startQuery_context___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_3();
  qos_class_self();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_6(&dword_18D0E3000, v0, v1, "[QoS] %u qid=%ld sendMessageAsync response", v2, v3, v4, v5, v6);
}

void __34__CSSearchConnection_cancelQuery___block_invoke_1359_cold_1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10_0(&dword_18D0E3000, v0, v1, "### cancel qid=%ld error %@");
}

@end