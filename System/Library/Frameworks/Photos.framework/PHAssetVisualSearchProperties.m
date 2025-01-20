@interface PHAssetVisualSearchProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSData)visualSearchData;
- (NSDate)adjustmentVersion;
- (PHAssetVisualSearchProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (float)stickerConfidenceScore;
- (int64_t)algorithmVersion;
- (int64_t)stickerAlgorithmVersion;
@end

@implementation PHAssetVisualSearchProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);

  objc_storeStrong((id *)&self->_visualSearchData, 0);
}

- (NSDate)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (int64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (int64_t)stickerAlgorithmVersion
{
  return self->_stickerAlgorithmVersion;
}

- (float)stickerConfidenceScore
{
  return self->_stickerConfidenceScore;
}

- (NSData)visualSearchData
{
  return self->_visualSearchData;
}

- (PHAssetVisualSearchProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PHAssetVisualSearchProperties;
  v10 = [(PHAssetVisualSearchProperties *)&v31 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
    {
      uint64_t v12 = [v8 objectForKeyedSubscript:@"mediaAnalysisAttributes.visualSearchAttributes.visualSearchData"];
      visualSearchData = v11->_visualSearchData;
      v11->_visualSearchData = (NSData *)v12;

      v14 = [v8 objectForKeyedSubscript:@"mediaAnalysisAttributes.visualSearchVersion"];
      v11->_algorithmVersion = [v14 integerValue];

      uint64_t v15 = [v8 objectForKeyedSubscript:@"mediaAnalysisAttributes.visualSearchAttributes.adjustmentVersion"];
      adjustmentVersion = v11->_adjustmentVersion;
      v11->_adjustmentVersion = (NSDate *)v15;

      v17 = [v8 objectForKeyedSubscript:@"mediaAnalysisAttributes.asset.stickerConfidenceScore"];

      if (v17)
      {
        v18 = [v8 objectForKeyedSubscript:@"mediaAnalysisAttributes.asset.stickerConfidenceScore"];
        [v18 floatValue];
        v11->_stickerConfidenceScore = v19;

        v20 = @"mediaAnalysisAttributes.visualSearchStickerConfidenceVersion";
LABEL_7:
        v29 = [v8 objectForKeyedSubscript:v20];
        v11->_stickerAlgorithmVersion = [v29 integerValue];

        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v21 = [v8 objectForKeyedSubscript:@"visualSearchAttributes.visualSearchData"];
      v22 = v11->_visualSearchData;
      v11->_visualSearchData = (NSData *)v21;

      v23 = [v8 objectForKeyedSubscript:@"visualSearchVersion"];
      v11->_algorithmVersion = [v23 integerValue];

      uint64_t v24 = [v8 objectForKeyedSubscript:@"visualSearchAttributes.adjustmentVersion"];
      v25 = v11->_adjustmentVersion;
      v11->_adjustmentVersion = (NSDate *)v24;

      v26 = [v8 objectForKeyedSubscript:@"asset.stickerConfidenceScore"];

      if (v26)
      {
        v27 = [v8 objectForKeyedSubscript:@"asset.stickerConfidenceScore"];
        [v27 floatValue];
        v11->_stickerConfidenceScore = v28;

        v20 = @"visualSearchStickerConfidenceVersion";
        goto LABEL_7;
      }
    }
    v11->_stickerConfidenceScore = *(float *)MEMORY[0x1E4F8ADF0];
    v11->_stickerAlgorithmVersion = 0;
  }
LABEL_9:

  return v11;
}

+ (id)keyPathFromPrimaryObject
{
  return @"mediaAnalysisAttributes";
}

+ (id)entityName
{
  return @"MediaAnalysisAssetAttributes";
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_62;

  return v2;
}

void __50__PHAssetVisualSearchProperties_propertiesToFetch__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = @"visualSearchAttributes.visualSearchData";
  v3[1] = @"visualSearchStickerConfidenceVersion";
  v3[2] = @"asset.stickerConfidenceScore";
  v3[3] = @"visualSearchVersion";
  v3[4] = @"visualSearchAttributes.adjustmentVersion";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_62;
  propertiesToFetch_pl_once_object_62 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetVisualSearchProperties";
}

@end