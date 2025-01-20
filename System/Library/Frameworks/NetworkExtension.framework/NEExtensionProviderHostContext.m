@interface NEExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (NSString)description;
- (id)delegate;
- (id)initWithVendorEndpoint:(void *)a3 processIdentity:(void *)a4 delegate:;
- (id)vendorContext;
- (int)requiredEntitlement;
- (void)createWithCompletionHandler:(id)a3;
- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5;
- (void)dispose;
- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)startedWithError:(id)a3;
- (void)stopWithReason:(int)a3;
- (void)validateWithCompletionHandler:(id)a3;
- (void)wake;
@end

@implementation NEExtensionProviderHostContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorConnection, 0);
  objc_storeStrong((id *)&self->_extensionProcessIdentity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_description, 0);

  objc_storeStrong((id *)&self->_vendorContext, 0);
}

- (int)requiredEntitlement
{
  return 0;
}

- (void)validateWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    v16 = self;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@: Validating", (uint8_t *)&v15, 0xCu);
  }

  v6 = @"com.apple.developer.networking.networkextension";
  if (self)
  {
    v7 = self->_vendorConnection;
    if (v7
      || ([(NEExtensionProviderHostContext *)self _auxiliaryConnection],
          (v7 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(NSXPCConnection *)v7 _xpcConnection];

      if (v8)
      {
        v9 = [(NSXPCConnection *)v7 _xpcConnection];
        v10 = @"com.apple.developer.networking.networkextension";
        [@"com.apple.developer.networking.networkextension" UTF8String];
        v8 = (void *)xpc_connection_copy_entitlement_value();
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  int v11 = NEGetEntitlement(v8);
  if (([(NEExtensionProviderHostContext *)self requiredEntitlement] & v11) != 0)
  {
    v12 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
    [v12 validateWithCompletionHandler:v4];
  }
  else
  {
    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = [(NEExtensionProviderHostContext *)self requiredEntitlement];
      int v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "Provider is missing the required NetworkExtension entitlement (%x)", (uint8_t *)&v15, 8u);
    }

    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"NEFilterErrorDomain" code:1 userInfo:0];
    v4[2](v4, v12);
  }
}

- (id)vendorContext
{
  if (val)
  {
    v1 = val;
    id v2 = val[3];
    if (!v2)
    {
      objc_initWeak(&location, val);
      id v3 = v1[9];
      if (!v3)
      {
        id v3 = [v1 _auxiliaryConnection];
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__NEExtensionProviderHostContext_vendorContext__block_invoke;
      v9[3] = &unk_1E59924B8;
      objc_copyWeak(&v10, &location);
      uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v9];
      id v5 = v1[3];
      v1[3] = (id)v4;

      if (!v1[3])
      {
        v6 = ne_log_obj();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v8[0] = 0;
          _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Vendor context object is nil, cannot talk to extension", (uint8_t *)v8, 2u);
        }
      }
      objc_destroyWeak(&v10);

      objc_destroyWeak(&location);
      id v2 = v1[3];
    }
    val = (id *)v2;
  }

  return val;
}

void __47__NEExtensionProviderHostContext_vendorContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "Error while calling extension: %@", (uint8_t *)&v9, 0xCu);
  }

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 7);
    if (v6)
    {
      v7 = v6;
      [v6 extension:WeakRetained didFailWithError:v3];
    }
    else
    {
      v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Host context delegate is nil, cannot notify of extension failure", (uint8_t *)&v9, 2u);
      }

      v7 = 0;
    }
  }
  else
  {
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Host context is nil, cannot notify of extension failure", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)stopWithReason:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_stopped)
  {
    uint64_t v3 = *(void *)&a3;
    self->_stopped = 1;
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412546;
      v8 = self;
      __int16 v9 = 2048;
      uint64_t v10 = (int)v3;
      _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@: Stopping with reason %ld", (uint8_t *)&v7, 0x16u);
    }

    [(NEUserNotification *)self->_notification cancel];
    v6 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
    [v6 stopWithReason:v3];
  }
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    id v13 = v6;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting with options %p", (uint8_t *)&v10, 0x16u);
  }

  __int16 v9 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  [v9 startWithOptions:v6 completionHandler:v7];
}

- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [NEUserNotification alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__NEExtensionProviderHostContext_displayMessage_message_completionHandler___block_invoke;
  v15[3] = &unk_1E598F8D8;
  id v16 = v8;
  id v12 = v8;
  id v13 = [(NEUserNotification *)v11 initAndShowAlertWithHeader:v10 message:v9 alternateMessage:0 defaultMessage:0 noBoldDefault:0 usePrivacyIcon:0 extensionItem:0 callbackQueue:MEMORY[0x1E4F14428] callbackHandler:v15];

  notification = self->_notification;
  self->_notification = v13;
}

uint64_t __75__NEExtensionProviderHostContext_displayMessage_message_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startedWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@: started with error %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.isa);
  [v6 extension:self didStartWithError:v4];
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)dispose
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "%@: disposing", (uint8_t *)&v5, 0xCu);
  }

  id v4 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  [v4 dispose];
}

- (void)createWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 createWithCompletionHandler:v4];
}

- (void)wake
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "%@: Waking", (uint8_t *)&v5, 0xCu);
  }

  id v4 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  [v4 wake];
}

- (void)sleepWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@: Sleeping", (uint8_t *)&v7, 0xCu);
  }

  id v6 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  [v6 sleepWithCompletionHandler:v4];
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 stringWithFormat:@"[Host %@]", v7];
  id v10 = v9;
  if (self) {
    objc_storeStrong((id *)&self->_description, v9);
  }

  uint64_t v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = self;
    _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%@: Set Configuration", buf, 0xCu);
  }

  id v12 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  [v12 setConfiguration:v8 extensionIdentifier:v7];
}

- (NSString)description
{
  return self->_description;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2891 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2891, &__block_literal_global_62);
  }
  id v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_2892;

  return v2;
}

uint64_t __65__NEExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_2892 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0928C8];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2894 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2894, &__block_literal_global_2895);
  }
  id v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2896;

  return v2;
}

uint64_t __67__NEExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_2896 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF092820];

  return MEMORY[0x1F41817F8]();
}

- (id)initWithVendorEndpoint:(void *)a3 processIdentity:(void *)a4 delegate:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)NEExtensionProviderHostContext;
    id v10 = (id *)objc_msgSendSuper2(&v21, sel_initWithInputItems_, 0);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 7, v9);
      *((unsigned char *)a1 + 49) = 1;
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v7];
      id v12 = a1[9];
      a1[9] = (id)v11;

      id v13 = [(id)objc_opt_class() _extensionAuxiliaryHostProtocol];
      [a1[9] setExportedInterface:v13];

      [a1[9] setExportedObject:a1];
      uint64_t v14 = [(id)objc_opt_class() _extensionAuxiliaryVendorProtocol];
      [a1[9] setRemoteObjectInterface:v14];

      objc_initWeak(&location, a1);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke;
      v18[3] = &unk_1E5992C58;
      objc_copyWeak(&v19, &location);
      [a1[9] setInterruptionHandler:v18];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke_2;
      v16[3] = &unk_1E5992C58;
      objc_copyWeak(&v17, &location);
      [a1[9] setInvalidationHandler:v16];
      [a1[9] resume];
      objc_storeStrong(a1 + 8, a3);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

uint64_t __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 7);
    [v3 extension:v6 didFailWithError:0];

    id v2 = v6;
    WeakRetained = (id *)v6[9];
    if (WeakRetained)
    {
      [WeakRetained invalidate];
      id v4 = v6[9];
      v6[9] = 0;

      id v2 = v6;
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

uint64_t __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 7);
    [v3 extensionDidStop:v6];

    id v2 = v6;
    WeakRetained = (id *)v6[9];
    if (WeakRetained)
    {
      [WeakRetained invalidate];
      id v4 = v6[9];
      v6[9] = 0;

      id v2 = v6;
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

@end