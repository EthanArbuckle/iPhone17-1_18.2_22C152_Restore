@interface GKSavedGameDocument
+ (id)currentDeviceName;
- (BOOL)hasConflict;
- (BOOL)isConflictVersion;
- (GKSavedGameDocument)initWithFileURL:(id)a3;
- (NSDate)modificationDate;
- (NSFileVersion)fileVersion;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSString)description;
- (NSString)deviceName;
- (NSString)name;
- (NSURL)fileURL;
- (NSURL)presentedItemURL;
- (id)metadata;
- (void)dealloc;
- (void)deleteAllVersionsIncludingCurrent:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)deleteConflictVersion:(id)a3 completionHandler:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)loadMetadataWithCompletionHandler:(id)a3;
- (void)loadWrapperDataWithFilename:(id)a3 completionHandler:(id)a4;
- (void)presentedItemDidChange;
- (void)presentedItemDidGainVersion:(id)a3;
- (void)presentedItemDidLoseVersion:(id)a3;
- (void)presentedItemDidResolveConflictVersion:(id)a3;
- (void)saveData:(id)a3 completionHandler:(id)a4;
- (void)setDeviceName:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setFileVersion:(id)a3;
- (void)setHasConflict:(BOOL)a3;
- (void)setIsConflictVersion:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(id)a3;
- (void)updateConflictStateWithCompletionHandler:(id)a3;
- (void)updateMetadata;
@end

@implementation GKSavedGameDocument

- (GKSavedGameDocument)initWithFileURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKSavedGameDocument;
  v5 = [(GKSavedGameDocument *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(GKSavedGameDocument *)v5 setFileURL:v4];
    [MEMORY[0x1E4F28CA0] addFilePresenter:v6];
  }

  return v6;
}

- (void)dealloc
{
  [MEMORY[0x1E4F28CA0] removeFilePresenter:self];
  v3.receiver = self;
  v3.super_class = (Class)GKSavedGameDocument;
  [(GKSavedGameDocument *)&v3 dealloc];
}

- (void)setIsConflictVersion:(BOOL)a3
{
  if (self->_isConflictVersion != a3)
  {
    self->_isConflictVersion = a3;
    if (a3) {
      [MEMORY[0x1E4F28CA0] removeFilePresenter:self];
    }
    else {
      [MEMORY[0x1E4F28CA0] addFilePresenter:self];
    }
  }
}

- (NSOperationQueue)presentedItemOperationQueue
{
  if (presentedItemOperationQueue_sOnceToken != -1) {
    dispatch_once(&presentedItemOperationQueue_sOnceToken, &__block_literal_global_20);
  }
  v2 = (void *)presentedItemOperationQueue_sQueue;

  return (NSOperationQueue *)v2;
}

uint64_t __50__GKSavedGameDocument_presentedItemOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)presentedItemOperationQueue_sQueue;
  presentedItemOperationQueue_sQueue = (uint64_t)v0;

  v2 = (void *)presentedItemOperationQueue_sQueue;

  return [v2 setMaxConcurrentOperationCount:1];
}

- (NSURL)presentedItemURL
{
  return self->_fileURL;
}

- (void)presentedItemDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__GKSavedGameDocument_presentedItemDidChange__block_invoke;
  v2[3] = &unk_1E646DB08;
  v2[4] = self;
  [(GKSavedGameDocument *)self loadMetadataWithCompletionHandler:v2];
}

void __45__GKSavedGameDocument_presentedItemDidChange__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GKSavedGameDocumentModifiedNotification" object:*(void *)(a1 + 32)];
}

- (void)presentedItemDidGainVersion:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GKSavedGameDocument_presentedItemDidGainVersion___block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__GKSavedGameDocument_presentedItemDidGainVersion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GKSavedGameDocumentConflictStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)presentedItemDidLoseVersion:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GKSavedGameDocument_presentedItemDidLoseVersion___block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__GKSavedGameDocument_presentedItemDidLoseVersion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GKSavedGameDocumentConflictStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)presentedItemDidResolveConflictVersion:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__GKSavedGameDocument_presentedItemDidResolveConflictVersion___block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__GKSavedGameDocument_presentedItemDidResolveConflictVersion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GKSavedGameDocumentConflictStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)updateConflictStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__4;
  v15[4] = __Block_byref_object_dispose__4;
  id v16 = 0;
  dispatch_group_enter(v5);
  v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke;
  block[3] = &unk_1E646E890;
  v13 = v5;
  v14 = v15;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E646E8B8;
  id v10 = v4;
  v11 = v15;
  v9[4] = self;
  id v8 = v4;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], v9);

  _Block_object_dispose(v15, 8);
}

void __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:*(void *)(a1 + 32)];
  objc_super v3 = [*(id *)(a1 + 32) fileURL];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E646E868;
  v4[4] = *(void *)(a1 + 48);
  [v2 coordinateReadingItemAtURL:v3 options:0 error:0 byAccessor:v4];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F28CE8] otherVersionsOfItemAtURL:a2];

  return MEMORY[0x1F41817F8]();
}

uint64_t __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasConflict:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count") != 0);
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)loadWrapperDataWithFilename:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__4;
  v24[4] = __Block_byref_object_dispose__4;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__4;
  v22[4] = __Block_byref_object_dispose__4;
  id v23 = 0;
  dispatch_group_enter(v8);
  v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke;
  block[3] = &unk_1E646E908;
  block[4] = self;
  id v18 = v6;
  v20 = v22;
  v21 = v24;
  v19 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(v9, block);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke_3;
  v13[3] = &unk_1E646E930;
  id v14 = v7;
  v15 = v24;
  id v16 = v22;
  id v12 = v7;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v13);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:*(void *)(a1 + 32)];
  objc_super v3 = [*(id *)(a1 + 32) fileURL];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(v4 + 8);
  id v12 = *(id *)(v5 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke_2;
  v8[3] = &unk_1E646E8E0;
  uint64_t v10 = v4;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 64);
  id v9 = v6;
  uint64_t v11 = v7;
  [v2 coordinateReadingItemAtURL:v3 options:0 error:&v12 byAccessor:v8];
  objc_storeStrong((id *)(v5 + 40), v12);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F28CF0]);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = (void *)[v4 initWithURL:v3 options:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if ([v6 isDirectory])
  {
    uint64_t v7 = [v6 fileWrappers];
    id v8 = [v7 objectForKey:a1[4]];

    if (!v8)
    {
      uint64_t v9 = *(void *)(a1[5] + 8);
      id v23 = *(id *)(v9 + 40);
      [v6 readFromURL:v3 options:1 error:&v23];
      objc_storeStrong((id *)(v9 + 40), v23);
      uint64_t v10 = [v6 fileWrappers];
      id v8 = [v10 objectForKey:a1[4]];
    }
    uint64_t v11 = [v8 regularFileContents];
    uint64_t v12 = *(void *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (!*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      id v14 = [v3 URLByAppendingPathComponent:a1[4]];
      uint64_t v15 = *(void *)(a1[5] + 8);
      id v22 = *(id *)(v15 + 40);
      [v8 readFromURL:v14 options:0 error:&v22];
      objc_storeStrong((id *)(v15 + 40), v22);

      uint64_t v16 = [v8 regularFileContents];
      uint64_t v17 = *(void *)(a1[6] + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      if (!*(void *)(*(void *)(a1[6] + 8) + 40) && !*(void *)(*(void *)(a1[5] + 8) + 40))
      {
        uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
        uint64_t v20 = *(void *)(a1[5] + 8);
        v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;
      }
    }
  }
}

uint64_t __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[4];
  if (result)
  {
    if (!*(void *)(*(void *)(a1[5] + 8) + 40) && !*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
      uint64_t v4 = *(void *)(a1[6] + 8);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      uint64_t result = a1[4];
    }
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)loadMetadataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__GKSavedGameDocument_loadMetadataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E646D900;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(GKSavedGameDocument *)self loadWrapperDataWithFilename:@"metadata" completionHandler:v6];
}

void __57__GKSavedGameDocument_loadMetadataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMetadata:");
  }
  else if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (void)updateMetadata
{
  uint64_t v3 = +[GKSavedGameDocument currentDeviceName];
  [(GKSavedGameDocument *)self setDeviceName:v3];

  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [(GKSavedGameDocument *)self setModificationDate:v4];
}

- (void)setMetadata:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 objectForKey:@"deviceName"];
    if (v5) {
      [(GKSavedGameDocument *)self setDeviceName:v5];
    }
    id v6 = [v7 objectForKey:@"modificationDate"];
    if (v6) {
      [(GKSavedGameDocument *)self setModificationDate:v6];
    }

    id v4 = v7;
  }
}

- (id)metadata
{
  v9[2] = *MEMORY[0x1E4F143B8];
  deviceName = self->_deviceName;
  if (!deviceName || (modificationDate = self->_modificationDate) == 0)
  {
    [(GKSavedGameDocument *)self updateMetadata];
    deviceName = self->_deviceName;
    modificationDate = self->_modificationDate;
  }
  v8[0] = @"deviceName";
  v8[1] = @"modificationDate";
  v9[0] = deviceName;
  v9[1] = modificationDate;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:0];

  return v6;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
}

- (void)saveData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(GKSavedGameDocument *)self updateMetadata];
  id v8 = [(GKSavedGameDocument *)self metadata];
  uint64_t v9 = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__GKSavedGameDocument_saveData_completionHandler___block_invoke;
  v13[3] = &unk_1E646D9F0;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v9, v13);
}

void __50__GKSavedGameDocument_saveData_completionHandler___block_invoke(id *a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__4;
  uint64_t v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:a1[4]];
  uint64_t v3 = [a1[4] fileURL];
  id v4 = (id *)(v14 + 5);
  id obj = (id)v14[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __50__GKSavedGameDocument_saveData_completionHandler___block_invoke_2;
  v8[3] = &unk_1E646E958;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = &v13;
  [v2 coordinateWritingItemAtURL:v3 options:8 error:&obj byAccessor:v8];
  objc_storeStrong(v4, obj);

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__GKSavedGameDocument_saveData_completionHandler___block_invoke_3;
  v5[3] = &unk_1E646E980;
  id v6 = a1[7];
  id v7 = &v13;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  _Block_object_dispose(&v13, 8);
}

void __50__GKSavedGameDocument_saveData_completionHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28CF0];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionary];
  id v7 = (void *)[v5 initDirectoryWithFileWrappers:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:a1[4]];
  [v8 setPreferredFilename:@"data"];
  id v9 = (id)[v7 addFileWrapper:v8];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:a1[5]];
  [v10 setPreferredFilename:@"metadata"];
  id v11 = (id)[v7 addFileWrapper:v10];
  uint64_t v12 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v12 + 40);
  [v7 writeToURL:v4 options:1 originalContentsURL:v4 error:&obj];

  objc_storeStrong((id *)(v12 + 40), obj);
}

uint64_t __50__GKSavedGameDocument_saveData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (void)deleteAllVersionsIncludingCurrent:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke;
  block[3] = &unk_1E646E9D0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__4;
  uint64_t v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 32) fileURL];
  id v4 = (id *)(v12 + 5);
  id obj = (id)v12[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E646E9A8;
  void v8[4] = &v11;
  char v9 = *(unsigned char *)(a1 + 48);
  [v2 coordinateWritingItemAtURL:v3 options:1 error:&obj byAccessor:v8];
  objc_storeStrong(v4, obj);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E646E980;
  id v6 = *(id *)(a1 + 40);
  id v7 = &v11;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v11, 8);
}

void __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v4 + 40);
  [MEMORY[0x1E4F28CE8] removeOtherVersionsOfItemAtURL:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v15 = *(id *)(v6 + 40);
    [v5 removeItemAtURL:v3 error:&v15];
    objc_storeStrong((id *)(v6 + 40), v15);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28CE8] unresolvedConflictVersionsOfItemAtURL:v3];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setResolved:1];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (void)deleteConflictVersion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke;
  block[3] = &unk_1E646EA20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke(id *a1)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:a1[4]];
  id v3 = [a1[4] fileURL];
  uint64_t v4 = (id *)(v13 + 5);
  id obj = (id)v13[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke_2;
  v8[3] = &unk_1E646E9F8;
  id v9 = a1[5];
  id v10 = &v12;
  [v2 coordinateWritingItemAtURL:v3 options:1 error:&obj byAccessor:v8];
  objc_storeStrong(v4, obj);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke_3;
  block[3] = &unk_1E646E980;
  id v6 = a1[6];
  id v7 = &v12;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v12, 8);
}

void __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setResolved:1];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  [v2 removeAndReturnError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

uint64_t __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (NSString)description
{
  v11.receiver = self;
  v11.super_class = (Class)GKSavedGameDocument;
  uint64_t v3 = [(GKSavedGameDocument *)&v11 description];
  uint64_t v4 = NSString;
  id v5 = [(GKSavedGameDocument *)self fileURL];
  id v6 = [(GKSavedGameDocument *)self deviceName];
  id v7 = [(GKSavedGameDocument *)self modificationDate];
  uint64_t v8 = [v4 stringWithFormat:@", fileURL = %@, deviceName = %@, modificationDate = %@", v5, v6, v7];
  id v9 = [v3 stringByAppendingString:v8];

  return (NSString *)v9;
}

+ (id)currentDeviceName
{
  return +[GKEntitledContextProvider getCurrentDeviceName];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSFileVersion)fileVersion
{
  return self->_fileVersion;
}

- (void)setFileVersion:(id)a3
{
}

- (BOOL)hasConflict
{
  return self->_hasConflict;
}

- (void)setHasConflict:(BOOL)a3
{
  self->_hasConflict = a3;
}

- (BOOL)isConflictVersion
{
  return self->_isConflictVersion;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_fileVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end