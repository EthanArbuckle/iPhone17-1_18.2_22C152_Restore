@interface ILMessageFilterExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)deferQueryRequestToNetwork;
- (id)deferReportRequestToNetwork;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)deferQueryRequestToNetworkWithReply:(id)a3;
- (void)deferReportRequestToNetworkWithReply:(id)a3;
- (void)finish;
- (void)handleCapabilitiesQueryRequest:(id)a3 completion:(id)a4;
- (void)handleQueryRequest:(id)a3 completion:(id)a4;
- (void)handleReportRequest:(id)a3 completion:(id)a4;
- (void)setDeferQueryRequestToNetwork:(id)a3;
- (void)setDeferReportRequestToNetwork:(id)a3;
@end

@implementation ILMessageFilterExtensionHostContext

- (void)handleQueryRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke;
  v13[3] = &unk_26446F8E8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  v9 = [(ILMessageFilterExtensionHostContext *)self remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_1;
  v11[3] = &unk_26446F910;
  id v12 = v7;
  id v10 = v7;
  [v9 handleQueryRequest:v8 reply:v11];
}

void __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21DAC7000, v4, OS_LOG_TYPE_DEFAULT, "response: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleReportRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__ILMessageFilterExtensionHostContext_handleReportRequest_completion___block_invoke;
  v13[3] = &unk_26446F8E8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  v9 = [(ILMessageFilterExtensionHostContext *)self remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__ILMessageFilterExtensionHostContext_handleReportRequest_completion___block_invoke_3;
  v11[3] = &unk_26446F938;
  id v12 = v7;
  id v10 = v7;
  [v9 handleReportRequest:v8 reply:v11];
}

void __70__ILMessageFilterExtensionHostContext_handleReportRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__ILMessageFilterExtensionHostContext_handleReportRequest_completion___block_invoke_3(uint64_t a1)
{
  v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21DAC7000, v2, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleCapabilitiesQueryRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__ILMessageFilterExtensionHostContext_handleCapabilitiesQueryRequest_completion___block_invoke;
  v13[3] = &unk_26446F8E8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  v9 = [(ILMessageFilterExtensionHostContext *)self remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__ILMessageFilterExtensionHostContext_handleCapabilitiesQueryRequest_completion___block_invoke_5;
  v11[3] = &unk_26446F960;
  id v12 = v7;
  id v10 = v7;
  [v9 handleCapabilitiesQueryRequest:v8 reply:v11];
}

void __81__ILMessageFilterExtensionHostContext_handleCapabilitiesQueryRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__ILMessageFilterExtensionHostContext_handleCapabilitiesQueryRequest_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21DAC7000, v4, OS_LOG_TYPE_DEFAULT, "response: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finish
{
  id v2 = [(ILMessageFilterExtensionHostContext *)self remoteObjectProxyWithErrorHandler:&__block_literal_global];
  [v2 finish];
}

void __45__ILMessageFilterExtensionHostContext_finish__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = ILDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1();
  }
}

- (void)deferQueryRequestToNetworkWithReply:(id)a3
{
  id v4 = a3;
  int v5 = [(ILMessageFilterExtensionHostContext *)self deferQueryRequestToNetwork];

  if (v5)
  {
    id v8 = [(ILMessageFilterExtensionHostContext *)self deferQueryRequestToNetwork];
    v8[2](v8, v4);
  }
  else
  {
    id v6 = ILDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ILMessageFilterExtensionHostContext deferQueryRequestToNetworkWithReply:]();
    }

    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.IdentityLookup.error.messagefilter" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

- (void)deferReportRequestToNetworkWithReply:(id)a3
{
  id v4 = a3;
  int v5 = [(ILMessageFilterExtensionHostContext *)self deferReportRequestToNetwork];

  if (v5)
  {
    id v8 = [(ILMessageFilterExtensionHostContext *)self deferReportRequestToNetwork];
    v8[2](v8, v4);
  }
  else
  {
    id v6 = ILDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ILMessageFilterExtensionHostContext deferReportRequestToNetworkWithReply:]();
    }

    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.IdentityLookup.error.messagefilter" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(ILMessageFilterExtensionHostContext *)self _auxiliaryConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "il_messageFilterExtensionVendorInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "il_messageFilterExtensionHostInterface");
}

- (id)deferQueryRequestToNetwork
{
  return self->_deferQueryRequestToNetwork;
}

- (void)setDeferQueryRequestToNetwork:(id)a3
{
}

- (id)deferReportRequestToNetwork
{
  return self->_deferReportRequestToNetwork;
}

- (void)setDeferReportRequestToNetwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferReportRequestToNetwork, 0);

  objc_storeStrong(&self->_deferQueryRequestToNetwork, 0);
}

void __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DAC7000, v0, v1, "error: %@", v2, v3, v4, v5, v6);
}

- (void)deferQueryRequestToNetworkWithReply:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DAC7000, v0, v1, "Extension requested to defer query request to network but no deferQueryRequestToNetwork block is set on %@", v2, v3, v4, v5, v6);
}

- (void)deferReportRequestToNetworkWithReply:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DAC7000, v0, v1, "Extension requested to defer report request to network but no deferReportRequestToNetwork block is set on %@", v2, v3, v4, v5, v6);
}

@end