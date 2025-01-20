@interface FPDExternalVolume
- (BOOL)_storeDomainProperties:(id)a3 atURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)isDefaultVolume;
- (BOOL)writeDomainsProperties:(id)a3 underDirectoryAtURL:(id)a4 error:(id *)a5;
- (FPDExternalVolume)initWithStatFS:(const statfs *)a3 knownRole:(unsigned int)a4 volumeManager:(id)a5;
- (id)_loadDomainPropertiesAtURL:(id)a3 error:(id *)a4;
- (id)readDomainsPropertiesUnderDirectoryAtURL:(id)a3 error:(id *)a4;
- (void)removeBrokenEbihilLinksFromRoot;
@end

@implementation FPDExternalVolume

- (FPDExternalVolume)initWithStatFS:(const statfs *)a3 knownRole:(unsigned int)a4 volumeManager:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)FPDExternalVolume;
  v5 = [(FPDVolume *)&v18 initWithStatFS:a3 knownRole:*(void *)&a4 volumeManager:a5];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    domainPlistNames = v5->_domainPlistNames;
    v5->_domainPlistNames = v6;

    v8 = NSString;
    v9 = [(FPDVolume *)v5 uuid];
    v10 = [v9 UUIDString];
    v11 = [v8 stringWithFormat:@"volume %@: link queue", v10];

    id v12 = v11;
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    linkQueue = v5->_linkQueue;
    v5->_linkQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (BOOL)isDefaultVolume
{
  return 0;
}

- (id)_loadDomainPropertiesAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v14 = 0;
  v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "fp_dataWithContentsOfURL:enforceSignatureCheck:shouldUpdateXattr:error:", v5, 1, &v14, a4);
  if (v6)
  {
    if (v14)
    {
      v7 = fp_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_INFO, "[INFO] signature update is needed", buf, 2u);
      }

      id v12 = 0;
      objc_msgSend(v6, "fp_writeToURL:withSignature:options:error:", v5, 1, 1, &v12);
      id v8 = v12;
      if (!v8)
      {
        v9 = fp_current_or_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[FPDExternalVolume _loadDomainPropertiesAtURL:error:](v9);
        }
      }
    }
    v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:a4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)readDomainsPropertiesUnderDirectoryAtURL:(id)a3 error:(id *)a4
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v34 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  id v5 = [@"Domains.plist" stringByDeletingPathExtension];
  v38 = [@"Domains.plist" pathExtension];
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = *MEMORY[0x1E4F1C670];
  uint64_t v39 = *MEMORY[0x1E4F1C6E8];
  v66[0] = *MEMORY[0x1E4F1C6E8];
  v66[1] = v7;
  uint64_t v42 = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  uint64_t v55 = MEMORY[0x1E4F143A8];
  uint64_t v56 = 3221225472;
  v57 = __68__FPDExternalVolume_readDomainsPropertiesUnderDirectoryAtURL_error___block_invoke;
  v58 = &unk_1E6A74328;
  id v59 = v4;
  id v32 = v59;
  v9 = objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v9;
  uint64_t v43 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v43)
  {
    uint64_t v41 = *(void *)v52;
    *(void *)&long long v10 = 138412546;
    long long v31 = v10;
    v33 = v5;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D9471CC0]();
        id v50 = 0;
        int v14 = [v12 getResourceValue:&v50 forKey:v42 error:0];
        id v15 = v50;
        v16 = v15;
        if (v14 && [v15 BOOLValue])
        {
          id v49 = 0;
          int v17 = [v12 getResourceValue:&v49 forKey:v39 error:0];
          id v18 = v49;
          v19 = v18;
          if (v17)
          {
            if ([v18 hasPrefix:v5])
            {
              v20 = [v19 pathExtension];
              int v21 = [v20 isEqualToString:v38];

              if (v21)
              {
                id v48 = 0;
                v22 = [(FPDExternalVolume *)self _loadDomainPropertiesAtURL:v12 error:&v48];
                id v37 = v48;
                if (v22)
                {
                  [v34 addEntriesFromDictionary:v22];
                  v23 = self;
                  objc_sync_enter(v23);
                  long long v44 = 0u;
                  long long v45 = 0u;
                  long long v46 = 0u;
                  long long v47 = 0u;
                  v35 = v22;
                  id v24 = v22;
                  uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v60 count:16];
                  if (v25)
                  {
                    uint64_t v26 = *(void *)v45;
                    do
                    {
                      for (uint64_t i = 0; i != v25; ++i)
                      {
                        if (*(void *)v45 != v26) {
                          objc_enumerationMutation(v24);
                        }
                        -[NSMutableDictionary setObject:forKey:](v23->_domainPlistNames, "setObject:forKey:", v19, *(void *)(*((void *)&v44 + 1) + 8 * i), v31);
                      }
                      uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v60 count:16];
                    }
                    while (v25);
                  }

                  id v5 = v33;
                  v22 = v35;
                  objc_sync_exit(v23);
                }
                else
                {
                  fp_current_or_default_log();
                  v23 = (FPDExternalVolume *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_ERROR))
                  {
                    v28 = objc_msgSend(v12, "fp_shortDescription");
                    v29 = objc_msgSend(v37, "fp_prettyDescription");
                    *(_DWORD *)buf = v31;
                    v62 = v28;
                    __int16 v63 = 2112;
                    v64 = v29;
                    _os_log_error_impl(&dword_1D744C000, &v23->super.super, OS_LOG_TYPE_ERROR, "[ERROR] Unable to load domain properties from plist at '%@': %@", buf, 0x16u);
                  }
                }
              }
            }
          }
        }
        ++v11;
      }
      while (v11 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v43);
  }

  return v34;
}

uint64_t __68__FPDExternalVolume_readDomainsPropertiesUnderDirectoryAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
    long long v10 = objc_msgSend(v5, "fp_shortDescription");
    uint64_t v11 = objc_msgSend(v6, "fp_prettyDescription");
    int v12 = 136315906;
    v13 = "-[FPDExternalVolume readDomainsPropertiesUnderDirectoryAtURL:error:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    int v17 = v10;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_error_impl(&dword_1D744C000, v7, OS_LOG_TYPE_ERROR, "[ERROR] %s unable to enumerate dir at '%@' (%@): %@", (uint8_t *)&v12, 0x2Au);
  }
  return 1;
}

- (BOOL)_storeDomainProperties:(id)a3 atURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9 = a4;
  long long v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:a6];
  uint64_t v11 = v10;
  if (v10) {
    char v12 = objc_msgSend(v10, "fp_writeToURL:withSignature:options:error:", v9, 1, a5, a6);
  }
  else {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)writeDomainsProperties:(id)a3 underDirectoryAtURL:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v37 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v10)
  {
    uint64_t v35 = *(void *)v43;
    while (2)
    {
      uint64_t v34 = v10;
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(v9);
        }
        uint64_t v12 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v47 = v12;
        v13 = [v9 objectForKeyedSubscript:v12];
        id v48 = v13;
        __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];

        id v15 = [(NSMutableDictionary *)v8->_domainPlistNames objectForKey:v12];

        if (v15)
        {
          uint64_t v16 = [(NSMutableDictionary *)v8->_domainPlistNames objectForKeyedSubscript:v12];
          int v17 = [v37 URLByAppendingPathComponent:v16];

          LOBYTE(v16) = [(FPDExternalVolume *)v8 _storeDomainProperties:v14 atURL:v17 options:1 error:a5];
          if ((v16 & 1) == 0) {
            goto LABEL_24;
          }
        }
        else
        {
          __int16 v18 = [@"Domains.plist" stringByDeletingPathExtension];
          v19 = [@"Domains.plist" pathExtension];
          uint64_t v20 = [NSString stringWithFormat:@"%@_%@.%@", v18, v12, v19];
          int v21 = [v37 URLByAppendingPathComponent:v20 isDirectory:1];
          if (![(FPDExternalVolume *)v8 _storeDomainProperties:v14 atURL:v21 options:1 error:a5])
          {

LABEL_24:
            objc_sync_exit(v8);
            BOOL v32 = 0;
            goto LABEL_25;
          }
          [(NSMutableDictionary *)v8->_domainPlistNames setObject:v20 forKey:v12];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v22 = [(NSMutableDictionary *)v8->_domainPlistNames allKeys];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        v27 = [v9 objectForKey:v26];
        BOOL v28 = v27 == 0;

        if (v28)
        {
          v29 = [(NSMutableDictionary *)v8->_domainPlistNames objectForKeyedSubscript:v26];
          v30 = [v37 URLByAppendingPathComponent:v29];

          long long v31 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v31 removeItemAtURL:v30 error:0];

          [(NSMutableDictionary *)v8->_domainPlistNames removeObjectForKey:v26];
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v23);
  }

  objc_sync_exit(v8);
  BOOL v32 = 1;
LABEL_25:

  return v32;
}

- (void)removeBrokenEbihilLinksFromRoot
{
  if (FPFeatureFlagEbihilIsEnabled()) {
    fp_dispatch_async_with_logs();
  }
}

void __52__FPDExternalVolume_removeBrokenEbihilLinksFromRoot__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = *(void **)(a1 + 32);
  id v4 = (uint64_t *)(a1 + 32);
  id v6 = [v5 root];
  id v7 = [v3 fileURLWithPath:v6];
  id v26 = 0;
  id v8 = [v2 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 error:&v26];
  id v9 = v26;

  if (v9)
  {
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __52__FPDExternalVolume_removeBrokenEbihilLinksFromRoot__block_invoke_cold_1(v4, v9, v10);
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v9 = 0;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v22 + 1) + 8 * i);
          [v15 fileSystemRepresentation];
          if (fpfs_root_exposure_symlink_xattr_exists())
          {
            uint64_t v16 = [v15 path];
            char v17 = [v2 fileExistsAtPath:v16];

            if ((v17 & 1) == 0)
            {

              id v21 = 0;
              [v2 removeItemAtURL:v15 error:&v21];
              id v9 = v21;
              if (v9)
              {
                __int16 v18 = fp_current_or_default_log();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  v19 = objc_msgSend(v15, "fp_shortDescription");
                  uint64_t v20 = objc_msgSend(v9, "fp_prettyDescription");
                  *(_DWORD *)buf = 138543618;
                  BOOL v28 = v19;
                  __int16 v29 = 2114;
                  v30 = v20;
                  _os_log_error_impl(&dword_1D744C000, v18, OS_LOG_TYPE_ERROR, "[ERROR] Failed to remove broken domain link %{public}@ with error: %{public}@", buf, 0x16u);
                }
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v12);
    }
    else
    {
      id v9 = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkQueue, 0);
  objc_storeStrong((id *)&self->_domainPlistNames, 0);
}

- (void)_loadDomainPropertiesAtURL:(NSObject *)a1 error:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(0, "fp_prettyDescription");
  int v3 = 138412290;
  id v4 = v2;
  _os_log_error_impl(&dword_1D744C000, a1, OS_LOG_TYPE_ERROR, "[ERROR] failed to update to newer signature: %@", (uint8_t *)&v3, 0xCu);
}

void __52__FPDExternalVolume_removeBrokenEbihilLinksFromRoot__block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Unable to list root of volume %{public}@ got error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end