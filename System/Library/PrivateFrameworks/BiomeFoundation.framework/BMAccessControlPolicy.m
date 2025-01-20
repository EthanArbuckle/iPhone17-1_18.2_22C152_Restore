@interface BMAccessControlPolicy
+ (BOOL)allowsConfiguringConnection:(id)a3 forUseCase:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
+ (BOOL)process:(id)a3 canActOnBehalfOfProcess:(id)a4;
+ (id)contextSyncMapping;
+ (id)policyForProcess:(id)a3 connectionFlags:(unint64_t)a4 onBehalfOfProcessWithAccessControlPolicy:(id)a5;
+ (id)policyForProcess:(id)a3 connectionFlags:(unint64_t)a4 useCase:(id)a5;
+ (void)setLegacyViewResourceMappingCallback:(id)a3;
- (BMAccessControlPolicy)init;
- (BMAccessControlPolicy)initWithProcess:(id)a3 connectionFlags:(unint64_t)a4 useCase:(id)a5;
- (BMProcess)process;
- (BOOL)allowsAccessToBiomeAgentForUser:(unsigned int)a3;
- (BOOL)allowsAccessToClientCompute:(id)a3;
- (BOOL)allowsAccessToContextSync;
- (BOOL)allowsAccessToContextSyncStreams:(id)a3;
- (BOOL)allowsAccessToDatabase:(id)a3 withMode:(unint64_t)a4;
- (BOOL)allowsAccessToFlexibleStorage;
- (BOOL)allowsAccessToProxyBiomeAgentEndpoint;
- (BOOL)allowsAccessToResource:(id)a3 withMode:(unint64_t)a4;
- (BOOL)allowsAccessToSet:(id)a3 withMode:(unint64_t)a4;
- (BOOL)allowsAccessToSetStoreUpdateServiceForSet:(id)a3;
- (BOOL)allowsAccessToSetsWithMode:(unint64_t)a3;
- (BOOL)allowsAccessToStream:(id)a3 withMode:(unint64_t)a4;
- (BOOL)allowsAccessToSync;
- (BOOL)allowsAccessToView:(id)a3 withMode:(unint64_t)a4;
- (BOOL)allowsAccessToWriteServiceForStream:(id)a3 ofUser:(unsigned int)a4;
- (BOOL)allowsComputePublisherAccessToStreams:(id)a3;
- (BOOL)allowsComputeSourceAccessToStream:(id)a3;
- (BOOL)allowsConnectionToAccessServiceWithDomain:(unint64_t)a3;
- (BOOL)allowsConnectionToComputePublisherService;
- (BOOL)allowsConnectionToComputeSourceService;
- (BOOL)allowsConnectionToSetStoreUpdateService;
- (BOOL)allowsConnectionToWriteService;
- (BOOL)allowsProxyingBiomeEndpoint;
- (NSString)descriptionOfProcessAndUseCase;
- (NSString)useCase;
- (id)authorizedResources;
- (id)explicitlyAuthorizedResourcesOfType:(unint64_t)a3 withAccessMode:(unint64_t)a4;
- (unint64_t)allowedModeForStream:(id)a3;
- (void)_warnAboutInternalEntitlement:(id)a3 streamIdentifier:(id)a4;
@end

@implementation BMAccessControlPolicy

void __44__BMAccessControlPolicy_authorizedResources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  uint64_t v5 = [a3 unsignedIntegerValue];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
    uint64_t v8 = [v7 unsignedIntegerValue];
    uint64_t v9 = 2;
    BOOL v10 = v8 == 1 && v6 == 3;
    uint64_t v11 = 3;
    if (!v10) {
      uint64_t v11 = v8;
    }
    if (v8 == 2) {
      uint64_t v11 = 2;
    }
    if (v6 != 2) {
      uint64_t v9 = v11;
    }
    if (v8) {
      uint64_t v6 = v9;
    }

    v12 = [NSNumber numberWithUnsignedInteger:v6];
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v13];
  }
}

- (NSString)useCase
{
  return self->_useCase;
}

- (BOOL)allowsAccessToResource:(id)a3 withMode:(unint64_t)a4
{
  id v6 = a3;
  switch([v6 type])
  {
    case 1:
      v7 = [v6 name];
      BOOL v8 = [(BMAccessControlPolicy *)self allowsAccessToStream:v7 withMode:a4];
      goto LABEL_6;
    case 2:
      v7 = [v6 name];
      BOOL v8 = [(BMAccessControlPolicy *)self allowsAccessToView:v7 withMode:a4];
      goto LABEL_6;
    case 3:
      v7 = [v6 name];
      BOOL v8 = [(BMAccessControlPolicy *)self allowsAccessToDatabase:v7 withMode:a4];
      goto LABEL_6;
    case 4:
      v7 = [v6 name];
      BOOL v8 = [(BMAccessControlPolicy *)self allowsAccessToSet:v7 withMode:a4];
LABEL_6:
      BOOL v9 = v8;

      goto LABEL_18;
    case 5:
      BOOL v10 = [v6 name];
      if ([v10 isEqual:@"BMSyncResource"])
      {

LABEL_10:
        BOOL v13 = [(BMAccessControlPolicy *)self allowsAccessToSync];
LABEL_11:
        BOOL v9 = v13;
        goto LABEL_18;
      }
      uint64_t v11 = [v6 name];
      int v12 = [v11 isEqual:@"BMSharedSyncResource"];

      if (v12) {
        goto LABEL_10;
      }
      v14 = [v6 name];
      int v15 = [v14 isEqual:@"BMFlexibleStorageResource"];

      if (v15)
      {
        BOOL v13 = [(BMAccessControlPolicy *)self allowsAccessToFlexibleStorage];
        goto LABEL_11;
      }
      v16 = [v6 name];
      int v17 = [v16 isEqual:@"BMSetsResource"];

      if (v17
        || ([v6 name],
            v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = [v18 isEqual:@"BMSetsMergeableDeltasResource"],
            v18,
            v19))
      {
        BOOL v13 = [(BMAccessControlPolicy *)self allowsAccessToSetsWithMode:a4];
        goto LABEL_11;
      }
LABEL_17:
      BOOL v9 = 0;
LABEL_18:

      return v9;
    default:
      goto LABEL_17;
  }
}

- (BOOL)allowsAccessToClientCompute:(id)a3
{
  id v4 = a3;
  process = self->_process;
  if (process)
  {
    switch([(BMProcess *)process processType])
    {
      case 1uLL:
      case 3uLL:
        v7 = [(BMProcess *)self->_process identifier];
        char v6 = [v7 isEqual:v4];

        break;
      case 2uLL:
      case 6uLL:
      case 7uLL:
        char v6 = 1;
        break;
      case 4uLL:
      case 5uLL:
        onBehalfOf = self->_onBehalfOf;
        if (!onBehalfOf) {
          goto LABEL_7;
        }
        char v9 = [(BMAccessControlPolicy *)onBehalfOf allowsAccessToClientCompute:v4];
        goto LABEL_9;
      case 8uLL:
        char v9 = os_variant_allows_internal_security_policies();
LABEL_9:
        char v6 = v9;
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    char v6 = 0;
  }

  return v6;
}

- (BOOL)allowsAccessToStream:(id)a3 withMode:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  char v8 = 0;
  if (!a4) {
    goto LABEL_6;
  }
  p_process = &self->_process;
  if (!self->_process) {
    goto LABEL_6;
  }
  if (!BMIdentifierIsPathSafe(v6))
  {
LABEL_5:
    char v8 = 0;
    goto LABEL_6;
  }
  char v8 = 1;
  switch([(BMProcess *)*p_process processType])
  {
    case 0uLL:
    case 5uLL:
      goto LABEL_5;
    case 2uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 3uLL:
      uint64_t v11 = BMSyncableStreamIdentifiers();
      char v12 = [v11 containsObject:v7];

      if ((v12 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    case 4uLL:
      onBehalfOf = self->_onBehalfOf;
      if (!onBehalfOf
        || ![(BMAccessControlPolicy *)onBehalfOf allowsAccessToStream:v7 withMode:2])
      {
        goto LABEL_5;
      }
      goto LABEL_14;
    case 8uLL:
      char v15 = os_variant_allows_internal_security_policies();
      goto LABEL_16;
    default:
LABEL_8:
      int v13 = [v7 hasSuffix:@":subscriptions"];
      int v14 = [v7 hasSuffix:@":tombstones"];
      if ([v7 hasPrefix:@"_DK"])
      {
        if ((v13 | v14)) {
          goto LABEL_5;
        }
        if ([(BMProcess *)*p_process BOOLForEntitlement:@"com.apple.rootless.storage.coreduet_knowledge_store"])
        {
LABEL_14:
          char v8 = 1;
        }
        else
        {
          char v15 = [(BMProcess *)*p_process BOOLForEntitlement:@"com.apple.coreduetd.allow"];
LABEL_16:
          char v8 = v15;
        }
        goto LABEL_6;
      }
      if (!v13)
      {
        if (v14)
        {
          v20 = [v7 componentsSeparatedByString:@":"];
          v21 = [v20 firstObject];

          v22 = [(BMAccessControlPolicy *)self explicitlyAuthorizedResourcesOfType:1 withAccessMode:a4];
          char v8 = [v22 containsObject:v21];

          goto LABEL_6;
        }
        char v8 = 1;
        v23 = [(BMAccessControlPolicy *)self explicitlyAuthorizedResourcesOfType:1 withAccessMode:a4];
        if ([v23 containsObject:v7]) {
          goto LABEL_38;
        }
        if ([(BMProcess *)*p_process BOOLForEntitlement:@"com.apple.private.security.storage.Biome"])
        {
          v24 = [(BMProcess *)*p_process executableName];
          char v25 = [&unk_1F0B42FA0 containsObject:v24];

          if (v25) {
            goto LABEL_36;
          }
        }
        if ([v7 isEqual:@"Discoverability.Signals"])
        {
          v26 = [(BMProcess *)*p_process identifier];
          if ([v26 isEqual:@"com.apple.activitysharingd"])
          {

            goto LABEL_29;
          }
          v27 = [(BMProcess *)*p_process identifier];
          int v28 = [v27 isEqual:@"com.apple.camera"];

          if (v28)
          {
LABEL_29:
            v29 = __biome_log_for_category(6);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              goto LABEL_34;
            }
            goto LABEL_35;
          }
          if ([(BMProcess *)*p_process BOOLForEntitlement:@"com.apple.rootless.storage.coreduet_knowledge_store"]|| [(BMProcess *)*p_process BOOLForEntitlement:@"com.apple.coreduetd.allow"])
          {
            v29 = __biome_log_for_category(6);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
LABEL_34:
            }
              -[BMAccessControlPolicy allowsAccessToStream:withMode:]((uint64_t)p_process);
LABEL_35:

LABEL_36:
            char v8 = 1;
LABEL_38:

            goto LABEL_6;
          }
        }
        char v8 = 0;
        goto LABEL_38;
      }
      if ((a4 & 2) != 0) {
        goto LABEL_5;
      }
      int v17 = [v7 componentsSeparatedByString:@":"];
      v18 = [v17 firstObject];

      int v19 = [(BMAccessControlPolicy *)self explicitlyAuthorizedResourcesOfType:1 withAccessMode:2];
      char v8 = [v19 containsObject:v18];

LABEL_6:
      return v8;
  }
}

- (id)explicitlyAuthorizedResourcesOfType:(unint64_t)a3 withAccessMode:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v7 = [MEMORY[0x1E4F1CA80] set];
    char v8 = [(BMAccessControlPolicy *)self authorizedResources];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v13 type] == a3)
          {
            int v14 = [v8 objectForKeyedSubscript:v13];
            uint64_t v15 = [v14 unsignedIntegerValue];

            if (v15)
            {
              if (v15 == a4 || v15 == 3)
              {
                int v17 = [v13 name];
                [v7 addObject:v17];
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)policyForProcess:(id)a3 connectionFlags:(unint64_t)a4 useCase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if ((a4 & 1) == 0)
    {
      uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithProcess:v8 connectionFlags:a4 useCase:v9];
      goto LABEL_8;
    }
    uint64_t v11 = __biome_log_for_category(6);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[BMAccessControlPolicy policyForProcess:connectionFlags:useCase:](v11);
    }
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (BMAccessControlPolicy)initWithProcess:(id)a3 connectionFlags:(unint64_t)a4 useCase:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMAccessControlPolicy;
    uint64_t v11 = [(BMAccessControlPolicy *)&v18 init];
    char v12 = v11;
    if (v11)
    {
      v11->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v11->_process, a3);
      uint64_t v13 = [v10 copy];
      useCase = v12->_useCase;
      v12->_useCase = (NSString *)v13;

      authorizedResources = v12->_authorizedResources;
      v12->_authorizedResources = 0;

      v12->_connectionFlags = a4;
    }
    self = v12;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)allowsConfiguringConnection:(id)a3 forUseCase:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v8 = (BMProcess *)a3;
  id v9 = a4;
  if (BMIdentifierIsPathSafe(v9))
  {
    id v10 = -[NSXPCConnection bm_process](v8);
    uint64_t v11 = -[NSXPCConnection bm_accessControlPolicy](v8);
    uint64_t v12 = [v11 useCase];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      int v14 = [v11 useCase];
      char v15 = [v14 isEqual:v9];

      if ((v15 & 1) == 0)
      {
        if (a6)
        {
          long long v20 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v49 = *MEMORY[0x1E4F28568];
          v50 = @"Use case already set";
          long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          *a6 = [v20 errorWithDomain:@"BMAccessErrorDomain" code:5 userInfo:v21];
LABEL_36:

          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
    if (([v9 hasPrefix:@"__"] & 1) == 0)
    {
      v16 = [v10 useCases];
      char v17 = [v16 containsObject:v9];

      if (v17) {
        goto LABEL_7;
      }
    }
    if ([(id)BMAnyClientUseCaseAllowList containsObject:v9]) {
      goto LABEL_7;
    }
    int v22 = [v9 isEqual:@"__proxy__"];
    uint64_t v23 = [v10 processType];
    if (v22)
    {
      if (v23 != 2
        || ([v10 identifier],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            char v25 = [v24 isEqual:@"com.apple.biomed"],
            v24,
            (v25 & 1) == 0))
      {
        if ([v10 processType] != 1
          || ([v10 identifier],
              v26 = objc_claimAutoreleasedReturnValue(),
              char v27 = [&unk_1F0B42FB8 containsObject:v26],
              v26,
              (v27 & 1) == 0))
        {
          if (a6)
          {
            int v28 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v47 = *MEMORY[0x1E4F28568];
            v29 = NSString;
            long long v21 = [v10 executableName];
            v30 = [v29 stringWithFormat:@"Process '%@' not authorized for use-case '%@'", v21, v9];
            v48 = v30;
            v31 = (void *)MEMORY[0x1E4F1C9E8];
            v32 = &v48;
            v33 = &v47;
LABEL_20:
            v34 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:1];
            *a6 = [v28 errorWithDomain:@"BMAccessErrorDomain" code:4 userInfo:v34];

LABEL_35:
            goto LABEL_36;
          }
          goto LABEL_37;
        }
      }
      goto LABEL_7;
    }
    if ((v23 == 2 || [v10 processType] == 7)
      && ([(id)BMBiomeDaemonUseCaseAllowList containsObject:v9] & 1) != 0
      || [v10 processType] == 3)
    {
      goto LABEL_7;
    }
    if ([v9 isEqual:@"__internal__"])
    {
      if (os_variant_allows_internal_security_policies())
      {
        if ([v10 processType] != 8)
        {
          if (a6)
          {
            int v28 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v43 = *MEMORY[0x1E4F28568];
            v35 = NSString;
            long long v21 = [v10 executableName];
            v30 = [v35 stringWithFormat:@"Process '%@' not authorized for use-case '%@'", v21, v9];
            v44 = v30;
            v31 = (void *)MEMORY[0x1E4F1C9E8];
            v32 = &v44;
            v33 = &v43;
            goto LABEL_20;
          }
LABEL_37:
          BOOL v18 = 0;
          goto LABEL_38;
        }
LABEL_7:
        BOOL v18 = 1;
LABEL_38:

        goto LABEL_39;
      }
      if (!a6) {
        goto LABEL_37;
      }
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      long long v21 = [NSString stringWithFormat:@"Use-case '%@' not authorized", v9];
      v46 = v21;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      v37 = v39;
      uint64_t v38 = 4;
    }
    else
    {
      if (!a6) {
        goto LABEL_37;
      }
      v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      long long v21 = [NSString stringWithFormat:@"Use case '%@' not found", v9];
      v42 = v21;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      v37 = v36;
      uint64_t v38 = 3;
    }
    *a6 = [v37 errorWithDomain:@"BMAccessErrorDomain" code:v38 userInfo:v30];
    goto LABEL_35;
  }
  if (a6)
  {
    long long v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithFormat:@"Invalid use case '%@'", v9];
    v52[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    [v19 errorWithDomain:@"BMAccessErrorDomain" code:2 userInfo:v11];
    BOOL v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  BOOL v18 = 0;
LABEL_39:

  return v18;
}

- (BOOL)allowsAccessToFlexibleStorage
{
  process = self->_process;
  if (process)
  {
    [(BMProcess *)process processType];
    LOBYTE(process) = [(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.private.biome.read-write"]|| [(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.private.biome.read-only"]|| os_variant_allows_internal_security_policies()&& ([(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.read-write"]|| [(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.read-only"]);
  }
  return (char)process;
}

- (BOOL)allowsConnectionToAccessServiceWithDomain:(unint64_t)a3
{
  p_process = &self->_process;
  if (![(BMProcess *)self->_process processType]) {
    return 0;
  }
  [(BMProcess *)*p_process identifier];

  if ([(BMProcess *)*p_process processType] == 2
    || [(BMProcess *)*p_process processType] == 3
    || [(BMProcess *)*p_process processType] == 4
    || [(BMProcess *)*p_process processType] == 5
    || [(BMProcess *)*p_process hasNonEmptyDictionaryForEntitlement:@"com.apple.private.intelligenceplatform.use-cases"]|| [(BMProcess *)*p_process hasNonEmptyArrayForEntitlement:@"com.apple.private.biome.writer"]|| [(BMProcess *)*p_process hasNonEmptyArrayForEntitlement:@"com.apple.private.biome.pruner"]|| [(BMProcess *)*p_process hasNonEmptyArrayForEntitlement:@"com.apple.private.biome.read-write"]|| [(BMProcess *)*p_process hasNonEmptyArrayForEntitlement:@"com.apple.private.biome.read-only"]
    || -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.write-only")|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.intelligenceplatform.views.read-only")|| os_variant_allows_internal_security_policies()&& (-[BMProcess processType](*p_process, "processType") == 8|| -[BMProcess hasNonEmptyDictionaryForEntitlement:](*p_process, "hasNonEmptyDictionaryForEntitlement:", @"com.apple.internal.intelligenceplatform.use-cases")|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.internal.biome.writer")|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process,
          "hasNonEmptyArrayForEntitlement:",
          @"com.apple.internal.biome.pruner")
     || [(BMProcess *)*p_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.read-write"]|| [(BMProcess *)*p_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.read-only"]|| [(BMProcess *)*p_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.write-only"]))
  {
    return 1;
  }
  BOOL v4 = [(BMProcess *)*p_process BOOLForEntitlement:@"com.apple.private.security.storage.Biome"];
  uint64_t v5 = *p_process;
  if (!v4)
  {
    if ([(BMProcess *)v5 BOOLForEntitlement:@"com.apple.rootless.storage.coreduet_knowledge_store"]|| [(BMProcess *)*p_process BOOLForEntitlement:@"com.apple.coreduetd.allow"])
    {
      id v9 = __biome_log_for_category(6);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BMAccessControlPolicy allowsConnectionToAccessServiceWithDomain:]((id *)p_process, v9);
      }
      goto LABEL_35;
    }
    id v10 = [(BMProcess *)*p_process identifier];
    if ([v10 isEqual:@"com.apple.activitysharingd"])
    {

      goto LABEL_33;
    }
    uint64_t v11 = [(BMProcess *)*p_process identifier];
    int v12 = [v11 isEqual:@"com.apple.camera"];

    if (v12)
    {
LABEL_33:
      id v9 = __biome_log_for_category(6);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BMAccessControlPolicy allowsConnectionToAccessServiceWithDomain:]((uint64_t)p_process, v9);
      }
      goto LABEL_35;
    }
    return 0;
  }
  id v6 = [(BMProcess *)v5 executableName];
  char v7 = [&unk_1F0B42F88 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    id v9 = __biome_log_for_category(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BMAccessControlPolicy allowsConnectionToAccessServiceWithDomain:]((id *)p_process, v9);
    }
LABEL_35:
    BOOL v8 = !v4;

    return v8;
  }
  return 1;
}

- (id)authorizedResources
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  authorizedResources = self->_authorizedResources;
  if (authorizedResources)
  {
    BOOL v4 = authorizedResources;
    goto LABEL_149;
  }
  v90 = self;
  unint64_t v5 = [(BMProcess *)self->_process processType];
  if (v5 && (v5 != 8 || (os_variant_allows_internal_security_policies() & 1) != 0))
  {
    id v88 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v6 = self->_useCase;
    *(void *)&long long v144 = @"__legacy__";
    v121 = @"com.apple.private.biome.read-only";
    uint64_t v122 = @"com.apple.private.biome.read-write";
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:2];
    v130[0] = v7;
    *((void *)&v144 + 1) = @"__legacy_view__";
    v128[0] = @"com.apple.private.intelligenceplatform.views.read-only";
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:1];
    v130[1] = v8;
    *(void *)&long long v145 = @"__writer__";
    *(void *)&long long v139 = @"com.apple.private.biome.write-only";
    *((void *)&v139 + 1) = @"com.apple.private.biome.read-write";
    *(void *)&long long v140 = @"com.apple.private.biome.writer";
    *((void *)&v140 + 1) = @"com.apple.private.intelligenceplatform.use-cases";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v139 count:4];
    v130[2] = v9;
    *((void *)&v145 + 1) = @"__pruner__";
    *(void *)&long long v131 = @"com.apple.private.biome.read-write";
    *((void *)&v131 + 1) = @"com.apple.private.biome.pruner";
    *(void *)&long long v132 = @"com.apple.private.biome.writer";
    *((void *)&v132 + 1) = @"com.apple.private.intelligenceplatform.use-cases";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:4];
    v130[3] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:&v144 count:4];

    int v12 = [v11 objectForKeyedSubscript:v6];
    if (!v12)
    {
      v119[0] = @"com.apple.private.intelligenceplatform.use-cases";
      int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:1];
    }
    if (os_variant_allows_internal_security_policies())
    {
      obuint64_t j = (id)[v12 mutableCopy];
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v135 objects:v143 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v136;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v136 != v15) {
              objc_enumerationMutation(v13);
            }
            char v17 = BMAppleInternalVariantOfEntitlement(*(void **)(*((void *)&v135 + 1) + 8 * i));
            if (v17) {
              [obj addObject:v17];
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v135 objects:v143 count:16];
        }
        while (v14);
      }
    }
    else
    {
      obuint64_t j = v12;
    }

    uint64_t v86 = [obj countByEnumeratingWithState:&v107 objects:v118 count:16];
    if (v86)
    {
      v85 = v112;
      uint64_t v87 = *(void *)v108;
      v84 = @"com.apple.internal.biome.read-write";
      do
      {
        uint64_t v96 = 0;
        do
        {
          if (*(void *)v108 != v87) {
            objc_enumerationMutation(obj);
          }
          process = v90->_process;
          useCase = v90->_useCase;
          id v98 = *(id *)(*((void *)&v107 + 1) + 8 * v96);
          v95 = process;
          v97 = useCase;
          if ((os_variant_allows_internal_security_policies() & 1) == 0
            && ((BMEntitlementIsAppleInternal(v98, v21) & 1) != 0 || [(BMProcess *)v95 processType] == 8))
          {
LABEL_34:
            id v23 = (id)objc_opt_new();
            goto LABEL_98;
          }
          if ((objc_msgSend(v98, "isEqual:", @"com.apple.private.intelligenceplatform.use-cases", v84, v85) & 1) != 0
            || [v98 isEqual:@"com.apple.internal.intelligenceplatform.use-cases"])
          {
            int v22 = [(BMProcess *)v95 dictionaryForEntitlement:v98];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([(NSString *)v97 isEqualToString:@"__pruner__"]) {
                char v101 = 1;
              }
              else {
                char v101 = [(NSString *)v97 isEqualToString:@"__writer__"];
              }
              id v102 = (id)objc_opt_new();
              long long v146 = 0u;
              long long v147 = 0u;
              long long v144 = 0u;
              long long v145 = 0u;
              v31 = [v22 allKeys];
              uint64_t v32 = [v31 countByEnumeratingWithState:&v144 objects:v143 count:16];
              id v89 = v31;
              uint64_t v94 = (uint64_t)v22;
              if (v32)
              {
                uint64_t v93 = *(void *)v145;
LABEL_51:
                uint64_t v91 = v32;
                uint64_t v99 = 0;
                v33 = v102;
                while (1)
                {
                  if (*(void *)v145 != v93) {
                    objc_enumerationMutation(v89);
                  }
                  uint64_t v34 = *(void *)(*((void *)&v144 + 1) + 8 * v99);
                  if ((v101 & 1) != 0
                    || [(NSString *)v97 isEqualToString:*(void *)(*((void *)&v144 + 1) + 8 * v99)])
                  {
                    break;
                  }
LABEL_92:
                  if (++v99 == v91)
                  {
                    uint64_t v32 = [v89 countByEnumeratingWithState:&v144 objects:v143 count:16];
                    if (!v32) {
                      goto LABEL_94;
                    }
                    goto LABEL_51;
                  }
                }
                v35 = [v22 objectForKeyedSubscript:v34];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v141 = 0u;
                  long long v142 = 0u;
                  long long v139 = 0u;
                  long long v140 = 0u;
                  id v103 = v35;
                  uint64_t v36 = [v103 countByEnumeratingWithState:&v139 objects:&v135 count:16];
                  if (!v36) {
                    goto LABEL_91;
                  }
                  uint64_t v104 = *(void *)v140;
                  while (1)
                  {
                    for (uint64_t j = 0; j != v36; ++j)
                    {
                      if (*(void *)v140 != v104) {
                        objc_enumerationMutation(v103);
                      }
                      uint64_t v38 = *(void *)(*((void *)&v139 + 1) + 8 * j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v39 = BMResourceTypeFromEntitlementResourceTypeString(v38);
                        if (v39)
                        {
                          v40 = objc_opt_new();
                          uint64_t v41 = [v103 objectForKeyedSubscript:v38];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v42 = BMNonnullSetOfStringsFromEntitlementValue(v41);
                            long long v133 = 0u;
                            long long v134 = 0u;
                            long long v131 = 0u;
                            long long v132 = 0u;
                            uint64_t v43 = [v42 countByEnumeratingWithState:&v131 objects:v130 count:16];
                            if (v43)
                            {
                              uint64_t v44 = *(void *)v132;
                              do
                              {
                                for (uint64_t k = 0; k != v43; ++k)
                                {
                                  if (*(void *)v132 != v44) {
                                    objc_enumerationMutation(v42);
                                  }
                                  [v40 setObject:&unk_1F0B42D90 forKeyedSubscript:*(void *)(*((void *)&v131 + 1) + 8 * k)];
                                }
                                uint64_t v43 = [v42 countByEnumeratingWithState:&v131 objects:v130 count:16];
                              }
                              while (v43);
                            }
LABEL_75:

                            v33 = v102;
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v128[0] = MEMORY[0x1E4F143A8];
                              v128[1] = 3221225472;
                              v128[2] = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke;
                              v128[3] = &unk_1E6022A90;
                              id v129 = v40;
                              [v41 enumerateKeysAndObjectsUsingBlock:v128];
                              v42 = v129;
                              goto LABEL_75;
                            }
                          }
                          if (v39 == 4)
                          {
                            id v46 = v40;
                            uint64_t v47 = [v46 objectForKeyedSubscript:@"HomeKit.Entity"];
                            if (v47) {
                              [v46 setObject:v47 forKeyedSubscript:@"HomeKit.Home"];
                            }
                            v48 = [v46 objectForKeyedSubscript:@"Media.Entity"];

                            if (v48) {
                              [v46 setObject:v48 forKeyedSubscript:@"MediaLibrary.Media"];
                            }
                            uint64_t v49 = [v46 objectForKeyedSubscript:@"Podcasts.Entity"];

                            if (v49) {
                              [v46 setObject:v49 forKeyedSubscript:@"Podcasts.Podcast"];
                            }
                            v50 = [v46 objectForKeyedSubscript:@"Siri.PrivateLearning.MediaEntity"];

                            if (v50) {
                              [v46 setObject:v50 forKeyedSubscript:@"Siri.PrivateLearning.Media"];
                            }

                            v33 = v102;
                          }
                          else if (v39 == 1)
                          {
                            BMExpandBiomeLibraryPremigrationIdentifiersAccessModeDictionary(v40);
                          }
                          v121 = (__CFString *)MEMORY[0x1E4F143A8];
                          uint64_t v122 = 3221225472;
                          v123 = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_2;
                          v124 = &unk_1E6022AB8;
                          char v127 = v101;
                          uint64_t v126 = v39;
                          id v125 = v33;
                          [v40 enumerateKeysAndObjectsUsingBlock:&v121];

                          v33 = v102;
                          continue;
                        }
                      }
                    }
                    uint64_t v36 = [v103 countByEnumeratingWithState:&v139 objects:&v135 count:16];
                    if (!v36)
                    {
LABEL_91:

                      int v22 = (void *)v94;
                      v33 = v102;
                      goto LABEL_92;
                    }
                  }
                }
                id v23 = (id)objc_opt_new();

                id v30 = v102;
              }
              else
              {
LABEL_94:

                id v30 = v102;
                id v23 = v30;
              }
              goto LABEL_96;
            }
          }
          else
          {
            if (([v98 isEqual:@"com.apple.private.biome.writer"] & 1) != 0
              || ([v98 isEqual:@"com.apple.internal.biome.writer"] & 1) != 0
              || ([v98 isEqual:@"com.apple.private.biome.pruner"] & 1) != 0
              || [v98 isEqual:@"com.apple.internal.biome.pruner"])
            {
              uint64_t v24 = objc_opt_new();
              long long v137 = 0u;
              long long v138 = 0u;
              long long v135 = 0u;
              long long v136 = 0u;
              char v25 = [(BMProcess *)v95 nonnullSetOfStringsForEntitlement:v98];
              uint64_t v26 = [v25 countByEnumeratingWithState:&v135 objects:v143 count:16];
              if (v26)
              {
                uint64_t v27 = *(void *)v136;
                do
                {
                  for (uint64_t m = 0; m != v26; ++m)
                  {
                    if (*(void *)v136 != v27) {
                      objc_enumerationMutation(v25);
                    }
                    [v24 setObject:&unk_1F0B42DA8 forKeyedSubscript:*(void *)(*((void *)&v135 + 1) + 8 * m)];
                  }
                  uint64_t v26 = [v25 countByEnumeratingWithState:&v135 objects:v143 count:16];
                }
                while (v26);
              }
              uint64_t v94 = (uint64_t)v24;

              BMExpandBiomeLibraryPremigrationIdentifiersAccessModeDictionary(v24);
              v29 = objc_opt_new();
              v119[0] = MEMORY[0x1E4F143A8];
              v119[1] = 3221225472;
              v119[2] = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_267;
              v119[3] = &unk_1E6022AE0;
              id v23 = v29;
              id v120 = v23;
              [v24 enumerateKeysAndObjectsUsingBlock:v119];
              id v30 = v120;
LABEL_96:

              int v22 = (void *)v94;
              goto LABEL_97;
            }
            if (([v98 isEqual:@"com.apple.private.biome.write-only"] & 1) != 0
              || [v98 isEqual:@"com.apple.internal.biome.write-only"])
            {
              uint64_t v51 = objc_opt_new();
              long long v137 = 0u;
              long long v138 = 0u;
              long long v135 = 0u;
              long long v136 = 0u;
              v52 = [(BMProcess *)v95 nonnullSetOfStringsForEntitlement:v98];
              uint64_t v53 = [v52 countByEnumeratingWithState:&v135 objects:v143 count:16];
              if (v53)
              {
                uint64_t v54 = *(void *)v136;
                do
                {
                  for (uint64_t n = 0; n != v53; ++n)
                  {
                    if (*(void *)v136 != v54) {
                      objc_enumerationMutation(v52);
                    }
                    [v51 setObject:&unk_1F0B42DC0 forKeyedSubscript:*(void *)(*((void *)&v135 + 1) + 8 * n)];
                  }
                  uint64_t v53 = [v52 countByEnumeratingWithState:&v135 objects:v143 count:16];
                }
                while (v53);
              }
              uint64_t v94 = (uint64_t)v51;

              BMExpandBiomeLibraryPremigrationIdentifiersAccessModeDictionary(v51);
              v56 = objc_opt_new();
              v116[0] = MEMORY[0x1E4F143A8];
              v116[1] = 3221225472;
              v116[2] = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_270;
              v116[3] = &unk_1E6022AE0;
              id v23 = v56;
              id v117 = v23;
              [v51 enumerateKeysAndObjectsUsingBlock:v116];
              id v30 = v117;
              goto LABEL_96;
            }
            if (([v98 isEqual:@"com.apple.private.biome.read-only"] & 1) != 0
              || [v98 isEqual:@"com.apple.internal.biome.read-only"])
            {
              v57 = objc_opt_new();
              long long v137 = 0u;
              long long v138 = 0u;
              long long v135 = 0u;
              long long v136 = 0u;
              v58 = [(BMProcess *)v95 nonnullSetOfStringsForEntitlement:v98];
              uint64_t v59 = [v58 countByEnumeratingWithState:&v135 objects:v143 count:16];
              if (v59)
              {
                uint64_t v60 = *(void *)v136;
                do
                {
                  for (iuint64_t i = 0; ii != v59; ++ii)
                  {
                    if (*(void *)v136 != v60) {
                      objc_enumerationMutation(v58);
                    }
                    [v57 setObject:&unk_1F0B42D90 forKeyedSubscript:*(void *)(*((void *)&v135 + 1) + 8 * ii)];
                  }
                  uint64_t v59 = [v58 countByEnumeratingWithState:&v135 objects:v143 count:16];
                }
                while (v59);
              }
              uint64_t v94 = (uint64_t)v57;

              BMExpandBiomeStreamsPremigrationIdentifiersAccessModeDictionary(v57);
              v62 = objc_opt_new();
              v114[0] = MEMORY[0x1E4F143A8];
              v114[1] = 3221225472;
              v114[2] = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_2_271;
              v114[3] = &unk_1E6022AE0;
              id v23 = v62;
              id v115 = v23;
              [v57 enumerateKeysAndObjectsUsingBlock:v114];
              id v30 = v115;
              goto LABEL_96;
            }
            if (([v98 isEqual:@"com.apple.private.biome.read-write"] & 1) != 0
              || [v98 isEqual:v84])
            {
              v63 = objc_opt_new();
              long long v137 = 0u;
              long long v138 = 0u;
              long long v135 = 0u;
              long long v136 = 0u;
              v64 = [(BMProcess *)v95 nonnullSetOfStringsForEntitlement:v98];
              uint64_t v65 = [v64 countByEnumeratingWithState:&v135 objects:v143 count:16];
              if (v65)
              {
                uint64_t v66 = *(void *)v136;
                do
                {
                  for (juint64_t j = 0; jj != v65; ++jj)
                  {
                    if (*(void *)v136 != v66) {
                      objc_enumerationMutation(v64);
                    }
                    [v63 setObject:&unk_1F0B42DA8 forKeyedSubscript:*(void *)(*((void *)&v135 + 1) + 8 * jj)];
                  }
                  uint64_t v65 = [v64 countByEnumeratingWithState:&v135 objects:v143 count:16];
                }
                while (v65);
              }
              uint64_t v94 = (uint64_t)v63;

              BMExpandBiomeStreamsPremigrationIdentifiersAccessModeDictionary(v63);
              v68 = objc_opt_new();
              v111[0] = MEMORY[0x1E4F143A8];
              v111[1] = 3221225472;
              v112[0] = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_3;
              v112[1] = &unk_1E6022AE0;
              id v23 = v68;
              id v113 = v23;
              [v63 enumerateKeysAndObjectsUsingBlock:v111];
              id v30 = v113;
              goto LABEL_96;
            }
            if (![v98 isEqual:@"com.apple.private.intelligenceplatform.views.read-only"])goto LABEL_34; {
            v69 = legacyViewResourceMapper();
            }
            uint64_t v94 = [v69 databaseForViewName];

            int v22 = (void *)v94;
            if (v94)
            {
              v70 = [(BMProcess *)v95 nonnullArrayForEntitlement:v98];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              id v23 = (id)objc_opt_new();
              if (isKindOfClass)
              {
                long long v137 = 0u;
                long long v138 = 0u;
                long long v135 = 0u;
                long long v136 = 0u;
                id v72 = v70;
                uint64_t v73 = [v72 countByEnumeratingWithState:&v135 objects:v143 count:16];
                if (v73)
                {
                  uint64_t v74 = *(void *)v136;
                  do
                  {
                    for (kuint64_t k = 0; kk != v73; ++kk)
                    {
                      if (*(void *)v136 != v74) {
                        objc_enumerationMutation(v72);
                      }
                      uint64_t v76 = *(void *)(*((void *)&v135 + 1) + 8 * kk);
                      v77 = (void *)MEMORY[0x1B3EB5880]();
                      v78 = (*(void (**)(uint64_t, uint64_t))(v94 + 16))(v94, v76);
                      if (v78)
                      {
                        v79 = [[BMResourceSpecifier alloc] initWithType:3 name:v78];
                        if (v79) {
                          [v23 setObject:&unk_1F0B42D90 forKeyedSubscript:v79];
                        }
                      }
                    }
                    uint64_t v73 = [v72 countByEnumeratingWithState:&v135 objects:v143 count:16];
                  }
                  while (v73);
                }

                id v30 = v72;
              }
              else
              {
                id v30 = v70;
              }
              goto LABEL_96;
            }
          }
          id v23 = (id)objc_opt_new();
LABEL_97:

LABEL_98:
          v105[0] = MEMORY[0x1E4F143A8];
          v105[1] = 3221225472;
          v105[2] = __44__BMAccessControlPolicy_authorizedResources__block_invoke;
          v105[3] = &unk_1E6022A10;
          id v106 = v88;
          [v23 enumerateKeysAndObjectsUsingBlock:v105];

          ++v96;
        }
        while (v96 != v86);
        uint64_t v80 = [obj countByEnumeratingWithState:&v107 objects:v118 count:16];
        uint64_t v86 = v80;
      }
      while (v80);
    }

    v81 = (NSDictionary *)[v88 copy];
    v82 = v90->_authorizedResources;
    v90->_authorizedResources = v81;

    BOOL v4 = v81;
  }
  else
  {
    BOOL v18 = self->_authorizedResources;
    BOOL v4 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v90->_authorizedResources = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
LABEL_149:
  os_unfair_lock_unlock(lock);
  return v4;
}

- (BMProcess)process
{
  return self->_process;
}

+ (BOOL)process:(id)a3 canActOnBehalfOfProcess:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 processType] != 4)
  {
    if ([v5 processType] != 5) {
      goto LABEL_9;
    }
    uint64_t v9 = [v6 processType];
    if ((unint64_t)(v9 - 1) < 3)
    {
      char v8 = 1;
      goto LABEL_10;
    }
    if (v9 != 8)
    {
LABEL_9:
      char v8 = 0;
      goto LABEL_10;
    }
LABEL_8:
    char v8 = os_variant_allows_internal_security_policies();
    goto LABEL_10;
  }
  uint64_t v7 = [v6 processType];
  if (v7 == 8) {
    goto LABEL_8;
  }
  char v8 = v7 == 1;
LABEL_10:

  return v8;
}

+ (id)policyForProcess:(id)a3 connectionFlags:(unint64_t)a4 onBehalfOfProcessWithAccessControlPolicy:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  uint64_t v11 = 0;
  if (a3 && v9)
  {
    unint64_t v12 = a4 | 1;
    id v13 = a3;
    id v14 = objc_alloc((Class)a1);
    uint64_t v15 = [v10 useCase];
    uint64_t v11 = (id *)[v14 initWithProcess:v13 connectionFlags:v12 useCase:v15];

    objc_storeStrong(v11 + 1, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_authorizedResources, 0);
  objc_storeStrong((id *)&self->_onBehalfOf, 0);
}

- (BOOL)allowsComputeSourceAccessToStream:(id)a3
{
  BOOL v4 = [a3 componentsSeparatedByString:@":"];
  id v5 = [v4 firstObject];

  process = self->_process;
  if (process
    && ([(BMProcess *)process identifier],
        (id)objc_claimAutoreleasedReturnValue(),
        BMIdentifierIsPathSafe(v5)))
  {
    BOOL v7 = 1;
    switch([(BMProcess *)self->_process processType])
    {
      case 0uLL:
      case 5uLL:
        goto LABEL_4;
      case 2uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 3uLL:
        id v9 = BMSyncableStreamIdentifiers();
        char v10 = [v9 containsObject:v5];

        if ((v10 & 1) == 0) {
          goto LABEL_8;
        }
        BOOL v7 = 1;
        break;
      case 4uLL:
        onBehalfOf = self->_onBehalfOf;
        if (!onBehalfOf) {
          goto LABEL_4;
        }
        char v11 = [(BMAccessControlPolicy *)onBehalfOf allowsComputeSourceAccessToStream:v5];
        goto LABEL_12;
      case 8uLL:
        char v11 = os_variant_allows_internal_security_policies();
        goto LABEL_12;
      default:
LABEL_8:
        char v11 = [(BMAccessControlPolicy *)self allowsAccessToStream:v5 withMode:2];
LABEL_12:
        BOOL v7 = v11;
        break;
    }
  }
  else
  {
LABEL_4:
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)descriptionOfProcessAndUseCase
{
  BOOL v3 = [(NSString *)self->_useCase hasPrefix:@"__"];
  id v4 = [NSString alloc];
  uint64_t v5 = [(BMProcess *)self->_process executableName];
  id v6 = (void *)v5;
  if (v3) {
    uint64_t v7 = [v4 initWithFormat:@"'%@'", v5, v10];
  }
  else {
    uint64_t v7 = [v4 initWithFormat:@"'%@' use case '%@'", v5, self->_useCase];
  }
  char v8 = (void *)v7;

  return (NSString *)v8;
}

- (BOOL)allowsConnectionToComputeSourceService
{
  process = self->_process;
  if (process)
  {
    [(BMProcess *)process identifier];

    [(BMProcess *)self->_process processType];
    LOBYTE(process) = -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.read-write")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.write-only")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.writer")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.pruner")|| os_variant_allows_internal_security_policies()&& (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:",
                         @"com.apple.internal.biome.read-write")
                    || [(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.write-only"]|| [(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.writer"]|| [(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.pruner"]);
  }
  return (char)process;
}

- (BOOL)allowsAccessToSetStoreUpdateServiceForSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BMProcess *)self->_process identifier];

  if (!v5) {
    goto LABEL_4;
  }
  unint64_t v6 = [(BMProcess *)self->_process processType];
  if (v6 > 8) {
    goto LABEL_10;
  }
  if (((1 << v6) & 0x35) == 0)
  {
    if (v6 == 3)
    {
      BOOL v7 = 1;
      goto LABEL_5;
    }
    if (v6 == 8)
    {
      char v9 = os_variant_allows_internal_security_policies();
LABEL_11:
      BOOL v7 = v9;
      goto LABEL_5;
    }
LABEL_10:
    char v9 = [(BMAccessControlPolicy *)self allowsAccessToSet:v4 withMode:3];
    goto LABEL_11;
  }
LABEL_4:
  BOOL v7 = 0;
LABEL_5:

  return v7;
}

- (BOOL)allowsAccessToSet:(id)a3 withMode:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  char v8 = 0;
  if (a4 && self->_process)
  {
    if (BMIdentifierIsPathSafe(v6))
    {
      char v8 = 1;
      switch([(BMProcess *)self->_process processType])
      {
        case 0uLL:
        case 4uLL:
          goto LABEL_5;
        case 2uLL:
        case 3uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 5uLL:
          onBehalfOf = self->_onBehalfOf;
          if (!onBehalfOf
            || ![(BMAccessControlPolicy *)onBehalfOf allowsAccessToSet:v7 withMode:3])
          {
            goto LABEL_5;
          }
          break;
        case 8uLL:
          char v8 = os_variant_allows_internal_security_policies();
          break;
        default:
          uint64_t v10 = [(BMAccessControlPolicy *)self explicitlyAuthorizedResourcesOfType:4 withAccessMode:a4];
          char v8 = [v10 containsObject:v7];

          break;
      }
    }
    else
    {
LABEL_5:
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)allowsConnectionToSetStoreUpdateService
{
  BOOL v3 = [(BMProcess *)self->_process identifier];

  if (v3) {
    [(BMProcess *)self->_process processType];
  }
  return 0;
}

- (BOOL)allowsConnectionToWriteService
{
  BOOL v3 = [(BMProcess *)self->_process identifier];

  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(BMProcess *)self->_process processType];
  if (v4 - 2 < 4 || v4 == 0) {
    return 0;
  }
  if (v4 != 8) {
    return [(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.private.biome.write-only"]|| os_variant_allows_internal_security_policies()&& [(BMProcess *)self->_process hasNonEmptyArrayForEntitlement:@"com.apple.internal.biome.write-only"];
  }
  return os_variant_allows_internal_security_policies();
}

- (unint64_t)allowedModeForStream:(id)a3
{
  id v4 = a3;
  if ([v4 hasSuffix:@":subscriptions"])
  {
    if ([(BMProcess *)self->_process processType] == 2)
    {
      unint64_t v5 = 3;
      goto LABEL_12;
    }
    if ([(BMAccessControlPolicy *)self allowsAccessToStream:v4 withMode:3]
      || [(BMAccessControlPolicy *)self allowsAccessToStream:v4 withMode:2])
    {
      unint64_t v5 = 1;
      goto LABEL_12;
    }
LABEL_11:
    unint64_t v5 = 0;
    goto LABEL_12;
  }
  unint64_t v5 = 3;
  if (![(BMAccessControlPolicy *)self allowsAccessToStream:v4 withMode:3])
  {
    unint64_t v5 = 1;
    if (![(BMAccessControlPolicy *)self allowsAccessToStream:v4 withMode:1])
    {
      unint64_t v5 = 2;
      if (![(BMAccessControlPolicy *)self allowsAccessToStream:v4 withMode:2]) {
        goto LABEL_11;
      }
    }
  }
LABEL_12:

  return v5;
}

+ (void)setLegacyViewResourceMappingCallback:(id)a3
{
  id v3 = a3;
  legacyViewResourceMapper();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setDatabaseForViewName:v3];
}

- (BMAccessControlPolicy)init
{
  return 0;
}

- (BOOL)allowsAccessToDatabase:(id)a3 withMode:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  char v8 = 0;
  if (a4 && self->_process)
  {
    if (BMIdentifierIsPathSafe(v6))
    {
      char v8 = 1;
      switch([(BMProcess *)self->_process processType])
      {
        case 0uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
          goto LABEL_5;
        case 2uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 8uLL:
          char v8 = os_variant_allows_internal_security_policies();
          break;
        default:
          uint64_t v10 = [(BMAccessControlPolicy *)self explicitlyAuthorizedResourcesOfType:3 withAccessMode:a4];
          char v8 = [v10 containsObject:v7];

          break;
      }
    }
    else
    {
LABEL_5:
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)allowsAccessToView:(id)a3 withMode:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  char v8 = 0;
  if (a4 && self->_process)
  {
    if (BMIdentifierIsPathSafe(v6))
    {
      char v8 = 1;
      switch([(BMProcess *)self->_process processType])
      {
        case 0uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
          goto LABEL_5;
        case 2uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 8uLL:
          char v8 = os_variant_allows_internal_security_policies();
          break;
        default:
          uint64_t v10 = [(BMAccessControlPolicy *)self explicitlyAuthorizedResourcesOfType:2 withAccessMode:a4];
          char v8 = [v10 containsObject:v7];

          break;
      }
    }
    else
    {
LABEL_5:
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)allowsAccessToSync
{
  process = self->_process;
  if (process)
  {
    process = [(BMProcess *)process processType];
    if (process) {
      LOBYTE(process) = [(BMProcess *)self->_process processType] == 3
    }
                     || os_variant_allows_internal_security_policies()
                     && [(BMProcess *)self->_process processType] == 8;
  }
  return (char)process;
}

- (BOOL)allowsAccessToSetsWithMode:(unint64_t)a3
{
  process = self->_process;
  if (process)
  {
    [(BMProcess *)process processType];
    LOBYTE(process) = 0;
  }
  return (char)process;
}

- (BOOL)allowsConnectionToComputePublisherService
{
  id v3 = [(BMProcess *)self->_process identifier];

  BOOL result = 0;
  if (v3)
  {
    [(BMProcess *)self->_process processType];
    if (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.read-write")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.read-only")|| -[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", @"com.apple.private.intelligenceplatform.use-cases")|| os_variant_allows_internal_security_policies()&& (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.internal.biome.read-write")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:",
            @"com.apple.internal.biome.read-only")
       || [(BMProcess *)self->_process hasNonEmptyDictionaryForEntitlement:@"com.apple.internal.intelligenceplatform.use-cases"]))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)allowsComputePublisherAccessToStreams:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  process = self->_process;
  if (process)
  {
    id v6 = [(BMProcess *)process identifier];

    if (v6)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v4 = v4;
      uint64_t v7 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v4);
            }
            if (!BMIdentifierIsPathSafe(*(void **)(*((void *)&v22 + 1) + 8 * i)))
            {

              goto LABEL_24;
            }
          }
          uint64_t v8 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      LOBYTE(v6) = 1;
      switch([(BMProcess *)self->_process processType])
      {
        case 0uLL:
        case 4uLL:
        case 5uLL:
          goto LABEL_24;
        case 2uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 3uLL:
          char v11 = BMSyncableStreamIdentifiers();
          unint64_t v12 = objc_msgSend(v4, "bm_setBySubtractingSet:", v11);

          if ([v12 count])
          {
            id v4 = v12;
LABEL_14:
            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            id v4 = v4;
            uint64_t v13 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v19;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v19 != v15) {
                    objc_enumerationMutation(v4);
                  }
                  if (!-[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", *(void *)(*((void *)&v18 + 1) + 8 * j), 1, (void)v18))
                  {
                    LOBYTE(v6) = 0;
                    goto LABEL_28;
                  }
                }
                uint64_t v14 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
              }
              while (v14);
            }
            LOBYTE(v6) = 1;
LABEL_28:

            break;
          }
          LOBYTE(v6) = 1;
          id v4 = v12;
          break;
        case 8uLL:
          LOBYTE(v6) = os_variant_allows_internal_security_policies();
          break;
        default:
          goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_24:
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (BOOL)allowsProxyingBiomeEndpoint
{
  id v3 = [(BMProcess *)self->_process identifier];
  if ([v3 isEqual:@"com.apple.coreduetd"])
  {
  }
  else
  {
    id v4 = [(BMProcess *)self->_process identifier];
    int v5 = [v4 isEqual:@"com.apple.knowledge-agent"];

    if (!v5) {
      return 0;
    }
  }
  process = self->_process;
  return [(BMProcess *)process BOOLForEntitlement:@"com.apple.rootless.storage.coreduet_knowledge_store"];
}

- (void)_warnAboutInternalEntitlement:(id)a3 streamIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v8 = [(BMProcess *)self->_process executablePath];
    if (([v8 containsString:@"/usr/local/"] & 1) == 0
      && ([v8 containsString:@"/usr/appleinternal/"] & 1) == 0
      && ([v8 containsString:@"/AppleInternal/"] & 1) == 0)
    {
      uint64_t v9 = __biome_log_for_category(6);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        id v11 = v7;
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_impl(&dword_1B30A0000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: utilizing internal-only policy to allow access to '%{public}@' via entitlement '%{public}@'", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

+ (id)contextSyncMapping
{
  return &unk_1F0B43508;
}

- (BOOL)allowsAccessToContextSyncStreams:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[BMAccessControlPolicy contextSyncMapping];
  id v6 = (void *)[v4 mutableCopy];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v13 = [v5 objectForKeyedSubscript:v12];

        if (!v13)
        {
          long long v23 = __biome_log_for_category(6);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B30A0000, v23, OS_LOG_TYPE_INFO, "allowsAccessToContextSyncStreams: set is not exclusively ContextSync.LOI", buf, 2u);
          }

          goto LABEL_33;
        }
        uint64_t v14 = [v5 objectForKeyedSubscript:v12];
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  process = self->_process;
  if (!process)
  {
    long long v24 = __biome_log_for_category(6);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    long long v25 = "allowsAccessToContextSyncStreams: _process == nil";
    goto LABEL_31;
  }
  v16 = [(BMProcess *)process identifier];

  if (v16)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v38;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v17);
          }
          if ((BMIdentifierIsPathSafe(*(void **)(*((void *)&v37 + 1) + 8 * j)) & 1) == 0)
          {
            uint64_t v26 = __biome_log_for_category(6);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B30A0000, v26, OS_LOG_TYPE_INFO, "allowsAccessToContextSyncStreams: !BMStreamIdentifierIsPathSafe(streamIdentifier)", buf, 2u);
            }

            goto LABEL_33;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    char v22 = 1;
    switch([(BMProcess *)self->_process processType])
    {
      case 0uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_33;
      case 2uLL:
      case 3uLL:
        goto LABEL_34;
      case 8uLL:
        char v22 = os_variant_allows_internal_security_policies();
        goto LABEL_34;
      default:
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v28 = v7;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:v46 count:16];
        if (!v29) {
          goto LABEL_43;
        }
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v34;
        break;
    }
    while (2)
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v28);
        }
        if (!-[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", *(void *)(*((void *)&v33 + 1) + 8 * k), 1, (void)v33))
        {
          char v22 = 0;
          goto LABEL_45;
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v33 objects:v46 count:16];
      if (v30) {
        continue;
      }
      break;
    }
LABEL_43:
    char v22 = 1;
LABEL_45:

    goto LABEL_34;
  }
  long long v24 = __biome_log_for_category(6);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    long long v25 = "allowsAccessToContextSyncStreams: !_process.identifier";
LABEL_31:
    _os_log_impl(&dword_1B30A0000, v24, OS_LOG_TYPE_INFO, v25, buf, 2u);
  }
LABEL_32:

LABEL_33:
  char v22 = 0;
LABEL_34:

  return v22;
}

- (BOOL)allowsAccessToContextSync
{
  if ([(BMProcess *)self->_process processType] == 2
    || [(BMProcess *)self->_process processType] == 3)
  {
    return 1;
  }
  unint64_t v4 = [(BMProcess *)self->_process processType];
  if (v4 > 8) {
    return -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.read-write")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.read-only")|| -[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", @"com.apple.private.intelligenceplatform.use-cases")|| os_variant_allows_internal_security_policies()&& (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.internal.biome.read-write")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:",
  }
              @"com.apple.internal.biome.read-only")
         || [(BMProcess *)self->_process hasNonEmptyDictionaryForEntitlement:@"com.apple.internal.intelligenceplatform.use-cases"]);
  if (((1 << v4) & 0xF1) != 0) {
    return 0;
  }
  if (((1 << v4) & 0xC) != 0) {
    return 1;
  }
  if (v4 != 8) {
    return -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.read-write")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.private.biome.read-only")|| -[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", @"com.apple.private.intelligenceplatform.use-cases")|| os_variant_allows_internal_security_policies()&& (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", @"com.apple.internal.biome.read-write")|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:",
  }
              @"com.apple.internal.biome.read-only")
         || [(BMProcess *)self->_process hasNonEmptyDictionaryForEntitlement:@"com.apple.internal.intelligenceplatform.use-cases"]);
  return os_variant_allows_internal_security_policies();
}

- (BOOL)allowsAccessToWriteServiceForStream:(id)a3 ofUser:(unsigned int)a4
{
  id v5 = a3;
  if (([v5 hasSuffix:@":subscriptions"] & 1) != 0
    || ([v5 hasSuffix:@":tombstones"] & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    id v6 = [(BMProcess *)self->_process identifier];

    if (v6)
    {
      unint64_t v8 = [(BMProcess *)self->_process processType];
      LOBYTE(v6) = 0;
      if (v8 - 2 >= 4)
      {
        if (v8)
        {
          if (v8 == 8)
          {
            LOBYTE(v6) = os_variant_allows_internal_security_policies();
          }
          else
          {
            uint64_t v9 = [(BMAccessControlPolicy *)self explicitlyAuthorizedResourcesOfType:1 withAccessMode:2];
            LOBYTE(v6) = [v9 containsObject:v5];
          }
        }
      }
    }
  }

  return (char)v6;
}

- (BOOL)allowsAccessToBiomeAgentForUser:(unsigned int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [(BMProcess *)self->_process identifier];

  if (!v5) {
    goto LABEL_15;
  }
  unsigned int v6 = [(BMProcess *)self->_process uid];
  if (a3 < 0x1F5 || v6 >= 0x1F5)
  {
    uint64_t v10 = __biome_log_for_category(6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BMAccessControlPolicy(DaemonToAgent) allowsAccessToBiomeAgentForUser:](v10);
    }

    goto LABEL_15;
  }
  unint64_t v7 = [(BMProcess *)self->_process processType];
  if (v7 - 2 < 6 || v7 == 0)
  {
LABEL_15:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (v7 != 8)
  {
    uint64_t v12 = objc_opt_new();
    id v13 = [(BMAccessControlPolicy *)self explicitlyAuthorizedResourcesOfType:1 withAccessMode:2];
    [v12 unionSet:v13];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = v12;
    uint64_t v11 = [v14 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v15 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v14);
          }
          if (!BMServiceDomainForStream(2, *(void **)(*((void *)&v17 + 1) + 8 * i)))
          {
            LOBYTE(v11) = 1;
            goto LABEL_27;
          }
        }
        uint64_t v11 = [v14 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_27:

    return v11;
  }
  return os_variant_allows_internal_security_policies();
}

- (BOOL)allowsAccessToProxyBiomeAgentEndpoint
{
  id v3 = [(BMProcess *)self->_process identifier];

  if (!v3
    || [(BMProcess *)self->_process processType] != 2
    || ![(NSString *)self->_useCase isEqual:@"__proxy__"])
  {
    return 0;
  }
  unint64_t v4 = [(BMProcess *)self->_process identifier];
  char v5 = [v4 isEqual:@"com.apple.biomed"];

  return v5;
}

+ (void)policyForProcess:(os_log_t)log connectionFlags:useCase:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B30A0000, log, OS_LOG_TYPE_FAULT, "Internal error: on-behalf-of connections must use different initializer", v1, 2u);
}

- (void)allowsConnectionToAccessServiceWithDomain:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  unint64_t v4 = [(id)OUTLINED_FUNCTION_2((uint64_t)a1) executableName];
  [*a1 pid];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_FAULT, "Process %{public}@(%d) is not allowed to have datavault entitlement", v5, 0x12u);
}

- (void)allowsConnectionToAccessServiceWithDomain:(id *)a1 .cold.2(id *a1, NSObject *a2)
{
  unint64_t v4 = [(id)OUTLINED_FUNCTION_2((uint64_t)a1) executableName];
  [*a1 pid];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Process %{public}@(%d) is utilizing temporary coreduet exception to access Biome", v5, 0x12u);
}

- (void)allowsConnectionToAccessServiceWithDomain:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  id v3 = [(id)OUTLINED_FUNCTION_2(a1) identifier];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Utilizing temporary exception to allow %@ access to Biome", (uint8_t *)&v4, 0xCu);
}

- (void)allowsAccessToStream:(uint64_t)a1 withMode:.cold.1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_2(a1) identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1B30A0000, v2, v3, "Utilizing temporary exception to allow %{public}@ access to %{public}@", v4, v5, v6, v7, v8);
}

@end