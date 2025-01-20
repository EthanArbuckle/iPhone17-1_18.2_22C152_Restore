@interface SFDownload
@end

@implementation SFDownload

void __27___SFDownload__sharedQueue__block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mobilesafari.SFDownloadFileQueue", v0);
  v2 = (void *)_sharedQueue_queue;
  _sharedQueue_queue = (uint64_t)v1;
}

void __29___SFDownload_removeFromDisk__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void __29___SFDownload_removeFromDisk__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  char v4 = [v2 removeItemAtPath:v3 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0 && (objc_msgSend(v5, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F281F8], 4) & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __29___SFDownload_removeFromDisk__block_invoke_2_cold_1(a1, v6);
    }
  }
  [*(id *)(a1 + 48) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
}

void __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_3;
  v8 = &unk_1E5C72238;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  objc_msgSend(v3, "safari_accessingSecurityScopedResource:", &v5);
  objc_msgSend(*(id *)(a1 + 48), "endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v5, v6, v7, v8);
}

void __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_3_cold_1(a1, v6);
    }
  }
}

void __21___SFDownload_cancel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  char v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F289A0];
  id v6 = a2;
  id v7 = [v4 errorWithDomain:v5 code:-999 userInfo:0];
  [v2 download:v3 didFailWithError:v7 resumeData:v6];
}

void __31___SFDownload_resumeInWebView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 8);
    int v15 = 138543618;
    uint64_t v16 = v5;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_INFO, "%{public}@: resumed download %{public}@", (uint8_t *)&v15, 0x16u);
  }
  [*(id *)(a1 + 32) setWKDownload:v3];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = 0;

  *(void *)(*(void *)(a1 + 32) + 192) = 1;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 208);
  *(void *)(v10 + 208) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"_SFDownloadDidStartNotification" object:*(void *)(a1 + 32)];

  v13 = +[_SFDownloadDispatcher sharedDownloadDispatcher];
  [v13 registerResumedDownload:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _reportUpdatedProgressNow];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 224));
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained downloadDidResume:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained downloadDidStart:*(void *)(a1 + 32)];
  }
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v26 = 0;
  char v4 = [v2 writeToURL:v3 options:1 error:&v26];
  id v5 = v26;
  if (v4)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *MEMORY[0x1E4F1C780];
    id v25 = v5;
    char v8 = [v6 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v7 error:&v25];
    id v9 = v25;

    if ((v8 & 1) == 0)
    {
      uint64_t v10 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __42___SFDownload__importPlaceholderIfNeeded___block_invoke_cold_1(a1, v10);
      }
    }
    if (*(void *)(a1 + 56))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke_136;
      block[3] = &unk_1E5C75F00;
      v11 = *(void **)(a1 + 56);
      block[4] = *(void *)(a1 + 48);
      id v22 = v11;
      id v23 = *(id *)(a1 + 40);
      id v24 = *(id *)(a1 + 64);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v14;
        _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_INFO, "%{public}@: using DOCDownloadImportManager", buf, 0xCu);
      }
      id v15 = objc_alloc_init(MEMORY[0x1E4F5F7C0]);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke_141;
      v18[3] = &unk_1E5C78810;
      int8x16_t v17 = *(int8x16_t *)(a1 + 40);
      id v16 = (id)v17.i64[0];
      int8x16_t v19 = vextq_s8(v17, v17, 8uLL);
      id v20 = *(id *)(a1 + 64);
      [v15 importPlaceholderAtURLToDownloadsDirectory:v16 completion:v18];
    }
    id v5 = v9;
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __42___SFDownload__importPlaceholderIfNeeded___block_invoke_cold_2(a1, v12);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_136(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "%{public}@: using custom placeholder importer", buf, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  char v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke_137;
  v8[3] = &unk_1E5C787E8;
  id v9 = v6;
  id v7 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v7;
  [v4 importPlaceholderForDownload:v5 fromURL:v9 completionHandler:v8];
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_137(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = +[_SFDownload _sharedQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke_138;
    v10[3] = &unk_1E5C76EE0;
    v10[4] = *(void *)(a1 + 40);
    id v11 = v3;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v4, v10);
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = *(void *)(a1 + 32);
    id v13 = 0;
    char v7 = [v5 removeItemAtURL:v6 error:&v13];
    id v8 = v13;

    if ((v7 & 1) == 0)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __42___SFDownload__importPlaceholderIfNeeded___block_invoke_137_cold_1(v9);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __42___SFDownload__importPlaceholderIfNeeded___block_invoke_138(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didImportPlaceholderAtURL:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_141(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!a2 || v5)
  {
    char v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __42___SFDownload__importPlaceholderIfNeeded___block_invoke_141_cold_1(a1, v7);
    }
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 removeItemAtURL:*(void *)(a1 + 40) error:0];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _didImportPlaceholderAtURL:a2 completionHandler:*(void *)(a1 + 48)];
  }
}

void __60___SFDownload__didImportPlaceholderAtURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[SFDownloadFile alloc] initWithURL:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __60___SFDownload__didImportPlaceholderAtURL_completionHandler___block_invoke_143(void *a1)
{
  objc_storeStrong((id *)(a1[4] + 80), *(id *)(*(void *)(a1[6] + 8) + 40));
  objc_msgSend(*(id *)(a1[4] + 80), "setDelegate:");
  id v2 = *(uint64_t (**)(void))(a1[5] + 16);

  return v2();
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_cold_1(a1, v2);
  }
  uint64_t v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_147(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F5F7C0]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_2;
  v5[3] = &unk_1E5C78888;
  long long v6 = *(_OWORD *)(a1 + 48);
  [v2 replacePlaceholder:v3 withFinalFileURL:v4 completionHandler:v5];
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_2_cold_1(a1, v8);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_148;
  v9[3] = &unk_1E5C72E38;
  long long v10 = *(_OWORD *)(a1 + 32);
  [(id)v10 _didImportFileAtURL:v5 completionHandler:v9];
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_148(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: ending background task %u", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v5 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyDelegateOfFinishedDownload];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = *MEMORY[0x1E4F1C780];
  id v13 = 0;
  char v4 = [v2 setResourceValue:MEMORY[0x1E4F1CC28] forKey:v3 error:&v13];
  id v5 = v13;
  if ((v4 & 1) == 0)
  {
    int v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2_cold_1((uint64_t)a1, v6);
    }
  }
  uint64_t v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v7 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_149(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyDelegateOfFinishedDownload];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2_150(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;

  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = 0;

  int v6 = [[SFDownloadFile alloc] initWithURL:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 88);
  *(void *)(v7 + 88) = v6;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setDelegate:");
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 224));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained downloadDidImportFileToDownloadsFolder:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) _notifyDelegateOfFinishedDownload];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __41___SFDownload_downloadFileWillBeDeleted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F289A0];
  id v6 = a2;
  id v7 = [v4 errorWithDomain:v5 code:-999 userInfo:0];
  [v2 download:v3 didFailWithError:v7 resumeData:v6];
}

void __67___SFDownload_download_didReceivePlaceholderURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67___SFDownload_download_didReceivePlaceholderURL_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5C737D0;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v3 _didImportPlaceholderAtURL:v5 completionHandler:v4];
}

void __67___SFDownload_download_didReceivePlaceholderURL_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67___SFDownload_download_didReceivePlaceholderURL_completionHandler___block_invoke_2_cold_1(a1, v3);
    }
  }
  dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
}

uint64_t __43___SFDownload_download_didReceiveFinalURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didImportFileAtURL:*(void *)(a1 + 40) completionHandler:&__block_literal_global_221];
}

void __81___SFDownload_download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __81___SFDownload_download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __81___SFDownload_download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_227(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __81___SFDownload_download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_227_cold_1(a1, a2, v4);
  }
  return [*(id *)(a1 + 32) _continueAfterDownloadConfirmation:a2 destinationCompletionHandler:*(void *)(a1 + 40)];
}

void __79___SFDownload__continueAfterDownloadConfirmation_destinationCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79___SFDownload__continueAfterDownloadConfirmation_destinationCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5C76EE0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __79___SFDownload__continueAfterDownloadConfirmation_destinationCompletionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    [v2 stringByAppendingPathComponent:*(void *)(a1[5] + 96)];
  }
  else {
  uint64_t v3 = [(id)objc_opt_class() downloadDestinationPathWithFilename:*(void *)(a1[5] + 96)];
  }
  uint64_t v4 = a1[5];
  id v5 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = v3;

  id v6 = (void *)a1[5];
  uint64_t v7 = a1[6];

  return [v6 _continueAfterDecidingFileDownloadPath:v7];
}

void __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke_2;
  block[3] = &unk_1E5C78900;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) URL];
    uint64_t v3 = v2;
    if (v2)
    {
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke_3;
      id v10 = &unk_1E5C72238;
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = v2;
      objc_msgSend(v12, "safari_accessingSecurityScopedResource:", &v7);
    }
    uint64_t v4 = *(void *)(a1 + 40);
    char v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", *(void *)(*(void *)(a1 + 32) + 128), 0, v7, v8, v9, v10, v11);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _validateSandboxAccessToURL:*(void *)(a1 + 40)];
}

uint64_t __62___SFDownload_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  uint64_t v4 = [*(id *)(a1 + 40) completedUnitCount];
  uint64_t v5 = [*(id *)(a1 + 40) totalUnitCount];

  return [v2 download:v3 didWriteTotalBytes:v4 totalBytesExpectedToWrite:v5];
}

void __29___SFDownload_removeFromDisk__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_6_0(&dword_1A690B000, v5, v6, "%{public}@: failed to remove file: %{public}@", v7, v8, v9, v10, v11);
}

void __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v5, v6, "%{public}@: failed to remove placeholder: %{public}@", v7, v8, v9, v10, v11);
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v5, v6, "%{public}@: failed to mark placeholder non-syncable: %{public}@", v7, v8, v9, v10, v11);
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v5, v6, "%{public}@: failed to create placeholder: %{public}@", v7, v8, v9, v10, v11);
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_137_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to delete placeholder that couldn't be imported: %{public}@", v6, v7, v8, v9, v10);
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_141_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v5, v6, "%{public}@: failed to import placeholder: %{public}@", v7, v8, v9, v10, v11);
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_fault_impl(&dword_1A690B000, a2, OS_LOG_TYPE_FAULT, "%{public}@: import background task ran past expiration: %u", (uint8_t *)&v4, 0x12u);
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v5, v6, "%{public}@: failed to import finished download: %{public}@", v7, v8, v9, v10, v11);
}

void __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v5, v6, "%{public}@: failed to mark completed download as syncable: %{public}@", v7, v8, v9, v10, v11);
}

void __67___SFDownload_download_didReceivePlaceholderURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138739971;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "_didImportPlaceholderAtURL failed for url: %{sensitive}@", (uint8_t *)&v3, 0xCu);
}

void __81___SFDownload_download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_2() path];
  uint64_t v6 = [v5 stringByDeletingLastPathComponent];
  int v7 = 138543618;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1A690B000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: decided destination. directory=%{public}@", (uint8_t *)&v7, 0x16u);
}

void __81___SFDownload_download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_227_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = @"NO";
  if (a2) {
    id v4 = @"YES";
  }
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_0_7();
  _os_log_debug_impl(&dword_1A690B000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: delegate decided to continue: %{public}@", v6, 0x16u);
}

@end