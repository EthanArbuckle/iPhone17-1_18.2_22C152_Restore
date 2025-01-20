@interface NEAgentTunnelExtension
- (id)driverInterface;
- (id)managerInterface;
- (void)attachIPCWithCompletionHandler:(id)a3;
- (void)connectWithParameters:(id)a3;
- (void)disconnectWithReason:(int)a3;
- (void)extension:(id)a3 didRequestSocket:(BOOL)a4 interface:(id)a5 local:(id)a6 remote:(id)a7 effectivePID:(int)a8 completionHandler:(id)a9;
- (void)extension:(id)a3 didSetStatus:(int64_t)a4;
- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5;
- (void)extension:(id)a3 didStartWithError:(id)a4;
- (void)extensionDidDetachIPC:(id)a3;
- (void)handleAppsUninstalled:(id)a3;
- (void)handleAppsUpdateBegins:(id)a3;
- (void)handleAppsUpdateEnding:(id)a3;
- (void)handleAppsUpdateEnds:(id)a3;
- (void)handleCancel;
- (void)handleExtensionStartedWithCompletionHandler:(id)a3;
- (void)sendExtensionFailed;
- (void)sendStatus:(void *)a3 withDisconnectError:;
@end

@implementation NEAgentTunnelExtension

- (void)sendExtensionFailed
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](self, 0, v3);
}

- (void)sendStatus:(void *)a3 withDisconnectError:
{
  if (a1)
  {
    id v5 = a3;
    v6 = [a1 managerObjectFactory];
    id v7 = [v6 managerObject];

    [v7 setStatus:a2 error:v5];
  }
}

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
}

- (void)extension:(id)a3 didRequestSocket:(BOOL)a4 interface:(id)a5 local:(id)a6 remote:(id)a7 effectivePID:(int)a8 completionHandler:(id)a9
{
  BOOL v12 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void))a9;
  v19 = ne_log_obj();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v20)
    {
      int v27 = 138412290;
      v28 = self;
      _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "%@: Getting IKE Socket", (uint8_t *)&v27, 0xCu);
    }

    if (!v15 || !v16 || !v17)
    {
      v25 = ne_log_obj();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v27 = 138412290;
        v28 = self;
        v26 = "%@: Failed to get IKE Socket, null local/remote address or interface name";
        goto LABEL_21;
      }
LABEL_18:

      v18[2](v18, 0);
      goto LABEL_19;
    }
    [v16 bytes];
    [v17 bytes];
    [v15 UTF8String];
    uint64_t IKESocket = NEHelperGetIKESocket();
  }
  else
  {
    if (v20)
    {
      int v27 = 138412290;
      v28 = self;
      _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "%@: Getting PFKey Socket", (uint8_t *)&v27, 0xCu);
    }

    uint64_t IKESocket = NEHelperGetPFKeySocket();
  }
  uint64_t v22 = IKESocket;
  v23 = ne_log_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 138412546;
    v28 = self;
    __int16 v29 = 1024;
    int v30 = v22;
    _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "%@: NEHelper returned socket %d", (uint8_t *)&v27, 0x12u);
  }

  if ((v22 & 0x80000000) != 0)
  {
    v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412290;
      v28 = self;
      v26 = "%@: Failed to get socket";
LABEL_21:
      _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v27, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v22 closeOnDealloc:1];
  ((void (**)(id, void *))v18)[2](v18, v24);

LABEL_19:
}

- (void)extensionDidDetachIPC:(id)a3
{
  id v3 = [(NEAgentExtension *)self managerObjectFactory];
  id v4 = [v3 managerObject];

  [v4 handleIPCDetached];
}

- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(NEAgentExtension *)self managerObjectFactory];
  v10 = [v9 managerObject];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke;
  v12[3] = &unk_1E5993798;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 setTunnelNetworkSettings:v8 completionHandler:v12];
}

void __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings done", buf, 0xCu);
  }

  if (*(void *)(a1 + 40))
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings calling completionHandler", buf, 0xCu);
    }

    id v8 = [*(id *)(a1 + 32) queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_35;
    v9[3] = &unk_1E59936F8;
    id v11 = *(id *)(a1 + 40);
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

uint64_t __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)extension:(id)a3 didSetStatus:(int64_t)a4
{
}

- (void)extension:(id)a3 didStartWithError:(id)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
    id v5 = a4;
  }
  else
  {
    uint64_t v4 = 4;
    id v5 = 0;
  }
  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](self, v4, v5);
}

- (void)attachIPCWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self sessionContext];
  [v5 establishIPCWithCompletionHandler:v4];
}

- (void)disconnectWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(NEAgentExtension *)self sessionContext];
  [v4 stopWithReason:v3];
}

- (void)connectWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self sessionContext];
  if ([v4 count]) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke;
  v7[3] = &unk_1E5993618;
  v7[4] = self;
  [v5 startWithOptions:v6 completionHandler:v7];
}

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_2;
  v7[3] = &unk_1E5992328;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if ([v3 isEqualToString:@"NEAgentErrorDomain"])
    {
      uint64_t v4 = [*(id *)(a1 + 32) code];

      if (v4 == 3)
      {
        uint64_t v5 = *(void **)(a1 + 40);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_3;
        v8[3] = &unk_1E59932C0;
        v8[4] = v5;
        [v5 handleDisposeWithCompletionHandler:v8];
        return;
      }
    }
    else
    {
    }
  }
  id v6 = *(unsigned char **)(a1 + 40);
  if (v6)
  {
    if (v6[120])
    {
      [v6 handleDisposeWithCompletionHandler:0];
    }
    else
    {
      uint64_t v7 = *(void **)(a1 + 32);
      -[NEAgentTunnelExtension sendStatus:withDisconnectError:](v6, 0, v7);
    }
  }
}

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_3(uint64_t a1)
{
}

- (id)driverInterface
{
  if (driverInterface_onceToken_7245 != -1) {
    dispatch_once(&driverInterface_onceToken_7245, &__block_literal_global_10);
  }
  v2 = (void *)driverInterface_driverInterface_7246;

  return v2;
}

void __41__NEAgentTunnelExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF093530];
  v1 = (void *)driverInterface_driverInterface_7246;
  driverInterface_driverInterface_7246 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(id)driverInterface_driverInterface_7246 setClasses:v5 forSelector:sel_setAppUUIDMap_ argumentIndex:0 ofReply:0];
}

- (id)managerInterface
{
  if (managerInterface_onceToken != -1) {
    dispatch_once(&managerInterface_onceToken, &__block_literal_global_7253);
  }
  v2 = (void *)managerInterface_managerInterface;

  return v2;
}

uint64_t __42__NEAgentTunnelExtension_managerInterface__block_invoke()
{
  managerInterface_managerInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0A2EF0];

  return MEMORY[0x1F41817F8]();
}

- (void)handleAppsUpdateEnds:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__NEAgentTunnelExtension_handleAppsUpdateEnds___block_invoke;
  v7[3] = &unk_1E5992328;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__NEAgentTunnelExtension_handleAppsUpdateEnds___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) appsUpdateEnding])
  {
    uint64_t v2 = [*(id *)(a1 + 32) extensionIdentifier];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      id v4 = *(void **)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) extensionIdentifier];
      LODWORD(v4) = [v4 containsObject:v5];

      if (v4)
      {
        [*(id *)(a1 + 32) setAppsUpdateStarted:0];
        [*(id *)(a1 + 32) setAppsUpdateEnding:0];
        id v6 = ne_log_obj();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = [*(id *)(a1 + 32) extensionIdentifier];
          int v8 = 138412290;
          uint64_t v9 = v7;
          _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEFAULT, "Extension %@ has been updated, setting status to disconnected", (uint8_t *)&v8, 0xCu);
        }
        -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0, 0);
      }
    }
  }
}

- (void)handleAppsUpdateEnding:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__NEAgentTunnelExtension_handleAppsUpdateEnding___block_invoke;
  v7[3] = &unk_1E5992328;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__NEAgentTunnelExtension_handleAppsUpdateEnding___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) appsUpdateStarted])
  {
    if (([*(id *)(a1 + 32) appsUpdateEnding] & 1) == 0)
    {
      uint64_t v2 = [*(id *)(a1 + 32) extensionIdentifier];
      if (v2)
      {
        uint64_t v3 = (void *)v2;
        id v4 = *(void **)(a1 + 40);
        id v5 = [*(id *)(a1 + 32) extensionIdentifier];
        LODWORD(v4) = [v4 containsObject:v5];

        if (v4)
        {
          id v6 = *(void **)(a1 + 32);
          [v6 setAppsUpdateEnding:1];
        }
      }
    }
  }
}

- (void)handleAppsUpdateBegins:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__NEAgentTunnelExtension_handleAppsUpdateBegins___block_invoke;
  v7[3] = &unk_1E5992328;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__NEAgentTunnelExtension_handleAppsUpdateBegins___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) appsUpdateStarted] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) pluginType];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      id v4 = *(void **)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) pluginType];
      LODWORD(v4) = [v4 containsObject:v5];

      if (v4)
      {
        [*(id *)(a1 + 32) setAppsUpdateStarted:1];
        id v6 = [*(id *)(a1 + 32) sendFailedTimer];

        if (v6)
        {
          uint64_t v7 = [*(id *)(a1 + 32) sendFailedTimer];
          dispatch_source_cancel(v7);

          [*(id *)(a1 + 32) setSendFailedTimer:0];
        }
        id v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [*(id *)(a1 + 32) extensionIdentifier];
          int v11 = 138412290;
          BOOL v12 = v9;
          _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "Extension %@ is being updated, stopping", (uint8_t *)&v11, 0xCu);
        }
        -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 7, 0);
        uint64_t v10 = [*(id *)(a1 + 32) sessionContext];
        [v10 stopWithReason:40];
      }
    }
  }
}

- (void)handleAppsUninstalled:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NEAgentExtension *)self pluginType];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(NEAgentExtension *)self pluginType];
    int v8 = [v4 containsObject:v7];

    if (v8)
    {
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(NEAgentExtension *)self pluginType];
        int v12 = 138412290;
        uint64_t v13 = v10;
        _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "App for plugin type %@ has been uninstalled, stopping", (uint8_t *)&v12, 0xCu);
      }
      int v11 = [(NEAgentExtension *)self sessionContext];
      [v11 stopWithReason:6];
    }
  }
}

- (void)handleCancel
{
  if (self) {
    self->_cancelCalled = 1;
  }
  id v2 = [(NEAgentExtension *)self sessionContext];
  [v2 stopWithReason:42];
}

@end