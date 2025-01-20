@interface DDSMAAutoAssetProvider
+ (id)fetchAssetUpdateStatusDateForAutoAsset:(id)a3;
+ (void)setFetchAssetUpdateStatusDateForAutoAsset:(id)a3;
- (id)autoAssetForAssetSelector:(id)a3;
- (id)lockAutoAssetSync:(id)a3 forReason:(id)a4 error:(id *)a5;
- (void)eliminateInterestForAutoAsset:(id)a3;
- (void)fetchLockReasonCountForAutoAsset:(id)a3 callback:(id)a4;
- (void)fetchUpdateStatusForAutoAsset:(id)a3 completion:(id)a4;
- (void)interestInContentForAutoAsset:(id)a3 completion:(id)a4;
- (void)lockAutoAsset:(id)a3 forReason:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)unlockAutoAsset:(id)a3 forReason:(id)a4;
- (void)updateAutoAsset:(id)a3 forReason:(id)a4 completion:(id)a5;
@end

@implementation DDSMAAutoAssetProvider

- (id)autoAssetForAssetSelector:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F77FC8]);
  v5 = [v3 assetSelector];
  id v11 = 0;
  v6 = (void *)[v4 initForClientName:@"com.apple.DataDeliveryServices" selectingAsset:v5 error:&v11];
  id v7 = v11;

  if (v7)
  {
    v8 = AutoAssetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DDSMAAutoAssetProvider autoAssetForAssetSelector:](v3);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (void)fetchLockReasonCountForAutoAsset:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__DDSMAAutoAssetProvider_fetchLockReasonCountForAutoAsset_callback___block_invoke;
  v9[3] = &unk_1E6E3A140;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [v8 currentStatus:v9];
}

void __68__DDSMAAutoAssetProvider_fetchLockReasonCountForAutoAsset_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 code] == 6301)
  {
    id v8 = AutoAssetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) assetSelector];
      int v20 = 138543362;
      uint64_t v21 = (uint64_t)v9;
      _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Auto asset status is not available for assetSelector: %{public}@", (uint8_t *)&v20, 0xCu);
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_13:
    v10();
    goto LABEL_14;
  }
  id v11 = AutoAssetLog();
  v12 = v11;
  if (!v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __68__DDSMAAutoAssetProvider_fetchLockReasonCountForAutoAsset_callback___block_invoke_cold_1(a1);
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v5 currentLockUsage];
    uint64_t v14 = [v13 count];
    v15 = [*(id *)(a1 + 32) assetSelector];
    int v20 = 134218242;
    uint64_t v21 = v14;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_1E41D6000, v12, OS_LOG_TYPE_DEFAULT, "Auto asset lock reason count: %lu for assetSelector: %{public}@", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v16 = *(void *)(a1 + 40);
  v17 = NSNumber;
  v18 = [v5 currentLockUsage];
  v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v19, 0);

LABEL_14:
}

- (void)lockAutoAsset:(id)a3 forReason:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = AutoAssetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 assetSelector];
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v13;
    _os_log_impl(&dword_1E41D6000, v12, OS_LOG_TYPE_DEFAULT, "Lock auto asset: %@", buf, 0xCu);
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F77FD8]);
  [v14 setUserInitiated:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__DDSMAAutoAssetProvider_lockAutoAsset_forReason_withTimeout_completion___block_invoke;
  v17[3] = &unk_1E6E3A168;
  id v18 = v9;
  id v19 = v10;
  id v15 = v10;
  id v16 = v9;
  [v16 lockContent:v11 withUsagePolicy:v14 withTimeout:a5 completion:v17];
}

void __73__DDSMAAutoAssetProvider_lockAutoAsset_forReason_withTimeout_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  id v10 = AutoAssetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      v12 = [*(id *)(a1 + 32) assetSelector];
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1E41D6000, v10, OS_LOG_TYPE_DEFAULT, "Auto asset: %{public}@ present at path: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (v11)
  {
    v13 = [*(id *)(a1 + 32) assetSelector];
    int v14 = 138543618;
    id v15 = v13;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_1E41D6000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get content localContentURL for: %{public}@ with error: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)lockAutoAssetSync:(id)a3 forReason:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = 0;
  id v31 = 0;
  id v29 = 0;
  id v7 = [v6 lockContentSync:a4 withTimeout:0 lockedAssetSelector:&v31 newerInProgress:&v30 error:&v29];
  id v8 = v31;
  id v9 = v30;
  id v10 = v29;
  BOOL v11 = AutoAssetLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v12)
    {
      v13 = [v6 assetSelector];
      *(_DWORD *)buf = 138412546;
      id v33 = v13;
      __int16 v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1E41D6000, v11, OS_LOG_TYPE_DEFAULT, "lockContentSync completed for auto asset: %@ with error: %@", buf, 0x16u);
    }
    v28 = v10;
    BOOL v11 = [objc_alloc(MEMORY[0x1E4F77FC8]) initForClientName:@"data-delivery-service" selectingAsset:v8 error:&v28];
    int v14 = v28;

    if (!v11)
    {
      id v15 = AutoAssetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v33 = v8;
        __int16 v34 = 2112;
        v35 = v14;
        _os_log_impl(&dword_1E41D6000, v15, OS_LOG_TYPE_DEFAULT, "Cannot create auto asset instance with selector: %@, error: %@", buf, 0x16u);
      }
      int v20 = 0;
      id v10 = v14;
      goto LABEL_24;
    }
    v27 = v14;
    id v15 = [v11 currentStatusSync:&v27];
    id v10 = v27;

    if (!v15)
    {
      __int16 v16 = AutoAssetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v11 assetSelector];
        *(_DWORD *)buf = 138412546;
        id v33 = v21;
        __int16 v34 = 2112;
        v35 = v10;
        _os_log_impl(&dword_1E41D6000, v16, OS_LOG_TYPE_DEFAULT, "Fetch status for locked auto asset: %@ completed with error: %@", buf, 0x16u);
      }
      int v20 = 0;
      goto LABEL_23;
    }
    __int16 v16 = objc_opt_new();
    id v17 = [v15 availableForUseAttributes];

    if (v17)
    {
      uint64_t v18 = [v15 availableForUseAttributes];
    }
    else
    {
      uint64_t v22 = [v15 newerVersionAttributes];

      if (!v22)
      {
LABEL_20:
        uint64_t v24 = AutoAssetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [v11 assetSelector];
          *(_DWORD *)buf = 138412546;
          id v33 = v25;
          __int16 v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_1E41D6000, v24, OS_LOG_TYPE_DEFAULT, "Auto Asset: %@, Attributes: %@", buf, 0x16u);
        }
        int v20 = [[DDSAsset alloc] initWithAttributes:v16 localURL:v7];
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      uint64_t v18 = [v15 newerVersionAttributes];
    }
    v23 = (void *)v18;
    [v16 addEntriesFromDictionary:v18];

    goto LABEL_20;
  }
  if (v12)
  {
    id v19 = [v6 assetSelector];
    *(_DWORD *)buf = 138412546;
    id v33 = v19;
    __int16 v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1E41D6000, v11, OS_LOG_TYPE_DEFAULT, "lockContentSync failed for auto asset: %@ with error: %@", buf, 0x16u);
  }
  int v20 = 0;
LABEL_25:

  return v20;
}

- (void)unlockAutoAsset:(id)a3 forReason:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__DDSMAAutoAssetProvider_unlockAutoAsset_forReason___block_invoke;
  v7[3] = &unk_1E6E3A190;
  id v8 = v5;
  id v6 = v5;
  [v6 endLockUsage:a4 completion:v7];
}

void __52__DDSMAAutoAssetProvider_unlockAutoAsset_forReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = AutoAssetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) assetSelector];
      int v12 = 138543362;
      v13 = v8;
      id v9 = "Auto asset: %{public}@ unlocked successfully";
      id v10 = v6;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl(&dword_1E41D6000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v7)
  {
    id v8 = [*(id *)(a1 + 32) assetSelector];
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2114;
    id v15 = v5;
    id v9 = "End lock for auto asset: %{public}@ failed with error: %{public}@";
    id v10 = v6;
    uint32_t v11 = 22;
    goto LABEL_6;
  }
}

- (void)interestInContentForAutoAsset:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__DDSMAAutoAssetProvider_interestInContentForAutoAsset_completion___block_invoke;
  v9[3] = &unk_1E6E3A1B8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [v8 interestInContent:@"dds-auto-asset-interest" completion:v9];
}

void __67__DDSMAAutoAssetProvider_interestInContentForAutoAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = AutoAssetLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "interestInContent successful for asset selector: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__DDSMAAutoAssetProvider_interestInContentForAutoAsset_completion___block_invoke_cold_1(a1, v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)eliminateInterestForAutoAsset:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F77FC8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__DDSMAAutoAssetProvider_eliminateInterestForAutoAsset___block_invoke;
  v6[3] = &unk_1E6E3A190;
  id v7 = v3;
  id v5 = v3;
  [v4 eliminateAllForSelector:v5 completion:v6];
}

void __56__DDSMAAutoAssetProvider_eliminateInterestForAutoAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AutoAssetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "eliminateAllForSelector successful for asset selector: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __56__DDSMAAutoAssetProvider_eliminateInterestForAutoAsset___block_invoke_cold_1(a1, v5);
  }
}

+ (void)setFetchAssetUpdateStatusDateForAutoAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = NSString;
  id v5 = [v3 assetSelector];
  int v6 = [v5 assetType];
  id v7 = [v3 assetSelector];
  uint64_t v8 = [v7 assetSpecifier];
  int v9 = [v4 stringWithFormat:@"%@-%@-%@", @"DDSAutoAssetPreferences", v6, v8];

  id v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = AutoAssetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v3 assetSelector];
    *(_DWORD *)buf = 138412546;
    __int16 v14 = v12;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1E41D6000, v11, OS_LOG_TYPE_DEFAULT, "Did server lookup for auto asset: %@ on %@", buf, 0x16u);
  }
  DDSSetPreferenceObjectForKey(v9, v10);
}

+ (id)fetchAssetUpdateStatusDateForAutoAsset:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v4 assetSelector];
  int v6 = [v5 assetType];
  id v7 = [v4 assetSelector];

  uint64_t v8 = [v7 assetSpecifier];
  int v9 = [v3 stringWithFormat:@"%@-%@-%@", @"DDSAutoAssetPreferences", v6, v8];

  id v10 = DDSGetPreferenceObjectForKey(v9);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (void)fetchUpdateStatusForAutoAsset:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = AutoAssetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 assetSelector];
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEFAULT, "Fetch asset update status for auto asset: %@", buf, 0xCu);
  }
  int v9 = +[DDSMAAutoAssetProvider fetchAssetUpdateStatusDateForAutoAsset:v5];
  id v10 = v9;
  if (v9 && ([v9 timeIntervalSinceNow], v11 > -86400.0))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke;
    v20[3] = &unk_1E6E3A1E0;
    id v12 = &v21;
    id v21 = v6;
    id v13 = v6;
    [v5 currentStatus:v20];
  }
  else
  {
    __int16 v14 = AutoAssetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[DDSMAAutoAssetProvider fetchUpdateStatusForAutoAsset:completion:](v5, v14);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke_36;
    v17[3] = &unk_1E6E3A208;
    id v12 = &v18;
    id v15 = v5;
    id v18 = v15;
    id v19 = v6;
    id v16 = v6;
    [v15 determineIfAvailable:@"dds-asset-download-ui-determine-if-available" withTimeout:-2 completion:v17];
  }
}

void __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [a2 notifications];
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, [v7 newerVersionDiscovered], 0);
  }
  else
  {
    uint64_t v8 = AutoAssetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Cannot fetch the current status of auto asset due to error: %@", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke_36(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    id v16 = 0;
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F77FC8]) initForClientName:@"com.apple.DataDeliveryServices" selectingAsset:v7 error:&v16];
    id v10 = v16;
    if (v9)
    {
      +[DDSMAAutoAssetProvider setFetchAssetUpdateStatusDateForAutoAsset:v9];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke_37;
      v14[3] = &unk_1E6E3A1E0;
      id v15 = *(id *)(a1 + 40);
      [v9 currentStatus:v14];
    }
    else
    {
      id v13 = AutoAssetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1E41D6000, v13, OS_LOG_TYPE_DEFAULT, "Cannot create auto asset for asset selector: %@ due to error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v11 = AutoAssetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 32) assetSelector];
      *(_DWORD *)buf = 138412546;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_1E41D6000, v11, OS_LOG_TYPE_DEFAULT, "Auto asset: %@, determineIfAvailable failed with error: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if ([v8 code] == 6201) {
      +[DDSMAAutoAssetProvider setFetchAssetUpdateStatusDateForAutoAsset:*(void *)(a1 + 32)];
    }
  }
}

void __67__DDSMAAutoAssetProvider_fetchUpdateStatusForAutoAsset_completion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [a2 notifications];
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, [v7 newerVersionDiscovered], 0);
  }
  else
  {
    id v8 = AutoAssetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Cannot fetch the current status of auto asset due to error: %@", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateAutoAsset:(id)a3 forReason:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = AutoAssetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 assetSelector];
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v12;
    _os_log_impl(&dword_1E41D6000, v11, OS_LOG_TYPE_DEFAULT, "Download latest version of auto asset: %@", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__DDSMAAutoAssetProvider_updateAutoAsset_forReason_completion___block_invoke;
  v15[3] = &unk_1E6E3A258;
  id v16 = v9;
  id v17 = v10;
  v15[4] = self;
  id v13 = v9;
  id v14 = v10;
  [v8 determineIfAvailable:v13 withTimeout:-2 completion:v15];
}

void __63__DDSMAAutoAssetProvider_updateAutoAsset_forReason_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v16 = 0;
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F77FC8]) initForClientName:@"com.apple.DataDeliveryServices" selectingAsset:v6 error:&v16];
    id v9 = v16;
    if (v8)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__DDSMAAutoAssetProvider_updateAutoAsset_forReason_completion___block_invoke_39;
      v14[3] = &unk_1E6E3A230;
      id v15 = *(id *)(a1 + 48);
      [v10 lockAutoAsset:v8 forReason:v11 withTimeout:-1 completion:v14];
    }
    else
    {
      id v13 = AutoAssetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_1E41D6000, v13, OS_LOG_TYPE_DEFAULT, "Cannot create auto asset for asset selector: %@ due to error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v12 = AutoAssetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1E41D6000, v12, OS_LOG_TYPE_DEFAULT, "Cannot determine the latest auto asset version due to error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __63__DDSMAAutoAssetProvider_updateAutoAsset_forReason_completion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autoAssetForAssetSelector:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 assetSelector];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1E41D6000, v2, v3, "Cannot create auto asset object for asset selector: %{public}@ due to error: %{public}@", v4, v5, v6, v7, v8);
}

void __68__DDSMAAutoAssetProvider_fetchLockReasonCountForAutoAsset_callback___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) assetSelector];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1E41D6000, v2, v3, "Unexpected error while getting status of auto asset for assetSelector: %{public}@ error: %{public}@", v4, v5, v6, v7, v8);
}

void __67__DDSMAAutoAssetProvider_interestInContentForAutoAsset_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) assetSelector];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "interestInContent failed for auto asset: %@", (uint8_t *)&v4, 0xCu);
}

void __56__DDSMAAutoAssetProvider_eliminateInterestForAutoAsset___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "eliminateAllForSelector failed for auto asset selector: %@", (uint8_t *)&v3, 0xCu);
}

- (void)fetchUpdateStatusForAutoAsset:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 assetSelector];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_DEBUG, "Determine latest version of auto asset: %@ on server", (uint8_t *)&v4, 0xCu);
}

@end