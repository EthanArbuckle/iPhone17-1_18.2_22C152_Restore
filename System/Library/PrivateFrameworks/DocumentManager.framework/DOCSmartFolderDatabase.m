@interface DOCSmartFolderDatabase
- (DOCSmartFolderDatabase)init;
- (DOCSmartFolderDatabase)initWithURL:(id)a3;
- (NSURL)url;
- (OS_dispatch_queue)workingQueue;
- (OS_dispatch_source)watcher;
- (PQLConnection)connection;
- (RBSAssertion)processAssertion;
- (id)_createDatabaseIfNeededAtURL:(id)a3 error:(id *)a4;
- (id)_existingEventSimilarToEvent:(id)a3;
- (id)_existingFileNameHitsSimilarToHit:(id)a3;
- (id)_existingFiletypeHitSimilarToHit:(id)a3;
- (id)_openConnectionToDatabaseAtURL:(id)a3;
- (id)_setupDatabaseTablesIfNeeded:(id)a3 error:(id *)a4;
- (id)previousEventsForAppBundleIdentifier:(id)a3 excluding:(id)a4;
- (id)previousHits;
- (void)_cleanUpAfterClose;
- (void)_closeDatabaseOnItsQueue:(id)a3;
- (void)_registerHit:(id)a3;
- (void)_registerSavingFile:(id)a3 inFolder:(id)a4 atDate:(id)a5 withFrecencyScore:(double)a6 rowId:(id)a7;
- (void)_registerSavingFileType:(id)a3 inFolder:(id)a4 atDate:(id)a5 withFrecencyScore:(double)a6 rowId:(id)a7;
- (void)_resetDatabaseOnItsQueue:(id)a3;
- (void)_setUpDatabaseWatcher:(id)a3;
- (void)close;
- (void)deleteFolderWithIdentifier:(id)a3 appBundleIdentifier:(id)a4;
- (void)init;
- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5;
- (void)open;
- (void)purgeOldEntries;
- (void)registerEvent:(id)a3;
- (void)registerFilenameHit:(id)a3 fileTypeHit:(id)a4 smartScoreBlock:(id)a5;
- (void)setProcessAssertion:(id)a3;
- (void)setWatcher:(id)a3;
- (void)setWorkingQueue:(id)a3;
@end

@implementation DOCSmartFolderDatabase

- (DOCSmartFolderDatabase)init
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.DocumentManager"];

  if (v4)
  {
    v5 = [v4 URLByAppendingPathComponent:@"smartfolders.db" isDirectory:0];
    v6 = (NSObject **)MEMORY[0x263F3AC68];
    v7 = *MEMORY[0x263F3AC68];
    if (v5)
    {
      if (!v7)
      {
        DOCInitLogging();
        v7 = *v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[DOCSmartFolderDatabase init]();
      }
      self = [(DOCSmartFolderDatabase *)self initWithURL:v5];
      v8 = self;
    }
    else
    {
      if (!v7)
      {
        DOCInitLogging();
        v7 = *v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[DOCSmartFolderDatabase init]();
      }
      v8 = 0;
    }
  }
  else
  {
    v9 = (NSObject **)MEMORY[0x263F3AC68];
    v10 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase init]();
    }
    v8 = 0;
  }

  return v8;
}

- (DOCSmartFolderDatabase)initWithURL:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)DOCSmartFolderDatabase;
    v6 = [(DOCSmartFolderDatabase *)&v18 init];
    if (v6)
    {
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

      dispatch_queue_t v9 = dispatch_queue_create("com.apple.DocumentManager.DOCSmartFolderManager.workingQueue", v8);
      workingQueue = v6->_workingQueue;
      v6->_workingQueue = (OS_dispatch_queue *)v9;

      dispatch_time_t v11 = dispatch_time(0, 10000000000);
      v12 = v6->_workingQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__DOCSmartFolderDatabase_initWithURL___block_invoke;
      block[3] = &unk_2641B15E8;
      v13 = v6;
      v17 = v13;
      dispatch_after(v11, v12, block);
      objc_storeStrong(v13 + 1, a3);
    }
    self = v6;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __38__DOCSmartFolderDatabase_initWithURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeOldEntries];
}

- (void)registerFilenameHit:(id)a3 fileTypeHit:(id)a4 smartScoreBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 type])
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"DOCSmartFolderDatabase.m" lineNumber:248 description:@"bad type for file name hit"];
  }
  if ([v10 type] != 1)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"DOCSmartFolderDatabase.m" lineNumber:249 description:@"bad type for file type hit"];
  }
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__DOCSmartFolderDatabase_registerFilenameHit_fileTypeHit_smartScoreBlock___block_invoke;
  block[3] = &unk_2641B1F58;
  id v21 = v11;
  SEL v22 = a2;
  void block[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(workingQueue, block);
}

void __74__DOCSmartFolderDatabase_registerFilenameHit_fileTypeHit_smartScoreBlock___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) connection];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) _existingFileNameHitsSimilarToHit:*(void *)(a1 + 40)];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v4) {
      goto LABEL_14;
    }
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v23;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v11 = (*(double (**)(void))(*(void *)(a1 + 56) + 16))();
        if (v11 > v8)
        {
          double v12 = v11;
          if (v11 > 0.6)
          {
            id v13 = v10;

            double v8 = v12;
            v6 = v13;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
    if (v6)
    {
      id v14 = [*(id *)(a1 + 40) lastUsedDate];
      [v6 updateFrecencyAtDate:v14];

      [*(id *)(a1 + 32) _registerHit:v6];
    }
    else
    {
LABEL_14:
      [*(id *)(a1 + 32) _registerHit:*(void *)(a1 + 40)];
      v6 = 0;
    }
    id v15 = [*(id *)(a1 + 32) _existingFiletypeHitSimilarToHit:*(void *)(a1 + 48)];
    if (v15)
    {
      v16 = [*(id *)(a1 + 48) lastUsedDate];
      [v15 updateFrecencyAtDate:v16];

      v17 = *(void **)(a1 + 32);
      objc_super v18 = v15;
    }
    else
    {
      v17 = *(void **)(a1 + 32);
      objc_super v18 = *(void **)(a1 + 48);
    }
    [v17 _registerHit:v18];

    goto LABEL_25;
  }
  id v19 = (NSObject **)MEMORY[0x263F3AC68];
  id v20 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    id v20 = *v19;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __74__DOCSmartFolderDatabase_registerFilenameHit_fileTypeHit_smartScoreBlock___block_invoke_cold_1();
  }
  id v21 = [*(id *)(a1 + 32) connection];

  if (!v21)
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"DOCSmartFolderDatabase.m" lineNumber:255 description:@"nil db connection"];
LABEL_25:
  }
}

- (void)_registerHit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 1)
  {
    v6 = [v4 value];
    uint64_t v7 = [v4 folderItem];
    double v8 = [v4 lastUsedDate];
    [v4 frecency];
    double v13 = v12;
    double v11 = [v4 rowId];
    [(DOCSmartFolderDatabase *)self _registerSavingFileType:v6 inFolder:v7 atDate:v8 withFrecencyScore:v11 rowId:v13];
    goto LABEL_5;
  }
  if (!v5)
  {
    v6 = [v4 value];
    uint64_t v7 = [v4 folderItem];
    double v8 = [v4 lastUsedDate];
    [v4 frecency];
    double v10 = v9;
    double v11 = [v4 rowId];
    [(DOCSmartFolderDatabase *)self _registerSavingFile:v6 inFolder:v7 atDate:v8 withFrecencyScore:v11 rowId:v10];
LABEL_5:

    goto LABEL_10;
  }
  id v14 = (NSObject **)MEMORY[0x263F3AC68];
  id v15 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    id v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[DOCSmartFolderDatabase _registerHit:]();
  }
LABEL_10:
}

- (id)_existingFileNameHitsSimilarToHit:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  id v25 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [(DOCSmartFolderDatabase *)self connection];
  long long v24 = v4;
  v6 = [v4 folderItem];
  uint64_t v7 = [v6 itemIdentifier];
  double v8 = (void *)[v5 fetch:@"SELECT rowid, fp_folder_id, fp_folder_item, file_name, last_hit_date, frecency_at_last_hit_date FROM filenames WHERE fp_folder_id = %@ ORDER BY last_hit_date DESC LIMIT 500", v7];

  if ([v8 next])
  {
    do
    {
      double v9 = (void *)MEMORY[0x21668E1E0]();
      double v10 = [v8 numberAtIndex:0];
      double v11 = [v8 stringAtIndex:1];
      double v12 = [v8 dataAtIndex:2];
      double v13 = [v8 stringAtIndex:3];
      id v14 = [v8 dateAtIndex:4];
      [v8 doubleAtIndex:5];
      double v16 = v15;
      v17 = (void *)MEMORY[0x263F08928];
      uint64_t v18 = [MEMORY[0x263F054A8] classForKeyedUnarchiver];
      id v26 = 0;
      id v19 = [v17 unarchivedObjectOfClass:v18 fromData:v12 error:&v26];
      id v20 = v26;
      if (v20 || !v19)
      {
        long long v22 = *MEMORY[0x263F3AC68];
        if (!*MEMORY[0x263F3AC68])
        {
          DOCInitLogging();
          long long v22 = *MEMORY[0x263F3AC68];
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v20;
          _os_log_error_impl(&dword_21361D000, v22, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
        }
      }
      else
      {
        id v21 = [[DOCSmartFolderHit alloc] initWithRowId:v10 folder:v19 type:0 value:v13 lastUsedDate:v14 frecency:v16];
        [v25 addObject:v21];
      }
    }
    while (([v8 next] & 1) != 0);
  }

  return v25;
}

- (id)previousHits
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = __Block_byref_object_copy__1;
  double v12 = __Block_byref_object_dispose__1;
  id v13 = [MEMORY[0x263EFF980] array];
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DOCSmartFolderDatabase_previousHits__block_invoke;
  block[3] = &unk_2641B1F80;
  void block[5] = &v8;
  block[6] = a2;
  void block[4] = self;
  dispatch_sync(workingQueue, block);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __38__DOCSmartFolderDatabase_previousHits__block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) connection];

  if (v2)
  {
    uint64_t v43 = a1;
    v3 = [*(id *)(a1 + 32) connection];
    id v4 = (void *)[v3 fetch:@"SELECT rowid, fp_folder_id, fp_folder_item, file_name, last_hit_date, frecency_at_last_hit_date FROM filenames ORDER BY last_hit_date DESC LIMIT 500"];

    if ([v4 next])
    {
      *(void *)&long long v5 = 138412290;
      long long v42 = v5;
      do
      {
        v6 = (void *)MEMORY[0x21668E1E0]();
        uint64_t v7 = [v4 numberAtIndex:0];
        uint64_t v8 = [v4 stringAtIndex:1];
        double v9 = [v4 dataAtIndex:2];
        uint64_t v10 = [v4 stringAtIndex:3];
        double v11 = [v4 dateAtIndex:4];
        [v4 doubleAtIndex:5];
        double v13 = v12;
        id v14 = (void *)MEMORY[0x263F08928];
        uint64_t v15 = [MEMORY[0x263F054A8] classForKeyedUnarchiver];
        id v45 = 0;
        double v16 = [v14 unarchivedObjectOfClass:v15 fromData:v9 error:&v45];
        id v17 = v45;
        if (v17 || !v16)
        {
          id v19 = *MEMORY[0x263F3AC68];
          if (!*MEMORY[0x263F3AC68])
          {
            DOCInitLogging();
            id v19 = *MEMORY[0x263F3AC68];
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            id v47 = v17;
            _os_log_error_impl(&dword_21361D000, v19, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v18 = [[DOCSmartFolderHit alloc] initWithRowId:v7 folder:v16 type:0 value:v10 lastUsedDate:v11 frecency:v13];
          [*(id *)(*(void *)(*(void *)(v43 + 40) + 8) + 40) addObject:v18];
        }
      }
      while (([v4 next] & 1) != 0);
    }
    id v20 = objc_msgSend(*(id *)(v43 + 32), "connection", v42);
    id v21 = (void *)[v20 fetch:@"SELECT rowid, fp_folder_id, fp_folder_item, file_type, last_hit_date, frecency_at_last_hit_date FROM filetypes ORDER BY last_hit_date DESC LIMIT 500"];

    if ([v21 next])
    {
      do
      {
        long long v22 = (void *)MEMORY[0x21668E1E0]();
        long long v23 = [v21 numberAtIndex:0];
        long long v24 = [v21 stringAtIndex:1];
        id v25 = [v21 dataAtIndex:2];
        id v26 = [v21 stringAtIndex:3];
        uint64_t v27 = [v21 dateAtIndex:4];
        [v21 doubleAtIndex:5];
        double v29 = v28;
        v30 = (void *)MEMORY[0x263F08928];
        uint64_t v31 = [MEMORY[0x263F054A8] classForKeyedUnarchiver];
        id v44 = 0;
        v32 = [v30 unarchivedObjectOfClass:v31 fromData:v25 error:&v44];
        id v33 = v44;
        if (v33 || !v32)
        {
          v35 = *MEMORY[0x263F3AC68];
          if (!*MEMORY[0x263F3AC68])
          {
            DOCInitLogging();
            v35 = *MEMORY[0x263F3AC68];
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v33;
            _os_log_error_impl(&dword_21361D000, v35, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
          }
        }
        else
        {
          v34 = [[DOCSmartFolderHit alloc] initWithRowId:v23 folder:v32 type:1 value:v26 lastUsedDate:v27 frecency:v29];
          [*(id *)(*(void *)(*(void *)(v43 + 40) + 8) + 40) addObject:v34];
        }
      }
      while (([v21 next] & 1) != 0);
    }
  }
  else
  {
    v36 = (NSObject **)MEMORY[0x263F3AC68];
    v37 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      v37 = *v36;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      __38__DOCSmartFolderDatabase_previousHits__block_invoke_cold_1();
    }
    v38 = [*(id *)(a1 + 32) connection];

    if (!v38)
    {
      v41 = [MEMORY[0x263F08690] currentHandler];
      [v41 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"DOCSmartFolderDatabase.m" lineNumber:346 description:@"nil db connection"];
    }
    uint64_t v39 = [MEMORY[0x263EFFA68] mutableCopy];
    uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8);
    id v21 = *(void **)(v40 + 40);
    *(void *)(v40 + 40) = v39;
  }
}

- (void)registerEvent:(id)a3
{
  id v5 = a3;
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__DOCSmartFolderDatabase_registerEvent___block_invoke;
  block[3] = &unk_2641B1FA8;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(workingQueue, block);
}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) connection];

  if (v3)
  {
    id v4 = *(id *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) _existingEventSimilarToEvent:v4];
    if (v5)
    {
      v6 = [v4 lastUsedDate];
      [v5 updateFrecencyAtDate:v6];

      id v7 = v5;
      id v4 = v7;
    }
    uint64_t v8 = (void *)MEMORY[0x263F08910];
    id v9 = [v4 folderItem];
    id v36 = 0;
    SEL v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v36];
    id v11 = v36;

    if (v11 || !v10)
    {
      long long v24 = (NSObject **)MEMORY[0x263F3AC68];
      id v25 = *MEMORY[0x263F3AC68];
      if (!*MEMORY[0x263F3AC68])
      {
        DOCInitLogging();
        id v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_2(v25, v4);
      }
      goto LABEL_27;
    }
    double v12 = [v4 rowId];

    double v13 = [*v2 connection];
    if (v12)
    {
      id v14 = [v4 lastUsedDate];
      uint64_t v15 = NSNumber;
      [v4 frecency];
      double v16 = objc_msgSend(v15, "numberWithDouble:");
      id v17 = [v4 rowId];
      int v18 = [v13 execute:@"UPDATE hotfolders SET last_hit_date = %@, frecency_at_last_hit_date = %@ WHERE rowid = %@", v14, v16, v17];

      if (v18)
      {
LABEL_8:
        id v19 = (NSObject **)MEMORY[0x263F3AC68];
        id v20 = *MEMORY[0x263F3AC68];
        if (!*MEMORY[0x263F3AC68])
        {
          DOCInitLogging();
          id v20 = *v19;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_3(v20, v4);
        }
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      v35 = [v4 appBundleIdentifier];
      v34 = [v4 folderItem];
      id v33 = [v34 itemIdentifier];
      id v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
      uint64_t v27 = [v4 lastUsedDate];
      double v28 = NSNumber;
      [v4 frecency];
      double v29 = objc_msgSend(v28, "numberWithDouble:");
      char v32 = [v13 execute:@"INSERT INTO hotfolders(app_bundle_id, fp_folder_id, fp_folder_item, event_type, last_hit_date, frecency_at_last_hit_date) VALUES (%@, %@, %@, %@, %@, %@)", v35, v33, v10, v26, v27, v29];

      if (v32) {
        goto LABEL_8;
      }
    }
    v30 = (NSObject **)MEMORY[0x263F3AC68];
    uint64_t v31 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      uint64_t v31 = *v30;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_4(v31, v4, (uint64_t)v2);
    }
    goto LABEL_27;
  }
  id v21 = (NSObject **)MEMORY[0x263F3AC68];
  long long v22 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    long long v22 = *v21;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_1(a1, v22);
  }
  long long v23 = [*v2 connection];

  if (!v23)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"DOCSmartFolderDatabase.m" lineNumber:409 description:@"nil db connection"];
LABEL_28:
  }
}

- (id)_existingEventSimilarToEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  id v5 = [(DOCSmartFolderDatabase *)self connection];
  v6 = [v4 appBundleIdentifier];
  id v7 = [v4 folderItem];
  uint64_t v8 = [v7 itemIdentifier];
  double v28 = v4;
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
  SEL v10 = objc_msgSend(v5, "fetch:", @"SELECT rowid, app_bundle_id, fp_folder_item, event_type, last_hit_date, frecency_at_last_hit_date FROM hotfolders WHERE app_bundle_id = %@ AND fp_folder_id = %@ AND event_type = %@ ORDER BY last_hit_date DESC LIMIT 500;",
                  v6,
                  v8,
                  v9);

  double v29 = 0;
  do
  {
    if (![v10 next]) {
      break;
    }
    id v11 = (void *)MEMORY[0x21668E1E0]();
    double v12 = [v10 numberAtIndex:0];
    double v13 = [v10 stringAtIndex:1];
    id v14 = [v10 dataAtIndex:2];
    uint64_t v15 = [v10 unsignedIntegerAtIndex:3];
    double v16 = [v10 dateAtIndex:4];
    [v10 doubleAtIndex:5];
    double v18 = v17;
    id v19 = (void *)MEMORY[0x263F08928];
    uint64_t v20 = [MEMORY[0x263F054A8] classForKeyedUnarchiver];
    id v30 = 0;
    id v21 = [v19 unarchivedObjectOfClass:v20 fromData:v14 error:&v30];
    id v22 = v30;
    BOOL v23 = v22 || v21 == 0;
    BOOL v24 = v23;
    if (v23)
    {
      id v25 = *MEMORY[0x263F3AC68];
      if (!*MEMORY[0x263F3AC68])
      {
        DOCInitLogging();
        id v25 = *MEMORY[0x263F3AC68];
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v22;
        _os_log_error_impl(&dword_21361D000, v25, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
      }
    }
    else
    {
      id v26 = [[DOCHotFolderEvent alloc] initWithRowId:v12 appBundleIdentifier:v13 folderItem:v21 type:v15 lastUsedDate:v16 frecency:v18];

      double v29 = v26;
    }
  }
  while (v24);

  return v29;
}

- (id)previousEventsForAppBundleIdentifier:(id)a3 excluding:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__1;
  BOOL v23 = __Block_byref_object_dispose__1;
  id v24 = [MEMORY[0x263EFF980] array];
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__DOCSmartFolderDatabase_previousEventsForAppBundleIdentifier_excluding___block_invoke;
  block[3] = &unk_2641B1FD0;
  double v17 = &v19;
  SEL v18 = a2;
  void block[4] = self;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(workingQueue, block);
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __73__DOCSmartFolderDatabase_previousEventsForAppBundleIdentifier_excluding___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) connection];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) connection];
    id v5 = v4;
    if (v3) {
      uint64_t v6 = objc_msgSend(v4, "fetch:", @"SELECT rowid, app_bundle_id, fp_folder_item, event_type, last_hit_date, frecency_at_last_hit_date FROM hotfolders WHERE app_bundle_id = %@ AND fp_folder_id <> %@ ORDER BY last_hit_date DESC LIMIT 500;",
    }
             *(void *)(a1 + 48),
             *(void *)(a1 + 40));
    else {
      uint64_t v6 = objc_msgSend(v4, "fetch:", @"SELECT rowid, app_bundle_id, fp_folder_item, event_type, last_hit_date, frecency_at_last_hit_date FROM hotfolders WHERE app_bundle_id = %@ ORDER BY last_hit_date DESC LIMIT 500;",
    }
             *(void *)(a1 + 48),
             v28);
    id v12 = (void *)v6;

    if ([v12 next])
    {
      do
      {
        double v13 = (void *)MEMORY[0x21668E1E0]();
        id v14 = [v12 numberAtIndex:0];
        id v15 = [v12 stringAtIndex:1];
        id v16 = [v12 dataAtIndex:2];
        uint64_t v17 = [v12 unsignedIntegerAtIndex:3];
        SEL v18 = [v12 dateAtIndex:4];
        [v12 doubleAtIndex:5];
        double v20 = v19;
        uint64_t v21 = (void *)MEMORY[0x263F08928];
        uint64_t v22 = [MEMORY[0x263F054A8] classForKeyedUnarchiver];
        id v29 = 0;
        BOOL v23 = [v21 unarchivedObjectOfClass:v22 fromData:v16 error:&v29];
        id v24 = v29;
        if (v24 || !v23)
        {
          id v26 = *MEMORY[0x263F3AC68];
          if (!*MEMORY[0x263F3AC68])
          {
            DOCInitLogging();
            id v26 = *MEMORY[0x263F3AC68];
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v31 = v24;
            _os_log_error_impl(&dword_21361D000, v26, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
          }
        }
        else
        {
          id v25 = [[DOCHotFolderEvent alloc] initWithRowId:v14 appBundleIdentifier:*(void *)(a1 + 48) folderItem:v23 type:v17 lastUsedDate:v18 frecency:v20];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v25];
        }
      }
      while (([v12 next] & 1) != 0);
    }
  }
  else
  {
    id v7 = (NSObject **)MEMORY[0x263F3AC68];
    id v8 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__DOCSmartFolderDatabase_previousEventsForAppBundleIdentifier_excluding___block_invoke_cold_1();
    }
    id v9 = [*(id *)(a1 + 32) connection];

    if (!v9)
    {
      uint64_t v27 = [MEMORY[0x263F08690] currentHandler];
      [v27 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"DOCSmartFolderDatabase.m" lineNumber:481 description:@"nil db connection"];
    }
    uint64_t v10 = [MEMORY[0x263EFFA68] mutableCopy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (void)deleteFolderWithIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  workingQueue = self->_workingQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke;
  v12[3] = &unk_2641B1FF8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v7;
  SEL v15 = a2;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(workingQueue, v12);
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) connection];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) connection];
    uint64_t v6 = *(void *)(a1 + 48);
    id v5 = (void *)(a1 + 48);
    int v7 = [v4 execute:@"DELETE FROM hotfolders WHERE app_bundle_id = %@ AND fp_folder_id = %@", *(v5 - 1), v6];

    id v8 = (NSObject **)MEMORY[0x263F3AC68];
    id v9 = *MEMORY[0x263F3AC68];
    if (v7)
    {
      if (!v9)
      {
        DOCInitLogging();
        id v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_6();
      }
    }
    else
    {
      if (!v9)
      {
        DOCInitLogging();
        id v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(v5 - 1);
        uint64_t v21 = *v5;
        id v22 = *v2;
        BOOL v23 = v9;
        id v24 = [v22 connection];
        id v25 = [v24 lastError];
        *(_DWORD *)buf = 138412802;
        uint64_t v27 = v20;
        __int16 v28 = 2112;
        uint64_t v29 = v21;
        __int16 v30 = 2112;
        id v31 = v25;
        _os_log_error_impl(&dword_21361D000, v23, OS_LOG_TYPE_ERROR, "Could not delete hotfolders events for app %@ into folderID %@ : %@.", buf, 0x20u);
      }
    }
    id v14 = [*v2 connection];
    int v15 = [v14 execute:@"DELETE FROM filenames WHERE fp_folder_id = %@", *v5];

    id v16 = *v8;
    if (v15)
    {
      if (!v16)
      {
        DOCInitLogging();
        id v16 = *v8;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_4();
      }
    }
    else
    {
      if (!v16)
      {
        DOCInitLogging();
        id v16 = *v8;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_5((uint64_t)v5, (uint64_t)v2, v16);
      }
    }
    uint64_t v17 = [*v2 connection];
    int v18 = [v17 execute:@"DELETE FROM filetypes WHERE fp_folder_id = %@", *v5];

    double v19 = *v8;
    if (v18)
    {
      if (!v19)
      {
        DOCInitLogging();
        double v19 = *v8;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_2();
      }
    }
    else
    {
      if (!v19)
      {
        DOCInitLogging();
        double v19 = *v8;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_3((uint64_t)v5, (uint64_t)v2, v19);
      }
    }
  }
  else
  {
    id v10 = (NSObject **)MEMORY[0x263F3AC68];
    id v11 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      id v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_1();
    }
    id v12 = [*v2 connection];

    if (!v12)
    {
      id v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"DOCSmartFolderDatabase.m" lineNumber:526 description:@"nil db connection"];
    }
  }
}

- (void)purgeOldEntries
{
  workingQueue = self->_workingQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke;
  v3[3] = &unk_2641B2020;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(workingQueue, v3);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) connection];

  if (v3)
  {
    id v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-7890000.0];
    id v5 = [*v2 connection];
    int v6 = [v5 execute:@"DELETE FROM hotfolders WHERE last_hit_date < %@", v4];

    int v7 = (NSObject **)MEMORY[0x263F3AC68];
    id v8 = *MEMORY[0x263F3AC68];
    if (v6)
    {
      if (!v8)
      {
        DOCInitLogging();
        id v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_6();
      }
    }
    else
    {
      if (!v8)
      {
        DOCInitLogging();
        id v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_7((uint64_t)v2, v8);
      }
    }
    id v12 = [*v2 connection];
    int v13 = [v12 execute:@"DELETE FROM filenames WHERE last_hit_date < %@", v4];

    id v14 = *v7;
    if (v13)
    {
      if (!v14)
      {
        DOCInitLogging();
        id v14 = *v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_4();
      }
    }
    else
    {
      if (!v14)
      {
        DOCInitLogging();
        id v14 = *v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_5((uint64_t)v2, v14);
      }
    }
    int v15 = [*v2 connection];
    int v16 = [v15 execute:@"DELETE FROM filetypes WHERE last_hit_date < %@", v4];

    uint64_t v17 = *v7;
    if (v16)
    {
      if (!v17)
      {
        DOCInitLogging();
        uint64_t v17 = *v7;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_2();
      }
    }
    else
    {
      if (!v17)
      {
        DOCInitLogging();
        uint64_t v17 = *v7;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_3((uint64_t)v2, v17);
      }
    }
    goto LABEL_35;
  }
  id v9 = (NSObject **)MEMORY[0x263F3AC68];
  id v10 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    id v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_1();
  }
  id v11 = [*v2 connection];

  if (!v11)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"DOCSmartFolderDatabase.m" lineNumber:560 description:@"nil db connection"];
LABEL_35:
  }
}

- (void)_registerSavingFile:(id)a3 inFolder:(id)a4 atDate:(id)a5 withFrecencyScore:(double)a6 rowId:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  id v39 = 0;
  int v16 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v39];
  id v17 = v39;
  if (v17 || !v16)
  {
    id v26 = (NSObject **)MEMORY[0x263F3AC68];
    uint64_t v27 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      uint64_t v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _registerSavingFile:inFolder:atDate:withFrecencyScore:rowId:](v27, v13);
    }
  }
  else
  {
    id v38 = v12;
    int v18 = [(DOCSmartFolderDatabase *)self connection];
    if (v15)
    {
      double v19 = [NSNumber numberWithDouble:a6];
      int v20 = [v18 execute:@"UPDATE filenames SET last_hit_date = %@, frecency_at_last_hit_date = %@ WHERE rowid = %@", v14, v19, v15];

      if (v20)
      {
LABEL_5:
        uint64_t v21 = (NSObject **)MEMORY[0x263F3AC68];
        id v22 = *MEMORY[0x263F3AC68];
        if (!*MEMORY[0x263F3AC68])
        {
          DOCInitLogging();
          id v22 = *v21;
        }
        id v12 = v38;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          BOOL v23 = v22;
          id v24 = [v13 itemIdentifier];
          id v25 = [NSNumber numberWithDouble:a6];
          *(_DWORD *)buf = 138413058;
          id v41 = v38;
          __int16 v42 = 2112;
          uint64_t v43 = v24;
          __int16 v44 = 2112;
          id v45 = v14;
          __int16 v46 = 2112;
          id v47 = v25;
          _os_log_debug_impl(&dword_21361D000, v23, OS_LOG_TYPE_DEBUG, "Successfully registered saving %@ into folderID %@ at date %@ with frecencyScore %@.", buf, 0x2Au);
        }
        goto LABEL_18;
      }
    }
    else
    {
      __int16 v28 = [v13 itemIdentifier];
      uint64_t v29 = [NSNumber numberWithDouble:a6];
      char v30 = [v18 execute:@"INSERT INTO filenames(fp_folder_id, fp_folder_item, file_name, last_hit_date, frecency_at_last_hit_date) VALUES (%@, %@, %@, %@, %@)", v28, v16, v38, v14, v29];

      if (v30) {
        goto LABEL_5;
      }
    }
    id v31 = (NSObject **)MEMORY[0x263F3AC68];
    uint64_t v32 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      uint64_t v32 = *v31;
    }
    id v12 = v38;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = v32;
      v34 = [v13 itemIdentifier];
      v35 = [NSNumber numberWithDouble:a6];
      id v36 = [(DOCSmartFolderDatabase *)self connection];
      v37 = [v36 lastError];
      *(_DWORD *)buf = 138413314;
      id v41 = v38;
      __int16 v42 = 2112;
      uint64_t v43 = v34;
      __int16 v44 = 2112;
      id v45 = v14;
      __int16 v46 = 2112;
      id v47 = v35;
      __int16 v48 = 2112;
      v49 = v37;
      _os_log_error_impl(&dword_21361D000, v33, OS_LOG_TYPE_ERROR, "Could not register saving %@ into folderID %@ at date %@ with frecencyScore %@: %@.", buf, 0x34u);

      id v12 = v38;
    }
  }
LABEL_18:
}

- (void)_registerSavingFileType:(id)a3 inFolder:(id)a4 atDate:(id)a5 withFrecencyScore:(double)a6 rowId:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v34 = 0;
  int v16 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v34];
  id v17 = v34;
  if (v17) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v16 == 0;
  }
  if (v18)
  {
    double v19 = (NSObject **)MEMORY[0x263F3AC68];
    int v20 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      int v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _registerSavingFile:inFolder:atDate:withFrecencyScore:rowId:](v20, v13);
    }
    goto LABEL_20;
  }
  uint64_t v21 = [(DOCSmartFolderDatabase *)self connection];
  if (v15)
  {
    id v22 = [NSNumber numberWithDouble:a6];
    int v23 = [v21 execute:@"UPDATE filetypes SET last_hit_date = %@, frecency_at_last_hit_date = %@ WHERE rowid = %@", v14, v22, v15];

    if (v23) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v29 = [v13 itemIdentifier];
    char v30 = [NSNumber numberWithDouble:a6];
    char v31 = [v21 execute:@"INSERT INTO filetypes(fp_folder_id, fp_folder_item, file_type, last_hit_date, frecency_at_last_hit_date) VALUES (%@, %@, %@, %@, %@)", v29, v16, v12, v14, v30];

    if (v31)
    {
LABEL_12:
      id v24 = (NSObject **)MEMORY[0x263F3AC68];
      id v25 = *MEMORY[0x263F3AC68];
      if (!*MEMORY[0x263F3AC68])
      {
        DOCInitLogging();
        id v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v26 = v25;
        uint64_t v27 = [v13 itemIdentifier];
        __int16 v28 = [NSNumber numberWithDouble:a6];
        *(_DWORD *)buf = 138413058;
        id v36 = v12;
        __int16 v37 = 2112;
        id v38 = v27;
        __int16 v39 = 2112;
        id v40 = v14;
        __int16 v41 = 2112;
        __int16 v42 = v28;
        _os_log_debug_impl(&dword_21361D000, v26, OS_LOG_TYPE_DEBUG, "Successfully registered saving %@ into folderID %@ at date %@ with frecencyScore %@.", buf, 0x2Au);
LABEL_22:

        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  uint64_t v32 = (NSObject **)MEMORY[0x263F3AC68];
  uint64_t v33 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    uint64_t v33 = *v32;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    id v26 = v33;
    uint64_t v27 = [v13 itemIdentifier];
    __int16 v28 = [NSNumber numberWithDouble:a6];
    *(_DWORD *)buf = 138413058;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v27;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 2112;
    __int16 v42 = v28;
    _os_log_error_impl(&dword_21361D000, v26, OS_LOG_TYPE_ERROR, "Could not register saving %@ into folderID %@ at date %@ with frecencyScore %@.", buf, 0x2Au);
    goto LABEL_22;
  }
LABEL_20:
}

- (id)_existingFiletypeHitSimilarToHit:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DOCSmartFolderDatabase *)self connection];
  int v6 = [v4 folderItem];
  int v7 = [v6 itemIdentifier];
  id v26 = v4;
  id v8 = [v4 value];
  id v9 = (void *)[v5 fetch:@"SELECT rowid, fp_folder_id, fp_folder_item, file_type, last_hit_date, frecency_at_last_hit_date FROM filetypes WHERE fp_folder_id = %@ AND file_type = %@ ORDER BY last_hit_date DESC LIMIT 500", v7, v8];

  uint64_t v27 = 0;
  do
  {
    if (![v9 next]) {
      break;
    }
    context = (void *)MEMORY[0x21668E1E0]();
    id v10 = [v9 numberAtIndex:0];
    id v11 = [v9 stringAtIndex:1];
    id v12 = [v9 dataAtIndex:2];
    id v13 = [v9 stringAtIndex:3];
    id v14 = [v9 dateAtIndex:4];
    [v9 doubleAtIndex:5];
    double v16 = v15;
    id v17 = (void *)MEMORY[0x263F08928];
    uint64_t v18 = [MEMORY[0x263F054A8] classForKeyedUnarchiver];
    id v29 = 0;
    double v19 = [v17 unarchivedObjectOfClass:v18 fromData:v12 error:&v29];
    id v20 = v29;
    BOOL v21 = v20 || v19 == 0;
    BOOL v22 = v21;
    if (v21)
    {
      int v23 = *MEMORY[0x263F3AC68];
      if (!*MEMORY[0x263F3AC68])
      {
        DOCInitLogging();
        int v23 = *MEMORY[0x263F3AC68];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v20;
        _os_log_error_impl(&dword_21361D000, v23, OS_LOG_TYPE_ERROR, "Could not unarchive FPItem: %@", buf, 0xCu);
      }
    }
    else
    {
      id v24 = [[DOCSmartFolderHit alloc] initWithRowId:v10 folder:v19 type:1 value:v13 lastUsedDate:v14 frecency:v16];

      uint64_t v27 = v24;
    }
  }
  while (v22);

  return v27;
}

- (void)open
{
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__DOCSmartFolderDatabase_open__block_invoke;
  block[3] = &unk_2641B15E8;
  void block[4] = self;
  dispatch_async(workingQueue, block);
}

void __30__DOCSmartFolderDatabase_open__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3[2])
  {
    id v4 = (NSObject **)MEMORY[0x263F3AC68];
    id v5 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __30__DOCSmartFolderDatabase_open__block_invoke_cold_1();
    }
    uint64_t v3 = *(void **)(a1 + 32);
  }
  int v6 = [v3 _openConnectionToDatabaseAtURL:v3[1]];
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v6);
  }

  objc_sync_exit(v2);
}

- (id)_openConnectionToDatabaseAtURL:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  id v43 = 0;
  id v5 = [(DOCSmartFolderDatabase *)self _createDatabaseIfNeededAtURL:v4 error:&v43];
  id v6 = v43;
  if (!v5)
  {
    int v7 = (NSObject **)MEMORY[0x263F3AC68];
    id v8 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.7();
    }
    unsigned int v9 = [v6 code];
    if (v9 > 0x1A || ((1 << v9) & 0x5000800) == 0) {
      goto LABEL_42;
    }
    id v10 = *v7;
    if (!*v7)
    {
      DOCInitLogging();
      id v10 = *v7;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.6();
    }
    id v11 = [MEMORY[0x263F08850] defaultManager];
    id v42 = 0;
    [v11 removeItemAtURL:v4 error:&v42];
    id v12 = v42;

    if (v12)
    {
      id v13 = *v7;
      if (!*v7)
      {
        DOCInitLogging();
        id v13 = *v7;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.5();
      }
    }
    id v41 = v6;
    id v5 = [(DOCSmartFolderDatabase *)self _createDatabaseIfNeededAtURL:v4 error:&v41];
    id v14 = v41;

    id v6 = v14;
    if (!v5)
    {
LABEL_42:
      id v31 = *v7;
      if (!*v7)
      {
        DOCInitLogging();
        id v31 = *v7;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:]();
      }
      goto LABEL_51;
    }
  }
  double v15 = [v5 userVersion];
  uint64_t v16 = [v15 unsignedIntegerValue];

  if (v16 == 5)
  {
    id v17 = v6;
  }
  else
  {
    [v5 close:0];
    uint64_t v18 = (NSObject **)MEMORY[0x263F3AC68];
    double v19 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      double v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21361D000, v19, OS_LOG_TYPE_INFO, "Database changed during development, nuking it", buf, 2u);
    }
    if (unlink([(NSURL *)self->_url fileSystemRepresentation]) < 0)
    {
      uint64_t v32 = *v18;
      if (!*v18)
      {
        DOCInitLogging();
        uint64_t v32 = *v18;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:].cold.4((uint64_t)self, v32);
      }

      goto LABEL_51;
    }
    id v39 = v6;
    id v20 = [(DOCSmartFolderDatabase *)self _createDatabaseIfNeededAtURL:v4 error:&v39];
    id v17 = v39;

    if (!v20)
    {
      BOOL v21 = 0;
      id v6 = v17;
      goto LABEL_52;
    }
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __57__DOCSmartFolderDatabase__openConnectionToDatabaseAtURL___block_invoke;
    v36[3] = &unk_2641B2048;
    id v5 = v20;
    id v37 = v5;
    uint64_t v38 = v16;
    [v5 performWithFlags:10 action:v36];
  }
  id v35 = v17;
  BOOL v21 = [(DOCSmartFolderDatabase *)self _setupDatabaseTablesIfNeeded:v5 error:&v35];
  id v6 = v35;

  if (!v21)
  {
    id v29 = (NSObject **)MEMORY[0x263F3AC68];
    char v30 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      char v30 = *v29;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:]();
    }
LABEL_51:
    BOOL v21 = 0;
    goto LABEL_52;
  }
  [(DOCSmartFolderDatabase *)self _setUpDatabaseWatcher:v21];
  uint64_t v22 = *MEMORY[0x263EFF6B0];
  id v34 = v6;
  char v23 = [v4 setResourceValue:MEMORY[0x263EFFA88] forKey:v22 error:&v34];
  id v24 = v34;

  if ((v23 & 1) == 0)
  {
    id v25 = (NSObject **)MEMORY[0x263F3AC68];
    id v26 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      id v26 = *v25;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _openConnectionToDatabaseAtURL:]();
    }
  }
  uint64_t v27 = (NSObject **)MEMORY[0x263F3AC68];
  __int16 v28 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    __int16 v28 = *v27;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21361D000, v28, OS_LOG_TYPE_INFO, "SmartFolder Database opened and upgraded", buf, 2u);
  }
  id v6 = v24;
LABEL_52:

  return v21;
}

uint64_t __57__DOCSmartFolderDatabase__openConnectionToDatabaseAtURL___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v8 = 0;
  uint64_t v3 = doc_smartfolder_create_tables_initial(v2, &v8);
  id v4 = v8;
  if (v3)
  {
    [*(id *)(a1 + 32) setUserVersion:5];
  }
  else
  {
    id v5 = (NSObject **)MEMORY[0x263F3AC68];
    id v6 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57__DOCSmartFolderDatabase__openConnectionToDatabaseAtURL___block_invoke_cold_1(a1, v6);
    }
  }

  return v3;
}

- (id)_createDatabaseIfNeededAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (NSObject **)MEMORY[0x263F3AC68];
  id v8 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    id v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:].cold.4();
  }
  if ([v6 checkResourceIsReachableAndReturnError:0])
  {
LABEL_9:
    id v12 = objc_alloc_init(MEMORY[0x263F8C708]);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke;
    v24[3] = &unk_2641B2070;
    v24[4] = self;
    v24[5] = v25;
    [v12 setSqliteErrorHandler:v24];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2;
    v20[3] = &unk_2641B1F80;
    char v23 = a4;
    id v9 = v12;
    id v21 = v9;
    uint64_t v22 = v25;
    id v13 = (void (**)(void))MEMORY[0x21668E400](v20);
    [v9 setLabel:@"SmartFolder Database"];
    if ([v9 openAtURL:v6 sharedCache:0 error:a4])
    {
      if ([v9 setupPragmas])
      {
        [v9 setSynchronousMode:1];
        id v14 = [v9 lastError];

        if (!v14)
        {
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_162;
          v19[3] = &unk_2641B2098;
          v19[4] = self;
          [v9 setSqliteErrorHandler:v19];
          uint64_t v18 = *v7;
          if (!*v7)
          {
            DOCInitLogging();
            uint64_t v18 = *v7;
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:]();
          }
          a4 = (id *)v9;
          goto LABEL_18;
        }
      }
      v13[2](v13);
    }
    else
    {
      double v15 = *v7;
      if (!*v7)
      {
        DOCInitLogging();
        double v15 = *v7;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:]();
      }
    }
    [v9 close:0];
    a4 = 0;
LABEL_18:

    _Block_object_dispose(v25, 8);
    goto LABEL_19;
  }
  id v9 = [v6 URLByDeletingLastPathComponent];
  if (([v9 checkResourceIsReachableAndReturnError:0] & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:0 attributes:0 error:a4],
        v10,
        (v11 & 1) != 0))
  {

    goto LABEL_9;
  }
  if (a4)
  {
    id v17 = *v7;
    if (!*v7)
    {
      DOCInitLogging();
      id v17 = *v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _createDatabaseIfNeededAtURL:error:]();
    }
    a4 = 0;
  }
LABEL_19:

  return a4;
}

void __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v7 = *(void **)(a1 + 32);
  id v8 = a4;
  [v7 logError:v8 onDB:a2 statement:a3];
  uint64_t v9 = [v8 code];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

void __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) lastError];
    if (v2)
    {
      uint64_t v3 = v2;
      if (![v2 code])
      {
        id v4 = (void *)MEMORY[0x263F087E8];
        id v5 = [v3 domain];
        uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        int v7 = [v3 userInfo];
        uint64_t v8 = [v4 errorWithDomain:v5 code:v6 userInfo:v7];

        uint64_t v3 = (void *)v8;
      }
    }
    else
    {
      uint64_t v9 = (NSObject **)MEMORY[0x263F3AC68];
      id v10 = *MEMORY[0x263F3AC68];
      if (!*MEMORY[0x263F3AC68])
      {
        DOCInitLogging();
        id v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2_cold_1();
      }
      uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F8C730] code:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) userInfo:0];
    }
    id v11 = v3;
    **(void **)(a1 + 48) = v11;
  }
}

uint64_t __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_162(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) logError:a4 onDB:a2 statement:a3];
}

- (void)_setUpDatabaseWatcher:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  [v5 useSerialQueueWithTarget:self->_workingQueue];
  [v5 useBatchingWithDelay:500 changeCount:2.0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke;
  v22[3] = &unk_2641B20C0;
  v22[4] = self;
  v22[5] = a2;
  [v5 setWillBeginBatchingHook:v22];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_180;
  v21[3] = &unk_2641B20E8;
  v21[4] = self;
  [v5 setDidFinishBatchingHook:v21];
  watcher = self->_watcher;
  if (watcher)
  {
    dispatch_source_cancel(watcher);
    int v7 = self->_watcher;
    self->_watcher = 0;
  }
  id v8 = [v5 url];
  uint64_t v9 = (const char *)[v8 fileSystemRepresentation];

  LODWORD(v8) = open(v9, 32772);
  id v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8410], (int)v8, 1uLL, 0);
  id v11 = self->_watcher;
  self->_watcher = v10;

  objc_initWeak(&location, self);
  id v12 = self->_watcher;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_181;
  handler[3] = &unk_2641B2110;
  objc_copyWeak(&v19, &location);
  id v18 = v5;
  id v13 = v5;
  dispatch_source_set_event_handler(v12, handler);
  id v14 = self->_watcher;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_2;
  v15[3] = &__block_descriptor_36_e5_v8__0l;
  int v16 = (int)v8;
  dispatch_source_set_cancel_handler(v14, v15);
  dispatch_resume((dispatch_object_t)self->_watcher);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F3AC68];
  id v5 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    id v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_cold_2();
  }
  uint64_t v6 = [*(id *)(a1 + 32) processAssertion];

  if (v6)
  {
    double v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"DOCSmartFolderDatabase.m", 850, @"Trying to acquire an assertion, but we already have one" object file lineNumber description];
  }
  int v7 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"FinishTaskNow"];
  id v8 = objc_alloc(MEMORY[0x263F64408]);
  uint64_t v9 = [MEMORY[0x263F64630] currentProcess];
  v17[0] = v7;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v11 = (void *)[v8 initWithExplanation:@"Finishing SQL Batch" target:v9 attributes:v10];
  [*(id *)(a1 + 32) setProcessAssertion:v11];

  id v12 = [*(id *)(a1 + 32) processAssertion];
  id v16 = 0;
  LOBYTE(v10) = [v12 acquireWithError:&v16];
  id v13 = v16;

  if ((v10 & 1) == 0)
  {
    id v14 = *v4;
    if (!*v4)
    {
      DOCInitLogging();
      id v14 = *v4;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_cold_1();
    }
    [*(id *)(a1 + 32) setProcessAssertion:0];
  }
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_180(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F3AC68];
  id v5 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    id v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_180_cold_1();
  }
  uint64_t v6 = [*(id *)(a1 + 32) processAssertion];
  [v6 invalidate];

  [*(id *)(a1 + 32) setProcessAssertion:0];
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_181(uint64_t a1)
{
  id v2 = (NSObject **)MEMORY[0x263F3AC68];
  id v3 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_181_cold_1();
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_182;
    v7[3] = &unk_2641B0FE0;
    v7[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    dispatch_sync(v6, v7);
  }
}

uint64_t __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_182(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetDatabaseOnItsQueue:*(void *)(a1 + 40)];
}

uint64_t __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (id)_setupDatabaseTablesIfNeeded:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (NSObject **)MEMORY[0x263F3AC68];
  int v7 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    int v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:].cold.4();
  }
  id v8 = [v5 userVersion];
  uint64_t v9 = v8;
  if (v8)
  {
    int v10 = [v8 unsignedIntValue];
    if (v10)
    {
      int v11 = v10;
      id v12 = *v6;
      if (!*v6)
      {
        DOCInitLogging();
        id v12 = *v6;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:](v11, v12);
      }
      int v13 = 1;
    }
    else
    {
      id v16 = *v6;
      if (!*v6)
      {
        DOCInitLogging();
        id v16 = *v6;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        int v29 = 0;
        __int16 v30 = 1024;
        int v31 = 0;
        _os_log_debug_impl(&dword_21361D000, v16, OS_LOG_TYPE_DEBUG, "Migrating Smart Folder Database from version %d to %d", buf, 0xEu);
      }
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __61__DOCSmartFolderDatabase__setupDatabaseTablesIfNeeded_error___block_invoke;
      v26[3] = &__block_descriptor_44_e23_B16__0__PQLConnection_8l;
      int v27 = 0;
      v26[4] = a4;
      int v13 = [v5 performWithFlags:10 action:v26];
      id v17 = [v5 userVersion];
      int v18 = [v17 unsignedIntValue];

      if (v18 != 1)
      {
        id v19 = *v6;
        if (!*v6)
        {
          DOCInitLogging();
          id v19 = *v6;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = v19;
          id v21 = [v5 userVersion];
          int v22 = [v21 unsignedIntValue];
          *(_DWORD *)buf = 67109376;
          int v29 = v22;
          __int16 v30 = 1024;
          int v31 = 1;
          _os_log_impl(&dword_21361D000, v20, OS_LOG_TYPE_INFO, "Database is at version %u instead of %d", buf, 0xEu);
        }
      }
    }
    char v23 = [v5 userVersion];
    int v24 = [v23 unsignedIntValue];
    if (v13 && !v24) {
      -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:]();
    }

    if ((v13 & 1) == 0)
    {
      [v5 close:0];

      id v5 = 0;
    }
    id v5 = v5;
    double v15 = v5;
  }
  else
  {
    if (a4)
    {
      *a4 = [v5 lastError];
    }
    id v14 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      id v14 = *v6;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:](v14);
    }
    [v5 close:0];
    double v15 = 0;
  }

  return v15;
}

uint64_t __61__DOCSmartFolderDatabase__setupDatabaseTablesIfNeeded_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = 0;
  uint64_t v3 = doc_smartfolder_create_tables_initial(a2, &v8);
  id v4 = v8;
  if ((v3 & 1) == 0)
  {
    id v5 = (NSObject **)MEMORY[0x263F3AC68];
    uint64_t v6 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      uint64_t v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__DOCSmartFolderDatabase__setupDatabaseTablesIfNeeded_error___block_invoke_cold_1((int *)(a1 + 40), (uint64_t)v4, v6);
    }
    if (*(void *)(a1 + 32)) {
      **(void **)(a1 + 32) = v4;
    }
  }

  return v3;
}

- (void)_cleanUpAfterClose
{
  watcher = self->_watcher;
  if (watcher)
  {
    dispatch_source_cancel(watcher);
    id v4 = self->_watcher;
    self->_watcher = 0;
  }
}

- (void)_closeDatabaseOnItsQueue:(id)a3
{
  id v4 = (PQLConnection *)a3;
  id v9 = 0;
  char v5 = [(PQLConnection *)v4 close:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    int v7 = (NSObject **)MEMORY[0x263F3AC68];
    id v8 = *MEMORY[0x263F3AC68];
    if (!*MEMORY[0x263F3AC68])
    {
      DOCInitLogging();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _closeDatabaseOnItsQueue:]((uint64_t)v4);
    }
  }
  if (self->_connection == v4)
  {
    self->_connection = 0;
  }
}

- (void)close
{
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__DOCSmartFolderDatabase_close__block_invoke;
  block[3] = &unk_2641B15E8;
  void block[4] = self;
  dispatch_sync(workingQueue, block);
}

uint64_t __31__DOCSmartFolderDatabase_close__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 connection];
  [v2 _closeDatabaseOnItsQueue:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 _cleanUpAfterClose];
}

- (void)_resetDatabaseOnItsQueue:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = self;
  objc_sync_enter(v5);
  id v6 = (NSObject **)MEMORY[0x263F3AC68];
  int v7 = *MEMORY[0x263F3AC68];
  if (!*MEMORY[0x263F3AC68])
  {
    DOCInitLogging();
    int v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_21361D000, v7, OS_LOG_TYPE_INFO, "%@: Resetting the SmartFolder Database", buf, 0xCu);
  }
  [(DOCSmartFolderDatabase *)v5 _closeDatabaseOnItsQueue:v4];
  [(DOCSmartFolderDatabase *)v5 _cleanUpAfterClose];
  id v8 = *v6;
  if (!*v6)
  {
    DOCInitLogging();
    id v8 = *v6;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DOCSmartFolderDatabase _resetDatabaseOnItsQueue:]();
  }
  id v9 = [MEMORY[0x263F08850] defaultManager];
  url = v5->_url;
  id v16 = 0;
  char v11 = [v9 removeItemAtURL:url error:&v16];
  id v12 = v16;

  if ((v11 & 1) == 0)
  {
    int v13 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      int v13 = *v6;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase _resetDatabaseOnItsQueue:]();
    }
  }
  id v14 = *v6;
  if (!*v6)
  {
    DOCInitLogging();
    id v14 = *v6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[DOCSmartFolderDatabase _resetDatabaseOnItsQueue:]();
  }
  double v15 = [(DOCSmartFolderDatabase *)v5 _openConnectionToDatabaseAtURL:v5->_url];

  if (v15) {
    objc_storeStrong((id *)&v5->_connection, v15);
  }

  objc_sync_exit(v5);
}

- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = (NSObject **)MEMORY[0x263F3AC68];
  char v11 = *MEMORY[0x263F3AC68];
  if (v9)
  {
    if (!v11)
    {
      DOCInitLogging();
      char v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl(&dword_21361D000, v11, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error [%@]", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    if (!v11)
    {
      DOCInitLogging();
      char v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DOCSmartFolderDatabase logError:onDB:statement:]((uint64_t)v8);
    }
  }
}

- (NSURL)url
{
  return self->_url;
}

- (PQLConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_source)watcher
{
  return self->_watcher;
}

- (void)setWatcher:(id)a3
{
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (OS_dispatch_queue)workingQueue
{
  return self->_workingQueue;
}

- (void)setWorkingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingQueue, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_watcher, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21361D000, v0, v1, "Init SmartFolder Database at : %@", v2, v3, v4, v5, v6);
}

void __74__DOCSmartFolderDatabase_registerFilenameHit_fileTypeHit_smartScoreBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "Can't register filename save to DB because it's not open.", v2, v3, v4, v5, v6);
}

- (void)_registerHit:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "Trying to register unsupported hit type", v2, v3, v4, v5, v6);
}

void __38__DOCSmartFolderDatabase_previousHits__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "Can't build hit list because DB is not open.", v2, v3, v4, v5, v6);
}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_6() folderItem];
  uint64_t v5 = [v4 displayName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_21361D000, v2, v6, "Can't register hot folder event for folder %@.", v7);
}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 folderItem];
  uint64_t v5 = [v4 displayName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v3, v6, "Can't archive folder (%@) to register hot folder event: %@.", v7);
}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_3(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = NSNumber;
  uint64_t v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  uint64_t v6 = [a2 appBundleIdentifier];
  id v7 = [a2 folderItem];
  uint64_t v8 = [v7 itemIdentifier];
  id v9 = [a2 lastUsedDate];
  int v10 = NSNumber;
  [a2 frecency];
  char v11 = objc_msgSend(v10, "numberWithDouble:");
  OUTLINED_FUNCTION_9_0();
  id v15 = v9;
  __int16 v16 = v12;
  uint64_t v17 = v13;
  _os_log_debug_impl(&dword_21361D000, v4, OS_LOG_TYPE_DEBUG, "Successfully registered event (%@) for app %@ into folderID %@ at date %@ with frecencyScore %@.", v14, 0x34u);
}

void __40__DOCSmartFolderDatabase_registerEvent___block_invoke_cold_4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSNumber;
  uint64_t v6 = a1;
  id v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  uint64_t v8 = [a2 appBundleIdentifier];
  id v9 = [a2 folderItem];
  int v10 = [v9 itemIdentifier];
  char v11 = [a2 lastUsedDate];
  __int16 v12 = NSNumber;
  [a2 frecency];
  uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  __int16 v14 = [*(id *)(*(void *)a3 + 16) lastError];
  OUTLINED_FUNCTION_9_0();
  uint64_t v18 = v11;
  __int16 v19 = v15;
  id v20 = v13;
  __int16 v21 = v15;
  uint64_t v22 = v16;
  _os_log_error_impl(&dword_21361D000, v6, OS_LOG_TYPE_ERROR, "Could not register event (%@) for app %@ into folderID %@ at date %@ with frecencyScore %@ : %@.", v17, 0x3Eu);
}

void __73__DOCSmartFolderDatabase_previousEventsForAppBundleIdentifier_excluding___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "Can't build hot folder list because DB is not open.", v2, v3, v4, v5, v6);
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v0, v1, "Can't delete hot folder for app %@ and folder %@.", v2);
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_21361D000, v0, v1, "Successfully delete filetypes events for folderID %@.", v2, v3, v4, v5, v6);
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_6() connection];
  uint8_t v6 = [v5 lastError];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v3, v7, "Could not delete filetypes events for folderID %@ : %@.", v8);
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_21361D000, v0, v1, "Successfully delete filenames events for folderID %@.", v2, v3, v4, v5, v6);
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_6() connection];
  uint8_t v6 = [v5 lastError];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v3, v7, "Could not delete filenames events for folderID %@ : %@.", v8);
}

void __73__DOCSmartFolderDatabase_deleteFolderWithIdentifier_appBundleIdentifier___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_21361D000, v0, OS_LOG_TYPE_DEBUG, "Successfully delete hotfolders events for app %@ into folderID %@.", v1, 0x16u);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "Can't purge Hot/SmartFolders because connection is nil.", v2, v3, v4, v5, v6);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21361D000, v0, v1, "Successfully delete filetypes events older than 3 months.", v2, v3, v4, v5, v6);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_6() connection];
  uint64_t v5 = [v4 lastError];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_21361D000, v2, v6, "Could not delete filetypes events older than 3 months: %@.", v7);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21361D000, v0, v1, "Successfully delete filenames events older than 3 months.", v2, v3, v4, v5, v6);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_5(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_6() connection];
  uint64_t v5 = [v4 lastError];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_21361D000, v2, v6, "Could not delete filenames events older than 3 months: %@.", v7);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21361D000, v0, v1, "Successfully delete hotfolders events older than 3 months.", v2, v3, v4, v5, v6);
}

void __41__DOCSmartFolderDatabase_purgeOldEntries__block_invoke_cold_7(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_6() connection];
  uint64_t v5 = [v4 lastError];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_21361D000, v2, v6, "Could not delete hotfolders events older than 3 months: %@.", v7);
}

- (void)_registerSavingFile:(void *)a1 inFolder:(void *)a2 atDate:withFrecencyScore:rowId:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 displayName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v3, v5, "Can't archive folder (%@) to register hit: %@.", v6);
}

void __30__DOCSmartFolderDatabase_open__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21361D000, v0, v1, "Database is already open", v2, v3, v4, v5, v6);
}

- (void)_openConnectionToDatabaseAtURL:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Could not create SmartFolder Database after resetting it. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_openConnectionToDatabaseAtURL:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Could not setup the tables of the SmartFolder Database. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_openConnectionToDatabaseAtURL:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Could not exclude the SmartFolder database URL from backups. Migrating this database to a different device via D2D might generate a lot of inode lookup errors! Error: %@", v2, v3, v4, v5, v6);
}

- (void)_openConnectionToDatabaseAtURL:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_6() url];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_21361D000, v2, v5, "Can't unlink '%@'", v6);
}

- (void)_openConnectionToDatabaseAtURL:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Could not remove SmartFolder Database file. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_openConnectionToDatabaseAtURL:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "Corrupt SmartFolder Database. Resetting the database and retrying.", v2, v3, v4, v5, v6);
}

- (void)_openConnectionToDatabaseAtURL:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Could not open the SmartFolder Database. Error: %@", v2, v3, v4, v5, v6);
}

void __57__DOCSmartFolderDatabase__openConnectionToDatabaseAtURL___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = a2;
  uint64_t v5 = [v2 numberWithUnsignedLong:v3];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v4, v6, "Can't recreate tables after nuking version %@: %@", v7);
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21361D000, v0, v1, "Successfully opened SmartFolder Database %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.2()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Opening the SmartFolder Database failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.3()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Failed to create directory hierarchy with error: %@.", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21361D000, v0, v1, "Opening SmartFolder Database at %@", v2, v3, v4, v5, v6);
}

void __61__DOCSmartFolderDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Prequelite failed, but did not indicate what the error was! Since we received error %lu before, using that.", v2, v3, v4, v5, v6);
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Failed to acquire background assertion: %@", v2, v3, v4, v5, v6);
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21361D000, v0, v1, "Batching starts, acquiring a task assertion", v2, v3, v4, v5, v6);
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_180_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21361D000, v0, v1, "Batching ended, invalidating the task assertion", v2, v3, v4, v5, v6);
}

void __48__DOCSmartFolderDatabase__setUpDatabaseWatcher___block_invoke_181_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "Someone removed our database under our feet", v2, v3, v4, v5, v6);
}

- (void)_setupDatabaseTablesIfNeeded:(void *)a1 error:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6() lastError];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v1, v4, "Hit error %@, closing connection %@", v5);
}

- (void)_setupDatabaseTablesIfNeeded:error:.cold.2()
{
  __assert_rtn("-[DOCSmartFolderDatabase _setupDatabaseTablesIfNeeded:error:]", "DOCSmartFolderDatabase.m", 993, "(connection.userVersion.unsignedIntValue >= DOCSmartFolderDatabaseVersionMax) || !result");
}

- (void)_setupDatabaseTablesIfNeeded:(int)a1 error:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2[0] = 67109632;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 0;
  __int16 v5 = 1024;
  int v6 = 1;
  _os_log_debug_impl(&dword_21361D000, a2, OS_LOG_TYPE_DEBUG, "No database migration (db at version %d, migration range [%d,%d[)", (uint8_t *)v2, 0x14u);
}

- (void)_setupDatabaseTablesIfNeeded:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21361D000, v0, v1, "Upgrading SmartFolder Database %@", v2, v3, v4, v5, v6);
}

void __61__DOCSmartFolderDatabase__setupDatabaseTablesIfNeeded_error___block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = *a1 + 1;
  v5[0] = 67109634;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21361D000, log, OS_LOG_TYPE_ERROR, "Can't migrate from version %d to %d: %@", (uint8_t *)v5, 0x18u);
}

- (void)_closeDatabaseOnItsQueue:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v1, (uint64_t)v1, "Could not close SmartFolder Database %@: %@", (uint8_t *)&v2);
}

- (void)_resetDatabaseOnItsQueue:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21361D000, v0, v1, "%@: re-opening database", v2, v3, v4, v5, v6);
}

- (void)_resetDatabaseOnItsQueue:.cold.2()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  int v2 = 138412546;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v1, (uint64_t)v1, "Can't remove database at URL %@: %@", (uint8_t *)&v2);
}

- (void)_resetDatabaseOnItsQueue:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21361D000, v0, v1, "%@: Removing file", v2, v3, v4, v5, v6);
}

- (void)logError:(uint64_t)a1 onDB:statement:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_0(&dword_21361D000, v1, (uint64_t)v1, "Sqlite failed on %@ with error [%@]", (uint8_t *)&v2);
}

@end