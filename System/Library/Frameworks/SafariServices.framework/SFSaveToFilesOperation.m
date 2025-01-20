@interface SFSaveToFilesOperation
@end

@implementation SFSaveToFilesOperation

uint64_t __32___SFSaveToFilesOperation_start__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32___SFSaveToFilesOperation_start__block_invoke_2;
  v3[3] = &unk_1E5C77D58;
  v3[4] = v1;
  return [v1 _copyFileData:v3];
}

void __32___SFSaveToFilesOperation_start__block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32___SFSaveToFilesOperation_start__block_invoke_3;
  v12[3] = &unk_1E5C75148;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v7;
  uint64_t v14 = v9;
  id v15 = v8;
  char v16 = a4;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __32___SFSaveToFilesOperation_start__block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3) {
    return [v2 _showDocumentPickerForFileURL:v3 sourceURL:*(void *)(a1 + 48) willStartDownload:*(unsigned __int8 *)(a1 + 56)];
  }
  else {
    return objc_msgSend(v2, "_finishWithURL:");
  }
}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___SFSaveToFilesOperation__copyFileData___block_invoke_2;
  block[3] = &unk_1E5C73960;
  id v7 = v3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_2(uint64_t a1)
{
  id v6 = *(id *)(a1 + 32);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v3 = *(void *)(a1 + 48);
  if (isKindOfClass)
  {
    id v4 = [*(id *)(*(void *)(a1 + 40) + 8) webView];
    id v5 = [v4 _committedURL];
    (*(void (**)(uint64_t, id, void *, void))(v3 + 16))(v3, v6, v5, 0);
  }
  else
  {
    (*(void (**)(void, void, void, void))(v3 + 16))(*(void *)(a1 + 48), 0, 0, 0);
  }
}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __41___SFSaveToFilesOperation__copyFileData___block_invoke_3_cold_2(v7);
    }
  }
  uint64_t v8 = NSString;
  id v9 = [a1[4] suggestedName];
  id v10 = [v8 stringWithFormat:@"%@.pdf", v9];

  id v11 = [a1[5] _temporaryFileWithName:v10];
  id v21 = v6;
  int v12 = [v5 writeToURL:v11 options:0 error:&v21];
  id v13 = v21;

  if (v12)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41___SFSaveToFilesOperation__copyFileData___block_invoke_22;
    block[3] = &unk_1E5C733F8;
    id v20 = a1[6];
    id v14 = v11;
    id v15 = a1[5];
    id v18 = v14;
    id v19 = v15;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    char v16 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __41___SFSaveToFilesOperation__copyFileData___block_invoke_3_cold_1(v16);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_22(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = a1[4];
  id v4 = [*(id *)(a1[5] + 8) webView];
  uint64_t v3 = [v4 _committedURL];
  (*(void (**)(uint64_t, uint64_t, void *, void))(v1 + 16))(v1, v2, v3, 0);
}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_3_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to save PDF data to disk: %{public}@", v6, v7, v8, v9, v10);
}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_3_cold_2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Unable to generate a PDF representation of the webpage: %{public}@", v6, v7, v8, v9, v10);
}

@end