@interface CALNNotificationServer
- (BOOL)isActive;
- (BOOL)isProtectedDataAvailable;
- (CALNAnalyticsHandler)analyticsHandler;
- (CALNNotificationServer)initWithUserNotificationCenter:(id)a3 storage:(id)a4 analyticsHandler:(id)a5 deviceLockObserver:(id)a6;
- (CALNNotificationStorage)storage;
- (CALNUserNotificationCenter)userNotificationCenter;
- (NSArray)notificationSources;
- (NSMutableDictionary)notificationSourceMap;
- (OS_dispatch_queue)workQueue;
- (id)_fetchRecordsWithSourceIdentifier:(id)a3;
- (id)_notificationRecordResponseFromNotificationResponse:(id)a3;
- (id)_notificationRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4;
- (id)_notificationSourceMapWithNotificationSources:(id)a3;
- (id)fetchRecordsWithSourceIdentifier:(id)a3;
- (id)notificationSourceForSourceIdentifier:(id)a3;
- (void)_activate;
- (void)_addRecord:(id)a3;
- (void)_deactivate;
- (void)_didSetNotificationSources:(id)a3;
- (void)_removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4;
- (void)_updateRecord:(id)a3;
- (void)aboutToPostNotification:(id)a3;
- (void)activate;
- (void)addRecord:(id)a3;
- (void)deactivate;
- (void)protectedDataDidBecomeAvailable;
- (void)removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setIsProtectedDataAvailable:(BOOL)a3;
- (void)setNotificationSourceMap:(id)a3;
- (void)setNotificationSources:(id)a3;
- (void)setStorage:(id)a3;
- (void)updateRecord:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CALNNotificationServer

- (CALNNotificationServer)initWithUserNotificationCenter:(id)a3 storage:(id)a4 analyticsHandler:(id)a5 deviceLockObserver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CALNNotificationServer;
  v15 = [(CALNNotificationServer *)&v25 init];
  if (v15)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v16 = objc_claimAutoreleasedReturnValue();
    v17 = (const char *)[v16 UTF8String];

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v15->_userNotificationCenter, a3);
    v21 = [(CALNNotificationServer *)v15 userNotificationCenter];
    [v21 setDelegate:v15];

    objc_storeStrong((id *)&v15->_storage, a4);
    objc_storeStrong((id *)&v15->_analyticsHandler, a5);
    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    notificationSourceMap = v15->_notificationSourceMap;
    v15->_notificationSourceMap = (NSMutableDictionary *)v22;

    v15->_isProtectedDataAvailable = [v14 hasBeenUnlockedSinceBoot];
  }

  return v15;
}

- (id)_notificationSourceMapWithNotificationSources:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "sourceIdentifier", (void)v14);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[v4 copy];
  return v12;
}

- (void)activate
{
  id v3 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Requesting activation.", buf, 2u);
  }

  v4 = [(CALNNotificationServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CALNNotificationServer_activate__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v4, block);
}

uint64_t __34__CALNNotificationServer_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  id v3 = [(CALNNotificationServer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CALNNotificationServer *)self isActive];
  id v5 = +[CALNLogSubsystem defaultCategory];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      __int16 v12 = 0;
      uint64_t v7 = "Cannot activate server since it is already active.";
      uint64_t v8 = (uint8_t *)&v12;
LABEL_8:
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Activating.", buf, 2u);
    }

    v9 = [(CALNNotificationServer *)self userNotificationCenter];
    [v9 activate];

    [(CALNNotificationServer *)self setActive:1];
    id v5 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      uint64_t v7 = "Activated.";
      uint64_t v8 = (uint8_t *)&v10;
      goto LABEL_8;
    }
  }
}

- (void)deactivate
{
  id v3 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Requesting deactivation.", buf, 2u);
  }

  BOOL v4 = [(CALNNotificationServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CALNNotificationServer_deactivate__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v4, block);
}

uint64_t __36__CALNNotificationServer_deactivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

- (void)_deactivate
{
  id v3 = [(CALNNotificationServer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CALNNotificationServer *)self isActive];
  id v5 = +[CALNLogSubsystem defaultCategory];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Deactivating.", buf, 2u);
    }

    uint64_t v7 = [(CALNNotificationServer *)self userNotificationCenter];
    [v7 deactivate];

    [(CALNNotificationServer *)self setActive:0];
    id v5 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      uint64_t v8 = "Deactivated.";
      v9 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)__int16 v12 = 0;
    uint64_t v8 = "Cannot deactivate server since it is already inactive.";
    v9 = v12;
    goto LABEL_8;
  }
}

- (void)setNotificationSources:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Setting notification sources: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(CALNNotificationServer *)self _notificationSourceMapWithNotificationSources:v4];
  uint64_t v7 = (void *)[v6 mutableCopy];
  [(CALNNotificationServer *)self setNotificationSourceMap:v7];

  [(CALNNotificationServer *)self _didSetNotificationSources:v4];
}

- (void)_didSetNotificationSources:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Did set notification sources: %{public}@", buf, 0xCu);
  }

  BOOL v6 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Getting notification categories from notification sources: %{public}@.", buf, 0xCu);
  }

  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__CALNNotificationServer__didSetNotificationSources___block_invoke;
  v11[3] = &unk_2645C0DE8;
  id v12 = v7;
  id v8 = v7;
  [v4 enumerateObjectsUsingBlock:v11];
  id v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
  uint64_t v10 = [(CALNNotificationServer *)self userNotificationCenter];
  [v10 setNotificationCategories:v9];
}

void __53__CALNNotificationServer__didSetNotificationSources___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 categories];
  [v2 addObjectsFromArray:v3];
}

- (NSArray)notificationSources
{
  v2 = [(CALNNotificationServer *)self notificationSourceMap];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)notificationSourceForSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNNotificationServer *)self notificationSourceMap];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)protectedDataDidBecomeAvailable
{
}

- (id)fetchRecordsWithSourceIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Requesting fetching records with source identifier: %@.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  long long v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  BOOL v6 = [(CALNNotificationServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CALNNotificationServer_fetchRecordsWithSourceIdentifier___block_invoke;
  block[3] = &unk_2645C0E10;
  id v11 = v4;
  p_long long buf = &buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v8;
}

uint64_t __59__CALNNotificationServer_fetchRecordsWithSourceIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _fetchRecordsWithSourceIdentifier:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (id)_fetchRecordsWithSourceIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNNotificationServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Fetching records with source identifier: %@.", buf, 0xCu);
  }

  id v7 = [(CALNNotificationServer *)self storage];
  id v8 = [v7 notificationRecords];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__CALNNotificationServer__fetchRecordsWithSourceIdentifier___block_invoke;
  v14[3] = &unk_2645C0E38;
  id v9 = v4;
  id v15 = v9;
  uint64_t v10 = [v8 indexesOfObjectsPassingTest:v14];
  id v11 = [v8 objectsAtIndexes:v10];

  id v12 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "Fetched records with source identifier: %{public}@. Fetched records: %@.", buf, 0x16u);
  }

  return v11;
}

uint64_t __60__CALNNotificationServer__fetchRecordsWithSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sourceIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)addRecord:(id)a3
{
  id v4 = a3;
  [(CALNNotificationServer *)self aboutToPostNotification:v4];
  id v5 = [(CALNNotificationServer *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__CALNNotificationServer_addRecord___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __36__CALNNotificationServer_addRecord___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRecord:*(void *)(a1 + 40)];
}

- (void)_addRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNNotificationServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 sourceIdentifier];
    id v8 = [v4 sourceClientIdentifier];
    *(_DWORD *)long long buf = 138543618;
    v21 = v7;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Adding record with source identifier = %{public}@, source client identifier = %{public}@", buf, 0x16u);
  }
  id v9 = +[CALNNotificationMapper notificationRequestFromNotificationRecord:v4];
  uint64_t v10 = [(CALNNotificationServer *)self analyticsHandler];
  id v11 = [(CALNNotificationServer *)self userNotificationCenter];
  id v19 = 0;
  char v12 = [v11 addNotificationRequest:v9 error:&v19];
  id v13 = v19;

  uint64_t v14 = +[CALNLogSubsystem defaultCategory];
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v9 identifier];
      *(_DWORD *)long long buf = 138543618;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "Added notification request, identifier = %{public}@, request = %@.", buf, 0x16u);
    }
    [v10 recordPostedNotification:v4];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v4 sourceIdentifier];
      __int16 v18 = [v4 sourceClientIdentifier];
      *(_DWORD *)long long buf = 138544130;
      v21 = v17;
      __int16 v22 = 2114;
      v23 = v18;
      __int16 v24 = 2112;
      id v25 = v13;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_2216BB000, v15, OS_LOG_TYPE_ERROR, "Error adding notification request. Source identifier = %{public}@, Source client identifier = %{public}@, error = %@, request = %@.", buf, 0x2Au);
    }
  }
}

- (void)updateRecord:(id)a3
{
  id v4 = a3;
  [(CALNNotificationServer *)self aboutToPostNotification:v4];
  id v5 = [(CALNNotificationServer *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__CALNNotificationServer_updateRecord___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __39__CALNNotificationServer_updateRecord___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRecord:*(void *)(a1 + 40)];
}

- (void)_updateRecord:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNNotificationServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 sourceIdentifier];
    id v8 = [v4 sourceClientIdentifier];
    *(_DWORD *)long long buf = 138543618;
    id v19 = v7;
    __int16 v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Updating record with source identifier = %{public}@, source client identifier = %{public}@", buf, 0x16u);
  }
  id v9 = +[CALNNotificationMapper notificationRequestFromNotificationRecord:v4];
  uint64_t v10 = [(CALNNotificationServer *)self userNotificationCenter];
  id v17 = 0;
  char v11 = [v10 replaceNotificationRequest:v9 error:&v17];
  id v12 = v17;

  id v13 = +[CALNLogSubsystem defaultCategory];
  uint64_t v14 = v13;
  if ((v11 & 1) == 0)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    id v15 = [v4 sourceIdentifier];
    long long v16 = [v4 sourceClientIdentifier];
    *(_DWORD *)long long buf = 138544130;
    id v19 = v15;
    __int16 v20 = 2114;
    v21 = v16;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_error_impl(&dword_2216BB000, v14, OS_LOG_TYPE_ERROR, "Error replacing notification request. Source identifier = %{public}@, Source client identifier = %{public}@, error = %@, request = %@.", buf, 0x2Au);

    goto LABEL_6;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v9 identifier];
    *(_DWORD *)long long buf = 138543618;
    id v19 = v15;
    __int16 v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "Replaced notification request, identifier = %{public}@, request = %@.", buf, 0x16u);
LABEL_6:
  }
LABEL_8:
}

- (void)aboutToPostNotification:(id)a3
{
  id v6 = a3;
  id v4 = [v6 sourceIdentifier];
  id v5 = [(CALNNotificationServer *)self notificationSourceForSourceIdentifier:v4];

  if (objc_opt_respondsToSelector()) {
    [v5 willPostNotification:v6];
  }
}

- (void)removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CALNNotificationServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__CALNNotificationServer_removeRecordWithSourceIdentifier_sourceClientIdentifier___block_invoke;
  block[3] = &unk_2645C0E60;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __82__CALNNotificationServer_removeRecordWithSourceIdentifier_sourceClientIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeRecordWithSourceIdentifier:*(void *)(a1 + 40) sourceClientIdentifier:*(void *)(a1 + 48)];
}

- (void)_removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CALNNotificationServer *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [[CALNNotificationIdentifier alloc] initWithSourceIdentifier:v6 sourceClientIdentifier:v7];
  id v10 = v9;
  if (v9)
  {
    char v11 = [(CALNNotificationIdentifier *)v9 stringRepresentation];
    id v12 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v17 = v6;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "Removing record with source identifier = %{public}@, source client identifier = %{public}@", buf, 0x16u);
    }

    id v13 = [(CALNNotificationServer *)self userNotificationCenter];
    id v15 = v11;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    [v13 removeDeliveredNotificationsWithIdentifiers:v14];
  }
  else
  {
    char v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CALNNotificationServer _removeRecordWithSourceIdentifier:sourceClientIdentifier:]((uint64_t)v6, (uint64_t)v7, v11);
    }
  }
}

- (id)_notificationRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CALNNotificationServer *)self storage];
  id v9 = [v8 notificationRecords];

  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __89__CALNNotificationServer__notificationRecordWithSourceIdentifier_sourceClientIdentifier___block_invoke;
  uint64_t v20 = &unk_2645C0E88;
  id v10 = v6;
  id v21 = v10;
  id v11 = v7;
  id v22 = v11;
  id v12 = [v9 indexesOfObjectsPassingTest:&v17];
  id v13 = objc_msgSend(v9, "objectsAtIndexes:", v12, v17, v18, v19, v20);

  if ((unint64_t)[v13 count] < 2)
  {
    id v15 = [v13 firstObject];
  }
  else
  {
    uint64_t v14 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543874;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      _os_log_error_impl(&dword_2216BB000, v14, OS_LOG_TYPE_ERROR, "Error: Expected storage to contain only one record that has the same source identifier and source client identifier. Source identifier: %{public}@. Source client identifier: %{public}@. Fetched records: %@.", buf, 0x20u);
    }

    id v15 = 0;
  }

  return v15;
}

uint64_t __89__CALNNotificationServer__notificationRecordWithSourceIdentifier_sourceClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 sourceIdentifier];
  LODWORD(v4) = [v4 isEqualToString:v5];

  if (v4)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v3 sourceClientIdentifier];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Received user notification center delegate will present notification message. User notification center: %@. Notification: %@.", (uint8_t *)&v13, 0x16u);
  }

  id v11 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [NSNumber numberWithUnsignedInteger:6];
    int v13 = 138543362;
    id v14 = v12;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Invoking callback with options: %{public}@.", (uint8_t *)&v13, 0xCu);
  }
  v9[2](v9, 6);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [(CALNNotificationServer *)self _notificationRecordResponseFromNotificationResponse:v7];
  if (v9)
  {
    id v10 = [(CALNNotificationServer *)self analyticsHandler];
    [v10 recordNotificationResponse:v9];

    id v11 = [v9 notificationRecord];
    id v12 = [v11 sourceIdentifier];
    int v13 = [(CALNNotificationServer *)self notificationSourceForSourceIdentifier:v12];
    [v13 didReceiveResponse:v9];
    id v14 = [v11 sourceClientIdentifier];
    [(CALNNotificationServer *)self removeRecordWithSourceIdentifier:v12 sourceClientIdentifier:v14];

    v8[2](v8);
  }
  else
  {
    __int16 v15 = [v7 notification];
    id v16 = [v15 request];
    uint64_t v17 = [v16 identifier];

    uint64_t v18 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CALNNotificationServer userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]();
    }
  }
}

- (id)_notificationRecordResponseFromNotificationResponse:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 notification];
    id v7 = [v6 request];
    id v8 = [v7 identifier];
    *(_DWORD *)long long buf = 138543618;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Transforming notification response to notification record response. request identifier = %{public}@, response = %@.", buf, 0x16u);
  }
  id v9 = [v4 notification];
  id v10 = [v9 request];
  id v11 = [v10 identifier];
  id v12 = [[CALNNotificationIdentifier alloc] initWithStringRepresentation:v11];
  if (v12)
  {
    int v13 = [(CALNNotificationServer *)self storage];
    id v14 = [v13 notificationRecords];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __78__CALNNotificationServer__notificationRecordResponseFromNotificationResponse___block_invoke;
    v24[3] = &unk_2645C0E38;
    __int16 v25 = v12;
    uint64_t v15 = [v14 indexOfObjectPassingTest:v24];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v16 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CALNNotificationServer _notificationRecordResponseFromNotificationResponse:]();
      }
      uint64_t v17 = 0;
    }
    else
    {
      id v23 = v9;
      id v16 = [v14 objectAtIndex:v15];
      uint64_t v18 = [v4 actionIdentifier];
      id v19 = [v4 originIdentifier];
      uint64_t v20 = [v4 targetConnectionEndpoint];
      uint64_t v17 = +[CALNNotificationRecordResponse responseWithNotificationRecord:v16 actionIdentifier:v18 originIdentifier:v19 targetConnectionEndpoint:v20];

      id v21 = +[CALNLogSubsystem defaultCategory];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v27 = v4;
        __int16 v28 = 2112;
        id v29 = v17;
        _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, "Transformed notification response to notification record response. Notification response: %@. Notification record response: %@.", buf, 0x16u);
      }

      id v9 = v23;
    }
  }
  else
  {
    id v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CALNNotificationServer _notificationRecordResponseFromNotificationResponse:]((uint64_t)v11, v14);
    }
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __78__CALNNotificationServer__notificationRecordResponseFromNotificationResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sourceIdentifier];
  id v5 = [*(id *)(a1 + 32) sourceIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [v3 sourceClientIdentifier];
    id v8 = [*(id *)(a1 + 32) sourceClientIdentifier];
    uint64_t v9 = [v7 isEqualToString:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (CALNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableDictionary)notificationSourceMap
{
  return self->_notificationSourceMap;
}

- (void)setNotificationSourceMap:(id)a3
{
}

- (CALNNotificationStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (CALNAnalyticsHandler)analyticsHandler
{
  return self->_analyticsHandler;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isProtectedDataAvailable
{
  return self->_isProtectedDataAvailable;
}

- (void)setIsProtectedDataAvailable:(BOOL)a3
{
  self->_isProtectedDataAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsHandler, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_notificationSourceMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

- (void)_removeRecordWithSourceIdentifier:(NSObject *)a3 sourceClientIdentifier:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, a2, a3, "Could not remove record because could not get notification identifier for source identifier = %{public}@, source client identifier = %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Could not get record response from response. request identifier = %{public}@, response = %@");
}

- (void)_notificationRecordResponseFromNotificationResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not get notification identifier from request identifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_notificationRecordResponseFromNotificationResponse:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Could not find notification record with notification identifier = %{public}@, records = %@");
}

@end