@interface PHAssetSceneprintProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSData)duplicateMatchingAlternateData;
- (NSData)duplicateMatchingData;
- (NSData)sceneprint;
- (NSString)duplicateMatchingAlternateValue;
- (NSString)duplicateMatchingValue;
- (PHAssetSceneprintProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetSceneprintProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateMatchingAlternateData, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingData, 0);

  objc_storeStrong((id *)&self->_sceneprint, 0);
}

- (NSData)duplicateMatchingAlternateData
{
  return self->_duplicateMatchingAlternateData;
}

- (NSData)duplicateMatchingData
{
  return self->_duplicateMatchingData;
}

- (NSData)sceneprint
{
  return self->_sceneprint;
}

- (NSString)duplicateMatchingAlternateValue
{
  id v3 = [NSString alloc];
  v4 = [(PHAssetSceneprintProperties *)self duplicateMatchingAlternateData];
  v5 = (void *)[v3 initWithData:v4 encoding:4];

  return (NSString *)v5;
}

- (NSString)duplicateMatchingValue
{
  id v3 = [NSString alloc];
  v4 = [(PHAssetSceneprintProperties *)self duplicateMatchingData];
  v5 = (void *)[v3 initWithData:v4 encoding:4];

  return (NSString *)v5;
}

- (PHAssetSceneprintProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PHAssetSceneprintProperties;
  v10 = [(PHAssetSceneprintProperties *)&v24 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
    {
      uint64_t v12 = [v8 objectForKeyedSubscript:@"additionalAttributes.sceneprint.data"];
      sceneprint = v11->_sceneprint;
      v11->_sceneprint = (NSData *)v12;

      uint64_t v14 = [v8 objectForKeyedSubscript:@"additionalAttributes.sceneprint.duplicateMatchingData"];
      duplicateMatchingData = v11->_duplicateMatchingData;
      v11->_duplicateMatchingData = (NSData *)v14;

      v16 = @"additionalAttributes.sceneprint.duplicateMatchingAlternateData";
    }
    else
    {
      uint64_t v17 = [v8 objectForKeyedSubscript:@"sceneprint.data"];
      v18 = v11->_sceneprint;
      v11->_sceneprint = (NSData *)v17;

      uint64_t v19 = [v8 objectForKeyedSubscript:@"sceneprint.duplicateMatchingData"];
      v20 = v11->_duplicateMatchingData;
      v11->_duplicateMatchingData = (NSData *)v19;

      v16 = @"sceneprint.duplicateMatchingAlternateData";
    }
    uint64_t v21 = [v8 objectForKeyedSubscript:v16];
    duplicateMatchingAlternateData = v11->_duplicateMatchingAlternateData;
    v11->_duplicateMatchingAlternateData = (NSData *)v21;
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_64;

  return v2;
}

void __48__PHAssetSceneprintProperties_propertiesToFetch__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"sceneprint.data";
  v3[1] = @"sceneprint.duplicateMatchingData";
  v3[2] = @"sceneprint.duplicateMatchingAlternateData";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_64;
  propertiesToFetch_pl_once_object_64 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetSceneprint";
}

@end