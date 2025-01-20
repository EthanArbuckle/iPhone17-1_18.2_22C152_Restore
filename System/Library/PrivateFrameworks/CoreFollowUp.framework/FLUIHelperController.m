@interface FLUIHelperController
+ (id)sharedInstance;
- (FLUIHelperController)init;
- (id)connection;
- (id)remoteObjectInterface;
- (void)showHSA2PasswordChangeForAppleID:(id)a3 completion:(id)a4;
- (void)showUIForHSA2LoginCode:(id)a3 notification:(id)a4 completion:(id)a5;
- (void)showUIForHSA2LoginNotification:(id)a3 completion:(id)a4;
- (void)tearDownUIForHSA2LoginNotificationWithPushMessageID:(id)a3;
@end

@implementation FLUIHelperController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __38__FLUIHelperController_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(FLUIHelperController);

  return MEMORY[0x1F41817F8]();
}

- (FLUIHelperController)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLUIHelperController;
  v2 = [(FLUIHelperController *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    connLock = v2->_connLock;
    v2->_connLock = v3;
  }
  return v2;
}

- (void)showUIForHSA2LoginNotification:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FLUIHelperController *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke;
  v15[3] = &unk_1E637AFB0;
  v15[4] = self;
  v9 = [v8 remoteObjectProxyWithErrorHandler:v15];

  v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Showing password change", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke_3;
  v12[3] = &unk_1E637AEB0;
  id v13 = v6;
  id v11 = v6;
  [v9 showHSA2LoginNotification:v7 completion:v12];
}

void __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke_cold_1();
  }
}

void __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Notification completed", v8, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)showHSA2PasswordChangeForAppleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FLUIHelperController *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke;
  v15[3] = &unk_1E637AFB0;
  v15[4] = self;
  v9 = [v8 remoteObjectProxyWithErrorHandler:v15];

  v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Showing password change", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke_5;
  v12[3] = &unk_1E637AEB0;
  id v13 = v6;
  id v11 = v6;
  [v9 showHSA2ChangePasswordForAppleID:v7 completion:v12];
}

void __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke_cold_1();
  }
}

void __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Notification completed", v8, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)showUIForHSA2LoginCode:(id)a3 notification:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FLUIHelperController *)self connection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke;
  v18[3] = &unk_1E637AFB0;
  v18[4] = self;
  v12 = [v11 remoteObjectProxyWithErrorHandler:v18];

  id v13 = _FLLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE24A000, v13, OS_LOG_TYPE_DEFAULT, "Showing login code", buf, 2u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke_6;
  v15[3] = &unk_1E637AEB0;
  id v16 = v8;
  id v14 = v8;
  [v12 showHSA2LoginCode:v10 withNotification:v9 completion:v15];
}

void __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke_cold_1();
  }
}

void __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Notification completed", v8, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)tearDownUIForHSA2LoginNotificationWithPushMessageID:(id)a3
{
  id v4 = a3;
  id v5 = [(FLUIHelperController *)self connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__FLUIHelperController_tearDownUIForHSA2LoginNotificationWithPushMessageID___block_invoke;
  v7[3] = &unk_1E637AFB0;
  v7[4] = self;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v7];

  [v6 tearDownUIForHSA2LoginNotificationWithPushMessageID:v4];
}

void __76__FLUIHelperController_tearDownUIForHSA2LoginNotificationWithPushMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__FLUIHelperController_tearDownUIForHSA2LoginNotificationWithPushMessageID___block_invoke_cold_1();
  }
}

- (id)connection
{
  [(NSLock *)self->_connLock lock];
  conn = self->_conn;
  if (!conn)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.corefollowup.uihelper" options:0];
    id v5 = self->_conn;
    self->_conn = v4;

    id v6 = self->_conn;
    uint64_t v7 = [(FLUIHelperController *)self remoteObjectInterface];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__0;
    v14[4] = __Block_byref_object_dispose__0;
    v15 = self;
    id v8 = self->_conn;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__FLUIHelperController_connection__block_invoke;
    v13[3] = &unk_1E637AFD8;
    v13[4] = v14;
    [(NSXPCConnection *)v8 setInterruptionHandler:v13];
    id v9 = self->_conn;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__FLUIHelperController_connection__block_invoke_9;
    v12[3] = &unk_1E637AFD8;
    void v12[4] = v14;
    [(NSXPCConnection *)v9 setInvalidationHandler:v12];
    [(NSXPCConnection *)self->_conn resume];
    _Block_object_dispose(v14, 8);

    conn = self->_conn;
  }
  id v10 = conn;
  [(NSLock *)self->_connLock unlock];

  return v10;
}

uint64_t __34__FLUIHelperController_connection__block_invoke(uint64_t result)
{
  uint64_t v1 = result + 32;
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    id v2 = _FLLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __34__FLUIHelperController_connection__block_invoke_cold_1();
    }

    [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 8) lock];
    uint64_t v3 = *(void *)(*(void *)(*(void *)v1 + 8) + 40);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    return [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 8) unlock];
  }
  return result;
}

uint64_t __34__FLUIHelperController_connection__block_invoke_9(uint64_t result)
{
  uint64_t v1 = result + 32;
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    id v2 = _FLLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __34__FLUIHelperController_connection__block_invoke_9_cold_1();
    }

    [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 8) lock];
    uint64_t v3 = *(void *)(*(void *)(*(void *)v1 + 8) + 40);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    return [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 8) unlock];
  }
  return result;
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18DCF20];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conn, 0);

  objc_storeStrong((id *)&self->_connLock, 0);
}

void __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BE24A000, v0, v1, "%@: Error from UI Helper process while displaying HSA2 login notification - %@");
}

void __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BE24A000, v0, v1, "%@: Error from UI Helper process while displaying HSA2 login password change - %@");
}

void __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BE24A000, v0, v1, "%@: Error from UI Helper process while displaying HSA2 login code - %@");
}

void __76__FLUIHelperController_tearDownUIForHSA2LoginNotificationWithPushMessageID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BE24A000, v0, v1, "%@: Error from UI Helper process while tearing down HSA2 login notification - %@");
}

void __34__FLUIHelperController_connection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1BE24A000, v1, OS_LOG_TYPE_ERROR, "%@: Daemon connection interrupted", (uint8_t *)&v2, 0xCu);
}

void __34__FLUIHelperController_connection__block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1BE24A000, v1, OS_LOG_TYPE_ERROR, "%@: Daemon connection invalidated", (uint8_t *)&v2, 0xCu);
}

@end