@interface PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing
@end

@implementation PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing

void __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _addHighlightProcessingToAvailabilityStatus:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = *(void *)(a1 + 32);
  id v15 = 0;
  char v6 = [v4 addGraphAvailabilityToAvailabilityStatus:v5 error:&v15];
  id v7 = v15;

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    char v9 = v6;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  if (v13) {
    v14 = v12;
  }
  else {
    v14 = v7;
  }
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = *(void *)(a1 + 32);
  id v13 = 0;
  char v4 = [WeakRetained addIndexingStateToAvailabilityStatus:v3 error:&v13];
  id v5 = v13;

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    char v7 = v4;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  v11 = *(void **)(v8 + 40);
  char v9 = (id *)(v8 + 40);
  uint64_t v10 = v11;
  if (v11) {
    v12 = v10;
  }
  else {
    v12 = v5;
  }
  objc_storeStrong(v9, v12);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _updateFeatureAvailabilityForAvailabilityStatus:*(void *)(a1 + 32)];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v4 + 40);
    if (v5)
    {
      id v6 = v5;
      char v7 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v6;
    }
    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", -1, @"Failed to get feature availability status");
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      char v7 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }

    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v3();
  uint64_t v10 = *(id *)(a1 + 72);
  v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 80);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v11, OS_SIGNPOST_INTERVAL_END, v12, "GlobalProcessingFeatureAvailability", (const char *)&unk_19B30018E, v13, 2u);
  }
}

@end