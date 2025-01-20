@interface BLTSectionInfoListBridgeProvider
- (BLTSectionConfiguration)sectionConfiguration;
- (BLTSectionInfoListBridgeProvider)initWithSectionConfiguration:(id)a3;
- (BLTSectionInfoListProviderDelegate)delegate;
- (id)_companionSetupNotificationSettingsDictionaryForSectionInfo:(id)a3 sectionID:(id)a4;
- (id)_loadOverridesChangedSince:(id)a3;
- (void)_reloadUpdatedOverrides;
- (void)_reloadUpdatedOverridesWithCompletion:(id)a3;
- (void)dealloc;
- (void)enableCustomSettingsForWatchSectionID:(id)a3;
- (void)reloadWithCompletion:(id)a3;
- (void)removeSectionWithSectionID:(id)a3;
- (void)setCustomSettingsWithSectionInfo:(id)a3;
- (void)setCustomSettingsWithSectionInfo:(id)a3 watchSectionID:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNotificationsLevel:(int)a3 sectionID:(id)a4 forceCustom:(BOOL)a5;
- (void)setSectionConfiguration:(id)a3;
@end

@implementation BLTSectionInfoListBridgeProvider

- (BLTSectionInfoListBridgeProvider)initWithSectionConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLTSectionInfoListBridgeProvider;
  v6 = [(BLTSectionInfoListBridgeProvider *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sectionConfiguration, a3);
    id v8 = objc_alloc(MEMORY[0x263F57520]);
    uint64_t v9 = [v8 initWithDomain:*MEMORY[0x263F2BB20]];
    npsDomainAccessor = v7->_npsDomainAccessor;
    v7->_npsDomainAccessor = (NPSDomainAccessor *)v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)BBSectionsChanged, (CFStringRef)*MEMORY[0x263F2BB28], 0, (CFNotificationSuspensionBehavior)0);
  }

  return v7;
}

- (void)reloadWithCompletion:(id)a3
{
  p_lock = &self->_lock;
  id v7 = a3;
  pthread_mutex_lock(p_lock);
  id v5 = [MEMORY[0x263EFF910] distantPast];
  lastKnownBridgeSettingsChangeDate = self->_lastKnownBridgeSettingsChangeDate;
  self->_lastKnownBridgeSettingsChangeDate = v5;

  pthread_mutex_unlock(p_lock);
  [(BLTSectionInfoListBridgeProvider *)self _reloadUpdatedOverridesWithCompletion:v7];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F2BB28], 0);
  v4.receiver = self;
  v4.super_class = (Class)BLTSectionInfoListBridgeProvider;
  [(BLTSectionInfoListBridgeProvider *)&v4 dealloc];
}

- (void)_reloadUpdatedOverrides
{
  v3 = +[BLTTransaction transactionWithDescription:@"BLTSectionInfoListBridgeProvider _reloadUpdatedOverrides"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__BLTSectionInfoListBridgeProvider__reloadUpdatedOverrides__block_invoke;
  v5[3] = &unk_264684568;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(BLTSectionInfoListBridgeProvider *)self _reloadUpdatedOverridesWithCompletion:v5];
}

void __59__BLTSectionInfoListBridgeProvider__reloadUpdatedOverrides__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__BLTSectionInfoListBridgeProvider__reloadUpdatedOverrides__block_invoke_2;
  v4[3] = &unk_264684540;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __59__BLTSectionInfoListBridgeProvider__reloadUpdatedOverrides__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  BLTAnalyticsLogMirroredNotificationsOverrides(v6, v5);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  [WeakRetained updateOverrides:v5 forSectionID:v6 transaction:*(void *)(a1 + 40)];
}

- (void)_reloadUpdatedOverridesWithCompletion:(id)a3
{
  uint64_t v9 = (void (**)(id, void *))a3;
  pthread_mutex_lock(&self->_lock);
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = self->_lastKnownBridgeSettingsChangeDate;
  id v6 = [v4 date];
  lastKnownBridgeSettingsChangeDate = self->_lastKnownBridgeSettingsChangeDate;
  self->_lastKnownBridgeSettingsChangeDate = v6;

  pthread_mutex_unlock(&self->_lock);
  id v8 = [(BLTSectionInfoListBridgeProvider *)self _loadOverridesChangedSince:v5];

  if (v9) {
    v9[2](v9, v8);
  }
}

- (id)_loadOverridesChangedSince:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = blt_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v49 = (uint64_t)v4;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Reloading Bridge settings changed after date: %@", buf, 0xCu);
  }

  id v6 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
  id v7 = (void *)[(NPSDomainAccessor *)self->_npsDomainAccessor copyKeyList];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = blt_settings_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = [v7 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = v11;
      _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "Bridge settings found with count: %lu", buf, 0xCu);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v30 = v7;
    obuint64_t j = v7;
    uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v35)
    {
      uint64_t v12 = *(void *)v41;
      uint64_t v13 = *MEMORY[0x263F2BB80];
      v32 = self;
      id v33 = v4;
      uint64_t v31 = *MEMORY[0x263F2BB80];
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          v16 = -[NPSDomainAccessor dictionaryForKey:](self->_npsDomainAccessor, "dictionaryForKey:", v15, v30);
          v17 = [v16 objectForKeyedSubscript:v13];
          id v18 = [v17 earlierDate:v4];

          if (v18 == v4)
          {
            v19 = [(BLTSectionInfoListBridgeProvider *)self sectionConfiguration];
            v20 = [v19 additionalBridgeSectionIDsForSectionID:v15];

            if (v20)
            {
              uint64_t v46 = v15;
              v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
              v22 = [v21 arrayByAddingObjectsFromArray:v20];
            }
            else
            {
              uint64_t v45 = v15;
              v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
            }
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v23 = v22;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v37;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v37 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  [v8 setObject:v16 forKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * j)];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v25);
            }

            self = v32;
            id v4 = v33;
            uint64_t v13 = v31;
          }
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v35);
    }

    uint64_t v9 = blt_settings_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = v28;
      _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "Relevant Bridge setting count: %lu", buf, 0xCu);
    }
    id v7 = v30;
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "No Bridge settings could be found", buf, 2u);
  }

  return v8;
}

- (void)setNotificationsLevel:(int)a3 sectionID:(id)a4 forceCustom:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = +[BLTTransaction transactionWithDescription:@"BLTSectionInfoListBridgeProvider setNotificationsLevel:sectionID:forceCustom:"];
  id v10 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v11 = (void *)[v10 initWithDomain:*MEMORY[0x263F2BB20]];
  id v12 = (id)[v11 synchronize];
  uint64_t v13 = [v11 dictionaryForKey:v8];
  v14 = (void *)[v13 mutableCopy];

  uint64_t v15 = *MEMORY[0x263F2BB58];
  v16 = [v14 objectForKeyedSubscript:*MEMORY[0x263F2BB58]];
  char v17 = [v16 BOOLValue];

  if ((v17 & 1) != 0 || v5)
  {
    id v18 = blt_settings_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      id v27 = v8;
      _os_log_impl(&dword_222F4C000, v18, OS_LOG_TYPE_INFO, "Disabling notification in bridge for %@", (uint8_t *)&v26, 0xCu);
    }

    if (!v14)
    {
      v14 = [MEMORY[0x263EFF9A0] dictionary];
    }
    [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v15];
    v19 = [NSNumber numberWithInt:a3 == 2];
    [v14 setObject:v19 forKeyedSubscript:*MEMORY[0x263F2BB50]];

    v20 = [NSNumber numberWithInt:a3 == 1];
    [v14 setObject:v20 forKeyedSubscript:*MEMORY[0x263F2BB48]];

    uint64_t v21 = *MEMORY[0x263F2BB40];
    v22 = [v14 objectForKeyedSubscript:*MEMORY[0x263F2BB40]];

    if (!v22) {
      [v14 setObject:v8 forKeyedSubscript:v21];
    }
    id v23 = [MEMORY[0x263EFF910] date];
    [v14 setObject:v23 forKeyedSubscript:*MEMORY[0x263F2BB80]];

    [v11 setObject:v14 forKey:v8];
    id v24 = (id)[v11 synchronize];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained updateOverrides:v14 forSectionID:v8 transaction:v9];
  }
}

- (void)setCustomSettingsWithSectionInfo:(id)a3
{
  id v12 = a3;
  id v4 = +[BLTTransaction transactionWithDescription:@"BLTSectionInfoListBridgeProvider setCustomSettingsWithSectionInfo:"];
  BOOL v5 = [v12 sectionID];
  id v6 = [(BLTSectionInfoListBridgeProvider *)self _companionSetupNotificationSettingsDictionaryForSectionInfo:v12 sectionID:v5];

  if (v6)
  {
    npsDomainAccessor = self->_npsDomainAccessor;
    id v8 = [v12 sectionID];
    [(NPSDomainAccessor *)npsDomainAccessor setObject:v6 forKey:v8];

    id v9 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v11 = [v12 sectionID];
    [WeakRetained updateOverrides:v6 forSectionID:v11 transaction:v4];
  }
}

- (void)setCustomSettingsWithSectionInfo:(id)a3 watchSectionID:(id)a4
{
  id v6 = a4;
  id v7 = [(BLTSectionInfoListBridgeProvider *)self _companionSetupNotificationSettingsDictionaryForSectionInfo:a3 sectionID:v6];
  id v8 = v7;
  if (a3 && v7)
  {
    [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F2BB58]];
    id v9 = BLTWorkQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__BLTSectionInfoListBridgeProvider_setCustomSettingsWithSectionInfo_watchSectionID___block_invoke;
    block[3] = &unk_264683E78;
    block[4] = self;
    id v11 = v8;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

id __84__BLTSectionInfoListBridgeProvider_setCustomSettingsWithSectionInfo_watchSectionID___block_invoke(void *a1)
{
  return (id)[*(id *)(a1[4] + 80) synchronize];
}

- (id)_companionSetupNotificationSettingsDictionaryForSectionInfo:(id)a3 sectionID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
    id v9 = [(NPSDomainAccessor *)self->_npsDomainAccessor dictionaryForKey:v7];
    id v10 = (void *)[v9 mutableCopy];

    if (!v10)
    {
      id v11 = blt_settings_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v7;
        _os_log_impl(&dword_222F4C000, v11, OS_LOG_TYPE_INFO, "Creating new settings for app %@", (uint8_t *)&v23, 0xCu);
      }

      id v10 = [MEMORY[0x263EFF9A0] dictionary];
    }
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F2BB58]];
    id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "blt_overrideShowsAlerts"));
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F2BB50]];

    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "blt_overrideSendToNotificationCenter"));
    [v10 setObject:v13 forKeyedSubscript:*MEMORY[0x263F2BB48]];

    v14 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(v6, "pushSettings") >> 4) & 1);
    [v10 setObject:v14 forKeyedSubscript:*MEMORY[0x263F2BB68]];

    if ([v6 criticalAlertSetting])
    {
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "criticalAlertSetting") == 2);
      [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x263F2BB38]];
    }
    else
    {
      [v10 removeObjectForKey:*MEMORY[0x263F2BB38]];
    }
    uint64_t v17 = [v6 bulletinGroupingSetting];
    id v18 = &unk_26D607D98;
    if (v17 == 1) {
      id v18 = &unk_26D607D80;
    }
    if (v17 == 2) {
      v19 = &unk_26D607D68;
    }
    else {
      v19 = v18;
    }
    [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x263F2BB30]];
    uint64_t v20 = *MEMORY[0x263F2BB40];
    uint64_t v21 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2BB40]];

    if (!v21) {
      [v10 setObject:v7 forKeyedSubscript:v20];
    }
    v16 = [MEMORY[0x263EFF910] date];
    [v10 setObject:v16 forKeyedSubscript:*MEMORY[0x263F2BB80]];
  }
  else
  {
    v16 = blt_settings_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BLTSectionInfoListBridgeProvider _companionSetupNotificationSettingsDictionaryForSectionInfo:sectionID:](v16);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)enableCustomSettingsForWatchSectionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
    id v6 = [(NPSDomainAccessor *)self->_npsDomainAccessor dictionaryForKey:v4];
    id v7 = [v6 mutableCopy];

    if (v7)
    {
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F2BB58]];
      [(NPSDomainAccessor *)self->_npsDomainAccessor setObject:v7 forKey:v4];
      id v8 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
    }
    else
    {
      id v9 = blt_settings_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BLTSectionInfoListBridgeProvider enableCustomSettingsForWatchSectionID:]((uint64_t)v4, v9);
      }
    }
  }
  else
  {
    id v7 = blt_settings_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BLTSectionInfoListBridgeProvider _companionSetupNotificationSettingsDictionaryForSectionInfo:sectionID:](v7);
    }
  }
}

- (void)removeSectionWithSectionID:(id)a3
{
  npsDomainAccessor = self->_npsDomainAccessor;
  id v5 = a3;
  id v6 = (id)[(NPSDomainAccessor *)npsDomainAccessor synchronize];
  [(NPSDomainAccessor *)self->_npsDomainAccessor removeObjectForKey:v5];

  id v7 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
}

- (BLTSectionInfoListProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTSectionInfoListProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BLTSectionConfiguration)sectionConfiguration
{
  return self->_sectionConfiguration;
}

- (void)setSectionConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_npsDomainAccessor, 0);
  objc_storeStrong((id *)&self->_lastKnownBridgeSettingsChangeDate, 0);
}

- (void)_companionSetupNotificationSettingsDictionaryForSectionInfo:(os_log_t)log sectionID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Trying to set custom settings on undefined app", v1, 2u);
}

- (void)enableCustomSettingsForWatchSectionID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Settings not found for app %@", (uint8_t *)&v2, 0xCu);
}

@end