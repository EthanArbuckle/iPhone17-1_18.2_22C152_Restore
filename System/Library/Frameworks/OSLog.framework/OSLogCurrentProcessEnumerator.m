@interface OSLogCurrentProcessEnumerator
- (OSLogCurrentProcessEnumerator)initWithOptions:(unint64_t)a3 predicate:(id)a4 position:(id)a5;
- (id)nextObject;
- (void)dealloc;
@end

@implementation OSLogCurrentProcessEnumerator

- (void).cxx_destruct
{
}

- (id)nextObject
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v2 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_39];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke_40;
  v5[3] = &unk_1E6CA1E20;
  v5[4] = &v6;
  [v2 getNextOSLogEntryWithReply:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke_40(uint64_t a1, void *a2)
{
}

void __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_error_impl(&dword_1DC757000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connectionToService invalidate];
  v3.receiver = self;
  v3.super_class = (Class)OSLogCurrentProcessEnumerator;
  [(OSLogCurrentProcessEnumerator *)&v3 dealloc];
}

- (OSLogCurrentProcessEnumerator)initWithOptions:(unint64_t)a3 predicate:(id)a4 position:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)OSLogCurrentProcessEnumerator;
  v9 = [(OSLogCurrentProcessEnumerator *)&v23 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.OSLogService"];
    connectionToService = v9->_connectionToService;
    v9->_connectionToService = (NSXPCConnection *)v10;

    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37CA788];
    [(NSXPCConnection *)v9->_connectionToService setRemoteObjectInterface:v12];

    [(NSXPCConnection *)v9->_connectionToService resume];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    v13 = [(NSXPCConnection *)v9->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_442];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke_37;
    v16[3] = &unk_1E6CA1DF8;
    v16[4] = &v17;
    [v13 setUpWithPredicate:v7 reply:v16];

    if (v18[5]) {
      v14 = 0;
    }
    else {
      v14 = v9;
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v4;
      _os_log_error_impl(&dword_1DC757000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Caught error: %@", (uint8_t *)&v5, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_error_impl(&dword_1DC757000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v3, 0xCu);
  }
}

@end