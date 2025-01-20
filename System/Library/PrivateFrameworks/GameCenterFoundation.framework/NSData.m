@interface NSData
@end

@implementation NSData

BOOL __40__NSData_GKAdditions__imageDebugEnabled__block_invoke()
{
  BOOL result = os_log_is_debug_enabled((os_log_t)os_log_GKHTTP);
  imageDebugEnabled_enabled = result;
  return result;
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = GKGetRuntimeStrategy();
  v5 = [v4 instrumentedURLSession];

  v6 = [MEMORY[0x1E4F290D0] requestWithURL:*(void *)(a1 + 32)];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2;
  v12 = &unk_1E6471270;
  uint64_t v16 = *(void *)(a1 + 48);
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = v3;
  id v7 = v3;
  v8 = [v5 dataTaskWithRequest:v6 completionHandler:&v9];
  objc_msgSend(v8, "resume", v9, v10, v11, v12);
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (!os_log_GKGeneral) {
      id v10 = GKOSLoggers();
    }
    v11 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_4(a1, v11, (uint64_t)v9);
      if (!v7) {
        goto LABEL_15;
      }
    }
    else if (!v7)
    {
      goto LABEL_15;
    }
    v12 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v13 = GKOSLoggers();
      v12 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_3(v12);
    }
  }
  else if (!v7)
  {
    if (!os_log_GKGeneral) {
      id v14 = GKOSLoggers();
    }
    id v15 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_2(a1, v15);
    }
  }
LABEL_15:
  id v16 = v8;
  if ([v16 statusCode] == 200)
  {
    [*(id *)(a1 + 40) setResult:v7];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    v18 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_1(a1, v18, v16);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_9(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1C9B8] imageDebugEnabled])
  {
    if (!os_log_GKGeneral) {
      id v2 = GKOSLoggers();
    }
    id v3 = (void *)os_log_GKHTTP;
    if (os_log_type_enabled((os_log_t)os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      v7[0] = 67109120;
      v7[1] = GKAtomicDecrement32(imageLoadCount);
      _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "END image load: (%d)", (uint8_t *)v7, 8u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    v6 = [*(id *)(a1 + 32) result];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

uint64_t __88__NSData_GKAdditions___gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__imageQueue;
  _gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__imageQueue = (uint64_t)v0;

  id v2 = (void *)_gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__imageQueue;

  return [v2 setMaxConcurrentOperationCount:20];
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  if (([v1 _gkIsGameCenter] & 1) != 0
    || ([v1 _gkIsGameCenterExtension] & 1) != 0
    || [v1 _gkIsGameDaemon])
  {
    id v0 = (void *)[objc_alloc(MEMORY[0x1E4F29078]) initWithMemoryCapacity:0 diskCapacity:0 diskPath:&stru_1F1E47DF8];
    [MEMORY[0x1E4F29078] setSharedURLCache:v0];
  }
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  uint64_t v5 = os_log_GKCache;
  if (os_log_type_enabled((os_log_t)os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_23_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
  }
  if ([MEMORY[0x1E4F1C9B8] imageDebugEnabled])
  {
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    id v13 = (void *)os_log_GKHTTP;
    if (os_log_type_enabled((os_log_t)os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      id v14 = v13;
      *(_DWORD *)buf = 67109120;
      int v24 = GKAtomicIncrement32(imageLoadCount);
      _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "BEGIN image load: (%d)", buf, 8u);
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_24;
  v17[3] = &unk_1E64712C0;
  id v15 = *(void **)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 32);
  id v22 = v3;
  id v20 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 64);
  id v16 = v3;
  [v15 addOperationWithBlock:v17];
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_24(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2;
  aBlock[3] = &unk_1E6471298;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 64);
  id v2 = _Block_copy(aBlock);
  id v3 = GKGetRuntimeStrategy();
  [v3 requestClientsRemoteImageDataForURL:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) reply:v2];
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([MEMORY[0x1E4F1C9B8] imageDebugEnabled])
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    id v5 = (void *)os_log_GKHTTP;
    if (os_log_type_enabled((os_log_t)os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      *(_DWORD *)buf = 67109120;
      int v29 = GKAtomicDecrement32(imageLoadCount);
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "END image load: (%d)", buf, 8u);
    }
  }
  [*(id *)(a1 + 32) setResult:v3];
  if (v3)
  {
    id v7 = (void **)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 40) stringByDeletingLastPathComponent];
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v27 = 0;
    char v10 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v27];
    id v11 = v27;

    if ((v10 & 1) == 0)
    {
      if (!os_log_GKGeneral) {
        id v12 = GKOSLoggers();
      }
      id v13 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_3((uint64_t)v11, v13);
      }
    }
    id v14 = *v7;
    id v26 = 0;
    [v3 writeToFile:v14 options:1 error:&v26];
    id v15 = v26;
    if (v15)
    {
      if (!os_log_GKGeneral) {
        id v16 = GKOSLoggers();
      }
      id v17 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_2((uint64_t *)(a1 + 40), (uint64_t)v15, v17);
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v18 = GKOSLoggers();
      }
      id v19 = os_log_GKCache;
      if (os_log_type_enabled((os_log_t)os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
        __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_1(a1 + 40, v19, v20, v21, v22, v23, v24, v25);
      }
      _gkMarkFileAsPurgeable(*v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_27(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) result];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = *(const char **)(a1 + 56);
  id v6 = a2;
  id v7 = NSStringFromSelector(v5);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "statusCode"));
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = 138412802;
  id v11 = v7;
  __int16 v12 = 2112;
  id v13 = v8;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  _os_log_error_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_ERROR, "%@: Did not receive http status OK (received %@) for url: %@", (uint8_t *)&v10, 0x20u);
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *(const char **)(a1 + 56);
  id v3 = a2;
  id v4 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_ERROR, "%@:%@: no image data received, but no error received either", v5, 0x16u);
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "   but we received image data anyway", v1, 2u);
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = *(const char **)(a1 + 56);
  id v5 = a2;
  uint64_t v6 = NSStringFromSelector(v4);
  OUTLINED_FUNCTION_1_3();
  __int16 v9 = v7;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_ERROR, "%@:%@: error loading image data:%@", v8, 0x20u);
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_23_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_2(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "Error writing image data to image cache %@: %@", (uint8_t *)&v4, 0x16u);
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "_gkLoadRemoteImageDataForUrl:subdirectory:filename:queue:imageQueue:handler: error creating directory:%@", (uint8_t *)&v2, 0xCu);
}

@end