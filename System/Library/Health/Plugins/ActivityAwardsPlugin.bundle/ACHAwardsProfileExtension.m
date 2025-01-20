@interface ACHAwardsProfileExtension
- (AAPTriggerGenerator)triggerGenerator;
- (ACHAwardsProfileExtension)initWithProfile:(id)a3;
- (ACHEarnedInstanceEntityWrapper)earnedInstanceEntityWrapper;
- (ACHTemplateEntityWrapper)templateEntityWrapper;
- (BOOL)earnedInstanceEntityDidReceiveSyncedEarnedInstances:(id)a3 provenance:(int64_t)a4;
- (HDProfile)profile;
- (OS_dispatch_queue)databaseQueue;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances:(id)a3 removedEarnedInstances:(id)a4;
- (void)keyValuePairsDidUpdate:(id)a3;
- (void)setDatabaseQueue:(id)a3;
- (void)setEarnedInstanceEntityWrapper:(id)a3;
- (void)setProfile:(id)a3;
- (void)setTemplateEntityWrapper:(id)a3;
- (void)setTriggerGenerator:(id)a3;
- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4;
@end

@implementation ACHAwardsProfileExtension

- (ACHAwardsProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACHAwardsProfileExtension;
  v5 = [(ACHAwardsProfileExtension *)&v18 init];
  if (v5)
  {
    v6 = ACHLogDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_241DCF000, v6, OS_LOG_TYPE_DEFAULT, "Starting Activity Awards Plugin", v17, 2u);
    }

    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F237E0]) initWithProfile:v4];
    earnedInstanceEntityWrapper = v5->_earnedInstanceEntityWrapper;
    v5->_earnedInstanceEntityWrapper = (ACHEarnedInstanceEntityWrapper *)v7;

    [(ACHEarnedInstanceEntityWrapper *)v5->_earnedInstanceEntityWrapper setSyncedEarnedInstancesObserver:v5];
    [MEMORY[0x263F237D8] setJournalEntryAppliedObserver:v5];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F23870]) initWithProfile:v4];
    templateEntityWrapper = v5->_templateEntityWrapper;
    v5->_templateEntityWrapper = (ACHTemplateEntityWrapper *)v9;

    [(ACHTemplateEntityWrapper *)v5->_templateEntityWrapper setSyncedTemplatesObserver:v5];
    uint64_t v11 = HDCreateSerialUtilityDispatchQueue();
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v11;

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v5 selector:sel_keyValuePairsDidUpdate_ name:*MEMORY[0x263F23720] object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_profile);
    v15 = [WeakRetained daemon];
    [v15 registerDaemonReadyObserver:v5 queue:v5->_databaseQueue];
  }
  return v5;
}

- (BOOL)earnedInstanceEntityDidReceiveSyncedEarnedInstances:(id)a3 provenance:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_241DD0F88;
  v27 = sub_241DD0F98;
  id v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v7 = [(ACHAwardsProfileExtension *)self databaseQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_241DD0FA0;
  block[3] = &unk_2650F8D08;
  v16 = &v19;
  id v8 = v6;
  id v14 = v8;
  v15 = self;
  v17 = &v23;
  int64_t v18 = a4;
  dispatch_sync(v7, block);

  if (v24[5] || !*((unsigned char *)v20 + 24))
  {
    uint64_t v9 = ACHLogDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v24[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v10;
      _os_log_impl(&dword_241DCF000, v9, OS_LOG_TYPE_DEFAULT, "Error inserting synced earned instances: %@", buf, 0xCu);
    }
  }
  notify_post((const char *)[(id)*MEMORY[0x263F23488] UTF8String]);
  BOOL v11 = *((unsigned char *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (void)earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances:(id)a3 removedEarnedInstances:(id)a4
{
  id v4 = (const char *)objc_msgSend((id)*MEMORY[0x263F23488], "UTF8String", a3, a4);

  notify_post(v4);
}

- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_241DD0F88;
  uint64_t v25 = sub_241DD0F98;
  id v26 = 0;
  uint64_t v17 = 0;
  int64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v7 = [(ACHAwardsProfileExtension *)self databaseQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_241DD12C8;
  block[3] = &unk_2650F8D08;
  id v14 = &v17;
  id v8 = v6;
  id v12 = v8;
  v13 = self;
  v15 = &v21;
  int64_t v16 = a4;
  dispatch_sync(v7, block);

  if (v22[5] || !*((unsigned char *)v18 + 24))
  {
    uint64_t v9 = ACHLogDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v22[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v10;
      _os_log_impl(&dword_241DCF000, v9, OS_LOG_TYPE_DEFAULT, "Error inserting synced templates: %@", buf, 0xCu);
    }
  }
  notify_post((const char *)[(id)*MEMORY[0x263F234A8] UTF8String]);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)keyValuePairsDidUpdate:(id)a3
{
  v3 = (const char *)objc_msgSend((id)*MEMORY[0x263F23490], "UTF8String", a3);

  notify_post(v3);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  id v4 = (const char *)objc_msgSend((id)*MEMORY[0x263F235A8], "UTF8String", a3, a4);

  notify_post(v4);
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained database];
  [v4 addProtectedDataObserver:self];

  v5 = [WeakRetained daemon];
  id v6 = [v5 behavior];
  if ([v6 isAppleWatch])
  {
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F0A980] sharedBehavior];
    int v8 = [v7 isStandalonePhoneFitnessMode];

    if (!v8) {
      goto LABEL_5;
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x263F238D8]);
  uint64_t v10 = [[AAPTriggerGenerator alloc] initWithProfile:WeakRetained awardsClient:v9];
  triggerGenerator = self->_triggerGenerator;
  self->_triggerGenerator = v10;

LABEL_5:
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHEarnedInstanceEntityWrapper)earnedInstanceEntityWrapper
{
  return self->_earnedInstanceEntityWrapper;
}

- (void)setEarnedInstanceEntityWrapper:(id)a3
{
}

- (ACHTemplateEntityWrapper)templateEntityWrapper
{
  return self->_templateEntityWrapper;
}

- (void)setTemplateEntityWrapper:(id)a3
{
}

- (AAPTriggerGenerator)triggerGenerator
{
  return self->_triggerGenerator;
}

- (void)setTriggerGenerator:(id)a3
{
}

- (OS_dispatch_queue)databaseQueue
{
  return self->_databaseQueue;
}

- (void)setDatabaseQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_triggerGenerator, 0);
  objc_storeStrong((id *)&self->_templateEntityWrapper, 0);
  objc_storeStrong((id *)&self->_earnedInstanceEntityWrapper, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end