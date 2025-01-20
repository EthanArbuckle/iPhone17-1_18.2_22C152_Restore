@interface NEExtensionProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (NEExtensionProviderContext)initWithProvider:(id)a3;
- (NSString)description;
- (NSString)extensionPoint;
- (id)_principalObject;
- (void)cancelWithError:(id)a3;
- (void)completeSession;
- (void)createWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5;
- (void)dispose;
- (void)dropProvider;
- (void)hostContext;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4;
- (void)setDescription:(uint64_t)a1;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)startedWithError:(id)a3;
- (void)stopWithReason:(int)a3;
- (void)validateWithCompletionHandler:(id)a3;
- (void)wake;
@end

@implementation NEExtensionProviderContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_hostConnection, 0);
  objc_storeStrong(&self->_stopCompletionHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_description, 0);

  objc_storeStrong((id *)&self->_hostContext, 0);
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (NSString)extensionPoint
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NEExtensionProviderContext *)self _principalObject];
  [v13 observerHelperHandler:v12 ofObject:v11 change:v10 context:a6];
}

- (void)validateWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  v5 = [(NEExtensionProviderContext *)self _principalObject];
  [(NEExtensionProviderContext *)self requiredProviderSuperClass];
  if (objc_opt_isKindOfClass())
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"NEFilterErrorDomain" code:4 userInfo:0];
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromClass([(NEExtensionProviderContext *)self requiredProviderSuperClass]);
      int v9 = 138412290;
      id v10 = v8;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Provider is not a %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v4[2](v4, v6);
}

- (void)stopWithReason:(int)a3
{
  if (a3 == 40)
  {
    uint64_t v4 = 3;
    goto LABEL_5;
  }
  if (a3 == 6)
  {
    uint64_t v4 = 2;
LABEL_5:
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"NEAgentErrorDomain" code:v4 userInfo:0];
    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_7:
  id v6 = (id)v5;
  [(NEExtensionProviderContext *)self cancelWithError:v5];
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a4, 56);
  }
}

- (void)dispose
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self || !self->_isDisposed)
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      uint64_t v5 = self;
      _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: disposing", (uint8_t *)&v4, 0xCu);
    }

    if (self) {
      self->_isDisposed = 1;
    }
    [(NEExtensionProviderContext *)self completeSession];
  }
}

- (void)createWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void))a3;
  uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v6 = [v5 objectForInfoDictionaryKey:@"NetworkExtension"];

  if ((isa_nsdictionary(v6) & 1) == 0)
  {
    v18 = ne_log_obj();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v19 = "NetworkExtension dictionary is missing from Info.plist";
LABEL_26:
    _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_11;
  }
  v7 = [(NEExtensionProviderContext *)self extensionPoint];

  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"NEProviderClasses"];
    if ((isa_nsdictionary(v8) & 1) == 0)
    {
      v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = @"NEProviderClasses";
        _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, "%@ dictionary is missing from Info.plist", buf, 0xCu);
      }

      v4[2](v4, 0);
      goto LABEL_20;
    }
    int v9 = [(NEExtensionProviderContext *)self extensionPoint];
    id v10 = [v8 objectForKeyedSubscript:v9];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(NSString *)v10 length])
    {
      uint64_t v11 = NSClassFromString(v10);
      if (v11)
      {
        id v12 = (NEProvider *)objc_alloc_init(v11);
        [(NEProvider *)v12 beginRequestWithExtensionContext:self];
        provider = self->_provider;
        self->_provider = v12;
        v14 = v12;

        v15 = (void *)[[NSString alloc] initWithFormat:@"com.apple.networkextension.providerContext.%@", v10];
        [v15 UTF8String];
        v16 = (OS_os_transaction *)os_transaction_create();
        transaction = self->_transaction;
        self->_transaction = v16;

        v4[2](v4, 1);
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      v22 = ne_log_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = (__CFString *)v10;
        _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "No such class: %@", buf, 0xCu);
      }
    }
    else
    {
      v21 = ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = [(NEExtensionProviderContext *)self extensionPoint];
        *(_DWORD *)buf = 138412290;
        v25 = v23;
        _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, "NetworkExtension Info.plist dictionary does not contain a NEProvider class for extension point %@", buf, 0xCu);
      }
    }
    v4[2](v4, 0);
    goto LABEL_19;
  }
  v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v19 = "Extension point is nil";
    goto LABEL_26;
  }
LABEL_11:

  v4[2](v4, 0);
LABEL_21:
}

- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    v15 = self;
    _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%@: display message", (uint8_t *)&v14, 0xCu);
  }

  id v13 = [(NEExtensionProviderContext *)self hostContext];
  [v13 displayMessage:v10 message:v9 completionHandler:v8];
}

- (void)hostContext
{
  if (self)
  {
    v3 = self;
    int v4 = (void *)self[3];
    if (!v4)
    {
      id v5 = objc_getProperty(self, a2, 64, 1);
      if (!v5)
      {
        id v5 = [v3 _auxiliaryConnection];
      }
      uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_77];
      v7 = (void *)v3[3];
      v3[3] = v6;

      if (!v3[3])
      {
        id v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v10 = 0;
          _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Host context object is nil, cannot talk to host", v10, 2u);
        }
      }
      int v4 = (void *)v3[3];
    }
    self = v4;
    uint64_t v2 = vars8;
  }
  return self;
}

void __41__NEExtensionProviderContext_hostContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "Error while calling host: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)startedWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v5 localizedDescription];
      int v12 = 138412546;
      id v13 = self;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%@: Started with error %@", (uint8_t *)&v12, 0x16u);
    }
    id v8 = [(NEExtensionProviderContext *)self hostContext];
    [v8 startedWithError:v5];

    if (self) {
      objc_setProperty_atomic_copy(self, v9, 0, 56);
    }
  }
  else
  {
    id v10 = [(NEExtensionProviderContext *)self hostContext];
    [v10 startedWithError:0];
  }
}

- (void)cancelWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self && objc_getProperty(self, v4, 56, 1))
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "%@: Calling stop completion handler with error %@", (uint8_t *)&v10, 0x16u);
    }

    Property = (void (**)(id, id))objc_getProperty(self, v7, 56, 1);
    Property[2](Property, v5);
    objc_setProperty_atomic_copy(self, v9, 0, 56);
  }
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (nelog_is_info_logging_enabled())
  {
    id v8 = [NSString stringWithFormat:@"[Extension %@]", v7];
    -[NEExtensionProviderContext setDescription:]((uint64_t)self, v8);
  }
  if (nelog_is_debug_logging_enabled())
  {
    SEL v9 = ne_log_large_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_debug_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEBUG, "%@: Setting configuration to %@", buf, 0x16u);
    }
  }
  else
  {
    SEL v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = self;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_INFO, "%@: Setting configuration", buf, 0xCu);
    }
  }

  if (self) {
    objc_setProperty_atomic(self, v10, v6, 48);
  }
  uint64_t v11 = [(NEExtensionProviderContext *)self _principalObject];
  __int16 v12 = [v6 applicationName];
  [v11 setAppName:v12];
}

- (void)setDescription:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)wake
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: Calling wake", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(NEExtensionProviderContext *)self _principalObject];
  [v4 wake];
}

- (void)sleepWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Calling sleepWithCompletionHandler:", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(NEExtensionProviderContext *)self _principalObject];
  [v6 sleepWithCompletionHandler:v4];
}

- (void)completeSession
{
  if (self && objc_getProperty(self, a2, 64, 1))
  {
    objc_msgSend(objc_getProperty(self, v3, 64, 1), "invalidate");
    hostConnection = self->_hostConnection;
    self->_hostConnection = 0;

    provider = self->_provider;
    self->_provider = 0;

    transaction = self->_transaction;
    self->_transaction = 0;

    id v8 = +[NEProviderServer sharedServer];
    [v8 removeProviderContext:self];
  }
  else
  {
    int v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "Calling completeRequest", buf, 2u);
    }

    [(NEExtensionProviderContext *)self completeRequestReturningItems:0 completionHandler:0];
  }
}

- (id)_principalObject
{
  if (self && self->_isDisposed)
  {
    id v2 = 0;
  }
  else
  {
    provider = self->_provider;
    if (provider)
    {
      id v2 = provider;
    }
    else
    {
      v5.receiver = self;
      v5.super_class = (Class)NEExtensionProviderContext;
      id v2 = [(NEExtensionProviderContext *)&v5 _principalObject];
    }
  }

  return v2;
}

- (NSString)description
{
  description = self->_description;
  if (description)
  {
    v3 = description;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NEExtensionProviderContext;
    v3 = [(NEExtensionProviderContext *)&v5 description];
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEFAULT, "%@: Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NEExtensionProviderContext;
  [(NEExtensionProviderContext *)&v4 dealloc];
}

- (void)dropProvider
{
  self->_provider = 0;
  MEMORY[0x1F41817F8]();
}

- (NEExtensionProviderContext)initWithProvider:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NEExtensionProviderContext;
  id v6 = [(NEExtensionProviderContext *)&v8 init];
  if (v6)
  {
    [v5 beginRequestWithExtensionContext:v6];
    objc_storeStrong((id *)&v6->_provider, a3);
  }

  return v6;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2747 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2747, &__block_literal_global_66);
  }
  id v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_2748;

  return v2;
}

uint64_t __61__NEExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_2748 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0928C8];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2750 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2750, &__block_literal_global_2751);
  }
  id v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2752;

  return v2;
}

uint64_t __63__NEExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_2752 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF092820];

  return MEMORY[0x1F41817F8]();
}

void __49__NEExtensionProviderContext_initWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@: Session manager connection was invalidated", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5 && objc_getProperty(v5, v4, 56, 1))
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __49__NEExtensionProviderContext_initWithConnection___block_invoke_1;
    newValue[3] = &unk_1E59924B8;
    objc_copyWeak(&v9, (id *)buf);
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v6, newValue, 56);
      uint64_t v7 = *(void **)(a1 + 32);
    }
    [v7 stopWithReason:1];
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __49__NEExtensionProviderContext_initWithConnection___block_invoke_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dispose];
}

@end