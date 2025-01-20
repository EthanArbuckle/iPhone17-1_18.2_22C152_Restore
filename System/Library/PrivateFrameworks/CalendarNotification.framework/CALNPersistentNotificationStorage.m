@interface CALNPersistentNotificationStorage
+ (id)notificationRecordsFromPersistentNotificationStorageWithPath:(id)a3 error:(id *)a4;
+ (id)persistentNotificationStorageWithPath:(id)a3 isProtectedStorage:(BOOL)a4;
- (BOOL)_loadNotificationsWithError:(id *)a3;
- (BOOL)_saveNotificationsWithError:(id *)a3;
- (CALNInMemoryNotificationStorage)inMemoryStorage;
- (CALNPersistentNotificationStorage)initWithPath:(id)a3 isProtectedStorage:(BOOL)a4;
- (NSString)path;
- (OS_dispatch_queue)workQueue;
- (id)notificationRecords;
- (void)addNotificationRecord:(id)a3;
- (void)addNotificationRecords:(id)a3;
- (void)removeAllNotificationRecords;
- (void)removeNotificationRecordsPassingTest:(id)a3;
@end

@implementation CALNPersistentNotificationStorage

+ (id)persistentNotificationStorageWithPath:(id)a3 isProtectedStorage:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithPath:v6 isProtectedStorage:v4];
  v8 = [v7 workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke;
  v14[3] = &unk_2645C0DC0;
  id v15 = v6;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  dispatch_sync(v8, v14);

  v11 = v16;
  id v12 = v9;

  return v12;
}

void __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  int v5 = [v2 fileExistsAtPath:v4];

  id v6 = (void *)v3[1];
  if (v5)
  {
    id v17 = 0;
    char v7 = [v6 _loadNotificationsWithError:&v17];
    id v8 = v17;
    id v9 = +[CALNLogSubsystem defaultCategory];
    id v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *v3;
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v11;
        id v12 = "Persistent notification storage file loaded from path %{public}@.";
LABEL_8:
        _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke_cold_1(v3);
    }
  }
  else
  {
    id v16 = 0;
    char v13 = [v6 _saveNotificationsWithError:&v16];
    id v8 = v16;
    v14 = +[CALNLogSubsystem defaultCategory];
    id v10 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *v3;
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v15;
        id v12 = "Notification storage file did not exist at path = %{public}@. Created a new file.";
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke_cold_2(v3);
    }
  }
}

+ (id)notificationRecordsFromPersistentNotificationStorageWithPath:(id)a3 error:(id *)a4
{
  uint64_t v5 = notificationRecordsFromPersistentNotificationStorageWithPath_error__onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&notificationRecordsFromPersistentNotificationStorageWithPath_error__onceToken, &__block_literal_global_8);
  }
  char v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];

  id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:notificationRecordsFromPersistentNotificationStorageWithPath_error__allowedClasses fromData:v7 error:a4];

  return v8;
}

void __104__CALNPersistentNotificationStorage_notificationRecordsFromPersistentNotificationStorageWithPath_error___block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)notificationRecordsFromPersistentNotificationStorageWithPath_error__allowedClasses;
  notificationRecordsFromPersistentNotificationStorageWithPath_error__allowedClasses = v2;
}

- (CALNPersistentNotificationStorage)initWithPath:(id)a3 isProtectedStorage:(BOOL)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CALNPersistentNotificationStorage;
  char v7 = [(CALNPersistentNotificationStorage *)&v18 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    path = v7->_path;
    v7->_path = (NSString *)v8;

    v7->_protected = a4;
    uint64_t v10 = objc_opt_new();
    inMemoryStorage = v7->_inMemoryStorage;
    v7->_inMemoryStorage = (CALNInMemoryNotificationStorage *)v10;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v12 = objc_claimAutoreleasedReturnValue();
    char v13 = (const char *)[v12 UTF8String];

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v15;
  }
  return v7;
}

- (void)addNotificationRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CALNPersistentNotificationStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CALNPersistentNotificationStorage_addNotificationRecord___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __59__CALNPersistentNotificationStorage_addNotificationRecord___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inMemoryStorage];
  [v2 addNotificationRecord:*(void *)(a1 + 40)];

  v3 = *(void **)(a1 + 32);
  return [v3 _saveNotificationsWithError:0];
}

- (void)addNotificationRecords:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CALNPersistentNotificationStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CALNPersistentNotificationStorage_addNotificationRecords___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __60__CALNPersistentNotificationStorage_addNotificationRecords___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inMemoryStorage];
  [v2 addNotificationRecords:*(void *)(a1 + 40)];

  v3 = *(void **)(a1 + 32);
  return [v3 _saveNotificationsWithError:0];
}

- (id)notificationRecords
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v3 = [(CALNPersistentNotificationStorage *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__CALNPersistentNotificationStorage_notificationRecords__block_invoke;
  v6[3] = &unk_2645C0FA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__CALNPersistentNotificationStorage_notificationRecords__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) inMemoryStorage];
  uint64_t v2 = [v5 notificationRecords];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeNotificationRecordsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNPersistentNotificationStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__CALNPersistentNotificationStorage_removeNotificationRecordsPassingTest___block_invoke;
  v7[3] = &unk_2645C0FD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __74__CALNPersistentNotificationStorage_removeNotificationRecordsPassingTest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inMemoryStorage];
  [v2 removeNotificationRecordsPassingTest:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _saveNotificationsWithError:0];
}

- (void)removeAllNotificationRecords
{
  uint64_t v3 = [(CALNPersistentNotificationStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CALNPersistentNotificationStorage_removeAllNotificationRecords__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __65__CALNPersistentNotificationStorage_removeAllNotificationRecords__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inMemoryStorage];
  [v2 removeAllNotificationRecords];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _saveNotificationsWithError:0];
}

- (BOOL)_loadNotificationsWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = [(CALNPersistentNotificationStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_opt_class();
  uint64_t v7 = [(CALNPersistentNotificationStorage *)self path];
  id v8 = [v6 notificationRecordsFromPersistentNotificationStorageWithPath:v7 error:a3];

  if (v8)
  {
    uint64_t v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = [v8 count];
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Loaded notification records, count = %lu", buf, 0xCu);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
          id v16 = [(CALNPersistentNotificationStorage *)self inMemoryStorage];
          [v16 addNotificationRecord:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  return v8 != 0;
}

- (BOOL)_saveNotificationsWithError:(id *)a3
{
  id v5 = [(CALNPersistentNotificationStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CALNPersistentNotificationStorage *)self inMemoryStorage];
  uint64_t v7 = [v6 notificationRecords];

  id v18 = 0;
  id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v18];
  id v9 = v18;
  if (v8)
  {
    if (self->_protected) {
      uint64_t v10 = 1073741825;
    }
    else {
      uint64_t v10 = 268435457;
    }
    uint64_t v11 = [(CALNPersistentNotificationStorage *)self path];
    id v17 = v9;
    char v12 = [v8 writeToFile:v11 options:v10 error:&v17];
    id v13 = v17;

    if (v12)
    {
      BOOL v14 = 1;
      if (!a3) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    uint64_t v15 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(CALNPersistentNotificationStorage *)self _saveNotificationsWithError:v15];
    }
    id v9 = v13;
  }
  else
  {
    uint64_t v15 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CALNPersistentNotificationStorage _saveNotificationsWithError:]((uint64_t)v7);
    }
  }

  BOOL v14 = 0;
  id v13 = v9;
  if (a3) {
LABEL_14:
  }
    *a3 = v13;
LABEL_15:

  return v14;
}

- (NSString)path
{
  return self->_path;
}

- (CALNInMemoryNotificationStorage)inMemoryStorage
{
  return self->_inMemoryStorage;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inMemoryStorage, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Couldn't read existing persistent notification storage at path %{public}@. Will proceed anyway, which may mean contents will be overwritten. Error: %@", (void)v3, DWORD2(v3));
}

void __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke_cold_2(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Notification storage file did not exist at path = %{public}@. Creating a new file FAILED with error: %@", (void)v3, DWORD2(v3));
}

- (void)_saveNotificationsWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Error archiving notifications (%@). error = %@", (void)v3, DWORD2(v3));
}

- (void)_saveNotificationsWithError:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 path];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2216BB000, a3, OS_LOG_TYPE_ERROR, "Error writing archived notifications to path = %{public}@, error = %@", (uint8_t *)&v6, 0x16u);
}

@end