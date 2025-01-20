@interface DOCDocumentSource
+ (BOOL)supportsSecureCoding;
+ (id)applicationIconForBundleIdentifier:(id)a3 size:(int64_t)a4;
+ (id)defaultSourceForBundleIdentifier:(id)a3 defaultSourceIdentifier:(id)a4 sources:(id)a5;
+ (id)defaultSourceIdentifierForBundleIdentifier:(id)a3;
+ (id)iconForFileProvider:(id)a3 size:(int64_t)a4;
+ (id)sourceIdentifierOrderWithDefault:(id)a3;
+ (id)startSearchingSourcesForBundleIdentifier:(id)a3 updateBlock:(id)a4;
+ (void)defaultSourceForBundleIdentifier:(id)a3 completionBlock:(id)a4;
+ (void)defaultSourceForBundleIdentifier:(id)a3 selectedSourceIdentifier:(id)a4 completionBlock:(id)a5;
+ (void)endSearchingSources:(id)a3;
+ (void)setDefaultSource:(id)a3 forBundleIdentifier:(id)a4;
+ (void)setDefaultSourceIdentifier:(id)a3 forBundleIdentifier:(id)a4;
- (BOOL)appearsInMoveUI;
- (BOOL)hidden;
- (BOOL)isAvailableSystemWide;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForConfiguration:(id)a3;
- (BOOL)isiCloudBased;
- (BOOL)usesEnumeration;
- (DOCDocumentSource)init;
- (DOCDocumentSource)initWithCoder:(id)a3;
- (FPProviderDomain)searching_fileProviderDomain;
- (NSArray)documentContentTypes;
- (NSArray)supportedSearchFilters;
- (NSMutableDictionary)iconsBySize;
- (NSString)displayName;
- (NSString)domainName;
- (NSString)identifier;
- (NSString)promptText;
- (NSString)providerName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)iconForSize:(int64_t)a3;
- (id)loadIconForSize:(int64_t)a3;
- (id)sanitizedSource;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDocumentContentTypes:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIconsBySize:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPromptText:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setSearching_fileProviderDomain:(id)a3;
@end

@implementation DOCDocumentSource

- (void)setDocumentContentTypes:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    char v6 = [v5 isEqual:self->_identifier];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isValidForConfiguration:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 documentContentTypes];
  char v6 = [v5 containsObject:*MEMORY[0x263F1DB30]];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v8 = [(DOCDocumentSource *)self documentContentTypes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          v14 = [v4 documentContentTypes];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v23 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                if (([v19 conformsToType:v13] & 1) != 0
                  || ([v13 conformsToType:v19] & 1) != 0)
                {

                  BOOL v7 = 1;
                  goto LABEL_22;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              uint64_t v11 = v21;
              if (v16) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
        BOOL v7 = 0;
      }
      while (v10);
    }
    else
    {
      BOOL v7 = 0;
    }
LABEL_22:
  }
  return v7;
}

void __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v25 = a3;
  id v4 = [v25 providerID];
  if (([v4 isEqualToString:*MEMORY[0x263F3AB48]] & 1) != 0
    || ([v25 canDisconnect] & 1) != 0)
  {
    goto LABEL_5;
  }
  v5 = [v25 identifier];
  if (DOCProviderDomainIDIsRemovable()) {
    goto LABEL_4;
  }
  char v6 = [v25 isHidden];

  if ((v6 & 1) == 0)
  {
    BOOL v7 = [MEMORY[0x263F3AB98] defaultPermission];
    id v4 = [v7 hostIdentifier];

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [MEMORY[0x263F3AB98] defaultPermission];
    [v9 setHostIdentifier:v8];

    uint64_t v10 = [MEMORY[0x263F3AB98] defaultPermission];
    LODWORD(v9) = [v10 canHostAppPerformAction:0 fileProviderDomain:v25];

    uint64_t v11 = [MEMORY[0x263F3AB98] defaultPermission];
    [v11 setHostIdentifier:v4];

    if (!v9) {
      goto LABEL_5;
    }
    if (![v25 supportsEnumeration]) {
      goto LABEL_5;
    }
    if (![v25 isEnabled]) {
      goto LABEL_5;
    }
    if ([v25 isHidden]) {
      goto LABEL_5;
    }
    if ([v25 needsAuthentication]) {
      goto LABEL_5;
    }
    v12 = [v25 identifier];
    char v13 = DOCProviderDomainIDIsDefaultSharedServer();

    if (v13) {
      goto LABEL_5;
    }
    if (([v25 isAvailableSystemWide] & 1) == 0)
    {
      v14 = [v25 topLevelBundleIdentifier];
      int v15 = [v14 isEqualToString:*(void *)(a1 + 32)];

      if (!v15) {
        goto LABEL_5;
      }
    }
    v5 = [v25 extensionBundleURL];
    uint64_t v16 = objc_msgSend(MEMORY[0x263F01858], "doc_applicationExtensionRecordAtURL:", v5);
    uint64_t v17 = [v16 infoDictionary];
    uint64_t v18 = objc_opt_class();
    v19 = [v17 objectForKey:@"NSExtension" ofClass:v18 valuesOfClass:objc_opt_class()];

    v20 = [v19 objectForKey:@"NSExtensionFileProviderCanBeDefaultLocation"];
    uint64_t v21 = v20;
    if (!v20 || [v20 BOOLValue])
    {
      long long v22 = *(void **)(a1 + 40);
      long long v23 = [[DOCSearchingDocumentSource alloc] initWithProviderDomain:v25];
      long long v24 = [v25 identifier];
      [v22 setValue:v23 forKey:v24];
    }
LABEL_4:

LABEL_5:
  }
}

- (void)setIdentifier:(id)a3
{
}

- (DOCDocumentSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)DOCDocumentSource;
  v2 = [(DOCDocumentSource *)&v6 init];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (void)setSearching_fileProviderDomain:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setPromptText:(id)a3
{
}

- (NSString)promptText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconsBySize, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_searching_fileProviderDomain, 0);
  objc_storeStrong((id *)&self->_promptText, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_documentContentTypes, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (void)endSearchingSources:(id)a3
{
  v3 = (void *)MEMORY[0x263F054C8];
  id v4 = [a3 monitoringContext];
  [v3 endMonitoringProviderDomainChanges:v4];
}

void __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = objc_opt_new();
  if (v6)
  {
    uint64_t v8 = (NSObject **)MEMORY[0x263F3AC28];
    uint64_t v9 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      uint64_t v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke_cold_1((uint64_t)v6, v9);
    }
  }
  else
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke_29;
    int v15 = &unk_2641B1BB0;
    id v16 = *(id *)(a1 + 32);
    id v17 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:&v12];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = objc_msgSend(v7, "copy", v12, v13, v14, v15);
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

void __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 80);
  objc_sync_enter(v7);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    objc_sync_exit(v7);
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 1;
    objc_sync_exit(v7);

    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
      uint64_t v9 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        id v17 = (NSObject **)MEMORY[0x263F3AC28];
        DOCInitLogging();
        uint64_t v9 = *v17;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_cold_2(a1 + 64, v9);
      }
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 80) defaultSourceForBundleIdentifier:*(void *)(a1 + 32) defaultSourceIdentifier:*(void *)(a1 + 40) sources:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
      {
        uint64_t v13 = *MEMORY[0x263F3AC28];
        if (!*MEMORY[0x263F3AC28])
        {
          uint64_t v18 = (NSObject **)MEMORY[0x263F3AC28];
          DOCInitLogging();
          uint64_t v13 = *v18;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v5, v13);
        }
        uint64_t v14 = DOCErrorNoLocationAvailableError(0);
        uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

+ (id)defaultSourceForBundleIdentifier:(id)a3 defaultSourceIdentifier:(id)a4 sources:(id)a5
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v65 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v10 = [a1 sourceIdentifierOrderWithDefault:v8];
  uint64_t v67 = [v10 countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v67)
  {
    uint64_t v12 = *(void *)v83;
    uint64_t v13 = *MEMORY[0x263F3AB18];
    uint64_t v62 = *MEMORY[0x263F3AB20];
    uint64_t v58 = *MEMORY[0x263F3AB28];
    uint64_t v57 = *MEMORY[0x263F3AB30];
    *(void *)&long long v11 = 138412290;
    long long v56 = v11;
    uint64_t v60 = *(void *)v83;
    id v61 = v8;
    v63 = v10;
    id v64 = v9;
    uint64_t v59 = *MEMORY[0x263F3AB18];
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v83 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v66 = *(void *)(*((void *)&v82 + 1) + 8 * v14);
      uint64_t v15 = [v9 objectForKeyedSubscript:v56];
      id v16 = v8;
      if (([v16 hasPrefix:v13] & 1) != 0
        || ([v16 hasPrefix:v62] & 1) != 0
        || ([v16 hasPrefix:v58] & 1) != 0)
      {
        int v17 = 1;
      }
      else
      {
        int v17 = [v16 hasPrefix:v57];
      }

      if (v15) {
        int v18 = 0;
      }
      else {
        int v18 = v17;
      }
      if (v8 && !v18) {
        goto LABEL_47;
      }
      v68 = v15;
      v19 = [MEMORY[0x263F3AB98] defaultPermission];
      uint64_t v69 = [v19 dataOwnerStateForBundleIdentifier:v65];

      v20 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      uint64_t v21 = [v9 allValues];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v78 objects:v90 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v79;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v79 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            long long v27 = objc_msgSend(v26, "searching_fileProviderDomain");
            if ([v27 isiCloudDriveProvider])
            {
              long long v28 = objc_msgSend(v26, "searching_fileProviderDomain");
              char v29 = [v28 isHidden];

              if ((v29 & 1) == 0) {
                [v20 addObject:v26];
              }
            }
            else
            {
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v78 objects:v90 count:16];
        }
        while (v23);
      }

      if ([v20 count] == 1)
      {
        uint64_t v15 = [v20 firstObject];
        id v30 = v68;
        uint64_t v10 = v63;
      }
      else
      {
        uint64_t v10 = v63;
        if ((unint64_t)[v20 count] < 2)
        {
          uint64_t v15 = v68;
          uint64_t v12 = v60;
          goto LABEL_46;
        }
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v30 = v20;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v74 objects:v89 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v75;
          while (2)
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v75 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v74 + 1) + 8 * j);
              v36 = objc_msgSend(v35, "searching_fileProviderDomain");
              int v37 = [v36 isEnterpriseDomain];

              if (v37) {
                BOOL v38 = v69 == 1;
              }
              else {
                BOOL v38 = 0;
              }
              if (!v38)
              {
                v39 = objc_msgSend(v35, "searching_fileProviderDomain");
                char v40 = [v39 isEnterpriseDomain];

                if ((v40 & 1) != 0 || v69 == 1) {
                  continue;
                }
              }
              id v54 = v35;

              id v8 = v61;
LABEL_69:
              id v9 = v64;
              goto LABEL_72;
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v74 objects:v89 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }
        uint64_t v15 = v68;
      }
      uint64_t v12 = v60;

LABEL_46:
      id v8 = v61;
      id v9 = v64;
      uint64_t v13 = v59;
LABEL_47:
      if (v15)
      {
        id v54 = v15;

        goto LABEL_73;
      }
      v41 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        v41 = *MEMORY[0x263F3AC28];
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v56;
        uint64_t v88 = v66;
        _os_log_debug_impl(&dword_21361D000, v41, OS_LOG_TYPE_DEBUG, "Wanted to use %@, but it isn't available", buf, 0xCu);
      }
      if (++v14 == v67)
      {
        uint64_t v67 = [v10 countByEnumeratingWithState:&v82 objects:v91 count:16];
        if (v67) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v42 = [v9 allValues];
  v43 = [MEMORY[0x263F3AB98] defaultPermission];
  uint64_t v44 = [v43 defaultFileProviderForAppBundle:v65];

  v68 = (void *)v44;
  if (v44)
  {
    id v64 = v9;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v45 = v42;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v71;
      while (2)
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v71 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v70 + 1) + 8 * k);
          v51 = objc_msgSend(v50, "searching_fileProviderDomain");
          v52 = [v51 topLevelBundleIdentifier];
          char v53 = [v52 isEqualToString:v44];

          if (v53)
          {
            id v54 = v50;
            uint64_t v10 = v45;

            goto LABEL_69;
          }
          uint64_t v44 = (uint64_t)v68;
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v70 objects:v86 count:16];
        if (v47) {
          continue;
        }
        break;
      }
    }

    id v9 = v64;
  }
  if ([v42 count] == 1)
  {
    id v54 = [v42 firstObject];
  }
  else
  {
    id v54 = 0;
  }
  uint64_t v10 = v42;
LABEL_72:

LABEL_73:
  return v54;
}

- (FPProviderDomain)searching_fileProviderDomain
{
  return (FPProviderDomain *)objc_getProperty(self, a2, 56, 1);
}

+ (id)sourceIdentifierOrderWithDefault:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9B0] orderedSetWithCapacity:3];
  id v5 = (void *)MEMORY[0x263F3AB38];
  if (v3)
  {
    if ([v3 isEqualToString:@"com.apple.automatic.Local"])
    {
      id v6 = (id)*v5;
      id v7 = v4;
    }
    else
    {
      id v7 = v4;
      id v6 = v3;
    }
    [v7 addObject:v6];
  }
  int v8 = FPIsCloudDocsWithFPFSEnabled();
  id v9 = (void *)MEMORY[0x263F3AB18];
  if (!v8) {
    id v9 = (void *)MEMORY[0x263F3AB28];
  }
  [v4 addObject:*v9];
  [v4 addObject:*v5];

  return v4;
}

uint64_t __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_54(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    return +[DOCDocumentSource endSearchingSources:](DOCDocumentSource, "endSearchingSources:");
  }
  return result;
}

+ (void)defaultSourceForBundleIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 defaultSourceIdentifierForBundleIdentifier:v7];
  [a1 defaultSourceForBundleIdentifier:v7 selectedSourceIdentifier:v8 completionBlock:v6];
}

+ (id)defaultSourceIdentifierForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  id v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x263F3AB08]];
  id v7 = [v6 valueForKey:@"DOCDefaultFileProviderIdentifierKey"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  id v8 = [v7 objectForKeyedSubscript:v4];
  if ([v8 isEqualToString:@"com.apple.automatic.Local"])
  {
    [a1 setDefaultSourceIdentifier:@"com.apple.automatic.Local" forBundleIdentifier:v4];
    id v9 = @"com.apple.automatic.Local";
  }
  else
  {
    long long v11 = (__CFString *)*MEMORY[0x263F3AB38];
    if ([v8 isEqualToString:*MEMORY[0x263F3AB38]])
    {
      uint64_t v12 = [v6 valueForKey:@"DOCDefaultFileProviderAutomaticKey"];
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 containsObject:v4]) {
            long long v11 = @"com.apple.automatic.Local";
          }
        }
      }
      uint64_t v10 = v11;

      goto LABEL_14;
    }
    id v9 = v8;
  }
  uint64_t v10 = v9;
LABEL_14:

LABEL_15:
  return v10;
}

+ (void)defaultSourceForBundleIdentifier:(id)a3 selectedSourceIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__0;
  v34[4] = __Block_byref_object_dispose__0;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__0;
  v32[4] = __Block_byref_object_dispose__0;
  id v33 = 0;
  dispatch_group_enter(v11);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke;
  v22[3] = &unk_2641B1C00;
  long long v26 = v36;
  long long v27 = v32;
  long long v28 = v34;
  id v29 = a1;
  id v12 = v8;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  uint64_t v14 = v11;
  id v25 = v14;
  id v31 = [a1 startSearchingSourcesForBundleIdentifier:v12 updateBlock:v22];
  uint64_t v15 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_54;
  block[3] = &unk_2641B1C28;
  id v18 = v10;
  v19 = v34;
  v20 = v32;
  uint64_t v21 = v30;
  id v16 = v10;
  dispatch_group_notify(v14, v15, block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

+ (id)startSearchingSourcesForBundleIdentifier:(id)a3 updateBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F054C8];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke;
  int v17 = &unk_2641B1BD8;
  id v18 = v5;
  id v19 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 beginMonitoringProviderDomainChangesWithHandler:&v14];
  long long v11 = [DOCSourceSearchingContext alloc];
  id v12 = -[DOCSourceSearchingContext initWithMonitoringContext:](v11, "initWithMonitoringContext:", v10, v14, v15, v16, v17);

  return v12;
}

+ (void)setDefaultSource:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifier];
  [a1 setDefaultSourceIdentifier:v7 forBundleIdentifier:v6];
}

+ (void)setDefaultSourceIdentifier:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v15 = (__CFString *)a3;
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x263EFFA40]);
  id v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x263F3AB08]];
  id v8 = [v7 valueForKey:@"DOCDefaultFileProviderIdentifierKey"];
  id v9 = [v7 valueForKey:@"DOCDefaultFileProviderAutomaticKey"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v10 = [v8 mutableCopy];
  }
  else {
    uint64_t v10 = objc_opt_new();
  }
  long long v11 = (void *)v10;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v12 = [v9 mutableCopy];
  }
  else {
    uint64_t v12 = objc_opt_new();
  }
  id v13 = (void *)v12;
  if (@"com.apple.automatic.Local" == v15)
  {
    [v11 setValue:*MEMORY[0x263F3AB38] forKey:v5];
    if (([v13 containsObject:v5] & 1) == 0) {
      [v13 addObject:v5];
    }
  }
  else
  {
    [v11 setValue:v15 forKey:v5];
    [v13 removeObject:v5];
  }
  [v7 setValue:v11 forKey:@"DOCDefaultFileProviderIdentifierKey"];
  [v7 setValue:v13 forKey:@"DOCDefaultFileProviderAutomaticKey"];
  notify_post((const char *)DOCDefaultSaveLocationDidChangeNotification);
  dispatch_time_t v14 = dispatch_time(0, 100000000);
  dispatch_after(v14, MEMORY[0x263EF83A0], &__block_literal_global_3);
}

uint64_t __84__DOCDocumentSource_SearchInternal__setDefaultSourceIdentifier_forBundleIdentifier___block_invoke()
{
  return notify_post((const char *)DOCUserPickedNewDefaultSaveLocationNotification);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCDocumentSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DOCDocumentSource;
  id v5 = [(DOCDocumentSource *)&v18 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    [(DOCDocumentSource *)v5 setDisplayName:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerName"];
    [(DOCDocumentSource *)v5 setProviderName:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainName"];
    [(DOCDocumentSource *)v5 setDomainName:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(DOCDocumentSource *)v5 setIdentifier:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promptText"];
    [(DOCDocumentSource *)v5 setPromptText:v10];

    long long v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    dispatch_time_t v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"iconsBySize"];
    [(DOCDocumentSource *)v5 setIconsBySize:v15];

    id v16 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = [(DOCDocumentSource *)self displayName];

  if (v4)
  {
    id v5 = [(DOCDocumentSource *)self displayName];
    [v16 encodeObject:v5 forKey:@"displayName"];
  }
  id v6 = [(DOCDocumentSource *)self providerName];

  if (v6)
  {
    id v7 = [(DOCDocumentSource *)self providerName];
    [v16 encodeObject:v7 forKey:@"providerName"];
  }
  id v8 = [(DOCDocumentSource *)self domainName];

  if (v8)
  {
    id v9 = [(DOCDocumentSource *)self domainName];
    [v16 encodeObject:v9 forKey:@"domainName"];
  }
  uint64_t v10 = [(DOCDocumentSource *)self identifier];

  if (v10)
  {
    long long v11 = [(DOCDocumentSource *)self identifier];
    [v16 encodeObject:v11 forKey:@"identifier"];
  }
  uint64_t v12 = [(DOCDocumentSource *)self promptText];

  if (v12)
  {
    uint64_t v13 = [(DOCDocumentSource *)self identifier];
    [v16 encodeObject:v13 forKey:@"promptText"];
  }
  dispatch_time_t v14 = [(DOCDocumentSource *)self iconsBySize];

  if (v14)
  {
    uint64_t v15 = [(DOCDocumentSource *)self iconsBySize];
    [v16 encodeObject:v15 forKey:@"iconsBySize"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sanitizedSource
{
  id v3 = objc_alloc_init(DOCDocumentSource);
  id v4 = [(DOCDocumentSource *)self displayName];
  [(DOCDocumentSource *)v3 setDisplayName:v4];

  id v5 = [(DOCDocumentSource *)self providerName];
  [(DOCDocumentSource *)v3 setProviderName:v5];

  id v6 = [(DOCDocumentSource *)self domainName];
  [(DOCDocumentSource *)v3 setDomainName:v6];

  id v7 = [(DOCDocumentSource *)self identifier];
  [(DOCDocumentSource *)v3 setIdentifier:v7];

  id v8 = [(DOCDocumentSource *)self iconsBySize];
  [(DOCDocumentSource *)v3 setIconsBySize:v8];

  return v3;
}

- (BOOL)usesEnumeration
{
  return 1;
}

- (BOOL)isAvailableSystemWide
{
  return 1;
}

- (unint64_t)status
{
  return 2;
}

- (NSArray)supportedSearchFilters
{
  return 0;
}

- (BOOL)appearsInMoveUI
{
  return 0;
}

- (BOOL)isiCloudBased
{
  return 0;
}

- (id)iconForSize:(int64_t)a3
{
  id v5 = [(DOCDocumentSource *)self iconsBySize];
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = [(DOCDocumentSource *)self iconsBySize];

    if (!v8)
    {
      id v9 = [MEMORY[0x263EFF9A0] dictionary];
      [(DOCDocumentSource *)self setIconsBySize:v9];
    }
    uint64_t v10 = [(DOCDocumentSource *)self loadIconForSize:a3];
    long long v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)objc_opt_new();
    }
    id v7 = v12;

    uint64_t v13 = [(DOCDocumentSource *)self iconsBySize];
    dispatch_time_t v14 = [NSNumber numberWithInteger:a3];
    [v13 setObject:v7 forKeyedSubscript:v14];
  }
  id v15 = v7;

  return v15;
}

- (id)loadIconForSize:(int64_t)a3
{
  id v3 = (NSObject **)MEMORY[0x263F3AC88];
  id v4 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    id v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[DOCDocumentSource loadIconForSize:](v4);
  }
  return 0;
}

+ (id)iconForFileProvider:(id)a3 size:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[DOCIconService shared];
  id v7 = [v6 iconForFileProvider:v5 size:a4];

  return v7;
}

+ (id)applicationIconForBundleIdentifier:(id)a3 size:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 2)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = [NSNumber numberWithInteger:2];
    [v8 handleFailureInMethod:a2, a1, @"DOCDocumentSource.m", 191, @"Invalid icon size %@", v9 object file lineNumber description];
  }
  else if (a4 == 1)
  {
    a4 = 2;
  }
  else
  {
    a4 = 0;
  }
  uint64_t v10 = (void *)MEMORY[0x263F827E8];
  long long v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 scale];
  id v12 = objc_msgSend(v10, "_applicationIconImageForBundleIdentifier:format:scale:", v7, a4);

  return v12;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)providerName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProviderName:(id)a3
{
}

- (NSArray)documentContentTypes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)domainName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDomainName:(id)a3
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSMutableDictionary)iconsBySize
{
  return self->_iconsBySize;
}

- (void)setIconsBySize:(id)a3
{
}

void __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21361D000, a2, OS_LOG_TYPE_ERROR, "Error while trying to search sources. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21361D000, log, OS_LOG_TYPE_ERROR, "Error: could not find a valid source for %@ (sourcesByID: %@)", (uint8_t *)&v4, 0x16u);
}

void __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21361D000, a2, OS_LOG_TYPE_ERROR, "Error while trying to search the default source. Error: %@", (uint8_t *)&v3, 0xCu);
}

- (void)loadIconForSize:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v2 = 138412290;
  uint64_t v3 = objc_opt_class();
  _os_log_fault_impl(&dword_21361D000, v1, OS_LOG_TYPE_FAULT, "%@ must implement -loadIconForSize:", (uint8_t *)&v2, 0xCu);
}

@end