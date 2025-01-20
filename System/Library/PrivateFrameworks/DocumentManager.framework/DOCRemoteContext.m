@interface DOCRemoteContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)serviceProxyWithErrorHandler:(id)a3;
- (void)updateAppearance:(id)a3 completionBlock:(id)a4;
- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5;
- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation DOCRemoteContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[DOCExtensionInterface hostProtocol];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[DOCExtensionInterface vendorProtocol];
}

- (id)serviceProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(DOCRemoteContext *)self _auxiliaryConnection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(DOCRemoteContext *)self serviceProxyWithErrorHandler:&__block_literal_global_2];
  [v10 updateAppearance:v9 shouldFlushCA:v5 completionBlock:v8];
}

void __67__DOCRemoteContext_updateAppearance_shouldFlushCA_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (NSObject **)MEMORY[0x263F3AC28];
  id v4 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    id v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __67__DOCRemoteContext_updateAppearance_shouldFlushCA_completionBlock___block_invoke_cold_1();
  }
}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(DOCRemoteContext *)self serviceProxyWithErrorHandler:&__block_literal_global_21];
  [v6 updateEditingTo:v5 animated:v4];
}

void __45__DOCRemoteContext_updateEditingTo_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (NSObject **)MEMORY[0x263F3AC28];
  BOOL v4 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    BOOL v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __67__DOCRemoteContext_updateAppearance_shouldFlushCA_completionBlock___block_invoke_cold_1();
  }
}

void __67__DOCRemoteContext_updateAppearance_shouldFlushCA_completionBlock___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_21361D000, v0, OS_LOG_TYPE_FAULT, "Failed to get the service proxy object with error %@", v1, 0xCu);
}

@end