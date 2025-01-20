@interface CalMigrationBackup
+ (BOOL)backupCalendarDirectory:(id)a3 intoArchiveNamed:(id)a4 error:(id *)a5;
+ (BOOL)removeExistingBackupWithArchiveName:(id)a3 inCalendarDirectory:(id)a4 error:(id *)a5;
+ (BOOL)shouldBackupCalendarDirectory:(id)a3 withPrivacySafePathProvider:(id)a4;
@end

@implementation CalMigrationBackup

+ (BOOL)backupCalendarDirectory:(id)a3 intoArchiveNamed:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F08850] defaultManager];
  v10 = [v7 URLByAppendingPathComponent:v8];
  v11 = [v10 path];
  int v12 = [v9 fileExistsAtPath:v11];

  if (v12)
  {
    id v31 = 0;
    char v13 = [v9 removeItemAtURL:v10 error:&v31];
    id v14 = v31;
    if ((v13 & 1) == 0)
    {
      v15 = +[CalMigrationLog defaultCategory];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[CalMigrationBackup backupCalendarDirectory:intoArchiveNamed:error:](v10);
      }
    }
  }
  uint64_t v16 = [v9 temporaryDirectory];
  v17 = [(id)v16 URLByAppendingPathComponent:v8];

  id v30 = 0;
  LOBYTE(v16) = [v9 archiveURLToFile:v7 toFile:v17 createPKZipArchive:1 error:&v30];
  id v18 = v30;
  v19 = v18;
  if (v16)
  {
    id v29 = v18;
    char v20 = [v9 moveItemAtURL:v17 toURL:v10 error:&v29];
    id v21 = v29;

    if (v20)
    {
      BOOL v22 = 1;
      if (!a5) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    v23 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v27 = [v17 path];
      v28 = [v10 path];
      *(_DWORD *)buf = 138412802;
      v33 = v27;
      __int16 v34 = 2112;
      v35 = v28;
      __int16 v36 = 2112;
      id v37 = v21;
      _os_log_error_impl(&dword_22133F000, v23, OS_LOG_TYPE_ERROR, "Failed to move backup archive %@ to %@. error = %@", buf, 0x20u);
    }
    v19 = v21;
  }
  else
  {
    v23 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [v17 path];
      v25 = [v7 path];
      *(_DWORD *)buf = 138412802;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = v25;
      __int16 v36 = 2112;
      id v37 = v19;
      _os_log_error_impl(&dword_22133F000, v23, OS_LOG_TYPE_ERROR, "Failed to create backup archive %@ for calendar directory %@. error = %@", buf, 0x20u);
    }
  }

  BOOL v22 = 0;
  id v21 = v19;
  if (a5) {
LABEL_17:
  }
    *a5 = v21;
LABEL_18:

  return v22;
}

+ (BOOL)shouldBackupCalendarDirectory:(id)a3 withPrivacySafePathProvider:(id)a4
{
  v45[1] = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v5 = a4;
  v25 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v27 = *MEMORY[0x263EFF688];
  v45[0] = *MEMORY[0x263EFF688];
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __80__CalMigrationBackup_shouldBackupCalendarDirectory_withPrivacySafePathProvider___block_invoke;
  v34[3] = &unk_2645A46B0;
  id v23 = v5;
  id v35 = v23;
  __int16 v36 = &v37;
  id v7 = [v25 enumeratorAtURL:v24 includingPropertiesForKeys:v6 options:0 errorHandler:v34];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v8)
  {
    unint64_t v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v31;
    while (2)
    {
      uint64_t v12 = 0;
      char v13 = v10;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
        id v28 = 0;
        id v29 = 0;
        char v15 = [v14 getResourceValue:&v29 forKey:v27 error:&v28];
        id v16 = v29;
        id v10 = v28;

        if ((v15 & 1) == 0)
        {
          v17 = +[CalMigrationLog defaultCategory];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v18 = [v23 privacySafePathForURLInCalendarDirectory:v14];
            +[CalMigrationBackup shouldBackupCalendarDirectory:v43 withPrivacySafePathProvider:v17];
          }

          *((unsigned char *)v38 + 24) = 1;
          goto LABEL_15;
        }
        v9 += [v16 unsignedLongLongValue];
        if (v9 > 0x6400000)
        {
          id v21 = +[CalMigrationLog defaultCategory];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v43 = 0;
            _os_log_impl(&dword_22133F000, v21, OS_LOG_TYPE_DEFAULT, "Calendar directory is too big. Will not create a backup!", v43, 2u);
          }

          BOOL v20 = 0;
          v19 = obj;
          goto LABEL_25;
        }

        ++v12;
        char v13 = v10;
      }
      while (v8 != v12);
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
    unint64_t v9 = 0;
  }
LABEL_15:

  if (*((unsigned char *)v38 + 24))
  {
    v19 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22133F000, v19, OS_LOG_TYPE_DEFAULT, "Failed to get total size of calendar directory. Will not create a backup!", buf, 2u);
    }
    BOOL v20 = 0;
  }
  else
  {
    v19 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v42 = v9;
      _os_log_impl(&dword_22133F000, v19, OS_LOG_TYPE_DEFAULT, "Calendar directory is %llu bytes. Will create a backup", buf, 0xCu);
    }
    BOOL v20 = 1;
  }
LABEL_25:

  _Block_object_dispose(&v37, 8);
  return v20;
}

uint64_t __80__CalMigrationBackup_shouldBackupCalendarDirectory_withPrivacySafePathProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[CalMigrationLog defaultCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    unint64_t v9 = [*(id *)(a1 + 32) privacySafePathForURLInCalendarDirectory:v5];
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_error_impl(&dword_22133F000, v7, OS_LOG_TYPE_ERROR, "Error enumerating calendar directory at URL %{public}@: %@", (uint8_t *)&v10, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

  return 0;
}

+ (BOOL)removeExistingBackupWithArchiveName:(id)a3 inCalendarDirectory:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F08850];
  id v8 = a4;
  id v9 = a3;
  int v10 = [v7 defaultManager];
  uint64_t v11 = [v8 URLByAppendingPathComponent:v9];

  __int16 v12 = [v11 path];
  LODWORD(v9) = [v10 fileExistsAtPath:v12];

  if (v9)
  {
    id v17 = 0;
    char v13 = [v10 removeItemAtURL:v11 error:&v17];
    id v14 = v17;
    if ((v13 & 1) == 0)
    {
      char v15 = +[CalMigrationLog reminders];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[CalMigrationBackup backupCalendarDirectory:intoArchiveNamed:error:](v11);
      }

      if (a5) {
        *a5 = v14;
      }
    }
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

+ (void)backupCalendarDirectory:(void *)a1 intoArchiveNamed:error:.cold.1(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_22133F000, v2, v3, "Failed to delete existing backup file %@. error = %@", v4, v5, v6, v7, v8);
}

+ (void)shouldBackupCalendarDirectory:(uint8_t *)buf withPrivacySafePathProvider:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_22133F000, log, OS_LOG_TYPE_ERROR, "Failed to get file size of URL %{public}@: %@", buf, 0x16u);
}

@end