@interface BBXPCPersistentStore
- (BBXPCPersistentStore)init;
- (BOOL)hasSectionInfoLegacyFile;
- (id)_ensureSettingsPersistenceConnection;
- (id)effectiveGlobalScheduledDeliveryTimes;
- (id)readClearedSections;
- (id)readSectionInfo;
- (id)readSectionInfoLegacy;
- (id)readSectionInfoWithVersionNumberForMigration;
- (id)readSectionOrder;
- (int64_t)effectiveGlobalAnnounceCarPlaySetting;
- (int64_t)effectiveGlobalAnnounceHeadphonesSetting;
- (int64_t)effectiveGlobalAnnounceSetting;
- (int64_t)effectiveGlobalContentPreviewsSetting;
- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting;
- (int64_t)effectiveGlobalScheduledDeliverySetting;
- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting;
- (void)_resetSettingsPersistenceConnection;
- (void)deleteSectionInfoFile;
- (void)deleteSectionInfoLegacyFile;
- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3;
- (void)setGlobalAnnounceSetting:(int64_t)a3;
- (void)setGlobalContentPreviewsSetting:(int64_t)a3;
- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)setGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3;
- (void)setGlobalScheduledDeliveryTimes:(id)a3;
- (void)writeClearedSections:(id)a3;
- (void)writeSectionInfo:(id)a3;
- (void)writeSectionOrder:(id)a3;
@end

@implementation BBXPCPersistentStore

- (BBXPCPersistentStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)BBXPCPersistentStore;
  v2 = [(BBXPCPersistentStore *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.bulletinboard.BBXPCPersistentStore.connectionQueue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)_ensureSettingsPersistenceConnection
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke;
  v5[3] = &unk_264296008;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x263F84350] options:0];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    v7 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v8 = [MEMORY[0x263F842F0] serverInterface];
    [v7 setRemoteObjectInterface:v8];

    v9 = *(void **)(*(void *)(a1 + 32) + 16);
    v10 = [MEMORY[0x263F842F0] clientInterface];
    [v9 setExportedInterface:v10];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setExportedObject:");
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:&__block_literal_global_23];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v11 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke_3;
    v17 = &unk_264295FE0;
    objc_copyWeak(&v18, &location);
    [v11 setInvalidationHandler:&v14];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "resume", v14, v15, v16, v17);
    v12 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v13;
      _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "Created settings persistence connection %@", buf, 0xCu);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke_2()
{
  v0 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_217675000, v0, OS_LOG_TYPE_DEFAULT, "Settings persistence connection interrupted", v1, 2u);
  }
}

void __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke_3(uint64_t a1)
{
  v2 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "Settings persistence connection invalidated", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetSettingsPersistenceConnection];
}

- (void)_resetSettingsPersistenceConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__BBXPCPersistentStore__resetSettingsPersistenceConnection__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __59__BBXPCPersistentStore__resetSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void)deleteSectionInfoFile
{
  uint64_t v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = BBLogMigration;
  if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Deleting persisted sectionInfo", v5, 2u);
  }
  uint64_t v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6_0];
  [v4 deleteSectionInfoFile];
}

void __45__BBXPCPersistentStore_deleteSectionInfoFile__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __45__BBXPCPersistentStore_deleteSectionInfoFile__block_invoke_cold_1();
  }
}

- (void)deleteSectionInfoLegacyFile
{
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = BBLogMigration;
  if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Deleting persisted legacySectionInfo", v5, 2u);
  }
  uint64_t v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_8_0];
  [v4 deleteSectionInfoLegacyFile];
}

void __51__BBXPCPersistentStore_deleteSectionInfoLegacyFile__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __51__BBXPCPersistentStore_deleteSectionInfoLegacyFile__block_invoke_cold_1();
  }
}

- (BOOL)hasSectionInfoLegacyFile
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = BBLogMigration;
  if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Checking for existence of legacy sectionInfo file", buf, 2u);
  }
  uint64_t v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_11;
  v7[3] = &unk_264297C08;
  v7[4] = &v9;
  [v4 hasSectionInfoLegacyFileWithHandler:v7];
  char v5 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_cold_1();
  }
}

void __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_11(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_11_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (id)readClearedSections
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__14;
  uint64_t v15 = __Block_byref_object_dispose__14;
  id v16 = [NSDictionary dictionary];
  id v3 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_15];
  id v5 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Reading clearedSections from persistence", buf, 2u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__BBXPCPersistentStore_readClearedSections__block_invoke_16;
  v10[3] = &unk_264296F90;
  v10[4] = &v11;
  [v4 readSavedClearedSectionsWithHandler:v10];
  uint64_t v6 = (id)BBLogPersistence;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(id)v12[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v7;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Finished reading clearedSections from persistence. Count: %lu", buf, 0xCu);
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __43__BBXPCPersistentStore_readClearedSections__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __43__BBXPCPersistentStore_readClearedSections__block_invoke_cold_1();
  }
}

void __43__BBXPCPersistentStore_readClearedSections__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __43__BBXPCPersistentStore_readClearedSections__block_invoke_16_cold_1();
  }
  uint64_t v7 = +[BBUNCoreConversion toBBSectionInfoDictionary:v5];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)readSectionInfo
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__14;
  uint64_t v15 = __Block_byref_object_dispose__14;
  id v16 = [NSDictionary dictionary];
  id v3 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  uint64_t v4 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Reading sectionInfo from persistence", buf, 2u);
  }
  id v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_20_0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__BBXPCPersistentStore_readSectionInfo__block_invoke_21;
  v10[3] = &unk_264296F90;
  v10[4] = &v11;
  [v5 readSectionInfoWithHandler:v10];
  id v6 = (id)BBLogPersistence;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(id)v12[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v7;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Finished reading sectionInfo from persistence. Count: %lu", buf, 0xCu);
  }

  uint64_t v8 = (void *)[(id)v12[5] mutableCopy];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __39__BBXPCPersistentStore_readSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __39__BBXPCPersistentStore_readSectionInfo__block_invoke_cold_1();
  }
}

void __39__BBXPCPersistentStore_readSectionInfo__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __39__BBXPCPersistentStore_readSectionInfo__block_invoke_21_cold_1();
  }
  uint64_t v7 = +[BBUNCoreConversion toBBSectionInfoDictionary:v5];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)readSectionInfoLegacy
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__14;
  uint64_t v15 = __Block_byref_object_dispose__14;
  id v16 = [NSDictionary dictionary];
  id v3 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  uint64_t v4 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Reading sectionInfoLegacy from persistence", buf, 2u);
  }
  id v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_23_0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_24;
  v10[3] = &unk_264296F90;
  v10[4] = &v11;
  [v5 readSectionInfoLegacyFileWithHandler:v10];
  id v6 = (id)BBLogPersistence;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(id)v12[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v7;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Finished reading sectionInfoLegacy from persistence. Count: %lu", buf, 0xCu);
  }

  uint64_t v8 = (void *)[(id)v12[5] mutableCopy];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_cold_1();
  }
}

void __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_24_cold_1();
  }
  uint64_t v7 = +[BBUNCoreConversion toBBSectionInfoDictionary:v5];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)readSectionOrder
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__14;
  uint64_t v15 = __Block_byref_object_dispose__14;
  id v16 = [NSDictionary dictionary];
  id v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Reading sectionOrder from persistence", buf, 2u);
  }
  uint64_t v4 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_26];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__BBXPCPersistentStore_readSectionOrder__block_invoke_27;
  v10[3] = &unk_264296F90;
  v10[4] = &v11;
  [v5 readSavedClearedSectionsWithHandler:v10];
  id v6 = (id)BBLogPersistence;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(id)v12[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v7;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Finished reading sectionOrder from persistence. Count: %lu", buf, 0xCu);
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __40__BBXPCPersistentStore_readSectionOrder__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __40__BBXPCPersistentStore_readSectionOrder__block_invoke_cold_1();
  }
}

void __40__BBXPCPersistentStore_readSectionOrder__block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __40__BBXPCPersistentStore_readSectionOrder__block_invoke_27_cold_1();
  }
  uint64_t v7 = +[BBUNCoreConversion toBBSectionInfoDictionary:v5];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)writeClearedSections:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v6 = (void *)BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    int v10 = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Writing clearedSections to persistence. Count %lu", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_29_0];
  uint64_t v9 = +[BBUNCoreConversion toUNCSectionInfoDictionary:v4];

  [v8 writeClearedSections:v9];
}

void __45__BBXPCPersistentStore_writeClearedSections___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __45__BBXPCPersistentStore_writeClearedSections___block_invoke_cold_1();
  }
}

- (void)writeSectionInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v6 = (void *)BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    int v10 = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Writing sectionInfo to persistence. Count: %lu", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_31_0];
  uint64_t v9 = +[BBUNCoreConversion toUNCSectionInfoDictionary:v4];

  [v8 writeSectionInfo:v9];
}

void __41__BBXPCPersistentStore_writeSectionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __41__BBXPCPersistentStore_writeSectionInfo___block_invoke_cold_1();
  }
}

- (void)writeSectionOrder:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v6 = (void *)BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    int v10 = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Writing sectionOrder to persistence. Count: %lu", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_33];
  uint64_t v9 = +[BBUNCoreConversion toUNCSectionInfoDictionary:v4];

  [v8 writeSectionOrder:v9];
}

void __42__BBXPCPersistentStore_writeSectionOrder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __42__BBXPCPersistentStore_writeSectionOrder___block_invoke_cold_1();
  }
}

- (id)readSectionInfoWithVersionNumberForMigration
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__14;
  uint64_t v14 = __Block_byref_object_dispose__14;
  id v15 = [NSDictionary dictionary];
  id v3 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v4 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Reading sectionInfoWithVersionNumberForMigration", buf, 2u);
  }
  id v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_35];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke_36;
  v8[3] = &unk_264296F90;
  v8[4] = &v10;
  [v5 readSectionInfoWithVersionNumberForMigrationWithHandler:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke_cold_1();
  }
}

void __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __39__BBXPCPersistentStore_readSectionInfo__block_invoke_21_cold_1();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_38];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_39;
  v6[3] = &unk_264296D40;
  v6[4] = &v7;
  [v3 getEffectiveGlobalAnnounceCarPlaySettingWithHandler:v6];
  int64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_cold_1();
  }
}

void __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_39_cold_1();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBAnnounceCarPlaySetting:a2];
}

- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  int64_t v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_42];
  objc_msgSend(v4, "setEffectiveGlobalAnnounceCarPlaySetting:withHandler:", +[BBUNCoreConversion toUNCAnnounceCarPlaySetting:](BBUNCoreConversion, "toUNCAnnounceCarPlaySetting:", a3), &__block_literal_global_45);
}

void __56__BBXPCPersistentStore_setGlobalAnnounceCarPlaySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __56__BBXPCPersistentStore_setGlobalAnnounceCarPlaySetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalAnnounceHeadphonesSetting
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_47];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_48;
  v6[3] = &unk_264296D40;
  v6[4] = &v7;
  [v3 getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:v6];
  int64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_cold_1();
  }
}

void __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_48_cold_1();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBAnnounceSetting:a2];
}

- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  int64_t v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_50_0];
  objc_msgSend(v4, "setEffectiveGlobalAnnounceHeadphonesSetting:withHandler:", +[BBUNCoreConversion toUNCAnnounceSetting:](BBUNCoreConversion, "toUNCAnnounceSetting:", a3), &__block_literal_global_53);
}

void __59__BBXPCPersistentStore_setGlobalAnnounceHeadphonesSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __59__BBXPCPersistentStore_setGlobalAnnounceHeadphonesSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalAnnounceSetting
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_55];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_56;
  v6[3] = &unk_264296D40;
  v6[4] = &v7;
  [v3 getEffectiveGlobalAnnounceSettingWithHandler:v6];
  int64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_cold_1();
  }
}

void __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_56_cold_1();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBAnnounceSetting:a2];
}

- (void)setGlobalAnnounceSetting:(int64_t)a3
{
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  int64_t v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_58];
  objc_msgSend(v4, "setEffectiveGlobalAnnounceSetting:withHandler:", +[BBUNCoreConversion toUNCAnnounceSetting:](BBUNCoreConversion, "toUNCAnnounceSetting:", a3), &__block_literal_global_61);
}

void __49__BBXPCPersistentStore_setGlobalAnnounceSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalContentPreviewsSetting
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_63];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_64;
  v6[3] = &unk_264296D40;
  v6[4] = &v7;
  [v3 getEffectiveGlobalContentPreviewsSettingWithHandler:v6];
  int64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_cold_1();
  }
}

void __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_64_cold_1();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBContentPreviewSetting:a2];
}

- (void)setGlobalContentPreviewsSetting:(int64_t)a3
{
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  int64_t v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_66];
  objc_msgSend(v4, "setEffectiveGlobalContentPreviewsSetting:withHandler:", +[BBUNCoreConversion toUNCContentPreviewSetting:](BBUNCoreConversion, "toUNCContentPreviewSetting:", a3), &__block_literal_global_69);
}

void __56__BBXPCPersistentStore_setGlobalContentPreviewsSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __56__BBXPCPersistentStore_setGlobalContentPreviewsSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_71];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_72;
  v6[3] = &unk_264296D40;
  v6[4] = &v7;
  [v3 getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:v6];
  int64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_cold_1();
  }
}

void __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_72(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_72_cold_1();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBListDisplayStyleSetting:a2];
}

- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  int64_t v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_74];
  objc_msgSend(v4, "setEffectiveGlobalNotificationListDisplayStyleSetting:withHandler:", +[BBUNCoreConversion toUNCListDisplayStyleSetting:](BBUNCoreConversion, "toUNCListDisplayStyleSetting:", a3), &__block_literal_global_77);
}

void __69__BBXPCPersistentStore_setGlobalNotificationListDisplayStyleSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __69__BBXPCPersistentStore_setGlobalNotificationListDisplayStyleSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_79];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_80;
  v6[3] = &unk_264296D40;
  v6[4] = &v7;
  [v3 getEffectiveGlobalScheduledDeliverySettingWithHandler:v6];
  int64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_cold_1();
  }
}

void __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_80(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_80_cold_1();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBScheduledDeliverySetting:a2];
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  int64_t v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_82];
  objc_msgSend(v4, "setEffectiveGlobalScheduledDeliverySetting:withHandler:", +[BBUNCoreConversion toUNCScheduledDeliverySetting:](BBUNCoreConversion, "toUNCScheduledDeliverySetting:", a3), &__block_literal_global_85);
}

void __58__BBXPCPersistentStore_setGlobalScheduledDeliverySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __58__BBXPCPersistentStore_setGlobalScheduledDeliverySetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_87];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_88;
  v6[3] = &unk_264296D40;
  v6[4] = &v7;
  [v3 getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:v6];
  int64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_cold_1();
  }
}

void __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_88_cold_1();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBSystemSetting:a2];
}

- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  id v5 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  int64_t v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_90];
  objc_msgSend(v4, "setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:withHandler:", +[BBUNCoreConversion toUNCSystemSetting:](BBUNCoreConversion, "toUNCSystemSetting:", a3), &__block_literal_global_93);
}

void __73__BBXPCPersistentStore_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __73__BBXPCPersistentStore_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke_cold_1();
  }
}

- (id)effectiveGlobalScheduledDeliveryTimes
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  id v2 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_95];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke_96;
  v6[3] = &unk_2642969B0;
  v6[4] = &v7;
  [v3 getEffectiveGlobalScheduledDeliveryTimesWithHandler:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke_cold_1();
  }
}

void __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke_96(uint64_t a1, void *a2)
{
}

- (void)setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4 = a3;
  id v6 = [(BBXPCPersistentStore *)self _ensureSettingsPersistenceConnection];
  id v5 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_99_0];
  [v5 setEffectiveGlobalScheduledDeliveryTimes:v4 withHandler:&__block_literal_global_102];
}

void __56__BBXPCPersistentStore_setGlobalScheduledDeliveryTimes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __56__BBXPCPersistentStore_setGlobalScheduledDeliveryTimes___block_invoke_cold_1();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsPersistenceConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __45__BBXPCPersistentStore_deleteSectionInfoFile__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "deleteSectionInfoFileXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __51__BBXPCPersistentStore_deleteSectionInfoLegacyFile__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "deleteSectionInfoLegacyFileXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "hasSectionInfoLegacyFile: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error checking existence of legacy sectionInfo: %@", v2, v3, v4, v5, v6);
}

void __43__BBXPCPersistentStore_readClearedSections__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "readClearedSectionsXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __43__BBXPCPersistentStore_readClearedSections__block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading clearedSections %@", v2, v3, v4, v5, v6);
}

void __39__BBXPCPersistentStore_readSectionInfo__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "readSectionInfoXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __39__BBXPCPersistentStore_readSectionInfo__block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading sectionInfo %@", v2, v3, v4, v5, v6);
}

void __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "readSectionInfoLegacyXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading legacy sectionInfo: %@", v2, v3, v4, v5, v6);
}

void __40__BBXPCPersistentStore_readSectionOrder__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "readSectionOrderXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __40__BBXPCPersistentStore_readSectionOrder__block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading sectionOrder %@", v2, v3, v4, v5, v6);
}

void __45__BBXPCPersistentStore_writeClearedSections___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "writeClearedSectionsXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __41__BBXPCPersistentStore_writeSectionInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "writeSectionInfoXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __42__BBXPCPersistentStore_writeSectionOrder___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "writeSectionOrderXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "readSectionInfoWithVersionNumberForMigrationXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "effectiveGlobalAnnounceCarPlaySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading effectiveGlobalAnnounceCarPlaySetting %@", v2, v3, v4, v5, v6);
}

void __56__BBXPCPersistentStore_setGlobalAnnounceCarPlaySetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "setEffectiveGlobalAnnounceCarPlaySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "effectiveGlobalAnnounceHeadphonesSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_48_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading effectiveGlobalAnnounceHeadphonesSetting %@", v2, v3, v4, v5, v6);
}

void __59__BBXPCPersistentStore_setGlobalAnnounceHeadphonesSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "setEffectiveGlobalAnnounceHeadphonesSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "effectiveGlobalAnnounceSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading effectiveGlobalAnnounceSetting %@", v2, v3, v4, v5, v6);
}

void __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "effectiveGlobalContentPreviewsSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_64_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading effectiveGlobalContentPreviewsSetting %@", v2, v3, v4, v5, v6);
}

void __56__BBXPCPersistentStore_setGlobalContentPreviewsSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "setGlobalContentPreviewsSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "effectiveGlobalNotificationListDisplayStyleSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_72_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading effectiveGlobalNotificationListDisplayStyleSetting %@", v2, v3, v4, v5, v6);
}

void __69__BBXPCPersistentStore_setGlobalNotificationListDisplayStyleSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "setGlobalNotificationListDisplayStyleSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "effectiveGlobalScheduledDeliverySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_80_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading effectiveGlobalScheduledDeliverySetting %@", v2, v3, v4, v5, v6);
}

void __58__BBXPCPersistentStore_setGlobalScheduledDeliverySetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "setGlobalScheduledDeliverySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "effectiveGlobalScheduledDeliveryShowNextSummarySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_88_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error reading effectiveGlobalScheduledDeliveryShowNextSummarySetting %@", v2, v3, v4, v5, v6);
}

void __73__BBXPCPersistentStore_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "setGlobalScheduledDeliveryShowNextSummarySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "effectiveGlobalScheduledDeliveryTimes: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __56__BBXPCPersistentStore_setGlobalScheduledDeliveryTimes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "setGlobalScheduledDeliveryTimes: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

@end