@interface MDMMigrator
+ (id)sharedMigrator;
- (void)_createRMAccountWithPersonaID:(id)a3 managedAppleID:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6;
- (void)_moveNonStoreManagedBooksToSystemGroupContainer;
- (void)_moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:(id)a3;
- (void)_resetManagedAppRemovability;
- (void)_resetManagedAppTapToPayScreenLock;
- (void)_updateNonStoreBooksManifestForSystemGroupContainer;
- (void)_updateSkipBackupKeyForNonStoreBooksDirectory;
- (void)_updateToMDMPropertiesForDDMActiveState;
- (void)_updateUnlockTokenSecretToClassDIfNeeded;
- (void)_updateUserEnrollmentToUseRMAccount;
- (void)migrateMDMWithContext:(int)a3;
@end

@implementation MDMMigrator

+ (id)sharedMigrator
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!sharedMigrator_obj)
  {
    v3 = objc_alloc_init(MDMMigrator);
    v4 = (void *)sharedMigrator_obj;
    sharedMigrator_obj = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedMigrator_obj;
  return v5;
}

- (void)migrateMDMWithContext:(int)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = (void *)[objc_alloc(MEMORY[0x263F38BE8]) initWithReason:@"mdmd-MigrateMDM"];
  v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "MDM migrating...", buf, 2u);
  }
  if (a3)
  {
    v7 = MDMManagedNonStoreBooksSystemGroupContainer();
    v8 = [v7 stringByAppendingPathComponent:@"Managed"];

    char v17 = 0;
    v9 = [MEMORY[0x263F08850] defaultManager];
    int v10 = [v9 fileExistsAtPath:v8 isDirectory:&v17];

    if (v10 && v17)
    {
      v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEFAULT, "Found non-store managed books in seed-only system location. Migrating...", buf, 2u);
      }
      [(MDMMigrator *)self _moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:v8];
    }
    [(MDMMigrator *)self _moveNonStoreManagedBooksToSystemGroupContainer];
    [(MDMMigrator *)self _updateNonStoreBooksManifestForSystemGroupContainer];
    [(MDMMigrator *)self _updateSkipBackupKeyForNonStoreBooksDirectory];
    [(MDMMigrator *)self _updateUnlockTokenSecretToClassDIfNeeded];
    [(MDMMigrator *)self _updateUserEnrollmentToUseRMAccount];
    [(MDMMigrator *)self _updateToMDMPropertiesForDDMActiveState];

    if (a3 == 2)
    {
      [(MDMMigrator *)self _resetManagedAppRemovability];
      [(MDMMigrator *)self _resetManagedAppTapToPayScreenLock];
    }
  }
  else
  {
    id v18 = 0;
    BOOL v12 = MDMKeybagCreateMDMEscrowWithPasscode(&stru_26E549450, &v18);
    id v13 = v18;
    if (!v12)
    {
      v14 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v13;
        _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_ERROR, "Unable to create unlock escrow during erase-context migration: %{public}@", buf, 0xCu);
      }
    }
    v15 = objc_opt_new();
    [v15 migrateAllFiles];
  }
  v16 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_DEFAULT, "MDM completed migration.", buf, 2u);
  }
}

- (void)_moveNonStoreManagedBooksToSystemGroupContainer
{
  MDMLegacyManagedNonStoreBooksDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(MDMMigrator *)self _moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:v3];
}

- (void)_moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Migrating non-store managed books to system group container...", buf, 2u);
  }
  v5 = [MEMORY[0x263F08850] defaultManager];
  char v43 = 0;
  int v6 = [v5 fileExistsAtPath:v3 isDirectory:&v43];
  v7 = [MEMORY[0x263F52808] sharedConfiguration];
  int v8 = [v7 userMode];

  if (v8 == 1)
  {
    [v5 removeItemAtPath:v3 error:0];
    goto LABEL_58;
  }
  if (v43) {
    int v9 = v6;
  }
  else {
    int v9 = 0;
  }
  if (v9 != 1)
  {
    int v14 = 0;
    goto LABEL_49;
  }
  id v42 = 0;
  int v10 = [v5 contentsOfDirectoryAtPath:v3 error:&v42];
  id v11 = v42;
  if (![v10 count])
  {
    BOOL v15 = v11 != 0;
    int v13 = 1;
    goto LABEL_23;
  }
  if ([v10 count] == 1)
  {
    BOOL v12 = [v10 firstObject];
    int v13 = [v12 isEqualToString:@".Managed.plist.lock"];
  }
  else
  {
    int v13 = 0;
  }
  BOOL v15 = v11 != 0;
  if (v11 || (v13 & 1) != 0)
  {
LABEL_23:
    int v14 = 0;
    if (v15) {
      id v22 = v11;
    }
    else {
      id v22 = 0;
    }
    if (!v15 && v13)
    {
      v23 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v23, OS_LOG_TYPE_DEFAULT, "Removing empty legacy non-store managed books...", buf, 2u);
      }
      id v39 = 0;
      [v5 removeItemAtPath:v3 error:&v39];
      id v22 = v39;
      if (v22)
      {
        v24 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v47 = v22;
          _os_log_impl(&dword_230A49000, v24, OS_LOG_TYPE_ERROR, "Failed to delete empty legacy non-store managed books with error %{public}@", buf, 0xCu);
        }
      }
      int v14 = 0;
    }
    goto LABEL_48;
  }
  v16 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_DEFAULT, "Moving legacy non-store managed books directory...", buf, 2u);
  }
  char v17 = MDMManagedNonStoreBooksDirectory();
  v41[1] = 0;
  int v18 = DMCSafelyCopyItemAtPathToDestinationPath();
  id v19 = 0;

  if (v19)
  {
    id v20 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_DWORD *)buf = 138543362;
    id v47 = v19;
    uint64_t v21 = "Failed to move legacy non-store managed books with error %{public}@";
    goto LABEL_22;
  }
  if (!v18)
  {
    v25 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v25, OS_LOG_TYPE_ERROR, "Failed to move legacy non-store managed books with no error", buf, 2u);
    }
    goto LABEL_41;
  }
  if (![v5 fileExistsAtPath:v3])
  {
LABEL_41:
    id v19 = 0;
    goto LABEL_42;
  }
  v41[0] = 0;
  [v5 removeItemAtPath:v3 error:v41];
  id v19 = v41[0];
  if (v19)
  {
    id v20 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v47 = v19;
      uint64_t v21 = "Failed to delete legacy non-store managed books with error %{public}@";
LABEL_22:
      _os_log_impl(&dword_230A49000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
    }
  }
LABEL_42:
  v26 = MDMManagedNonStoreBooksDirectory();
  int v27 = [v5 fileExistsAtPath:v26];

  if (v27)
  {
    uint64_t v44 = *MEMORY[0x263F08078];
    v28 = [NSNumber numberWithUnsignedLong:511];
    v45 = v28;
    v29 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];

    v30 = MDMManagedNonStoreBooksDirectory();
    id v40 = v19;
    [v5 setAttributes:v29 ofItemAtPath:v30 error:&v40];
    id v22 = v40;

    if (v22)
    {
      v31 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v47 = v22;
        _os_log_impl(&dword_230A49000, v31, OS_LOG_TYPE_ERROR, "Failed to set permissions on new non-store managed books directory with error %{public}@", buf, 0xCu);
      }
    }

    int v14 = 1;
  }
  else
  {
    int v14 = 0;
    id v22 = v19;
  }
LABEL_48:

LABEL_49:
  v32 = MDMManagedNonStoreBooksDirectory();
  int v33 = [v5 fileExistsAtPath:v32];

  if (!v33)
  {
    if (!v14) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  v34 = MDMManagedNonStoreBooksDirectory();
  char v35 = DMCFixPermissionsOfSystemGroupContainerDirectoryAndContents();
  id v36 = 0;

  if ((v35 & 1) == 0)
  {
    if ([v36 count])
    {
      v37 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v47 = v36;
        _os_log_impl(&dword_230A49000, v37, OS_LOG_TYPE_ERROR, "Failed to fix permissions of device's MDM managed non-store books with errors %{public}@", buf, 0xCu);
      }
    }
  }

  if (v14) {
LABEL_57:
  }
    MDMSendManagedBooksChangedNotification();
LABEL_58:
  v38 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v38, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books system group container migration.", buf, 2u);
  }
}

- (void)_updateNonStoreBooksManifestForSystemGroupContainer
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v2, OS_LOG_TYPE_DEFAULT, "Beginning update of non-store managed books manifest...", buf, 2u);
  }
  id v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = MDMManagedNonStoreBooksManifestPath();
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    int v6 = NSDictionary;
    v7 = MDMManagedNonStoreBooksManifestPath();
    int v8 = [v6 dictionaryWithContentsOfFile:v7];

    if (!v8)
    {
      id v39 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v39, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books manifest update with empty manifest.", buf, 2u);
      }
      goto LABEL_38;
    }
    uint64_t v9 = *MEMORY[0x263F52AE8];
    int v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52AE8]];
    if (!v10)
    {
      id v40 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v40, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books manifest update with no books.", buf, 2u);
      }
      goto LABEL_37;
    }
    v46 = [MEMORY[0x263EFF9A0] dictionary];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v41 = v9;
      id v42 = v3;
      char v43 = v10;
      uint64_t v44 = v8;
      char v45 = 0;
      uint64_t v14 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = (void *)[objc_alloc(MEMORY[0x263F527F8]) initWithManifestDictionary:*(void *)(*((void *)&v51 + 1) + 8 * i)];
          char v17 = [v16 persistentID];

          if (v17)
          {
            uint64_t v18 = [v16 fullPath];
            if (v18)
            {
              id v19 = (void *)v18;
              id v20 = [v16 fullPath];
              MDMManagedNonStoreBooksDirectory();
              v22 = id v21 = v11;
              char v23 = [v20 hasPrefix:v22];

              id v11 = v21;
              if ((v23 & 1) == 0)
              {
                v24 = MDMManagedNonStoreBooksDirectory();
                v25 = [v16 fullPath];
                v26 = [v25 lastPathComponent];
                int v27 = [v24 stringByAppendingPathComponent:v26];

                id v11 = v21;
                [v16 setFullPath:v27];

                char v45 = 1;
              }
            }
            v28 = objc_msgSend(v16, "persistentID", v41);
            [v46 setObject:v16 forKeyedSubscript:v28];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v13);

      id v3 = v42;
      int v10 = v43;
      if ((v45 & 1) == 0) {
        goto LABEL_28;
      }
      id v11 = [MEMORY[0x263EFF9A0] dictionary];
      v29 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v46, "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v30 = [v46 allValues];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v48 != v33) {
              objc_enumerationMutation(v30);
            }
            char v35 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "manifestDictionary", v41);
            [v29 addObject:v35];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v32);
      }

      [v11 setObject:v29 forKeyedSubscript:v41];
      id v36 = MDMManagedNonStoreBooksManifestPath();
      [v11 writeToFile:v36 atomically:1];

      MDMSendManagedBooksChangedNotification();
      int v10 = v43;
      int v8 = v44;
    }

LABEL_28:
    v37 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v37, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books manifest update.", buf, 2u);
    }

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  v38 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v38, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books manifest update with no manifest.", buf, 2u);
  }
LABEL_39:
}

- (void)_updateSkipBackupKeyForNonStoreBooksDirectory
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = MDMManagedNonStoreBooksDirectory();
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    char v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Migrating enterprise book backup flag...", (uint8_t *)v14, 2u);
    }
    int v6 = !+[MDMMCInterface isEnterpriseBookBackupAllowed];
    v7 = MDMManagedNonStoreBooksDirectory();
    char v8 = DMCSetSkipBackupAttributeToItemAtPath();

    uint64_t v9 = *(NSObject **)DMCLogObjects();
    if (v8)
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v14[0] = 67109120;
      v14[1] = v6;
      int v10 = "Set backup exclusion on enterprise books directory to %d";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 8;
    }
    else
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        return;
      }
      LOWORD(v14[0]) = 0;
      int v10 = "Failed to set backup exclusion on enterprise books directory";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 2;
    }
    _os_log_impl(&dword_230A49000, v11, v12, v10, (uint8_t *)v14, v13);
  }
}

- (void)_updateUnlockTokenSecretToClassDIfNeeded
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F38B90];
  uint64_t v3 = *MEMORY[0x263F52EA0];
  uint64_t v4 = *MEMORY[0x263F52AF8];
  char v5 = [MEMORY[0x263F52810] sharedConfiguration];
  int v6 = [v5 personaID];
  id v39 = 0;
  LOBYTE(v31) = v6 != 0;
  uint64_t v35 = v4;
  v7 = [v2 dataFromService:v3 account:v4 label:0 description:0 group:0 useSystemKeychain:0 enforcePersonalPersona:v31 outError:&v39];
  id v8 = v39;

  uint64_t v9 = [MEMORY[0x263F38B90] stringFromServiceData:v7];
  int v10 = (void *)MEMORY[0x263F38B90];
  uint64_t v11 = *MEMORY[0x263F529E8];
  os_log_type_t v12 = [MEMORY[0x263F52810] sharedConfiguration];
  uint32_t v13 = [v12 personaID];
  id v38 = v8;
  LOBYTE(v32) = v13 != 0;
  uint64_t v14 = [v10 dataFromService:v3 account:v11 label:0 description:0 group:0 useSystemKeychain:0 enforcePersonalPersona:v32 outError:&v38];
  id v15 = v38;

  id v36 = (void *)v14;
  v16 = [MEMORY[0x263F38B90] stringFromServiceData:v14];
  if (v9)
  {
    v34 = v7;
    char v17 = (void *)MEMORY[0x263F38B90];
    uint64_t v18 = [MEMORY[0x263F52810] sharedConfiguration];
    id v19 = [v18 personaID];
    [v17 removeItemForService:v3 account:v35 label:0 description:0 useSystemKeychain:0 enforcePersonalPersona:v19 != 0 group:0];

    if (v16)
    {
      id v20 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v20, OS_LOG_TYPE_DEFAULT, "Not migrating old MDM secret because we already have a new one!", buf, 2u);
      }
      id v21 = +[MDMEvents sharedInstance];
      [v21 recordDateForEvent:@"UnlockTokenSuperseded"];
    }
    else
    {
      char v23 = (void *)MEMORY[0x263F38B90];
      v24 = [MEMORY[0x263F38B90] dataFromString:v9];
      uint64_t v25 = *MEMORY[0x263F16EB8];
      v26 = [MEMORY[0x263F52810] sharedConfiguration];
      int v27 = [v26 personaID];
      id v37 = v15;
      BYTE2(v33) = v27 != 0;
      LOWORD(v33) = 256;
      LOBYTE(v23) = objc_msgSend(v23, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:", v24, v3, v11, 0, 0, v25, 0, v33, &v37);
      id v28 = v37;

      if (v23)
      {
        v29 = +[MDMEvents sharedInstance];
        [v29 recordDateForEvent:@"UnlockTokenMigrationDate"];
      }
      else
      {
        v30 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v41 = v28;
          _os_log_impl(&dword_230A49000, v30, OS_LOG_TYPE_ERROR, "Could not set unlock token item: %{public}@", buf, 0xCu);
        }
      }
      id v15 = v28;
    }
    v7 = v34;
LABEL_15:

    goto LABEL_16;
  }
  if (v15)
  {
    id v22 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = v15;
      _os_log_impl(&dword_230A49000, v22, OS_LOG_TYPE_ERROR, "Could not get unlock token item: %{public}@", buf, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_resetManagedAppRemovability
{
  v2 = NSDictionary;
  uint64_t v3 = MDMAppManagementFilePath();
  uint64_t v4 = [v2 dictionaryWithContentsOfFile:v3];

  if ([v4 count])
  {
    char v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F52A90]];
    if ([v5 count])
    {
      int v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up managed app removability...", v7, 2u);
      }
      [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1];
    }
  }
}

void __43__MDMMigrator__resetManagedAppRemovability__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  char v5 = [a3 objectForKeyedSubscript:*MEMORY[0x263F52A88]];
  if ([v5 count])
  {
    int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F52A70]];
    v7 = v6;
    if (v6 && ([v6 BOOLValue] & 1) == 0)
    {
      id v8 = (void *)MEMORY[0x263F4BE78];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __43__MDMMigrator__resetManagedAppRemovability__block_invoke_2;
      v9[3] = &unk_264B9D6F0;
      id v10 = v4;
      [v8 setRemovability:2 forAppWithBundleID:v10 completion:v9];
    }
  }
}

void __43__MDMMigrator__resetManagedAppRemovability__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_ERROR, "Could not set removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_resetManagedAppTapToPayScreenLock
{
  v2 = NSDictionary;
  id v3 = MDMAppManagementFilePath();
  id v4 = [v2 dictionaryWithContentsOfFile:v3];

  if ([v4 count])
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F52A90]];
    if ([v5 count])
    {
      int v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up managed app tapToPayScreenLock...", v7, 2u);
      }
      [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_30];
    }
  }
}

void __49__MDMMigrator__resetManagedAppTapToPayScreenLock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F52A88]];
  if ([v6 count])
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F52A78]];
    __int16 v8 = v7;
    if (v7 && [v7 BOOLValue])
    {
      uint64_t v12 = 0;
      uint32_t v13 = &v12;
      uint64_t v14 = 0x2050000000;
      id v9 = (void *)getPRSettingsProviderClass_softClass;
      uint64_t v15 = getPRSettingsProviderClass_softClass;
      if (!getPRSettingsProviderClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        char v17 = __getPRSettingsProviderClass_block_invoke;
        uint64_t v18 = &unk_264B9D740;
        id v19 = &v12;
        __getPRSettingsProviderClass_block_invoke((uint64_t)&buf);
        id v9 = (void *)v13[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v12, 8);
      objc_msgSend(v10, "setMDMAppAttribute:withValue:forBundleID:", 0, objc_msgSend(v8, "BOOLValue", v12), v4);
      uint64_t v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEBUG, "Called [PRSettingsProvider setMDMAppAttribute] enabled=%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

- (void)_updateUserEnrollmentToUseRMAccount
{
  id v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "MDM migration: beginning update of user enrollment to use RMAccount.", buf, 2u);
  }
  if ([MEMORY[0x263F38BA0] isSharediPad])
  {
    id v4 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v33 = 0;
    id v5 = "MDM migration: ending update of user enrollment: not required on Shared iPad.";
    int v6 = (uint8_t *)&v33;
LABEL_13:
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    return;
  }
  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  __int16 v8 = MDMFilePath();
  char v9 = [v7 fileExistsAtPath:v8 isDirectory:0];

  if ((v9 & 1) == 0)
  {
    id v4 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)uint64_t v32 = 0;
    id v5 = "MDM migration: ending update of user enrollment: no MDM enrollment present.";
    int v6 = v32;
    goto LABEL_13;
  }
  id v10 = [MEMORY[0x263F52810] sharedConfiguration];
  if ([v10 isUserEnrollment])
  {
    uint64_t v11 = [v10 rmAccountID];

    uint64_t v12 = *(NSObject **)DMCLogObjects();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (!v11)
    {
      if (v13)
      {
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEFAULT, "MDM migration: upgrading user enrollment to add an RMAccount", v31, 2u);
      }
      uint64_t v18 = [v10 personaID];
      id v19 = [MEMORY[0x263F38B20] managedAppleIDNameWithPersonaID:v18];
      uint64_t v20 = [v10 memberQueueManagingProfileIdentifier];
      id v21 = [MEMORY[0x263EFB210] defaultStore];
      id v22 = objc_msgSend(v21, "dmc_iCloudAccountWithUsername:", v19);

      uint64_t v23 = [v22 accountDescription];
      v24 = (void *)v23;
      if (v23) {
        uint64_t v25 = (void *)v23;
      }
      else {
        uint64_t v25 = v19;
      }
      id v26 = v25;

      [(MDMMigrator *)self _createRMAccountWithPersonaID:v18 managedAppleID:v19 profileIdentifier:v20 organizationName:v26];
      int v27 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_230A49000, v27, OS_LOG_TYPE_DEFAULT, "MDM migration: ending update of user enrollment: upgrade complete.", v30, 2u);
      }

      goto LABEL_25;
    }
    if (v13)
    {
      __int16 v29 = 0;
      uint64_t v14 = "MDM migration: ending update of user enrollment: no need to upgrade.";
      uint64_t v15 = (uint8_t *)&v29;
      v16 = v12;
LABEL_16:
      _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
  }
  else
  {
    char v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = 0;
      uint64_t v14 = "MDM migration: ending update of user enrollment: no MDM user enrollment present.";
      uint64_t v15 = (uint8_t *)&v28;
      v16 = v17;
      goto LABEL_16;
    }
  }
LABEL_25:
}

- (void)_createRMAccountWithPersonaID:(id)a3 managedAppleID:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__4;
  id v36 = __Block_byref_object_dispose__4;
  id v37 = 0;
  BOOL v13 = objc_opt_new();
  uint64_t v14 = [MEMORY[0x263F389C8] enrollmentFlowController];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  __int16 v28 = __95__MDMMigrator__createRMAccountWithPersonaID_managedAppleID_profileIdentifier_organizationName___block_invoke;
  __int16 v29 = &unk_264B9D718;
  uint64_t v31 = &v32;
  id v15 = v13;
  id v30 = v15;
  [v14 updateMDMUserEnrollmentWithManagedAppleID:v10 profileIdentifier:v11 organizationName:v12 personaID:v9 completionHandler:&v26];
  objc_msgSend(v15, "waitForCompletion", v26, v27, v28, v29);
  if (v33[5])
  {
    v16 = *(id *)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      char v17 = [(id)v33[5] DMCVerboseDescription];
      *(_DWORD *)long long buf = 138543362;
      id v39 = v17;
      _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_ERROR, "Failed to create RMAccount: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263EFB210] defaultStore];
    v16 = objc_msgSend(v18, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v11);

    id v19 = [v16 identifier];
    if (v19)
    {
      uint64_t v20 = (void *)MEMORY[0x263EFF9A0];
      id v21 = MDMFilePath();
      id v22 = [v20 dictionaryWithContentsOfFile:v21];

      if (v22)
      {
        [v22 setObject:v19 forKeyedSubscript:*MEMORY[0x263F52E68]];
        uint64_t v23 = MDMFilePath();
        [v22 DMCWriteToBinaryFile:v23];

        v24 = [MEMORY[0x263F52810] sharedConfiguration];
        [v24 refreshDetailsFromDisk];
      }
      uint64_t v25 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        id v39 = v19;
        _os_log_impl(&dword_230A49000, v25, OS_LOG_TYPE_DEBUG, "Created RMAccount: %{public}@", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v32, 8);
}

void __95__MDMMigrator__createRMAccountWithPersonaID_managedAppleID_profileIdentifier_organizationName___block_invoke(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  [*(id *)(a1 + 32) complete];
}

- (void)_updateToMDMPropertiesForDDMActiveState
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 valueForKey:@"RMDMActive"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = [v3 BOOLValue];
    id v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = NSNumber;
      uint64_t v7 = v5;
      __int16 v8 = [v6 numberWithBool:v4];
      int v14 = 138543362;
      id v15 = v8;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEBUG, "MDM migration: Got old DDM active state: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    if (v4)
    {
      id v9 = [MEMORY[0x263F52810] sharedConfiguration];
      id v10 = (id)[v9 setPropertyForKey:@"RMDMActive" value:MEMORY[0x263EFFA88] channelType:0];
      id v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEBUG, "MDM migration: Wrote new DDM active state", (uint8_t *)&v14, 2u);
      }
    }
    id v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v12 removeObjectForKey:@"RMDMActive"];
  }
  else
  {
    BOOL v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_230A49000, v13, OS_LOG_TYPE_DEBUG, "MDM migration: No DDM active state", (uint8_t *)&v14, 2u);
    }
  }
}

@end