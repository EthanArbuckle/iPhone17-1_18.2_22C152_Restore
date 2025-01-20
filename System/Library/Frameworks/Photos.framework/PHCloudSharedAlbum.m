@interface PHCloudSharedAlbum
+ (id)entityKeyMap;
+ (id)fetchCloudSharedAlbumsWithGUIDs:(id)a3 options:(id)a4;
+ (id)fetchCloudSharedAlbumsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchCloudSharedAlbumsWithOptions:(id)a3;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
- (BOOL)canPerformEditOperation:(int64_t)a3;
- (BOOL)collectionHasFixedOrder;
- (BOOL)isCloudMultipleContributorsEnabled;
- (BOOL)isCloudNotificationsEnabled;
- (BOOL)isCloudSharedAlbum;
- (BOOL)isOwned;
- (BOOL)publicURLEnabled;
- (Class)changeRequestClass;
- (NSArray)invitationRecords;
- (NSNumber)cloudOwnerEmailKey;
- (NSNumber)cloudRelationshipState;
- (NSString)cloudOwnerEmail;
- (NSString)cloudOwnerFirstName;
- (NSString)cloudOwnerFullName;
- (NSString)cloudOwnerHashedPersonID;
- (NSString)cloudOwnerLastName;
- (NSString)cloudOwnerPersonID;
- (NSString)cloudOwnerPhone;
- (NSString)publicURL;
- (PHCloudSharedAlbum)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (id)description;
- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3;
- (signed)cloudAlbumSubtype;
@end

@implementation PHCloudSharedAlbum

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudRelationshipState, 0);
  objc_storeStrong((id *)&self->_cloudOwnerPersonID, 0);
  objc_storeStrong((id *)&self->_publicURL, 0);
  objc_storeStrong((id *)&self->_cloudOwnerHashedPersonID, 0);
  objc_storeStrong((id *)&self->_cloudOwnerEmailKey, 0);
  objc_storeStrong((id *)&self->_cloudOwnerFullName, 0);
  objc_storeStrong((id *)&self->_cloudOwnerLastName, 0);

  objc_storeStrong((id *)&self->_cloudOwnerFirstName, 0);
}

- (NSNumber)cloudRelationshipState
{
  return self->_cloudRelationshipState;
}

- (NSString)cloudOwnerPersonID
{
  return self->_cloudOwnerPersonID;
}

- (BOOL)publicURLEnabled
{
  return self->_publicURLEnabled;
}

- (NSString)publicURL
{
  return self->_publicURL;
}

- (NSString)cloudOwnerHashedPersonID
{
  return self->_cloudOwnerHashedPersonID;
}

- (NSNumber)cloudOwnerEmailKey
{
  return self->_cloudOwnerEmailKey;
}

- (NSString)cloudOwnerFullName
{
  return self->_cloudOwnerFullName;
}

- (NSString)cloudOwnerLastName
{
  return self->_cloudOwnerLastName;
}

- (NSString)cloudOwnerFirstName
{
  return self->_cloudOwnerFirstName;
}

- (signed)cloudAlbumSubtype
{
  return self->_cloudAlbumSubtype;
}

- (BOOL)isCloudNotificationsEnabled
{
  return self->_cloudNotificationsEnabled;
}

- (BOOL)isCloudMultipleContributorsEnabled
{
  return self->_cloudMultipleContributorsEnabled;
}

- (BOOL)isOwned
{
  return self->_owned;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PHCloudSharedAlbum;
  v2 = [(PHAssetCollection *)&v4 description];

  return v2;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  int v6 = [MEMORY[0x1E4F8B9D8] isEntitledForPhotoKit];
  if (v6)
  {
    if ([(PHCollection *)self isDeleted])
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    if ([(PHAssetCollection *)self assetCollectionType] != PHAssetCollectionTypeAlbum)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHCloudSharedAlbum.m", 228, @"Wrong type %lu", -[PHAssetCollection assetCollectionType](self, "assetCollectionType"));
    }
    if ([(PHAssetCollection *)self assetCollectionSubtype] != PHAssetCollectionSubtypeAlbumCloudShared)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHCloudSharedAlbum.m", 229, @"Wrong subtype %lu", -[PHAssetCollection assetCollectionSubtype](self, "assetCollectionSubtype"));
    }
    int cloudAlbumSubtype = (unsigned __int16)self->_cloudAlbumSubtype;
    BOOL v8 = [(PHCloudSharedAlbum *)self isOwned];
    if (cloudAlbumSubtype == 1)
    {
      BOOL v9 = a3 == 6 && v8;
      LOBYTE(v6) = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || v9;
    }
    else if (v8)
    {
      LOBYTE(v6) = a3 != 5 && a3 != 2;
    }
    else
    {
      if ([(PHCloudSharedAlbum *)self isCloudMultipleContributorsEnabled])
      {
        if ((unint64_t)a3 < 7) {
          return (0x4Au >> a3) & 1;
        }
        goto LABEL_3;
      }
      LOBYTE(v6) = a3 == 6 || a3 == 1;
    }
  }
  return v6;
}

- (NSArray)invitationRecords
{
  v2 = +[PHCloudSharedAlbumInvitationRecord fetchInvitationRecordsForSharedAlbum:self];
  v3 = [v2 fetchedObjects];

  return (NSArray *)v3;
}

- (NSString)cloudOwnerPhone
{
  v3 = [(PHObject *)self photoLibrary];
  objc_super v4 = [v3 photoLibrary];
  v5 = [v4 personInfoManager];
  int v6 = [v5 phonesForInvitationRecordGUID:self->_cloudOwnerPersonID];
  v7 = [v6 firstObject];

  return (NSString *)v7;
}

- (NSString)cloudOwnerEmail
{
  v3 = [(PHObject *)self photoLibrary];
  objc_super v4 = [v3 photoLibraryBundle];
  v5 = [v4 emailAddressManager];
  int v6 = [(PHCloudSharedAlbum *)self cloudOwnerEmailKey];
  v7 = [v5 emailAddressForKey:v6];

  if (!v7)
  {
    BOOL v8 = [v3 photoLibrary];
    BOOL v9 = [v8 personInfoManager];
    v10 = [(PHCloudSharedAlbum *)self cloudOwnerHashedPersonID];
    v7 = [v9 emailForPersonID:v10];

    if (!v7)
    {
      if ((PLIsAssetsd() & 1) == 0) {
        [MEMORY[0x1E4F8AC68] checkedSharedAlbumServerModelRelationships];
      }
      v7 = 0;
    }
  }

  return (NSString *)v7;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PHCloudSharedAlbum *)self cloudOwnerFirstName];
  int v6 = [(PHCloudSharedAlbum *)self cloudOwnerLastName];
  v7 = [(PHCloudSharedAlbum *)self cloudOwnerFullName];
  BOOL v8 = [(PHCloudSharedAlbum *)self cloudOwnerEmailKey];
  BOOL v9 = (void *)MEMORY[0x1E4F8A720];
  BOOL v10 = [(PHCloudSharedAlbum *)self isOwned];
  v11 = [(PHObject *)self photoLibrary];
  v12 = [v11 photoLibraryBundle];
  v13 = [v12 emailAddressManager];
  v14 = [v9 localizedSharedByLabelWithFirstName:v5 lastName:v6 fullName:v7 emailKey:v8 isOwned:v10 allowsEmail:v3 emailAddressManager:v13];

  return v14;
}

- (BOOL)isCloudSharedAlbum
{
  return 1;
}

- (PHCloudSharedAlbum)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PHCloudSharedAlbum;
  BOOL v9 = [(PHAssetCollection *)&v37 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    BOOL v10 = [v8 objectForKeyedSubscript:@"cloudMultipleContributorsEnabled"];
    v9->_cloudMultipleContributorsEnabled = [v10 BOOLValue];

    v11 = [v8 objectForKeyedSubscript:@"isOwned"];
    v9->_owned = [v11 BOOLValue];

    v12 = [v8 objectForKeyedSubscript:@"cloudNotificationsEnabled"];
    v9->_cloudNotificationsEnabled = [v12 BOOLValue];

    v13 = [v8 objectForKeyedSubscript:@"cloudAlbumSubtype"];
    v9->_int cloudAlbumSubtype = [v13 shortValue];

    uint64_t v14 = [v8 objectForKeyedSubscript:@"cloudOwnerFirstName"];
    cloudOwnerFirstName = v9->_cloudOwnerFirstName;
    v9->_cloudOwnerFirstName = (NSString *)v14;

    uint64_t v16 = [v8 objectForKeyedSubscript:@"cloudOwnerLastName"];
    cloudOwnerLastName = v9->_cloudOwnerLastName;
    v9->_cloudOwnerLastName = (NSString *)v16;

    uint64_t v18 = [v8 objectForKeyedSubscript:@"cloudOwnerFullName"];
    cloudOwnerFullName = v9->_cloudOwnerFullName;
    v9->_cloudOwnerFullName = (NSString *)v18;

    uint64_t v20 = [v8 objectForKeyedSubscript:@"cloudOwnerEmailKey"];
    cloudOwnerEmailKey = v9->_cloudOwnerEmailKey;
    v9->_cloudOwnerEmailKey = (NSNumber *)v20;

    uint64_t v22 = [v8 objectForKeyedSubscript:@"cloudOwnerHashedPersonID"];
    cloudOwnerHashedPersonID = v9->_cloudOwnerHashedPersonID;
    v9->_cloudOwnerHashedPersonID = (NSString *)v22;

    uint64_t v24 = [v8 objectForKeyedSubscript:@"publicURL"];
    publicURL = v9->_publicURL;
    v9->_publicURL = (NSString *)v24;

    v26 = [v8 objectForKeyedSubscript:@"cloudPublicURLEnabled"];
    if ([v26 BOOLValue])
    {
      v27 = [v8 objectForKeyedSubscript:@"cloudPublicURLEnabledLocal"];
      v9->_publicURLEnabled = [v27 BOOLValue];
    }
    else
    {
      v9->_publicURLEnabled = 0;
    }

    uint64_t v28 = [v8 objectForKeyedSubscript:@"cloudPersonID"];
    cloudOwnerPersonID = v9->_cloudOwnerPersonID;
    v9->_cloudOwnerPersonID = (NSString *)v28;

    uint64_t v30 = [v8 objectForKeyedSubscript:@"cloudRelationshipState"];
    cloudRelationshipState = v9->_cloudRelationshipState;
    v9->_cloudRelationshipState = (NSNumber *)v30;

    if (![(PHAssetCollection *)v9 assetCollectionType]
      || ![(PHAssetCollection *)v9 assetCollectionSubtype])
    {
      v32 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        uint64_t v33 = [(PHAssetCollection *)v9 assetCollectionType];
        uint64_t v34 = [(PHAssetCollection *)v9 assetCollectionSubtype];
        int v35 = [(PHAssetCollection *)v9 plAlbumKind];
        *(_DWORD *)buf = 134218754;
        uint64_t v39 = v33;
        __int16 v40 = 2048;
        uint64_t v41 = v34;
        __int16 v42 = 1024;
        int v43 = v35;
        __int16 v44 = 2112;
        id v45 = v8;
        _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_FAULT, "PHCloudSharedAlbum: rdar://problem/18103586 Invalid asset collection type (%lu) or subtype (%lu) with album kind: %d, dict: %@", buf, 0x26u);
      }
    }
  }

  return v9;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PHCloudSharedAlbum_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_47464 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_47464, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_47465 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __58__PHCloudSharedAlbum_transformValueExpression_forKeyPath___block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"localizedTitle";
  v4[1] = @"title";
  v4[2] = @"estimatedAssetCount";
  v4[3] = @"startDate";
  v4[4] = @"endDate";
  v4[5] = @"cloudGUID";
  v4[6] = @"cloudMultipleContributorsEnabled";
  v4[7] = @"isOwned";
  v4[8] = @"cloudAlbumSubtype";
  v4[9] = @"cloudRelationshipState";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  BOOL v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_47465;
  transformValueExpression_forKeyPath___passThroughSet_47465 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_47487;

  return v2;
}

void __34__PHCloudSharedAlbum_entityKeyMap__block_invoke()
{
  v45[20] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = [PHEntityKeyMap alloc];
  int v43 = @"uuid";
  v44[0] = @"uuid";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v45[0] = v23;
  v44[1] = @"title";
  v42[0] = @"localizedTitle";
  v42[1] = @"title";
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v45[1] = v22;
  v44[2] = @"cachedCount";
  uint64_t v41 = @"estimatedAssetCount";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v45[2] = v21;
  v44[3] = @"customSortAscending";
  __int16 v40 = @"customSortAscending";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v45[3] = v20;
  v44[4] = @"customSortKey";
  uint64_t v39 = @"customSortKey";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v45[4] = v19;
  v44[5] = @"startDate";
  v38 = @"startDate";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v45[5] = v17;
  v44[6] = @"endDate";
  objc_super v37 = @"endDate";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v45[6] = v16;
  v44[7] = @"cloudGUID";
  v36 = @"cloudGUID";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v45[7] = v15;
  v44[8] = @"privacyState";
  int v35 = @"privacyState";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v45[8] = v14;
  v44[9] = @"cloudMultipleContributorsEnabled";
  uint64_t v34 = @"cloudMultipleContributorsEnabled";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v45[9] = v13;
  v44[10] = @"isOwned";
  uint64_t v33 = @"isOwned";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v45[10] = v12;
  v44[11] = @"cloudNotificationsEnabled";
  v32 = @"cloudNotificationsEnabled";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v45[11] = v0;
  v44[12] = @"cloudAlbumSubtype";
  v31 = @"cloudAlbumSubtype";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v45[12] = v1;
  v44[13] = @"cloudOwnerEmailKey";
  uint64_t v30 = @"cloudOwnerEmailKey";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v45[13] = v2;
  v44[14] = @"cloudOwnerFirstName";
  v29 = @"cloudOwnerFirstName";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v45[14] = v3;
  v44[15] = @"cloudOwnerFullName";
  uint64_t v28 = @"cloudOwnerFullName";
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v45[15] = v4;
  v44[16] = @"cloudOwnerLastName";
  v27 = @"cloudOwnerLastName";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v45[16] = v5;
  v44[17] = @"cloudOwnerHashedPersonID";
  v26 = @"cloudOwnerHashedPersonID";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v45[17] = v6;
  v44[18] = @"cloudPersonID";
  v25 = @"cloudOwnerPersonID";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v45[18] = v7;
  v44[19] = @"cloudRelationshipState";
  uint64_t v24 = @"cloudRelationshipState";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v45[19] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:20];
  uint64_t v10 = [(PHEntityKeyMap *)v18 initWithPropertyKeysByEntityKey:v9];
  v11 = (void *)entityKeyMap_pl_once_object_15_47487;
  entityKeyMap_pl_once_object_15_47487 = v10;
}

+ (id)identifierCode
{
  return @"040";
}

+ (id)fetchType
{
  uint64_t v2 = @"PHCloudSharedAlbum";
  return @"PHCloudSharedAlbum";
}

+ (id)managedEntityName
{
  return @"CloudSharedAlbum";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PHCloudSharedAlbum_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (propertiesToFetchWithHint__onceToken_47514 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_47514, block);
  }
  BOOL v3 = (void *)propertiesToFetchWithHint__array_47515;

  return v3;
}

void __48__PHCloudSharedAlbum_propertiesToFetchWithHint___block_invoke(uint64_t a1)
{
  v5[14] = *MEMORY[0x1E4F143B8];
  v1 = +[PHAssetCollection propertiesToFetchWithHint:*(void *)(a1 + 32)];
  v5[0] = @"cloudMultipleContributorsEnabled";
  v5[1] = @"isOwned";
  v5[2] = @"cloudNotificationsEnabled";
  v5[3] = @"cloudAlbumSubtype";
  v5[4] = @"cloudOwnerEmailKey";
  v5[5] = @"cloudOwnerFirstName";
  v5[6] = @"cloudOwnerFullName";
  v5[7] = @"cloudOwnerLastName";
  v5[8] = @"cloudOwnerHashedPersonID";
  v5[9] = @"publicURL";
  v5[10] = @"cloudPublicURLEnabled";
  v5[11] = @"cloudPublicURLEnabledLocal";
  v5[12] = @"cloudPersonID";
  v5[13] = @"cloudRelationshipState";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:14];
  uint64_t v3 = [v1 arrayByAddingObjectsFromArray:v2];
  objc_super v4 = (void *)propertiesToFetchWithHint__array_47515;
  propertiesToFetchWithHint__array_47515 = v3;
}

+ (id)fetchCloudSharedAlbumsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PHCloudSharedAlbum_fetchCloudSharedAlbumsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __73__PHCloudSharedAlbum_fetchCloudSharedAlbumsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForCloudSharedAlbumsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchCloudSharedAlbumsWithOptions:(id)a3
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:1 subtype:101 options:a3];
}

+ (id)fetchCloudSharedAlbumsWithGUIDs:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"%K in %@", @"cloudGUID", a3];
  [v6 setPredicate:v7];

  id v8 = +[PHAssetCollection fetchAssetCollectionsWithType:1 subtype:101 options:v6];

  return v8;
}

@end