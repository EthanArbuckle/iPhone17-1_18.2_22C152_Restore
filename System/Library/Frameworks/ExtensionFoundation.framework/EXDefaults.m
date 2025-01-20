@interface EXDefaults
@end

@implementation EXDefaults

void __39___EXDefaults_preferInProcessDiscovery__block_invoke()
{
  int v0 = _os_feature_enabled_impl();
  preferInProcessDiscovery_value = v0;
  if (v0)
  {
    id v1 = [MEMORY[0x1E4F22420] sharedDatabaseContext];
    preferInProcessDiscovery_value = [v1 canAccess];
  }
}

uint64_t __29___EXDefaults_sharedInstance__block_invoke()
{
  sharedInstance_defaults = [[_EXDefaults alloc] _init];

  return MEMORY[0x1F41817F8]();
}

void __25___EXDefaults_errorTypes__block_invoke()
{
  v4[8] = *MEMORY[0x1E4F143B8];
  int v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:8];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)errorTypes_errorTypes;
  errorTypes_errorTypes = v2;
}

void __25___EXDefaults_plistTypes__block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  int v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  void v4[9] = objc_opt_class();
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)plistTypes_plistTypes;
  plistTypes_plistTypes = v2;
}

void __33___EXDefaults_plistAndValueTypes__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) plistTypes];
  uint64_t v1 = [v3 setByAddingObject:objc_opt_class()];
  uint64_t v2 = (void *)plistAndValueTypes_types;
  plistAndValueTypes_types = v1;
}

void __33___EXDefaults_extensionItemTypes__block_invoke(uint64_t a1)
{
  v20[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  id v3 = [*(id *)(a1 + 32) plistTypes];
  v4 = [v2 setWithSet:v3];

  v5 = [*(id *)(a1 + 32) errorTypes];
  [v4 unionSet:v5];

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  v20[4] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];
  [v4 addObjectsFromArray:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [&unk_1EE2E11A8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(&unk_1EE2E11A8);
        }
        Class v11 = NSClassFromString(*(NSString **)(*((void *)&v15 + 1) + 8 * v10));
        if (v11) {
          [v4 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [&unk_1EE2E11A8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  if (([*(id *)(a1 + 32) useItemProviderXPCConnection] & 1) == 0)
  {
    Class v12 = NSClassFromString(&cfstr_Exitemprovider_1.isa);
    if (v12) {
      [v4 addObject:v12];
    }
  }
  uint64_t v13 = [v4 copy];
  v14 = (void *)extensionItemTypes_types;
  extensionItemTypes_types = v13;
}

void __32___EXDefaults_itemProviderTypes__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  id v3 = [*(id *)(a1 + 32) plistTypes];
  v4 = [v2 setWithSet:v3];

  v5 = [*(id *)(a1 + 32) errorTypes];
  [v4 unionSet:v5];

  [v4 addObject:objc_opt_class()];
  [v4 addObject:objc_opt_class()];
  [v4 addObject:objc_opt_class()];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [&unk_1EE2E11C0 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(&unk_1EE2E11C0);
        }
        Class v10 = NSClassFromString(*(NSString **)(*((void *)&v13 + 1) + 8 * v9));
        if (v10) {
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [&unk_1EE2E11C0 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  uint64_t v11 = [v4 copy];
  Class v12 = (void *)itemProviderTypes_types;
  itemProviderTypes_types = v11;
}

void __25___EXDefaults_imageTypes__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v0 = [MEMORY[0x1E4F1CA80] set];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = [&unk_1EE2E11D8 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v9;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(&unk_1EE2E11D8);
        }
        Class v5 = NSClassFromString(*(NSString **)(*((void *)&v8 + 1) + 8 * v4));
        if (v5) {
          [v0 addObject:v5];
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [&unk_1EE2E11D8 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v2);
  }
  uint64_t v6 = [v0 copy];
  uint64_t v7 = (void *)imageTypes_types;
  imageTypes_types = v6;
}

uint64_t __28___EXDefaults_appleInternal__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  appleInternal_appleInternal = result;
  return result;
}

uint64_t __43___EXDefaults_useItemProviderXPCConnection__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  useItemProviderXPCConnection_value = result;
  return result;
}

uint64_t __54___EXDefaults_alwaysEnabledExtensionBundleIdentifiers__block_invoke()
{
  alwaysEnabledExtensionBundleIdentifiers_alwaysEnabled = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EE2E11F0];

  return MEMORY[0x1F41817F8]();
}

void __41___EXDefaults_enforceXPCCacheCodeSigning__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int bootarg_state = amfi_interface_query_bootarg_state();
  if (bootarg_state)
  {
    int v1 = bootarg_state;
    uint64_t v2 = _EXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v4 = strerror(v1);
      _os_log_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEFAULT, "amfi_interface_query_bootarg_state returned error %{public}s", buf, 0xCu);
    }
  }
  else
  {
    enforceXPCCacheCodeSigning_codeSigningEnforcementIsDisabled = 0;
  }
}

uint64_t __48___EXDefaults_allowedUnsandboxedExtensionPoints__block_invoke()
{
  allowedUnsandboxedExtensionPoints_allowList = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EE2E1208];

  return MEMORY[0x1F41817F8]();
}

@end