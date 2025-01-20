@interface BCSParsingServiceConnection
- (NSXPCConnection)parsingServiceConnection;
- (void)dealloc;
- (void)decodeAppClipCodeURLWithEncodedData:(id)a3 codingVersion:(unint64_t)a4 requiresAuthorization:(BOOL)a5 withReply:(id)a6;
- (void)parseQRCodeFeature:(id)a3 withReply:(id)a4;
- (void)parseQRCodeMetadata:(id)a3 withReply:(id)a4;
- (void)parseQRCodeString:(id)a3 withReply:(id)a4;
- (void)setParsingServiceConnection:(id)a3;
- (void)setPreferredBundleIdentifier:(id)a3 forURL:(id)a4;
@end

@implementation BCSParsingServiceConnection

- (void)dealloc
{
  [(NSXPCConnection *)self->_parsingServiceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BCSParsingServiceConnection;
  [(BCSParsingServiceConnection *)&v3 dealloc];
}

- (void)parseQRCodeString:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(BCSParsingServiceConnection *)self parsingServiceConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke;
  v14[3] = &unk_26468B388;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_1;
  v12[3] = &unk_26468B7E8;
  id v13 = v9;
  id v11 = v9;
  [v10 parseQRCodeString:v7 withReply:v12];
}

void __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)parseQRCodeMetadata:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(BCSParsingServiceConnection *)self parsingServiceConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__BCSParsingServiceConnection_parseQRCodeMetadata_withReply___block_invoke;
  v14[3] = &unk_26468B388;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__BCSParsingServiceConnection_parseQRCodeMetadata_withReply___block_invoke_3;
  v12[3] = &unk_26468B7E8;
  id v13 = v9;
  id v11 = v9;
  [v10 parseQRCodeMetadata:v7 withReply:v12];
}

void __61__BCSParsingServiceConnection_parseQRCodeMetadata_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__BCSParsingServiceConnection_parseQRCodeMetadata_withReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)parseQRCodeFeature:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(BCSParsingServiceConnection *)self parsingServiceConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__BCSParsingServiceConnection_parseQRCodeFeature_withReply___block_invoke;
  v14[3] = &unk_26468B388;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__BCSParsingServiceConnection_parseQRCodeFeature_withReply___block_invoke_4;
  v12[3] = &unk_26468B7E8;
  id v13 = v9;
  id v11 = v9;
  [v10 parseQRCodeFeature:v7 withReply:v12];
}

void __60__BCSParsingServiceConnection_parseQRCodeFeature_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__BCSParsingServiceConnection_parseQRCodeFeature_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)decodeAppClipCodeURLWithEncodedData:(id)a3 codingVersion:(unint64_t)a4 requiresAuthorization:(BOOL)a5 withReply:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  v12 = [(BCSParsingServiceConnection *)self parsingServiceConnection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __113__BCSParsingServiceConnection_decodeAppClipCodeURLWithEncodedData_codingVersion_requiresAuthorization_withReply___block_invoke;
  v18[3] = &unk_26468B388;
  id v13 = v10;
  id v19 = v13;
  v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __113__BCSParsingServiceConnection_decodeAppClipCodeURLWithEncodedData_codingVersion_requiresAuthorization_withReply___block_invoke_5;
  v16[3] = &unk_26468B810;
  id v17 = v13;
  id v15 = v13;
  [v14 decodeAppClipCodeURLWithEncodedData:v11 codingVersion:a4 requiresAuthorization:v6 withReply:v16];
}

void __113__BCSParsingServiceConnection_decodeAppClipCodeURLWithEncodedData_codingVersion_requiresAuthorization_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__BCSParsingServiceConnection_decodeAppClipCodeURLWithEncodedData_codingVersion_requiresAuthorization_withReply___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPreferredBundleIdentifier:(id)a3 forURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BCSParsingServiceConnection *)self parsingServiceConnection];
  v8 = [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_7];
  [v8 setPreferredBundleIdentifier:v7 forURL:v6];
}

void __67__BCSParsingServiceConnection_setPreferredBundleIdentifier_forURL___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(a2);
  }
}

- (NSXPCConnection)parsingServiceConnection
{
  v15[8] = *MEMORY[0x263EF8340];
  parsingServiceConnection = self->_parsingServiceConnection;
  if (parsingServiceConnection)
  {
    id v3 = parsingServiceConnection;
  }
  else
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.BarcodeSupport.ParsingService"];
    id v6 = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v5;

    id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D61CC50];
    v8 = (void *)MEMORY[0x263EFFA08];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    v15[6] = objc_opt_class();
    v15[7] = objc_opt_class();
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:8];
    id v10 = [v8 setWithArray:v9];

    [v7 setClasses:v10 forSelector:sel_parseQRCodeString_withReply_ argumentIndex:0 ofReply:1];
    [v7 setClasses:v10 forSelector:sel_parseQRCodeMetadata_withReply_ argumentIndex:0 ofReply:1];
    [v7 setClasses:v10 forSelector:sel_parseQRCodeFeature_withReply_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)self->_parsingServiceConnection setRemoteObjectInterface:v7];
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__BCSParsingServiceConnection_parsingServiceConnection__block_invoke;
    v12[3] = &unk_26468B110;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_parsingServiceConnection setInvalidationHandler:v12];
    [(NSXPCConnection *)self->_parsingServiceConnection resume];
    id v3 = self->_parsingServiceConnection;
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __55__BCSParsingServiceConnection_parsingServiceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setParsingServiceConnection:0];
}

- (void)setParsingServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BCSParsingServiceConnection: Error getting remote object proxy: %{public}@", v3, v4, v5, v6, v7);
}

@end