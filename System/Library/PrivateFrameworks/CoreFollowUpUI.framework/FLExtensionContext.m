@interface FLExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)_shadowPrincipalObject;
- (id)extensionLogicProvider;
- (id)hostContextWithErrorHandler:(id)a3;
- (id)syncHostContextWithErrorHandler:(id)a3;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
@end

@implementation FLExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

uint64_t __53__FLExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D47B898];

  return MEMORY[0x270F9A758]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

void __55__FLExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D45FCA8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_processFollowUpItem_selectedAction_completion_ argumentIndex:0 ofReply:0];

  v4 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v5 forSelector:sel_processFollowUpItem_selectedAction_completion_ argumentIndex:1 ofReply:0];
}

- (id)extensionLogicProvider
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(FLExtensionContext *)self _principalObject];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FLExtensionContext *)self _shadowPrincipalObject];
  }
  v6 = v5;

  v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_221DA3000, v7, OS_LOG_TYPE_DEFAULT, "Loaded extension principal object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_shadowPrincipalObject
{
  id shadowPrincipalObject = self->_shadowPrincipalObject;
  if (!shadowPrincipalObject)
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = [v4 infoDictionary];
    v6 = [v5 objectForKeyedSubscript:@"NSExtension"];
    v7 = [v6 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];

    id v8 = v7;
    Class = objc_getClass((const char *)[v8 UTF8String]);
    if ([(objc_class *)Class conformsToProtocol:&unk_26D4636A0]
      && [(objc_class *)Class conformsToProtocol:&unk_26D46FBE0])
    {
      id v10 = objc_alloc_init(Class);
      id v11 = self->_shadowPrincipalObject;
      self->_id shadowPrincipalObject = v10;
    }
    id shadowPrincipalObject = self->_shadowPrincipalObject;
  }

  return shadowPrincipalObject;
}

- (id)hostContextWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FLExtensionContext *)self _auxiliaryConnection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)syncHostContextWithErrorHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(FLExtensionContext *)self _auxiliaryConnection];
    int v12 = 136315394;
    v13 = "-[FLExtensionContext syncHostContextWithErrorHandler:]";
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "%s self._auxiliaryConnection: %@", (uint8_t *)&v12, 0x16u);
  }
  v7 = [(FLExtensionContext *)self _auxiliaryConnection];
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v4];

  int v9 = _FLLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(FLExtensionContext *)self _auxiliaryConnection];
    int v12 = 136315650;
    v13 = "-[FLExtensionContext syncHostContextWithErrorHandler:]";
    __int16 v14 = 2112;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_221DA3000, v9, OS_LOG_TYPE_DEFAULT, "%s return hostContext: %@ self._auxiliaryConnection: %@", (uint8_t *)&v12, 0x20u);
  }

  return v8;
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = _FLLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v14 = 0;
    _os_log_impl(&dword_221DA3000, v11, OS_LOG_TYPE_DEFAULT, "FLExtensionContext: process action", v14, 2u);
  }

  int v12 = [(FLExtensionContext *)self extensionLogicProvider];
  v13 = v12;
  if (v12) {
    [v12 processFollowUpItem:v8 selectedAction:v9 completion:v10];
  }
  else {
    v10[2](v10, 1);
  }
}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "FLExtensionContext: refresh", buf, 2u);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__FLExtensionContext_followUpPerformUpdateWithCompletionHandler___block_invoke;
  v10[3] = &unk_2645F22E8;
  id v6 = v4;
  id v11 = v6;
  v7 = (void (**)(void, void))MEMORY[0x223C91420](v10);
  id v8 = [(FLExtensionContext *)self extensionLogicProvider];
  if (objc_opt_respondsToSelector())
  {
    [v8 followUpPerformUpdateWithCompletionHandler:v7];
  }
  else
  {
    id v9 = _FLLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221DA3000, v9, OS_LOG_TYPE_DEFAULT, "Skipping refresh, extension does not support it", buf, 2u);
    }

    v7[2](v7, 0);
  }
}

uint64_t __65__FLExtensionContext_followUpPerformUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_221DA3000, v2, OS_LOG_TYPE_DEFAULT, "FLExtensionContext: completing request...", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end