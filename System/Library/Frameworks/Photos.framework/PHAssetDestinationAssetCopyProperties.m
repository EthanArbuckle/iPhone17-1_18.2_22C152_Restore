@interface PHAssetDestinationAssetCopyProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (PHAssetDestinationAssetCopyProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (int64_t)destinationAssetCopyState;
@end

@implementation PHAssetDestinationAssetCopyProperties

- (int64_t)destinationAssetCopyState
{
  return self->_destinationAssetCopyState;
}

- (PHAssetDestinationAssetCopyProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PHAssetDestinationAssetCopyProperties;
  v10 = [(PHAssetDestinationAssetCopyProperties *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.destinationAssetCopyState";
    }
    else {
      v12 = @"destinationAssetCopyState";
    }
    v13 = [v8 objectForKeyedSubscript:v12];
    __int16 v14 = [v13 integerValue];

    uint64_t v15 = (v14 + 1);
    if (v15 <= 3) {
      v11->_destinationAssetCopyState = v15 - 1;
    }
  }

  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_65;

  return v2;
}

void __58__PHAssetDestinationAssetCopyProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"destinationAssetCopyState";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_65;
  propertiesToFetch_pl_once_object_65 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetDestinationAssetCopy";
}

@end