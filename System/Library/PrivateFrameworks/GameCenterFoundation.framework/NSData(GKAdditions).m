@interface NSData(GKAdditions)
+ (id)_gkImageCachePathForURL:()GKAdditions subdirectory:filename:;
+ (uint64_t)imageDebugEnabled;
+ (void)_gkLoadRemoteImageDataForURL:()GKAdditions subdirectory:filename:queue:handler:;
+ (void)_gkLoadRemoteImageDataForUrl:()GKAdditions subdirectory:filename:queue:imageQueue:handler:;
+ (void)_gkRequestClientsRemoteImageDataForURL:()GKAdditions queue:reply:;
- (id)_gkAsHexString;
@end

@implementation NSData(GKAdditions)

+ (uint64_t)imageDebugEnabled
{
  if (imageDebugEnabled_onceToken != -1) {
    dispatch_once(&imageDebugEnabled_onceToken, &__block_literal_global_50);
  }
  return imageDebugEnabled_enabled;
}

+ (void)_gkRequestClientsRemoteImageDataForURL:()GKAdditions queue:reply:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = (id)MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
  }
  if ([MEMORY[0x1E4F1C9B8] imageDebugEnabled])
  {
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    v13 = (void *)os_log_GKHTTP;
    if (os_log_type_enabled((os_log_t)os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      *(_DWORD *)buf = 67109120;
      int v27 = GKAtomicIncrement32(imageLoadCount);
      _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "BEGIN daemon image load: (%d)", buf, 8u);
    }
  }
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "NSData+GKAdditions.m", 43, "+[NSData(GKAdditions) _gkRequestClientsRemoteImageDataForURL:queue:reply:]");
  v16 = +[GKDispatchGroup dispatchGroupWithName:v15];

  if (v8)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke;
    v22[3] = &unk_1E646E7B8;
    id v23 = v8;
    uint64_t v25 = a2;
    id v24 = v16;
    [v24 perform:v22];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_9;
  v19[3] = &unk_1E646DC30;
  id v20 = v16;
  id v21 = v10;
  id v17 = v16;
  id v18 = v10;
  [v17 notifyOnQueue:v9 block:v19];
}

+ (void)_gkLoadRemoteImageDataForURL:()GKAdditions subdirectory:filename:queue:handler:
{
  id v18 = a6;
  if (!v18)
  {
    id v18 = (id)MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
  }
  uint64_t v13 = _gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__onceToken;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  if (v13 != -1) {
    dispatch_once(&_gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__onceToken, &__block_literal_global_11_0);
  }
  [a1 _gkLoadRemoteImageDataForUrl:v17 subdirectory:v16 filename:v15 queue:v18 imageQueue:_gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__imageQueue handler:v14];
}

+ (void)_gkLoadRemoteImageDataForUrl:()GKAdditions subdirectory:filename:queue:imageQueue:handler:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v46 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v19 = GKOSLoggers();
    id v18 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v20 = v18;
    id v21 = [v13 absoluteString];
    *(_DWORD *)buf = 138412290;
    id v57 = v21;
    _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "_gkLoadRemoteImageDataForUrl: %@", buf, 0xCu);
  }
  id v22 = v14;
  if (_gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler__onceToken != -1) {
    dispatch_once(&_gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler__onceToken, &__block_literal_global_14_0);
  }
  id v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "NSData+GKAdditions.m", 121, "+[NSData(GKAdditions) _gkLoadRemoteImageDataForUrl:subdirectory:filename:queue:imageQueue:handler:]");
  id v24 = +[GKDispatchGroup dispatchGroupWithName:v23];

  uint64_t v25 = [v13 path];
  v26 = GKImageCacheRoot(&stru_1F1E47DF8);
  int v27 = [v25 hasPrefix:v26];

  uint64_t v28 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touchdowns on level 1\"";
  if (v13 && ([v13 _gkIsValidServerURL] | v27) == 1)
  {
    v29 = v22;
    v30 = [MEMORY[0x1E4F1C9B8] _gkImageCachePathForURL:v13 subdirectory:v22 filename:v46];
    if ([v30 containsString:@"../"])
    {
      if (!os_log_GKGeneral) {
        id v31 = GKOSLoggers();
      }
      v32 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        +[NSData(GKAdditions) _gkLoadRemoteImageDataForUrl:subdirectory:filename:queue:imageQueue:handler:]((uint64_t)v30, v32);
      }
    }
    else
    {
      v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v30];
      if ([v35 length])
      {
        [v24 setResult:v35];
        if (!os_log_GKGeneral) {
          id v36 = GKOSLoggers();
        }
        v37 = os_log_GKCache;
        if (os_log_type_enabled((os_log_t)os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
          +[NSData(GKAdditions) _gkLoadRemoteImageDataForUrl:v38 subdirectory:v39 filename:v40 queue:v41 imageQueue:v42 handler:v43];
        }
      }
      else
      {
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_23;
        v50[3] = &unk_1E646F940;
        id v51 = v30;
        id v52 = v16;
        id v53 = v24;
        id v54 = v13;
        id v55 = v15;
        [v53 perform:v50];
      }
      v29 = v22;
    }

    uint64_t v28 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touchdo"
          "wns on level 1\"";
  }
  else
  {
    v33 = os_log_GKGeneral;
    v29 = v22;
    if (!os_log_GKGeneral)
    {
      id v34 = GKOSLoggers();
      v33 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v13;
      _os_log_impl(&dword_1C2D22000, v33, OS_LOG_TYPE_INFO, "Image URL not HTTPS compliant, and not ImageCacheRoot for: %@", buf, 0xCu);
    }
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = *((void *)v28 + 462);
  v47[2] = __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_27;
  v47[3] = &unk_1E646DC30;
  id v48 = v24;
  id v49 = v17;
  id v44 = v24;
  id v45 = v17;
  [v44 notifyOnQueue:v15 block:v47];
}

+ (id)_gkImageCachePathForURL:()GKAdditions subdirectory:filename:
{
  id v7 = a3;
  id v8 = v7;
  if (a4 && a5)
  {
    id v9 = GKImageCachePathForSubdirectoryAndFilename(a4, a5);
  }
  else
  {
    id v10 = [v7 absoluteString];
    id v11 = GKImageCacheRoot(v10);
    id v12 = [v8 lastPathComponent];
    id v9 = [v11 stringByAppendingPathComponent:v12];
  }

  return v9;
}

- (id)_gkAsHexString
{
  v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    do
      objc_msgSend(v2, "appendFormat:", @"%02X", *(unsigned __int8 *)(v4 + v5++));
    while ([v3 length] > v5);
  }

  return v2;
}

+ (void)_gkLoadRemoteImageDataForUrl:()GKAdditions subdirectory:filename:queue:imageQueue:handler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "Illegal file cache path: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_gkLoadRemoteImageDataForUrl:()GKAdditions subdirectory:filename:queue:imageQueue:handler:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end