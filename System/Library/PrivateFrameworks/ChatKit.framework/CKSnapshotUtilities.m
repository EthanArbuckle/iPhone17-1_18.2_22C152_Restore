@interface CKSnapshotUtilities
+ (BOOL)shouldInvertSnapshots;
+ (BOOL)snapshotExistsForGUID:(id)a3;
+ (id)_invertImage:(id)a3;
+ (id)_snapshotAtURL:(id)a3;
+ (id)_snapshotForGUID:(id)a3;
+ (id)_snapshotViewForGUID:(id)a3;
+ (id)snapshotForGUID:(id)a3;
+ (id)snapshotKeyWithGuid:(id)a3;
+ (int64_t)_convertUserInterfaceStyle:(int64_t)a3;
+ (void)_cacheSnapshotView:(id)a3 forGUID:(id)a4;
+ (void)_saveSnapshot:(id)a3 url:(id)a4;
+ (void)cacheSnapshot:(id)a3 guid:(id)a4 postChangeNotification:(BOOL)a5;
@end

@implementation CKSnapshotUtilities

+ (int64_t)_convertUserInterfaceStyle:(int64_t)a3
{
  int64_t result = a3;
  if ((unint64_t)a3 >= 3)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Missing a new UIUserInterfaceStyle - we rely on IMUserInterfaceStyleMax to delete all cached snapshots on disk", v5, 2u);
      }
    }
    return 1;
  }
  return result;
}

+ (id)snapshotKeyWithGuid:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F43058];
  id v4 = a3;
  v5 = [v3 keyWindow];
  v6 = [v5 traitCollection];
  int64_t v7 = +[CKSnapshotUtilities _convertUserInterfaceStyle:](CKSnapshotUtilities, "_convertUserInterfaceStyle:", [v6 userInterfaceStyle]);

  v8 = [NSString stringWithFormat:@"%@-%d", v4, v7];

  return v8;
}

+ (void)cacheSnapshot:(id)a3 guid:(id)a4 postChangeNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = +[CKPreviewDispatchCache snapshotCache];
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__CKSnapshotUtilities_cacheSnapshot_guid_postChangeNotification___block_invoke;
    block[3] = &unk_1E5620C40;
    id v20 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v11 = +[CKSnapshotUtilities snapshotKeyWithGuid:v9];
  [v10 setCachedPreview:v8 key:v11];
  v12 = IMPluginSnapshotCachesFileURL();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__CKSnapshotUtilities_cacheSnapshot_guid_postChangeNotification___block_invoke_2;
  v15[3] = &unk_1E5620E38;
  id v17 = v8;
  id v18 = a1;
  id v16 = v12;
  id v13 = v8;
  id v14 = v12;
  [v10 enqueueSaveBlock:v15 withPriority:0];
}

void __65__CKSnapshotUtilities_cacheSnapshot_guid_postChangeNotification___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v5 = @"CKSnapshotChangedMessageGUIDKey";
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"CKSnapshotChangedNotification" object:0 userInfo:v4];
}

uint64_t __65__CKSnapshotUtilities_cacheSnapshot_guid_postChangeNotification___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 48), "_saveSnapshot:url:", *(void *)(result + 40));
  }
  return result;
}

+ (BOOL)shouldInvertSnapshots
{
  v2 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v3 = [v2 isInternalInstall];

  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"InvertPluginSnapshots"];

  return v3 & v5;
}

+ (id)snapshotForGUID:(id)a3
{
  id v4 = a3;
  int v5 = [a1 shouldInvertSnapshots];
  v6 = [a1 _snapshotForGUID:v4];

  if (v5)
  {
    uint64_t v7 = [a1 _invertImage:v6];

    v6 = (void *)v7;
  }

  return v6;
}

+ (id)_invertImage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithImage:v3];
  int v5 = [MEMORY[0x1E4F1E040] colorInvertFilter];
  v6 = v5;
  if (v5)
  {
    [v5 setValue:v4 forKey:*MEMORY[0x1E4F1E480]];
    uint64_t v7 = [v6 outputImage];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
      [v7 extent];
      id v9 = (const void *)objc_msgSend(v8, "createCGImage:fromRect:", v7);
      v10 = (void *)MEMORY[0x1E4F42A80];
      [v3 scale];
      objc_msgSend(v10, "imageWithCGImage:scale:orientation:", v9, objc_msgSend(v3, "imageOrientation"), v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v9) {
        CFRelease(v9);
      }
    }
    else
    {
      id v12 = v3;
    }
  }
  else
  {
    id v12 = v3;
  }

  return v12;
}

+ (id)_snapshotForGUID:(id)a3
{
  id v3 = 0;
  if (a3 && !__CurrentTestName)
  {
    int v5 = +[CKSnapshotUtilities snapshotKeyWithGuid:](CKSnapshotUtilities, "snapshotKeyWithGuid:");
    v6 = +[CKPreviewDispatchCache snapshotCache];
    uint64_t v7 = [v6 cachedPreviewForKey:v5];
    if (v7)
    {
      id v3 = v7;
    }
    else
    {
      id v8 = IMPluginSnapshotCachesFileURL();
      id v3 = [a1 _snapshotAtURL:v8];
      if (v3)
      {
        [v6 setCachedPreview:v3 key:v5];
        id v9 = v3;
      }
    }
  }

  return v3;
}

+ (BOOL)snapshotExistsForGUID:(id)a3
{
  char v3 = 0;
  if (a3 && !__CurrentTestName)
  {
    id v4 = +[CKSnapshotUtilities snapshotKeyWithGuid:](CKSnapshotUtilities, "snapshotKeyWithGuid:");
    int v5 = +[CKPreviewDispatchCache snapshotCache];
    v6 = [v5 cachedPreviewForKey:v4];
    if (v6) {
      char v3 = 1;
    }
    else {
      char v3 = IMPluginSnapshotExistsInCache();
    }
  }
  return v3;
}

+ (void)_cacheSnapshotView:(id)a3 forGUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[CKPreviewDispatchCache snapshotCache];
  uint64_t v7 = +[CKSnapshotUtilities snapshotKeyWithGuid:v5];

  [v8 setCachedPreview:v6 key:v7];
}

+ (id)_snapshotViewForGUID:(id)a3
{
  char v3 = +[CKSnapshotUtilities snapshotKeyWithGuid:a3];
  id v4 = +[CKPreviewDispatchCache snapshotCache];
  id v5 = [v4 cachedPreviewForKey:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (void)_saveSnapshot:(id)a3 url:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v5;
    id v8 = v6;
    im_perform_with_task_assertion();
  }
}

void __41__CKSnapshotUtilities__saveSnapshot_url___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = CKUIImageJPEGRepresentationWithHardwareAcceleration();
  if (v2)
  {
    char v3 = [*(id *)(a1 + 40) URLByDeletingLastPathComponent];
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = 0;
    char v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v6 = v10;

    if ((v5 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(3);
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v12 = v3;
          __int16 v13 = 2112;
          id v14 = v6;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to create preview directory URL: %@ with error: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
        _CKLogExternal();
      }
    }
    CKFreeSpaceWriteDataToURL(v2, *(void **)(a1 + 40), 1);
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(3);
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Preview saved to %@.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
    _CKLogExternal();
  }
}

+ (id)_snapshotAtURL:(id)a3
{
  id v3 = a3;
  if (v3
    && (uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v3 options:1 error:0]) != 0)
  {
    char v5 = (void *)v4;
    id v6 = [MEMORY[0x1E4F42A80] ckImageWithData:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end