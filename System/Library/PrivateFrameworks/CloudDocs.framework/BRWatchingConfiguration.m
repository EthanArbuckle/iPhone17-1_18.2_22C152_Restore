@interface BRWatchingConfiguration
- (BRWatchingConfiguration)initWithScopes:(id)a3 predicate:(id)a4;
- (NSArray)appLibraryIDs;
- (NSArray)urls;
- (NSString)gatherPrefix;
- (id)appLibraryIDToURLMapOfSuppliedAppIDs;
- (id)appLibraryIDToURLMapOfSuppliedURLs;
- (unint64_t)watchTypes;
@end

@implementation BRWatchingConfiguration

- (BRWatchingConfiguration)initWithScopes:(id)a3 predicate:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)BRWatchingConfiguration;
  v8 = [(BRWatchingConfiguration *)&v40 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_30;
  }
  v35 = v7;
  v8->_watchTypes = 0;
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  appLibraryIDs = v9->_appLibraryIDs;
  v9->_appLibraryIDs = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  urls = v9->_urls;
  v9->_urls = v12;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v34 = v6;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v15) {
    goto LABEL_21;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v37;
  uint64_t v18 = *MEMORY[0x1E4F28638];
  uint64_t v19 = *MEMORY[0x1E4F28640];
  uint64_t v20 = *MEMORY[0x1E4F28610];
  while (2)
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v37 != v17) {
        objc_enumerationMutation(v14);
      }
      v22 = *(void **)(*((void *)&v36 + 1) + 8 * v21);
      if (objc_msgSend(v22, "isEqual:", v18, v34))
      {
        uint64_t v23 = v9->_watchTypes | 4;
LABEL_15:
        v9->_watchTypes = v23;
        goto LABEL_16;
      }
      if ([v22 isEqual:v19])
      {
        uint64_t v23 = v9->_watchTypes | 8;
        goto LABEL_15;
      }
      if ([v22 isEqual:v20])
      {
        uint64_t v23 = v9->_watchTypes | 0x20;
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NSMutableArray *)v9->_urls addObject:v22];
        uint64_t v23 = 2;
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = brc_bread_crumbs((uint64_t)"-[BRWatchingConfiguration initWithScopes:predicate:]", 123);
        v29 = brc_default_log(0);
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u)) {
          -[BRWatchingConfiguration initWithScopes:predicate:]((uint64_t)v22);
        }

        v30 = 0;
        id v6 = v34;
        id v7 = v35;
        goto LABEL_31;
      }
      [(NSMutableArray *)v9->_appLibraryIDs addObject:v22];
LABEL_16:
      ++v21;
    }
    while (v16 != v21);
    uint64_t v24 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
    uint64_t v16 = v24;
    if (v24) {
      continue;
    }
    break;
  }
LABEL_21:

  id v7 = v35;
  uint64_t v25 = objc_msgSend(v35, "br_watchedURL");
  if (v25)
  {
    gatherPrefix = (void *)v25;
    [(NSMutableArray *)v9->_urls addObject:v25];
    uint64_t v27 = 1;
    goto LABEL_28;
  }
  uint64_t v31 = objc_msgSend(v35, "br_urlWithWatchedChildren");
  if (v31)
  {
    gatherPrefix = (void *)v31;
    [(NSMutableArray *)v9->_urls addObject:v31];
    uint64_t v27 = 2;
LABEL_28:
    v9->_watchTypes = v27;
  }
  else if ((v9->_watchTypes & 8) != 0)
  {
    uint64_t v33 = [v35 extractSearchTermFromPredicate];
    gatherPrefix = v9->_gatherPrefix;
    v9->_gatherPrefix = (NSString *)v33;
  }
  else
  {
    gatherPrefix = v9->_gatherPrefix;
    v9->_gatherPrefix = 0;
  }
  id v6 = v34;

LABEL_30:
  v30 = v9;
LABEL_31:

  return v30;
}

- (id)appLibraryIDToURLMapOfSuppliedAppIDs
{
  v2 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  appLibraryIDToURLMapOfSuppliedAppIDs = self->_appLibraryIDToURLMapOfSuppliedAppIDs;
  if (!appLibraryIDToURLMapOfSuppliedAppIDs || ![(NSDictionary *)appLibraryIDToURLMapOfSuppliedAppIDs count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableArray count](v2->_appLibraryIDs, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v21 = v2;
    v5 = v2->_appLibraryIDs;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      v22 = v5;
      uint64_t v23 = v4;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
          v11 = [MEMORY[0x1E4F28CB8] defaultManager];
          v12 = [v11 URLForUbiquityContainerIdentifier:v10];

          v13 = brc_bread_crumbs((uint64_t)"-[BRWatchingConfiguration appLibraryIDToURLMapOfSuppliedAppIDs]", 148);
          id v14 = brc_default_log(1);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v15 = [v12 path];
            uint64_t v16 = objc_msgSend(v15, "fp_obfuscatedPath");
            *(_DWORD *)buf = 138412802;
            uint64_t v29 = v10;
            __int16 v30 = 2112;
            uint64_t v31 = v16;
            __int16 v32 = 2112;
            uint64_t v33 = v13;
            _os_log_debug_impl(&dword_19ED3F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] BRItemCollectionGatherer - appLibrary %@ with url %@%@", buf, 0x20u);

            v5 = v22;
            v4 = v23;
          }

          if (v12) {
            [v4 setObject:v12 forKeyedSubscript:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v7);
    }

    uint64_t v17 = [v4 copy];
    v2 = v21;
    uint64_t v18 = v21->_appLibraryIDToURLMapOfSuppliedAppIDs;
    v21->_appLibraryIDToURLMapOfSuppliedAppIDs = (NSDictionary *)v17;
  }
  uint64_t v19 = v2->_appLibraryIDToURLMapOfSuppliedAppIDs;

  return v19;
}

- (id)appLibraryIDToURLMapOfSuppliedURLs
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  appLibraryIDToURLMapOfSuppliedURLs = self->_appLibraryIDToURLMapOfSuppliedURLs;
  if (!appLibraryIDToURLMapOfSuppliedURLs)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableArray count](self->_urls, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v21 = self;
    v5 = self->_urls;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      unint64_t v9 = 0x1E4F28000uLL;
      v22 = v4;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v10), "br_containerID");
          if (v11)
          {
            v12 = [*(id *)(v9 + 3256) defaultManager];
            v13 = [v12 URLForUbiquityContainerIdentifier:v11];

            id v14 = brc_bread_crumbs((uint64_t)"-[BRWatchingConfiguration appLibraryIDToURLMapOfSuppliedURLs]", 174);
            uint64_t v15 = brc_default_log(1);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v16 = [v13 path];
              uint64_t v17 = objc_msgSend(v16, "fp_obfuscatedPath");
              *(_DWORD *)buf = 138412802;
              v28 = v11;
              __int16 v29 = 2112;
              __int16 v30 = v17;
              __int16 v31 = 2112;
              __int16 v32 = v14;
              _os_log_debug_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] BRItemCollectionGatherer - appLibrary %@ with url %@%@", buf, 0x20u);

              unint64_t v9 = 0x1E4F28000;
              v4 = v22;
            }

            if (v13) {
              [v4 setObject:v13 forKeyedSubscript:v11];
            }
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v7);
    }

    uint64_t v18 = [v4 copy];
    uint64_t v19 = v21->_appLibraryIDToURLMapOfSuppliedURLs;
    v21->_appLibraryIDToURLMapOfSuppliedURLs = (NSDictionary *)v18;

    appLibraryIDToURLMapOfSuppliedURLs = v21->_appLibraryIDToURLMapOfSuppliedURLs;
  }

  return appLibraryIDToURLMapOfSuppliedURLs;
}

- (unint64_t)watchTypes
{
  return self->_watchTypes;
}

- (NSArray)appLibraryIDs
{
  return &self->_appLibraryIDs->super;
}

- (NSArray)urls
{
  return &self->_urls->super;
}

- (NSString)gatherPrefix
{
  return self->_gatherPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashItemID, 0);
  objc_storeStrong((id *)&self->_appLibraryIDToURLMapOfSuppliedURLs, 0);
  objc_storeStrong((id *)&self->_appLibraryIDToURLMapOfSuppliedAppIDs, 0);
  objc_storeStrong((id *)&self->_gatherPrefix, 0);
  objc_storeStrong((id *)&self->_urls, 0);

  objc_storeStrong((id *)&self->_appLibraryIDs, 0);
}

- (void)initWithScopes:(uint64_t)a1 predicate:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v1, v2, "[ERROR] Unable to understand scope: %@%@", (void)v3, DWORD2(v3));
}

@end