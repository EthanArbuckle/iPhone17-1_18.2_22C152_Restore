@interface ILMessageFilterExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)deferQueryRequestToNetworkWithCompletion:(void *)completion;
- (void)deferReportRequestToNetworkWithCompletion:(id)a3;
- (void)finish;
- (void)handleCapabilitiesQueryRequest:(id)a3 reply:(id)a4;
- (void)handleQueryRequest:(id)a3 reply:(id)a4;
- (void)handleReportRequest:(id)a3 reply:(id)a4;
@end

@implementation ILMessageFilterExtensionContext

- (void)deferQueryRequestToNetworkWithCompletion:(void *)completion
{
  id v4 = completion;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke;
  v10[3] = &unk_26446F8E8;
  id v5 = v4;
  id v11 = v5;
  v6 = [(ILMessageFilterExtensionContext *)self remoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_1;
  v8[3] = &unk_26446FAE0;
  id v9 = v5;
  id v7 = v5;
  [v6 deferQueryRequestToNetworkWithReply:v8];
}

void __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = ILDefaultLog();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_21DAC7000, v8, OS_LOG_TYPE_DEFAULT, "response: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_1_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deferReportRequestToNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke;
  v10[3] = &unk_26446F8E8;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(ILMessageFilterExtensionContext *)self remoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke_3;
  v8[3] = &unk_26446FAE0;
  id v9 = v5;
  id v7 = v5;
  [v6 deferReportRequestToNetworkWithReply:v8];
}

void __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = ILDefaultLog();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_21DAC7000, v8, OS_LOG_TYPE_DEFAULT, "response: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finish
{
  id v3 = ILDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21DAC7000, v3, OS_LOG_TYPE_DEFAULT, "finishing extension context", v4, 2u);
  }

  [(ILMessageFilterExtensionContext *)self completeRequestReturningItems:0 completionHandler:0];
}

- (void)handleQueryRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ILMessageFilterExtensionContext *)self extension];
  int v9 = [v8 conformsToProtocol:&unk_26CE70D30];

  if (v9)
  {
    id v10 = [(ILMessageFilterExtensionContext *)self extension];
    [v10 handleQueryRequest:v6 context:self completion:v7];
  }
  else
  {
    uint64_t v11 = ILDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ILMessageFilterExtensionContext handleQueryRequest:reply:](self, v11);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)handleReportRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = [(ILMessageFilterExtensionContext *)self extension];
  int v9 = [v8 conformsToProtocol:&unk_26CE70D90];

  if (v9)
  {
    id v10 = [(ILMessageFilterExtensionContext *)self extension];
    [v10 handleReportRequest:v6 context:self completion:v7];
  }
  else
  {
    uint64_t v11 = ILDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ILMessageFilterExtensionContext handleReportRequest:reply:](self, v11);
    }

    v7[2](v7);
  }
}

- (void)handleCapabilitiesQueryRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ILMessageFilterExtensionContext *)self extension];
  int v9 = [v8 conformsToProtocol:&unk_26CE70DF0];

  if (v9)
  {
    id v10 = [(ILMessageFilterExtensionContext *)self extension];
    [v10 handleCapabilitiesQueryRequest:v6 context:self completion:v7];
  }
  else
  {
    uint64_t v11 = ILDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ILMessageFilterExtensionContext handleCapabilitiesQueryRequest:reply:](self, v11);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ILMessageFilterExtensionContext *)self _auxiliaryConnection];
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

void __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21DAC7000, v0, v1, "remoteObjectProxy error: %@", v2);
}

void __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_1_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21DAC7000, v0, v1, "deferQueryRequestToNetwork error: %@", v2);
}

void __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke_3_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21DAC7000, v0, v1, "deferReportRequestToNetwork error: %@", v2);
}

- (void)handleQueryRequest:(void *)a1 reply:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 extension];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21DAC7000, a2, v4, "Extension %@ does not conform to protocol ILMessageFilterQueryHandling", v5);
}

- (void)handleReportRequest:(void *)a1 reply:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 extension];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21DAC7000, a2, v4, "Extension %@ does not conform to protocol ILMessageFilterReportHandling", v5);
}

- (void)handleCapabilitiesQueryRequest:(void *)a1 reply:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 extension];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21DAC7000, a2, v4, "Extension %@ does not conform to protocol ILMessageFilterCapabilitiesQueryHandling", v5);
}

@end