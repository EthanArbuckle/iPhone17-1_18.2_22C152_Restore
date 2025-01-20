@interface CSLifeFSConnection
+ (id)sharedConnection;
- (void)handleError:(id)a3;
- (void)sendMessageAsync:(id)a3 completion:(id)a4;
@end

@implementation CSLifeFSConnection

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedConnection_sCSUserFSConnection;

  return v2;
}

void __38__CSLifeFSConnection_sharedConnection__block_invoke()
{
  memset(&v3, 0, sizeof(v3));
  if (stat("/System/Library/LaunchDaemons/com.apple.spotlight.IndexAgent.plist", &v3))
  {
    v0 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_INFO, "com.apple.spotlight.IndexAgent not installed", v2, 2u);
    }
  }
  else
  {
    v1 = [(CSXPCConnection *)[CSLifeFSConnection alloc] initWithMachServiceName:@"com.apple.spotlight.userfs"];
    v0 = sharedConnection_sCSUserFSConnection;
    sharedConnection_sCSUserFSConnection = (uint64_t)v1;
  }
}

- (void)handleError:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CSLifeFSConnection;
  [(CSXPCConnection *)&v3 handleError:a3];
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSXPCConnection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CSLifeFSConnection_sendMessageAsync_completion___block_invoke;
  block[3] = &unk_1E554A328;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__CSLifeFSConnection_sendMessageAsync_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__CSLifeFSConnection_sendMessageAsync_completion___block_invoke_2;
  v4[3] = &unk_1E55499F0;
  id v5 = *(id *)(a1 + 48);
  v3.receiver = v2;
  v3.super_class = (Class)CSLifeFSConnection;
  objc_msgSendSuper2(&v3, sel_sendMessageAsync_completion_, v1, v4);
}

uint64_t __50__CSLifeFSConnection_sendMessageAsync_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end