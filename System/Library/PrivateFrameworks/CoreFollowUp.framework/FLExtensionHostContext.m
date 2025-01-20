@interface FLExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (FLExtensionHostContextInterface)delegate;
- (id)remoteContextWithErrorHandler:(id)a3;
- (void)extensionDidFinish;
- (void)extensionDidFinishWithUserInfo:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FLExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

void __57__FLExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18DA2A8];
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v6 forSelector:sel_extensionDidFinishWithUserInfo_completionHandler_ argumentIndex:0 ofReply:0];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_51);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

void __59__FLExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18DCF80];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_processFollowUpItem_selectedAction_completion_ argumentIndex:0 ofReply:0];

  uint64_t v4 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v5 forSelector:sel_processFollowUpItem_selectedAction_completion_ argumentIndex:1 ofReply:0];
}

- (id)remoteContextWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FLExtensionHostContext *)self _auxiliaryConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)extensionDidFinish
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[FLExtensionHostContext extensionDidFinish]";
    _os_log_impl(&dword_1BE24A000, v3, OS_LOG_TYPE_DEFAULT, "-- %s --", (uint8_t *)&v5, 0xCu);
  }

  [(FLExtensionHostContext *)self extensionDidFinishWithUserInfo:0 completionHandler:0];
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[FLExtensionHostContext extensionDidFinish]";
    _os_log_impl(&dword_1BE24A000, v4, OS_LOG_TYPE_DEFAULT, "-- %s -- DONE.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)extensionDidFinishWithUserInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[FLExtensionHostContext extensionDidFinishWithUserInfo:completionHandler:]";
    _os_log_impl(&dword_1BE24A000, v8, OS_LOG_TYPE_DEFAULT, "-- %s --", (uint8_t *)&v12, 0xCu);
  }

  v9 = [(FLExtensionHostContext *)self delegate];
  v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Extension responded to tear down: %@", (uint8_t *)&v12, 0xCu);
  }

  [v9 extensionDidFinishWithUserInfo:v7 completionHandler:v6];
  v11 = _FLLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[FLExtensionHostContext extensionDidFinishWithUserInfo:completionHandler:]";
    _os_log_impl(&dword_1BE24A000, v11, OS_LOG_TYPE_DEFAULT, "-- %s -- DONE.", (uint8_t *)&v12, 0xCu);
  }
}

- (FLExtensionHostContextInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FLExtensionHostContextInterface *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end