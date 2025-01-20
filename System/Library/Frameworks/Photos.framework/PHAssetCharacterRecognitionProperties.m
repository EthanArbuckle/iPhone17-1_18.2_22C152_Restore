@interface PHAssetCharacterRecognitionProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSData)characterRecognitionData;
- (NSData)machineReadableCodeData;
- (NSDate)adjustmentVersion;
- (PHAssetCharacterRecognitionProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (int64_t)algorithmVersion;
@end

@implementation PHAssetCharacterRecognitionProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_machineReadableCodeData, 0);

  objc_storeStrong((id *)&self->_characterRecognitionData, 0);
}

- (NSDate)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (int64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (NSData)machineReadableCodeData
{
  return self->_machineReadableCodeData;
}

- (NSData)characterRecognitionData
{
  return self->_characterRecognitionData;
}

- (PHAssetCharacterRecognitionProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PHAssetCharacterRecognitionProperties;
  v10 = [(PHAssetCharacterRecognitionProperties *)&v26 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
    {
      uint64_t v12 = [v8 objectForKeyedSubscript:@"mediaAnalysisAttributes.characterRecognitionAttributes.characterRecognitionData"];
      characterRecognitionData = v11->_characterRecognitionData;
      v11->_characterRecognitionData = (NSData *)v12;

      uint64_t v14 = [v8 objectForKeyedSubscript:@"mediaAnalysisAttributes.characterRecognitionAttributes.machineReadableCodeData"];
      machineReadableCodeData = v11->_machineReadableCodeData;
      v11->_machineReadableCodeData = (NSData *)v14;

      v16 = [v8 objectForKeyedSubscript:@"mediaAnalysisAttributes.characterRecognitionVersion"];
      v11->_algorithmVersion = [v16 integerValue];

      v17 = @"mediaAnalysisAttributes.characterRecognitionAttributes.adjustmentVersion";
    }
    else
    {
      uint64_t v18 = [v8 objectForKeyedSubscript:@"characterRecognitionAttributes.characterRecognitionData"];
      v19 = v11->_characterRecognitionData;
      v11->_characterRecognitionData = (NSData *)v18;

      uint64_t v20 = [v8 objectForKeyedSubscript:@"characterRecognitionAttributes.machineReadableCodeData"];
      v21 = v11->_machineReadableCodeData;
      v11->_machineReadableCodeData = (NSData *)v20;

      v22 = [v8 objectForKeyedSubscript:@"characterRecognitionVersion"];
      v11->_algorithmVersion = [v22 integerValue];

      v17 = @"characterRecognitionAttributes.adjustmentVersion";
    }
    uint64_t v23 = [v8 objectForKeyedSubscript:v17];
    adjustmentVersion = v11->_adjustmentVersion;
    v11->_adjustmentVersion = (NSDate *)v23;
  }
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
  v2 = (void *)propertiesToFetch_pl_once_object_61;

  return v2;
}

void __58__PHAssetCharacterRecognitionProperties_propertiesToFetch__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v3[0] = @"characterRecognitionAttributes.characterRecognitionData";
  v3[1] = @"characterRecognitionAttributes.machineReadableCodeData";
  v3[2] = @"characterRecognitionVersion";
  v3[3] = @"characterRecognitionAttributes.adjustmentVersion";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_61;
  propertiesToFetch_pl_once_object_61 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetCharacterRecognitionProperties";
}

@end