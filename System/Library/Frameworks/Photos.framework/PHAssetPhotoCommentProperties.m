@interface PHAssetPhotoCommentProperties
+ (BOOL)createsPropertySetObjectWithCustomImplementation;
+ (BOOL)isToMany;
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)cloudHasCommentsByMe;
- (BOOL)cloudIsMyAsset;
- (BOOL)hasUserLiked;
- (PHAssetPhotoCommentProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (unint64_t)commentCount;
- (unint64_t)likeCount;
@end

@implementation PHAssetPhotoCommentProperties

- (BOOL)cloudHasCommentsByMe
{
  return self->_cloudHasCommentsByMe;
}

- (BOOL)cloudIsMyAsset
{
  return self->_cloudIsMyAsset;
}

- (BOOL)hasUserLiked
{
  return self->_hasUserLiked;
}

- (unint64_t)likeCount
{
  return self->_likeCount;
}

- (unint64_t)commentCount
{
  return self->_commentCount;
}

- (PHAssetPhotoCommentProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PHAssetPhotoCommentProperties;
  v9 = [(PHAssetPhotoCommentProperties *)&v31 init];
  v10 = v9;
  if (v9)
  {
    v23 = v9;
    id v24 = v8;
    objc_storeWeak((id *)&v9->super._asset, v8);
    id v25 = v7;
    [v7 objectForKey:@"comments"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v13 = 0;
      unint64_t v14 = 0;
      unint64_t v15 = 0;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "objectForKeyedSubscript:", @"isLike", v23);
          int v20 = [v19 BOOLValue];

          if (v20)
          {
            ++v14;
            if (v13)
            {
              char v13 = 1;
            }
            else
            {
              v21 = [v18 objectForKeyedSubscript:@"isMyComment"];
              char v13 = [v21 BOOLValue];
            }
          }
          else
          {
            ++v15;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }
    else
    {
      char v13 = 0;
      unint64_t v14 = 0;
      unint64_t v15 = 0;
    }
    v23->_commentCount = v15;
    v10 = v23;
    v23->_likeCount = v14;
    v23->_hasUserLiked = v13 & 1;

    id v8 = v24;
    id v7 = v25;
  }

  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_50;

  return v2;
}

void __50__PHAssetPhotoCommentProperties_propertiesToFetch__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"commentDate";
  v3[1] = @"isLike";
  v3[2] = @"isMyComment";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_50;
  propertiesToFetch_pl_once_object_50 = v1;
}

+ (BOOL)createsPropertySetObjectWithCustomImplementation
{
  return 1;
}

+ (BOOL)isToMany
{
  return 1;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return @"CloudSharedComment";
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetComments";
}

@end