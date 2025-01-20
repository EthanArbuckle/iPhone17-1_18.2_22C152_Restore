@interface MCMContainerMigrator
+ (id)sharedInstance;
- (BOOL)_migrateBundleContainersWithError:(id *)a3;
- (BOOL)_migrateDeleteOperationManifestsWithError:(id *)a3;
- (BOOL)_migrateManifestIfNecessaryAtURL:(id)a3 withLibraryRepairForUser:(id)a4 error:(id *)a5;
- (BOOL)_performEntitlementBypassListMigrationWithError:(id *)a3;
- (BOOL)performSynchronousBuildUpgradeMigration:(id)a3 context:(id)a4 error:(id *)a5;
- (MCMContainerMigrator)initWithUserIdentityCache:(id)a3;
- (MCMUserIdentityCache)userIdentityCache;
- (void)_checkIfDeviceMayNeedSystemContainerACLMigration:(id)a3;
- (void)setUserIdentityCache:(id)a3;
@end

@implementation MCMContainerMigrator

- (void).cxx_destruct
{
  p_userIdentityCache = &self->_userIdentityCache;

  objc_storeStrong((id *)p_userIdentityCache, 0);
}

- (void)setUserIdentityCache:(id)a3
{
  p_userIdentityCache = &self->_userIdentityCache;

  objc_storeStrong((id *)p_userIdentityCache, a3);
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (BOOL)_migrateManifestIfNecessaryAtURL:(id)a3 withLibraryRepairForUser:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [MCMDeleteManifest alloc];
  v11 = [(MCMContainerMigrator *)self userIdentityCache];
  id v36 = 0;
  id v12 = [(MCMDeleteManifest *)v10 initFromURL:v8 userIdentityCache:v11 error:&v36];
  id v13 = v36;

  if (!v12)
  {
    if ([v13 category] == 1 && objc_msgSend(v13, "POSIXerrno") == 2)
    {
      v14 = 0;
      if (a5)
      {
LABEL_26:
        id v13 = v13;
        BOOL v23 = 0;
        *a5 = v13;
        goto LABEL_27;
      }
LABEL_8:
      BOOL v23 = 0;
      goto LABEL_27;
    }
    v24 = container_log_handle_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v13;
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "Failed to materialize identity from manifest; error = %@, url = [%@]",
        buf,
        0x16u);
    }
    v14 = 0;
LABEL_25:

    if (a5) {
      goto LABEL_26;
    }
    goto LABEL_8;
  }
  v33 = a5;
  v14 = [v12 concreteContainerIdentity];
  id v15 = containermanager_copy_global_configuration();
  uint64_t v16 = [v14 containerClass];
  v17 = [v14 userIdentity];
  v18 = [v17 posixUser];
  if ([v15 dispositionForContainerClass:v16 forUser:v18] != 1)
  {

LABEL_10:
    BOOL v23 = 1;
    goto LABEL_27;
  }
  id v32 = v8;
  id v19 = v9;
  v20 = [v12 readURL];
  v21 = [v12 writeURL];
  char v22 = [v20 isEqual:v21];

  if ((v22 & 1) == 0)
  {
    v25 = container_log_handle_for_category();
    id v9 = v19;
    id v8 = v32;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v12 writeURL];
      *(_DWORD *)buf = 138412546;
      id v38 = v32;
      __int16 v39 = 2112;
      id v40 = v26;
      _os_log_impl(&dword_1D7739000, v25, OS_LOG_TYPE_DEFAULT, "Migrating delete manifest [%@] --> [%@]", buf, 0x16u);
    }
    id v35 = v13;
    v27 = [v12 deleteManifestAfterWritingUsingLibraryRepairForUser:v9 error:&v35];
    id v28 = v35;

    if (v27)
    {
      id v34 = v28;
      v29 = [v12 deleteManifestAfterRemovingUsingLibraryRepairForUser:v9 error:&v34];
      id v13 = v34;

      if (v29)
      {

        goto LABEL_10;
      }
      v24 = container_log_handle_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v32;
        __int16 v39 = 2112;
        id v40 = v13;
        _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "Failed to remove delete manifest at old location [%@], error = %@", buf, 0x16u);
      }
    }
    else
    {
      v24 = container_log_handle_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v31 = [v12 writeURL];
        *(_DWORD *)buf = 138412546;
        id v38 = v31;
        __int16 v39 = 2112;
        id v40 = v28;
        _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "Failed to write delete manifest at new location [%@], error = %@", buf, 0x16u);
      }
      id v13 = v28;
    }
    a5 = v33;
    goto LABEL_25;
  }
  BOOL v23 = 1;
  id v9 = v19;
  id v8 = v32;
LABEL_27:

  return v23;
}

- (BOOL)_migrateDeleteOperationManifestsWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = containermanager_copy_global_configuration();
  int v6 = [v5 runmode];

  if (!v6)
  {
    v21 = 0;
LABEL_23:
    BOOL v29 = 1;
    goto LABEL_31;
  }
  id v7 = containermanager_copy_global_configuration();
  id v8 = [v7 managedPathRegistry];
  id v9 = [v8 containermanagerDeleteOperations];

  v10 = [v9 url];
  if (v10)
  {
    v11 = +[MCMFileManager defaultManager];
    id v38 = 0;
    id v12 = [v11 urlsForItemsInDirectoryAtURL:v10 error:&v38];
    id v13 = v38;

    if (v12)
    {
      id v35 = v13;
      id v36 = v9;
      v14 = [(MCMContainerMigrator *)self userIdentityCache];
      id v15 = [(MCMContainerMigrator *)self userIdentityCache];
      uint64_t v16 = [v15 defaultUserIdentity];
      v17 = [v14 libraryRepairForUserIdentity:v16];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v34 = v12;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        v33 = a3;
        v21 = 0;
        uint64_t v22 = *(void *)v41;
        while (2)
        {
          uint64_t v23 = 0;
          v24 = v21;
          do
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v18);
            }
            uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * v23);
            v37 = v24;
            BOOL v26 = -[MCMContainerMigrator _migrateManifestIfNecessaryAtURL:withLibraryRepairForUser:error:](self, "_migrateManifestIfNecessaryAtURL:withLibraryRepairForUser:error:", v25, v17, &v37, v33);
            v21 = v37;

            if (!v26)
            {

              a3 = v33;
              id v13 = v35;
              id v9 = v36;
              goto LABEL_28;
            }
            ++v23;
            v24 = v21;
          }
          while (v20 != v23);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v39 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
      else
      {
        v21 = 0;
      }

      id v13 = v35;
      id v9 = v36;
      id v12 = v34;
      goto LABEL_22;
    }
    v27 = [v13 domain];
    if ([v27 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v28 = [v13 code];

      if (v28 == 2)
      {
        v21 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
    }
    v30 = container_log_handle_for_category();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v32 = [v10 path];
      *(_DWORD *)buf = 138412546;
      v45 = v13;
      __int16 v46 = 2112;
      v47 = v32;
      _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Failed to get items at delete operations URL; error = %@, path = [%@]",
        buf,
        0x16u);
    }
    v21 = [[MCMError alloc] initWithNSError:v13 url:v10 defaultErrorType:146];
  }
  else
  {
    v21 = [[MCMError alloc] initWithErrorType:84 category:1];
    id v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending delete operations.", buf, 2u);
    }
  }
LABEL_28:

  if (a3)
  {
    v21 = v21;
    BOOL v29 = 0;
    *a3 = v21;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_31:

  return v29;
}

- (BOOL)performSynchronousBuildUpgradeMigration:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 runmode];

  if (v11 && ([v8 hasMigrationOccurredForType:@"DeleteManifestLocationChange"] & 1) == 0)
  {
    id v79 = 0;
    BOOL v12 = [(MCMContainerMigrator *)self _migrateDeleteOperationManifestsWithError:&v79];
    id v13 = v79;
    if (v12)
    {
      [v8 setMigrationCompleteForType:@"DeleteManifestLocationChange"];
    }
    else
    {
      v14 = container_log_handle_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v81 = v13;
        _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate delete manifest files; error = %@",
          (uint8_t *)&multiuser_flags,
          0xCu);
      }
    }
  }
  uint32_t multiuser_flags = 0;
  host_t v15 = MEMORY[0x1D9478CB0]();
  if (host_get_multiuser_config_flags(v15, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    id v17 = v9;
    id v18 = [(MCMContainerMigrator *)self userIdentityCache];
    uint64_t v19 = [v18 defaultUserIdentity];

    uint64_t v20 = [v19 homeDirectoryURL];
    v21 = [v20 URLByAppendingPathComponent:@"Library/Logs/MobileContainerManager" isDirectory:1];

    uint64_t v22 = +[MCMFileManager defaultManager];
    id v78 = 0;
    char v23 = [v22 removeItemAtURL:v21 error:&v78];
    id v16 = v78;

    if ((v23 & 1) == 0)
    {
      v24 = container_log_handle_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v81 = v16;
        _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "Failed to remove really old log directory: %@", (uint8_t *)&multiuser_flags, 0xCu);
      }
    }
    id v9 = v17;
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v25 = +[MCMPOSIXUser currentPOSIXUser];
  uint64_t v26 = [v25 homeDirectoryURL];
  uint64_t v27 = [(id)v26 URLByAppendingPathComponent:@"Library/Logs/MobileContainerManager" isDirectory:1];

  uint64_t v28 = (void *)v27;
  BOOL v29 = +[MCMFileManager defaultManager];
  id v77 = v16;
  LOBYTE(v26) = [v29 removeItemAtURL:v27 error:&v77];
  id v30 = v77;

  if ((v26 & 1) == 0)
  {
    v31 = container_log_handle_for_category();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint32_t multiuser_flags = 138412290;
      id v81 = v30;
      _os_log_error_impl(&dword_1D7739000, v31, OS_LOG_TYPE_ERROR, "Failed to remove old log directory: %@", (uint8_t *)&multiuser_flags, 0xCu);
    }
  }
  id v32 = containermanager_copy_global_configuration();
  BOOL v33 = 1;
  int v34 = [v32 dispositionForContainerClass:1];

  if (v34 == 1)
  {
    id v76 = v30;
    BOOL v35 = [(MCMContainerMigrator *)self _migrateBundleContainersWithError:&v76];
    id v36 = v76;

    if (v35)
    {
      BOOL v33 = 1;
    }
    else
    {
      v37 = container_log_handle_for_category();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v81 = v36;
        _os_log_error_impl(&dword_1D7739000, v37, OS_LOG_TYPE_ERROR, "Failed to migrate bundle containers : %@", (uint8_t *)&multiuser_flags, 0xCu);
      }

      BOOL v33 = 0;
    }
  }
  else
  {
    id v36 = v30;
  }
  id v38 = containermanager_copy_global_configuration();
  int v39 = [v38 dispositionForContainerClass:12];

  if (v39 == 1)
  {
    [(MCMContainerMigrator *)self _checkIfDeviceMayNeedSystemContainerACLMigration:v8];
    id v75 = v36;
    BOOL v40 = [(MCMContainerMigrator *)self _performEntitlementBypassListMigrationWithError:&v75];
    id v41 = v75;

    if (!v40)
    {
      long long v42 = container_log_handle_for_category();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v81 = v41;
        _os_log_error_impl(&dword_1D7739000, v42, OS_LOG_TYPE_ERROR, "Failed to migrate listed bundle containers : %@", (uint8_t *)&multiuser_flags, 0xCu);
      }

      BOOL v33 = 0;
    }
  }
  else
  {
    id v41 = v36;
  }
  id v43 = containermanager_copy_global_configuration();
  int v44 = [v43 dispositionForContainerClass:10];

  if (v44 == 1 && ([v8 hasMigrationOccurredForType:@"DaemonContainerCleaning"] & 1) == 0)
  {
    id v69 = v41;
    id v70 = v9;
    v72 = v8;
    v73 = v28;
    v71 = a5;
    v45 = +[MCMUserIdentitySharedCache sharedInstance];
    uint64_t v46 = [v45 allAccessibleUserIdentities];

    v47 = [MEMORY[0x1E4F1CA80] set];
    id v74 = 0;
    v68 = (void *)v46;
    uint64_t v48 = [(id)gContainerCache entriesForUserIdentities:v46 contentClass:10 transient:0 error:&v74];
    id v67 = v74;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v49 = v48;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v85 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v86 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          v55 = [v54 identifier];
          char v56 = [v55 hasPrefix:@"com.apple."];

          if ((v56 & 1) == 0)
          {
            v57 = [v54 containerIdentity];
            [v47 addObject:v57];
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v85 objects:v84 count:16];
      }
      while (v51);
    }

    id v9 = v70;
    if ([v47 count])
    {
      v58 = objc_alloc_init(MCMResultPromise);
      v59 = [v47 allObjects];
      v60 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v59 removeAllCodeSignInfo:0 context:v70 resultPromise:v58];

      [v60 execute];
      v61 = [(MCMResultPromise *)v58 result];
      v62 = [v61 error];

      if (v62)
      {
        v63 = container_log_handle_for_category();
        uint64_t v28 = v73;
        id v41 = v69;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
        {
          v66 = [v61 error];
          uint32_t multiuser_flags = 138412546;
          id v81 = v66;
          __int16 v82 = 2112;
          v83 = v47;
          _os_log_fault_impl(&dword_1D7739000, v63, OS_LOG_TYPE_FAULT, "Failed to clear daemon containers; error = %@, containers = %@",
            (uint8_t *)&multiuser_flags,
            0x16u);

          uint64_t v28 = v73;
        }

        id v8 = v72;
        goto LABEL_52;
      }
    }
    id v8 = v72;
    [v72 setMigrationCompleteForType:@"DaemonContainerCleaning"];
    uint64_t v28 = v73;
    id v41 = v69;
LABEL_52:

    a5 = v71;
  }
  if (a5) {
    char v64 = v33;
  }
  else {
    char v64 = 1;
  }
  if ((v64 & 1) == 0) {
    *a5 = v41;
  }

  return v33;
}

- (BOOL)_migrateBundleContainersWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v4 = 1;
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/Containers/Bundle" isDirectory:1];
  int v6 = +[MCMUserIdentityCache defaultUserIdentity];
  id v7 = containermanager_copy_global_configuration();
  id v8 = [v7 staticConfig];
  id v9 = [v8 configForContainerClass:1];

  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 classPathCache];
  BOOL v12 = [v11 containerClassPathForUserIdentity:v6 containerConfig:v9 typeClass:objc_opt_class()];

  if (!v12)
  {
    id v19 = 0;
    goto LABEL_13;
  }
  id v13 = +[MCMFileManager defaultManager];
  int v14 = [v13 itemExistsAtURL:v5];

  if (!v14)
  {
    id v19 = 0;
LABEL_12:
    BOOL v4 = 1;
    goto LABEL_13;
  }
  host_t v15 = container_log_handle_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7739000, v15, OS_LOG_TYPE_DEFAULT, "Moving bundle containers from user to system location", buf, 2u);
  }

  id v16 = +[MCMFileManager defaultManager];
  id v17 = [v12 classURL];
  id v22 = 0;
  char v18 = [v16 moveItemAtURL:v5 toURL:v17 error:&v22];
  id v19 = v22;

  if (v18) {
    goto LABEL_12;
  }
  uint64_t v20 = container_log_handle_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v19;
    _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Failed to migrate to new bundle containers location : %@.  This is terrible.", buf, 0xCu);
  }

  if (a3)
  {
    id v19 = v19;
    BOOL v4 = 0;
    *a3 = v19;
  }
  else
  {
    BOOL v4 = 0;
  }
LABEL_13:

  return v4;
}

- (void)_checkIfDeviceMayNeedSystemContainerACLMigration:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = containermanager_copy_global_configuration();
  id v5 = [v4 staticConfig];
  int v6 = [v5 configForContainerClass:12];

  id v7 = containermanager_copy_global_configuration();
  id v8 = [v7 staticConfig];
  id v9 = [v8 configForContainerClass:13];

  id v10 = containermanager_copy_global_configuration();
  LODWORD(v8) = [v10 systemContainerMode];

  if (v8 == 1 && ([v3 hasMigrationOccurredForType:@"ACLMigration"] & 1) == 0)
  {
    int v11 = +[MCMUserIdentityCache defaultUserIdentity];
    id v12 = containermanager_copy_global_configuration();
    id v13 = [v12 classPathCache];
    int v14 = [v13 containerClassPathForUserIdentity:v11 containerConfig:v6 typeClass:objc_opt_class()];
    host_t v15 = [v14 classURL];

    id v16 = containermanager_copy_global_configuration();
    id v17 = [v16 classPathCache];
    char v18 = [v17 containerClassPathForUserIdentity:v11 containerConfig:v9 typeClass:objc_opt_class()];
    id v19 = [v18 classURL];

    uint64_t v20 = +[MCMFileManager defaultManager];
    if ([v20 itemDoesNotExistAtURL:v15])
    {
      v21 = +[MCMFileManager defaultManager];
      int v22 = [v21 itemDoesNotExistAtURL:v19];

      if (v22)
      {
        char v23 = container_log_handle_for_category();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v24 = 0;
          _os_log_impl(&dword_1D7739000, v23, OS_LOG_TYPE_DEFAULT, "No system containers requiring ACL migration", v24, 2u);
        }

        [v3 setMigrationCompleteForType:@"ACLMigration"];
      }
    }
    else
    {
    }
  }
}

- (BOOL)_performEntitlementBypassListMigrationWithError:(id *)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v4 = [(MCMContainerMigrator *)self userIdentityCache];
  id v5 = [v4 defaultUserIdentity];

  id v6 = containermanager_copy_global_configuration();
  int v7 = [v6 systemContainerMode];

  if (!v7)
  {
    id v66 = 0;
    id v67 = 0;
    char v68 = 1;
    goto LABEL_61;
  }
  id v77 = a3;
  id v9 = 0;
  uint64_t v10 = 0;
  char v81 = 1;
  p_superclass = &OBJC_METACLASS___MCMContainerIdentity.superclass;
  unint64_t v12 = 0x1E4F1C000uLL;
  p_info = MCMContainerSchemaActionMkdir.info;
  *(void *)&long long v8 = 136315394;
  long long v74 = v8;
  char v14 = 1;
  do
  {
    char v15 = v14;
    uint64_t v16 = _performEntitlementBypassListMigrationWithError__possibleContainerClasses[v10];
    id v17 = p_superclass[357];
    char v18 = objc_msgSend(*(id *)(v12 + 2768), "setWithObject:", v5, v74);
    v99 = v9;
    uint64_t v92 = v16;
    id v19 = [(__objc2_class *)v17 entriesForUserIdentities:v18 contentClass:v16 transient:0 error:&v99];
    uint64_t v20 = v99;

    if (v20)
    {
      v73 = container_log_handle_for_category();
      v71 = v77;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v101 = v20;
        _os_log_error_impl(&dword_1D7739000, v73, OS_LOG_TYPE_ERROR, "Failed to get list of system containers for migration: %@", buf, 0xCu);
      }

      char v68 = 0;
LABEL_56:
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke;
      v93[3] = &unk_1E6A80A30;
      id v67 = v20;
      v94 = v67;
      __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke((uint64_t)v93);
      id v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v71) {
        goto LABEL_59;
      }
      goto LABEL_61;
    }
    char v78 = v15;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id obj = v19;
    uint64_t v91 = [obj countByEnumeratingWithState:&v113 objects:v112 count:16];
    id v9 = 0;
    if (!v91) {
      goto LABEL_46;
    }
    uint64_t v21 = *(void *)v114;
    uint64_t v83 = *(void *)v114;
    long long v85 = v5;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v114 != v21) {
          objc_enumerationMutation(obj);
        }
        char v23 = *(void **)(*((void *)&v113 + 1) + 8 * v22);
        id v24 = [v23 metadataMinimal];
        uint64_t v25 = [v24 identifier];
        if (v25)
        {
          uint64_t v26 = [p_info + 51 sharedBypassList];
          int v27 = [v26 containerIdIsWellknown:v25 class:v92];

          if (v27)
          {
            v98 = v9;
            uint64_t v28 = [v23 metadataWithError:&v98];
            BOOL v29 = v98;

            if (!v28)
            {
              id v69 = container_log_handle_for_category();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v101 = (const char *)v23;
                __int16 v102 = 2112;
                v103 = v29;
                _os_log_error_impl(&dword_1D7739000, v69, OS_LOG_TYPE_ERROR, "Couldn't load metadata; container = %@, error = %@",
                  buf,
                  0x16u);
              }
              id v9 = v29;

              char v70 = 0;
              goto LABEL_53;
            }
            long long v88 = v24;
            id v30 = v29;
            v31 = [p_info + 51 sharedBypassList];
            uint64_t v32 = [v31 wellknownContainerForId:v25 class:v92];

            uint64_t v89 = (void *)v32;
            BOOL v33 = +[MCMContainerPath containerPathForUserIdentity:v5 containerClass:v92 containerPathIdentifier:v32];
            int v34 = [v33 containerRootURL];
            BOOL v35 = [v28 containerPath];
            uint64_t v36 = [v35 containerRootURL];
            v90 = v34;
            if (v36)
            {
              v37 = (void *)v36;
              v84 = v33;
              long long v86 = v29;
              id v38 = [v28 containerPath];
              int v39 = [v38 containerRootURL];
              char v40 = [v39 isEqual:v34];

              if (v40)
              {
                id v41 = 0;
                p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
                BOOL v29 = v30;
                BOOL v33 = v84;
                goto LABEL_16;
              }
              id v43 = container_log_handle_for_category();
              BOOL v29 = v30;
              id v24 = v88;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                char v56 = [v28 containerPath];
                v57 = [v56 containerRootURL];
                v58 = [v57 path];
                v59 = [v34 path];
                *(_DWORD *)buf = 138412802;
                v101 = v25;
                __int16 v102 = 2112;
                v103 = v58;
                __int16 v104 = 2112;
                id v105 = v59;
                _os_log_error_impl(&dword_1D7739000, v43, OS_LOG_TYPE_ERROR, "Migrating well-known container %@ from %@ to %@", buf, 0x20u);

                BOOL v29 = v86;
              }

              id v97 = 0;
              char v44 = [(id)gContainerCache removeContainerForUserIdentity:v85 contentClass:v92 identifier:v25 transient:0 error:&v97];
              id v45 = v97;
              uint64_t v46 = v45;
              if (v44)
              {
                id v79 = v45;
                v47 = +[MCMFileManager defaultManager];
                uint64_t v48 = [v28 containerPath];
                id v49 = [v48 containerRootURL];
                id v96 = 0;
                char v50 = [v47 moveItemAtURL:v49 toURL:v34 error:&v96];
                v80 = v96;

                p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
                if (v50)
                {
                  BOOL v33 = v84;
                  uint64_t v51 = [v28 metadataByChangingContainerPath:v84];
                  BOOL v29 = v86;
                  if (v51)
                  {
                    id v41 = (void *)v51;
                    id v95 = 0;
                    uint64_t v52 = [(id)gContainerCache addContainerMetadata:v51 error:&v95];
                    id v75 = v95;
                    if (v52)
                    {
                      int v42 = 0;
                    }
                    else
                    {
                      v60 = container_log_handle_for_category();
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315650;
                        v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                        __int16 v102 = 2112;
                        v103 = v25;
                        __int16 v104 = 2112;
                        id v105 = v75;
                        _os_log_error_impl(&dword_1D7739000, v60, OS_LOG_TYPE_ERROR, "%s: Failed to update cache for listed container %@: %@", buf, 0x20u);
                      }

                      char v81 = 0;
                      int v42 = 2;
                    }

                    if (!v52)
                    {
LABEL_36:

                      id v9 = v29;
                      if (!v42)
                      {
                        uint64_t v21 = v83;
                        id v5 = v85;
                        goto LABEL_38;
                      }
                      char v70 = v81;
                      id v5 = v85;
LABEL_53:

                      char v81 = v70;
                      goto LABEL_54;
                    }
LABEL_17:
                    int v42 = 0;
                    goto LABEL_36;
                  }
                  v55 = container_log_handle_for_category();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v74;
                    v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                    __int16 v102 = 2112;
                    v103 = v25;
                    _os_log_error_impl(&dword_1D7739000, v55, OS_LOG_TYPE_ERROR, "%s: Failed to generate new metadata for listed container %@", buf, 0x16u);
                  }
                }
                else
                {
                  v54 = container_log_handle_for_category();
                  BOOL v29 = v86;
                  BOOL v33 = v84;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    __int16 v82 = [v28 containerPath];
                    id v76 = [v82 containerRootURL];
                    v61 = [v76 path];
                    v62 = [v34 path];
                    v63 = [v80 domain];
                    uint64_t v64 = [v80 code];
                    *(_DWORD *)buf = 136316418;
                    v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                    __int16 v102 = 2112;
                    v103 = v25;
                    __int16 v104 = 2112;
                    id v105 = v61;
                    __int16 v106 = 2112;
                    v107 = v62;
                    __int16 v108 = 2112;
                    v109 = v63;
                    __int16 v110 = 2048;
                    uint64_t v111 = v64;
                    _os_log_error_impl(&dword_1D7739000, v54, OS_LOG_TYPE_ERROR, "%s: Failed to move system container %@ from %@ to listed location %@: (error= %@: %lld)", buf, 0x3Eu);

                    BOOL v29 = v86;
                    BOOL v33 = v84;
                  }
                }
                uint64_t v46 = v79;
                v53 = v80;
              }
              else
              {
                v53 = container_log_handle_for_category();
                p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                  __int16 v102 = 2112;
                  v103 = v25;
                  __int16 v104 = 2112;
                  id v105 = v46;
                  _os_log_error_impl(&dword_1D7739000, v53, OS_LOG_TYPE_ERROR, "%s: Failed to remove cache for listed container %@: %@", buf, 0x20u);
                }
                BOOL v33 = v84;
              }

              id v41 = 0;
              char v81 = 0;
              int v42 = 2;
              goto LABEL_36;
            }

            id v41 = 0;
LABEL_16:
            id v24 = v88;
            goto LABEL_17;
          }
        }
LABEL_38:

        ++v22;
      }
      while (v91 != v22);
      uint64_t v65 = [obj countByEnumeratingWithState:&v113 objects:v112 count:16];
      uint64_t v91 = v65;
    }
    while (v65);
LABEL_46:

    char v14 = 0;
    uint64_t v10 = 1;
    p_superclass = (__objc2_class **)(&OBJC_METACLASS___MCMContainerIdentity + 8);
    unint64_t v12 = 0x1E4F1C000;
  }
  while ((v78 & 1) != 0);
LABEL_54:
  if (v9)
  {
    uint64_t v20 = v9;
    v71 = v77;
    char v68 = v81;
    goto LABEL_56;
  }
  id v67 = 0;
  id v66 = 0;
  v71 = v77;
  char v68 = v81;
  if (v77)
  {
LABEL_59:
    if ((v68 & 1) == 0)
    {
      id v66 = v66;
      char v68 = 0;
      id *v71 = v66;
    }
  }
LABEL_61:

  return v68 & 1;
}

id __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[[NSString alloc] initWithFormat:@"Error during entitlement bypass list migration: %@", *(void *)(a1 + 32)];
  v8[0] = @"FunctionName";
  id v3 = [NSString stringWithUTF8String:"-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]_block_invoke"];
  v9[0] = v3;
  v9[1] = &unk_1F2F11C78;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"MCMErrorDomain", objc_msgSend(*(id *)(a1 + 32), "type"), v5);

  return v6;
}

- (MCMContainerMigrator)initWithUserIdentityCache:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMContainerMigrator;
  id v6 = [(MCMContainerMigrator *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);
  }

  return v7;
}

+ (id)sharedInstance
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MCMContainerMigrator_sharedInstance__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  if (sharedInstance_onceToken_11321 != -1) {
    dispatch_once(&sharedInstance_onceToken_11321, v4);
  }
  v2 = (void *)sharedInstance_instance_11322;

  return v2;
}

void __38__MCMContainerMigrator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[MCMUserIdentitySharedCache sharedInstance];
  uint64_t v2 = objc_msgSend(v1, "initWithUserIdentityCache:");
  id v3 = (void *)sharedInstance_instance_11322;
  sharedInstance_instance_11322 = v2;
}

@end