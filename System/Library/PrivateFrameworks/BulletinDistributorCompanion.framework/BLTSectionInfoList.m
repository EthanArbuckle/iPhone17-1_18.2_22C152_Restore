@interface BLTSectionInfoList
- (BLTSectionInfoList)init;
- (BLTSectionInfoListBBProvider)sectionInfoProvider;
- (BLTSectionInfoListDelegate)delegate;
- (BLTSectionInfoListOverrideProvider)overrideProvider;
- (BOOL)hasCustomSettingsSetForSectionID:(id)a3;
- (BOOL)hasLoaded;
- (id)_lock_sectionInfoFromListItem:(id)a3 sectionID:(id)a4 displayName:(id *)a5;
- (id)_overriddenSectionInfoForSectionID:(id)a3 originalSectionInfo:(id *)a4 displayName:(id *)a5;
- (id)_sectionInfoFromSectionID:(id)a3 displayName:(id *)a4;
- (id)bbSectionInfoForSectionID:(id)a3;
- (id)effectiveSectionInfoForSectionID:(id)a3;
- (id)originalSettings;
- (id)overriddenSectionInfoForSectionID:(id)a3;
- (id)overriddenSettings;
- (id)overrides;
- (id)sectionIDs;
- (id)sectionOverrideOnlyForSectionID:(id)a3;
- (id)sectionOverridesOnly;
- (id)settingsDescriptionForSectionIDs:(id)a3;
- (id)universalSectionIDForSectionID:(id)a3;
- (void)_migrateFromExternalDeviceSwitchToOverrides:(id)a3 sectionID:(id)a4;
- (void)_updateListItem:(id)a3 overrides:(id)a4 sectionID:(id)a5;
- (void)dealloc;
- (void)mapSection:(id)a3 map:(id)a4;
- (void)reloadBBSection:(id)a3 completion:(id)a4;
- (void)reloadWithCompletion:(id)a3;
- (void)removedSectionWithSectionID:(id)a3 transaction:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setOverrideProvider:(id)a3;
- (void)setSectionInfoProvider:(id)a3;
- (void)updateOverrides:(id)a3 forSectionID:(id)a4 transaction:(id)a5;
- (void)updateSectionInfoForSectionIDs:(id)a3 transaction:(id)a4;
@end

@implementation BLTSectionInfoList

- (BLTSectionInfoList)init
{
  v11.receiver = self;
  v11.super_class = (Class)BLTSectionInfoList;
  v2 = [(BLTSectionInfoList *)&v11 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    sectionInfoListItemsBySectionID = v3->_sectionInfoListItemsBySectionID;
    v3->_sectionInfoListItemsBySectionID = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    loadingCompletionHandlers = v3->_loadingCompletionHandlers;
    v3->_loadingCompletionHandlers = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    sectionInfoSectionIDs = v3->_sectionInfoSectionIDs;
    v3->_sectionInfoSectionIDs = (NSMutableSet *)v8;
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)BLTSectionInfoList;
  [(BLTSectionInfoList *)&v3 dealloc];
}

- (id)sectionIDs
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v4 = [(NSMutableSet *)self->_sectionInfoSectionIDs allObjects];
  v5 = (void *)[v4 copy];

  pthread_mutex_unlock(p_lock);
  return v5;
}

- (void)setSectionInfoProvider:(id)a3
{
  v5 = (BLTSectionInfoListBBProvider *)a3;
  p_sectionInfoProvider = &self->_sectionInfoProvider;
  if (self->_sectionInfoProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_sectionInfoProvider, a3);
    p_sectionInfoProvider = (BLTSectionInfoListBBProvider **)[(BLTSectionInfoListBBProvider *)self->_sectionInfoProvider setDelegate:self];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_sectionInfoProvider, v5);
}

- (void)setOverrideProvider:(id)a3
{
  v5 = (BLTSectionInfoListOverrideProvider *)a3;
  p_overrideProvider = &self->_overrideProvider;
  if (self->_overrideProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_overrideProvider, a3);
    p_overrideProvider = (BLTSectionInfoListOverrideProvider **)[(BLTSectionInfoListOverrideProvider *)self->_overrideProvider setDelegate:self];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_overrideProvider, v5);
}

- (void)_updateListItem:(id)a3 overrides:(id)a4 sectionID:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LODWORD(self) = [WeakRetained sectionInfoList:self override:v8 shouldApplyToSectionInfoForSectionID:v9];

  if (self) {
    [v11 setOverrides:v8];
  }
}

- (void)reloadWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = BLTWorkQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke;
  v7[3] = &unk_264683C28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 88);
    id v4 = (void *)[v2 copy];
    [v3 addObject:v4];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 96))
  {
    *(unsigned char *)(v5 + 96) = 1;
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 112);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_2;
    v10[3] = &unk_264684568;
    id v11 = v6;
    uint64_t v12 = v7;
    id v9 = v6;
    [v8 reloadWithCompletion:v10];
  }
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_3;
  v12[3] = &unk_264684540;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v13 = v4;
  uint64_t v14 = v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v12];
  id v6 = *(void **)(*(void *)(a1 + 40) + 120);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_4;
  v9[3] = &unk_264684D20;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 reloadWithCompletion:v9];
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v6)
  {
    id v6 = objc_alloc_init(BLTSectionInfoListItem);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  [*(id *)(a1 + 40) _updateListItem:v6 overrides:v5 sectionID:v7];
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_5;
  block[3] = &unk_264683E78;
  id v9 = v3;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_6;
  v18[3] = &unk_264684CD0;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v19 = v3;
  uint64_t v20 = v4;
  [v2 enumerateObjectsUsingBlock:v18];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 48) + 24));
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_62;
  v17[3] = &unk_264684CF8;
  id v5 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 48);
  [v5 enumerateKeysAndObjectsUsingBlock:v17];
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 48) + 24));
  *(unsigned char *)(*(void *)(a1 + 48) + 97) = 1;
  *(unsigned char *)(*(void *)(a1 + 48) + 96) = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 48) + 88);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        id v9 = (void (**)(void))MEMORY[0x223CAC810](*(void *)(*((void *)&v13 + 1) + 8 * v11));

        v9[2](v9);
        ++v11;
        uint64_t v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v8);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 88), "removeAllObjects", (void)v13);
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 sectionID];
  if (!v4) {
    __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_6_cold_1();
  }
  id v5 = (void *)v4;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v6 = objc_alloc_init(BLTSectionInfoListItem);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  uint64_t v7 = blt_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v5;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "On reload, retrieved section info for %@", (uint8_t *)&v10, 0xCu);
  }

  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 40) + 24));
  [*(id *)(*(void *)(a1 + 40) + 16) addObject:v5];
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 40) + 24));
  uint64_t v8 = [v3 universalSectionID];

  if (v8)
  {
    id v9 = [v3 universalSectionID];
    [(BLTSectionInfoListItem *)v6 setUniversalSectionID:v9];
  }
  [*(id *)(a1 + 40) _migrateFromExternalDeviceSwitchToOverrides:v6 sectionID:v5];
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v12];
  if (v6)
  {
    uint64_t v7 = [v5 overrides];

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = [v5 overrides];
      [v8 _updateListItem:v6 overrides:v9 sectionID:v12];
    }
    int v10 = [v5 universalSectionID];

    if (v10)
    {
      uint64_t v11 = [v5 universalSectionID];
      [v6 setUniversalSectionID:v11];
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:v12];
  }
}

- (id)_sectionInfoFromSectionID:(id)a3 displayName:(id *)a4
{
  id v5 = [(BLTSectionInfoListBBProvider *)self->_sectionInfoProvider sectionInfoForSectionID:a3];
  id v6 = [v5 sectionInfo];
  if (a4)
  {
    *a4 = [v5 displayName];
  }

  return v6;
}

- (id)_lock_sectionInfoFromListItem:(id)a3 sectionID:(id)a4 displayName:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 phoneSectionID];
  uint64_t v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v9;
  }
  id v13 = v12;
  if (v11)
  {
    id v14 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v11];
  }
  else
  {
    id v14 = v8;
  }
  long long v15 = v14;
  if (!v14)
  {
    v24 = blt_settings_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[BLTSectionInfoList _lock_sectionInfoFromListItem:sectionID:displayName:]((uint64_t)v13, v24);
    }
    goto LABEL_22;
  }
  uint64_t v16 = [(BLTSectionInfoList *)self _sectionInfoFromSectionID:v13 displayName:a5];
  if (!v16)
  {
    v24 = blt_settings_log();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
      -[BLTSectionInfoList _lock_sectionInfoFromListItem:sectionID:displayName:]((uint64_t)v13, v24);
    }
LABEL_22:

    v17 = 0;
    goto LABEL_23;
  }
  v17 = (void *)v16;
  v18 = [v8 overriddenDisplayName];

  if (a5 && v18)
  {
    id v19 = [v8 overriddenDisplayName];
    *a5 = (id)[v19 copy];
  }
  if (v11) {
    [v17 setSectionID:v9];
  }
  uint64_t v20 = [v8 overriddenIcon];

  if (v20)
  {
    v21 = [v8 overriddenIcon];
    [v17 setIcon:v21];
  }
  uint64_t v22 = [v8 overriddenFactorySectionID];

  if (v22)
  {
    v23 = [v8 overriddenFactorySectionID];
    [v17 setFactorySectionID:v23];
  }
LABEL_23:

  return v17;
}

- (id)_overriddenSectionInfoForSectionID:(id)a3 originalSectionInfo:(id *)a4 displayName:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(BLTSectionInfoOverrideApplier);
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v11 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v8];
  id v12 = [(BLTSectionInfoList *)self _lock_sectionInfoFromListItem:v11 sectionID:v8 displayName:a5];

  id v13 = [v11 phoneSectionID];
  if (v13)
  {
    id v14 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v13];
  }
  else
  {
    id v14 = v11;
  }
  long long v15 = v14;
  uint64_t v16 = [v14 overrides];
  v17 = [(BLTSectionInfoOverrideApplier *)v9 applyOverrides:v16 toSectionInfo:v12];

  pthread_mutex_unlock(p_lock);
  if (a4) {
    *a4 = v12;
  }

  return v17;
}

- (id)overriddenSectionInfoForSectionID:(id)a3
{
  return [(BLTSectionInfoList *)self _overriddenSectionInfoForSectionID:a3 originalSectionInfo:0 displayName:0];
}

- (id)bbSectionInfoForSectionID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v5];
  uint64_t v7 = [(BLTSectionInfoList *)self _lock_sectionInfoFromListItem:v6 sectionID:v5 displayName:0];

  pthread_mutex_unlock(p_lock);
  return v7;
}

- (id)effectiveSectionInfoForSectionID:(id)a3
{
  id v4 = a3;
  id v16 = 0;
  id v17 = 0;
  id v5 = [(BLTSectionInfoList *)self _overriddenSectionInfoForSectionID:v4 originalSectionInfo:&v17 displayName:&v16];
  id v6 = v17;
  id v7 = v16;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v9 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v4];
  uint64_t v10 = BLTPBSectionInfoFromBBSectionInfo(v5);
  objc_msgSend(v10, "setPhoneAllowsNotifications:", objc_msgSend(v6, "allowsNotifications"));
  if ([MEMORY[0x263F57700] activePairedDeviceSupportsAuthorizationStatusLockScreenAndNCSettings])objc_msgSend(v10, "setPhoneAuthorizationStatus:", objc_msgSend(v6, "authorizationStatus")); {
  uint64_t v11 = [v10 displayName];
  }

  if (!v11) {
    [v10 setDisplayName:v7];
  }
  id v12 = [v9 universalSectionID];

  if (v12)
  {
    id v13 = [v9 universalSectionID];
    [v10 setUniversalSectionID:v13];
  }
  if (([MEMORY[0x263F57700] activePairedDeviceSupportsEmergencyAlerts] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "setDisplaysCriticalBulletinsLegacy:", objc_msgSend(WeakRetained, "sectionInfoListSectionIDHadDisplayedCriticalBulletins:", v4));
  }
  pthread_mutex_unlock(p_lock);

  return v10;
}

- (id)universalSectionIDForSectionID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v5];

  id v7 = [v6 universalSectionID];
  pthread_mutex_unlock(p_lock);

  return v7;
}

- (void)updateOverrides:(id)a3 forSectionID:(id)a4 transaction:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = a3;
  pthread_mutex_lock(&self->_lock);
  uint64_t v10 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v14];
  if (!v10)
  {
    uint64_t v10 = objc_alloc_init(BLTSectionInfoListItem);
    [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID setObject:v10 forKeyedSubscript:v14];
  }
  [(BLTSectionInfoList *)self _updateListItem:v10 overrides:v9 sectionID:v14];
  pthread_mutex_unlock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sectionInfoList:self receivedUpdatedSectionInfoForSectionID:v14 transaction:v8];

  id v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2BB58]];

  if (v12 && [v12 BOOLValue])
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 sectionInfoList:self makeAuthorizationPermanentForSectionID:v14];
  }
}

- (void)updateSectionInfoForSectionIDs:(id)a3 transaction:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id obj = a3;
  id v22 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        pthread_mutex_lock(&self->_lock);
        sectionInfoListItemsBySectionID = self->_sectionInfoListItemsBySectionID;
        id v12 = [v10 sectionID];
        id v13 = [(NSMutableDictionary *)sectionInfoListItemsBySectionID objectForKeyedSubscript:v12];

        if (!v13)
        {
          id v13 = objc_alloc_init(BLTSectionInfoListItem);
          id v14 = self->_sectionInfoListItemsBySectionID;
          long long v15 = [v10 sectionID];
          [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
        }
        sectionInfoSectionIDs = self->_sectionInfoSectionIDs;
        id v17 = [v10 sectionID];
        [(NSMutableSet *)sectionInfoSectionIDs addObject:v17];

        v18 = [v10 universalSectionID];
        [(BLTSectionInfoListItem *)v13 setUniversalSectionID:v18];

        pthread_mutex_unlock(&self->_lock);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v20 = [v10 sectionID];
        [WeakRetained sectionInfoList:self receivedUpdatedSectionInfoForSectionID:v20 transaction:v22];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)removedSectionWithSectionID:(id)a3 transaction:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID removeObjectForKey:v8];
  [(NSMutableSet *)self->_sectionInfoSectionIDs removeObject:v8];
  pthread_mutex_unlock(p_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sectionInfoList:self receivedRemoveSectionWithSectionID:v8 transaction:v7];
}

- (id)overrides
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID allValues];
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
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 overrides];

        if (v11)
        {
          id v12 = [v10 overrides];
          [v3 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  pthread_mutex_unlock(p_lock);
  return v3;
}

- (id)originalSettings
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(BLTSectionInfoList *)self sectionIDs];
  id v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = -[BLTSectionInfoList _sectionInfoFromSectionID:displayName:](self, "_sectionInfoFromSectionID:displayName:", *(void *)(*((void *)&v12 + 1) + 8 * i), 0, (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)overriddenSettings
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  pthread_mutex_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID copy];
  pthread_mutex_unlock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(BLTSectionInfoList *)self overriddenSectionInfoForSectionID:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)settingsDescriptionForSectionIDs:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F089D8] string];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = [NSString stringWithFormat:@"%@\n---\n", v9];
        [v5 appendString:v10];

        pthread_mutex_lock(&self->_lock);
        uint64_t v11 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v9];
        long long v12 = [v11 overrides];

        if (v12)
        {
          long long v13 = NSString;
          long long v14 = [v11 overrides];
          long long v15 = [v13 stringWithFormat:@"overrides: %@\n", v14];
          [v5 appendString:v15];
        }
        pthread_mutex_unlock(&self->_lock);
        id v23 = 0;
        long long v16 = [(BLTSectionInfoList *)self _overriddenSectionInfoForSectionID:v9 originalSectionInfo:&v23 displayName:0];
        id v17 = v23;
        v18 = [NSString stringWithFormat:@"originalSettings: %@\n", v17];
        [v5 appendString:v18];

        uint64_t v19 = [NSString stringWithFormat:@"overriddenSettings: %@\n---\n\n", v16];
        [v5 appendString:v19];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)sectionOverridesOnly
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v5 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v6 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID allKeys];
  uint64_t v7 = [v5 setWithArray:v6];

  [v7 minusSet:self->_sectionInfoSectionIDs];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__BLTSectionInfoList_sectionOverridesOnly__block_invoke;
  v12[3] = &unk_264684D48;
  void v12[4] = self;
  id v8 = v3;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];
  pthread_mutex_unlock(p_lock);
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __42__BLTSectionInfoList_sectionOverridesOnly__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v10];
  id v4 = [*(id *)(a1 + 32) _sectionInfoFromSectionID:v10 displayName:0];
  id v5 = [v3 overrides];

  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v7 = [BLTSectionInfoOverride alloc];
    id v8 = [v3 overrides];
    uint64_t v9 = [(BLTSectionInfoOverride *)v7 initWithOverrides:v8];
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v10];
  }
}

- (id)sectionOverrideOnlyForSectionID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  BOOL v6 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v5];
  uint64_t v7 = [(BLTSectionInfoList *)self _sectionInfoFromSectionID:v5 displayName:0];

  id v8 = [v6 overrides];

  uint64_t v9 = 0;
  if (v8) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v11 = [BLTSectionInfoOverride alloc];
    long long v12 = [v6 overrides];
    uint64_t v9 = [(BLTSectionInfoOverride *)v11 initWithOverrides:v12];
  }
  pthread_mutex_unlock(p_lock);

  return v9;
}

- (BOOL)hasCustomSettingsSetForSectionID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  BOOL v6 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v5];

  uint64_t v7 = [v6 phoneSectionID];
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v7];
  }
  else
  {
    id v8 = v6;
  }
  uint64_t v9 = v8;
  BOOL v10 = [v8 overrides];
  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2BB58]];
  char v12 = [v11 BOOLValue];

  pthread_mutex_unlock(p_lock);
  return v12;
}

- (void)_migrateFromExternalDeviceSwitchToOverrides:(id)a3 sectionID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  uint64_t v7 = [v19 overrides];

  if (!v7)
  {
    id v8 = [(BLTSectionInfoList *)self _sectionInfoFromSectionID:v6 displayName:0];
    uint64_t v9 = v8;
    if (v8
      && ([v8 showsOnExternalDevices] & 1) == 0
      && ([v9 suppressFromSettings] & 1) == 0)
    {
      BOOL v10 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v11 = [v9 sectionID];
      [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F2BB40]];

      [v10 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F2BB50]];
      uint64_t v12 = MEMORY[0x263EFFA88];
      [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F2BB58]];
      id v13 = [MEMORY[0x263EFF910] date];
      [v10 setObject:v13 forKeyedSubscript:*MEMORY[0x263F2BB80]];

      [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F2BB60]];
      id v14 = objc_alloc(MEMORY[0x263F57520]);
      long long v15 = (void *)[v14 initWithDomain:*MEMORY[0x263F2BB20]];
      long long v16 = [v9 sectionID];
      [v15 setObject:v10 forKey:v16];

      id v17 = (id)[v15 synchronize];
      v18 = [v9 sectionID];
      [(BLTSectionInfoList *)self _updateListItem:v19 overrides:v10 sectionID:v18];
    }
  }
}

- (void)reloadBBSection:(id)a3 completion:(id)a4
{
}

- (void)mapSection:(id)a3 map:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 mappedSectionID];
  if (v7)
  {
    p_lock = &self->_lock;
    pthread_mutex_lock(&self->_lock);
    uint64_t v9 = [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID objectForKeyedSubscript:v7];
    if (!v9)
    {
      uint64_t v9 = objc_alloc_init(BLTSectionInfoListItem);
      [(NSMutableDictionary *)self->_sectionInfoListItemsBySectionID setObject:v9 forKeyedSubscript:v7];
    }
    [(NSMutableSet *)self->_sectionInfoSectionIDs addObject:v7];
    BOOL v10 = [v6 mappedParentSectionID];
    [(BLTSectionInfoListItem *)v9 setOverriddenFactorySectionID:v10];

    [(BLTSectionInfoListItem *)v9 setPhoneSectionID:v13];
    uint64_t v11 = [v6 displayName];
    [(BLTSectionInfoListItem *)v9 setOverriddenDisplayName:v11];

    uint64_t v12 = [v6 icon];
    [(BLTSectionInfoListItem *)v9 setOverriddenIcon:v12];

    pthread_mutex_unlock(p_lock);
  }
}

- (BLTSectionInfoListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTSectionInfoListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BLTSectionInfoListOverrideProvider)overrideProvider
{
  return self->_overrideProvider;
}

- (BLTSectionInfoListBBProvider)sectionInfoProvider
{
  return self->_sectionInfoProvider;
}

- (BOOL)hasLoaded
{
  return self->_loaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfoProvider, 0);
  objc_storeStrong((id *)&self->_overrideProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_sectionInfoSectionIDs, 0);
  objc_storeStrong((id *)&self->_sectionInfoListItemsBySectionID, 0);
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_6_cold_1()
{
  __assert_rtn("-[BLTSectionInfoList reloadWithCompletion:]_block_invoke_6", "BLTSectionInfoList.m", 133, "sectionID != nil");
}

- (void)_lock_sectionInfoFromListItem:(uint64_t)a1 sectionID:(NSObject *)a2 displayName:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Requesting section info for unknown section %@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_sectionInfoFromListItem:(uint64_t)a1 sectionID:(NSObject *)a2 displayName:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, (os_log_type_t)0x90u, "Section info list item contains ID but BulletinBoard does not have section info for %@", (uint8_t *)&v2, 0xCu);
}

@end