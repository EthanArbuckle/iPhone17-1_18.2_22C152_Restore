@interface PHMomentShare
+ (BOOL)managedObjectSupportsShareExpiredState;
+ (BOOL)managedObjectSupportsShareTrashedState;
+ (BOOL)managedObjectSupportsTrashedState;
+ (id)_fetchLocalMomentShareWithUUID:(id)a3 error:(id *)a4;
+ (id)entityKeyMap;
+ (id)fetchLocalMomentShareFromShareURL:(id)a3 error:(id *)a4 options:(id)a5;
+ (id)fetchMomentSharesOverlappingAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)invitedMomentSharesExpiringInDays:(unint64_t)a3;
+ (id)localIdentifierWithUUID:(id)a3;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (void)fetchMomentShareFromShareURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (BOOL)shouldIgnoreBudgets;
- (BOOL)shouldNotifyOnUploadCompletion;
- (BOOL)shouldPromptUserToIgnoreBudgets;
- (BOOL)shouldSuggestShareBack;
- (Class)changeRequestClass;
- (NSData)previewData;
- (NSData)thumbnailImageData;
- (NSDate)creationDate;
- (NSDate)expiryDate;
- (NSString)description;
- (NSString)scopeIdentifier;
- (NSURL)shareURL;
- (PHMomentShare)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (PHMomentSharePreview)preview;
- (signed)publicPermission;
- (signed)publishState;
- (unint64_t)assetCount;
- (unint64_t)estimatedAssetCount;
- (unint64_t)estimatedPhotosCount;
- (unint64_t)estimatedVideosCount;
- (unint64_t)photosCount;
- (unint64_t)uploadedPhotosCount;
- (unint64_t)uploadedVideosCount;
- (unint64_t)videosCount;
- (unsigned)status;
- (unsigned)trashedState;
- (void)acceptMomentShareWithCompletion:(id)a3;
- (void)forceSyncMomentShareWithCompletion:(id)a3;
- (void)publishMomentShareWithCompletionHandler:(id)a3;
@end

@implementation PHMomentShare

+ (id)invitedMomentSharesExpiringInDays:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setDay:a3];
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v5 dateByAddingComponents:v4 toDate:v6 options:0];

  v8 = +[PHPhotoLibrary sharedMomentSharePhotoLibrary];
  v9 = [v8 librarySpecificFetchOptions];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"expiryDate <= %@ AND (status == %d OR status == %d)", v7, 2, 3];
  [v9 setInternalPredicate:v10];
  v11 = +[PHAssetCollection fetchAssetCollectionsWithType:7 subtype:0x7FFFFFFFFFFFFFFFLL options:v9];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_previewData, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_preview, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (NSData)previewData
{
  return self->_previewData;
}

- (BOOL)shouldNotifyOnUploadCompletion
{
  return self->_shouldNotifyOnUploadCompletion;
}

- (BOOL)shouldIgnoreBudgets
{
  return self->_shouldIgnoreBudgets;
}

- (unint64_t)uploadedVideosCount
{
  return self->_uploadedVideosCount;
}

- (unint64_t)uploadedPhotosCount
{
  return self->_uploadedPhotosCount;
}

- (unint64_t)videosCount
{
  return self->_videosCount;
}

- (unint64_t)photosCount
{
  return self->_photosCount;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (signed)publishState
{
  return self->_publishState;
}

- (unsigned)trashedState
{
  return self->_trashedState;
}

- (signed)publicPermission
{
  return self->_publicPermission;
}

- (unsigned)status
{
  return self->_status;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)PHMomentShare;
  v3 = [(PHAssetCollection *)&v10 description];
  id v4 = [(PHMomentShare *)self scopeIdentifier];
  unsigned int v5 = [(PHMomentShare *)self status] - 1;
  if (v5 > 2) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E58478A0[(unsigned __int16)v5];
  }
  v7 = v6;
  v8 = [v3 stringByAppendingFormat:@", scopeIdentifier: %@, status: %@", v4, v7];

  return (NSString *)v8;
}

- (void)publishMomentShareWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  unsigned int v5 = [(PHObject *)self photoLibrary];
  id v8 = [v5 cplStatus];

  if ([v8 isExceedingQuota])
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:6008 userInfo:0];
    v7 = +[PHShare PHShareErrorFromError:v6];
    v4[2](v4, 0, v7);
  }
  else
  {
    v6 = [(PHObject *)self uuid];
    v7 = [(PHObject *)self photoLibrary];
    +[PHShare publishShareWithUUID:v6 photoLibrary:v7 completion:v4];
  }
}

- (void)forceSyncMomentShareWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PHObject *)self uuid];
  v6 = [(PHObject *)self photoLibrary];
  v7 = [v6 assetsdClient];

  id v8 = [v7 cloudInternalClient];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PHMomentShare_forceSyncMomentShareWithCompletion___block_invoke;
  v10[3] = &unk_1E58489C0;
  id v11 = v4;
  id v9 = v4;
  [v8 forceSyncMomentShare:v5 completionHandler:v10];
}

void __52__PHMomentShare_forceSyncMomentShareWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[PHShare PHShareErrorFromError:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)acceptMomentShareWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(PHObject *)self uuid];
  unsigned int v5 = [(PHObject *)self photoLibrary];
  +[PHShare acceptShareWithUUID:v6 photoLibrary:v5 completion:v4];
}

- (BOOL)shouldSuggestShareBack
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  id v3 = [(PHObject *)self photoLibrary];
  id v4 = [v3 photoLibrary];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PHMomentShare_shouldSuggestShareBack__block_invoke;
  v7[3] = &unk_1E5848318;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [v5 performBlockAndWait:v7];
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

void __39__PHMomentShare_shouldSuggestShareBack__block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) uuid];
  uint64_t v2 = (void *)MEMORY[0x1E4F8A9C0];
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = [v2 shareWithUUID:v13 includeTrashed:1 inManagedObjectContext:v3];

  if (v4)
  {
    id v5 = [v4 originatingScopeIdentifier];
    if ([v5 length])
    {
      id v6 = (void *)MEMORY[0x1E4F8A9C0];
      v7 = [*(id *)(a1 + 40) managedObjectContext];
      id v8 = [v6 shareWithScopeIdentifier:v5 includeTrashed:1 inManagedObjectContext:v7];

      if (v8) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
    id v9 = [v4 scopeIdentifier];
    if ([v9 length])
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F8A9C0];
      id v11 = [*(id *)(a1 + 40) managedObjectContext];
      uint64_t v12 = [v10 momentShareWithOriginatingScopeIdentifier:v9 inManagedObjectContext:v11];

      if (v12) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
}

- (BOOL)shouldPromptUserToIgnoreBudgets
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v3 = [(PHObject *)self photoLibrary];
  id v4 = [v3 photoLibrary];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PHMomentShare_shouldPromptUserToIgnoreBudgets__block_invoke;
  v7[3] = &unk_1E5848318;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [v5 performBlockAndWait:v7];
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

void __48__PHMomentShare_shouldPromptUserToIgnoreBudgets__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  id v3 = (void *)MEMORY[0x1E4F8A9C0];
  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v5 = [v3 shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v4];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (unint64_t)[v5 estimateUploadSize] > 0xC800000;
  }
  else
  {
    id v6 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v2;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to find moment share with uuid %@ to estimate upload size.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (PHMomentShare)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PHMomentShare;
  uint64_t v9 = [(PHAssetCollection *)&v42 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"title"];
    localizedTitle = v9->super._localizedTitle;
    v9->super._localizedTitle = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:@"creationDate"];
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v12;

    uint64_t v14 = [v8 objectForKeyedSubscript:@"shareURL"];
    shareURL = v9->_shareURL;
    v9->_shareURL = (NSURL *)v14;

    v16 = [v8 objectForKeyedSubscript:@"status"];
    v9->_status = [v16 integerValue];

    v17 = [v8 objectForKeyedSubscript:@"trashedState"];
    v9->_trashedState = [v17 unsignedIntegerValue];

    v18 = [v8 objectForKeyedSubscript:@"assetCount"];
    v9->_assetCount = [v18 unsignedIntegerValue];

    v19 = [v8 objectForKeyedSubscript:@"photosCount"];
    v9->_photosCount = [v19 unsignedIntegerValue];

    v20 = [v8 objectForKeyedSubscript:@"videosCount"];
    v9->_videosCount = [v20 unsignedIntegerValue];

    v21 = [v8 objectForKeyedSubscript:@"uploadedPhotosCount"];
    v9->_uploadedPhotosCount = [v21 unsignedIntegerValue];

    v22 = [v8 objectForKeyedSubscript:@"uploadedVideosCount"];
    v9->_uploadedVideosCount = [v22 unsignedIntegerValue];

    uint64_t v23 = [v8 objectForKeyedSubscript:@"scopeIdentifier"];
    scopeIdentifier = v9->_scopeIdentifier;
    v9->_scopeIdentifier = (NSString *)v23;

    uint64_t v25 = [v8 objectForKeyedSubscript:@"startDate"];
    startDate = v9->super._startDate;
    v9->super._startDate = (NSDate *)v25;

    uint64_t v27 = [v8 objectForKeyedSubscript:@"endDate"];
    endDate = v9->super._endDate;
    v9->super._endDate = (NSDate *)v27;

    uint64_t v29 = [v8 objectForKeyedSubscript:@"expiryDate"];
    expiryDate = v9->_expiryDate;
    v9->_expiryDate = (NSDate *)v29;

    uint64_t v31 = [v8 objectForKeyedSubscript:@"thumbnailImageData"];
    thumbnailImageData = v9->_thumbnailImageData;
    v9->_thumbnailImageData = (NSData *)v31;

    uint64_t v33 = [v8 objectForKeyedSubscript:@"previewData"];
    previewData = v9->_previewData;
    v9->_previewData = (NSData *)v33;

    v35 = [v8 objectForKeyedSubscript:@"shouldIgnoreBudgets"];
    v9->_shouldIgnoreBudgets = [v35 BOOLValue];

    v36 = [v8 objectForKeyedSubscript:@"shouldNotifyOnUploadCompletion"];
    v9->_shouldNotifyOnUploadCompletion = [v36 BOOLValue];

    v37 = [v8 objectForKeyedSubscript:@"localPublishState"];
    v9->_publishState = [v37 unsignedIntegerValue];

    v38 = [[PHMomentSharePreview alloc] initWithThumbnailImageData:v9->_thumbnailImageData previewData:v9->_previewData];
    preview = v9->_preview;
    v9->_preview = v38;

    v9->super._assetCollectionType = 7;
    v40 = [v8 objectForKeyedSubscript:@"publicPermission"];
    v9->_publicPermission = [v40 integerValue];
  }
  return v9;
}

- (PHMomentSharePreview)preview
{
  return self->_preview;
}

- (unint64_t)estimatedVideosCount
{
  return self->_videosCount;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_photosCount;
}

- (unint64_t)estimatedAssetCount
{
  return self->_assetCount;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchMomentSharesOverlappingAssetCollection:(id)a3 options:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 startDate];
  if (!v8)
  {
    uint64_t v9 = [v6 photoLibrary];
    uint64_t v10 = [v9 librarySpecificFetchOptions];

    [v10 setFetchLimit:1];
    id v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v32[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    [v10 setSortDescriptors:v12];

    char v13 = +[PHAsset fetchAssetsInAssetCollection:v6 options:v10];
    uint64_t v14 = [v13 firstObject];

    id v8 = [v14 creationDate];
  }
  v15 = [v6 endDate];
  if (!v15)
  {
    v16 = [v6 photoLibrary];
    v17 = [v16 librarySpecificFetchOptions];

    [v17 setFetchLimit:1];
    v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    uint64_t v31 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [v17 setSortDescriptors:v19];

    v20 = +[PHAsset fetchAssetsInAssetCollection:v6 options:v17];
    v21 = [v20 firstObject];

    v15 = [v21 creationDate];
  }
  v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate <= %@ && endDate >= %@", v15, v8];
  uint64_t v23 = +[PHPhotoLibrary sharedMomentSharePhotoLibrary];
  v24 = [v23 librarySpecificFetchOptions];
  [v24 setPredicate:v22];
  uint64_t v25 = [v7 photoLibrary];
  v26 = [v24 photoLibrary];

  if (v25 != v26)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PHMomentShare.m", 421, @"Invalid parameter not satisfying: %@", @"options.photoLibrary == localOptions.photoLibrary" object file lineNumber description];
  }
  [v24 mergeWithFetchOptions:v7];
  uint64_t v27 = +[PHAssetCollection fetchAssetCollectionsWithType:7 subtype:0x7FFFFFFFFFFFFFFFLL options:v24];

  return v27;
}

+ (id)_fetchLocalMomentShareWithUUID:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = +[PHMomentShare localIdentifierWithUUID:a3];
  id v6 = +[PHPhotoLibrary sharedMomentSharePhotoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];

  v19[0] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v9 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v8 options:v7];

  if ([v9 count] == 1)
  {
    uint64_t v10 = [v9 firstObject];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F8AD00];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18 = @"Moment share not found";
    char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v14 = objc_msgSend(v11, "ph_errorWithDomain:code:userInfo:", v12, 100, v13);
    v15 = +[PHShare PHShareErrorFromError:v14];

    if (a4) {
      *a4 = v15;
    }

    uint64_t v10 = 0;
  }

  return v10;
}

+ (void)fetchMomentShareFromShareURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 photoLibrary];
  id v14 = 0;
  char v10 = [v9 openAndWaitWithUpgrade:0 error:&v14];
  id v11 = v14;
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__PHMomentShare_fetchMomentShareFromShareURL_options_completionHandler___block_invoke;
    v12[3] = &unk_1E5847CD8;
    id v13 = v8;
    +[PHShare fetchShareFromShareURL:v7 ignoreExistingShare:0 photoLibrary:v9 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v11);
  }
}

void __72__PHMomentShare_fetchMomentShareFromShareURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v7);
  }
  else
  {
    id v8 = 0;
    id v5 = +[PHMomentShare _fetchLocalMomentShareWithUUID:a2 error:&v8];
    id v6 = v8;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)fetchLocalMomentShareFromShareURL:(id)a3 error:(id *)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v8 photoLibrary];
  id v35 = 0;
  char v10 = [v9 openAndWaitWithUpgrade:0 error:&v35];
  id v11 = v35;
  uint64_t v12 = v11;
  if (v10)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__42932;
    uint64_t v33 = __Block_byref_object_dispose__42933;
    id v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__42932;
    uint64_t v27 = __Block_byref_object_dispose__42933;
    id v28 = 0;
    id v13 = [v9 photoLibrary];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__PHMomentShare_fetchLocalMomentShareFromShareURL_error_options___block_invoke;
    v18[3] = &unk_1E5847CB0;
    id v19 = v7;
    id v14 = v13;
    id v20 = v14;
    v21 = &v29;
    v22 = &v23;
    [v14 performBlockAndWait:v18];
    v15 = (void *)v30[5];
    if (a4 && !v15)
    {
      *a4 = (id) v24[5];
      v15 = (void *)v30[5];
    }
    id v16 = v15;

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v16 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v16;
}

void __65__PHMomentShare_fetchLocalMomentShareFromShareURL_error_options___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F8A9C0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v5 = [v2 shareWithShareURL:v3 includeTrashed:1 inManagedObjectContext:v4];

  if (v5)
  {
    if ([v5 trashedState] == 1)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F8AD00];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v8 = NSString;
      uint64_t v9 = [v5 uuid];
      char v10 = [v8 stringWithFormat:@"Moment share %@ found but it's trashed", v9];
      uint64_t v23 = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v12 = [v6 errorWithDomain:v7 code:101 userInfo:v11];

      uint64_t v13 = +[PHShare PHShareErrorFromError:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      uint64_t v12 = [v5 uuid];
      id v16 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v17;
        __int16 v26 = 2112;
        uint64_t v27 = v12;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_INFO, "Found local moment share with shareURL %{public}@ with uuid %@", buf, 0x16u);
      }
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v18 + 40);
      uint64_t v19 = +[PHMomentShare _fetchLocalMomentShareWithUUID:v12 error:&obj];
      objc_storeStrong((id *)(v18 + 40), obj);
      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      v15 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
  }
}

+ (BOOL)managedObjectSupportsShareExpiredState
{
  return 1;
}

+ (BOOL)managedObjectSupportsShareTrashedState
{
  return 1;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (id)localIdentifierWithUUID:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [a1 identifierCode];
  uint64_t v7 = [v4 stringWithFormat:@"%@/L0/%@", v5, v6];

  return v7;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PHMomentShare_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_42942 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_42942, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_42943 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __53__PHMomentShare_transformValueExpression_forKeyPath___block_invoke()
{
  v4[20] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"title";
  v4[1] = @"creationDate";
  v4[2] = @"uuid";
  v4[3] = @"shareURL";
  v4[4] = @"status";
  v4[5] = @"assetCount";
  v4[6] = @"photosCount";
  v4[7] = @"videosCount";
  v4[8] = @"uploadedPhotosCount";
  v4[9] = @"uploadedVideosCount";
  v4[10] = @"scopeIdentifier";
  v4[11] = @"startDate";
  v4[12] = @"endDate";
  v4[13] = @"expiryDate";
  v4[14] = @"thumbnailImageData";
  v4[15] = @"previewData";
  v4[16] = @"shouldIgnoreBudgets";
  v4[17] = @"shouldNotifyOnUploadCompletion";
  v4[18] = @"publishState";
  v4[19] = @"publicPermission";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:20];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_42943;
  transformValueExpression_forKeyPath___passThroughSet_42943 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_42952;

  return v2;
}

void __29__PHMomentShare_entityKeyMap__block_invoke()
{
  v45[20] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = [PHEntityKeyMap alloc];
  v43 = @"title";
  v44[0] = @"title";
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v45[0] = v23;
  v44[1] = @"creationDate";
  objc_super v42 = @"creationDate";
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v45[1] = v22;
  v44[2] = @"uuid";
  v41 = @"uuid";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v45[2] = v21;
  v44[3] = @"shareURL";
  v40 = @"shareURL";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v45[3] = v20;
  v44[4] = @"status";
  v39 = @"status";
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v45[4] = v19;
  v44[5] = @"assetCount";
  v38 = @"assetCount";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v45[5] = v17;
  v44[6] = @"photosCount";
  v37 = @"photosCount";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v45[6] = v16;
  v44[7] = @"videosCount";
  v36 = @"videosCount";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v45[7] = v15;
  v44[8] = @"uploadedPhotosCount";
  id v35 = @"uploadedPhotosCount";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v45[8] = v14;
  v44[9] = @"uploadedVideosCount";
  id v34 = @"uploadedVideosCount";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v45[9] = v13;
  v44[10] = @"scopeIdentifier";
  uint64_t v33 = @"scopeIdentifier";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v45[10] = v12;
  v44[11] = @"startDate";
  v32 = @"startDate";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v45[11] = v0;
  v44[12] = @"endDate";
  uint64_t v31 = @"endDate";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v45[12] = v1;
  v44[13] = @"expiryDate";
  v30 = @"expiryDate";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v45[13] = v2;
  v44[14] = @"thumbnailImageData";
  uint64_t v29 = @"thumbnailImageData";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v45[14] = v3;
  v44[15] = @"previewData";
  uint64_t v28 = @"previewData";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v45[15] = v4;
  v44[16] = @"shouldIgnoreBudgets";
  uint64_t v27 = @"shouldIgnoreBudgets";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v45[16] = v5;
  v44[17] = @"shouldNotifyOnUploadCompletion";
  __int16 v26 = @"shouldNotifyOnUploadCompletion";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v45[17] = v6;
  v44[18] = @"localPublishState";
  uint64_t v25 = @"publishState";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v45[18] = v7;
  v44[19] = @"publicPermission";
  v24 = @"publicPermission";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v45[19] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:20];
  uint64_t v10 = [(PHEntityKeyMap *)v18 initWithPropertyKeysByEntityKey:v9];
  id v11 = (void *)entityKeyMap_pl_once_object_15_42952;
  entityKeyMap_pl_once_object_15_42952 = v10;
}

+ (id)identifierCode
{
  return @"140";
}

+ (id)fetchType
{
  uint64_t v2 = @"PHMomentShare";
  return @"PHMomentShare";
}

+ (id)managedEntityName
{
  return @"MomentShare";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_42960 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_42960, &__block_literal_global_42961);
  }
  uint64_t v3 = (void *)propertiesToFetchWithHint__array_42962;

  return v3;
}

void __43__PHMomentShare_propertiesToFetchWithHint___block_invoke()
{
  v3[22] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"title";
  v3[2] = @"creationDate";
  v3[3] = @"uuid";
  v3[4] = @"status";
  v3[5] = @"shareURL";
  v3[6] = @"assetCount";
  v3[7] = @"photosCount";
  v3[8] = @"videosCount";
  v3[9] = @"uploadedPhotosCount";
  v3[10] = @"uploadedVideosCount";
  v3[11] = @"scopeIdentifier";
  v3[12] = @"startDate";
  v3[13] = @"endDate";
  v3[14] = @"expiryDate";
  v3[15] = @"thumbnailImageData";
  v3[16] = @"previewData";
  v3[17] = @"shouldIgnoreBudgets";
  v3[18] = @"shouldNotifyOnUploadCompletion";
  v3[19] = @"trashedState";
  v3[20] = @"localPublishState";
  v3[21] = @"publicPermission";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:22];
  uint64_t v2 = (void *)propertiesToFetchWithHint__array_42962;
  propertiesToFetchWithHint__array_42962 = v1;
}

@end