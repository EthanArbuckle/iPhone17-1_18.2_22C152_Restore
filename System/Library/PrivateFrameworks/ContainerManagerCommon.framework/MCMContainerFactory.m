@interface MCMContainerFactory
- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 error:(id *)a5;
- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 reclaimSoon:(BOOL)a5 error:(id *)a6;
- (BOOL)upgradeContainer:(id)a3 clientIdentity:(id)a4 error:(id *)a5;
- (MCMClientIdentity)clientIdentity;
- (MCMContainerCache)cache;
- (MCMContainerFactory)initWithContainerCache:(id)a3 clientIdentity:(id)a4 userIdentityCache:(id)a5;
- (MCMUserIdentityCache)userIdentityCache;
- (id)_containerPathIdentifierForContainerIdentity:(id)a3;
- (id)_createContainerForContainerIdentity:(id)a3 error:(id *)a4;
- (id)_generateConcreteContainerIdentityFromContainerIdentity:(id)a3 error:(id *)a4;
- (id)containerForContainerIdentity:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)createStagedContainerForContainerIdentity:(id)a3 finalContainerPath:(id *)a4 dataProtectionClass:(int)a5 error:(id *)a6;
@end

@implementation MCMContainerFactory

- (MCMContainerFactory)initWithContainerCache:(id)a3 clientIdentity:(id)a4 userIdentityCache:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMContainerFactory;
  v12 = [(MCMContainerFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cache, a3);
    objc_storeStrong((id *)&v13->_clientIdentity, a4);
    objc_storeStrong((id *)&v13->_userIdentityCache, a5);
  }

  return v13;
}

- (id)containerForContainerIdentity:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5
{
  BOOL v76 = a4;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v77 = [v6 transient];
  LODWORD(v7) = [v6 platform];
  v8 = [(MCMContainerFactory *)self clientIdentity];
  id v9 = [v8 codeSignInfo];
  id v10 = [v9 identifier];

  v79 = [v6 userIdentity];
  uint64_t v11 = [v6 containerClass];
  v80 = self;
  if (!v7)
  {
    v12 = [(MCMContainerFactory *)self clientIdentity];
    uint64_t v7 = [v12 platform];

    uint64_t v13 = [v6 identityBySettingPlatform:v7];

    id v6 = (id)v13;
  }
  v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    [(MCMContainerFactory *)self clientIdentity];
    v43 = v42 = v10;
    v44 = [v43 codeSignInfo];
    v45 = [v44 entitlements];
    *(_DWORD *)buf = 138413570;
    v88 = (const char *)v6;
    __int16 v89 = 1024;
    *(_DWORD *)v90 = v76;
    *(_WORD *)&v90[4] = 1024;
    *(_DWORD *)&v90[6] = v7;
    *(_WORD *)v91 = 1024;
    *(_DWORD *)&v91[2] = v77;
    LOWORD(v92) = 1024;
    *(_DWORD *)((char *)&v92 + 2) = [v45 privileged];
    HIWORD(v92) = 2112;
    v93 = v42;
    _os_log_debug_impl(&dword_1D7739000, v14, OS_LOG_TYPE_DEBUG, "createOrLookup; identity: %@, createIfNecessary: %d, platform: %d, transient: %d, privileged: %d, clientBundleIdentifier: %@",
      buf,
      0x2Eu);

    id v10 = v42;
  }

  if (!v6)
  {
    v18 = [[MCMError alloc] initWithErrorType:38];
    v19 = container_log_handle_for_category();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v20 = "Cannot lookup a nil container identity.";
LABEL_64:
    _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
LABEL_10:

    v21 = 0;
    v22 = 0;
LABEL_11:
    if (v18)
    {
      v23 = v18;
      v24 = 0;
      *a5 = v23;
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }
    goto LABEL_57;
  }
  id v15 = containermanager_copy_global_configuration();
  char v16 = [v15 isUnsupportedSystemContainerWithContainerClass:v11];

  if (v16)
  {
    v18 = [[MCMError alloc] initWithErrorType:72];
    v19 = container_log_handle_for_category();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v20 = "System containers are unsupported on this platform.";
    goto LABEL_64;
  }
  v73 = v10;
  uint64_t v74 = v11;
  v21 = 0;
  v18 = 0;
  v24 = 0;
  char v25 = 0;
  *(void *)&long long v17 = 136315138;
  long long v72 = v17;
  v26 = v80;
  while (1)
  {
    char v27 = v25;
    v28 = v21;

    v29 = [(MCMContainerFactory *)v26 cache];
    v21 = [v29 classCacheForContainerIdentity:v6];

    v30 = [(MCMContainerFactory *)v26 cache];
    id v86 = 0;
    v24 = [v30 entryForContainerIdentity:v6 classCache:v21 error:&v86];
    v18 = (MCMError *)v86;

    if (v24)
    {
      if (!v77 || (objc_opt_class(), ((objc_opt_isKindOfClass() | !v76) & 1) != 0))
      {
        v22 = 0;
        id v10 = v73;
        goto LABEL_48;
      }
      id v31 = objc_alloc(MEMORY[0x1E4F1CB10]);
      v78 = v24;
      v32 = [v24 containerPath];
      v33 = [v32 containerRootURL];
      v34 = [v33 path];
      v35 = (void *)[v31 initFileURLWithPath:v34 isDirectory:1];

      id v36 = containermanager_copy_global_configuration();
      LOBYTE(v31) = [v36 isGlobalContainerClass:v74];

      if (v31) {
        id v37 = 0;
      }
      else {
        id v37 = v79;
      }
      v85 = v18;
      BOOL v39 = -[MCMContainerFactory deleteURL:forUserIdentity:reclaimSoon:error:](v80, "deleteURL:forUserIdentity:reclaimSoon:error:", v35, v37, 1, &v85, v72);
      v38 = v85;

      if (!v39)
      {
        v18 = [[MCMError alloc] initWithErrorType:5];

        v51 = container_log_handle_for_category();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v65 = [v35 path];
          *(_DWORD *)buf = 138412546;
          v88 = v65;
          __int16 v89 = 2112;
          *(void *)v90 = v18;
          _os_log_error_impl(&dword_1D7739000, v51, OS_LOG_TYPE_ERROR, "Failed to remove transient container at %@; error = %@",
            buf,
            0x16u);
        }
        v22 = 0;
        id v10 = v73;
        v24 = v78;
        goto LABEL_48;
      }

      v26 = v80;
      v24 = v78;
    }
    else
    {
      if ([(MCMError *)v18 type] != 21
        && [(MCMError *)v18 type] != 44
        && [(MCMError *)v18 type] != 108)
      {
        goto LABEL_62;
      }

      if (!v76)
      {
        v18 = [[MCMError alloc] initWithErrorType:21];
LABEL_62:
        v22 = 0;
        id v10 = v73;
        goto LABEL_11;
      }
      v38 = 0;
    }
    v84 = v38;
    v22 = -[MCMContainerFactory _createContainerForContainerIdentity:error:](v26, "_createContainerForContainerIdentity:error:", v6, &v84, v72);
    v18 = v84;

    if (v22) {
      break;
    }
    if ([(MCMError *)v18 type] == 130)
    {
      v40 = container_log_handle_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = " Retrying lookup.";
        if (v27) {
          v41 = "";
        }
        *(_DWORD *)buf = v72;
        v88 = v41;
        _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Container already exists when trying to create it.%s", buf, 0xCu);
      }

      char v25 = 1;
      if ((v27 & 1) == 0) {
        continue;
      }
    }
    v22 = 0;
    id v10 = v73;
    if (!v24) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
  v83 = v18;
  char v46 = [v22 verifyWithError:&v83];
  v47 = v83;

  id v10 = v73;
  if (v46)
  {
    v48 = [(MCMContainerFactory *)v80 cache];
    v82 = v47;
    v49 = [v48 addContainerMetadata:v22 error:&v82];
    v50 = v82;

    if (!v49)
    {
      v18 = [[MCMError alloc] initWithErrorType:45];

      v61 = container_log_handle_for_category();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v67 = [v22 containerPath];
        [v67 containerRootURL];
        id v68 = v6;
        v70 = v69 = v21;
        v71 = [v70 path];
        *(_DWORD *)buf = 138413058;
        v88 = (const char *)v22;
        __int16 v89 = 2112;
        *(void *)v90 = v71;
        *(_WORD *)&v90[8] = 1024;
        *(_DWORD *)v91 = v77;
        *(_WORD *)&v91[4] = 2112;
        v92 = v18;
        _os_log_error_impl(&dword_1D7739000, v61, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@, transient: %d; error = %@",
          buf,
          0x26u);

        v21 = v69;
        id v6 = v68;
      }
      goto LABEL_11;
    }
    v24 = (void *)[v49 copyWithZone:0];
    v47 = v50;
  }
  else
  {
    v49 = container_log_handle_for_category();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v66 = [v22 shortDescription];
      *(_DWORD *)buf = 138412546;
      v88 = v66;
      __int16 v89 = 2112;
      *(void *)v90 = v47;
      _os_log_error_impl(&dword_1D7739000, v49, OS_LOG_TYPE_ERROR, "Failed to verify new metadata; metadata = %@, error = %@",
        buf,
        0x16u);
    }
  }

  v18 = v47;
  if (!v24) {
    goto LABEL_11;
  }
LABEL_48:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [v24 uuid];
    v53 = [v6 uuid];
    char v54 = [v52 isEqual:v53];

    if ((v54 & 1) == 0)
    {

      v60 = [[MCMError alloc] initWithErrorType:21];
      v18 = v60;
      goto LABEL_11;
    }
  }
  if (v76)
  {
    v55 = v21;
    v56 = [(MCMContainerFactory *)v80 clientIdentity];
    v81 = v18;
    BOOL v57 = [(MCMContainerFactory *)v80 upgradeContainer:v24 clientIdentity:v56 error:&v81];
    v23 = v81;

    if (!v57)
    {
      v58 = container_log_handle_for_category();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v62 = [v24 containerPath];
        v63 = [v62 containerRootURL];
        v64 = [v63 path];
        *(_DWORD *)buf = 138412546;
        v88 = v64;
        __int16 v89 = 2112;
        *(void *)v90 = v23;
        _os_log_error_impl(&dword_1D7739000, v58, OS_LOG_TYPE_ERROR, "Failed to migrate container at [%@]; error = %@",
          buf,
          0x16u);
      }
    }
    v21 = v55;
  }
  else
  {
    v23 = v18;
  }
LABEL_57:

  return v24;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (MCMContainerCache)cache
{
  return self->_cache;
}

- (BOOL)upgradeContainer:(id)a3 clientIdentity:(id)a4 error:(id *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v57 = a4;
  v59 = [v7 schemaVersion];
  v8 = [v7 containerPath];
  v60 = [v7 identifier];
  uint64_t v9 = [v8 containerClass];
  id v10 = [(MCMContainerFactory *)self userIdentityCache];
  uint64_t v11 = [v8 userIdentity];
  v58 = [v10 libraryRepairForUserIdentity:v11];

  [v8 containerClass];
  if (!container_class_supports_data_subdirectory())
  {
    char v16 = 0;
    id v15 = 0;
    goto LABEL_15;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v75 = 0;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  v12 = [v8 containerDataURL];
  v68[5] = &v70;
  id v69 = 0;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __71__MCMContainerFactory_Upgrades__upgradeContainer_clientIdentity_error___block_invoke;
  v68[3] = &unk_1E6A805A0;
  v68[4] = buf;
  char v13 = [v58 fixAndRetryIfPermissionsErrorWithURL:v12 containerPath:v8 containerIdentifier:v60 error:&v69 duringBlock:v68];
  id v14 = v69;

  if ((v13 & 1) == 0)
  {
    long long v17 = [v14 domain];
    int v18 = [v17 isEqualToString:*MEMORY[0x1E4F28798]];

    if (!v18)
    {
      id v15 = [[MCMError alloc] initWithErrorType:105];
      goto LABEL_25;
    }
    v19 = [MCMError alloc];
    v20 = [v8 containerDataURL];
    v21 = [v20 path];
    v22 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v19, "initWithErrorType:category:path:POSIXerrno:", 105, 1, v21, [v14 code]);
    goto LABEL_9;
  }
  if (!*(unsigned char *)(*(void *)&buf[8] + 24) || !*((unsigned char *)v71 + 24))
  {
    id v67 = 0;
    v20 = [v7 metadataWithError:&v67];
    id v15 = (MCMError *)v67;
    if (!v20) {
      goto LABEL_23;
    }
    uint64_t v23 = +[MCMDataProtectionManager defaultManager];
    uint64_t v24 = [(id)v23 desiredDataProtectionClassForMetadata:v20 clientIdentity:v57];

    id v66 = v14;
    LOBYTE(v23) = [v8 createDataURLIfNecessaryWithDataProtectionClass:v24 error:&v66];
    id v25 = v66;

    if (v23)
    {
      id v26 = &unk_1F2F12398;

      v59 = &unk_1F2F12398;
      id v14 = v25;
      goto LABEL_14;
    }
    v47 = [v25 domain];
    int v48 = [v47 isEqualToString:*MEMORY[0x1E4F28798]];

    if (v48)
    {
      v49 = [MCMError alloc];
      v21 = [v8 containerDataURL];
      v50 = [v21 path];
      uint64_t v51 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v49, "initWithErrorType:category:path:POSIXerrno:", 106, 1, v50, [v25 code]);

      id v14 = v25;
      id v15 = (MCMError *)v51;
      goto LABEL_10;
    }
    v22 = [[MCMError alloc] initWithErrorType:106];
    v21 = v15;
    id v14 = v25;
LABEL_9:
    id v15 = v22;
LABEL_10:

LABEL_23:
LABEL_25:
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(buf, 8);
    id v28 = 0;
    goto LABEL_33;
  }
  id v15 = 0;
LABEL_14:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(buf, 8);
  char v16 = v14;
LABEL_15:
  id v65 = 0;
  BOOL v27 = +[MCMContainerSchema schemaIsUpToDateForIdentifier:v60 containerClass:v9 currentSchemaVersion:v59 latestSchemaVersion:&v65];
  id v28 = v65;
  if (!v27)
  {
    v64 = v15;
    id v31 = [v7 metadataWithError:&v64];
    v55 = v64;

    if (v31)
    {
      v32 = +[MCMDataProtectionManager defaultManager];
      uint64_t v33 = [v32 desiredDataProtectionClassForMetadata:v31 clientIdentity:v57];

      v34 = [v31 containerPath];
      char v54 = +[MCMContainerSchema containerSchemaWithMetadata:v31 finalContainerPath:v34 dataProtectionClass:v33 libraryRepair:v58];

      id v63 = v16;
      LOBYTE(v33) = [v54 writeSchemaFromVersion:v59 toTargetVersion:v28 error:&v63];
      id v14 = v63;

      if (v33)
      {
        v29 = [v31 metadataByChangingSchemaVersion:v28];

        if (v29)
        {
          v62 = v55;
          int v35 = [v29 writeMetadataToDiskWithError:&v62];
          id v36 = v62;

          if (v35)
          {
            id v37 = [(MCMContainerFactory *)self cache];
            v61 = v36;
            uint64_t v38 = [v37 addContainerMetadata:v29 error:&v61];
            id v15 = v61;

            if (v38)
            {
              BOOL v30 = 1;
              id v7 = (id)v38;
            }
            else
            {
              v53 = container_log_handle_for_category();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v15;
                _os_log_error_impl(&dword_1D7739000, v53, OS_LOG_TYPE_ERROR, "Failed to update cache with new metadata during schema update; error = %@",
                  buf,
                  0xCu);
              }

              id v7 = 0;
              id v15 = 0;
              BOOL v30 = 1;
            }
          }
          else
          {
            v52 = container_log_handle_for_category();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v29;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v36;
              _os_log_error_impl(&dword_1D7739000, v52, OS_LOG_TYPE_ERROR, "Could not update container schema version or data protection class in metadata for %@: %@", buf, 0x16u);
            }

            BOOL v30 = 1;
            id v15 = v36;
          }
        }
        else
        {
          BOOL v30 = 1;
          id v15 = v55;
        }
        goto LABEL_36;
      }
      BOOL v39 = container_log_handle_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v60;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, "Could not update container schema for %@: %@", buf, 0x16u);
      }

      v40 = [v14 domain];
      int v41 = [v40 isEqualToString:*MEMORY[0x1E4F28798]];

      v42 = [MCMError alloc];
      v43 = v42;
      if (v41)
      {
        v44 = [v8 containerDataURL];
        v45 = [v44 path];
        id v15 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v43, "initWithErrorType:category:path:POSIXerrno:", 104, 1, v45, [v14 code]);
      }
      else
      {
        id v15 = [(MCMError *)v42 initWithErrorType:104];
        v44 = v55;
      }
    }
    else
    {
      id v14 = v16;
      id v15 = v55;
    }
LABEL_33:
    if (a5)
    {
      id v15 = v15;
      BOOL v30 = 0;
      v29 = 0;
      *a5 = v15;
    }
    else
    {
      BOOL v30 = 0;
      v29 = 0;
    }
LABEL_36:
    char v16 = v14;
    goto LABEL_37;
  }
  v29 = 0;
  BOOL v30 = 1;
LABEL_37:

  return v30;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

- (id)_containerPathIdentifierForContainerIdentity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 containerPathIdentifier];
    goto LABEL_13;
  }
  v5 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v5 UUIDString];

  uint64_t v6 = [v3 containerClass];
  [v3 platform];
  [v3 transient];
  id v7 = [v3 identifier];
  if ((container_class_supports_randomized_path() & 1) == 0)
  {
    +[MCMContainerPath containerPathIdentifierForCodeSignIdentifier:containerClass:](MCMContainerPath, "containerPathIdentifierForCodeSignIdentifier:containerClass:", v7, [v3 containerClass]);
    v4 = id v10 = v4;
LABEL_11:

    goto LABEL_12;
  }
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    v8 = +[MCMEntitlementBypassList sharedBypassList];
    uint64_t v9 = v8;
    if (v6 == 13) {
      [v8 wellknownSystemGroupContainerForId:v7];
    }
    else {
    id v10 = [v8 wellknownSystemContainerForId:v7];
    }

    if (v10)
    {
      id v10 = v10;

      v4 = v10;
    }
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:

  return v4;
}

- (id)_generateConcreteContainerIdentityFromContainerIdentity:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    goto LABEL_13;
  }
  v8 = [v6 identifier];
  uint64_t v23 = [v6 userIdentity];
  uint64_t v9 = [v6 platform];
  char v10 = [v6 transient];
  v24[0] = 1;
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  v12 = [(MCMContainerFactory *)self _containerPathIdentifierForContainerIdentity:v6];
  if (!v12)
  {
    int v18 = [[MCMError alloc] initWithErrorType:138];
    long long v17 = (void *)v23;
    if (!a4)
    {
LABEL_11:
      id v7 = 0;
      goto LABEL_12;
    }
LABEL_9:
    int v18 = v18;
    id v7 = 0;
    *a4 = v18;
    goto LABEL_12;
  }
  v22 = a4;
  char v13 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v6 uuid];

    uint64_t v11 = (void *)v14;
  }
  id v15 = [v6 containerConfig];
  char v16 = [(MCMContainerFactory *)self userIdentityCache];
  BYTE1(v21) = v10;
  LOBYTE(v21) = 0;
  long long v17 = (void *)v23;
  v8 = v13;
  +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:](MCMConcreteContainerIdentityForLibsystem, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v11, v23, v13, v15, v9, v12, v21, v16, v24);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v19 = [MCMError alloc];
    int v18 = [(MCMError *)v19 initWithErrorType:v24[0]];
    a4 = v22;
    if (!v22) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  int v18 = 0;
LABEL_12:

LABEL_13:

  return v7;
}

- (id)_createContainerForContainerIdentity:(id)a3 error:(id *)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 identifier];
  uint64_t v8 = [v6 containerClass];
  uint64_t v9 = [v6 userIdentity];
  char v10 = +[MCMTestLocks sharedInstance];
  [v10 waitOnLock:7];

  uint64_t v11 = +[MCMDataProtectionManager defaultManager];
  v12 = [(MCMContainerFactory *)self clientIdentity];
  uint64_t v13 = [v11 intendedDataProtectionClassBasedOnEntitlementsForIdentifier:v7 clientIdentity:v12 containerClass:v8 info:0];

  id v85 = 0;
  id v86 = 0;
  id v14 = [(MCMContainerFactory *)self createStagedContainerForContainerIdentity:v6 finalContainerPath:&v86 dataProtectionClass:v13 error:&v85];
  id v15 = v86;
  char v16 = (MCMError *)v85;
  if (!v14)
  {
    v80 = 0;
    uint64_t v24 = 0;
    id v34 = 0;
    char v46 = 0;
    if (!a4) {
      goto LABEL_47;
    }
    goto LABEL_45;
  }
  uint64_t v77 = v8;
  v78 = v9;
  v79 = v16;
  uint64_t v74 = a4;
  id v75 = v6;
  char v73 = [v14 containerIdentity];
  uint64_t v17 = [v73 containerPathIdentifier];
  int v18 = container_log_handle_for_category();
  if (os_signpost_enabled(v18))
  {
    v19 = [(MCMContainerFactory *)self clientIdentity];
    v20 = [v19 codeSignInfo];
    uint64_t v21 = [v20 identifier];
    v22 = (void *)v21;
    uint64_t v23 = @"<unknown>";
    *(_DWORD *)buf = 138478595;
    uint64_t v88 = v17;
    if (v21) {
      uint64_t v23 = (__CFString *)v21;
    }
    __int16 v89 = 2113;
    id v90 = v7;
    __int16 v91 = 2050;
    uint64_t v92 = v77;
    __int16 v93 = 2113;
    uint64_t v94 = v23;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CreatingContainer", " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ", buf, 0x2Au);
  }
  uint64_t v72 = self;
  v80 = (void *)v17;
  uint64_t v76 = v7;

  uint64_t v24 = [v14 containerPath];
  id v25 = [v15 containerClassPath];
  id v84 = 0;
  int v26 = [v25 createIfNecessaryWithError:&v84];
  id v27 = v84;

  if (v26)
  {
    int v28 = 0;
    uint64_t v29 = *MEMORY[0x1E4F28798];
    while (1)
    {

      BOOL v30 = +[MCMFileManager defaultManager];
      id v31 = [v24 containerRootURL];
      v32 = [v15 containerRootURL];
      id v83 = 0;
      char v33 = [v30 moveItemAtURL:v31 toURL:v32 error:&v83];
      id v34 = v83;

      if (v33) {
        break;
      }
      int v35 = container_log_handle_for_category();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v71 = [v24 containerRootURL];
        v43 = [v71 path];
        v44 = [v15 containerRootURL];
        v45 = [v44 path];
        *(_DWORD *)buf = 138412802;
        uint64_t v88 = (uint64_t)v43;
        __int16 v89 = 2112;
        id v90 = v45;
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v34;
        _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "Failed to move staging dir: %@ to live dir: %@; error = %@",
          buf,
          0x20u);
      }
      id v36 = [v34 domain];
      if ([v36 isEqualToString:v29])
      {
        uint64_t v37 = [v34 code];

        if (v37 == 66)
        {

          v60 = [MCMError alloc];
          v61 = [v15 containerRootURL];
          v62 = [v61 path];
          id v63 = [(MCMError *)v60 initWithErrorType:130 category:1 path:v62 POSIXerrno:66];

          p_super = v61;
          goto LABEL_21;
        }
      }
      else
      {
      }
      uint64_t v38 = [v34 domain];
      if (![v38 isEqualToString:v29])
      {

LABEL_32:
        id v63 = [[MCMError alloc] initWithErrorType:8];
        id v7 = v76;
        p_super = &v79->super;
        goto LABEL_33;
      }
      BOOL v39 = [v34 code] != 2;

      if ((v28 | v39)) {
        goto LABEL_32;
      }
      v40 = [v15 containerClassPath];
      [v40 setExists:0];

      int v41 = [v15 containerClassPath];
      id v84 = v34;
      char v42 = [v41 createIfNecessaryWithError:&v84];
      id v27 = v84;

      int v28 = 1;
      if ((v42 & 1) == 0) {
        goto LABEL_18;
      }
    }
    id v7 = v76;
    if (_os_feature_enabled_impl())
    {
      v47 = +[MCMFileManager defaultManager];
      int v48 = [v15 containerRootURL];
      id v82 = 0;
      char v49 = [v47 enableFastDiskUsageForURL:v48 error:&v82];
      id v50 = v82;

      if ((v49 & 1) == 0)
      {
        uint64_t v51 = container_log_handle_for_category();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          id v69 = [v15 containerRootURL];
          uint64_t v70 = [v69 path];
          *(_DWORD *)buf = 138412546;
          uint64_t v88 = (uint64_t)v70;
          __int16 v89 = 2112;
          id v90 = v50;
          _os_log_error_impl(&dword_1D7739000, v51, OS_LOG_TYPE_ERROR, "Failed to enable fast disk stats on new container [%@]; error = %@",
            buf,
            0x16u);
        }
      }
    }
    char v46 = [v14 metadataByChangingContainerPath:v15];
    uint64_t v24 = 0;
  }
  else
  {
LABEL_18:

    id v63 = [[MCMError alloc] initWithErrorType:8];
    p_super = container_log_handle_for_category();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      id v65 = [v15 classURL];
      id v66 = [v65 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v88 = (uint64_t)v66;
      __int16 v89 = 2112;
      id v90 = v27;
      _os_log_error_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_ERROR, "Failed to create class dir at %@ : %@", buf, 0x16u);
    }
    id v34 = v27;
LABEL_21:
    id v7 = v76;
LABEL_33:

    uint64_t v9 = v78;
    if (!v24)
    {
      char v46 = 0;
      char v16 = v63;
      a4 = v74;
      id v6 = v75;
      goto LABEL_44;
    }
    id v52 = containermanager_copy_global_configuration();
    char v53 = [v52 isGlobalContainerClass:v77];

    if (v53) {
      id v54 = 0;
    }
    else {
      id v54 = v78;
    }
    v55 = [v24 containerRootURL];
    id v81 = 0;
    BOOL v56 = [(MCMContainerFactory *)v72 deleteURL:v55 forUserIdentity:v54 reclaimSoon:1 error:&v81];
    id v14 = v81;

    if (!v56)
    {
      id v57 = container_log_handle_for_category();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      {
        id v67 = [v24 containerRootURL];
        id v68 = [v67 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v88 = (uint64_t)v68;
        __int16 v89 = 2112;
        id v90 = v14;
        _os_log_fault_impl(&dword_1D7739000, v57, OS_LOG_TYPE_FAULT, "Failed to remove staging dir: %@; error = %@",
          buf,
          0x16u);

        id v7 = v76;
      }
    }
    char v46 = 0;
    v79 = v63;
  }

  a4 = v74;
  id v6 = v75;
  uint64_t v9 = v78;
  char v16 = v79;
LABEL_44:
  id v14 = v73;
  if (!a4) {
    goto LABEL_47;
  }
LABEL_45:
  if (!v46)
  {
    v58 = v16;
    *a4 = v16;
    char v16 = v58;
  }
LABEL_47:

  return v46;
}

- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 reclaimSoon:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy__11811;
  v55 = __Block_byref_object_dispose__11812;
  id v56 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__11811;
  v49[4] = __Block_byref_object_dispose__11812;
  id v50 = 0;
  uint64_t v45 = 0;
  char v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v41 = 0;
  char v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__11811;
  v39[4] = __Block_byref_object_dispose__11812;
  id v40 = 0;
  v12 = [(MCMContainerFactory *)self userIdentityCache];
  uint64_t v13 = [v12 defaultUserIdentity];

  id v14 = MCMSharedDeathrowQueue();
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  int v28 = __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke;
  uint64_t v29 = &unk_1E6A80578;
  id v15 = v11;
  id v30 = v15;
  id v34 = &v51;
  int v35 = v39;
  id v36 = v49;
  id v16 = v10;
  id v31 = v16;
  v32 = self;
  id v17 = v13;
  id v33 = v17;
  uint64_t v37 = &v45;
  uint64_t v38 = &v41;
  dispatch_sync(v14, &v26);

  if (*((unsigned char *)v46 + 24))
  {
    if (v7)
    {
      int v18 = [MCMCommandContext alloc];
      v19 = [(MCMContainerFactory *)self clientIdentity];
      v20 = [(MCMContainerFactory *)self userIdentityCache];
      id v21 = containermanager_copy_global_configuration();
      v22 = [(MCMCommandContext *)v18 initWithClientIdentity:v19 containerCache:0 containerFactory:self userIdentityCache:v20 kernelPersonaID:0 globalConfiguration:v21];

      uint64_t v23 = [[MCMCommandOperationReclaimDiskSpace alloc] initWithAsynchronously:1 context:v22 resultPromise:0];
      [(MCMCommandOperationReclaimDiskSpace *)v23 execute];
    }
    goto LABEL_5;
  }
  if (*((unsigned char *)v42 + 24))
  {
LABEL_5:
    BOOL v24 = 1;
    goto LABEL_6;
  }
  BOOL v24 = 0;
  if (a6) {
    *a6 = (id) v52[5];
  }
LABEL_6:

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
  return v24;
}

void __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    +[MCMContainerClassDeletedPath deletedURLWithUserIdentity:](MCMContainerClassDeletedPath, "deletedURLWithUserIdentity:");
  }
  else {
  v2 = +[MCMContainerClassDeletedPath deletedGlobalURL];
  }
  if (!v2)
  {
    id v21 = [[MCMError alloc] initWithErrorType:13];
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Could not get deathrow URL", buf, 2u);
    }
    goto LABEL_23;
  }
  id v3 = +[MCMFileManager defaultManager];
  uint64_t v4 = *(void *)(*(void *)(a1 + 80) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 createTemporaryDirectoryInDirectoryURL:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) lastPathComponent];
    uint64_t v10 = objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, objc_msgSend(*(id *)(a1 + 40), "hasDirectoryPath"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = [*(id *)(a1 + 48) userIdentityCache];
    id v14 = [v13 libraryRepairForUserIdentity:*(void *)(a1 + 56)];

    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    id v16 = *(void **)(v15 + 40);
    uint64_t v17 = *(void *)(a1 + 40);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_15;
    v46[3] = &unk_1E6A809B8;
    v46[4] = *(void *)(a1 + 72);
    id v47 = v16;
    char v18 = [v14 fixAndRetryIfPermissionsErrorWithURL:v17 error:&v47 duringBlock:v46];
    objc_storeStrong((id *)(v15 + 40), v47);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v18;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
      goto LABEL_18;
    }
    v19 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) domain];
    if ([v19 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) code];

      if (v20 == 2)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v29 = [[MCMError alloc] initWithErrorType:41];
    uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
    id v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    uint64_t v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v40 = [*(id *)(a1 + 40) path];
      uint64_t v41 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) path];
      uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      id v50 = v40;
      __int16 v51 = 2112;
      id v52 = v41;
      __int16 v53 = 2112;
      uint64_t v54 = v42;
      _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "Failed to move item at: %@ to: %@; error = %@",
        buf,
        0x20u);
    }
  }
  else
  {
    BOOL v24 = [[MCMError alloc] initWithErrorType:41];
    uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    id v14 = container_log_handle_for_category();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    uint64_t v27 = [*(id *)(a1 + 40) path];
    int v28 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 138412546;
    id v50 = v27;
    __int16 v51 = 2112;
    id v52 = v28;
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to create unique directory at: %@; error = %@",
      buf,
      0x16u);
  }

LABEL_18:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    v32 = [*(id *)(a1 + 48) userIdentityCache];
    id v14 = [v32 libraryRepairForUserIdentity:*(void *)(a1 + 56)];

    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v34 = *(void *)(*(void *)(a1 + 80) + 8);
    id v45 = *(id *)(v34 + 40);
    char v35 = [v14 fixAndRetryIfPermissionsErrorWithURL:v33 error:&v45 duringBlock:&__block_literal_global_11820];
    objc_storeStrong((id *)(v34 + 40), v45);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v35;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      id v36 = [[MCMError alloc] initWithErrorType:41];
      uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v38 = *(void **)(v37 + 40);
      *(void *)(v37 + 40) = v36;

      BOOL v39 = container_log_handle_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = [*(id *)(a1 + 40) path];
        char v44 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        id v50 = v43;
        __int16 v51 = 2112;
        id v52 = v44;
        _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, "Failed to direct-delete [%@]; error = %@",
          buf,
          0x16u);
      }
    }
    goto LABEL_23;
  }
LABEL_24:
}

uint64_t __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [v6 moveItemAtURL:v5 toURL:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) error:a3];

  return v7;
}

uint64_t __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_17(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = +[MCMFileManager defaultManager];
  uint64_t v6 = [v5 removeItemAtURL:v4 error:a3];

  return v6;
}

- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 error:(id *)a5
{
  return [(MCMContainerFactory *)self deleteURL:a3 forUserIdentity:a4 reclaimSoon:0 error:a5];
}

- (id)createStagedContainerForContainerIdentity:(id)a3 finalContainerPath:(id *)a4 dataProtectionClass:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a3;
  v12 = [v10 UUID];
  uint64_t v13 = [v12 UUIDString];

  if (a4) {
    id v14 = *a4;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  id v87 = 0;
  id v16 = [(MCMContainerFactory *)self _generateConcreteContainerIdentityFromContainerIdentity:v11 error:&v87];

  uint64_t v17 = (MCMError *)v87;
  v78 = (void *)v13;
  if (!v16)
  {
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v54 = 0;
    id v26 = 0;
    id v75 = 0;
    v79 = 0;
    v80 = 0;
    uint64_t v55 = 0;
    if (a6)
    {
LABEL_28:
      char v46 = v17;
      v59 = a6;
      a6 = 0;
      id *v59 = v46;
      goto LABEL_29;
    }
LABEL_20:
    char v46 = v17;
LABEL_29:
    id v50 = v80;
    goto LABEL_30;
  }
  v71 = a4;
  char v73 = a6;
  uint64_t v18 = [v16 containerClass];
  uint64_t v74 = [v16 userIdentity];
  uint64_t v19 = [v16 containerPathIdentifier];
  int v20 = [v16 transient];
  id v21 = [v16 identityByChangingContainerPathIdentifier:v13];

  if (!v15)
  {
    uint64_t v22 = off_1E6A7EFB0;
    if (!v20) {
      uint64_t v22 = off_1E6A7EFA0;
    }
    id v15 = [(__objc2_class *)*v22 containerPathForUserIdentity:v74 containerClass:v18 containerPathIdentifier:v19];
  }
  unint64_t v72 = v18;
  uint64_t v23 = +[MCMContainerStagingPath stagingContainerPathForDestinationContainerPath:v15 stagingPathIdentifier:v13];
  BOOL v24 = [v23 containerClassPath];
  id v86 = 0;
  char v25 = [v24 createIfNecessaryWithError:&v86];
  id v26 = v86;

  v80 = v23;
  uint64_t v76 = v21;
  uint64_t v77 = (void *)v19;
  if ((v25 & 1) == 0)
  {
    char v46 = [[MCMError alloc] initWithErrorType:8];

    id v56 = container_log_handle_for_category();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = [v23 classURL];
      v58 = [v57 path];
      *(_DWORD *)buf = 138412546;
      p_isa = v58;
      __int16 v92 = 2112;
      id v93 = v26;
      _os_log_error_impl(&dword_1D7739000, v56, OS_LOG_TYPE_ERROR, "Failed to create staging class dir at %@ : %@", buf, 0x16u);
    }
    goto LABEL_26;
  }
  uint64_t v27 = [v23 containerClassPath];
  char v28 = [v27 supportsDataProtection];

  if ((v28 & 1) == 0)
  {
    uint64_t v29 = container_log_handle_for_category();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v23 containerClassPath];
      *(_DWORD *)buf = 138412290;
      p_isa = v30;
      _os_log_impl(&dword_1D7739000, v29, OS_LOG_TYPE_DEFAULT, "DP not supported for [%@]", buf, 0xCu);
    }
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  id v85 = v26;
  uint64_t v31 = v7;
  char v32 = [v80 createIfNecessaryWithDataProtectionClass:v7 error:&v85];
  id v33 = v85;

  if ((v32 & 1) == 0)
  {
    char v46 = [[MCMError alloc] initWithErrorType:7];

    id v56 = container_log_handle_for_category();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      id v66 = [v80 containerRootURL];
      id v67 = [v66 path];
      *(_DWORD *)buf = 138412546;
      p_isa = v67;
      __int16 v92 = 2112;
      id v93 = v33;
      _os_log_error_impl(&dword_1D7739000, v56, OS_LOG_TYPE_ERROR, "Failed to create staging dir at %@ : %@", buf, 0x16u);
    }
    id v26 = v33;
LABEL_26:
    uint64_t v54 = (void *)v74;

    id v75 = 0;
    v79 = 0;
    uint64_t v55 = 0;
    id v16 = 0;
    goto LABEL_27;
  }
  id v69 = v33;
  id v70 = v15;
  uint64_t v88 = @"com.apple.MobileInstallation.ContentProtectionClass";
  uint64_t v34 = [NSNumber numberWithInt:v31];
  __int16 v89 = v34;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];

  id v36 = [v21 identifier];
  id v84 = 0;
  +[MCMContainerSchema schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:](MCMContainerSchema, "schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:", v36, [v21 containerClass], &unk_1F2F12380, &v84);
  uint64_t v37 = v21;
  uint64_t v38 = self;
  BOOL v39 = (void *)v35;
  id v40 = v84;

  uint64_t v41 = [MCMMetadata alloc];
  uint64_t v42 = [(MCMContainerFactory *)v38 clientIdentity];
  uint64_t v43 = [(id)v42 codeSignInfo];
  char v44 = [v43 identifier];
  id v68 = v38;
  id v45 = [(MCMContainerFactory *)v38 userIdentityCache];
  id v75 = v39;
  v79 = v40;
  a6 = [(MCMMetadata *)v41 initWithContainerIdentity:v37 info:v39 containerPath:v80 userManagedAssetsDirName:0 schemaVersion:v40 dataProtectionClass:v31 creator:v44 userIdentityCache:v45];

  id v83 = v17;
  LOBYTE(v42) = [a6 writeMetadataToDiskWithError:&v83];
  char v46 = v83;

  if ((v42 & 1) == 0)
  {
    v61 = [[MCMError alloc] initWithErrorType:34];

    v62 = container_log_handle_for_category();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      p_isa = (id *)&v61->super.isa;
      _os_log_error_impl(&dword_1D7739000, v62, OS_LOG_TYPE_ERROR, "Failed to write metadata: %@", buf, 0xCu);
    }
    id v16 = 0;
    uint64_t v55 = 0;
    id v63 = v69;
    id v15 = v70;
    id v50 = v80;
LABEL_44:

    id v26 = v63;
    char v46 = v61;
    goto LABEL_45;
  }
  id v47 = containermanager_copy_global_configuration();
  int v48 = [v47 isGlobalSystemContainerWithContainerClass:v72];

  if (!v48)
  {
    id v26 = v69;
    id v15 = v70;
    id v50 = v80;
    __int16 v53 = v68;
LABEL_37:
    id v16 = 0;
    if (v72 <= 0xB && ((1 << v72) & 0xED4) != 0)
    {
      v64 = [(MCMContainerFactory *)v53 userIdentityCache];
      id v16 = [v64 libraryRepairForUserIdentity:v74];
    }
    uint64_t v55 = +[MCMContainerSchema containerSchemaWithMetadata:a6 finalContainerPath:v15 dataProtectionClass:v31 libraryRepair:v16];
    id v81 = v26;
    char v65 = [v55 writeSchemaFromVersion:&unk_1F2F12398 toTargetVersion:v40 error:&v81];
    id v63 = v81;

    if (v65)
    {
      id v26 = v63;
      goto LABEL_45;
    }
    v61 = [[MCMError alloc] initWithErrorType:109];

    v62 = container_log_handle_for_category();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      p_isa = a6;
      __int16 v92 = 2112;
      id v93 = v63;
      _os_log_error_impl(&dword_1D7739000, v62, OS_LOG_TYPE_ERROR, "Could not create container schema for %@: %@", buf, 0x16u);
    }
    goto LABEL_44;
  }
  char v49 = +[MCMFileManager defaultManager];
  id v50 = v80;
  __int16 v51 = [v80 containerRootURL];
  id v82 = v69;
  int v52 = [v49 setTopLevelSystemContainerACLAtURL:v51 error:&v82];
  id v26 = v82;

  __int16 v53 = v68;
  if (v52)
  {
    id v15 = v70;
    goto LABEL_37;
  }
  id v16 = 0;
  uint64_t v55 = 0;
  id v15 = v70;
LABEL_45:
  uint64_t v54 = (void *)v74;
  if (!a6)
  {
LABEL_27:
    uint64_t v17 = v46;
    a6 = v73;
    if (v73) {
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  if (v71)
  {
    id v15 = v15;
    id *v71 = v15;
  }
LABEL_30:

  return a6;
}

uint64_t __71__MCMContainerFactory_Upgrades__upgradeContainer_clientIdentity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = +[MCMFileManager defaultManager];
  uint64_t v7 = [v6 itemAtURL:v5 exists:*(void *)(*(void *)(a1 + 32) + 8) + 24 isDirectory:*(void *)(*(void *)(a1 + 40) + 8) + 24 error:a3];

  return v7;
}

@end