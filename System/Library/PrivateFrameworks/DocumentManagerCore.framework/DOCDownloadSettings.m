@interface DOCDownloadSettings
- (BOOL)_saveDownloadFolderItem:(id)a3 error:(id *)a4;
- (DOCDownloadSettings)init;
- (FPItem)currentDefaultDownloadsLocationItem;
- (NSArray)providers;
- (NSError)providersObserverError;
- (id)_createErrorForCode:(int64_t)a3 localizedDescription:(id)a4 underlyingError:(id)a5;
- (id)providersObserverContext;
- (void)_createDefaultDownloadsFolderInParent:(id)a3 completion:(id)a4;
- (void)_fetchAvailableProviders:(id)a3;
- (void)_fetchDefaultFallbackDownloadLocationWithPreferredDomain:(id)a3 completion:(id)a4;
- (void)_fetchProviders:(id)a3;
- (void)_preferredProvidersIn:(id)a3 completion:(id)a4;
- (void)_removeCurrentDownloadsLocationFromFavorites;
- (void)_rootItemOfPreferredProviderInDomains:(id)a3 completion:(id)a4;
- (void)_validatePreferredProvider:(id)a3 completion:(id)a4;
- (void)fetchDefaultDownloadsLocationItem:(id)a3;
- (void)fetchProvidersSuitableForDownloads:(id)a3;
- (void)resetDefaultDownloadsLocationItem;
- (void)setCurrentDefaultDownloadsLocationItem:(id)a3;
- (void)setDefaultDownloadsItemForProviderDomain:(id)a3 completionHandler:(id)a4;
- (void)setDefaultDownloadsLocationItem:(id)a3 completionHandler:(id)a4;
- (void)setProviders:(id)a3;
- (void)setProvidersObserverContext:(id)a3;
- (void)setProvidersObserverError:(id)a3;
@end

@implementation DOCDownloadSettings

- (DOCDownloadSettings)init
{
  v8.receiver = self;
  v8.super_class = (Class)DOCDownloadSettings;
  v2 = [(DOCDownloadSettings *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] mainBundle];
    v4 = [v3 bundleIdentifier];

    v5 = +[DOCManagedPermission defaultPermission];
    [v5 setHostIdentifier:v4];

    v6 = +[DOCNodeStartupManager shared];
    [v6 startIfNeeded];
  }
  return v2;
}

- (void)fetchDefaultDownloadsLocationItem:(id)a3
{
  id v4 = a3;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke;
  v20[3] = &unk_2641B6340;
  v20[4] = self;
  id v5 = v4;
  id v21 = v5;
  v6 = (void (**)(void, void))MEMORY[0x21668ED30](v20);
  v7 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DocumentManager.defaults"];
  objc_super v8 = [v7 dataForKey:@"DOCDefaultDownloadLocationKey"];
  if (v8)
  {
    id v19 = 0;
    v9 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v19];
    id v10 = v19;
    if (v9)
    {
      v11 = [MEMORY[0x263F054C0] defaultManager];
      v12 = [v9 itemID];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3;
      v14[3] = &unk_2641B6368;
      id v15 = v9;
      v16 = self;
      id v17 = v5;
      v18 = v6;
      [v11 fetchItemForItemID:v12 completionHandler:v14];
    }
    else
    {
      v13 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        v13 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[DOCDownloadSettings fetchDefaultDownloadsLocationItem:]();
      }
      v6[2](v6, 0);
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_2;
  v6[3] = &unk_2641B6318;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 _fetchDefaultFallbackDownloadLocationWithPreferredDomain:a2 completion:v6];
}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 40))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a3;
    id v7 = a2;
    [v5 setCurrentDefaultDownloadsLocationItem:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263F054C8];
    objc_super v8 = [v5 providerDomainID];
    id v14 = 0;
    v9 = [v7 providerDomainWithID:v8 cachePolicy:1 error:&v14];
    id v10 = v14;

    if (v10)
    {
      v11 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        v11 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3_cold_2(a1, v11);
      }
    }

    if (v9 && ([v5 isTrashed] & 1) == 0 && (objc_msgSend(v9, "isHidden") & 1) == 0)
    {
      if (*(void *)(a1 + 48))
      {
        v12 = docDownloadServiceLogHandle;
        if (!docDownloadServiceLogHandle)
        {
          DOCInitLogging();
          v12 = docDownloadServiceLogHandle;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = v5;
          _os_log_impl(&dword_213670000, v12, OS_LOG_TYPE_INFO, "Successfully fetched saved downloads location item: %@", buf, 0xCu);
        }
        [*(id *)(a1 + 40) setCurrentDefaultDownloadsLocationItem:v5];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      goto LABEL_22;
    }
  }
  else
  {
    v9 = 0;
  }
  v13 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v13 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_22:
}

- (void)_removeCurrentDownloadsLocationFromFavorites
{
  v3 = [(DOCDownloadSettings *)self currentDefaultDownloadsLocationItem];

  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke;
    v4[3] = &unk_2641B55D8;
    v4[4] = self;
    DOCRunInMainThread(v4);
  }
}

void __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke(uint64_t a1)
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__6;
  v5[4] = __Block_byref_object_dispose__6;
  id v6 = [*(id *)(a1 + 32) currentDefaultDownloadsLocationItem];
  v2 = +[DOCFavoritesManager sharedManager];
  v3 = [*(id *)(a1 + 32) currentDefaultDownloadsLocationItem];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke_14;
  v4[3] = &unk_2641B6390;
  v4[4] = v5;
  [v2 removeFavorite:v3 completion:v4];

  _Block_object_dispose(v5, 8);
}

void __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke_14(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v3 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v3 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke_14_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)_saveDownloadFolderItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:a4];
  if (v7)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DocumentManager.defaults"];
    [v8 setObject:v7 forKey:@"DOCDefaultDownloadLocationKey"];
    [(DOCDownloadSettings *)self setCurrentDefaultDownloadsLocationItem:v6];
    if (v6)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke;
      v12[3] = &unk_2641B55D8;
      id v13 = v6;
      DOCRunInMainThread(v12);
    }
    else
    {
      id v10 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        id v10 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[DOCDownloadSettings _saveDownloadFolderItem:error:](v10);
      }
    }
  }
  else
  {
    uint64_t v9 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      uint64_t v9 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DOCDownloadSettings _saveDownloadFolderItem:error:]();
    }
  }

  return v7 != 0;
}

void __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke(uint64_t a1)
{
  v2 = +[DOCFavoritesManager sharedManager];
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke_2;
  v4[3] = &unk_2641B62E8;
  id v5 = v3;
  [v2 addFavorite:v5 completion:v4];
}

void __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v3 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v3 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke_2_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)setDefaultDownloadsLocationItem:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BOOL, id))a4;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"DOCDownloadSettings.m" lineNumber:174 description:@"Attempted to set nil as the default downloads location. Call resetDefaultDownloadsLocationItem instead."];
  }
  [(DOCDownloadSettings *)self _removeCurrentDownloadsLocationFromFavorites];
  id v12 = 0;
  BOOL v9 = [(DOCDownloadSettings *)self _saveDownloadFolderItem:v7 error:&v12];
  id v10 = v12;
  if (v8) {
    v8[2](v8, v9, v10);
  }
}

- (void)setDefaultDownloadsItemForProviderDomain:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v13[0] = a3;
  id v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  BOOL v9 = [v7 arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke;
  v11[3] = &unk_2641B5DC8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(DOCDownloadSettings *)self _rootItemOfPreferredProviderInDomains:v9 completion:v11];
}

void __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_2;
    v5[3] = &unk_2641B5DC8;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 40);
    [v3 _createDefaultDownloadsFolderInParent:a2 completion:v5];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    id v7 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_213670000, v7, OS_LOG_TYPE_INFO, "Fetched downloads location: %@", buf, 0xCu);
  }
  if (v5)
  {
    if ([v6 code] == -1001)
    {

      id v6 = 0;
    }
    id v8 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_26;
    v13[3] = &unk_2641B5E40;
    id v14 = v5;
    id v6 = v6;
    id v15 = v6;
    id v16 = *(id *)(a1 + 40);
    [v8 setDefaultDownloadsLocationItem:v14 completionHandler:v13];

    BOOL v9 = v14;
  }
  else
  {
    id v10 = _DocumentManagerBundle();
    BOOL v9 = [v10 localizedStringForKey:@"Unrecoverable failure to locate the Downloads location." value:@"Unrecoverable failure to locate the Downloads location." table:@"Localizable"];

    v11 = [*(id *)(a1 + 32) _createErrorForCode:-1002 localizedDescription:v9 underlyingError:v6];
    id v12 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v12 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_2_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = *(id *)(a1 + 32);
  id v5 = v4;
  if (*(void *)(a1 + 40))
  {

    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)resetDefaultDownloadsLocationItem
{
  [(DOCDownloadSettings *)self _removeCurrentDownloadsLocationFromFavorites];
  id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DocumentManager.defaults"];
  [v2 setObject:0 forKey:@"DOCDefaultDownloadLocationKey"];
}

- (void)fetchProvidersSuitableForDownloads:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__DOCDownloadSettings_fetchProvidersSuitableForDownloads___block_invoke;
  v6[3] = &unk_2641B59E8;
  id v7 = v4;
  id v5 = v4;
  [(DOCDownloadSettings *)self _fetchProviders:v6];
}

void __58__DOCDownloadSettings_fetchProvidersSuitableForDownloads___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v35 = a3;
  v36 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v6)
  {
    v37 = 0;
    id v8 = 0;
    BOOL v9 = 0;
    goto LABEL_40;
  }
  uint64_t v7 = v6;
  v37 = 0;
  id v8 = 0;
  BOOL v9 = 0;
  uint64_t v10 = *(void *)v39;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v39 != v10) {
        objc_enumerationMutation(v5);
      }
      id v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
      id v13 = [v12 identifier];
      int v14 = [v13 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

      if (v14)
      {
        id v15 = v12;

        BOOL v9 = v15;
      }
      if ([v12 isiCloudDriveProvider]
        && ([v12 isHidden] & 1) == 0
        && ([v12 needsAuthentication] & 1) == 0)
      {
        int v16 = [v12 isMainiCloudDriveDomain];
        id v17 = v12;
        id v18 = v37;
        if (v16) {
          uint64_t v19 = v37;
        }
        else {
          uint64_t v19 = v8;
        }
        if (v16) {
          id v18 = v17;
        }
        v37 = v18;
        if (!v16) {
          id v8 = v17;
        }
      }
      if (([v12 needsAuthentication] & 1) == 0 && (objc_msgSend(v12, "canDisconnect") & 1) == 0)
      {
        if ([v12 supportsEnumeration])
        {
          if ([v12 isEnabled])
          {
            if (([v12 isHidden] & 1) == 0 && (objc_msgSend(v12, "isReadOnly") & 1) == 0)
            {
              if ([v12 isAvailableSystemWide])
              {
                if ([v12 supportsPickingFolders])
                {
                  v20 = [v12 identifier];
                  char v22 = DOCProviderDomainIDIsDefaultSharedServer(v20, v21);

                  if ((v22 & 1) == 0)
                  {
                    v23 = [v12 identifier];
                    char v25 = DOCProviderDomainIDIsExternalDevice(v23, v24);

                    if ((v25 & 1) == 0)
                    {
                      v26 = [v12 providerID];
                      if ([v26 isEqualToString:@"com.apple.DocumentManager.SpotlightFileProvider"])goto LABEL_32; {
                      v27 = [v12 providerID];
                      }
                      if ([v27 isEqualToString:@"com.apple.mobileslideshow.PhotosFileProvider"])
                      {

LABEL_32:
                        goto LABEL_33;
                      }
                      v32 = [v12 providerID];
                      char v33 = [v32 isEqualToString:@"com.apple.TapToRadar.SystemFiles"];

                      if ((v33 & 1) == 0) {
                        [v36 addObject:v12];
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_33:
      ++v11;
    }
    while (v7 != v11);
    uint64_t v28 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    uint64_t v7 = v28;
  }
  while (v28);
LABEL_40:

  [v36 sortUsingComparator:&__block_literal_global_15];
  if (v9 && [v36 containsObject:v9])
  {
    [v36 removeObject:v9];
    [v36 insertObject:v9 atIndex:0];
  }
  if (v37 && (v29 = v37, ([v36 containsObject:v37] & 1) != 0)
    || v8 && (v29 = v8, [v36 containsObject:v8]))
  {
    [v36 removeObject:v29];
    [v36 insertObject:v29 atIndex:0];
    int v30 = 0;
    if (!v9) {
      goto LABEL_52;
    }
  }
  else
  {
    int v30 = 1;
    if (!v9) {
      goto LABEL_52;
    }
  }
  if ((([v36 count] != 0) & ~v30) == 0)
  {
    [v36 removeObject:v9];
    [v36 insertObject:v9 atIndex:0];
  }
LABEL_52:
  uint64_t v31 = *(void *)(a1 + 32);
  if (v31) {
    (*(void (**)(uint64_t, void *, id))(v31 + 16))(v31, v36, v35);
  }
}

uint64_t __58__DOCDownloadSettings_fetchProvidersSuitableForDownloads___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 providerDisplayName];
  uint64_t v6 = [v4 providerDisplayName];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (void)_fetchDefaultFallbackDownloadLocationWithPreferredDomain:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    id v8 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213670000, v8, OS_LOG_TYPE_INFO, "No valid saved downloads location - fetching default", buf, 2u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke;
  v11[3] = &unk_2641B64C8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(DOCDownloadSettings *)self _fetchAvailableProviders:v11];
}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_2;
  v34[3] = &unk_2641B63D8;
  v34[4] = *(void *)(a1 + 32);
  id v7 = v6;
  id v35 = v7;
  id v8 = (void *)MEMORY[0x21668ED30](v34);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_38;
  v31[3] = &unk_2641B6428;
  v31[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v32 = v9;
  id v10 = v8;
  id v33 = v10;
  uint64_t v11 = (void *)MEMORY[0x21668ED30](v31);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_3_41;
  char v25 = &unk_2641B64A0;
  id v12 = v9;
  id v26 = v12;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v27 = v13;
  uint64_t v28 = v14;
  id v15 = v10;
  id v29 = v15;
  id v16 = v11;
  id v30 = v16;
  id v17 = (void (**)(void, void, void))MEMORY[0x21668ED30](&v22);
  id v18 = docDownloadServiceLogHandle;
  if (*(void *)(a1 + 40))
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v18 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void **)(a1 + 40);
      v20 = v18;
      id v21 = objc_msgSend(v19, "providerDomainID", v22, v23, v24, v25, v26, v27, v28, v29);
      *(_DWORD *)buf = 138412290;
      v37 = v21;
      _os_log_impl(&dword_213670000, v20, OS_LOG_TYPE_INFO, "No valid saved downloads location - fetching default in previous location's domain: %@", buf, 0xCu);
    }
    v17[2](v17, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  else
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v18 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213670000, v18, OS_LOG_TYPE_INFO, "No saved downloads location - fetching default using standard fallback logic", buf, 2u);
    }
    (*((void (**)(id, void))v16 + 2))(v16, *(void *)(a1 + 48));
  }
}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_3;
    v8[3] = &unk_2641B5DC8;
    v8[4] = v7;
    id v9 = v5;
    [v7 _createDefaultDownloadsFolderInParent:a2 completion:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, *(void *)(a1 + 40));
  }
}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    id v7 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_213670000, v7, OS_LOG_TYPE_INFO, "Fetched downloads location: %@", buf, 0xCu);
  }
  if ([v6 code] == -1001)
  {

    id v6 = 0;
  }
  id v8 = *(void **)(a1 + 32);
  id v12 = 0;
  [v8 _saveDownloadFolderItem:v5 error:&v12];
  id v9 = v12;
  id v10 = v6;
  id v11 = v10;
  if (v9)
  {
    id v11 = v9;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_2_39;
  v7[3] = &unk_2641B6400;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 _rootItemOfPreferredProviderInDomains:v5 completion:v7];
}

uint64_t __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_2_39(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_3_41(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_4;
  v20[3] = &unk_2641B6450;
  id v7 = *(void **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 indexOfObjectPassingTest:v20];
  id v9 = *(void **)(a1 + 32);
  if (!v9 || v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v13 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = v13;
      uint64_t v15 = [v5 providerDomainID];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v15;
      _os_log_impl(&dword_213670000, v14, OS_LOG_TYPE_INFO, "Preferred domain (%@) is unavailable - falling back to default using standard fallback logic", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:");
    id v11 = *(void **)(a1 + 48);
    v24[0] = v10;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_5;
    v16[3] = &unk_2641B6478;
    id v17 = *(id *)(a1 + 56);
    id v18 = v6;
    id v19 = *(id *)(a1 + 64);
    [v11 _rootItemOfPreferredProviderInDomains:v12 completion:v16];
  }
}

uint64_t __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) providerDomainID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = docDownloadServiceLogHandle;
  if (v5)
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v7;
      id v9 = [v5 providerDomainID];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_213670000, v8, OS_LOG_TYPE_INFO, "Validated preferred domain! - creating Downloads folder from that domain: %@", (uint8_t *)&v10, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_213670000, v7, OS_LOG_TYPE_INFO, "Unable to validate preferred domain - falling back to default using standard fallback logic", (uint8_t *)&v10, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_createDefaultDownloadsFolderInParent:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F05440];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithParentItem:v7 folderName:@"Downloads"];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__DOCDownloadSettings__createDefaultDownloadsFolderInParent_completion___block_invoke;
  v11[3] = &unk_2641B5740;
  id v12 = v5;
  id v9 = v5;
  [v8 setCreateFolderCompletionBlock:v11];
  int v10 = [MEMORY[0x263F054C0] defaultManager];
  [v10 scheduleAction:v8];
}

void __72__DOCDownloadSettings__createDefaultDownloadsFolderInParent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = v8;
  }
  else
  {
    id v7 = [v5 userInfo];
    id v6 = [v7 objectForKey:*MEMORY[0x263F05380]];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchProviders:(id)a3
{
  id v5 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6;
  id v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  id v6 = (void *)MEMORY[0x263F054C8];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__DOCDownloadSettings__fetchProviders___block_invoke;
  v10[3] = &unk_2641B64F0;
  v10[4] = self;
  id v12 = v21;
  id v7 = v5;
  id v11 = v7;
  id v13 = &v15;
  SEL v14 = a2;
  uint64_t v8 = [v6 beginMonitoringProviderDomainChangesWithHandler:v10];
  id v9 = (void *)v16[5];
  v16[5] = v8;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);
}

void __39__DOCDownloadSettings__fetchProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    id v6 = [v11 allValues];
    [*(id *)(a1 + 32) setProviders:v6];

    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v7 + 24))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) providers];
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);

      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    *(unsigned char *)(v7 + 24) = 0;
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      objc_msgSend(MEMORY[0x263F054C8], "endMonitoringProviderDomainChanges:");
    }
  }
  else if (v5 && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    int v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"DOCDownloadSettings.m", 454, @"FileProvider crashed most likely. So we cannot do anything else but crash. Please send a bug to FileProvider if you see this error. error = %@", v5 object file lineNumber description];
  }
}

- (void)_fetchAvailableProviders:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke;
  v6[3] = &unk_2641B6568;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DOCDownloadSettings *)self fetchProvidersSuitableForDownloads:v6];
}

void __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_2;
  v9[3] = &unk_2641B6540;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 _preferredProvidersIn:a2 completion:v9];
}

void __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 firstObject];
  if ([v3 count] == 1)
  {
    id v5 = [v4 identifier];
    if ([v5 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
    {
      char v6 = [v4 isEnabled];

      if ((v6 & 1) == 0)
      {
        id v7 = [v4 providerDisplayName];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_3;
        v10[3] = &unk_2641B6518;
        id v11 = v7;
        id v13 = *(id *)(a1 + 40);
        id v12 = v3;
        id v8 = v7;
        [v4 setEnabled:1 completionHandler:v10];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v3, *(void *)(a1 + 32));
  }
LABEL_8:
}

void __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v4 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_3_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, *(void *)(a1 + 40), v3);
  }
}

- (void)_rootItemOfPreferredProviderInDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 firstObject];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F054C0] defaultManager];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __72__DOCDownloadSettings__rootItemOfPreferredProviderInDomains_completion___block_invoke;
    v14[3] = &unk_2641B6590;
    id v18 = v7;
    id v15 = v8;
    id v16 = v6;
    uint64_t v17 = self;
    objc_msgSend(v9, "doc_fetchRootItemForProviderDomain:completionHandler:", v15, v14);

    id v10 = v18;
  }
  else
  {
    id v11 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v11 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DOCDownloadSettings _rootItemOfPreferredProviderInDomains:completion:](v11);
    }
    id v12 = _DocumentManagerBundle();
    id v10 = [v12 localizedStringForKey:@"Unrecoverable failure to locate the Downloads location." value:@"Unrecoverable failure to locate the Downloads location." table:@"Localizable"];

    id v13 = [(DOCDownloadSettings *)self _createErrorForCode:-1001 localizedDescription:v10 underlyingError:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

void __72__DOCDownloadSettings__rootItemOfPreferredProviderInDomains_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v7 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__DOCDownloadSettings__rootItemOfPreferredProviderInDomains_completion___block_invoke_cold_1(a1, v7);
    }
    id v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v8 removeObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) _rootItemOfPreferredProviderInDomains:v8 completion:*(void *)(a1 + 56)];
  }
}

- (void)_preferredProvidersIn:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v13 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__6;
  v28[4] = __Block_byref_object_dispose__6;
  id v29 = [MEMORY[0x263EFF980] array];
  id v7 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
        dispatch_group_enter(v7);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __56__DOCDownloadSettings__preferredProvidersIn_completion___block_invoke;
        v18[3] = &unk_2641B65B8;
        id v20 = v28;
        id v21 = v26;
        v18[4] = v11;
        id v19 = v7;
        [(DOCDownloadSettings *)self _validatePreferredProvider:v11 completion:v18];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DOCDownloadSettings__preferredProvidersIn_completion___block_invoke_2;
  block[3] = &unk_2641B65E0;
  uint64_t v17 = v28;
  id v16 = v13;
  id v12 = v13;
  dispatch_group_notify(v7, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

void __56__DOCDownloadSettings__preferredProvidersIn_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v3);
    if ([*(id *)(a1 + 32) isiCloudDriveProvider]
      && !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) insertObject:*(void *)(a1 + 32) atIndex:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:*(void *)(a1 + 32)];
    }
    objc_sync_exit(v3);
  }
  id v4 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v4);
}

uint64_t __56__DOCDownloadSettings__preferredProvidersIn_completion___block_invoke_2(uint64_t a1)
{
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (void)_validatePreferredProvider:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isiCloudDriveProvider]
    && [v5 isEnabled]
    && ([v5 needsAuthentication] & 1) == 0)
  {
    v13[0] = 0;
    v13[1] = v13;
    void v13[2] = 0x2020000000;
    char v14 = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__DOCDownloadSettings__validatePreferredProvider_completion___block_invoke;
    block[3] = &unk_2641B6630;
    id v10 = v5;
    id v12 = v13;
    id v11 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    _Block_object_dispose(v13, 8);
  }
  else
  {
    id v7 = [v5 identifier];
    int v8 = [v7 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

    (*((void (**)(id, BOOL))v6 + 2))(v6, v8 != 0);
  }
}

void __61__DOCDownloadSettings__validatePreferredProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F054C0] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__DOCDownloadSettings__validatePreferredProvider_completion___block_invoke_2;
  v6[3] = &unk_2641B6608;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  objc_msgSend(v2, "doc_fetchRootItemForProviderDomain:completionHandler:", v3, v6);
}

uint64_t __61__DOCDownloadSettings__validatePreferredProvider_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    char v3 = [a2 isActionable];
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (id)_createErrorForCode:(int64_t)a3 localizedDescription:(id)a4 underlyingError:(id)a5
{
  id v7 = a5;
  int v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a4;
  id v10 = [v8 dictionary];
  [v10 setObject:v9 forKey:*MEMORY[0x263F08320]];

  if (v7) {
    [v10 setObject:v7 forKey:*MEMORY[0x263F08608]];
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.DocumentManager.DocumentDownloads" code:a3 userInfo:v10];

  return v11;
}

- (NSArray)providers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProviders:(id)a3
{
}

- (NSError)providersObserverError
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProvidersObserverError:(id)a3
{
}

- (id)providersObserverContext
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setProvidersObserverContext:(id)a3
{
}

- (FPItem)currentDefaultDownloadsLocationItem
{
  return (FPItem *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentDefaultDownloadsLocationItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDefaultDownloadsLocationItem, 0);
  objc_storeStrong(&self->_providersObserverContext, 0);
  objc_storeStrong((id *)&self->_providersObserverError, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

- (void)fetchDefaultDownloadsLocationItem:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_213670000, v0, v1, "Unable to unarchive sandboxing URL wrapper. Error: %@", v2, v3, v4, v5, v6);
}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_213670000, v0, v1, "Unable to fetch saved downloads location item. Error: %@", v2, v3, v4, v5, v6);
}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3_cold_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  uint64_t v4 = [v2 providerDomainID];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_213670000, v3, v5, "Unable to get domain for ID: %@. Error: %@", v6);
}

void __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke_14_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_saveDownloadFolderItem:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_213670000, log, OS_LOG_TYPE_ERROR, "Download folder item unexpectedly nil", v1, 2u);
}

- (void)_saveDownloadFolderItem:error:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_3_1(&dword_213670000, v1, (uint64_t)v1, "Unable to archive item: %@ error: %@", v2);
}

void __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_213670000, v0, v1, "Unable access existing folder because underlying error contained no FPItem: %@", v2, v3, v4, v5, v6);
}

void __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_3_1(&dword_213670000, a3, (uint64_t)a3, "Unable to enable Local Storage (%@) as our last resort. Error: %@", (uint8_t *)&v4);
}

- (void)_rootItemOfPreferredProviderInDomains:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_213670000, log, OS_LOG_TYPE_ERROR, "Unable to find any domains, giving up.", v1, 2u);
}

void __72__DOCDownloadSettings__rootItemOfPreferredProviderInDomains_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  int v4 = [v2 providerDisplayName];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_213670000, v3, v5, "Unable to fetch root item for preferred domain: %@ error: %@", v6);
}

@end