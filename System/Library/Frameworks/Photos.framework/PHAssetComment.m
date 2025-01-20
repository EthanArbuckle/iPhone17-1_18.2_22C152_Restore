@interface PHAssetComment
+ (id)entityKeyMap;
+ (id)fetchCommentsForAsset:(id)a3 options:(id)a4;
+ (id)fetchLikesForAsset:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
- (BOOL)_isInterestingToUser:(id)a3 cloudSharedProperties:(id)a4;
- (BOOL)canBeDeletedByUser;
- (BOOL)isBatchComment;
- (BOOL)isCaption;
- (BOOL)isDeletable;
- (BOOL)isInterestingForAlbumsSorting;
- (BOOL)isInterestingToUser;
- (BOOL)isLike;
- (BOOL)isMyComment;
- (BOOL)shouldNotifyAsNotificationWithMediaStreamInfo:(id)a3 asCaptionOnly:(BOOL *)a4;
- (Class)changeRequestClass;
- (NSDate)commentClientDate;
- (NSDate)commentDate;
- (NSString)cloudGUID;
- (NSString)commentText;
- (NSString)commenterDisplayName;
- (NSString)commenterEmail;
- (NSString)commenterFirstName;
- (NSString)commenterFullName;
- (NSString)commenterHashedPersonID;
- (NSString)commenterLastName;
- (PHAssetComment)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (id)personInfoManager;
@end

@implementation PHAssetComment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commenterHashedPersonID, 0);
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_commentClientDate, 0);
  objc_storeStrong((id *)&self->_commentDate, 0);

  objc_storeStrong((id *)&self->_commentText, 0);
}

- (BOOL)isInterestingToUser
{
  return self->_isInterestingToUser;
}

- (NSString)commenterHashedPersonID
{
  return self->_commenterHashedPersonID;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (NSDate)commentClientDate
{
  return self->_commentClientDate;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (BOOL)canBeDeletedByUser
{
  return self->_canBeDeletedByUser;
}

- (NSDate)commentDate
{
  return self->_commentDate;
}

- (NSString)commentText
{
  return self->_commentText;
}

- (BOOL)isMyComment
{
  return self->_isMyComment;
}

- (BOOL)isBatchComment
{
  return self->_isBatchComment;
}

- (BOOL)isCaption
{
  return self->_isCaption;
}

- (BOOL)isLike
{
  return self->_isLike;
}

- (NSString)commenterFullName
{
  v3 = [(PHAssetComment *)self personInfoManager];
  v4 = [(PHAssetComment *)self commenterHashedPersonID];
  v5 = [v3 fullNameForPersonID:v4];

  return (NSString *)v5;
}

- (NSString)commenterLastName
{
  v3 = [(PHAssetComment *)self personInfoManager];
  v4 = [(PHAssetComment *)self commenterHashedPersonID];
  v5 = [v3 lastNameForPersonID:v4];

  return (NSString *)v5;
}

- (NSString)commenterFirstName
{
  v3 = [(PHAssetComment *)self personInfoManager];
  v4 = [(PHAssetComment *)self commenterHashedPersonID];
  v5 = [v3 firstNameForPersonID:v4];

  return (NSString *)v5;
}

- (NSString)commenterEmail
{
  v3 = [(PHAssetComment *)self personInfoManager];
  v4 = [(PHAssetComment *)self commenterHashedPersonID];
  v5 = [v3 emailForPersonID:v4];

  return (NSString *)v5;
}

- (id)personInfoManager
{
  v2 = [(PHObject *)self photoLibrary];
  v3 = [v2 photoLibraryBundle];
  v4 = [v3 personInfoManager];

  return v4;
}

- (NSString)commenterDisplayName
{
  v3 = [(PHAssetComment *)self commenterFirstName];
  v4 = [(PHAssetComment *)self commenterLastName];
  v5 = [(PHAssetComment *)self commenterFullName];
  if ([v5 length])
  {
    v6 = v5;
  }
  else if ([v3 length] || objc_msgSend(v4, "length"))
  {
    PLLocalizedNameWithFirstAndLastName();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = [(PHAssetComment *)self commenterEmail];
  }
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = &stru_1EEAC1950;
  }

  return (NSString *)v7;
}

- (BOOL)isInterestingForAlbumsSorting
{
  if ([(PHAssetComment *)self isMyComment]) {
    return 1;
  }

  return [(PHAssetComment *)self isInterestingToUser];
}

- (BOOL)shouldNotifyAsNotificationWithMediaStreamInfo:(id)a3 asCaptionOnly:(BOOL *)a4
{
  id v6 = a3;
  BOOL v7 = [(PHAssetComment *)self isCaption];
  v8 = [v6 valueForKey:*MEMORY[0x1E4F5C4A0]];

  LODWORD(v6) = [v8 BOOLValue];
  if (!v6)
  {
    BOOL result = [(PHAssetComment *)self isInterestingToUser];
    if (!a4) {
      return result;
    }
    goto LABEL_11;
  }
  v9 = PLPhotoSharingGetLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v10) {
      goto LABEL_10;
    }
    __int16 v15 = 0;
    v11 = "Notifications: mstreamd says comment is not interesting, but allowing as caption";
    v12 = (uint8_t *)&v15;
  }
  else
  {
    if (!v10) {
      goto LABEL_10;
    }
    __int16 v14 = 0;
    v11 = "Notifications: Ignoring comment notification because mstreamd says it's not interesting and is not a caption";
    v12 = (uint8_t *)&v14;
  }
  _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
LABEL_10:

  BOOL result = 0;
  if (!a4) {
    return result;
  }
LABEL_11:
  if (!result) {
    *a4 = v7;
  }
  return result;
}

- (BOOL)_isInterestingToUser:(id)a3 cloudSharedProperties:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 isCloudSharedAsset])
  {
    v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v6;
      BOOL v10 = "Comment marked as not interesting because it's not for a cloudSharedAsset: %@.";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  char v8 = [v7 cloudIsMyAsset];
  if ([(PHAssetComment *)self isMyComment])
  {
    v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      BOOL v10 = "Ignoring comment notification because it's my comment";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 2;
LABEL_7:
      _os_log_impl(&dword_19B043000, v11, v12, v10, (uint8_t *)&v16, v13);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v8)
  {
    LOBYTE(v14) = 1;
    goto LABEL_10;
  }
  if ([v7 cloudHasCommentsByMe])
  {
    BOOL v14 = ![(PHAssetComment *)self isLike];
    goto LABEL_10;
  }
LABEL_9:
  LOBYTE(v14) = 0;
LABEL_10:

  return v14;
}

- (PHAssetComment)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v38.receiver = self;
  v38.super_class = (Class)PHAssetComment;
  BOOL v10 = [(PHObject *)&v38 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:v9];
  if (v10)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:@"cloudGUID"];
    uuid = v10->super._uuid;
    v10->super._uuid = (NSString *)v11;

    uint32_t v13 = [v8 objectForKeyedSubscript:@"isCaption"];
    v10->_isCaption = [v13 BOOLValue];

    BOOL v14 = [v8 objectForKeyedSubscript:@"isBatchComment"];
    v10->_isBatchComment = [v14 BOOLValue];

    __int16 v15 = [v8 objectForKeyedSubscript:@"isDeletable"];
    v10->_isDeletable = [v15 BOOLValue];

    int v16 = [v8 objectForKeyedSubscript:@"isLike"];
    v10->_isLike = [v16 BOOLValue];

    id v17 = [v8 objectForKeyedSubscript:@"isMyComment"];
    v10->_isMyComment = [v17 BOOLValue];

    uint64_t v18 = [v8 objectForKeyedSubscript:@"commentClientDate"];
    commentClientDate = v10->_commentClientDate;
    v10->_commentClientDate = (NSDate *)v18;

    uint64_t v20 = [v8 objectForKeyedSubscript:@"commentDate"];
    commentDate = v10->_commentDate;
    v10->_commentDate = (NSDate *)v20;

    uint64_t v22 = [v8 objectForKeyedSubscript:@"commentText"];
    commentText = v10->_commentText;
    v10->_commentText = (NSString *)v22;

    uint64_t v24 = [v8 objectForKeyedSubscript:@"cloudGUID"];
    cloudGUID = v10->_cloudGUID;
    v10->_cloudGUID = (NSString *)v24;

    uint64_t v26 = [v8 objectForKeyedSubscript:@"commenterHashedPersonID"];
    commenterHashedPersonID = v10->_commenterHashedPersonID;
    v10->_commenterHashedPersonID = (NSString *)v26;

    if (v10->_isLike) {
      v28 = @"likedAsset";
    }
    else {
      v28 = @"commentedAsset";
    }
    v29 = [v8 objectForKeyedSubscript:v28];
    v30 = [v9 librarySpecificFetchOptions];
    v40[0] = @"PHAssetPropertySetCloudShared";
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v30 setFetchPropertySets:v31];

    v39 = v29;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    v33 = +[PHAsset fetchAssetsWithObjectIDs:v32 options:v30];
    v34 = [v33 firstObject];

    v35 = [v34 cloudSharedProperties];
    if (v34) {
      v10->_isInterestingToUser = [(PHAssetComment *)v10 _isInterestingToUser:v34 cloudSharedProperties:v35];
    }
    if (-[PHAssetComment isDeletable](v10, "isDeletable") || ([v35 cloudIsMyAsset] & 1) != 0) {
      char v36 = 1;
    }
    else {
      char v36 = [(PHAssetComment *)v10 isMyComment];
    }
    v10->_canBeDeletedByUser = v36;
  }
  return v10;
}

- (Class)changeRequestClass
{
  return 0;
}

+ (id)fetchLikesForAsset:(id)a3 options:(id)a4
{
  v4 = +[PHQuery queryForLikesForAsset:a3 options:a4];
  v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchCommentsForAsset:(id)a3 options:(id)a4
{
  v4 = +[PHQuery queryForCommentsForAsset:a3 options:a4];
  v5 = [v4 executeQuery];

  return v5;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_15_46554;

  return v2;
}

void __30__PHAssetComment_entityKeyMap__block_invoke()
{
  v25[10] = *MEMORY[0x1E4F143B8];
  os_log_type_t v12 = [PHEntityKeyMap alloc];
  v23[1] = @"cloudGUID";
  v24[0] = @"cloudGUID";
  v23[0] = @"uuid";
  uint32_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v25[0] = v13;
  v24[1] = @"isCaption";
  uint64_t v22 = @"isCaption";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v25[1] = v0;
  v24[2] = @"isBatchComment";
  v21 = @"isBatchComment";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v25[2] = v1;
  v24[3] = @"isDeletable";
  uint64_t v20 = @"isDeletable";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v25[3] = v2;
  v24[4] = @"isLike";
  v19 = @"isLike";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v25[4] = v3;
  v24[5] = @"isMyComment";
  uint64_t v18 = @"isMyComment";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v25[5] = v4;
  v24[6] = @"commentClientDate";
  id v17 = @"commentClientDate";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v25[6] = v5;
  v24[7] = @"commentDate";
  int v16 = @"commentDate";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v25[7] = v6;
  v24[8] = @"commenterHashedPersonID";
  __int16 v15 = @"commenterHashedPersonID";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v25[8] = v7;
  v24[9] = @"commentText";
  BOOL v14 = @"commentText";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v25[9] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:10];
  uint64_t v10 = [(PHEntityKeyMap *)v12 initWithPropertyKeysByEntityKey:v9];
  uint64_t v11 = (void *)entityKeyMap_pl_once_object_15_46554;
  entityKeyMap_pl_once_object_15_46554 = v10;
}

+ (id)identifierCode
{
  return @"230";
}

+ (id)fetchType
{
  v2 = @"PHAssetComment";
  return @"PHAssetComment";
}

+ (id)managedEntityName
{
  return @"CloudSharedComment";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PHAssetComment_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_46566 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_46566, block);
  }
  v3 = (void *)propertiesToFetchWithHint__array_46567;

  return v3;
}

void __44__PHAssetComment_propertiesToFetchWithHint___block_invoke()
{
  v4[13] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v0 setName:@"objectID"];
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setExpression:v1];

  [v0 setExpressionResultType:2000];
  v4[0] = v0;
  v4[1] = @"cloudGUID";
  v4[2] = @"commentClientDate";
  v4[3] = @"commentDate";
  v4[4] = @"commenterHashedPersonID";
  v4[5] = @"commentText";
  v4[6] = @"isBatchComment";
  v4[7] = @"isCaption";
  v4[8] = @"isDeletable";
  v4[9] = @"isLike";
  v4[10] = @"isMyComment";
  v4[11] = @"likedAsset";
  v4[12] = @"commentedAsset";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];
  v3 = (void *)propertiesToFetchWithHint__array_46567;
  propertiesToFetchWithHint__array_46567 = v2;
}

@end