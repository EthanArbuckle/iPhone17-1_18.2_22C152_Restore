@interface SecuritydXPCClient
+ (void)configureSecuritydXPCProtocol:(id)a3;
- (NSXPCConnection)connection;
- (SecuritydXPCClient)init;
- (id)initTargetingSession:(int)a3;
- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4;
- (void)dealloc;
- (void)setConnection:(id)a3;
@end

@implementation SecuritydXPCClient

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(SecuritydXPCClient *)self connection];
  v8 = v7;
  if (v4) {
    [v7 synchronousRemoteObjectProxyWithErrorHandler:v6];
  }
  else {
  v9 = [v7 remoteObjectProxyWithErrorHandler:v6];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(SecuritydXPCClient *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SecuritydXPCClient;
  [(SecuritydXPCClient *)&v4 dealloc];
}

- (id)initTargetingSession:(int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)SecuritydXPCClient;
  objc_super v4 = [(SecuritydXPCClient *)&v19 init];
  if (!v4)
  {
LABEL_13:
    v12 = v4;
    goto LABEL_14;
  }
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED87A570];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.securityd.general" options:0];
  [(SecuritydXPCClient *)v4 setConnection:v6];

  v7 = [(SecuritydXPCClient *)v4 connection];

  if (v7)
  {
    v8 = [(SecuritydXPCClient *)v4 connection];
    [v8 setRemoteObjectInterface:v5];

    v9 = [(SecuritydXPCClient *)v4 connection];
    v10 = [v9 remoteObjectInterface];
    +[SecuritydXPCClient configureSecuritydXPCProtocol:v10];

    if (!a3)
    {
      v11 = secLogObjForScope("SecuritydXPCClient");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEBUG, "Possibly targeting foreground session", buf, 2u);
      }

      if (xpc_user_sessions_enabled())
      {
        int foreground_uid = xpc_user_sessions_get_foreground_uid();
        v14 = secLogObjForScope("SecuritydXPCClient");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v21 = foreground_uid;
          _os_log_debug_impl(&dword_18B299000, v14, OS_LOG_TYPE_DEBUG, "Targeting foreground session for uid %d", buf, 8u);
        }

        v15 = [(SecuritydXPCClient *)v4 connection];
        v16 = [v15 _xpcConnection];
        xpc_connection_set_target_user_session_uid();
      }
    }
    v17 = [(SecuritydXPCClient *)v4 connection];
    [v17 resume];

    goto LABEL_13;
  }

  v12 = 0;
LABEL_14:

  return v12;
}

- (SecuritydXPCClient)init
{
  return (SecuritydXPCClient *)[(SecuritydXPCClient *)self initTargetingSession:1];
}

+ (void)configureSecuritydXPCProtocol:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED871640];
  [v3 setInterface:v4 forSelector:sel_SecItemAddAndNotifyOnSync_syncCallback_complete_ argumentIndex:1 ofReply:0];
  v5 = +[SecXPCHelper safeErrorClasses];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v8 = [v6 setWithArray:v7];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v11 = [v9 setWithArray:v10];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v14 = [v12 setWithArray:v13];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v17 = [v15 setWithArray:v16];

  [v4 setClasses:v5 forSelector:sel_callCallback_error_ argumentIndex:1 ofReply:0];
  [v3 setClasses:v5 forSelector:sel_SecItemAddAndNotifyOnSync_syncCallback_complete_ argumentIndex:2 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemSetCurrentItemAcrossAllDevices_newCurrentItemHash_accessGroup_identifier_viewHint_oldCurrentItemReference_oldCurrentItemHash_complete_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemUnsetCurrentItemsAcrossAllDevices_identifiers_viewHint_complete_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemFetchCurrentItemAcrossAllDevices_identifier_viewHint_fetchCloudValue_complete_ argumentIndex:2 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemDigest_accessGroup_complete_ argumentIndex:1 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secKeychainDeleteMultiuser_complete_ argumentIndex:1 ofReply:1];
  [v3 setClasses:v8 forSelector:sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v11 forSelector:sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_ argumentIndex:1 ofReply:1];
  [v3 setClasses:v14 forSelector:sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v17 forSelector:sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_ argumentIndex:1 ofReply:1];
}

@end