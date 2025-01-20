@interface AVTCoreDataCloudKitMirroringHandler
- (AVTBlockScheduler)blockScheduler;
- (AVTCoreDataCloudKitMirroringHandler)initWithLogger:(id)a3 blockScheduler:(id)a4;
- (AVTCoreDataCloudKitMirroringHandlerDelegate)delegate;
- (AVTUILogger)logger;
- (BOOL)exportInFlight;
- (NSNotificationCenter)notificationCenter;
- (NSObject)didResetNotificationToken;
- (NSObject)willResetNotificationToken;
- (void)dealloc;
- (void)didResetSync:(id)a3;
- (void)exportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6;
- (void)importChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6;
- (void)resetZoneWithManagedObjectContext:(id)a3 completionHandler:(id)a4;
- (void)scheduleExportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setDidResetNotificationToken:(id)a3;
- (void)setExportInFlight:(BOOL)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setWillResetNotificationToken:(id)a3;
- (void)startObservingResetSyncWithNotificationCenter:(id)a3;
- (void)willResetSync:(id)a3;
@end

@implementation AVTCoreDataCloudKitMirroringHandler

- (AVTCoreDataCloudKitMirroringHandler)initWithLogger:(id)a3 blockScheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTCoreDataCloudKitMirroringHandler;
  v9 = [(AVTCoreDataCloudKitMirroringHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a3);
    objc_storeStrong((id *)&v10->_blockScheduler, a4);
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(AVTCoreDataCloudKitMirroringHandler *)self willResetNotificationToken];

  if (v3)
  {
    v4 = [(AVTCoreDataCloudKitMirroringHandler *)self notificationCenter];
    v5 = [(AVTCoreDataCloudKitMirroringHandler *)self willResetNotificationToken];
    [v4 removeObserver:v5];
  }
  v6 = [(AVTCoreDataCloudKitMirroringHandler *)self didResetNotificationToken];

  if (v6)
  {
    id v7 = [(AVTCoreDataCloudKitMirroringHandler *)self notificationCenter];
    id v8 = [(AVTCoreDataCloudKitMirroringHandler *)self didResetNotificationToken];
    [v7 removeObserver:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)AVTCoreDataCloudKitMirroringHandler;
  [(AVTCoreDataCloudKitMirroringHandler *)&v9 dealloc];
}

- (void)startObservingResetSyncWithNotificationCenter:(id)a3
{
  id v4 = a3;
  v5 = [(AVTCoreDataCloudKitMirroringHandler *)self willResetNotificationToken];
  if (v5)
  {

LABEL_4:
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Already observing notifications"];
    goto LABEL_5;
  }
  v6 = [(AVTCoreDataCloudKitMirroringHandler *)self didResetNotificationToken];

  if (v6) {
    goto LABEL_4;
  }
LABEL_5:
  id v7 = [(AVTCoreDataCloudKitMirroringHandler *)self logger];
  [v7 logStartObservingResetSync];

  objc_initWeak(&location, self);
  [(AVTCoreDataCloudKitMirroringHandler *)self setNotificationCenter:v4];
  uint64_t v8 = *MEMORY[0x263EFEFD8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__AVTCoreDataCloudKitMirroringHandler_startObservingResetSyncWithNotificationCenter___block_invoke;
  v14[3] = &unk_2647C3368;
  objc_copyWeak(&v15, &location);
  objc_super v9 = [v4 addObserverForName:v8 object:0 queue:0 usingBlock:v14];
  [(AVTCoreDataCloudKitMirroringHandler *)self setWillResetNotificationToken:v9];

  uint64_t v10 = *MEMORY[0x263EFEFC8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__AVTCoreDataCloudKitMirroringHandler_startObservingResetSyncWithNotificationCenter___block_invoke_2;
  v12[3] = &unk_2647C3368;
  objc_copyWeak(&v13, &location);
  v11 = [v4 addObserverForName:v10 object:0 queue:0 usingBlock:v12];
  [(AVTCoreDataCloudKitMirroringHandler *)self setDidResetNotificationToken:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __85__AVTCoreDataCloudKitMirroringHandler_startObservingResetSyncWithNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained willResetSync:v3];
}

void __85__AVTCoreDataCloudKitMirroringHandler_startObservingResetSyncWithNotificationCenter___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didResetSync:v3];
}

- (void)willResetSync:(id)a3
{
  id v4 = a3;
  v5 = [(AVTCoreDataCloudKitMirroringHandler *)self logger];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__AVTCoreDataCloudKitMirroringHandler_willResetSync___block_invoke;
  v7[3] = &unk_2647C37F8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  [v5 processingWillResetSyncNotification:v7];
}

void __53__AVTCoreDataCloudKitMirroringHandler_willResetSync___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v7 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFEFD0]];

  if (v7)
  {
    uint64_t v3 = [v7 unsignedIntegerValue];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) logger];
    [v4 logMissingResetSyncReasonKey];

    uint64_t v3 = 0;
  }
  v5 = [*(id *)(a1 + 40) logger];
  [v5 logResetSyncReason:v3];

  id v6 = [*(id *)(a1 + 40) delegate];
  [v6 mirroringHandler:*(void *)(a1 + 40) willResetSyncWithReason:v3];
}

- (void)didResetSync:(id)a3
{
  id v4 = a3;
  v5 = [(AVTCoreDataCloudKitMirroringHandler *)self logger];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__AVTCoreDataCloudKitMirroringHandler_didResetSync___block_invoke;
  v7[3] = &unk_2647C37F8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  [v5 processingDidResetSyncNotification:v7];
}

void __52__AVTCoreDataCloudKitMirroringHandler_didResetSync___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v7 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFEFD0]];

  if (v7)
  {
    uint64_t v3 = [v7 unsignedIntegerValue];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) logger];
    [v4 logMissingResetSyncReasonKey];

    uint64_t v3 = 0;
  }
  v5 = [*(id *)(a1 + 40) logger];
  [v5 logResetSyncReason:v3];

  id v6 = [*(id *)(a1 + 40) delegate];
  [v6 mirroringHandler:*(void *)(a1 + 40) didResetSyncWithReason:v3];
}

- (void)scheduleExportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(AVTCoreDataCloudKitMirroringHandler *)self blockScheduler];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __127__AVTCoreDataCloudKitMirroringHandler_scheduleExportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke;
  v17[3] = &unk_2647C3820;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [v13 performBlock:v17 afterDelay:v14 onQueue:0.0];
}

void __127__AVTCoreDataCloudKitMirroringHandler_scheduleExportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) exportInFlight])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2)
    {
      uint64_t v7 = *MEMORY[0x263F08338];
      v8[0] = @"Export already in flight, try again later";
      uint64_t v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
      id v4 = +[AVTError errorWithCode:720 userInfo:v3];
      (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v4);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setExportInFlight:1];
    [*(id *)(a1 + 32) exportChangesWithManagedObjectContext:*(void *)(a1 + 40) discretionary:*(unsigned __int8 *)(a1 + 64) workQueue:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
    v5 = [*(id *)(a1 + 32) blockScheduler];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __127__AVTCoreDataCloudKitMirroringHandler_scheduleExportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2;
    v6[3] = &unk_2647C3760;
    v6[4] = *(void *)(a1 + 32);
    [v5 performBlock:v6 afterDelay:*(void *)(a1 + 48) onQueue:3.0];
  }
}

uint64_t __127__AVTCoreDataCloudKitMirroringHandler_scheduleExportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExportInFlight:0];
}

- (void)importChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke;
  v16[3] = &unk_2647C38E8;
  v16[4] = self;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  BOOL v20 = a4;
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  [v14 performBlockAndWait:v16];
}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) logger];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_2647C38C0;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = *(id *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 64);
  id v3 = v2;
  [v3 importingRecords:v4];
}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF208]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_3;
  v13[3] = &unk_2647C3898;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v3 = (void *)[v2 initWithOptions:0 completionBlock:v13];
  id v4 = [v3 options];
  +[AVTCoreDataCloudKitMirroringConfiguration configureMirroringRequestOptions:v4 discretionary:*(unsigned __int8 *)(a1 + 64)];

  id v5 = *(void **)(a1 + 40);
  id v12 = 0;
  id v6 = [v5 executeRequest:v3 error:&v12];
  id v7 = v12;

  if (!v6)
  {
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = [v7 code];
    id v10 = [v7 description];
    [v8 logMirroringRequestErrorWithCode:v9 description:v10];

    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v7);
    }
  }
}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_4;
  v6[3] = &unk_2647C3870;
  id v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_5;
  v3[3] = &unk_2647C3848;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performBlockAndWait:v3];
}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) success];
  id v4 = [*(id *)(a1 + 40) error];
  id v5 = [v4 description];
  [v2 logImportRequestResult:v3 error:v5];

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) success];
    id v8 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v8);
  }
}

- (void)exportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke;
  v16[3] = &unk_2647C38E8;
  v16[4] = self;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  BOOL v20 = a4;
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  [v14 performBlockAndWait:v16];
}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logger];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_2647C38C0;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = *(id *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 64);
  id v3 = v2;
  [v3 exportingRecords:v4];
}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF200]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_3;
  v13[3] = &unk_2647C3898;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v3 = (void *)[v2 initWithOptions:0 completionBlock:v13];
  id v4 = [v3 options];
  +[AVTCoreDataCloudKitMirroringConfiguration configureMirroringRequestOptions:v4 discretionary:*(unsigned __int8 *)(a1 + 64)];

  id v5 = *(void **)(a1 + 40);
  id v12 = 0;
  id v6 = [v5 executeRequest:v3 error:&v12];
  id v7 = v12;

  if (!v6)
  {
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = [v7 code];
    id v10 = [v7 description];
    [v8 logMirroringRequestErrorWithCode:v9 description:v10];

    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v7);
    }
  }
}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_4;
  v6[3] = &unk_2647C3870;
  id v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_5;
  v3[3] = &unk_2647C3848;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performBlockAndWait:v3];
}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) success];
  id v4 = [*(id *)(a1 + 40) error];
  id v5 = [v4 description];
  [v2 logExportRequestResult:v3 error:v5];

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) success];
    id v8 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v8);
  }
}

- (void)resetZoneWithManagedObjectContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke;
  v9[3] = &unk_2647C31E8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [v8 performBlockAndWait:v9];
}

void __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF218]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke_2;
  v10[3] = &unk_2647C3910;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v3 = (void *)[v2 initWithOptions:0 completionBlock:v10];
  id v4 = [v3 options];
  +[AVTCoreDataCloudKitMirroringConfiguration configureMirroringRequestOptions:v4];

  id v5 = *(void **)(a1 + 32);
  id v9 = 0;
  id v6 = [v5 executeRequest:v3 error:&v9];
  id v7 = v9;
  if (!v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v7);
    }
  }
}

void __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke_3;
  v7[3] = &unk_2647C3210;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlockAndWait:v7];
}

void __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) success];
  id v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (AVTCoreDataCloudKitMirroringHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVTCoreDataCloudKitMirroringHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTBlockScheduler)blockScheduler
{
  return self->_blockScheduler;
}

- (NSObject)willResetNotificationToken
{
  return self->_willResetNotificationToken;
}

- (void)setWillResetNotificationToken:(id)a3
{
}

- (NSObject)didResetNotificationToken
{
  return self->_didResetNotificationToken;
}

- (void)setDidResetNotificationToken:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (BOOL)exportInFlight
{
  return self->_exportInFlight;
}

- (void)setExportInFlight:(BOOL)a3
{
  self->_exportInFlight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_didResetNotificationToken, 0);
  objc_storeStrong((id *)&self->_willResetNotificationToken, 0);
  objc_storeStrong((id *)&self->_blockScheduler, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end