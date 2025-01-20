@interface MPUbiquitousPlaybackPositionController
+ (MPUbiquitousPlaybackPositionController)sharedUbiquitousPlaybackPositionController;
- (BOOL)_onQueue_isEnabled;
- (BOOL)_onQueue_shouldBeActive;
- (BOOL)databaseHasBookmarkableContents;
- (BOOL)externallyActive;
- (BOOL)isServiceActive;
- (ICPlaybackPositionClient)uppServiceProxy;
- (MPUbiquitousPlaybackPositionController)init;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)serviceQueue;
- (id)_playbackPositionEntityWithValuesFromMusicLibraryTrackPersistentID:(int64_t)a3;
- (id)playbackPositionForLocalEntityIdentifier:(id)a3;
- (id)playbackPositionForLocalEntityIdentifiers:(id)a3;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationDidEnterForegroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_defaultMediaLibraryDidChangeNotification:(id)a3;
- (void)_onServiceQueue_becomeActiveService;
- (void)_onServiceQueue_resignActiveService;
- (void)_onServiceQueue_updateActiveServiceIfNeeded;
- (void)beginUsingPlaybackPositionMetadata;
- (void)dealloc;
- (void)noteChangedPlaybackPositionMetadataForTrackPersistentID:(int64_t)a3 isCheckpoint:(BOOL)a4;
- (void)persistPlaybackPositionMetadataEntity:(id)a3 isCheckpoint:(BOOL)a4 completion:(id)a5;
- (void)setBeganUsingPlaybackPositionMetadata:(BOOL)a3;
- (void)setDatabaseHasBookmarkableContents:(BOOL)a3;
- (void)setExternallyActive:(BOOL)a3;
- (void)setServiceActive:(BOOL)a3;
- (void)setUppServiceProxy:(id)a3;
@end

@implementation MPUbiquitousPlaybackPositionController

- (BOOL)_onQueue_isEnabled
{
  v2 = +[MPMediaLibrary defaultMediaLibrary];
  char v3 = [v2 isHomeSharingLibrary] ^ 1;

  return v3;
}

void __84__MPUbiquitousPlaybackPositionController_sharedUbiquitousPlaybackPositionController__block_invoke()
{
  v0 = objc_alloc_init(MPUbiquitousPlaybackPositionController);
  v1 = (void *)sharedUbiquitousPlaybackPositionController_bookmarksController;
  sharedUbiquitousPlaybackPositionController_bookmarksController = (uint64_t)v0;
}

- (MPUbiquitousPlaybackPositionController)init
{
  v22.receiver = self;
  v22.super_class = (Class)MPUbiquitousPlaybackPositionController;
  v2 = [(MPUbiquitousPlaybackPositionController *)&v22 init];
  char v3 = v2;
  if (v2)
  {
    v2->_externallyActive = 1;
    id v4 = [NSString alloc];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = (void *)[v4 initWithFormat:@"com.apple.%@.queue.%p", v6, v3];

    id v8 = v7;
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    id v11 = [NSString alloc];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = (void *)[v11 initWithFormat:@"com.apple.%@.serviceQueue.%p", v13, v3];

    id v15 = v14;
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);
    serviceQueue = v3->_serviceQueue;
    v3->_serviceQueue = (OS_dispatch_queue *)v16;

    v18 = (ICPlaybackPositionClient *)objc_alloc_init(MEMORY[0x1E4FB86D8]);
    uppServiceProxy = v3->_uppServiceProxy;
    v3->_uppServiceProxy = v18;

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v3 selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB2640] object:0];
    [v20 addObserver:v3 selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];
    [v20 addObserver:v3 selector:sel__applicationDidEnterForegroundNotification_ name:*MEMORY[0x1E4FB2628] object:0];
    [v20 addObserver:v3 selector:sel__defaultMediaLibraryDidChangeNotification_ name:@"MPMediaLibraryDefaultMediaLibraryDidChangeNotification" object:0];
  }
  return v3;
}

uint64_t __85__MPUbiquitousPlaybackPositionController__applicationDidEnterForegroundNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_updateActiveServiceIfNeeded");
}

uint64_t __76__MPUbiquitousPlaybackPositionController_beginUsingPlaybackPositionMetadata__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 10) = 1;
  return result;
}

uint64_t __77__MPUbiquitousPlaybackPositionController__onServiceQueue_becomeActiveService__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_shouldBeActive");
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v3 + 8))
    {
      if (*(unsigned char *)(v3 + 10)) {
        *(unsigned char *)(v3 + 8) = 1;
      }
    }
  }
  return result;
}

uint64_t __85__MPUbiquitousPlaybackPositionController__onServiceQueue_updateActiveServiceIfNeeded__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_shouldBeActive");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_onQueue_shouldBeActive
{
  return self->_externallyActive
      && [(MPUbiquitousPlaybackPositionController *)self _onQueue_isEnabled];
}

void __85__MPUbiquitousPlaybackPositionController__applicationDidEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MPUbiquitousPlaybackPositionController__applicationDidEnterForegroundNotification___block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  block[4] = v1;
  dispatch_async(v2, block);
}

- (void)beginUsingPlaybackPositionMetadata
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MPUbiquitousPlaybackPositionController_beginUsingPlaybackPositionMetadata__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_applicationDidEnterForegroundNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MPUbiquitousPlaybackPositionController__applicationDidEnterForegroundNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onServiceQueue_updateActiveServiceIfNeeded
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MPUbiquitousPlaybackPositionController__onServiceQueue_updateActiveServiceIfNeeded__block_invoke;
  block[3] = &unk_1E57F9278;
  block[4] = self;
  void block[5] = &v9;
  block[6] = &v5;
  dispatch_sync(queue, block);
  if (*((unsigned __int8 *)v6 + 24) != *((unsigned __int8 *)v10 + 24))
  {
    if (*((unsigned char *)v6 + 24)) {
      [(MPUbiquitousPlaybackPositionController *)self _onServiceQueue_becomeActiveService];
    }
    else {
      [(MPUbiquitousPlaybackPositionController *)self _onServiceQueue_resignActiveService];
    }
  }
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

- (void)_onServiceQueue_becomeActiveService
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MPUbiquitousPlaybackPositionController__onServiceQueue_becomeActiveService__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

+ (MPUbiquitousPlaybackPositionController)sharedUbiquitousPlaybackPositionController
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"disableUPP"];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    if (sharedUbiquitousPlaybackPositionController_onceToken != -1) {
      dispatch_once(&sharedUbiquitousPlaybackPositionController_onceToken, &__block_literal_global_44846);
    }
    id v4 = (id)sharedUbiquitousPlaybackPositionController_bookmarksController;
  }

  return (MPUbiquitousPlaybackPositionController *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uppServiceProxy, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDatabaseHasBookmarkableContents:(BOOL)a3
{
  self->_databaseHasBookmarkableContents = a3;
}

- (BOOL)databaseHasBookmarkableContents
{
  return self->_databaseHasBookmarkableContents;
}

- (void)setBeganUsingPlaybackPositionMetadata:(BOOL)a3
{
  self->_beganUsingPlaybackPositionMetadata = a3;
}

- (BOOL)isServiceActive
{
  return self->_isServiceActive;
}

- (void)setUppServiceProxy:(id)a3
{
}

- (ICPlaybackPositionClient)uppServiceProxy
{
  return self->_uppServiceProxy;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setServiceActive:(BOOL)a3
{
  self->_isServiceActive = a3;
}

- (void)_onServiceQueue_resignActiveService
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MPUbiquitousPlaybackPositionController__onServiceQueue_resignActiveService__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __77__MPUbiquitousPlaybackPositionController__onServiceQueue_resignActiveService__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (id)_playbackPositionEntityWithValuesFromMusicLibraryTrackPersistentID:(int64_t)a3
{
  id v4 = [(MPUbiquitousPlaybackPositionController *)self uppServiceProxy];
  if (v4)
  {
    uint64_t v5 = +[MPMediaLibrary defaultMediaLibrary];
    v6 = [v5 itemWithPersistentID:a3];

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeBookmarkIdentifier", @"bookmarkTime", @"hasBeenPlayed", @"playCount", 0);
    char v8 = [v6 valuesForProperties:v7];

    uint64_t v9 = [v8 objectForKey:@"storeBookmarkIdentifier"];
    id v10 = objc_alloc(MEMORY[0x1E4FB86E0]);
    uint64_t v11 = *MEMORY[0x1E4FB8440];
    char v12 = [NSNumber numberWithLongLong:a3];
    v13 = (void *)[v10 initWithDomain:v11 playbackPositionKey:v9 persistentIdentifier:v12];

    v14 = [v8 objectForKey:@"bookmarkTime"];
    [v13 setBookmarkTime:v14];

    id v15 = [v8 objectForKey:@"hasBeenPlayed"];
    [v13 setHasBeenPlayed:v15];

    dispatch_queue_t v16 = [v8 objectForKey:@"playCount"];
    [v13 setUserPlayCount:v16];

    v17 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v18 = objc_msgSend(v17, "numberWithDouble:");
    [v13 setBookmarkTimestamp:v18];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)persistPlaybackPositionMetadataEntity:(id)a3 isCheckpoint:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104__MPUbiquitousPlaybackPositionController_persistPlaybackPositionMetadataEntity_isCheckpoint_completion___block_invoke;
  v13[3] = &unk_1E57F7218;
  id v14 = v8;
  id v15 = self;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(serviceQueue, v13);
}

void __104__MPUbiquitousPlaybackPositionController_persistPlaybackPositionMetadataEntity_isCheckpoint_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB86E0]);
  uint64_t v3 = *MEMORY[0x1E4FB8440];
  id v4 = [*(id *)(a1 + 32) ubiquitousIdentifier];
  uint64_t v5 = (void *)[v2 initWithDomain:v3 playbackPositionKey:v4 persistentIdentifier:0];

  if ([*(id *)(a1 + 32) bookmarkTimestampModified])
  {
    v6 = NSNumber;
    [*(id *)(a1 + 32) bookmarkTimestamp];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v5 setBookmarkTimestamp:v7];
  }
  if ([*(id *)(a1 + 32) bookmarkTimeModified])
  {
    id v8 = NSNumber;
    [*(id *)(a1 + 32) bookmarkTime];
    id v9 = objc_msgSend(v8, "numberWithDouble:");
    [v5 setBookmarkTime:v9];
  }
  if ([*(id *)(a1 + 32) userPlayCountModified])
  {
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "userPlayCount"));
    [v5 setUserPlayCount:v10];
  }
  if ([*(id *)(a1 + 32) hasBeenPlayedModified])
  {
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasBeenPlayed"));
    [v5 setHasBeenPlayed:v11];
  }
  id v12 = *(void **)(*(void *)(a1 + 40) + 32);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__MPUbiquitousPlaybackPositionController_persistPlaybackPositionMetadataEntity_isCheckpoint_completion___block_invoke_2;
  v14[3] = &unk_1E57F9168;
  id v15 = *(id *)(a1 + 48);
  [v12 persistPlaybackPositionEntity:v5 isCheckpoint:v13 completionBlock:v14];
}

uint64_t __104__MPUbiquitousPlaybackPositionController_persistPlaybackPositionMetadataEntity_isCheckpoint_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)playbackPositionForLocalEntityIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  objc_super v22 = __Block_byref_object_copy__44809;
  v23 = __Block_byref_object_dispose__44810;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  serviceQueue = self->_serviceQueue;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke;
  id v14 = &unk_1E57F82D8;
  id v15 = self;
  id v7 = v4;
  id v16 = v7;
  v18 = &v19;
  id v8 = v5;
  BOOL v17 = v8;
  dispatch_sync(serviceQueue, &v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = objc_msgSend((id)v20[5], "copy", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke_2;
  v5[3] = &unk_1E57F71F0;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 getLocalPlaybackPositionForEntityIdentifiers:v1 completionBlock:v5];
}

intptr_t __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke_3;
  v6[3] = &unk_1E57F71C8;
  v6[4] = *(void *)(a1 + 40);
  [a4 enumerateObjectsUsingBlock:v6];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [MPUbiquitousPlaybackPositionEntity alloc];
  long long v4 = [v15 playbackPositionKey];
  dispatch_semaphore_t v5 = [(MPUbiquitousPlaybackPositionEntity *)v3 initWithUbiquitousIdentifier:v4];

  long long v6 = [v15 bookmarkTimestamp];

  if (v6)
  {
    id v7 = [v15 bookmarkTimestamp];
    [v7 doubleValue];
    -[MPUbiquitousPlaybackPositionEntity setBookmarkTimestamp:](v5, "setBookmarkTimestamp:");
  }
  id v8 = [v15 bookmarkTime];

  if (v8)
  {
    id v9 = [v15 bookmarkTime];
    [v9 doubleValue];
    -[MPUbiquitousPlaybackPositionEntity setBookmarkTime:](v5, "setBookmarkTime:");
  }
  id v10 = [v15 userPlayCount];

  if (v10)
  {
    uint64_t v11 = [v15 userPlayCount];
    -[MPUbiquitousPlaybackPositionEntity setUserPlayCount:](v5, "setUserPlayCount:", [v11 unsignedIntValue]);
  }
  uint64_t v12 = [v15 hasBeenPlayed];

  if (v12)
  {
    uint64_t v13 = [v15 hasBeenPlayed];
    -[MPUbiquitousPlaybackPositionEntity setHasBeenPlayed:](v5, "setHasBeenPlayed:", [v13 BOOLValue]);
  }
  id v14 = [v15 libraryIdentifier];
  [(MPUbiquitousPlaybackPositionEntity *)v5 setLibraryIdentifier:v14];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
}

- (id)playbackPositionForLocalEntityIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  long long v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  long long v6 = [v4 arrayWithObjects:&v10 count:1];

  id v7 = -[MPUbiquitousPlaybackPositionController playbackPositionForLocalEntityIdentifiers:](self, "playbackPositionForLocalEntityIdentifiers:", v6, v10, v11);
  id v8 = [v7 firstObject];

  return v8;
}

- (BOOL)externallyActive
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MPUbiquitousPlaybackPositionController_externallyActive__block_invoke;
  v5[3] = &unk_1E57F9F20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__MPUbiquitousPlaybackPositionController_externallyActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

- (void)setExternallyActive:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__MPUbiquitousPlaybackPositionController_setExternallyActive___block_invoke;
  v4[3] = &unk_1E57F9E08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

void __62__MPUbiquitousPlaybackPositionController_setExternallyActive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(unsigned char *)(v1 + 9) = v2;
    uint64_t v3 = *(void *)(a1 + 32);
    long long v4 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MPUbiquitousPlaybackPositionController_setExternallyActive___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __62__MPUbiquitousPlaybackPositionController_setExternallyActive___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_updateActiveServiceIfNeeded");
}

- (void)noteChangedPlaybackPositionMetadataForTrackPersistentID:(int64_t)a3 isCheckpoint:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__MPUbiquitousPlaybackPositionController_noteChangedPlaybackPositionMetadataForTrackPersistentID_isCheckpoint___block_invoke;
  block[3] = &unk_1E57F71A0;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_sync(queue, block);
}

void __111__MPUbiquitousPlaybackPositionController_noteChangedPlaybackPositionMetadataForTrackPersistentID_isCheckpoint___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_isEnabled"))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(v2 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__MPUbiquitousPlaybackPositionController_noteChangedPlaybackPositionMetadataForTrackPersistentID_isCheckpoint___block_invoke_2;
    block[3] = &unk_1E57F71A0;
    uint64_t v4 = *(void *)(a1 + 40);
    block[4] = v2;
    void block[5] = v4;
    char v6 = *(unsigned char *)(a1 + 48);
    dispatch_async(v3, block);
  }
}

void __111__MPUbiquitousPlaybackPositionController_noteChangedPlaybackPositionMetadataForTrackPersistentID_isCheckpoint___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_updateActiveServiceIfNeeded");
  id v2 = [*(id *)(a1 + 32) _playbackPositionEntityWithValuesFromMusicLibraryTrackPersistentID:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 32) persistPlaybackPositionEntity:v2 isCheckpoint:*(unsigned __int8 *)(a1 + 48) completionBlock:0];
}

- (void)_defaultMediaLibraryDidChangeNotification:(id)a3
{
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__MPUbiquitousPlaybackPositionController__defaultMediaLibraryDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

void __84__MPUbiquitousPlaybackPositionController__defaultMediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__MPUbiquitousPlaybackPositionController__defaultMediaLibraryDidChangeNotification___block_invoke_2;
  v4[3] = &unk_1E57F9F20;
  v4[4] = v2;
  void v4[5] = &v5;
  dispatch_sync(v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_resignActiveService");
  if (*((unsigned char *)v6 + 24)) {
    objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_becomeActiveService");
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __84__MPUbiquitousPlaybackPositionController__defaultMediaLibraryDidChangeNotification___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_shouldBeActive");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__MPUbiquitousPlaybackPositionController__applicationWillEnterForegroundNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __86__MPUbiquitousPlaybackPositionController__applicationWillEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__MPUbiquitousPlaybackPositionController__applicationWillEnterForegroundNotification___block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __86__MPUbiquitousPlaybackPositionController__applicationWillEnterForegroundNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_updateActiveServiceIfNeeded");
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v5 = MPSharedBackgroundTaskProvider();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__MPUbiquitousPlaybackPositionController__applicationDidEnterBackgroundNotification___block_invoke;
  v11[3] = &unk_1E57FA300;
  v11[4] = &v12;
  uint64_t v6 = [v5 beginTaskWithName:@"MP_onServiceQueue_resignActiveService" expirationHandler:v11];

  v13[3] = v6;
  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v13[3];
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = v8;
    __int16 v18 = 2082;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/StoreBookkeeper Support/_ios_tvos/MPUbiquit"
          "ousPlaybackPositionController.m";
    __int16 v20 = 1024;
    int v21 = 102;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "BackgroundTask: Took assertion (%lli) at %{public}s:%d", buf, 0x1Cu);
  }

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MPUbiquitousPlaybackPositionController__applicationDidEnterBackgroundNotification___block_invoke_26;
  block[3] = &unk_1E57F9F20;
  block[4] = self;
  void block[5] = &v12;
  dispatch_async(serviceQueue, block);
  _Block_object_dispose(&v12, 8);
}

void __85__MPUbiquitousPlaybackPositionController__applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MPSharedBackgroundTaskProvider();
  [v2 endTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v5 = 134218498;
    uint64_t v6 = v4;
    __int16 v7 = 2082;
    uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/StoreBookkeeper Support/_ios_tvos/MPUbiquito"
         "usPlaybackPositionController.m";
    __int16 v9 = 1024;
    int v10 = 99;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "BackgroundTask: End assertion (%lli) at %{public}s:%d", (uint8_t *)&v5, 0x1Cu);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x1E4F778E0];
}

void __85__MPUbiquitousPlaybackPositionController__applicationDidEnterBackgroundNotification___block_invoke_26(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_resignActiveService");
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != *MEMORY[0x1E4F778E0])
  {
    uint64_t v2 = MPSharedBackgroundTaskProvider();
    [v2 endTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

    uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v5 = 134218498;
      uint64_t v6 = v4;
      __int16 v7 = 2082;
      uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/StoreBookkeeper Support/_ios_tvos/MPUbiqui"
           "tousPlaybackPositionController.m";
      __int16 v9 = 1024;
      int v10 = 107;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "BackgroundTask: End assertion (%lli) at %{public}s:%d", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPUbiquitousPlaybackPositionController;
  [(MPUbiquitousPlaybackPositionController *)&v4 dealloc];
}

@end