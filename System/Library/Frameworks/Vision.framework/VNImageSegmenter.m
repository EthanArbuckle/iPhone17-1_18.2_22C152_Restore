@interface VNImageSegmenter
+ (BOOL)modelFullyANEResident;
+ (BOOL)supportsExecution;
+ (id)E5RTProgramLibraryForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)_observationFeatureNameToSegmenterCategoryMappingsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)createE5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)modelDropRevisionForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedFeaturesForOptions:(id)a3 error:(id *)a4;
+ (int64_t)maximumTargetPoints;
- (BOOL)_addInstanceMaskBuffersForCategory:(id)a3 instanceFeatures:(id)a4 toInstanceMaskArray:(id)a5 connectedComponentResult:(const void *)a6 featureInstanceMaskMap:(id)a7 categoryInstanceMaskMap:(id)a8 options:(id)a9 error:(id *)a10;
- (BOOL)_instanceMask:(__CVBuffer *)a3 containsTargetPoints:(id)a4;
- (BOOL)_validatePoints:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromImageBuffer:(vImage_Buffer *)a4 ofType:(int)a5 options:(id)a6 error:(id *)a7;
- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromSegmenter:(id)a4 instanceFeatures:(id)a5 category:(int)a6 options:(id)a7 error:(id *)a8;
- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromSegmenter:(id)a4 instanceFeatures:(id)a5 options:(id)a6 error:(id *)a7;
- (__CVBuffer)createAllInstancesMaskFromForegroundCC:(const void *)a3 backgroundCC:(const void *)a4 options:(id)a5 error:(id *)a6;
- (id)_observationsFromSegmenter:(id)a3 instanceFeatures:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 maskPixelFormatType:(unsigned int)a7 error:(id *)a8;
- (id)newE5RTExecutionInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 options:(id)a5 error:(id *)a6;
- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7;
- (vector<float,)_oneDimensionalArrayFromInputVNPointArray:(VNImageSegmenter *)self;
@end

@implementation VNImageSegmenter

+ (id)createE5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  v6 = objc_msgSend(a1, "E5RTProgramLibraryForConfigurationOptions:error:");
  v7 = v6;
  if (v6)
  {
    v8 = [v6 functionNamed:@"main" error:a4];
    uint64_t v9 = [v8 descriptorOfClass:objc_opt_class() forInput:@"input" error:a4];
    v24 = (void *)v9;
    if (v9)
    {
      v26[0] = v9;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      for (unint64_t i = 0; [&unk_1EF7A7EB0 count] > i; ++i)
      {
        uint64_t v12 = objc_opt_class();
        v13 = [&unk_1EF7A7EB0 objectAtIndexedSubscript:i];
        v14 = [v8 descriptorOfClass:v12 forInput:v13 error:a4];

        if (!v14)
        {
          v15 = 0;
          goto LABEL_17;
        }
        [v10 addObject:v14];
      }
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      for (unint64_t j = 0; ; ++j)
      {
        if ([&unk_1EF7A7EC8 count] <= j)
        {
          v21 = (void *)[objc_alloc(MEMORY[0x1E4FB3F10]) initWithMajor:1];
          v15 = (void *)[objc_alloc(MEMORY[0x1E4FB3E78]) initWithFunction:v8 inputDescriptors:v10 inputImageDescriptors:v23 outputDescriptors:v16 confidencesOutputDescriptors:0 networkVersion:v21];

          goto LABEL_16;
        }
        uint64_t v18 = objc_opt_class();
        v19 = [&unk_1EF7A7EC8 objectAtIndexedSubscript:j];
        v20 = [v8 descriptorOfClass:v18 forOutput:v19 error:a4];

        if (!v20) {
          break;
        }
        [v16 addObject:v20];
      }
      v15 = 0;
LABEL_16:

LABEL_17:
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)E5RTProgramLibraryForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 modelURLForConfigurationOptions:v6 error:a4];
  v8 = [a1 modelDropRevisionForConfigurationOptions:v6 error:0];
  [v8 floatValue];
  double v24 = v9;
  VNValidatedLog(1, @"segmentation model : %@ MD%f", v10, v11, v12, v13, v14, v15, (uint64_t)v7);

  if (!v7) {
    goto LABEL_13;
  }
  if ([MEMORY[0x1E4FB3E88] isProgramLibraryAtURL:v7])
  {
    id v16 = [MEMORY[0x1E4FB3E88] programLibraryForURL:v7 error:a4];
    goto LABEL_18;
  }
  if ([MEMORY[0x1E4FB3E80] isModelSourceURL:v7])
  {
    v17 = [MEMORY[0x1E4FB3E80] modelSourceFromURL:v7 error:a4];
    if (v17)
    {
      uint64_t v18 = [a1 E5RTProgramLibraryCompilationOptionsForModelSource:v17 configurationOptions:v6 error:a4];
      v19 = VNANEArchitectureName();
      v20 = VNANEGenerationNumberForArchitectureName((uint64_t)v19, (uint64_t)a4);

      if (!v20) {
        goto LABEL_14;
      }
      if ((unint64_t)[v20 integerValue] <= 0xD) {
        [v18 setCustomCompilationOptions:@"MemCacheStrategy=None"];
      }
      if (v18)
      {
        id v16 = [MEMORY[0x1E4FB3E88] compileModelSource:v17 options:v18 error:a4];
      }
      else
      {
LABEL_14:
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
    goto LABEL_17;
  }
  if (!a4)
  {
LABEL_13:
    id v16 = 0;
    goto LABEL_18;
  }
  id v21 = [NSString alloc];
  v22 = [v7 path];
  v17 = (void *)[v21 initWithFormat:@"Could not open program library for %@", v22, *(void *)&v24];

  +[VNError errorForInvalidArgumentWithLocalizedDescription:v17];
  id v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:

  return v16;
}

+ (id)modelDropRevisionForConfigurationOptions:(id)a3 error:(id *)a4
{
  v5 = objc_alloc_init(VNModelCatalogBridgingInterface);
  id v6 = [(VNModelCatalogBridgingInterface *)v5 foregroundBackgroundSegmentationModelBundleURLWithError:a4];
  v7 = v6;
  if (!v6)
  {
    id v20 = 0;
    goto LABEL_23;
  }
  v8 = [v6 URLByAppendingPathComponent:@"metadata.json"];

  float v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = [v8 path];
  char v11 = [v9 fileExistsAtPath:v10];

  if ((v11 & 1) == 0)
  {
    if (a4)
    {
      +[VNError errorForMissingOptionNamed:@"metadata.json missing in .mlmodelc bundle "];
      id v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = 0;
    }
    goto LABEL_22;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v13 = [v8 path];
  uint64_t v14 = [v12 dataWithContentsOfFile:v13 options:1 error:a4];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v14 options:1 error:a4];
    if (!v15) {
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = [v15 firstObject];
      v17 = [v16 objectForKeyedSubscript:@"foregroundbackgroundsegmenter"];
      uint64_t v18 = [v17 objectForKeyedSubscript:@"version"];

      if (v18)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
        [v19 setNumberStyle:1];
        id v20 = [v19 numberFromString:v18];
      }
      else if (a4)
      {
        +[VNError errorForMissingOptionNamed:@"version missing"];
        id v20 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v20 = 0;
      }

      goto LABEL_20;
    }
    if (a4)
    {
      +[VNError errorForInvalidFormatErrorWithLocalizedDescription:@"metadata.json is not formatted correctly"];
      id v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_15:
      id v20 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  id v20 = 0;
LABEL_21:

LABEL_22:
LABEL_23:

  return v20;
}

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  v5 = objc_alloc_init(VNModelCatalogBridgingInterface);
  id v6 = [(VNModelCatalogBridgingInterface *)v5 foregroundBackgroundSegmentationModelBundleURLWithError:a4];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 URLByAppendingPathComponent:@"foregroundbackgroundsegmenter.mlmodelc"];
    float v9 = [v8 URLByAppendingPathComponent:@"model.specialization.bundle"];
  }
  else
  {
    float v9 = 0;
  }

  return v9;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities computeDevicesOfTypes:](VNComputeDeviceUtilities, "computeDevicesOfTypes:", 4, a4);
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)supportedFeaturesForOptions:(id)a3 error:(id *)a4
{
  id v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", a3);
  if (v6)
  {
    v7 = [a1 _observationFeatureNameToSegmenterCategoryMappingsForOriginatingRequestSpecifier:v6 error:a4];
    v8 = v7;
    if (v7)
    {
      float v9 = [v7 allKeys];
    }
    else
    {
      float v9 = 0;
    }
  }
  else
  {
    float v9 = 0;
  }

  return v9;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VNImageSegmenter_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNImageSegmenter configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNImageSegmenter configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNImageSegmenter configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __57__VNImageSegmenter_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNImageSegmenter;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNImageSegmenter configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNImageSegmenter configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)_observationFeatureNameToSegmenterCategoryMappingsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 specifiesRequestClass:objc_opt_class()]
    && [v5 requestRevision] == 1)
  {
    v8[0] = @"VNImageSegmentationFeatureForeground";
    v8[1] = @"VNImageSegmentationFeatureBackground";
    v9[0] = &unk_1EF7A7748;
    v9[1] = &unk_1EF7A7760;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:v5];
    id v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)modelFullyANEResident
{
  v2 = VNANEArchitectureName();
  uint64_t v3 = VNANEGenerationNumberForArchitectureName((uint64_t)v2, 0);

  if (v3) {
    BOOL v4 = [v3 integerValue] != 13;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsExecution
{
  return VNANEComputeDeviceSupportsExecution(13);
}

+ (int64_t)maximumTargetPoints
{
  return 512;
}

- (void).cxx_destruct
{
}

- (vector<float,)_oneDimensionalArrayFromInputVNPointArray:(VNImageSegmenter *)self
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v19 = -1082130432;
  std::vector<float>::vector(retstr, 0x400uLL, &v19);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        if (v8 < (unint64_t)(retstr->__end_ - retstr->__begin_))
        {
          char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "x", (void)v15);
          *(float *)&double v12 = v12;
          retstr->__begin_[2 * v8] = *(float *)&v12;
          [v11 y];
          *(float *)&double v13 = v13;
          *(float *)((char *)retstr->__begin_ + ((8 * v8++) | 4)) = 1.0 - *(float *)&v13;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }

  return result;
}

- (BOOL)_validatePoints:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)[v5 count] < 0x201)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          char v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v11 x];
          CGFloat v13 = v12;
          [v11 y];
          v27.y = v14;
          v28.origin.x = 0.0;
          v28.origin.y = 0.0;
          v28.size.width = 1.0;
          v28.size.height = 1.0;
          v27.x = v13;
          if (!CGRectContainsPoint(v28, v27))
          {
            if (a4)
            {
              long long v15 = NSString;
              [v11 x];
              uint64_t v17 = v16;
              [v11 y];
              int v19 = objc_msgSend(v15, "stringWithFormat:", @" pointOfInterest value is out of bounds: %f,%f", v17, v18, (void)v21);
              *a4 = +[VNError errorWithCode:4 message:v19];

              LOBYTE(a4) = 0;
            }
            goto LABEL_15;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    LOBYTE(a4) = 1;
LABEL_15:
  }
  else if (a4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"target points array contains more than maximum allowed quantity of %lu", 512);
    *a4 = +[VNError errorWithCode:4 message:v6];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  int v19 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  id v20 = v19;
  if (v19)
  {
    unint64_t v21 = [v19 width];
    unint64_t v22 = [v20 height];
    long long v23 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v20, "width"));
    [v17 setObject:v23 forKey:@"inputSizeWidth"];

    long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v20, "height"));
    [v17 setObject:v24 forKey:@"inputSizeHeight"];

    id v25 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
    [v25 inputSize];
    double v28 = v26;
    double v29 = v27;
    double v30 = width;
    double v31 = width * (double)v21;
    double v32 = height;
    double v33 = height * (double)v22;
    if (v26 >= v27) {
      double v26 = v27;
    }
    if (v31 >= v33) {
      double v34 = v33;
    }
    else {
      double v34 = v31;
    }
    if (v34 < v26)
    {
      if (v30 >= v32) {
        double v35 = v32;
      }
      else {
        double v35 = v30;
      }
      if (v35 <= 0.0) {
        double v35 = 1.0;
      }
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)(v26 / v35));
    }
    [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
    double v47 = 0.0;
    double v48 = 0.0;
    long long v46 = *MEMORY[0x1E4F1DAD8];
    id v45 = 0;
    v36 = (__CVBuffer *)objc_msgSend(v20, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", (unint64_t)v28, (unint64_t)v29, 1111970369, 1, v17, a8, x * (double)v21, y * (double)v22, v31, v33, &v46, &v48, &v47, &v45);
    id v37 = v45;
    *a7 = v36;
    v38 = [NSNumber numberWithDouble:*(double *)&v46];
    [v17 setObject:v38 forKey:@"normOrigOffsetX"];

    v39 = [NSNumber numberWithDouble:*((double *)&v46 + 1)];
    [v17 setObject:v39 forKey:@"normOrigOffsetY"];

    v40 = [NSNumber numberWithDouble:v48];
    [v17 setObject:v40 forKey:@"scaleX"];

    v41 = [NSNumber numberWithDouble:v47];
    [v17 setObject:v41 forKey:@"scaleY"];

    v42 = *a7;
    BOOL v43 = *a7 != 0;
    if (v42) {
      [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v17 cacheKey:v37 imageBuffer:v20];
    }
  }
  else
  {
    BOOL v43 = 0;
  }

  return v43;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v49 = 0;
  LOBYTE(a6) = +[VNValidationUtilities getOptionalArray:&v49 forKey:@"targetPts" inOptions:v15 withElementsOfClass:objc_opt_class() error:a7];
  id v16 = v49;
  id v17 = v16;
  if (a6)
  {
    id v45 = v13;
    id v46 = v12;
    id v47 = v14;
    int v18 = [v16 count];
    v44 = v17;
    [(VNImageSegmenter *)self _oneDimensionalArrayFromInputVNPointArray:v17];
    if (v18 < 1)
    {
      BOOL v23 = 0;
    }
    else
    {
      LODWORD(v20) = *__p;
      LODWORD(v21) = __p[1];
      LODWORD(v19) = -1.0;
      if (*(float *)__p == -1.0 && *(float *)&v21 == -1.0)
      {
        uint64_t v25 = 0;
        double v26 = __p + 3;
        while (v18 - 1 != v25)
        {
          LODWORD(v20) = *(v26 - 1);
          LODWORD(v21) = *v26;
          v26 += 2;
          ++v25;
          if (*(float *)&v20 != -1.0 || *(float *)&v21 != -1.0) {
            goto LABEL_18;
          }
        }
        uint64_t v25 = v18;
LABEL_18:
        BOOL v23 = v25 < v18;
      }
      else
      {
        BOOL v23 = 1;
      }
    }
    BOOL v43 = objc_msgSend(v15, "objectForKeyedSubscript:", @"minMask", v19, v20, v21);
    BOOL v41 = v23;
    self->_minimumMaskPixelCount = [v43 unsignedIntegerValue];
    double v28 = [[VNFgBgE5MLOutputs alloc] initWithOutputs:v12 descriptor:v13];
    fgbgInstanceSegmenter = self->_fgbgInstanceSegmenter;
    v42 = [(VNFgBgE5MLOutputs *)v28 segments];
    uint64_t v30 = [(VNFgBgE5MLOutputs *)v28 predictionMiyoshiConfidence];
    double v31 = [(VNFgBgE5MLOutputs *)v28 predictionCocoConfidence];
    double v32 = [(VNFgBgE5MLOutputs *)v28 predictionIoU];
    double v33 = [(VNFgBgE5MLOutputs *)v28 stabilityScore];
    double v34 = [(VNFgBgE5MLOutputs *)v28 decodeMatch];
    LOBYTE(v40) = v41;
    LOBYTE(v39) = 0;
    double v35 = fgbgInstanceSegmenter;
    v36 = (void *)v30;
    id v37 = [(VNFgBgE5MLInstanceSegmenter *)v35 composeInstanceFeatures:v42 miyoshiConfidence:v30 cocoConfidence:v31 predictionIoU:v32 stabilityScore:v33 decodeMatch:v34 isRotated:v39 minimumMaskPixelCount:self->_minimumMaskPixelCount useInteractive:v40];

    if (v37)
    {
      long long v24 = [(VNImageSegmenter *)self _observationsFromSegmenter:self->_fgbgInstanceSegmenter instanceFeatures:v37 originatingRequestSpecifier:v47 options:v15 maskPixelFormatType:0 error:a7];
    }
    else
    {
      long long v24 = 0;
    }

    id v13 = v45;
    id v12 = v46;
    if (__p) {
      operator delete(__p);
    }
    id v14 = v47;
    id v17 = v44;
  }
  else
  {
    long long v24 = 0;
  }

  return v24;
}

- (id)newE5RTExecutionInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 options:(id)a5 error:(id *)a6
{
  id v40 = a3;
  id v9 = a5;
  id v42 = 0;
  BOOL v10 = +[VNValidationUtilities getOptionalArray:&v42 forKey:@"targetPts" inOptions:v9 withElementsOfClass:objc_opt_class() error:a6];
  id v11 = v42;
  id v12 = v11;
  if (v10
    && (![v11 count]
     || [(VNImageSegmenter *)self _validatePoints:v12 error:a6]))
  {
    if ([v12 count])
    {
      [(VNImageSegmenter *)self _oneDimensionalArrayFromInputVNPointArray:v12];
      double v35 = [VNFgBgE5MLInputTensors alloc];
      id v37 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
      uint64_t v13 = [v37 queryNumber];
      id v14 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
      uint64_t v15 = [v14 maxSpatialLength];
      id v16 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
      [v16 inputSize];
      double v18 = v17;
      double v20 = v19;
      double v21 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
      unint64_t v22 = -[VNFgBgE5MLInputTensors initWithTargetPointList:queryNumber:maxSpatialLength:inputSize:radius:error:](v35, "initWithTargetPointList:queryNumber:maxSpatialLength:inputSize:radius:error:", __p, v13, v15, [v21 radius], a6, v18, v20);

      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    else
    {
      v36 = [VNFgBgE5MLInputTensors alloc];
      v38 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
      uint64_t v24 = [v38 queryNumber];
      uint64_t v25 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
      uint64_t v26 = [v25 maxSpatialLength];
      double v27 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
      [v27 inputSize];
      double v29 = v28;
      double v31 = v30;
      double v32 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter configuration];
      unint64_t v22 = -[VNFgBgE5MLInputTensors initWithTargetPoint:queryNumber:maxSpatialLength:inputSize:radius:error:](v36, "initWithTargetPoint:queryNumber:maxSpatialLength:inputSize:radius:error:", v24, v26, [v32 radius], a6, -1.0, -1.0, v29, v31);
    }
    double v33 = [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter process];
    BOOL v23 = (void *)[v33 newInputsForFunctionDescriptor:v40 inputSurfaces:v22 croppedPixelBuffer:a4 error:a6];
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)VNImageSegmenter;
  if (!-[VNE5RTBasedDetector completeInitializationForSession:error:](&v16, sel_completeInitializationForSession_error_, a3))return 0; {
  id v6 = [(VNDetector *)self configurationOptions];
  }
  id v7 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 error:a4];

  +[VNFgBgE5MLInstanceSegmenter instanceSegmenterWithRevision:error:](VNFgBgE5MLInstanceSegmenter, "instanceSegmenterWithRevision:error:", [v7 requestRevision], a4);
  uint64_t v8 = (VNFgBgE5MLInstanceSegmenter *)objc_claimAutoreleasedReturnValue();
  fgbgInstanceSegmenter = self->_fgbgInstanceSegmenter;
  self->_fgbgInstanceSegmenter = v8;

  BOOL v10 = self->_fgbgInstanceSegmenter;
  BOOL v11 = v10 != 0;
  if (v10)
  {
    id v12 = [(VNFgBgE5MLInstanceSegmenter *)v10 configuration];
    uint64_t v13 = [v12 thresholds];
    [v13 defaultValidMinimumMaskPixelCount];
    self->_minimumMaskPixelCount = (unint64_t)v14;
  }
  return v11;
}

- (BOOL)_instanceMask:(__CVBuffer *)a3 containsTargetPoints:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obunint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v7)
  {
    char v8 = 0;
    goto LABEL_20;
  }
  char v8 = 0;
  uint64_t v9 = *(void *)v27;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(obj);
      }
      BOOL v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      [v11 x];
      [v11 y];
      CVPixelBufferGetWidth(a3);
      CVPixelBufferGetHeight(a3);
      VisionCoreImagePointForNormalizedPoint();
      double v13 = v12;
      double v15 = v14;
      size_t v16 = CVPixelBufferGetHeight(a3);
      uint64_t v17 = (int)v13;
      if ((v17 & 0x80000000) != 0
        || (size_t v18 = (int)((double)v16 - v15), (v18 & 0x80000000) != 0)
        || (Width > v17 ? (BOOL v19 = Height > v18) : (BOOL v19 = 0), !v19))
      {

        goto LABEL_18;
      }
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      BOOL v21 = *((float *)CVPixelBufferGetBaseAddress(a3) + (int)((BytesPerRow >> 2) * v18) + v17) != 0.0;
      v8 |= v21;
      int v22 = 2 * v21;
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      if (v22)
      {

        if (v22 == 2) {
          goto LABEL_22;
        }
LABEL_18:
        char v8 = 0;
        goto LABEL_22;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_20:

LABEL_22:
  return v8 & 1;
}

- (id)_observationsFromSegmenter:(id)a3 instanceFeatures:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 maskPixelFormatType:(unsigned int)a7 error:(id *)a8
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v50 = a4;
  id v46 = a5;
  id v12 = a6;
  id v48 = objc_alloc_init(MEMORY[0x1E4F29128]);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v13 = [v12 objectForKeyedSubscript:@"disableCCRefinement"];
  char v14 = [v13 BOOLValue];

  char v67 = 0;
  if (+[VNValidationUtilities getBOOLValue:&v67 forKey:@"fillMaskGaps" inOptions:v12 withDefaultValue:0 error:a8])
  {
    id v66 = 0;
    BOOL v15 = +[VNValidationUtilities getOptionalArray:&v66 forKey:@"targetPts" inOptions:v12 withElementsOfClass:objc_opt_class() error:a8];
    id v16 = v66;
    v44 = v16;
    if (!v15) {
      goto LABEL_28;
    }
    uint64_t v45 = [v16 count];
    if ((v14 & 1) == 0)
    {
      int v65 = 0;
      *(_OWORD *)v63 = 0u;
      long long v64 = 0u;
      fgbgInstanceSegmenter = self->_fgbgInstanceSegmenter;
      uint64_t v37 = [&unk_1EF7A7748 intValue];
      if (fgbgInstanceSegmenter)
      {
        [(VNFgBgE5MLInstanceSegmenter *)fgbgInstanceSegmenter generateMaskFromInstanceFeatures:v50 toCategory:v37 drawBox:0 maskImageType:&v65];
      }
      else
      {
        *(_OWORD *)v63 = 0u;
        long long v64 = 0u;
      }
      *(_OWORD *)v61 = 0u;
      long long v62 = 0u;
      v38 = self->_fgbgInstanceSegmenter;
      uint64_t v39 = [&unk_1EF7A7760 intValue];
      if (v38)
      {
        [(VNFgBgE5MLInstanceSegmenter *)v38 generateMaskFromInstanceFeatures:v50 toCategory:v39 drawBox:0 maskImageType:&v65];
      }
      else
      {
        *(_OWORD *)v61 = 0u;
        long long v62 = 0u;
      }
      apple::vision::fgbg::ConnectedComponentResult::ConnectedComponentResult((apple::vision::fgbg::ConnectedComponentResult *)&v60, 0, 0, 0, 0, 0);
    }
    texture = [(VNImageSegmenter *)self _createPixelBufferOfFormat:1278226534 fromSegmenter:v52 instanceFeatures:v50 options:v12 error:a8];
    if (texture)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v17 = (VNInstanceMaskObservation *)v50;
      obunint64_t j = v17;
      uint64_t v18 = [(VNInstanceMaskObservation *)v17 countByEnumeratingWithState:&v56 objects:v69 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v57;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v57 != v19) {
              objc_enumerationMutation(obj);
            }
            BOOL v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            int v22 = [v21 miyoshiCategoryName];
            int v23 = [v22 isEqualToString:@"Foreground Object"];

            if (v23) {
              [v55 addObject:@"VNImageSegmentationFeatureForeground"];
            }
            uint64_t v24 = [v21 miyoshiCategoryName];
            int v25 = [v24 isEqualToString:@"Background Object"];

            if (v25) {
              [v55 addObject:@"VNImageSegmentationFeatureBackground"];
            }
            long long v26 = [v21 miyoshiCategoryName];
            int v27 = [v26 isEqualToString:@"Scene Background"];
            if (v45) {
              int v28 = v27;
            }
            else {
              int v28 = 0;
            }

            if (v28) {
              [v55 addObject:@"VNImageSegmentationFeatureBackground"];
            }
            id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            double v30 = [v21 cocoCategoryName];
            int v31 = [v30 isEqualToString:@"shadow"];

            if (v31) {
              [v29 addObject:@"VNImageSegmentationCategoryShadow"];
            }
            double v32 = [v21 cocoCategoryName];
            int v33 = [v32 isEqualToString:@"texture-other"];

            if (v33) {
              [v29 addObject:@"VNImageSegmentationCategoryStrand"];
            }
            [v53 addObject:v29];
            v68 = v21;
            double v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
            double v35 = -[VNImageSegmenter _createPixelBufferOfFormat:fromSegmenter:instanceFeatures:category:options:error:](self, "_createPixelBufferOfFormat:fromSegmenter:instanceFeatures:category:options:error:", 1278226534, v52, v34, [v21 miyoshiCategory], v12, a8);

            if (!v35)
            {

              id v41 = 0;
              id v40 = obj;
              goto LABEL_37;
            }
            [v54 addObject:v35];
          }
          uint64_t v17 = obj;
          uint64_t v18 = [(VNInstanceMaskObservation *)obj countByEnumeratingWithState:&v56 objects:v69 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      id v40 = -[VNInstanceMaskObservation initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceFeatureKeyIndexMap:instanceCategoryKeyIndexMap:instanceMask:numComponents:regionOfInterest:]([VNInstanceMaskObservation alloc], "initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceFeatureKeyIndexMap:instanceCategoryKeyIndexMap:instanceMask:numComponents:regionOfInterest:", v46, v54, v55, v53, texture, [v54 count] + 1, 0.0, 0.0, 1.0, 1.0);
      [(VNObservation *)v40 setUUID:v48];
      [v47 addObject:v40];
      id v41 = v47;
LABEL_37:
    }
    else
    {
LABEL_28:
      texture = 0;
      id v41 = 0;
    }

    CVPixelBufferRelease(texture);
  }
  else
  {
    id v41 = 0;
    CVPixelBufferRelease(0);
  }

  return v41;
}

- (BOOL)_addInstanceMaskBuffersForCategory:(id)a3 instanceFeatures:(id)a4 toInstanceMaskArray:(id)a5 connectedComponentResult:(const void *)a6 featureInstanceMaskMap:(id)a7 categoryInstanceMaskMap:(id)a8 options:(id)a9 error:(id *)a10
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v61 = a4;
  id v64 = a5;
  id v65 = a7;
  id v62 = a8;
  id v69 = a9;
  v63 = v14;
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v14 isEqualToString:@"VNImageSegmentationFeatureForeground"])
  {
    BOOL v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_30670];
    uint64_t v16 = [v61 filteredArrayUsingPredicate:v15];
  }
  else if ([v14 isEqualToString:@"VNImageSegmentationFeatureBackground"])
  {
    BOOL v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_106_30671];
    uint64_t v16 = [v61 filteredArrayUsingPredicate:v15];
  }
  else
  {
    if (![v14 isEqualToString:@"VNImageSegmentationFeatureScene"]) {
      goto LABEL_8;
    }
    BOOL v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_108_30672];
    uint64_t v16 = [v61 filteredArrayUsingPredicate:v15];
  }
  uint64_t v17 = (void *)v16;

  id v67 = v17;
LABEL_8:
  uint64_t v18 = (double **)*((void *)a6 + 10);
  id v66 = (double **)*((void *)a6 + 11);
  if (v18 == v66)
  {
LABEL_49:
    BOOL v58 = 1;
  }
  else
  {
    while (1)
    {
      v74 = v18;
      double v19 = **v18;
      double v20 = (*v18)[1];
      uint64_t v21 = (int)v19;
      unint64_t v22 = (int)v20;
      if ((v21 & 0x80000000) != 0 || (unint64_t v23 = *((void *)a6 + 13), v23 <= v21) || (v22 & 0x80000000) != 0)
      {
        uint64_t v24 = a6;
        if (a10)
        {
LABEL_50:
          long long v59 = (void *)[[NSString alloc] initWithFormat:@"Point (%i, %i) is out of the mask image bounds of %lu x %lu", v21, v22, *((void *)a6 + 13), *((void *)a6 + 14)];
          *a10 = +[VNError errorWithCode:14 message:v59];

          goto LABEL_52;
        }
        unint64_t v23 = *((void *)a6 + 13);
      }
      else if (a10)
      {
        uint64_t v24 = a6;
        if (*((void *)a6 + 14) <= v22) {
          goto LABEL_50;
        }
      }
      else
      {
        uint64_t v24 = a6;
      }
      uint64_t v25 = *(void *)(*v24 + 8 * (unint64_t)(v19 + v20 * (double)v23));
      *(_OWORD *)v81 = 0u;
      long long v82 = 0u;
      fgbgInstanceSegmenter = self->_fgbgInstanceSegmenter;
      if (fgbgInstanceSegmenter) {
        -[VNFgBgE5MLInstanceSegmenter generateMaskForLabel:fromConnectedComponents:error:](fgbgInstanceSegmenter, "generateMaskForLabel:fromConnectedComponents:error:", v25);
      }
      v80[0] = *(_OWORD *)v81;
      v80[1] = v82;
      int v27 = [(VNImageSegmenter *)self _createPixelBufferOfFormat:1278226534 fromImageBuffer:v80 ofType:1 options:v69 error:a10];
      free(v81[0]);
      v81[0] = 0;
      if (!v27) {
        goto LABEL_52;
      }
      id v79 = 0;
      BOOL v28 = +[VNValidationUtilities getOptionalArray:&v79 forKey:@"targetPts" inOptions:v69 withElementsOfClass:objc_opt_class() error:a10];
      id v29 = v79;
      v71 = v29;
      if (!v28) {
        break;
      }
      if (![v29 count]
        || [(VNImageSegmenter *)self _instanceMask:v27 containsTargetPoints:v71])
      {
        [v64 addObject:v27];

        [v65 addObject:v63];
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        obunint64_t j = v67;
        uint64_t v31 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
        if (!v31) {
          goto LABEL_44;
        }
        uint64_t v73 = *(void *)v76;
        while (1)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v76 != v73) {
              objc_enumerationMutation(obj);
            }
            int v33 = *(void **)(*((void *)&v75 + 1) + 8 * i);
            [v33 bbox];
            double v35 = v34;
            double v37 = v36;
            double v39 = v38;
            double v41 = v40;
            [v33 mapSize];
            double v43 = v42;
            [v33 mapSize];
            id v46 = (CGPoint *)*v74;
            uint64_t v45 = (CGPoint *)v74[1];
            if (*v74 == (double *)v45) {
              continue;
            }
            double v47 = (double)(unint64_t)v44;
            double v48 = v41 * v47;
            double v49 = v37 * v47;
            double v50 = (double)(unint64_t)v43;
            double v51 = v39 * v50;
            double v52 = v35 * v50;
            while (1)
            {
              v85.origin.double x = v52;
              v85.origin.double y = v49;
              v85.size.double width = v51;
              v85.size.double height = v48;
              if (CGRectContainsPoint(v85, *v46))
              {
                id v53 = [v33 cocoCategoryName];
                if ([v53 isEqualToString:@"shadow"])
                {
                  char v54 = [v30 containsObject:@"VNImageSegmentationCategoryShadow"];

                  if ((v54 & 1) == 0)
                  {
                    long long v57 = @"VNImageSegmentationCategoryShadow";
                    goto LABEL_41;
                  }
                }
                else
                {
                }
                id v55 = [v33 cocoCategoryName];
                if (![v55 isEqualToString:@"texture-other"])
                {

                  goto LABEL_39;
                }
                char v56 = [v30 containsObject:@"VNImageSegmentationCategoryStrand"];

                if ((v56 & 1) == 0) {
                  break;
                }
              }
LABEL_39:
              if (++v46 == v45) {
                goto LABEL_42;
              }
            }
            long long v57 = @"VNImageSegmentationCategoryStrand";
LABEL_41:
            [v30 addObject:v57];
LABEL_42:
            ;
          }
          uint64_t v31 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
          if (!v31)
          {
LABEL_44:

            [v62 addObject:v30];
            goto LABEL_46;
          }
        }
      }
      CVPixelBufferRelease(v27);
LABEL_46:

      uint64_t v18 = v74 + 3;
      if (v74 + 3 == v66) {
        goto LABEL_49;
      }
    }
    CVPixelBufferRelease(v27);

LABEL_52:
    BOOL v58 = 0;
  }

  return v58;
}

uint64_t __178__VNImageSegmenter__addInstanceMaskBuffersForCategory_instanceFeatures_toInstanceMaskArray_connectedComponentResult_featureInstanceMaskMap_categoryInstanceMaskMap_options_error___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 miyoshiCategoryName];
  uint64_t v3 = [v2 isEqualToString:@"Scene Background"];

  return v3;
}

uint64_t __178__VNImageSegmenter__addInstanceMaskBuffersForCategory_instanceFeatures_toInstanceMaskArray_connectedComponentResult_featureInstanceMaskMap_categoryInstanceMaskMap_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 miyoshiCategoryName];
  uint64_t v3 = [v2 isEqualToString:@"Background Object"];

  return v3;
}

uint64_t __178__VNImageSegmenter__addInstanceMaskBuffersForCategory_instanceFeatures_toInstanceMaskArray_connectedComponentResult_featureInstanceMaskMap_categoryInstanceMaskMap_options_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 miyoshiCategoryName];
  uint64_t v3 = [v2 isEqualToString:@"Foreground Object"];

  return v3;
}

- (__CVBuffer)createAllInstancesMaskFromForegroundCC:(const void *)a3 backgroundCC:(const void *)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v11 = *((void *)a3 + 13);
  v19[1] = *((void **)a3 + 14);
  *(void *)&long long v20 = v11;
  *((void *)&v20 + 1) = v11;
  v19[0] = malloc_type_calloc((uint64_t)v19[1] * v11, 1uLL, 0x100004077774924uLL);
  uint64_t v12 = *((void *)a3 + 10);
  for (uint64_t i = *((void *)a3 + 11); v12 != i; v12 += 24)
    [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter modifyMask:v19 forLabel:*(void *)(*(void *)a3+ 8* (unint64_t)(**(double **)v12+ *(double *)(*(void *)v12 + 8) * (double)*((unint64_t *)a3 + 13))) fromConnectedComponents:a3 error:a6];
  uint64_t v14 = *((void *)a4 + 10);
  for (uint64_t j = *((void *)a4 + 11); v14 != j; v14 += 24)
    [(VNFgBgE5MLInstanceSegmenter *)self->_fgbgInstanceSegmenter modifyMask:v19 forLabel:*(void *)(*(void *)a4+ 8* (unint64_t)(**(double **)v14+ *(double *)(*(void *)v14 + 8) * (double)*((unint64_t *)a4 + 13))) fromConnectedComponents:a4 error:a6];
  v18[0] = *(_OWORD *)v19;
  v18[1] = v20;
  uint64_t v16 = [(VNImageSegmenter *)self _createPixelBufferOfFormat:1278226534 fromImageBuffer:v18 ofType:1 options:v10 error:a6];
  free(v19[0]);

  return v16;
}

- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromSegmenter:(id)a4 instanceFeatures:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  unsigned int v20 = 0;
  *(_OWORD *)uint64_t v18 = 0u;
  long long v19 = 0u;
  if (v12 && ([v12 generateMaskForInstanceFeatures:v13 maskImageType:&v20], v18[0]))
  {
    v17[0] = *(_OWORD *)v18;
    v17[1] = v19;
    a7 = [(VNImageSegmenter *)self _createPixelBufferOfFormat:v10 fromImageBuffer:v17 ofType:v20 options:v14 error:a7];
    free(v18[0]);
  }
  else if (a7)
  {
    BOOL v15 = (void *)[[NSString alloc] initWithFormat:@"could not create mask for all features"];
    *a7 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:v15];

    a7 = 0;
  }

  return (__CVBuffer *)a7;
}

- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromSegmenter:(id)a4 instanceFeatures:(id)a5 category:(int)a6 options:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  unsigned int v22 = 0;
  *(_OWORD *)unsigned int v20 = 0u;
  long long v21 = 0u;
  if (v14
    && ([v14 generateMaskFromInstanceFeatures:v15 toCategory:v10 drawBox:0 maskImageType:&v22],
        v20[0]))
  {
    v19[0] = *(_OWORD *)v20;
    v19[1] = v21;
    a8 = [(VNImageSegmenter *)self _createPixelBufferOfFormat:v12 fromImageBuffer:v19 ofType:v22 options:v16 error:a8];
    free(v20[0]);
  }
  else if (a8)
  {
    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"could not create mask for feature category %d", v10);
    *a8 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:v17];

    a8 = 0;
  }

  return (__CVBuffer *)a8;
}

- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromImageBuffer:(vImage_Buffer *)a4 ofType:(int)a5 options:(id)a6 error:(id *)a7
{
  __int16 v8 = a5;
  id v11 = a6;
  unsigned int v35 = 0;
  DeepCopyCVPixelBufferFromVImageBuffer = ImageProcessing_createDeepCopyCVPixelBufferFromVImageBuffer((char **)a4, v8, (int *)&v35);
  if (DeepCopyCVPixelBufferFromVImageBuffer)
  {
    id v13 = DeepCopyCVPixelBufferFromVImageBuffer;
    if (CVPixelBufferGetPixelFormatType(DeepCopyCVPixelBufferFromVImageBuffer) == a3)
    {
      id v14 = CVPixelBufferRetain(v13);
    }
    else
    {
      id v15 = [[VNImageBuffer alloc] initWithCVPixelBuffer:v13 orientation:1 options:0];
      id v16 = [v11 objectForKey:@"scaleX"];
      [v16 doubleValue];
      double v18 = v17;

      long long v19 = [v11 objectForKey:@"scaleY"];
      [v19 doubleValue];
      double v21 = v20;

      unsigned int v22 = [v11 objectForKey:@"normOrigOffsetX"];
      [v22 doubleValue];
      double v24 = v23;

      uint64_t v25 = [v11 objectForKey:@"normOrigOffsetY"];
      [v25 doubleValue];
      double v27 = v26;

      BOOL v28 = [v11 objectForKey:@"inputSizeWidth"];
      [v28 doubleValue];
      double v30 = v29;

      uint64_t v31 = [v11 objectForKey:@"inputSizeHeight"];
      [v31 doubleValue];
      double v33 = v32;

      id v14 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:](v15, "croppedBufferWithWidth:height:format:cropRect:options:error:", (double)(unint64_t)(v24 * (double)[(VNImageBuffer *)v15 width]), (double)(unint64_t)(v27 * (double)[(VNImageBuffer *)v15 height]), (double)(unint64_t)(v18 * v30), (double)(unint64_t)(v21 * v33));
    }
    CVPixelBufferRelease(v13);
  }
  else if (a7)
  {
    +[VNError errorForOSStatus:v35 localizedDescription:@"could not create image pixel buffer"];
    id v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end