@interface AFLocationService
- (AFLocationService)serviceWithErrorHandler:(id)a3;
- (NSXPCConnection)connection;
- (id)service;
- (void)currentAuthorizationStyle:(id)a3;
- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5;
- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismissTCCDialogIfNeeded:(id)a3;
- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)setConnection:(id)a3;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation AFLocationService

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (void)dismissTCCDialogIfNeeded:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__AFLocationService_dismissTCCDialogIfNeeded___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  v6 = [(AFLocationService *)self serviceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__AFLocationService_dismissTCCDialogIfNeeded___block_invoke_2;
  v8[3] = &unk_1E592C360;
  id v9 = v5;
  id v7 = v5;
  [v6 dismissTCCDialogIfNeeded:v8];
}

void __46__AFLocationService_dismissTCCDialogIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
}

uint64_t __46__AFLocationService_dismissTCCDialogIfNeeded___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AFLocationService_currentLocationWithFetchRequest_completion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(AFLocationService *)self serviceWithErrorHandler:v10];
  [v9 currentLocationWithFetchRequest:v8 completion:v7];
}

void __64__AFLocationService_currentLocationWithFetchRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v6);
}

- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__AFLocationService_currentLocationWithAccuracy_timeout_completion___block_invoke;
  v11[3] = &unk_1E592B9A0;
  id v12 = v8;
  id v9 = v8;
  v10 = [(AFLocationService *)self serviceWithErrorHandler:v11];
  [v10 currentLocationWithAccuracy:v9 timeout:a3 completion:a4];
}

void __68__AFLocationService_currentLocationWithAccuracy_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v6);
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_timeout_completion___block_invoke;
  v11[3] = &unk_1E592B9A0;
  id v12 = v8;
  id v9 = v8;
  v10 = [(AFLocationService *)self serviceWithErrorHandler:v11];
  [v10 updateTemporaryAuthorizationForAccurateLocation:v6 timeout:v9 completion:a4];
}

void __88__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v6);
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_completion___block_invoke;
  v12[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v13 = v7;
  id v8 = [(AFLocationService *)self serviceWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_completion___block_invoke_2;
  v10[3] = &unk_1E592C360;
  id v11 = v7;
  id v9 = v7;
  [v8 updateTemporaryAuthorizationForAccurateLocation:v4 completion:v10];
}

void __80__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
}

uint64_t __80__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__AFLocationService_updateAuthorizationStyleWithUserSelection_timeout_completion___block_invoke;
  v11[3] = &unk_1E592B9A0;
  id v12 = v8;
  id v9 = v8;
  v10 = [(AFLocationService *)self serviceWithErrorHandler:v11];
  [v10 updateAuthorizationStyleWithUserSelection:a3 timeout:v9 completion:a4];
}

void __82__AFLocationService_updateAuthorizationStyleWithUserSelection_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v6);
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__AFLocationService_updateAuthorizationStyleWithUserSelection_completion___block_invoke;
  v12[3] = &unk_1E592B9A0;
  id v7 = v6;
  id v13 = v7;
  id v8 = [(AFLocationService *)self serviceWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__AFLocationService_updateAuthorizationStyleWithUserSelection_completion___block_invoke_2;
  v10[3] = &unk_1E592C360;
  id v11 = v7;
  id v9 = v7;
  [v8 updateAuthorizationStyleWithUserSelection:a3 completion:v10];
}

void __74__AFLocationService_updateAuthorizationStyleWithUserSelection_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
}

uint64_t __74__AFLocationService_updateAuthorizationStyleWithUserSelection_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__AFLocationService_requestTemporaryAccuracyAuthorizationWithStyle_timeout_completion___block_invoke;
  v11[3] = &unk_1E592B9A0;
  id v12 = v8;
  id v9 = v8;
  v10 = [(AFLocationService *)self serviceWithErrorHandler:v11];
  [v10 requestTemporaryAccuracyAuthorizationWithStyle:a3 timeout:v9 completion:a4];
}

void __87__AFLocationService_requestTemporaryAccuracyAuthorizationWithStyle_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v6);
}

- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__AFLocationService_requestAuthorizationWithStyle_timeout_completion___block_invoke;
  v11[3] = &unk_1E592B9A0;
  id v12 = v8;
  id v9 = v8;
  v10 = [(AFLocationService *)self serviceWithErrorHandler:v11];
  [v10 requestAuthorizationWithStyle:a3 timeout:v9 completion:a4];
}

void __70__AFLocationService_requestAuthorizationWithStyle_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v6);
}

- (void)currentAuthorizationStyle:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__AFLocationService_currentAuthorizationStyle___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(AFLocationService *)self serviceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __47__AFLocationService_currentAuthorizationStyle___block_invoke_2;
  v8[3] = &unk_1E59258F8;
  id v9 = v5;
  id v7 = v5;
  [v6 currentAuthorizationStyle:v8];
}

void __47__AFLocationService_currentAuthorizationStyle___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.location" code:0 userInfo:v5];

  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v6);
}

uint64_t __47__AFLocationService_currentAuthorizationStyle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AFLocationService)serviceWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AFLocationService *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return (AFLocationService *)v6;
}

- (id)service
{
  v2 = [(AFLocationService *)self connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.siri.location" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE69A8];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }
  return connection;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_connection invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)AFLocationService;
  [(AFLocationService *)&v4 dealloc];
}

@end