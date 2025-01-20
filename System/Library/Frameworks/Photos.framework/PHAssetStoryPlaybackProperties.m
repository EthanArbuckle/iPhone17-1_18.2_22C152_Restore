@interface PHAssetStoryPlaybackProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (PHAssetStoryPlaybackProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetStoryPlaybackProperties

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return self->_hasPeopleSceneMidOrGreaterConfidence;
}

- (PHAssetStoryPlaybackProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetStoryPlaybackProperties;
  v10 = [(PHAssetStoryPlaybackProperties *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.hasPeopleSceneMidOrGreaterConfidence";
    }
    else {
      v12 = @"hasPeopleSceneMidOrGreaterConfidence";
    }
    v13 = [v8 objectForKeyedSubscript:v12];
    v11->_hasPeopleSceneMidOrGreaterConfidence = [v13 BOOLValue];
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_74;

  return v2;
}

void __51__PHAssetStoryPlaybackProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"hasPeopleSceneMidOrGreaterConfidence";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_74;
  propertiesToFetch_pl_once_object_74 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetStoryPlayback";
}

@end