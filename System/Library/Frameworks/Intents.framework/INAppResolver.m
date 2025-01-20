@interface INAppResolver
+ (id)sharedResolver;
+ (id)supportedIntentsOverridesForThirdPartyBundleIdentifier:(id)a3;
+ (void)initialize;
- (BOOL)cacheHasResultForDescriptor:(id)a3;
- (INAppResolver)init;
- (INAppResolverOptions)globalOptions;
- (INExecutionCounterpartMapper)_counterpartMapper;
- (INExecutionFrameworkMapper)_frameworkMapper;
- (INLinkActionProvider)linkActionProvider;
- (INSystemAppMapper)_systemAppMapper;
- (NSMutableDictionary)cachedResults;
- (NSMutableDictionary)intentClassNameToResolverOptions;
- (id)_optionsForIntentClassName:(id)a3;
- (id)_resolvedAppIntentMatchingDescriptor:(id)a3 availableActions:(id)a4 availableEntities:(id)a5;
- (id)_resolvedAppMatchingDescriptor:(id)a3;
- (id)_resolvedIntentMatchingDescriptor:(id)a3;
- (id)_resolvedUserActivityMatchingDescriptor:(id)a3;
- (id)cachedResultForKey:(id)a3;
- (id)counterpartIdentifiersForLocalIdentifier:(id)a3;
- (id)localIdentifiersForCounterpartIdentifier:(id)a3;
- (id)optionsForCurrentContextWithIntentClassName:(id)a3;
- (id)resolveDescriptorByLinkingFileProvidersToFilesApp:(id)a3;
- (id)resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:(id)a3;
- (id)resolvedAppIntentMatchingDescriptor:(id)a3 availableActions:(id)a4 availableEntities:(id)a5;
- (id)resolvedAppMatchingDescriptor:(id)a3;
- (id)resolvedIntentMatchingDescriptor:(id)a3;
- (id)resolvedUserActivityMatchingDescriptor:(id)a3;
- (os_unfair_lock_s)cacheLock;
- (os_unfair_lock_s)resolverOptionsLock;
- (void)cacheResult:(id)a3 forDescriptor:(id)a4;
- (void)dealloc;
- (void)installedApplicationsDidChange:(id)a3;
- (void)invalidateCache;
- (void)setOptions:(id)a3;
- (void)setOptions:(id)a3 forIntentClassName:(id)a4;
@end

@implementation INAppResolver

- (id)resolvedAppIntentMatchingDescriptor:(id)a3 availableActions:(id)a4 availableEntities:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (INDescriptorContainsBundleIdentifiers(v8))
  {
    id v11 = v8;
    if ([(INAppResolver *)self cacheHasResultForDescriptor:v11])
    {
      v12 = [(INAppResolver *)self cachedResultForKey:v11];
    }
    else
    {
      v12 = [(INAppResolver *)self _resolvedAppIntentMatchingDescriptor:v11 availableActions:v9 availableEntities:v10];
      [(INAppResolver *)self cacheResult:v12 forDescriptor:v11];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)cachedResultForKey:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  v6 = [(INAppResolver *)self cachedResults];
  v7 = [v6 objectForKey:v5];

  os_unfair_lock_unlock(p_cacheLock);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = 0;
  }
  else {
    id v8 = v7;
  }

  return v8;
}

- (BOOL)cacheHasResultForDescriptor:(id)a3
{
  id v4 = a3;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v6 = [(INAppResolver *)self cachedResults];
  v7 = [v6 objectForKey:v4];

  if (v7)
  {
    if ([v7 isMemberOfClass:objc_opt_class()])
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  os_unfair_lock_unlock(p_cacheLock);

  return isKindOfClass & 1;
}

- (NSMutableDictionary)cachedResults
{
  return self->_cachedResults;
}

+ (id)sharedResolver
{
  if (sharedResolver_onceToken != -1) {
    dispatch_once(&sharedResolver_onceToken, &__block_literal_global_23215);
  }
  v2 = (void *)sharedResolver_sharedResolver;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentClassNameToResolverOptions, 0);
  objc_storeStrong((id *)&self->_globalOptions, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_linkActionProvider, 0);
  objc_storeStrong((id *)&self->_systemAppMapper, 0);
  objc_storeStrong((id *)&self->_frameworkMapper, 0);

  objc_storeStrong((id *)&self->_counterpartMapper, 0);
}

- (os_unfair_lock_s)resolverOptionsLock
{
  return self->_resolverOptionsLock;
}

- (NSMutableDictionary)intentClassNameToResolverOptions
{
  return self->_intentClassNameToResolverOptions;
}

- (INAppResolverOptions)globalOptions
{
  return self->_globalOptions;
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (INLinkActionProvider)linkActionProvider
{
  return self->_linkActionProvider;
}

- (INSystemAppMapper)_systemAppMapper
{
  systemAppMapper = self->_systemAppMapper;
  if (!systemAppMapper)
  {
    id v4 = objc_alloc_init(INSystemAppMapper);
    id v5 = self->_systemAppMapper;
    self->_systemAppMapper = v4;

    systemAppMapper = self->_systemAppMapper;
  }

  return systemAppMapper;
}

- (INExecutionFrameworkMapper)_frameworkMapper
{
  frameworkMapper = self->_frameworkMapper;
  if (!frameworkMapper)
  {
    id v4 = objc_alloc_init(INExecutionFrameworkMapper);
    id v5 = self->_frameworkMapper;
    self->_frameworkMapper = v4;

    frameworkMapper = self->_frameworkMapper;
  }

  return frameworkMapper;
}

- (INExecutionCounterpartMapper)_counterpartMapper
{
  counterpartMapper = self->_counterpartMapper;
  if (!counterpartMapper)
  {
    id v4 = objc_alloc_init(INExecutionCounterpartMapper);
    id v5 = self->_counterpartMapper;
    self->_counterpartMapper = v4;

    counterpartMapper = self->_counterpartMapper;
  }

  return counterpartMapper;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];

  v4.receiver = self;
  v4.super_class = (Class)INAppResolver;
  [(INAppResolver *)&v4 dealloc];
}

- (INAppResolver)init
{
  v12.receiver = self;
  v12.super_class = (Class)INAppResolver;
  v2 = [(INAppResolver *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(INLinkActionProvider);
    linkActionProvider = v2->_linkActionProvider;
    v2->_linkActionProvider = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedResults = v2->_cachedResults;
    v2->_cachedResults = v5;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    intentClassNameToResolverOptions = v2->_intentClassNameToResolverOptions;
    v2->_intentClassNameToResolverOptions = v7;

    v2->_resolverOptionsLock._os_unfair_lock_opaque = 0;
    id v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v9 addObserver:v2 selector:sel_installedApplicationsDidChange_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v9 addObserver:v2 selector:sel_installedApplicationsDidChange_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
    id v10 = v2;
  }
  return v2;
}

- (id)_optionsForIntentClassName:(id)a3
{
  if (a3)
  {
    p_resolverOptionsLock = &self->_resolverOptionsLock;
    id v5 = a3;
    os_unfair_lock_lock(p_resolverOptionsLock);
    v6 = [(INAppResolver *)self intentClassNameToResolverOptions];
    v7 = [v6 objectForKey:v5];

    os_unfair_lock_unlock(p_resolverOptionsLock);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setOptions:(id)a3 forIntentClassName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    p_resolverOptionsLock = &self->_resolverOptionsLock;
    os_unfair_lock_lock(&self->_resolverOptionsLock);
    id v8 = [(INAppResolver *)self intentClassNameToResolverOptions];
    id v9 = v8;
    if (v10) {
      [v8 setObject:v10 forKey:v6];
    }
    else {
      [v8 removeObjectForKey:v6];
    }

    os_unfair_lock_unlock(p_resolverOptionsLock);
  }
}

- (void)setOptions:(id)a3
{
}

- (id)optionsForCurrentContextWithIntentClassName:(id)a3
{
  objc_super v4 = [(INAppResolver *)self _optionsForIntentClassName:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(INAppResolver *)self globalOptions];
  }
  v7 = v6;

  return v7;
}

- (void)installedApplicationsDidChange:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"isPlaceholder"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  if ((v8 & 1) == 0)
  {
    [(INAppResolver *)self invalidateCache];
    id v9 = [(INAppResolver *)self linkActionProvider];
    [v9 evictCache];
  }
}

- (void)invalidateCache
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  objc_super v4 = [(INAppResolver *)self cachedResults];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_cacheLock);
}

- (void)cacheResult:(id)a3 forDescriptor:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  char v8 = [(INAppResolver *)self cachedResults];
  id v9 = v8;
  if (v11)
  {
    [v8 setObject:v11 forKey:v6];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
    [v9 setObject:v10 forKey:v6];
  }
  os_unfair_lock_unlock(p_cacheLock);
}

- (id)_resolvedAppIntentMatchingDescriptor:(id)a3 availableActions:(id)a4 availableEntities:(id)a5
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [(INAppResolver *)self linkActionProvider];
    [v11 cacheActions:v9];
  }
  if (v10)
  {
    objc_super v12 = [(INAppResolver *)self linkActionProvider];
    [v12 cacheEntities:v10];
  }
  id v123 = v10;
  context = (void *)MEMORY[0x192F98250]();
  v131 = self;
  uint64_t v13 = [(INAppResolver *)self resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:v8];
  v120 = (void *)v13;
  if (v13)
  {
    v14 = (void *)v13;
    obja = [INAppIntentDescriptor alloc];
    v129 = [v8 intentIdentifier];
    v125 = [v14 localizedName];
    [v14 bundleIdentifier];
    v15 = id v117 = v9;
    v16 = [v14 extensionBundleIdentifier];
    v17 = [v14 counterpartIdentifiers];
    v18 = [v14 teamIdentifier];
    v19 = [v14 supportedIntents];
    v20 = [v8 supportedEntities];
    v21 = [v14 bundleURL];
    v22 = [v14 documentTypes];
    uint64_t v23 = [(INAppIntentDescriptor *)obja initWithIntentIdentifier:v129 localizedName:v125 bundleIdentifier:v15 extensionBundleIdentifier:v16 counterpartIdentifiers:v17 teamIdentifier:v18 supportedIntents:v19 supportedEntities:v20 bundleURL:v21 documentTypes:v22];

    id v9 = v117;
    id v8 = (id)v23;
  }
  v24 = [v8 bundleIdentifier];
  v122 = v24;
  if (v24)
  {
    v25 = v24;
    if ([v24 length])
    {
      v26 = [(INAppResolver *)v131 _systemAppMapper];
      v27 = [v8 intentIdentifier];
      v28 = [v26 matchForBundleIdentifier:v25 intentName:v27];

      v116 = v28;
      if (v28)
      {
        v29 = v123;
        if ([v28 appIsUnavailableOnCurrentPlatform])
        {
          id v30 = v8;
        }
        else
        {
          id v118 = v9;
          v43 = [v28 bundleIdentifierForCurrentPlatform];
          v44 = v43;
          if (v43 && [v43 length])
          {
            v45 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v44 allowPlaceholder:0 error:0];
            v46 = [(INAppResolver *)v131 linkActionProvider];
            v47 = [v46 supportedActionIdentifiersForBundleIdentifier:v44];

            v48 = [(INAppResolver *)v131 linkActionProvider];
            v49 = [v48 supportedEntityIdentifiersForBundleIdentifier:v44];

            v50 = [INAppIntentDescriptor alloc];
            v51 = [v8 intentIdentifier];
            v52 = [MEMORY[0x1E4F1CAD0] setWithArray:v47];
            v53 = [MEMORY[0x1E4F1CAD0] setWithArray:v49];
            v54 = v50;
            v29 = v123;
            uint64_t v55 = [(INAppIntentDescriptor *)v54 initWithIntentIdentifier:v51 applicationRecord:v45 supportedAppIntents:v52 supportedEntities:v53];

            id v30 = (id)v55;
          }
          else
          {
            v56 = (void *)INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
            {
              v110 = v56;
              v111 = [v8 intentIdentifier];
              *(_DWORD *)buf = 136315394;
              v148 = "-[INAppResolver _resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:]";
              __int16 v149 = 2112;
              v150 = v111;
              _os_log_fault_impl(&dword_18CB2F000, v110, OS_LOG_TYPE_FAULT, "%s Platform bundle identifier unexpectedly nil: %@", buf, 0x16u);

              v29 = v123;
            }
            id v30 = v8;
          }

          id v9 = v118;
        }
        goto LABEL_83;
      }
      v34 = [(INAppResolver *)v131 linkActionProvider];
      v35 = [v34 supportedActionIdentifiersForBundleIdentifier:v25];

      v115 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v25 allowPlaceholder:0 error:0];
      if (v115)
      {
        v36 = [v115 applicationState];
        if ([v36 isInstalled])
        {
          uint64_t v37 = [v35 count];

          if (!v37) {
            goto LABEL_31;
          }
          v38 = [(INAppResolver *)v131 linkActionProvider];
          v36 = [v38 supportedEntityIdentifiersForBundleIdentifier:v122];

          if (INActionsAndApplicationRecordMatchesRequirementsFromDescriptor(v35, v36, v115, v8))
          {
            v39 = [INAppIntentDescriptor alloc];
            v40 = [v8 intentIdentifier];
            v41 = [MEMORY[0x1E4F1CAD0] setWithArray:v35];
            v42 = [MEMORY[0x1E4F1CAD0] setWithArray:v36];
            v130 = [(INAppIntentDescriptor *)v39 initWithIntentIdentifier:v40 applicationRecord:v115 supportedAppIntents:v41 supportedEntities:v42];

            v29 = v123;
LABEL_82:

            id v30 = v130;
LABEL_83:

            goto LABEL_84;
          }
        }
      }
LABEL_31:
      v57 = [v8 counterpartIdentifiers];
      v58 = v57;
      v126 = v8;
      id v119 = v9;
      if (v57)
      {
        id v59 = v57;
      }
      else
      {
        v60 = [v8 bundleIdentifier];
        id v59 = [(INAppResolver *)v131 localIdentifiersForCounterpartIdentifier:v60];
      }
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v61 = v59;
      uint64_t v62 = [v61 countByEnumeratingWithState:&v141 objects:v146 count:16];
      v114 = v35;
      id v124 = v61;
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v142;
LABEL_36:
        uint64_t v65 = 0;
        while (1)
        {
          if (*(void *)v142 != v64) {
            objc_enumerationMutation(v61);
          }
          uint64_t v66 = *(void *)(*((void *)&v141 + 1) + 8 * v65);
          v67 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v66 allowPlaceholder:0 error:0];
          v68 = v67;
          if (v67)
          {
            v69 = [v67 applicationState];
            int v70 = [v69 isInstalled];

            if (v70)
            {
              v71 = [(INAppResolver *)v131 linkActionProvider];
              v72 = [v71 supportedActionIdentifiersForBundleIdentifier:v66];

              if ([v72 count])
              {
                v73 = [(INAppResolver *)v131 linkActionProvider];
                v74 = [v73 supportedEntityIdentifiersForBundleIdentifier:v66];

                if (INActionsAndApplicationRecordMatchesRequirementsFromDescriptor(v72, v74, v68, v126))
                {
                  v81 = [INAppIntentDescriptor alloc];
                  id v8 = v126;
                  v82 = [v126 intentIdentifier];
                  v83 = [MEMORY[0x1E4F1CAD0] setWithArray:v72];
                  v84 = [MEMORY[0x1E4F1CAD0] setWithArray:v74];
                  v130 = [(INAppIntentDescriptor *)v81 initWithIntentIdentifier:v82 applicationRecord:v68 supportedAppIntents:v83 supportedEntities:v84];

                  v29 = v123;
                  v85 = v124;
                  v86 = v124;
                  id v9 = v119;
                  v35 = v114;
                  goto LABEL_81;
                }

                id v61 = v124;
              }
            }
          }

          if (v63 == ++v65)
          {
            uint64_t v63 = [v61 countByEnumeratingWithState:&v141 objects:v146 count:16];
            if (!v63) {
              break;
            }
            goto LABEL_36;
          }
        }
      }

      v75 = [(INAppResolver *)v131 linkActionProvider];
      v76 = [v75 bundleIdentifiers];

      v77 = (void *)MEMORY[0x1E4F1CAD0];
      v139[0] = MEMORY[0x1E4F143A8];
      v139[1] = 3221225472;
      v139[2] = __89__INAppResolver__resolvedAppIntentMatchingDescriptor_availableActions_availableEntities___block_invoke;
      v139[3] = &unk_1E5517CC0;
      v139[4] = v131;
      id v8 = v126;
      id v78 = v126;
      id v140 = v78;
      v112 = v76;
      v79 = objc_msgSend(v76, "if_compactMap:", v139);
      v80 = [v77 setWithArray:v79];

      v113 = v80;
      if ([v80 count])
      {
        v35 = v114;
        if ([v80 count] == 1)
        {
          v130 = [v80 anyObject];
          id v9 = v119;
          v29 = v123;
          goto LABEL_77;
        }
        v104 = [v80 allObjects];
        v137[0] = MEMORY[0x1E4F143A8];
        v137[1] = 3221225472;
        v137[2] = __89__INAppResolver__resolvedAppIntentMatchingDescriptor_availableActions_availableEntities___block_invoke_2;
        v137[3] = &unk_1E5517CE8;
        id v138 = v122;
        v105 = objc_msgSend(v104, "if_firstObjectPassingTest:", v137);

        id v9 = v119;
        if (v105)
        {
          v106 = v105;
        }
        else
        {
          v106 = [v80 anyObject];
        }
        v130 = v106;
        v29 = v123;
        v85 = v124;
        v86 = v112;

LABEL_80:
LABEL_81:

        goto LABEL_82;
      }
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      id v87 = v80;
      uint64_t v88 = [v87 countByEnumeratingWithState:&v133 objects:v145 count:16];
      if (!v88)
      {

        goto LABEL_75;
      }
      uint64_t v89 = v88;
      v130 = 0;
      uint64_t v132 = *(void *)v134;
      uint64_t v90 = 0x7FFFFFFFFFFFFFFFLL;
      id obj = v87;
LABEL_53:
      uint64_t v91 = 0;
      while (1)
      {
        if (*(void *)v134 != v132) {
          objc_enumerationMutation(obj);
        }
        v92 = *(void **)(*((void *)&v133 + 1) + 8 * v91);
        v93 = [v78 localizedName];

        if (v93) {
          break;
        }
        v98 = [v78 bundleIdentifier];

        if (!v98) {
          goto LABEL_68;
        }
        v99 = [v78 bundleIdentifier];
        v100 = [v92 bundleIdentifier];
        v94 = [v99 commonPrefixWithString:v100 options:0];

        if ([v94 length])
        {
          v101 = [v78 bundleIdentifier];
          v95 = objc_msgSend(v101, "substringFromIndex:", objc_msgSend(v94, "length"));

          v102 = [v92 bundleIdentifier];
          v103 = objc_msgSend(v102, "substringFromIndex:", objc_msgSend(v94, "length"));

          uint64_t v96 = INEditDistanceBetweenStrings(v95, v103);
          id v8 = v126;
          goto LABEL_58;
        }
LABEL_64:

LABEL_68:
        if (v89 == ++v91)
        {
          uint64_t v89 = [obj countByEnumeratingWithState:&v133 objects:v145 count:16];
          if (!v89)
          {

            if (v130)
            {
              [(INAppDescriptor *)v130 setRequiresUserConfirmation:v90 > 0];
              goto LABEL_76;
            }
LABEL_75:
            v130 = (INAppIntentDescriptor *)v78;
LABEL_76:
            id v9 = v119;
            v29 = v123;
            v35 = v114;
LABEL_77:
            v85 = v124;
            v86 = v112;
            goto LABEL_80;
          }
          goto LABEL_53;
        }
      }
      v94 = [v78 localizedName];
      v95 = [v92 localizedName];
      uint64_t v96 = INEditDistanceBetweenStrings(v94, v95);
LABEL_58:

      if (v96 >= v90 || v96 > 5) {
        goto LABEL_68;
      }
      v94 = v130;
      v130 = v92;
      uint64_t v90 = v96;
      goto LABEL_64;
    }
  }
  v31 = [v8 intentIdentifier];
  int v32 = [v31 isEqualToString:@"MTUpdateAlarmIntent"];

  v33 = INSiriLogContextIntents;
  if (v32)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v148 = "-[INAppResolver _resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:]";
      _os_log_impl(&dword_18CB2F000, v33, OS_LOG_TYPE_INFO, "%s MTUpdateAlarmIntent is only on watchOS.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v107 = v33;
    v108 = [v8 intentIdentifier];
    *(_DWORD *)buf = 136315394;
    v148 = "-[INAppResolver _resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:]";
    __int16 v149 = 2112;
    v150 = v108;
    _os_log_error_impl(&dword_18CB2F000, v107, OS_LOG_TYPE_ERROR, "%s Resolved bundleIdentifier unexpectedly nil for %@", buf, 0x16u);
  }
  id v30 = v8;
  v29 = v123;
LABEL_84:

  return v30;
}

INAppIntentDescriptor *__89__INAppResolver__resolvedAppIntentMatchingDescriptor_availableActions_availableEntities___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) linkActionProvider];
  id v5 = [v4 supportedActionIdentifiersForBundleIdentifier:v3];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) linkActionProvider];
    id v7 = [v6 supportedEntityIdentifiersForBundleIdentifier:v3];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
    if (v8
      && INActionsAndApplicationRecordMatchesRequirementsFromDescriptor(v5, v7, v8, *(void **)(a1 + 40)))
    {
      id v9 = [INAppIntentDescriptor alloc];
      id v10 = [*(id *)(a1 + 40) intentIdentifier];
      id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
      objc_super v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      uint64_t v13 = [(INAppIntentDescriptor *)v9 initWithIntentIdentifier:v10 applicationRecord:v8 supportedAppIntents:v11 supportedEntities:v12];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __89__INAppResolver__resolvedAppIntentMatchingDescriptor_availableActions_availableEntities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [v3 counterpartIdentifiers];
    uint64_t v5 = [v6 containsObject:*(void *)(a1 + 32)];
  }
  return v5;
}

- (id)counterpartIdentifiersForLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INAppResolver *)self _counterpartMapper];
  id v6 = [v5 counterpartIdentifiersForLocalIdentifier:v4];

  return v6;
}

- (id)localIdentifiersForCounterpartIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INAppResolver *)self _counterpartMapper];
  id v6 = [v5 localIdentifiersForCounterpartIdentifier:v4];

  return v6;
}

- (id)resolveDescriptorByLinkingFileProvidersToFilesApp:(id)a3
{
  id v3 = a3;
  id v4 = [v3 extensionBundleIdentifier];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223A0]);
    id v6 = [v3 extensionBundleIdentifier];
    id v7 = (void *)[v5 initWithBundleIdentifier:v6 error:0];

    id v8 = [v7 extensionPointRecord];
    id v9 = [v8 name];
    int v10 = [v9 isEqualToString:@"com.apple.fileprovider-nonui"];

    id v11 = 0;
    if (v10)
    {
      objc_super v12 = [INUserActivityDescriptor alloc];
      uint64_t v13 = [v3 userActivityType];
      v14 = [v3 localizedName];
      v15 = [v3 extensionBundleIdentifier];
      v16 = [v3 counterpartIdentifiers];
      v17 = [v3 teamIdentifier];
      v18 = [v3 supportedIntents];
      v19 = [v3 bundleURL];
      id v11 = [(INUserActivityDescriptor *)v12 initWithUserActivityType:v13 localizedName:v14 bundleIdentifier:@"com.apple.DocumentsApp" extensionBundleIdentifier:v15 counterpartIdentifiers:v16 teamIdentifier:v17 supportedIntents:v18 bundleURL:v19];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIdentifier];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223A0]);
    id v6 = [v3 bundleIdentifier];
    id v7 = (void *)[v5 initWithBundleIdentifier:v6 error:0];

    if (v7)
    {
      id v8 = [v7 containingBundleRecord];
      v22 = v7;
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }
      }
      else
      {
        id v9 = 0;
      }
      id v11 = v9;

      v21 = [INAppDescriptor alloc];
      objc_super v12 = [v11 localizedName];
      uint64_t v13 = [v11 bundleIdentifier];
      v14 = [v3 bundleIdentifier];
      v15 = objc_msgSend(v11, "in_counterpartIdentifiers");
      v16 = [v11 teamIdentifier];
      v17 = objc_msgSend(v11, "in_supportedIntents");
      v18 = [v11 URL];
      v19 = objc_msgSend(v11, "in_documentTypes");

      int v10 = [(INAppDescriptor *)v21 initWithLocalizedName:v12 bundleIdentifier:v13 extensionBundleIdentifier:v14 counterpartIdentifiers:v15 teamIdentifier:v16 supportedIntents:v17 bundleURL:v18 documentTypes:v19];
      id v7 = v22;
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)_resolvedUserActivityMatchingDescriptor:(id)a3
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x192F98250]();
  v130 = [(INAppResolver *)self optionsForCurrentContextWithIntentClassName:0];
  uint64_t v5 = [(INAppResolver *)self resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:v4];
  id v119 = (void *)v5;
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [INUserActivityDescriptor alloc];
    id v8 = [v4 userActivityType];
    [v6 localizedName];
    v128 = v4;
    v10 = id v9 = v6;
    id v11 = [v6 bundleIdentifier];
    objc_super v12 = [v9 extensionBundleIdentifier];
    uint64_t v13 = [v9 counterpartIdentifiers];
    v14 = [v9 teamIdentifier];
    [v9 supportedIntents];
    v16 = v15 = self;
    v17 = [v9 bundleURL];
    uint64_t v18 = [(INUserActivityDescriptor *)v7 initWithUserActivityType:v8 localizedName:v10 bundleIdentifier:v11 extensionBundleIdentifier:v12 counterpartIdentifiers:v13 teamIdentifier:v14 supportedIntents:v16 bundleURL:v17];

    self = v15;
    id v4 = (id)v18;
  }
  v19 = [(INAppResolver *)self resolveDescriptorByLinkingFileProvidersToFilesApp:v4];
  id v118 = v19;
  if (v19)
  {
    id v20 = v19;

    id v4 = v20;
  }
  v21 = off_1E5514000;
  v22 = [v4 extensionBundleIdentifier];

  v129 = v4;
  if (v22)
  {
    uint64_t v23 = [(INAppResolver *)self _systemAppMapper];
    v24 = [v4 extensionBundleIdentifier];
    v25 = [v23 resolvedAppMatchingExtensionBundleIdentifier:v24];

    if (v25)
    {
      v26 = [INUserActivityDescriptor alloc];
      v27 = [v4 userActivityType];
      v28 = [v25 localizedName];
      v29 = [v25 bundleIdentifier];
      id v30 = [v25 extensionBundleIdentifier];
      v31 = [v25 counterpartIdentifiers];
      int v32 = [v25 teamIdentifier];
      v33 = [v25 supportedIntents];
      v34 = v25;
LABEL_8:
      v35 = [v34 bundleURL];
      v36 = [(INUserActivityDescriptor *)v26 initWithUserActivityType:v27 localizedName:v28 bundleIdentifier:v29 extensionBundleIdentifier:v30 counterpartIdentifiers:v31 teamIdentifier:v32 supportedIntents:v33 bundleURL:v35];

      id v4 = v129;
LABEL_36:

      goto LABEL_87;
    }
  }
  uint64_t v37 = [v4 bundleIdentifier];

  if (v37)
  {
    id v38 = objc_alloc(MEMORY[0x1E4F223C8]);
    v39 = [v4 bundleIdentifier];
    v25 = (void *)[v38 initWithBundleIdentifier:v39 allowPlaceholder:0 error:0];

    v40 = [v25 applicationState];
    if ([v40 isInstalled])
    {
      char v41 = INApplicationRecordMatchesRequirementsFromUserActivityDescriptor(v25, v4, v130);

      if (v41)
      {
        v26 = [INUserActivityDescriptor alloc];
        v27 = [v4 userActivityType];
        v28 = [v25 localizedName];
        v29 = [v25 bundleIdentifier];
        id v30 = [v4 extensionBundleIdentifier];
        v31 = objc_msgSend(v25, "in_counterpartIdentifiers");
        int v32 = [v25 teamIdentifier];
        v33 = objc_msgSend(v25, "in_supportedIntents");
        v34 = v4;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  long long v134 = self;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  v25 = [v4 counterpartIdentifiers];
  uint64_t v42 = [v25 countByEnumeratingWithState:&v152 objects:v159 count:16];
  if (!v42) {
    goto LABEL_26;
  }
  uint64_t v43 = v42;
  uint64_t v44 = *(void *)v153;
  do
  {
    for (uint64_t i = 0; i != v43; ++i)
    {
      if (*(void *)v153 != v44) {
        objc_enumerationMutation(v25);
      }
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:*(void *)(*((void *)&v152 + 1) + 8 * i) allowPlaceholder:0 error:0];
      v46 = [v27 applicationState];
      if ([v46 isInstalled])
      {
        char v47 = INApplicationRecordMatchesRequirementsFromUserActivityDescriptor(v27, v4, v130);

        if (v47)
        {
          long long v135 = [INUserActivityDescriptor alloc];
          id v131 = [v4 userActivityType];
          uint64_t v62 = [v27 localizedName];
          uint64_t v63 = [v27 bundleIdentifier];
          uint64_t v64 = [v4 extensionBundleIdentifier];
          uint64_t v65 = objc_msgSend(v27, "in_counterpartIdentifiers");
          uint64_t v66 = [v27 teamIdentifier];
          v67 = objc_msgSend(v27, "in_supportedIntents");
          v68 = [v129 bundleURL];
          v36 = [(INUserActivityDescriptor *)v135 initWithUserActivityType:v131 localizedName:v62 bundleIdentifier:v63 extensionBundleIdentifier:v64 counterpartIdentifiers:v65 teamIdentifier:v66 supportedIntents:v67 bundleURL:v68];

          id v4 = v129;
          goto LABEL_36;
        }
      }
      else
      {
      }
    }
    uint64_t v43 = [v25 countByEnumeratingWithState:&v152 objects:v159 count:16];
  }
  while (v43);
LABEL_26:

  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v49 = [(INAppResolver *)v134 _counterpartMapper];
  v50 = [v4 bundleIdentifier];
  v51 = [v49 localIdentifiersForCounterpartIdentifier:v50];

  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id v52 = v51;
  uint64_t v53 = [v52 countByEnumeratingWithState:&v148 objects:v158 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v149;
    do
    {
      for (uint64_t j = 0; j != v54; ++j)
      {
        if (*(void *)v149 != v55) {
          objc_enumerationMutation(v52);
        }
        v57 = [[INUserActivityDescriptor alloc] initWithUserActivityType:0 localizedName:0 bundleIdentifier:*(void *)(*((void *)&v148 + 1) + 8 * j) extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 supportedIntents:0 bundleURL:0];
        [v48 addObject:v57];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v148 objects:v158 count:16];
    }
    while (v54);
  }

  v58 = [(INAppResolver *)v134 _systemAppMapper];
  id v59 = [v4 bundleIdentifier];
  v60 = [v58 matchForBundleIdentifier:v59];

  id v61 = v60;
  if (v60)
  {
    if ([v60 appIsUnavailableOnCurrentPlatform])
    {
      v36 = (INUserActivityDescriptor *)v4;
      goto LABEL_86;
    }
    v69 = [INUserActivityDescriptor alloc];
    int v70 = [v60 bundleIdentifierForCurrentPlatform];
    v71 = [(INUserActivityDescriptor *)v69 initWithUserActivityType:0 localizedName:0 bundleIdentifier:v70 extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 supportedIntents:0 bundleURL:0];

    [v48 addObject:v71];
    id v61 = v60;
  }
  v145[0] = MEMORY[0x1E4F143A8];
  v145[1] = 3221225472;
  v145[2] = __57__INAppResolver__resolvedUserActivityMatchingDescriptor___block_invoke;
  v145[3] = &unk_1E5517C98;
  id v127 = v4;
  id v146 = v127;
  id v72 = v130;
  id v147 = v72;
  v73 = objc_msgSend(v48, "if_compactMap:", v145);
  [v48 removeAllObjects];
  if ([v73 count] == 1)
  {
    v36 = [v73 anyObject];
    goto LABEL_85;
  }
  id v117 = v73;
  if ((unint64_t)[v73 count] >= 2)
  {
    [v73 allObjects];
    v75 = v74 = v61;
    [v48 addObjectsFromArray:v75];

    id v61 = v74;
  }
  else
  {
    uint64_t v76 = [v73 count];
    if (v61 && !v76)
    {
      v77 = (INUserActivityDescriptor *)v127;
LABEL_59:
      v36 = v77;
      goto LABEL_84;
    }
  }
  id v136 = v52;
  if (![v117 count])
  {
    v115 = v61;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id obj = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
    uint64_t v78 = [obj countByEnumeratingWithState:&v141 objects:v157 count:16];
    v79 = v127;
    if (v78)
    {
      uint64_t v80 = v78;
      uint64_t v81 = *(void *)v142;
      id v122 = v72;
      id v123 = v48;
      uint64_t v121 = *(void *)v142;
      do
      {
        uint64_t v82 = 0;
        uint64_t v125 = v80;
        do
        {
          if (*(void *)v142 != v81) {
            objc_enumerationMutation(obj);
          }
          v83 = *(void **)(*((void *)&v141 + 1) + 8 * v82);
          v84 = (void *)MEMORY[0x192F98250]();
          if (INApplicationRecordMatchesRequirementsFromUserActivityDescriptor(v83, v79, v72))
          {
            id v132 = v84;
            id v85 = objc_alloc(v21[142]);
            v86 = [v79 userActivityType];
            id v87 = [v83 localizedName];
            uint64_t v88 = [v83 bundleIdentifier];
            uint64_t v89 = [v79 extensionBundleIdentifier];
            uint64_t v90 = objc_msgSend(v83, "in_counterpartIdentifiers");
            uint64_t v91 = [v83 teamIdentifier];
            v92 = objc_msgSend(v83, "in_supportedIntents");
            v93 = [v79 bundleURL];
            v94 = (void *)[v85 initWithUserActivityType:v86 localizedName:v87 bundleIdentifier:v88 extensionBundleIdentifier:v89 counterpartIdentifiers:v90 teamIdentifier:v91 supportedIntents:v92 bundleURL:v93];

            v79 = v127;
            id v4 = v129;

            id v48 = v123;
            v21 = off_1E5514000;

            uint64_t v80 = v125;
            uint64_t v81 = v121;

            id v72 = v122;
            [v123 addObject:v94];

            v84 = v132;
          }
          ++v82;
        }
        while (v80 != v82);
        uint64_t v80 = [obj countByEnumeratingWithState:&v141 objects:v157 count:16];
      }
      while (v80);
    }

    id v52 = v136;
    id v61 = v115;
  }
  if ([v48 count] == 1)
  {
    v77 = [v48 anyObject];
    goto LABEL_59;
  }
  v116 = v61;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v95 = v48;
  uint64_t v96 = [v95 countByEnumeratingWithState:&v137 objects:v156 count:16];
  if (!v96)
  {

    v100 = v127;
    goto LABEL_82;
  }
  uint64_t v97 = v96;
  id v124 = v48;
  v36 = 0;
  uint64_t v98 = *(void *)v138;
  uint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
  v100 = v127;
  id v133 = v95;
  while (2)
  {
    uint64_t v101 = 0;
    while (2)
    {
      if (*(void *)v138 != v98) {
        objc_enumerationMutation(v133);
      }
      v102 = *(void **)(*((void *)&v137 + 1) + 8 * v101);
      v103 = [v100 localizedName];

      if (v103)
      {
        v104 = [v100 localizedName];
        v105 = [v102 localizedName];
        uint64_t v106 = INEditDistanceBetweenStrings(v104, v105);
        goto LABEL_67;
      }
      v108 = [v100 bundleIdentifier];

      if (v108)
      {
        v109 = [v100 bundleIdentifier];
        v110 = [v102 bundleIdentifier];
        v104 = [v109 commonPrefixWithString:v110 options:0];

        if ([v104 length])
        {
          v111 = [v100 bundleIdentifier];
          v105 = objc_msgSend(v111, "substringFromIndex:", objc_msgSend(v104, "length"));

          v112 = [v102 bundleIdentifier];
          v113 = objc_msgSend(v112, "substringFromIndex:", objc_msgSend(v104, "length"));

          uint64_t v106 = INEditDistanceBetweenStrings(v105, v113);
          v100 = v127;
LABEL_67:

          if (v106 >= v99 || v106 > 5) {
            goto LABEL_77;
          }
          v104 = v36;
          v36 = v102;
          uint64_t v99 = v106;
        }
      }
LABEL_77:
      id v52 = v136;
      if (v97 != ++v101) {
        continue;
      }
      break;
    }
    uint64_t v97 = [v133 countByEnumeratingWithState:&v137 objects:v156 count:16];
    if (v97) {
      continue;
    }
    break;
  }

  id v48 = v124;
  if (v36)
  {
    [(INAppDescriptor *)v36 setRequiresUserConfirmation:v99 > 0];
    goto LABEL_83;
  }
LABEL_82:
  v36 = v100;
LABEL_83:
  id v4 = v129;
  id v61 = v116;
LABEL_84:
  v73 = v117;
LABEL_85:

LABEL_86:
LABEL_87:

  return v36;
}

INUserActivityDescriptor *__57__INAppResolver__resolvedUserActivityMatchingDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 bundleIdentifier];

  id v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [v7 applicationState];
  if (![v8 isInstalled])
  {
    v17 = 0;
    goto LABEL_7;
  }
  int v9 = INApplicationRecordMatchesRequirementsFromUserActivityDescriptor(v7, *(void **)(a1 + 32), *(void **)(a1 + 40));

  if (!v9)
  {
LABEL_5:
    v17 = 0;
    goto LABEL_8;
  }
  v19 = [INUserActivityDescriptor alloc];
  id v8 = [*(id *)(a1 + 32) userActivityType];
  int v10 = [v7 localizedName];
  id v11 = [v7 bundleIdentifier];
  objc_super v12 = [*(id *)(a1 + 32) extensionBundleIdentifier];
  uint64_t v13 = objc_msgSend(v7, "in_counterpartIdentifiers");
  v14 = [v7 teamIdentifier];
  v15 = objc_msgSend(v7, "in_supportedIntents");
  v16 = [*(id *)(a1 + 32) bundleURL];
  v17 = [(INUserActivityDescriptor *)v19 initWithUserActivityType:v8 localizedName:v10 bundleIdentifier:v11 extensionBundleIdentifier:v12 counterpartIdentifiers:v13 teamIdentifier:v14 supportedIntents:v15 bundleURL:v16];

LABEL_7:
LABEL_8:

  return v17;
}

- (id)resolvedUserActivityMatchingDescriptor:(id)a3
{
  id v4 = a3;
  if (INDescriptorContainsBundleIdentifiers(v4))
  {
    id v5 = v4;
    if ([(INAppResolver *)self cacheHasResultForDescriptor:v5])
    {
      id v6 = [(INAppResolver *)self cachedResultForKey:v5];
    }
    else
    {
      id v6 = [(INAppResolver *)self _resolvedUserActivityMatchingDescriptor:v5];
      [(INAppResolver *)self cacheResult:v6 forDescriptor:v5];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_resolvedIntentMatchingDescriptor:(id)a3
{
  uint64_t v206 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x192F98250]();
  uint64_t v5 = [(INAppResolver *)self resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:v4];
  v157 = (void *)v5;
  if (v5)
  {
    id v6 = (void *)v5;
    v168 = [INIntentDescriptor alloc];
    v165 = [v4 intentClassName];
    v163 = [v6 localizedName];
    id v7 = [v6 bundleIdentifier];
    id v8 = [v6 bundleIdentifier];
    v159 = [v6 extensionBundleIdentifier];
    int v9 = [v4 uiExtensionBundleIdentifier];
    [v6 counterpartIdentifiers];
    long long v153 = objc = self;
    long long v148 = [v6 teamIdentifier];
    uint64_t v10 = [v4 preferredCallProvider];
    id v11 = [v6 supportedIntents];
    [v6 bundleURL];
    v13 = objc_super v12 = v4;
    v14 = [v6 documentTypes];
    uint64_t v169 = [(INIntentDescriptor *)v168 initWithIntentClassName:v165 localizedName:v163 bundleIdentifier:v7 displayableBundleIdentifier:v8 extensionBundleIdentifier:v159 uiExtensionBundleIdentifier:v9 counterpartIdentifiers:v153 teamIdentifier:v148 preferredCallProvider:v10 supportedIntents:v11 bundleURL:v13 documentTypes:v14];

    self = objc;
    id v4 = (id)v169;
  }
  v15 = [v4 extensionBundleIdentifier];

  if (v15)
  {
    v16 = [(INAppResolver *)self _systemAppMapper];
    v17 = [v4 extensionBundleIdentifier];
    uint64_t v18 = [v4 preferredCallProvider];
    v19 = [v4 intentClassName];
    id v20 = [v16 resolvedIntentMatchingExtensionBundleIdentifier:v17 preferredCallProvider:v18 intentClassName:v19];

    if (v20) {
      goto LABEL_108;
    }
  }
  v21 = [v4 intentClassName];
  v164 = [(INAppResolver *)self optionsForCurrentContextWithIntentClassName:v21];

  v22 = [v4 bundleIdentifier];

  if (v22)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F223C8]);
    v24 = [v4 bundleIdentifier];
    v25 = (void *)[v23 initWithBundleIdentifier:v24 allowPlaceholder:0 error:0];

    v26 = [v25 applicationState];
    if ([v26 isInstalled])
    {
      int v27 = INApplicationRecordMatchesRequirementsFromIntentDescriptor(v25, v4, v164);

      if (v27)
      {
        v28 = [v25 localizedName];
        v29 = [v4 displayableBundleIdentifier];
        id v30 = v29;
        if (v29)
        {
          id v31 = v29;
        }
        else
        {
          id v31 = [v25 bundleIdentifier];
        }
        id v109 = v31;

        v110 = [v25 bundleIdentifier];
        char v111 = [v110 isEqualToString:v109];

        v171 = v109;
        if (v111)
        {
          id objb = v28;
        }
        else
        {
          v112 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v109 allowPlaceholder:0 error:0];
          v113 = [v112 localizedName];

          if (v113)
          {
            uint64_t v114 = [v112 localizedName];

            id objb = (id)v114;
          }
          else
          {
            id objb = v28;
          }
        }
        v167 = [INIntentDescriptor alloc];
        long long v152 = [v4 intentClassName];
        v162 = [v25 bundleIdentifier];
        v156 = [v4 extensionBundleIdentifier];
        long long v134 = [v4 uiExtensionBundleIdentifier];
        id v147 = objc_msgSend(v25, "in_counterpartIdentifiers");
        long long v143 = [v25 teamIdentifier];
        uint64_t v135 = [v4 preferredCallProvider];
        id v136 = objc_msgSend(v25, "in_supportedIntents");
        long long v137 = [v4 bundleURL];
        long long v138 = objc_msgSend(v25, "in_documentTypes");
        uint64_t v139 = [(INIntentDescriptor *)v167 initWithIntentClassName:v152 localizedName:objb bundleIdentifier:v162 displayableBundleIdentifier:v171 extensionBundleIdentifier:v156 uiExtensionBundleIdentifier:v134 counterpartIdentifiers:v147 teamIdentifier:v143 preferredCallProvider:v135 supportedIntents:v136 bundleURL:v137 documentTypes:v138];

        id v20 = (id)v139;
        goto LABEL_107;
      }
    }
    else
    {
    }
  }
  int v32 = self;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  v33 = [v4 counterpartIdentifiers];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v197 objects:v205 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v198;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v198 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:*(void *)(*((void *)&v197 + 1) + 8 * i) allowPlaceholder:0 error:0];
        v39 = [v38 applicationState];
        if ([v39 isInstalled])
        {
          int v40 = INApplicationRecordMatchesRequirementsFromIntentDescriptor(v38, v4, v164);

          if (v40)
          {
            uint64_t v82 = [v38 localizedName];
            v83 = [v4 displayableBundleIdentifier];
            v84 = v83;
            if (v83)
            {
              id v85 = v83;
            }
            else
            {
              id v85 = [v38 bundleIdentifier];
            }
            v86 = v85;

            id v87 = [v38 bundleIdentifier];
            char v88 = [v87 isEqualToString:v86];

            if (v88)
            {
              v170 = v82;
            }
            else
            {
              uint64_t v89 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v86 allowPlaceholder:0 error:0];
              uint64_t v90 = [v89 localizedName];

              if (v90)
              {
                uint64_t v91 = [v89 localizedName];

                v170 = (void *)v91;
              }
              else
              {
                v170 = v82;
              }
            }
            uint64_t v160 = [INIntentDescriptor alloc];
            id objd = [v4 intentClassName];
            v145 = [v38 bundleIdentifier];
            long long v155 = [v4 extensionBundleIdentifier];
            long long v150 = [v4 uiExtensionBundleIdentifier];
            long long v142 = objc_msgSend(v38, "in_counterpartIdentifiers");
            long long v141 = [v38 teamIdentifier];
            uint64_t v103 = [v4 preferredCallProvider];
            v104 = objc_msgSend(v38, "in_supportedIntents");
            v105 = [v4 bundleURL];
            objc_msgSend(v38, "in_documentTypes");
            v107 = id v106 = v4;
            uint64_t v108 = [(INIntentDescriptor *)v160 initWithIntentClassName:objd localizedName:v170 bundleIdentifier:v145 displayableBundleIdentifier:v86 extensionBundleIdentifier:v155 uiExtensionBundleIdentifier:v150 counterpartIdentifiers:v142 teamIdentifier:v141 preferredCallProvider:v103 supportedIntents:v104 bundleURL:v105 documentTypes:v107];

            id v4 = v106;
            id v20 = (id)v108;

            goto LABEL_107;
          }
        }
        else
        {
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v197 objects:v205 count:16];
    }
    while (v35);
  }

  char v41 = [v4 bundleIdentifier];

  uint64_t v42 = v32;
  if (v41)
  {
    uint64_t v43 = [(INAppResolver *)v32 _systemAppMapper];
    uint64_t v44 = [v4 bundleIdentifier];
    uint64_t v45 = [v4 preferredCallProvider];
    v46 = [v4 intentClassName];
    id v20 = [v43 resolvedIntentMatchingAppBundleIdentifier:v44 preferredCallProvider:v45 intentClassName:v46];

    if (v20) {
      goto LABEL_107;
    }
  }
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v48 = [v4 extensionBundleIdentifier];

  if (v48)
  {
    v49 = [v4 extensionBundleIdentifier];
    v50 = [(INAppResolver *)v32 _frameworkMapper];
    uint64_t v51 = [v50 launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:v49];

    id v52 = [(INAppResolver *)v32 _frameworkMapper];
    uint64_t v53 = [v52 displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:v49];

    if (v51 | v53)
    {
      if ([v4 preferredCallProvider] == 2)
      {
        uint64_t v54 = [(INAppResolver *)v32 _systemAppMapper];
        uint64_t v55 = [v54 bundleIdentifiersForIntentExecutionMatchingBundleIdentifier:@"com.apple.facetime"];
        uint64_t v56 = [v55 firstObject];

        uint64_t v53 = v56;
        uint64_t v42 = v32;
      }
      v57 = [INIntentDescriptor alloc];
      v58 = [v4 extensionBundleIdentifier];
      id v59 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v57, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", 0, 0, v51, v53, v58, 0, 0, 0, [v4 preferredCallProvider], 0, 0, 0);

      [v47 addObject:v59];
    }
  }
  id obj = v42;
  v60 = [(INAppResolver *)v42 _systemAppMapper];
  id v61 = [v4 bundleIdentifier];
  uint64_t v62 = [v60 bundleIdentifiersForIntentExecutionMatchingBundleIdentifier:v61];

  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id v63 = v62;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v193 objects:v204 count:16];
  uint64_t v65 = v64;
  if (v64)
  {
    uint64_t v66 = *(void *)v194;
    uint64_t v67 = v64;
    do
    {
      for (uint64_t j = 0; j != v67; ++j)
      {
        if (*(void *)v194 != v66) {
          objc_enumerationMutation(v63);
        }
        v69 = [[INIntentDescriptor alloc] initWithIntentClassName:0 localizedName:0 bundleIdentifier:*(void *)(*((void *)&v193 + 1) + 8 * j) displayableBundleIdentifier:0 extensionBundleIdentifier:0 uiExtensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 preferredCallProvider:0 supportedIntents:0 bundleURL:0 documentTypes:0];
        [v47 addObject:v69];
      }
      uint64_t v67 = [v63 countByEnumeratingWithState:&v193 objects:v204 count:16];
    }
    while (v67);
  }

  int v70 = [(INAppResolver *)obj _counterpartMapper];
  v71 = [v4 bundleIdentifier];
  id v72 = [v70 localIdentifiersForCounterpartIdentifier:v71];

  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  id obja = v72;
  uint64_t v73 = [obja countByEnumeratingWithState:&v189 objects:v203 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v190;
    do
    {
      for (uint64_t k = 0; k != v74; ++k)
      {
        if (*(void *)v190 != v75) {
          objc_enumerationMutation(obja);
        }
        v77 = [[INIntentDescriptor alloc] initWithIntentClassName:0 localizedName:0 bundleIdentifier:*(void *)(*((void *)&v189 + 1) + 8 * k) displayableBundleIdentifier:0 extensionBundleIdentifier:0 uiExtensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 preferredCallProvider:0 supportedIntents:0 bundleURL:0 documentTypes:0];
        [v47 addObject:v77];
      }
      uint64_t v74 = [obja countByEnumeratingWithState:&v189 objects:v203 count:16];
    }
    while (v74);
  }

  v186[0] = MEMORY[0x1E4F143A8];
  v186[1] = 3221225472;
  v186[2] = __51__INAppResolver__resolvedIntentMatchingDescriptor___block_invoke;
  v186[3] = &unk_1E5517C70;
  id v154 = v4;
  id v78 = v4;
  id v187 = v78;
  id v79 = v164;
  id v188 = v79;
  uint64_t v80 = objc_msgSend(v47, "if_compactMap:", v186);
  [v47 removeAllObjects];
  if ([v80 count] == 1)
  {
    uint64_t v81 = v80;
LABEL_69:
    id v102 = [v81 anyObject];
LABEL_70:
    id v20 = v102;
    goto LABEL_71;
  }
  if ((unint64_t)[v80 count] < 2)
  {
    uint64_t v115 = [v80 count];
    if (v65 && !v115)
    {
      id v102 = v78;
      goto LABEL_70;
    }
  }
  else
  {
    v92 = [v80 allObjects];
    [v47 addObjectsFromArray:v92];
  }
  if (![v80 count])
  {
    id v144 = v63;
    long long v149 = v80;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    v93 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
    uint64_t v94 = [v93 countByEnumeratingWithState:&v182 objects:v202 count:16];
    if (v94)
    {
      uint64_t v95 = v94;
      uint64_t v96 = *(void *)v183;
      do
      {
        for (uint64_t m = 0; m != v95; ++m)
        {
          if (*(void *)v183 != v96) {
            objc_enumerationMutation(v93);
          }
          uint64_t v98 = *(void **)(*((void *)&v182 + 1) + 8 * m);
          uint64_t v99 = (void *)MEMORY[0x192F98250]();
          if (INApplicationRecordMatchesRequirementsFromIntentDescriptor(v98, v78, v79))
          {
            v100 = [(INAppDescriptor *)[INIntentDescriptor alloc] initWithApplicationRecord:v98];
            uint64_t v101 = [(INIntentDescriptor *)v100 mergeWithDescriptor:v78];
            [v47 addObject:v101];
          }
        }
        uint64_t v95 = [v93 countByEnumeratingWithState:&v182 objects:v202 count:16];
      }
      while (v95);
    }

    id v63 = v144;
    uint64_t v80 = v149;
  }
  if ([v47 count] == 1)
  {
    uint64_t v81 = v47;
    goto LABEL_69;
  }
  long long v151 = v80;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  id v116 = v47;
  uint64_t v166 = [v116 countByEnumeratingWithState:&v178 objects:v201 count:16];
  if (!v166)
  {

    goto LABEL_112;
  }
  id v146 = v63;
  id v20 = 0;
  uint64_t v117 = *(void *)v179;
  uint64_t v172 = 0x7FFFFFFFFFFFFFFFLL;
  id v161 = v78;
  do
  {
    for (uint64_t n = 0; n != v166; ++n)
    {
      if (*(void *)v179 != v117) {
        objc_enumerationMutation(v116);
      }
      id v119 = *(void **)(*((void *)&v178 + 1) + 8 * n);
      v120 = [v78 localizedName];

      if (v120)
      {
        uint64_t v121 = [v78 localizedName];
        id v122 = [v119 localizedName];
        uint64_t v123 = INEditDistanceBetweenStrings(v121, v122);
      }
      else
      {
        uint64_t v125 = [v78 bundleIdentifier];

        if (!v125) {
          continue;
        }
        v126 = [v78 bundleIdentifier];
        id v127 = [v119 bundleIdentifier];
        uint64_t v121 = [v126 commonPrefixWithString:v127 options:0];

        if (![v121 length]) {
          goto LABEL_96;
        }
        v128 = [v78 bundleIdentifier];
        id v122 = objc_msgSend(v128, "substringFromIndex:", objc_msgSend(v121, "length"));

        v129 = [v119 bundleIdentifier];
        objc_msgSend(v129, "substringFromIndex:", objc_msgSend(v121, "length"));
        uint64_t v130 = v117;
        id v131 = v116;
        v133 = id v132 = v20;

        uint64_t v123 = INEditDistanceBetweenStrings(v122, v133);
        id v20 = v132;
        id v116 = v131;
        uint64_t v117 = v130;
        id v78 = v161;
      }

      if (v123 < v172 && v123 <= 5)
      {
        uint64_t v121 = v20;
        id v20 = v119;
        uint64_t v172 = v123;
LABEL_96:

        continue;
      }
    }
    uint64_t v166 = [v116 countByEnumeratingWithState:&v178 objects:v201 count:16];
  }
  while (v166);

  id v63 = v146;
  if (v20)
  {
    [v20 setRequiresUserConfirmation:v172 > 0];
    goto LABEL_113;
  }
LABEL_112:
  id v20 = v78;
LABEL_113:
  uint64_t v80 = v151;
LABEL_71:

  id v4 = v154;
LABEL_107:

LABEL_108:

  return v20;
}

id __51__INAppResolver__resolvedIntentMatchingDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 bundleIdentifier];

  id v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [v7 applicationState];
  if (![(INAppDescriptor *)v8 isInstalled])
  {
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  int v9 = INApplicationRecordMatchesRequirementsFromIntentDescriptor(v7, *(void **)(a1 + 32), *(void **)(a1 + 40));

  if (!v9)
  {
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  id v8 = [(INAppDescriptor *)[INIntentDescriptor alloc] initWithApplicationRecord:v7];
  uint64_t v10 = [(INIntentDescriptor *)v8 mergeWithDescriptor:*(void *)(a1 + 32)];
LABEL_7:

LABEL_8:

  return v10;
}

- (id)resolvedIntentMatchingDescriptor:(id)a3
{
  id v4 = a3;
  if (INDescriptorContainsBundleIdentifiers(v4))
  {
    id v5 = v4;
    if ([(INAppResolver *)self cacheHasResultForDescriptor:v5])
    {
      id v6 = [(INAppResolver *)self cachedResultForKey:v5];
    }
    else
    {
      id v6 = [(INAppResolver *)self _resolvedIntentMatchingDescriptor:v5];
      [(INAppResolver *)self cacheResult:v6 forDescriptor:v5];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_resolvedAppMatchingDescriptor:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192F98250]();
  uint64_t v99 = [(INAppResolver *)self optionsForCurrentContextWithIntentClassName:0];
  id v6 = [v4 bundleIdentifier];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F223C8]);
    id v8 = [v4 bundleIdentifier];
    int v9 = (void *)[v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:0];

    uint64_t v10 = [v9 applicationState];
    if ([v10 isInstalled])
    {
      char v11 = INApplicationRecordMatchesRequirementsFromDescriptor(v9, v4, v99);

      if (v11)
      {
        id v12 = [v4 descriptorWithRecord:v9];

        goto LABEL_69;
      }
    }
    else
    {
    }
  }
  uint64_t v94 = v5;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  uint64_t v13 = [v4 counterpartIdentifiers];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v115 objects:v122 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v116;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v116 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:*(void *)(*((void *)&v115 + 1) + 8 * i) allowPlaceholder:0 error:0];
        v19 = [v18 applicationState];
        if ([v19 isInstalled])
        {
          char v20 = INApplicationRecordMatchesRequirementsFromDescriptor(v18, v4, v99);

          if (v20)
          {
            id v12 = [v4 descriptorWithRecord:v18];

            goto LABEL_68;
          }
        }
        else
        {
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v115 objects:v122 count:16];
    }
    while (v15);
  }

  uint64_t v13 = [(INAppResolver *)self resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:v4];
  if (v13)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F223C8]);
    v22 = [v13 bundleURL];
    id v23 = (id)[v21 initWithURL:v22 allowPlaceholder:0 error:0];

    v24 = [v23 applicationState];
    if ([v24 isInstalled])
    {
      char v25 = INApplicationRecordMatchesRequirementsFromDescriptor(v23, v4, v99);

      if (v25)
      {
        id v12 = [v4 descriptorWithRecord:v23];
        goto LABEL_67;
      }
    }
    else
    {
    }
    id v26 = v13;

    id v4 = v26;
  }
  int v27 = [v4 extensionBundleIdentifier];

  if (!v27) {
    goto LABEL_26;
  }
  v28 = [(INAppResolver *)self _systemAppMapper];
  v29 = [v4 extensionBundleIdentifier];
  id v12 = [v28 resolvedAppMatchingExtensionBundleIdentifier:v29];

  if (!v12)
  {
LABEL_26:
    v93 = v13;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v30 = [(INAppResolver *)self _counterpartMapper];
    id v31 = [v4 bundleIdentifier];
    int v32 = [v30 localIdentifiersForCounterpartIdentifier:v31];

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v111 objects:v121 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v112;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v112 != v36) {
            objc_enumerationMutation(v33);
          }
          id v38 = [[INAppDescriptor alloc] initWithBundleIdentifier:*(void *)(*((void *)&v111 + 1) + 8 * j)];
          [v23 addObject:v38];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v111 objects:v121 count:16];
      }
      while (v35);
    }

    v39 = [(INAppResolver *)self _systemAppMapper];
    int v40 = [v4 bundleIdentifier];
    char v41 = [v39 matchForBundleIdentifier:v40];

    uint64_t v42 = v41;
    if (v41)
    {
      if ([v41 appIsUnavailableOnCurrentPlatform])
      {
        id v12 = v4;
        goto LABEL_66;
      }
      uint64_t v43 = [INAppDescriptor alloc];
      uint64_t v44 = [v41 bundleIdentifierForCurrentPlatform];
      uint64_t v45 = [(INAppDescriptor *)v43 initWithBundleIdentifier:v44];

      uint64_t v42 = v41;
      [v23 addObject:v45];
    }
    v46 = [v4 extensionBundleIdentifier];

    if (v46)
    {
      id v47 = v42;
      id v48 = [v4 extensionBundleIdentifier];
      v49 = [(INAppResolver *)self _frameworkMapper];
      v50 = [v49 launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:v48];

      uint64_t v51 = [(INAppResolver *)self _frameworkMapper];
      id v52 = [v51 displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:v48];

      if (v50)
      {
        uint64_t v53 = [[INAppDescriptor alloc] initWithBundleIdentifier:v50];
        [v23 addObject:v53];
      }
      if (v52)
      {
        uint64_t v54 = [[INAppDescriptor alloc] initWithBundleIdentifier:v52];
        [v23 addObject:v54];
      }
      uint64_t v42 = v47;
    }
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __48__INAppResolver__resolvedAppMatchingDescriptor___block_invoke;
    v108[3] = &unk_1E5517C48;
    id v92 = v4;
    id v55 = v4;
    id v109 = v55;
    id v56 = v99;
    id v110 = v56;
    v57 = objc_msgSend(v23, "if_compactMap:", v108);
    [v23 removeAllObjects];
    if ([v57 count] == 1)
    {
      v58 = v57;
LABEL_63:
      id v61 = [v58 anyObject];
      goto LABEL_64;
    }
    if ((unint64_t)[v57 count] < 2)
    {
      uint64_t v60 = [v57 count];
      if (v42 && !v60)
      {
        id v61 = v55;
LABEL_64:
        id v12 = v61;
        goto LABEL_65;
      }
    }
    else
    {
      id v59 = [v57 allObjects];
      [v23 addObjectsFromArray:v59];
    }
    if (![v57 count])
    {
      char v88 = v57;
      uint64_t v90 = v42;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      uint64_t v62 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
      uint64_t v63 = [v62 countByEnumeratingWithState:&v104 objects:v120 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v105;
        do
        {
          for (uint64_t k = 0; k != v64; ++k)
          {
            if (*(void *)v105 != v65) {
              objc_enumerationMutation(v62);
            }
            uint64_t v67 = *(void **)(*((void *)&v104 + 1) + 8 * k);
            v68 = (void *)MEMORY[0x192F98250]();
            if (INApplicationRecordMatchesRequirementsFromDescriptor(v67, v55, v56))
            {
              v69 = [[INAppDescriptor alloc] initWithApplicationRecord:v67];
              [v23 addObject:v69];
            }
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v104 objects:v120 count:16];
        }
        while (v64);
      }

      v57 = v88;
      uint64_t v42 = v90;
    }
    if ([v23 count] == 1)
    {
      v58 = v23;
      goto LABEL_63;
    }
    uint64_t v91 = v42;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v71 = v23;
    uint64_t v97 = [v71 countByEnumeratingWithState:&v100 objects:v119 count:16];
    if (!v97)
    {

      goto LABEL_94;
    }
    uint64_t v89 = v57;
    id v12 = 0;
    id v95 = v55;
    uint64_t v96 = *(void *)v101;
    uint64_t v98 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_74:
    uint64_t v72 = 0;
    while (1)
    {
      if (*(void *)v101 != v96) {
        objc_enumerationMutation(v71);
      }
      uint64_t v73 = *(void **)(*((void *)&v100 + 1) + 8 * v72);
      uint64_t v74 = objc_msgSend(v55, "localizedName", v89);

      if (v74) {
        break;
      }
      id v79 = [v55 bundleIdentifier];

      if (!v79) {
        goto LABEL_89;
      }
      uint64_t v80 = [v55 bundleIdentifier];
      uint64_t v81 = [v73 bundleIdentifier];
      uint64_t v75 = [v80 commonPrefixWithString:v81 options:0];

      if ([v75 length])
      {
        uint64_t v82 = [v55 bundleIdentifier];
        uint64_t v76 = objc_msgSend(v82, "substringFromIndex:", objc_msgSend(v75, "length"));

        v83 = [v73 bundleIdentifier];
        objc_msgSend(v83, "substringFromIndex:", objc_msgSend(v75, "length"));
        id v84 = v33;
        id v85 = v71;
        id v87 = v86 = v12;

        uint64_t v77 = INEditDistanceBetweenStrings(v76, v87);
        id v12 = v86;
        id v71 = v85;
        id v33 = v84;
        id v55 = v95;
        goto LABEL_79;
      }
LABEL_85:

LABEL_89:
      if (v97 == ++v72)
      {
        uint64_t v97 = [v71 countByEnumeratingWithState:&v100 objects:v119 count:16];
        if (!v97)
        {

          v57 = v89;
          if (v12)
          {
            [v12 setRequiresUserConfirmation:v98 > 0];
            goto LABEL_95;
          }
LABEL_94:
          id v12 = v55;
LABEL_95:
          uint64_t v42 = v91;
LABEL_65:

          id v4 = v92;
LABEL_66:

          uint64_t v13 = v93;
LABEL_67:

          goto LABEL_68;
        }
        goto LABEL_74;
      }
    }
    uint64_t v75 = [v55 localizedName];
    uint64_t v76 = [v73 localizedName];
    uint64_t v77 = INEditDistanceBetweenStrings(v75, v76);
LABEL_79:

    if (v77 >= v98 || v77 > 5) {
      goto LABEL_89;
    }
    uint64_t v75 = v12;
    id v12 = v73;
    uint64_t v98 = v77;
    goto LABEL_85;
  }
LABEL_68:

  id v5 = v94;
LABEL_69:

  return v12;
}

id __48__INAppResolver__resolvedAppMatchingDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 bundleIdentifier];

  id v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
  if (v7)
  {
    id v8 = [v7 applicationState];
    if ([v8 isInstalled])
    {
      int v9 = INApplicationRecordMatchesRequirementsFromDescriptor(v7, *(void **)(a1 + 32), *(void **)(a1 + 40));

      if (v9)
      {
        uint64_t v10 = [*(id *)(a1 + 32) descriptorWithRecord:v7];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

- (id)resolvedAppMatchingDescriptor:(id)a3
{
  id v4 = a3;
  if (INDescriptorContainsBundleIdentifiers(v4))
  {
    id v5 = v4;
    if ([(INAppResolver *)self cacheHasResultForDescriptor:v5])
    {
      id v6 = [(INAppResolver *)self cachedResultForKey:v5];
    }
    else
    {
      id v6 = [(INAppResolver *)self _resolvedAppMatchingDescriptor:v5];
      [(INAppResolver *)self cacheResult:v6 forDescriptor:v5];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INAppResolverLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INAppResolverLogInitIfNeeded_once, &__block_literal_global_6_71970);
  }
}

uint64_t __31__INAppResolver_sharedResolver__block_invoke()
{
  sharedResolver_sharedResolver = objc_alloc_init(INAppResolver);

  return MEMORY[0x1F41817F8]();
}

+ (id)supportedIntentsOverridesForThirdPartyBundleIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F1CC08] objectForKey:a3];
}

@end