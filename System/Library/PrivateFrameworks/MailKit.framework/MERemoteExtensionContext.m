@interface MERemoteExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (id)log;
- (MEExtensionRemoteHostProtocol)remoteHostPoxy;
- (MERemoteExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (NSArray)requiredHeaders;
- (NSMapTable)composeSessionToHandlerMap;
- (id)_composeSessionInterfaceForSession:(id)a3;
- (id)_contentBlockerInterface;
- (id)_createPrincipalObject;
- (id)_extensionInterface;
- (id)_mailActionInterface;
- (id)_messageSecurityHandlerInterface;
- (id)additionalHeadersForSession:(id)a3;
- (id)contentRulesJSON;
- (id)decodedMessageForMessageData:(id)a3;
- (id)decodedMessageForMessageData:(id)a3 decodeContext:(id)a4;
- (id)extensionViewControllerForMessageContext:(id)a3;
- (id)extensionViewControllerForMessageSigners:(id)a3;
- (id)remoteProxy;
- (id)viewControllerForSession:(id)a3;
- (void)_createPrincipalObject;
- (void)contentRulesJSONWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)decideActionForMessage:(id)a3 completionHandler:(id)a4;
- (void)decodedMessageForMessageData:(id)a3 decodeContext:(id)a4 withCompletionHandler:(id)a5;
- (void)encodeMessage:(id)a3 composeContext:(id)a4 completionHandler:(id)a5;
- (void)getEncodingStatusForMessage:(id)a3 composeContext:(id)a4 completionHandler:(id)a5;
- (void)mailComposeSessionDidBegin:(id)a3;
- (void)mailComposeSessionDidEnd:(id)a3;
- (void)primaryActionClickedForMessageContext:(id)a3 completionHandler:(id)a4;
- (void)requiredHeadersWithCompletion:(id)a3;
- (void)session:(id)a3 annotateAddressesWithCompletionHandler:(id)a4;
- (void)session:(id)a3 canSendMessageWithCompletionHandler:(id)a4;
- (void)session:(id)a3 getAdditionalHeadersWithCompletion:(id)a4;
- (void)session:(id)a3 hasSendMessageCheckWithCompletion:(id)a4;
- (void)setComposeSessionToHandlerMap:(id)a3;
@end

@implementation MERemoteExtensionContext

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__MERemoteExtensionContext_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, block);
  }
  v2 = (void *)log_log_4;
  return v2;
}

void __31__MERemoteExtensionContext_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] MERemoteExtensiontInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] MEExtensionRemoteHostInterface];
}

- (MERemoteExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MERemoteExtensionContext;
  v11 = [(MERemoteExtensionContext *)&v13 initWithInputItems:v8 listenerEndpoint:v9 contextUUID:v10];
  if (v11) {
    NSLog(&cfstr_S.isa, "-[MERemoteExtensionContext initWithInputItems:listenerEndpoint:contextUUID:]");
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_2164DB000, v3, OS_LOG_TYPE_DEFAULT, "<MERemoteExtensionContext:%p> deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MERemoteExtensionContext;
  [(MERemoteExtensionContext *)&v4 dealloc];
}

- (id)remoteProxy
{
  v2 = [(MERemoteExtensionContext *)self _auxiliaryConnection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (MEExtensionRemoteHostProtocol)remoteHostPoxy
{
  id v3 = [(MERemoteExtensionContext *)self _auxiliaryConnection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__MERemoteExtensionContext_remoteHostPoxy__block_invoke;
  v6[3] = &unk_264283150;
  v6[4] = self;
  objc_super v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return (MEExtensionRemoteHostProtocol *)v4;
}

void __42__MERemoteExtensionContext_remoteHostPoxy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__MERemoteExtensionContext_remoteHostPoxy__block_invoke_cold_1(a1);
  }
}

- (id)_extensionInterface
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v4 = [(MERemoteExtensionContext *)self _principalObject];

  if (v4)
  {
    v5 = [(MERemoteExtensionContext *)self _principalObject];
  }
  else
  {
    v6 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v16 = self;
      __int16 v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_2164DB000, v6, OS_LOG_TYPE_DEFAULT, "ExtensionContext<%p>: Creating new _principalObject for extension Context:%@", buf, 0x16u);
    }

    uint64_t v7 = [(MERemoteExtensionContext *)self _createPrincipalObject];
    id v8 = [MEMORY[0x263F08DA8] _sharedExtensionContextVendor];
    id v9 = [(MERemoteExtensionContext *)self _UUID];
    [v8 _setPrincipalObject:v7 forUUID:v9];

    v5 = (void *)v7;
  }
  if (([v5 conformsToProtocol:&unk_26C728408] & 1) == 0)
  {
    objc_super v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = [(MERemoteExtensionContext *)self _principalObject];
    [v13 handleFailureInMethod:a2, self, @"MERemoteExtensionContext.m", 82, @"ExtensionContext<%p>: _principalObject %@ does not conform to MEExtension protocol in ExtensionContext :%@", self, v14, self object file lineNumber description];
  }
  id v10 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(MERemoteExtensionContext *)self _principalObject];
    *(_DWORD *)buf = 134218498;
    v16 = self;
    __int16 v17 = 2112;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_2164DB000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext<%p>: _principalObject is %@ in ExtensionContext :%@", buf, 0x20u);
  }
  return v5;
}

- (id)_createPrincipalObject
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v27 = [MEMORY[0x263F01858] bundleRecordForCurrentProcess];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    __int16 v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"MERemoteExtensionContext.m", 90, @"Unexpected bunde record class '%@'", v18 object file lineNumber description];
  }
  v2 = [v27 infoDictionary];
  v26 = [v2 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

  id v3 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v35 = self;
    __int16 v36 = 2112;
    id v37 = v26;
    __int16 v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_2164DB000, v3, OS_LOG_TYPE_DEFAULT, "ExtensionContext<%p>: extensionDictionary is %@ for Extension Context :%@", buf, 0x20u);
  }

  aClassName = [v26 objectForKey:@"NSExtensionPrincipalClass"];
  if (![(NSString *)aClassName length])
  {
    v11 = +[MERemoteExtensionContext log];
    v23 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(MERemoteExtensionContext *)(uint64_t)self _createPrincipalObject];
    }
    id v4 = 0;
    goto LABEL_32;
  }
  id v4 = objc_alloc_init(NSClassFromString(aClassName));
  v5 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v35 = self;
    __int16 v36 = 2112;
    id v37 = v4;
    __int16 v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_2164DB000, v5, OS_LOG_TYPE_DEFAULT, "ExtensionContext<%p>: principalObject is %@ for Extension Context :%@", buf, 0x20u);
  }

  if (v4)
  {
    v23 = [v26 objectForKey:@"NSExtensionAttributes"];
    [v23 objectForKey:@"MEExtensionCapabilities"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v9 isEqualToString:@"MEComposeSessionHandler"]
            && (objc_opt_respondsToSelector() & 1) == 0)
          {
            __int16 v19 = [MEMORY[0x263F08690] currentHandler];
          }
          if ([v9 isEqualToString:@"MEMessageActionHandler"]
            && (objc_opt_respondsToSelector() & 1) == 0)
          {
            v20 = [MEMORY[0x263F08690] currentHandler];
          }
          if ([v9 isEqualToString:@"MEContentBlocker"]
            && (objc_opt_respondsToSelector() & 1) == 0)
          {
            uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
          }
          if ([v9 isEqualToString:@"MEMessageSecurityHandler"]
            && (objc_opt_respondsToSelector() & 1) == 0)
          {
            id v10 = [MEMORY[0x263F08690] currentHandler];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v6);
    }

LABEL_32:
    v12 = v4;
    goto LABEL_34;
  }
  v12 = 0;
LABEL_34:
  objc_super v13 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  composeSessionToHandlerMap = self->_composeSessionToHandlerMap;
  self->_composeSessionToHandlerMap = v13;

  return v12;
}

- (id)_contentBlockerInterface
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(MERemoteExtensionContext *)self _extensionInterface];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MERemoteExtensionContext *)self _extensionInterface];
    uint64_t v6 = [v5 handlerForContentBlocker];
  }
  else
  {
    uint64_t v7 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(MERemoteExtensionContext *)self _extensionInterface];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      objc_super v13 = @"handlerForContentBlocker";
      _os_log_impl(&dword_2164DB000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ does not implement %@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)contentRulesJSON
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v4 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v9 = 138412546;
    int v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v5;
    _os_log_impl(&dword_2164DB000, v4, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v6 = [(MERemoteExtensionContext *)self _contentBlockerInterface];
  uint64_t v7 = [v6 contentRulesJSON];

  return v7;
}

- (void)contentRulesJSONWithCompletionHandler:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  char v4 = [(MERemoteExtensionContext *)self contentRulesJSON];
  v5[2](v5, v4);
}

- (id)_mailActionInterface
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(MERemoteExtensionContext *)self _extensionInterface];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MERemoteExtensionContext *)self _extensionInterface];
    uint64_t v6 = [v5 handlerForMessageActions];
  }
  else
  {
    uint64_t v7 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(MERemoteExtensionContext *)self _extensionInterface];
      int v10 = 138412546;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = @"handlerForMessageActions";
      _os_log_impl(&dword_2164DB000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ does not implement %@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)decideActionForMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    int v12 = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_2164DB000, v9, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v12, 0x16u);
  }
  __int16 v11 = [(MERemoteExtensionContext *)self _mailActionInterface];
  [v11 decideActionForMessage:v7 completionHandler:v8];
}

- (NSArray)requiredHeaders
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v4 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v9 = 138412546;
    int v10 = self;
    __int16 v11 = 2112;
    int v12 = v5;
    _os_log_impl(&dword_2164DB000, v4, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v6 = [(MERemoteExtensionContext *)self _mailActionInterface];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 requiredHeaders];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v7;
}

- (void)requiredHeadersWithCompletion:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  char v4 = [(MERemoteExtensionContext *)self requiredHeaders];
  v5[2](v5, v4);
}

- (id)_composeSessionInterfaceForSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MERemoteExtensionContext *)self remoteHostPoxy];
  [v4 setRemoteHostContext:v5];

  uint64_t v6 = [(NSMapTable *)self->_composeSessionToHandlerMap objectForKey:v4];
  if (!v6)
  {
    id v7 = [(MERemoteExtensionContext *)self _extensionInterface];
    uint64_t v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      int v9 = [(MERemoteExtensionContext *)self _extensionInterface];
      uint64_t v6 = [v9 handlerForComposeSession:v4];

      [(NSMapTable *)self->_composeSessionToHandlerMap setObject:v6 forKey:v4];
    }
    else
    {
      int v10 = +[MERemoteExtensionContext log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = [(MERemoteExtensionContext *)self _extensionInterface];
        int v13 = 138412546;
        __int16 v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = @"handlerForComposeSession:";
        _os_log_impl(&dword_2164DB000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ does not implement %@", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (void)mailComposeSessionDidBegin:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v9 = 138412546;
    int v10 = self;
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl(&dword_2164DB000, v6, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = [(MERemoteExtensionContext *)self _composeSessionInterfaceForSession:v5];
  [v8 mailComposeSessionDidBegin:v5];
}

- (void)mailComposeSessionDidEnd:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v9 = 138412546;
    int v10 = self;
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl(&dword_2164DB000, v6, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = [(MERemoteExtensionContext *)self _composeSessionInterfaceForSession:v5];
  [v8 mailComposeSessionDidEnd:v5];

  [(NSMapTable *)self->_composeSessionToHandlerMap removeObjectForKey:v5];
}

- (id)viewControllerForSession:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MERemoteExtensionContext *)self _composeSessionInterfaceForSession:v4];
  uint64_t v6 = [v5 viewControllerForSession:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      int v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v6;
      _os_log_impl(&dword_2164DB000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ returned view controller: %@", (uint8_t *)&v11, 0x16u);
    }

    id v8 = v6;
  }
  else
  {
    int v9 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[MERemoteExtensionContext viewControllerForSession:]((uint64_t)self);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)session:(id)a3 annotateAddressesWithCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  int v9 = [(MERemoteExtensionContext *)self _composeSessionInterfaceForSession:v7];
  if (objc_opt_respondsToSelector())
  {
    int v10 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = NSStringFromSelector(a2);
      int v14 = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_2164DB000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v14, 0x16u);
    }
    [v9 session:v7 annotateAddressesWithCompletionHandler:v8];
  }
  else
  {
    int v12 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = NSStringFromSelector(a2);
      int v14 = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_2164DB000, v12, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Does not implement selector [%@]", (uint8_t *)&v14, 0x16u);
    }
    v8[2](v8, MEMORY[0x263EFFA78]);
  }
}

- (void)session:(id)a3 canSendMessageWithCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  int v9 = [(MERemoteExtensionContext *)self _composeSessionInterfaceForSession:v7];
  if (objc_opt_respondsToSelector())
  {
    int v10 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = NSStringFromSelector(a2);
      int v14 = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_2164DB000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v14, 0x16u);
    }
    [v9 session:v7 canSendMessageWithCompletionHandler:v8];
  }
  else
  {
    int v12 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = NSStringFromSelector(a2);
      int v14 = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_2164DB000, v12, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Does not implement selector [%@]", (uint8_t *)&v14, 0x16u);
    }
    v8[2](v8, 0);
  }
}

- (void)session:(id)a3 hasSendMessageCheckWithCompletion:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  uint64_t v6 = [(MERemoteExtensionContext *)self _composeSessionInterfaceForSession:a3];
  char v7 = objc_opt_respondsToSelector();
  v8[2](v8, v7 & 1);
}

- (id)additionalHeadersForSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(MERemoteExtensionContext *)self _composeSessionInterfaceForSession:v5];
  if (objc_opt_respondsToSelector())
  {
    char v7 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSStringFromSelector(a2);
      int v13 = 138412546;
      int v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = v8;
      _os_log_impl(&dword_2164DB000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v13, 0x16u);
    }
    int v9 = [v6 additionalHeadersForSession:v5];
  }
  else
  {
    int v10 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = NSStringFromSelector(a2);
      int v13 = 138412546;
      int v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = v11;
      _os_log_impl(&dword_2164DB000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Does not implement selector [%@]", (uint8_t *)&v13, 0x16u);
    }
    int v9 = (void *)MEMORY[0x263EFFA78];
  }

  return v9;
}

- (void)session:(id)a3 getAdditionalHeadersWithCompletion:(id)a4
{
  char v7 = (void (**)(id, void *))a4;
  uint64_t v6 = [(MERemoteExtensionContext *)self additionalHeadersForSession:a3];
  v7[2](v7, v6);
}

- (id)_messageSecurityHandlerInterface
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(MERemoteExtensionContext *)self _extensionInterface];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MERemoteExtensionContext *)self _extensionInterface];
    uint64_t v6 = [v5 handlerForMessageSecurity];
  }
  else
  {
    char v7 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(MERemoteExtensionContext *)self _extensionInterface];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2112;
      int v13 = @"handlerForMessageSecurity";
      _os_log_impl(&dword_2164DB000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ does not implement %@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)getEncodingStatusForMessage:(id)a3 composeContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = NSStringFromSelector(a2);
    int v15 = 138412546;
    __int16 v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    _os_log_impl(&dword_2164DB000, v12, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v14 = [(MERemoteExtensionContext *)self _messageSecurityHandlerInterface];
  [v14 getEncodingStatusForMessage:v9 composeContext:v10 completionHandler:v11];
}

- (void)encodeMessage:(id)a3 composeContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = NSStringFromSelector(a2);
    int v15 = 138412546;
    __int16 v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    _os_log_impl(&dword_2164DB000, v12, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v14 = [(MERemoteExtensionContext *)self _messageSecurityHandlerInterface];
  [v14 encodeMessage:v9 composeContext:v10 completionHandler:v11];
}

- (id)decodedMessageForMessageData:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    -[MERemoteExtensionContext decodedMessageForMessageData:]((uint64_t)self, v6, v8, v5);
  }

  return 0;
}

- (id)decodedMessageForMessageData:(id)a3 decodeContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MERemoteExtensionContext *)self _messageSecurityHandlerInterface];
  char v9 = objc_opt_respondsToSelector();

  id v10 = [(MERemoteExtensionContext *)self _messageSecurityHandlerInterface];
  if (v9) {
    [v10 performSelector:sel_decodedMessageForMessageData_decodeContext_ withObject:v6 withObject:v7];
  }
  else {
  id v11 = [v10 decodedMessageForMessageData:v6];
  }

  return v11;
}

- (void)decodedMessageForMessageData:(id)a3 decodeContext:(id)a4 withCompletionHandler:(id)a5
{
  char v9 = (void (**)(id, void *))a5;
  id v8 = [(MERemoteExtensionContext *)self decodedMessageForMessageData:a3 decodeContext:a4];
  v9[2](v9, v8);
}

- (id)extensionViewControllerForMessageSigners:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MERemoteExtensionContext *)self _messageSecurityHandlerInterface];
  id v6 = [v5 extensionViewControllerForMessageSigners:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      __int16 v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_2164DB000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ returned view controller: %@", (uint8_t *)&v11, 0x16u);
    }

    id v8 = v6;
  }
  else
  {
    char v9 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MERemoteExtensionContext extensionViewControllerForMessageSigners:]((uint64_t)self);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)extensionViewControllerForMessageContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MERemoteExtensionContext *)self _messageSecurityHandlerInterface];
  id v6 = [v5 extensionViewControllerForMessageContext:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      __int16 v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_2164DB000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ returned view controller: %@", (uint8_t *)&v11, 0x16u);
    }

    id v8 = v6;
  }
  else
  {
    char v9 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MERemoteExtensionContext extensionViewControllerForMessageSigners:]((uint64_t)self);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)primaryActionClickedForMessageContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MERemoteExtensionContext *)self _messageSecurityHandlerInterface];

  if (v8)
  {
    char v9 = [(MERemoteExtensionContext *)self _messageSecurityHandlerInterface];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __84__MERemoteExtensionContext_primaryActionClickedForMessageContext_completionHandler___block_invoke;
    v10[3] = &unk_2642835F0;
    v10[4] = self;
    id v11 = v7;
    [v9 primaryActionClickedForMessageContext:v6 completionHandler:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __84__MERemoteExtensionContext_primaryActionClickedForMessageContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = +[MERemoteExtensionContext log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __84__MERemoteExtensionContext_primaryActionClickedForMessageContext_completionHandler___block_invoke_cold_1(a1);
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v5 = +[MERemoteExtensionContext log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_2164DB000, v5, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ did not return a view controller for primary action clicked", (uint8_t *)&v8, 0xCu);
    }
  }
  id v4 = +[MERemoteExtensionContext log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2164DB000, v4, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ returned view controller for primary action clicked : %@", (uint8_t *)&v8, 0x16u);
  }
LABEL_11:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSMapTable)composeSessionToHandlerMap
{
  return self->_composeSessionToHandlerMap;
}

- (void)setComposeSessionToHandlerMap:(id)a3
{
}

- (void).cxx_destruct
{
}

void __42__MERemoteExtensionContext_remoteHostPoxy__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2164DB000, v1, v2, "Fetching extension's remote host proxy %@ failed with error %@", (void)v3, DWORD2(v3));
}

- (void)_createPrincipalObject
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2164DB000, a2, OS_LOG_TYPE_ERROR, "ExtensionContext<%p>: principalObject can not be nil.", (uint8_t *)&v2, 0xCu);
}

- (void)viewControllerForSession:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_2164DB000, v1, OS_LOG_TYPE_FAULT, "ExtensionContext:%@ Returned an invalid view controller: %@", (uint8_t *)&v2, 0x16u);
}

- (void)decodedMessageForMessageData:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_2164DB000, log, OS_LOG_TYPE_ERROR, "ExtensionContext:%@ should not invoke method [%@]", buf, 0x16u);
}

- (void)extensionViewControllerForMessageSigners:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2164DB000, v1, v2, "ExtensionContext:%@ returned an invalid view controller: %@", (void)v3, DWORD2(v3));
}

void __84__MERemoteExtensionContext_primaryActionClickedForMessageContext_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2164DB000, v1, v2, "ExtensionContext:%@ returned an invalid view controller for primary action clicked: %@", (void)v3, DWORD2(v3));
}

@end