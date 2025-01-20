@interface BBXPCSectionInfoStore
- (BBXPCSectionInfoStore)init;
- (id)_ensureSettingsPersistenceConnection;
- (id)activeSectionIDs;
- (id)allSortedActiveSections:(BOOL)a3;
- (id)allSortedSectionInfo:(BOOL)a3;
- (id)allUnsortedSectionInfoIDs;
- (id)asyncServerProxyObject;
- (id)clearedInfoForSectionID:(id)a3;
- (id)clearedSectionsByID;
- (id)effectiveSectionInfoForSectionInfo:(id)a3;
- (id)sectionInfoByID;
- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4;
- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4;
- (id)serverProxyObject;
- (id)sortedSectionIDs;
- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4;
- (void)_resetSettingsPersistenceConnection;
- (void)addActiveSectionID:(id)a3;
- (void)removeSectionWithID:(id)a3;
- (void)setClearedInfo:(id)a3 forSectionID:(id)a4;
- (void)setClearedSectionsByID:(id)a3;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)setSectionInfoByID:(id)a3;
@end

@implementation BBXPCSectionInfoStore

- (BBXPCSectionInfoStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)BBXPCSectionInfoStore;
  v2 = [(BBXPCSectionInfoStore *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.bulletinboard.BBXPCSectionInfoStore.connectionQueue", 0);
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke;
  v5[3] = &unk_264296008;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke(uint64_t a1)
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
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:&__block_literal_global_9];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v11 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke_3;
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

void __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke_2()
{
  v0 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_217675000, v0, OS_LOG_TYPE_DEFAULT, "Settings persistence connection interrupted", v1, 2u);
  }
}

void __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke_3(uint64_t a1)
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
  block[2] = __60__BBXPCSectionInfoStore__resetSettingsPersistenceConnection__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __60__BBXPCSectionInfoStore__resetSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (id)serverProxyObject
{
  uint64_t v2 = [(BBXPCSectionInfoStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6];

  return v3;
}

void __42__BBXPCSectionInfoStore_serverProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __42__BBXPCSectionInfoStore_serverProxyObject__block_invoke_cold_1();
  }
}

- (id)asyncServerProxyObject
{
  id v2 = [(BBXPCSectionInfoStore *)self _ensureSettingsPersistenceConnection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_8];

  return v3;
}

void __47__BBXPCSectionInfoStore_asyncServerProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __47__BBXPCSectionInfoStore_asyncServerProxyObject__block_invoke_cold_1();
  }
}

- (void)removeSectionWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BBXPCSectionInfoStore *)self asyncServerProxyObject];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__BBXPCSectionInfoStore_removeSectionWithID___block_invoke;
  v7[3] = &unk_264295E28;
  id v8 = v4;
  id v6 = v4;
  [v5 removeSectionWithID:v6 withHandler:v7];
}

void __45__BBXPCSectionInfoStore_removeSectionWithID___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "Removed section with ID %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)sectionInfoByID
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke;
  v7[3] = &unk_264296EF0;
  id v5 = v3;
  id v8 = v5;
  [v4 allSectionInfosByIDWithHandler:v7];

  return v5;
}

void __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke_cold_1();
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke_10;
  v7[3] = &unk_264296EC8;
  id v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "bs_each:", v7);
}

void __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[BBUNCoreConversion toBBSectionInfo:a3 parentSection:0];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  id v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  v7 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__BBXPCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke;
  v11[3] = &unk_264296F18;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 sectionInfoForSectionID:v8 effective:v4 withHandler:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __59__BBXPCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
      __59__BBXPCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  uint64_t v8 = +[BBUNCoreConversion toBBSectionInfo:v5 parentSection:0];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)addActiveSectionID:(id)a3
{
  id v4 = a3;
  id v5 = [(BBXPCSectionInfoStore *)self asyncServerProxyObject];
  [v5 addActiveSectionID:v4 withHandler:&__block_literal_global_16];
}

- (id)allUnsortedSectionInfoIDs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  id v11 = __Block_byref_object_dispose__7;
  id v12 = [MEMORY[0x263EFF8C0] array];
  uint64_t v3 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__BBXPCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke;
  v6[3] = &unk_2642969B0;
  v6[4] = &v7;
  [v3 allSectionIDsWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__BBXPCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __50__BBXPCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke_cold_1();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BBXPCSectionInfoStore *)self asyncServerProxyObject];
  uint64_t v8 = +[BBUNCoreConversion toUNCSectionInfo:v7 parentSection:0];

  [v9 setSectionInfo:v8 forSectionID:v6 withHandler:&__block_literal_global_20];
}

- (void)setSectionInfoByID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__BBXPCSectionInfoStore_setSectionInfoByID___block_invoke;
  v9[3] = &unk_264296F40;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend(v5, "bs_each:", v9);

  uint64_t v8 = [(BBXPCSectionInfoStore *)self asyncServerProxyObject];
  [v8 setAllSectionInfoByID:v7 withHandler:&__block_literal_global_23];
}

void __44__BBXPCSectionInfoStore_setSectionInfoByID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[BBUNCoreConversion toUNCSectionInfo:a3 parentSection:0];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)activeSectionIDs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__7;
  id v11 = __Block_byref_object_dispose__7;
  id v12 = [MEMORY[0x263EFFA08] set];
  uint64_t v3 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__BBXPCSectionInfoStore_activeSectionIDs__block_invoke;
  v6[3] = &unk_264296CA0;
  v6[4] = &v7;
  [v3 activeSectionIDsWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__BBXPCSectionInfoStore_activeSectionIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __41__BBXPCSectionInfoStore_activeSectionIDs__block_invoke_cold_1();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)sortedSectionIDs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__7;
  id v11 = __Block_byref_object_dispose__7;
  id v12 = [MEMORY[0x263EFF8C0] array];
  uint64_t v3 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke;
  v6[3] = &unk_2642969B0;
  v6[4] = &v7;
  [v3 sortedSectionIDsWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__7;
  uint64_t v15 = __Block_byref_object_dispose__7;
  id v16 = [MEMORY[0x263EFF8C0] array];
  uint64_t v7 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__BBXPCSectionInfoStore_sortedSectionInfoForSectionIDs_effective___block_invoke;
  v10[3] = &unk_2642969B0;
  v10[4] = &v11;
  [v7 sectionInfosForSectionIDs:v6 effective:v4 withHandler:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __66__BBXPCSectionInfoStore_sortedSectionInfoForSectionIDs_effective___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1();
  }
  uint64_t v7 = +[BBUNCoreConversion toBBSectionInfos:v5 parentSection:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)allSortedSectionInfo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__7;
  uint64_t v13 = __Block_byref_object_dispose__7;
  id v14 = [MEMORY[0x263EFF8C0] array];
  id v5 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__BBXPCSectionInfoStore_allSortedSectionInfo___block_invoke;
  v8[3] = &unk_2642969B0;
  v8[4] = &v9;
  [v5 allSortedSectionInfos:v3 withHandler:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __46__BBXPCSectionInfoStore_allSortedSectionInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1();
  }
  uint64_t v7 = +[BBUNCoreConversion toBBSectionInfos:v5 parentSection:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)effectiveSectionInfoForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 sectionID], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    uint64_t v7 = [v5 sectionID];
    uint64_t v8 = [(BBXPCSectionInfoStore *)self sectionInfoForSectionID:v7 effective:1];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)allSortedActiveSections:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__7;
  uint64_t v13 = __Block_byref_object_dispose__7;
  id v14 = [MEMORY[0x263EFF8C0] array];
  id v5 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__BBXPCSectionInfoStore_allSortedActiveSections___block_invoke;
  v8[3] = &unk_2642969B0;
  v8[4] = &v9;
  [v5 allSortedActiveSections:v3 withHandler:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__BBXPCSectionInfoStore_allSortedActiveSections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1();
  }
  uint64_t v7 = +[BBUNCoreConversion toBBSectionInfos:v5 parentSection:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [(BBXPCSectionInfoStore *)self sortedSectionInfoForSectionIDs:a3 effective:a4];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "sectionID", (void)v14);
        [v5 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)clearedInfoForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__7;
  uint64_t v13 = __Block_byref_object_dispose__7;
  id v14 = 0;
  id v5 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__BBXPCSectionInfoStore_clearedInfoForSectionID___block_invoke;
  v8[3] = &unk_264296F68;
  v8[4] = &v9;
  [v5 clearedInfoForSectionID:v4 withHandler:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__BBXPCSectionInfoStore_clearedInfoForSectionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __49__BBXPCSectionInfoStore_clearedInfoForSectionID___block_invoke_cold_1();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)clearedSectionsByID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__7;
  uint64_t v11 = __Block_byref_object_dispose__7;
  id v12 = [NSDictionary dictionary];
  BOOL v3 = [(BBXPCSectionInfoStore *)self serverProxyObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__BBXPCSectionInfoStore_clearedSectionsByID__block_invoke;
  v6[3] = &unk_264296F90;
  v6[4] = &v7;
  [v3 clearedSectionsByIDWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__BBXPCSectionInfoStore_clearedSectionsByID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
    __44__BBXPCSectionInfoStore_clearedSectionsByID__block_invoke_cold_1();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (void)setClearedInfo:(id)a3 forSectionID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BBXPCSectionInfoStore *)self asyncServerProxyObject];
  [v8 setClearedInfo:v7 forSectionID:v6 withHandler:&__block_literal_global_29];
}

- (void)setClearedSectionsByID:(id)a3
{
  id v4 = a3;
  id v5 = [(BBXPCSectionInfoStore *)self asyncServerProxyObject];
  [v5 setClearedSectionsByID:v4 withHandler:&__block_literal_global_31];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsPersistenceConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __42__BBXPCSectionInfoStore_serverProxyObject__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "BBXPCSectionInfoStore: Error getting remote proxy %@", v2, v3, v4, v5, v6);
}

void __47__BBXPCSectionInfoStore_asyncServerProxyObject__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "BBXPCSectionInfoStore: Error getting async remote proxy %@", v2, v3, v4, v5, v6);
}

void __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error getting sectionInfoByID: %@", v2, v3, v4, v5, v6);
}

void __59__BBXPCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_217675000, log, OS_LOG_TYPE_ERROR, "Error getting sectionInfoForID: %@ %@", (uint8_t *)&v4, 0x16u);
}

void __50__BBXPCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error getting sectionInfoIDs: %@", v2, v3, v4, v5, v6);
}

void __41__BBXPCSectionInfoStore_activeSectionIDs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error getting activeSectionIDs %@", v2, v3, v4, v5, v6);
}

void __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error getting sortedSectionIDs: %@", v2, v3, v4, v5, v6);
}

void __49__BBXPCSectionInfoStore_clearedInfoForSectionID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error getting clearedInfoForSectionID: %@", v2, v3, v4, v5, v6);
}

void __44__BBXPCSectionInfoStore_clearedSectionsByID__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error getting clearedSectionsByID: %@", v2, v3, v4, v5, v6);
}

@end