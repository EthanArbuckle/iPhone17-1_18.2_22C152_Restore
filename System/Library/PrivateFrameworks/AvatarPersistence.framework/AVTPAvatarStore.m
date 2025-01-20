@interface AVTPAvatarStore
+ (id)defaultBackendWithWorkQueue:(id)a3 environment:(id)a4;
+ (unint64_t)maximumNumberOfFetchableAvatars;
+ (unint64_t)maximumNumberOfSavableAvatars;
- (AVTCoreEnvironment)environment;
- (AVTPAvatarStore)init;
- (AVTPAvatarStore)initWithBackend:(id)a3 backendAccessQueue:(id)a4 puppetStore:(id)a5 stickerBackend:(id)a6 environment:(id)a7;
- (AVTPAvatarStore)initWithEnvironment:(id)a3;
- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate;
- (AVTPuppetStore)puppetStore;
- (AVTStickerBackend)stickerBackend;
- (AVTStoreBackend)backend;
- (AVTUILogger)logger;
- (BOOL)canCreateAvatar;
- (BOOL)canCreateAvatarWithError:(id *)a3;
- (OS_dispatch_queue)backendAccessQueue;
- (OS_dispatch_queue)puppetStoreAccessQueue;
- (OS_dispatch_queue)workQueue;
- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4;
- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4;
- (void)backend:(id)a3 didChangeRecordsWithIdentifiers:(id)a4;
- (void)deleteAvatar:(id)a3 completionHandler:(id)a4;
- (void)deleteAvatarWithIdentifier:(id)a3 completionBlock:(id)a4;
- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4;
- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5;
- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5;
- (void)duplicateAvatar:(id)a3 completionBlock:(id)a4;
- (void)fetchAvatarsForFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)performAsynchronousWork:(id)a3;
- (void)performBackendWork:(id)a3;
- (void)performPuppetStoreWork:(id)a3;
- (void)postChangeNotificationForRecordWithIdentifiers:(id)a3 remote:(BOOL)a4;
- (void)saveAvatarRecord:(id)a3 thumbnailAvatar:(id)a4 completionBlock:(id)a5 thumbnailGenerationCompletionBlock:(id)a6;
- (void)setImageHandlingDelegate:(id)a3;
- (void)setStickerBackendDelegate:(id)a3;
@end

@implementation AVTPAvatarStore

+ (id)defaultBackendWithWorkQueue:(id)a3 environment:(id)a4
{
  id v4 = a4;
  if (AVTUIIsAvatarUIEnabled_once())
  {
    v5 = +[AVTCoreDataPersistentStoreConfiguration remoteConfigurationWithEnvironment:v4];
    v6 = [[AVTCoreDataStoreBackend alloc] initWithConfiguration:v5 environment:v4];
  }
  else
  {
    v6 = objc_alloc_init(AVTStubbedStoreBackend);
  }

  return v6;
}

- (AVTPAvatarStore)init
{
  v3 = +[AVTCoreEnvironment defaultEnvironment];
  id v4 = [(AVTPAvatarStore *)self initWithEnvironment:v3];

  return v4;
}

- (AVTPAvatarStore)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [v4 lockProvider];
  v6 = ((void (**)(void, const char *))v5)[2](v5, "com.apple.AvatarUI.AVTAvatarStore.backendAcccessQueue");

  v7 = [(id)objc_opt_class() defaultBackendWithWorkQueue:v6 environment:v4];
  v8 = [[AVTPuppetStore alloc] initWithEnvironment:v4];
  v9 = [AVTStickerUserDefaultsBackend alloc];
  v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v11 = [(AVTStickerUserDefaultsBackend *)v9 initWithWorkQueue:v6 environment:v4 userDefaults:v10];

  v12 = [(AVTPAvatarStore *)self initWithBackend:v7 backendAccessQueue:v6 puppetStore:v8 stickerBackend:v11 environment:v4];
  return v12;
}

- (AVTPAvatarStore)initWithBackend:(id)a3 backendAccessQueue:(id)a4 puppetStore:(id)a5 stickerBackend:(id)a6 environment:(id)a7
{
  id v30 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)AVTPAvatarStore;
  v17 = [(AVTPAvatarStore *)&v31 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_environment, a7);
    objc_storeStrong((id *)&v18->_backend, a3);
    [(AVTStoreBackend *)v18->_backend setBackendDelegate:v18];
    objc_storeStrong((id *)&v18->_puppetStore, a5);
    v19 = [v16 serialQueueProvider];
    uint64_t v20 = ((void (**)(void, const char *))v19)[2](v19, "com.apple.AvatarUI.AVTAvatarStore.workQueue");
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v18->_backendAccessQueue, a4);
    v22 = [v16 lockProvider];
    uint64_t v23 = ((void (**)(void, const char *))v22)[2](v22, "com.apple.AvatarUI.AVTAvatarStore.puppetStoreAccessQueue");
    puppetStoreAccessQueue = v18->_puppetStoreAccessQueue;
    v18->_puppetStoreAccessQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = [v16 logger];
    logger = v18->_logger;
    v18->_logger = (AVTUILogger *)v25;

    v27 = v18->_logger;
    v28 = [(AVTPAvatarStore *)v18 description];
    [(AVTUILogger *)v27 logCreatingStore:v28];

    objc_storeStrong((id *)&v18->_stickerBackend, a6);
  }

  return v18;
}

- (BOOL)canCreateAvatar
{
  return [(AVTPAvatarStore *)self canCreateAvatarWithError:0];
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  if (AVTIsRunningAsSetupUser())
  {
    v5 = [(AVTPAvatarStore *)self logger];
    [v5 logSkippedFetchingRecordsWithReason:@"Running as setup user"];

    return 0;
  }
  else
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__3;
    id v13 = __Block_byref_object_dispose__3;
    id v14 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__AVTPAvatarStore_canCreateAvatarWithError___block_invoke;
    v8[3] = &unk_2647C3E70;
    v8[4] = &v15;
    v8[5] = &v9;
    [(AVTPAvatarStore *)self performBackendWork:v8];
    BOOL v6 = *((unsigned char *)v16 + 24) != 0;
    if (a3 && !*((unsigned char *)v16 + 24)) {
      *a3 = (id) v10[5];
    }
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }
  return v6;
}

void __44__AVTPAvatarStore_canCreateAvatarWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [a2 canCreateAvatarWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__3;
  v62 = __Block_byref_object_dispose__3;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__3;
  v56 = __Block_byref_object_dispose__3;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__3;
  v50 = __Block_byref_object_dispose__3;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  v44 = __Block_byref_object_dispose__3;
  id v45 = 0;
  if (AVTIsRunningAsSetupUser())
  {
    v7 = [(AVTPAvatarStore *)self logger];
    [v7 logSkippedFetchingRecordsWithReason:@"Running as setup user"];
  }
  else
  {
    v8 = [(AVTPAvatarStore *)self logger];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke;
    v36[3] = &unk_2647C3EC0;
    v36[4] = self;
    v38 = &v58;
    id v37 = v6;
    v39 = &v46;
    [v8 fetchingRecords:v36];
  }
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  objc_super v31 = __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke_3;
  v32 = &unk_2647C3EE8;
  v34 = &v52;
  id v9 = v6;
  id v33 = v9;
  v35 = &v40;
  [(AVTPAvatarStore *)self performPuppetStoreWork:&v29];
  v10 = (void *)v59[5];
  uint64_t v11 = v53[5];
  if (v10)
  {
    if (v11)
    {
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v29, v30, v31, v32);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    uint64_t v17 = objc_msgSend((id)v41[5], "domain", v29, v30, v31, v32);
    if ([v17 isEqual:@"AVTAvatarUIErrorDomain"])
    {
      BOOL v18 = [(id)v41[5] code] == 404;

      if (v18)
      {
        v19 = [(AVTPAvatarStore *)self logger];
        uint64_t v20 = [(id)v41[5] description];
        [v19 logRecordsNotFoundInPuppetStore:v20];
LABEL_24:

        v26 = v59;
        goto LABEL_25;
      }
    }
    else
    {
    }
    v19 = [(AVTPAvatarStore *)self logger];
    uint64_t v20 = [(id)v41[5] description];
    [v19 logReadingError:v20];
    goto LABEL_24;
  }
  if (v11)
  {
    id v13 = objc_msgSend((id)v47[5], "domain", v29, v30, v31, v32);
    if ([v13 isEqual:@"AVTAvatarUIErrorDomain"])
    {
      BOOL v14 = [(id)v47[5] code] == 404;

      if (v14)
      {
        uint64_t v15 = [(AVTPAvatarStore *)self logger];
        id v16 = [(id)v47[5] description];
        [v15 logRecordsNotFoundInRecordStore:v16];
LABEL_21:

        v26 = v53;
LABEL_25:
        id v12 = (id)v26[5];
LABEL_26:
        v27 = v12;
        id v25 = 0;
        if (v12) {
          goto LABEL_30;
        }
        goto LABEL_27;
      }
    }
    else
    {
    }
    uint64_t v15 = [(AVTPAvatarStore *)self logger];
    id v16 = [(id)v47[5] description];
    [v15 logReadingError:v16];
    goto LABEL_21;
  }
  v21 = objc_msgSend(MEMORY[0x263EFF980], "array", v29, v30, v31, v32);
  v22 = v21;
  if (v47[5]) {
    objc_msgSend(v21, "addObject:");
  }
  if (v41[5]) {
    objc_msgSend(v22, "addObject:");
  }
  v64 = @"AVTAvatarUIMultipleErrorsKey";
  uint64_t v23 = (void *)[v22 copy];
  v65[0] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v65 forKeys:&v64 count:1];
  id v25 = +[AVTError errorWithCode:666 userInfo:v24];

LABEL_27:
  if (a4)
  {
    id v25 = v25;
    v27 = 0;
    *a4 = v25;
  }
  else
  {
    v27 = 0;
  }
LABEL_30:

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v27;
}

void __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke_2;
  v6[3] = &unk_2647C3E98;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v5;
  long long v7 = v5;
  uint64_t v8 = *(void *)(a1 + 56);
  [v2 performBackendWork:v6];
  char v4 = [*(id *)(a1 + 32) logger];
  objc_msgSend(v4, "logFetchedRecords:criteria:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count"), objc_msgSend(*(id *)(a1 + 40), "criteria"));
}

void __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [a2 avatarsForFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [a2 avatarPuppetsForFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)performBackendWork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTPAvatarStore *)self backendAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__AVTPAvatarStore_performBackendWork___block_invoke;
  v7[3] = &unk_2647C3210;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __38__AVTPAvatarStore_performBackendWork___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) backend];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)performPuppetStoreWork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTPAvatarStore *)self puppetStoreAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__AVTPAvatarStore_performPuppetStoreWork___block_invoke;
  v7[3] = &unk_2647C3210;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __42__AVTPAvatarStore_performPuppetStoreWork___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) puppetStore];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)performAsynchronousWork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTPAvatarStore *)self workQueue];
  dispatch_async(v5, v4);
}

- (void)fetchAvatarsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__AVTPAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke;
  v10[3] = &unk_2647C3848;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AVTPAvatarStore *)self performAsynchronousWork:v10];
}

void __65__AVTPAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  id v4 = [v2 avatarsForFetchRequest:v3 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v4, v5);
  }
}

- (void)saveAvatarRecord:(id)a3 thumbnailAvatar:(id)a4 completionBlock:(id)a5 thumbnailGenerationCompletionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v10 format];
  }
  id v14 = v10;
  uint64_t v15 = [(AVTPAvatarStore *)self logger];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke;
  v20[3] = &unk_2647C3F38;
  v20[4] = self;
  id v21 = v14;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  id v19 = v14;
  [v15 savingRecords:v20];
}

void __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_2;
  v3[3] = &unk_2647C3F10;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 64);
  [v2 performAsynchronousWork:v3];
}

void __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_2(uint64_t a1)
{
  v44[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) imageHandlingDelegate];
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  v44[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  id v41 = 0;
  char v5 = [v2 deleteThumbnailsForAvatarRecordsWithIdentifiers:v4 error:&v41];
  id v6 = v41;

  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) imageHandlingDelegate];
    id v8 = [*(id *)(a1 + 40) identifier];
    id v9 = [*(id *)(a1 + 32) environment];
    [v7 clearStickersForAvatarRecordIdentifier:v8 withEnvironment:v9];

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__3;
    v39 = __Block_byref_object_dispose__3;
    id v40 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    id v10 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_3;
    v27[3] = &unk_2647C3E98;
    uint64_t v29 = &v31;
    id v28 = *(id *)(a1 + 40);
    uint64_t v30 = &v35;
    [v10 performBackendWork:v27];
    if (*((unsigned char *)v32 + 24))
    {
      id v11 = *(void **)(a1 + 32);
      if (*(void *)(a1 + 48))
      {
        id v12 = [v11 imageHandlingDelegate];
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 48);
        id v26 = v6;
        uint64_t v15 = [v12 generateThumbnailsForAvatarRecord:v13 avatar:v14 error:&v26];
        id v16 = v26;
      }
      else
      {
        id v12 = [v11 imageHandlingDelegate];
        uint64_t v43 = *(void *)(a1 + 40);
        uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
        id v25 = v6;
        uint64_t v15 = [v12 generateThumbnailsForAvatarRecords:v19 error:&v25];
        id v16 = v25;

        id v6 = (id)v19;
      }

      uint64_t v20 = *(void *)(a1 + 64);
      if (v20) {
        (*(void (**)(uint64_t, uint64_t, id))(v20 + 16))(v20, v15, v16);
      }
      uint64_t v21 = *(void *)(a1 + 56);
      if (v21) {
        (*(void (**)(uint64_t, void, uint64_t))(v21 + 16))(v21, *((unsigned __int8 *)v32 + 24), v36[5]);
      }
      id v22 = *(void **)(a1 + 32);
      id v23 = [*(id *)(a1 + 40) identifier];
      uint64_t v42 = v23;
      id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
      [v22 postChangeNotificationForRecordWithIdentifiers:v24 remote:0];

      id v6 = v16;
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 56);
      if (v18) {
        (*(void (**)(uint64_t, void, uint64_t))(v18 + 16))(v18, 0, v36[5]);
      }
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v6);
    }
  }
}

void __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [a2 saveAvatar:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

- (void)deleteAvatar:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ([v8 isEditable])
  {
    id v7 = [v8 identifier];
    [(AVTPAvatarStore *)self deleteAvatarWithIdentifier:v7 completionBlock:v6];
  }
  else
  {
    id v7 = +[AVTError errorWithCode:577 userInfo:0];
    v6[2](v6, 0, v7);
  }
}

- (void)deleteAvatarWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTPAvatarStore *)self logger];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke;
  v11[3] = &unk_2647C3A28;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 deletingRecords:v11];
}

void __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_2;
  v3[3] = &unk_2647C3848;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performAsynchronousWork:v3];
}

void __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  v34[1] = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__3;
  uint64_t v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_3;
  v19[3] = &unk_2647C3E98;
  uint64_t v21 = &v23;
  id v2 = *(void **)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  id v22 = &v27;
  [v2 performBackendWork:v19];
  uint64_t v3 = v24;
  if (*((unsigned char *)v24 + 24))
  {
    id v4 = [*(id *)(a1 + 32) imageHandlingDelegate];
    v34[0] = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
    id v18 = 0;
    char v6 = [v4 deleteThumbnailsForAvatarRecordsWithIdentifiers:v5 error:&v18];
    id v7 = v18;

    if ((v6 & 1) == 0)
    {
      id v8 = [*(id *)(a1 + 32) logger];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [v7 description];
      [v8 logErrorDeletingThumbnailsForIdentifier:v9 error:v10];
    }
    id v11 = [*(id *)(a1 + 32) stickerBackend];
    [v11 deleteRecentStickersWithAvatarIdentifier:*(void *)(a1 + 40) stickerIdentifier:0 completionHandler:0];

    id v12 = [*(id *)(a1 + 32) imageHandlingDelegate];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 32) environment];
    [v12 clearStickersForAvatarRecordIdentifier:v13 withEnvironment:v14];

    uint64_t v3 = v24;
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 16))(v15, *((unsigned __int8 *)v3 + 24), v28[5]);
    uint64_t v3 = v24;
  }
  if (*((unsigned char *)v3 + 24))
  {
    id v16 = *(void **)(a1 + 32);
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    [v16 postChangeNotificationForRecordWithIdentifiers:v17 remote:0];
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [a2 deleteAvatarWithIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

- (void)duplicateAvatar:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v6 format];
  }
  id v8 = v6;
  if ([v8 isEditable])
  {
    uint64_t v9 = [(AVTPAvatarStore *)self logger];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke;
    v11[3] = &unk_2647C3A28;
    v11[4] = self;
    id v12 = v8;
    id v13 = v7;
    [v9 duplicatingRecords:v11];
  }
  else
  {
    id v10 = +[AVTError errorWithCode:577 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v10);
  }
}

void __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke_2;
  v3[3] = &unk_2647C3848;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performAsynchronousWork:v3];
}

void __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke_2(uint64_t a1)
{
  v30[1] = *MEMORY[0x263EF8340];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  id v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__3;
  char v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke_3;
  v18[3] = &unk_2647C3E98;
  id v20 = &v22;
  id v2 = *(void **)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  uint64_t v21 = v28;
  [v2 performBackendWork:v18];
  uint64_t v3 = v23;
  if (v23[5])
  {
    id v4 = [*(id *)(a1 + 32) imageHandlingDelegate];
    uint64_t v5 = v23[5];
    uint64_t v6 = *(void *)(a1 + 40);
    id v17 = 0;
    char v7 = [v4 generateThumbnailsForDuplicateAvatarRecord:v5 originalRecord:v6 error:&v17];
    id v8 = v17;

    if ((v7 & 1) == 0)
    {
      uint64_t v9 = [*(id *)(a1 + 32) logger];
      id v10 = [*(id *)(a1 + 40) identifier];
      id v11 = [v8 description];
      [v9 logErrorDuplicatingThumbnailsForIdentifier:v10 error:v11];
    }
    uint64_t v3 = v23;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    (*(void (**)(uint64_t, BOOL))(v12 + 16))(v12, v3[5] != 0);
    uint64_t v3 = v23;
  }
  id v13 = (void *)v3[5];
  if (v13)
  {
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = [v13 identifier];
    v30[0] = v15;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    [v14 postChangeNotificationForRecordWithIdentifiers:v16 remote:0];
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v28, 8);
}

void __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [a2 duplicateAvatarRecord:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)postChangeNotificationForRecordWithIdentifiers:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = v6;
  if (v6)
  {
    uint64_t v14 = @"changedRecordIDs";
    v15[0] = v6;
    id v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [(AVTPAvatarStore *)self logger];
  [v9 logPostingChangeNotificationForIdentifiers:v7];

  id v10 = [(AVTPAvatarStore *)self environment];
  id v11 = [v10 notificationCenter];
  uint64_t v12 = v11;
  if (v4) {
    id v13 = 0;
  }
  else {
    id v13 = self;
  }
  [v11 postNotificationName:@"AVTAvatarStoreDidChangeNotification" object:v13 userInfo:v8];
}

+ (unint64_t)maximumNumberOfSavableAvatars
{
  if (AVTUIRestrictMaximumAvatarCount_once()) {
    return 3;
  }
  else {
    return 50;
  }
}

+ (unint64_t)maximumNumberOfFetchableAvatars
{
  return 2 * [a1 maximumNumberOfSavableAvatars];
}

- (void)backend:(id)a3 didChangeRecordsWithIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__AVTPAvatarStore_backend_didChangeRecordsWithIdentifiers___block_invoke;
  v10[3] = &unk_2647C39B0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AVTPAvatarStore *)self performAsynchronousWork:v10];
}

uint64_t __59__AVTPAvatarStore_backend_didChangeRecordsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) imageHandlingDelegate];
  uint64_t v3 = [*(id *)(a1 + 40) recordChangeTracker];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__AVTPAvatarStore_backend_didChangeRecordsWithIdentifiers___block_invoke_2;
  v5[3] = &unk_2647C3F60;
  v5[4] = *(void *)(a1 + 32);
  [v2 updateThumbnailsForChangesWithTracker:v3 recordProvider:v5];

  return [*(id *)(a1 + 32) postChangeNotificationForRecordWithIdentifiers:*(void *)(a1 + 48) remote:1];
}

id __59__AVTPAvatarStore_backend_didChangeRecordsWithIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[AVTAvatarFetchRequest requestForAvatarWithIdentifier:a2];
  BOOL v4 = [v2 avatarsForFetchRequest:v3 error:0];
  uint64_t v5 = [v4 firstObject];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v5 format];
    }
    id v6 = v5;
  }

  return v5;
}

- (void)setStickerBackendDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTPAvatarStore *)self stickerBackend];
  [v5 setStickerBackendDelegate:v4];
}

- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AVTPAvatarStore *)self stickerBackend];
  id v8 = [v7 recentStickersForFetchRequest:v6 error:a4];

  return v8;
}

- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AVTPAvatarStore *)self stickerBackend];
  [v11 didUseStickerWithAvatarIdentifier:v10 stickerIdentifier:v9 completionHandler:v8];
}

- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AVTPAvatarStore *)self stickerBackend];
  [v11 deleteRecentStickersWithAvatarIdentifier:v10 stickerIdentifier:v9 completionHandler:v8];
}

- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVTPAvatarStore *)self stickerBackend];
  [v8 deleteRecentStickersForChangeTracker:v7 completionHandler:v6];
}

- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageHandlingDelegate);

  return (AVTPBackendImageHandlingDelegate *)WeakRetained;
}

- (void)setImageHandlingDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)backendAccessQueue
{
  return self->_backendAccessQueue;
}

- (OS_dispatch_queue)puppetStoreAccessQueue
{
  return self->_puppetStoreAccessQueue;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTStoreBackend)backend
{
  return self->_backend;
}

- (AVTPuppetStore)puppetStore
{
  return self->_puppetStore;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTStickerBackend)stickerBackend
{
  return self->_stickerBackend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerBackend, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_puppetStore, 0);
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_puppetStoreAccessQueue, 0);
  objc_storeStrong((id *)&self->_backendAccessQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_imageHandlingDelegate);
}

@end