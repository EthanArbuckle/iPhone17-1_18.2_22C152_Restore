@interface MSOpenComposeDelegateRequest
- (MSOpenComposeDelegateRequest)init;
- (void)checkInComposeWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation MSOpenComposeDelegateRequest

- (MSOpenComposeDelegateRequest)init
{
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C6075A8];
  v6.receiver = self;
  v6.super_class = (Class)MSOpenComposeDelegateRequest;
  v4 = [(MSXPCService *)&v6 initWithRemoteObjectInterface:v3];

  return v4;
}

- (void)checkInComposeWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__MSOpenComposeDelegateRequest_checkInComposeWithIdentifier_completion___block_invoke;
  v10[3] = &unk_264242F90;
  id v8 = v7;
  id v11 = v8;
  v9 = [(MSXPCService *)self remoteObjectProxyWithErrorHandler:v10];
  [v9 checkInComposeWithIdentifier:v6 completion:v8];
}

void __72__MSOpenComposeDelegateRequest_checkInComposeWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, void, id))(v3 + 16))(v3, 0, 0, v4);
  }
}

@end