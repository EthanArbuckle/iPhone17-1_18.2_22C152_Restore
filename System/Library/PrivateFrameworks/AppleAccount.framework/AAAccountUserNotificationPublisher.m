@interface AAAccountUserNotificationPublisher
- (AAAccountUserNotificationPublisher)init;
- (AAAccountUserNotificationPublisher)initWithDaemonXPCEndpoint:(id)a3;
- (void)postAccountUserNotificationWith:(id)a3 completion:(id)a4;
@end

@implementation AAAccountUserNotificationPublisher

- (AAAccountUserNotificationPublisher)init
{
  return [(AAAccountUserNotificationPublisher *)self initWithDaemonXPCEndpoint:0];
}

- (AAAccountUserNotificationPublisher)initWithDaemonXPCEndpoint:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAAccountUserNotificationPublisher;
  v5 = [(AAAccountUserNotificationPublisher *)&v9 init];
  if (v5)
  {
    v6 = [[AAAccountUserNotificationDaemonConnection alloc] initWithListenerEndpoint:v4];
    daemonConnection = v5->_daemonConnection;
    v5->_daemonConnection = v6;
  }
  return v5;
}

- (void)postAccountUserNotificationWith:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[AAPreferences shouldEnableAccountUserNotifications])
  {
    *(void *)buf = 0;
    v22 = buf;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    v8 = self;
    v26 = v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke;
    v18[3] = &unk_1E5A48C10;
    v20 = buf;
    id v19 = v7;
    objc_super v9 = (void *)MEMORY[0x1A622F430](v18);
    daemonConnection = v8->_daemonConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke_24;
    v16[3] = &unk_1E5A48680;
    id v11 = v9;
    id v17 = v11;
    v12 = [(AAAccountUserNotificationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v16];
    v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "Calling daemon service to publish account user notification.", v15, 2u);
    }

    [v12 postAccountUserNotificationWith:v6 completion:v11];
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Account user notification feature not enabled.", buf, 2u);
    }
  }
}

void __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Local completion called after post account notification", v8, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke_24_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke_24_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "AppleAccount daemon connection for publishing account user notification encountered error: %@", (uint8_t *)&v2, 0xCu);
}

@end