@interface EXExtensionContextImplementation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultExtensionContextVendorProtocol;
+ (id)_derivedExtensionAuxiliaryHostProtocolWithContextClass:(Class)a3;
+ (id)_extensionContextForIdentifier:(id)a3;
+ (id)_extensionContextHostProtocolAllowedClassesForItems;
+ (id)_extensionContextHostProtocolWithAllowedErrorClasses:(id)a3;
+ (id)_extensionContextVendorProtocolWithAllowedErrorClasses:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken;
- (BOOL)_isDummyExtension;
- (BOOL)_isHost;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (EXExtensionContextHosting)_extensionHostProxy;
- (EXExtensionContextImplementation)initWithCoder:(id)a3;
- (EXExtensionContextImplementation)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 extensionContext:(id)a6;
- (EXExtensionContextVending)_extensionVendorProxy;
- (EXExtensionRequest)extensionRequest;
- (NSArray)inputItems;
- (NSExtensionContext)extensionContext;
- (NSString)description;
- (NSUUID)_UUID;
- (NSUUID)_pkUUID;
- (NSXPCConnection)_auxiliaryConnection;
- (NSXPCListener)_auxiliaryListener;
- (OS_os_transaction)_transaction;
- (id)_principalObject;
- (id)_processAssertion;
- (id)_requestCleanUpBlock;
- (void)___nsx_pingHost:(id)a3;
- (void)_completeRequestReturningItemsSecondHalf:(id)a3;
- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(id)a3;
- (void)_loadItemForPayload:(id)a3 completionHandler:(id)a4;
- (void)_loadPreviewImageForPayload:(id)a3 completionHandler:(id)a4;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_pkUUID;
- (void)_processAssertion;
- (void)_setAuxiliaryConnection:(id)a3;
- (void)_setAuxiliaryListener:(id)a3;
- (void)_setDummyExtension:(BOOL)a3;
- (void)_setExtensionHostAuditToken:(id *)a3;
- (void)_setExtensionHostProxy:(id)a3;
- (void)_setExtensionVendorProxy:(id)a3;
- (void)_setInputItems:(id)a3;
- (void)_setPrincipalObject:(id)a3;
- (void)_setProcessAssertion:(id)a3;
- (void)_setRequestCleanUpBlock:(id)a3;
- (void)_setTransaction:(id)a3;
- (void)_willPerformHostCallback:(id)a3;
- (void)cancelRequestWithError:(id)a3;
- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)setExtensionRequest:(id)a3;
- (void)set_UUID:(id)a3;
- (void)set_pkUUID:(id)a3;
@end

@implementation EXExtensionContextImplementation

- (void)set_pkUUID:(id)a3
{
  id v4 = a3;
  extensionRequest = self->_extensionRequest;
  if (extensionRequest)
  {
    id v7 = v4;
    [(EXExtensionRequest *)extensionRequest setPkUUID:v4];
  }
  else
  {
    v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[EXExtensionContextImplementation set_pkUUID:]();
    }

    __break(1u);
  }
}

- (NSUUID)_pkUUID
{
  extensionRequest = self->_extensionRequest;
  if (extensionRequest)
  {
    return [(EXExtensionRequest *)extensionRequest pkUUID];
  }
  else
  {
    id v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[EXExtensionContextImplementation _pkUUID]();
    }

    __break(1u);
  }
  return result;
}

- (void)_setProcessAssertion:(id)a3
{
  id v4 = a3;
  extensionRequest = self->_extensionRequest;
  if (extensionRequest)
  {
    id v7 = v4;
    [(EXExtensionRequest *)extensionRequest setAssertion:v4];
  }
  else
  {
    v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[EXExtensionContextImplementation _setProcessAssertion:]();
    }

    __break(1u);
  }
}

- (id)_processAssertion
{
  extensionRequest = self->_extensionRequest;
  if (extensionRequest)
  {
    return [(EXExtensionRequest *)extensionRequest assertion];
  }
  else
  {
    id v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[EXExtensionContextImplementation _processAssertion]();
    }

    __break(1u);
  }
  return result;
}

+ (id)_extensionContextHostProtocolAllowedClassesForItems
{
  v2 = +[_EXDefaults sharedInstance];
  v3 = [v2 extensionItemTypes];

  return v3;
}

+ (id)_extensionContextHostProtocolWithAllowedErrorClasses:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  v5 = [v3 interfaceWithProtocol:&unk_1EE2EF970];
  v6 = +[_EXDefaults sharedInstance];
  id v7 = [v6 extensionItemTypes];

  [v5 setClasses:v7 forSelector:sel__completeRequestReturningItems_forExtensionContextWithUUID_completion_ argumentIndex:0 ofReply:0];
  v8 = v4;
  if (!v4) {
    v8 = objc_opt_new();
  }
  v9 = [v8 setByAddingObject:objc_opt_class()];

  if (!v4) {
  [v5 setClasses:v9 forSelector:sel__cancelRequestWithError_forExtensionContextWithUUID_completion_ argumentIndex:0 ofReply:0];
  }
  v10 = +[_EXDefaults sharedInstance];
  char v11 = [v10 useItemProviderXPCConnection];

  if ((v11 & 1) == 0)
  {
    v12 = +[_EXDefaults sharedInstance];
    v13 = [v12 itemProviderTypes];

    v14 = +[_EXDefaults sharedInstance];
    v15 = [v14 plistAndValueTypes];
    v16 = [v15 setByAddingObject:objc_opt_class()];

    [v5 setClasses:v13 forSelector:sel__loadItemForPayload_contextIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
    [v5 setClasses:v16 forSelector:sel__loadItemForPayload_contextIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
    [v5 setClasses:v9 forSelector:sel__loadItemForPayload_contextIdentifier_completionHandler_ argumentIndex:1 ofReply:1];
    [v5 setClasses:v13 forSelector:sel__loadPreviewImageForPayload_contextIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
    [v5 setClasses:v16 forSelector:sel__loadPreviewImageForPayload_contextIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
    [v5 setClasses:v9 forSelector:sel__loadPreviewImageForPayload_contextIdentifier_completionHandler_ argumentIndex:1 ofReply:1];
  }

  return v5;
}

+ (id)_defaultExtensionContextVendorProtocol
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2E62D0];
  v3 = +[_EXDefaults sharedInstance];
  id v4 = [v3 extensionItemTypes];
  [v2 setClasses:v4 forSelector:sel__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_extensionContextVendorProtocolWithAllowedErrorClasses:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [a1 _defaultExtensionContextVendorProtocol];
    v6 = [v4 setByAddingObject:objc_opt_class()];
    [v5 setClasses:v6 forSelector:sel__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion_ argumentIndex:1 ofReply:1];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__EXExtensionContextImplementation__extensionContextVendorProtocolWithAllowedErrorClasses___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_extensionContextVendorProtocolWithAllowedErrorClasses__onceToken != -1) {
      dispatch_once(&_extensionContextVendorProtocolWithAllowedErrorClasses__onceToken, block);
    }
    id v5 = (id)_extensionContextVendorProtocolWithAllowedErrorClasses____xpcInterface;
  }

  return v5;
}

uint64_t __91__EXExtensionContextImplementation__extensionContextVendorProtocolWithAllowedErrorClasses___block_invoke(uint64_t a1)
{
  _extensionContextVendorProtocolWithAllowedErrorClasses____xpcInterface = [*(id *)(a1 + 32) _defaultExtensionContextVendorProtocol];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionContextForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[_NSExtensionContextVendor _sharedExtensionContextVendor];
  id v5 = [v4 _extensionContextForUUID:v3];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_derivedExtensionAuxiliaryHostProtocolWithContextClass:(Class)a3
{
  if (_derivedExtensionAuxiliaryHostProtocolWithContextClass__onceToken != -1) {
    dispatch_once(&_derivedExtensionAuxiliaryHostProtocolWithContextClass__onceToken, &__block_literal_global_1);
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  char v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke_77;
  v6[3] = &unk_1E573D220;
  v6[4] = &v7;
  v6[5] = a3;
  dispatch_sync((dispatch_queue_t)_derivedExtensionAuxiliaryHostProtocolWithContextClass__protocol_creation_queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke()
{
  _derivedExtensionAuxiliaryHostProtocolWithContextClass__protocol_creation_queue = (uint64_t)dispatch_queue_create("com.apple.extension.protocol-creation", 0);

  return MEMORY[0x1F41817F8]();
}

void __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke_77(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) _extensionAuxiliaryHostProtocol];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v5)
  {
    v6 = [v5 protocol];
    if (!v6)
    {
      uint64_t v7 = _EXDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke_77_cold_1();
      }
    }
    Name = protocol_getName(v6);
    size_t v9 = strlen(Name) + 24;
    v10 = (char *)malloc_type_malloc(v9, 0xC25FCA84uLL);
    strlcpy(v10, "__NSX__HOST__PROTOCOL__", v9);
    strlcat(v10, Name, v9);
    objc_getProtocol(v10);
    char v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_allocateProtocol(v10);
      char v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
      protocol_addProtocol(v11, v6);
      protocol_addProtocol(v11, (Protocol *)&unk_1EE2E45B0);
      objc_registerProtocol(v11);
    }
    free(v10);
    uint64_t v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (EXExtensionContextImplementation)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 extensionContext:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v61.receiver = self;
  v61.super_class = (Class)EXExtensionContextImplementation;
  v14 = [(EXExtensionContextImplementation *)&v61 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_extensionContext, v13);
    id v43 = v12;
    if (v12) {
      v16 = (NSUUID *)[v12 copy];
    }
    else {
      v16 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    }
    UUID = v15->__UUID;
    v15->__UUID = v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v44 = v10;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v74 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v58 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * i) copy];
          [v18 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v57 objects:v74 count:16];
      }
      while (v21);
    }
    id v42 = v13;
    id v41 = v19;

    objc_storeStrong((id *)&v15->_inputItems, v18);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obuint64_t j = v15->_inputItems;
    uint64_t v47 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v73 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v54;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v54 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = v25;
          v26 = *(void **)(*((void *)&v53 + 1) + 8 * v25);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          v27 = [v26 attachments];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v72 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v50;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v50 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v33 = [v32 _loadOperator];

                  if (!v33)
                  {
                    v34 = +[_EXDefaults sharedInstance];
                    int v35 = [v34 useItemProviderXPCConnection];

                    if (v35) {
                      v36 = [[_EXLoadOperator alloc] initWithItemProvider:v32];
                    }
                    else {
                      v36 = [[_EXItemProviderExtensionVendorLoadOperator alloc] initWithExtensionContextIdentifier:v15->__UUID];
                    }
                    v37 = v36;
                    objc_msgSend(v32, "set_loadOperator:", v36);
                  }
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v72 count:16];
            }
            while (v29);
          }

          uint64_t v25 = v48 + 1;
        }
        while (v48 + 1 != v47);
        uint64_t v47 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v73 count:16];
      }
      while (v47);
    }

    v38 = _EXLegacyLog();
    id v12 = v43;
    id v13 = v42;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = objc_opt_class();
      *(_DWORD *)buf = 138413314;
      uint64_t v63 = v40;
      __int16 v64 = 2112;
      id v65 = v41;
      __int16 v66 = 2114;
      id v67 = v11;
      __int16 v68 = 2114;
      id v69 = v43;
      __int16 v70 = 2114;
      id v71 = v42;
      _os_log_debug_impl(&dword_191F29000, v38, OS_LOG_TYPE_DEBUG, "%@ initialized with inputItems: %@ endpoint: %{public}@ UUID: %{public}@ extensionContext: %{public}@", buf, 0x34u);
    }

    [(EXExtensionContextImplementation *)v15 _initializeAuxillaryConnectionWithListenerEndpoint:v11];
    id v10 = v44;
  }

  return v15;
}

- (EXExtensionContextImplementation)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  UUID = self->__UUID;
  self->__UUID = v5;

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputItems"];

  inputItems = self->_inputItems;
  self->_inputItems = v7;

  size_t v9 = _EXLegacyLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v12 = self->__UUID;
    id v11 = self->_inputItems;
    int v13 = 138412802;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_191F29000, v9, OS_LOG_TYPE_DEBUG, "{public}%@ initialized with inputItems: %@ UUID: %{public}@ ", (uint8_t *)&v13, 0x20u);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->__UUID;
  id v6 = a3;
  [v6 encodeObject:UUID forKey:@"uuid"];
  if (self->_inputItems) {
    inputItems = self->_inputItems;
  }
  else {
    inputItems = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [v6 encodeObject:inputItems forKey:@"inputItems"];
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EXExtensionContextImplementation *)self extensionContext];
  id v6 = [(id)objc_opt_class() _extensionAuxiliaryVendorProtocol];
  uint64_t v7 = [(id)objc_opt_class() _extensionAuxiliaryHostProtocol];
  v8 = _EXLegacyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v33 = 138413058;
    id v34 = v4;
    __int16 v35 = 2112;
    v36 = v5;
    __int16 v37 = 2112;
    v38 = v6;
    __int16 v39 = 2112;
    uint64_t v40 = v7;
    _os_log_debug_impl(&dword_191F29000, v8, OS_LOG_TYPE_DEBUG, "_initializeAuxillaryConnectionWithListenerEndpoint: %@ - extensionContext: %@ auxVendorProtocol: %@ auxHostProtocol:%@", (uint8_t *)&v33, 0x2Au);
  }

  if (v4)
  {
    p_auxiliaryConnection = (id *)&self->__auxiliaryConnection;
    if (self->__auxiliaryConnection)
    {
      id v10 = _EXLegacyLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.6();
      }
    }
    else
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
      id v12 = *p_auxiliaryConnection;
      id *p_auxiliaryConnection = (id)v11;

      if (!v6 || !v7)
      {
        int v13 = _EXDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.5();
        }
      }
      [*p_auxiliaryConnection setExportedInterface:v6];
      [*p_auxiliaryConnection setExportedObject:v5];
      v14 = [v5 _derivedExtensionAuxiliaryHostProtocol];
      [*p_auxiliaryConnection setRemoteObjectInterface:v14];

      [*p_auxiliaryConnection resume];
      id v10 = _EXLegacyLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.4((uint64_t)p_auxiliaryConnection, v10, v15, v16, v17, v18, v19, v20);
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  if (v7 && v6)
  {
    if (self->__auxiliaryListener)
    {
      id v10 = _EXLegacyLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:]();
      }
    }
    else
    {
      uint64_t v21 = [(EXExtensionContextImplementation *)self extensionContext];
      uint64_t v22 = [v7 protocol];
      char v23 = [v21 conformsToProtocol:v22];

      if ((v23 & 1) == 0)
      {
        v24 = _EXDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          [(EXExtensionContextImplementation *)(uint64_t)v5 _initializeAuxillaryConnectionWithListenerEndpoint:v24];
        }
      }
      uint64_t v25 = [MEMORY[0x1E4F29290] anonymousListener];
      auxiliaryListener = self->__auxiliaryListener;
      self->__auxiliaryListener = v25;

      [(NSXPCListener *)self->__auxiliaryListener setDelegate:self];
      [(NSXPCListener *)self->__auxiliaryListener resume];
      id v10 = _EXLegacyLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:]((uint64_t)&self->__auxiliaryListener, v10, v27, v28, v29, v30, v31, v32);
      }
    }
    goto LABEL_25;
  }
LABEL_26:
}

- (void)invalidate
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "invalidated extension context: %{public}@", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  self->__principalObject = 0;
  extensionRequest = self->_extensionRequest;
  self->_extensionRequest = 0;

  [(EXExtensionContextImplementation *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)EXExtensionContextImplementation;
  [(EXExtensionContextImplementation *)&v4 dealloc];
}

- (BOOL)_isHost
{
  uint64_t v2 = [(EXExtensionContextImplementation *)self _extensionHostProxy];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_completeRequestReturningItemsSecondHalf:(id)a3
{
}

- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  uint64_t v7 = _EXLegacyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    UUID = self->__UUID;
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)UUID;
    _os_log_impl(&dword_191F29000, v7, OS_LOG_TYPE_DEFAULT, "preparing to call _completeRequestReturningItems:forExtensionContextWithUUID: UUID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  size_t v9 = _os_activity_create(&dword_191F29000, "completing request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  id v10 = _os_activity_create(&dword_191F29000, "completing request - consume items", v9, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_t v34 = _os_activity_create(&dword_191F29000, "completing request - completion part 1", v9, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_t v33 = _os_activity_create(&dword_191F29000, "completing request - completion part 2", v9, OS_ACTIVITY_FLAG_DEFAULT);
  v36 = v10;
  os_activity_scope_enter(v10, &buf);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v6;
  uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v56;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v56 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v11;
        id v12 = *(void **)(*((void *)&v55 + 1) + 8 * v11);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        int v13 = [v12 attachments];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v52 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v19 = +[_EXDefaults sharedInstance];
                int v20 = [v19 useItemProviderXPCConnection];

                if (v20) {
                  uint64_t v21 = &v50;
                }
                else {
                  uint64_t v21 = &v49;
                }
                uint64_t v22 = off_1E573C9A8;
                if (!v20) {
                  uint64_t v22 = off_1E573C9E0;
                }
                id v23 = objc_alloc(*v22);
                [(EXExtensionContextImplementation *)self _extensionHostAuditToken];
                v24 = (void *)[v23 initWithItemProvider:v18 destinationProcessAuditToken:v21];
                objc_msgSend(v18, "set_loadOperator:", v24);
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v59 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v40 + 1;
      }
      while (v40 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v39);
  }

  os_activity_scope_leave(&buf);
  uint64_t v25 = _EXLegacyLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v48 = 0;
    _os_log_impl(&dword_191F29000, v25, OS_LOG_TYPE_DEFAULT, "call _completeRequestReturningItems:forExtensionContextWithUUID:", v48, 2u);
  }

  v26 = [(EXExtensionContextImplementation *)self _extensionHostProxy];
  uint64_t v27 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke;
  block[3] = &unk_1E573D248;
  os_activity_t v42 = v34;
  id v43 = v26;
  id v44 = obj;
  v45 = self;
  os_activity_t v46 = v33;
  id v47 = v35;
  id v28 = v35;
  uint64_t v29 = v33;
  id v30 = obj;
  id v31 = v26;
  uint64_t v32 = v34;
  dispatch_async(v27, block);
}

void __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(v4 + 80);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke_2;
  v6[3] = &unk_1E573CF18;
  v6[4] = v4;
  id v7 = v2;
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  [v3 _completeRequestReturningItems:v7 forExtensionContextWithUUID:v5 completion:v6];

  os_activity_scope_leave(&state);
}

void __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _EXLegacyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEFAULT, "calling out to _completeRequestReturningItemsSecondHalf", buf, 2u);
  }

  BOOL v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke_105;
  v4[3] = &unk_1E573CF18;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _completeRequestReturningItemsSecondHalf:v4];
}

void __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke_105(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  BOOL v3 = (void *)[*(id *)(a1 + 56) copy];
  id v4 = v1;
  id v5 = v2;
  id v6 = v3;
  id v7 = _EXLegacyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_191F29000, v7, OS_LOG_TYPE_DEFAULT, "in _NSExtensionCompleteRequestReturningItemsContinuation", (uint8_t *)v12, 2u);
  }

  id v8 = _EXExtensionGetGlobalStateQueue(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke;
  v12[3] = &unk_1E573D0F8;
  id v14 = v4;
  id v15 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  id v11 = v4;
  dispatch_async(v8, v12);
}

- (void)cancelRequestWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _EXLegacyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    UUID = self->__UUID;
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)UUID;
    _os_log_impl(&dword_191F29000, v5, OS_LOG_TYPE_DEFAULT, "preparing to call _cancelRequestWithError:forExtensionContextWithUUID: UUID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v7 = _os_activity_create(&dword_191F29000, "cancelling request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_t v8 = _os_activity_create(&dword_191F29000, "cancelling request - teardown", v7, OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v7, &buf);
  id v9 = [(EXExtensionContextImplementation *)self _extensionHostProxy];
  id v10 = self->__UUID;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__EXExtensionContextImplementation_cancelRequestWithError___block_invoke;
  v12[3] = &unk_1E573CDD8;
  id v11 = v8;
  id v13 = v11;
  id v14 = self;
  [v9 _cancelRequestWithError:v4 forExtensionContextWithUUID:v10 completion:v12];

  os_activity_scope_leave(&buf);
}

void __59__EXExtensionContextImplementation_cancelRequestWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = _EXExtensionGetGlobalStateQueue(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__EXExtensionContextImplementation_cancelRequestWithError___block_invoke_2;
  v5[3] = &unk_1E573CDD8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(v2, v5);
}

void __59__EXExtensionContextImplementation_cancelRequestWithError___block_invoke_2(uint64_t a1)
{
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v3);
  uint64_t v2 = [MEMORY[0x1E4F292B0] _sharedExtensionContextVendor];
  [v2 _tearDownContextWithUUID:*(void *)(*(void *)(a1 + 40) + 80)];

  os_activity_scope_leave(&v3);
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_t v8 = _os_activity_create(&dword_191F29000, "opening URL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_t v9 = _os_activity_create(&dword_191F29000, "opening URL completion", v8, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v10 = [(EXExtensionContextImplementation *)self _extensionHostProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__EXExtensionContextImplementation_openURL_completionHandler___block_invoke;
  v13[3] = &unk_1E573D298;
  id v11 = v7;
  id v15 = v11;
  id v12 = v9;
  id v14 = v12;
  [v10 _openURL:v6 completion:v13];

  os_activity_scope_leave(&state);
}

void __62__EXExtensionContextImplementation_openURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = _EXExtensionGetGlobalStateQueue(0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__EXExtensionContextImplementation_openURL_completionHandler___block_invoke_2;
    block[3] = &unk_1E573D270;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    char v9 = a2;
    dispatch_async(v4, block);
  }
  else
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
    os_activity_scope_leave(&state);
  }
}

void __62__EXExtensionContextImplementation_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  os_activity_scope_leave(&v2);
}

- (void)_loadItemForPayload:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_EXDefaults sharedInstance];
  int v9 = [v8 useItemProviderXPCConnection];

  if (v9)
  {
    id v15 = _EXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[EXExtensionContextImplementation _loadItemForPayload:completionHandler:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    __break(1u);
  }
  else
  {
    id v10 = [(EXExtensionContextImplementation *)self _extensionHostProxy];
    id v11 = dispatch_get_global_queue(25, 0);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__EXExtensionContextImplementation__loadItemForPayload_completionHandler___block_invoke;
    v23[3] = &unk_1E573CF18;
    id v24 = v10;
    id v25 = v6;
    v26 = self;
    id v27 = v7;
    id v12 = v7;
    id v13 = v6;
    id v14 = v10;
    dispatch_async(v11, v23);
  }
}

void __74__EXExtensionContextImplementation__loadItemForPayload_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(v3 + 80);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__EXExtensionContextImplementation__loadItemForPayload_completionHandler___block_invoke_2;
  v5[3] = &unk_1E573D2C0;
  void v5[4] = v3;
  id v6 = *(id *)(a1 + 56);
  [v1 _loadItemForPayload:v2 contextIdentifier:v4 completionHandler:v5];
}

void __74__EXExtensionContextImplementation__loadItemForPayload_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 extensionContext];
  _NSExtensionContextCompleteItemLoading(v8, v7, v6, *(void **)(a1 + 40));
}

- (void)_loadPreviewImageForPayload:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_EXDefaults sharedInstance];
  int v9 = [v8 useItemProviderXPCConnection];

  if (v9)
  {
    id v13 = _EXDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[EXExtensionContextImplementation _loadPreviewImageForPayload:completionHandler:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    __break(1u);
  }
  else
  {
    id v10 = [(EXExtensionContextImplementation *)self _extensionHostProxy];
    UUID = self->__UUID;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__EXExtensionContextImplementation__loadPreviewImageForPayload_completionHandler___block_invoke;
    v21[3] = &unk_1E573D2C0;
    v21[4] = self;
    id v22 = v7;
    id v12 = v7;
    [v10 _loadPreviewImageForPayload:v6 contextIdentifier:UUID completionHandler:v21];
  }
}

void __82__EXExtensionContextImplementation__loadPreviewImageForPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 extensionContext];
  _NSExtensionContextCompleteItemLoading(v8, v7, v6, *(void **)(a1 + 40));
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EXExtensionContextImplementation *)self extensionContext];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__EXExtensionContextImplementation__openURL_completion___block_invoke;
    block[3] = &unk_1E573CEF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __56__EXExtensionContextImplementation__openURL_completion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) extensionContext];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 48));
  [v4 performSelector:sel___UI_upcall_openURL_completion_ withObject:v2 withObject:v3];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)EXExtensionContextImplementation;
  id v4 = [(EXExtensionContextImplementation *)&v10 description];
  UUID = self->__UUID;
  if ([(EXExtensionContextImplementation *)self _isHost]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  if ([(EXExtensionContextImplementation *)self _isDummyExtension]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  id v8 = [v3 stringWithFormat:@"%@ - UUID: %@ - _isHost: %@\n_isDummyExtension:%@\ninputItems:\n%@", v4, UUID, v6, v7, self->_inputItems];

  return (NSString *)v8;
}

- (void)_willPerformHostCallback:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  if (self->__auxiliaryConnection && ![(EXExtensionContextImplementation *)self _isHost])
  {
    id v5 = [(NSXPCConnection *)self->__auxiliaryConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_124];
    if (objc_opt_respondsToSelector())
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke_126;
      v6[3] = &unk_1E573D308;
      id v7 = v4;
      objc_msgSend(v5, "___nsx_pingHost:", v6);
    }
    else
    {
      v4[2](v4);
    }
  }
  else
  {
    v4[2](v4);
  }
}

void __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _EXLegacyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke_cold_1(v2, v3);
  }
}

uint64_t __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)___nsx_pingHost:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EXExtensionContextImplementation *)self extensionContext];
  char v9 = [v8 _derivedExtensionAuxiliaryHostProtocol];
  objc_super v10 = [(id)objc_opt_class() _extensionAuxiliaryVendorProtocol];
  [v7 setRemoteObjectInterface:v10];

  [v7 setExportedInterface:v9];
  [v7 setExportedObject:v8];
  if (self->__auxiliaryConnection)
  {
    id v11 = _EXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[EXExtensionContextImplementation listener:shouldAcceptNewConnection:]();
    }
  }
  objc_storeStrong((id *)&self->__auxiliaryConnection, a4);
  [v7 resume];
  id v12 = _EXLegacyLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412802;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_debug_impl(&dword_191F29000, v12, OS_LOG_TYPE_DEBUG, "New connection: %@ for listener: %{public}@ interface: %{public}@", (uint8_t *)&v17, 0x20u);
  }

  id v13 = [(EXExtensionContextImplementation *)self extensionContext];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(EXExtensionContextImplementation *)self extensionContext];
    [v15 didConnectToVendor:v7];
  }
  return 1;
}

- (id)_requestCleanUpBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)_setRequestCleanUpBlock:(id)a3
{
}

- (NSExtensionContext)extensionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);

  return (NSExtensionContext *)WeakRetained;
}

- (EXExtensionRequest)extensionRequest
{
  return (EXExtensionRequest *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtensionRequest:(id)a3
{
}

- (EXExtensionContextHosting)_extensionHostProxy
{
  return (EXExtensionContextHosting *)objc_getProperty(self, a2, 40, 1);
}

- (void)_setExtensionHostProxy:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken
{
  objc_copyStruct(retstr, &self->104, 32, 1, 0);
  return result;
}

- (void)_setExtensionHostAuditToken:(id *)a3
{
}

- (OS_os_transaction)_transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 48, 1);
}

- (void)_setTransaction:(id)a3
{
}

- (id)_principalObject
{
  return self->__principalObject;
}

- (void)_setPrincipalObject:(id)a3
{
  self->__principalObject = a3;
}

- (EXExtensionContextVending)_extensionVendorProxy
{
  return (EXExtensionContextVending *)objc_getProperty(self, a2, 64, 1);
}

- (void)_setExtensionVendorProxy:(id)a3
{
}

- (NSXPCListener)_auxiliaryListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 72, 1);
}

- (void)_setAuxiliaryListener:(id)a3
{
}

- (NSUUID)_UUID
{
  return self->__UUID;
}

- (void)set_UUID:(id)a3
{
}

- (NSArray)inputItems
{
  return self->_inputItems;
}

- (void)_setInputItems:(id)a3
{
}

- (NSXPCConnection)_auxiliaryConnection
{
  return self->__auxiliaryConnection;
}

- (void)_setAuxiliaryConnection:(id)a3
{
}

- (BOOL)_isDummyExtension
{
  return self->__dummyExtension;
}

- (void)_setDummyExtension:(BOOL)a3
{
  self->__dummyExtension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__auxiliaryConnection, 0);
  objc_storeStrong((id *)&self->_inputItems, 0);
  objc_storeStrong((id *)&self->__UUID, 0);
  objc_storeStrong((id *)&self->__auxiliaryListener, 0);
  objc_storeStrong((id *)&self->__extensionVendorProxy, 0);
  objc_storeStrong((id *)&self->__transaction, 0);
  objc_storeStrong((id *)&self->__extensionHostProxy, 0);
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_destroyWeak((id *)&self->_extensionContext);

  objc_storeStrong(&self->__requestCleanUpBlock, 0);
}

- (void)set_pkUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (void)_pkUUID
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (void)_setProcessAssertion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (void)_processAssertion
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

void __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke_77_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: unexpected nil subclass aux host protocol!", v2, v3, v4, v5, v6);
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  id v7 = [a2 protocol];
  uint64_t v8 = NSStringFromProtocol(v7);
  int v9 = 136316162;
  objc_super v10 = "[self.extensionContext conformsToProtocol:auxHostProtocol.protocol]";
  __int16 v11 = 2080;
  id v12 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSupp"
        "ort/EXExtensionContextImplementation.m";
  __int16 v13 = 1024;
  int v14 = 283;
  __int16 v15 = 2112;
  uint64_t v16 = v5;
  __int16 v17 = 2112;
  id v18 = v8;
  _os_log_fault_impl(&dword_191F29000, a3, OS_LOG_TYPE_FAULT, "%s - %s:%d: Class %@ does not conform to aux host protocol: %@", (uint8_t *)&v9, 0x30u);
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_191F29000, v0, OS_LOG_TYPE_ERROR, "%{public}@ : AUX Listener has already been created.", v1, 0xCu);
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: must define both host and vendor aux protocols!", v2, v3, v4, v5, v6);
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:.cold.6()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_191F29000, v1, OS_LOG_TYPE_ERROR, "%{public}@ : AUX connectino has already been created for endpoint '%{public}@'.", v2, 0x16u);
}

- (void)_loadItemForPayload:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_loadPreviewImageForPayload:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_willPerformHostCallback:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)os_activity_scope_state_s buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
}

void __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_191F29000, a2, OS_LOG_TYPE_ERROR, "failed to ping host: %{public}@", v4, 0xCu);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: listener is one-shot!", v2, v3, v4, v5, v6);
}

@end