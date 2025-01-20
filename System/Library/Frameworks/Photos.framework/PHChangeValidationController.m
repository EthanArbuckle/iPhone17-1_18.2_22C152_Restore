@interface PHChangeValidationController
- (BOOL)_promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 extensionItem:(id)a7;
- (BOOL)_recordObjectID:(id)a3 withSimpleDeleteValidators:(id)a4;
- (BOOL)confirmationRequired;
- (BOOL)promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6;
- (BOOL)promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 previewAssetLocalIdentifiers:(id)a7;
- (NSArray)albumsToDelete;
- (NSArray)assetsToChangeContent;
- (NSArray)assetsToDelete;
- (NSArray)assetsToHide;
- (NSArray)assetsToRevert;
- (NSArray)foldersToDelete;
- (NSArray)renderedContentURLs;
- (NSManagedObjectContext)managedObjectContext;
- (NSOrderedSet)deleteRequests;
- (NSOrderedSet)insertRequests;
- (NSOrderedSet)updateRequests;
- (NSString)clientName;
- (PHChangeValidationController)initWithInsertRequests:(id)a3 updateRequests:(id)a4 deleteRequests:(id)a5 context:(id)a6 photoLibrary:(id)a7;
- (PLPhotoLibrary)photoLibrary;
- (id)_failureWithError:(id)a3;
- (id)_prepare;
- (id)_simpleDeleteValidatorsWithManagedObjectContext:(id)a3;
- (id)_validateSimpleDeletionsWithValidators:(id)a3 requestsByObjectID:(id)a4;
- (id)validate;
@end

@implementation PHChangeValidationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_foldersToDelete, 0);
  objc_storeStrong((id *)&self->_albumsToDelete, 0);
  objc_storeStrong((id *)&self->_assetsToDelete, 0);
  objc_storeStrong((id *)&self->_assetsToHide, 0);
  objc_storeStrong((id *)&self->_assetsToRevert, 0);
  objc_storeStrong((id *)&self->_assetsToChangeContent, 0);
  objc_storeStrong((id *)&self->_renderedContentURLs, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_deleteRequests, 0);
  objc_storeStrong((id *)&self->_updateRequests, 0);

  objc_storeStrong((id *)&self->_insertRequests, 0);
}

- (BOOL)confirmationRequired
{
  return self->_confirmationRequired;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSArray)foldersToDelete
{
  return self->_foldersToDelete;
}

- (NSArray)albumsToDelete
{
  return self->_albumsToDelete;
}

- (NSArray)assetsToDelete
{
  return self->_assetsToDelete;
}

- (NSArray)assetsToHide
{
  return self->_assetsToHide;
}

- (NSArray)assetsToRevert
{
  return self->_assetsToRevert;
}

- (NSArray)assetsToChangeContent
{
  return self->_assetsToChangeContent;
}

- (NSArray)renderedContentURLs
{
  return self->_renderedContentURLs;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (NSOrderedSet)deleteRequests
{
  return self->_deleteRequests;
}

- (NSOrderedSet)updateRequests
{
  return self->_updateRequests;
}

- (NSOrderedSet)insertRequests
{
  return self->_insertRequests;
}

- (BOOL)_promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 extensionItem:(id)a7
{
  v36[7] = *MEMORY[0x1E4F143B8];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v11) {
    v16 = v11;
  }
  else {
    v16 = &stru_1EEAC1950;
  }
  uint64_t v17 = *MEMORY[0x1E4F1D9A8];
  v35[0] = *MEMORY[0x1E4F1D990];
  v35[1] = v17;
  if (v12) {
    v18 = v12;
  }
  else {
    v18 = &stru_1EEAC1950;
  }
  v36[0] = v16;
  v36[1] = v18;
  uint64_t v19 = *MEMORY[0x1E4F1D9D0];
  v35[2] = *MEMORY[0x1E4F1D9E0];
  v35[3] = v19;
  v36[2] = v13;
  v36[3] = v14;
  uint64_t v20 = *MEMORY[0x1E4FA7328];
  v35[4] = *MEMORY[0x1E4F1D9B8];
  v35[5] = v20;
  v36[4] = MEMORY[0x1E4F1CC38];
  v36[5] = MEMORY[0x1E4F1CC38];
  v35[6] = *MEMORY[0x1E4FA7340];
  v36[6] = MEMORY[0x1E4F1CC38];
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:7];
  v22 = v21;
  if (v15)
  {
    v23 = (void *)[v21 mutableCopy];
    [v23 setObject:@"com.apple.mobileslideshow.DestructiveChangeConfirmation" forKeyedSubscript:*MEMORY[0x1E4FA7348]];
    v24 = (void *)MEMORY[0x1E4F28DB0];
    id v34 = v15;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    v26 = [v24 archivedDataWithRootObject:v25 requiringSecureCoding:1 error:0];
    [v23 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4FA7350]];

    uint64_t v27 = [v23 copy];
    v22 = (void *)v27;
  }
  v28 = PLBackendGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v33 = 138412290;
    *(void *)&v33[4] = v22;
    _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_INFO, "Prompting for user confirmation %@", v33, 0xCu);
  }

  v29 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, (CFDictionaryRef)v22);
  if (v29)
  {
    v30 = v29;
    *(void *)v33 = 0;
    CFUserNotificationReceiveResponse(v29, 0.0, (CFOptionFlags *)v33);
    BOOL v31 = (v33[0] & 3) == 0;
    CFRelease(v30);
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 previewAssetLocalIdentifiers:(id)a7
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a7)
  {
    v16 = (objc_class *)MEMORY[0x1E4F28C80];
    id v17 = a7;
    a7 = objc_alloc_init(v16);
    v30[0] = @"previewStyle";
    v30[1] = @"assetLocalIdentifiers";
    v31[0] = @"currentAssets";
    v31[1] = v17;
    v30[2] = @"photoLibraryURLString";
    v28 = [(PHChangeValidationController *)self photoLibrary];
    v18 = [v28 pathManager];
    uint64_t v19 = [v18 libraryURL];
    [v19 absoluteString];
    uint64_t v20 = v29 = self;
    v31[2] = v20;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
    id v21 = v15;
    id v22 = v14;
    id v23 = v13;
    v25 = id v24 = v12;

    [a7 setUserInfo:v25];
    id v12 = v24;
    id v13 = v23;
    id v14 = v22;
    id v15 = v21;

    self = v29;
  }
  BOOL v26 = [(PHChangeValidationController *)self _promptForUserConfirmationWithTitle:v12 message:v13 defaultButtonTitle:v14 alternateButtonTitle:v15 extensionItem:a7];

  return v26;
}

- (BOOL)promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6
{
  return [(PHChangeValidationController *)self _promptForUserConfirmationWithTitle:a3 message:a4 defaultButtonTitle:a5 alternateButtonTitle:a6 extensionItem:0];
}

- (id)_failureWithError:(id)a3
{
  return +[PHChangeRequest sanitizedFailureWithError:a3];
}

- (id)validate
{
  v116[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PHChangeValidationController *)self _prepare];
  if ([v3 isSuccess]
    && [(PHChangeValidationController *)self confirmationRequired])
  {
    v4 = [(PHChangeValidationController *)self assetsToHide];
    v5 = [(PHChangeValidationController *)self assetsToDelete];
    v6 = [(PHChangeValidationController *)self albumsToDelete];
    v7 = [(PHChangeValidationController *)self foldersToDelete];
    uint64_t v8 = [v4 count];
    uint64_t v40 = [v5 count];
    *(void *)&long long v39 = [v6 count];
    *((void *)&v39 + 1) = [v7 count];
    v37 = [(PHChangeValidationController *)self clientName];
    v35 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v40];
    uint64_t v109 = 0;
    v110 = &v109;
    uint64_t v111 = 0x3032000000;
    v112 = __Block_byref_object_copy__2005;
    v113 = __Block_byref_object_dispose__2006;
    id v114 = 0;
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x3032000000;
    v106 = __Block_byref_object_copy__2005;
    v107 = __Block_byref_object_dispose__2006;
    id v108 = 0;
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x3032000000;
    v100 = __Block_byref_object_copy__2005;
    v101 = __Block_byref_object_dispose__2006;
    id v102 = 0;
    uint64_t v91 = 0;
    v92 = &v91;
    uint64_t v93 = 0x3032000000;
    v94 = __Block_byref_object_copy__2005;
    v95 = __Block_byref_object_dispose__2006;
    id v96 = 0;
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__2005;
    v89 = __Block_byref_object_dispose__2006;
    id v90 = 0;
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__2005;
    v83 = __Block_byref_object_dispose__2006;
    id v84 = 0;
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__2005;
    v77 = __Block_byref_object_dispose__2006;
    id v78 = 0;
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__2005;
    v71 = __Block_byref_object_dispose__2006;
    id v72 = 0;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__2005;
    v65 = __Block_byref_object_dispose__2006;
    id v66 = 0;
    photoLibrary = self->_photoLibrary;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __40__PHChangeValidationController_validate__block_invoke;
    v41[3] = &unk_1E58420D8;
    v41[4] = self;
    id v30 = v4;
    id v42 = v30;
    uint64_t v10 = v8;
    uint64_t v58 = v8;
    id v36 = v35;
    id v43 = v36;
    v49 = &v109;
    v50 = &v103;
    v51 = &v97;
    id v38 = v37;
    id v44 = v38;
    id v31 = v5;
    id v45 = v31;
    id v11 = v33;
    id v46 = v11;
    v52 = &v91;
    v53 = &v85;
    v54 = &v79;
    long long v60 = v39;
    v55 = &v73;
    v56 = &v67;
    uint64_t v59 = v40;
    v57 = &v61;
    id v32 = v6;
    id v47 = v32;
    id v12 = v7;
    id v48 = v12;
    [(PLPhotoLibrary *)photoLibrary performBlockAndWait:v41];
    id v34 = v12;
    if (!v10 && !v40 && v39 == 0)
    {
      id v13 = v36;
LABEL_20:

      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(&v67, 8);

      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v79, 8);

      _Block_object_dispose(&v85, 8);
      _Block_object_dispose(&v91, 8);

      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(&v103, 8);

      _Block_object_dispose(&v109, 8);
      goto LABEL_21;
    }
    id v14 = objc_opt_class();
    objc_sync_enter(v14);
    v29 = PLServicesLocalizedFrameworkString();
    id v13 = v36;
    if (v10) {
      BOOL v15 = [(PHChangeValidationController *)self promptForUserConfirmationWithTitle:v110[5] message:v104[5] defaultButtonTitle:v98[5] alternateButtonTitle:v29 previewAssetLocalIdentifiers:v36];
    }
    else {
      BOOL v15 = 1;
    }
    if (v15 && v39 != 0)
    {
      uint64_t v16 = v74[5];
      uint64_t v17 = v68[5];
      uint64_t v18 = v62[5];
      uint64_t v19 = PLServicesLocalizedFrameworkString();
      BOOL v15 = [(PHChangeValidationController *)self promptForUserConfirmationWithTitle:v16 message:v17 defaultButtonTitle:v18 alternateButtonTitle:v19];
    }
    if (v15 && v40)
    {
      uint64_t v20 = v92[5];
      uint64_t v21 = v86[5];
      uint64_t v22 = v80[5];
      id v23 = PLServicesLocalizedFrameworkString();
      LOBYTE(v20) = [(PHChangeValidationController *)self promptForUserConfirmationWithTitle:v20 message:v21 defaultButtonTitle:v22 alternateButtonTitle:v23 previewAssetLocalIdentifiers:v11];

      if (v20) {
        goto LABEL_19;
      }
    }
    else if (v15)
    {
LABEL_19:

      objc_sync_exit(v14);
      goto LABEL_20;
    }
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v115 = *MEMORY[0x1E4F28568];
    v116[0] = @"Change request denied by user";
    v25 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1, v29, v30, v31);
    BOOL v26 = objc_msgSend(v24, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3072, v25);

    uint64_t v27 = [(PHChangeValidationController *)self _failureWithError:v26];

    v3 = (void *)v27;
    goto LABEL_19;
  }
LABEL_21:

  return v3;
}

void __40__PHChangeValidationController_validate__block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F8ACA0]) initWithPhotoLibrary:*(void *)(*(void *)(a1 + 32) + 48)];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v43;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v42 + 1) + 8 * v7) uuid];
        v9 = +[PHObject localIdentifierWithUUID:v8];

        [*(id *)(a1 + 48) addObject:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v5);
  }

  if (*(void *)(a1 + 168))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
    id v11 = *(void **)(v10 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 104) + 8);
    id v40 = *(id *)(v12 + 40);
    id obj = v11;
    uint64_t v13 = *(void *)(*(void *)(a1 + 112) + 8);
    id v39 = *(id *)(v13 + 40);
    [v2 getWarningTitle:&obj message:&v40 buttonTitle:&v39 forAssets:*(void *)(a1 + 40) operation:0 clientName:*(void *)(a1 + 56)];
    objc_storeStrong((id *)(v10 + 40), obj);
    objc_storeStrong((id *)(v12 + 40), v40);
    objc_storeStrong((id *)(v13 + 40), v39);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = *(id *)(a1 + 64);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v35 + 1) + 8 * v18) uuid];
        uint64_t v20 = +[PHObject localIdentifierWithUUID:v19];

        [*(id *)(a1 + 72) addObject:v20];
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v16);
  }

  if (*(void *)(a1 + 176))
  {
    uint64_t v21 = *(void *)(*(void *)(a1 + 120) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    uint64_t v23 = *(void *)(*(void *)(a1 + 128) + 8);
    id v33 = *(id *)(v23 + 40);
    id v34 = v22;
    uint64_t v24 = *(void *)(*(void *)(a1 + 136) + 8);
    id v32 = *(id *)(v24 + 40);
    [v2 getDeletionWarningTitle:&v34 message:&v33 buttonTitle:&v32 forAssets:*(void *)(a1 + 64) syndicationAssetCount:0 clientName:*(void *)(a1 + 56) style:1];
    objc_storeStrong((id *)(v21 + 40), v34);
    objc_storeStrong((id *)(v23 + 40), v33);
    objc_storeStrong((id *)(v24 + 40), v32);
  }
  if (*(void *)(a1 + 184) || *(void *)(a1 + 192))
  {
    uint64_t v25 = *(void *)(*(void *)(a1 + 144) + 8);
    BOOL v26 = *(void **)(v25 + 40);
    uint64_t v27 = *(void *)(*(void *)(a1 + 152) + 8);
    id v30 = *(id *)(v27 + 40);
    id v31 = v26;
    uint64_t v28 = *(void *)(*(void *)(a1 + 160) + 8);
    id v29 = *(id *)(v28 + 40);
    [v2 getDeletionWarningTitle:&v31 message:&v30 buttonTitle:&v29 forAlbums:*(void *)(a1 + 80) folders:*(void *)(a1 + 88) clientName:*(void *)(a1 + 56) style:1];
    objc_storeStrong((id *)(v25 + 40), v31);
    objc_storeStrong((id *)(v27 + 40), v30);
    objc_storeStrong((id *)(v28 + 40), v29);
  }
}

- (id)_validateSimpleDeletionsWithValidators:(id)a3 requestsByObjectID:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F8B9B8];
  v9 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v10 = [v8 successWithResult:v9];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v22 = 0;
        char v17 = [v16 validateForDeleteWithRequestsByObjectID:v7 error:&v22];
        id v18 = v22;
        uint64_t v19 = v18;
        if ((v17 & 1) == 0)
        {
          uint64_t v20 = [(PHChangeValidationController *)self _failureWithError:v18];

          uint64_t v10 = (void *)v20;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (BOOL)_recordObjectID:(id)a3 withSimpleDeleteValidators:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "recordObjectID:", v5, (void)v12)) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  LOBYTE(v8) = 1;
LABEL_11:

  return v8;
}

- (id)_simpleDeleteValidatorsWithManagedObjectContext:(id)a3
{
  id v3 = a3;
  pl_dispatch_once();
  uint64_t v4 = (void *)_simpleDeleteValidatorsWithManagedObjectContext__pl_once_object_16;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PHChangeValidationController__simpleDeleteValidatorsWithManagedObjectContext___block_invoke_2;
  v9[3] = &unk_1E58420B0;
  id v10 = v3;
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v6, "_pl_map:", v9);

  return v7;
}

PHObjectDeleteValidator *__80__PHChangeValidationController__simpleDeleteValidatorsWithManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[PHObjectDeleteValidator alloc] initWithEntityName:v3 managedObjectContext:*(void *)(a1 + 32)];

  return v4;
}

void __80__PHChangeValidationController__simpleDeleteValidatorsWithManagedObjectContext___block_invoke()
{
  uint64_t v0 = [&unk_1EEB26808 copy];
  v1 = (void *)_simpleDeleteValidatorsWithManagedObjectContext__pl_once_object_16;
  _simpleDeleteValidatorsWithManagedObjectContext__pl_once_object_16 = v0;
}

- (id)_prepare
{
  v2 = self;
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  if (self->_didPrepare)
  {
    v92 = [MEMORY[0x1E4F28B00] currentHandler];
    v2 = self;
    [v92 handleFailureInMethod:a2 object:self file:@"PHChangeValidationController.m" lineNumber:100 description:@"_prepare can only be called once"];
  }
  v2->_didPrepare = 1;
  uint64_t v195 = 0;
  v196 = &v195;
  uint64_t v197 = 0x3032000000;
  v198 = __Block_byref_object_copy__2005;
  v199 = __Block_byref_object_dispose__2006;
  id v3 = (void *)MEMORY[0x1E4F8B9B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  id v5 = [v3 successWithResult:v4];

  id v200 = v5;
  uint64_t v189 = 0;
  v190 = &v189;
  uint64_t v191 = 0x3032000000;
  v192 = __Block_byref_object_copy__2005;
  v193 = __Block_byref_object_dispose__2006;
  id v194 = 0;
  uint64_t v115 = [(PHChangeValidationController *)self managedObjectContext];
  uint64_t v105 = [(PHChangeValidationController *)self photoLibrary];
  v123 = [MEMORY[0x1E4F1CA80] set];
  v119 = [MEMORY[0x1E4F1CA80] set];
  v120 = [MEMORY[0x1E4F1CA80] set];
  v118 = [MEMORY[0x1E4F1CA80] set];
  v121 = [MEMORY[0x1E4F1CA80] set];
  v113 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v109 = [MEMORY[0x1E4F1CA80] set];
  v107 = [MEMORY[0x1E4F1CA80] set];
  v104 = [MEMORY[0x1E4F1CA80] set];
  v106 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v103 = [MEMORY[0x1E4F1CA80] set];
  id v114 = [MEMORY[0x1E4F1CA80] set];
  id v108 = [MEMORY[0x1E4F1CA80] set];
  v122 = [MEMORY[0x1E4F1CA80] set];
  v112 = [MEMORY[0x1E4F1CA80] set];
  v124 = objc_opt_new();
  id v102 = objc_opt_new();
  v101 = objc_opt_new();
  v100 = objc_opt_new();
  uint64_t v99 = objc_opt_new();
  v98 = objc_opt_new();
  uint64_t v97 = objc_opt_new();
  id v96 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F8A950] entityName];
  uint64_t v7 = (id *)(v190 + 5);
  id obj = (id)v190[5];
  v128 = PLSafeEntityForNameInManagedObjectContext();
  objc_storeStrong(v7, obj);

  if (!v128)
  {
    id v22 = [(PHChangeValidationController *)self _failureWithError:v190[5]];
    goto LABEL_130;
  }
  uint64_t v8 = [MEMORY[0x1E4F8A848] entityName];
  uint64_t v9 = (id *)(v190 + 5);
  id v187 = (id)v190[5];
  v110 = PLSafeEntityForNameInManagedObjectContext();
  objc_storeStrong(v9, v187);

  id v10 = (id *)(v190 + 5);
  if (!v110)
  {
    id v22 = [(PHChangeValidationController *)self _failureWithError:v190[5]];
    goto LABEL_129;
  }
  id v186 = (id)v190[5];
  v95 = PLSafeEntityForNameInManagedObjectContext();
  objc_storeStrong(v10, v186);
  id v11 = (id *)(v190 + 5);
  if (!v95)
  {
    id v22 = [(PHChangeValidationController *)self _failureWithError:v190[5]];
    goto LABEL_128;
  }
  id v185 = (id)v190[5];
  uint64_t v111 = PLSafeEntityForNameInManagedObjectContext();
  objc_storeStrong(v11, v185);
  long long v12 = (id *)(v190 + 5);
  if (!v111)
  {
    id v22 = [(PHChangeValidationController *)self _failureWithError:v190[5]];
    goto LABEL_127;
  }
  id v184 = (id)v190[5];
  v117 = PLSafeEntityForNameInManagedObjectContext();
  objc_storeStrong(v12, v184);
  if (!v117)
  {
    id v22 = [(PHChangeValidationController *)self _failureWithError:v190[5]];
    goto LABEL_126;
  }
  v126 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v94 = [(PHChangeValidationController *)self _simpleDeleteValidatorsWithManagedObjectContext:v115];
  uint64_t v180 = 0;
  v181 = &v180;
  uint64_t v182 = 0x2020000000;
  char v183 = 0;
  long long v13 = [MEMORY[0x1E4F1CA80] set];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PHChangeValidationController__prepare__block_invoke;
  aBlock[3] = &unk_1E5842060;
  v179 = &v180;
  id v93 = v13;
  id v178 = v93;
  v127 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v14 = self;
  if (![(id)v196[5] isSuccess]) {
    goto LABEL_31;
  }
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v15 = [(PHChangeValidationController *)self insertRequests];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v173 objects:v207 count:16];
  if (!v16) {
    goto LABEL_30;
  }
  uint64_t v17 = *(void *)v174;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v174 != v17) {
        objc_enumerationMutation(v15);
      }
      uint64_t v19 = *(void **)(*((void *)&v173 + 1) + 8 * i);
      if (([v19 conformsToProtocol:&unk_1EEB2BB70] & 1) == 0)
      {
        long long v23 = [v19 clientName];
        if ([v23 length])
        {
          long long v24 = [NSString stringWithFormat:@"Invalid PHInsertChangeRequest from client: %@", v23];
          __WriteStackshot(v24);
        }
        else
        {
          __WriteStackshot(@"Invalid PHInsertChangeRequest");
        }
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Invalid insert request");
        uint64_t v27 = (void *)v190[5];
        v190[5] = v26;

        uint64_t v28 = [(PHChangeValidationController *)self _failureWithError:v190[5]];
        id v29 = (void *)v196[5];
        v196[5] = v28;

        goto LABEL_29;
      }
      uint64_t v20 = (id *)(v190 + 5);
      id v172 = (id)v190[5];
      char v21 = [v19 validateInsertIntoPhotoLibrary:v105 error:&v172];
      objc_storeStrong(v20, v172);
      if ((v21 & 1) == 0)
      {
        uint64_t v25 = [(PHChangeValidationController *)self _failureWithError:v190[5]];
        long long v23 = (void *)v196[5];
        v196[5] = v25;
LABEL_29:

        goto LABEL_30;
      }
    }
    uint64_t v16 = [v15 countByEnumeratingWithState:&v173 objects:v207 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_30:

  long long v14 = self;
LABEL_31:
  if (![(id)v196[5] isSuccess]) {
    goto LABEL_60;
  }
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v30 = [(PHChangeValidationController *)v14 updateRequests];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v168 objects:v206 count:16];
  if (!v31) {
    goto LABEL_59;
  }
  uint64_t v32 = *(void *)v169;
  id v125 = v30;
  while (2)
  {
    uint64_t v33 = 0;
    while (2)
    {
      if (*(void *)v169 != v32) {
        objc_enumerationMutation(v125);
      }
      id v34 = *(void **)(*((void *)&v168 + 1) + 8 * v33);
      long long v35 = [v34 objectID];
      long long v36 = [v35 entity];
      if ([v36 isKindOfEntity:v128]
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v37 = v34;
        long long v38 = [v37 contentEditingOutput];
        int v39 = [v37 isHiding];
        if (v39) {
          [v120 addObject:v35];
        }
        if ([v37 isRevertingContentToOriginal])
        {
          [v119 addObject:v35];
          id v40 = v123;
          if (!v38) {
            goto LABEL_54;
          }
LABEL_53:
          [v40 addObject:v35];
          goto LABEL_54;
        }
        if (v38) {
          char v41 = 0;
        }
        else {
          char v41 = v39;
        }
        if (v38) {
          id v40 = v123;
        }
        else {
          id v40 = v118;
        }
        if ((v41 & 1) == 0) {
          goto LABEL_53;
        }
LABEL_54:
      }
      else if (objc_opt_respondsToSelector())
      {
        [v124 addObject:v35];
      }
      if (v35) {
        [v126 setObject:v34 forKey:v35];
      }
      v127[2](v127, v34);

      if (v31 != ++v33) {
        continue;
      }
      break;
    }
    id v30 = v125;
    uint64_t v31 = [v125 countByEnumeratingWithState:&v168 objects:v206 count:16];
    if (v31) {
      continue;
    }
    break;
  }
LABEL_59:

  long long v14 = self;
LABEL_60:
  if (![(id)v196[5] isSuccess]) {
    goto LABEL_120;
  }
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v42 = [(PHChangeValidationController *)v14 deleteRequests];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v164 objects:v205 count:16];
  if (!v43) {
    goto LABEL_119;
  }
  uint64_t v44 = *(void *)v165;
  while (2)
  {
    uint64_t v45 = 0;
    while (2)
    {
      if (*(void *)v165 != v44) {
        objc_enumerationMutation(v42);
      }
      id v46 = *(void **)(*((void *)&v164 + 1) + 8 * v45);
      id v47 = [v46 objectID];
      uint64_t v48 = [v47 entity];
      if (![v48 isKindOfEntity:v128])
      {
        if ([v48 isKindOfEntity:v117])
        {
          objc_opt_class();
          id v54 = v46;
          if (objc_opt_isKindOfClass()) {
            v55 = v54;
          }
          else {
            v55 = 0;
          }
          id v51 = v55;

          v56 = v122;
          if (v51)
          {
            if ([v51 operation] == 2) {
              v56 = v112;
            }
            else {
              v56 = v122;
            }
          }
        }
        else if ([v48 isKindOfEntity:v111])
        {
          objc_opt_class();
          id v57 = v46;
          if (objc_opt_isKindOfClass()) {
            uint64_t v58 = v57;
          }
          else {
            uint64_t v58 = 0;
          }
          id v51 = v58;

          v56 = v114;
          if (v51)
          {
            if ([v51 operation] == 2) {
              v56 = v108;
            }
            else {
              v56 = v114;
            }
          }
        }
        else
        {
          if (![v48 isKindOfEntity:v110])
          {
            if (![(PHChangeValidationController *)self _recordObjectID:v47 withSimpleDeleteValidators:v94])
            {
              v64 = (void *)MEMORY[0x1E4F28C58];
              if (v47)
              {
                uint64_t v203 = *MEMORY[0x1E4F28568];
                v65 = [NSString stringWithFormat:@"Unknown type %@", v47];
                v204 = v65;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v204 forKeys:&v203 count:1];
              }
              else
              {
                uint64_t v201 = *MEMORY[0x1E4F28568];
                v65 = [NSString stringWithFormat:@"Unknown type"];
                v202 = v65;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v202 forKeys:&v201 count:1];
              id v66 = };
              uint64_t v67 = objc_msgSend(v64, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v66);
              v68 = (void *)v190[5];
              v190[5] = v67;

              uint64_t v69 = [(PHChangeValidationController *)self _failureWithError:v190[5]];
              v70 = (void *)v196[5];
              v196[5] = v69;

              goto LABEL_119;
            }
            goto LABEL_110;
          }
          objc_opt_class();
          id v59 = v46;
          if (objc_opt_isKindOfClass()) {
            long long v60 = v59;
          }
          else {
            long long v60 = 0;
          }
          id v51 = v60;

          if (v51 && [v51 operation] == 2)
          {
            BOOL v61 = [v48 isKindOfEntity:v95] == 0;
            uint64_t v63 = v103;
            v62 = v104;
          }
          else
          {
            BOOL v61 = [v48 isKindOfEntity:v95] == 0;
            uint64_t v63 = v106;
            v62 = v107;
          }
          if (v61) {
            v56 = v62;
          }
          else {
            v56 = v63;
          }
        }
        [v56 addObject:v47];
        goto LABEL_109;
      }
      objc_opt_class();
      id v49 = v46;
      if (objc_opt_isKindOfClass()) {
        v50 = v49;
      }
      else {
        v50 = 0;
      }
      id v51 = v50;

      if (v51)
      {
        uint64_t v52 = [v51 operation];
        v53 = v121;
        if (v52)
        {
          if (v52 == 1)
          {
            [v121 addObject:v47];
            v53 = v109;
          }
          else
          {
            v53 = v113;
            if (v52 != 2) {
              goto LABEL_109;
            }
          }
        }
        [v53 addObject:v47];
      }
LABEL_109:

LABEL_110:
      if (v47) {
        [v126 setObject:v46 forKey:v47];
      }
      v127[2](v127, v46);

      if (v43 != ++v45) {
        continue;
      }
      break;
    }
    uint64_t v43 = [v42 countByEnumeratingWithState:&v164 objects:v205 count:16];
    if (v43) {
      continue;
    }
    break;
  }
LABEL_119:

  long long v14 = self;
LABEL_120:
  if ([(id)v196[5] isSuccess])
  {
    photoLibrary = v14->_photoLibrary;
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __40__PHChangeValidationController__prepare__block_invoke_2;
    v129[3] = &unk_1E5842088;
    v162 = &v195;
    id v130 = v123;
    id v131 = v128;
    id v132 = v115;
    id v133 = v126;
    v134 = v14;
    v163 = &v189;
    id v135 = v101;
    id v136 = v102;
    id v137 = v119;
    id v138 = v100;
    id v139 = v120;
    id v140 = v99;
    id v141 = v118;
    id v142 = v113;
    id v143 = v121;
    id v144 = v98;
    id v145 = v109;
    id v146 = v108;
    id v147 = v111;
    id v148 = v114;
    id v149 = v96;
    id v150 = v104;
    id v151 = v110;
    id v152 = v107;
    id v153 = v97;
    id v154 = v103;
    id v155 = v95;
    id v156 = v106;
    id v157 = v122;
    id v158 = v117;
    id v159 = v112;
    id v160 = v124;
    id v161 = v94;
    [(PLPhotoLibrary *)photoLibrary performBlockAndWait:v129];

    long long v14 = self;
  }
  if ([v93 count] == 1)
  {
    id v72 = [v93 anyObject];
  }
  else
  {
    uint64_t v73 = [v93 allObjects];
    id v72 = [v73 componentsJoinedByString:@", "];

    long long v14 = self;
  }
  uint64_t v74 = [v102 copy];
  renderedContentURLs = v14->_renderedContentURLs;
  v14->_renderedContentURLs = (NSArray *)v74;

  v76 = (NSArray *)[v101 copy];
  assetsToChangeContent = self->_assetsToChangeContent;
  self->_assetsToChangeContent = v76;

  id v78 = (NSArray *)[v100 copy];
  assetsToRevert = self->_assetsToRevert;
  self->_assetsToRevert = v78;

  v80 = (NSArray *)[v99 copy];
  assetsToHide = self->_assetsToHide;
  self->_assetsToHide = v80;

  v82 = (NSArray *)[v98 copy];
  assetsToDelete = self->_assetsToDelete;
  self->_assetsToDelete = v82;

  id v84 = (NSArray *)[v97 copy];
  albumsToDelete = self->_albumsToDelete;
  self->_albumsToDelete = v84;

  v86 = (NSArray *)[v96 copy];
  foldersToDelete = self->_foldersToDelete;
  self->_foldersToDelete = v86;

  clientName = self->_clientName;
  self->_clientName = v72;
  v89 = v72;

  self->_confirmationRequired = *((unsigned char *)v181 + 24);
  id v22 = (id)v196[5];

  _Block_object_dispose(&v180, 8);
LABEL_126:

LABEL_127:
LABEL_128:

LABEL_129:
LABEL_130:

  _Block_object_dispose(&v189, 8);
  _Block_object_dispose(&v195, 8);

  return v22;
}

void __40__PHChangeValidationController__prepare__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 clientName];
  char v4 = [v3 isClientEntitled];

  if ((v4 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    id v5 = v6;
  }
}

void __40__PHChangeValidationController__prepare__block_invoke_2(uint64_t a1)
{
  uint64_t v447 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 32) count])
  {
    v2 = (void *)MEMORY[0x1E4F1C0D0];
    id v3 = [*(id *)(a1 + 40) name];
    char v4 = [v2 fetchRequestWithEntityName:v3];

    id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 32)];
    [v4 setPredicate:v5];

    [*(id *)(a1 + 48) executeFetchRequest:v4 error:0];
    long long v422 = 0u;
    long long v423 = 0u;
    long long v424 = 0u;
    long long v425 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v422 objects:v446 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v423;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v423 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v422 + 1) + 8 * i);
          long long v12 = *(void **)(a1 + 56);
          long long v13 = [v11 objectID];
          long long v14 = [v12 objectForKey:v13];

          if (v14)
          {
            uint64_t v15 = *(void *)(*(void *)(a1 + 296) + 8);
            id obj = *(id *)(v15 + 40);
            int v16 = [v14 validateMutationsToManagedObject:v11 error:&obj];
            objc_storeStrong((id *)(v15 + 40), obj);
            if (!v16)
            {
              uint64_t v21 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v22 = *(void *)(*(void *)(a1 + 288) + 8);
              long long v23 = *(void **)(v22 + 40);
              *(void *)(v22 + 40) = v21;

              goto LABEL_18;
            }
            uint64_t v17 = [v14 contentEditingOutput];
            id v18 = [v17 renderedContentURL];
            if (v18)
            {
              [*(id *)(a1 + 72) addObject:v11];
              [*(id *)(a1 + 80) addObject:v18];
            }
          }
          else
          {
            uint64_t v19 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v20 = *(void *)(*(void *)(a1 + 288) + 8);
            uint64_t v17 = *(void **)(v20 + 40);
            *(void *)(v20 + 40) = v19;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v422 objects:v446 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 88) count])
  {
    long long v24 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v25 = [*(id *)(a1 + 40) name];
    uint64_t v26 = [v24 fetchRequestWithEntityName:v25];

    uint64_t v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 88)];
    [v26 setPredicate:v27];

    [*(id *)(a1 + 48) executeFetchRequest:v26 error:0];
    long long v417 = 0u;
    long long v418 = 0u;
    long long v419 = 0u;
    long long v420 = 0u;
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 countByEnumeratingWithState:&v417 objects:v445 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v418;
      while (2)
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v418 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void **)(*((void *)&v417 + 1) + 8 * j);
          id v34 = *(void **)(a1 + 56);
          long long v35 = [v33 objectID];
          long long v36 = [v34 objectForKey:v35];

          if (v36)
          {
            uint64_t v37 = *(void *)(*(void *)(a1 + 296) + 8);
            id v416 = *(id *)(v37 + 40);
            int v38 = [v36 validateMutationsToManagedObject:v33 error:&v416];
            objc_storeStrong((id *)(v37 + 40), v416);
            if (!v38)
            {
              uint64_t v42 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v43 = *(void *)(*(void *)(a1 + 288) + 8);
              uint64_t v44 = *(void **)(v43 + 40);
              *(void *)(v43 + 40) = v42;

              goto LABEL_34;
            }
            [*(id *)(a1 + 96) addObject:v33];
          }
          else
          {
            uint64_t v39 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v40 = *(void *)(*(void *)(a1 + 288) + 8);
            char v41 = *(void **)(v40 + 40);
            *(void *)(v40 + 40) = v39;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v417 objects:v445 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }
LABEL_34:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 104) count])
  {
    uint64_t v45 = (void *)MEMORY[0x1E4F1C0D0];
    id v46 = [*(id *)(a1 + 40) name];
    id v47 = [v45 fetchRequestWithEntityName:v46];

    uint64_t v48 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 104)];
    [v47 setPredicate:v48];

    [*(id *)(a1 + 48) executeFetchRequest:v47 error:0];
    long long v412 = 0u;
    long long v413 = 0u;
    long long v414 = 0u;
    long long v415 = 0u;
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [v49 countByEnumeratingWithState:&v412 objects:v444 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v413;
      while (2)
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v413 != v52) {
            objc_enumerationMutation(v49);
          }
          id v54 = *(void **)(*((void *)&v412 + 1) + 8 * k);
          v55 = *(void **)(a1 + 56);
          v56 = [v54 objectID];
          id v57 = [v55 objectForKey:v56];

          if (v57)
          {
            uint64_t v58 = *(void *)(*(void *)(a1 + 296) + 8);
            id v411 = *(id *)(v58 + 40);
            int v59 = [v57 validateMutationsToManagedObject:v54 error:&v411];
            objc_storeStrong((id *)(v58 + 40), v411);
            if (!v59)
            {
              uint64_t v63 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v64 = *(void *)(*(void *)(a1 + 288) + 8);
              v65 = *(void **)(v64 + 40);
              *(void *)(v64 + 40) = v63;

              goto LABEL_50;
            }
            [*(id *)(a1 + 112) addObject:v54];
          }
          else
          {
            uint64_t v60 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v61 = *(void *)(*(void *)(a1 + 288) + 8);
            v62 = *(void **)(v61 + 40);
            *(void *)(v61 + 40) = v60;
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v412 objects:v444 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }
LABEL_50:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 120) count])
  {
    id v66 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v67 = [*(id *)(a1 + 40) name];
    v68 = [v66 fetchRequestWithEntityName:v67];

    uint64_t v69 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 120)];
    [v68 setPredicate:v69];

    [*(id *)(a1 + 48) executeFetchRequest:v68 error:0];
    long long v407 = 0u;
    long long v408 = 0u;
    long long v409 = 0u;
    long long v410 = 0u;
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v71 = [v70 countByEnumeratingWithState:&v407 objects:v443 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v408;
      do
      {
        for (uint64_t m = 0; m != v72; ++m)
        {
          if (*(void *)v408 != v73) {
            objc_enumerationMutation(v70);
          }
          uint64_t v75 = *(void **)(*((void *)&v407 + 1) + 8 * m);
          v76 = *(void **)(a1 + 56);
          v77 = [v75 objectID];
          id v78 = [v76 objectForKey:v77];

          if (v78)
          {
            uint64_t v79 = *(void *)(*(void *)(a1 + 296) + 8);
            id v406 = *(id *)(v79 + 40);
            char v80 = [v78 validateMutationsToManagedObject:v75 error:&v406];
            objc_storeStrong((id *)(v79 + 40), v406);
            if ((v80 & 1) == 0)
            {
              uint64_t v84 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v85 = *(void *)(*(void *)(a1 + 288) + 8);
              v86 = *(void **)(v85 + 40);
              *(void *)(v85 + 40) = v84;

              goto LABEL_64;
            }
          }
          else
          {
            uint64_t v81 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v82 = *(void *)(*(void *)(a1 + 288) + 8);
            v83 = *(void **)(v82 + 40);
            *(void *)(v82 + 40) = v81;
          }
        }
        uint64_t v72 = [v70 countByEnumeratingWithState:&v407 objects:v443 count:16];
      }
      while (v72);
    }
LABEL_64:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 128) count])
  {
    uint64_t v87 = (void *)MEMORY[0x1E4F1C0D0];
    v88 = [*(id *)(a1 + 40) name];
    v89 = [v87 fetchRequestWithEntityName:v88];

    id v90 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 128)];
    [v89 setPredicate:v90];

    [*(id *)(a1 + 48) executeFetchRequest:v89 error:0];
    long long v402 = 0u;
    long long v403 = 0u;
    long long v404 = 0u;
    long long v405 = 0u;
    id v91 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v92 = [v91 countByEnumeratingWithState:&v402 objects:v442 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = *(void *)v403;
      do
      {
        for (uint64_t n = 0; n != v93; ++n)
        {
          if (*(void *)v403 != v94) {
            objc_enumerationMutation(v91);
          }
          id v96 = *(void **)(*((void *)&v402 + 1) + 8 * n);
          uint64_t v97 = *(void **)(a1 + 56);
          v98 = [v96 objectID];
          uint64_t v99 = [v97 objectForKey:v98];

          if (v99)
          {
            uint64_t v100 = *(void *)(*(void *)(a1 + 296) + 8);
            id v401 = *(id *)(v100 + 40);
            char v101 = [v99 validateForDeleteManagedObject:v96 error:&v401];
            objc_storeStrong((id *)(v100 + 40), v401);
            if ((v101 & 1) == 0)
            {
              uint64_t v105 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v106 = *(void *)(*(void *)(a1 + 288) + 8);
              v107 = *(void **)(v106 + 40);
              *(void *)(v106 + 40) = v105;

              goto LABEL_78;
            }
          }
          else
          {
            uint64_t v102 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v103 = *(void *)(*(void *)(a1 + 288) + 8);
            v104 = *(void **)(v103 + 40);
            *(void *)(v103 + 40) = v102;
          }
        }
        uint64_t v93 = [v91 countByEnumeratingWithState:&v402 objects:v442 count:16];
      }
      while (v93);
    }
LABEL_78:
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    || ![*(id *)(a1 + 136) count])
  {
    goto LABEL_98;
  }
  id v108 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v109 = [*(id *)(a1 + 40) name];
  v110 = [v108 fetchRequestWithEntityName:v109];

  uint64_t v111 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 136)];
  [v110 setPredicate:v111];

  [*(id *)(a1 + 48) executeFetchRequest:v110 error:0];
  long long v397 = 0u;
  long long v398 = 0u;
  long long v399 = 0u;
  long long v400 = 0u;
  id v112 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v113 = [v112 countByEnumeratingWithState:&v397 objects:v441 count:16];
  id v114 = v112;
  if (v113)
  {
    uint64_t v115 = v113;
    v348 = v110;
    unint64_t v116 = 0;
    uint64_t v117 = *(void *)v398;
    while (2)
    {
      for (iuint64_t i = 0; ii != v115; ++ii)
      {
        if (*(void *)v398 != v117) {
          objc_enumerationMutation(v112);
        }
        v119 = *(void **)(*((void *)&v397 + 1) + 8 * ii);
        v120 = *(void **)(a1 + 56);
        v121 = [v119 objectID];
        v122 = [v120 objectForKey:v121];

        if (v122)
        {
          uint64_t v123 = *(void *)(*(void *)(a1 + 296) + 8);
          id v396 = *(id *)(v123 + 40);
          int v124 = [v122 validateForDeleteManagedObject:v119 error:&v396];
          objc_storeStrong((id *)(v123 + 40), v396);
          if (!v124)
          {
            uint64_t v130 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
            uint64_t v131 = *(void *)(*(void *)(a1 + 288) + 8);
            id v132 = *(void **)(v131 + 40);
            *(void *)(v131 + 40) = v130;

            goto LABEL_94;
          }
          [*(id *)(a1 + 144) addObject:v119];
          id v125 = *(void **)(a1 + 152);
          v126 = [v119 objectID];
          LODWORD(v125) = [v125 containsObject:v126];

          v116 += v125;
        }
        else
        {
          uint64_t v127 = [*(id *)(a1 + 64) _failureWithError:0];
          uint64_t v128 = *(void *)(*(void *)(a1 + 288) + 8);
          v129 = *(void **)(v128 + 40);
          *(void *)(v128 + 40) = v127;
        }
      }
      uint64_t v115 = [v112 countByEnumeratingWithState:&v397 objects:v441 count:16];
      if (v115) {
        continue;
      }
      break;
    }
LABEL_94:

    v110 = v348;
    if (v116 < 0xC9) {
      goto LABEL_97;
    }
    id v133 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v439 = *MEMORY[0x1E4F28228];
    v134 = [NSString stringWithFormat:@"Expunging too may assets: %tu, limit %zd", v116, 200];
    v440 = v134;
    id v135 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v440 forKeys:&v439 count:1];
    uint64_t v136 = objc_msgSend(v133, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v135);
    uint64_t v137 = *(void *)(*(void *)(a1 + 296) + 8);
    id v138 = *(void **)(v137 + 40);
    *(void *)(v137 + 40) = v136;

    uint64_t v139 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
    uint64_t v140 = *(void *)(*(void *)(a1 + 288) + 8);
    id v114 = *(void **)(v140 + 40);
    *(void *)(v140 + 40) = v139;
  }

LABEL_97:
LABEL_98:
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 160) count])
  {
    id v141 = (void *)MEMORY[0x1E4F1C0D0];
    id v142 = [*(id *)(a1 + 168) name];
    id v143 = [v141 fetchRequestWithEntityName:v142];

    id v144 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 160)];
    [v143 setPredicate:v144];

    [*(id *)(a1 + 48) executeFetchRequest:v143 error:0];
    long long v392 = 0u;
    long long v393 = 0u;
    long long v394 = 0u;
    long long v395 = 0u;
    id v145 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v146 = [v145 countByEnumeratingWithState:&v392 objects:v438 count:16];
    if (v146)
    {
      uint64_t v147 = v146;
      uint64_t v148 = *(void *)v393;
      do
      {
        for (juint64_t j = 0; jj != v147; ++jj)
        {
          if (*(void *)v393 != v148) {
            objc_enumerationMutation(v145);
          }
          id v150 = *(void **)(*((void *)&v392 + 1) + 8 * jj);
          id v151 = *(void **)(a1 + 56);
          id v152 = [v150 objectID];
          id v153 = [v151 objectForKey:v152];

          if (v153)
          {
            uint64_t v154 = *(void *)(*(void *)(a1 + 296) + 8);
            id v391 = *(id *)(v154 + 40);
            char v155 = [v153 validateForDeleteManagedObject:v150 error:&v391];
            objc_storeStrong((id *)(v154 + 40), v391);
            if ((v155 & 1) == 0)
            {
              uint64_t v159 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v160 = *(void *)(*(void *)(a1 + 288) + 8);
              id v161 = *(void **)(v160 + 40);
              *(void *)(v160 + 40) = v159;

              goto LABEL_111;
            }
          }
          else
          {
            uint64_t v156 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v157 = *(void *)(*(void *)(a1 + 288) + 8);
            id v158 = *(void **)(v157 + 40);
            *(void *)(v157 + 40) = v156;
          }
        }
        uint64_t v147 = [v145 countByEnumeratingWithState:&v392 objects:v438 count:16];
      }
      while (v147);
    }
LABEL_111:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 176) count])
  {
    v162 = (void *)MEMORY[0x1E4F1C0D0];
    v163 = [*(id *)(a1 + 168) name];
    long long v164 = [v162 fetchRequestWithEntityName:v163];

    long long v165 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 176)];
    [v164 setPredicate:v165];

    [*(id *)(a1 + 48) executeFetchRequest:v164 error:0];
    long long v387 = 0u;
    long long v388 = 0u;
    long long v389 = 0u;
    long long v390 = 0u;
    id v166 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v167 = [v166 countByEnumeratingWithState:&v387 objects:v437 count:16];
    if (v167)
    {
      uint64_t v168 = v167;
      uint64_t v169 = *(void *)v388;
      while (2)
      {
        for (kuint64_t k = 0; kk != v168; ++kk)
        {
          if (*(void *)v388 != v169) {
            objc_enumerationMutation(v166);
          }
          long long v171 = *(void **)(*((void *)&v387 + 1) + 8 * kk);
          id v172 = *(void **)(a1 + 56);
          long long v173 = [v171 objectID];
          long long v174 = [v172 objectForKey:v173];

          if (v174)
          {
            uint64_t v175 = *(void *)(*(void *)(a1 + 296) + 8);
            id v386 = *(id *)(v175 + 40);
            int v176 = [v174 validateForDeleteManagedObject:v171 error:&v386];
            objc_storeStrong((id *)(v175 + 40), v386);
            if (!v176)
            {
              uint64_t v180 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v181 = *(void *)(*(void *)(a1 + 288) + 8);
              uint64_t v182 = *(void **)(v181 + 40);
              *(void *)(v181 + 40) = v180;

              goto LABEL_127;
            }
            [*(id *)(a1 + 184) addObject:v171];
          }
          else
          {
            uint64_t v177 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v178 = *(void *)(*(void *)(a1 + 288) + 8);
            v179 = *(void **)(v178 + 40);
            *(void *)(v178 + 40) = v177;
          }
        }
        uint64_t v168 = [v166 countByEnumeratingWithState:&v387 objects:v437 count:16];
        if (v168) {
          continue;
        }
        break;
      }
    }
LABEL_127:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 192) count])
  {
    char v183 = (void *)MEMORY[0x1E4F1C0D0];
    id v184 = [*(id *)(a1 + 200) name];
    id v185 = [v183 fetchRequestWithEntityName:v184];

    id v186 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 192)];
    [v185 setPredicate:v186];

    [*(id *)(a1 + 48) executeFetchRequest:v185 error:0];
    long long v382 = 0u;
    long long v383 = 0u;
    long long v384 = 0u;
    long long v385 = 0u;
    id v187 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v188 = [v187 countByEnumeratingWithState:&v382 objects:v436 count:16];
    if (v188)
    {
      uint64_t v189 = v188;
      uint64_t v190 = *(void *)v383;
      do
      {
        for (muint64_t m = 0; mm != v189; ++mm)
        {
          if (*(void *)v383 != v190) {
            objc_enumerationMutation(v187);
          }
          v192 = *(void **)(*((void *)&v382 + 1) + 8 * mm);
          v193 = *(void **)(a1 + 56);
          id v194 = [v192 objectID];
          uint64_t v195 = [v193 objectForKey:v194];

          if (v195)
          {
            uint64_t v196 = *(void *)(*(void *)(a1 + 296) + 8);
            id v381 = *(id *)(v196 + 40);
            char v197 = [v195 validateForDeleteManagedObject:v192 error:&v381];
            objc_storeStrong((id *)(v196 + 40), v381);
            if ((v197 & 1) == 0)
            {
              uint64_t v201 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v202 = *(void *)(*(void *)(a1 + 288) + 8);
              uint64_t v203 = *(void **)(v202 + 40);
              *(void *)(v202 + 40) = v201;

              goto LABEL_141;
            }
          }
          else
          {
            uint64_t v198 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v199 = *(void *)(*(void *)(a1 + 288) + 8);
            id v200 = *(void **)(v199 + 40);
            *(void *)(v199 + 40) = v198;
          }
        }
        uint64_t v189 = [v187 countByEnumeratingWithState:&v382 objects:v436 count:16];
      }
      while (v189);
    }
LABEL_141:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 208) count])
  {
    v204 = (void *)MEMORY[0x1E4F1C0D0];
    v205 = [*(id *)(a1 + 200) name];
    v206 = [v204 fetchRequestWithEntityName:v205];

    v207 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 208)];
    [v206 setPredicate:v207];

    [*(id *)(a1 + 48) executeFetchRequest:v206 error:0];
    long long v377 = 0u;
    long long v378 = 0u;
    long long v379 = 0u;
    long long v380 = 0u;
    id v208 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v209 = [v208 countByEnumeratingWithState:&v377 objects:v435 count:16];
    if (v209)
    {
      uint64_t v210 = v209;
      uint64_t v211 = *(void *)v378;
      while (2)
      {
        for (nuint64_t n = 0; nn != v210; ++nn)
        {
          if (*(void *)v378 != v211) {
            objc_enumerationMutation(v208);
          }
          v213 = *(void **)(*((void *)&v377 + 1) + 8 * nn);
          v214 = *(void **)(a1 + 56);
          v215 = [v213 objectID];
          v216 = [v214 objectForKey:v215];

          if (v216)
          {
            uint64_t v217 = *(void *)(*(void *)(a1 + 296) + 8);
            id v376 = *(id *)(v217 + 40);
            int v218 = [v216 validateForDeleteManagedObject:v213 error:&v376];
            objc_storeStrong((id *)(v217 + 40), v376);
            if (!v218)
            {
              uint64_t v222 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v223 = *(void *)(*(void *)(a1 + 288) + 8);
              v224 = *(void **)(v223 + 40);
              *(void *)(v223 + 40) = v222;

              goto LABEL_157;
            }
            [*(id *)(a1 + 216) addObject:v213];
          }
          else
          {
            uint64_t v219 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v220 = *(void *)(*(void *)(a1 + 288) + 8);
            v221 = *(void **)(v220 + 40);
            *(void *)(v220 + 40) = v219;
          }
        }
        uint64_t v210 = [v208 countByEnumeratingWithState:&v377 objects:v435 count:16];
        if (v210) {
          continue;
        }
        break;
      }
    }
LABEL_157:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 224) count])
  {
    v225 = (void *)MEMORY[0x1E4F1C0D0];
    v226 = [*(id *)(a1 + 232) name];
    v227 = [v225 fetchRequestWithEntityName:v226];

    v228 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 224)];
    [v227 setPredicate:v228];

    [*(id *)(a1 + 48) executeFetchRequest:v227 error:0];
    long long v372 = 0u;
    long long v373 = 0u;
    long long v374 = 0u;
    long long v375 = 0u;
    id v229 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v230 = [v229 countByEnumeratingWithState:&v372 objects:v434 count:16];
    if (v230)
    {
      uint64_t v231 = v230;
      uint64_t v232 = *(void *)v373;
      do
      {
        for (uint64_t i1 = 0; i1 != v231; ++i1)
        {
          if (*(void *)v373 != v232) {
            objc_enumerationMutation(v229);
          }
          v234 = *(void **)(*((void *)&v372 + 1) + 8 * i1);
          v235 = *(void **)(a1 + 56);
          v236 = [v234 objectID];
          v237 = [v235 objectForKey:v236];

          if (v237)
          {
            uint64_t v238 = *(void *)(*(void *)(a1 + 296) + 8);
            id v371 = *(id *)(v238 + 40);
            char v239 = [v237 validateForDeleteManagedObject:v234 error:&v371];
            objc_storeStrong((id *)(v238 + 40), v371);
            if ((v239 & 1) == 0)
            {
              uint64_t v243 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v244 = *(void *)(*(void *)(a1 + 288) + 8);
              v245 = *(void **)(v244 + 40);
              *(void *)(v244 + 40) = v243;

              goto LABEL_171;
            }
          }
          else
          {
            uint64_t v240 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v241 = *(void *)(*(void *)(a1 + 288) + 8);
            v242 = *(void **)(v241 + 40);
            *(void *)(v241 + 40) = v240;
          }
        }
        uint64_t v231 = [v229 countByEnumeratingWithState:&v372 objects:v434 count:16];
      }
      while (v231);
    }
LABEL_171:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 240) count])
  {
    v246 = (void *)MEMORY[0x1E4F1C0D0];
    v247 = [*(id *)(a1 + 232) name];
    v248 = [v246 fetchRequestWithEntityName:v247];

    v249 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 240)];
    [v248 setPredicate:v249];

    [*(id *)(a1 + 48) executeFetchRequest:v248 error:0];
    long long v367 = 0u;
    long long v368 = 0u;
    long long v369 = 0u;
    long long v370 = 0u;
    id v250 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v251 = [v250 countByEnumeratingWithState:&v367 objects:v433 count:16];
    if (v251)
    {
      uint64_t v252 = v251;
      uint64_t v253 = *(void *)v368;
      while (2)
      {
        for (uint64_t i2 = 0; i2 != v252; ++i2)
        {
          if (*(void *)v368 != v253) {
            objc_enumerationMutation(v250);
          }
          v255 = *(void **)(*((void *)&v367 + 1) + 8 * i2);
          v256 = *(void **)(a1 + 56);
          v257 = [v255 objectID];
          v258 = [v256 objectForKey:v257];

          if (v258)
          {
            uint64_t v259 = *(void *)(*(void *)(a1 + 296) + 8);
            id v366 = *(id *)(v259 + 40);
            int v260 = [v258 validateForDeleteManagedObject:v255 error:&v366];
            objc_storeStrong((id *)(v259 + 40), v366);
            if (!v260)
            {
              uint64_t v264 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v265 = *(void *)(*(void *)(a1 + 288) + 8);
              v266 = *(void **)(v265 + 40);
              *(void *)(v265 + 40) = v264;

              goto LABEL_187;
            }
            [*(id *)(a1 + 216) addObject:v255];
          }
          else
          {
            uint64_t v261 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v262 = *(void *)(*(void *)(a1 + 288) + 8);
            v263 = *(void **)(v262 + 40);
            *(void *)(v262 + 40) = v261;
          }
        }
        uint64_t v252 = [v250 countByEnumeratingWithState:&v367 objects:v433 count:16];
        if (v252) {
          continue;
        }
        break;
      }
    }
LABEL_187:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 248) count])
  {
    v267 = (void *)MEMORY[0x1E4F1C0D0];
    v268 = [*(id *)(a1 + 256) name];
    v269 = [v267 fetchRequestWithEntityName:v268];

    v270 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 248)];
    [v269 setPredicate:v270];

    [*(id *)(a1 + 48) executeFetchRequest:v269 error:0];
    long long v362 = 0u;
    long long v363 = 0u;
    long long v364 = 0u;
    long long v365 = 0u;
    id v271 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v272 = [v271 countByEnumeratingWithState:&v362 objects:v432 count:16];
    if (v272)
    {
      uint64_t v273 = v272;
      uint64_t v274 = *(void *)v363;
      do
      {
        for (uint64_t i3 = 0; i3 != v273; ++i3)
        {
          if (*(void *)v363 != v274) {
            objc_enumerationMutation(v271);
          }
          v276 = *(void **)(*((void *)&v362 + 1) + 8 * i3);
          v277 = *(void **)(a1 + 56);
          v278 = [v276 objectID];
          v279 = [v277 objectForKey:v278];

          if (v279)
          {
            uint64_t v280 = *(void *)(*(void *)(a1 + 296) + 8);
            id v361 = *(id *)(v280 + 40);
            char v281 = [v279 validateForDeleteManagedObject:v276 error:&v361];
            objc_storeStrong((id *)(v280 + 40), v361);
            if ((v281 & 1) == 0)
            {
              uint64_t v285 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v286 = *(void *)(*(void *)(a1 + 288) + 8);
              v287 = *(void **)(v286 + 40);
              *(void *)(v286 + 40) = v285;

              goto LABEL_201;
            }
          }
          else
          {
            uint64_t v282 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v283 = *(void *)(*(void *)(a1 + 288) + 8);
            v284 = *(void **)(v283 + 40);
            *(void *)(v283 + 40) = v282;
          }
        }
        uint64_t v273 = [v271 countByEnumeratingWithState:&v362 objects:v432 count:16];
      }
      while (v273);
    }
LABEL_201:
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 264) count])
  {
    v288 = (void *)MEMORY[0x1E4F1C0D0];
    v289 = [*(id *)(a1 + 256) name];
    v290 = [v288 fetchRequestWithEntityName:v289];

    v291 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 264)];
    [v290 setPredicate:v291];

    [*(id *)(a1 + 48) executeFetchRequest:v290 error:0];
    long long v357 = 0u;
    long long v358 = 0u;
    long long v359 = 0u;
    long long v360 = 0u;
    id v292 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v293 = [v292 countByEnumeratingWithState:&v357 objects:v431 count:16];
    if (v293)
    {
      uint64_t v294 = v293;
      uint64_t v295 = *(void *)v358;
      do
      {
        for (uint64_t i4 = 0; i4 != v294; ++i4)
        {
          if (*(void *)v358 != v295) {
            objc_enumerationMutation(v292);
          }
          v297 = *(void **)(*((void *)&v357 + 1) + 8 * i4);
          v298 = *(void **)(a1 + 56);
          v299 = [v297 objectID];
          v300 = [v298 objectForKey:v299];

          if (v300)
          {
            uint64_t v301 = *(void *)(*(void *)(a1 + 296) + 8);
            id v356 = *(id *)(v301 + 40);
            char v302 = [v300 validateForDeleteManagedObject:v297 error:&v356];
            objc_storeStrong((id *)(v301 + 40), v356);
            if ((v302 & 1) == 0)
            {
              uint64_t v306 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
              uint64_t v307 = *(void *)(*(void *)(a1 + 288) + 8);
              v308 = *(void **)(v307 + 40);
              *(void *)(v307 + 40) = v306;

              goto LABEL_215;
            }
          }
          else
          {
            uint64_t v303 = [*(id *)(a1 + 64) _failureWithError:0];
            uint64_t v304 = *(void *)(*(void *)(a1 + 288) + 8);
            v305 = *(void **)(v304 + 40);
            *(void *)(v304 + 40) = v303;
          }
        }
        uint64_t v294 = [v292 countByEnumeratingWithState:&v357 objects:v431 count:16];
      }
      while (v294);
    }
LABEL_215:
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess]
    || ![*(id *)(a1 + 272) count])
  {
    goto LABEL_240;
  }
  long long v354 = 0u;
  long long v355 = 0u;
  long long v352 = 0u;
  long long v353 = 0u;
  id v309 = *(id *)(a1 + 272);
  uint64_t v347 = [v309 countByEnumeratingWithState:&v352 objects:v430 count:16];
  if (!v347) {
    goto LABEL_239;
  }
  uint64_t v346 = *(void *)v353;
  uint64_t v344 = *MEMORY[0x1E4F28228];
  do
  {
    for (uint64_t i5 = 0; i5 != v347; ++i5)
    {
      if (*(void *)v353 != v346) {
        objc_enumerationMutation(v309);
      }
      v311 = *(void **)(*((void *)&v352 + 1) + 8 * i5);
      uint64_t v349 = MEMORY[0x19F389B10]();
      v312 = (void *)MEMORY[0x1E4F1C0D0];
      v313 = [v311 entity];
      v314 = [v313 name];
      v315 = [v312 fetchRequestWithEntityName:v314];

      v316 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self == %@", v311];
      [v315 setPredicate:v316];

      v317 = *(void **)(a1 + 48);
      id v351 = 0;
      v318 = [v317 executeFetchRequest:v315 error:&v351];
      id v319 = v351;
      if (v318)
      {
        v320 = [v318 firstObject];
        v321 = [*(id *)(a1 + 56) objectForKey:v311];
        v322 = v321;
        if (v321)
        {
          if (v320)
          {
            uint64_t v323 = *(void *)(*(void *)(a1 + 296) + 8);
            id v350 = *(id *)(v323 + 40);
            char v324 = [v321 validateMutationsToManagedObject:v320 error:&v350];
            objc_storeStrong((id *)(v323 + 40), v350);
            if (v324)
            {
              int v325 = 0;
              v326 = (void *)v349;
LABEL_235:

              goto LABEL_236;
            }
          }
          else
          {
            v345 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v428 = v344;
            v333 = [NSString stringWithFormat:@"Managed object not found: %@", v311];
            v429 = v333;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v429 forKeys:&v428 count:1];
            v335 = id v334 = v309;
            uint64_t v336 = [v345 errorWithDomain:@"PHPhotosErrorDomain" code:3110 userInfo:v335];
            uint64_t v337 = *(void *)(*(void *)(a1 + 296) + 8);
            v338 = *(void **)(v337 + 40);
            *(void *)(v337 + 40) = v336;

            id v309 = v334;
          }
          uint64_t v339 = [*(id *)(a1 + 64) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
          uint64_t v340 = *(void *)(*(void *)(a1 + 288) + 8);
          v332 = *(void **)(v340 + 40);
          *(void *)(v340 + 40) = v339;
          int v325 = 30;
        }
        else
        {
          uint64_t v330 = [*(id *)(a1 + 64) _failureWithError:0];
          int v325 = 0;
          uint64_t v331 = *(void *)(*(void *)(a1 + 288) + 8);
          v332 = *(void **)(v331 + 40);
          *(void *)(v331 + 40) = v330;
        }
        v326 = (void *)v349;

        goto LABEL_235;
      }
      v327 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v327, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v427 = v319;
        _os_log_impl(&dword_19B043000, v327, OS_LOG_TYPE_ERROR, "managedObjectsNeedingMutationValidations fetch failed: %@", buf, 0xCu);
      }

      uint64_t v328 = [*(id *)(a1 + 64) _failureWithError:v319];
      uint64_t v329 = *(void *)(*(void *)(a1 + 288) + 8);
      v320 = *(void **)(v329 + 40);
      *(void *)(v329 + 40) = v328;
      int v325 = 30;
      v326 = (void *)v349;
LABEL_236:

      if (v325) {
        goto LABEL_239;
      }
    }
    uint64_t v347 = [v309 countByEnumeratingWithState:&v352 objects:v430 count:16];
  }
  while (v347);
LABEL_239:

LABEL_240:
  if ([*(id *)(*(void *)(*(void *)(a1 + 288) + 8) + 40) isSuccess])
  {
    uint64_t v341 = [*(id *)(a1 + 64) _validateSimpleDeletionsWithValidators:*(void *)(a1 + 280) requestsByObjectID:*(void *)(a1 + 56)];
    uint64_t v342 = *(void *)(*(void *)(a1 + 288) + 8);
    v343 = *(void **)(v342 + 40);
    *(void *)(v342 + 40) = v341;
  }
}

- (PHChangeValidationController)initWithInsertRequests:(id)a3 updateRequests:(id)a4 deleteRequests:(id)a5 context:(id)a6 photoLibrary:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PHChangeValidationController;
  uint64_t v17 = [(PHChangeValidationController *)&v22 init];
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:v17 file:@"PHChangeValidationController.m" lineNumber:88 description:@"Must provide a managed object context"];
    }
    objc_storeStrong((id *)&v17->_insertRequests, a3);
    objc_storeStrong((id *)&v17->_updateRequests, a4);
    objc_storeStrong((id *)&v17->_deleteRequests, a5);
    objc_storeStrong((id *)&v17->_managedObjectContext, a6);
    objc_storeStrong((id *)&v17->_photoLibrary, a7);
  }

  return v17;
}

@end