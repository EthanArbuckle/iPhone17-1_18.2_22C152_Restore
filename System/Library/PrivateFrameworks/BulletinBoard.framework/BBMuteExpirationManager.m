@interface BBMuteExpirationManager
- (BBMuteExpirationManager)initWithQueue:(id)a3;
- (BBMuteExpirationManagerDelegate)delegate;
- (BOOL)cleanAndWatchExpirationsForSectionInfo:(id)a3;
- (BOOL)cleanAndWatchExpirationsForSectionInfo:(id)a3 currentDate:(id)a4;
- (NSMutableDictionary)timersBySectionID;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)queue;
- (id)scheduledExpirationDateForSectionID:(id)a3;
- (id)timerForSectionID:(id)a3;
- (unint64_t)numberOfTimers;
- (void)_cancelTimerForSectionID:(id)a3;
- (void)_queue_triggerDidFireForExpiryTimer:(id)a3;
- (void)dealloc;
- (void)setAccessQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimersBySectionID:(id)a3;
@end

@implementation BBMuteExpirationManager

- (BBMuteExpirationManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BBMuteExpirationManager;
  v5 = [(BBMuteExpirationManager *)&v10 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.BulletinBoard.BBMuteExpirationManager.accessQueue", v6);
    [(BBMuteExpirationManager *)v5 setAccessQueue:v7];

    [(BBMuteExpirationManager *)v5 setQueue:v4];
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(BBMuteExpirationManager *)v5 setTimersBySectionID:v8];
  }
  return v5;
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__BBMuteExpirationManager_dealloc__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)BBMuteExpirationManager;
  [(BBMuteExpirationManager *)&v4 dealloc];
}

void __34__BBMuteExpirationManager_dealloc__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) timersBySectionID];
  [v1 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_21];
}

uint64_t __34__BBMuteExpirationManager_dealloc__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (BOOL)cleanAndWatchExpirationsForSectionInfo:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 now];
  LOBYTE(self) = [(BBMuteExpirationManager *)self cleanAndWatchExpirationsForSectionInfo:v5 currentDate:v6];

  return (char)self;
}

- (BOOL)cleanAndWatchExpirationsForSectionInfo:(id)a3 currentDate:(id)a4
{
  v26[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v24 = 0;
  id v7 = a4;
  id v8 = [v6 muteAssertion];
  id v23 = 0;
  [v8 getNextExpirationDate:&v23 wasPurged:&v24 currentDate:v7];

  id v9 = v23;
  objc_super v10 = [v6 sectionID];
  if (v9
    || ([v6 muteAssertion], v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    BOOL v11 = v24 != 0;
  }
  else
  {
    [v6 setMuteAssertion:0];
    BOOL v11 = 1;
  }
  v13 = [(BBMuteExpirationManager *)self scheduledExpirationDateForSectionID:v10];
  if (v13 && v9)
  {
    if (([v9 isEqualToDate:v13] & 1) == 0)
    {
      [(BBMuteExpirationManager *)self _cancelTimerForSectionID:v10];
LABEL_10:
      v25[0] = @"sectionIDKey";
      v25[1] = @"scheduledExpirationDateKey";
      v26[0] = v10;
      v26[1] = v9;
      v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
      v15 = (void *)[objc_alloc(MEMORY[0x263F5D400]) initWithFireDate:v9 serviceIdentifier:v10 target:self selector:sel__queue_triggerDidFireForExpiryTimer_ userInfo:v14];
      [v15 setMinimumEarlyFireProportion:1.0];
      [v15 setUserVisible:1];
      v16 = [(BBMuteExpirationManager *)self queue];
      [v15 scheduleInQueue:v16];

      v17 = [(BBMuteExpirationManager *)self accessQueue];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __78__BBMuteExpirationManager_cleanAndWatchExpirationsForSectionInfo_currentDate___block_invoke;
      v20[3] = &unk_264296418;
      v20[4] = self;
      id v21 = v15;
      id v22 = v10;
      id v18 = v15;
      dispatch_sync(v17, v20);
    }
  }
  else
  {
    [(BBMuteExpirationManager *)self _cancelTimerForSectionID:v10];
    if (v9) {
      goto LABEL_10;
    }
  }

  return v11;
}

void __78__BBMuteExpirationManager_cleanAndWatchExpirationsForSectionInfo_currentDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timersBySectionID];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (unint64_t)numberOfTimers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(BBMuteExpirationManager *)self accessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__BBMuteExpirationManager_numberOfTimers__block_invoke;
  v6[3] = &unk_264296728;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __41__BBMuteExpirationManager_numberOfTimers__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timersBySectionID];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)timerForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  id v5 = [(BBMuteExpirationManager *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__BBMuteExpirationManager_timerForSectionID___block_invoke;
  block[3] = &unk_264296198;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__BBMuteExpirationManager_timerForSectionID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) timersBySectionID];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)scheduledExpirationDateForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  id v5 = [(BBMuteExpirationManager *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BBMuteExpirationManager_scheduledExpirationDateForSectionID___block_invoke;
  block[3] = &unk_264296198;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(v5, block);

  id v7 = [(id)v13[5] valueForKey:@"scheduledExpirationDateKey"];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__BBMuteExpirationManager_scheduledExpirationDateForSectionID___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) timersBySectionID];
  uint64_t v2 = [v6 valueForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 userInfo];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_cancelTimerForSectionID:(id)a3
{
  id v4 = a3;
  id v5 = [(BBMuteExpirationManager *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__BBMuteExpirationManager__cancelTimerForSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __52__BBMuteExpirationManager__cancelTimerForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) timersBySectionID];
  id v5 = [v2 objectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = v5;
  if (v5)
  {
    [v5 invalidate];
    id v4 = [*(id *)(a1 + 32) timersBySectionID];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    uint64_t v3 = v5;
  }
}

- (void)_queue_triggerDidFireForExpiryTimer:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 valueForKey:@"sectionIDKey"];

  id v6 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v5;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mute assertion expired", buf, 0xCu);
  }
  id v7 = [(BBMuteExpirationManager *)self accessQueue];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __63__BBMuteExpirationManager__queue_triggerDidFireForExpiryTimer___block_invoke;
  v13 = &unk_264295E50;
  uint64_t v14 = self;
  id v15 = v5;
  id v8 = v5;
  dispatch_sync(v7, &v10);

  uint64_t v9 = [(BBMuteExpirationManager *)self delegate];
  [v9 didChangeMuteAssertionForSectionID:v8];
}

void __63__BBMuteExpirationManager__queue_triggerDidFireForExpiryTimer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timersBySectionID];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (BBMuteExpirationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BBMuteExpirationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSMutableDictionary)timersBySectionID
{
  return self->_timersBySectionID;
}

- (void)setTimersBySectionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timersBySectionID, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end