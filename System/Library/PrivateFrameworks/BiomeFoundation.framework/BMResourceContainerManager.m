@interface BMResourceContainerManager
+ (id)sharedInstance;
- (BMResourceContainerManager)init;
- (BOOL)_containerFromCache:(id)a3 withClass:(Class)a4 forPersonaIdentifier:(id)a5 creatingIfNotInCache:(BOOL)a6 error:(id *)a7 block:(id)a8;
- (id)_enforceCurrentPersonaIsUserPersona:(id *)a3;
- (id)_standardDataVaultContainerForResource:(id)a3;
- (id)_userVaultContainerForCurrentPersona:(id *)a3;
- (id)_vanillaContainerForCurrentPersona:(id *)a3;
- (id)descriptorsFromConfigurationForSetResource:(id)a3;
- (id)openContainerForResource:(id)a3 mode:(unint64_t)a4 error:(id *)a5;
- (id)syncPolicyFromConfigurationForSetResource:(id)a3;
- (unint64_t)serviceDomainFromConfigurationForSetResource:(id)a3;
- (unsigned)routeContainerRequestForResource:(id)a3 mode:(unint64_t)a4;
@end

@implementation BMResourceContainerManager

- (id)openContainerForResource:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = +[BMPersonaUtilities currentPersonaIdentifierLoggingDescription];
  v10 = __biome_log_for_category(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)objc_opt_class();
    BMAccessModePrintableDescription(a4);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v13 = [NSString stringWithFormat:@" current persona: %@", v9];
    }
    else
    {
      v13 = &stru_1F0B3A038;
    }
    *(_DWORD *)buf = 138413058;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1B30A0000, v10, OS_LOG_TYPE_DEFAULT, "%@ received container request for resource: %@ with access mode: %@%@", buf, 0x2Au);
    if (v9) {
  }
    }
  unsigned int v14 = [(BMResourceContainerManager *)self routeContainerRequestForResource:v8 mode:a4];
  v15 = __biome_log_for_category(6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_opt_class();
    id v17 = v16;
    v18 = BMResourceContainerTypeDescription(v14);
    *(_DWORD *)buf = 138412546;
    id v24 = v16;
    __int16 v25 = 2112;
    id v26 = v18;
    _os_log_impl(&dword_1B30A0000, v15, OS_LOG_TYPE_DEFAULT, "%@ routing request to %@ container", buf, 0x16u);
  }
  switch(v14)
  {
    case 3u:
      uint64_t v19 = [(BMResourceContainerManager *)self _userVaultContainerForCurrentPersona:a5];
      goto LABEL_16;
    case 2u:
      uint64_t v19 = [(BMResourceContainerManager *)self _vanillaContainerForCurrentPersona:a5];
      goto LABEL_16;
    case 1u:
      uint64_t v19 = [(BMResourceContainerManager *)self _standardDataVaultContainerForResource:v8];
LABEL_16:
      v20 = (void *)v19;
      goto LABEL_17;
  }
  if (a5)
  {
    v22 = __biome_log_for_category(6);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[BMResourceContainerManager openContainerForResource:mode:error:]((uint64_t)self, v14);
    }

    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMAccessErrorDomain" code:10 userInfo:0];
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_17:

  return v20;
}

- (id)_standardDataVaultContainerForResource:(id)a3
{
  uint64_t v3 = BMServiceDomainForResource(a3);
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = +[BMPaths biomeDirectoryForDomain:v3];
  v6 = [v4 fileURLWithPath:v5];

  v7 = [[BMResourceContainer alloc] initWithURL:v6];
  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_manager;
  return v2;
}

uint64_t __44__BMResourceContainerManager_sharedInstance__block_invoke()
{
  sharedInstance_manager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (BMResourceContainerManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)BMResourceContainerManager;
  return [(BMResourceContainerManager *)&v3 init];
}

- (unsigned)routeContainerRequestForResource:(id)a3 mode:(unint64_t)a4
{
  return 1;
}

- (id)_vanillaContainerForCurrentPersona:(id *)a3
{
  return 0;
}

- (id)_userVaultContainerForCurrentPersona:(id *)a3
{
  return 0;
}

- (id)_enforceCurrentPersonaIsUserPersona:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = +[BMPersonaUtilities currentPersonaIdentifier];
  if (+[BMPersonaUtilities isUserPersonaIdentifier:v4])
  {
    id v5 = v4;
  }
  else
  {
    v6 = NSString;
    v7 = +[BMPersonaUtilities currentPersonaIdentifierLoggingDescription];
    id v8 = [v6 stringWithFormat:@"Cannot lookup persona-based container with non-user persona: %@", v7];

    v9 = __biome_log_for_category(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMResourceContainerManager _enforceCurrentPersonaIsUserPersona:]();
    }

    if (a3)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28228];
      v14[0] = v8;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a3 = [v10 errorWithDomain:@"BMAccessErrorDomain" code:10 userInfo:v11];
    }
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_containerFromCache:(id)a3 withClass:(Class)a4 forPersonaIdentifier:(id)a5 creatingIfNotInCache:(BOOL)a6 error:(id *)a7 block:(id)a8
{
  return 0;
}

- (id)descriptorsFromConfigurationForSetResource:(id)a3
{
  objc_super v3 = [a3 name];
  v4 = BMResourceDescriptorsLookupFromConfigurationForSet(v3);

  return v4;
}

- (id)syncPolicyFromConfigurationForSetResource:(id)a3
{
  objc_super v3 = [a3 name];
  v4 = BMResourceSyncPolicyLookupFromConfigurationForSet(v3);

  return v4;
}

- (unint64_t)serviceDomainFromConfigurationForSetResource:(id)a3
{
  objc_super v3 = [a3 name];
  unint64_t v4 = BMServiceDomainLookupFromConfigurationForSet(v3);

  return v4;
}

- (void)openContainerForResource:(uint64_t)a1 mode:(unsigned __int8)a2 error:.cold.1(uint64_t a1, unsigned __int8 a2)
{
  id v3 = (id)objc_opt_class();
  v10 = BMResourceContainerTypeDescription(a2);
  OUTLINED_FUNCTION_3(&dword_1B30A0000, v4, v5, "%@ Unexpected route: %@", v6, v7, v8, v9, 2u);
}

- (void)_enforceCurrentPersonaIsUserPersona:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_3(&dword_1B30A0000, v1, v2, "%@ %@", v3, v4, v5, v6, 2u);
}

@end