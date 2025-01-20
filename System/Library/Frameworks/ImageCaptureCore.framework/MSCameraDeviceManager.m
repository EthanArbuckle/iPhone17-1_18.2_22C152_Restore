@interface MSCameraDeviceManager
- (CGSize)cropThumbSize:(CGSize)a3 fullSize:(CGSize)a4 finalSize:(CGSize)a5;
- (id)deviceManagerConnection;
- (int64_t)checkFile:(id)a3 andDevice:(id)a4;
- (void)deleteFileImp:(id)a3;
- (void)downloadFileImp:(id)a3;
- (void)ejectImp:(id)a3;
- (void)executeCompletionBlockWithErrorCode:(int64_t)a3 info:(id)a4 file:(id)a5 completionDict:(id)a6 completionBlk:(id)a7;
- (void)getFileDataImp:(id)a3;
- (void)getFileMetadataImp:(id)a3;
- (void)getFileThumbnailImp:(id)a3;
- (void)getFingerprintImp:(id)a3;
- (void)getSecurityScopedURLImp:(id)a3;
- (void)notifyAddedItems:(id)a3;
- (void)notifyRemovedItems:(id)a3;
- (void)notifyStatus:(id)a3;
- (void)notifyUpdatedItems:(id)a3;
- (void)refreshObjectHandleInfoImp:(id)a3;
- (void)startDeviceWithHandle:(id)a3;
- (void)syncClockImp:(id)a3;
- (void)updateCameraFile:(id)a3 withInfo:(id)a4;
- (void)updateCameraFolder:(id)a3 withInfo:(id)a4;
@end

@implementation MSCameraDeviceManager

- (id)deviceManagerConnection
{
  v3 = [(ICDeviceManager *)self managerConnection];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.mscamerad-xpc"];
    [(ICDeviceManager *)self setManagerConnection:v4];
  }

  return [(ICDeviceManager *)self managerConnection];
}

- (void)startDeviceWithHandle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ICDeviceManager *)self devices];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    __ICOSLogCreate();
    v7 = @"device";
    if ((unint64_t)[@"device" length] >= 0x15)
    {
      v8 = objc_msgSend(@"device", "substringWithRange:", 0, 18);
      v7 = [v8 stringByAppendingString:@".."];
    }
    v9 = [NSString stringWithFormat:@"%12s : %@", "starting", v4];
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v7;
      v12 = v10;
      *(_DWORD *)buf = 136446466;
      uint64_t v18 = [(__CFString *)v11 UTF8String];
      __int16 v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    v13 = [v6 remoteCamera];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__MSCameraDeviceManager_startDeviceWithHandle___block_invoke;
    v14[3] = &unk_1E63D7370;
    id v15 = v6;
    v16 = self;
    [v13 requestStartUsingDeviceWithReply:v14];
  }
}

void __47__MSCameraDeviceManager_startDeviceWithHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"ICDeviceName"];

  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"ICDeviceName"];
    [*(id *)(a1 + 32) setName:v5];

    v6 = [v3 objectForKeyedSubscript:@"ICDeviceEjectable"];
    objc_msgSend(*(id *)(a1 + 32), "setEjectable:", objc_msgSend(v6, "BOOLValue"));

    v7 = [v3 objectForKeyedSubscript:@"ICDeviceType"];
    [*(id *)(a1 + 32) setProductType:v7];

    v8 = [v3 objectForKeyedSubscript:@"ICDeviceProductKind"];
    [*(id *)(a1 + 32) setProductKind:v8];

    v9 = [v3 objectForKeyedSubscript:@"ICDeviceLocked"];
    objc_msgSend(*(id *)(a1 + 32), "setLocked:", objc_msgSend(v9, "BOOLValue"));

    v10 = [v3 objectForKeyedSubscript:@"ICInternalDeviceUUID"];
    [*(id *)(a1 + 32) setUUIDString:v10];

    v11 = [v3 objectForKeyedSubscript:@"ICInternalDeviceUUID"];
    [*(id *)(a1 + 32) setPersistentIDString:v11];

    v12 = [v3 objectForKeyedSubscript:@"ICDeviceVolumePath"];
    [*(id *)(a1 + 32) setVolumePath:v12];

    v13 = [v3 objectForKeyedSubscript:@"ICDeviceTransportType"];
    [*(id *)(a1 + 32) setTransportType:v13];

    [*(id *)(a1 + 32) setLocationDescription:@"ICDeviceLocationDescriptionMassStorage"];
    v14 = [v3 objectForKeyedSubscript:@"ICDeviceSystemSymbolName"];
    [*(id *)(a1 + 32) setSystemSymbolName:v14];

    id v15 = [v3 objectForKeyedSubscript:@"ICDeviceCapabilities"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(a1 + 32) addCapability:*(void *)(*((void *)&v28 + 1) + 8 * v19++)];
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v17);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__MSCameraDeviceManager_startDeviceWithHandle___block_invoke_2;
    block[3] = &unk_1E63D72A8;
    id v27 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    v20 = NSString;
    uint64_t v21 = *(void **)(a1 + 40);
    v22 = [*(id *)(a1 + 32) name];
    v23 = [v20 stringWithFormat:@"%@:%@", @"ICDeviceOperationQueue", v22];
    [v21 setDeviceOperationQueueName:v23];

    [*(id *)(a1 + 40) setDeviceOperationQueueMaxConcurrentOperationCount:1];
    uint64_t v24 = *(void *)(a1 + 32);
    v32[0] = @"device";
    v32[1] = @"type";
    v33[0] = v24;
    v33[1] = @"ICDeviceAdded";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    [*(id *)(a1 + 40) performSelectorOnMainThread:sel_postNotification_ withObject:v25 waitUntilDone:0];
  }
}

uint64_t __47__MSCameraDeviceManager_startDeviceWithHandle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAutolaunchApplicationPath];
}

- (void)ejectImp:(id)a3
{
  id v4 = a3;
  id v9 = [v4 objectForKeyedSubscript:@"device"];
  v5 = [v4 objectForKeyedSubscript:@"cbBlock"];

  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v9, @"device", 0);
  v7 = [(ICDeviceManager *)self remoteManager];
  if (v7)
  {
    v8 = [v9 internalUUID];
    [v7 ejectDevice:v8 withReply:&__block_literal_global_2];
  }
  [v6 setObject:&unk_1F1A2C580 forKeyedSubscript:@"errCode"];
  if (v5) {
    ((void (**)(void, id, void *))v5)[2](v5, v9, v6);
  }
}

- (void)syncClockImp:(id)a3
{
  id v3 = a3;
  id v9 = [v3 objectForKeyedSubscript:@"device"];
  id v4 = [v3 objectForKeyedSubscript:@"info"];
  v5 = [v3 objectForKeyedSubscript:@"cbBlock"];

  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v9, @"device", 0);
  v7 = v6;
  if (v4) {
    [v6 setObject:v4 forKeyedSubscript:@"info"];
  }
  v8 = [NSNumber numberWithInteger:-9922];
  [v7 setObject:v8 forKeyedSubscript:@"errCode"];

  if (v5) {
    ((void (**)(void, id, void *))v5)[2](v5, v9, v7);
  }
}

- (void)getFileThumbnailImp:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = -9922;
  v5 = [v4 objectForKeyedSubscript:@"file"];
  v6 = [v4 objectForKeyedSubscript:@"info"];
  v7 = [v4 objectForKeyedSubscript:@"device"];
  v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v9 = [v4 objectForKeyedSubscript:@"options"];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FF68]];

  v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v7, @"device", v5, @"file", 0);
  v12 = &unk_1F1A2C598;
  if (v10) {
    v12 = v10;
  }
  id v13 = v12;

  int64_t v14 = [(MSCameraDeviceManager *)self checkFile:v5 andDevice:v7];
  v26[3] = v14;
  if (v14)
  {
    [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v14 info:v6 file:v5 completionDict:v11 completionBlk:v8];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F28B48];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke;
    v17[3] = &unk_1E63D7408;
    uint64_t v24 = &v25;
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

void __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke_2;
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
  v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v24 = *MEMORY[0x1E4F2FF68];
    v25[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke_3;
    v12[3] = &unk_1E63D73E0;
    id v13 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = v11;
    id v17 = *(id *)(a1 + 80);
    [v5 requestThumbnailDataForObjectHandle:v6 options:v8 withReply:v12];
  }
}

uint64_t __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"thumb"];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"metadata"];
      uint64_t v7 = [*(id *)(a1 + 32) metadata];
      if (v7)
      {
      }
      else if ([v6 count])
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
          v11 = NSString;
          v12 = [*(id *)(a1 + 32) name];
          id v13 = [v11 stringWithFormat:@"Set Metadata ---> thumbnail %@", v12];

          id v14 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = v9;
            id v16 = v14;
            *(_DWORD *)buf = 136446466;
            uint64_t v23 = [(__CFString *)v15 UTF8String];
            __int16 v24 = 2114;
            uint64_t v25 = v13;
            _os_log_impl(&dword_1BEEFF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
        }
        [*(id *)(a1 + 32) setMetadata:v6];
      }
      id v17 = [*(id *)(a1 + 32) metadata];
      uint64_t v18 = *MEMORY[0x1E4F2FCA0];
      id v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];

      if (v19) {
        [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:v18];
      }
      [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:@"thumb"];
      id v20 = [v4 objectForKeyedSubscript:@"ICThumbnailRotated"];

      if (v20)
      {
        id v21 = [v4 objectForKeyedSubscript:@"ICThumbnailRotated"];
        [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:@"ICThumbnailRotated"];
      }
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = -20097;
    }
  }
  else
  {
    uint64_t v8 = -20097;
  }
  [*(id *)(a1 + 48) executeCompletionBlockWithErrorCode:v8 info:*(void *)(a1 + 56) file:*(void *)(a1 + 32) completionDict:*(void *)(a1 + 40) completionBlk:*(void *)(a1 + 64)];
}

- (void)getFileMetadataImp:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v5 = [v4 objectForKeyedSubscript:@"device"];
  v6 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", v7, @"file", 0);
  int64_t v10 = [(MSCameraDeviceManager *)self checkFile:v7 andDevice:v5];
  v21[3] = v10;
  if (v10)
  {
    [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v10 info:v6 file:v7 completionDict:v9 completionBlk:v8];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F28B48];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke;
    v13[3] = &unk_1E63D7430;
    id v19 = &v20;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    id v16 = v9;
    id v18 = v8;
    id v17 = v5;
    v12 = [v11 blockOperationWithBlock:v13];
    [(ICDeviceManager *)self addInteractiveOperation:v12];
  }
  _Block_object_dispose(&v20, 8);
}

void __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke(uint64_t a1)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke_2;
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
  v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke_3;
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

uint64_t __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectForKeyedSubscript:@"kCGImagePropertyOrientation"];

  if (!v3) {
    [*(id *)(a1 + 32) setObject:&unk_1F1A2C5B0 forKeyedSubscript:@"kCGImagePropertyOrientation"];
  }
  if (v5)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"metadata"];
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -20147;
  }
  [*(id *)(a1 + 40) executeCompletionBlockWithErrorCode:v4 info:*(void *)(a1 + 48) file:*(void *)(a1 + 56) completionDict:*(void *)(a1 + 32) completionBlk:*(void *)(a1 + 64)];
}

- (void)getFileDataImp:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v19 = [v4 objectForKeyedSubscript:@"info"];
  id v5 = [v4 objectForKeyedSubscript:@"file"];
  v6 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v7 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"options"];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v7, @"device", 0);
  int64_t v10 = [(MSCameraDeviceManager *)self checkFile:v5 andDevice:v7];
  v29[3] = v10;
  if (v10)
  {
    [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v10 info:v19 file:v5 completionDict:v9 completionBlk:v6];
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
      [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:-21449 info:v19 file:v5 completionDict:v9 completionBlk:v6];
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F28B48];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __40__MSCameraDeviceManager_getFileDataImp___block_invoke;
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

void __40__MSCameraDeviceManager_getFileDataImp___block_invoke(uint64_t a1)
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__MSCameraDeviceManager_getFileDataImp___block_invoke_2;
  v15[3] = &unk_1E63D73B8;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 88);
  v15[4] = v2;
  id v16 = v3;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 80);
  id v4 = (void *)MEMORY[0x1C18A01C0](v15);
  id v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    uint64_t v7 = *(void *)(a1 + 72);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__MSCameraDeviceManager_getFileDataImp___block_invoke_3;
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

uint64_t __40__MSCameraDeviceManager_getFileDataImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __40__MSCameraDeviceManager_getFileDataImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:@"rc"];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (int)[v4 intValue];

    id v5 = [v7 objectForKeyedSubscript:@"ICReadData"];
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

- (void)deleteFileImp:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = -9922;
  id v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v30 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"file"];
  long long v29 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"opts"];
  uint64_t v28 = [v7 dictionaryWithDictionary:v8];

  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", v6, @"file", 0);
  __ICOSLogCreate();
  if ((unint64_t)[@"delete" length] < 0x15)
  {
    id v11 = @"delete";
  }
  else
  {
    int64_t v10 = objc_msgSend(@"delete", "substringWithRange:", 0, 18);
    id v11 = [v10 stringByAppendingString:@".."];
  }
  id v12 = NSString;
  id v13 = [v6 name];
  uint64_t v14 = [v12 stringWithFormat:@"MSCameraDeviceManager - %@", v13];

  uint64_t v15 = (id)_gICOSLog;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [(__CFString *)v11 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v44 = v16;
    __int16 v45 = 2114;
    v46 = v14;
    _os_log_impl(&dword_1BEEFF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  int64_t v17 = [(MSCameraDeviceManager *)self checkFile:v6 andDevice:v5];
  v40[3] = v17;
  if (v17)
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"delete" length] < 0x15)
    {
      id v19 = @"delete";
    }
    else
    {
      id v18 = objc_msgSend(@"delete", "substringWithRange:", 0, 18);
      id v19 = [v18 stringByAppendingString:@".."];
    }
    id v22 = NSString;
    id v23 = [v6 name];
    id v24 = [v22 stringWithFormat:@"File Check Failed - %@", v23];

    id v25 = (id)_gICOSLog;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [(__CFString *)v19 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v44 = v26;
      __int16 v45 = 2114;
      v46 = v24;
      _os_log_impl(&dword_1BEEFF000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    uint64_t v27 = [NSNumber numberWithInteger:v40[3]];
    [v9 setObject:v27 forKeyedSubscript:@"errCode"];

    [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v40[3] info:v30 file:v6 completionDict:v9 completionBlk:v29];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28B48];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __39__MSCameraDeviceManager_deleteFileImp___block_invoke;
    v31[3] = &unk_1E63D7408;
    v38 = &v39;
    v31[4] = self;
    id v32 = v30;
    id v33 = v6;
    id v34 = v9;
    id v37 = v29;
    id v35 = v5;
    id v36 = v28;
    id v21 = [v20 blockOperationWithBlock:v31];
    [(ICDeviceManager *)self addInteractiveOperation:v21];
  }
  _Block_object_dispose(&v39, 8);
}

void __39__MSCameraDeviceManager_deleteFileImp___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __39__MSCameraDeviceManager_deleteFileImp___block_invoke_2;
  v25[3] = &unk_1E63D73B8;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v30 = *(void *)(a1 + 88);
  v25[4] = v2;
  id v26 = v3;
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 56);
  id v29 = *(id *)(a1 + 80);
  id v4 = (void *)MEMORY[0x1C18A01C0](v25);
  id v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    __ICOSLogCreate();
    uint64_t v6 = @"delete";
    if ((unint64_t)[@"delete" length] >= 0x15)
    {
      id v7 = objc_msgSend(@"delete", "substringWithRange:", 0, 18);
      uint64_t v6 = [v7 stringByAppendingString:@".."];
    }
    uint64_t v8 = NSString;
    id v9 = [*(id *)(a1 + 48) name];
    int64_t v10 = [v8 stringWithFormat:@"Remote Camera Good - %@", v9];

    id v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v6;
      id v13 = v11;
      uint64_t v14 = [(__CFString *)v12 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v32 = v14;
      __int16 v33 = 2114;
      id v34 = v10;
      _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    uint64_t v16 = *(void *)(a1 + 72);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__MSCameraDeviceManager_deleteFileImp___block_invoke_123;
    v19[3] = &unk_1E63D73E0;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 32);
    id v20 = v17;
    uint64_t v21 = v18;
    id v22 = *(id *)(a1 + 56);
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 80);
    [v5 requestDeleteObjectHandle:v15 options:v16 withReply:v19];
  }
}

uint64_t __39__MSCameraDeviceManager_deleteFileImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

uint64_t __39__MSCameraDeviceManager_deleteFileImp___block_invoke_123(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"errCode"];
  int v4 = [v3 intValue];

  if (!v4)
  {
    id v23 = @"ICObjectIDArray";
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "objectID"));
    id v22 = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v24[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

    [*(id *)(a1 + 40) notifyRemovedItems:v7];
  }
  __ICOSLogCreate();
  uint64_t v8 = @"delete";
  if ((unint64_t)[@"delete" length] >= 0x15)
  {
    id v9 = objc_msgSend(@"delete", "substringWithRange:", 0, 18);
    uint64_t v8 = [v9 stringByAppendingString:@".."];
  }
  int64_t v10 = NSString;
  id v11 = [*(id *)(a1 + 32) name];
  id v12 = [v10 stringWithFormat:@"Request->Reply - %@", v11];

  id v13 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v8;
    uint64_t v15 = v13;
    *(_DWORD *)buf = 136446466;
    uint64_t v19 = [(__CFString *)v14 UTF8String];
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1BEEFF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v16 = [NSNumber numberWithInteger:v4];
  [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:@"errCode"];

  return [*(id *)(a1 + 40) executeCompletionBlockWithErrorCode:v4 info:*(void *)(a1 + 56) file:*(void *)(a1 + 32) completionDict:*(void *)(a1 + 48) completionBlk:*(void *)(a1 + 64)];
}

- (void)downloadFileImp:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  id v7 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = [v4 objectForKeyedSubscript:@"opts"];
  int64_t v10 = [v8 dictionaryWithDictionary:v9];

  id v11 = [v10 objectForKeyedSubscript:@"ICDownloadsDirectoryURL"];
  id v12 = [v11 path];

  id v13 = [v4 objectForKeyedSubscript:@"cbBlock"];
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  int64_t v15 = [(MSCameraDeviceManager *)self checkFile:v7 andDevice:v5];
  uint64_t v16 = v28;
  v28[3] = v15;
  if (!v15)
  {
    if (v12)
    {
      [v10 setObject:v12 forKeyedSubscript:@"ICDownloadsDirectoryURL"];
      id v17 = (void *)MEMORY[0x1E4F28B48];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __41__MSCameraDeviceManager_downloadFileImp___block_invoke;
      v19[3] = &unk_1E63D7408;
      id v26 = &v27;
      void v19[4] = self;
      id v20 = v6;
      id v21 = v7;
      id v22 = v14;
      id v25 = v13;
      id v23 = v5;
      id v24 = v10;
      uint64_t v18 = [v17 blockOperationWithBlock:v19];
      [(ICDeviceManager *)self addInteractiveOperation:v18];

      goto LABEL_5;
    }
    int64_t v15 = -21100;
    v16[3] = -21100;
  }
  [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v15 info:v6 file:v7 completionDict:v14 completionBlk:v13];
LABEL_5:

  _Block_object_dispose(&v27, 8);
}

void __41__MSCameraDeviceManager_downloadFileImp___block_invoke(uint64_t a1)
{
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__MSCameraDeviceManager_downloadFileImp___block_invoke_2;
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
  id v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    uint64_t v7 = *(void *)(a1 + 72);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__MSCameraDeviceManager_downloadFileImp___block_invoke_3;
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

uint64_t __41__MSCameraDeviceManager_downloadFileImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

uint64_t __41__MSCameraDeviceManager_downloadFileImp___block_invoke_3(void *a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"rc"];
  uint64_t v4 = (int)[v3 intValue];

  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  uint64_t v9 = a1[8];

  return [v5 executeCompletionBlockWithErrorCode:v4 info:v6 file:v7 completionDict:v8 completionBlk:v9];
}

- (void)getSecurityScopedURLImp:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  int64_t v10 = [(MSCameraDeviceManager *)self checkFile:v7 andDevice:v5];
  v21[3] = v10;
  if (v10)
  {
    [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v10 info:v6 file:v7 completionDict:v9 completionBlk:v8];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28B48];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke;
    v13[3] = &unk_1E63D7430;
    uint64_t v19 = &v20;
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

void __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke(uint64_t a1)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke_2;
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
  id v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke_3;
    v8[3] = &unk_1E63D7480;
    uint64_t v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 72);
    [v5 requestSecurityScopedURLForObjectHandle:v6 withReply:v8];
  }
}

uint64_t __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectForKeyedSubscript:@"rc"];
  int v4 = [v3 intValue];

  id v5 = [v7 objectForKeyedSubscript:@"ICSecurityScopedWrappedURL"];
  uint64_t v6 = [v5 url];
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:@"ICSecurityScopedURL"];
  }
  [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:v4 info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:v7 completionBlk:*(void *)(a1 + 56)];
}

- (void)refreshObjectHandleInfoImp:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  id v7 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  int64_t v10 = [(MSCameraDeviceManager *)self checkFile:v7 andDevice:v5];
  v21[3] = v10;
  if (v10)
  {
    [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v10 info:v6 file:v7 completionDict:v9 completionBlk:v8];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28B48];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke;
    v13[3] = &unk_1E63D7430;
    uint64_t v19 = &v20;
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

void __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke(uint64_t a1)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke_2;
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
  id v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke_3;
    v10[3] = &unk_1E63D74A8;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    uint64_t v15 = *(void *)(a1 + 80);
    id v13 = v9;
    id v14 = *(id *)(a1 + 72);
    [v5 requestRefreshObjectHandleInfo:v6 withReply:v10];
  }
}

uint64_t __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectForKeyedSubscript:@"errCode"];
  uint64_t v4 = [v3 integerValue];

  if (!v4)
  {
    id v5 = [v8 objectForKeyedSubscript:@"ICObjectInfoUpdate"];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "objectID"));
    id v7 = [v5 objectForKeyedSubscript:v6];

    [*(id *)(a1 + 32) handleObjectInfoUpdate:v7];
  }
  [*(id *)(a1 + 40) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) info:*(void *)(a1 + 48) file:*(void *)(a1 + 32) completionDict:v8 completionBlk:*(void *)(a1 + 56)];
}

- (void)getFingerprintImp:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v5 = [v4 objectForKeyedSubscript:@"device"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"info"];
  id v7 = [v4 objectForKeyedSubscript:@"file"];
  id v8 = [v4 objectForKeyedSubscript:@"cbBlock"];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  int64_t v10 = [(MSCameraDeviceManager *)self checkFile:v7 andDevice:v5];
  v21[3] = v10;
  if (v10)
  {
    [(MSCameraDeviceManager *)self executeCompletionBlockWithErrorCode:v10 info:v6 file:v7 completionDict:v9 completionBlk:v8];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28B48];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__MSCameraDeviceManager_getFingerprintImp___block_invoke;
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

void __43__MSCameraDeviceManager_getFingerprintImp___block_invoke(uint64_t a1)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__MSCameraDeviceManager_getFingerprintImp___block_invoke_2;
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
  id v5 = [*(id *)(a1 + 64) remoteCameraWithFailureBlock:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__MSCameraDeviceManager_getFingerprintImp___block_invoke_3;
    v8[3] = &unk_1E63D7480;
    id v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 72);
    [v5 requestFingerprintForObjectHandle:v6 withReply:v8];
  }
}

uint64_t __43__MSCameraDeviceManager_getFingerprintImp___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -21400;
  return [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:*(void *)(a1 + 56) completionBlk:*(void *)(a1 + 64)];
}

void __43__MSCameraDeviceManager_getFingerprintImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectForKeyedSubscript:@"rc"];
  uint64_t v4 = (int)[v3 intValue];

  [*(id *)(a1 + 32) executeCompletionBlockWithErrorCode:v4 info:*(void *)(a1 + 40) file:*(void *)(a1 + 48) completionDict:v5 completionBlk:*(void *)(a1 + 56)];
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

- (void)notifyAddedItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = [(ICDeviceManager *)self deviceForConnection:v5];
  if (v18[5])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28B48];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__MSCameraDeviceManager_notifyAddedItems___block_invoke;
    v13[3] = &unk_1E63D74D0;
    id v15 = self;
    id v16 = &v17;
    id v14 = (__CFString *)v4;
    id v7 = [v6 blockOperationWithBlock:v13];
    [(ICDeviceManager *)self addInteractiveOperation:v7];

    id v8 = v14;
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"error" length] < 0x15)
    {
      id v8 = @"error";
    }
    else
    {
      id v9 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      id v8 = [v9 stringByAppendingString:@".."];
    }
    id v10 = [NSString stringWithFormat:@"the device is nil? how?"];
    id v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(__CFString *)v8 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      id v26 = v10;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v17, 8);
}

void __42__MSCameraDeviceManager_notifyAddedItems___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICMSObjectInfoArray"];
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
        id v7 = [[MSObjectInfoDataset alloc] initWithData:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        id v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "cameraFolderWithObjectID:", -[MSObjectInfoDataset parentObject](v7, "parentObject"));
        if (v7)
        {
          int v9 = [(MSObjectInfoDataset *)v7 associationType];
          id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v11 = [(MSObjectInfoDataset *)v7 objectHandle];
          if (v9 == 1)
          {
            uint64_t v12 = [v10 cameraFolderWithObjectID:v11];

            if (v12) {
              goto LABEL_16;
            }
            id v13 = [ICCameraFolder alloc];
            id v14 = [(MSObjectInfoDataset *)v7 filename];
            id v15 = [(ICCameraFolder *)v13 initWithName:v14 parentFolder:v8 device:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

            [*(id *)(a1 + 40) updateCameraFolder:v15 withInfo:v7];
            if (v8)
            {
              id v16 = v8;
              goto LABEL_19;
            }
            if ([(MSObjectInfoDataset *)v7 parentObject] == -2)
            {
              id v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_19:
              [v16 addFolder:v15];
            }
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addCameraFolderToIndex:v15];
          }
          else
          {
            uint64_t v17 = [v10 cameraFileWithObjectID:v11];

            if (v17) {
              BOOL v18 = 1;
            }
            else {
              BOOL v18 = v8 == 0;
            }
            if (v18)
            {
LABEL_16:
              objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setPreviouslyIndexed:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "previouslyIndexed") + 1);
              goto LABEL_22;
            }
            uint64_t v19 = [ICCameraFile alloc];
            uint64_t v20 = [(MSObjectInfoDataset *)v7 filename];
            id v15 = [(ICCameraFile *)v19 initWithName:v20 parentFolder:v8 device:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

            [*(id *)(a1 + 40) updateCameraFile:v15 withInfo:v7];
            [v8 addFile:v15];
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addCameraFileToIndex:v15];
            [v21 addObject:v15];
          }
        }
LABEL_22:
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
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__0;
  long long v23 = __Block_byref_object_dispose__0;
  id v24 = [(ICDeviceManager *)self deviceForConnection:v5];
  if (v20[5])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __44__MSCameraDeviceManager_notifyRemovedItems___block_invoke;
    id v16 = &unk_1E63D74F8;
    uint64_t v17 = (__CFString *)v4;
    BOOL v18 = &v19;
    id v7 = [v6 blockOperationWithBlock:&v13];
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v7, v13, v14, v15, v16);

    id v8 = v17;
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"error" length] < 0x15)
    {
      id v8 = @"error";
    }
    else
    {
      int v9 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      id v8 = [v9 stringByAppendingString:@".."];
    }
    id v10 = [NSString stringWithFormat:@"the device is nil? how?"];
    uint64_t v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(__CFString *)v8 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __44__MSCameraDeviceManager_notifyRemovedItems___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICObjectIDArray"];
  if (v2) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeItems:v2];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)notifyUpdatedItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__0;
  long long v23 = __Block_byref_object_dispose__0;
  id v24 = [(ICDeviceManager *)self deviceForConnection:v5];
  if (v20[5])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __44__MSCameraDeviceManager_notifyUpdatedItems___block_invoke;
    id v16 = &unk_1E63D74F8;
    uint64_t v17 = (__CFString *)v4;
    BOOL v18 = &v19;
    id v7 = [v6 blockOperationWithBlock:&v13];
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v7, v13, v14, v15, v16);

    id v8 = v17;
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"error" length] < 0x15)
    {
      id v8 = @"error";
    }
    else
    {
      int v9 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      id v8 = [v9 stringByAppendingString:@".."];
    }
    id v10 = [NSString stringWithFormat:@"the device is nil? how?"];
    uint64_t v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(__CFString *)v8 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v19, 8);
}

void __44__MSCameraDeviceManager_notifyUpdatedItems___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICObjectInfoUpdate"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = [v2 objectForKeyedSubscript:v7];
        int v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "cameraFileWithObjectID:", objc_msgSend(v7, "unsignedLongValue"));
        id v10 = v9;
        if (v9) {
          [v9 handleObjectInfoUpdate:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
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
  long long v22 = __Block_byref_object_copy__0;
  long long v23 = __Block_byref_object_dispose__0;
  id v24 = [(ICDeviceManager *)self deviceForConnection:v5];
  if (v20[5])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __38__MSCameraDeviceManager_notifyStatus___block_invoke;
    uint64_t v16 = &unk_1E63D74F8;
    uint64_t v17 = (__CFString *)v4;
    BOOL v18 = &v19;
    id v7 = [v6 blockOperationWithBlock:&v13];
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v7, v13, v14, v15, v16);

    id v8 = v17;
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"error" length] < 0x15)
    {
      id v8 = @"error";
    }
    else
    {
      int v9 = objc_msgSend(@"error", "substringWithRange:", 0, 18);
      id v8 = [v9 stringByAppendingString:@".."];
    }
    id v10 = [NSString stringWithFormat:@"the device is nil? how?"];
    long long v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(__CFString *)v8 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __38__MSCameraDeviceManager_notifyStatus___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40), "handleStatusNotification:");
  }
  return result;
}

- (void)updateCameraFolder:(id)a3 withInfo:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1C189FFC0]();
  id v7 = v5;
  objc_msgSend(v12, "setObjectHandle:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(v12, "setObjectID:", objc_msgSend(v7, "objectHandle"));
  id v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "captureDate_tvsec"));
  [v12 setCreationDate:v8];
  int v9 = (void *)MEMORY[0x1E4F1C9C8];
  unint64_t v10 = objc_msgSend(v7, "modificationDate_tvsec");

  long long v11 = [v9 dateWithTimeIntervalSince1970:(double)v10];
  [v12 setModificationDate:v11];
}

- (void)updateCameraFile:(id)a3 withInfo:(id)a4
{
  id v29 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1C189FFC0]();
  id v7 = v5;
  objc_msgSend(v29, "setObjectHandle:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(v29, "setObjectID:", objc_msgSend(v7, "objectHandle"));
  id v8 = [v7 filename];
  int v9 = [v8 pathExtension];
  unint64_t v10 = [v9 lowercaseString];

  if (v10)
  {
    long long v11 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v10];
  }
  else
  {
    long long v11 = 0;
  }
  id v12 = (void *)_gKnownRawExtensions;
  if (!_gKnownRawExtensions)
  {
    uint64_t v13 = (void *)CGImageSourceCopyTypeExtensions();
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v13];
    id v15 = (void *)_gKnownRawExtensions;
    _gKnownRawExtensions = v14;

    [(id)_gKnownRawExtensions removeObject:@"tif"];
    id v12 = (void *)_gKnownRawExtensions;
  }
  if ([v12 count] && objc_msgSend((id)_gKnownRawExtensions, "containsObject:", v10))
  {
    objc_msgSend(v29, "setRaw:", objc_msgSend((id)_gKnownRawExtensions, "containsObject:", v10));
LABEL_10:
    BOOL v18 = (void **)MEMORY[0x1E4F44400];
LABEL_15:
    uint64_t v19 = *v18;
    goto LABEL_16;
  }
  uint64_t v16 = _gImageIOSupportedFileExtensions;
  uint64_t v17 = [v10 lowercaseString];
  LOBYTE(v16) = [(id)v16 containsObject:v17];

  if (v16) {
    goto LABEL_10;
  }
  if (!v11
    || (uint64_t v19 = (void *)*MEMORY[0x1E4F44448], ([v11 conformsToType:*MEMORY[0x1E4F44448]] & 1) == 0)
    && (uint64_t v19 = (void *)*MEMORY[0x1E4F44330], ([v11 conformsToType:*MEMORY[0x1E4F44330]] & 1) == 0))
  {
    BOOL v18 = (void **)MEMORY[0x1E4F44378];
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v20 = [v19 identifier];
  [v29 setUTI:v20];

  objc_msgSend(v29, "setWidth:", objc_msgSend(v7, "imagePixWidth"));
  objc_msgSend(v29, "setHeight:", objc_msgSend(v7, "imagePixHeight"));
  objc_msgSend(v29, "setFileSize:", objc_msgSend(v7, "objectCompressedSize"));
  objc_msgSend(v29, "setHasThumbnail:", objc_msgSend(v7, "thumbCompressedSize") != 0);
  [v29 setHasMetadata:1];
  objc_msgSend(v29, "setParentID:", objc_msgSend(v7, "parentObject"));
  objc_msgSend(v29, "setLocked:", objc_msgSend(v7, "protectionStatus") != 0);
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "captureDate_tvsec"));
  [v29 setCreationDate:v21];
  long long v22 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "modificationDate_tvsec"));
  [v29 setModificationDate:v22];
  [v29 setFileCreationDate:v21];
  [v29 setFileModificationDate:v22];
  long long v23 = [v29 device];
  id v24 = [v23 transportType];
  if ([v24 isEqualToString:@"ICTransportTypeUSB"])
  {
    long long v25 = [v29 device];
    int v26 = [v25 isAppleDevice];

    if (v26)
    {
      id v27 = [v29 name];
      id v28 = strstr((char *)[v27 UTF8String], "_E");

      if (v28) {
        [v29 flagMediaMetadata:8];
      }
    }
  }
  else
  {
  }
}

- (CGSize)cropThumbSize:(CGSize)a3 fullSize:(CGSize)a4 finalSize:(CGSize)a5
{
  double v5 = a3.width / a3.height;
  double v6 = a4.width / a4.height;
  double v7 = vabdd_f64(v6, a3.width / a3.height);
  double v8 = 1.0;
  if (a3.width / a3.height <= 1.0 || v6 <= 1.0)
  {
    if (v5 < 1.0 && v6 < 1.0)
    {
      if (v7 > 0.0001)
      {
        a3.width = floor(a3.height * v6);
        double v8 = a5.height / a3.height;
      }
    }
    else if (v5 >= 1.0 || v6 <= 1.0)
    {
      if (v5 > 1.0 && v6 < 1.0)
      {
        if (v7 > 0.0001)
        {
          a3.height = floor(a3.width * v6);
          double v8 = a5.width / a3.width;
        }
      }
      else
      {
        BOOL v13 = v5 > 1.0 && v6 == 1.0;
        if (v13)
        {
          double v8 = a5.width / a3.width;
          a3.width = a3.height;
        }
        else if (v5 <= 1.0 && v6 == 1.0)
        {
          double v8 = a5.height / a3.height;
          a3.height = a3.width;
        }
      }
    }
    else if (v7 > 0.0001)
    {
      double v8 = a5.height / a3.height;
      a3.width = floor(a3.height / v6);
    }
  }
  else if (v7 > 0.0001)
  {
    double v8 = a5.width / a3.width;
    a3.height = floor(a3.width / v6);
  }
  double v15 = a3.height * v8;
  double v16 = floor(v15);
  double v17 = a3.width * v8;
  char v18 = vcvtmd_s64_f64(v15);
  double v19 = floor(v17);
  double v20 = v16 + -1.0;
  BOOL v13 = (v18 & 1) == 0;
  char v21 = vcvtmd_s64_f64(v17);
  if (v13) {
    double v20 = v16;
  }
  double v22 = v19 + -1.0;
  if ((v21 & 1) == 0) {
    double v22 = v19;
  }
  result.height = v20;
  result.width = v22;
  return result;
}

@end