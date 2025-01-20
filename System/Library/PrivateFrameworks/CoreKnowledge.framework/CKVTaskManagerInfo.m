@interface CKVTaskManagerInfo
- (BOOL)clear:(id *)a3;
- (BOOL)didCompleteMigrationMoreRecentlyThanMaintenance;
- (BOOL)recordMaintenanceCompleted:(id *)a3;
- (BOOL)recordMigrationCompletedWithSettings:(id)a3 error:(id *)a4;
- (BOOL)shouldRunMigration;
- (BOOL)updateSchemaVersion:(id)a3 error:(id *)a4;
- (BOOL)updateSiriLanguageCode:(id)a3 dictationLanguageCodes:(id)a4 error:(id *)a5;
- (CCSetChangeRegistry)changeRegistry;
- (CKVTaskManagerInfo)initWithRootDirectoryURL:(id)a3 error:(id *)a4;
- (NSURL)donateDirectory;
- (id)dictationLanguageCodes;
- (id)lastMaintenance;
- (id)schemaVersion;
- (id)siriLanguageCode;
@end

@implementation CKVTaskManagerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistry, 0);
  objc_storeStrong((id *)&self->_donateDirectory, 0);
  objc_storeStrong((id *)&self->_migrationStartTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (CCSetChangeRegistry)changeRegistry
{
  return self->_changeRegistry;
}

- (NSURL)donateDirectory
{
  return self->_donateDirectory;
}

- (BOOL)didCompleteMigrationMoreRecentlyThanMaintenance
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__CKVTaskManagerInfo_didCompleteMigrationMoreRecentlyThanMaintenance__block_invoke;
  v5[3] = &unk_1E5CF9968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __69__CKVTaskManagerInfo_didCompleteMigrationMoreRecentlyThanMaintenance__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"lastMigration"];
  if (v2)
  {
    id v4 = v2;
    char v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"lastMaintenance"];
    if (v3) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 compare:v3] == 1;
    }
    else {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }

    v2 = v4;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)recordMigrationCompletedWithSettings:(id)a3 error:(id *)a4
{
  v38[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[CKVTaskSettings buildVersion];
  v7 = +[CKVTaskSettings projectNameAndSourceVersion];
  uint64_t v8 = [v5 localization];
  char v9 = [v8 siriLanguageCode];

  v10 = [v5 localization];
  v11 = [v10 dictationLanguageCodes];

  if (v6) {
    v12 = v6;
  }
  else {
    v12 = &stru_1EFD77130;
  }
  v13 = v12;

  if (v7) {
    v14 = v7;
  }
  else {
    v14 = &stru_1EFD77130;
  }
  v15 = v14;

  if (v9) {
    v16 = v9;
  }
  else {
    v16 = &stru_1EFD77130;
  }
  v25 = v16;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v11 allObjects];
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v38[0] = v13;
  v38[1] = v15;
  v18 = [MEMORY[0x1E4F1C9C8] now];
  v38[2] = v18;
  v38[3] = &unk_1EFD7D5B0;
  v38[4] = v25;
  v38[5] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];

  v37[0] = @"migratedBuildVersion";
  v37[1] = @"migratedProjectVersion";
  v37[2] = @"lastMigration";
  v37[3] = @"migrationAttempts";
  v37[4] = @"siriLanguageCode";
  v37[5] = @"dictationLanguageCodes";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__1036;
  v31[4] = __Block_byref_object_dispose__1037;
  id v32 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CKVTaskManagerInfo_recordMigrationCompletedWithSettings_error___block_invoke;
  block[3] = &unk_1E5CF9990;
  v29 = &v33;
  block[4] = self;
  id v22 = v19;
  id v27 = v22;
  id v23 = v20;
  id v28 = v23;
  v30 = v31;
  dispatch_sync(queue, block);
  KVSetError();
  LOBYTE(queue) = *((unsigned char *)v34 + 24) != 0;

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  return (char)queue;
}

void __65__CKVTaskManagerInfo_recordMigrationCompletedWithSettings_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  char v3 = *(void **)(a1[4] + 8);
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v3 writeUpdatedObjects:v2 forKeys:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0;
  }
}

- (BOOL)shouldRunMigration
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__1036;
  v10 = __Block_byref_object_dispose__1037;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__CKVTaskManagerInfo_shouldRunMigration__block_invoke;
  v5[3] = &unk_1E5CF9968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  BOOL v3 = v7[5] != 0;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__CKVTaskManagerInfo_shouldRunMigration__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  if (v2)
  {
    BOOL v3 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v3;
      uint64_t v5 = [v2 ISO8601String];
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
      __int16 v34 = 2112;
      *(void *)uint64_t v35 = v5;
      _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s Migration is currently in-progress from (%@)", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(v1 + 8) objectForKey:@"migratedBuildVersion"];
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"migratedProjectVersion"];
    char v9 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"lastMigration"];
    v10 = [v9 ISO8601String];

    id v11 = +[CKVTaskSettings buildVersion];
    v12 = +[CKVTaskSettings projectNameAndSourceVersion];
    if ([(__CFString *)v11 isEqual:v7]
      && [(__CFString *)v12 isEqual:v8])
    {
      v13 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
        __int16 v34 = 2112;
        *(void *)uint64_t v35 = v10;
        *(_WORD *)&v35[8] = 2112;
        char v36 = v11;
        __int16 v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_INFO, "%s Migration already completed (%@) for version: %@|%@", buf, 0x2Au);
      }
    }
    else
    {
      v14 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (v10)
        {
          v15 = [NSString stringWithFormat:@"version: %@|%@ completed (%@)", v7, v8, v10];
        }
        else
        {
          v15 = @"no record of prior migration";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
        __int16 v34 = 2112;
        *(void *)uint64_t v35 = v11;
        *(_WORD *)&v35[8] = 2112;
        char v36 = v12;
        __int16 v37 = 2112;
        v38 = v15;
        _os_log_impl(&dword_1A77B3000, v14, OS_LOG_TYPE_INFO, "%s Migration is required. Current version: %@|%@ global log shows %@", buf, 0x2Au);
        if (v10) {
      }
        }
      v16 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"migrationAttempts"];
      unsigned int v17 = [v16 unsignedShortValue];

      v18 = CKLogContextVocabulary;
      if (v17 < 5)
      {
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
          __int16 v34 = 1024;
          *(_DWORD *)uint64_t v35 = v17;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = 5;
          _os_log_impl(&dword_1A77B3000, v18, OS_LOG_TYPE_INFO, "%s Prior migration attempts: %hu retry limit: %hu", buf, 0x18u);
        }
        v19 = *(void **)(*(void *)(a1 + 32) + 8);
        v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v17 + 1];
        id v31 = 0;
        LOBYTE(v19) = [v19 writeUpdatedObject:v20 forKey:@"migrationAttempts" error:&v31];
        id v21 = v31;

        if (v19)
        {
          uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
          uint64_t v23 = *(void *)(a1 + 32);
          v24 = *(void **)(v23 + 24);
          *(void *)(v23 + 24) = v22;

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
          dispatch_time_t v25 = dispatch_time(0, 3600000000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          long long v26 = *(_OWORD *)(a1 + 32);
          id v27 = *(NSObject **)(*(void *)(a1 + 32) + 16);
          block[2] = __40__CKVTaskManagerInfo_shouldRunMigration__block_invoke_47;
          block[3] = &unk_1E5CF9968;
          long long v30 = v26;
          dispatch_after(v25, v27, block);
        }
        else
        {
          id v28 = CKLogContextVocabulary;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
            __int16 v34 = 2112;
            *(void *)uint64_t v35 = v21;
            _os_log_error_impl(&dword_1A77B3000, v28, OS_LOG_TYPE_ERROR, "%s Failed to record migration attempt: %@", buf, 0x16u);
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v17;
        *(_WORD *)&v35[4] = 1024;
        *(_DWORD *)&v35[6] = 5;
        _os_log_error_impl(&dword_1A77B3000, v18, OS_LOG_TYPE_ERROR, "%s Migration attempts (%hu) have reached retry limit: %hu", buf, 0x18u);
      }
    }
  }
}

void __40__CKVTaskManagerInfo_shouldRunMigration__block_invoke_47(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  if (v2 == *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v2 ISO8601String];
      int v7 = 136315650;
      uint64_t v8 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
      __int16 v9 = 2112;
      v10 = &unk_1EFD7D580;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_1A77B3000, v5, OS_LOG_TYPE_ERROR, "%s Timed out waiting %@ seconds for migration from (%@) to complete.", (uint8_t *)&v7, 0x20u);

      uint64_t v1 = *(void *)(a1 + 32);
      uint64_t v2 = *(void **)(v1 + 24);
    }
    *(void *)(v1 + 24) = 0;
  }
}

- (BOOL)updateSiriLanguageCode:(id)a3 dictationLanguageCodes:(id)a4 error:(id *)a5
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CKVTaskManagerInfo updateSiriLanguageCode:dictationLanguageCodes:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      _os_log_error_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_ERROR, "%s invalid Siri language code: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned int v17 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v19 = v17;
      v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CKVTaskManagerInfo updateSiriLanguageCode:dictationLanguageCodes:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_error_impl(&dword_1A77B3000, v19, OS_LOG_TYPE_ERROR, "%s Unexpected dictation languages class: %@", buf, 0x16u);
    }
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_9;
  }
  v36[0] = v7;
  __int16 v9 = [v8 allObjects];
  v36[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];

  v35[0] = @"siriLanguageCode";
  v35[1] = @"dictationLanguageCodes";
  __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v32 = __Block_byref_object_copy__1036;
  uint64_t v33 = __Block_byref_object_dispose__1037;
  id v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CKVTaskManagerInfo_updateSiriLanguageCode_dictationLanguageCodes_error___block_invoke;
  block[3] = &unk_1E5CF9990;
  dispatch_time_t v25 = &v27;
  void block[4] = self;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  long long v26 = buf;
  dispatch_sync(queue, block);
  KVSetError();
  BOOL v15 = *((unsigned char *)v28 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v27, 8);

LABEL_9:
  return v15;
}

void __74__CKVTaskManagerInfo_updateSiriLanguageCode_dictationLanguageCodes_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  BOOL v3 = *(void **)(a1[4] + 8);
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v3 writeUpdatedObjects:v2 forKeys:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (id)dictationLanguageCodes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__1036;
  v10 = __Block_byref_object_dispose__1037;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CKVTaskManagerInfo_dictationLanguageCodes__block_invoke;
  v5[3] = &unk_1E5CF9968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__CKVTaskManagerInfo_dictationLanguageCodes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"dictationLanguageCodes"];
  id v5 = (id)v2;
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  uint64_t v4 = v5;
  if (v5)
  {

    uint64_t v4 = v5;
  }
}

- (id)siriLanguageCode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__1036;
  v10 = __Block_byref_object_dispose__1037;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__CKVTaskManagerInfo_siriLanguageCode__block_invoke;
  v5[3] = &unk_1E5CF9968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__CKVTaskManagerInfo_siriLanguageCode__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"siriLanguageCode"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)recordMaintenanceCompleted:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CKVTaskManagerInfo_recordMaintenanceCompleted___block_invoke;
  block[3] = &unk_1E5CF9940;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__CKVTaskManagerInfo_recordMaintenanceCompleted___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 8);
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v2 writeUpdatedObject:v3 forKey:@"lastMaintenance" error:a1[6]];
}

- (id)lastMaintenance
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1036;
  char v10 = __Block_byref_object_dispose__1037;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CKVTaskManagerInfo_lastMaintenance__block_invoke;
  v5[3] = &unk_1E5CF9968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__CKVTaskManagerInfo_lastMaintenance__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"lastMaintenance"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)updateSchemaVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__CKVTaskManagerInfo_updateSchemaVersion_error___block_invoke;
  v10[3] = &unk_1E5CF9918;
  v10[4] = self;
  id v11 = v6;
  v12 = &v14;
  id v13 = a4;
  id v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __48__CKVTaskManagerInfo_updateSchemaVersion_error___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) writeUpdatedObject:a1[5] forKey:@"schemaVersion" error:a1[7]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)schemaVersion
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1036;
  char v10 = __Block_byref_object_dispose__1037;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CKVTaskManagerInfo_schemaVersion__block_invoke;
  v5[3] = &unk_1E5CF9968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__CKVTaskManagerInfo_schemaVersion__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"schemaVersion"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)clear:(id *)a3
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1036;
  v11[4] = __Block_byref_object_dispose__1037;
  id v12 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CKVTaskManagerInfo_clear___block_invoke;
  block[3] = &unk_1E5CF98F0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = v11;
  dispatch_sync(queue, block);
  KVSetError();
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  return v4;
}

void __28__CKVTaskManagerInfo_clear___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 40);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 clearAllBookmarksAndCommit:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = *(void **)(a1[4] + 8);
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v8 = *(id *)(v6 + 40);
    char v7 = [v5 clear:&v8];
    objc_storeStrong((id *)(v6 + 40), v8);
  }
  else
  {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v7;
}

- (CKVTaskManagerInfo)initWithRootDirectoryURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKVTaskManagerInfo;
  char v7 = [(CKVTaskManagerInfo *)&v19 init];
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F71FD0]) initWithFilename:@"Info" protectionClass:4 directory:v6 readOnly:0 create:1 error:a4];
  log = v7->_log;
  v7->_log = (KVDictionaryLog *)v8;

  if (!v7->_log
    || (uint64_t v10 = [objc_alloc(MEMORY[0x1E4F57FC0]) initWithFilename:@"Registry" directory:v6 protectionClass:0xFFFFFFFFLL error:a4], changeRegistry = v7->_changeRegistry, v7->_changeRegistry = (CCSetChangeRegistry *)v10, changeRegistry, !v7->_changeRegistry))
  {
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"Donate" isDirectory:1 relativeToURL:v6];
  donateDirectory = v7->_donateDirectory;
  v7->_donateDirectory = (NSURL *)v12;

  KVGetOrCreateDirectoryURL();
  uint64_t v14 = (CKVTaskManagerInfo *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    BOOL v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("TaskHandlerInfo", v15);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v16;

LABEL_6:
    uint64_t v14 = v7;
  }
LABEL_8:

  return v14;
}

@end