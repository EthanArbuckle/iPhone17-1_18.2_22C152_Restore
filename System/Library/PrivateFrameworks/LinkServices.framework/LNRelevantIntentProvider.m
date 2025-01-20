@interface LNRelevantIntentProvider
- (LNRelevantIntentProvider)init;
- (void)relevantIntentsForBundleIdentifier:(id)a3 reply:(id)a4;
- (void)relevantIntentsWithReply:(id)a3;
@end

@implementation LNRelevantIntentProvider

- (void).cxx_destruct
{
}

- (void)relevantIntentsWithReply:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_1A4419000, "appintents:fetch all relevant intents", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__LNRelevantIntentProvider_relevantIntentsWithReply___block_invoke;
  v7[3] = &unk_1E5B395F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __53__LNRelevantIntentProvider_relevantIntentsWithReply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__LNRelevantIntentProvider_relevantIntentsWithReply___block_invoke_2;
  v4[3] = &unk_1E5B3A550;
  id v5 = *(id *)(a1 + 40);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 relevantIntentsWithReply:*(void *)(a1 + 40)];
}

uint64_t __53__LNRelevantIntentProvider_relevantIntentsWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)relevantIntentsForBundleIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A4419000, "appintents:fetch relevant intents for app", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__LNRelevantIntentProvider_relevantIntentsForBundleIdentifier_reply___block_invoke;
  block[3] = &unk_1E5B3A318;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  os_activity_apply(v8, block);
}

void __69__LNRelevantIntentProvider_relevantIntentsForBundleIdentifier_reply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__LNRelevantIntentProvider_relevantIntentsForBundleIdentifier_reply___block_invoke_2;
  v4[3] = &unk_1E5B3A550;
  id v5 = *(id *)(a1 + 48);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 relevantIntentsForBundleIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

uint64_t __69__LNRelevantIntentProvider_relevantIntentsForBundleIdentifier_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (LNRelevantIntentProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)LNRelevantIntentProvider;
  v2 = [(LNRelevantIntentProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.registry" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    id v5 = LNDaemonRegistryXPCInterface();
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection resume];
    id v6 = v2;
  }

  return v2;
}

@end