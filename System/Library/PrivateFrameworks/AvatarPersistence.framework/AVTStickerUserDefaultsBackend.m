@interface AVTStickerUserDefaultsBackend
- (AVTStickerBackendDelegate)stickerBackendDelegate;
- (AVTStickerUserDefaultsBackend)initWithWorkQueue:(id)a3 environment:(id)a4 userDefaults:(id)a5;
- (AVTUILogger)logger;
- (NSMutableArray)stickers;
- (NSURL)cacheLocation;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)workQueue;
- (id)addNextFrequencyCountToFrequencySum:(id)a3;
- (id)fetchAllStickers;
- (id)fetchMostRecentStickersWithLimit:(unint64_t)a3;
- (id)fetchStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4;
- (id)nextFrequencyCount;
- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4;
- (id)stickersIndexesMatchingAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4;
- (unint64_t)frequencyCounter;
- (void)_recentStickersChangedExternally;
- (void)addStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4;
- (void)dealloc;
- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4;
- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5;
- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5;
- (void)getStickersFromUserDefaults;
- (void)saveStickersToUserDefaults;
- (void)setFrequencyCounter:(unint64_t)a3;
- (void)setStickerBackendDelegate:(id)a3;
- (void)setStickers:(id)a3;
- (void)updateStickerAtIndex:(unint64_t)a3;
@end

@implementation AVTStickerUserDefaultsBackend

- (AVTStickerUserDefaultsBackend)initWithWorkQueue:(id)a3 environment:(id)a4 userDefaults:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AVTStickerUserDefaultsBackend;
  v12 = [(AVTStickerUserDefaultsBackend *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    uint64_t v14 = [v10 logger];
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    objc_storeStrong((id *)&v13->_userDefaults, a5);
    uint64_t v16 = [v10 stickerImageStoreLocation];
    cacheLocation = v13->_cacheLocation;
    v13->_cacheLocation = (NSURL *)v16;

    [(AVTStickerUserDefaultsBackend *)v13 getStickersFromUserDefaults];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)_RecentStickersChangedExternally, @"AVTRecentStickerChangedExternallyNotification", 0, CFNotificationSuspensionBehaviorDrop);
  }

  return v13;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"AVTRecentStickerChangedExternallyNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)AVTStickerUserDefaultsBackend;
  [(AVTStickerUserDefaultsBackend *)&v4 dealloc];
}

- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  v7 = [(AVTStickerUserDefaultsBackend *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__AVTStickerUserDefaultsBackend_recentStickersForFetchRequest_error___block_invoke;
  block[3] = &unk_2647C3FB8;
  block[4] = self;
  uint64_t v14 = &v15;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync(v7, block);

  id v9 = (void *)v16[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    *a4 = 0;
  }

  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __69__AVTStickerUserDefaultsBackend_recentStickersForFetchRequest_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stickers];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    if ([*(id *)(a1 + 40) criteria] == 1)
    {
      uint64_t v4 = [*(id *)(a1 + 32) fetchAllStickers];
LABEL_7:
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v4;
      goto LABEL_8;
    }
    if ([*(id *)(a1 + 40) criteria] == 2)
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "fetchMostRecentStickersWithLimit:", objc_msgSend(*(id *)(a1 + 40), "resultLimit"));
      goto LABEL_7;
    }
    uint64_t result = [*(id *)(a1 + 40) criteria];
    if (result != 3) {
      return result;
    }
    v5 = *(void **)(a1 + 32);
    uint64_t v11 = [*(id *)(a1 + 40) avatarIdentifier];
    id v6 = [*(id *)(a1 + 40) stickerIdentifier];
    uint64_t v7 = [v5 fetchStickersWithAvatarIdentifier:v11 stickerIdentifier:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
  }
LABEL_8:

  return MEMORY[0x270F9A758]();
}

- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(AVTStickerUserDefaultsBackend *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __103__AVTStickerUserDefaultsBackend_didUseStickerWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_2647C3870;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __103__AVTStickerUserDefaultsBackend_didUseStickerWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stickers];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __103__AVTStickerUserDefaultsBackend_didUseStickerWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke_2;
  id v9 = &unk_2647C3FE0;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 indexOfObjectPassingTest:&v6];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v4, "addStickerWithAvatarIdentifier:stickerIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48), v6, v7, v8, v9, v10);
  }
  else {
    objc_msgSend(v4, "updateStickerAtIndex:", v3, v6, v7, v8, v9, v10);
  }
  [*(id *)(a1 + 32) saveStickersToUserDefaults];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 1, 0);
  }
}

uint64_t __103__AVTStickerUserDefaultsBackend_didUseStickerWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 avatarRecordIdentifier];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [v3 stickerConfigurationIdentifier];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(AVTStickerUserDefaultsBackend *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __110__AVTStickerUserDefaultsBackend_deleteRecentStickersWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_2647C3870;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __110__AVTStickerUserDefaultsBackend_deleteRecentStickersWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) stickersIndexesMatchingAvatarIdentifier:*(void *)(a1 + 40) stickerIdentifier:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) stickers];
  [v2 removeObjectsAtIndexes:v4];

  [*(id *)(a1 + 32) saveStickersToUserDefaults];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 1, 0);
  }
}

- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTStickerUserDefaultsBackend *)self logger];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__AVTStickerUserDefaultsBackend_deleteRecentStickersForChangeTracker_completionHandler___block_invoke;
  v11[3] = &unk_2647C3A28;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 deletingStickerRecentsForRemoteChanges:v11];
}

void __88__AVTStickerUserDefaultsBackend_deleteRecentStickersForChangeTracker_completionHandler___block_invoke(uint64_t a1)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__AVTStickerUserDefaultsBackend_deleteRecentStickersForChangeTracker_completionHandler___block_invoke_2;
  v9[3] = &unk_2647C4008;
  v9[4] = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x22A660070](v9);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) cacheLocation];
  id v8 = 0;
  uint64_t v5 = [v3 processChangeTransactionsWithChangeTokenLocation:v4 handler:v2 error:&v8];
  id v6 = v8;

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);
  }
}

uint64_t __88__AVTStickerUserDefaultsBackend_deleteRecentStickersForChangeTracker_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 changeType] == 1)
        {
          id v9 = *(void **)(a1 + 32);
          id v10 = [v8 recordIdentifier];
          [v9 deleteRecentStickersWithAvatarIdentifier:v10 stickerIdentifier:0 completionHandler:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return 1;
}

- (void)_recentStickersChangedExternally
{
  id v3 = [(AVTStickerUserDefaultsBackend *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__AVTStickerUserDefaultsBackend__recentStickersChangedExternally__block_invoke;
  block[3] = &unk_2647C3760;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __65__AVTStickerUserDefaultsBackend__recentStickersChangedExternally__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) frequencyCounter];
  [*(id *)(a1 + 32) getStickersFromUserDefaults];
  if ([*(id *)(a1 + 32) frequencyCounter] != v2)
  {
    id v3 = [*(id *)(a1 + 32) stickerBackendDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) stickerBackendDelegate];
      [v5 recentStickersDidChange:*(void *)(a1 + 32)];
    }
  }
}

- (void)getStickersFromUserDefaults
{
  id v3 = [(AVTStickerUserDefaultsBackend *)self userDefaults];
  char v4 = [v3 objectForKey:@"AVTRecentStickers" inDomain:@"com.apple.animoji"];

  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  id v17 = 0;
  id v11 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v10 fromData:v4 error:&v17];
  id v12 = v17;
  long long v13 = [v11 objectForKeyedSubscript:@"AVTFrequencyCounter"];
  -[AVTStickerUserDefaultsBackend setFrequencyCounter:](self, "setFrequencyCounter:", [v13 unsignedIntegerValue]);
  long long v14 = [v11 objectForKeyedSubscript:@"AVTStickersArray"];
  if (v14) {
    [MEMORY[0x263EFF980] arrayWithArray:v14];
  }
  else {
  long long v15 = [MEMORY[0x263EFF980] array];
  }
  stickers = self->_stickers;
  self->_stickers = v15;
}

- (void)saveStickersToUserDefaults
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"AVTFrequencyCounter";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AVTStickerUserDefaultsBackend frequencyCounter](self, "frequencyCounter"));
  v10[1] = @"AVTStickersArray";
  v11[0] = v3;
  char v4 = [(AVTStickerUserDefaultsBackend *)self stickers];
  v11[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  uint64_t v9 = 0;
  uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v9];
  uint64_t v7 = [(AVTStickerUserDefaultsBackend *)self userDefaults];
  [v7 setObject:v6 forKey:@"AVTRecentStickers" inDomain:@"com.apple.animoji"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AVTRecentStickerChangedExternallyNotification", 0, 0, 1u);
}

- (id)fetchAllStickers
{
  id v3 = [(AVTStickerUserDefaultsBackend *)self stickers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(AVTStickerUserDefaultsBackend *)self stickers];
    uint64_t v6 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)fetchMostRecentStickersWithLimit:(unint64_t)a3
{
  id v5 = [(AVTStickerUserDefaultsBackend *)self stickers];
  if ([v5 count] < a3)
  {
    uint64_t v6 = [(AVTStickerUserDefaultsBackend *)self stickers];
    a3 = [v6 count];
  }
  uint64_t v7 = [(AVTStickerUserDefaultsBackend *)self stickers];
  uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, a3);
  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

- (id)fetchStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4
{
  id v5 = [(AVTStickerUserDefaultsBackend *)self stickersIndexesMatchingAvatarIdentifier:a3 stickerIdentifier:a4];
  if ([v5 count])
  {
    uint64_t v6 = [(AVTStickerUserDefaultsBackend *)self stickers];
    uint64_t v7 = [v6 objectsAtIndexes:v5];
    uint64_t v8 = (void *)[v7 copy];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)nextFrequencyCount
{
  [(AVTStickerUserDefaultsBackend *)self setFrequencyCounter:[(AVTStickerUserDefaultsBackend *)self frequencyCounter] + 1];
  id v3 = NSNumber;
  unint64_t v4 = [(AVTStickerUserDefaultsBackend *)self frequencyCounter];

  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (id)addNextFrequencyCountToFrequencySum:(id)a3
{
  id v4 = a3;
  [(AVTStickerUserDefaultsBackend *)self setFrequencyCounter:[(AVTStickerUserDefaultsBackend *)self frequencyCounter] + 1];
  uint64_t v5 = [v4 unsignedIntegerValue];

  unint64_t v6 = [(AVTStickerUserDefaultsBackend *)self frequencyCounter] + v5;
  uint64_t v7 = NSNumber;

  return (id)[v7 numberWithUnsignedInteger:v6];
}

- (void)addStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [AVTStickerRecord alloc];
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  id v10 = [v9 UUIDString];
  id v11 = [(AVTStickerUserDefaultsBackend *)self nextFrequencyCount];
  id v12 = [(AVTStickerRecord *)v8 initWithIdentifier:v10 avatarRecordIdentifier:v7 stickerConfigurationIdentifier:v6 frequencySum:v11 serializationVersion:&unk_26DA99F98];

  long long v13 = [(AVTStickerUserDefaultsBackend *)self stickers];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__AVTStickerUserDefaultsBackend_addStickerWithAvatarIdentifier_stickerIdentifier___block_invoke;
  v18[3] = &unk_2647C3DE8;
  v19 = v12;
  long long v14 = v12;
  uint64_t v15 = [v13 indexOfObjectPassingTest:v18];

  id v16 = [(AVTStickerUserDefaultsBackend *)self stickers];
  id v17 = v16;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    [v16 addObject:v14];
  }
  else {
    [v16 insertObject:v14 atIndex:v15];
  }
}

BOOL __82__AVTStickerUserDefaultsBackend_addStickerWithAvatarIdentifier_stickerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 frequencySum];
  uint64_t v5 = [v3 frequencySum];

  unint64_t v6 = [v4 compare:v5];
  return v6 < 2;
}

- (void)updateStickerAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(AVTStickerUserDefaultsBackend *)self stickers];
  id v23 = [v5 objectAtIndex:a3];

  unint64_t v6 = [v23 frequencySum];
  id v7 = [(AVTStickerUserDefaultsBackend *)self addNextFrequencyCountToFrequencySum:v6];

  uint64_t v8 = [AVTStickerRecord alloc];
  uint64_t v9 = [v23 identifier];
  id v10 = [v23 avatarRecordIdentifier];
  id v11 = [v23 stickerConfigurationIdentifier];
  id v12 = [v23 serializationVersion];
  long long v13 = [(AVTStickerRecord *)v8 initWithIdentifier:v9 avatarRecordIdentifier:v10 stickerConfigurationIdentifier:v11 frequencySum:v7 serializationVersion:v12];

  long long v14 = [(AVTStickerUserDefaultsBackend *)self stickers];
  [v14 setObject:v13 atIndexedSubscript:a3];

  int64_t v15 = a3 - 1;
  if (v15 >= 0)
  {
    while (1)
    {
      id v16 = [(AVTStickerUserDefaultsBackend *)self stickers];
      id v17 = [v16 objectAtIndex:v15];

      id v18 = [(AVTStickerRecord *)v13 frequencySum];
      v19 = [v17 frequencySum];
      uint64_t v20 = [v18 compare:v19];

      if (v20 != 1) {
        break;
      }
      v21 = [(AVTStickerUserDefaultsBackend *)self stickers];
      [v21 exchangeObjectAtIndex:v15 withObjectAtIndex:v15 + 1];

      if (v15-- <= 0) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:
}

- (id)stickersIndexesMatchingAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length]) {
    BOOL v8 = [v7 length] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = [(AVTStickerUserDefaultsBackend *)self stickers];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91__AVTStickerUserDefaultsBackend_stickersIndexesMatchingAvatarIdentifier_stickerIdentifier___block_invoke;
  v14[3] = &unk_2647C4030;
  id v15 = v6;
  id v16 = v7;
  BOOL v17 = v8;
  id v10 = v7;
  id v11 = v6;
  id v12 = [v9 indexesOfObjectsPassingTest:v14];

  return v12;
}

uint64_t __91__AVTStickerUserDefaultsBackend_stickersIndexesMatchingAvatarIdentifier_stickerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 avatarRecordIdentifier];
  int v6 = [v3 isEqualToString:v5];

  id v7 = *(void **)(a1 + 40);
  BOOL v8 = [v4 stickerConfigurationIdentifier];

  unsigned int v9 = [v7 isEqualToString:v8];
  if (*(unsigned char *)(a1 + 48)) {
    return v6 & v9;
  }
  else {
    return v6 | v9;
  }
}

- (AVTStickerBackendDelegate)stickerBackendDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stickerBackendDelegate);

  return (AVTStickerBackendDelegate *)WeakRetained;
}

- (void)setStickerBackendDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NSURL)cacheLocation
{
  return self->_cacheLocation;
}

- (NSMutableArray)stickers
{
  return self->_stickers;
}

- (void)setStickers:(id)a3
{
}

- (unint64_t)frequencyCounter
{
  return self->_frequencyCounter;
}

- (void)setFrequencyCounter:(unint64_t)a3
{
  self->_frequencyCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickers, 0);
  objc_storeStrong((id *)&self->_cacheLocation, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_stickerBackendDelegate);
}

@end