@interface LNSuggestionsProvider
- (LNSuggestionsProvider)init;
- (NSXPCConnection)connection;
- (id)suggestedActionsForSuggestionsRequests:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation LNSuggestionsProvider

- (void).cxx_destruct
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (id)suggestedActionsForSuggestionsRequests:(id)a3 error:(id *)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6399;
  v30 = __Block_byref_object_dispose__6400;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6399;
  v24 = __Block_byref_object_dispose__6400;
  id v25 = 0;
  connection = self->_connection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__LNSuggestionsProvider_suggestedActionsForSuggestionsRequests_error___block_invoke;
  v19[3] = &unk_1E5B3A3E8;
  v19[4] = &v26;
  v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__LNSuggestionsProvider_suggestedActionsForSuggestionsRequests_error___block_invoke_2;
  v18[3] = &unk_1E5B39198;
  v18[4] = &v20;
  v18[5] = &v26;
  [v8 suggestedActionsForSuggestionsRequests:v6 reply:v18];

  v9 = (void *)v21[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v27[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v13 = [MEMORY[0x1E4F28B50] mainBundle];
      v14 = [v13 localizedStringForKey:@"Empty result" value:&stru_1EF7D9D20 table:0];
      v33[0] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LNSuggestionsProviderErrorDomain" code:9003 userInfo:v15];

      id v17 = v16;
      *a4 = v17;
    }
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v9;
}

void __70__LNSuggestionsProvider_suggestedActionsForSuggestionsRequests_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__LNSuggestionsProvider_suggestedActionsForSuggestionsRequests_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LNSuggestionsProvider;
  [(LNSuggestionsProvider *)&v3 dealloc];
}

- (LNSuggestionsProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)LNSuggestionsProvider;
  v2 = [(LNSuggestionsProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.suggestions" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    id v5 = LNDaemonSuggestionsXPCInterface();
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection resume];
    id v6 = v2;
  }

  return v2;
}

@end