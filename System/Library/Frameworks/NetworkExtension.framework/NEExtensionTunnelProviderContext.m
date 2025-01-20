@interface NEExtensionTunnelProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)cancelWithError:(id)a3;
- (void)didSetReasserting:(BOOL)a3;
- (void)establishIPCWithCompletionHandler:(id)a3;
- (void)handleIPCDetached;
- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4;
- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation NEExtensionTunnelProviderContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipcIdleTimer, 0);

  objc_storeStrong((id *)&self->_ipc, 0);
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  [(NEExtensionTunnelProviderContext *)self handleIPCDetached];
  v5.receiver = self;
  v5.super_class = (Class)NEExtensionTunnelProviderContext;
  [(NEExtensionProviderContext *)&v5 cancelWithError:v4];
}

- (void)establishIPCWithCompletionHandler:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (void (**)(id, void))a3;
  if (self && objc_getProperty(self, v4, 88, 1))
  {
    id Property = objc_getProperty(self, v6, 88, 1);
    if (Property
      && (id v9 = Property,
          objc_sync_enter(v9),
          id v11 = objc_getProperty(v9, v10, 16, 1),
          objc_sync_exit(v9),
          v9,
          v11))
    {
      v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(handler) = 138412290;
        *(void *)((char *)&handler + 4) = self;
        _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "%@: IPC is already established", (uint8_t *)&handler, 0xCu);
      }

      v5[2](v5, 0);
    }
    else
    {
      id v13 = objc_getProperty(self, v8, 88, 1);
      -[NEIPC stop](v13);
      objc_setProperty_atomic(self, v14, 0, 88);
    }
  }
  v15 = objc_alloc_init(NEIPC);
  objc_initWeak(&location, self);
  id v16 = MEMORY[0x1E4F14428];
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  v37 = __70__NEExtensionTunnelProviderContext_establishIPCWithCompletionHandler___block_invoke;
  v38 = &unk_1E5992CC8;
  objc_copyWeak(&v39, &location);
  id v17 = MEMORY[0x1E4F14428];
  v18 = &v35;
  if (v15)
  {
    v19 = v15;
    objc_sync_enter(v19);
    objc_setProperty_atomic_copy(v19, v20, v18, 8);
    v21 = (void *)MEMORY[0x1E4F14428];
    xpc_connection_t v22 = xpc_connection_create(0, MEMORY[0x1E4F14428]);
    objc_setProperty_atomic(v19, v23, v22, 24);

    v25 = (_xpc_connection_s *)objc_getProperty(v19, v24, 24, 1);
    *(void *)&long long handler = MEMORY[0x1E4F143A8];
    *((void *)&handler + 1) = 3221225472;
    v42 = __51__NEIPC_startInListenModeWithQueue_messageHandler___block_invoke;
    v43 = &unk_1E5991128;
    v44 = v19;
    id v26 = v21;
    id v45 = v21;
    xpc_connection_set_event_handler(v25, &handler);

    v28 = (_xpc_connection_s *)objc_getProperty(v19, v27, 24, 1);
    xpc_connection_resume(v28);

    v30 = (_xpc_connection_s *)objc_getProperty(v19, v29, 24, 1);
    xpc_endpoint_t v31 = xpc_endpoint_create(v30);

    objc_sync_exit(v19);
  }
  else
  {
    xpc_endpoint_t v31 = 0;
  }

  if (!v31)
  {
    id v33 = 0;
    if (!self) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F292A0]);
  objc_msgSend(v33, "_setEndpoint:", v31, v35, v36, v37, v38);
  if (self) {
LABEL_15:
  }
    objc_setProperty_atomic(self, v32, v15, 88);
LABEL_16:
  v34 = ne_log_obj();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    LODWORD(handler) = 138412290;
    *(void *)((char *)&handler + 4) = self;
    _os_log_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_INFO, "%@: created IPC listener", (uint8_t *)&handler, 0xCu);
  }

  ((void (**)(id, id))v5)[2](v5, v33);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

void __70__NEExtensionTunnelProviderContext_establishIPCWithCompletionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v20 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SEL v10 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained handleIPCDetached];
    }
    else if (v20)
    {
      id v11 = [WeakRetained _principalObject];
      id v12 = v10;
      objc_sync_enter(v12);
      if (objc_getProperty(v12, v13, 96, 1))
      {
        id Property = objc_getProperty(v12, v14, 96, 1);
        dispatch_source_cancel(Property);
      }
      id v16 = MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53__NEExtensionTunnelProviderContext_resetIPCIdleTimer__block_invoke;
      v21[3] = &unk_1E59932C0;
      v21[4] = v12;
      v18 = NECreateTimerSource(v16, 60, v21);
      objc_setProperty_atomic(v12, v19, v18, 96);

      objc_sync_exit(v12);
      [v11 handleAppMessage:v20 completionHandler:v8];
    }
  }
}

void __53__NEExtensionTunnelProviderContext_resetIPCIdleTimer__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) handleIPCDetached];
  objc_sync_exit(obj);
}

- (void)handleIPCDetached
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 88, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  -[NEIPC stop](v5);

  if (v2)
  {
    objc_setProperty_atomic(v2, v6, 0, 88);
    if (objc_getProperty(v2, v7, 96, 1))
    {
      id v9 = objc_getProperty(v2, v8, 96, 1);
      dispatch_source_cancel(v9);
      objc_setProperty_atomic(v2, v10, 0, 96);
    }
  }
  id v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v2;
    _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEFAULT, "%@: IPC detached", (uint8_t *)&v14, 0xCu);
  }

  SEL v13 = [(NEExtensionProviderContext *)v2 hostContext];
  [v13 handleIPCDetached];

  objc_sync_exit(v2);
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NEExtensionTunnelProviderContext;
  [(NEExtensionProviderContext *)&v26 setConfiguration:v6 extensionIdentifier:a4];
  SEL v7 = [(NEExtensionProviderContext *)self _principalObject];
  if (!v7)
  {
    id v17 = ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    v28 = self;
    v18 = "%@: no provider found";
LABEL_19:
    _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    v28 = self;
    v18 = "%@: not setting configuration because provider is not an NETunnelProvider";
    goto LABEL_19;
  }
  id v8 = [v6 alwaysOnVPN];

  if (v8)
  {
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      SEL v10 = [v6 alwaysOnVPN];
      id v11 = [v10 activeInterfaceProtocolKey];
      *(_DWORD *)buf = 138412546;
      v28 = self;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_INFO, "%@: AlwaysOn VPN configuration: activeInterfaceProtocolKey %@", buf, 0x16u);
    }
    id v12 = [v6 alwaysOnVPN];
    SEL v13 = [v12 interfaceProtocolMapping];
    int v14 = [v6 alwaysOnVPN];
    v15 = [v14 activeInterfaceProtocolKey];
    uint64_t v16 = [v13 objectForKeyedSubscript:v15];
    [v7 setProtocolConfiguration:v16];

    v7[42] = 1;
  }
  else
  {
    SEL v19 = [v6 VPN];
    if (v19 || ([v6 appVPN], (SEL v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7[41] = [v19 isOnDemandEnabled];
      id v20 = [v19 protocol];
      [v7 setProtocolConfiguration:v20];

      v21 = [v6 appVPN];

      if (v21)
      {
        xpc_connection_t v22 = [v6 appVPN];
        SEL v23 = [v22 appRules];
        [v7 setAppRules:v23];
      }
      SEL v24 = [v19 protocol];
      [v24 type];
    }
  }
  v25 = [v7 protocolConfiguration];

  if (!v25)
  {
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      v18 = "%@: configuration has no VPN configuration";
      goto LABEL_19;
    }
LABEL_20:
  }
}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  id v9 = ne_log_large_obj();
  SEL v10 = v9;
  if (is_debug_logging_enabled)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 descriptionWithIndent:0 options:2];
      int v14 = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEFAULT, "%@: provider set tunnel configuration to %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "%@: provider set tunnel configuration to %@", (uint8_t *)&v14, 0x16u);
  }

  SEL v13 = [(NEExtensionProviderContext *)self hostContext];
  [v13 setTunnelConfiguration:v6 completionHandler:v7];
}

- (void)didSetReasserting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "%@: reasserting set to %d", (uint8_t *)&v8, 0x12u);
  }

  id v7 = [(NEExtensionProviderContext *)self hostContext];
  [v7 didSetReasserting:v3];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3014 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3014, &__block_literal_global_63);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_3015;

  return v2;
}

uint64_t __67__NEExtensionTunnelProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_3015 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF092A10];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3017 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3017, &__block_literal_global_3018);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3019;

  return v2;
}

uint64_t __69__NEExtensionTunnelProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_3019 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF092950];

  return MEMORY[0x1F41817F8]();
}

@end