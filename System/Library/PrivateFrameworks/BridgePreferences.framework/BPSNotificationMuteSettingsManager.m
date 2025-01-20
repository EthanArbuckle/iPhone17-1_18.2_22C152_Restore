@interface BPSNotificationMuteSettingsManager
+ (id)sharedNotificationMuteSettingsManager;
- (BOOL)isMutedForTodaySectionIdentifier:(id)a3;
- (BPSNotificationMuteSettingsManager)init;
- (id)mutedForTodaySectionIdentifiers;
- (void)_loadMutedSectionIdentifiers;
- (void)_queue_sync;
- (void)_updateObservers;
- (void)addSectionIdentifiers:(id)a3;
- (void)dealloc;
- (void)removeSectionIdentifiers:(id)a3;
@end

@implementation BPSNotificationMuteSettingsManager

+ (id)sharedNotificationMuteSettingsManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__BPSNotificationMuteSettingsManager_sharedNotificationMuteSettingsManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedNotificationMuteSettingsManager_onceToken != -1) {
    dispatch_once(&sharedNotificationMuteSettingsManager_onceToken, block);
  }
  v2 = (void *)sharedNotificationMuteSettingsManager___sharedNotificationMuteSettingsManager;
  return v2;
}

uint64_t __75__BPSNotificationMuteSettingsManager_sharedNotificationMuteSettingsManager__block_invoke(uint64_t a1)
{
  sharedNotificationMuteSettingsManager___sharedNotificationMuteSettingsManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (BPSNotificationMuteSettingsManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)BPSNotificationMuteSettingsManager;
  v2 = [(BPSNotificationMuteSettingsManager *)&v9 init];
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    npsManager = v2->_npsManager;
    v2->_npsManager = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Bridge.MuteSettingsManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    [(BPSNotificationMuteSettingsManager *)v2 _loadMutedSectionIdentifiers];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)BPSMuteForTodaySectionIdentifiersChanged, @"BLTMuteForTodaySectionIdentifiersChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"BLTMuteForTodaySectionIdentifiersChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)BPSNotificationMuteSettingsManager;
  [(BPSNotificationMuteSettingsManager *)&v4 dealloc];
}

- (void)_updateObservers
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"BPSNotificationMuteSettingsMutedForTodayChangedNotification" object:0];
}

- (void)_loadMutedSectionIdentifiers
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__BPSNotificationMuteSettingsManager__loadMutedSectionIdentifiers__block_invoke;
  block[3] = &unk_264408700;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __66__BPSNotificationMuteSettingsManager__loadMutedSectionIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  dispatch_queue_t v5 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nano"];
  id v6 = (id)[v5 synchronize];
  v7 = [v5 dictionaryForKey:@"MuteForTodaySectionIdentifiers"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v12 componentsSeparatedByString:@"-"];
        id v14 = objc_alloc_init(MEMORY[0x263EFF918]);
        v15 = [v13 objectAtIndexedSubscript:0];
        objc_msgSend(v14, "setDay:", objc_msgSend(v15, "integerValue"));

        v16 = [v13 objectAtIndexedSubscript:1];
        objc_msgSend(v14, "setMonth:", objc_msgSend(v16, "integerValue"));

        v17 = [v13 objectAtIndexedSubscript:2];
        objc_msgSend(v14, "setYear:", objc_msgSend(v17, "integerValue"));

        v18 = [v7 objectForKeyedSubscript:v12];
        v19 = [MEMORY[0x263EFF9C0] setWithArray:v18];
        [*(id *)(*(void *)(a1 + 32) + 8) setObject:v19 forKeyedSubscript:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)_queue_sync
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nano"];
  id v3 = (id)[v16 synchronize];
  objc_super v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_mutedSectionIdentifiersForDay;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld-%ld", objc_msgSend(v9, "day"), objc_msgSend(v9, "month"), objc_msgSend(v9, "year"));
        v11 = [(NSMutableDictionary *)self->_mutedSectionIdentifiersForDay objectForKeyedSubscript:v9];
        v12 = [v11 allObjects];

        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  if (![v4 count])
  {

    objc_super v4 = 0;
  }
  [v16 setObject:v4 forKey:@"MuteForTodaySectionIdentifiers"];
  id v13 = (id)[v16 synchronize];
  npsManager = self->_npsManager;
  v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"MuteForTodaySectionIdentifiers", 0);
  [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.nano" keys:v15];
}

- (id)mutedForTodaySectionIdentifiers
{
  id v3 = _BPSToday();
  objc_super v4 = [(NSMutableDictionary *)self->_mutedSectionIdentifiersForDay objectForKeyedSubscript:v3];

  return v4;
}

- (BOOL)isMutedForTodaySectionIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BPSNotificationMuteSettingsManager_isMutedForTodaySectionIdentifier___block_invoke;
  block[3] = &unk_264408BB8;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __71__BPSNotificationMuteSettingsManager_isMutedForTodaySectionIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutedForTodaySectionIdentifiers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (void)addSectionIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__BPSNotificationMuteSettingsManager_addSectionIdentifiers___block_invoke;
    block[3] = &unk_264408BE0;
    block[4] = self;
    id v7 = v4;
    uint64_t v8 = &v9;
    dispatch_sync(queue, block);
    if (*((unsigned char *)v10 + 24)) {
      [(BPSNotificationMuteSettingsManager *)self _updateObservers];
    }

    _Block_object_dispose(&v9, 8);
  }
}

void __60__BPSNotificationMuteSettingsManager_addSectionIdentifiers___block_invoke(uint64_t a1)
{
  _BPSToday();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:");

  if (!v2)
  {
    id v3 = [MEMORY[0x263EFF9C0] set];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v3 forKeyedSubscript:v9];
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
  uint64_t v5 = [v4 count];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
  [v6 unionSet:*(void *)(a1 + 40)];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
  uint64_t v8 = [v7 count];

  if (v8 != v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_sync");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)removeSectionIdentifiers:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__BPSNotificationMuteSettingsManager_removeSectionIdentifiers___block_invoke;
  v7[3] = &unk_264408C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __63__BPSNotificationMuteSettingsManager_removeSectionIdentifiers___block_invoke(uint64_t a1)
{
  _BPSToday();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7];
  uint64_t v3 = [v2 count];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7];
  [v4 minusSet:*(void *)(a1 + 40)];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7];
  uint64_t v6 = [v5 count];

  if (v6 != v3) {
    objc_msgSend(*(id *)(a1 + 32), "_queue_sync");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_mutedSectionIdentifiersForDay, 0);
}

@end