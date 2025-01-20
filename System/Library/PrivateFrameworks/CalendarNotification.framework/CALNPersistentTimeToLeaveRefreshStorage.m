@interface CALNPersistentTimeToLeaveRefreshStorage
+ (id)persistentStorageWithPath:(id)a3;
+ (id)timeToLeaveRefreshDataFromPersistentStorageWithPath:(id)a3 error:(id *)a4;
- (BOOL)_loadDataWithError:(id *)a3;
- (BOOL)_saveDataWithError:(id *)a3;
- (CALNInMemoryTimeToLeaveRefreshStorage)inMemoryStorage;
- (CALNPersistentTimeToLeaveRefreshStorage)initWithPath:(id)a3;
- (NSString)path;
- (OS_dispatch_queue)workQueue;
- (id)refreshDateWithIdentifier:(id)a3;
- (id)refreshDates;
- (void)_addRefreshDate:(id)a3 withIdentifier:(id)a4;
- (void)_removeData;
- (void)_removeRefreshDateWithIdentifier:(id)a3;
- (void)addRefreshDate:(id)a3 withIdentifier:(id)a4;
- (void)removeRefreshDateWithIdentifier:(id)a3;
- (void)removeRefreshDates;
@end

@implementation CALNPersistentTimeToLeaveRefreshStorage

+ (id)persistentStorageWithPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];
  v6 = [v5 workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke;
  v12[3] = &unk_2645C0DC0;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(v6, v12);

  v9 = v14;
  id v10 = v7;

  return v10;
}

void __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  int v5 = [v2 fileExistsAtPath:v4];

  v6 = (void *)v3[1];
  if (v5)
  {
    id v17 = 0;
    char v7 = [v6 _loadDataWithError:&v17];
    id v8 = v17;
    v9 = +[CALNLogSubsystem defaultCategory];
    id v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *v3;
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v11;
        v12 = "Time to Leave refresh storage file loaded from path %{public}@.";
LABEL_8:
        _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke_cold_1(v3);
    }
  }
  else
  {
    id v16 = 0;
    char v13 = [v6 _saveDataWithError:&v16];
    id v8 = v16;
    id v14 = +[CALNLogSubsystem defaultCategory];
    id v10 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *v3;
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v15;
        v12 = "Time to Leave refresh storage file did not exist at path = %{public}@. Created a new file.";
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke_cold_2(v3);
    }
  }
}

+ (id)timeToLeaveRefreshDataFromPersistentStorageWithPath:(id)a3 error:(id *)a4
{
  uint64_t v5 = timeToLeaveRefreshDataFromPersistentStorageWithPath_error__onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&timeToLeaveRefreshDataFromPersistentStorageWithPath_error__onceToken, &__block_literal_global_24);
  }
  char v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];

  id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:timeToLeaveRefreshDataFromPersistentStorageWithPath_error__allowedClasses fromData:v7 error:a4];

  return v8;
}

void __101__CALNPersistentTimeToLeaveRefreshStorage_timeToLeaveRefreshDataFromPersistentStorageWithPath_error___block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v3 = (void *)timeToLeaveRefreshDataFromPersistentStorageWithPath_error__allowedClasses;
  timeToLeaveRefreshDataFromPersistentStorageWithPath_error__allowedClasses = v2;
}

- (CALNPersistentTimeToLeaveRefreshStorage)initWithPath:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CALNPersistentTimeToLeaveRefreshStorage;
  uint64_t v5 = [(CALNPersistentTimeToLeaveRefreshStorage *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    uint64_t v8 = objc_opt_new();
    inMemoryStorage = v5->_inMemoryStorage;
    v5->_inMemoryStorage = (CALNInMemoryTimeToLeaveRefreshStorage *)v8;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v10 = objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (const char *)[v10 UTF8String];

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v13;
  }
  return v5;
}

- (id)refreshDates
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__8;
  uint64_t v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  v3 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CALNPersistentTimeToLeaveRefreshStorage_refreshDates__block_invoke;
  v6[3] = &unk_2645C0FA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__CALNPersistentTimeToLeaveRefreshStorage_refreshDates__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) inMemoryStorage];
  uint64_t v2 = [v5 refreshDates];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addRefreshDate:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CALNPersistentTimeToLeaveRefreshStorage_addRefreshDate_withIdentifier___block_invoke;
  block[3] = &unk_2645C0E60;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __73__CALNPersistentTimeToLeaveRefreshStorage_addRefreshDate_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRefreshDate:*(void *)(a1 + 40) withIdentifier:*(void *)(a1 + 48)];
}

- (id)refreshDateWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8;
  objc_super v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  id v5 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CALNPersistentTimeToLeaveRefreshStorage_refreshDateWithIdentifier___block_invoke;
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

void __69__CALNPersistentTimeToLeaveRefreshStorage_refreshDateWithIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) inMemoryStorage];
  uint64_t v2 = [v5 refreshDateWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeRefreshDateWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__CALNPersistentTimeToLeaveRefreshStorage_removeRefreshDateWithIdentifier___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __75__CALNPersistentTimeToLeaveRefreshStorage_removeRefreshDateWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeRefreshDateWithIdentifier:*(void *)(a1 + 40)];
}

- (void)removeRefreshDates
{
  uint64_t v3 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CALNPersistentTimeToLeaveRefreshStorage_removeRefreshDates__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __61__CALNPersistentTimeToLeaveRefreshStorage_removeRefreshDates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeData];
}

- (void)_addRefreshDate:(id)a3 withIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(CALNPersistentTimeToLeaveRefreshStorage *)self inMemoryStorage];
  [(id)v9 addRefreshDate:v6 withIdentifier:v7];

  id v12 = 0;
  LOBYTE(v9) = [(CALNPersistentTimeToLeaveRefreshStorage *)self _saveDataWithError:&v12];
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
      _os_log_error_impl(&dword_2216BB000, v11, OS_LOG_TYPE_ERROR, "Could not save time to leave refresh date. error = %{public}@, identifier = %{public}@, data = %@", buf, 0x20u);
    }
  }
}

- (void)_removeRefreshDateWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(CALNPersistentTimeToLeaveRefreshStorage *)self inMemoryStorage];
  [(id)v6 removeRefreshDateWithIdentifier:v4];

  id v9 = 0;
  LOBYTE(v6) = [(CALNPersistentTimeToLeaveRefreshStorage *)self _saveDataWithError:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    id v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CALNPersistentTimeToLeaveRefreshStorage *)(uint64_t)v7 _removeRefreshDateWithIdentifier:v8];
    }
  }
}

- (void)_removeData
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not save after removing time to leave refresh dates. error = %{public}@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)_loadDataWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = objc_opt_class();
  id v7 = [(CALNPersistentTimeToLeaveRefreshStorage *)self path];
  id v8 = [v6 timeToLeaveRefreshDataFromPersistentStorageWithPath:v7 error:a3];

  if (v8)
  {
    id v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v8 count];
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Loaded time to leave refresh timer dates, count = %lu", buf, 0xCu);
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__CALNPersistentTimeToLeaveRefreshStorage__loadDataWithError___block_invoke;
    v11[3] = &unk_2645C15D8;
    v11[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
  }

  return v8 != 0;
}

void __62__CALNPersistentTimeToLeaveRefreshStorage__loadDataWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 inMemoryStorage];
  [v7 addRefreshDate:v5 withIdentifier:v6];
}

- (BOOL)_saveDataWithError:(id *)a3
{
  id v5 = [(CALNPersistentTimeToLeaveRefreshStorage *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CALNPersistentTimeToLeaveRefreshStorage *)self inMemoryStorage];
  id v7 = [v6 refreshDates];

  id v17 = 0;
  id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v17];
  id v9 = v17;
  if (v8)
  {
    id v10 = [(CALNPersistentTimeToLeaveRefreshStorage *)self path];
    id v16 = v9;
    char v11 = [v8 writeToFile:v10 options:268435457 error:&v16];
    id v12 = v16;

    if (v11)
    {
      BOOL v13 = 1;
      if (!a3) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v14 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(CALNPersistentTimeToLeaveRefreshStorage *)self _saveDataWithError:v14];
    }
    id v9 = v12;
  }
  else
  {
    uint64_t v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CALNPersistentTimeToLeaveRefreshStorage _saveDataWithError:]((uint64_t)v7);
    }
  }

  BOOL v13 = 0;
  id v12 = v9;
  if (a3) {
LABEL_11:
  }
    *a3 = v12;
LABEL_12:

  return v13;
}

- (NSString)path
{
  return self->_path;
}

- (CALNInMemoryTimeToLeaveRefreshStorage)inMemoryStorage
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

void __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Couldn't read existing persistent time to leave refresh storage at path %{public}@. Will proceed anyway, which may mean contents will be overwritten. Error: %@", (void)v3, DWORD2(v3));
}

void __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke_cold_2(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Time to leave refresh storage file did not exist at path = %{public}@. Creating a new file FAILED with error: %@", (void)v3, DWORD2(v3));
}

- (void)_removeRefreshDateWithIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, a2, a3, "Could not save after removing time to leave refresh date. error = %{public}@, identifier = %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_saveDataWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v1, v2, "Error archiving time to leave refresh dates (%@). error = %@", (void)v3, DWORD2(v3));
}

- (void)_saveDataWithError:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 path];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2216BB000, a3, OS_LOG_TYPE_ERROR, "Error writing archived data to path = %{public}@, error = %@", (uint8_t *)&v6, 0x16u);
}

@end