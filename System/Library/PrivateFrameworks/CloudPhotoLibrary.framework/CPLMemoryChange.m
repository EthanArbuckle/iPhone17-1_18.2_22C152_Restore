@interface CPLMemoryChange
+ (BOOL)supportsDeletion;
+ (BOOL)supportsDirectDeletion;
+ (BOOL)supportsSecureCoding;
+ (id)_createTestMemoryWithAssets:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isRejected;
- (CPLMemoryAssetList)assetList;
- (CPLMemoryAssetList)customUserAssetList;
- (CPLMemoryChange)initWithCoder:(id)a3;
- (NSData)assetListPredicate;
- (NSData)blacklistedFeature;
- (NSData)graphData;
- (NSData)movieData;
- (NSDate)creationDate;
- (NSString)subtitle;
- (NSString)title;
- (double)score;
- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3;
- (id)propertiesDescription;
- (id)scopedIdentifiersForMapping;
- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (int64_t)category;
- (int64_t)graphVersion;
- (int64_t)notificationState;
- (int64_t)playCount;
- (int64_t)shareCount;
- (int64_t)subcategory;
- (int64_t)userActionOptions;
- (int64_t)viewCount;
- (void)setAssetList:(id)a3;
- (void)setAssetListPredicate:(id)a3;
- (void)setBlacklistedFeature:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setCreationDate:(id)a3;
- (void)setCustomUserAssetList:(id)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setGraphData:(id)a3;
- (void)setGraphVersion:(int64_t)a3;
- (void)setMovieData:(id)a3;
- (void)setNotificationState:(int64_t)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setRejected:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setShareCount:(int64_t)a3;
- (void)setSubcategory:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserActionOptions:(int64_t)a3;
- (void)setViewCount:(int64_t)a3;
@end

@implementation CPLMemoryChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedFeature, 0);
  objc_storeStrong((id *)&self->_movieData, 0);
  objc_storeStrong((id *)&self->_graphData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_assetListPredicate, 0);
  objc_storeStrong((id *)&self->_customUserAssetList, 0);
  objc_storeStrong((id *)&self->_assetList, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setViewCount:(int64_t)a3
{
  self->_viewCount = a3;
}

- (int64_t)viewCount
{
  return self->_viewCount;
}

- (void)setShareCount:(int64_t)a3
{
  self->_shareCount = a3;
}

- (int64_t)shareCount
{
  return self->_shareCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setBlacklistedFeature:(id)a3
{
}

- (NSData)blacklistedFeature
{
  return self->_blacklistedFeature;
}

- (void)setNotificationState:(int64_t)a3
{
  self->_notificationState = a3;
}

- (int64_t)notificationState
{
  return self->_notificationState;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setMovieData:(id)a3
{
}

- (NSData)movieData
{
  return self->_movieData;
}

- (void)setUserActionOptions:(int64_t)a3
{
  self->_userActionOptions = a3;
}

- (int64_t)userActionOptions
{
  return self->_userActionOptions;
}

- (void)setRejected:(BOOL)a3
{
  self->_rejected = a3;
}

- (BOOL)isRejected
{
  return self->_rejected;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setGraphVersion:(int64_t)a3
{
  self->_graphVersion = a3;
}

- (int64_t)graphVersion
{
  return self->_graphVersion;
}

- (void)setGraphData:(id)a3
{
}

- (NSData)graphData
{
  return self->_graphData;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setAssetListPredicate:(id)a3
{
}

- (NSData)assetListPredicate
{
  return self->_assetListPredicate;
}

- (void)setCustomUserAssetList:(id)a3
{
}

- (CPLMemoryAssetList)customUserAssetList
{
  return self->_customUserAssetList;
}

- (void)setAssetList:(id)a3
{
}

- (CPLMemoryAssetList)assetList
{
  return self->_assetList;
}

- (void)setSubcategory:(int64_t)a3
{
  self->_subcategory = a3;
}

- (int64_t)subcategory
{
  return self->_subcategory;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (int64_t)category
{
  return self->_category;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  if (sel_notificationState == a3)
  {
    v3 = &__block_literal_global_4392;
  }
  else if (sel_blacklistedFeature == a3)
  {
    v3 = (void *)MEMORY[0x1BA994060](_CPLDefaultValueObjectNil, a2);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLMemoryChange;
    v3 = -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v5, sel_checkDefaultValueBlockForPropertyWithSelector_);
  }
  return v3;
}

BOOL __65__CPLMemoryChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notificationState] == 0;
}

- (id)propertiesDescription
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu assets", -[CPLMemoryAssetList assetsCount](self->_assetList, "assetsCount"));
  v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" %lu custom user assets", -[CPLMemoryAssetList assetsCount](self->_customUserAssetList, "assetsCount"));

  return v4;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (id)_createTestMemoryWithAssets:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 firstObject];
  objc_super v5 = [v4 scopedIdentifier];
  v6 = [v5 scopeIdentifier];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  v25 = v9;
  id v10 = +[CPLRecordChange newRecordInScopeWithIdentifier:v9];
  [v10 setTitle:@"Test Memory Title"];
  [v10 setSubtitle:@"Test Memory Subtitle"];
  [v10 setCategory:301];
  v11 = [MEMORY[0x1E4F1C9C8] date];
  [v10 setCreationDate:v11];

  v12 = [@"graphData" dataUsingEncoding:4];
  [v10 setGraphData:v12];

  [v10 setGraphVersion:1];
  v13 = [@"movieData" dataUsingEncoding:4];
  [v10 setMovieData:v13];

  [v10 setScore:10.0];
  [v10 setNotificationState:1];
  [v10 setPlayCount:10];
  [v10 setShareCount:10];
  [v10 setViewCount:10];
  v14 = objc_alloc_init(CPLMemoryAssetList);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v3;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v21 = objc_alloc_init(CPLMemoryAssetFlag);
        [(CPLMemoryAssetFlag *)v21 setIsRepresentative:1];
        [(CPLMemoryAssetFlag *)v21 setIsCurated:1];
        [(CPLMemoryAssetFlag *)v21 setIsMovieCurated:0];
        [(CPLMemoryAssetFlag *)v21 setIsKeyAsset:0];
        v22 = objc_alloc_init(CPLMemoryAsset);
        v23 = [v20 _unscopedIdentifier];
        [(CPLMemoryAsset *)v22 setAssetIdentifier:v23];

        [(CPLMemoryAsset *)v22 setAssetFlag:v21];
        [(CPLMemoryAssetList *)v14 addAsset:v22];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  [v10 setAssetList:v14];
  return v10;
}

- (CPLMemoryChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLMemoryChange;
  objc_super v5 = [(CPLRecordChange *)&v8 initWithCoder:v4];
  v6 = v5;
  if (v5
    && ![(CPLMemoryChange *)v5 userActionOptions]
    && [v4 decodeBoolForKey:@"userCreated"])
  {
    if (initWithCoder__onceToken_91 != -1) {
      dispatch_once(&initWithCoder__onceToken_91, &__block_literal_global_93);
    }
    [(CPLMemoryChange *)v6 setUserActionOptions:1];
  }

  return v6;
}

void __46__CPLMemoryChange_CPLNSCoding__initWithCoder___block_invoke()
{
  if (!_CPLSilentLogging)
  {
    v0 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1B4CAC000, v0, OS_LOG_TYPE_DEFAULT, "Storage might contain old serialized userCreated values", v1, 2u);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CPLMemoryChange;
  v7 = [(CPLRecordChange *)&v49 translateToClientChangeUsingIDMapping:v6 error:a4];
  objc_super v8 = v7;
  if (v7)
  {
    v40 = v7;
    [v7 assetList];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v39 = long long v48 = 0u;
    id v9 = [v39 assets];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v15 = [v14 assetIdentifier];
          if (v15)
          {
            uint64_t v16 = (void *)v15;
            uint64_t v17 = [CPLScopedIdentifier alloc];
            uint64_t v18 = [(CPLRecordChange *)self scopedIdentifier];
            id v19 = [(CPLScopedIdentifier *)v17 initRelativeToScopedIdentifier:v18 identifier:v16];

            if (v19)
            {
              v20 = [v6 localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v19];
              v21 = v20;
              if (v20)
              {
                v22 = [v20 identifier];
                [v14 setAssetIdentifier:v22];
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v11);
    }

    [v40 customUserAssetList];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v38 = long long v44 = 0u;
    v23 = [v38 assets];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          uint64_t v29 = [v28 assetIdentifier];
          if (v29)
          {
            v30 = (void *)v29;
            uint64_t v31 = [CPLScopedIdentifier alloc];
            v32 = [(CPLRecordChange *)self scopedIdentifier];
            id v33 = [(CPLScopedIdentifier *)v31 initRelativeToScopedIdentifier:v32 identifier:v30];

            if (v33)
            {
              v34 = [v6 localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v33];
              v35 = v34;
              if (v34)
              {
                v36 = [v34 identifier];
                [v28 setAssetIdentifier:v36];
              }
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v25);
    }

    objc_super v8 = v40;
  }

  return v8;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CPLMemoryChange;
  v7 = [(CPLRecordChange *)&v50 translateToCloudChangeUsingIDMapping:v6 error:a4];
  objc_super v8 = v7;
  if (v7)
  {
    v40 = v7;
    [v7 assetList];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v39 = long long v49 = 0u;
    id v9 = [v39 assets];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v15 = [v14 assetIdentifier];
          if (v15)
          {
            uint64_t v16 = (void *)v15;
            uint64_t v17 = [CPLScopedIdentifier alloc];
            uint64_t v18 = [(CPLRecordChange *)self scopedIdentifier];
            id v19 = [(CPLScopedIdentifier *)v17 initRelativeToScopedIdentifier:v18 identifier:v16];

            if (v19)
            {
              char v45 = 0;
              v20 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v19 isFinal:&v45];
              v21 = v20;
              if (v20)
              {
                v22 = [v20 identifier];
                [v14 setAssetIdentifier:v22];
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v11);
    }

    [v40 customUserAssetList];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v38 = long long v44 = 0u;
    v23 = [v38 assets];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          uint64_t v29 = [v28 assetIdentifier];
          if (v29)
          {
            v30 = (void *)v29;
            uint64_t v31 = [CPLScopedIdentifier alloc];
            v32 = [(CPLRecordChange *)self scopedIdentifier];
            id v33 = [(CPLScopedIdentifier *)v31 initRelativeToScopedIdentifier:v32 identifier:v30];

            if (v33)
            {
              char v45 = 0;
              v34 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v33 isFinal:&v45];
              v35 = v34;
              if (v34)
              {
                v36 = [v34 identifier];
                [v28 setAssetIdentifier:v36];
              }
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v25);
    }

    objc_super v8 = v40;
  }

  return v8;
}

- (id)scopedIdentifiersForMapping
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v37.receiver = self;
  v37.super_class = (Class)CPLMemoryChange;
  id v4 = [(CPLRecordChange *)&v37 scopedIdentifiersForMapping];
  objc_super v5 = (void *)[v3 initWithArray:v4];

  [(CPLMemoryChange *)self assetList];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v28 = v36 = 0u;
  id v6 = [v28 assets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v33 + 1) + 8 * i) assetIdentifier];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          v13 = [CPLScopedIdentifier alloc];
          v14 = [(CPLRecordChange *)self scopedIdentifier];
          id v15 = [(CPLScopedIdentifier *)v13 initRelativeToScopedIdentifier:v14 identifier:v12];

          if (v15)
          {
            [v5 addObject:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  [(CPLMemoryChange *)self customUserAssetList];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v27 = v32 = 0u;
  uint64_t v16 = [v27 assets];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v29 + 1) + 8 * j) assetIdentifier];
        if (v21)
        {
          v22 = (void *)v21;
          v23 = [CPLScopedIdentifier alloc];
          uint64_t v24 = [(CPLRecordChange *)self scopedIdentifier];
          id v25 = [(CPLScopedIdentifier *)v23 initRelativeToScopedIdentifier:v24 identifier:v22];

          if (v25)
          {
            [v5 addObject:v25];
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v18);
  }

  return v5;
}

@end