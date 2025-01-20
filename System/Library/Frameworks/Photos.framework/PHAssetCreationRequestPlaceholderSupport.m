@interface PHAssetCreationRequestPlaceholderSupport
- (BOOL)_regenerateResourcesWithLocationDataRemoved:(id)a3 sourceExternalResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (NSXPCConnection)clientConnection;
- (PHAssetCreationRequestPlaceholderSupport)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (id)_createPlaceholderManagedAssetFromSourceManagedAsset:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5;
- (id)_fetchOptionsForDuplicateAssetPhotoLibraryType:(id)a3;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObjectWithUUID:(id)a3;
- (unsigned)_bundleScopeForPlaceholderAsset;
- (void)_updateManagedAssetAfterResourceDownload:(id)a3;
- (void)changeFailedOnClientWithLibrary:(id)a3 error:(id)a4;
- (void)changeFailedOnDaemonWithLibrary:(id)a3 error:(id)a4;
- (void)performTransactionCompletionHandlingInPhotoLibrary:(id)a3;
@end

@implementation PHAssetCreationRequestPlaceholderSupport

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientConnection);

  objc_storeStrong((id *)&self->_serverTransaction, 0);
}

- (NSXPCConnection)clientConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)performTransactionCompletionHandlingInPhotoLibrary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PHChangeRequest *)self uuid];
  v6 = +[PHObject uuidFromLocalIdentifier:v5];

  v7 = [MEMORY[0x1E4F8A950] assetWithUUID:v6 inLibrary:v4];
  v8 = [(PHAssetCreationRequest *)self duplicateAssetIdentifier];
  v9 = +[PHObject uuidFromLocalIdentifier:v8];

  v10 = [MEMORY[0x1E4F8A950] assetWithUUID:v9 inLibrary:v4];
  v11 = v10;
  if (v7)
  {
    if (self->_placeholderCreationMode == 1)
    {
      if (v10)
      {
        if (!self->_serverTransaction)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F8B790]];
          v13 = (void *)MEMORY[0x1E4F8A6F0];
          v14 = [v4 pathManager];
          v15 = v13;
          v16 = (void *)v12;
          v28 = [v15 beginClientTransactionWithChangeScopes:v12 pathManager:v14 identifier:"-[PHAssetCreationRequestPlaceholderSupport performTransactionCompletionHandlingInPhotoLibrary:]"];

          v27 = (void *)MEMORY[0x1E4F8A6F0];
          v17 = [v28 transactionToken];
          v18 = [v4 pathManager];
          v19 = [v27 beginServerTransactionWithToken:v17 changeScopes:v16 pathManager:v18 identifier:"-[PHAssetCreationRequestPlaceholderSupport performTransactionCompletionHandlingInPhotoLibrary:]"];
          serverTransaction = self->_serverTransaction;
          self->_serverTransaction = v19;

          [v28 completeTransaction];
        }
        if ([v11 checkAllResourcesRequiredForCPLDisableWithReachableBlock:0])
        {
          [(PHAssetCreationRequestPlaceholderSupport *)self _updateManagedAssetAfterResourceDownload:v4];
        }
        else
        {
          v25 = [MEMORY[0x1E4F8A688] defaultManager];
          v26 = [v11 uuid];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __95__PHAssetCreationRequestPlaceholderSupport_performTransactionCompletionHandlingInPhotoLibrary___block_invoke;
          v29[3] = &unk_1E5842C20;
          id v30 = v4;
          v31 = self;
          [v25 requestRequiredResourcesForManagedAssetObjectUUID:v26 library:v30 completionHandler:v29];
        }
      }
      else
      {
        v23 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = [(PHChangeRequest *)self uuid];
          *(_DWORD *)buf = 138412546;
          v33 = v9;
          __int16 v34 = 2112;
          v35 = v24;
          _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Failed to find source asset %@ for placeholder asset %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    if (v10)
    {
      v21 = [v10 additionalAttributes];
      [v21 setDestinationAssetCopyState:0xFFFFFFFFLL];
    }
    v22 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Placeholder asset %@ no longer exists in the database", buf, 0xCu);
    }
  }
}

void __95__PHAssetCreationRequestPlaceholderSupport_performTransactionCompletionHandlingInPhotoLibrary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) libraryServicesManager];
  v3 = [v2 databaseContext];
  id v4 = (id)[v3 newShortLivedLibraryWithName:"-[PHAssetCreationRequestPlaceholderSupport performTransactionCompletionHandlingInPhotoLibrary:]_block_invoke"];

  [*(id *)(a1 + 40) _updateManagedAssetAfterResourceDownload:v4];
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PHAssetCreationRequest *)self duplicateAssetIdentifier];
  v8 = +[PHObject uuidFromLocalIdentifier:v7];

  v9 = [MEMORY[0x1E4F8A950] assetWithUUID:v8 inLibrary:v6];
  id v14 = 0;
  v10 = [(PHAssetCreationRequestPlaceholderSupport *)self _createPlaceholderManagedAssetFromSourceManagedAsset:v9 inPhotoLibrary:v6 error:&v14];

  id v11 = v14;
  if (!v10)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to create placeholder asset");

    if (a4)
    {
      id v11 = v12;
      *a4 = v11;
    }
    else
    {
      id v11 = v12;
    }
  }

  return v10;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7035;
  v23 = __Block_byref_object_dispose__7036;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PHAssetCreationRequestPlaceholderSupport_validateInsertIntoPhotoLibrary_error___block_invoke;
  v11[3] = &unk_1E5847CB0;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  v13 = &v15;
  id v14 = &v19;
  [v7 performBlockAndWait:v11];
  int v8 = *((unsigned __int8 *)v16 + 24);
  if (a4 && !*((unsigned char *)v16 + 24))
  {
    *a4 = (id) v20[5];
    int v8 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __81__PHAssetCreationRequestPlaceholderSupport_validateInsertIntoPhotoLibrary_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) duplicateAssetIdentifier];
  id v7 = +[PHObject uuidFromLocalIdentifier:v2];

  v3 = [MEMORY[0x1E4F8A950] assetWithUUID:v7 inLibrary:*(void *)(a1 + 40)];
  if (([v3 isCloudSharedAsset] & 1) != 0 || objc_msgSend(v3, "isPhotoStreamPhoto"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"+[PHAssetCreationRequest creationRequestForAssetCopyFromAsset:options:] API does not support copying cloud shared or photo stream assets");
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)_fetchOptionsForDuplicateAssetPhotoLibraryType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PHPhotoLibrary alloc] initWithPLPhotoLibrary:v4 type:[(PHAssetCreationRequest *)self duplicateAssetPhotoLibraryType]];

  id v6 = [(PHPhotoLibrary *)v5 librarySpecificFetchOptions];

  return v6;
}

- (BOOL)_regenerateResourcesWithLocationDataRemoved:(id)a3 sourceExternalResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v10 count])
  {
    BOOL v39 = 1;
    goto LABEL_45;
  }
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__7035;
  v144 = __Block_byref_object_dispose__7036;
  id v145 = 0;
  v112 = objc_msgSend(v10, "_pl_indexBy:", &__block_literal_global_81);
  v109 = a6;
  id v110 = v11;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = [MEMORY[0x1E4F748D0] policyWithLocation:0];
  [v12 addObject:v13];
  v113 = v12;

  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v15 = *MEMORY[0x1E4F74A30];
  [v14 setObject:&unk_1EEB24FF0 forKeyedSubscript:*MEMORY[0x1E4F74A30]];
  v16 = (void *)MEMORY[0x1E4F8CCE0];
  uint64_t v17 = [v9 uniformTypeIdentifier];
  LODWORD(v16) = [v16 outputSupportedForTypeIdentifier:v17];

  char v18 = (void *)MEMORY[0x1E4F749C0];
  if (v16) {
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F749C0]];
  }
  uint64_t v19 = [MEMORY[0x1E4F748A8] policyWithPolicies:v113];
  [v14 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F749F0]];

  v20 = [MEMORY[0x1E4F1CA60] dictionary];
  [v20 setObject:&unk_1EEB24FF0 forKeyedSubscript:v15];
  [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F74968]];
  [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v18];
  [v20 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F74970]];
  uint64_t v21 = (void *)MEMORY[0x1E4F1CB10];
  v22 = NSTemporaryDirectory();
  v23 = [v21 fileURLWithPath:v22];
  id v24 = NSString;
  v25 = [MEMORY[0x1E4F29128] UUID];
  v26 = [v25 UUIDString];
  v27 = [v24 stringWithFormat:@"PHAssetCreationRequestPlaceholderSupport-%@", v26];
  v111 = [v23 URLByAppendingPathComponent:v27];

  v28 = dispatch_group_create();
  if (!v141[5])
  {
    if ([v9 isPhoto])
    {
      v29 = [v112 objectForKeyedSubscript:&unk_1EEB25008];
      v107 = v29;
      if (v29)
      {
        id v30 = (void *)MEMORY[0x1E4F748C8];
        v31 = [v29 fileURL];
        id v105 = [v30 collectionWithMainResourceURL:v31];

        v32 = (void *)MEMORY[0x1E4F8CCE0];
        v33 = [v9 uniformTypeIdentifier];
        LODWORD(v32) = [v32 outputSupportedForTypeIdentifier:v33];

        if (v32)
        {
          __int16 v34 = (void *)MEMORY[0x1E4F748C8];
          v35 = [v107 fileURL];
          uint64_t v36 = [v35 lastPathComponent];
          v37 = [v111 URLByAppendingPathComponent:v36];
          v38 = [v34 collectionWithMainResourceURL:v37];
        }
        else
        {
          v51 = [v107 fileURL];
          v52 = [v51 lastPathComponent];
          v53 = [v52 stringByDeletingPathExtension];
          v35 = [v53 stringByAppendingPathExtensionForType:*MEMORY[0x1E4F44410]];

          v54 = (void *)MEMORY[0x1E4F748C8];
          uint64_t v36 = [v111 URLByAppendingPathComponent:v35];
          v38 = [v54 collectionWithMainResourceURL:v36];
        }

        dispatch_group_enter(v28);
        id v49 = objc_alloc_init(MEMORY[0x1E4F74898]);
        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_98;
        v134[3] = &unk_1E5842BF8;
        v139 = &v140;
        id v135 = v112;
        id v136 = v10;
        id v137 = v38;
        v138 = v28;
        id v103 = v137;
        [v49 convertImageAtSourceURLCollection:v105 toDestinationURLCollection:v137 options:v14 completionHandler:v134];
      }
      else
      {
        id v103 = 0;
        id v105 = 0;
        id v49 = 0;
      }
      v41 = v107;
      if (v141[5]) {
        goto LABEL_30;
      }
      if (![v9 hasAdjustments])
      {
        v41 = v107;
LABEL_30:
        dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

        goto LABEL_31;
      }
      v99 = v49;
      v55 = [v112 objectForKeyedSubscript:&unk_1EEB25020];
      v101 = v55;
      v41 = v107;
      if (!v55)
      {
        v65 = 0;
        goto LABEL_29;
      }
      v56 = (void *)MEMORY[0x1E4F748C8];
      v57 = [v55 fileURL];
      v98 = [v56 collectionWithMainResourceURL:v57];

      v58 = (void *)MEMORY[0x1E4F748C8];
      v59 = [v101 fileURL];
      v60 = [v59 lastPathComponent];
      v61 = [v111 URLByAppendingPathComponent:v60];
      v62 = [v58 collectionWithMainResourceURL:v61];

      dispatch_group_enter(v28);
      v63 = (id *)v133;
      v133[0] = MEMORY[0x1E4F143A8];
      v133[1] = 3221225472;
      v133[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_102;
      v133[3] = &unk_1E5842BF8;
      v133[8] = &v140;
      v133[4] = v112;
      v133[5] = v10;
      id v64 = v62;
      v133[6] = v64;
      v133[7] = v28;
      [v99 convertImageAtSourceURLCollection:v98 toDestinationURLCollection:v64 options:v14 completionHandler:v133];
    }
    else
    {
      if (v141[5] || ![v9 isVideo]) {
        goto LABEL_31;
      }
      v40 = [v112 objectForKeyedSubscript:&unk_1EEB25038];
      v41 = v40;
      if (v40)
      {
        v42 = (void *)MEMORY[0x1E4F748C8];
        v43 = [v40 fileURL];
        id v105 = [v42 collectionWithMainResourceURL:v43];

        v44 = (void *)MEMORY[0x1E4F748C8];
        v45 = [v41 fileURL];
        v46 = [v45 lastPathComponent];
        v47 = [v111 URLByAppendingPathComponent:v46];
        v48 = [v44 collectionWithMainResourceURL:v47];

        dispatch_group_enter(v28);
        id v49 = objc_alloc_init(MEMORY[0x1E4F748E0]);
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_105;
        v127[3] = &unk_1E5842BF8;
        v132 = &v140;
        id v128 = v112;
        id v129 = v10;
        id v130 = v48;
        v131 = v28;
        id v103 = v130;
        id v50 = (id)[v49 convertVideoAtSourceURLCollection:v105 toDestinationURLCollection:v130 options:v20 completionHandler:v127];
      }
      else
      {
        id v49 = 0;
        id v103 = 0;
        id v105 = 0;
      }
      if (v141[5] || ![v9 hasAdjustments]) {
        goto LABEL_30;
      }
      v99 = v49;
      v107 = v41;
      v66 = [v112 objectForKeyedSubscript:&unk_1EEB25050];
      v101 = v66;
      if (!v66)
      {
        v65 = 0;
        goto LABEL_29;
      }
      v67 = (void *)MEMORY[0x1E4F748C8];
      v68 = [v66 fileURL];
      v98 = [v67 collectionWithMainResourceURL:v68];

      v69 = (void *)MEMORY[0x1E4F748C8];
      v70 = [v101 fileURL];
      v71 = [v70 lastPathComponent];
      v72 = [v111 URLByAppendingPathComponent:v71];
      v73 = [v69 collectionWithMainResourceURL:v72];

      dispatch_group_enter(v28);
      v63 = (id *)v126;
      v126[0] = MEMORY[0x1E4F143A8];
      v126[1] = 3221225472;
      v126[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_108;
      v126[3] = &unk_1E5842BF8;
      v126[8] = &v140;
      v126[4] = v112;
      v126[5] = v10;
      id v64 = v73;
      v126[6] = v64;
      v126[7] = v28;
      id v74 = (id)[v99 convertVideoAtSourceURLCollection:v98 toDestinationURLCollection:v64 options:v20 completionHandler:v126];
    }

    v41 = v107;
    v65 = v101;
LABEL_29:

    id v49 = v99;
    goto LABEL_30;
  }
LABEL_31:
  if (!v141[5] && [v9 isPhotoIris])
  {
    v75 = [v112 objectForKeyedSubscript:&unk_1EEB25068];
    v76 = v75;
    if (v75)
    {
      v77 = (void *)MEMORY[0x1E4F748C8];
      v78 = [v75 fileURL];
      v108 = [v77 collectionWithMainResourceURL:v78];

      v79 = (void *)MEMORY[0x1E4F748C8];
      v80 = [v76 fileURL];
      v81 = [v80 lastPathComponent];
      v82 = [v111 URLByAppendingPathComponent:v81];
      v83 = [v79 collectionWithMainResourceURL:v82];

      dispatch_group_enter(v28);
      id v84 = objc_alloc_init(MEMORY[0x1E4F748E0]);
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_111;
      v120[3] = &unk_1E5842BF8;
      v125 = &v140;
      id v121 = v112;
      id v122 = v10;
      id v85 = v83;
      id v123 = v85;
      v124 = v28;
      id v86 = (id)[v84 convertVideoAtSourceURLCollection:v108 toDestinationURLCollection:v85 options:v20 completionHandler:v120];
    }
    else
    {
      id v84 = 0;
      v108 = 0;
      id v85 = 0;
    }
    if (!v141[5] && [v9 hasAdjustments])
    {
      v104 = v84;
      v87 = [v112 objectForKeyedSubscript:&unk_1EEB25080];
      id v106 = v87;
      if (v87)
      {
        v88 = (void *)MEMORY[0x1E4F748C8];
        v89 = [v87 fileURL];
        v100 = [v88 collectionWithMainResourceURL:v89];

        v90 = (void *)MEMORY[0x1E4F748C8];
        v102 = [v106 fileURL];
        v91 = [v102 lastPathComponent];
        v92 = [v111 URLByAppendingPathComponent:v91];
        v93 = [v90 collectionWithMainResourceURL:v92];

        dispatch_group_enter(v28);
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_114;
        v114[3] = &unk_1E5842BF8;
        v119 = &v140;
        id v115 = v112;
        id v116 = v10;
        id v94 = v93;
        id v117 = v94;
        v118 = v28;
        id v95 = (id)[v104 convertVideoAtSourceURLCollection:v100 toDestinationURLCollection:v94 options:v20 completionHandler:v114];

        v87 = v106;
      }

      id v84 = v104;
    }
    dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
  }
  v96 = v141;
  if (v109)
  {
    id *v109 = (id) v141[5];
    v96 = v141;
  }
  BOOL v39 = v96[5] == 0;

  _Block_object_dispose(&v140, 8);
  id v11 = v110;
LABEL_45:

  return v39;
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_98(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v10 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = v5;
    int v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) objectForKey:&unk_1EEB25008];
    [*(id *)(a1 + 40) removeObject:v8];
    id v9 = [*(id *)(a1 + 48) resourceURLForRole:*MEMORY[0x1E4F74910]];
    [v8 setFileURL:v9];

    [*(id *)(a1 + 40) addObject:v8];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_102(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v10 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = v5;
    int v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) objectForKey:&unk_1EEB25020];
    [*(id *)(a1 + 40) removeObject:v8];
    id v9 = [*(id *)(a1 + 48) resourceURLForRole:*MEMORY[0x1E4F74910]];
    [v8 setFileURL:v9];

    [*(id *)(a1 + 40) addObject:v8];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_105(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v10 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = v5;
    int v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) objectForKey:&unk_1EEB25038];
    [*(id *)(a1 + 40) removeObject:v8];
    id v9 = [*(id *)(a1 + 48) resourceURLForRole:*MEMORY[0x1E4F74910]];
    [v8 setFileURL:v9];

    [*(id *)(a1 + 40) addObject:v8];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_108(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v10 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = v5;
    int v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) objectForKey:&unk_1EEB25050];
    [*(id *)(a1 + 40) removeObject:v8];
    id v9 = [*(id *)(a1 + 48) resourceURLForRole:*MEMORY[0x1E4F74910]];
    [v8 setFileURL:v9];

    [*(id *)(a1 + 40) addObject:v8];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_111(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v10 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = v5;
    int v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) objectForKey:&unk_1EEB25068];
    [*(id *)(a1 + 40) removeObject:v8];
    id v9 = [*(id *)(a1 + 48) resourceURLForRole:*MEMORY[0x1E4F74910]];
    [v8 setFileURL:v9];

    [*(id *)(a1 + 40) addObject:v8];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_114(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v10 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = v5;
    int v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) objectForKey:&unk_1EEB25080];
    [*(id *)(a1 + 40) removeObject:v8];
    id v9 = [*(id *)(a1 + 48) resourceURLForRole:*MEMORY[0x1E4F74910]];
    [v8 setFileURL:v9];

    [*(id *)(a1 + 40) addObject:v8];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 type];

  return [v2 numberWithInteger:v3];
}

- (void)_updateManagedAssetAfterResourceDownload:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 1;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__7035;
  v13[4] = __Block_byref_object_dispose__7036;
  id v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__7035;
  v11[4] = __Block_byref_object_dispose__7036;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PHAssetCreationRequestPlaceholderSupport__updateManagedAssetAfterResourceDownload___block_invoke;
  v6[3] = &unk_1E5847198;
  int v8 = v11;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  id v9 = v15;
  id v10 = v13;
  [v5 performTransaction:v6];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
}

void __85__PHAssetCreationRequestPlaceholderSupport__updateManagedAssetAfterResourceDownload___block_invoke(uint64_t a1)
{
  v77[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = +[PHObject uuidFromLocalIdentifier:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "setBundleScope:", objc_msgSend(*(id *)(a1 + 32), "_bundleScopeForPlaceholderAsset"));
  uint64_t v6 = [MEMORY[0x1E4F8A950] assetWithUUID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) inLibrary:*(void *)(a1 + 40)];

  if (!v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Placeholder asset %@ no longer exists in the database. Terminating!", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v14 = 0;
LABEL_11:
    v23 = 0;
    goto LABEL_12;
  }
  id v10 = [*(id *)(a1 + 32) _fetchOptionsForDuplicateAssetPhotoLibraryType:*(void *)(a1 + 40)];
  id v11 = [*(id *)(a1 + 32) duplicateAssetIdentifier];
  v77[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
  v13 = +[PHAsset fetchAssetsWithLocalIdentifiers:v12 options:v10];
  id v14 = [v13 firstObject];

  if (!v14)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    char v16 = [*(id *)(a1 + 32) duplicateAssetIdentifier];
    uint64_t v17 = objc_msgSend(v15, "ph_genericErrorWithLocalizedDescription:", @"Failed to fetch source asset with duplicate UUID: %@", v16);
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_11;
  }
  v20 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v21 = v20[1201];
  uint64_t v22 = v20[1200];
  id v75 = 0;
  *(_OWORD *)buf = *MEMORY[0x1E4F1F9F8];
  *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v23 = [v20 duplicatedAssetResourcesFromAsset:v14 stillSourceTime:buf flattenLivePhotoIntoStillPhoto:v21 duplicateAsOriginal:0 duplicateWithAdjustmentsBakedIn:v22 duplicatePhotoAsData:0 error:&v75];
  id v24 = v75;
  if (v24)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to duplicate asset resources for placeholder asset: %@ error: %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v24);
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
LABEL_12:
  v28 = (void *)MEMORY[0x1E4F8A950];
  v29 = [v14 uuid];
  id v30 = [v28 assetWithUUID:v29 inLibrary:*(void *)(a1 + 40)];

  int v31 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    BOOL v32 = v30 == 0;
  }
  else {
    BOOL v32 = 1;
  }
  if (!v32)
  {
    v33 = *(unsigned char **)(a1 + 32);
    if (v33[1202]) {
      goto LABEL_21;
    }
    uint64_t v34 = *(void *)(a1 + 40);
    id v74 = 0;
    char v35 = [v33 _regenerateResourcesWithLocationDataRemoved:v14 sourceExternalResources:v23 photoLibrary:v34 error:&v74];
    id v36 = v74;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v35;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to regenerate resources with location data removed for placeholder asset: %@ error: %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v36);
      uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
      BOOL v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v37;
    }
    int v31 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if (!v31)
  {
    v47 = 0;
    v40 = 0;
    goto LABEL_36;
  }
LABEL_21:
  v40 = [[PHAssetResourceBag alloc] initWithAssetResources:v23 assetCreationRequest:*(void *)(a1 + 32)];
  uint64_t v41 = *(void *)(a1 + 40);
  id v73 = 0;
  [(PHAssetResourceBag *)v40 validateForInsertIntoPhotoLibrary:v41 error:&v73];
  id v42 = v73;
  id v43 = v73;
  if (v43)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v42);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v47 = 0;
LABEL_36:
    v60 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      uint64_t v61 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v62 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v61;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v62;
      _os_log_impl(&dword_19B043000, v60, OS_LOG_TYPE_ERROR, "Failed to update placeholder asset %@ after source resources download: %@", buf, 0x16u);
    }

    v63 = (void *)MEMORY[0x1E4F8A950];
    uint64_t v64 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v65 = [*(id *)(a1 + 40) managedObjectContext];
    v66 = [v63 assetWithUUID:v64 inManagedObjectContext:v65];

    if (v66)
    {
      [v66 setDestinationAssetCopyStateOnSourceAsset:0xFFFFFFFFLL];
      v67 = [*(id *)(a1 + 40) managedObjectContext];
      [v67 deleteObject:v66];
    }
    goto LABEL_41;
  }
  uint64_t v44 = *(void *)(a1 + 40);
  uint64_t v45 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v46 = *(void **)(a1 + 32);
  id v72 = 0;
  v47 = [v46 createAssetFromValidatedResources:v40 withUUID:v45 assetAlreadyExistsAsPlaceholder:1 inPhotoLibrary:v44 error:&v72];
  id v48 = v72;
  if (v47)
  {
    id v49 = [v47 momentShare];

    if (v49)
    {
      objc_msgSend(v47, "fixupPlaceholderAssetWithSavedAssetType:", objc_msgSend(MEMORY[0x1E4F8BA10], "savedAssetTypeForMomentSharedAsset"));
    }
    else
    {
      v53 = [v47 fetchSourceAssetForDuplicationIfExists];
      v54 = [v53 additionalAttributes];
      v55 = [v54 originalStableHash];

      v71 = v53;
      v56 = [v53 additionalAttributes];
      v57 = [v56 adjustedStableHash];

      if (v55)
      {
        v58 = [v47 additionalAttributes];
        [v58 setOriginalStableHash:v55];
      }
      if (v57)
      {
        v59 = [v47 additionalAttributes];
        [v59 setAdjustedStableHash:v57];
      }
      objc_msgSend(v47, "fixupPlaceholderAssetWithSavedAssetType:", objc_msgSend(MEMORY[0x1E4F8BA10], "defaultSavedAssetTypeForPhotoKitAssetCreationRequest"));
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v50 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to fetch destination asset with UUID: %@ error: %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v48);
    uint64_t v51 = *(void *)(*(void *)(a1 + 64) + 8);
    v52 = *(void **)(v51 + 40);
    *(void *)(v51 + 40) = v50;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_36;
  }
LABEL_41:
  v68 = *(void **)(*(void *)(a1 + 32) + 1176);
  if (v68)
  {
    [v68 completeTransactionScope:*MEMORY[0x1E4F8B790]];
    uint64_t v69 = *(void *)(a1 + 32);
    v70 = *(void **)(v69 + 1176);
    *(void *)(v69 + 1176) = 0;
  }
}

- (id)_createPlaceholderManagedAssetFromSourceManagedAsset:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v78 = a4;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  char v99 = 1;
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__7035;
  id v94 = __Block_byref_object_dispose__7036;
  id v95 = 0;
  LOWORD(v69) = 257;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F8A950], "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v78, 0, 0, objc_msgSend(MEMORY[0x1E4F8BA10], "savedAssetTypeForPlaceholder"), -[PHAssetCreationRequestPlaceholderSupport _bundleScopeForPlaceholderAsset](self, "_bundleScopeForPlaceholderAsset"), 0, 0, 0, 0, v69);
  if (!v8)
  {
    *((unsigned char *)v97 + 24) = 0;
    id v9 = (void *)MEMORY[0x1E4F28C58];
    id v10 = [v7 uuid];
    uint64_t v11 = objc_msgSend(v9, "ph_genericErrorWithLocalizedDescription:", @"Failed to insert placeholder asset for source asset: %@", v10);
    id v12 = (void *)v91[5];
    v91[5] = v11;
  }
  if (!*((unsigned char *)v97 + 24)) {
    goto LABEL_47;
  }
  int v13 = [(PHAssetCreationRequest *)self duplicateAssetPhotoLibraryType];
  if (v13 == 1) {
    int v75 = [MEMORY[0x1E4F8A950] shouldPerformServerCopyWithSourceAsset:v7 copyingFromMomentShare:1 photoLibrary:v78];
  }
  else {
    int v75 = 0;
  }
  BOOL v89 = 0;
  [v7 deferredProcessingNeeded];
  if (PLManagedAssetDeferredProcessingNeededRequiresPhotoFinalization())
  {
    int v14 = 1;
  }
  else
  {
    [v7 videoDeferredProcessingNeeded];
    int v14 = PLManagedAssetVideoDeferredProcessingNeededRequiresVideoFinalization();
  }
  int v15 = [v7 deferredProcessingNeeded];
  BOOL v72 = v15 == 2;
  if (v13 == 1)
  {
    unsigned int v76 = 0;
    char v70 = 1;
    char v73 = 1;
    char v74 = 1;
  }
  else
  {
    char v16 = [(PHAssetCreationRequest *)self adjustmentBakeInOptions];
    if (!v16) {
      char v16 = objc_alloc_init(PHAssetCreationAdjustmentBakeInOptions);
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F8A950];
    uint64_t v18 = [(PHAssetCreationAdjustmentBakeInOptions *)v16 plRepresentation];
    unsigned int v76 = [v17 shouldBakeInAdjustmentsAndFlattenLivePhoto:&v89 forSourceAsset:v7 adjustmentBakeInOptions:v18];

    if ([(PHAssetCreationAdjustmentBakeInOptions *)v16 flattenLivePhotoToStillIfNeeded])
    {
      unsigned int v76 = 1;
      BOOL v89 = 1;
    }
    uint64_t v19 = [(PHAssetCreationRequest *)self metadataCopyOptions];
    if (!v19) {
      uint64_t v19 = objc_alloc_init(PHAssetCreationMetadataCopyOptions);
    }
    char v74 = [(PHAssetCreationMetadataCopyOptions *)v19 shouldCopyTitleDescriptionAndKeywords];
    char v73 = [(PHAssetCreationMetadataCopyOptions *)v19 shouldCopySpatialOverCaptureResources];
    char v70 = [(PHAssetCreationMetadataCopyOptions *)v19 shouldCopyLocationData];
  }
  int v20 = *((unsigned __int8 *)v97 + 24);
  if (v15 == 2) {
    int v21 = 1;
  }
  else {
    int v21 = v14;
  }
  if (v13 != 1 && *((unsigned char *)v97 + 24) && !v75 && v21)
  {
    uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PHAssetCreationRequestPlaceholderSupport _createPlaceholderManagedAssetFromSourceManagedAsset:inPhotoLibrary:error:]");
    v23 = objc_msgSend(v7, "pl_photoLibrary");
    id v24 = [v23 libraryServicesManager];
    uint64_t v25 = [v24 databaseContext];
    id v71 = v22;
    uint64_t v26 = objc_msgSend(v25, "newShortLivedLibraryWithName:", objc_msgSend(v71, "UTF8String"));

    v27 = [v8 scopedIdentifier];
    v28 = [v7 scopedIdentifier];
    v29 = [v7 uuid];
    id v30 = dispatch_group_create();
    dispatch_group_enter(v30);
    int v31 = [v26 managedObjectContext];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke;
    v79[3] = &unk_1E5842BB0;
    id v32 = v29;
    id v80 = v32;
    id v33 = v26;
    id v81 = v33;
    char v87 = v14;
    id v34 = v28;
    id v82 = v34;
    id v35 = v27;
    id v83 = v35;
    id v36 = v30;
    id v84 = v36;
    id v85 = &v96;
    id v86 = &v90;
    BOOL v88 = v72;
    [v31 performBlock:v79];

    dispatch_group_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v37 = [v78 managedObjectContext];
    [v37 refreshAllObjects];

    int v20 = *((unsigned __int8 *)v97 + 24);
  }
  if (!v20
    || ([(PHAssetCreationRequest *)self momentShareUUID],
        uint64_t v38 = objc_claimAutoreleasedReturnValue(),
        BOOL v39 = v38 == 0,
        v38,
        v39))
  {
    id v43 = 0;
  }
  else
  {
    v40 = (void *)MEMORY[0x1E4F8A9C0];
    uint64_t v41 = [(PHAssetCreationRequest *)self momentShareUUID];
    id v42 = [v78 managedObjectContext];
    id v43 = [v40 shareWithUUID:v41 includeTrashed:1 inManagedObjectContext:v42];
  }
  if (!*((unsigned char *)v97 + 24)) {
    goto LABEL_45;
  }
  uint64_t v44 = [(PHChangeRequest *)self uuid];
  uint64_t v45 = [(PHAssetCreationRequestPlaceholderSupport *)self _bundleScopeForPlaceholderAsset];
  v46 = [(PHAssetCreationRequest *)self importSessionID];
  BYTE2(v68) = v73;
  BYTE1(v68) = v74;
  LOBYTE(v68) = v89;
  char v47 = objc_msgSend(v8, "setupPlaceholderAssetWithRequiredPropertiesFromSourceAsset:placeholderAssetUUID:bundleScope:momentShare:importSessionID:bakeInAdjustmentsFromSourceAsset:flattenLivePhoto:copyTitleDescriptionAndKeywords:copyCameraProcessingAdjustmentResources:library:", v7, v44, v45, v43, v46, v76, v68, v78);
  *((unsigned char *)v97 + 24) = v47;

  if (*((unsigned char *)v97 + 24))
  {
    int v48 = 1;
  }
  else
  {
    id v49 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = [v8 scopedIdentifier];
    uint64_t v51 = objc_msgSend(v49, "ph_genericErrorWithLocalizedDescription:", @"Failed to setup placeholder asset: %@", v50);
    v52 = (void *)v91[5];
    v91[5] = v51;

    int v48 = *((unsigned __int8 *)v97 + 24);
    if (!*((unsigned char *)v97 + 24)) {
      goto LABEL_41;
    }
  }
  if (v75)
  {
    self->_placeholderCreationMode = 0;
    v53 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = [v8 scopedIdentifier];
      v55 = [v7 scopedIdentifier];
      *(_DWORD *)buf = 138412546;
      v101 = v54;
      __int16 v102 = 2112;
      id v103 = v55;
      _os_log_impl(&dword_19B043000, v53, OS_LOG_TYPE_INFO, "Decided to perform server copy on placeholder asset: %@ source asset: %@", buf, 0x16u);
    }
    if (*((unsigned char *)v97 + 24))
    {
      int v56 = [MEMORY[0x1E4F8A950] createMasterForPlaceholderAsset:v8 withSourceAsset:v7 shouldBakeInAdjustments:v76 shouldFlattenLivePhoto:v89 placeholderResourceURLToSourceResourceURLMap:0 photoLibrary:v78];
      *((unsigned char *)v97 + 24) = v56;
      if (v56)
      {
        char v57 = [MEMORY[0x1E4F8A950] createAssetResourcesForPlaceholderAsset:v8 withSourceAsset:v7 shouldBakeInAdjustments:v76 shouldFlattenLivePhoto:v89 placeholderResourceURLToSourceResourceURLMap:0 photoLibrary:v78];
        *((unsigned char *)v97 + 24) = v57;
      }
    }
    goto LABEL_45;
  }
LABEL_41:
  if (v48)
  {
    self->_placeholderCreationMode = 1;
    self->_downloadSourceMode_shouldBakeInAdjustments = v76;
    self->_downloadSourceMode_shouldFlattenLivePhoto = v89;
    self->_downloadSourceMode_shouldCopyLocationData = v70;
    v58 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = [v8 scopedIdentifier];
      v60 = [v7 scopedIdentifier];
      *(_DWORD *)buf = 138412546;
      v101 = v59;
      __int16 v102 = 2112;
      id v103 = v60;
      _os_log_impl(&dword_19B043000, v58, OS_LOG_TYPE_INFO, "Decided to download source resources on placeholder asset: %@ source asset: %@", buf, 0x16u);
    }
  }
LABEL_45:

  if (!*((unsigned char *)v97 + 24))
  {
LABEL_47:
    BOOL v62 = 1;
    goto LABEL_48;
  }
  uint64_t v61 = [v7 additionalAttributes];
  [v61 setDestinationAssetCopyState:1];

  BOOL v62 = *((unsigned char *)v97 + 24) == 0;
LABEL_48:
  if (a5 && v62)
  {
    v63 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      uint64_t v64 = [v8 scopedIdentifier];
      v65 = [v7 scopedIdentifier];
      uint64_t v66 = v91[5];
      *(_DWORD *)buf = 138412802;
      v101 = v64;
      __int16 v102 = 2112;
      id v103 = v65;
      __int16 v104 = 2112;
      uint64_t v105 = v66;
      _os_log_impl(&dword_19B043000, v63, OS_LOG_TYPE_INFO, "Failed to create placeholder asset %@ with source asset %@ returning error: %@", buf, 0x20u);
    }
    *a5 = (id) v91[5];
  }
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&v96, 8);

  return v8;
}

void __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8A950];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v5 = [v2 assetWithUUID:v3 inManagedObjectContext:v4];

  if (*(unsigned char *)(a1 + 88))
  {
    id v6 = [v5 persistedResourcesMatching:&__block_literal_global_7089];
    if ([v6 count])
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        id v25 = v6;
        uint64_t v26 = v5;
        uint64_t v10 = *(void *)v38;
        do
        {
          uint64_t v11 = v7;
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v38 != v10) {
              objc_enumerationMutation(v11);
            }
            int v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            int v14 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              uint64_t v15 = *(void *)(a1 + 48);
              uint64_t v16 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = v15;
              __int16 v44 = 2112;
              uint64_t v45 = v16;
              _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_INFO, "Source asset %@ for placeholder asset %@ needs deferred processing before CMM publish", buf, 0x16u);
            }

            id v17 = objc_alloc_init(MEMORY[0x1E4F8AB48]);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
            uint64_t v18 = [v13 dataStore];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_41;
            v32[3] = &unk_1E5842B60;
            long long v36 = *(_OWORD *)(a1 + 72);
            id v33 = *(id *)(a1 + 56);
            id v34 = *(id *)(a1 + 48);
            id v35 = *(id *)(a1 + 64);
            id v19 = (id)[v18 requestLocalAvailabilityChange:1 forResource:v13 options:v17 completion:v32];
          }
          id v7 = v11;
          uint64_t v9 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v9);
        id v6 = v25;
        id v5 = v26;
      }
    }
    else
    {
      id v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(a1 + 48);
        uint64_t v24 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v23;
        __int16 v44 = 2112;
        uint64_t v45 = v24;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Failed to find original resource that needs finalization in source asset %@ for placeholder asset %@", buf, 0x16u);
      }
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 89))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F74898]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F748E0]);
    int v21 = [NSString stringWithFormat:@"CMM requested on-demand deferred adjustment generation for asset %@", *(void *)(a1 + 32)];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_51;
    v27[3] = &unk_1E5842B88;
    long long v31 = *(_OWORD *)(a1 + 72);
    id v28 = *(id *)(a1 + 56);
    id v29 = *(id *)(a1 + 48);
    id v30 = *(id *)(a1 + 64);
    id v22 = (id)[v5 generateDeferredAdjustmentForCMMPlaceholderWithImageConversionClient:v6 videoConversionClient:v20 reason:v21 completion:v27];

LABEL_18:
  }
}

void __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_41(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to finalize original resource for placeholder asset: %@ error: %@", *(void *)(a1 + 32), a2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      uint64_t v10 = "Failed to finalize source asset %@ for placeholder asset %@ error: %@";
      uint64_t v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_19B043000, v11, v12, v10, buf, v13);
    }
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      uint64_t v10 = "Successfully finalized source asset %@ for placeholder asset %@";
      uint64_t v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 22;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_51(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to finalize async adjustment for placeholder asset: %@ error: %@", *(void *)(a1 + 32), a3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      uint64_t v11 = "Failed to finalize async adjustment for source asset %@ for placeholder asset %@ error: %@";
      os_log_type_t v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_19B043000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      uint64_t v11 = "Successfully finalized async adjustment for source asset %@ for placeholder asset %@";
      os_log_type_t v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 22;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F8A950];
  id v3 = a2;
  uint64_t v4 = [v2 predicateToFetchResourcesAwaitingLocalAvailabilityChange];
  uint64_t v5 = [v4 evaluateWithObject:v3];

  return v5;
}

- (unsigned)_bundleScopeForPlaceholderAsset
{
  return [(PHAssetCreationRequest *)self duplicateAssetPhotoLibraryType] == 0;
}

- (void)changeFailedOnDaemonWithLibrary:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!self->_placeholderCreationMode)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__PHAssetCreationRequestPlaceholderSupport_changeFailedOnDaemonWithLibrary_error___block_invoke;
    v7[3] = &unk_1E5848DF0;
    v7[4] = self;
    id v8 = v5;
    [v8 performBlockAndWait:v7];
  }
}

void __82__PHAssetCreationRequestPlaceholderSupport_changeFailedOnDaemonWithLibrary_error___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A950];
  id v3 = [*(id *)(a1 + 32) uuid];
  id v5 = [v2 assetWithUUID:v3 inLibrary:*(void *)(a1 + 40)];

  uint64_t v4 = v5;
  if (v5)
  {
    [v5 setDestinationAssetCopyStateOnSourceAsset:0xFFFFFFFFLL];
    uint64_t v4 = v5;
  }
}

- (void)changeFailedOnClientWithLibrary:(id)a3 error:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PHAssetCreationRequestPlaceholderSupport_changeFailedOnClientWithLibrary_error___block_invoke;
  v7[3] = &unk_1E5848DF0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __82__PHAssetCreationRequestPlaceholderSupport_changeFailedOnClientWithLibrary_error___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A950];
  id v3 = [*(id *)(a1 + 32) uuid];
  id v5 = [v2 assetWithUUID:v3 inLibrary:*(void *)(a1 + 40)];

  uint64_t v4 = v5;
  if (v5)
  {
    [v5 setDestinationAssetCopyStateOnSourceAsset:0xFFFFFFFFLL];
    uint64_t v4 = v5;
  }
}

- (PHAssetCreationRequestPlaceholderSupport)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PHAssetCreationRequestPlaceholderSupport;
  id v5 = [(PHAssetCreationRequest *)&v8 initWithXPCDict:a3 request:a4 clientAuthorization:a5];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F29268] currentConnection];
    objc_storeWeak((id *)&v5->_clientConnection, v6);
  }
  return v5;
}

- (id)initForNewObjectWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [[PHChangeRequestHelper alloc] initForNewObjectWithUUID:v4 changeRequest:self];

  id v6 = [(PHAssetCreationRequest *)self initWithHelper:v5];
  return v6;
}

@end