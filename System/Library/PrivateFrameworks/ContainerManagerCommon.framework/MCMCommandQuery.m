@interface MCMCommandQuery
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_executeQueryPlan:(id)a3 resultContainers:(id)a4 error:(id *)a5;
- (BOOL)createIfNecessary;
- (BOOL)expectSingleResult;
- (BOOL)extensionsPolicyUsesProxiedClient;
- (BOOL)extensionsUseProxiedClient;
- (BOOL)fuzzyMatchInternalUUID;
- (BOOL)fuzzyMatchTransient;
- (BOOL)includeCreator;
- (BOOL)includeInfoInResult;
- (BOOL)includePathInResult;
- (BOOL)includeUnowned;
- (BOOL)includeUserManagedAssetsRelPath;
- (BOOL)issueSandboxExtensions;
- (BOOL)legacyExtensionPolicy;
- (BOOL)legacyPersonaPolicy;
- (BOOL)preflightClientAllowed;
- (BOOL)transient;
- (MCMCommandQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerConfiguration)containerConfig;
- (MCMUserIdentity)userIdentity;
- (NSSet)groupIdentifiers;
- (NSSet)identifiers;
- (NSUUID)internalUUID;
- (id)_containerIdentifiersIncludingUnownedForContainerClass:(unint64_t)a3 canAccessAllContainers:(BOOL *)a4 error:(id *)a5;
- (id)_executeQueryForContainerIdentity:(id)a3 error:(id *)a4;
- (id)_queryPlanWithIdentifiers:(id)a3 isGroupClass:(BOOL)a4 clientIdentity:(id)a5 error:(id *)a6;
- (id)_setOfUserIdentities;
- (id)_setOfUserIdentitiesForIdentifiers:(id)a3 isGroupClass:(BOOL)a4;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)expectedPersonaKernelID;
- (unsigned)platform;
- (unsigned)uid;
- (void)_finalizeWithContainers:(id)a3 error:(id)a4;
- (void)execute;
@end

@implementation MCMCommandQuery

- (BOOL)preflightClientAllowed
{
  if (![(MCMCommandQuery *)self includeUserManagedAssetsRelPath]) {
    return 1;
  }
  v3 = [(MCMCommand *)self context];
  v4 = [v3 clientIdentity];
  char v5 = [v4 isAllowedToAccessUserAssets];

  return v5;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (void)_finalizeWithContainers:(id)a3 error:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (MCMError *)a4;
  v8 = v7;
  if ([(MCMCommandQuery *)self expectSingleResult])
  {
    v8 = v7;
    if ((unint64_t)[v6 count] >= 2)
    {
      v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v45 = [v6 count];
        _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Query expects single result but found %lu; returning CONTAINER_ERROR_AMBIGUOUS_RESULT",
          buf,
          0xCu);
      }

      [v6 removeAllObjects];
      v8 = [[MCMError alloc] initWithErrorType:114 category:3];
    }
  }
  v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v45 = v11;
    __int16 v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "Query result: count = %lu, error = %@", buf, 0x16u);
  }

  v12 = [(MCMCommand *)self context];
  v13 = [v12 clientIdentity];
  v14 = [v13 codeSignInfo];
  v15 = [v14 identifier];
  if ([v15 isEqual:@"com.apple.ContainerManagerTest"]) {
    goto LABEL_17;
  }
  id v16 = v6;
  v17 = [(MCMCommandQuery *)self containerConfig];
  if (([v17 containerClass] & 0xFFFFFFFFFFFFFFFELL) != 0xC)
  {

    id v6 = v16;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v18 = [(MCMCommandQuery *)self createIfNecessary];

  id v6 = v16;
  if (v18 && v8)
  {
    if ([(MCMError *)v8 type] != 55)
    {
      v19 = container_log_handle_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v43 = [(MCMCommandQuery *)self containerConfig];
        v31 = [v43 name];
        v32 = [(MCMCommandQuery *)self groupIdentifiers];
        uint64_t v33 = [(MCMError *)v8 type];
        v34 = [(MCMCommand *)self context];
        v35 = [v34 clientIdentity];
        *(_DWORD *)buf = 138413314;
        uint64_t v45 = (uint64_t)v31;
        __int16 v46 = 2114;
        v47 = v32;
        __int16 v48 = 2048;
        uint64_t v49 = v33;
        id v6 = v16;
        __int16 v50 = 2114;
        v51 = v8;
        __int16 v52 = 2114;
        v53 = v35;
        _os_log_fault_impl(&dword_1D7739000, v19, OS_LOG_TYPE_FAULT, "System container lookup failed, class = %@, identifier = %{public}@, error = (%llu)%{public}@, client = %{public}@", buf, 0x34u);
      }
    }
    goto LABEL_19;
  }
LABEL_18:
  if (!v8)
  {
    v41 = [MCMResultQuery alloc];
    v40 = (void *)[v6 copy];
    v42 = [(MCMCommand *)self context];
    v21 = [v42 clientIdentity];
    BOOL v39 = [(MCMCommandQuery *)self issueSandboxExtensions];
    BOOL v38 = [(MCMCommandQuery *)self includePathInResult];
    BOOL v37 = [(MCMCommandQuery *)self includeInfoInResult];
    v22 = v7;
    BOOL v23 = [(MCMCommandQuery *)self legacyPersonaPolicy];
    BOOL v24 = [(MCMCommandQuery *)self legacyExtensionPolicy];
    id v25 = v6;
    BOOL v26 = [(MCMCommandQuery *)self includeUserManagedAssetsRelPath];
    BOOL v27 = [(MCMCommandQuery *)self includeCreator];
    BOOL v28 = [(MCMCommandQuery *)self extensionsUseProxiedClient];
    BYTE4(v36) = [(MCMCommandQuery *)self extensionsPolicyUsesProxiedClient];
    BYTE3(v36) = v28;
    BYTE2(v36) = v27;
    BYTE1(v36) = v26;
    id v6 = v25;
    LOBYTE(v36) = v24;
    BOOL v29 = v23;
    v7 = v22;
    v20 = -[MCMResultQuery initWithContainers:clientIdentity:issueSandboxExtensions:includePath:includeInfo:legacyPersonaPolicy:legacyExtensionPolicy:includeUserManagedAssetsRelPath:includeCreator:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:](v41, "initWithContainers:clientIdentity:issueSandboxExtensions:includePath:includeInfo:legacyPersonaPolicy:legacyExtensionPolicy:includeUserManagedAssetsRelPath:includeCreator:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:", v40, v21, v39, v38, v37, v29, v36);

    goto LABEL_21;
  }
LABEL_19:
  v20 = [(MCMResultBase *)[MCMResultQuery alloc] initWithError:v8];
LABEL_21:
  v30 = [(MCMCommand *)self resultPromise];
  [v30 completeWithResult:v20];
}

- (id)_executeQueryForContainerIdentity:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(MCMCommand *)self context];
  v8 = [v7 containerFactory];
  id v17 = 0;
  v9 = objc_msgSend(v8, "containerForContainerIdentity:createIfNecessary:error:", v6, -[MCMCommandQuery createIfNecessary](self, "createIfNecessary"), &v17);

  id v10 = v17;
  if (!v9)
  {
    if (!v10 || [v10 type] == 21)
    {

      id v13 = 0;
      v12 = 0;
      goto LABEL_21;
    }
    v12 = 0;
LABEL_18:
    id v13 = v10;
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t v11 = container_log_handle_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_debug_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEBUG, "Found %@", buf, 0xCu);
  }

  if (![(MCMCommandQuery *)self includeInfoInResult]
    && ![(MCMCommandQuery *)self includeUserManagedAssetsRelPath]
    && ![(MCMCommandQuery *)self includeCreator])
  {
    v12 = [v9 metadataMinimal];
    goto LABEL_18;
  }
  id v16 = v10;
  v12 = [v9 metadataWithError:&v16];
  id v13 = v16;

  if (!v12)
  {
    v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch metadata; container = %@, error = %@",
        buf,
        0x16u);
    }

    v12 = 0;
  }
  if (a4)
  {
LABEL_19:
    if (v13)
    {
      id v13 = v13;
      *a4 = v13;
    }
  }
LABEL_21:

  return v12;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeInfoInResult
{
  return self->_includeInfoInResult;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (BOOL)legacyPersonaPolicy
{
  return self->_legacyPersonaPolicy;
}

void __26__MCMCommandQuery_execute__block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v10;
    _os_log_debug_impl(&dword_1D7739000, v2, OS_LOG_TYPE_DEBUG, "Fetching metadata for container [%@]", buf, 0xCu);
  }

  v3 = (void *)a1[5];
  id v11 = 0;
  uint64_t v4 = [v3 metadataWithError:&v11];
  id v5 = v11;
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = *(void *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (BOOL)legacyExtensionPolicy
{
  return self->_legacyExtensionPolicy;
}

- (BOOL)issueSandboxExtensions
{
  return self->_issueSandboxExtensions;
}

- (BOOL)includePathInResult
{
  return self->_includePathInResult;
}

- (BOOL)extensionsUseProxiedClient
{
  return self->_extensionsUseProxiedClient;
}

- (BOOL)extensionsPolicyUsesProxiedClient
{
  return self->_extensionsPolicyUsesProxiedClient;
}

- (BOOL)expectSingleResult
{
  return self->_expectSingleResult;
}

- (MCMCommandQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCMCommandQuery;
  v9 = [(MCMCommand *)&v21 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    v9->_platform = [v8 platform];
    v9->_explicitFlags = [v8 explicitFlags];
    uint64_t v10 = [v8 identifiers];
    identifiers = v9->_identifiers;
    v9->_identifiers = (NSSet *)v10;

    uint64_t v12 = [v8 containerConfig];
    containerConfig = v9->_containerConfig;
    v9->_containerConfig = (MCMContainerConfiguration *)v12;

    uint64_t v14 = [v8 groupIdentifiers];
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v14;

    uint64_t v16 = [v8 internalUUID];
    internalUUID = v9->_internalUUID;
    v9->_internalUUID = (NSUUID *)v16;

    v9->_extensionsUseProxiedClient = [v8 extensionsUseProxiedClient];
    v9->_extensionsPolicyUsesProxiedClient = [v8 extensionsPolicyUsesProxiedClient];
    v9->_createIfNecessary = [v8 createIfNecessary];
    v9->_includeInfoInResult = [v8 includeInfoInResult];
    v9->_includePathInResult = [v8 includePathInResult];
    v9->_uid = [v8 uid];
    uint64_t v18 = [v8 userIdentity];
    userIdentity = v9->_userIdentity;
    v9->_userIdentity = (MCMUserIdentity *)v18;

    v9->_transient = [v8 transient];
    v9->_fuzzyMatchTransient = [v8 fuzzyMatchTransient];
    v9->_fuzzyMatchInternalUUID = [v8 fuzzyMatchInternalUUID];
    v9->_includeUnowned = [v8 includeUnowned];
    v9->_expectSingleResult = [v8 expectSingleResult];
    v9->_legacyPersonaPolicy = [v8 legacyPersonaPolicy];
    v9->_legacyExtensionPolicy = [v8 legacyExtensionPolicy];
    v9->_includeUserManagedAssetsRelPath = [v8 includeUserManagedAssetsRelPath];
    v9->_includeCreator = [v8 includeCreator];
    if (v9->_legacyExtensionPolicy
      && v9->_includeUnowned
      && ![(NSSet *)v9->_identifiers count]
      && ![(NSSet *)v9->_groupIdentifiers count])
    {
      v9->_issueSandboxExtensions = 0;
    }
    else
    {
      v9->_issueSandboxExtensions = [v8 issueSandboxExtensions];
    }
  }

  return v9;
}

- (void)execute
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  v3 = [(MCMCommandQuery *)self containerConfig];
  uint64_t v4 = [v3 containerClass];

  id v5 = [(MCMCommand *)self context];
  __int16 v50 = [v5 clientIdentity];

  BOOL v6 = v4 == 13 || v4 == 7;
  BOOL v48 = v6;
  if (v4 == 7 || v4 == 13)
  {
    uint64_t v7 = [(MCMCommandQuery *)self groupIdentifiers];
  }
  else
  {
    uint64_t v7 = [(MCMCommandQuery *)self identifiers];
  }
  id v8 = (void *)v7;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__9188;
  v69 = __Block_byref_object_dispose__9189;
  id v70 = 0;
  v51 = [MEMORY[0x1E4F1CA48] array];
  char v64 = 0;
  __int16 v52 = [v50 codeSignInfo];
  if (([v52 isSigned] & 1) == 0)
  {
    uint64_t v13 = [[MCMError alloc] initWithErrorType:98 category:3];
LABEL_14:
    id v14 = (id)v66[5];
    v66[5] = (uint64_t)v13;
LABEL_15:

    goto LABEL_16;
  }
  if (v8)
  {
LABEL_10:
    v9 = (void *)MEMORY[0x1D9478DF0]();
    uint64_t v10 = (id *)(v66 + 5);
    obuint64_t j = (id)v66[5];
    id v11 = [(MCMCommandQuery *)self _queryPlanWithIdentifiers:v8 isGroupClass:v48 clientIdentity:v50 error:&obj];
    objc_storeStrong(v10, obj);
    if (v11)
    {
      uint64_t v12 = (id *)(v66 + 5);
      id v59 = (id)v66[5];
      [(MCMCommandQuery *)self _executeQueryPlan:v11 resultContainers:v51 error:&v59];
      objc_storeStrong(v12, v59);
    }

    goto LABEL_16;
  }
  if (v4 == 13 || v4 == 7)
  {
    v15 = [(MCMCommandQuery *)self identifiers];
    BOOL v16 = [v15 count] == 0;

    if (!v16)
    {
      id v17 = [(MCMCommandQuery *)self identifiers];
      char v18 = [v50 isAllowedToLookupGroupContainersOfClass:v4 ownedByIdentifiers:v17];

      if ((v18 & 1) == 0)
      {
        uint64_t v13 = [[MCMError alloc] initWithErrorType:55 category:3];
LABEL_40:
        id v8 = 0;
        goto LABEL_14;
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      v19 = [(MCMCommandQuery *)self identifiers];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v78 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v80;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v80 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v79 + 1) + 8 * i);
            BOOL v24 = +[MCMGroupManager defaultManager];
            id v25 = (id *)(v66 + 5);
            id v63 = (id)v66[5];
            BOOL v26 = [v24 groupContainerIdentifiersForOwnerIdentifier:v23 groupContainerClass:v4 codeSignInfo:v52 withError:&v63];
            objc_storeStrong(v25, v63);

            if (!v26)
            {

              goto LABEL_46;
            }
            [v14 unionSet:v26];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v78 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      uint64_t v27 = [v14 copy];
      goto LABEL_43;
    }
  }
  if (![(MCMCommandQuery *)self includeUnowned])
  {
    if (v4 == 13 || v4 == 7)
    {
      BOOL v29 = +[MCMGroupManager defaultManager];
      v30 = [v52 identifier];
      v31 = (id *)(v66 + 5);
      id v61 = (id)v66[5];
      id v8 = [v29 groupContainerIdentifiersForOwnerIdentifier:v30 groupContainerClass:v4 codeSignInfo:v52 withError:&v61];
      objc_storeStrong(v31, v61);

      if (v8) {
        goto LABEL_10;
      }
LABEL_16:
      [(MCMCommandQuery *)self _finalizeWithContainers:v51 error:v66[5]];
      goto LABEL_17;
    }
    v32 = (void *)MEMORY[0x1E4F1CAD0];
    id v14 = [v52 identifier];
    uint64_t v27 = [v32 setWithObject:v14];
LABEL_43:
    id v8 = (void *)v27;

    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
  BOOL v28 = (id *)(v66 + 5);
  id v62 = (id)v66[5];
  id v8 = [(MCMCommandQuery *)self _containerIdentifiersIncludingUnownedForContainerClass:v4 canAccessAllContainers:&v64 error:&v62];
  objc_storeStrong(v28, v62);
  if (!v8) {
    goto LABEL_16;
  }
  if ([v8 count]) {
    goto LABEL_10;
  }

LABEL_44:
  uint64_t v33 = [(MCMCommandQuery *)self groupIdentifiers];
  if (v33)
  {
    id v14 = (id)v33;
LABEL_46:
    id v8 = 0;
    goto LABEL_15;
  }
  if (!v64)
  {
    id v8 = 0;
    goto LABEL_16;
  }
  uint64_t v34 = [(MCMCommandQuery *)self _setOfUserIdentities];
  if (!v34)
  {
    uint64_t v13 = [[MCMError alloc] initWithErrorType:115 category:3];
    goto LABEL_40;
  }
  id v14 = (id)v34;
  v35 = [(MCMCommand *)self context];
  uint64_t v36 = [v35 containerCache];
  BOOL v37 = [(MCMCommandQuery *)self transient];
  BOOL v38 = (id *)(v66 + 5);
  id v58 = (id)v66[5];
  BOOL v39 = [v36 entriesForUserIdentities:v14 contentClass:v4 transient:v37 error:&v58];
  objc_storeStrong(v38, v58);

  if (![(MCMCommandQuery *)self includeInfoInResult]
    && ![(MCMCommandQuery *)self includeUserManagedAssetsRelPath]
    && ![(MCMCommandQuery *)self includeCreator])
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v43 = v39;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v72 objects:v71 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v73 != v45) {
            objc_enumerationMutation(v43);
          }
          v47 = [*(id *)(*((void *)&v72 + 1) + 8 * j) metadataMinimal];
          [v51 addObject:v47];
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v72 objects:v71 count:16];
      }
      while (v44);
    }

    goto LABEL_46;
  }
  v40 = container_log_handle_for_category();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v50;
    _os_log_impl(&dword_1D7739000, v40, OS_LOG_TYPE_INFO, "Query split into per-container ops since info or user managed assets path requested for all containers by client [%@]", buf, 0xCu);
  }

  v41 = [(MCMCommand *)self reply];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __26__MCMCommandQuery_execute__block_invoke;
  v53[3] = &unk_1E6A80248;
  id v42 = v39;
  id v54 = v42;
  v55 = self;
  id v56 = v51;
  v57 = &v65;
  [v41 handoffToSlowWorkloopforClientIdentity:v50 withBlock:v53];

  id v8 = 0;
LABEL_17:

  _Block_object_dispose(&v65, 8);
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (BOOL)_executeQueryPlan:(id)a3 resultContainers:(id)a4 error:(id *)a5
{
  v28[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MCMCommand *)self context];
  id v11 = [v10 clientIdentity];
  uint64_t v12 = [v11 codeSignInfo];
  uint64_t v13 = [v12 entitlements];

  if (![v8 count])
  {
    id v14 = 0;
    BOOL v24 = 1;
    goto LABEL_21;
  }
  BOOL v26 = a5;
  id v14 = 0;
  while (1)
  {
    v15 = objc_msgSend(v8, "firstObject", v26);
    [v8 removeObjectAtIndex:0];
    v28[0] = v14;
    BOOL v16 = [(MCMCommandQuery *)self _executeQueryForContainerIdentity:v15 error:v28];
    id v17 = v28[0];

    if (v16) {
      break;
    }
    if (v17) {
      goto LABEL_17;
    }
    if ([(MCMCommandQuery *)self fuzzyMatchTransient])
    {
      int v22 = [v15 transient];
      if (v22 == [(MCMCommandQuery *)self transient])
      {
        uint64_t v23 = objc_msgSend(v15, "identityByChangingTransient:", objc_msgSend(v15, "transient") ^ 1);
        [v8 addObject:v23];
      }
    }
    id v14 = 0;
LABEL_13:

    if (![v8 count])
    {
      BOOL v24 = 1;
      goto LABEL_18;
    }
  }
  char v18 = [(MCMCommandQuery *)self containerConfig];
  int v19 = [v18 supportsProtectedContainerWithRestrictedEntitlement];

  if (!v19)
  {
LABEL_7:
    [v9 addObject:v16];
    id v14 = v17;
    goto LABEL_13;
  }
  id v27 = v17;
  BOOL v20 = +[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier secureRestrictedContainerIfNeededWithMetadata:v16 entitlements:v13 error:&v27];
  id v21 = v27;

  if (v20)
  {
    id v17 = v21;
    goto LABEL_7;
  }

  id v17 = v21;
LABEL_17:

  BOOL v24 = 0;
  id v14 = v17;
LABEL_18:
  if (v26 && v14)
  {
    id v14 = v14;
    *BOOL v26 = v14;
  }
LABEL_21:

  return v24;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (BOOL)fuzzyMatchTransient
{
  return self->_fuzzyMatchTransient;
}

- (BOOL)includeUnowned
{
  return self->_includeUnowned;
}

- (id)_containerIdentifiersIncludingUnownedForContainerClass:(unint64_t)a3 canAccessAllContainers:(BOOL *)a4 error:(id *)a5
{
  v24[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = [(MCMCommand *)self context];
  id v9 = [v8 clientIdentity];

  uint64_t v10 = [v9 codeSignInfo];
  id v11 = [v10 entitlements];
  if (([v11 allowed] & 1) == 0 && !objc_msgSend(v11, "otherIDLookup"))
  {
    v15 = [v11 lookupForContainerClass:a3];
    BOOL v16 = v15;
    if (v15 && ![v15 count])
    {
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
      uint64_t v13 = 0;
      BOOL v14 = 1;
      goto LABEL_25;
    }
    switch(a3)
    {
      case 0xDuLL:
        goto LABEL_9;
      case 0xCuLL:
        if (![v11 hasSystemContainer])
        {
          if (!v16) {
            goto LABEL_24;
          }
          goto LABEL_20;
        }
        break;
      case 7uLL:
LABEL_9:
        id v17 = +[MCMGroupManager defaultManager];
        char v18 = [v10 identifier];
        v24[0] = 0;
        uint64_t v12 = [v17 groupContainerIdentifiersForOwnerIdentifier:v18 groupContainerClass:a3 codeSignInfo:v10 withError:v24];
        uint64_t v13 = (MCMError *)v24[0];

        if (![v12 count])
        {

          uint64_t v12 = 0;
        }
        if (v13)
        {
          BOOL v14 = 0;
LABEL_25:

          goto LABEL_26;
        }
LABEL_16:
        if (!v16) {
          goto LABEL_22;
        }
        if (v12)
        {
LABEL_21:
          id v21 = (void *)[v16 mutableCopy];
          [v21 unionSet:v12];
          uint64_t v22 = [v21 copy];

          uint64_t v12 = (void *)v22;
LABEL_22:
          if (v12)
          {
            BOOL v14 = 0;
            uint64_t v13 = 0;
            goto LABEL_25;
          }
LABEL_24:
          uint64_t v13 = [[MCMError alloc] initWithErrorType:55 category:3];
          BOOL v14 = 0;
          uint64_t v12 = 0;
          goto LABEL_25;
        }
LABEL_20:
        uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
        goto LABEL_21;
    }
    int v19 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v20 = [v10 identifier];
    uint64_t v12 = [v19 setWithObject:v20];

    goto LABEL_16;
  }
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v13 = 0;
  BOOL v14 = 1;
LABEL_26:
  *a4 = v14;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)_queryPlanWithIdentifiers:(id)a3 isGroupClass:(BOOL)a4 clientIdentity:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  uint64_t v13 = [(MCMCommandQuery *)self _setOfUserIdentitiesForIdentifiers:v10 isGroupClass:v8];
  if (![v13 count])
  {
    v15 = [[MCMError alloc] initWithErrorType:115 category:3];
    if (!v15) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v14 = v13;
  uint64_t v43 = [v14 countByEnumeratingWithState:&v66 objects:v65 count:16];
  v15 = 0;
  if (v43)
  {
    uint64_t v16 = *(void *)v67;
    v47 = a6;
    id v48 = v10;
    uint64_t v45 = v14;
    __int16 v46 = v13;
    __int16 v50 = v12;
    uint64_t v42 = *(void *)v67;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v67 != v16)
        {
          uint64_t v18 = v17;
          objc_enumerationMutation(v14);
          uint64_t v17 = v18;
        }
        v51 = v15;
        uint64_t v44 = v17;
        uint64_t v53 = *(void *)(*((void *)&v66 + 1) + 8 * v17);
        int v19 = objc_msgSend(v14, "objectForKeyedSubscript:");
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        obuint64_t j = v19;
        uint64_t v54 = [obj countByEnumeratingWithState:&v61 objects:v60 count:16];
        if (v54)
        {
          uint64_t v52 = *(void *)v62;
          while (2)
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v62 != v52) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * i);
              uint64_t v55 = 1;
              uint64_t v22 = [(MCMCommandQuery *)self internalUUID];
              if (v22
                && (uint64_t v23 = (void *)v22,
                    BOOL v24 = [(MCMCommandQuery *)self fuzzyMatchInternalUUID],
                    v23,
                    !v24))
              {
                id v25 = [(MCMCommandQuery *)self internalUUID];
                BOOL v28 = [(MCMCommandQuery *)self containerConfig];
                id v31 = v11;
                uint64_t v32 = [(MCMCommandQuery *)self platform];
                BOOL v33 = [(MCMCommandQuery *)self transient];
                BOOL v29 = [(MCMCommand *)self context];
                uint64_t v34 = [v29 userIdentityCache];
                uint64_t v35 = v32;
                id v11 = v31;
                v30 = +[MCMConcreteContainerIdentity containerIdentityWithUUID:v25 userIdentity:v53 identifier:v21 containerConfig:v28 platform:v35 transient:v33 userIdentityCache:v34 error:&v55];
              }
              else
              {
                id v25 = [(MCMCommandQuery *)self containerConfig];
                uint64_t v26 = [(MCMCommandQuery *)self platform];
                BOOL v27 = [(MCMCommandQuery *)self transient];
                BOOL v28 = [(MCMCommand *)self context];
                BOOL v29 = [v28 userIdentityCache];
                v30 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v53 identifier:v21 containerConfig:v25 platform:v26 transient:v27 userIdentityCache:v29 error:&v55];
              }

              if (v30)
              {
                if (![v11 isAllowedToLookupContainerIdentity:v30])
                {
                  BOOL v39 = [[MCMError alloc] initWithErrorType:55 category:3];

                  v15 = v39;
                  a6 = v47;
                  id v10 = v48;
                  id v14 = v45;
                  uint64_t v13 = v46;
                  uint64_t v12 = v50;
                  goto LABEL_28;
                }
                [v50 addObject:v30];
              }
              else
              {
                uint64_t v36 = [MCMError alloc];
                uint64_t v37 = [(MCMError *)v36 initWithErrorType:v55];

                BOOL v38 = container_log_handle_for_category();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v57 = self;
                  __int16 v58 = 2048;
                  uint64_t v59 = v55;
                  _os_log_error_impl(&dword_1D7739000, v38, OS_LOG_TYPE_ERROR, "Could not construct container identity from query; query = %@, error = %llu",
                    buf,
                    0x16u);
                }

                v51 = (MCMError *)v37;
              }
            }
            uint64_t v54 = [obj countByEnumeratingWithState:&v61 objects:v60 count:16];
            if (v54) {
              continue;
            }
            break;
          }
        }

        uint64_t v17 = v44 + 1;
        a6 = v47;
        id v10 = v48;
        id v14 = v45;
        uint64_t v13 = v46;
        uint64_t v12 = v50;
        v15 = v51;
        uint64_t v16 = v42;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [v45 countByEnumeratingWithState:&v66 objects:v65 count:16];
    }
    while (v43);
  }
LABEL_28:

  if (v15)
  {
LABEL_31:

    uint64_t v12 = 0;
    if (a6) {
      *a6 = v15;
    }
  }
LABEL_33:
  id v40 = v12;

  return v40;
}

- (BOOL)transient
{
  return self->_transient;
}

- (unsigned)platform
{
  return self->_platform;
}

- (NSUUID)internalUUID
{
  return self->_internalUUID;
}

- (id)_setOfUserIdentitiesForIdentifiers:(id)a3 isGroupClass:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  BOOL v8 = [(MCMCommand *)self context];
  uint64_t v9 = [v8 clientIdentity];

  v113 = (void *)v9;
  id v10 = (void *)v9;
  id v11 = self;
  uint64_t v12 = [v10 userIdentity];
  uint64_t v13 = container_log_handle_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v52 = [(MCMCommandQuery *)self userIdentity];
    uint64_t v53 = [v52 debugDescription];
    uint32_t multiuser_flags = 138412290;
    v136 = v53;
    _os_log_debug_impl(&dword_1D7739000, v13, OS_LOG_TYPE_DEBUG, "userIdentity: %@", (uint8_t *)&multiuser_flags, 0xCu);
  }
  id v14 = [(MCMCommandQuery *)v11 containerConfig];
  int v15 = [v14 usesGlobalBundleUserIdentity];

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = [(MCMCommand *)v11 context];
    uint64_t v18 = [v17 userIdentityCache];
    uint64_t v19 = [v18 globalBundleUserIdentity];
LABEL_7:
    uint64_t v22 = (void *)v19;
    uint64_t v23 = [v16 setWithObject:v19];

LABEL_8:
    if (!v23) {
      goto LABEL_17;
    }
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v24 = v23;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v121 objects:v120 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v122;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v122 != v27) {
            objc_enumerationMutation(v24);
          }
          [v7 setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v121 + 1) + 8 * i)];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v121 objects:v120 count:16];
      }
      while (v26);
    }
    goto LABEL_16;
  }
  BOOL v20 = [(MCMCommandQuery *)v11 containerConfig];
  int v21 = [v20 usesGlobalSystemUserIdentity];

  if (v21)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = [(MCMCommand *)v11 context];
    uint64_t v18 = [v17 userIdentityCache];
    uint64_t v19 = [v18 globalSystemUserIdentity];
    goto LABEL_7;
  }
  uint64_t v31 = [(MCMCommandQuery *)v11 userIdentity];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    BOOL v33 = [(MCMCommandQuery *)v11 userIdentity];
    int v34 = [v33 isNoSpecificPersona];

    if (!v34)
    {
      if (([v12 isNoSpecificPersona] & 1) == 0)
      {
        uint64_t v45 = [(MCMCommandQuery *)v11 userIdentity];
        int v46 = [v12 isEqual:v45];

        if (!v46)
        {
          id v56 = container_log_handle_for_category();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v95 = [v12 shortDescription];
            v96 = [(MCMCommandQuery *)v11 userIdentity];
            v97 = [v96 shortDescription];
            uint32_t multiuser_flags = 138412546;
            v136 = v95;
            __int16 v137 = 2112;
            uint64_t v138 = (uint64_t)v97;
            _os_log_error_impl(&dword_1D7739000, v56, OS_LOG_TYPE_ERROR, "Ambiguous persona, client has adopted %@ but asks for %@", (uint8_t *)&multiuser_flags, 0x16u);
          }
          goto LABEL_17;
        }
      }
      v47 = (void *)MEMORY[0x1E4F1CAD0];
      id v48 = [(MCMCommandQuery *)v11 userIdentity];
      uint64_t v23 = [v47 setWithObject:v48];

      uint64_t v17 = container_log_handle_for_category();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
      uint64_t v49 = [(MCMCommandQuery *)v11 userIdentity];
      __int16 v50 = [v49 shortDescription];
      uint32_t multiuser_flags = 138412290;
      v136 = v50;
      v51 = "Using explicit persona: %@";
LABEL_38:
      _os_log_debug_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEBUG, v51, (uint8_t *)&multiuser_flags, 0xCu);

      goto LABEL_8;
    }
  }
  uint32_t multiuser_flags = 0;
  host_t v35 = MEMORY[0x1D9478CB0]();
  if (!host_get_multiuser_config_flags(v35, &multiuser_flags) && (multiuser_flags & 0x80000000) != 0)
  {
    uint64_t v36 = [(MCMCommand *)v11 context];
    uint64_t v37 = [v36 clientIdentity];
    BOOL v38 = [v37 userIdentity];
    uint64_t v17 = [v38 posixUser];

    BOOL v39 = [(MCMCommand *)v11 context];
    id v40 = [v39 userIdentityCache];
    v41 = [v40 userIdentityForPersonalPersonaWithPOSIXUser:v17];

    uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v41];
    uint64_t v42 = container_log_handle_for_category();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      uint32_t multiuser_flags = 138412290;
      v136 = v41;
      _os_log_debug_impl(&dword_1D7739000, v42, OS_LOG_TYPE_DEBUG, "Using client persona: %@", (uint8_t *)&multiuser_flags, 0xCu);
    }

    goto LABEL_8;
  }
  if (![v12 isNoSpecificPersona])
  {
    uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    uint64_t v17 = container_log_handle_for_category();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v49 = [v113 userIdentity];
    __int16 v50 = [v49 shortDescription];
    uint32_t multiuser_flags = 138412290;
    v136 = v50;
    v51 = "Using client implicit persona: %@";
    goto LABEL_38;
  }
  if (![(MCMCommandQuery *)v11 legacyPersonaPolicy])
  {
    uint64_t v54 = [(MCMCommand *)v11 context];
    uint64_t v55 = [v54 userIdentityCache];
    uint64_t v23 = [v55 allAccessibleUserIdentities];

    uint64_t v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint32_t multiuser_flags = 138412290;
      v136 = v23;
      _os_log_debug_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEBUG, "Using all personas: %@", (uint8_t *)&multiuser_flags, 0xCu);
    }
    goto LABEL_8;
  }
  v112 = v11;
  if (!v4)
  {
    v105 = v12;
    v57 = objc_opt_new();
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    obuint64_t j = v6;
    __int16 v58 = v113;
    uint64_t v116 = [obj countByEnumeratingWithState:&v131 objects:v130 count:16];
    if (v116)
    {
      uint64_t v115 = *(void *)v132;
      do
      {
        uint64_t v59 = 0;
        do
        {
          if (*(void *)v132 != v115) {
            objc_enumerationMutation(obj);
          }
          v60 = *(void **)(*((void *)&v131 + 1) + 8 * v59);
          uint64_t v119 = 1;
          long long v61 = [(MCMCommandQuery *)v11 containerConfig];
          long long v62 = +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:](MCMXPCMessageBase, "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:", v60, v58, [v61 containerClass], &v119);

          if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
            dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
          }
          if (MCMRequirePersonaTelemetryOnly_result
            && v119 != 1
            && [v62 isNoSpecificPersona])
          {
            long long v63 = container_log_handle_for_category();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
            {
              v110 = [v58 codeSignInfo];
              v107 = [v110 identifier];
              v108 = [(MCMCommandQuery *)v11 containerConfig];
              uint64_t v71 = [v108 name];
              uint32_t multiuser_flags = 138544386;
              v136 = v107;
              __int16 v137 = 2112;
              uint64_t v138 = v71;
              long long v72 = (void *)v71;
              __int16 v139 = 2114;
              v140 = v60;
              __int16 v141 = 2114;
              v142 = v58;
              __int16 v143 = 2114;
              v144 = v62;
              _os_log_fault_impl(&dword_1D7739000, v63, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona (%{public}@ / %{public}@)", (uint8_t *)&multiuser_flags, 0x34u);
            }
            uint64_t v119 = 1;
          }
          else
          {
            if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
              dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_18);
            }
            if (MCMRequirePersonaAndConvertSystemToPersonal_result
              && v119 != 1
              && [v62 isNoSpecificPersona])
            {
              long long v64 = container_log_handle_for_category();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              {
                v111 = [v58 codeSignInfo];
                long long v73 = [v111 identifier];
                v109 = [(MCMCommandQuery *)v11 containerConfig];
                long long v74 = [v109 name];
                uint32_t multiuser_flags = 138543874;
                v136 = v73;
                __int16 v137 = 2112;
                uint64_t v138 = (uint64_t)v74;
                __int16 v139 = 2114;
                v140 = v60;
                _os_log_fault_impl(&dword_1D7739000, v64, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona - converting to Personal", (uint8_t *)&multiuser_flags, 0x20u);
              }
              uint64_t v119 = 1;
              uint64_t v65 = [(MCMCommand *)v11 context];
              long long v66 = [v65 userIdentityCache];
              long long v67 = [v62 posixUser];
              uint64_t v68 = [v66 userIdentityForPersonalPersonaWithPOSIXUser:v67];

              __int16 v58 = v113;
              long long v62 = (void *)v68;
              id v11 = v112;
            }
          }
          long long v69 = [v57 objectForKeyedSubscript:v62];
          if (!v69)
          {
            long long v69 = objc_opt_new();
            [v57 setObject:v69 forKeyedSubscript:v62];
          }
          uint64_t v70 = [v57 objectForKeyedSubscript:v62];
          [v70 addObject:v60];

          ++v59;
        }
        while (v116 != v59);
        uint64_t v116 = [obj countByEnumeratingWithState:&v131 objects:v130 count:16];
      }
      while (v116);
    }

    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v24 = v57;
    uint64_t v75 = [v24 countByEnumeratingWithState:&v126 objects:v125 count:16];
    uint64_t v12 = v105;
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v127;
      do
      {
        for (uint64_t j = 0; j != v76; ++j)
        {
          if (*(void *)v127 != v77) {
            objc_enumerationMutation(v24);
          }
          uint64_t v79 = *(void *)(*((void *)&v126 + 1) + 8 * j);
          long long v80 = [v24 objectForKeyedSubscript:v79];
          long long v81 = (void *)[v80 copy];
          [v7 setObject:v81 forKeyedSubscript:v79];
        }
        uint64_t v76 = [v24 countByEnumeratingWithState:&v126 objects:v125 count:16];
      }
      while (v76);
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v119 = 1;
  if ([(MCMCommandQuery *)v11 includeUnowned])
  {
    uint64_t v43 = [(MCMCommandQuery *)v11 identifiers];
    uint64_t v44 = [v43 anyObject];
  }
  else
  {
    uint64_t v43 = [(MCMCommand *)v11 context];
    long long v82 = [v43 clientIdentity];
    uint64_t v83 = [v82 codeSignInfo];
    uint64_t v44 = [v83 identifier];
  }
  v84 = [(MCMCommand *)v11 context];
  v85 = [v84 userIdentityCache];
  v86 = [v85 userIdentityForPersonalPersona];

  if (v44)
  {
    v87 = [(MCMCommandQuery *)v11 containerConfig];
    v88 = +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:](MCMXPCMessageBase, "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:", v44, v113, [v87 containerClass], &v119);

    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result && v119 != 1 && [v88 isNoSpecificPersona])
    {
      v89 = container_log_handle_for_category();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
      {
        v117 = [v113 codeSignInfo];
        v98 = [v117 identifier];
        v99 = [(MCMCommandQuery *)v11 containerConfig];
        [v99 name];
        v100 = v106 = v12;
        uint32_t multiuser_flags = 138544386;
        v136 = v98;
        __int16 v137 = 2112;
        uint64_t v138 = (uint64_t)v100;
        __int16 v139 = 2114;
        v140 = v44;
        __int16 v141 = 2114;
        v142 = v113;
        __int16 v143 = 2114;
        v144 = v88;
        _os_log_fault_impl(&dword_1D7739000, v89, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona (%{public}@ / %{public}@)", (uint8_t *)&multiuser_flags, 0x34u);

        uint64_t v12 = v106;
      }

      uint64_t v119 = 1;
    }
    else
    {
      if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
        dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_18);
      }
      if (MCMRequirePersonaAndConvertSystemToPersonal_result
        && v119 != 1
        && [v88 isNoSpecificPersona])
      {
        v90 = container_log_handle_for_category();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
        {
          v118 = [v113 codeSignInfo];
          v101 = [v118 identifier];
          [(MCMCommandQuery *)v11 containerConfig];
          v103 = v102 = v12;
          v104 = [v103 name];
          uint32_t multiuser_flags = 138543874;
          v136 = v101;
          __int16 v137 = 2112;
          uint64_t v138 = (uint64_t)v104;
          __int16 v139 = 2114;
          v140 = v44;
          _os_log_fault_impl(&dword_1D7739000, v90, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona - converting to Personal", (uint8_t *)&multiuser_flags, 0x20u);

          uint64_t v12 = v102;
        }

        uint64_t v119 = 1;
        v91 = [(MCMCommand *)v11 context];
        v92 = [v91 userIdentityCache];
        v93 = [v88 posixUser];
        uint64_t v94 = [v92 userIdentityForPersonalPersonaWithPOSIXUser:v93];

        v88 = (void *)v94;
      }
    }
  }
  else
  {
    v88 = v86;
  }
  [v7 setObject:v6 forKeyedSubscript:v88];

LABEL_17:
  BOOL v29 = (void *)[v7 copy];

  return v29;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

uint64_t __26__MCMCommandQuery_execute__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = +[MCMTestLocks sharedInstance];
  [v2 waitOnLock:14];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v3)
  {
    uint64_t v13 = *(void *)v36;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v35 + 1) + 8 * v4);
        uint64_t v24 = 0;
        uint64_t v25 = &v24;
        uint64_t v26 = 0x3032000000;
        uint64_t v27 = __Block_byref_object_copy__9188;
        BOOL v28 = __Block_byref_object_dispose__9189;
        id v29 = 0;
        id v6 = v5;
        uint64_t v18 = 0;
        uint64_t v19 = &v18;
        uint64_t v20 = 0x3032000000;
        int v21 = __Block_byref_object_copy__9188;
        uint64_t v22 = __Block_byref_object_dispose__9189;
        id v23 = 0;
        uint64_t v7 = [*(id *)(a1 + 40) reply];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __26__MCMCommandQuery_execute__block_invoke_2;
        v14[3] = &unk_1E6A80220;
        v14[4] = v6;
        uint64_t v16 = &v18;
        id v8 = v6;
        id v15 = v8;
        uint64_t v17 = &v24;
        [v7 dispatchSyncToFastWorkloopWithBlock:v14];

        if (v19[5])
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:");
        }
        else
        {
          uint64_t v9 = container_log_handle_for_category();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v10 = v25[5];
            *(_DWORD *)buf = 138412546;
            id v31 = v8;
            __int16 v32 = 2112;
            uint64_t v33 = v10;
            _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Could not resolve metadata for %@: error = %@", buf, 0x16u);
          }
        }
        _Block_object_dispose(&v18, 8);

        _Block_object_dispose(&v24, 8);
        ++v4;
      }
      while (v3 != v4);
      uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v3);
  }

  return [*(id *)(a1 + 40) _finalizeWithContainers:*(void *)(a1 + 48) error:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalUUID, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_containerConfig, 0);
}

- (id)_setOfUserIdentities
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCMCommand *)self context];
  uint64_t v4 = [v3 clientIdentity];

  id v5 = [v4 userIdentity];
  id v6 = container_log_handle_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    long long v36 = [(MCMCommandQuery *)self userIdentity];
    long long v37 = [v36 debugDescription];
    uint32_t v41 = 138412290;
    uint64_t v42 = v37;
    _os_log_debug_impl(&dword_1D7739000, v6, OS_LOG_TYPE_DEBUG, "userIdentity: %@", (uint8_t *)&v41, 0xCu);
  }
  uint64_t v7 = [(MCMCommandQuery *)self containerConfig];
  int v8 = [v7 usesGlobalBundleUserIdentity];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = [(MCMCommand *)self context];
    id v11 = [v10 userIdentityCache];
    uint64_t v12 = [v11 globalBundleUserIdentity];
LABEL_7:
    id v15 = v12;
    uint64_t v16 = [v9 setWithObject:v12];
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v13 = [(MCMCommandQuery *)self containerConfig];
  int v14 = [v13 usesGlobalSystemUserIdentity];

  if (v14)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = [(MCMCommand *)self context];
    id v11 = [v10 userIdentityCache];
    uint64_t v12 = [v11 globalSystemUserIdentity];
    goto LABEL_7;
  }
  uint64_t v18 = [(MCMCommandQuery *)self userIdentity];
  if (v18
    && (uint64_t v19 = (void *)v18,
        [(MCMCommandQuery *)self userIdentity],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [v20 isNoSpecificPersona],
        v20,
        v19,
        !v21))
  {
    if (([v5 isNoSpecificPersona] & 1) != 0
      || ([(MCMCommandQuery *)self userIdentity],
          __int16 v32 = objc_claimAutoreleasedReturnValue(),
          int v33 = [v5 isEqual:v32],
          v32,
          v33))
    {
      int v34 = (void *)MEMORY[0x1E4F1CAD0];
      long long v35 = [(MCMCommandQuery *)self userIdentity];
      uint64_t v16 = [v34 setWithObject:v35];

      uint64_t v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = [(MCMCommandQuery *)self userIdentity];
        id v15 = [v11 shortDescription];
        uint32_t v41 = 138412290;
        uint64_t v42 = v15;
        BOOL v28 = "Using explicit persona: %@";
        id v29 = v10;
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v38 = [v5 shortDescription];
        uint64_t v39 = [(MCMCommandQuery *)self userIdentity];
        id v40 = [v39 shortDescription];
        uint32_t v41 = 138412546;
        uint64_t v42 = v38;
        __int16 v43 = 2112;
        uint64_t v44 = v40;
        _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Ambiguous persona, client has adopted %@ but asks for %@", (uint8_t *)&v41, 0x16u);
      }
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint32_t v41 = 0;
    host_t v22 = MEMORY[0x1D9478CB0]();
    if (!host_get_multiuser_config_flags(v22, &v41) && (v41 & 0x80000000) != 0)
    {
      id v23 = [(MCMCommand *)self context];
      uint64_t v24 = [v23 clientIdentity];
      uint64_t v25 = [v24 userIdentity];
      uint64_t v10 = [v25 posixUser];

      uint64_t v26 = [(MCMCommand *)self context];
      uint64_t v27 = [v26 userIdentityCache];
      id v11 = [v27 userIdentityForPersonalPersonaWithPOSIXUser:v10];

      uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
      id v15 = container_log_handle_for_category();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
      uint32_t v41 = 138412290;
      uint64_t v42 = v11;
      BOOL v28 = "Using client persona: %@";
      id v29 = v15;
LABEL_26:
      _os_log_debug_impl(&dword_1D7739000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v41, 0xCu);
      goto LABEL_8;
    }
    if ([v5 isNoSpecificPersona])
    {
      v30 = [(MCMCommand *)self context];
      id v31 = [v30 userIdentityCache];
      uint64_t v16 = [v31 allAccessibleUserIdentities];

      uint64_t v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint32_t v41 = 138412290;
        uint64_t v42 = v16;
        _os_log_debug_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEBUG, "Using all personas: %@", (uint8_t *)&v41, 0xCu);
      }
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
      uint64_t v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = [v5 shortDescription];
        uint32_t v41 = 138412290;
        uint64_t v42 = v11;
        _os_log_debug_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEBUG, "Using client implicit persona: %@", (uint8_t *)&v41, 0xCu);
        goto LABEL_9;
      }
    }
  }
LABEL_10:

  return v16;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (BOOL)fuzzyMatchInternalUUID
{
  return self->_fuzzyMatchInternalUUID;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

+ (unint64_t)command
{
  return 39;
}

@end