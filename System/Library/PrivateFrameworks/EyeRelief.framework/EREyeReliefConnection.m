@interface EREyeReliefConnection
+ (id)sharedConnection;
- (EREyeReliefConnection)connectionWithErrorHandler:(id)a3;
- (NSXPCConnection)connection;
- (void)isDistanceSamplingEnabled:(id)a3;
- (void)setConnection:(id)a3;
- (void)toggleDistanceSampling:(id)a3;
@end

@implementation EREyeReliefConnection

+ (id)sharedConnection
{
  if (sharedConnection_once != -1) {
    dispatch_once(&sharedConnection_once, &__block_literal_global_1);
  }
  v2 = (void *)sharedConnection_instance;

  return v2;
}

uint64_t __41__EREyeReliefConnection_sharedConnection__block_invoke()
{
  sharedConnection_instance = objc_alloc_init(EREyeReliefConnection);

  return MEMORY[0x270F9A758]();
}

- (EREyeReliefConnection)connectionWithErrorHandler:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke;
  block[3] = &unk_265303830;
  block[4] = self;
  if (connectionWithErrorHandler__onceToken != -1) {
    dispatch_once(&connectionWithErrorHandler__onceToken, block);
  }
  v5 = [(EREyeReliefConnection *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_6;
  v9[3] = &unk_265303858;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return (EREyeReliefConnection *)v7;
}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.eyereliefd" options:0];
  [*(id *)(a1 + 32) setConnection:v2];

  v3 = EREyeReliefProtocolInterface();
  id v4 = [*(id *)(a1 + 32) connection];
  [v4 setRemoteObjectInterface:v3];

  v5 = [*(id *)(a1 + 32) connection];
  [v5 setInterruptionHandler:&__block_literal_global_3];

  id v6 = [*(id *)(a1 + 32) connection];
  [v6 setInvalidationHandler:&__block_literal_global_10];

  id v7 = [*(id *)(a1 + 32) connection];
  [v7 resume];
}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_2()
{
}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_3()
{
  id v0 = [NSString stringWithFormat:@"Connection interrupted"];
  +[ERLogging log:v0 withType:1];
}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_4()
{
}

void __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_5()
{
  id v0 = [NSString stringWithFormat:@"Connection invalidated"];
  +[ERLogging log:v0 withType:1];
}

uint64_t __52__EREyeReliefConnection_connectionWithErrorHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)toggleDistanceSampling:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__EREyeReliefConnection_toggleDistanceSampling___block_invoke;
  v7[3] = &unk_265303858;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(EREyeReliefConnection *)self connectionWithErrorHandler:v7];
  [v6 toggleDistanceSampling:v5];
}

void __48__EREyeReliefConnection_toggleDistanceSampling___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [NSString stringWithFormat:@"toggleDistanceSampling: EREyeReliefConnection error: %@", v5];
  +[ERLogging log:v3 withType:1];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v5);
  }
}

- (void)isDistanceSamplingEnabled:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__EREyeReliefConnection_isDistanceSamplingEnabled___block_invoke;
  v7[3] = &unk_265303858;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(EREyeReliefConnection *)self connectionWithErrorHandler:v7];
  [v6 isDistanceSamplingEnabled:v5];
}

void __51__EREyeReliefConnection_isDistanceSamplingEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [NSString stringWithFormat:@"isDistanceSamplingEnabled: EREyeReliefConnection error: %@", v5];
  +[ERLogging log:v3 withType:1];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v5);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end