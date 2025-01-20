@interface CSIndexConnection
+ (id)sharedConnectionForUser:(unsigned int)a3;
- (void)handleError:(id)a3;
- (void)sendMessageAsync:(id)a3 completion:(id)a4;
@end

@implementation CSIndexConnection

uint64_t __49__CSIndexConnection_sendMessageAsync_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__CSIndexConnection_sendMessageAsync_completion___block_invoke;
  v9[3] = &unk_1E55499F0;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)CSIndexConnection;
  id v7 = v6;
  [(CSXPCConnection *)&v8 sendMessageAsync:a3 completion:v9];
}

+ (id)sharedConnectionForUser:(unsigned int)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSIndexConnection_sharedConnectionForUser___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  unsigned int v6 = a3;
  if (sharedConnectionForUser__onceToken != -1) {
    dispatch_once(&sharedConnectionForUser__onceToken, block);
  }
  v3 = (void *)sharedConnectionForUser__sCSIndexConnection;

  return v3;
}

uint64_t __45__CSIndexConnection_sharedConnectionForUser___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = sConnectionName;
    _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "sConnectionName: %@", (uint8_t *)&v6, 0xCu);
  }
  v2 = [CSIndexConnection alloc];
  uint64_t v3 = [(CSXPCConnection *)v2 initWithMachServiceName:sConnectionName];
  v4 = (void *)sharedConnectionForUser__sCSIndexConnection;
  sharedConnectionForUser__sCSIndexConnection = v3;

  [(id)sharedConnectionForUser__sCSIndexConnection _setUser:*(unsigned int *)(a1 + 32)];
  return [(id)sharedConnectionForUser__sCSIndexConnection setPrivateDaemon:sPrivateDaemon];
}

- (void)handleError:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CSIndexConnection;
  [(CSXPCConnection *)&v3 handleError:a3];
}

@end