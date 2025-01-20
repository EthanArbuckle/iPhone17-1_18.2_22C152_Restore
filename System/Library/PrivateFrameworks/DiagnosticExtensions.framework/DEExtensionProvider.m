@interface DEExtensionProvider
- (BOOL)allowUserAttachmentSelection;
- (BOOL)canGenerateNewAttachment;
- (BOOL)isEnhancedLoggingStateOn;
- (DEExtensionProvider)init;
- (NSString)loggingConsent;
- (id)_getHostname;
- (id)annotatedAttachmentsForParameters:(id)a3;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)filesInDir:(id)a3 matchingPattern:(id)a4 excludingPattern:(id)a5;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3;
- (void)setAllowUserAttachmentSelection:(BOOL)a3;
- (void)setCanGenerateNewAttachment:(BOOL)a3;
- (void)setIsEnhancedLoggingStateOn:(BOOL)a3;
- (void)setLoggingConsent:(id)a3;
- (void)setupWithParameters:(id)a3;
- (void)teardownWithParameters:(id)a3;
@end

@implementation DEExtensionProvider

- (DEExtensionProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)DEExtensionProvider;
  v2 = [(DEExtensionProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    loggingConsent = v2->_loggingConsent;
    v2->_loggingConsent = 0;

    v3->_isEnhancedLoggingStateOn = 0;
  }
  return v3;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[DELogging fwHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1A7E51000, v5, OS_LOG_TYPE_INFO, "Started extension with context: %@", buf, 0xCu);
  }

  objc_super v6 = [v4 _auxiliaryConnection];
  v7 = [v6 valueForEntitlement:@"com.apple.DiagnosticExtensions.extensionHost"];

  if (!v7 || ([v7 BOOLValue] & 1) == 0)
  {
    v8 = +[DELogging fwHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DEExtensionProvider beginRequestWithExtensionContext:]((uint64_t)self, v8);
    }

    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v10 = [NSString stringWithFormat:@"Diagnostic Extension (%@) doesn't have com.apple.DiagnosticExtensions entitlement", self];
    v14 = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v12 = [v9 errorWithDomain:@"DEExtensionErrorDomain" code:-1 userInfo:v11];
    [v4 cancelRequestWithError:v12];
  }
}

- (id)attachmentList
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)attachmentsForParameters:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)annotatedAttachmentsForParameters:(id)a3
{
  return 0;
}

- (void)setupWithParameters:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = +[DELogging fwHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[DEExtensionProvider setupWithParameters:]";
    _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(DEExtensionProvider *)self setIsEnhancedLoggingStateOn:1];
}

- (void)teardownWithParameters:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = +[DELogging fwHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[DEExtensionProvider teardownWithParameters:]";
    _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(DEExtensionProvider *)self setIsEnhancedLoggingStateOn:0];
}

- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, BOOL))a3;
  int v5 = +[DELogging fwHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[DEExtensionProvider isExtensionEnhancedLoggingStateOnWithHandler:]";
    _os_log_impl(&dword_1A7E51000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, [(DEExtensionProvider *)self isEnhancedLoggingStateOn]);
}

- (id)filesInDir:(id)a3 matchingPattern:(id)a4 excludingPattern:(id)a5
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = v8;
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"*" options:1 error:0];
  }
  id v53 = 0;
  int v12 = [v7 checkResourceIsReachableAndReturnError:&v53];
  id v13 = v53;
  v14 = v13;
  if (v12)
  {
    id v35 = v13;
    id v36 = v10;
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v16 = *MEMORY[0x1E4F1C6E8];
    uint64_t v17 = *MEMORY[0x1E4F1C628];
    v59[0] = *MEMORY[0x1E4F1C6E8];
    v59[1] = v17;
    uint64_t v43 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    id v37 = v7;
    v19 = [v15 enumeratorAtURL:v7 includingPropertiesForKeys:v18 options:5 errorHandler:0];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v20 = v19;
    uint64_t v44 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v44)
    {
      uint64_t v41 = *MEMORY[0x1E4F1C5F8];
      uint64_t v42 = *(void *)v50;
      uint64_t v38 = *MEMORY[0x1E4F1C530];
      uint64_t v39 = v16;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v50 != v42) {
            objc_enumerationMutation(v20);
          }
          v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v48 = 0;
          [v22 getResourceValue:&v48 forKey:v16 error:0];
          id v23 = v48;
          id v47 = 0;
          [v22 getResourceValue:&v47 forKey:v43 error:0];
          id v24 = v47;
          id v46 = 0;
          [v22 getResourceValue:&v46 forKey:v41 error:0];
          id v25 = v46;
          if (([v24 BOOLValue] & 1) == 0)
          {
            if (!v11
              || (objc_msgSend(v11, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length")),
                  v26 = objc_claimAutoreleasedReturnValue(),
                  v26,
                  v26))
            {
              if (!v9
                || (objc_msgSend(v9, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length")),
                    v27 = objc_claimAutoreleasedReturnValue(),
                    v27,
                    !v27))
              {
                id v45 = 0;
                [v22 getResourceValue:&v45 forKey:v38 error:0];
                id v28 = v45;
                [v22 lastPathComponent];
                v29 = v20;
                v30 = v11;
                v32 = id v31 = v9;
                v33 = +[DEAttachmentItem attachmentWithPath:v22 withDisplayName:v32 modificationDate:v28 andFilesize:v25];

                [v40 addObject:v33];
                id v9 = v31;
                v11 = v30;
                v20 = v29;
                uint64_t v16 = v39;
              }
            }
          }
        }
        uint64_t v44 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v44);
    }

    id v10 = v36;
    id v7 = v37;
    v14 = v35;
  }
  else
  {
    v20 = +[DELogging fwHandle];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v55 = v7;
      __int16 v56 = 2112;
      v57 = v14;
      _os_log_impl(&dword_1A7E51000, v20, OS_LOG_TYPE_DEFAULT, "Unable to reach %@. Reason: %@", buf, 0x16u);
    }
  }

  return v40;
}

- (id)_getHostname
{
  if (_getHostname_onceToken != -1) {
    dispatch_once(&_getHostname_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_getHostname_hostname;
  return v2;
}

void __35__DEExtensionProvider__getHostname__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  memset(v2, 0, sizeof(v2));
  if (!gethostname((char *)v2, 0x100uLL))
  {
    uint64_t v0 = [NSString stringWithUTF8String:v2];
    v1 = (void *)_getHostname_hostname;
    _getHostname_hostname = v0;
  }
  if (!_getHostname_hostname)
  {
    _getHostname_hostname = @"localhost";
  }
}

- (NSString)loggingConsent
{
  return self->_loggingConsent;
}

- (void)setLoggingConsent:(id)a3
{
}

- (BOOL)canGenerateNewAttachment
{
  return self->_canGenerateNewAttachment;
}

- (void)setCanGenerateNewAttachment:(BOOL)a3
{
  self->_canGenerateNewAttachment = a3;
}

- (BOOL)allowUserAttachmentSelection
{
  return self->_allowUserAttachmentSelection;
}

- (void)setAllowUserAttachmentSelection:(BOOL)a3
{
  self->_allowUserAttachmentSelection = a3;
}

- (BOOL)isEnhancedLoggingStateOn
{
  return self->_isEnhancedLoggingStateOn;
}

- (void)setIsEnhancedLoggingStateOn:(BOOL)a3
{
  self->_isEnhancedLoggingStateOn = a3;
}

- (void).cxx_destruct
{
}

- (void)beginRequestWithExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7E51000, a2, OS_LOG_TYPE_ERROR, "Provider has no entitlement: %@", (uint8_t *)&v2, 0xCu);
}

@end