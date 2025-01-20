@interface PHPhotoLibraryManager
+ (BOOL)_createClientPhotoLibraryBundleURL:(id)a3 error:(id *)a4;
- (BOOL)deletePhotoLibraryWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (NSDictionary)internalTestOptions;
- (PHPhotoLibraryManager)init;
- (id)_findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 error:(id *)a4;
- (id)_optionsDictionaryFromCreateOptions:(id)a3 name:(id)a4;
- (id)_optionsDictionaryFromOpenOptions:(id)a3;
- (id)assetsdClient;
- (id)attributesForLibraryWithIdentifier:(id)a3 error:(id *)a4;
- (id)createPhotoLibraryWithName:(id)a3 options:(id)a4 error:(id *)a5;
- (id)createPhotoLibraryWithURL:(id)a3 options:(id)a4 error:(id *)a5;
- (id)findPhotoLibrariesInDomain:(int64_t)a3 error:(id *)a4;
- (id)newAssetsdClient;
- (id)openPhotoLibraryWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)openPhotoLibraryWithURL:(id)a3 options:(id)a4 error:(id *)a5;
- (void)openPhotoLibraryWithIdentifier:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setInternalTestOptions:(id)a3;
@end

@implementation PHPhotoLibraryManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTestOptions, 0);

  objc_storeStrong((id *)&self->_lazyAssetsdClient, 0);
}

- (void)setInternalTestOptions:(id)a3
{
}

- (NSDictionary)internalTestOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)deletePhotoLibraryWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v7 = (__CFString *)a3;
  +[PHPhotoLibrary enableMultiLibraryMode];
  v8 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "Delete library request initiated for library %@", buf, 0xCu);
  }

  v9 = [(__CFString *)v7 librarySearchCriteria];
  id v25 = 0;
  v10 = [(PHPhotoLibraryManager *)self _findPhotoLibraryIdentifiersMatchingSearchCriteria:v9 error:&v25];
  id v11 = v25;
  v12 = v11;
  if (v10)
  {
    v13 = [v10 firstObject];
    if (v13)
    {
      v14 = [(PHPhotoLibraryManager *)self assetsdClient];
      v15 = [v14 libraryManagementClient];

      v16 = [v13 libraryURL];
      id v24 = 0;
      int v17 = [v15 closeAndDeletePhotoLibraryAtURL:v16 error:&v24];
      id v18 = v24;

      v19 = 0;
      if ((v17 & 1) == 0)
      {
        PHPublicErrorFromError(v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3201, 0);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v17 = 0;
    }
  }
  else
  {
    PHPublicErrorFromError(v11);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v17 = 0;
  }
  v20 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = @"failed";
    if (v17) {
      v21 = @"succeeded";
    }
    *(_DWORD *)buf = 138543874;
    v27 = v21;
    v22 = &stru_1EEAC1950;
    __int16 v28 = 2112;
    v29 = v7;
    if (!v17) {
      v22 = v19;
    }
    __int16 v30 = 2112;
    v31 = v22;
    _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "Delete library request %{public}@ for library %@ %@", buf, 0x20u);
  }

  if (a5) {
    *a5 = v19;
  }

  return v17;
}

- (id)attributesForLibraryWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  +[PHPhotoLibrary enableMultiLibraryMode];
  v7 = objc_msgSend(v6, "pl_libraryIdentifier");
  if (v7) {
    goto LABEL_8;
  }
  v8 = [v6 librarySearchCriteria];
  id v21 = 0;
  v9 = [(PHPhotoLibraryManager *)self _findPhotoLibraryIdentifiersMatchingSearchCriteria:v8 error:&v21];
  id v10 = v21;
  id v11 = v10;
  if (v9)
  {
    v7 = [v9 firstObject];
  }
  else
  {
    v12 = PHPublicErrorFromError(v10);
    v13 = v12;
    if (a4) {
      *a4 = v12;
    }

    v7 = 0;
  }

  if (v7)
  {
LABEL_8:
    id v14 = objc_alloc(MEMORY[0x1E4F8B980]);
    v15 = [v7 libraryURL];
    id v16 = (id)[v14 initWithLibraryURL:v15];

    int v17 = [MEMORY[0x1E4F8A6C0] settingsWithPathManager:v16];
    id v18 = [[PHPhotoLibraryAttributes alloc] initWithLibraryIdentifier:v7 cplSettings:v17];
  }
  else
  {
    v20 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3201, 0);
    id v16 = v20;
    if (a4)
    {
      id v16 = v20;
      v7 = 0;
      id v18 = 0;
      *a4 = v16;
    }
    else
    {
      v7 = 0;
      id v18 = 0;
    }
  }

  return v18;
}

- (id)createPhotoLibraryWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PHPhotoLibraryManager.m", 235, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  id v11 = [v9 lastPathComponent];
  v12 = [v11 stringByDeletingPathExtension];

  if (v10)
  {
    v13 = (void *)[v10 copy];
  }
  else
  {
    v13 = +[PHPhotoLibraryCreationOptions creationOptionsForUserLibrary];
  }
  id v14 = v13;
  [v13 setLibraryURL:v9];
  v15 = [(PHPhotoLibraryManager *)self createPhotoLibraryWithName:v12 options:v14 error:a5];

  return v15;
}

- (id)createPhotoLibraryWithName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PHPhotoLibraryManager.m", 212, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  +[PHPhotoLibrary enableMultiLibraryMode];
  id v11 = [v10 libraryURL];

  if (v11
    && (v12 = objc_opt_class(),
        [v10 libraryURL],
        v13 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v12) = [v12 _createClientPhotoLibraryBundleURL:v13 error:a5],
        v13,
        !v12))
  {
    v20 = 0;
  }
  else
  {
    id v14 = [(PHPhotoLibraryManager *)self _optionsDictionaryFromCreateOptions:v10 name:v9];
    v15 = [(PHPhotoLibraryManager *)self assetsdClient];
    id v16 = [v15 libraryManagementClient];

    id v25 = 0;
    int v17 = [v16 createManagedPhotoLibraryWithOptions:v14 error:&v25];
    id v18 = v25;
    v19 = v18;
    if (v17)
    {
      v20 = [[PHPhotoLibrary alloc] initWithPhotoLibraryURL:v17];
    }
    else
    {
      id v21 = PHPublicErrorFromError(v18);
      v22 = v21;
      if (a5) {
        *a5 = v21;
      }

      v20 = 0;
    }
  }

  return v20;
}

- (id)_optionsDictionaryFromCreateOptions:(id)a3 name:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  uint64_t v10 = [v6 internalCreateOptions];
  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F8B270]];

  if (v10)
  {
    __int16 v28 = @"PHPhotoLibraryCreateOptions";
    id v11 = [NSNumber numberWithUnsignedInteger:v10];
    v29[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

    v13 = +[PHPhotoLibrary plLibraryOptionsFromPHOptions:v12 createOptions:0];
    uint64_t v14 = *MEMORY[0x1E4F8B238];
    v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8B238]];
    [v9 setObject:v15 forKeyedSubscript:v14];
  }
  id v16 = [v6 libraryURL];

  if (v16)
  {
    int v17 = [v6 libraryURL];
    [v9 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F8B248]];
  }
  id v18 = [v6 userDescription];

  if (v18)
  {
    v19 = [v6 userDescription];
    [v9 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F8B258]];
  }
  if ([v6 domain])
  {
    v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "domain"));
    [v9 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F8B260]];
  }
  id v21 = [v6 containerIdentifier];

  if (v21)
  {
    v22 = [v6 containerIdentifier];
    [v9 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F8B250]];
  }
  v23 = [v6 identifierUUID];

  if (v23)
  {
    id v24 = [v6 identifierUUID];
    [v9 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F8B268]];
  }
  id v25 = [(PHPhotoLibraryManager *)self internalTestOptions];

  if (v25)
  {
    v26 = [(PHPhotoLibraryManager *)self internalTestOptions];
    [v9 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F8B278]];
  }

  return v9;
}

- (void)openPhotoLibraryWithIdentifier:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PHPhotoLibraryManager_openPhotoLibraryWithIdentifier_options_handler___block_invoke;
  v15[3] = &unk_1E5848948;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __72__PHPhotoLibraryManager_openPhotoLibraryWithIdentifier_options_handler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v7 = 0;
  v5 = [v2 openPhotoLibraryWithIdentifier:v3 options:v4 error:&v7];
  id v6 = v7;
  (*(void (**)(void))(a1[7] + 16))();
}

- (id)openPhotoLibraryWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 librarySearchCriteria];
  id v22 = 0;
  id v10 = [(PHPhotoLibraryManager *)self _findPhotoLibraryIdentifiersMatchingSearchCriteria:v9 error:&v22];
  id v11 = v22;
  id v12 = v11;
  if (v10)
  {
    id v13 = [v10 firstObject];
    id v14 = [v13 libraryURL];

    if (v14)
    {
      id v21 = 0;
      v15 = [(PHPhotoLibraryManager *)self openPhotoLibraryWithURL:v14 options:v8 error:&v21];
      id v16 = v21;
      id v17 = v16;
      if (!v15 && a5) {
        *a5 = v16;
      }
    }
    else
    {
      v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3201, 0);
      id v17 = v19;
      if (a5)
      {
        id v17 = v19;
        v15 = 0;
        *a5 = v17;
      }
      else
      {
        v15 = 0;
      }
    }
  }
  else
  {
    id v18 = PHPublicErrorFromError(v11);
    id v14 = v18;
    if (a5)
    {
      id v14 = v18;
      v15 = 0;
      *a5 = v14;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)openPhotoLibraryWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  +[PHPhotoLibrary enableMultiLibraryMode];
  id v10 = [[PHPhotoLibrary alloc] initWithPhotoLibraryURL:v9];

  if (v10)
  {
    id v11 = [(PHPhotoLibraryManager *)self _optionsDictionaryFromOpenOptions:v8];
    id v15 = 0;
    BOOL v12 = -[PHPhotoLibrary openAndWaitWithUpgrade:options:error:](v10, "openAndWaitWithUpgrade:options:error:", [v8 allowsUpgrade], v11, &v15);
    id v13 = v15;
    if (!v12)
    {

      id v10 = 0;
      if (a5) {
        *a5 = v13;
      }
    }
  }

  return v10;
}

- (id)_optionsDictionaryFromOpenOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v4 internalCreateOptions])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "internalCreateOptions"));
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F8B238]];
  }
  if ([v4 internalUpgradeOptions])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "internalUpgradeOptions"));
    [v5 setObject:v7 forKeyedSubscript:@"PHPhotoLibraryUpgradeOptions"];
  }
  id v8 = [v4 libraryURL];

  if (v8)
  {
    id v9 = [v4 libraryURL];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F8B248]];
  }
  id v10 = [(PHPhotoLibraryManager *)self internalTestOptions];

  if (v10)
  {
    id v11 = [(PHPhotoLibraryManager *)self internalTestOptions];
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F8B278]];
  }

  return v5;
}

- (id)findPhotoLibrariesInDomain:(int64_t)a3 error:(id *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F8AAA8]);
  [v7 setDomain:a3];
  id v15 = 0;
  id v8 = [(PHPhotoLibraryManager *)self _findPhotoLibraryIdentifiersMatchingSearchCriteria:v7 error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (v8)
  {
    id v11 = objc_msgSend(v8, "_pl_map:", &__block_literal_global_39474);
  }
  else
  {
    BOOL v12 = PHPublicErrorFromError(v9);
    id v13 = v12;
    if (a4) {
      *a4 = v12;
    }

    id v11 = 0;
  }

  return v11;
}

PHPhotoLibraryIdentifier *__58__PHPhotoLibraryManager_findPhotoLibrariesInDomain_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[PHPhotoLibraryIdentifier alloc] initWithPLLibraryIdentifier:v2];

  return v3;
}

- (id)_findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibraryManager *)self assetsdClient];
  id v8 = [v7 libraryManagementClient];

  id v9 = [(PHPhotoLibraryManager *)self internalTestOptions];

  if (v9)
  {
    id v10 = [(PHPhotoLibraryManager *)self internalTestOptions];
    [v6 setInternalTestOptions:v10];
  }
  id v11 = [v8 findPhotoLibraryIdentifiersMatchingSearchCriteria:v6 error:a4];

  return v11;
}

- (id)assetsdClient
{
  return (id)[(PLLazyObject *)self->_lazyAssetsdClient objectValue];
}

- (id)newAssetsdClient
{
  return objc_alloc_init(MEMORY[0x1E4F8B968]);
}

- (PHPhotoLibraryManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)PHPhotoLibraryManager;
  id v2 = [(PHPhotoLibraryManager *)&v11 init];
  if (v2)
  {
    id v3 = objc_initWeak(&location, v2);

    id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__PHPhotoLibraryManager_init__block_invoke;
    v8[3] = &unk_1E5847760;
    objc_copyWeak(&v9, &location);
    uint64_t v5 = [v4 initWithBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    lazyAssetsdClient = v2->_lazyAssetsdClient;
    v2->_lazyAssetsdClient = (PLLazyObject *)v5;
  }
  return v2;
}

id __29__PHPhotoLibraryManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newAssetsdClient];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

+ (BOOL)_createClientPhotoLibraryBundleURL:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F289D0];
    v21[0] = v5;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v11 = [v9 errorWithDomain:@"PHPhotosErrorDomain" code:3107 userInfo:v10];
  }
  else
  {
    id v19 = 0;
    BOOL v12 = 1;
    char v13 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v11 = v19;
    if (v13) {
      goto LABEL_9;
    }
    id v10 = PLUnderlyingErrorThatHasDomainAndCode();
    if (v10)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v15 = [v5 path];
      id v16 = [v15 stringByDeletingLastPathComponent];
      [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28328]];

      [v14 setObject:@"You do not have permission to write to the selected folder" forKeyedSubscript:*MEMORY[0x1E4F28588]];
      [v14 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 5404, v14);

      id v11 = (id)v17;
    }
  }

  if (a4)
  {
    id v11 = v11;
    BOOL v12 = 0;
    *a4 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_9:

  return v12;
}

@end