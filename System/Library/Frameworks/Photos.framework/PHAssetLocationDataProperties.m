@interface PHAssetLocationDataProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (CLLocationCoordinate2D)coordinate;
- (PHAssetLocationDataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetLocationDataProperties

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (PHAssetLocationDataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PHAssetLocationDataProperties;
  v9 = [(PHAssetLocationDataProperties *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = [v7 objectForKeyedSubscript:@"locationData"];
    if (v11
      && ([v7 objectForKeyedSubscript:@"dateCreated"],
          v12 = objc_claimAutoreleasedReturnValue(),
          v13 = (void *)[MEMORY[0x1E4F8A950] newLocationFromLocationData:v11 timestampIfMissing:v12],
          v12,
          v13))
    {
      [v13 coordinate];
      v10->_coordinate.double latitude = v14;
      v10->_coordinate.double longitude = v15;
    }
    else
    {
      v10->_coordinate = (CLLocationCoordinate2D)*MEMORY[0x1E4F1E750];
    }
  }
  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_75;

  return v2;
}

void __50__PHAssetLocationDataProperties_propertiesToFetch__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"locationData";
  v3[1] = @"dateCreated";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_75;
  propertiesToFetch_pl_once_object_75 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetLocationData";
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
  return 0;
}

@end