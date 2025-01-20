@interface CHPluginHelper
- (CHPluginHelper)init;
- (id)recentCallsWithLimitingTypes:(unsigned int)a3 error:(id *)a4;
- (unint64_t)unreadCallCountWithError:(id *)a3;
- (void)recentCallsWithLimitingTypes:(unsigned int)a3 completionHandler:(id)a4;
- (void)unreadCallCountWithCompletionHandler:(id)a3;
@end

@implementation CHPluginHelper

- (CHPluginHelper)init
{
  v12.receiver = self;
  v12.super_class = (Class)CHPluginHelper;
  v2 = [(CHPluginHelper *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v4 = [v3 initWithMachServiceName:kPluginHelperServiceIdentifier options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F12BB420];
    interface = v2->_interface;
    v2->_interface = (NSXPCInterface *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    [(NSXPCInterface *)v2->_interface setClasses:v10 forSelector:sel_recentCallsWithCallType_withReply_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v2->_interface];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (id)recentCallsWithLimitingTypes:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CHPluginHelper_recentCallsWithLimitingTypes_error___block_invoke;
  v12[3] = &unk_1E61C84C0;
  v12[4] = &v19;
  v12[5] = &v13;
  v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__CHPluginHelper_recentCallsWithLimitingTypes_error___block_invoke_2;
  v11[3] = &unk_1E61C84E8;
  v11[4] = &v19;
  v11[5] = &v13;
  [v7 recentCallsWithCallType:v5 withReply:v11];

  if (a4)
  {
    v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __53__CHPluginHelper_recentCallsWithLimitingTypes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __53__CHPluginHelper_recentCallsWithLimitingTypes_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)recentCallsWithLimitingTypes:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__CHPluginHelper_recentCallsWithLimitingTypes_completionHandler___block_invoke;
  v13[3] = &unk_1E61C8510;
  id v8 = v6;
  id v14 = v8;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CHPluginHelper_recentCallsWithLimitingTypes_completionHandler___block_invoke_2;
  v11[3] = &unk_1E61C8538;
  id v12 = v8;
  id v10 = v8;
  [v9 recentCallsWithCallType:v4 withReply:v11];
}

uint64_t __65__CHPluginHelper_recentCallsWithLimitingTypes_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__CHPluginHelper_recentCallsWithLimitingTypes_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)unreadCallCountWithError:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5;
  uint64_t v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__CHPluginHelper_unreadCallCountWithError___block_invoke;
  v10[3] = &unk_1E61C84C0;
  v10[4] = &v17;
  v10[5] = &v11;
  uint64_t v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__CHPluginHelper_unreadCallCountWithError___block_invoke_2;
  v9[3] = &unk_1E61C8560;
  v9[4] = &v17;
  v9[5] = &v11;
  [v5 unreadCallCount:v9];

  if (a3)
  {
    id v6 = (void *)v12[5];
    if (v6) {
      *a3 = v6;
    }
  }
  unint64_t v7 = v18[3];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __43__CHPluginHelper_unreadCallCountWithError___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void __43__CHPluginHelper_unreadCallCountWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)unreadCallCountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CHPluginHelper_unreadCallCountWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E61C8510;
  id v6 = v4;
  id v12 = v6;
  unint64_t v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CHPluginHelper_unreadCallCountWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E61C8588;
  id v10 = v6;
  id v8 = v6;
  [v7 unreadCallCount:v9];
}

uint64_t __55__CHPluginHelper_unreadCallCountWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__CHPluginHelper_unreadCallCountWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end