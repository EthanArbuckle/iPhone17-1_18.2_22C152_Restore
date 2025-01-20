@interface MCMMigrationStatus
+ (id)currentBuildVersion;
- (BOOL)_writeMigrationStatusToDisk;
- (BOOL)hasMigrationOccurredForType:(id)a3;
- (BOOL)isBuildUpgrade;
- (MCMMigrationStatus)init;
- (NSMutableDictionary)migrationInfo;
- (NSURL)migrationFileURL;
- (id)_iso8601DateFormatter;
- (id)_readMigrationStatusFromDisk;
- (id)_readMigrationStatusFromDiskAtURL:(id)a3;
- (id)initForMobileUserMigration;
- (id)initForSystemMigration;
- (void)_consolidateForUnifiedDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3;
- (void)_consolidateForUserDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3;
- (void)_consolidateSystemDaemonMigrationStatusWithLibraryURL:(id)a3;
- (void)_consolidateUnifiedDaemonMigrationStatusWithLibraryURL:(id)a3;
- (void)_consolidateUserDaemonMigrationStatusWithLibraryURL:(id)a3;
- (void)_readStatusFromMarkerFileWithName:(id)a3 andSetAsType:(id)a4 libraryURL:(id)a5;
- (void)_removeMarkerFileWithName:(id)a3 libraryURL:(id)a4;
- (void)setMigrationCompleteForType:(id)a3;
- (void)setMigrationFileURL:(id)a3;
- (void)setMigrationInfo:(id)a3;
- (void)writeCurrentBuildInfoToDisk;
@end

@implementation MCMMigrationStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationFileURL, 0);

  objc_storeStrong((id *)&self->_migrationInfo, 0);
}

- (void)setMigrationFileURL:(id)a3
{
  p_migrationFileURL = &self->_migrationFileURL;

  objc_storeStrong((id *)p_migrationFileURL, a3);
}

- (NSURL)migrationFileURL
{
  return self->_migrationFileURL;
}

- (void)setMigrationInfo:(id)a3
{
  p_migrationInfo = &self->_migrationInfo;

  objc_storeStrong((id *)p_migrationInfo, a3);
}

- (NSMutableDictionary)migrationInfo
{
  return self->_migrationInfo;
}

- (id)_iso8601DateFormatter
{
  if (_iso8601DateFormatter_onceToken != -1) {
    dispatch_once(&_iso8601DateFormatter_onceToken, &__block_literal_global_61);
  }
  v2 = (void *)_iso8601DateFormatter_dateFormatter;

  return v2;
}

uint64_t __43__MCMMigrationStatus__iso8601DateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_iso8601DateFormatter_dateFormatter;
  _iso8601DateFormatter_dateFormatter = v0;

  v2 = (void *)_iso8601DateFormatter_dateFormatter;

  return [v2 setFormatOptions:1907];
}

- (BOOL)isBuildUpgrade
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(MCMMigrationStatus *)self migrationInfo];
  v3 = [v2 objectForKeyedSubscript:@"LastBuildInfo"];

  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4F1CD10];
    v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
    if (!v5)
    {
      v7 = container_log_handle_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Could not get build version from last build info dictionary; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }
      char v15 = 1;
      goto LABEL_26;
    }
    v6 = _CFCopySystemVersionDictionary();
    v7 = v6;
    if (!v6)
    {
      v8 = container_log_handle_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Could not get current build info; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }
      char v15 = 1;
      goto LABEL_25;
    }
    v8 = [v6 objectForKeyedSubscript:v4];
    if (!v8)
    {
      v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Could not get current build string; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }
      char v15 = 1;
      goto LABEL_24;
    }
    v9 = [v3 objectForKeyedSubscript:@"ReleaseType"];
    v10 = [v7 objectForKeyedSubscript:@"ReleaseType"];
    int v11 = [v5 isEqual:v8];
    v12 = container_log_handle_for_category();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        int v17 = 138413058;
        v18 = v8;
        __int16 v19 = 2112;
        v20 = v10;
        __int16 v21 = 2112;
        v22 = v5;
        __int16 v23 = 2112;
        v24 = v9;
        v14 = "Current build version (%@ / %@) equal to last version recorded (%@ / %@); skipping upgrade";
LABEL_22:
        _os_log_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0x2Au);
      }
    }
    else if (v13)
    {
      int v17 = 138413058;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v9;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v10;
      v14 = "Detected upgrade from %@ (%@) to %@ (%@)";
      goto LABEL_22;
    }

    char v15 = v11 ^ 1;
LABEL_24:

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }
  v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Did not find last build info; we must be upgrading from pre-9.3.1 or upgrading for the first time to a build with "
      "split daemon configuration or this is an erase install.",
      (uint8_t *)&v17,
      2u);
  }
  char v15 = 1;
LABEL_27:

  return v15;
}

- (void)writeCurrentBuildInfoToDisk
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)_CFCopySystemVersionDictionary();
  uint64_t v4 = [(MCMMigrationStatus *)self migrationInfo];
  [v4 setObject:v3 forKeyedSubscript:@"LastBuildInfo"];

  if ([(MCMMigrationStatus *)self _writeMigrationStatusToDisk])
  {
    v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(id)objc_opt_class() currentBuildVersion];
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Saved last build version of %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)setMigrationCompleteForType:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [(MCMMigrationStatus *)self _iso8601DateFormatter];
  int v7 = [v6 stringFromDate:v5];

  v8 = [(id)objc_opt_class() currentBuildVersion];
  v17[0] = @"MCMMigrationVersionNumber";
  v17[1] = @"MCMMigrationTime";
  v18[0] = v8;
  v18[1] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v10 = [(MCMMigrationStatus *)self migrationInfo];
  [v10 setObject:v9 forKeyedSubscript:v4];

  if ([(MCMMigrationStatus *)self _writeMigrationStatusToDisk])
  {
    int v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(id)objc_opt_class() currentBuildVersion];
      int v13 = 138412546;
      v14 = v12;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, "Migration completed on %@ for %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (BOOL)hasMigrationOccurredForType:(id)a3
{
  id v4 = a3;
  v5 = [(MCMMigrationStatus *)self migrationInfo];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)_writeMigrationStatusToDisk
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMMigrationStatus *)self migrationFileURL];
  id v4 = +[MCMFileManager defaultManager];
  uint64_t v5 = [v4 dataWritingOptionsForFileAtURL:v3];

  v6 = [(MCMMigrationStatus *)self migrationInfo];
  id v13 = 0;
  char v7 = objc_msgSend(v6, "MCM_writeToURL:withOptions:error:", v3, v5, &v13);
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = [(id)objc_opt_class() currentBuildVersion];
      v12 = [v3 path];
      *(_DWORD *)buf = 138412802;
      __int16 v15 = v11;
      __int16 v16 = 2112;
      int v17 = v12;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Failed to write migration status on %@ for %@ : %@", buf, 0x20u);
    }
  }

  return v7;
}

- (id)_readMigrationStatusFromDiskAtURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "MCM_dictionaryWithContentsOfURL:options:error:", a3, 0, &v13);
  id v5 = v13;
  v6 = (void *)[v4 mutableCopy];

  if (!v6)
  {
    char v7 = [v5 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v8 = [v5 code];

      if (v8 == 2)
      {
        v6 = objc_opt_new();
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = [(MCMMigrationStatus *)self migrationFileURL];
      v12 = [v11 path];
      *(_DWORD *)buf = 138412546;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Failed to read migration status file at %@ : %@", buf, 0x16u);
    }
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)_readMigrationStatusFromDisk
{
  v3 = [(MCMMigrationStatus *)self migrationFileURL];
  id v4 = [(MCMMigrationStatus *)self _readMigrationStatusFromDiskAtURL:v3];

  return v4;
}

- (void)_removeMarkerFileWithName:(id)a3 libraryURL:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [a4 URLByAppendingPathComponent:a3 isDirectory:0];
  id v5 = +[MCMFileManager defaultManager];
  id v10 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v4 path];
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Failed to remove marker file at %@: %@", buf, 0x16u);
    }
  }
}

- (void)_readStatusFromMarkerFileWithName:(id)a3 andSetAsType:(id)a4 libraryURL:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [a5 URLByAppendingPathComponent:a3 isDirectory:0];
  id v17 = 0;
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "MCM_dictionaryWithContentsOfURL:options:error:", v9, 0, &v17);
  id v11 = v17;
  v12 = v11;
  if (v10)
  {
    [(NSMutableDictionary *)self->_migrationInfo setObject:v10 forKeyedSubscript:v8];
  }
  else
  {
    __int16 v13 = [v11 domain];
    if ([v13 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v14 = [v12 code];

      if (v14 == 2) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = [v9 path];
      *(_DWORD *)buf = 138412546;
      id v19 = v16;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Failed to read migration marker file at %@ : %@", buf, 0x16u);
    }
  }
LABEL_10:
}

- (void)_consolidateForUnifiedDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Migrating from many marker files down to one", v6, 2u);
  }

  [(MCMMigrationStatus *)self _readStatusFromMarkerFileWithName:@"mcm_bundle_migration_complete.plist" andSetAsType:@"BundleMigration" libraryURL:v4];
  [(MCMMigrationStatus *)self _readStatusFromMarkerFileWithName:@"mcm_acl2_migration_complete.plist" andSetAsType:@"ACLMigration" libraryURL:v4];
  [(MCMMigrationStatus *)self _readStatusFromMarkerFileWithName:@"mcm_group_id_migration_complete.plist" andSetAsType:@"GroupIdMigration" libraryURL:v4];
  [(MCMMigrationStatus *)self _readStatusFromMarkerFileWithName:@"mcm_code_signing_migration_complete.plist" andSetAsType:@"CodeSigningMigration" libraryURL:v4];
  if ([(MCMMigrationStatus *)self _writeMigrationStatusToDisk])
  {
    [(MCMMigrationStatus *)self _removeMarkerFileWithName:@"mcm_bundle_migration_complete.plist" libraryURL:v4];
    [(MCMMigrationStatus *)self _removeMarkerFileWithName:@"mcm_acl2_migration_complete.plist" libraryURL:v4];
    [(MCMMigrationStatus *)self _removeMarkerFileWithName:@"mcm_group_id_migration_complete.plist" libraryURL:v4];
    [(MCMMigrationStatus *)self _removeMarkerFileWithName:@"mcm_code_signing_migration_complete.plist" libraryURL:v4];
  }
}

- (void)_consolidateForUserDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Migrating from many marker files down to one", v6, 2u);
  }

  [(MCMMigrationStatus *)self _readStatusFromMarkerFileWithName:@"mcm_group_id_migration_complete.plist" andSetAsType:@"GroupIdMigration" libraryURL:v4];
  [(MCMMigrationStatus *)self _readStatusFromMarkerFileWithName:@"mcm_code_signing_migration_complete.plist" andSetAsType:@"CodeSigningMigration" libraryURL:v4];
  if ([(MCMMigrationStatus *)self _writeMigrationStatusToDisk])
  {
    [(MCMMigrationStatus *)self _removeMarkerFileWithName:@"mcm_group_id_migration_complete.plist" libraryURL:v4];
    [(MCMMigrationStatus *)self _removeMarkerFileWithName:@"mcm_code_signing_migration_complete.plist" libraryURL:v4];
  }
}

- (void)_consolidateUnifiedDaemonMigrationStatusWithLibraryURL:(id)a3
{
  [(MCMMigrationStatus *)self _consolidateForUnifiedDaemonFromManyMarkerFilesToOneWithLibraryURL:a3];
}

- (void)_consolidateUserDaemonMigrationStatusWithLibraryURL:(id)a3
{
  [(MCMMigrationStatus *)self _consolidateForUserDaemonFromManyMarkerFilesToOneWithLibraryURL:a3];
}

- (void)_consolidateSystemDaemonMigrationStatusWithLibraryURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v21 = 0;
    _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Consolidating system session daemon migration status", v21, 2u);
  }

  char v6 = [v4 URLByDeletingLastPathComponent];

  uint64_t v7 = [v6 URLByAppendingPathComponent:@"mcm_migration_status.plist" isDirectory:0];
  id v8 = [(MCMMigrationStatus *)self _readMigrationStatusFromDiskAtURL:v7];
  uint64_t v9 = [(MCMMigrationStatus *)self migrationInfo];
  id v10 = [v9 objectForKeyedSubscript:@"BundleMigration"];

  int v11 = 0;
  if (!v10)
  {
    v12 = [v8 objectForKeyedSubscript:@"BundleMigration"];

    if (v12)
    {
      __int16 v13 = [v8 objectForKeyedSubscript:@"BundleMigration"];
      uint64_t v14 = [(MCMMigrationStatus *)self migrationInfo];
      [v14 setObject:v13 forKeyedSubscript:@"BundleMigration"];

      int v11 = 0;
    }
    else
    {
      [(MCMMigrationStatus *)self _readStatusFromMarkerFileWithName:@"mcm_bundle_migration_complete.plist" andSetAsType:@"BundleMigration" libraryURL:v6];
      int v11 = 1;
    }
  }
  uint64_t v15 = [(MCMMigrationStatus *)self migrationInfo];
  __int16 v16 = [v15 objectForKeyedSubscript:@"ACLMigration"];

  if (v16) {
    goto LABEL_10;
  }
  id v17 = [v8 objectForKeyedSubscript:@"ACLMigration"];

  if (v17)
  {
    uint64_t v18 = [v8 objectForKeyedSubscript:@"ACLMigration"];
    id v19 = [(MCMMigrationStatus *)self migrationInfo];
    [v19 setObject:v18 forKeyedSubscript:@"ACLMigration"];

LABEL_10:
    int v20 = 0;
    goto LABEL_11;
  }
  [(MCMMigrationStatus *)self _readStatusFromMarkerFileWithName:@"mcm_acl2_migration_complete.plist" andSetAsType:@"ACLMigration" libraryURL:v6];
  int v20 = 1;
LABEL_11:
  if ([(MCMMigrationStatus *)self _writeMigrationStatusToDisk])
  {
    if (v11) {
      [(MCMMigrationStatus *)self _removeMarkerFileWithName:@"mcm_bundle_migration_complete.plist" libraryURL:v6];
    }
    if (v20) {
      [(MCMMigrationStatus *)self _removeMarkerFileWithName:@"mcm_acl2_migration_complete.plist" libraryURL:v6];
    }
  }
}

- (MCMMigrationStatus)init
{
  return (MCMMigrationStatus *)[(MCMMigrationStatus *)self initForSystemMigration];
}

- (id)initForMobileUserMigration
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)MCMMigrationStatus;
  v2 = [(MCMMigrationStatus *)&v16 init];
  if (!v2) {
    goto LABEL_5;
  }
  v3 = +[MCMUserIdentitySharedCache sharedInstance];
  id v4 = [v3 managedUserPathRegistryForUserIdentity:0];
  id v5 = [v4 containermanagerUserLibrary];

  char v6 = [v5 url];
  uint64_t v7 = v6;
  if (!v6)
  {
    __int16 v13 = container_log_handle_for_category();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "Failed to get library url.";
LABEL_12:
    _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  uint64_t v8 = [v6 URLByAppendingPathComponent:@"mcm_user_migration_status.plist" isDirectory:0];
  migrationFileURL = v2->_migrationFileURL;
  v2->_migrationFileURL = (NSURL *)v8;

  uint64_t v10 = [(MCMMigrationStatus *)v2 _readMigrationStatusFromDisk];
  migrationInfo = v2->_migrationInfo;
  v2->_migrationInfo = (NSMutableDictionary *)v10;

  if (!v2->_migrationInfo)
  {
    __int16 v13 = container_log_handle_for_category();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "Error reading user migration file from disk.  This is bad";
    goto LABEL_12;
  }

LABEL_5:
  v12 = v2;
LABEL_10:

  return v12;
}

- (id)initForSystemMigration
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)MCMMigrationStatus;
  v2 = [(MCMMigrationStatus *)&v23 init];
  if (!v2)
  {
LABEL_19:
    uint64_t v18 = v2;
    goto LABEL_20;
  }
  id v3 = containermanager_copy_global_configuration();
  id v4 = [v3 managedPathRegistry];
  id v5 = [v4 containermanagerLibrary];

  char v6 = [v5 url];
  uint64_t v7 = v6;
  if (!v6)
  {
    objc_super v16 = container_log_handle_for_category();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    id v17 = "Failed to get library url.";
LABEL_22:
    _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_11;
  }
  uint64_t v8 = [v6 URLByAppendingPathComponent:@"mcm_migration_status.plist" isDirectory:0];
  migrationFileURL = v2->_migrationFileURL;
  v2->_migrationFileURL = (NSURL *)v8;

  uint64_t v10 = [(MCMMigrationStatus *)v2 _readMigrationStatusFromDisk];
  migrationInfo = v2->_migrationInfo;
  v2->_migrationInfo = (NSMutableDictionary *)v10;

  if (v2->_migrationInfo)
  {
    id v12 = containermanager_copy_global_configuration();
    int v13 = [v12 runmode];

    if (v13)
    {
      id v14 = containermanager_copy_global_configuration();
      int v15 = [v14 runmode];

      if (v15 == 2)
      {
        if (![(NSMutableDictionary *)v2->_migrationInfo count]) {
          [(MCMMigrationStatus *)v2 _consolidateUserDaemonMigrationStatusWithLibraryURL:v7];
        }
      }
      else
      {
        id v20 = containermanager_copy_global_configuration();
        int v21 = [v20 runmode];

        if (v21 == 1 && ![(NSMutableDictionary *)v2->_migrationInfo count]) {
          [(MCMMigrationStatus *)v2 _consolidateUnifiedDaemonMigrationStatusWithLibraryURL:v7];
        }
      }
    }
    else if (![(NSMutableDictionary *)v2->_migrationInfo count] {
           || ([(NSMutableDictionary *)v2->_migrationInfo objectForKeyedSubscript:@"MigrationStatusConsolidation"], id v19 = objc_claimAutoreleasedReturnValue(), v19, !v19))
    }
    {
      [(MCMMigrationStatus *)v2 _consolidateSystemDaemonMigrationStatusWithLibraryURL:v7];
      [(MCMMigrationStatus *)v2 setMigrationCompleteForType:@"MigrationStatusConsolidation"];
    }

    goto LABEL_19;
  }
  objc_super v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v17 = "Error reading system migration file from disk.  This is bad";
    goto LABEL_22;
  }
LABEL_11:

  uint64_t v18 = 0;
LABEL_20:

  return v18;
}

+ (id)currentBuildVersion
{
  if (currentBuildVersion_onceToken != -1) {
    dispatch_once(&currentBuildVersion_onceToken, &__block_literal_global_11023);
  }
  v2 = (void *)currentBuildVersion_systemVersionNumber;

  return v2;
}

void __41__MCMMigrationStatus_currentBuildVersion__block_invoke()
{
  uint64_t v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    id v2 = v0;
    v1 = [v0 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
    if (v1) {
      objc_storeStrong((id *)&currentBuildVersion_systemVersionNumber, v1);
    }

    uint64_t v0 = v2;
  }
}

@end