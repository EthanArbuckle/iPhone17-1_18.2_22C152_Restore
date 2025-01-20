@interface PHAssetPhotosInfoPanelLocationProperties
+ (id)keyPathFromPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSData)placeAnnotationData;
- (PHAssetPhotosInfoPanelLocationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetPhotosInfoPanelLocationProperties

- (void).cxx_destruct
{
}

- (NSData)placeAnnotationData
{
  return self->_placeAnnotationData;
}

- (PHAssetPhotosInfoPanelLocationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHAssetPhotosInfoPanelLocationProperties;
  v8 = [(PHAssetPhotosInfoPanelLocationProperties *)&v13 init];
  if (v8)
  {
    if (v5) {
      v9 = @"additionalAttributes.placeAnnotationData";
    }
    else {
      v9 = @"placeAnnotationData";
    }
    uint64_t v10 = [v7 objectForKeyedSubscript:v9];
    placeAnnotationData = v8->_placeAnnotationData;
    v8->_placeAnnotationData = (NSData *)v10;
  }
  return v8;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_46;

  return v2;
}

void __61__PHAssetPhotosInfoPanelLocationProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"placeAnnotationData";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_46;
  propertiesToFetch_pl_once_object_46 = v1;
}

+ (id)keyPathFromPrimaryObject
{
  return @"additionalAttributes";
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetPhotosInfoPanelLocation";
}

@end