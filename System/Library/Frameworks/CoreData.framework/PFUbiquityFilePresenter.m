@interface PFUbiquityFilePresenter
+ (uint64_t)cloudDocsRootFolder;
+ (void)initialize;
+ (void)registerInitialSyncHandlerForURL:(uint64_t)a3 andContainerID:(NSObject *)global_queue onQueue:(uint64_t)a5 withBlock:;
+ (void)startDownloadForItems:(NSObject *)global_queue onQueue:(uint64_t)a4 withBlock:;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSString)description;
- (NSURL)presentedItemURL;
- (PFUbiquityFilePresenter)init;
- (PFUbiquityFilePresenter)initWithUbiquityRootLocation:(id)a3 localPeerID:(id)a4 storeName:(id)a5 processingQueue:(id)a6;
- (PFUbiquityLocationStatus)retainedStatusForLocation:(uint64_t)a1;
- (os_unfair_lock_s)copyStatusDictionary;
- (void)dealloc;
- (void)exporterDidMoveLog:(id)a3;
- (void)logImportWasCancelled:(id)a3;
- (void)logWasExported:(id)a3;
- (void)logWasImported:(id)a3;
- (void)logsWereScheduled:(id)a3;
- (void)presentedSubitemDidChangeAtURL:(id)a3;
- (void)printStatus:(id)a3;
- (void)registerSafeSaveFile:(uint64_t)a1;
- (void)relinquishPresentedItemToReader:(id)a3;
- (void)relinquishPresentedItemToWriter:(id)a3;
- (void)setupAssistantDiscoveredPathsFromMetadataQuery:(id)a3;
- (void)unregisterSafeSaveFile:(uint64_t)a1;
@end

@implementation PFUbiquityFilePresenter

+ (void)initialize
{
  v31[2] = *MEMORY[0x1E4F143B8];
  self;
  if ((id)objc_opt_class() == a1)
  {
    _privateQueue = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28F08]);
    _usesCloudDocs = 1;
    v3 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 5);
    if (v3)
    {
      v10 = v3;
      _MergedGlobals_87 = (uint64_t (*)(void, void))dlsym(v3, "BRStartDownloadForItems");
      if (!_MergedGlobals_87) {
        _NSCoreDataLog(1, @"CloudDocs.framework missing symbol BRStartDownloadForItems", v11, v12, v13, v14, v15, v16, v30);
      }
      Weak_BRRegisterInitialSyncHandlerForContainer = (uint64_t (*)(void, void))dlsym(v10, "BRRegisterInitialSyncHandlerForContainer");
      if (!Weak_BRRegisterInitialSyncHandlerForContainer) {
        _NSCoreDataLog(1, @"CloudDocs.framework missing symbol BRRegisterInitialSyncHandlerForContainer", v17, v18, v19, v20, v21, v22, v30);
      }
      v23 = dlsym(v10, "BRUbiquitousContainersRootFolderName");
      qword_1EB2707C8 = (uint64_t)v23;
      if (v23)
      {
        v31[0] = @"Library";
        v31[1] = *v23;
        qword_1EB2707D0 = objc_msgSend((id)objc_msgSend(NSString, "pathWithComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v31, 2)), "copy");
      }
      else
      {
        _NSCoreDataLog(1, @"CloudDocs.framework missing symbol BRUbiquitousContainersRootFolderName", v24, v25, v26, v27, v28, v29, v33);
      }
    }
    else
    {
      _NSCoreDataLog(1, @"Unable to dynamically link CloudDocs.framework", v4, v5, v6, v7, v8, v9, v30);
      dlclose(0);
    }
  }
}

+ (void)startDownloadForItems:(NSObject *)global_queue onQueue:(uint64_t)a4 withBlock:
{
  self;
  if ([a2 count])
  {
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(0, 0);
    }
    if (_MergedGlobals_87)
    {
      uint64_t v7 = v11;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      uint64_t v8 = &unk_1E544BD30;
      uint64_t v9 = __67__PFUbiquityFilePresenter_startDownloadForItems_onQueue_withBlock___block_invoke;
    }
    else
    {
      a4 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v7 = v10;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      uint64_t v8 = &unk_1E544B778;
      uint64_t v9 = __67__PFUbiquityFilePresenter_startDownloadForItems_onQueue_withBlock___block_invoke_2;
    }
    v7[2] = v9;
    v7[3] = v8;
    v7[4] = a2;
    v7[5] = a4;
    dispatch_async(global_queue, v7);
  }
}

uint64_t __67__PFUbiquityFilePresenter_startDownloadForItems_onQueue_withBlock___block_invoke(uint64_t a1)
{
  return _MergedGlobals_87(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __67__PFUbiquityFilePresenter_startDownloadForItems_onQueue_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) startDownloadingUbiquitousItemAtURL:*(void *)(*((void *)&v7 + 1) + 8 * v6++) error:0];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

+ (uint64_t)cloudDocsRootFolder
{
  self;
  uint64_t result = qword_1EB2707D0;
  if (!qword_1EB2707D0)
  {
    v1 = NSString;
    return [v1 pathWithComponents:&unk_1ED7E9970];
  }
  return result;
}

+ (void)registerInitialSyncHandlerForURL:(uint64_t)a3 andContainerID:(NSObject *)global_queue onQueue:(uint64_t)a5 withBlock:
{
  self;
  if (!global_queue) {
    global_queue = dispatch_get_global_queue(0, 0);
  }
  if (Weak_BRRegisterInitialSyncHandlerForContainer)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__PFUbiquityFilePresenter_registerInitialSyncHandlerForURL_andContainerID_onQueue_withBlock___block_invoke;
    v9[3] = &unk_1E544BD30;
    v9[4] = a3;
    v9[5] = a5;
    dispatch_async(global_queue, v9);
  }
  else
  {
    long long v8 = *(void (**)(uint64_t, void))(a5 + 16);
    v8(a5, 0);
  }
}

uint64_t __93__PFUbiquityFilePresenter_registerInitialSyncHandlerForURL_andContainerID_onQueue_withBlock___block_invoke(uint64_t a1)
{
  return Weak_BRRegisterInitialSyncHandlerForContainer(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (PFUbiquityFilePresenter)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityFilePresenter;
  v2 = [(PFUbiquityFilePresenter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_scheduledProcessingBlock = 0;
    v2->_localPeerID = 0;
    v2->_storeName = 0;
    v2->_ubiquityRootLocation = 0;
    v2->_pendingURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_locationToSafeSaveFile = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_locationToStatus = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (PFUbiquityFilePresenter)initWithUbiquityRootLocation:(id)a3 localPeerID:(id)a4 storeName:(id)a5 processingQueue:(id)a6
{
  long long v10 = [(PFUbiquityFilePresenter *)self init];
  if (v10)
  {
    uint64_t v11 = (PFUbiquityLocation *)a3;
    v10->_ubiquityRootLocation = v11;
    v10->_presentedItemURL = (NSURL *)-[PFUbiquityLocation createFullURL]((uint64_t)v11);
    v10->_localPeerID = (NSString *)a4;
    v10->_storeName = (NSString *)a5;
    if (a6)
    {
      v10->_processingQueue = (OS_dispatch_queue *)a6;
      dispatch_retain((dispatch_object_t)a6);
    }
    else
    {
      v10->_processingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coredata.ubiquity.fpqueue", 0);
    }
    uint64_t v12 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v10 selector:sel_logWasExported_ name:@"PFUbiquityLocationWasExportedNotification" object:v10->_ubiquityRootLocation];
    [v12 addObserver:v10 selector:sel_logWasImported_ name:@"PFUbiquityLocationWasImportedNotification" object:v10->_ubiquityRootLocation];
    [v12 addObserver:v10 selector:sel_logImportWasCancelled_ name:@"PFUbiquityLocationImportCancelledNotification" object:v10->_ubiquityRootLocation];
    [v12 addObserver:v10 selector:sel_logsWereScheduled_ name:@"PFUbiquityLocationsWereScheduledNotification" object:v10->_ubiquityRootLocation];
    [v12 addObserver:v10 selector:sel_setupAssistantDiscoveredPathsFromMetadataQuery_ name:@"PFUbiquityFilePresenterAddPathsNotification" object:v10->_ubiquityRootLocation];
    [v12 addObserver:v10 selector:sel_printStatus_ name:@"PFUbiquityFilePresenterPrintStatusNotification" object:0];
  }
  return v10;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_localPeerID = 0;
  self->_storeName = 0;

  self->_ubiquityRootLocation = 0;
  self->_presentedItemURL = 0;
  dispatch_release((dispatch_object_t)self->_processingQueue);
  self->_processingQueue = 0;

  self->_pendingURLs = 0;
  self->_locationToSafeSaveFile = 0;

  self->_locationToStatus = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityFilePresenter;
  [(PFUbiquityFilePresenter *)&v3 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityFilePresenter;
  return (NSString *)[NSString stringWithFormat:@"%@\n\tubiquityRootLocation: %@\n\tlocalPeerID: %@\n", -[PFUbiquityFilePresenter description](&v3, sel_description), self->_ubiquityRootLocation, self->_localPeerID];
}

- (NSURL)presentedItemURL
{
  return self->_presentedItemURL;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)_privateQueue;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
}

- (void)presentedSubitemDidChangeAtURL:(id)a3
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nGot change notification for url: %@", "-[PFUbiquityFilePresenter presentedSubitemDidChangeAtURL:]", 289, self, a3);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&self->_pendingURLsLock);
  [(NSMutableArray *)self->_pendingURLs addObject:a3];
  if (self->_scheduledProcessingBlock)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_pendingURLsLock);
  }
  else
  {
    self->_scheduledProcessingBlock = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_pendingURLsLock);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PFUbiquityFilePresenter_presentedSubitemDidChangeAtURL___block_invoke;
    block[3] = &unk_1E544B868;
    block[4] = self;
    dispatch_async(processingQueue, block);
  }
}

void *__58__PFUbiquityFilePresenter_presentedSubitemDidChangeAtURL___block_invoke(void *result)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = result[4];
  if (!v1) {
    return result;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 64));
  id obj = (id)[*(id *)(v1 + 56) copy];

  *(void *)(v1 + 56) = v2;
  *(unsigned char *)(v1 + 48) = 0;
  v40 = (void *)[*(id *)(v1 + 72) copy];
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(v1 + 80) copyItems:0];
  lock = (os_unfair_lock_s *)(v1 + 64);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nProcessing pending urls: %@", "-[PFUbiquityFilePresenter processPendingURLs]", 327, v1, obj);
  }
  v41 = (void *)v3;
  id v37 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  objc_super v5 = (void *)v3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v7 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  v38 = v6;
  v39 = v4;
  if (!v7)
  {
    char v43 = 0;
    goto LABEL_105;
  }
  char v43 = 0;
  uint64_t v8 = *(void *)v51;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v51 != v8) {
        objc_enumerationMutation(obj);
      }
      long long v10 = *(void **)(*((void *)&v50 + 1) + 8 * v9);
      uint64_t v11 = +[PFUbiquityLocation createUbiquityLocationForURL:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v10, *(unsigned char **)(v1 + 8));
      uint64_t v12 = v11;
      if (v11)
      {
        if (*((_DWORD *)v11 + 6) != 1) {
          uint64_t v11 = (unsigned char *)*((void *)v11 + 1);
        }
        if (([v11 isEqual:*(void *)(v1 + 8)] & 1) == 0)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping location (wrong root location): %@\n%@", "-[PFUbiquityFilePresenter processPendingURLs]", 352, v12, *(void *)(v1 + 8));
          }
          goto LABEL_26;
        }
        if (*(void *)(v1 + 24))
        {
          uint64_t v13 = (void *)*((void *)v12 + 5);
          if (v13)
          {
            if ((objc_msgSend(v13, "isEqualToString:") & 1) == 0)
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:3])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping location (wrong store name): %@\n%@", "-[PFUbiquityFilePresenter processPendingURLs]", 357, *(void *)(v1 + 24), v12);
              }
LABEL_26:

              goto LABEL_31;
            }
          }
        }
        uint64_t v14 = (PFUbiquityLocationStatus *)(id)[v5 objectForKey:v12];
        if (v14)
        {
LABEL_19:
          if (v14->_isImported)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping location (imported):\n%@", "-[PFUbiquityFilePresenter processPendingURLs]", 371, v12);
            }
LABEL_30:

            goto LABEL_31;
          }
          if (v14->_isExported)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping location (exported):\n%@", "-[PFUbiquityFilePresenter processPendingURLs]", 377, v12);
            }
            goto LABEL_30;
          }
          char v16 = 0;
        }
        else
        {
          uint64_t v15 = [[PFUbiquityLocationStatus alloc] initWithLocation:v12];
          [v5 setObject:v15 forKey:v12];
          char v43 = 1;
          if (v15)
          {
            uint64_t v14 = v15;
            goto LABEL_19;
          }
          uint64_t v14 = 0;
          char v16 = 1;
        }
        if (_CFURLIsItemPromiseAtURL())
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  URL is a promise file, skipping file URL state check for:%@", "-[PFUbiquityFilePresenter processPendingURLs]", 387, v10);
          }
        }
        else
        {
          -[PFUbiquityLocationStatus checkFileURLState]((uint64_t)v14);
        }
        if ((v16 & 1) != 0 || !v14->_isLive)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  File isn't live yet: %@", "-[PFUbiquityFilePresenter processPendingURLs]", 437, v12);
          }
          if (_usesCloudDocs == 1 && !_CFURLIsItemPromiseAtURL())
          {
            unsigned int v19 = *((_DWORD *)v12 + 6);
            if ((v19 > 0x2A || ((1 << v19) & 0x4FEC7BC73F0) == 0)
              && (objc_msgSend((id)objc_msgSend(v10, "path"), "hasSuffix:", @".nosync") & 1) == 0
              && objc_msgSend((id)objc_msgSend(v10, "path"), "rangeOfString:", @"ubRoot") == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:3])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Starting download for file that is not live: %@", "-[PFUbiquityFilePresenter processPendingURLs]", 439, v12);
              }
              if ((v16 & 1) == 0) {
                v14->_isDownloading = 1;
              }
LABEL_98:
              [v38 addObject:v10];
            }
          }
          goto LABEL_100;
        }
        if (!v14->_isDownloaded)
        {
          location = v14->_location;
          if (location)
          {
            if (location->_isRootUbiquitous)
            {
              if (v12[88])
              {
                unsigned int v21 = *((_DWORD *)v12 + 6);
                if ((v21 > 0x2A || ((1 << v21) & 0x4FEC7BC73F0) == 0)
                  && !v14->_isExported
                  && !v14->_isDeleted
                  && !v14->_isDownloading)
                {
                  if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                  {
                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Starting download for: %@", "-[PFUbiquityFilePresenter processPendingURLs]", 427, v12);
                  }
                  v14->_isDownloading = 1;
                  if (!_CFURLIsItemPromiseAtURL()) {
                    goto LABEL_98;
                  }
LABEL_97:
                  long long v10 = (void *)[v10 URLByDeletingLastPathComponent];
                  goto LABEL_98;
                }
              }
              goto LABEL_100;
            }
          }
        }
        int v17 = *((_DWORD *)v12 + 6);
        uint64_t v18 = v42;
        if (v17 != 10)
        {
          if (v17 != 22)
          {
            uint64_t v22 = objc_msgSend((id)objc_msgSend(v40, "objectForKey:", v12), "copy");
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v47;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v47 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                  if (v26)
                  {
                    if (*(unsigned char *)(v26 + 40)
                      && (v14->_isDownloaded || (uint64_t v27 = v14->_location) == 0 || !v27->_isRootUbiquitous))
                    {
                      -[PFUbiquitySafeSaveFile checkFileDownload](v26);
                    }
                    else if (*(unsigned char *)(v26 + 56))
                    {
                      if (v14->_isUploaded || (uint64_t v28 = v14->_location) == 0 || !v28->_isRootUbiquitous) {
                        -[PFUbiquitySafeSaveFile checkSafeSaveFileUpload](v26);
                      }
                    }
                  }
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v54 count:16];
              }
              while (v23);
            }
            objc_super v5 = v41;

            goto LABEL_100;
          }
          if (([*((id *)v12 + 4) isEqualToString:*(void *)(v1 + 16)] & 1) != 0
            || v14->_isExported
            || v14->_isImported
            || v14->_isScheduled)
          {
LABEL_100:

            goto LABEL_31;
          }
          int v29 = _CFURLIsItemPromiseAtURL();
          uint64_t v18 = v39;
          if (v29)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Starting download for promise base dir: %@", "-[PFUbiquityFilePresenter processPendingURLs]", 408, v12);
            }
            v14->_isDownloading = 1;
            goto LABEL_97;
          }
        }
        [v18 addObject:v12];
        goto LABEL_100;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Didn't get a location back for url: %@", "-[PFUbiquityFilePresenter processPendingURLs]", 349, v10);
      }
LABEL_31:
      ++v9;
    }
    while (v9 != v7);
    uint64_t v30 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    uint64_t v7 = v30;
  }
  while (v30);
LABEL_105:
  v31 = (void *)[v38 allObjects];
  global_queue = dispatch_get_global_queue(0, 0);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __45__PFUbiquityFilePresenter_processPendingURLs__block_invoke;
  v45[3] = &unk_1E544BDA8;
  v45[4] = v38;
  +[PFUbiquityFilePresenter startDownloadForItems:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, v31, global_queue, (uint64_t)v45);

  if ([v39 count])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Found transaction log locations: %@", "-[PFUbiquityFilePresenter processPendingURLs]", 457, v39);
    }
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v39, @"PFLogLocationsKey", 0);
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"PFUbiquityFilePresenterDiscoveredLogLocationsNotification" object:v1 userInfo:v33];

    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v34);
  }
  if (v43)
  {
    os_unfair_lock_lock(lock);
    v35 = *(void **)(v1 + 80);
    if (v5 != v35)
    {

      *(void *)(v1 + 80) = v5;
    }
    os_unfair_lock_unlock(lock);
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nStatus: %@", "-[PFUbiquityFilePresenter processPendingURLs]", 485, v1, v5);
  }

  [v37 drain];
  return 0;
}

void __45__PFUbiquityFilePresenter_processPendingURLs__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Librarian returned a serious error for starting downloads %@ with userInfo %@ for these urls: %@", "-[PFUbiquityFilePresenter processPendingURLs]_block_invoke", 450, a2, [a2 userInfo], *(void *)(a1 + 32));
    }
  }
}

- (PFUbiquityLocationStatus)retainedStatusForLocation:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  objc_super v5 = (PFUbiquityLocationStatus *)(id)[*(id *)(a1 + 80) objectForKey:a2];
  if (!v5)
  {
    objc_super v5 = [[PFUbiquityLocationStatus alloc] initWithLocation:a2];
    [*(id *)(a1 + 80) setObject:v5 forKey:a2];
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

- (os_unfair_lock_s)copyStatusDictionary
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = result + 16;
    os_unfair_lock_lock(result + 16);
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:*(void *)&v1[20]._os_unfair_lock_opaque copyItems:0];
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (void)exporterDidMoveLog:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFLogLocationsKey"), "lastObject");
  uint64_t v5 = v4;
  if (v4 && *(_DWORD *)(v4 + 24) != 1) {
    uint64_t v4 = *(void *)(v4 + 8);
  }
  if ([(id)v4 isEqual:self->_ubiquityRootLocation])
  {
    id v6 = (id)-[PFUbiquityLocation createFullURL](v5);
    [(PFUbiquityFilePresenter *)self presentedSubitemDidChangeAtURL:v6];
  }
}

- (void)logWasExported:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFLogLocationsKey"), "lastObject");
  if (v5)
  {
    uint64_t v6 = v5;
    if ([*(id *)(v5 + 32) isEqualToString:self->_localPeerID])
    {
      processingQueue = self->_processingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PFUbiquityFilePresenter_logWasExported___block_invoke;
      block[3] = &unk_1E544B778;
      block[4] = self;
      void block[5] = v6;
      dispatch_async(processingQueue, block);
    }
    uint64_t v8 = (void *)-[PFUbiquityLocation createFullURL](v6);
    [(PFUbiquityFilePresenter *)self presentedSubitemDidChangeAtURL:v8];
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@", "-[PFUbiquityFilePresenter logWasExported:]", 565, self, a3);
  }
}

uint64_t __42__PFUbiquityFilePresenter_logWasExported___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = -[PFUbiquityFilePresenter retainedStatusForLocation:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  if (v3) {
    v3->_isExported = 1;
  }

  return [v2 drain];
}

- (void)logWasImported:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFLogLocationsKey"), "lastObject");
  if (v5)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PFUbiquityFilePresenter_logWasImported___block_invoke;
    block[3] = &unk_1E544B778;
    block[4] = self;
    void block[5] = v5;
    dispatch_async(processingQueue, block);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@", "-[PFUbiquityFilePresenter logWasImported:]", 580, self, a3);
  }
}

uint64_t __42__PFUbiquityFilePresenter_logWasImported___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = -[PFUbiquityFilePresenter retainedStatusForLocation:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  if (v3) {
    *(_WORD *)&v3->_isImported = 1;
  }

  return [v2 drain];
}

- (void)logImportWasCancelled:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFLogLocationsKey"), "lastObject");
  if (v5)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PFUbiquityFilePresenter_logImportWasCancelled___block_invoke;
    block[3] = &unk_1E544B778;
    block[4] = self;
    void block[5] = v5;
    dispatch_async(processingQueue, block);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@", "-[PFUbiquityFilePresenter logImportWasCancelled:]", 595, self, a3);
  }
}

uint64_t __49__PFUbiquityFilePresenter_logImportWasCancelled___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = -[PFUbiquityFilePresenter retainedStatusForLocation:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  if (v3) {
    *(_WORD *)&v3->_isImported = 0;
  }

  return [v2 drain];
}

- (void)logsWereScheduled:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFLogLocationsKey"), "copy");
  uint64_t v6 = v5;
  if (v5 && [v5 count])
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PFUbiquityFilePresenter_logsWereScheduled___block_invoke;
    block[3] = &unk_1E544B778;
    block[4] = self;
    void block[5] = v6;
    dispatch_async(processingQueue, block);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@", "-[PFUbiquityFilePresenter logsWereScheduled:]", 615, self, a3);
  }
}

uint64_t __45__PFUbiquityFilePresenter_logsWereScheduled___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ logs were scheduled: %@", "-[PFUbiquityFilePresenter logsWereScheduled:]_block_invoke", 605, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = *(void **)(a1 + 40);
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
        uint64_t v8 = -[PFUbiquityFilePresenter retainedStatusForLocation:](*(void *)(a1 + 32), *(void *)(*((void *)&v10 + 1) + 8 * i));
        if (v8) {
          v8->_isScheduled = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return [v2 drain];
}

- (void)setupAssistantDiscoveredPathsFromMetadataQuery:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFLogLocationsKey");
  if (!v5 || (uint64_t v6 = (void *)v5, v5 == [MEMORY[0x1E4F1CA98] null]))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@", "-[PFUbiquityFilePresenter setupAssistantDiscoveredPathsFromMetadataQuery:]", 629, self, a3);
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(*((void *)&v12 + 1) + 8 * i));
          [(PFUbiquityFilePresenter *)self presentedSubitemDidChangeAtURL:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)printStatus:(id)a3
{
  uint64_t v4 = -[PFUbiquityFilePresenter copyStatusDictionary]((os_unfair_lock_s *)self);
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PFUbiquityFilePresenter_printStatus___block_invoke;
  v6[3] = &unk_1E544B778;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(global_queue, v6);
}

uint64_t __39__PFUbiquityFilePresenter_printStatus___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", objc_msgSend(*(id *)(a1 + 32), "description"));
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "allKeys"), "mutableCopy");
  [v3 sortUsingComparator:&__block_literal_global_32];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 40) objectForKey:v8];
        if (!v9)
        {
          [v2 appendFormat:@"\n\t%@:%ld: ", v8, 0];
          long long v14 = v2;
          long long v13 = @"unknown status";
          goto LABEL_27;
        }
        uint64_t v10 = v9;
        [v2 appendFormat:@"\n\t%@:%ld: ", v8, *(void *)(v9 + 56)];
        if (*(unsigned char *)(v10 + 8)) {
          long long v11 = @"live:";
        }
        else {
          long long v11 = @"not-live:";
        }
        [v2 appendString:v11];
        if (*(unsigned char *)(v10 + 9)) {
          [v2 appendString:@"deleted:"];
        }
        if (*(unsigned char *)(v10 + 14)) {
          [v2 appendString:@"imported:"];
        }
        if (*(unsigned char *)(v10 + 16)) {
          [v2 appendString:@"exported:"];
        }
        if (*(unsigned char *)(v10 + 10)) {
          [v2 appendString:@"downloaded:"];
        }
        if (*(unsigned char *)(v10 + 11)) {
          [v2 appendString:@"downloading:"];
        }
        if (*(unsigned char *)(v10 + 12)) {
          [v2 appendString:@"uploaded:"];
        }
        if (*(unsigned char *)(v10 + 13)) {
          [v2 appendString:@"uploading:"];
        }
        if (*(unsigned char *)(v10 + 17))
        {
          [v2 appendString:@"failed:"];
          long long v12 = *(void **)(v10 + 32);
          if (v12)
          {
            long long v13 = (__CFString *)[v12 description];
            long long v14 = v2;
LABEL_27:
            [v14 appendString:v13];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v5 = v15;
    }
    while (v15);
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquityFilePresenter printStatus:]_block_invoke", 701, v2);
  }

  return [v17 drain];
}

uint64_t __39__PFUbiquityFilePresenter_printStatus___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = -[PFUbiquityLocation createRelativePath](a2);
  uint64_t v5 = -[PFUbiquityLocation createRelativePath](a3);
  uint64_t v6 = [v4 compare:v5 options:64];

  return v6;
}

- (void)registerSafeSaveFile:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if (a2) {
      uint64_t v5 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = (id)[*(id *)(a1 + 72) objectForKey:v5];
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a2) {
        uint64_t v7 = *(void *)(a2 + 8);
      }
      else {
        uint64_t v7 = 0;
      }
      [*(id *)(a1 + 72) setObject:v6 forKey:v7];
    }
    [v6 addObject:a2];

    if (a2) {
      uint64_t v8 = *(void *)(a2 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = (id)[*(id *)(a1 + 72) objectForKey:v8];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a2) {
        uint64_t v10 = *(void *)(a2 + 16);
      }
      else {
        uint64_t v10 = 0;
      }
      [*(id *)(a1 + 72) setObject:v9 forKey:v10];
    }
    [v9 addObject:a2];

    os_unfair_lock_unlock(v4);
  }
}

- (void)unregisterSafeSaveFile:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if (a2) {
      uint64_t v5 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = (id)[*(id *)(a1 + 72) objectForKey:v5];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 removeObject:a2];
      if (![v7 count])
      {
        if (a2) {
          uint64_t v8 = *(void *)(a2 + 8);
        }
        else {
          uint64_t v8 = 0;
        }
        [*(id *)(a1 + 72) removeObjectForKey:v8];
      }
    }

    if (a2) {
      uint64_t v9 = *(void *)(a2 + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = (id)[*(id *)(a1 + 72) objectForKey:v9];
    long long v11 = v10;
    if (v10)
    {
      [v10 removeObject:a2];
      if (![v11 count])
      {
        if (a2) {
          uint64_t v12 = *(void *)(a2 + 16);
        }
        else {
          uint64_t v12 = 0;
        }
        [*(id *)(a1 + 72) removeObjectForKey:v12];
      }
    }

    os_unfair_lock_unlock(v4);
  }
}

@end