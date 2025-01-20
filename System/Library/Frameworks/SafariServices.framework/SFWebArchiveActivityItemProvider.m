@interface SFWebArchiveActivityItemProvider
@end

@implementation SFWebArchiveActivityItemProvider

void __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2;
  v6[3] = &unk_1E5C72D50;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  [v4 generateWebArchiveWithCompletionHandler:v6];
}

void __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2_cold_1(v8, v7);
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 320), "setSize:", objc_msgSend(v5, "fileSize"));
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [v5 savedURLWithProperExtension];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
}

void __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Unable to generate SFQuickLookDocument for saving: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end