@interface PHAssetSceneAnalysisProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSData)distanceIdentity;
- (NSDate)privateEncryptedComputeAnalysisTimestamp;
- (NSDate)sceneAnalysisTimestamp;
- (PHAssetSceneAnalysisProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (signed)privateEncryptedComputeAnalysisVersion;
- (signed)privateEncryptedComputeLocationAnalysisVersion;
- (signed)sceneAnalysisVersion;
@end

@implementation PHAssetSceneAnalysisProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEncryptedComputeAnalysisTimestamp, 0);
  objc_storeStrong((id *)&self->_distanceIdentity, 0);

  objc_storeStrong((id *)&self->_sceneAnalysisTimestamp, 0);
}

- (signed)privateEncryptedComputeLocationAnalysisVersion
{
  return self->_privateEncryptedComputeLocationAnalysisVersion;
}

- (NSDate)privateEncryptedComputeAnalysisTimestamp
{
  return self->_privateEncryptedComputeAnalysisTimestamp;
}

- (signed)privateEncryptedComputeAnalysisVersion
{
  return self->_privateEncryptedComputeAnalysisVersion;
}

- (NSData)distanceIdentity
{
  return self->_distanceIdentity;
}

- (NSDate)sceneAnalysisTimestamp
{
  return self->_sceneAnalysisTimestamp;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (PHAssetSceneAnalysisProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PHAssetSceneAnalysisProperties;
  v9 = [(PHAssetSceneAnalysisProperties *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = [v7 objectForKeyedSubscript:@"additionalAttributes.sceneAnalysisVersion"];
    v10->_sceneAnalysisVersion = [v11 shortValue];

    uint64_t v12 = [v7 objectForKeyedSubscript:@"additionalAttributes.sceneAnalysisTimestamp"];
    sceneAnalysisTimestamp = v10->_sceneAnalysisTimestamp;
    v10->_sceneAnalysisTimestamp = (NSDate *)v12;

    uint64_t v14 = [v7 objectForKeyedSubscript:@"additionalAttributes.distanceIdentity"];
    distanceIdentity = v10->_distanceIdentity;
    v10->_distanceIdentity = (NSData *)v14;

    v16 = [v7 objectForKeyedSubscript:@"mediaAnalysisAttributes.vaAnalysisVersion"];
    v10->_privateEncryptedComputeAnalysisVersion = [v16 shortValue];

    uint64_t v17 = [v7 objectForKeyedSubscript:@"mediaAnalysisAttributes.vaAnalysisTimestamp"];
    privateEncryptedComputeAnalysisTimestamp = v10->_privateEncryptedComputeAnalysisTimestamp;
    v10->_privateEncryptedComputeAnalysisTimestamp = (NSDate *)v17;

    v19 = [v7 objectForKeyedSubscript:@"mediaAnalysisAttributes.vaLocationAnalysisVersion"];
    v10->_privateEncryptedComputeLocationAnalysisVersion = [v19 shortValue];
  }
  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_51;

  return v2;
}

void __51__PHAssetSceneAnalysisProperties_propertiesToFetch__block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v3[0] = @"additionalAttributes.sceneAnalysisVersion";
  v3[1] = @"additionalAttributes.sceneAnalysisTimestamp";
  v3[2] = @"additionalAttributes.distanceIdentity";
  v3[3] = @"mediaAnalysisAttributes.imageEmbeddingVersion";
  v3[4] = @"mediaAnalysisAttributes.vaAnalysisVersion";
  v3[5] = @"mediaAnalysisAttributes.vaAnalysisTimestamp";
  v3[6] = @"mediaAnalysisAttributes.vaLocationAnalysisVersion";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_51;
  propertiesToFetch_pl_once_object_51 = v1;
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
  return @"PHAssetPropertySetSceneAnalysis";
}

@end