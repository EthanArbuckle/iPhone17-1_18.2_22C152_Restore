@interface CXNotificationServiceExtensionVoIPXPCHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CXNotificationServiceExtensionHostDelegate)delegate;
- (CXNotificationServiceExtensionVoIPXPCHost)initWithDelegate:(id)a3;
- (NSXPCListener)xpcListener;
- (void)notificationServiceExtension:(id)a3 reply:(id)a4;
- (void)notificationServiceExtensionHost:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation CXNotificationServiceExtensionVoIPXPCHost

- (CXNotificationServiceExtensionVoIPXPCHost)initWithDelegate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXNotificationServiceExtensionVoIPXPCHost;
  v5 = [(CXNotificationServiceExtensionVoIPXPCHost *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = @"com.apple.callkit.notificationserviceextension.voip";
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "Initializing XPC Service %@", buf, 0xCu);
    }

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.callkit.notificationserviceextension.voip"];
    xpcListener = v6->_xpcListener;
    v6->_xpcListener = (NSXPCListener *)v8;

    [(NSXPCListener *)v6->_xpcListener setDelegate:v6];
    [(NSXPCListener *)v6->_xpcListener resume];
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = CXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1A6E3A000, v6, OS_LOG_TYPE_DEFAULT, "Asked to accept new connection from %@", (uint8_t *)&v9, 0xCu);
  }

  [v5 setExportedObject:self];
  v7 = objc_msgSend(MEMORY[0x1E4F29280], "cx_notificationServiceExtensionInterface");
  [v5 setExportedInterface:v7];

  [v5 resume];
  return 1;
}

- (void)notificationServiceExtension:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [MEMORY[0x1E4F29268] currentConnection];
  int v9 = v8;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(v8, "cx_bundleIdentifier");
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v23 = 0;
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v10 error:&v23];
      id v13 = v23;
      if (v12)
      {
        uint64_t v14 = [v12 extensionPointRecord];
        v15 = [v14 name];
        char v16 = [v15 isEqualToString:@"com.apple.usernotifications.service"];

        if (v16)
        {
          v17 = [v12 containingBundleRecord];
          v18 = [v17 bundleIdentifier];

          if (v18)
          {
            [(CXNotificationServiceExtensionVoIPXPCHost *)self notificationServiceExtensionHost:self didReceiveIncomingMessage:v6 forBundleIdentifier:v18 reply:v7];
LABEL_16:

            goto LABEL_17;
          }
          if (!v7) {
            goto LABEL_17;
          }
          v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = 0;
LABEL_15:
          v18 = objc_msgSend(v21, "cx_notificationServiceExtensionErrorWithCode:", v22);
          v7[2](v7, v18);
          goto LABEL_16;
        }
        v20 = CXDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CXNotificationServiceExtensionVoIPXPCHost notificationServiceExtension:reply:]((uint64_t)v11, v20);
        }
      }
      else
      {
        v20 = CXDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CXNotificationServiceExtensionVoIPXPCHost notificationServiceExtension:reply:]((uint64_t)v11, (uint64_t)v13, v20);
        }
      }

      if (!v7)
      {
LABEL_17:

        goto LABEL_18;
      }
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 1;
      goto LABEL_15;
    }
  }
  if (v7)
  {
    v19 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_notificationServiceExtensionErrorWithCode:", 1);
    v7[2](v7, v19);
  }
LABEL_18:
}

- (void)notificationServiceExtensionHost:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(CXNotificationServiceExtensionVoIPXPCHost *)self delegate];
  [v12 notificationServiceExtensionHost:self didReceiveIncomingMessage:v11 forBundleIdentifier:v10 reply:v9];
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (CXNotificationServiceExtensionHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXNotificationServiceExtensionHostDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)notificationServiceExtension:(os_log_t)log reply:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A6E3A000, log, OS_LOG_TYPE_ERROR, "Aborting request, could not find application record for bundle id %@, error %@", (uint8_t *)&v3, 0x16u);
}

- (void)notificationServiceExtension:(uint64_t)a1 reply:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Aborting request %@ did not arrive from Notification Service Extension", (uint8_t *)&v2, 0xCu);
}

@end