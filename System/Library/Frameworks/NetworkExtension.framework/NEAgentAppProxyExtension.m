@interface NEAgentAppProxyExtension
- (id)driverInterface;
- (id)managerInterface;
- (void)connectWithParameters:(id)a3;
- (void)extension:(id)a3 didRequestFlowDivertControlSocketWithCompletionHandler:(id)a4;
- (void)setDelegateInterface:(unsigned int)a3;
@end

@implementation NEAgentAppProxyExtension

- (void)extension:(id)a3 didRequestFlowDivertControlSocketWithCompletionHandler:(id)a4
{
  id v5 = a4;
  v6 = [(NEAgentExtension *)self managerObjectFactory];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5993618;
  v11[4] = self;
  v7 = [v6 managerObjectWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke_38;
  v9[3] = &unk_1E5992A00;
  id v10 = v5;
  id v8 = v5;
  [v7 createFlowDivertControlSocketWithCompletionHandler:v9];
}

void __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Got an error on the XPC connection while creating a flow divert control socket: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0, 0);
}

uint64_t __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDelegateInterface:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(NEAgentExtension *)self sessionContext];
  [v4 setDelegateInterface:v3];
}

- (void)connectWithParameters:(id)a3
{
  id v4 = a3;
  int v5 = [(NEAgentExtension *)self managerObjectFactory];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke;
  v10[3] = &unk_1E5993618;
  v10[4] = self;
  id v6 = [v5 managerObjectWithErrorHandler:v10];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_36;
  v8[3] = &unk_1E59929D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 createFlowDivertControlSocketWithCompletionHandler:v8];
}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Got an error on the XPC connection while creating a flow divert control socket: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0, 0);
}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_2;
  block[3] = &unk_1E59929B0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) sessionContext];
    [v2 setInitialFlowDivertControlSocket:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(a1 + 48);
    v6.receiver = *(id *)(a1 + 40);
    v6.super_class = (Class)NEAgentAppProxyExtension;
    objc_msgSendSuper2(&v6, sel_connectWithParameters_, v3);
  }
  else
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Failed to get a flow divert control socket", v5, 2u);
    }

    -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 40), 0, 0);
  }
}

- (id)driverInterface
{
  if (driverInterface_onceToken_21197 != -1) {
    dispatch_once(&driverInterface_onceToken_21197, &__block_literal_global_14_21198);
  }
  v2 = (void *)driverInterface_driverInterface_21199;

  return v2;
}

uint64_t __43__NEAgentAppProxyExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF093638];
  uint64_t v1 = driverInterface_driverInterface_21199;
  driverInterface_driverInterface_21199 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)managerInterface
{
  if (managerInterface_onceToken_21202 != -1) {
    dispatch_once(&managerInterface_onceToken_21202, &__block_literal_global_21203);
  }
  v2 = (void *)managerInterface_managerInterface_21204;

  return v2;
}

uint64_t __44__NEAgentAppProxyExtension_managerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0A56F0];
  uint64_t v1 = managerInterface_managerInterface_21204;
  managerInterface_managerInterface_21204 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end