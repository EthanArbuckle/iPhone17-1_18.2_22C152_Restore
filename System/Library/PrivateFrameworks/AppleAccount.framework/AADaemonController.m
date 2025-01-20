@interface AADaemonController
- (AADaemonController)init;
- (AAFXPCSession)remoteService;
- (void)cacheLoginResponse:(id)a3 forAccount:(id)a4 completion:(id)a5;
- (void)configureRemoteInterface:(id)a3;
- (void)dealloc;
- (void)fetchCachedLoginResponseForAccount:(id)a3 completion:(id)a4;
- (void)handleAppleAccountDeleteForAccount:(id)a3 completion:(id)a4;
- (void)setRemoteService:(id)a3;
- (void)urlConfigurationWithCompletion:(id)a3;
@end

@implementation AADaemonController

- (AADaemonController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AADaemonController;
  v2 = [(AADaemonController *)&v7 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F47010]) initWithServiceName:@"com.apple.aa.daemon.xpc" remoteProtocol:&unk_1EF488600 options:0];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F47008]) initWithRemoteServiceConfig:v3 delegate:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (AAFXPCSession *)v4;

    [(AAFXPCSession *)v2->_remoteService resume];
  }
  return v2;
}

- (void)dealloc
{
}

- (void)handleAppleAccountDeleteForAccount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"AADaemonController.m", 44, @"Invalid parameter not satisfying: %@", @"oldAccount" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"AADaemonController.m", 45, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = _os_activity_create(&dword_1A11D8000, "daemon-appleaccount/handle-AppleAccount-Delete", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke;
  v20[3] = &unk_1E5A48658;
  v20[4] = self;
  id v11 = v9;
  id v21 = v11;
  v12 = (void *)MEMORY[0x1A622F430](v20);
  remoteService = self->_remoteService;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke_2;
  v18[3] = &unk_1E5A48680;
  id v14 = v12;
  id v19 = v14;
  v15 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v18];
  [v15 handleAppleAccountDeleteForAccount:v7 completion:v14];

  os_activity_scope_leave(&state);
}

uint64_t __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cacheLoginResponse:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AADaemonController.m", 69, @"Invalid parameter not satisfying: %@", @"loginResponse" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"AADaemonController.m", 70, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__AADaemonController_cacheLoginResponse_forAccount_completion___block_invoke;
  v17[3] = &unk_1E5A48658;
  v17[4] = self;
  id v18 = v11;
  id v12 = v11;
  v13 = (void *)MEMORY[0x1A622F430](v17);
  id v14 = [(AAFXPCSession *)self->_remoteService remoteServiceProxyWithErrorHandler:v13];
  [v14 cacheLoginResponse:v9 forAccount:v10 completion:v13];
}

uint64_t __63__AADaemonController_cacheLoginResponse_forAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchCachedLoginResponseForAccount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AADaemonController.m", 87, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__AADaemonController_fetchCachedLoginResponseForAccount_completion___block_invoke;
  v17[3] = &unk_1E5A486A8;
  v17[4] = self;
  id v18 = v8;
  id v9 = v8;
  id v10 = (void *)MEMORY[0x1A622F430](v17);
  remoteService = self->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__AADaemonController_fetchCachedLoginResponseForAccount_completion___block_invoke_2;
  v15[3] = &unk_1E5A48680;
  id v16 = v10;
  id v12 = v10;
  v13 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v13 fetchCachedLoginResponseForAccount:v7 completion:v12];
}

uint64_t __68__AADaemonController_fetchCachedLoginResponseForAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __68__AADaemonController_fetchCachedLoginResponseForAccount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)urlConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__AADaemonController_urlConfigurationWithCompletion___block_invoke;
  v20[3] = &unk_1E5A486D0;
  v20[4] = self;
  id v5 = v4;
  id v21 = v5;
  v6 = (void *)MEMORY[0x1A622F430](v20);
  remoteService = self->_remoteService;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__AADaemonController_urlConfigurationWithCompletion___block_invoke_60;
  v18[3] = &unk_1E5A48680;
  id v8 = v6;
  id v19 = v8;
  id v9 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v18];
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AADaemonController urlConfigurationWithCompletion:](v10, v11, v12, v13, v14, v15, v16, v17);
  }

  if (objc_opt_respondsToSelector()) {
    [(AAFXPCSession *)self->_remoteService activate];
  }
  [v9 urlConfigurationWithCompletion:v8];
}

void __53__AADaemonController_urlConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(a1 + 40))
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315906;
      uint64_t v12 = "-[AADaemonController urlConfigurationWithCompletion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_debug_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEBUG, "%s configuration: %@, response: %@, error: %@", (uint8_t *)&v11, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __53__AADaemonController_urlConfigurationWithCompletion___block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __53__AADaemonController_urlConfigurationWithCompletion___block_invoke_60_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configureRemoteInterface:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v6 = [v3 setWithArray:v5];

  [v4 setClasses:v6 forSelector:sel_handleAppleAccountDeleteForAccount_completion_ argumentIndex:0 ofReply:1];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:7];
  uint64_t v9 = objc_msgSend(v7, "setWithArray:", v8, v10, v11, v12, v13, v14, v15);

  [v4 setClasses:v9 forSelector:sel_urlConfigurationWithCompletion_ argumentIndex:0 ofReply:1];
}

- (AAFXPCSession)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
}

- (void).cxx_destruct
{
}

void __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  id v3 = "-[AADaemonController handleAppleAccountDeleteForAccount:completion:]_block_invoke_2";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Connection to remote service to %{public}s returned an error: %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)urlConfigurationWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__AADaemonController_urlConfigurationWithCompletion___block_invoke_60_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end