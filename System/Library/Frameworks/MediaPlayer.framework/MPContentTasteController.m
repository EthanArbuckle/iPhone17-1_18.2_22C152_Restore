@interface MPContentTasteController
+ (MPContentTasteController)sharedController;
+ (NSMutableDictionary)controllers;
+ (OS_dispatch_queue)globalSerialQueue;
+ (id)_tasteControllerWithUserIdentity:(id)a3 isSingleton:(BOOL)a4 createIfRequired:(BOOL)a5;
+ (id)controllerWithUserIdentity:(id)a3;
+ (void)_postNotificationName:(id)a3 controller:(id)a4;
+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5;
- (ICUserIdentity)userIdentity;
- (MPContentTasteController)init;
- (id)_ML3QueryWithEntityClass:(Class)a3 predicate:(id)a4 options:(int64_t)a5;
- (id)_addPendingUpdateRecord:(id)a3 withKey:(id)a4 inDictionary:(id)a5;
- (id)_addPendingUpdateRecordForPlaylistGlobalID:(id)a3 contentTasteType:(int64_t)a4;
- (id)_addPendingUpdateRecordForStoreAdamID:(int64_t)a3 contentTasteType:(int64_t)a4;
- (id)_initWithUserIdentity:(id)a3;
- (id)_libraryEntityForModel:(id)a3;
- (id)_libraryEntityWithStoreID:(int64_t)a3 contentType:(int64_t)a4;
- (id)_libraryPlaylistWithGlobalID:(id)a3;
- (id)_mediaLibrary;
- (id)_pendingUpdateRecordForKey:(id)a3 inDictionary:(id)a4;
- (id)_pendingUpdateRecordForPlaylistGlobalID:(id)a3;
- (id)_pendingUpdateRecordForStoreAdamID:(int64_t)a3;
- (int64_t)tasteTypeForMediaEntity:(id)a3;
- (int64_t)tasteTypeForModel:(id)a3;
- (int64_t)tasteTypeForPlaylistGlobalID:(id)a3;
- (int64_t)tasteTypeForStoreAdamID:(int64_t)a3;
- (void)_deviceMediaLibraryDidChangeNotification:(id)a3;
- (void)_libraryPathDidChangeForTasteController:(id)a3;
- (void)_removePendingUpdateRecordForPlaylistGlobalID:(id)a3 token:(id)a4;
- (void)_removePendingUpdateRecordForStoreAdamID:(int64_t)a3 token:(id)a4;
- (void)setTasteType:(int64_t)a3 forMediaEntity:(id)a4 withCompletionHandler:(id)a5;
- (void)setTasteType:(int64_t)a3 forModel:(id)a4 withCompletionHandler:(id)a5;
- (void)setTasteType:(int64_t)a3 forPlaylistGlobalID:(id)a4 withCompletionHandler:(id)a5;
- (void)setTasteType:(int64_t)a3 forStoreAdamID:(int64_t)a4 withContentType:(int64_t)a5 completionHandler:(id)a6;
@end

@implementation MPContentTasteController

void __70__MPContentTasteController__postNotificationName_controller_userInfo___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a2;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:*(void *)(a1 + 32) object:v4 userInfo:*(void *)(a1 + 40)];
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    [v10 addObject:v8];
    uint64_t v11 = +[MPContentTasteController sharedController];
    if ((id)v11 == v8)
    {
    }
    else
    {
      v12 = (void *)v11;
      v13 = [v8 userIdentity];
      [v13 accountDSID];
      id v23 = v9;
      v15 = id v14 = v7;
      v16 = +[MPContentTasteController sharedController];
      v17 = [v16 userIdentity];
      v18 = [v17 accountDSID];
      int v19 = [v15 isEqualToString:v18];

      id v7 = v14;
      id v9 = v23;

      if (v19)
      {
        v20 = +[MPContentTasteController sharedController];
        goto LABEL_9;
      }
    }
    id v21 = +[MPContentTasteController sharedController];

    if (v21 != v8)
    {
LABEL_11:
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __70__MPContentTasteController__postNotificationName_controller_userInfo___block_invoke;
      v24[3] = &unk_1E57EF3A0;
      id v25 = v7;
      id v26 = v9;
      [v10 enumerateObjectsUsingBlock:v24];

      goto LABEL_12;
    }
    v22 = [v8 userIdentity];
    v20 = +[MPContentTasteController _tasteControllerWithUserIdentity:v22 isSingleton:0 createIfRequired:0];

    if (!v20)
    {
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    [v10 addObject:v20];
    goto LABEL_10;
  }
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:v7 object:0 userInfo:v9];
LABEL_12:
}

+ (MPContentTasteController)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)sharedController___tasteController;

  return (MPContentTasteController *)v2;
}

void __44__MPContentTasteController_sharedController__block_invoke()
{
  v0 = [MEMORY[0x1E4FB87B8] activeAccount];
  uint64_t v1 = +[MPContentTasteController _tasteControllerWithUserIdentity:v0 isSingleton:1 createIfRequired:1];
  v2 = (void *)sharedController___tasteController;
  sharedController___tasteController = v1;

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:sharedController___tasteController selector:sel__libraryPathDidChangeForTasteController_ name:@"MPMediaLibraryPathDidChangeNotification" object:0];
}

+ (id)_tasteControllerWithUserIdentity:(id)a3 isSingleton:(BOOL)a4 createIfRequired:(BOOL)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    v10 = @"SingletonTasteController";
  }
  else
  {
    uint64_t v11 = [v8 accountDSID];
    if (v11) {
      v10 = (__CFString *)v11;
    }
    else {
      v10 = @"NoDSID";
    }
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__10906;
  v27 = __Block_byref_object_dispose__10907;
  id v28 = 0;
  v12 = [a1 globalSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MPContentTasteController__tasteControllerWithUserIdentity_isSingleton_createIfRequired___block_invoke;
  block[3] = &unk_1E57F5D58;
  BOOL v22 = a5;
  v18 = v10;
  id v19 = v9;
  v20 = &v23;
  id v21 = a1;
  id v13 = v9;
  id v14 = v10;
  dispatch_sync(v12, block);

  id v15 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v15;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  if (globalSerialQueue_onceToken != -1) {
    dispatch_once(&globalSerialQueue_onceToken, &__block_literal_global_10982);
  }
  v2 = (void *)globalSerialQueue___globalSerialQueue;

  return (OS_dispatch_queue *)v2;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4
{
}

uint64_t __69__MPContentTasteController__deviceMediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  return +[MPContentTasteController _postNotificationName:@"MPContentTasteControllerDidChangeNotification" controller:*(void *)(a1 + 32)];
}

void __39__MPContentTasteController_controllers__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = (void *)controllers___controllers;
  controllers___controllers = (uint64_t)v0;
}

void __90__MPContentTasteController__tasteControllerWithUserIdentity_isSingleton_createIfRequired___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [*(id *)(a1 + 56) controllers];
    id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (!v3)
    {
      id v4 = (void *)MEMORY[0x19971DE60]();
      id v5 = [[MPContentTasteController alloc] _initWithUserIdentity:*(void *)(a1 + 40)];
      v6 = [*(id *)(a1 + 56) controllers];
      [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  id v10 = [*(id *)(a1 + 56) controllers];
  uint64_t v7 = [v10 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

+ (NSMutableDictionary)controllers
{
  if (controllers_onceToken != -1) {
    dispatch_once(&controllers_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)controllers___controllers;

  return (NSMutableDictionary *)v2;
}

- (id)_initWithUserIdentity:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPContentTasteController;
  id v5 = [(MPContentTasteController *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlayer.MPContentTasteController.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v4];
    [v10 addObserver:v5 selector:sel__deviceMediaLibraryDidChangeNotification_ name:@"MPMediaLibraryDidChangeNotification" object:v11];
  }
  return v5;
}

void __45__MPContentTasteController_globalSerialQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mediaplayer.MPContentTasteController.global.serial.queue", v2);
  uint64_t v1 = (void *)globalSerialQueue___globalSerialQueue;
  globalSerialQueue___globalSerialQueue = (uint64_t)v0;
}

- (void)_deviceMediaLibraryDidChangeNotification:(id)a3
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MPContentTasteController__deviceMediaLibraryDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (int64_t)tasteTypeForModel:(id)a3
{
  id v4 = a3;
  id v5 = [(MPContentTasteController *)self _libraryEntityForModel:v4];
  if (v5)
  {
    int64_t v6 = [(MPContentTasteController *)self tasteTypeForMediaEntity:v5];
  }
  else
  {
    uint64_t v7 = [v4 identifiers];
    dispatch_queue_t v8 = [v7 universalStore];
    id v9 = [v8 globalPlaylistID];

    if ([v9 length])
    {
      id v10 = [(MPContentTasteController *)self _pendingUpdateRecordForPlaylistGlobalID:v9];
      if (v10) {
        goto LABEL_7;
      }
    }
    uint64_t v11 = [v4 identifiers];
    uint64_t v12 = _MPContentTasteBestIDFromIdentifiers(v11);

    if (v12
      && ([(MPContentTasteController *)self _pendingUpdateRecordForStoreAdamID:v12], (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_7:
      int64_t v6 = [v10 tasteType];
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  return v6;
}

- (int64_t)tasteTypeForMediaEntity:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v4 valueForProperty:@"storeItemAdamID"];
      uint64_t v11 = [v10 longLongValue];

      if (v11)
      {
        id v5 = @"likedState";
        uint64_t v12 = @"likedState";
        goto LABEL_13;
      }
      objc_super v13 = &MPMediaItemPropertyLikedState;
      id v14 = MPMediaItemPropertySubscriptionStoreItemID;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_23;
      }
      objc_super v13 = MPMediaAlbumPropertyLikedState;
      id v14 = MPMediaAlbumPropertyStoreID;
    }
    id v15 = [v4 valueForProperty:*v14];
    uint64_t v11 = [v15 longLongValue];

    id v5 = *v13;
    if (!v11)
    {
LABEL_19:
      if (v5)
      {
        v18 = [v4 valueForProperty:v5];
        uint64_t v19 = [v18 integerValue];

        if (v19 == 3) {
          int64_t v9 = 2;
        }
        else {
          int64_t v9 = v19 == 2;
        }
        goto LABEL_17;
      }
LABEL_23:
      int64_t v9 = 0;
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v16 = [(MPContentTasteController *)self _pendingUpdateRecordForStoreAdamID:v11];
    if (v16)
    {
      int64_t v6 = (void *)v16;
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  id v5 = [v4 valueForProperty:@"cloudGlobalID"];
  int64_t v6 = [(MPContentTasteController *)self _pendingUpdateRecordForPlaylistGlobalID:v5];
  if (!v6)
  {
    uint64_t v7 = [v4 valueForProperty:@"likedState"];
    uint64_t v8 = [v7 integerValue];

    if (v8 == 3) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = v8 == 2;
    }
    goto LABEL_16;
  }
LABEL_15:
  int64_t v9 = [v6 tasteType];
LABEL_16:

LABEL_17:
LABEL_18:

  return v9;
}

- (id)_libraryEntityForModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifiers];
  int64_t v6 = [v5 library];
  uint64_t v7 = (void *)[v6 persistentID];

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = [(MPContentTasteController *)self _mediaLibrary];
      uint64_t v9 = [v8 itemWithPersistentID:v7 verifyExistence:0];
LABEL_6:
      uint64_t v7 = (void *)v9;

      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v11 = [(MPContentTasteController *)self _mediaLibrary];
      uint64_t v8 = v11;
      uint64_t v12 = v7;
      uint64_t v13 = 1;
LABEL_13:
      uint64_t v9 = [v11 collectionWithPersistentID:v12 groupingType:v13];
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [(MPContentTasteController *)self _mediaLibrary];
      uint64_t v8 = v11;
      uint64_t v12 = v7;
      uint64_t v13 = 2;
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [(MPContentTasteController *)self _mediaLibrary];
      uint64_t v9 = [v8 playlistWithPersistentID:v7];
      goto LABEL_6;
    }
    uint64_t v7 = 0;
  }
LABEL_7:

  return v7;
}

- (id)_mediaLibrary
{
  return +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:self->_userIdentity];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_pendingUpdateRecordByStoreAdamID, 0);
  objc_storeStrong((id *)&self->_pendingUpdateRecordByPlaylistGlobalID, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)_pendingUpdateRecordForPlaylistGlobalID:(id)a3
{
  return [(MPContentTasteController *)self _pendingUpdateRecordForKey:a3 inDictionary:self->_pendingUpdateRecordByPlaylistGlobalID];
}

- (id)_pendingUpdateRecordForStoreAdamID:(int64_t)a3
{
  id v4 = [NSNumber numberWithLongLong:a3];
  id v5 = [(MPContentTasteController *)self _pendingUpdateRecordForKey:v4 inDictionary:self->_pendingUpdateRecordByStoreAdamID];

  return v5;
}

- (id)_pendingUpdateRecordForKey:(id)a3 inDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10906;
  id v21 = __Block_byref_object_dispose__10907;
  id v22 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MPContentTasteController__pendingUpdateRecordForKey_inDictionary___block_invoke;
  block[3] = &unk_1E57F9F48;
  id v15 = v6;
  uint64_t v16 = &v17;
  id v14 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(accessQueue, block);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __68__MPContentTasteController__pendingUpdateRecordForKey_inDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_removePendingUpdateRecordForStoreAdamID:(int64_t)a3 token:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MPContentTasteController__removePendingUpdateRecordForStoreAdamID_token___block_invoke;
  block[3] = &unk_1E57F9250;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_barrier_sync(accessQueue, block);
}

void __75__MPContentTasteController__removePendingUpdateRecordForStoreAdamID_token___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 24);
  uint64_t v3 = [NSNumber numberWithLongLong:a1[6]];
  id v4 = [v2 objectForKey:v3];

  id v5 = [v4 UUID];
  int v6 = [v5 isEqual:a1[5]];

  if (v6)
  {
    id v7 = *(void **)(a1[4] + 24);
    id v8 = [NSNumber numberWithLongLong:a1[6]];
    [v7 removeObjectForKey:v8];

    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MPContentTasteController__removePendingUpdateRecordForStoreAdamID_token___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    void block[4] = a1[4];
    dispatch_async(v9, block);
  }
}

uint64_t __75__MPContentTasteController__removePendingUpdateRecordForStoreAdamID_token___block_invoke_2(uint64_t a1)
{
  return +[MPContentTasteController _postNotificationName:@"MPContentTasteControllerDidChangeNotification" controller:*(void *)(a1 + 32)];
}

- (void)_removePendingUpdateRecordForPlaylistGlobalID:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MPContentTasteController__removePendingUpdateRecordForPlaylistGlobalID_token___block_invoke;
  block[3] = &unk_1E57FA038;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(accessQueue, block);
}

void __80__MPContentTasteController__removePendingUpdateRecordForPlaylistGlobalID_token___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = [v2 UUID];
  int v4 = [v3 isEqual:a1[6]];

  if (v4)
  {
    [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
    id v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MPContentTasteController__removePendingUpdateRecordForPlaylistGlobalID_token___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    void block[4] = a1[4];
    dispatch_async(v5, block);
  }
}

uint64_t __80__MPContentTasteController__removePendingUpdateRecordForPlaylistGlobalID_token___block_invoke_2(uint64_t a1)
{
  return +[MPContentTasteController _postNotificationName:@"MPContentTasteControllerDidChangeNotification" controller:*(void *)(a1 + 32)];
}

- (id)_addPendingUpdateRecordForStoreAdamID:(int64_t)a3 contentTasteType:(int64_t)a4
{
  id v6 = [[MPContentTastePendingUpdateRecord alloc] initWithStoreAdamID:a3 tasteType:a4];
  id v7 = [NSNumber numberWithLongLong:a3];
  id v8 = [(MPContentTasteController *)self _addPendingUpdateRecord:v6 withKey:v7 inDictionary:self->_pendingUpdateRecordByStoreAdamID];

  return v8;
}

- (id)_addPendingUpdateRecordForPlaylistGlobalID:(id)a3 contentTasteType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[MPContentTastePendingUpdateRecord alloc] initWithPlaylistGlobalID:v6 tasteType:a4];
  id v8 = [(MPContentTasteController *)self _addPendingUpdateRecord:v7 withKey:v6 inDictionary:self->_pendingUpdateRecordByPlaylistGlobalID];

  return v8;
}

- (id)_addPendingUpdateRecord:(id)a3 withKey:(id)a4 inDictionary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __73__MPContentTasteController__addPendingUpdateRecord_withKey_inDictionary___block_invoke;
  v20 = &unk_1E57F62E8;
  id v21 = v10;
  id v22 = self;
  id v23 = v8;
  id v24 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_barrier_sync(accessQueue, &v17);
  id v15 = objc_msgSend(v13, "UUID", v17, v18, v19, v20);

  return v15;
}

void __73__MPContentTasteController__addPendingUpdateRecord_withKey_inDictionary___block_invoke(void *a1)
{
  unint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  if (!(v2 | *(void *)(v3 + 16)))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = a1[5];
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
LABEL_5:

    unint64_t v2 = a1[4];
    goto LABEL_6;
  }
  if (!(v2 | *(void *)(v3 + 24)))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = a1[5];
    id v6 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;
    goto LABEL_5;
  }
LABEL_6:
  [(id)v2 setObject:a1[6] forKey:a1[7]];
  id v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MPContentTasteController__addPendingUpdateRecord_withKey_inDictionary___block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  void block[4] = a1[5];
  dispatch_async(v9, block);
}

uint64_t __73__MPContentTasteController__addPendingUpdateRecord_withKey_inDictionary___block_invoke_2(uint64_t a1)
{
  return +[MPContentTasteController _postNotificationName:@"MPContentTasteControllerDidChangeNotification" controller:*(void *)(a1 + 32)];
}

- (id)_ML3QueryWithEntityClass:(Class)a3 predicate:(id)a4 options:(int64_t)a5
{
  id v8 = a4;
  id v9 = [(MPContentTasteController *)self _mediaLibrary];
  id v10 = [v9 libraryDataProvider];
  int64_t v11 = [v10 library];
  id v12 = [(objc_class *)a3 queryWithLibrary:v11 predicate:v8 orderingTerms:MEMORY[0x1E4F1CBF0] usingSections:0 options:a5];

  return v12;
}

- (id)_libraryEntityWithStoreID:(int64_t)a3 contentType:(int64_t)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_26;
  }
  id v4 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if ((unint64_t)a4 > 7)
  {
    id v10 = 0;
    id v7 = 0;
    int64_t v11 = 0;
  }
  else
  {
    if (((1 << a4) & 0xC6) != 0)
    {
      id v7 = (id)*MEMORY[0x1E4F79978];
      uint64_t v26 = 0;
      id v4 = 0;
      int v8 = 0;
      id v9 = (void *)*MEMORY[0x1E4F799D8];
      id v10 = (void *)*MEMORY[0x1E4F799D8];
      goto LABEL_8;
    }
    id v10 = 0;
    id v7 = 0;
    int64_t v11 = 0;
    if (((1 << a4) & 0x28) != 0)
    {
      id v7 = (id)*MEMORY[0x1E4F799A0];
      id v10 = 0;
      id v9 = (void *)*MEMORY[0x1E4F79410];
      uint64_t v26 = 1;
      id v4 = (void *)*MEMORY[0x1E4F79410];
      int v8 = 1;
LABEL_8:
      id v12 = v9;
      if (v7)
      {
        uint64_t v13 = objc_opt_class();
        id v14 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v7 equalToInt64:a3];
        id v15 = [(MPContentTasteController *)self _ML3QueryWithEntityClass:v13 predicate:v14 options:5];

        if (v4)
        {
          v34[0] = v4;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __66__MPContentTasteController__libraryEntityWithStoreID_contentType___block_invoke;
          v28[3] = &unk_1E57EF3C8;
          v28[4] = &v29;
          [v15 enumeratePersistentIDsAndProperties:v16 ordered:0 usingBlock:v28];
        }
        else
        {
          uint64_t v18 = [v15 anyEntityPersistentID];
          v30[3] = v18;
        }

        uint64_t v17 = v30[3];
        if (v17)
        {
LABEL_19:
          if (v17)
          {
            id v24 = [(MPContentTasteController *)self _mediaLibrary];
            if (v8) {
              [v24 collectionWithPersistentID:v30[3] groupingType:v26 verifyExistence:0];
            }
            else {
            int64_t v11 = [v24 itemWithPersistentID:v30[3] verifyExistence:0];
            }
          }
          else
          {
            int64_t v11 = 0;
          }
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
      if (v10)
      {
        uint64_t v19 = objc_opt_class();
        v20 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v10 equalToInt64:a3];
        id v21 = [(MPContentTasteController *)self _ML3QueryWithEntityClass:v19 predicate:v20 options:5];

        if (v4)
        {
          v33 = v4;
          id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __66__MPContentTasteController__libraryEntityWithStoreID_contentType___block_invoke_2;
          v27[3] = &unk_1E57EF3C8;
          v27[4] = &v29;
          [v21 enumeratePersistentIDsAndProperties:v22 ordered:0 usingBlock:v27];
        }
        else
        {
          uint64_t v23 = [v21 anyEntityPersistentID];
          v30[3] = v23;
        }

        uint64_t v17 = v30[3];
      }
      goto LABEL_19;
    }
  }
LABEL_25:

  _Block_object_dispose(&v29, 8);
LABEL_26:

  return v11;
}

uint64_t __66__MPContentTasteController__libraryEntityWithStoreID_contentType___block_invoke(uint64_t result, uint64_t a2, id *a3, uint64_t a4, unsigned char *a5)
{
  if (a3)
  {
    uint64_t v6 = result;
    result = [*a3 longLongValue];
    if (result)
    {
      *(void *)(*(void *)(*(void *)(v6 + 32) + 8) + 24) = result;
      *a5 = 1;
    }
  }
  return result;
}

uint64_t __66__MPContentTasteController__libraryEntityWithStoreID_contentType___block_invoke_2(uint64_t result, uint64_t a2, id *a3, uint64_t a4, unsigned char *a5)
{
  if (a3)
  {
    uint64_t v6 = result;
    result = [*a3 longLongValue];
    if (result)
    {
      *(void *)(*(void *)(*(void *)(v6 + 32) + 8) + 24) = result;
      *a5 = 1;
    }
  }
  return result;
}

- (id)_libraryPlaylistWithGlobalID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79150] equalToValue:v4];
    id v7 = [(MPContentTasteController *)self _ML3QueryWithEntityClass:v5 predicate:v6 options:4];

    uint64_t v8 = [v7 anyEntityPersistentID];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = [(MPContentTasteController *)self _mediaLibrary];
      int64_t v11 = [v10 playlistWithPersistentID:v9];
    }
    else
    {
      int64_t v11 = 0;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (void)_libraryPathDidChangeForTasteController:(id)a3
{
  id v4 = +[MPContentTasteController sharedController];

  if (v4 == self)
  {
    uint64_t v5 = [MEMORY[0x1E4FB87B8] activeAccount];
    userIdentity = self->_userIdentity;
    self->_userIdentity = v5;
  }
}

- (int64_t)tasteTypeForStoreAdamID:(int64_t)a3
{
  uint64_t v5 = -[MPContentTasteController _pendingUpdateRecordForStoreAdamID:](self, "_pendingUpdateRecordForStoreAdamID:");
  uint64_t v6 = v5;
  if (v5)
  {
    int64_t v7 = [v5 tasteType];
  }
  else
  {
    uint64_t v8 = [(MPContentTasteController *)self _libraryEntityWithStoreID:a3 contentType:1];
    if (v8
      || ([(MPContentTasteController *)self _libraryEntityWithStoreID:a3 contentType:3], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)|| ([(MPContentTasteController *)self _libraryEntityWithStoreID:a3 contentType:2], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int64_t v7 = [(MPContentTasteController *)self tasteTypeForMediaEntity:v8];
    }
    else
    {
      int64_t v7 = 0;
    }
  }

  return v7;
}

- (int64_t)tasteTypeForPlaylistGlobalID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPContentTasteController *)self _pendingUpdateRecordForPlaylistGlobalID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    int64_t v7 = [v5 tasteType];
  }
  else
  {
    uint64_t v8 = [(MPContentTasteController *)self _libraryPlaylistWithGlobalID:v4];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 valueForProperty:@"likedState"];
      uint64_t v11 = [v10 integerValue];

      if (v11 == 3) {
        int64_t v7 = 2;
      }
      else {
        int64_t v7 = v11 == 2;
      }
    }
    else
    {
      int64_t v7 = 0;
    }
  }
  return v7;
}

- (void)setTasteType:(int64_t)a3 forStoreAdamID:(int64_t)a4 withContentType:(int64_t)a5 completionHandler:(id)a6
{
  v49[3] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v11 = [(MPContentTasteController *)self _libraryEntityWithStoreID:a4 contentType:a5];
  if (!v11)
  {
    if (a4)
    {
      v48[0] = @"MPContentTasteControllerNotificationUserInfoKeyStoreAdamID";
      id v12 = [NSNumber numberWithLongLong:a4];
      v49[0] = v12;
      v48[1] = @"MPContentTasteControllerNotificationUserInfoKeyTasteType";
      uint64_t v13 = [NSNumber numberWithInteger:a3];
      v49[1] = v13;
      v48[2] = @"MPContentTasteControllerNotificationUserInfoKeyContentType";
      id v14 = [NSNumber numberWithInteger:a5];
      v49[2] = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
      +[MPContentTasteController _postNotificationName:@"MPContentTasteControllerWillSetTasteTypeNotification" controller:self userInfo:v15];
    }
    uint64_t v16 = [(MPContentTasteController *)self _addPendingUpdateRecordForStoreAdamID:a4 contentTasteType:a3];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke;
    v39[3] = &unk_1E57EF350;
    v39[4] = self;
    int64_t v42 = a4;
    id v33 = v16;
    id v40 = v33;
    id v41 = v10;
    uint64_t v17 = MEMORY[0x19971E0F0](v39);
    uint64_t v18 = 3;
    if (a3 != 2) {
      uint64_t v18 = 1;
    }
    if (a3 == 1) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = v18;
    }
    uint64_t v31 = v19;
    uint64_t v32 = (void *)v17;
    if (a5 == 3)
    {
      v46 = @"MPStoreItemLibraryImportMetadataKeyAlbumLikedState";
      v20 = objc_msgSend(NSNumber, "numberWithInteger:");
      v47 = v20;
      id v21 = (void *)MEMORY[0x1E4F1C9E8];
      id v22 = &v47;
      uint64_t v23 = &v46;
    }
    else
    {
      if ((unint64_t)(a5 - 1) > 1)
      {
        id v24 = 0;
        goto LABEL_16;
      }
      v44 = @"MPStoreItemLibraryImportMetadataKeyTrackLikedState";
      v20 = objc_msgSend(NSNumber, "numberWithInteger:");
      v45 = v20;
      id v21 = (void *)MEMORY[0x1E4F1C9E8];
      id v22 = &v45;
      uint64_t v23 = &v44;
    }
    id v24 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];

LABEL_16:
    uint64_t v25 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:self->_userIdentity];
    uint64_t v26 = [[MPStoreItemLibraryImportElement alloc] initWithStoreItemID:a4 additionalTrackMetadata:v24];
    v27 = [MPStoreItemLibraryImport alloc];
    v43 = v26;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    uint64_t v29 = [(MPStoreItemLibraryImport *)v27 initWithImportElements:v28 referralObject:0 usingCloudLibraryDestination:0];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    void v34[2] = __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_2;
    v34[3] = &unk_1E57EF378;
    int64_t v36 = a5;
    uint64_t v37 = v31;
    int64_t v38 = a4;
    v34[4] = self;
    id v35 = v32;
    id v30 = v32;
    [v25 performStoreItemLibraryImport:v29 withCompletion:v34];

    goto LABEL_17;
  }
  [(MPContentTasteController *)self setTasteType:a3 forMediaEntity:v11 withCompletionHandler:v10];
LABEL_17:
}

void __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _removePendingUpdateRecordForStoreAdamID:*(void *)(a1 + 56) token:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed to add cache content to library. %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = +[MPCloudController controllerWithUserIdentity:*(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v9 = -1;
    uint64_t v10 = 1;
    switch(*(void *)(a1 + 48))
    {
      case 1:
      case 6:
        goto LABEL_9;
      case 2:
        uint64_t v10 = 2048;
        goto LABEL_9;
      case 3:
      case 5:
        uint64_t v11 = *(void *)(a1 + 56);
        uint64_t v12 = *(void *)(a1 + 64);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_3;
        v21[3] = &unk_1E57F90A0;
        uint64_t v13 = &v22;
        id v22 = *(id *)(a1 + 40);
        [v8 setLikedState:v11 forAlbumWithStoreID:v12 completion:v21];
        goto LABEL_13;
      case 7:
        uint64_t v10 = 256;
LABEL_9:
        if ([v5 count])
        {
          id v14 = [v5 objectAtIndexedSubscript:0];
          id v15 = [MEMORY[0x1E4F1C9C8] date];
          [v14 setValue:v15 forProperty:@"likedStateChangedDate"];
        }
        uint64_t v9 = v10;
        break;
      default:
        break;
    }
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_4;
    v19[3] = &unk_1E57F90A0;
    uint64_t v13 = &v20;
    id v20 = *(id *)(a1 + 40);
    [v8 setLikedState:v16 forEntityWithStoreID:v17 withMediaType:v9 timeStamp:v18 completion:v19];

LABEL_13:
  }
}

uint64_t __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setTasteType:(int64_t)a3 forPlaylistGlobalID:(id)a4 withCompletionHandler:(id)a5
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(MPContentTasteController *)self _libraryPlaylistWithGlobalID:v8];
  if (v10)
  {
    [(MPContentTasteController *)self setTasteType:a3 forMediaEntity:v10 withCompletionHandler:v9];
  }
  else if (v8)
  {
    v32[0] = v8;
    v31[0] = @"MPContentTasteControllerNotificationUserInfoKeyPlaylistGlobalID";
    v31[1] = @"MPContentTasteControllerNotificationUserInfoKeyTasteType";
    uint64_t v11 = [NSNumber numberWithInteger:a3];
    v31[2] = @"MPContentTasteControllerNotificationUserInfoKeyContentType";
    v32[1] = v11;
    v32[2] = &unk_1EE6ECE30;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    +[MPContentTasteController _postNotificationName:@"MPContentTasteControllerWillSetTasteTypeNotification" controller:self userInfo:v12];

    uint64_t v13 = [(MPContentTasteController *)self _addPendingUpdateRecordForPlaylistGlobalID:v8 contentTasteType:a3];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __83__MPContentTasteController_setTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke;
    v25[3] = &unk_1E57F1F70;
    v25[4] = self;
    id v14 = v8;
    id v26 = v14;
    id v27 = v13;
    id v28 = v9;
    id v15 = v13;
    uint64_t v16 = (void *)MEMORY[0x19971E0F0](v25);
    uint64_t v17 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:self->_userIdentity];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __83__MPContentTasteController_setTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E57EF328;
    id v23 = v16;
    int64_t v24 = a3;
    id v18 = v16;
    [v17 addNonLibraryOwnedPlaylistWithGlobalID:v14 completion:v22];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    id v30 = @"invalid playlist global ID";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v21 = [v19 errorWithDomain:@"MediaPlayer" code:123321 userInfo:v20];
    (*((void (**)(id, void *))v9 + 2))(v9, v21);
  }
}

void __83__MPContentTasteController_setTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _removePendingUpdateRecordForPlaylistGlobalID:*(void *)(a1 + 40) token:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __83__MPContentTasteController_setTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed to add cache playlist to library. %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = 3;
    if (v8 != 2) {
      uint64_t v9 = 1;
    }
    if (v8 == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9;
    }
    int64_t v7 = [NSNumber numberWithInteger:v10];
    [v5 setValue:v7 forProperty:@"likedState"];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setTasteType:(int64_t)a3 forMediaEntity:(id)a4 withCompletionHandler:(id)a5
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = 3;
  if (a3 != 2) {
    uint64_t v10 = 1;
  }
  if (a3 == 1) {
    uint64_t v10 = 2;
  }
  uint64_t v39 = v10;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__10906;
  v60 = __Block_byref_object_dispose__10907;
  id v61 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__10906;
  v50 = __Block_byref_object_dispose__10907;
  id v51 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __78__MPContentTasteController_setTasteType_forMediaEntity_withCompletionHandler___block_invoke;
  v41[3] = &unk_1E57EF300;
  v43 = &v56;
  v44 = &v46;
  v41[4] = self;
  v45 = &v52;
  id v40 = v9;
  id v42 = v40;
  int v11 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v41);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v8 valueForProperty:@"cloudGlobalID"];
    uint64_t v13 = (void *)v57[5];
    v57[5] = v12;

    id v14 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v15 = [NSNumber numberWithInteger:a3];
    uint64_t v16 = (__CFString *)objc_msgSend(v14, "initWithObjectsAndKeys:", v8, @"MPContentTasteControllerNotificationUserInfoKeyMediaEntity", v15, @"MPContentTasteControllerNotificationUserInfoKeyTasteType", &unk_1EE6ECE30, @"MPContentTasteControllerNotificationUserInfoKeyContentType", 0);

    uint64_t v17 = v57[5];
    if (v17) {
      [(__CFString *)v16 setObject:v17 forKey:@"MPContentTasteControllerNotificationUserInfoKeyPlaylistGlobalID"];
    }
    +[MPContentTasteController _postNotificationName:@"MPContentTasteControllerWillSetTasteTypeNotification" controller:self userInfo:v16];
    uint64_t v18 = v57[5];
    if (v18)
    {
      uint64_t v19 = [(MPContentTasteController *)self _addPendingUpdateRecordForPlaylistGlobalID:v18 contentTasteType:a3];
      id v20 = (void *)v47[5];
      v47[5] = v19;
    }
    id v21 = v8;
    id v22 = [NSNumber numberWithInteger:v39];
    [v21 setValue:v22 forProperty:@"likedState" withCompletionBlock:v11];
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v26 = 0;
      uint64_t v16 = 0;
      goto LABEL_20;
    }
    id v27 = @"albumLikedState";
    id v28 = [v8 valueForProperty:@"albumStoreID"];
    uint64_t v29 = [v28 longLongValue];
    uint64_t v16 = @"albumLikedState";
    uint64_t v26 = 3;
LABEL_19:
    v53[3] = v29;

    goto LABEL_20;
  }
  id v23 = @"likedState";
  int64_t v24 = [v8 valueForProperty:@"storeItemAdamID"];
  uint64_t v25 = [v24 longLongValue];
  v53[3] = v25;

  if (!v53[3])
  {
    id v28 = [v8 valueForProperty:@"subscriptionStoreItemAdamID"];
    uint64_t v29 = [v28 longLongValue];
    uint64_t v16 = @"likedState";
    uint64_t v26 = 1;
    goto LABEL_19;
  }
  uint64_t v16 = @"likedState";
  uint64_t v26 = 1;
LABEL_20:
  if (v8)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v31 = [NSNumber numberWithInteger:a3];
    uint64_t v32 = [NSNumber numberWithInteger:v26];
    id v33 = objc_msgSend(v30, "initWithObjectsAndKeys:", v8, @"MPContentTasteControllerNotificationUserInfoKeyMediaEntity", v31, @"MPContentTasteControllerNotificationUserInfoKeyTasteType", v32, @"MPContentTasteControllerNotificationUserInfoKeyContentType", 0);

    if (v53[3])
    {
      v34 = objc_msgSend(NSNumber, "numberWithLongLong:");
      [v33 setObject:v34 forKey:@"MPContentTasteControllerNotificationUserInfoKeyStoreAdamID"];
    }
    +[MPContentTasteController _postNotificationName:@"MPContentTasteControllerWillSetTasteTypeNotification" controller:self userInfo:v33];
  }
  uint64_t v35 = v53[3];
  if (v35)
  {
    uint64_t v36 = [(MPContentTasteController *)self _addPendingUpdateRecordForStoreAdamID:v35 contentTasteType:a3];
    uint64_t v37 = (void *)v47[5];
    v47[5] = v36;
  }
  if (v16)
  {
    id v21 = [NSNumber numberWithInteger:v39];
    [v8 setValue:v21 forProperty:v16 withCompletionBlock:v11];
    goto LABEL_28;
  }
  if (!v11)
  {
    uint64_t v16 = 0;
    goto LABEL_29;
  }
  int64_t v38 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v62 = *MEMORY[0x1E4F28568];
  v63[0] = @"unknown entity type";
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
  id v22 = [v38 errorWithDomain:@"MediaPlayer" code:123321 userInfo:v21];
  ((void (**)(void, void, void *))v11)[2](v11, 0, v22);
  uint64_t v16 = 0;
LABEL_11:

LABEL_28:
LABEL_29:

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
}

void __78__MPContentTasteController_setTasteType_forMediaEntity_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v8 = v4;
  if (v5)
  {
    [*(id *)(a1 + 32) _removePendingUpdateRecordForPlaylistGlobalID:v5 token:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v4 = v8;
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v6)
  {
    [*(id *)(a1 + 32) _removePendingUpdateRecordForStoreAdamID:v6 token:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v4 = v8;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
    id v4 = v8;
  }
}

- (void)setTasteType:(int64_t)a3 forModel:(id)a4 withCompletionHandler:(id)a5
{
  id v18 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v18 flattenedGenericObject];
    uint64_t v10 = [v9 anyObject];

    int v11 = (void *)v10;
  }
  else
  {
    int v11 = v18;
  }
  id v19 = v11;
  uint64_t v12 = [v11 identifiers];
  uint64_t v13 = [v12 universalStore];
  id v14 = [v13 globalPlaylistID];

  if ([v14 length])
  {
    [(MPContentTasteController *)self setTasteType:a3 forPlaylistGlobalID:v14 withCompletionHandler:v8];
  }
  else
  {
    id v15 = [v19 identifiers];
    uint64_t v16 = _MPContentTasteBestIDFromIdentifiers(v15);

    if (v16)
    {
      [(MPContentTasteController *)self setTasteType:a3 forStoreAdamID:v16 withContentType:MPContentTasteContentTypeFromMPModelObject(v19) completionHandler:v8];
    }
    else
    {
      uint64_t v17 = [(MPContentTasteController *)self _libraryEntityForModel:v19];
      [(MPContentTasteController *)self setTasteType:a3 forMediaEntity:v17 withCompletionHandler:v8];
    }
  }
}

- (MPContentTasteController)init
{
  uint64_t v3 = [MEMORY[0x1E4FB87B8] activeAccount];
  id v4 = [(MPContentTasteController *)self _initWithUserIdentity:v3];

  return v4;
}

+ (id)controllerWithUserIdentity:(id)a3
{
  return +[MPContentTasteController _tasteControllerWithUserIdentity:a3 isSingleton:0 createIfRequired:1];
}

@end