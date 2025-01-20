@interface _MDIndexExtension
- (BOOL)_verifyIntegrityWithHostContext:(id)a3;
- (BOOL)dontRunDuringMigration;
- (BOOL)entitlementVerified;
- (BOOL)isEnabled;
- (BOOL)isInternal;
- (NSDictionary)infoDictionary;
- (NSExtension)extension;
- (NSNumber)isAppleCodeSigned;
- (NSSet)identifiers;
- (NSSet)supportedFileTypes;
- (NSString)containerID;
- (NSString)containerPath;
- (NSString)extensionID;
- (NSString)extensionLabel;
- (OS_dispatch_queue)queue;
- (_MDIndexExtension)initWithExtension:(id)a3 queue:(id)a4 containerPath:(id)a5 containerID:(id)a6;
- (_MDIndexExtension)initWithExtension:(id)a3 queue:(id)a4 containerPath:(id)a5 containerID:(id)a6 supportedFileTypes:(id)a7 extensionLabel:(id)a8 isAppleCodeSigned:(id)a9;
- (id)description;
- (void)_performJob:(id)a3 completionBlock:(id)a4;
- (void)performJob:(id)a3 completionBlock:(id)a4;
- (void)setContainerID:(id)a3;
- (void)setContainerPath:(id)a3;
- (void)setEntitlementVerified:(BOOL)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionID:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSupportedFileTypes:(id)a3;
@end

@implementation _MDIndexExtension

- (_MDIndexExtension)initWithExtension:(id)a3 queue:(id)a4 containerPath:(id)a5 containerID:(id)a6
{
  v10 = NSNumber;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 numberWithBool:0];
  v16 = [(_MDIndexExtension *)self initWithExtension:v14 queue:v13 containerPath:v12 containerID:v11 supportedFileTypes:0 extensionLabel:0 isAppleCodeSigned:v15];

  return v16;
}

- (_MDIndexExtension)initWithExtension:(id)a3 queue:(id)a4 containerPath:(id)a5 containerID:(id)a6 supportedFileTypes:(id)a7 extensionLabel:(id)a8 isAppleCodeSigned:(id)a9
{
  id v16 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v21 = a8;
  id v17 = a9;
  v31.receiver = self;
  v31.super_class = (Class)_MDIndexExtension;
  v18 = [(_MDIndexExtension *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_extension, a3);
    objc_storeStrong((id *)&v19->_queue, a4);
    objc_storeStrong((id *)&v19->_containerPath, a5);
    objc_storeStrong((id *)&v19->_containerID, a6);
    objc_storeStrong((id *)&v19->_supportedFileTypes, a7);
    objc_storeStrong((id *)&v19->_extensionLabel, a8);
    objc_storeStrong((id *)&v19->_isAppleCodeSigned, a9);
    id location = 0;
    objc_initWeak(&location, v19);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke;
    v28[3] = &unk_1E5549120;
    objc_copyWeak(&v29, &location);
    [(NSExtension *)v19->_extension setRequestInterruptionBlock:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_1;
    v26[3] = &unk_1E5549148;
    objc_copyWeak(&v27, &location);
    [(NSExtension *)v19->_extension setRequestCompletionBlock:v26];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  id v4 = [NSString alloc];
  v5 = [(_MDIndexExtension *)self extensionID];
  v6 = (void *)[v4 initWithFormat:@"id=%@", v5];
  [v3 addObject:v6];

  v7 = [(_MDIndexExtension *)self identifiers];
  v8 = [v7 allObjects];

  if ([v8 count])
  {
    id v9 = [NSString alloc];
    v10 = [v8 componentsJoinedByString:@", "];
    id v11 = (void *)[v9 initWithFormat:@"identifiers=(%@)", v10];
    [v3 addObject:v11];
  }
  id v12 = [NSString alloc];
  id v13 = [(_MDIndexExtension *)self containerID];
  id v14 = (void *)[v12 initWithFormat:@"containerId=%@", v13];
  [v3 addObject:v14];

  id v15 = [NSString alloc];
  id v16 = [(_MDIndexExtension *)self containerPath];
  id v17 = (void *)[v15 initWithFormat:@"containerPath=%@", v16];
  [v3 addObject:v17];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  if ([(_MDIndexExtension *)self isInternal]) {
    [v18 addObject:@"internal"];
  }
  if (![(_MDIndexExtension *)self dontRunDuringMigration]) {
    [v18 addObject:@"run-on-migration"];
  }
  if ([v18 count])
  {
    id v19 = [NSString alloc];
    v20 = [v18 componentsJoinedByString:@"|"];
    id v21 = (void *)[v19 initWithFormat:@"flags=%@", v20];
    [v3 addObject:v21];
  }
  id v22 = [(_MDIndexExtension *)self supportedFileTypes];
  id v23 = [v22 allObjects];

  if ([v23 count])
  {
    id v24 = [NSString alloc];
    id v25 = [v23 componentsJoinedByString:@", "];
    v26 = (void *)[v24 initWithFormat:@"supportedFileTypes=(%@)", v25];
    [v3 addObject:v26];
  }
  id v27 = [NSString alloc];
  v28 = [(_MDIndexExtension *)self extensionLabel];
  id v29 = (void *)[v27 initWithFormat:@"extensionLabel=%@", v28];
  [v3 addObject:v29];

  id v30 = [NSString alloc];
  uint64_t v31 = objc_opt_class();
  v32 = [(_MDIndexExtension *)self extension];
  v33 = [v3 componentsJoinedByString:@", "];
  v34 = (void *)[v30 initWithFormat:@"<%@:%p; %@, %@>", v31, self, v32, v33];

  return v34;
}

- (NSString)extensionID
{
  v2 = [(_MDIndexExtension *)self extension];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)isEnabled
{
  v2 = [(_MDIndexExtension *)self extension];
  char v3 = [v2 optedIn];

  return v3;
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)[(NSExtension *)self->_extension infoDictionary];
}

- (BOOL)isInternal
{
  v2 = [(_MDIndexExtension *)self extension];
  char v3 = [v2 attributes];
  id v4 = [v3 objectForKeyedSubscript:@"CoreSpotlightDontRunDuringMigration"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)dontRunDuringMigration
{
  BOOL v3 = [(_MDIndexExtension *)self isInternal];
  if (v3)
  {
    id v4 = [(_MDIndexExtension *)self extension];
    BOOL v5 = [v4 attributes];
    v6 = [v5 objectForKeyedSubscript:@"CoreSpotlightDontRunDuringMigration"];
    char v7 = [v6 BOOLValue];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)_verifyIntegrityWithHostContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if ([(_MDIndexExtension *)v5 isInternal]
    && ![(_MDIndexExtension *)v5 entitlementVerified])
  {
    char v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_MDIndexExtension _verifyIntegrityWithHostContext:]();
    }

    v8 = [v4 _auxiliaryConnection];
    id v9 = [v8 valueForEntitlement:@"com.apple.private.corespotlight.internal"];
    char v6 = [v9 BOOLValue];

    if (v6)
    {
      v10 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_MDIndexExtension _verifyIntegrityWithHostContext:]();
      }

      [(_MDIndexExtension *)v5 setEntitlementVerified:1];
    }
    else
    {
      id v11 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_MDIndexExtension _verifyIntegrityWithHostContext:]((uint64_t)v5, v11);
      }
    }
  }
  else
  {
    char v6 = 1;
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)_performJob:(id)a3 completionBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_MDIndexExtension _performJob:completionBlock:]();
  }

  id v9 = [(_MDIndexExtension *)self queue];
  dispatch_assert_queue_V2(v9);

  v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_18D0E3000, v10, OS_LOG_TYPE_DEFAULT, "### [SpotlightClient] _performJob Setting up a new request for extension:%@ ", buf, 0xCu);
  }

  id v11 = [(_MDIndexExtension *)self extension];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke;
  v15[3] = &unk_1E5549238;
  v15[4] = self;
  id v16 = v11;
  id v17 = v6;
  id v18 = v7;
  id v12 = v6;
  id v13 = v11;
  id v14 = v7;
  [v13 beginExtensionRequestWithOptions:0 inputItems:0 completion:v15];
}

- (void)performJob:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_MDIndexExtension *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___MDIndexExtension_performJob_completionBlock___block_invoke;
  block[3] = &unk_1E5549288;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (void)setExtensionID:(id)a3
{
}

- (NSNumber)isAppleCodeSigned
{
  return self->_isAppleCodeSigned;
}

- (NSSet)identifiers
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentifiers:(id)a3
{
}

- (NSSet)supportedFileTypes
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSupportedFileTypes:(id)a3
{
}

- (NSString)extensionLabel
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (BOOL)entitlementVerified
{
  return self->_entitlementVerified;
}

- (void)setEntitlementVerified:(BOOL)a3
{
  self->_entitlementVerified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_extensionLabel, 0);
  objc_storeStrong((id *)&self->_supportedFileTypes, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_isAppleCodeSigned, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_verifyIntegrityWithHostContext:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18D0E3000, v0, v1, "Verified internal indexing extesion", v2, v3, v4, v5, v6);
}

- (void)_verifyIntegrityWithHostContext:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "Indexing extenions %@ reported as internal but the xpc connection says otherwise!", (uint8_t *)&v2, 0xCu);
}

- (void)_verifyIntegrityWithHostContext:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18D0E3000, v0, v1, "Verifying that the internal indexing extension is actually internal", v2, v3, v4, v5, v6);
}

- (void)_performJob:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18D0E3000, v0, v1, "~~~ In extension's _performJob", v2, v3, v4, v5, v6);
}

@end