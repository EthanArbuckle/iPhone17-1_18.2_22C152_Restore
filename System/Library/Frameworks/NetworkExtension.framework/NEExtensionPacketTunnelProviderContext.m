@interface NEExtensionPacketTunnelProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (id)extensionPoint;
- (void)completeSession;
- (void)dispose;
- (void)fetchVirtualInterfaceTypeWithCompletionHandler:(id)a3;
- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7;
- (void)setAppUUIDMap:(id)a3;
- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setupVirtualInterface:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
@end

@implementation NEExtensionPacketTunnelProviderContext

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.packet-tunnel";
}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__NEExtensionPacketTunnelProviderContext_setTunnelConfiguration_completionHandler___block_invoke;
  v10[3] = &unk_1E598F8B0;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)NEExtensionPacketTunnelProviderContext;
  [(NEExtensionTunnelProviderContext *)&v9 setTunnelConfiguration:v6 completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __83__NEExtensionPacketTunnelProviderContext_setTunnelConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained _principalObject];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 packetFlow];
      id v8 = v7;
      if (v7)
      {
        objc_super v9 = v7;
        objc_sync_enter(v9);
        v9[8] = 0;
        objc_sync_exit(v9);
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
      }
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (void)setAppUUIDMap:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NEExtensionProviderContext *)self _principalObject];
  id v6 = ne_log_obj();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = self;
      _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEFAULT, "%@: Setting the app UUID map", buf, 0xCu);
    }

    v27 = v5;
    id v7 = [v5 packetFlow];
    id v28 = v4;
    id v8 = v4;
    objc_super v9 = v8;
    if (v7)
    {
      selfa = v7;
      uint64_t v10 = [v8 allKeys];
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id obj = v10;
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:buf count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v17 = [v9 objectForKeyedSubscript:v16];
            v18 = [NEFlowMetaData alloc];
            id v19 = v16;
            id v20 = v17;
            if (v18)
            {
              v35.receiver = v18;
              v35.super_class = (Class)NEFlowMetaData;
              v21 = [(NEExtensionPacketTunnelProviderContext *)&v35 init];
              v18 = (NEFlowMetaData *)v21;
              if (v21)
              {
                objc_storeStrong((id *)&v21->super.super._hostContext, v17);
                uint64_t v34 = [v19 hash];
                uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v34 length:8];
                sourceAppUniqueIdentifier = v18->_sourceAppUniqueIdentifier;
                v18->_sourceAppUniqueIdentifier = (NSData *)v22;
              }
            }

            [v11 setObject:v18 forKeyedSubscript:v19];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:buf count:16];
        }
        while (v13);
      }

      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v11];
      id v7 = selfa;
      objc_setProperty_atomic(selfa, v25, v24, 72);
    }
    v5 = v27;
    id v4 = v28;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v37 = self;
    _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "%@: No provider when setting the app UUID map", buf, 0xCu);
  }
}

- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412546;
    id v20 = self;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "%@: Requesting IKE socket for interface %@", (uint8_t *)&v19, 0x16u);
  }

  v18 = [(NEExtensionProviderContext *)self hostContext];
  [v18 requestSocket:v10 interface:v12 local:v15 remote:v14 completionHandler:v13];
}

- (void)fetchVirtualInterfaceTypeWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v8 = [(NEExtensionProviderContext *)self _principalObject];
  uint64_t v5 = [v8 packetFlow];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void *)(v5 + 80);
  }
  else {
    uint64_t v7 = 0;
  }
  v4[2](v4, v7);
}

- (void)setupVirtualInterface:(id)a3
{
  id v4 = a3;
  id v19 = [(NEExtensionProviderContext *)self _principalObject];
  uint64_t v5 = [v19 packetFlow];
  id v6 = v4;
  if (v5)
  {
    uint64_t v7 = v5;
    objc_sync_enter(v7);
    if (v7[11]) {
      -[NEPacketTunnelFlow closeVirtualInterface](v7);
    }
    if (dyld_get_program_sdk_version() < 0xF0000)
    {
      objc_super v9 = [v6 controlSocket];
      [v7 setSocket:v9];
    }
    id v10 = objc_getProperty(v7, v8, 24, 1);
    v7[11] = [v6 createVirtualInterfaceWithQueue:v10 clientInfo:0];

    uint64_t v12 = v7[11];
    if (v12) {
      v7[10] = *(void *)(v12 + 256);
    }
    if (objc_getProperty(v7, v11, 96, 1))
    {
      id v14 = objc_getProperty(v7, v13, 96, 1);
      objc_setProperty_atomic_copy(v7, v15, 0, 96);
      [v7 readPacketsWithCompletionHandler:v14];
    }
    if (objc_getProperty(v7, v13, 32, 1))
    {
      id v17 = objc_getProperty(v7, v16, 32, 1);
      objc_setProperty_atomic_copy(v7, v18, 0, 32);
      [v7 readPacketObjectsWithCompletionHandler:v17];
    }
    objc_sync_exit(v7);
  }
}

- (void)stopWithReason:(int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NEExtensionProviderContext *)self _principalObject];
  id v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = self;
    __int16 v12 = 2080;
    uint64_t v13 = ne_session_stop_reason_to_string();
    _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEFAULT, "%@: Calling stopTunnelWithReason because: %s", buf, 0x16u);
  }

  if (self && (a3 - 1) <= 0x29) {
    uint64_t v7 = qword_19DF9BFE8[a3 - 1];
  }
  else {
    uint64_t v7 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NEExtensionPacketTunnelProviderContext_stopWithReason___block_invoke;
  v8[3] = &unk_1E5990A58;
  v8[4] = self;
  int v9 = a3;
  [v5 stopTunnelWithReason:v7 completionHandler:v8];
}

id __57__NEExtensionPacketTunnelProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  id result = (id)os_variant_has_internal_diagnostics();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!result || !v3 || !*(unsigned char *)(v3 + 104))
  {
    uint64_t v4 = *(unsigned int *)(a1 + 40);
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)NEExtensionPacketTunnelProviderContext;
    return objc_msgSendSuper2(&v5, sel_stopWithReason_, v4);
  }
  return result;
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NEExtensionProviderContext *)self _principalObject];
  v13.receiver = self;
  v13.super_class = (Class)NEExtensionPacketTunnelProviderContext;
  [(NEExtensionProviderContext *)&v13 startWithOptions:v6 completionHandler:v7];

  int v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    SEL v15 = self;
    __int16 v16 = 2048;
    id v17 = v6;
    _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "%@: Calling startTunnelWithOptions with options %p", buf, 0x16u);
  }

  if (isa_nsdictionary(v6))
  {
    id v10 = [v6 objectForKeyedSubscript:@"test-disconnect-dispose-timeout"];
    if (isa_nsnumber(v10))
    {
      char v11 = [v10 BOOLValue];
      if (self) {
        self->_testDisconnectAndDisposeTimeout = v11;
      }
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__NEExtensionPacketTunnelProviderContext_startWithOptions_completionHandler___block_invoke;
  v12[3] = &unk_1E5993618;
  v12[4] = self;
  [v8 startTunnelWithOptions:v6 completionHandler:v12];
}

void __77__NEExtensionPacketTunnelProviderContext_startWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) handleIPCDetached];
  }
  [*(id *)(a1 + 32) startedWithError:v3];
}

- (void)dispose
{
  if (!self || !self->super.super._isDisposed)
  {
    id v3 = [(NEExtensionProviderContext *)self _principalObject];
    uint64_t v4 = [v3 packetFlow];
    -[NEPacketTunnelFlow closeVirtualInterface](v4);

    v5.receiver = self;
    v5.super_class = (Class)NEExtensionPacketTunnelProviderContext;
    [(NEExtensionProviderContext *)&v5 dispose];
  }
}

- (void)completeSession
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!self || !has_internal_diagnostics || !self->_testDisconnectAndDisposeTimeout)
  {
    v4.receiver = self;
    v4.super_class = (Class)NEExtensionPacketTunnelProviderContext;
    [(NEExtensionProviderContext *)&v4 completeSession];
  }
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2429 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2429, &__block_literal_global_75);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_2430;

  return v2;
}

uint64_t __73__NEExtensionPacketTunnelProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_2430 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF093AF0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2432 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2432, &__block_literal_global_2433);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2434;

  return v2;
}

void __75__NEExtensionPacketTunnelProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF093A58];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2434;
  _extensionAuxiliaryVendorProtocol_protocol_2434 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_extensionAuxiliaryVendorProtocol_protocol_2434 setClasses:v5 forSelector:sel_setAppUUIDMap_ argumentIndex:0 ofReply:0];
}

@end