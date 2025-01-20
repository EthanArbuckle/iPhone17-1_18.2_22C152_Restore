@interface AVTAvatarsDaemonClient
- (AVTAvatarsDaemonClient)initWithConnectionFactory:(id)a3 logger:(id)a4;
- (AVTAvatarsDaemonClient)initWithLogger:(id)a3;
- (AVTUILogger)logger;
- (id)connectionFactory;
- (void)checkIn;
- (void)performWorkWithConnection:(id)a3;
- (void)performWorkWithSynchronousProxy:(id)a3;
@end

@implementation AVTAvatarsDaemonClient

- (AVTAvatarsDaemonClient)initWithLogger:(id)a3
{
  return [(AVTAvatarsDaemonClient *)self initWithConnectionFactory:&__block_literal_global_2 logger:a3];
}

id __41__AVTAvatarsDaemonClient_initWithLogger___block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.avatar.support" options:0];

  return v0;
}

- (AVTAvatarsDaemonClient)initWithConnectionFactory:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarsDaemonClient;
  v8 = [(AVTAvatarsDaemonClient *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id connectionFactory = v8->_connectionFactory;
    v8->_id connectionFactory = (id)v9;

    objc_storeStrong((id *)&v8->_logger, a4);
  }

  return v8;
}

- (void)performWorkWithConnection:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(AVTAvatarsDaemonClient *)self connectionFactory];
  id v6 = v5[2]();

  id v7 = [(AVTAvatarsDaemonClient *)self logger];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__AVTAvatarsDaemonClient_performWorkWithConnection___block_invoke;
  v16[3] = &unk_2647C3760;
  id v8 = v7;
  id v17 = v8;
  [v6 setInterruptionHandler:v16];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __52__AVTAvatarsDaemonClient_performWorkWithConnection___block_invoke_2;
  v14 = &unk_2647C3760;
  id v15 = v8;
  id v9 = v8;
  [v6 setInvalidationHandler:&v11];
  v10 = +[AVTAvatarsDaemon xpcInterface];
  [v6 setRemoteObjectInterface:v10];

  [v6 resume];
  v4[2](v4, v6);

  [v6 invalidate];
}

uint64_t __52__AVTAvatarsDaemonClient_performWorkWithConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logAvatarsDaemonClientConnectionInterrupted];
}

uint64_t __52__AVTAvatarsDaemonClient_performWorkWithConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) logAvatarsDaemonClientConnectionInvalidated];
}

- (void)performWorkWithSynchronousProxy:(id)a3
{
  id v4 = a3;
  v5 = [(AVTAvatarsDaemonClient *)self logger];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__AVTAvatarsDaemonClient_performWorkWithSynchronousProxy___block_invoke;
  v8[3] = &unk_2647C37B0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(AVTAvatarsDaemonClient *)self performWorkWithConnection:v8];
}

void __58__AVTAvatarsDaemonClient_performWorkWithSynchronousProxy___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__AVTAvatarsDaemonClient_performWorkWithSynchronousProxy___block_invoke_2;
  v5[3] = &unk_2647C3788;
  id v6 = *(id *)(a1 + 32);
  id v4 = [a2 synchronousRemoteObjectProxyWithErrorHandler:v5];
  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __58__AVTAvatarsDaemonClient_performWorkWithSynchronousProxy___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 logErrorGettingAvatarsDaemonClientProxy:v3];
}

- (void)checkIn
{
  id v3 = [(AVTAvatarsDaemonClient *)self logger];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__AVTAvatarsDaemonClient_checkIn__block_invoke;
  v4[3] = &unk_2647C36A8;
  v4[4] = self;
  [v3 checkingIn:v4];
}

uint64_t __33__AVTAvatarsDaemonClient_checkIn__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWorkWithSynchronousProxy:&__block_literal_global_8];
}

uint64_t __33__AVTAvatarsDaemonClient_checkIn__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 checkIn];
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (id)connectionFactory
{
  return self->_connectionFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionFactory, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end