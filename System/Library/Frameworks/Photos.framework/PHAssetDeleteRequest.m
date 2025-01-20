@interface PHAssetDeleteRequest
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (PHAssetDeleteOptions)deleteOptions;
- (PHAssetDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (void)_updateSyndicationStateForSyndicationIdentifier:(id)a3 savedAssetType:(signed __int16)a4 sourceLibraryID:(int64_t)a5;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
- (void)encodeToXPCDict:(id)a3;
- (void)setDeleteOptions:(id)a3;
@end

@implementation PHAssetDeleteRequest

- (void).cxx_destruct
{
}

- (void)setDeleteOptions:(id)a3
{
}

- (PHAssetDeleteOptions)deleteOptions
{
  return self->_deleteOptions;
}

- (void)_updateSyndicationStateForSyndicationIdentifier:(id)a3 savedAssetType:(signed __int16)a4 sourceLibraryID:(int64_t)a5
{
  id v8 = a3;
  int64_t v6 = [(PHTrashableObjectDeleteRequest *)self operation];
  if (v6)
  {
    if (v6 != 2) {
      goto LABEL_6;
    }
    v7 = &__block_literal_global_82_4788;
  }
  else
  {
    v7 = &__block_literal_global_4789;
  }
  [MEMORY[0x1E4F8A950] performTransactionOnSyndicationLibraryWithSyndicationIdentifier:v8 block:v7];
LABEL_6:
}

uint64_t __103__PHAssetDeleteRequest__updateSyndicationStateForSyndicationIdentifier_savedAssetType_sourceLibraryID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rejectSyndicatedAsset];
}

uint64_t __103__PHAssetDeleteRequest__updateSyndicationStateForSyndicationIdentifier_savedAssetType_sourceLibraryID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 restoreSyndicatedAsset];
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [v8 additionalAttributes];
  v10 = [v9 syndicationIdentifier];

  uint64_t v11 = [v8 savedAssetType];
  v12 = [v7 libraryServicesManager];
  uint64_t v13 = [v12 wellKnownPhotoLibraryIdentifier];

  if (v13 != 3)
  {
    int64_t v16 = [(PHTrashableObjectDeleteRequest *)self operation];
    if (v16 == 2)
    {
      id v25 = v8;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [v7 userUntrashAssets:v20];
    }
    else if (v16 == 1)
    {
      v22 = [(PHAssetDeleteRequest *)self deleteOptions];
      unint64_t v23 = [v22 expungeSource];

      if (v23 > 8) {
        v24 = 0;
      }
      else {
        v24 = off_1E5842788[v23];
      }
      id v26 = v8;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [v7 userExpungeAssets:v20 localOnlyDelete:0 expungeReasonFromClient:v24];
    }
    else
    {
      if (v16) {
        goto LABEL_18;
      }
      v17 = [(PHObjectDeleteRequest *)self clientBundleID];
      v18 = [v17 lowercaseString];
      int v19 = [v18 hasPrefix:@"com.apple."];

      id v27 = v8;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      if (v19) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = 2;
      }
      [v7 userTrashAssets:v20 withTrashedReason:v21];
    }

LABEL_18:
    if (v13 != 1) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  v14 = PLSyndicationGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = [v8 uuid];
    *(_DWORD *)buf = 138543618;
    v29 = v15;
    __int16 v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_INFO, "Preventing PhotoKit delete of asset %{public}@ / %{public}@ in syndication library", buf, 0x16u);
  }
LABEL_19:
  if (v10) {
    [(PHAssetDeleteRequest *)self _updateSyndicationStateForSyndicationIdentifier:v10 savedAssetType:v11 sourceLibraryID:v13];
  }
LABEL_21:
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PHAssetDeleteRequest;
  id v28 = 0;
  unsigned int v7 = [(PHTrashableObjectDeleteRequest *)&v27 validateForDeleteManagedObject:v6 error:&v28];
  id v8 = v28;
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v6 isCloudSharedAsset]
      && ![(PHObjectDeleteRequest *)self isClientEntitled])
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      id v9 = [NSString stringWithFormat:@"Cannot modify iCloud Shared Streams"];
      v36[0] = v9;
      int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      uint64_t v20 = objc_msgSend(v18, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v19);
LABEL_21:

      BOOL v12 = 0;
      id v8 = (id)v20;
LABEL_22:

      if (!a4) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }
    if ([(PHTrashableObjectDeleteRequest *)self operation] != 1)
    {
      BOOL v12 = 1;
      goto LABEL_25;
    }
    id v9 = v6;
    if ([v9 hasLibraryScope]
      && ![v9 canPerformEditOperation:8])
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      int v19 = [NSString stringWithFormat:@"Unable to expunge shared library asset contributed by others"];
      v34 = v19;
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v23 = &v34;
      v24 = &v33;
    }
    else
    {
      v10 = [(PHObjectDeleteRequest *)self clientBundleID];
      uint64_t v11 = [v10 lowercaseString];
      if ([v11 hasPrefix:@"com.apple."])
      {

LABEL_14:
        int64_t v16 = [(PHAssetDeleteRequest *)self deleteOptions];
        uint64_t v17 = [v16 expungeSource];

        if (v17)
        {
          BOOL v12 = 1;
          goto LABEL_22;
        }
        uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        int v19 = [NSString stringWithFormat:@"Asset expunge request without expungeSource being set. Set expungeSource on the PHAssetDeletionOptions passed into the expunge request"];
        __int16 v30 = v19;
        v22 = (void *)MEMORY[0x1E4F1C9E8];
        unint64_t v23 = &v30;
        v24 = &v29;
        goto LABEL_20;
      }
      uint64_t v13 = [(PHObjectDeleteRequest *)self clientBundleID];
      v14 = [v13 lowercaseString];
      char v15 = [v14 hasPrefix:@"com.appleinternal."];

      if (v15) {
        goto LABEL_14;
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      int v19 = [NSString stringWithFormat:@"Asset expunge restricted to Apple apps only"];
      uint64_t v32 = v19;
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v23 = &v32;
      v24 = &v31;
    }
LABEL_20:
    uint64_t v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    uint64_t v20 = objc_msgSend(v21, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v25);

    id v8 = (id)v25;
    goto LABEL_21;
  }
  BOOL v12 = 0;
  if (!a4) {
    goto LABEL_25;
  }
LABEL_23:
  if (!v12)
  {
    id v8 = v8;
    BOOL v12 = 0;
    *a4 = v8;
  }
LABEL_25:

  return v12;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PHAssetDeleteRequest;
  [(PHTrashableObjectDeleteRequest *)&v6 encodeToXPCDict:v4];
  if (self->_deleteOptions)
  {
    v5 = [(PHAssetDeleteRequest *)self deleteOptions];
    [v5 encodeToXPCDict:v4];
  }
}

- (PHAssetDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetDeleteRequest;
  id v9 = [(PHTrashableObjectDeleteRequest *)&v15 initWithXPCDict:v8 request:a4 clientAuthorization:a5];
  if (v9)
  {
    v10 = [[PHAssetDeleteOptions alloc] initWithXPCDict:v8];
    deleteOptions = v9->_deleteOptions;
    v9->_deleteOptions = v10;

    if (!v9->_deleteOptions)
    {
      BOOL v12 = objc_alloc_init(PHAssetDeleteOptions);
      uint64_t v13 = v9->_deleteOptions;
      v9->_deleteOptions = v12;
    }
  }

  return v9;
}

@end