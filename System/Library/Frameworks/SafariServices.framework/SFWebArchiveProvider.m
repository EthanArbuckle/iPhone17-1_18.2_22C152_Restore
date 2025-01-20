@interface SFWebArchiveProvider
@end

@implementation SFWebArchiveProvider

void __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    v5 = WeakRetained;
    if (!WeakRetained)
    {
      v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_SFWebArchiveErrorDomain" code:1 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_10;
    }
    v6 = [WeakRetained _MIMEType];
    v7 = [*(id *)(a1 + 32) _webViewUTI];
    if (!UTTypeEqual(v7, (CFStringRef)*MEMORY[0x1E4F225E8]))
    {
      int v10 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E4F226F0]);
      v11 = WBS_LOG_CHANNEL_PREFIXDownloads();
      v12 = v11;
      if (!v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v19 = v5;
          __int16 v20 = 2114;
          v21 = v6;
          _os_log_impl(&dword_1A690B000, v12, OS_LOG_TYPE_DEFAULT, "Not generating web archive for web view %p because the current document isn't a text-based document; mime ty"
            "pe is %{public}@",
            buf,
            0x16u);
        }
        id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_SFWebArchiveErrorDomain" code:2 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_8;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v6;
        _os_log_impl(&dword_1A690B000, v12, OS_LOG_TYPE_INFO, "Webpage is of mime type '%{public}@' instead of HTML, but will still generate a web archive", buf, 0xCu);
      }
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke_4;
    v14[3] = &unk_1E5C73358;
    id v15 = v5;
    id v8 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = v8;
    [v15 _getWebArchiveDataWithCompletionHandler:v14];

    id v9 = v15;
LABEL_8:

LABEL_10:
    return;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = [(id)v2 _quickLookDocument];
  (*(void (**)(uint64_t))(v3 + 16))(v3);
}

void __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 || ![v6 length])
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke_4_cold_1(a1, v8, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v9 = *(id **)(a1 + 40);
    if (!v9[2])
    {
      objc_storeStrong(v9 + 2, a2);
      id v9 = *(id **)(a1 + 40);
    }
    uint64_t v10 = *(void *)(a1 + 48);
    v11 = [v9 _quickLookDocument];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
  }
}

void __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke_4_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = a2;
  id v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 134218242;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Error generating web archive for web view %p: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end