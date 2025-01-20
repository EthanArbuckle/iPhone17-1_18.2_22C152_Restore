@interface MCMContainerConfiguration
- (BOOL)alwaysRequireSignatureScrutiny;
- (BOOL)autoRollsPathOnBuildUpdate;
- (BOOL)cleanTransientsEachBoot;
- (BOOL)handledByProxy;
- (BOOL)handledDirectly;
- (BOOL)honorGroupContainerEntitlementForAppStoreSigned;
- (BOOL)honorGroupContainerEntitlementForMatchingTeamIDPrefix;
- (BOOL)honorGroupContainerEntitlementForPlatformBinary;
- (BOOL)honorGroupContainerEntitlementForProfileValidatedEntitlements;
- (BOOL)honorGroupContainerEntitlementForTestFlight;
- (BOOL)honorGroupContainerEntitlementForiPadAppsOnMac;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerConfig:(id)a3;
- (BOOL)migrateCodeSignInfoFromMetadataToDB;
- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4;
- (BOOL)ownerIssuedSandboxExtension;
- (BOOL)personaAndUserSpecific;
- (BOOL)supportedOnPlatform;
- (BOOL)supportsProtectedContainerWithRestrictedEntitlement;
- (BOOL)usesGlobalBundleUserIdentity;
- (BOOL)usesGlobalSystemUserIdentity;
- (MCMContainerConfiguration)initWithPreprocessedPlist:(id)a3 name:(id)a4;
- (NSDictionary)sandboxAffordances;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (id)_containerIdentifierSetFromPlistValue:(id)a3 error:(id *)a4;
- (id)_sandboxAffordancesFromPlistValue:(id)a3 error:(id *)a4;
- (id)debugDescriptionWithIndentString:(id)a3;
- (unint64_t)_containerClassFromPlistValue:(id)a3;
- (unint64_t)containerClass;
- (unint64_t)hash;
- (unsigned)disposition;
@end

@implementation MCMContainerConfiguration

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (unsigned)disposition
{
  if ([(MCMContainerConfiguration *)self handledDirectly]) {
    return 1;
  }
  if ([(MCMContainerConfiguration *)self handledByProxy]) {
    return 2;
  }
  return 0;
}

- (BOOL)handledDirectly
{
  return self->_handledDirectly;
}

- (BOOL)personaAndUserSpecific
{
  return self->_personaAndUserSpecific;
}

- (BOOL)usesGlobalSystemUserIdentity
{
  return self->_usesGlobalSystemUserIdentity;
}

- (BOOL)usesGlobalBundleUserIdentity
{
  return self->_usesGlobalBundleUserIdentity;
}

- (BOOL)supportsProtectedContainerWithRestrictedEntitlement
{
  return self->_supportsProtectedContainerWithRestrictedEntitlement;
}

- (BOOL)supportedOnPlatform
{
  return self->_supportedOnPlatform;
}

- (BOOL)ownerIssuedSandboxExtension
{
  return self->_ownerIssuedSandboxExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxAffordances, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)sandboxAffordances
{
  return self->_sandboxAffordances;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)alwaysRequireSignatureScrutiny
{
  return self->_alwaysRequireSignatureScrutiny;
}

- (BOOL)cleanTransientsEachBoot
{
  return self->_cleanTransientsEachBoot;
}

- (BOOL)honorGroupContainerEntitlementForTestFlight
{
  return self->_honorGroupContainerEntitlementForTestFlight;
}

- (BOOL)honorGroupContainerEntitlementForProfileValidatedEntitlements
{
  return self->_honorGroupContainerEntitlementForProfileValidatedEntitlements;
}

- (BOOL)honorGroupContainerEntitlementForiPadAppsOnMac
{
  return self->_honorGroupContainerEntitlementForiPadAppsOnMac;
}

- (BOOL)honorGroupContainerEntitlementForPlatformBinary
{
  return self->_honorGroupContainerEntitlementForPlatformBinary;
}

- (BOOL)honorGroupContainerEntitlementForAppStoreSigned
{
  return self->_honorGroupContainerEntitlementForAppStoreSigned;
}

- (BOOL)honorGroupContainerEntitlementForMatchingTeamIDPrefix
{
  return self->_honorGroupContainerEntitlementForMatchingTeamIDPrefix;
}

- (BOOL)migrateCodeSignInfoFromMetadataToDB
{
  return self->_migrateCodeSignInfoFromMetadataToDB;
}

- (BOOL)handledByProxy
{
  return self->_handledByProxy;
}

- (BOOL)autoRollsPathOnBuildUpdate
{
  return self->_autoRollsPathOnBuildUpdate;
}

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"containerClass"];
  self->_containerClass = [(MCMContainerConfiguration *)self _containerClassFromPlistValue:v7];

  v8 = [v6 objectForKeyedSubscript:@"sandboxAffordances"];

  v14[0] = 0;
  v9 = [(MCMContainerConfiguration *)self _sandboxAffordancesFromPlistValue:v8 error:v14];
  id v10 = v14[0];
  sandboxAffordances = self->_sandboxAffordances;
  self->_sandboxAffordances = v9;

  v12 = self->_sandboxAffordances;
  if (a4 && !v12) {
    *a4 = v10;
  }

  return v12 != 0;
}

- (id)_sandboxAffordancesFromPlistValue:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  if (!v5)
  {
    v11 = 0;
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v23 = a4;
      id v24 = v5;
      v11 = 0;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        uint64_t v13 = 0;
        v14 = v11;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * v13);
          v16 = objc_msgSend(v8, "objectForKeyedSubscript:", v15, v23, v24);
          v26 = v14;
          v17 = [(MCMContainerConfiguration *)self _containerIdentifierSetFromPlistValue:v16 error:&v26];
          v11 = v26;

          if (!v17)
          {

            id v6 = 0;
            goto LABEL_19;
          }
          [v6 setObject:v17 forKeyedSubscript:v15];

          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v31 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_19:
      a4 = v23;
      id v5 = v24;
    }
    else
    {
      v11 = 0;
    }

    if (a4) {
      goto LABEL_22;
    }
  }
  else
  {

    v18 = container_log_handle_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412546;
      v28 = v22;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "Team ID container ID map is not in a valid format; expected = NSDictionary, got = %@, value = %@",
        buf,
        0x16u);
    }
    v11 = [[MCMError alloc] initWithErrorType:149 category:3];
    id v6 = 0;
    if (a4)
    {
LABEL_22:
      if (!v6) {
        *a4 = v11;
      }
    }
  }
LABEL_24:
  v19 = (void *)[v6 copy];

  return v19;
}

- (id)_containerIdentifierSetFromPlistValue:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  id v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138412546;
      id v30 = v21;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Team ID container ID map value is not in a valid format; expected = NSArray, got = %@, value = %@",
        buf,
        0x16u);
    }
    v16 = [[MCMError alloc] initWithErrorType:149 category:3];
LABEL_18:
    uint64_t v15 = 0;
    if (!a4) {
      goto LABEL_21;
    }
LABEL_19:
    if (!v15) {
      *a4 = v16;
    }
    goto LABEL_21;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = container_log_handle_for_category();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            *(_DWORD *)buf = 138412546;
            id v30 = v23;
            __int16 v31 = 2112;
            id v32 = v8;
            _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "Team ID container ID map value is not in a valid format; expected = NSArray<NSString>, got = NSArray<%@>, value = %@",
              buf,
              0x16u);
          }
          v16 = [[MCMError alloc] initWithErrorType:149 category:3];

          goto LABEL_18;
        }
        v14 = [v13 lowercaseString];
        [v6 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = (void *)[v6 copy];
  v16 = 0;
  if (a4) {
    goto LABEL_19;
  }
LABEL_21:

  return v15;
}

- (unint64_t)_containerClassFromPlistValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MCMContainerConfiguration *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if ([(MCMContainerConfiguration *)v4 conformsToProtocol:&unk_1F2F195B8])
  {
    BOOL v6 = [(MCMContainerConfiguration *)self isEqualToContainerConfig:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToContainerConfig:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MCMContainerConfiguration *)self containerClass];
  uint64_t v6 = [v4 containerClass];

  return v5 == v6;
}

- (unint64_t)hash
{
  return self->_containerClass;
}

- (id)debugDescriptionWithIndentString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MCMContainerConfiguration;
  id v4 = a3;
  unint64_t v5 = [(MCMPlistReadOnly *)&v9 descriptionOfBoolPropertiesWithIndentString:v4];
  uint64_t v6 = [v5 stringByAppendingFormat:@"%@containerClass: %llu\n", v4, self->_containerClass];

  id v7 = [v6 stringByAppendingFormat:@"%@name: %@\n", v4, self->_name];

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)[(MCMContainerConfiguration *)self debugDescriptionWithIndentString:&stru_1F2EF6598];
}

- (NSString)description
{
  id v3 = NSString;
  unint64_t v4 = [(MCMContainerConfiguration *)self containerClass];
  unint64_t v5 = [(MCMContainerConfiguration *)self name];
  uint64_t v6 = [v3 stringWithFormat:@"(%llu)%@", v4, v5];

  return (NSString *)v6;
}

- (MCMContainerConfiguration)initWithPreprocessedPlist:(id)a3 name:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCMContainerConfiguration;
  id v8 = [(MCMPlistReadOnly *)&v11 initWithPreprocessedPlist:a3 conformingToProtocol:&unk_1F2F195B8];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v9;
}

@end