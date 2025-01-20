@interface PHAssetCloudSharedProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)cloudHasCommentsByMe;
- (BOOL)cloudIsMyAsset;
- (PHAssetCloudSharedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetCloudSharedProperties

- (BOOL)cloudHasCommentsByMe
{
  return self->_cloudHasCommentsByMe;
}

- (BOOL)cloudIsMyAsset
{
  return self->_cloudIsMyAsset;
}

- (PHAssetCloudSharedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetCloudSharedProperties;
  v9 = [(PHAssetCloudSharedProperties *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = [v7 objectForKeyedSubscript:@"cloudIsMyAsset"];
    v10->_cloudIsMyAsset = [v11 BOOLValue];

    v12 = [v7 objectForKeyedSubscript:@"cloudHasCommentsByMe"];
    v10->_cloudHasCommentsByMe = [v12 BOOLValue];
  }
  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_49;

  return v2;
}

void __49__PHAssetCloudSharedProperties_propertiesToFetch__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"cloudIsMyAsset";
  v3[1] = @"cloudHasCommentsByMe";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_49;
  propertiesToFetch_pl_once_object_49 = v1;
}

+ (id)entityName
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetCloudShared";
}

@end