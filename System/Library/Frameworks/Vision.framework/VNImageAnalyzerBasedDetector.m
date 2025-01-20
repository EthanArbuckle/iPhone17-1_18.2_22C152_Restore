@interface VNImageAnalyzerBasedDetector
+ (BOOL)providesSceneLabelsForConfiguration:(id)a3;
+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3;
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)inputImageBlobNameForConfiguration:(id)a3;
+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4;
+ (id)sceneLabelsFilePathForConfiguration:(id)a3 error:(id *)a4;
+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (CGSize)inputImageSize;
- (id).cxx_construct;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7;
- (id)observationsForSceneLabelsFromLastAnalysisOfImageAnalyzer:(void *)a3 identifierAcceptingBlock:(id)a4 operationPointsProvider:(id)a5 originatingRequestSpecifier:(id)a6 qosClass:(unsigned int)a7 error:(id *)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)supportedClassificationIdentifiersAcceptedByBlock:(id)a3 error:(id *)a4;
- (uint64_t)_validateProvidesSceneLabelsAndReturnError:(uint64_t)result;
- (unint64_t)defaultImageCropAndScaleOption;
- (unsigned)analysisTypesForProcessOptions:(id)a3;
@end

@implementation VNImageAnalyzerBasedDetector

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VNImageAnalyzerBasedDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __69__VNImageAnalyzerBasedDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNImageAnalyzerBasedDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorInitOption_ModelBackingStore"];
  [v2 removeObject:@"VNDetectorOption_OriginatingRequestSpecifier"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 error:a4];
  if (!v7)
  {
    v13 = 0;
    goto LABEL_13;
  }
  v8 = [a1 modelPathForConfiguration:v6 error:a4];
  if (v8)
  {
    v9 = [a1 inputImageBlobNameForConfiguration:v6];
    if (v9)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      if (+[VNEspressoHelpers getWidth:&v16 height:&v15 ofBlobNamed:v9 forNetworkModelFileWithPath:v8 error:a4])
      {
        uint64_t v10 = [a1 analysisPixelFormatTypeForConfiguration:v6];
        v11 = [VNSupportedImageSize alloc];
        v12 = [(VNSupportedImageSize *)v11 initWithIdealFormat:v10 width:v16 height:v15 orientation:1 aspectRatioHandling:0 orientationAgnostic:0];
        v17[0] = v12;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

LABEL_11:
        goto LABEL_12;
      }
    }
    else if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:v7];
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v13 = 0;
    goto LABEL_11;
  }
  v13 = 0;
LABEL_12:

LABEL_13:

  return v13;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities espressoV1ModelComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3
{
  return 0;
}

+ (id)sceneLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

+ (BOOL)providesSceneLabelsForConfiguration:(id)a3
{
  return 0;
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  return 1111970369;
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  return 0;
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSupportedClassificationIdentifiers, 0);
  cntrl = self->_imageAnalyzer.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13 = a5;
  unsigned int v14 = [(VNImageAnalyzerBasedDetector *)self analysisTypesForProcessOptions:v13];
  if (!self)
  {
LABEL_21:
    id v19 = 0;
    goto LABEL_16;
  }
  int v15 = v14;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType <= 1094862673)
  {
    if (PixelFormatType != 8 && PixelFormatType != 32)
    {
LABEL_19:
      if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"the image processing type is unknown"];
        id v19 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      goto LABEL_21;
    }
  }
  else if (PixelFormatType != 1094862674 && PixelFormatType != 1111970369 && PixelFormatType != 1380401729)
  {
    goto LABEL_19;
  }
  vision::mod::ImageAnalyzer::analyzeUsingCVPixelBuffer((vision::mod::ImageAnalyzer *)self->_imageAnalyzer.__ptr_, v15, a4);
  v17 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v13 error:a8];
  if (v17)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__867;
    v30 = __Block_byref_object_dispose__868;
    id v31 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __130__VNImageAnalyzerBasedDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    aBlock[3] = &unk_1E5B1C020;
    v24 = &v26;
    aBlock[4] = self;
    id v22 = v13;
    id v23 = v17;
    unsigned int v25 = a6;
    v18 = _Block_copy(aBlock);
    if (VNExecuteBlock(v18, (uint64_t)a8)) {
      id v19 = (id)v27[5];
    }
    else {
      id v19 = 0;
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    id v19 = 0;
  }

LABEL_16:

  return v19;
}

BOOL __130__VNImageAnalyzerBasedDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) observationsForLastAnalysisOfImageAnalyzer:*(void *)(*(void *)(a1 + 32) + 56) processOptions:*(void *)(a1 + 40) originatingRequestSpecifier:*(void *)(a1 + 48) qosClass:*(unsigned int *)(a1 + 64) error:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  id v19 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  v20 = v19;
  if (v19)
  {
    unint64_t v21 = [v19 width];
    unint64_t v22 = [v20 height];
    uint64_t v42 = 0;
    id v23 = v17;
    if (self
      && +[VNValidationUtilities getNSUIntegerValue:&v42 forKey:@"VNDetectorProcessOption_ImageCropAndScaleOption" inOptions:v23 withDefaultValue:[(VNImageAnalyzerBasedDetector *)self defaultImageCropAndScaleOption] error:a8])
    {
      double v24 = (double)v21;
      double v25 = (double)v22;
      double v26 = width * (double)v21;
      double v27 = height * (double)v22;
      if (!self->_networkUsesAnisotropicScaling && v42 == 2) {
        uint64_t v42 = 0;
      }

      float v28 = self->_networkRequiredInputImageSize.width;
      if (v28 >= self->_networkRequiredInputImageSize.height) {
        float v28 = self->_networkRequiredInputImageSize.height;
      }
      if (v26 >= v27) {
        double v29 = height * (double)v22;
      }
      else {
        double v29 = width * (double)v21;
      }
      float v30 = v29;
      if (v28 > v30)
      {
        if (width >= height) {
          double v31 = height;
        }
        else {
          double v31 = width;
        }
        if (v31 > 0.0) {
          float v28 = v28 / v31;
        }
        VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)v28);
      }
      v32 = objc_opt_class();
      v33 = [(VNDetector *)self configurationOptions];
      uint64_t v34 = [v32 analysisPixelFormatTypeForConfiguration:v33];

      [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
      unint64_t v35 = (unint64_t)self->_networkRequiredInputImageSize.width;
      unint64_t v36 = (unint64_t)self->_networkRequiredInputImageSize.height;
      id v41 = 0;
      v37 = (__CVBuffer *)objc_msgSend(v20, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", v35, v36, v34, v42, v23, a8, x * v24, y * v25, v26, v27, 0, 0, 0, &v41);
      id v38 = v41;
      *a7 = v37;
      BOOL v39 = v37 != 0;
      if (v37)
      {
        [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v23 cacheKey:v38 imageBuffer:v20];
        BOOL v39 = 1;
      }
      id v23 = v38;
    }
    else
    {
      BOOL v39 = 0;
    }
  }
  else
  {
    BOOL v39 = 0;
  }

  return v39;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v15 = *(void *)&a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  if ([(VNImageAnalyzerBasedDetector *)self analysisTypesForProcessOptions:v17])
  {
    v22.receiver = self;
    v22.super_class = (Class)VNImageAnalyzerBasedDetector;
    v20 = -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v22, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v19, x, y, width, height);
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v20;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNImageAnalyzerBasedDetector;
  unsigned __int8 v7 = [(VNDetector *)&v19 completeInitializationForSession:v6 error:a4];
  if (self) {
    unsigned __int8 v8 = v7;
  }
  else {
    unsigned __int8 v8 = 0;
  }
  if (v8)
  {
    v9 = [(VNDetector *)self configurationOptions];
    uint64_t v10 = objc_opt_class();
    v11 = [v10 modelPathForConfiguration:v9 error:a4];
    if (!v11) {
      goto LABEL_18;
    }
    if ([v10 providesSceneLabelsForConfiguration:v9])
    {
      v12 = [v10 sceneLabelsFilePathForConfiguration:v9 error:a4];
      if (!v12) {
        goto LABEL_18;
      }
    }
    else
    {
      v12 = 0;
    }
    if ([v10 providesSegmentationLabelsForConfiguration:v9])
    {
      id v13 = [v10 segmentationLabelsFilePathForConfiguration:v9 error:a4];
      if (!v13)
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
    }
    else
    {
      id v13 = 0;
    }
    vision::mod::ImageAnalyzer_Options::ImageAnalyzer_Options((vision::mod::ImageAnalyzer_Options *)&__str);
    if ([(VNImageAnalyzerBasedDetector *)self configureImageAnalyzerOptions:&__str error:a4])
    {
      id v21 = (id)8576;
      unsigned int v14 = (char *)[v11 UTF8String];
      uint64_t v15 = (const char *)[v12 UTF8String];
      uint64_t v16 = (const char *)[v13 UTF8String];
      vision::mod::ImageAnalyzer::createImageAnalyzer((vision::mod::ImageAnalyzer *)&v20, (uint64_t *)&v21, v14, v15, 0, v16, 0, 0, &__str, v18, (const vision::mod::ImageAnalyzer_Options *)v19.receiver);
    }
    vision::mod::ImageAnalyzer_Options::~ImageAnalyzer_Options((vision::mod::ImageAnalyzer_Options *)&__str);

    goto LABEL_17;
  }
LABEL_19:

  return 0;
}

- (id)observationsForSceneLabelsFromLastAnalysisOfImageAnalyzer:(void *)a3 identifierAcceptingBlock:(id)a4 operationPointsProvider:(id)a5 originatingRequestSpecifier:(id)a6 qosClass:(unsigned int)a7 error:(id *)a8
{
  id v13 = a4;
  id v14 = a5;
  id v37 = a6;
  if ((-[VNImageAnalyzerBasedDetector _validateProvidesSceneLabelsAndReturnError:]((uint64_t)self, a8) & 1) == 0)
  {
    id v17 = 0;
    goto LABEL_31;
  }
  *(_OWORD *)id v41 = 0u;
  *(_OWORD *)uint64_t v42 = 0u;
  int v43 = 1065353216;
  vision::mod::ImageAnalyzer::getSceneLabelsConfidences((vision::mod::ImageAnalyzer *)__p, 0.0, (uint64_t)a3);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__move_assign((uint64_t)v41, (uint64_t *)__p);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)__p[2]);
  uint64_t v15 = __p[0];
  __p[0] = 0;
  if (v15) {
    operator delete(v15);
  }
  if (!v14)
  {
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  uint64_t v16 = [v14 operationPointsAndReturnError:a8];
  if (v16)
  {
LABEL_9:
    id v36 = v14;
    id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
    objc_super v19 = (void *)[v18 initWithCapacity:v42[1]];
    unint64_t v35 = (void *)MEMORY[0x1A6257080]();
    long long v20 = (char *)v42[0];
    if (v42[0])
    {
      id v21 = 0;
      while (1)
      {
        id v22 = [NSString alloc];
        id v23 = v20 + 16;
        if (v20[39] < 0) {
          id v23 = (void *)*v23;
        }
        double v24 = objc_msgSend(v22, "initWithUTF8String:", v23, v35);
        if (_isAcceptableRecognizedObjectIdentifier(v24, v13))
        {
          if (v16)
          {
            id v38 = v21;
            id v39 = 0;
            char v25 = [v16 getClassificationMetrics:&v39 forClassificationIdentifier:v24 error:&v38];
            id v26 = v39;
            id v27 = v38;

            if ((v25 & 1) == 0)
            {

              char v32 = 0;
              goto LABEL_25;
            }
            id v21 = v27;
          }
          else
          {
            id v26 = 0;
          }
          float v28 = [VNClassificationObservation alloc];
          LODWORD(v29) = *((_DWORD *)v20 + 10);
          float v30 = [(VNClassificationObservation *)v28 initWithOriginatingRequestSpecifier:v37 identifier:v24 confidence:v26 classificationMetrics:v29];
          if (v30) {
            [v19 addObject:v30];
          }
        }
        long long v20 = *(char **)v20;
        if (!v20) {
          goto LABEL_24;
        }
      }
    }
    id v21 = 0;
LABEL_24:
    double v24 = &__block_literal_global_128_38097;
    id v31 = &__block_literal_global_128_38097;
    [v19 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];
    char v32 = 1;
    id v27 = v21;
LABEL_25:

    if (v32) {
      id v17 = v19;
    }
    else {
      id v17 = 0;
    }

    id v14 = v36;
    goto LABEL_29;
  }
  id v17 = 0;
LABEL_29:
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v42[0]);
  v33 = v41[0];
  v41[0] = 0;
  if (v33) {
    operator delete(v33);
  }
LABEL_31:

  return v17;
}

- (uint64_t)_validateProvidesSceneLabelsAndReturnError:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = objc_opt_class();
    objc_super v5 = [v3 configurationOptions];
    LOBYTE(v4) = [(id)v4 providesSceneLabelsForConfiguration:v5];

    if (v4)
    {
      return 1;
    }
    else
    {
      if (a2)
      {
        id v6 = NSString;
        unsigned __int8 v7 = (objc_class *)objc_opt_class();
        unsigned __int8 v8 = NSStringFromClass(v7);
        v9 = [v6 stringWithFormat:@"%@ does not provide classification labels", v8];

        *a2 = +[VNError errorForDataUnavailableWithLocalizedDescription:v9];
      }
      return 0;
    }
  }
  return result;
}

- (id)supportedClassificationIdentifiersAcceptedByBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[VNImageAnalyzerBasedDetector _validateProvidesSceneLabelsAndReturnError:]((uint64_t)self, a4))
  {
    cachedSupportedClassificationIdentifiers = self->_cachedSupportedClassificationIdentifiers;
    if (!cachedSupportedClassificationIdentifiers)
    {
      LabelsList = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)self->_imageAnalyzer.__ptr_, 2u);
      DisallowedLabels = vision::mod::ImageAnalyzer::getDisallowedLabels((uint64_t)self->_imageAnalyzer.__ptr_, 2u);
      context = (void *)MEMORY[0x1A6257080]();
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((LabelsList[1] - *LabelsList) >> 3) - DisallowedLabels[3]];
      uint64_t v11 = *LabelsList;
      uint64_t v12 = LabelsList[1];
      if (*LabelsList != v12)
      {
        do
        {
          if (!std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(DisallowedLabels, (unsigned __int8 *)v11))
          {
            id v13 = [NSString alloc];
            uint64_t v14 = v11;
            if (*(char *)(v11 + 23) < 0) {
              uint64_t v14 = *(void *)v11;
            }
            uint64_t v15 = (void *)[v13 initWithUTF8String:v14];
            if (_isAcceptableRecognizedObjectIdentifier(v15, v6)) {
              [v10 addObject:v15];
            }
          }
          v11 += 24;
        }
        while (v11 != v12);
      }
      [v10 sortUsingSelector:sel_compare_];
      uint64_t v16 = (NSArray *)[v10 copy];
      id v17 = self->_cachedSupportedClassificationIdentifiers;
      self->_cachedSupportedClassificationIdentifiers = v16;

      cachedSupportedClassificationIdentifiers = self->_cachedSupportedClassificationIdentifiers;
    }
    id v18 = cachedSupportedClassificationIdentifiers;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self, a5, *(void *)&a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  return 0;
}

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  id v6 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a4];
  if (v6)
  {
    unsigned __int8 v7 = [(VNDetector *)self configurationOptions];
    unsigned __int8 v8 = objc_opt_class();
    *((_DWORD *)a3 + 9) = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:v6];
    *((_DWORD *)a3 + 8) = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:v6];
    *((_DWORD *)a3 + 6) = +[VNEspressoHelpers espressoEngineForComputeDevice:v6];
    *((_DWORD *)a3 + 7) = 0;
    *((unsigned char *)a3 + 385) = 1;
    v9 = [v8 modelPathForConfiguration:v7 error:0];
    uint64_t v10 = [v9 lastPathComponent];
    id v11 = [v10 stringByDeletingPathExtension];
    std::string::__assign_external((std::string *)a3, (const std::string::value_type *)[v11 UTF8String]);

    int v12 = [v8 analysisPixelFormatTypeForConfiguration:v7];
    if (v12 <= 1094862673)
    {
      if (v12 == 8)
      {
        int v13 = 1;
        goto LABEL_14;
      }
      if (v12 == 32)
      {
        int v13 = 8;
        goto LABEL_14;
      }
    }
    else
    {
      switch(v12)
      {
        case 1380401729:
          int v13 = 2;
          goto LABEL_14;
        case 1111970369:
          int v13 = 4;
          goto LABEL_14;
        case 1094862674:
          int v13 = 16;
LABEL_14:
          *((_DWORD *)a3 + 10) = v13;
          id v14 = [v8 inputImageBlobNameForConfiguration:v7];
          std::string::__assign_external((std::string *)a3 + 2, (const std::string::value_type *)[v14 UTF8String]);

          goto LABEL_15;
      }
    }
    int v13 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v6 != 0;
}

- (unint64_t)defaultImageCropAndScaleOption
{
  return 0;
}

- (CGSize)inputImageSize
{
  double width = self->_networkRequiredInputImageSize.width;
  double height = self->_networkRequiredInputImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end