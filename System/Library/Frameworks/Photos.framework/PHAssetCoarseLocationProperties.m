@interface PHAssetCoarseLocationProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (PHAssetCoarseLocationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (double)gpsHorizontalAccuracy;
@end

@implementation PHAssetCoarseLocationProperties

- (double)gpsHorizontalAccuracy
{
  return self->_gpsHorizontalAccuracy;
}

- (PHAssetCoarseLocationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetCoarseLocationProperties;
  v10 = [(PHAssetCoarseLocationProperties *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.gpsHorizontalAccuracy";
    }
    else {
      v12 = @"gpsHorizontalAccuracy";
    }
    v13 = [v8 objectForKeyedSubscript:v12];
    [v13 doubleValue];
    v11->_gpsHorizontalAccuracy = v14;
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_66;

  return v2;
}

void __52__PHAssetCoarseLocationProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"gpsHorizontalAccuracy";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_66;
  propertiesToFetch_pl_once_object_66 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetCoarseLocation";
}

@end