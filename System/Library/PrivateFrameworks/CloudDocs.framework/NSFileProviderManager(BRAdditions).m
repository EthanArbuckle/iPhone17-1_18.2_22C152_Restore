@interface NSFileProviderManager(BRAdditions)
+ (id)_br_createNSFileProviderManagerForDataSeparated:()BRAdditions withDomainID:didMatchedDomain:;
+ (id)br_getDomainForCurrentPersonaWithError:()BRAdditions;
+ (id)br_getDomainForDataSeparated:()BRAdditions withIdentifier:withError:;
+ (id)br_getDomainForProvider:()BRAdditions withIdentifier:error:;
+ (id)br_getLegacyEnterpriseProviderManager;
+ (id)br_getProviderManagerForDataSeparated:()BRAdditions;
+ (id)br_sharedProviderManager;
+ (id)br_sharedProviderManagerWithDomainID:()BRAdditions;
+ (uint64_t)br_getEnterpriseProviderManager;
+ (uint64_t)br_getPrimaryProviderManager;
- (id)br_getFPDomainForAccount:()BRAdditions withError:;
- (id)br_getFPDomainWithIdentifier:()BRAdditions withError:;
- (id)br_getFPDomainsWithError:()BRAdditions;
@end

@implementation NSFileProviderManager(BRAdditions)

+ (id)br_getDomainForCurrentPersonaWithError:()BRAdditions
{
  v4 = +[BRFileProviderHelper br_getProviderIDForCurrentPersona];
  if (v4)
  {
    v5 = +[BRFileProviderHelper br_getDomainIdentifierForCurrentPersona];
    v6 = objc_msgSend(MEMORY[0x1E4F25DE8], "br_getDomainForProvider:withIdentifier:error:", v4, v5, a3);
  }
  else if (a3)
  {
    v7 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_getDomainForCurrentPersonaWithError:]", 30);
    v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[NSFileProviderManager(BRAdditions) br_getDomainForCurrentPersonaWithError:]((uint64_t)v7, v8);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRInternalErrorDomain", 15, @"unreachable: Could not compute providerID");
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)br_getDomainForDataSeparated:()BRAdditions withIdentifier:withError:
{
  id v7 = a4;
  if (v7)
  {
    v8 = +[BRFileProviderHelper br_getProviderIDForDataSeparated:a3];
    if (v8)
    {
      v9 = objc_msgSend(MEMORY[0x1E4F25DE8], "br_getDomainForProvider:withIdentifier:error:", v8, v7, a5);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)br_getDomainForProvider:()BRAdditions withIdentifier:error:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F25DE8]) _initWithProviderIdentifier:v7];
    id v22 = 0;
    v11 = objc_msgSend(v10, "br_getFPDomainWithIdentifier:withError:", v9, &v22);
    id v12 = v22;
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
      v15 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_getDomainForProvider:withIdentifier:error:]", 59);
      v16 = brc_default_log(0);
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v24 = "+[NSFileProviderManager(BRAdditions) br_getDomainForProvider:withIdentifier:error:]";
        __int16 v25 = 2080;
        if (!a5) {
          v20 = "(ignored by caller)";
        }
        v26 = v20;
        __int16 v27 = 2112;
        id v28 = v14;
        __int16 v29 = 2112;
        v30 = v15;
        _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a5) {
        *a5 = v14;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"domainID or providerID", 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v17 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_getDomainForProvider:withIdentifier:error:]", 52);
      v18 = brc_default_log(0);
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v24 = "+[NSFileProviderManager(BRAdditions) br_getDomainForProvider:withIdentifier:error:]";
        __int16 v25 = 2080;
        if (!a5) {
          v21 = "(ignored by caller)";
        }
        v26 = v21;
        __int16 v27 = 2112;
        id v28 = v10;
        __int16 v29 = 2112;
        v30 = v17;
        _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5)
    {
      id v10 = v10;
      v11 = 0;
      *a5 = v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)br_sharedProviderManager
{
  v0 = +[BRFileProviderHelper br_getDomainIdentifierForCurrentPersona];
  v1 = objc_msgSend(MEMORY[0x1E4F25DE8], "br_sharedProviderManagerWithDomainID:", v0);

  return v1;
}

+ (id)br_sharedProviderManagerWithDomainID:()BRAdditions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (br_sharedProviderManagerWithDomainID__onceToken != -1) {
    dispatch_once(&br_sharedProviderManagerWithDomainID__onceToken, &__block_literal_global);
  }
  uint64_t IsDataSeparated = BRCurrentPersonaIsDataSeparated();
  if (BRIsFPFSEnabled(IsDataSeparated, v6) & 1) != 0 || (IsDataSeparated)
  {
    if (!v4)
    {
      id v4 = +[BRFileProviderHelper br_getDomainIdentifierForCurrentPersona];
    }
    id v8 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 92);
    v9 = brc_default_log(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]();
    }

    id v10 = (id)br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers;
    objc_sync_enter(v10);
    id v7 = [(id)br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers objectForKeyedSubscript:v4];
    if (v7)
    {
      v11 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 108);
      id v12 = brc_default_log(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]((uint64_t)v11, v12);
      }
    }
    else
    {
      char v20 = 0;
      objc_msgSend(a1, "_br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:", IsDataSeparated, v4, &v20);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v13 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 100);
      id v14 = brc_default_log(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_19ED3F000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] Trying to cache file provider manager %@%@", buf, 0x16u);
      }

      if (v20)
      {
        v15 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 102);
        v16 = brc_default_log(1);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v4;
          __int16 v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] Was able to match domain %@, caching shared file provider manager%@", buf, 0x16u);
        }

        [(id)br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers setValue:v7 forKey:v4];
      }
      else
      {
        v17 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) br_sharedProviderManagerWithDomainID:]", 105);
        v18 = brc_default_log(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v4;
          __int16 v23 = 2112;
          v24 = v17;
          _os_log_impl(&dword_19ED3F000, v18, OS_LOG_TYPE_DEFAULT, "[NOTICE] Domain %@ was not found. Not caching file provider manager%@", buf, 0x16u);
        }
      }
    }
    objc_sync_exit(v10);
  }
  else
  {
    id v7 = (id)br_sharedProviderManagerWithDomainID__defaultSharedProvider;
  }

  return v7;
}

+ (id)br_getProviderManagerForDataSeparated:()BRAdditions
{
  if (a3) {
    objc_msgSend(a1, "br_getEnterpriseProviderManager");
  }
  else {
  v3 = objc_msgSend(a1, "br_getPrimaryProviderManager");
  }

  return v3;
}

+ (uint64_t)br_getEnterpriseProviderManager
{
  return objc_msgSend(a1, "_br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:", 1, 0, 0);
}

+ (uint64_t)br_getPrimaryProviderManager
{
  return objc_msgSend(a1, "_br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:", 0, 0, 0);
}

+ (id)br_getLegacyEnterpriseProviderManager
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F25DE8]) _initWithProviderIdentifier:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged" domain:0];

  return v0;
}

+ (id)_br_createNSFileProviderManagerForDataSeparated:()BRAdditions withDomainID:didMatchedDomain:
{
  id v16 = 0;
  id v7 = objc_msgSend(a1, "br_getDomainForDataSeparated:withIdentifier:withError:", a3, a4, &v16);
  id v8 = v16;
  id v10 = v8;
  if (v8)
  {
    v11 = brc_bread_crumbs((uint64_t)"+[NSFileProviderManager(BRAdditions) _br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:]", 140);
    id v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      +[NSFileProviderManager(BRAdditions) _br_createNSFileProviderManagerForDataSeparated:withDomainID:didMatchedDomain:]();
    }
  }
  if (a5) {
    *a5 = v7 != 0;
  }
  if (BRIsFPFSEnabled(v8, v9)) {
    [v7 setReplicated:1];
  }
  v13 = +[BRFileProviderHelper br_getProviderIDForDataSeparated:a3];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F25DE8]) _initWithProviderIdentifier:v13 domain:v7];

  return v14;
}

- (id)br_getFPDomainWithIdentifier:()BRAdditions withError:
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "br_getFPDomainsWithError:", a4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__NSFileProviderManager_BRAdditions__br_getFPDomainWithIdentifier_withError___block_invoke;
  v11[3] = &unk_1E59AD310;
  id v12 = v6;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "br_firstItemOf:", v11);

  return v9;
}

- (id)br_getFPDomainForAccount:()BRAdditions withError:
{
  id v6 = a3;
  id v7 = objc_msgSend(v6, "br_dsid");
  id v8 = [v6 identifier];

  uint64_t v9 = +[BRAccountDescriptor accountDescriptorForAccountID:v8 mustBeLoggedIn:0];
  uint64_t v10 = [v9 domainIdentifier];
  v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v8;
  }
  id v13 = v12;

  id v14 = objc_msgSend(a1, "br_getFPDomainsWithError:", a4);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__NSFileProviderManager_BRAdditions__br_getFPDomainForAccount_withError___block_invoke;
  v19[3] = &unk_1E59AD338;
  id v20 = v7;
  id v21 = v13;
  id v15 = v13;
  id v16 = v7;
  v17 = objc_msgSend(v14, "br_firstItemOf:", v19);

  return v17;
}

- (id)br_getFPDomainsWithError:()BRAdditions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v16[5] = &v18;
  id v17 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke;
  v16[3] = &unk_1E59AD388;
  v16[4] = a1;
  +[BRXPCClientUtils executeXPCWithMaxRetries:2 error:&v17 block:v16];
  id v5 = v17;
  id v6 = brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]", 205);
  id v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v13 = (const char *)v19[5];
    id v14 = [a1 providerIdentifier];
    *(_DWORD *)buf = 138412802;
    uint64_t v25 = v13;
    __int16 v26 = 2112;
    __int16 v27 = v14;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Found the following domains: %@ from provider: %@%@", buf, 0x20u);
  }
  id v8 = v5;
  if (v8)
  {
    uint64_t v9 = brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]", 207);
    uint64_t v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      id v15 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = "-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]";
      __int16 v26 = 2080;
      if (!a3) {
        id v15 = "(ignored by caller)";
      }
      __int16 v27 = v15;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      uint64_t v31 = v9;
      _os_log_error_impl(&dword_19ED3F000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a3) {
    *a3 = v8;
  }

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

+ (void)br_getDomainForCurrentPersonaWithError:()BRAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Could not compute providerID%@", (uint8_t *)&v2, 0xCu);
}

+ (void)br_sharedProviderManagerWithDomainID:()BRAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Returned cached shared provider manager%@", (uint8_t *)&v2, 0xCu);
}

+ (void)br_sharedProviderManagerWithDomainID:()BRAdditions .cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Getting shared provider manager for domain ID: %@%@", v1, 0x16u);
}

+ (void)_br_createNSFileProviderManagerForDataSeparated:()BRAdditions withDomainID:didMatchedDomain:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] Got an error when tried to retrieve domain: %@%@");
}

@end