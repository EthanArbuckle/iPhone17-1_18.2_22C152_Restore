@interface VNE5RTSegmentationMultiGenerator
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (NSDictionary)requestKeyToRequestInfo;
+ (id)outputConfidenceBlobNames;
+ (id)requestInfoForRequest:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedOutputPixelFormatsForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)imageCropAndScaleOption:(unint64_t *)a3 fromOptions:(id)a4 error:(id *)a5;
- (BOOL)needsMetalContext;
- (__CVBuffer)renderCIImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unsigned int)a6 vnciContextManager:(id)a7 error:(id *)a8;
@end

@implementation VNE5RTSegmentationMultiGenerator

- (BOOL)imageCropAndScaleOption:(unint64_t *)a3 fromOptions:(id)a4 error:(id *)a5
{
  id v7 = a4;
  +[VNError VNAssert:a3 != 0 log:@"cropAndScaleOptionPointer cannot be NULL"];
  char v11 = 0;
  BOOL v8 = +[VNValidationUtilities getBOOLValue:&v11 forKey:@"VNSegmentationGeneratorProcessOption_ImageRotated" inOptions:v7 error:a5];
  if (v8)
  {
    unint64_t v9 = 258;
    if (!v11) {
      unint64_t v9 = 2;
    }
    *a3 = v9;
  }

  return v8;
}

- (__CVBuffer)renderCIImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unsigned int)a6 vnciContextManager:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a3;
  id v15 = a7;
  v16 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a8];
  if (v16)
  {
    v17 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4, a5, v10, a8);
    if (v17)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __95__VNE5RTSegmentationMultiGenerator_renderCIImage_width_height_format_vnciContextManager_error___block_invoke;
      v20[3] = &unk_1E5B1E4B8;
      id v21 = v14;
      v22 = v17;
      v18 = _Block_copy(v20);
      if ((-[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v15, v18, v16, a8) & 1) == 0)
      {
        CVPixelBufferRelease(v17);
        v17 = 0;
      }
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __95__VNE5RTSegmentationMultiGenerator_renderCIImage_width_height_format_vnciContextManager_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v3 = *(void **)(a2 + 8);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  [v4 render:*(void *)(a1 + 32) toCVPixelBuffer:*(void *)(a1 + 40)];

  return 1;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  id v19 = a9;
  v20 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  id v21 = v20;
  if (v20)
  {
    unint64_t v22 = [v20 width];
    unint64_t v23 = [v21 height];
    v24 = [(VNE5RTBasedDetector *)self functionDescriptor];
    v25 = [v24 onlyInputImage];

    unint64_t v26 = [v25 pixelWidth];
    double v27 = (double)v26 / (double)(unint64_t)[v25 pixelHeight];
    double v28 = width * (double)v22 / (height * (double)v23);
    if (v27 >= 1.0 || v28 < 1.0) {
      BOOL v31 = v28 < 1.0 && v27 >= 1.0;
    }
    else {
      BOOL v31 = 1;
    }
    v32 = [NSNumber numberWithBool:v31];
    [v17 setObject:v32 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_ImageRotated"];

    v36.receiver = self;
    v36.super_class = (Class)VNE5RTSegmentationMultiGenerator;
    BOOL v30 = -[VNE5RTBasedDetector createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:](&v36, sel_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler_, v17, a5, v18, a7, a8, v19, x, y, width, height);
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)needsMetalContext
{
  return 0;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"VNComputeStageMain";
  id v4 = +[VNComputeDeviceUtilities allComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (NSDictionary)requestKeyToRequestInfo
{
  if (+[VNE5RTSegmentationMultiGenerator requestKeyToRequestInfo]::onceToken != -1) {
    dispatch_once(&+[VNE5RTSegmentationMultiGenerator requestKeyToRequestInfo]::onceToken, &__block_literal_global_52);
  }
  v2 = (void *)+[VNE5RTSegmentationMultiGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo;

  return (NSDictionary *)v2;
}

void __59__VNE5RTSegmentationMultiGenerator_requestKeyToRequestInfo__block_invoke()
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v17[0] = v1;
  v2 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_PersonSegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:0];
  v18[0] = v2;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v17[1] = v4;
  v5 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:1];
  v18[1] = v5;
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v17[2] = v7;
  BOOL v8 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:2];
  v18[2] = v8;
  unint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  v17[3] = v10;
  char v11 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:3];
  v18[3] = v11;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v17[4] = v13;
  id v14 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_AnimalSegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:4];
  v18[4] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v16 = (void *)+[VNE5RTSegmentationMultiGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo;
  +[VNE5RTSegmentationMultiGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo = v15;
}

+ (id)requestInfoForRequest:(id)a3
{
  id v4 = a3;
  v5 = [a1 requestKeyToRequestInfo];
  v6 = +[VNMultiDetectorOriginalRequestInfo requestKeyFromRequest:v4];
  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

+ (id)supportedOutputPixelFormatsForOptions:(id)a3 error:(id *)a4
{
  if (+[VNE5RTSegmentationMultiGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken != -1) {
    dispatch_once(&+[VNE5RTSegmentationMultiGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken, &__block_literal_global_23992);
  }
  id v4 = (void *)+[VNE5RTSegmentationMultiGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;

  return v4;
}

void __80__VNE5RTSegmentationMultiGenerator_supportedOutputPixelFormatsForOptions_error___block_invoke()
{
  v0 = (void *)+[VNE5RTSegmentationMultiGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;
  +[VNE5RTSegmentationMultiGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats = (uint64_t)&unk_1EF7A7E50;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  id v7 = v6;
  if (!v6) {
    goto LABEL_53;
  }
  uint64_t v8 = [v6 requestRevision];
  if (![v7 specifiesRequestClass:objc_opt_class()])
  {
    if ([v7 specifiesRequestClass:objc_opt_class()])
    {
      uint64_t v16 = -1;
      if (!+[VNValidationUtilities getNSUIntegerValue:&v16 forKey:@"VNSegmentationGeneratorProcessOption_QualityLevel" inOptions:v5 error:a4])goto LABEL_53; {
      if (v16 != 2)
      }
      {
        if (v16 != 1)
        {
          if (!v16)
          {
            char v15 = 0;
            if (+[VNValidationUtilities getBOOLValue:&v15 forKey:@"VNSegmentationGeneratorProcessOption_UseTiling" inOptions:v5 error:a4])
            {
              unint64_t v9 = (objc_class *)objc_opt_class();
              goto LABEL_71;
            }
            goto LABEL_53;
          }
          if (!a4) {
            goto LABEL_70;
          }
LABEL_69:
          v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          *a4 = +[VNError errorForInvalidOption:v13 named:@"qualityLevel"];

          goto LABEL_70;
        }
        if (v8 != 3737841665)
        {
          if (v8 == 3737841664)
          {
            unint64_t v9 = +[VNGenerateSemanticSegmentationCompoundRequest detectorForPersonInstanceRequestAndReturnError:a4];
LABEL_22:
            if (v9) {
              goto LABEL_71;
            }
            goto LABEL_53;
          }
          if (v8 == 1)
          {
            unint64_t v9 = +[VNGenerateSemanticSegmentationCompoundRequest detectorForSemanticSegmentationRequestAndReturnError:a4];
            goto LABEL_22;
          }
          if (!a4) {
            goto LABEL_70;
          }
LABEL_79:
          uint64_t v10 = +[VNError errorForUnsupportedRevision:v8 ofRequestClass:objc_opt_class()];
          goto LABEL_26;
        }
      }
    }
    else if ([v7 specifiesRequestClass:objc_opt_class()])
    {
      uint64_t v16 = -1;
      if (!+[VNValidationUtilities getNSUIntegerValue:&v16 forKey:@"VNSegmentationGeneratorProcessOption_QualityLevel" inOptions:v5 error:a4])goto LABEL_53; {
      if (v16 != 1)
      }
      {
        if (!a4) {
          goto LABEL_70;
        }
        goto LABEL_69;
      }
      if (v8 != 1 && v8 != 3737841664)
      {
        if (!a4) {
          goto LABEL_70;
        }
        goto LABEL_79;
      }
    }
    else if ([v7 specifiesRequestClass:objc_opt_class()])
    {
      uint64_t v16 = -1;
      if (!+[VNValidationUtilities getNSUIntegerValue:&v16 forKey:@"VNSegmentationGeneratorProcessOption_QualityLevel" inOptions:v5 error:a4])goto LABEL_53; {
      if (v16 != 1)
      }
      {
        if (!a4) {
          goto LABEL_70;
        }
        goto LABEL_69;
      }
      if (v8 != 1 && v8 != 3737841664)
      {
        if (!a4) {
          goto LABEL_70;
        }
        goto LABEL_79;
      }
    }
    else if ([v7 specifiesRequestClass:objc_opt_class()])
    {
      uint64_t v16 = -1;
      if (!+[VNValidationUtilities getNSUIntegerValue:&v16 forKey:@"VNSegmentationGeneratorProcessOption_QualityLevel" inOptions:v5 error:a4])goto LABEL_53; {
      if (v16 != 1)
      }
      {
        if (!a4) {
          goto LABEL_70;
        }
        goto LABEL_69;
      }
      if (v8 != 1 && v8 != 3737841664)
      {
        if (!a4) {
          goto LABEL_70;
        }
        goto LABEL_79;
      }
    }
    else
    {
      if (![v7 specifiesRequestClass:objc_opt_class()]) {
        goto LABEL_70;
      }
      uint64_t v16 = -1;
      if (!+[VNValidationUtilities getNSUIntegerValue:&v16 forKey:@"VNSegmentationGeneratorProcessOption_QualityLevel" inOptions:v5 error:a4])
      {
LABEL_53:
        v12 = 0;
        goto LABEL_72;
      }
      if (v16 != 1)
      {
        if (!a4) {
          goto LABEL_70;
        }
        goto LABEL_69;
      }
      if (v8 != 1)
      {
        if (!a4) {
          goto LABEL_70;
        }
        goto LABEL_79;
      }
    }
    unint64_t v9 = (objc_class *)objc_opt_class();
    goto LABEL_71;
  }
  if (v8 == 1)
  {
    unint64_t v9 = +[VNGenerateSemanticSegmentationCompoundRequest detectorForSemanticSegmentationRequestAndReturnError:a4];
    goto LABEL_22;
  }
  if (v8 == 2)
  {
    unint64_t v9 = +[VNGenerateSemanticSegmentationCompoundRequest detectorForPersonInstanceRequestAndReturnError:a4];
    goto LABEL_22;
  }
  if (v8 != 3)
  {
    if (a4)
    {
      uint64_t v10 = +[VNError errorForUnsupportedRevision:v8 ofRequestClass:objc_opt_class()];
LABEL_26:
      id v11 = v10;
      unint64_t v9 = 0;
      *a4 = v11;
      goto LABEL_71;
    }
LABEL_70:
    unint64_t v9 = 0;
    goto LABEL_71;
  }
  unint64_t v9 = (objc_class *)objc_opt_class();
LABEL_71:
  v12 = v9;
LABEL_72:

  return v12;
}

+ (id)outputConfidenceBlobNames
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end