@interface CKImportStatusManager
- (int64_t)importStateForAsset:(id)a3;
@end

@implementation CKImportStatusManager

- (int64_t)importStateForAsset:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v4 = a3;
  v5 = [v4 mediaObject];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 syndicationIdentifier];
    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v33[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      v10 = [v8 initWithArray:v9];

      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      v12 = [MEMORY[0x1E4F6BD68] sharedInstance];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __45__CKImportStatusManager_importStateForAsset___block_invoke;
      v25 = &unk_1E5623948;
      v27 = &v28;
      v13 = v11;
      v26 = v13;
      [v12 fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:v10 completion:&v22];

      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v13, v14))
      {
        v15 = IMLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v6, "syndicationIdentifier", v22, v23, v24, v25);
          -[CKImportStatusManager importStateForAsset:](v16, v17, buf, v15);
        }
      }
    }
    else
    {
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v19 = NSStringFromSelector(a2);
        [(CKImportStatusManager *)v19 importStateForAsset:v10];
      }
    }
  }
  else
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      [(CKImportStatusManager *)v18 importStateForAsset:v7];
    }
  }

  int64_t v20 = v29[3];
  _Block_object_dispose(&v28, 8);

  return v20;
}

intptr_t __45__CKImportStatusManager_importStateForAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)importStateForAsset:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "%@ - media object was nil. Assuming NOT saved.", buf, 0xCu);
}

- (void)importStateForAsset:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "%@ - syndicationIdentifier for media object was nil. Assuming NOT saved.", buf, 0xCu);
}

- (void)importStateForAsset:(uint8_t *)buf .cold.3(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "%@ - Timed out while fetching %@ saved state. Assuming NOT saved.", buf, 0x16u);
}

@end