@interface SFDownloadManager
@end

@implementation SFDownloadManager

void __35___SFDownloadManager_sharedManager__block_invoke()
{
  id v0 = [[_SFDownloadManager alloc] initAsReadonly:0];
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
}

void __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() downloadRepresentationsAtURL:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke_3;
  v12[3] = &unk_1E5C780C0;
  uint64_t v6 = *(void *)(a1 + 72);
  v12[4] = *(void *)(a1 + 32);
  v12[5] = v6;
  uint64_t v7 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v12);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  if (v10 != [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  v11 = *(void (***)(void))(a1 + 48);
  if (*(unsigned char *)(a1 + 80)) {
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  else {
    v11[2](*(void *)(a1 + 48));
  }
}

void __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count]
    && [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]) {
    [*(id *)(*(void *)(a1 + 32) + 8) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  [*(id *)(a1 + 32) _removeDeletedDownloads];
  [*(id *)(a1 + 32) _removeOldDownloadsAndUpdateTimerIfNeeded];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(*(void *)(a1 + 32) + 24) scheduleWrite];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
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
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "regenerateIconForSource:", *(void *)(*((void *)&v10 + 1) + 8 * v6++), (void)v10);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v7)
  {
    (*(void (**)(void))(v7 + 16))();
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

id __37___SFDownloadManager_initAsReadonly___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _dataForPersistingToHistory];

  return v2;
}

void __69___SFDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69___SFDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v3[3] = &unk_1E5C725B8;
  objc_copyWeak(&v4, v1);
  [WeakRetained getDownloadsWithCompletionHandler:v3];

  objc_destroyWeak(&v4);
}

void __69___SFDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeOldDownloadsAndUpdateTimerIfNeeded];
}

uint64_t __49___SFDownloadManager__dataForPersistingToHistory__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __43___SFDownloadManager_runningDownloadsCount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isIdle] ^ 1;
}

_SFDownload *__55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v6 = 0;
  id v3 = a2;
  id v4 = [[_SFDownload alloc] initWithDictionaryRepresentation:v3 didUpdateRepresentation:&v6];

  [(_SFDownload *)v4 setDelegate:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40)
                                                                                               + 8)
                                                                                   + 24) | v6) != 0;

  return v4;
}

uint64_t __56___SFDownloadManager_getDownloadsWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

BOOL __54___SFDownloadManager_removeDownloadsStartedAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 dateAdded];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == 1;

  return v4;
}

BOOL __45___SFDownloadManager__removeDeletedDownloads__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 4)
  {
    id v3 = [v2 completedFileURL];
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL __63___SFDownloadManager__removeOldDownloadsAndUpdateTimerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 dateFinished];
  if (v3)
  {
    [*(id *)(a1 + 32) timeIntervalSinceDate:v3];
    BOOL v5 = v4 >= *(double *)(a1 + 40);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __63___SFDownloadManager__removeOldDownloadsAndUpdateTimerIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeOldDownloadsAndUpdateTimerIfNeeded];
}

BOOL __36___SFDownloadManager__busyDownloads__block_invoke(uint64_t a1, void *a2)
{
  return [a2 state] == 1;
}

void __61___SFDownloadManager_downloadDidImportFileToDownloadsFolder___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = (uint64_t *)(a1 + 32);
  id v7 = 0;
  [v2 removeItemAtURL:v4 error:&v7];
  id v5 = v7;

  if (v5)
  {
    unsigned __int8 v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61___SFDownloadManager_downloadDidImportFileToDownloadsFolder___block_invoke_cold_1(v3, v6, v5);
    }
  }
}

void __67___SFDownloadManager_createDirectoryForDownload_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 createDirectoryAtURL:*(void *)(a1 + 32) withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) path];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

uint64_t __83___SFDownloadManager_downloadShouldContinueAfterReceivingResponse_decisionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _addDownload:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void __61___SFDownloadManager_downloadDidImportFileToDownloadsFolder___block_invoke_cold_1(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  id v5 = a2;
  unsigned __int8 v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138478083;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  long long v10 = v6;
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Failed to remove download container (%{private}@): %{public}@", (uint8_t *)&v7, 0x16u);
}

@end