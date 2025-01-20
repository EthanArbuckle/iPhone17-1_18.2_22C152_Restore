@interface PHAssetCreationRequestPlaceholderSupportCrashRecovery
+ (void)restartPendingPlaceholderDownloadsForLibrary:(id)a3;
@end

@implementation PHAssetCreationRequestPlaceholderSupportCrashRecovery

+ (void)restartPendingPlaceholderDownloadsForLibrary:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7035;
  v24 = __Block_byref_object_dispose__7036;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__7035;
  v18[4] = __Block_byref_object_dispose__7036;
  id v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__7035;
  v16[4] = __Block_byref_object_dispose__7036;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke;
  v11[3] = &unk_1E5847C80;
  id v4 = v3;
  id v12 = v4;
  v13 = v18;
  v14 = v16;
  v15 = &v20;
  [v4 performBlockAndWait:v11];
  v5 = (void *)v21[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke_182;
  v7[3] = &unk_1E5842C70;
  v9 = v18;
  v10 = v16;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&v20, 8);
}

void __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke(uint64_t a1)
{
  v53[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = [MEMORY[0x1E4F8A950] entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPlaceholderAsset"), 1);
  v53[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil && %K != nil && %K != nil", @"master", @"additionalAttributes.sourceAssetForDuplicationIdentifier", @"additionalAttributes.sourceAssetForDuplicationScopeIdentifier");
  v53[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  v9 = [v5 andPredicateWithSubpredicates:v8];

  [v4 setPredicate:v9];
  [v4 setFetchBatchSize:100];
  [v4 setReturnsObjectsAsFaults:0];
  v10 = [*(id *)(a1 + 32) managedObjectContext];
  id v49 = 0;
  v11 = [v10 executeFetchRequest:v4 error:&v49];
  id v12 = v49;

  if (!v11)
  {
    v15 = PLPhotoKitGetLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v52 = (uint64_t)v12;
    v38 = "Failed to execute placeholder assets fetch: %@";
    v39 = v15;
    uint32_t v40 = 12;
LABEL_23:
    _os_log_impl(&dword_19B043000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_24;
  }
  uint64_t v13 = [v11 count];
  v14 = PLPhotoKitGetLog();
  v15 = v14;
  if (!v13)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v38 = "Placeholder asset fetch returned no results";
    v39 = v15;
    uint32_t v40 = 2;
    goto LABEL_23;
  }
  id v41 = v12;
  v43 = v9;
  v44 = v4;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v11 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v52 = v16;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "Found %lu placeholder assets that need to be recreated", buf, 0xCu);
  }

  id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v42 = v11;
  id v20 = v11;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v26 = [v25 fetchSourceAssetForDuplicationIfExists];
        if (v26
          && ([MEMORY[0x1E4F8A950] shouldPerformServerCopyOnPlaceholderAsset:v25 photoLibrary:*(void *)(a1 + 32)] & 1) == 0)
        {
          v27 = [v25 uuid];
          [v19 addObject:v27];

          v28 = [v26 uuid];
          [v17 addObject:v28];

          v29 = [v26 momentShare];

          if (v29) {
            v30 = &unk_1EEB25098;
          }
          else {
            v30 = &unk_1EEB250B0;
          }
          [v18 addObject:v30];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v22);
  }

  uint64_t v31 = *(void *)(*(void *)(a1 + 40) + 8);
  v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = v17;
  v15 = v17;

  uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
  v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v18;
  id v35 = v18;

  uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
  v37 = *(void **)(v36 + 40);
  *(void *)(v36 + 40) = v19;

  v9 = v43;
  id v4 = v44;
  id v12 = v41;
  v11 = v42;
LABEL_24:
}

void __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke_182(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectAtIndexedSubscript:a3];
  v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectAtIndexedSubscript:a3];
  __int16 v8 = [v7 integerValue];

  v9 = (void *)MEMORY[0x19F389B10]();
  v10 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEFAULT, "Requesting download for source asset %@ in order to finish creating placeholder asset %@", buf, 0x16u);
  }

  v11 = [MEMORY[0x1E4F8A688] defaultManager];
  uint64_t v12 = a1[4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke_183;
  v15[3] = &unk_1E5842C48;
  id v13 = v6;
  id v16 = v13;
  id v14 = v5;
  id v17 = v14;
  __int16 v19 = v8;
  id v18 = (id)a1[4];
  [v11 requestRequiredResourcesForManagedAssetObjectUUID:v13 library:v12 completionHandler:v15];
}

void __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke_183(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v12 = 138412546;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEFAULT, "Download finished for source asset %@, going to call _updateManagedAssetAfterResourceDownload: for placeholder asset %@", (uint8_t *)&v12, 0x16u);
  }

  id v5 = [PHAssetCreationRequestPlaceholderSupport alloc];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 40)];
  id v7 = [(PHAssetCreationRequestPlaceholderSupport *)v5 initForNewObjectWithUUID:v6];

  __int16 v8 = +[PHObject localIdentifierWithUUID:*(void *)(a1 + 32)];
  [v7 _setDuplicateAssetIdentifier:v8];

  [v7 _setDuplicateAssetPhotoLibraryType:*(unsigned __int16 *)(a1 + 56)];
  v9 = [*(id *)(a1 + 48) libraryServicesManager];
  v10 = [v9 databaseContext];
  v11 = (void *)[v10 newShortLivedLibraryWithName:"+[PHAssetCreationRequestPlaceholderSupportCrashRecovery restartPendingPlaceholderDownloadsForLibrary:]_block_invoke"];

  [v7 _updateManagedAssetAfterResourceDownload:v11];
}

@end