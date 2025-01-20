@interface PHAssetIconicScoreProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (PHAssetIconicScoreProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (double)iconicScore;
@end

@implementation PHAssetIconicScoreProperties

- (double)iconicScore
{
  return self->_iconicScore;
}

- (PHAssetIconicScoreProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetIconicScoreProperties;
  v9 = [(PHAssetIconicScoreProperties *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = [v7 objectForKeyedSubscript:@"iconicScore"];
    [v11 doubleValue];
    v10->_iconicScore = v12;
  }
  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_77;

  return v2;
}

void __49__PHAssetIconicScoreProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"iconicScore";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_77;
  propertiesToFetch_pl_once_object_77 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetIconicScore";
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