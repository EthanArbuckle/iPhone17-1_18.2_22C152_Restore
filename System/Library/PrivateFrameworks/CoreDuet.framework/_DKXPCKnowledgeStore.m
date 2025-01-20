@interface _DKXPCKnowledgeStore
+ (id)XPCKnowledgeStore;
+ (id)XPCUserKnowledgeStore;
- (BOOL)confirmConnectionWithError:(id *)a3;
- (BOOL)deleteObjects:(id)a3 error:(id *)a4;
- (BOOL)deleteRemoteState:(id *)a3;
- (BOOL)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4;
- (BOOL)saveObjects:(id)a3 error:(id *)a4;
- (BOOL)synchronizeWithError:(id *)a3;
- (BOOL)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (_DKXPCKnowledgeStore)init;
- (_DKXPCKnowledgeStore)initWithConnection:(id)a3;
- (_DKXPCKnowledgeStore)initWithMachServiceName:(id)a3;
- (id)deleteObjects:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (id)deviceUUID;
- (id)executeQuery:(id)a3 error:(id *)a4;
- (id)executeQuery:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7;
- (id)saveObjects:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (id)sourceDeviceIdentityFromObject:(id)a3 error:(id *)a4;
- (id)sourceDeviceIdentityWithError:(id *)a3;
- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4;
- (unint64_t)deleteAllEventsInEventStream:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7;
- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4;
- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7;
- (void)dealloc;
- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4;
- (void)executeQuery:(id)a3 responseQueue:(id)a4;
- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (void)setConnection:(id)a3;
- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 responseQueue:(id)a5 completion:(id)a6;
@end

@implementation _DKXPCKnowledgeStore

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_DKXPCKnowledgeStore;
  [(_DKXPCKnowledgeStore *)&v3 dealloc];
}

+ (id)XPCKnowledgeStore
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (_DKXPCKnowledgeStore)init
{
  return [(_DKXPCKnowledgeStore *)self initWithMachServiceName:@"com.apple.coreduetd.knowledge"];
}

- (_DKXPCKnowledgeStore)initWithMachServiceName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29268];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithMachServiceName:v5 options:0];

  v7 = [(_DKXPCKnowledgeStore *)self initWithConnection:v6];
  return v7;
}

- (_DKXPCKnowledgeStore)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DKXPCKnowledgeStore;
  v6 = [(_DKXPCKnowledgeStore *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = _DKDaemonInterface();
    [(NSXPCConnection *)v7->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v7->_connection resume];
  }

  return v7;
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_INFO, "Starting executeQuery with query %@.", (uint8_t *)&v13, 0xCu);
  }

  id v12 = [(_DKXPCKnowledgeStore *)self executeQuery:v8 synchronous:0 error:0 responseQueue:v9 withCompletion:v10];
}

- (id)executeQuery:(id)a3 error:(id *)a4
{
  id v9 = 0;
  id v5 = [(_DKXPCKnowledgeStore *)self executeQuery:a3 synchronous:1 error:&v9 responseQueue:0 withCompletion:0];
  id v6 = v9;
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v5;
}

- (id)executeQuery:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  BOOL v10 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v28;
    _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, "Starting executeQuery with query %@.", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v15 = +[_DKQuery executableQueryForQuery:v28];
  if (v15)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__26;
    v50 = __Block_byref_object_dispose__26;
    id v51 = 0;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2;
    v41[3] = &unk_1E56108C0;
    id v16 = v13;
    id v43 = v16;
    id v17 = v12;
    id v42 = v17;
    p_long long buf = &buf;
    v18 = (void *)MEMORY[0x192FB31A0](v41);
    connection = self->_connection;
    if (v10) {
      [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v18];
    }
    else {
    v26 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v18];
    }
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__26;
    v39 = __Block_byref_object_dispose__26;
    id v40 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_3;
    v29[3] = &unk_1E5610960;
    v29[4] = self;
    id v30 = v15;
    id v32 = v16;
    id v31 = v17;
    v33 = &buf;
    v34 = &v35;
    [v26 executeQuery:v28 reply:v29];
    if (a5) {
      *a5 = *(id *)(*((void *)&buf + 1) + 40);
    }
    id v25 = (id)v36[5];

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v20 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:](v20);
    }

    if (v13)
    {
      if (!v12) {
        -[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:]();
      }
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke;
      v45[3] = &unk_1E560D950;
      id v46 = v13;
      v21 = v45;
      v22 = v12;
      v23 = (void (*)(uint64_t))os_transaction_create();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v48 = (uint64_t)__cd_dispatch_async_capture_tx_block_invoke_11;
      v49 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E560D978;
      v50 = v23;
      id v51 = v21;
      v24 = v23;
      dispatch_async(v22, &buf);
    }
    id v25 = 0;
  }

  return v25;
}

+ (id)XPCUserKnowledgeStore
{
  id v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.coreduetd.knowledge"];
  return v2;
}

- (id)saveObjects:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v10 count];
    _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_INFO, "Starting saveObjects with %lu objects.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__26;
  v34 = __Block_byref_object_dispose__26;
  id v35 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke;
  v27[3] = &unk_1E56108C0;
  id v14 = v12;
  id v29 = v14;
  id v15 = v11;
  id v28 = v15;
  p_long long buf = &buf;
  id v16 = (void *)MEMORY[0x192FB31A0](v27);
  connection = self->_connection;
  if (v8) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  }
  else {
  v18 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_3;
  v23[3] = &unk_1E56108E8;
  v23[4] = self;
  id v19 = v14;
  id v25 = v19;
  id v20 = v15;
  id v24 = v20;
  v26 = &buf;
  [v18 saveObjects:v10 reply:v23];
  id v21 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v21;
}

- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v5 = [(_DKXPCKnowledgeStore *)self saveObjects:a3 synchronous:0 responseQueue:a4 withCompletion:a5];
}

- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v6 = [(_DKXPCKnowledgeStore *)self saveObjects:a3 synchronous:0 responseQueue:a5 withCompletion:a6];
}

- (BOOL)saveObjects:(id)a3 error:(id *)a4
{
  id v5 = [(_DKXPCKnowledgeStore *)self saveObjects:a3 synchronous:1 responseQueue:0 withCompletion:0];
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return v6 == 0;
}

- (id)deleteObjects:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v10 count];
    _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_INFO, "Starting deleteObjects with %lu objects.", (uint8_t *)&buf, 0xCu);
  }

  if ([v10 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__26;
    id v40 = __Block_byref_object_dispose__26;
    id v41 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2;
    v31[3] = &unk_1E56108C0;
    id v14 = v12;
    id v33 = v14;
    id v15 = v11;
    id v32 = v15;
    p_long long buf = &buf;
    id v16 = (void *)MEMORY[0x192FB31A0](v31);
    connection = self->_connection;
    if (v8) {
      [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
    }
    else {
    id v24 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
    }
    id v25 = (void *)MEMORY[0x192FB2F20]();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_3;
    v27[3] = &unk_1E56108E8;
    void v27[4] = self;
    id v29 = v14;
    id v28 = v15;
    id v30 = &buf;
    [v24 deleteObjects:v10 reply:v27];

    id v23 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v18 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_INFO, "Early out because no valid objects were provided.", (uint8_t *)&buf, 2u);
    }

    if (v12)
    {
      if (!v11) {
        -[_DKXPCKnowledgeStore deleteObjects:synchronous:responseQueue:withCompletion:]();
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke;
      v35[3] = &unk_1E560D950;
      id v36 = v12;
      id v19 = v35;
      id v20 = v11;
      id v21 = (void (*)(uint64_t))os_transaction_create();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v38 = (uint64_t)__cd_dispatch_async_capture_tx_block_invoke_11;
      v39 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E560D978;
      id v40 = v21;
      id v41 = v19;
      v22 = v21;
      dispatch_async(v20, &buf);
    }
    id v23 = 0;
  }

  return v23;
}

- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v5 = [(_DKXPCKnowledgeStore *)self deleteObjects:a3 synchronous:0 responseQueue:a4 withCompletion:a5];
}

- (BOOL)deleteObjects:(id)a3 error:(id *)a4
{
  id v5 = [(_DKXPCKnowledgeStore *)self deleteObjects:a3 synchronous:1 responseQueue:0 withCompletion:0];
  id v6 = v5;
  if (a4 && v5) {
    *a4 = v5;
  }

  return v6 == 0;
}

- (unint64_t)deleteAllEventsInEventStream:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  BOOL v10 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (v12)
  {
    id v16 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_INFO, "Starting deleteAllEventsInEventStream with stream %@.", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__26;
    id v46 = __Block_byref_object_dispose__26;
    id v47 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_11;
    v33[3] = &unk_1E56108C0;
    id v17 = v15;
    id v35 = v17;
    v18 = v13;
    v34 = v18;
    p_long long buf = &buf;
    id v19 = (void *)MEMORY[0x192FB31A0](v33);
    connection = self->_connection;
    if (v10) {
      [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v19];
    }
    else {
    id v25 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v19];
    }
    v26 = [v12 name];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_3;
    v28[3] = &unk_1E5610938;
    v28[4] = self;
    id v31 = &v37;
    id v32 = &buf;
    id v30 = v17;
    id v29 = v18;
    [v25 deleteAllEventsInEventStreamNamed:v26 reply:v28];

    if (a5) {
      *a5 = *(id *)(*((void *)&buf + 1) + 40);
    }
    unint64_t v24 = v38[3];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    if (v14)
    {
      if (!v13) {
        -[_DKXPCKnowledgeStore deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:]();
      }
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke;
      v41[3] = &unk_1E560D950;
      id v42 = v14;
      id v21 = v41;
      v22 = (void (*)(uint64_t))os_transaction_create();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v44 = (uint64_t)__cd_dispatch_async_capture_tx_block_invoke_11;
      v45 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E560D978;
      id v46 = v22;
      id v47 = v21;
      id v23 = v22;
      dispatch_async(v13, &buf);
    }
    unint64_t v24 = 0;
    if (a5) {
      *a5 = 0;
    }
  }

  return v24;
}

- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
}

- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4
{
  id v9 = 0;
  unint64_t v5 = [(_DKXPCKnowledgeStore *)self deleteAllEventsInEventStream:a3 synchronous:1 error:&v9 responseQueue:0 withCompletion:0];
  id v6 = v9;
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v5;
}

- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 synchronous:(BOOL)a4 error:(id *)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  BOOL v10 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (v12)
  {
    id v16 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = objc_msgSend(v12, "cd_sanitizeForLogging");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_INFO, "Starting deleteAllEventsMatchingPredicate with predicate %@.", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__26;
    id v46 = __Block_byref_object_dispose__26;
    id v47 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_14;
    v33[3] = &unk_1E56108C0;
    id v18 = v15;
    id v35 = v18;
    id v19 = v13;
    v34 = v19;
    p_long long buf = &buf;
    id v20 = (void *)MEMORY[0x192FB31A0](v33);
    connection = self->_connection;
    if (v10) {
      [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v20];
    }
    else {
    v26 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_3;
    v28[3] = &unk_1E5610938;
    v28[4] = self;
    id v31 = &v37;
    id v32 = &buf;
    id v30 = v18;
    id v29 = v19;
    [v26 deleteAllEventsMatchingPredicate:v12 reply:v28];
    if (a5) {
      *a5 = *(id *)(*((void *)&buf + 1) + 40);
    }
    unint64_t v25 = v38[3];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    if (v14)
    {
      if (!v13) {
        -[_DKXPCKnowledgeStore deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:]();
      }
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke;
      v41[3] = &unk_1E560D950;
      id v42 = v14;
      v22 = v41;
      id v23 = (void (*)(uint64_t))os_transaction_create();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v44 = (uint64_t)__cd_dispatch_async_capture_tx_block_invoke_11;
      v45 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E560D978;
      id v46 = v23;
      id v47 = v22;
      unint64_t v24 = v23;
      dispatch_async(v13, &buf);
    }
    unint64_t v25 = 0;
    if (a5) {
      *a5 = 0;
    }
  }

  return v25;
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
}

- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v9 = 0;
  unint64_t v5 = [(_DKXPCKnowledgeStore *)self deleteAllEventsMatchingPredicate:a3 synchronous:1 error:&v9 responseQueue:0 withCompletion:0];
  id v6 = v9;
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v5;
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4
{
}

- (BOOL)synchronizeWithError:(id *)a3
{
  unint64_t v5 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Starting synchronizeWithError.", buf, 2u);
  }

  *(void *)long long buf = 0;
  id v18 = buf;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__26;
  id v21 = __Block_byref_object_dispose__26;
  id v22 = 0;
  connection = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45___DKXPCKnowledgeStore_synchronizeWithError___block_invoke;
  v16[3] = &unk_1E56104C8;
  v16[4] = buf;
  v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45___DKXPCKnowledgeStore_synchronizeWithError___block_invoke_21;
  v11[3] = &unk_1E5610988;
  v11[4] = buf;
  v11[5] = &v12;
  [v7 synchronizeWithReply:v11];
  if (a3)
  {
    BOOL v8 = (void *)*((void *)v18 + 5);
    if (v8) {
      *a3 = v8;
    }
  }
  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
  return v9;
}

- (BOOL)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 error:(id *)a5
{
  id v8 = a4;
  char v9 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "Starting synchronizeWithUrgency.", buf, 2u);
  }

  *(void *)long long buf = 0;
  id v22 = buf;
  uint64_t v23 = 0x3032000000;
  unint64_t v24 = __Block_byref_object_copy__26;
  unint64_t v25 = __Block_byref_object_dispose__26;
  id v26 = 0;
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60___DKXPCKnowledgeStore_synchronizeWithUrgency_client_error___block_invoke;
  v20[3] = &unk_1E56104C8;
  v20[4] = buf;
  id v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v20];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60___DKXPCKnowledgeStore_synchronizeWithUrgency_client_error___block_invoke_22;
  v15[3] = &unk_1E5610988;
  v15[4] = buf;
  v15[5] = &v16;
  [v11 synchronizeWithUrgency:a3 client:v8 reply:v15];
  if (a5)
  {
    uint64_t v12 = (void *)*((void *)v22 + 5);
    if (v12) {
      *a5 = v12;
    }
  }
  char v13 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 responseQueue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  char v13 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_INFO, "Starting async synchronizeWithUrgency.", buf, 2u);
  }

  connection = self->_connection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke;
  v23[3] = &unk_1E56109B0;
  id v15 = v11;
  id v25 = v15;
  id v16 = v10;
  id v24 = v16;
  id v17 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_3;
  v20[3] = &unk_1E56109D8;
  id v21 = v16;
  id v22 = v15;
  v20[4] = self;
  id v18 = v16;
  id v19 = v15;
  [v17 synchronizeWithUrgency:a3 client:v12 reply:v20];
}

- (BOOL)deleteRemoteState:(id *)a3
{
  unint64_t v5 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Starting deleteRemoteState.", buf, 2u);
  }

  *(void *)long long buf = 0;
  id v18 = buf;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__26;
  id v21 = __Block_byref_object_dispose__26;
  id v22 = 0;
  connection = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42___DKXPCKnowledgeStore_deleteRemoteState___block_invoke;
  v16[3] = &unk_1E56104C8;
  v16[4] = buf;
  v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42___DKXPCKnowledgeStore_deleteRemoteState___block_invoke_24;
  v11[3] = &unk_1E5610988;
  v11[4] = buf;
  v11[5] = &v12;
  [v7 deleteRemoteState:v11];
  if (a3)
  {
    id v8 = (void *)*((void *)v18 + 5);
    if (v8) {
      *a3 = v8;
    }
  }
  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
  return v9;
}

- (id)sourceDeviceIdentityFromObject:(id)a3 error:(id *)a4
{
  v4 = [a3 source];
  unint64_t v5 = [v4 syncDeviceID];

  return v5;
}

- (id)sourceDeviceIdentityWithError:(id *)a3
{
  unint64_t v5 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Starting sourceDeviceIdentityWithError.", buf, 2u);
  }

  *(void *)long long buf = 0;
  id v20 = buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__26;
  uint64_t v23 = __Block_byref_object_dispose__26;
  id v24 = 0;
  connection = self->_connection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54___DKXPCKnowledgeStore_sourceDeviceIdentityWithError___block_invoke;
  v18[3] = &unk_1E56104C8;
  v18[4] = buf;
  v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__26;
  id v16 = __Block_byref_object_dispose__26;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54___DKXPCKnowledgeStore_sourceDeviceIdentityWithError___block_invoke_25;
  v11[3] = &unk_1E5610A00;
  v11[4] = buf;
  v11[5] = &v12;
  [v7 sourceDeviceIdentityWithReply:v11];
  if (a3)
  {
    id v8 = (void *)*((void *)v20 + 5);
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
  return v9;
}

- (id)deviceUUID
{
  objc_super v3 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_INFO, "Starting deviceUUID.", buf, 2u);
  }

  v4 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_77];
  *(void *)long long buf = 0;
  id v9 = buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__26;
  uint64_t v12 = __Block_byref_object_dispose__26;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34___DKXPCKnowledgeStore_deviceUUID__block_invoke_26;
  v7[3] = &unk_1E5610A28;
  v7[4] = buf;
  [v4 deviceUUIDWithReply:v7];
  id v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4
{
  v7 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "Starting disableSyncPolicy.", v9, 2u);
  }

  id v8 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_28];
  [v8 disableSyncPolicyForFeature:a3 transportType:a4 withReply:&__block_literal_global_31_0];
}

- (BOOL)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4
{
  v7 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "Starting isSyncPolicyDisabled.", buf, 2u);
  }

  id v8 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_33_0];
  *(void *)long long buf = 0;
  id v13 = buf;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69___DKXPCKnowledgeStore_isSyncPolicyDisabledForFeature_transportType___block_invoke_34;
  v11[3] = &unk_1E5610A70;
  v11[4] = buf;
  [v8 isSyncPolicyDisabledForFeature:a3 transportType:a4 withReply:v11];
  uint8_t v9 = v13[24];
  _Block_object_dispose(buf, 8);

  return v9;
}

- (BOOL)confirmConnectionWithError:(id *)a3
{
  id v5 = _os_activity_create(&dword_18ECEB000, "Duet: confirmConnectionWithError", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "Starting confirmConnectionWithError.", (uint8_t *)&state, 2u);
  }

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__26;
  uint64_t v21 = __Block_byref_object_dispose__26;
  id v22 = 0;
  v7 = [(_DKXPCKnowledgeStore *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51___DKXPCKnowledgeStore_confirmConnectionWithError___block_invoke;
  v17[3] = &unk_1E56104C8;
  v17[4] = &state;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v17];

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51___DKXPCKnowledgeStore_confirmConnectionWithError___block_invoke_35;
  v12[3] = &unk_1E5610988;
  v12[4] = &v13;
  v12[5] = &state;
  [v8 confirmDatabaseConnectionWithReply:v12];
  if (a3)
  {
    uint8_t v9 = *(void **)(state.opaque[1] + 40);
    if (v9) {
      *a3 = v9;
    }
  }
  char v10 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (void)deleteObjects:synchronous:responseQueue:withCompletion:.cold.1()
{
}

- (void)deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:.cold.1()
{
}

- (void)deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:.cold.1()
{
}

- (void)executeQuery:synchronous:error:responseQueue:withCompletion:.cold.1()
{
}

- (void)executeQuery:(NSObject *)a1 synchronous:error:responseQueue:withCompletion:.cold.2(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v2 = +[_DKQuery queryNotExecutableError];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, a1, OS_LOG_TYPE_ERROR, "Completed executeQuery with success=0. Error: %@.", v3, 0xCu);
}

@end