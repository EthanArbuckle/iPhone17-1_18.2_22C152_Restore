@interface BLTMuteSync
- (BLTMuteSync)init;
- (BOOL)isMutedForTodaySectionIdentifier:(id)a3;
- (NSSet)mutedForTodaySectionIdentifiers;
- (void)_cleanMuteIdentifiers;
- (void)_loadMutedSectionIdentifiers;
- (void)_queue_sync;
- (void)_updateObservers;
- (void)addSectionIdentifiers:(id)a3;
- (void)dealloc;
- (void)removeSectionIdentifiers:(id)a3;
@end

@implementation BLTMuteSync

- (BLTMuteSync)init
{
  v11.receiver = self;
  v11.super_class = (Class)BLTMuteSync;
  v2 = [(BLTMuteSync *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.bulletindistributor.mutesync", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    npsManager = v2->_npsManager;
    v2->_npsManager = v6;

    [(BLTMuteSync *)v2 _loadMutedSectionIdentifiers];
    [(BLTMuteSync *)v2 _cleanMuteIdentifiers];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)BLTSignificantTimeChanged, @"SignificantTimeChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v2, (CFNotificationCallback)BLTMuteForTodaySectionIdentifiersChanged, @"BLTMuteForTodaySectionIdentifiersChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  dispatch_queue_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"BLTMuteForTodaySectionIdentifiersChangedNotification", 0);
  v5.receiver = self;
  v5.super_class = (Class)BLTMuteSync;
  [(BLTMuteSync *)&v5 dealloc];
}

- (void)_updateObservers
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"BLTMuteSyncMutedForTodayChangedNotification" object:0];
}

- (void)_cleanMuteIdentifiers
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__BLTMuteSync__cleanMuteIdentifiers__block_invoke;
  v4[3] = &unk_264685790;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(BLTMuteSync *)self _updateObservers];
  }
  _Block_object_dispose(&v5, 8);
}

void __36__BLTMuteSync__cleanMuteIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = _BLTToday();
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 isEqual:v2] & 1) == 0) {
          [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (v9 != [v3 count])
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_sync");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)_loadMutedSectionIdentifiers
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BLTMuteSync__loadMutedSectionIdentifiers__block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __43__BLTMuteSync__loadMutedSectionIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nano"];
  id v6 = (id)[v5 synchronize];
  uint64_t v7 = [v5 dictionaryForKey:@"MuteForTodaySectionIdentifiers"];
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
        long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v13 = [v12 componentsSeparatedByString:@"-"];
        id v14 = objc_alloc_init(MEMORY[0x263EFF918]);
        uint64_t v15 = [v13 objectAtIndexedSubscript:0];
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
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
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
        long long v11 = [(NSMutableDictionary *)self->_mutedSectionIdentifiersForDay objectForKeyedSubscript:v9];
        long long v12 = [v11 allObjects];

        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  if (![v4 count])
  {

    uint64_t v4 = 0;
  }
  [v16 setObject:v4 forKey:@"MuteForTodaySectionIdentifiers"];
  id v13 = (id)[v16 synchronize];
  npsManager = self->_npsManager;
  uint64_t v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"MuteForTodaySectionIdentifiers", 0);
  [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.nano" keys:v15];
}

- (NSSet)mutedForTodaySectionIdentifiers
{
  id v3 = _BLTToday();
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__9;
  uint64_t v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__BLTMuteSync_mutedForTodaySectionIdentifiers__block_invoke;
  block[3] = &unk_264683B88;
  id v9 = v3;
  uint64_t v10 = &v11;
  block[4] = self;
  id v5 = v3;
  dispatch_sync(queue, block);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSSet *)v6;
}

void __46__BLTMuteSync_mutedForTodaySectionIdentifiers__block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isMutedForTodaySectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BLTMuteSync *)self mutedForTodaySectionIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
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
    block[2] = __37__BLTMuteSync_addSectionIdentifiers___block_invoke;
    block[3] = &unk_2646857B8;
    block[4] = self;
    id v7 = v4;
    uint64_t v8 = &v9;
    dispatch_sync(queue, block);
    if (*((unsigned char *)v10 + 24)) {
      [(BLTMuteSync *)self _updateObservers];
    }

    _Block_object_dispose(&v9, 8);
  }
}

void __37__BLTMuteSync_addSectionIdentifiers___block_invoke(uint64_t a1)
{
  _BLTToday();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:");

  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v3 forKeyedSubscript:v9];
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
  uint64_t v5 = [v4 count];

  char v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
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
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__BLTMuteSync_removeSectionIdentifiers___block_invoke;
  block[3] = &unk_2646857B8;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  id v9 = &v10;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v11 + 24)) {
    [(BLTMuteSync *)self _updateObservers];
  }

  _Block_object_dispose(&v10, 8);
}

void __40__BLTMuteSync_removeSectionIdentifiers___block_invoke(uint64_t a1)
{
  _BLTToday();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7];
  uint64_t v3 = [v2 count];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7];
  [v4 minusSet:*(void *)(a1 + 40)];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7];
  uint64_t v6 = [v5 count];

  if (v6 != v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_sync");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_mutedSectionIdentifiersForDay, 0);
}

@end