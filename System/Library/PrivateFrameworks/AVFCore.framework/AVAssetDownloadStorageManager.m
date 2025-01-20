@interface AVAssetDownloadStorageManager
+ (AVAssetDownloadStorageManager)sharedDownloadStorageManager;
- (AVAssetDownloadStorageManagementPolicy)storageManagementPolicyForURL:(NSURL *)downloadStorageURL;
- (AVAssetDownloadStorageManager)init;
- (void)dealloc;
- (void)setStorageManagementPolicy:(AVAssetDownloadStorageManagementPolicy *)storageManagementPolicy forURL:(NSURL *)downloadStorageURL;
@end

@implementation AVAssetDownloadStorageManager

- (AVAssetDownloadStorageManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVAssetDownloadStorageManager;
  v2 = [(AVAssetDownloadStorageManager *)&v4 init];
  if (v2) {
    v2->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avassetdownloadstoragemanager.ivars");
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_ivarAccessQueue);
  v3.receiver = self;
  v3.super_class = (Class)AVAssetDownloadStorageManager;
  [(AVAssetDownloadStorageManager *)&v3 dealloc];
}

+ (AVAssetDownloadStorageManager)sharedDownloadStorageManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AVAssetDownloadStorageManager_sharedDownloadStorageManager__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = a1;
  if (sharedDownloadStorageManager_sAVAssetDownloadStorageManager_Once != -1) {
    dispatch_once(&sharedDownloadStorageManager_sAVAssetDownloadStorageManager_Once, block);
  }
  return (AVAssetDownloadStorageManager *)sharedDownloadStorageManager_sDownloadStorageManager;
}

id __61__AVAssetDownloadStorageManager_sharedDownloadStorageManager__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedDownloadStorageManager_sDownloadStorageManager = (uint64_t)result;
  return result;
}

- (void)setStorageManagementPolicy:(AVAssetDownloadStorageManagementPolicy *)storageManagementPolicy forURL:(NSURL *)downloadStorageURL
{
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (!storageManagementPolicy)
  {
    v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    v31 = "storageManagementPolicy != nil";
LABEL_10:
    uint64_t v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)v31);
    v33 = v29;
    uint64_t v34 = v30;
    goto LABEL_14;
  }
  if (!downloadStorageURL)
  {
    v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    v31 = "downloadStorageURL != nil";
    goto LABEL_10;
  }
  if (!v8)
  {
    v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    v31 = "bundleIdentifier != nil";
    goto LABEL_10;
  }
  v15 = (void *)v9;
  if (![(NSURL *)downloadStorageURL isFileURL])
  {
    v35 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v36 = *MEMORY[0x1E4F1C3B8];
    uint64_t v37 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not a fileURL %@", v16, v17, v18, v19, v20, (uint64_t)downloadStorageURL);
LABEL_13:
    uint64_t v32 = v37;
    v33 = v35;
    uint64_t v34 = v36;
LABEL_14:
    objc_exception_throw((id)[v33 exceptionWithName:v34 reason:v32 userInfo:0]);
  }
  if ((objc_msgSend(v15, "fileExistsAtPath:", -[NSURL path](downloadStorageURL, "path")) & 1) == 0)
  {
    v35 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v36 = *MEMORY[0x1E4F1C3B8];
    uint64_t v37 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"No file at %@", v21, v22, v23, v24, v25, (uint64_t)downloadStorageURL);
    goto LABEL_13;
  }
  v26 = [(AVAssetDownloadStorageManagementPolicy *)storageManagementPolicy expirationDate];
  v27 = [(AVAssetDownloadStorageManagementPolicy *)storageManagementPolicy priority];
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVAssetDownloadStorageManager_setStorageManagementPolicy_forURL___block_invoke;
  block[3] = &unk_1E57B3248;
  block[4] = v26;
  void block[5] = downloadStorageURL;
  block[6] = v8;
  block[7] = v27;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void *__67__AVAssetDownloadStorageManager_setStorageManagementPolicy_forURL___block_invoke(void *a1)
{
  if (!a1[4] || (id result = (void *)FigAssetDownloadStorageManagementSetExpirationDateForAssetAtURL(), !result))
  {
    id result = (void *)a1[7];
    if (result)
    {
      uint64_t v3 = [result isEqualToString:@"important"];
      uint64_t v4 = a1[5];
      uint64_t v5 = a1[6];
      return (void *)MEMORY[0x1F40ED1B8](v4, v5, v3);
    }
  }
  return result;
}

- (AVAssetDownloadStorageManagementPolicy)storageManagementPolicyForURL:(NSURL *)downloadStorageURL
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  v7 = objc_alloc_init(AVMutableAssetDownloadStorageManagementPolicy);
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (!downloadStorageURL)
  {
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    v29 = "downloadStorageURL != nil";
LABEL_8:
    uint64_t v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)v29);
    v31 = v27;
    uint64_t v32 = v28;
    goto LABEL_12;
  }
  if (!v6)
  {
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    v29 = "bundleIdentifier != nil";
    goto LABEL_8;
  }
  uint64_t v14 = (void *)v8;
  if (![(NSURL *)downloadStorageURL isFileURL])
  {
    v33 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v34 = *MEMORY[0x1E4F1C3B8];
    uint64_t v35 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not a fileURL %@", v15, v16, v17, v18, v19, (uint64_t)downloadStorageURL);
LABEL_11:
    uint64_t v30 = v35;
    v31 = v33;
    uint64_t v32 = v34;
LABEL_12:
    objc_exception_throw((id)[v31 exceptionWithName:v32 reason:v30 userInfo:0]);
  }
  if ((objc_msgSend(v14, "fileExistsAtPath:", -[NSURL path](downloadStorageURL, "path")) & 1) == 0)
  {
    v33 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v34 = *MEMORY[0x1E4F1C3B8];
    uint64_t v35 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"No file at %@", v20, v21, v22, v23, v24, (uint64_t)downloadStorageURL);
    goto LABEL_11;
  }
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVAssetDownloadStorageManager_storageManagementPolicyForURL___block_invoke;
  block[3] = &unk_1E57B3248;
  block[4] = downloadStorageURL;
  void block[5] = v6;
  block[6] = 0;
  block[7] = v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  return (AVAssetDownloadStorageManagementPolicy *)v7;
}

uint64_t __63__AVAssetDownloadStorageManager_storageManagementPolicyForURL___block_invoke(uint64_t a1)
{
  v2 = (void *)(a1 + 48);
  uint64_t result = FigAssetDownloadStorageManagementCopyExpirationDateForAssetAtURL();
  if (!result)
  {
    uint64_t result = FigAssetDownloadStorageManagementCopyPriorityForAssetAtURL();
    if (!result)
    {
      if (*v2) {
        objc_msgSend(*(id *)(a1 + 56), "setExpirationDate:");
      }
      return [*(id *)(a1 + 56) setPriority:@"default"];
    }
  }
  return result;
}

@end