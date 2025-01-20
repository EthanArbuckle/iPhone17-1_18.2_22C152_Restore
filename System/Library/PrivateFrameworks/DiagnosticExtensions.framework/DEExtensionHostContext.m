@interface DEExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)hasEntitlement;
- (id)progressHandler;
- (id)updatedParametersWithExtensionFileNameFromParameters:(id)a3;
- (void)annotatedAttachmentsForParameters:(id)a3 withHandler:(id)a4;
- (void)attachmentListWithHandler:(id)a3;
- (void)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4 withHandler:(id)a5;
- (void)collectionDidUpdateWithProgress:(id)a3;
- (void)hasEntitlement;
- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setupForParameters:(id)a3 withHandler:(id)a4;
- (void)teardownForParameters:(id)a3 withHandler:(id)a4;
@end

@implementation DEExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  return v2;
}

void __59__DEExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE562B8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_extensionAuxiliaryVendorProtocol___interface setClasses:v10 forSelector:sel_attachmentListWithHandler_ argumentIndex:0 ofReply:1];
  [(id)_extensionAuxiliaryVendorProtocol___interface setClasses:v10 forSelector:sel_attachmentsForParameters_withHandler_ argumentIndex:0 ofReply:1];
  [(id)_extensionAuxiliaryVendorProtocol___interface setClasses:v10 forSelector:sel_annotatedAttachmentsForParameters_withHandler_ argumentIndex:0 ofReply:1];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_130);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;
  return v2;
}

uint64_t __57__DEExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE544C8];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)hasEntitlement
{
  v2 = [(DEExtensionHostContext *)self _auxiliaryConnection];
  uint64_t v3 = [v2 valueForEntitlement:@"com.apple.DiagnosticExtensions.extension"];

  char v4 = [v3 BOOLValue];
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = +[DELogging fwHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[DEExtensionHostContext hasEntitlement](v5);
    }
  }
  return v4;
}

- (void)attachmentListWithHandler:(id)a3
{
  uint64_t v6 = (void (**)(id, void))a3;
  if ([(DEExtensionHostContext *)self hasEntitlement])
  {
    char v4 = [(DEExtensionHostContext *)self _auxiliaryConnection];
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_138];

    if (v5) {
      [v5 attachmentListWithHandler:v6];
    }
    else {
      v6[2](v6, 0);
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

void __52__DEExtensionHostContext_attachmentListWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[DELogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __52__DEExtensionHostContext_attachmentListWithHandler___block_invoke_cold_1(v2);
  }
}

- (void)annotatedAttachmentsForParameters:(id)a3 withHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(DEExtensionHostContext *)self hasEntitlement])
  {
    uint64_t v8 = [(DEExtensionHostContext *)self updatedParametersWithExtensionFileNameFromParameters:v6];
    uint64_t v9 = +[DELogging fwHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 objectForKeyedSubscript:@"DEExtensionAttachmentsParamBundleIDKey"];
      v11 = [v8 objectForKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"];
      *(_DWORD *)buf = 138413058;
      v20 = @"DEExtensionAttachmentsParamBundleIDKey";
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2112;
      v24 = @"DEExtensionAttachmentsParamDisplayNameKey";
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1A7E51000, v9, OS_LOG_TYPE_DEFAULT, "annotatedAttachmentsForParameters:withHandler: {%@:%@, %@:%@}", buf, 0x2Au);
    }
    v12 = [(DEExtensionHostContext *)self _auxiliaryConnection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__DEExtensionHostContext_annotatedAttachmentsForParameters_withHandler___block_invoke;
    v17[3] = &unk_1E5D300B0;
    id v13 = v7;
    id v18 = v13;
    v14 = [v12 remoteObjectProxyWithErrorHandler:v17];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__DEExtensionHostContext_annotatedAttachmentsForParameters_withHandler___block_invoke_139;
    v15[3] = &unk_1E5D300D8;
    id v16 = v13;
    [v14 annotatedAttachmentsForParameters:v8 withHandler:v15];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __72__DEExtensionHostContext_annotatedAttachmentsForParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = +[DELogging fwHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__DEExtensionHostContext_annotatedAttachmentsForParameters_withHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__DEExtensionHostContext_annotatedAttachmentsForParameters_withHandler___block_invoke_139(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4 withHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(DEExtensionHostContext *)self hasEntitlement])
  {
    v11 = [(DEExtensionHostContext *)self updatedParametersWithExtensionFileNameFromParameters:v8];
    v12 = +[DELogging fwHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v11 objectForKeyedSubscript:@"DEExtensionAttachmentsParamBundleIDKey"];
      v14 = [v11 objectForKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"];
      *(_DWORD *)buf = 138413058;
      v24 = @"DEExtensionAttachmentsParamBundleIDKey";
      __int16 v25 = 2112;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = @"DEExtensionAttachmentsParamDisplayNameKey";
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1A7E51000, v12, OS_LOG_TYPE_DEFAULT, "attachmentsForParameters:withProgressHandler: {%@:%@, %@:%@}", buf, 0x2Au);
    }
    v15 = [(DEExtensionHostContext *)self _auxiliaryConnection];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke;
    v21[3] = &unk_1E5D300B0;
    id v16 = v10;
    id v22 = v16;
    v17 = [v15 remoteObjectProxyWithErrorHandler:v21];

    [(DEExtensionHostContext *)self setProgressHandler:v9];
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke_141;
    v18[3] = &unk_1E5D30100;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v16;
    [v17 attachmentsForParameters:v11 withHandler:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = +[DELogging fwHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__DEExtensionHostContext_annotatedAttachmentsForParameters_withHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke_141(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setProgressHandler:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setupForParameters:(id)a3 withHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(DEExtensionHostContext *)self hasEntitlement])
  {
    id v7 = [(DEExtensionHostContext *)self _auxiliaryConnection];
    id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_144];

    if (v8) {
      [v8 setupWithParameters:v9 withHandler:v6];
    }
  }
}

void __57__DEExtensionHostContext_setupForParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[DELogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __57__DEExtensionHostContext_setupForParameters_withHandler___block_invoke_cold_1(v2);
  }
}

- (void)teardownForParameters:(id)a3 withHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(DEExtensionHostContext *)self hasEntitlement])
  {
    id v7 = [(DEExtensionHostContext *)self _auxiliaryConnection];
    id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_146];

    if (v8) {
      [v8 teardownWithParameters:v9 withHandler:v6];
    }
  }
}

void __60__DEExtensionHostContext_teardownForParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[DELogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__DEExtensionHostContext_teardownForParameters_withHandler___block_invoke_cold_1(v2);
  }
}

- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3
{
  id v6 = a3;
  if ([(DEExtensionHostContext *)self hasEntitlement])
  {
    char v4 = [(DEExtensionHostContext *)self _auxiliaryConnection];
    id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_148];

    if (v5)
    {
      [v5 isExtensionEnhancedLoggingStateOnWithHandler:v6];
    }
  }
}

void __71__DEExtensionHostContext_isExtensionEnhancedLoggingStateOnWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[DELogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__DEExtensionHostContext_isExtensionEnhancedLoggingStateOnWithHandler___block_invoke_cold_1(v2);
  }
}

- (void)collectionDidUpdateWithProgress:(id)a3
{
  id v6 = a3;
  char v4 = [(DEExtensionHostContext *)self progressHandler];

  if (v4)
  {
    id v5 = [(DEExtensionHostContext *)self progressHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)updatedParametersWithExtensionFileNameFromParameters:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = (void *)[v3 mutableCopy];
  id v5 = [v3 objectForKey:@"DEExtensionAttachmentsParamBundleIDKey"];

  if (v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v3;
    id v6 = [v3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamBundleIDKey"];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = (void *)SBSCopyExecutablePathForDisplayIdentifier();
        id v13 = [v12 lastPathComponent];
        v14 = [v4 objectForKey:@"DEExtensionAttachmentsParamDisplayNameKey"];

        if (v14)
        {
          if (v13) {
            goto LABEL_9;
          }
        }
        else
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v4 setObject:v16 forKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"];

          if (v13)
          {
LABEL_9:
            v15 = [v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"];
            [v15 addObject:v13];
            goto LABEL_12;
          }
        }
        v17 = [v11 componentsSeparatedByString:@"."];
        v15 = [v17 lastObject];

        id v18 = [v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"];
        [v18 addObject:v15];

LABEL_12:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v8)
      {
LABEL_14:

        id v3 = v21;
        break;
      }
    }
  }
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  return v19;
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)hasEntitlement
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  id v2 = @"com.apple.DiagnosticExtensions.extension";
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Missing entitlement: %@", (uint8_t *)&v1, 0xCu);
}

void __52__DEExtensionHostContext_attachmentListWithHandler___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "error calling attachmentList - %{public}@", v4, v5, v6, v7, v8);
}

void __72__DEExtensionHostContext_annotatedAttachmentsForParameters_withHandler___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "error calling attachmentsForParameters: - %{public}@", v4, v5, v6, v7, v8);
}

void __57__DEExtensionHostContext_setupForParameters_withHandler___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "error calling setupForParameters: - %{public}@", v4, v5, v6, v7, v8);
}

void __60__DEExtensionHostContext_teardownForParameters_withHandler___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "error calling teardownForParameters: - %{public}@", v4, v5, v6, v7, v8);
}

void __71__DEExtensionHostContext_isExtensionEnhancedLoggingStateOnWithHandler___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "error calling isExtensionEnhancedLoggingStateOn: - %{public}@", v4, v5, v6, v7, v8);
}

@end