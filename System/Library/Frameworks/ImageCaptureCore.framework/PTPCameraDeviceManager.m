@interface PTPCameraDeviceManager
- (PTPCameraDeviceManager)init;
- (id)deviceManagerConnection;
- (int64_t)checkFile:(id)a3 andDevice:(id)a4;
- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5;
- (void)deleteFileImp:(id)a3;
- (void)downloadFileImp:(id)a3;
- (void)ejectImp:(id)a3;
- (void)executeCompletionBlockWithErrorCode:(int64_t)a3 info:(id)a4 file:(id)a5 completionDict:(id)a6 completionBlk:(id)a7;
- (void)getFileDataImp:(id)a3;
- (void)getFileMetadataImp:(id)a3;
- (void)getFileThumbnailImp:(id)a3;
- (void)getFingerprintImp:(id)a3;
- (void)getSecurityScopedURLImp:(id)a3;
- (void)handleEventImp:(id)a3;
- (void)notifyAddedItems:(id)a3;
- (void)notifyPtpEvent:(id)a3;
- (void)notifyRemovedItems:(id)a3;
- (void)notifyStatus:(id)a3;
- (void)notifyUpdatedItems:(id)a3;
- (void)refreshObjectHandleInfoImp:(id)a3;
- (void)registerDevice:(id)a3 forImageCaptureEventNotificationsImp:(id)a4;
- (void)sendDevicePTPCommandImp:(id)a3;
- (void)startDeviceWithHandle:(id)a3;
- (void)syncClockImp:(id)a3;
- (void)unregisterDevice:(id)a3 forImageCaptureEventNotificationsImp:(id)a4;
- (void)updateCameraFile:(id)a3 withInfo:(id)a4;
- (void)updateCameraFile:(id)a3 withKeywords:(id)a4;
- (void)updateCameraFolder:(id)a3 withInfo:(id)a4;
@end

@implementation PTPCameraDeviceManager

- (PTPCameraDeviceManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)PTPCameraDeviceManager;
  return [(ICDeviceManager *)&v3 init];
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = addSelectorToInterface_selectorString_origin__onceToken_1;
  v8 = (NSString *)a4;
  id v11 = a3;
  if (v7 != -1) {
    dispatch_once(&addSelectorToInterface_selectorString_origin__onceToken_1, &__block_literal_global_8);
  }
  uint64_t v9 = addSelectorToInterface_selectorString_origin__incomingClasses_1;
  SEL v10 = NSSelectorFromString(v8);

  [v11 setClasses:v9 forSelector:v10 argumentIndex:0 ofReply:v5];
}

- (id)deviceManagerConnection
{
  objc_super v3 = [(ICDeviceManager *)self managerConnection];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ptpcamerad" options:0];
    [(ICDeviceManager *)self setManagerConnection:v4];
  }

  return [(ICDeviceManager *)self managerConnection];
}

uint64_t __71__PTPCameraDeviceManager_addSelectorToInterface_selectorString_origin___block_invoke()
{
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  addSelectorToInterface_selectorString_origin__incomingClasses_1 = objc_msgSend(v11, "initWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

- (void)notifyAddedItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  id v23 = [(ICDeviceManager *)self deviceForConnection:v5];
  uint64_t v6 = (void *)v19[5];
  if (!v6)
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"error" length] < 0x15)
    {
      uint64_t v9 = @"error";
    }
    else
    {
      SEL v10 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      uint64_t v9 = [v10 stringByAppendingString:@".."];
    }
    id v11 = [NSString stringWithFormat:@"the device is nil? how?"];
    v12 = (id)_gICOSLog;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(__CFString *)v9 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  if ([v6 hasOpenSession])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28B48];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__PTPCameraDeviceManager_notifyAddedItems___block_invoke;
    v14[3] = &unk_1E63D74D0;
    v16 = self;
    v17 = &v18;
    v15 = (__CFString *)v4;
    uint64_t v8 = [v7 blockOperationWithBlock:v14];
    [(ICDeviceManager *)self addInteractiveOperation:v8];

    uint64_t v9 = v15;
LABEL_10:
  }
  _Block_object_dispose(&v18, 8);
}

void __43__PTPCameraDeviceManager_notifyAddedItems___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICPTPObjectInfoArray"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [[PTPObjectInfoDataset alloc] initWithData:*(void *)(*((void *)&v22 + 1) + 8 * i) contentType:2];
        uint64_t v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "cameraFolderWithObjectID:", -[PTPObjectInfoDataset parentObject](v7, "parentObject"));
        if (v7)
        {
          int v9 = [(PTPObjectInfoDataset *)v7 objectFormat];
          SEL v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v11 = [(PTPObjectInfoDataset *)v7 objectHandle];
          if (v9 == 12289)
          {
            v12 = [v10 cameraFolderWithObjectID:v11];

            if (v12) {
              goto LABEL_12;
            }
            uint64_t v13 = [ICCameraFolder alloc];
            v14 = [(PTPObjectInfoDataset *)v7 filename];
            v15 = [(ICCameraFolder *)v13 initWithName:v14 parentFolder:v8 device:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

            [*(id *)(a1 + 40) updateCameraFolder:v15 withInfo:v7];
            if (v8)
            {
              v16 = v8;
              goto LABEL_18;
            }
            unsigned int v20 = [(PTPObjectInfoDataset *)v7 storageID];
            if (v20 == [(PTPObjectInfoDataset *)v7 parentObject])
            {
              v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_18:
              [v16 addFolder:v15];
            }
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addCameraFolderToIndex:v15];
          }
          else
          {
            v17 = [v10 cameraFileWithObjectID:v11];

            if (v17)
            {
LABEL_12:
              objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setPreviouslyIndexed:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "previouslyIndexed") + 1);
              goto LABEL_21;
            }
            uint64_t v18 = [ICCameraFile alloc];
            v19 = [(PTPObjectInfoDataset *)v7 filename];
            v15 = [(ICCameraFile *)v18 initWithName:v19 parentFolder:v8 device:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

            [*(id *)(a1 + 40) updateCameraFile:v15 withInfo:v7];
            if (v8) {
              [v8 addFile:v15];
            }
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addCameraFileToIndex:v15];
            [v21 addObject:v15];
          }
        }
LABEL_21:
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addItems:v21];
}

- (void)notifyRemovedItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v19 = 0;
  unsigned int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__4;
  long long v23 = __Block_byref_object_dispose__4;
  id v24 = [(ICDeviceManager *)self deviceForConnection:v5];
  if (v20[5])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __45__PTPCameraDeviceManager_notifyRemovedItems___block_invoke;
    v16 = &unk_1E63D74F8;
    v17 = (__CFString *)v4;
    uint64_t v18 = &v19;
    uint64_t v7 = [v6 blockOperationWithBlock:&v13];
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v7, v13, v14, v15, v16);

    uint64_t v8 = v17;
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"error" length] < 0x15)
    {
      uint64_t v8 = @"error";
    }
    else
    {
      int v9 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      uint64_t v8 = [v9 stringByAppendingString:@".."];
    }
    SEL v10 = [NSString stringWithFormat:@"the device is nil? how?"];
    uint64_t v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(__CFString *)v8 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __45__PTPCameraDeviceManager_notifyRemovedItems___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICObjectIDArray"];
  if (v2) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeItems:v2];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)notifyUpdatedItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__4;
  long long v22 = __Block_byref_object_dispose__4;
  id v23 = [(ICDeviceManager *)self deviceForConnection:v5];
  uint64_t v6 = (void *)v19[5];
  if (!v6)
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"error" length] < 0x15)
    {
      int v9 = @"error";
    }
    else
    {
      SEL v10 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      int v9 = [v10 stringByAppendingString:@".."];
    }
    uint64_t v11 = [NSString stringWithFormat:@"the device is nil? how?"];
    uint64_t v12 = (id)_gICOSLog;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(__CFString *)v9 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      __int16 v27 = v11;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  if ([v6 hasOpenSession])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28B48];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__PTPCameraDeviceManager_notifyUpdatedItems___block_invoke;
    v14[3] = &unk_1E63D74D0;
    v16 = self;
    v17 = &v18;
    v15 = (__CFString *)v4;
    uint64_t v8 = [v7 blockOperationWithBlock:v14];
    [(ICDeviceManager *)self addInteractiveOperation:v8];

    int v9 = v15;
LABEL_10:
  }
  _Block_object_dispose(&v18, 8);
}

void __45__PTPCameraDeviceManager_notifyUpdatedItems___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICPTPObjectInfoArray"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [[PTPObjectInfoDataset alloc] initWithData:*(void *)(*((void *)&v10 + 1) + 8 * v6) contentType:2];
        uint64_t v8 = v7;
        if (v7)
        {
          int v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "cameraFileWithObjectID:", -[PTPObjectInfoDataset objectHandle](v7, "objectHandle"));
          if (v9) {
            [*(id *)(a1 + 40) updateCameraFile:v9 withInfo:v8];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)notifyPtpEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v6 = [(ICDeviceManager *)self deviceForConnection:v5];
  if (!v6)
  {
    __ICOSLogCreate();
    uint64_t v8 = @"error";
    if ((unint64_t)[@"error" length] >= 0x15)
    {
      long long v12 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      uint64_t v8 = [v12 stringByAppendingString:@".."];
    }
    long long v11 = [NSString stringWithFormat:@"the device is nil? how?"];
    long long v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v8;
      uint64_t v14 = v13;
      *(_DWORD *)buf = 136446466;
      uint64_t v22 = [(__CFString *)v8 UTF8String];
      __int16 v23 = 2114;
      id v24 = v11;
      _os_log_impl(&dword_1BEEFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"ICPTPEvent"];
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __41__PTPCameraDeviceManager_notifyPtpEvent___block_invoke;
    uint64_t v18 = &unk_1E63D72D0;
    uint64_t v8 = v7;
    uint64_t v19 = v8;
    uint64_t v20 = self;
    long long v10 = [v9 blockOperationWithBlock:&v15];
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v10, v15, v16, v17, v18);

    long long v11 = v19;
LABEL_8:
  }
}

void __41__PTPCameraDeviceManager_notifyPtpEvent___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    memset(v7, 0, sizeof(v7));
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "devices", 0);
    uint64_t v3 = [v2 allKeys];

    if ([v3 countByEnumeratingWithState:v7 objects:v8 count:16])
    {
      uint64_t v4 = **((void **)&v7[0] + 1);
      uint64_t v5 = [*(id *)(a1 + 40) devices];
      uint64_t v6 = [v5 objectForKeyedSubscript:v4];
    }
    else
    {
      uint64_t v6 = 0;
    }

    [v6 handlePtpEvent:*(void *)(a1 + 32)];
  }
}

- (void)notifyStatus:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__4;
  __int16 v23 = __Block_byref_object_dispose__4;
  id v24 = [(ICDeviceManager *)self deviceForConnection:v5];
  if (v20[5])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __39__PTPCameraDeviceManager_notifyStatus___block_invoke;
    uint64_t v16 = &unk_1E63D74F8;
    v17 = (__CFString *)v4;
    uint64_t v18 = &v19;
    uint64_t v7 = [v6 blockOperationWithBlock:&v13];
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v7, v13, v14, v15, v16);

    uint64_t v8 = v17;
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"error" length] < 0x15)
    {
      uint64_t v8 = @"error";
    }
    else
    {
      uint64_t v9 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      uint64_t v8 = [v9 stringByAppendingString:@".."];
    }
    long long v10 = [NSString stringWithFormat:@"the device is nil? how?"];
    long long v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(__CFString *)v8 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __39__PTPCameraDeviceManager_notifyStatus___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40), "handleStatusNotification:");
  }
  return result;
}

- (void)startDeviceWithHandle:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICDeviceManager *)self devices];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    __ICOSLogCreate();
    uint64_t v7 = @"device";
    if ((unint64_t)[@"device" length] >= 0x15)
    {
      uint64_t v8 = objc_msgSend(@"device", "substringWithRange:", 0, 18);
      uint64_t v7 = [v8 stringByAppendingString:@".."];
    }
    uint64_t v9 = [NSString stringWithFormat:@"%12s : %@", "starting", v4];
    long long v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = v7;
      uint64_t v12 = v10;
      *(_DWORD *)buf = 136446466;
      uint64_t v19 = [(__CFString *)v11 UTF8String];
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    uint64_t v13 = [v6 remoteCamera];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__PTPCameraDeviceManager_startDeviceWithHandle___block_invoke;
    v14[3] = &unk_1E63D80C8;
    id v15 = v6;
    uint64_t v16 = self;
    id v17 = v4;
    [v13 requestStartUsingDeviceWithReply:v14];
  }
}

void __48__PTPCameraDeviceManager_startDeviceWithHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"ICDeviceName"];

  if (v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"ICDeviceAccessRestrictedAppleDevice"];
    objc_msgSend(*(id *)(a1 + 32), "setAccessRestrictedAppleDevice:", objc_msgSend(v5, "BOOLValue"));

    uint64_t v6 = [v3 objectForKeyedSubscript:@"ICDeviceLocked"];
    objc_msgSend(*(id *)(a1 + 32), "setLocked:", objc_msgSend(v6, "BOOLValue"));

    uint64_t v7 = [v3 objectForKeyedSubscript:@"ICDeviceAllowsSyncingClock"];
    objc_msgSend(*(id *)(a1 + 32), "setAllowsSyncingClock:", objc_msgSend(v7, "BOOLValue"));

    uint64_t v8 = [v3 objectForKeyedSubscript:@"ICDeviceEjectable"];
    objc_msgSend(*(id *)(a1 + 32), "setEjectable:", objc_msgSend(v8, "BOOLValue"));

    uint64_t v9 = [v3 objectForKeyedSubscript:@"ICDeviceName"];
    [*(id *)(a1 + 32) setName:v9];

    long long v10 = [v3 objectForKeyedSubscript:@"ICDeviceType"];
    [*(id *)(a1 + 32) setProductType:v10];

    long long v11 = [v3 objectForKeyedSubscript:@"ICDeviceProductKind"];
    [*(id *)(a1 + 32) setProductKind:v11];

    uint64_t v12 = [v3 objectForKeyedSubscript:@"ICDeviceTransportType"];
    [*(id *)(a1 + 32) setTransportType:v12];

    uint64_t v13 = [v3 objectForKeyedSubscript:@"ICDeviceUSBLocationID"];
    objc_msgSend(*(id *)(a1 + 32), "setUsbLocationID:", objc_msgSend(v13, "intValue"));

    uint64_t v14 = [v3 objectForKeyedSubscript:@"ICDeviceUSBProductID"];
    objc_msgSend(*(id *)(a1 + 32), "setUsbProductID:", objc_msgSend(v14, "intValue"));

    id v15 = [v3 objectForKeyedSubscript:@"ICDeviceUSBVendorID"];
    objc_msgSend(*(id *)(a1 + 32), "setUsbVendorID:", objc_msgSend(v15, "intValue"));

    uint64_t v16 = [v3 objectForKeyedSubscript:@"ICInternalDeviceUUID"];
    [*(id *)(a1 + 32) setUUIDString:v16];

    id v17 = [v3 objectForKeyedSubscript:@"ICInternalDeviceUUID"];
    [*(id *)(a1 + 32) setPersistentIDString:v17];

    uint64_t v18 = [v3 objectForKeyedSubscript:@"ICDeviceSerialNumberString"];
    [*(id *)(a1 + 32) setSerialNumberString:v18];

    uint64_t v19 = [v3 objectForKeyedSubscript:@"ICDeviceSystemSymbolName"];
    [*(id *)(a1 + 32) setSystemSymbolName:v19];

    [*(id *)(a1 + 32) setLocationDescription:@"ICDeviceLocationDescriptionUSB"];
    __int16 v20 = *(void **)(a1 + 32);
    uint64_t v21 = [v3 objectForKeyedSubscript:@"ICDeviceiCloudPhotosEnabled"];
    objc_msgSend(v20, "setICloudPhotosEnabled:", objc_msgSend(v21, "BOOLValue"));

    uint64_t v22 = *(void **)(a1 + 32);
    __int16 v23 = [v3 objectForKeyedSubscript:@"ICDeviceiCloudOptimizeStorageState"];
    objc_msgSend(v22, "setICloudPhotosOptimizeStorageState:", objc_msgSend(v23, "unsignedIntValue"));

    id v24 = [v3 objectForKeyedSubscript:@"ICDeviceSerialNumberString"];

    if (v24)
    {
      uint64_t v25 = [v3 objectForKeyedSubscript:@"ICDeviceSerialNumberString"];
      [*(id *)(a1 + 32) setSerialNumberString:v25];
    }
    uint64_t v26 = [v3 objectForKeyedSubscript:@"ICDeviceCapabilities"];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v27 = [(__CFString *)v26 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(a1 + 32) addCapability:*(void *)(*((void *)&v44 + 1) + 8 * v30++)];
        }
        while (v28 != v30);
        uint64_t v28 = [(__CFString *)v26 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v28);
    }
    uint64_t v31 = [v3 objectForKeyedSubscript:@"ICMobileDeviceProperties"];
    v32 = (void *)v31;
    if (v31)
    {
      v33 = *(void **)(a1 + 32);
      v54 = @"mobdevProps";
      uint64_t v55 = v31;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      [v33 updateAppleProperties:v34];
    }
    [*(id *)(a1 + 32) resetAccessRestriction];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PTPCameraDeviceManager_startDeviceWithHandle___block_invoke_2;
    block[3] = &unk_1E63D72A8;
    id v43 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    v35 = *(void **)(a1 + 40);
    v36 = [NSString stringWithFormat:@"%@:0x%x@", @"ICDeviceOperationQueue", objc_msgSend(*(id *)(a1 + 32), "usbLocationID")];
    [v35 setDeviceOperationQueueName:v36];

    uint64_t v37 = *(void *)(a1 + 32);
    v52[0] = @"device";
    v52[1] = @"type";
    v53[0] = v37;
    v53[1] = @"ICDeviceAdded";
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
    [*(id *)(a1 + 40) performSelectorOnMainThread:sel_postNotification_ withObject:v38 waitUntilDone:0];
  }
  else
  {
    __ICOSLogCreate();
    uint64_t v26 = @"device";
    if ((unint64_t)[@"device" length] >= 0x15)
    {
      v39 = objc_msgSend(@"device", "substringWithRange:", 0, 18);
      uint64_t v26 = [v39 stringByAppendingString:@".."];
    }
    v32 = [NSString stringWithFormat:@"%12s : %@", "failed to start", *(void *)(a1 + 48)];
    v40 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = v26;
      v41 = v40;
      *(_DWORD *)buf = 136446466;
      uint64_t v49 = [(__CFString *)v26 UTF8String];
      __int16 v50 = 2114;
      v51 = v32;
      _os_log_impl(&dword_1BEEFF000, v41, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __48__PTPCameraDeviceManager_startDeviceWithHandle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAutolaunchApplicationPath];
}

- (void)syncClockImp:(id)a3
{
  id v3 = a3;
  id v9 = [v3 objectForKeyedSubscript:@"device"];
  id v4 = [v3 objectForKeyedSubscript:@"info"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"cbBlock"];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v9, @"device", 0);
  uint64_t v7 = v6;
  if (v4) {
    [v6 setObject:v4 forKeyedSubscript:@"info"];
  }
  uint64_t v8 = [NSNumber numberWithInteger:-9922];
  [v7 setObject:v8 forKeyedSubscript:@"errCode"];

  if (v5) {
    ((void (**)(void, id, void *))v5)[2](v5, v9, v7);
  }
}

- (void)getFileThumbnailImp:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = -9922;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v9 = [v4 objectForKeyedSubscript:@"options"];
  long long v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FF68]];

  long long v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v7, @"device", v5, @"file", 0);
  uint64_t v12 = &unk_1F1A2C5F8;
  if (v10) {
    uint64_t v12 = v10;
  }
  id v13 = v12;

  int64_t v14 = [(PTPCameraDeviceManager *)self checkFile:v5 andDevice:v7];
  v26[3] = v14;
  if (v14)
  {
    [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v14 info:v6 file:v5 completionDict:v11 completionBlk:v8];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F28B48];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke;
    v17[3] = &unk_1E63D7408;
    id v24 = &v25;
    v17[4] = self;
    id v18 = v6;
    id v19 = v5;
    id v20 = v11;
    id v23 = v8;
    id v21 = v7;
    id v22 = v13;
    uint64_t v16 = [v15 blockOperationWithBlock:v17];
    [(ICDeviceManager *)self addInteractiveOperation:v16];
  }
  _Block_object_dispose(&v25, 8);
}

void __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke_2;
  v18[3] = &unk_1E63D73B8;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v23 = *(void *)(a1 + 88);
  v18[4] = v2;
  id v19 = v3;
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 80);
  id v4 = (void *)MEMORY[0x1C18A01C0](v18);
  uint64_t v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v24 = *MEMORY[0x1E4F2FF68];
    v25[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke_3;
    v12[3] = &unk_1E63D73E0;
    id v13 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = *(void **)(a1 + 40);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = v11;
    id v17 = *(id *)(a1 + 80);
    [v5 requestThumbnailDataForObjectHandle:v6 options:v8 withReply:v12];
  }
}

uint64_t __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"thumb"];
    if (v5)
    {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"thumb"];
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = -20097;
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"metadata"];
    uint64_t v8 = [*(id *)(a1 + 40) metadata];
    if (v8)
    {
    }
    else if ([v7 count])
    {
      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        id v9 = @"meta";
        if ((unint64_t)[@"meta" length] >= 0x15)
        {
          uint64_t v10 = objc_msgSend(@"meta", "substringWithRange:", 0, 18);
          id v9 = [v10 stringByAppendingString:@".."];
        }
        long long v11 = NSString;
        uint64_t v12 = [*(id *)(a1 + 40) name];
        id v13 = [v11 stringWithFormat:@"Set Metadata ---> thumbnail %@", v12];

        id v14 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = v9;
          id v16 = v14;
          *(_DWORD *)buf = 136446466;
          uint64_t v21 = [(__CFString *)v15 UTF8String];
          __int16 v22 = 2114;
          uint64_t v23 = v13;
          _os_log_impl(&dword_1BEEFF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 40) setMetadata:v7];
    }
    id v17 = [*(id *)(a1 + 40) metadata];
    uint64_t v18 = *MEMORY[0x1E4F2FCA0];
    id v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];

    if (v19) {
      [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:v18];
    }
  }
  else
  {
    uint64_t v6 = -20097;
  }
  [*(id *)(a1 + 48) executeCompletionBlockWithErrorCode:v6 info:*(void *)(a1 + 56) file:*(void *)(a1 + 40) completionDict:*(void *)(a1 + 32) completionBlk:*(void *)(a1 + 64)];
}

- (void)getFileMetadataImp:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", v7, @"file", 0);
  int64_t v10 = [(PTPCameraDeviceManager *)self checkFile:v7 andDevice:v5];
  v21[3] = v10;
  if (v10)
  {
    [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v10 info:v6 file:v7 completionDict:v9 completionBlk:v8];
  }
  else
  {
    long long v11 = (void *)MEMORY[0x1E4F28B48];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke;
    v13[3] = &unk_1E63D7430;
    id v19 = &v20;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    id v16 = v9;
    id v18 = v8;
    id v17 = v5;
    uint64_t v12 = [v11 blockOperationWithBlock:v13];
    [(ICDeviceManager *)self addInteractiveOperation:v12];
  }
  _Block_object_dispose(&v20, 8);
}

void __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke(uint64_t a1)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke_2;
  v16[3] = &unk_1E63D73B8;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 80);
  v16[4] = v2;
  id v17 = v3;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 72);
  id v4 = (void *)MEMORY[0x1C18A01C0](v16);
  uint64_t v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke_3;
    v10[3] = &unk_1E63D73E0;
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 72);
    [v5 requestMetadataForObjectHandle:v6 options:0 withReply:v10];
  }
}

uint64_t __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

uint64_t __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:@"metadata"];
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = -20147;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);

  return [v6 executeCompletionBlockWithErrorCode:v3 info:v4 file:v5 completionDict:v7 completionBlk:v8];
}

- (void)getFileDataImp:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v19 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"cbBlock"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"options"];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v7, @"device", 0);
  int64_t v10 = [(PTPCameraDeviceManager *)self checkFile:v5 andDevice:v7];
  v29[3] = v10;
  if (v10)
  {
    [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v10 info:v19 file:v5 completionDict:v9 completionBlk:v6];
  }
  else
  {
    id v11 = [v8 objectForKeyedSubscript:@"ICReadOffset"];
    if (v11)
    {
      uint64_t v12 = [v8 objectForKeyedSubscript:@"ICReadOffset"];
      uint64_t v18 = [v12 unsignedLongLongValue];
    }
    else
    {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }

    id v13 = [v8 objectForKeyedSubscript:@"ICReadLength"];
    if (!v13
      || ([v8 objectForKeyedSubscript:@"ICReadLength"],
          id v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 unsignedLongLongValue],
          v14,
          v13,
          v18 == 0x7FFFFFFFFFFFFFFFLL)
      || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:-21449 info:v19 file:v5 completionDict:v9 completionBlk:v6];
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F28B48];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __41__PTPCameraDeviceManager_getFileDataImp___block_invoke;
      v20[3] = &unk_1E63D7408;
      uint64_t v27 = &v28;
      v20[4] = self;
      id v21 = v19;
      id v22 = v5;
      id v23 = v9;
      id v26 = v6;
      id v24 = v7;
      id v25 = v8;
      id v17 = [v16 blockOperationWithBlock:v20];
      [(ICDeviceManager *)self addInteractiveOperation:v17];
    }
  }

  _Block_object_dispose(&v28, 8);
}

void __41__PTPCameraDeviceManager_getFileDataImp___block_invoke(uint64_t a1)
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__PTPCameraDeviceManager_getFileDataImp___block_invoke_2;
  v15[3] = &unk_1E63D73B8;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 88);
  v15[4] = v2;
  id v16 = v3;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 80);
  id v4 = (void *)MEMORY[0x1C18A01C0](v15);
  uint64_t v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    uint64_t v7 = *(void *)(a1 + 72);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__PTPCameraDeviceManager_getFileDataImp___block_invoke_3;
    v10[3] = &unk_1E63D7458;
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 88);
    void v10[4] = v8;
    id v11 = v9;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 80);
    [v5 requestReadDataFromObjectHandle:v6 options:v7 withReply:v10];
  }
}

uint64_t __41__PTPCameraDeviceManager_getFileDataImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __41__PTPCameraDeviceManager_getFileDataImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:@"rc"];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (int)[v4 intValue];

    uint64_t v5 = [v7 objectForKeyedSubscript:@"ICReadData"];
    uint64_t v6 = -21448;
    if (v5) {
      uint64_t v6 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -21447;
  }
  [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:v7 completionBlk:*(void *)(a1 + 56)];
}

- (void)downloadFileImp:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  id v7 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = [v4 objectForKeyedSubscript:@"opts"];
  int64_t v10 = [v8 dictionaryWithDictionary:v9];

  id v11 = [v10 objectForKeyedSubscript:@"ICDownloadsDirectoryURL"];
  id v12 = [v11 path];

  id v13 = [v4 objectForKeyedSubscript:@"cbBlock"];
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  int64_t v15 = [(PTPCameraDeviceManager *)self checkFile:v7 andDevice:v5];
  id v16 = v28;
  v28[3] = v15;
  if (!v15)
  {
    if (v12)
    {
      [v10 setObject:v12 forKeyedSubscript:@"ICDownloadsDirectoryURL"];
      id v17 = (void *)MEMORY[0x1E4F28B48];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __42__PTPCameraDeviceManager_downloadFileImp___block_invoke;
      v19[3] = &unk_1E63D7408;
      id v26 = &v27;
      v19[4] = self;
      id v20 = v6;
      id v21 = v7;
      id v22 = v14;
      id v25 = v13;
      id v23 = v5;
      id v24 = v10;
      id v18 = [v17 blockOperationWithBlock:v19];
      [(ICDeviceManager *)self addInteractiveOperation:v18];

      goto LABEL_5;
    }
    int64_t v15 = -21100;
    v16[3] = -21100;
  }
  [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v15 info:v6 file:v7 completionDict:v14 completionBlk:v13];
LABEL_5:

  _Block_object_dispose(&v27, 8);
}

void __42__PTPCameraDeviceManager_downloadFileImp___block_invoke(uint64_t a1)
{
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__PTPCameraDeviceManager_downloadFileImp___block_invoke_2;
  v14[3] = &unk_1E63D73B8;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 88);
  void v14[4] = v2;
  id v15 = v3;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 80);
  id v4 = (void *)MEMORY[0x1C18A01C0](v14);
  uint64_t v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    uint64_t v7 = *(void *)(a1 + 72);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__PTPCameraDeviceManager_downloadFileImp___block_invoke_3;
    v9[3] = &unk_1E63D73E0;
    uint64_t v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 80);
    [v5 requestDownloadObjectHandle:v6 options:v7 withReply:v9];
  }
}

uint64_t __42__PTPCameraDeviceManager_downloadFileImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

uint64_t __42__PTPCameraDeviceManager_downloadFileImp___block_invoke_3(void *a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"rc"];
  uint64_t v4 = (int)[v3 intValue];

  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  uint64_t v9 = a1[8];

  return [v5 executeCompletionBlockWithErrorCode:v4 info:v6 file:v7 completionDict:v8 completionBlk:v9];
}

- (void)deleteFileImp:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = -9922;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = [v4 objectForKeyedSubscript:@"opts"];
  id v11 = [v9 dictionaryWithDictionary:v10];

  id v12 = (void *)v5;
  id v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", v7, @"file", 0);
  int64_t v14 = [(PTPCameraDeviceManager *)self checkFile:v7 andDevice:v12];
  v27[3] = v14;
  if (v14)
  {
    id v15 = [NSNumber numberWithInteger:v14];
    [v13 setObject:v15 forKeyedSubscript:@"errCode"];

    [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v27[3] info:v6 file:v7 completionDict:v13 completionBlk:v8];
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28B48];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__PTPCameraDeviceManager_deleteFileImp___block_invoke;
    v18[3] = &unk_1E63D7408;
    id v25 = &v26;
    v18[4] = self;
    id v19 = v6;
    id v20 = v7;
    id v21 = v13;
    id v24 = v8;
    id v22 = v12;
    id v23 = v11;
    id v17 = [v16 blockOperationWithBlock:v18];
    [(ICDeviceManager *)self addInteractiveOperation:v17];
  }
  _Block_object_dispose(&v26, 8);
}

void __40__PTPCameraDeviceManager_deleteFileImp___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_2;
  v29[3] = &unk_1E63D73B8;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v34 = *(void *)(a1 + 88);
  v29[4] = v2;
  id v30 = v3;
  id v31 = *(id *)(a1 + 48);
  id v32 = *(id *)(a1 + 56);
  id v33 = *(id *)(a1 + 80);
  id v4 = (void *)MEMORY[0x1C18A01C0](v29);
  uint64_t v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [*(id *)(a1 + 48) sidecarFiles];
    uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "objectID"));
          uint64_t v12 = *(void *)(a1 + 72);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_3;
          v24[3] = &unk_1E63D7B50;
          v24[4] = v10;
          [v5 requestDeleteObjectHandle:v11 options:v12 withReply:v24];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v7);
    }

    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    uint64_t v14 = *(void *)(a1 + 72);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_166;
    v18[3] = &unk_1E63D73E0;
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 32);
    id v19 = v15;
    uint64_t v20 = v16;
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 80);
    [v5 requestDeleteObjectHandle:v13 options:v14 withReply:v18];
  }
}

uint64_t __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  uint64_t v2 = @"sidecar";
  if ((unint64_t)[@"sidecar" length] >= 0x15)
  {
    id v3 = objc_msgSend(@"sidecar", "substringWithRange:", 0, 18);
    uint64_t v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = NSString;
  uint64_t v5 = [*(id *)(a1 + 32) name];
  uint64_t v6 = [v4 stringWithFormat:@"deleted sidecar: %@", v5];

  uint64_t v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v2;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446466;
    uint64_t v11 = [(__CFString *)v8 UTF8String];
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

uint64_t __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_166(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"errCode"];
  int v4 = [v3 intValue];

  if (!v4)
  {
    uint64_t v11 = @"ICObjectIDArray";
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "objectID"));
    id v10 = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

    [*(id *)(a1 + 40) notifyRemovedItems:v7];
  }
  uint64_t v8 = [NSNumber numberWithInteger:v4];
  [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:@"errCode"];

  return [*(id *)(a1 + 40) executeCompletionBlockWithErrorCode:v4 info:*(void *)(a1 + 56) file:*(void *)(a1 + 32) completionDict:*(void *)(a1 + 48) completionBlk:*(void *)(a1 + 64)];
}

- (void)sendDevicePTPCommandImp:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = -9922;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"cbBlock"];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v6, @"device", 0);
  uint64_t v9 = [v4 objectForKeyedSubscript:@"ICPTPCommandBuffer"];
  id v10 = [v4 objectForKeyedSubscript:@"ICPTPDataBuffer"];
  if (v9)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50__PTPCameraDeviceManager_sendDevicePTPCommandImp___block_invoke;
    v22[3] = &unk_1E63D80F0;
    long long v26 = &v27;
    uint64_t v11 = self;
    v22[4] = self;
    id v17 = v5;
    id v12 = v5;
    id v23 = v12;
    id v24 = v8;
    uint64_t v16 = v7;
    id v13 = v7;
    id v25 = v13;
    uint64_t v14 = (void *)MEMORY[0x1C18A01C0](v22);
    id v15 = [v6 remoteCameraWithFailureBlock:v14];
    if (v15)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __50__PTPCameraDeviceManager_sendDevicePTPCommandImp___block_invoke_2;
      v18[3] = &unk_1E63D8118;
      id v21 = &v27;
      void v18[4] = v11;
      id v19 = v12;
      id v20 = v13;
      [v15 sendPTPCommand:v9 andPayload:v10 withReply:v18];
    }
    uint64_t v7 = v16;
    uint64_t v5 = v17;
  }
  else
  {
    v28[3] = -21250;
    [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:-21250 info:v5 file:0 completionDict:v8 completionBlk:v7];
  }

  _Block_object_dispose(&v27, 8);
}

uint64_t __50__PTPCameraDeviceManager_sendDevicePTPCommandImp___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) info:*(void *)(a1 + 40) file:0 completionDict:*(void *)(a1 + 48) completionBlk:*(void *)(a1 + 56)];
}

void __50__PTPCameraDeviceManager_sendDevicePTPCommandImp___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectForKeyedSubscript:@"errCode"];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (int)[v3 intValue];

  [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) info:*(void *)(a1 + 40) file:0 completionDict:v4 completionBlk:*(void *)(a1 + 48)];
}

- (void)ejectImp:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  id v3 = @"DeviceManager";
  if ((unint64_t)[@"DeviceManager" length] >= 0x15)
  {
    id v4 = objc_msgSend(@"DeviceManager", "substringWithRange:", 0, 18);
    id v3 = [v4 stringByAppendingString:@".."];
  }
  uint64_t v5 = [NSString stringWithFormat:@"[PTPCameraDeviceManager ejectImp] (iOS unimplemented)"];
  uint64_t v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v3;
    uint64_t v8 = v6;
    int v9 = 136446466;
    uint64_t v10 = [(__CFString *)v7 UTF8String];
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1BEEFF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)getSecurityScopedURLImp:(id)a3
{
  id v4 = a3;
  id v9 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"cbBlock"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"info"];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:-9922 info:v7 file:v9 completionDict:v8 completionBlk:v6];
}

- (void)refreshObjectHandleInfoImp:(id)a3
{
  id v4 = a3;
  id v9 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"cbBlock"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"info"];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:-9922 info:v7 file:v9 completionDict:v8 completionBlk:v6];
}

- (void)getFingerprintImp:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  int64_t v10 = [(PTPCameraDeviceManager *)self checkFile:v7 andDevice:v5];
  v21[3] = v10;
  if (v10)
  {
    [(PTPCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v10 info:v6 file:v7 completionDict:v9 completionBlk:v8];
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x1E4F28B48];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke;
    v13[3] = &unk_1E63D7430;
    id v19 = &v20;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    id v16 = v9;
    id v18 = v8;
    id v17 = v5;
    id v12 = [v11 blockOperationWithBlock:v13];
    [(ICDeviceManager *)self addInteractiveOperation:v12];
  }
  _Block_object_dispose(&v20, 8);
}

void __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke(uint64_t a1)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke_2;
  v12[3] = &unk_1E63D73B8;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 80);
  void v12[4] = v2;
  id v13 = v3;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 72);
  id v4 = (void *)MEMORY[0x1C18A01C0](v12);
  uint64_t v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke_3;
    v8[3] = &unk_1E63D7480;
    uint64_t v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 72);
    [v5 requestFingerprintForObjectHandle:v6 withReply:v8];
  }
}

uint64_t __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectForKeyedSubscript:@"rc"];
  uint64_t v4 = (int)[v3 intValue];

  [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:v4 info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:v5 completionBlk:*(void *)(a1 + 56)];
}

- (void)registerDevice:(id)a3 forImageCaptureEventNotificationsImp:(id)a4
{
  id v7 = a4;
  id v5 = [a3 remoteCamera];
  uint64_t v6 = v5;
  if (v5) {
    [v5 registerInterestedEventNotifications:v7];
  }
}

- (void)unregisterDevice:(id)a3 forImageCaptureEventNotificationsImp:(id)a4
{
  id v7 = a4;
  id v5 = [a3 remoteCamera];
  uint64_t v6 = v5;
  if (v5) {
    [v5 unregisterInterestedEventNotifications:v7];
  }
}

- (void)handleEventImp:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  id v3 = [NSString stringWithFormat:@"---> handleEventImp\n"];
  uint64_t v4 = __ICLogTypeEnabled(2);
  id v5 = _gICOSLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v3;
      _os_log_impl(&dword_1BEEFF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
  {
    -[ICCameraDeviceBrowser handleImageCaptureEventNotification:]((uint64_t)v3, v5);
  }

  __ICOSLogCreate();
  uint64_t v6 = [NSString stringWithFormat:@"<--- handleEventImp\n"];
  uint64_t v7 = __ICLogTypeEnabled(2);
  uint64_t v8 = _gICOSLog;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1BEEFF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
  {
    -[ICCameraDeviceBrowser handleImageCaptureEventNotification:]((uint64_t)v6, v8);
  }
}

- (int64_t)checkFile:(id)a3 andDevice:(id)a4
{
  if (a3) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = -21450;
  }
  if ([a4 hasOpenSession]) {
    return v4;
  }
  else {
    return -9927;
  }
}

- (void)executeCompletionBlockWithErrorCode:(int64_t)a3 info:(id)a4 file:(id)a5 completionDict:(id)a6 completionBlk:(id)a7
{
  id v15 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(id, id, id))a7;
  if (v15) {
    [v12 setObject:v15 forKeyedSubscript:@"info"];
  }
  id v14 = [NSNumber numberWithInteger:a3];
  [v12 setObject:v14 forKeyedSubscript:@"errCode"];

  if (v13) {
    v13[2](v13, v11, v12);
  }
}

- (void)updateCameraFolder:(id)a3 withInfo:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1C189FFC0]();
  id v7 = v5;
  objc_msgSend(v13, "setObjectHandle:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(v13, "setObjectID:", objc_msgSend(v7, "objectHandle"));
  uint64_t v8 = [v7 captureDate];
  int v9 = ICStandardDateFromPTPString(v8);
  [v13 setCreationDate:v9];
  id v10 = [v7 modificationDate];
  id v11 = v10;
  if (v10 && [v10 length])
  {
    id v12 = ICStandardDateFromPTPString(v11);
    [v13 setModificationDate:v12];
  }
  else
  {
    [v13 setModificationDate:v9];
  }
}

- (void)updateCameraFile:(id)a3 withInfo:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  objc_msgSend(v38, "setObjectHandle:", objc_msgSend(v6, "objectHandle"));
  objc_msgSend(v38, "setObjectID:", objc_msgSend(v6, "objectHandle"));
  id v7 = [v6 filename];
  uint64_t v8 = [v7 pathExtension];
  int v9 = [v8 lowercaseString];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v9];
  }
  else
  {
    id v10 = 0;
  }
  if (!_gKnownRawExtensions)
  {
    id v11 = (void *)CGImageSourceCopyTypeExtensions();
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v11];
    id v13 = (void *)_gKnownRawExtensions;
    _gKnownRawExtensions = v12;

    [(id)_gKnownRawExtensions removeObject:@"tif"];
  }
  if (([v6 objectFormat] < 0x3801
     || [v6 objectFormat] >= 0x3811)
    && [v6 objectFormat] != 46081)
  {
    if ([(id)_gKnownRawExtensions count]
      && [(id)_gKnownRawExtensions containsObject:v9])
    {
      objc_msgSend(v38, "setRaw:", objc_msgSend((id)_gKnownRawExtensions, "containsObject:", v9));
    }
    else
    {
      uint64_t v14 = _gImageIOSupportedFileExtensions;
      id v15 = [v9 lowercaseString];
      LOBYTE(v14) = [(id)v14 containsObject:v15];

      if ((v14 & 1) == 0)
      {
        if (v10)
        {
          id v16 = (void *)*MEMORY[0x1E4F44448];
          if ([v10 conformsToType:*MEMORY[0x1E4F44448]]) {
            goto LABEL_14;
          }
          id v16 = (void *)*MEMORY[0x1E4F44330];
          if ([v10 conformsToType:*MEMORY[0x1E4F44330]])
          {
            uint64_t v17 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v17 = 0;
        id v16 = (void *)*MEMORY[0x1E4F44378];
        goto LABEL_15;
      }
    }
  }
  id v16 = (void *)*MEMORY[0x1E4F44400];
LABEL_14:
  uint64_t v17 = 1;
LABEL_15:
  id v18 = [v16 identifier];
  [v38 setUTI:v18];

  [v38 setHasMetadata:v17];
  objc_msgSend(v38, "setWidth:", objc_msgSend(v6, "imagePixWidth"));
  objc_msgSend(v38, "setHeight:", objc_msgSend(v6, "imagePixHeight"));
  objc_msgSend(v38, "setFileSize:", objc_msgSend(v6, "objectCompressedSize64"));
  objc_msgSend(v38, "setHasThumbnail:", objc_msgSend(v6, "thumbCompressedSize") != 0);
  [v38 setOrientation:1];
  objc_msgSend(v38, "setParentID:", objc_msgSend(v6, "parentObject"));
  id v19 = [v38 device];
  objc_msgSend(v38, "setLocked:", objc_msgSend(v19, "isLocked"));

  uint64_t v20 = [v6 keywords];
  [(PTPCameraDeviceManager *)self updateCameraFile:v38 withKeywords:v20];

  id v21 = [v6 captureDate];
  uint64_t v22 = ICStandardDateFromPTPString(v21);
  [v38 setCreationDate:v22];
  uint64_t v23 = [v6 modificationDate];
  id v24 = v23;
  if (v23 && [v23 length])
  {
    id v25 = ICStandardDateFromPTPString(v24);
    [v38 setModificationDate:v25];
  }
  else
  {
    [v38 setModificationDate:v22];
  }
  long long v26 = [v38 device];
  uint64_t v27 = [v26 transportType];
  if (![v27 isEqualToString:@"ICTransportTypeUSB"]) {
    goto LABEL_29;
  }
  long long v28 = [v38 device];
  int v29 = [v28 isAppleDevice];

  if (v29)
  {
    id v30 = [v38 name];
    id v31 = strstr((char *)[v30 UTF8String], "_E");

    if (v31) {
      [v38 flagMediaMetadata:8];
    }
    int v32 = [v6 sequenceNumber];
    int v33 = 1 << v32;
    if (v32 == 170) {
      int v33 = 513;
    }
    [v38 flagMediaMetadata:v33];
    uint64_t v34 = [v38 relatedUUID];

    if (!v34)
    {
      v35 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v36 = [v35 UUIDString];
      [v38 setRelatedUUID:v36];
    }
    uint64_t v37 = [v38 originatingAssetID];

    if (!v37)
    {
      long long v26 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v27 = [v26 UUIDString];
      [v38 setOriginatingAssetID:v27];
LABEL_29:
    }
  }
}

- (void)updateCameraFile:(id)a3 withKeywords:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:&stru_1F1A1D6A8] & 1) == 0)
  {
    id v7 = (char *)malloc_type_malloc(0x400uLL, 0x994ECF88uLL);
    memset(v34, 0, sizeof(v34));
    [v6 getCString:v7 maxLength:1024 encoding:4];
    uint64_t v8 = strtok(v7, "^");
    if (v8)
    {
      uint64_t v9 = 0;
      do
      {
        *((void *)v34 + v9++) = v8;
        if (v9) {
          id v10 = "&";
        }
        else {
          id v10 = "^";
        }
        uint64_t v8 = strtok(0, v10);
      }
      while (v8);
      if (v9)
      {
        uint64_t v11 = 0;
        do
        {
          if (strtok(*((char **)v34 + v11), "&"))
          {
            uint64_t v12 = 0;
            do
            {
              id v13 = v12;
              uint64_t v12 = strtok(0, "&");
            }
            while (v12);
            if (v13) {
              *((void *)v34 + v11) = v13;
            }
          }
          ++v11;
        }
        while (v11 != v9);
        unint64_t v14 = 0;
        do
        {
          if (*(void *)&v34[v14 / 2])
          {
            id v15 = objc_msgSend(NSString, "stringWithUTF8String:");
          }
          else
          {
            id v15 = 0;
          }
          if (*((void *)&v34[v14 / 2] + 1))
          {
            id v16 = objc_msgSend(NSString, "stringWithUTF8String:");
            if (v16) {
              BOOL v17 = v15 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (!v17)
            {
              if ([v15 isEqualToString:@"D"])
              {
                [v16 doubleValue];
                objc_msgSend(v5, "setDuration:");
              }
              else if (([v15 isEqualToString:@"G"] & 1) == 0)
              {
                if ([v15 isEqualToString:@"BUUID"])
                {
                  [v5 setBurstUUID:v16];
                }
                else if ([v15 isEqualToString:@"BFAV"])
                {
                  objc_msgSend(v5, "setBurstFavorite:", objc_msgSend(v16, "BOOLValue"));
                }
                else if ([v15 isEqualToString:@"BPIK"])
                {
                  objc_msgSend(v5, "setBurstPicked:", objc_msgSend(v16, "BOOLValue"));
                }
                else if ([v15 isEqualToString:@"HFRV"])
                {
                  objc_msgSend(v5, "setHighFramerate:", objc_msgSend(v16, "BOOLValue"));
                }
                else if ([v15 isEqualToString:@"TLV"])
                {
                  objc_msgSend(v5, "setTimeLapse:", objc_msgSend(v16, "BOOLValue"));
                }
                else if ([v15 isEqualToString:@"FPIK"])
                {
                  objc_msgSend(v5, "setFirstPicked:", objc_msgSend(v16, "BOOLValue"));
                }
                else if ([v15 isEqualToString:@"GUUID"])
                {
                  [v5 setGroupUUID:v16];
                }
                else if ([v15 isEqualToString:@"RUUID"])
                {
                  [v5 setRelatedUUID:v16];
                  id v27 = [v5 device];
                  [v27 setAppleRelatedUUIDSupport:1];
                }
                else if ([v15 isEqualToString:@"ON"])
                {
                  [v5 setOriginalFilename:v16];
                }
                else if ([v15 isEqualToString:@"CFN"])
                {
                  [v5 setCreatedFilename:v16];
                }
                else if ([v15 isEqualToString:@"OAID"])
                {
                  [v5 setOriginatingAssetID:v16];
                }
                else if ([v15 isEqualToString:@"SOCGID"])
                {
                  [v5 setSpatialOverCaptureGroupID:v16];
                }
                else if ([v15 isEqualToString:@"FPRINT"])
                {
                  [v5 setFingerprint:v16];
                }
                else if ([v15 isEqualToString:@"IO"])
                {
                  id v28 = (id)[v5 orientation];
                  if (v28 != (id)[v16 integerValue])
                  {
                    [v5 willChangeValueForKey:@"orientation"];
                    [v5 willChangeValueForKey:@"width"];
                    [v5 willChangeValueForKey:@"height"];
                    objc_msgSend(v5, "setOrientation:", objc_msgSend(v16, "integerValue"));
                    __ICOSLogCreate();
                    id v29 = [v5 name];
                    if ((unint64_t)[v29 length] >= 0x15)
                    {
                      id v25 = objc_msgSend(v29, "substringWithRange:", 0, 18);
                      uint64_t v22 = [v25 stringByAppendingString:@".."];

                      id v29 = (id)v22;
                    }
                    long long v26 = [NSString stringWithFormat:@"Height: %lu, Width: %lu, Orientation: %lu", objc_msgSend(v5, "height"), objc_msgSend(v5, "width"), objc_msgSend(v5, "orientation")];
                    uint64_t v23 = (void *)_gICOSLog;
                    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                    {
                      id v21 = v29;
                      id v24 = v23;
                      uint64_t v18 = [v21 UTF8String];
                      *(_DWORD *)buf = 136446466;
                      uint64_t v31 = v18;
                      __int16 v32 = 2114;
                      int v33 = v26;
                      _os_log_impl(&dword_1BEEFF000, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
                    }
                    [v5 didChangeValueForKey:@"orientation"];
                    [v5 didChangeValueForKey:@"width"];
                    [v5 didChangeValueForKey:@"height"];
                  }
                }
              }
            }
          }
          else
          {
            id v16 = 0;
          }

          v14 += 2;
        }
        while (v14 < v9);
      }
    }
    id v19 = [v5 relatedUUID];

    if (!v19)
    {
      uint64_t v20 = [v5 device];
      [v20 setAppleRelatedUUIDSupport:2];
    }
    free(v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netServices, 0);

  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
}

@end