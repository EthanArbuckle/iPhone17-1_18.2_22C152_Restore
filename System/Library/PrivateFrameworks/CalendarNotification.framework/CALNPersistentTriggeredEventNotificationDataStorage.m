@interface CALNPersistentTriggeredEventNotificationDataStorage
+ (id)notificationDataFromPersistentStorageWithPath:(id)a3 error:(id *)a4;
+ (id)persistentStorageWithPath:(id)a3 isProtectedStorage:(BOOL)a4;
- (BOOL)_loadDataWithError:(id *)a3;
- (BOOL)_saveDataWithError:(id *)a3;
- (CALNInMemoryTriggeredEventNotificationDataStorage)inMemoryStorage;
- (CALNPersistentTriggeredEventNotificationDataStorage)initWithPath:(id)a3 isProtectedStorage:(BOOL)a4;
- (NSString)path;
- (OS_dispatch_queue)workQueue;
- (id)notificationData;
- (id)notificationDataWithIdentifier:(id)a3;
- (void)_addNotificationData:(id)a3 withIdentifier:(id)a4;
- (void)_removeData;
- (void)_removeNotificationDataWithIdentifier:(id)a3;
- (void)addNotificationData:(id)a3 withIdentifier:(id)a4;
- (void)removeNotificationData;
- (void)removeNotificationDataWithIdentifier:(id)a3;
@end

@implementation CALNPersistentTriggeredEventNotificationDataStorage

+ (id)persistentStorageWithPath:(id)a3 isProtectedStorage:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithPath:v6 isProtectedStorage:v4];
  v8 = [v7 workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __100__CALNPersistentTriggeredEventNotificationDataStorage_persistentStorageWithPath_isProtectedStorage___block_invoke;
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

void __100__CALNPersistentTriggeredEventNotificationDataStorage_persistentStorageWithPath_isProtectedStorage___block_invoke(uint64_t a1)
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
    char v7 = [v6 _loadDataWithError:&v17];
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
        id v12 = "Triggered event notification storage file loaded from path %{public}@.";
LABEL_8:
        _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __100__CALNPersistentTriggeredEventNotificationDataStorage_persistentStorageWithPath_isProtectedStorage___block_invoke_cold_1(v3);
    }
  }
  else
  {
    id v16 = 0;
    char v13 = [v6 _saveDataWithError:&v16];
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
        id v12 = "Triggered event notificationß storage file did not exist at path = %{public}@. Created a new file.";
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __100__CALNPersistentTriggeredEventNotificationDataStorage_persistentStorageWithPath_isProtectedStorage___block_invoke_cold_2(v3);
    }
  }
}

+ (id)notificationDataFromPersistentStorageWithPath:(id)a3 error:(id *)a4
{
  uint64_t v5 = notificationDataFromPersistentStorageWithPath_error__onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&notificationDataFromPersistentStorageWithPath_error__onceToken, &__block_literal_global_26);
  }
  char v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];

  id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:notificationDataFromPersistentStorageWithPath_error__allowedClasses fromData:v7 error:a4];

  return v8;
}

void __107__CALNPersistentTriggeredEventNotificationDataStorage_notificationDataFromPersistentStorageWithPath_error___block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v3 = (void *)notificationDataFromPersistentStorageWithPath_error__allowedClasses;
  notificationDataFromPersistentStorageWithPath_error__allowedClasses = v2;
}

- (CALNPersistentTriggeredEventNotificationDataStorage)initWithPath:(id)a3 isProtectedStorage:(BOOL)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CALNPersistentTriggeredEventNotificationDataStorage;
  uint64_t v7 = [(CALNPersistentTriggeredEventNotificationDataStorage *)&v18 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    path = v7->_path;
    v7->_path = (NSString *)v8;

    v7->_protected = a4;
    uint64_t v10 = objc_opt_new();
    inMemoryStorage = v7->_inMemoryStorage;
    v7->_inMemoryStorage = (CALNInMemoryTriggeredEventNotificationDataStorage *)v10;

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

- (id)notificationData
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__10;
  uint64_t v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  v3 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__CALNPersistentTriggeredEventNotificationDataStorage_notificationData__block_invoke;
  v6[3] = &unk_2645C0FA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __71__CALNPersistentTriggeredEventNotificationDataStorage_notificationData__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) inMemoryStorage];
  uint64_t v2 = [v5 notificationData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addNotificationData:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__CALNPersistentTriggeredEventNotificationDataStorage_addNotificationData_withIdentifier___block_invoke;
  block[3] = &unk_2645C0E60;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __90__CALNPersistentTriggeredEventNotificationDataStorage_addNotificationData_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addNotificationData:*(void *)(a1 + 40) withIdentifier:*(void *)(a1 + 48)];
}

- (id)notificationDataWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = __Block_byref_object_copy__10;
  id v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  id v5 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CALNPersistentTriggeredEventNotificationDataStorage_notificationDataWithIdentifier___block_invoke;
  block[3] = &unk_2645C0E10;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __86__CALNPersistentTriggeredEventNotificationDataStorage_notificationDataWithIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) inMemoryStorage];
  uint64_t v2 = [v5 notificationDataWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeNotificationDataWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__CALNPersistentTriggeredEventNotificationDataStorage_removeNotificationDataWithIdentifier___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __92__CALNPersistentTriggeredEventNotificationDataStorage_removeNotificationDataWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeNotificationDataWithIdentifier:*(void *)(a1 + 40)];
}

- (void)removeNotificationData
{
  uint64_t v3 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CALNPersistentTriggeredEventNotificationDataStorage_removeNotificationData__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __77__CALNPersistentTriggeredEventNotificationDataStorage_removeNotificationData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeData];
}

- (void)_addNotificationData:(id)a3 withIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self inMemoryStorage];
  [(id)v9 addNotificationData:v6 withIdentifier:v7];

  id v12 = 0;
  LOBYTE(v9) = [(CALNPersistentTriggeredEventNotificationDataStorage *)self _saveDataWithError:&v12];
  id v10 = v12;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v14 = v10;
      __int16 v15 = 2114;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_2216BB000, v11, OS_LOG_TYPE_ERROR, "Could not save notification data. error = %{public}@, identifier = %{public}@, data = %@", buf, 0x20u);
    }
  }
}

- (void)_removeNotificationDataWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self inMemoryStorage];
  [(id)v6 removeNotificationDataWithIdentifier:v4];

  id v9 = 0;
  LOBYTE(v6) = [(CALNPersistentTriggeredEventNotificationDataStorage *)self _saveDataWithError:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    id v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CALNPersistentTriggeredEventNotificationDataStorage *)(uint64_t)v7 _removeNotificationDataWithIdentifier:v8];
    }
  }
}

- (void)_removeData
{
  uint64_t v3 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self inMemoryStorage];
  [(id)v4 removeNotificationData];

  id v7 = 0;
  LOBYTE(v4) = [(CALNPersistentTriggeredEventNotificationDataStorage *)self _saveDataWithError:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CALNPersistentTimeToLeaveRefreshStorage *)(uint64_t)v5 _removeData];
    }
  }
}

- (BOOL)_loadDataWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = objc_opt_class();
  id v7 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self path];
  id v8 = [v6 notificationDataFromPersistentStorageWithPath:v7 error:a3];

  if (v8)
  {
    id v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v8 count];
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Loaded notification meta data, count = %lu", buf, 0xCu);
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__CALNPersistentTriggeredEventNotificationDataStorage__loadDataWithError___block_invoke;
    v11[3] = &unk_2645C18D0;
    v11[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
  }

  return v8 != 0;
}

void __74__CALNPersistentTriggeredEventNotificationDataStorage__loadDataWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 inMemoryStorage];
  [v7 addNotificationData:v5 withIdentifier:v6];
}

- (BOOL)_saveDataWithError:(id *)a3
{
  id v5 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self inMemoryStorage];
  id v7 = [v6 notificationData];

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
    uint64_t v11 = [(CALNPersistentTriggeredEventNotificationDataStorage *)self path];
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
    __int16 v15 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(CALNPersistentTimeToLeaveRefreshStorage *)self _saveDataWithError:v15];
    }
    id v9 = v13;
  }
  else
  {
    __int16 v15 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CALNPersistentTriggeredEventNotificationDataStorage _saveDataWithError:]((uint64_t)v7);
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

- (CALNInMemoryTriggeredEventNotificationDataStorage)inMemoryStorage
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

void __100__CALNPersistentTriggeredEventNotificationDataStorage_persistentStorageWithPath_isProtectedStorage___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Couldn't read existing persistent triggered event notification storage at path %{public}@. Will proceed anyway, which may mean contents will be overwritten. Error: %@", (void)v3, DWORD2(v3));
}

void __100__CALNPersistentTriggeredEventNotificationDataStorage_persistentStorageWithPath_isProtectedStorage___block_invoke_cold_2(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Triggered event notification storage file did not exist at path = %{public}@. Creating a new file FAILED with error: %@", (void)v3, DWORD2(v3));
}

- (void)_removeNotificationDataWithIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, a2, a3, "Could not save after removing notification data. error = %{public}@, identifier = %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_saveDataWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Error archiving notification data (%@). error = %@", (void)v3, DWORD2(v3));
}

@end