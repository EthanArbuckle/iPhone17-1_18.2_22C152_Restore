@interface CXNotificationServiceExtensionVoIPXPCClient
- (BOOL)requestDidArriveFromExtensionPoint;
- (BOOL)taskHasEntitlement:(id)a3;
- (CXNotificationServiceExtensionVoIPXPCClient)init;
- (NSXPCConnection)connection;
- (os_unfair_lock_s)accessorLock;
- (void)dealloc;
- (void)invalidate;
- (void)requestApplicationLaunchForIncomingCall:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation CXNotificationServiceExtensionVoIPXPCClient

- (CXNotificationServiceExtensionVoIPXPCClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)CXNotificationServiceExtensionVoIPXPCClient;
  result = [(CXNotificationServiceExtensionVoIPXPCClient *)&v3 init];
  if (result) {
    result->_accessorLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  [(NSXPCConnection *)self->_connection invalidate];
  os_unfair_lock_unlock(p_accessorLock);
  v4.receiver = self;
  v4.super_class = (Class)CXNotificationServiceExtensionVoIPXPCClient;
  [(CXNotificationServiceExtensionVoIPXPCClient *)&v4 dealloc];
}

- (NSXPCConnection)connection
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  connection = self->_connection;
  if (!connection)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.callkit.notificationserviceextension.voip" options:0];
    v6 = self->_connection;
    self->_connection = v5;

    v7 = objc_msgSend(MEMORY[0x1E4F29280], "cx_notificationServiceExtensionInterface");
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__CXNotificationServiceExtensionVoIPXPCClient_connection__block_invoke;
    v12[3] = &unk_1E5CADED0;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__CXNotificationServiceExtensionVoIPXPCClient_connection__block_invoke_5;
    v10[3] = &unk_1E5CADED0;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v10];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  v8 = connection;
  os_unfair_lock_unlock(p_accessorLock);

  return v8;
}

void __57__CXNotificationServiceExtensionVoIPXPCClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for notification service extension message host %@", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained invalidate];
    [WeakRetained setConnection:0];
  }
}

void __57__CXNotificationServiceExtensionVoIPXPCClient_connection__block_invoke_5(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for notification service extension message host %@", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained setConnection:0];
  }
}

- (void)invalidate
{
  id v2 = [(CXNotificationServiceExtensionVoIPXPCClient *)self connection];
  [v2 invalidate];
}

- (BOOL)taskHasEntitlement:(id)a3
{
  int v3 = (__CFString *)a3;
  id v4 = SecTaskCreateFromSelf(0);
  uint64_t v5 = v4;
  if (v4)
  {
    CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, v3, 0);
    CFRelease(v5);
    if (v6)
    {
      CFTypeID v7 = CFGetTypeID(v6);
      LOBYTE(v5) = v7 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
      CFRelease(v6);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (BOOL)requestDidArriveFromExtensionPoint
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  int v3 = [v2 infoDictionary];

  id v4 = [v3 objectForKey:@"NSExtension"];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    CFTypeRef v6 = [v3 objectForKey:@"PlugInKit"];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (void)requestApplicationLaunchForIncomingCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  CFTypeID v7 = (void (**)(id, void *))a4;
  if (![(CXNotificationServiceExtensionVoIPXPCClient *)self taskHasEntitlement:@"com.apple.developer.usernotifications.filtering"])
  {
    if (!v7) {
      goto LABEL_9;
    }
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = 2;
LABEL_8:
    id v13 = objc_msgSend(v11, "cx_notificationServiceExtensionErrorWithCode:", v12);
    v7[2](v7, v13);

    goto LABEL_9;
  }
  if (![(CXNotificationServiceExtensionVoIPXPCClient *)self requestDidArriveFromExtensionPoint])
  {
    if (!v7) {
      goto LABEL_9;
    }
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = 1;
    goto LABEL_8;
  }
  v8 = [(CXNotificationServiceExtensionVoIPXPCClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__CXNotificationServiceExtensionVoIPXPCClient_requestApplicationLaunchForIncomingCall_completion___block_invoke;
  v14[3] = &unk_1E5CAE2B0;
  v9 = v7;
  v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  [v10 notificationServiceExtension:v6 reply:v9];

LABEL_9:
}

void __98__CXNotificationServiceExtensionVoIPXPCClient_requestApplicationLaunchForIncomingCall_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __98__CXNotificationServiceExtensionVoIPXPCClient_requestApplicationLaunchForIncomingCall_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)setConnection:(id)a3
{
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
}

void __98__CXNotificationServiceExtensionVoIPXPCClient_requestApplicationLaunchForIncomingCall_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Could not send VoIP notification service extension message due to connection error %@", (uint8_t *)&v2, 0xCu);
}

@end