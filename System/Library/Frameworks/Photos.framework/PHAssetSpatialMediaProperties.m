@interface PHAssetSpatialMediaProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (PHAssetSpatialMediaProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (signed)spatialMediaType;
@end

@implementation PHAssetSpatialMediaProperties

- (PHAssetSpatialMediaProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHAssetSpatialMediaProperties;
  v9 = [(PHAssetSpatialMediaProperties *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = [v7 objectForKeyedSubscript:@"spatialType"];
    v10->_spatialMediaType = [v11 shortValue];
  }
  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_73;

  return v2;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

void __50__PHAssetSpatialMediaProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"spatialType";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_73;
  propertiesToFetch_pl_once_object_73 = v1;
}

- (signed)spatialMediaType
{
  return self->_spatialMediaType;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return 0;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetSpatialMedia";
}

@end