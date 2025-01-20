@interface ACHQueryServer
+ (Class)queryClass;
- (ACHQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_newSystemEnabledError;
- (void)_queue_start;
- (void)_queue_stop;
- (void)achievementStore:(id)a3 didAddAchievements:(id)a4;
- (void)achievementStore:(id)a3 didRemoveAchievements:(id)a4;
- (void)achievementStore:(id)a3 didUpdateAchievements:(id)a4;
- (void)achievementStoreDidFinishInitialFetch:(id)a3;
@end

@implementation ACHQueryServer

- (ACHQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ACHQueryServer;
  v14 = [(HDQueryServer *)&v20 initWithUUID:v10 configuration:v11 client:v12 delegate:v13];
  if (v14)
  {
    objc_initWeak(&location, v14);
    v15 = [v12 profile];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__ACHQueryServer_initWithUUID_configuration_client_delegate___block_invoke;
    v17[3] = &unk_2645177D0;
    objc_copyWeak(&v18, &location);
    ACHRequestProfileExtensionWithError(v15, v17, 0);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __61__ACHQueryServer_initWithUUID_configuration_client_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [v5 achievementStore];
    objc_storeWeak(WeakRetained + 25, v4);
  }
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (id)_newSystemEnabledError
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = @"New achievements system is enabled. ACHQuery isn't functional. Use the new system's query mechanisms instead.";
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 errorWithDomain:@"com.apple.ActivityAchievements.Query" code:42 userInfo:v3];

  return v4;
}

- (void)_queue_start
{
  v19[1] = *MEMORY[0x263EF8340];
  if (ACHShouldUseNewAwardsSystem())
  {
    id v15 = [(ACHQueryServer *)self _clientProxy];
    id v3 = [(ACHQueryServer *)self _newSystemEnabledError];
    v4 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v15, "client_deliverError:forQuery:", v3, v4);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ACHQueryServer;
    [(HDQueryServer *)&v17 _queue_start];
    id v5 = ACHLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Query server starting", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_achievementStore);
      [v7 addObserver:self];

      id v8 = objc_loadWeakRetained((id *)&self->_achievementStore);
      [v8 loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:0];
    }
    else
    {
      v9 = ACHLogXPC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Query server error: No achievement store available. Delivering error to client.", buf, 2u);
      }

      id v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08320];
      v19[0] = @"Achievement store was nil; query invalid.";
      id v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v12 = [v10 errorWithDomain:@"com.apple.ActivityAchievements.Query" code:22 userInfo:v11];

      id v13 = [(ACHQueryServer *)self _clientProxy];
      v14 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v13, "client_deliverError:forQuery:", v12, v14);
    }
  }
}

- (void)_queue_stop
{
  if (ACHShouldUseNewAwardsSystem())
  {
    id v6 = [(ACHQueryServer *)self _clientProxy];
    id v3 = [(ACHQueryServer *)self _newSystemEnabledError];
    v4 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v6, "client_deliverError:forQuery:", v3, v4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ACHQueryServer;
    [(HDQueryServer *)&v7 _queue_stop];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
    [WeakRetained removeObserver:self];
  }
}

- (void)achievementStoreDidFinishInitialFetch:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_achievementStore = &self->_achievementStore;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
  id v6 = [WeakRetained allAchievements];

  objc_super v7 = ACHLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v6 count];
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Query server delivered [%lu] achievements", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(ACHQueryServer *)self _clientProxy];
  objc_msgSend(v8, "client_achievementsDidFinishInitialFetch:", v6);

  id v9 = objc_loadWeakRetained((id *)p_achievementStore);
  [v9 recalculateProgressForAllAchievements];
}

- (void)achievementStore:(id)a3 didAddAchievements:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = ACHLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Query server delivering [%lu] new achievements", (uint8_t *)&v8, 0xCu);
  }

  objc_super v7 = [(ACHQueryServer *)self _clientProxy];
  objc_msgSend(v7, "client_deliverNewAchievements:", v5);
}

- (void)achievementStore:(id)a3 didUpdateAchievements:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = ACHLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Query server delivering [%lu] updated achievements", (uint8_t *)&v8, 0xCu);
  }

  objc_super v7 = [(ACHQueryServer *)self _clientProxy];
  objc_msgSend(v7, "client_deliverUpdatedAchievements:", v5);
}

- (void)achievementStore:(id)a3 didRemoveAchievements:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = ACHLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Query server delivering [%lu] removed achievements", (uint8_t *)&v8, 0xCu);
  }

  objc_super v7 = [(ACHQueryServer *)self _clientProxy];
  objc_msgSend(v7, "client_deliverRemovedAchievements:", v5);
}

- (void).cxx_destruct
{
}

@end