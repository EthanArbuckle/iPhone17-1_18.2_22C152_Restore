@interface NEExtensionAppPushProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)extensionPoint;
- (void)dealloc;
- (void)reportIncomingCall:(id)a3;
- (void)reportPushToTalkMessage:(id)a3;
- (void)sendTimerEvent;
- (void)setProviderConfiguration:(id)a3;
- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3 completionHandler:(id)a4;
@end

@implementation NEExtensionAppPushProviderContext

- (void)sendTimerEvent
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "%@ sendTimerEvent called", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(NEExtensionProviderContext *)self _principalObject];
  [v4 handleTimerEvent];
}

- (void)reportPushToTalkMessage:(id)a3
{
  id v4 = a3;
  id v6 = [(NEExtensionProviderContext *)self hostContext];
  [v6 reportPushToTalkMessage:v4];
}

- (void)reportIncomingCall:(id)a3
{
  id v4 = a3;
  id v6 = [(NEExtensionProviderContext *)self hostContext];
  [v6 reportIncomingCall:v4];
}

- (void)setProviderConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(NEExtensionProviderContext *)self _principalObject];
  [v5 setProviderConfiguration:v4];
}

- (void)stopWithReason:(int)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "%@ stopWithReason called", buf, 0xCu);
  }

  v8 = [(NEExtensionProviderContext *)self _principalObject];
  if (self && (a3 - 1) <= 0x29) {
    uint64_t v9 = qword_19DF9BFE8[a3 - 1];
  }
  else {
    uint64_t v9 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__NEExtensionAppPushProviderContext_stopWithReason_completionHandler___block_invoke;
  v11[3] = &unk_1E59936F8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 stopWithReason:v9 completionHandler:v11];
}

uint64_t __70__NEExtensionAppPushProviderContext_stopWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "%@ provider stopped", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  v8 = [(NEExtensionProviderContext *)self _principalObject];
  uint64_t v9 = v8;
  if (v6) {
    [v8 setProviderConfiguration:v6];
  }
  id v10 = v9;
  v11 = v10;
  if (self && (uint64_t v12 = [v10 superclass]) != 0)
  {
    v13 = (void *)v12;
    uint64_t v14 = [v11 methodForSelector:sel_start];
    BOOL v15 = v14 != [v13 instanceMethodForSelector:sel_start];
  }
  else
  {
    BOOL v15 = 0;
  }

  v16 = ne_log_obj();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "%@ the new start method is overridden", buf, 0xCu);
    }

    [v11 start];
    v7[2](v7, 0);
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "%@ the new start method is not overridden", buf, 0xCu);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__NEExtensionAppPushProviderContext_startConnectionWithProviderConfig_completionHandler___block_invoke;
    v18[3] = &unk_1E5993798;
    v18[4] = self;
    v19 = v7;
    [v11 startWithCompletionHandler:v18];
  }
}

void __89__NEExtensionAppPushProviderContext_startConnectionWithProviderConfig_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@ startWithCompletionHandler failed, error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v6 = self;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NEExtensionAppPushProviderContext;
  [(NEExtensionProviderContext *)&v4 dealloc];
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.app-push";
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_24730 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_24730, &__block_literal_global_72_24731);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_24732;

  return v2;
}

uint64_t __68__NEExtensionAppPushProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094C08];
  uint64_t v1 = _extensionAuxiliaryHostProtocol_protocol_24732;
  _extensionAuxiliaryHostProtocol_protocol_24732 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_24735 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_24735, &__block_literal_global_24736);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_24737;

  return v2;
}

uint64_t __70__NEExtensionAppPushProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094BA8];
  uint64_t v1 = _extensionAuxiliaryVendorProtocol_protocol_24737;
  _extensionAuxiliaryVendorProtocol_protocol_24737 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end