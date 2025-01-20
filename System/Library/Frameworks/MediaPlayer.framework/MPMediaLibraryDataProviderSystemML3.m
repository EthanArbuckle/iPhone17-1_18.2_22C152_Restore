@interface MPMediaLibraryDataProviderSystemML3
+ (id)_localizedCloudGeniusErrorForError:(id)a3;
+ (id)_localizedGeniusErrorForError:(id)a3 geniusEnabled:(BOOL)a4;
- (BOOL)isGeniusEnabled;
- (BOOL)supportsEntityChangeTrackingForMediaEntityType:(int64_t)a3 collectionGroupingType:(int64_t)a4 dataProviderClass:(Class *)a5;
- (MPMediaLibraryDataProviderSystemML3)initWithLibrary:(id)a3;
- (id)errorResolverForItem:(id)a3;
- (int64_t)_currentRevision;
- (int64_t)generateItemIdentifiersForGeniusClusterPlaylist:(void *)a3 count:(unint64_t *)a4 error:(id *)a5;
- (void)_initInstanceVariableOnce;
- (void)_seedCloudPlaylistWithTrack:(id)a3 container:(id)a4 completionBlock:(id)a5;
- (void)createGeniusClusterPlaylistWithSeedItemIdentifiers:(int64_t *)a3 count:(unint64_t)a4 error:(id *)a5;
- (void)geniusItemsForSeedItem:(id)a3 completion:(id)a4;
- (void)seedPlaylistWithIdentifier:(int64_t)a3 withItemWithIdentifier:(int64_t)a4 completionBlock:(id)a5;
- (void)updateEntitesToCurrentRevision;
@end

@implementation MPMediaLibraryDataProviderSystemML3

- (BOOL)supportsEntityChangeTrackingForMediaEntityType:(int64_t)a3 collectionGroupingType:(int64_t)a4 dataProviderClass:(Class *)a5
{
  if (!a3 && a5) {
    *a5 = (Class)objc_opt_class();
  }
  return a3 == 0;
}

- (MPMediaLibraryDataProviderSystemML3)initWithLibrary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPMediaLibraryDataProviderSystemML3;
  v3 = [(MPMediaLibraryDataProviderML3 *)&v6 initWithLibrary:a3];
  v4 = v3;
  if (v3) {
    [(MPMediaLibraryDataProviderSystemML3 *)v3 _initInstanceVariableOnce];
  }
  return v4;
}

- (void)_initInstanceVariableOnce
{
  if (_initInstanceVariableOnce_onceToken != -1) {
    dispatch_once(&_initInstanceVariableOnce_onceToken, &__block_literal_global_29030);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MPMediaLibraryDataProviderSystemML3__initInstanceVariableOnce__block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_initInstanceVariableOnce_initQueue, block);
}

void __64__MPMediaLibraryDataProviderSystemML3__initInstanceVariableOnce__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create(0, 0);
  v1 = (void *)_initInstanceVariableOnce_initQueue;
  _initInstanceVariableOnce_initQueue = (uint64_t)v0;
}

void __64__MPMediaLibraryDataProviderSystemML3__initInstanceVariableOnce__block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 136))
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.mediaplayer.systemdataprovider", 0);
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = v2;
  }
}

- (void).cxx_destruct
{
}

- (void)updateEntitesToCurrentRevision
{
  [(MPMediaLibraryDataProviderSystemML3 *)self _initInstanceVariableOnce];
  if (updateEntitesToCurrentRevision_onceToken != -1) {
    dispatch_once(&updateEntitesToCurrentRevision_onceToken, &__block_literal_global_61_29008);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentRevision];
  uint64_t v3 = [*(id *)(a1 + 32) library];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke_3;
  v4[3] = &unk_1E57F3A60;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v2;
  [v3 enumeratePersistentIDsAfterRevision:v2 revisionTrackingCode:0x7FFFFFFFFFFFFFFFLL maximumRevisionType:3 usingBlock:v4];
}

void __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  v10 = [*(id *)(a1 + 32) entityCache];
  v11 = (void *)__revisionTrackingCodeToEntityClassMap;
  v12 = [NSNumber numberWithInteger:a5];
  v13 = [v11 objectForKey:v12];
  [v10 updatePropertyValuesInEntityWithIdentifier:a2 dataProviderEntityClass:v13 deleted:a4 != 0];

  if (*(void *)(a1 + 40) < a3) {
    *(void *)(*(void *)(a1 + 32) + 128) = a3;
  }
}

void __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke()
{
  v32[5] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = objc_opt_class();
  dispatch_queue_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  v32[4] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
  uint64_t v2 = [v0 arrayByAddingObjectsFromArray:v1];

  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "revisionTrackingCode"));
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  v20 = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:v3];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithSharedKeySet:");
  v11 = (void *)__revisionTrackingCodeToEntityClassMap;
  __revisionTrackingCodeToEntityClassMap = v10;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        v18 = (void *)__revisionTrackingCodeToEntityClassMap;
        v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "revisionTrackingCode"));
        [v18 setObject:v17 forKey:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }
}

- (id)errorResolverForItem:(id)a3
{
  uint64_t v3 = [a3 mediaItem];
  id v4 = [v3 valueForProperty:@"storeAccountID"];
  uint64_t v5 = [[MPStorePurchaseErrorResolver alloc] initWithStoreAccountIdentifier:v4];

  return v5;
}

- (void)_seedCloudPlaylistWithTrack:(id)a3 container:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4FB8618] sharedMonitor];
  uint64_t v12 = [v11 networkType];

  char IsCellular = ICEnvironmentNetworkTypeIsCellular();
  uint64_t v14 = +[MPPlaybackUserDefaults standardUserDefaults];
  uint64_t v15 = [v14 preferredMusicLowBandwidthResolution];

  char v16 = IsCellular ^ 1;
  if (v15 > 0) {
    char v16 = 1;
  }
  if (v12 && (v16 & 1) != 0)
  {
    BOOL v17 = v15 > 0;
    v18 = [v8 valueForProperty:*MEMORY[0x1E4F799C0]];
    uint64_t v19 = [v18 longLongValue];

    v20 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
    long long v21 = +[MPCloudController controllerWithUserIdentity:v20];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __93__MPMediaLibraryDataProviderSystemML3__seedCloudPlaylistWithTrack_container_completionBlock___block_invoke;
    v23[3] = &unk_1E57F3A38;
    BOOL v27 = v17;
    v23[4] = self;
    id v24 = v9;
    id v25 = v8;
    id v26 = v10;
    [v21 loadGeniusItemsForSagaID:v19 completionHandler:v23];
  }
  else
  {
    long long v22 = [(id)objc_opt_class() _localizedCloudGeniusErrorForError:0];
    if (v10) {
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v22);
    }
  }
}

void __93__MPMediaLibraryDataProviderSystemML3__seedCloudPlaylistWithTrack_container_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  BOOL v27 = __Block_byref_object_copy__29021;
  long long v28 = __Block_byref_object_dispose__29022;
  id v29 = 0;
  uint64_t v7 = [MEMORY[0x1E4FB8618] sharedMonitor];
  uint64_t v8 = [v7 networkType];

  if (v8 && (!ICEnvironmentNetworkTypeIsCellular() || *(unsigned char *)(a1 + 64)))
  {
    id v9 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__MPMediaLibraryDataProviderSystemML3__seedCloudPlaylistWithTrack_container_completionBlock___block_invoke_54;
    v16[3] = &unk_1E57F3A10;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(a1 + 40);
    id v17 = v10;
    uint64_t v18 = v11;
    long long v22 = &v30;
    id v19 = v12;
    id v20 = *(id *)(a1 + 48);
    long long v23 = &v24;
    id v21 = v6;
    [v9 performTransactionWithBlock:v16];

    uint64_t v13 = v17;
  }
  else
  {
    uint64_t v14 = [(id)objc_opt_class() _localizedCloudGeniusErrorForError:v6];
    uint64_t v13 = (void *)v25[5];
    v25[5] = v14;
  }

  if (*((unsigned char *)v31 + 24)) {
    +[MPMediaLibrary reloadLibraryDataProvider:*(void *)(a1 + 32)];
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 16))(v15, *((unsigned __int8 *)v31 + 24), v25[5]);
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

uint64_t __93__MPMediaLibraryDataProviderSystemML3__seedCloudPlaylistWithTrack_container_completionBlock___block_invoke_54(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if (v2)
  {
    id v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2 + 1];
    uint64_t v3 = [*(id *)(a1 + 40) library];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      uint64_t v7 = *MEMORY[0x1E4F799C0];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(obj);
          }
          id v9 = (void *)MEMORY[0x1E4F79B50];
          id v10 = objc_msgSend(MEMORY[0x1E4F79AA0], "predicateWithProperty:equalToInt64:", v7, objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "longLongValue"));
          uint64_t v11 = [v9 anyInLibrary:v3 predicate:v10];

          if (v11)
          {
            uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
            [v21 addObject:v12];

            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);
    }

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      uint64_t v13 = *(void **)(a1 + 48);
      uint64_t v14 = [*(id *)(a1 + 56) valueForProperty:*MEMORY[0x1E4F79350]];
      [v13 setValue:v14 forProperty:*MEMORY[0x1E4F79308]];

      uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 56), "persistentID"));
      [v21 replaceObjectAtIndex:0 withObject:v15];

      [*(id *)(a1 + 48) setTracksWithPersistentIDs:v21 notify:1];
    }
  }
  uint64_t v16 = objc_msgSend((id)objc_opt_class(), "_localizedGeniusErrorForError:geniusEnabled:", *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 40), "isGeniusEnabled"));
  uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
}

- (void)geniusItemsForSeedItem:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F79B50];
  uint64_t v8 = [a3 persistentID];
  id v9 = [(MPMediaLibraryDataProviderML3 *)self library];
  id v10 = (void *)[v7 newWithPersistentID:v8 inLibrary:v9];

  uint64_t v11 = [MEMORY[0x1E4F79B58] geniusTracksForSeedTrack:v10 error:0];
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
        id v19 = [MPMediaItem alloc];
        id v20 = -[MPMediaItem initWithPersistentID:](v19, "initWithPersistentID:", objc_msgSend(v18, "persistentID", (void)v21));
        [v12 addObject:v20];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  if (v6) {
    v6[2](v6, v12);
  }
}

- (int64_t)generateItemIdentifiersForGeniusClusterPlaylist:(void *)a3 count:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v5 = 0;
  if (a3 && a4)
  {
    uint64_t v7 = [a3 tracksFromClusterForCount:*a4 error:a5];
    unint64_t v8 = [v7 count];
    uint64_t v5 = (int64_t *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v10 = [v7 objectAtIndex:i];
        v5[i] = [v10 persistentID];
      }
    }
    *a4 = v8;
  }
  return v5;
}

- (void)createGeniusClusterPlaylistWithSeedItemIdentifiers:(int64_t *)a3 count:(unint64_t)a4 error:(id *)a5
{
  unint64_t v6 = a4;
  for (uint64_t i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4]; v6; --v6)
  {
    id v10 = (void *)MEMORY[0x1E4F79B50];
    uint64_t v11 = *a3++;
    uint64_t v12 = [(MPMediaLibraryDataProviderML3 *)self library];
    id v13 = (void *)[v10 newWithPersistentID:v11 inLibrary:v12];

    [i addObject:v13];
  }
  uint64_t v14 = [MEMORY[0x1E4F79B58] playlistControllerWithSeedTracks:i error:a5];
  uint64_t v15 = v14;
  if (v14) {
    id v16 = v14;
  }

  return v15;
}

- (void)seedPlaylistWithIdentifier:(int64_t)a3 withItemWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F79AB8];
  id v10 = [(MPMediaLibraryDataProviderML3 *)self library];
  uint64_t v11 = (void *)[v9 newWithPersistentID:a3 inLibrary:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F79B50];
  id v13 = [(MPMediaLibraryDataProviderML3 *)self library];
  uint64_t v14 = (void *)[v12 newWithPersistentID:a4 inLibrary:v13];

  uint64_t v15 = [v14 valueForProperty:*MEMORY[0x1E4F799C0]];
  uint64_t v16 = [v15 longLongValue];

  if (([MEMORY[0x1E4F79B58] hasGeniusDataAvailable] & 1) != 0 || !v16)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F79B58];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __105__MPMediaLibraryDataProviderSystemML3_seedPlaylistWithIdentifier_withItemWithIdentifier_completionBlock___block_invoke;
    v18[3] = &unk_1E57F39E8;
    v18[4] = self;
    uint64_t v22 = v16;
    id v19 = v14;
    id v20 = v11;
    id v21 = v8;
    [v17 populateContainer:v20 withSeedTrack:v19 completionBlock:v18];
  }
  else
  {
    [(MPMediaLibraryDataProviderSystemML3 *)self _seedCloudPlaylistWithTrack:v14 container:v11 completionBlock:v8];
  }
}

void __105__MPMediaLibraryDataProviderSystemML3_seedPlaylistWithIdentifier_withItemWithIdentifier_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v5 = objc_msgSend((id)objc_opt_class(), "_localizedGeniusErrorForError:geniusEnabled:", v7, objc_msgSend(*(id *)(a1 + 32), "isGeniusEnabled"));
    if (a2)
    {
LABEL_3:
      +[MPMediaLibrary reloadLibraryDataProvider:*(void *)(a1 + 32)];
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  if (*(void *)(a1 + 64))
  {
    [*(id *)(a1 + 32) _seedCloudPlaylistWithTrack:*(void *)(a1 + 40) container:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v5);
  }
LABEL_9:
}

- (BOOL)isGeniusEnabled
{
  if ([MEMORY[0x1E4F79B58] hasGeniusFeatureEnabled]) {
    return 1;
  }
  uint64_t v4 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
  uint64_t v5 = +[MPCloudController controllerWithUserIdentity:v4];
  char v6 = [v5 isGeniusEnabled];

  return v6;
}

- (int64_t)_currentRevision
{
  int64_t result = self->_currentRevision;
  if (!result)
  {
    uint64_t v4 = [(MPMediaLibraryDataProviderML3 *)self library];
    self->_currentRevision = [v4 currentRevision];

    return self->_currentRevision;
  }
  return result;
}

+ (id)_localizedGeniusErrorForError:(id)a3 geniusEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  id v8 = v7;
  if (v4)
  {
    id v9 = [v7 localizedStringForKey:@"GENIUS_PICKER_NO_RESULTS_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    uint64_t v12 = v11;
    id v13 = @"GENIUS_PICKER_NO_RESULTS_MESSAGE";
  }
  else
  {
    id v9 = [v7 localizedStringForKey:@"GENIUS_FEATURE_NOT_AVAILABLE_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    uint64_t v12 = v11;
    id v13 = @"GENIUS_FEATURE_NOT_AVAILABLE_SUBTITLE";
  }
  uint64_t v14 = [v11 localizedStringForKey:v13 value:&stru_1EE680640 table:@"MediaPlayer"];
  uint64_t v15 = objc_msgSend(v6, "initWithObjectsAndKeys:", v9, v10, v14, *MEMORY[0x1E4F28588], 0);

  if (v5)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = [v5 userInfo];

    if (v17)
    {
      uint64_t v18 = [v5 userInfo];
      [v16 addEntriesFromDictionary:v18];
    }
    if (v15) {
      [v16 addEntriesFromDictionary:v15];
    }
    id v19 = (void *)MEMORY[0x1E4F28C58];
    id v20 = [v5 domain];
    id v21 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v5, "code"), v16);
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:&stru_1EE680640 code:0 userInfo:v15];
  }

  return v21;
}

+ (id)_localizedCloudGeniusErrorForError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  if ([v4 hasCellularDataCapability])
  {
    id v5 = +[MPPlaybackUserDefaults standardUserDefaults];
    BOOL v6 = [v5 preferredMusicLowBandwidthResolution] < 1;
  }
  else
  {
    BOOL v6 = 1;
  }
  id v7 = [MEMORY[0x1E4FB8618] sharedMonitor];
  [v7 networkType];

  int IsCellular = ICEnvironmentNetworkTypeIsCellular();
  int v9 = [v4 hasWiFiCapability];
  int v10 = [v4 hasWAPICapability];
  if (v6 || !v9 || (IsCellular & 1) != 0)
  {
    if ((v6 | IsCellular))
    {
      if (v9)
      {
        uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
        uint64_t v12 = v11;
        id v13 = @"GENIUS_PLAYLIST_OFFLINE_SUBTITLE_WIFI";
        uint64_t v14 = @"GENIUS_PLAYLIST_OFFLINE_SUBTITLE_WLAN";
        goto LABEL_11;
      }
      id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      uint64_t v18 = [v16 localizedStringForKey:@"GENIUS_FEATURE_NOT_AVAILABLE_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      long long v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      id v19 = v23;
      long long v24 = @"GENIUS_FEATURE_NOT_AVAILABLE_SUBTITLE";
    }
    else
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      uint64_t v18 = [v16 localizedStringForKey:@"GENIUS_PLAYLIST_OFFLINE_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      long long v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      id v19 = v23;
      long long v24 = @"GENIUS_PLAYLIST_OFFLINE_SUBTITLE_CELLULAR";
    }
    long long v25 = [v23 localizedStringForKey:v24 value:&stru_1EE680640 table:@"MediaPlayer"];
    id v20 = objc_msgSend(v21, "initWithObjectsAndKeys:", v18, v22, v25, *MEMORY[0x1E4F28588], 0);

    goto LABEL_18;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  uint64_t v12 = v11;
  id v13 = @"GENIUS_PLAYLIST_OFFLINE_SUBTITLE_ALL";
  uint64_t v14 = @"GENIUS_PLAYLIST_OFFLINE_SUBTITLE_ALL_WLAN";
LABEL_11:
  if (v10) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v13;
  }
  id v16 = [v11 localizedStringForKey:v15 value:&stru_1EE680640 table:@"MediaPlayer"];

  id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  id v19 = [v18 localizedStringForKey:@"GENIUS_PLAYLIST_OFFLINE_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];
  id v20 = objc_msgSend(v17, "initWithObjectsAndKeys:", v19, *MEMORY[0x1E4F28568], v16, *MEMORY[0x1E4F28588], 0);
LABEL_18:

  if (v3)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v27 = [v3 userInfo];

    if (v27)
    {
      long long v28 = [v3 userInfo];
      [v26 addEntriesFromDictionary:v28];
    }
    if (v20) {
      [v26 addEntriesFromDictionary:v20];
    }
    id v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = [v3 domain];
    uint64_t v31 = objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, objc_msgSend(v3, "code"), v26);
  }
  else
  {
    uint64_t v31 = [MEMORY[0x1E4F28C58] errorWithDomain:&stru_1EE680640 code:0 userInfo:v20];
  }

  return v31;
}

@end