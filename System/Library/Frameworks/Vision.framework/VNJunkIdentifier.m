@interface VNJunkIdentifier
+ (BOOL)shouldDumpDebugIntermediates;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNJunkIdentifier

+ (BOOL)shouldDumpDebugIntermediates
{
  if (+[VNJunkIdentifier shouldDumpDebugIntermediates]::onceToken != -1) {
    dispatch_once(&+[VNJunkIdentifier shouldDumpDebugIntermediates]::onceToken, &__block_literal_global_20603);
  }
  return +[VNJunkIdentifier shouldDumpDebugIntermediates]::dumpDebug;
}

void __48__VNJunkIdentifier_shouldDumpDebugIntermediates__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"VN_DEBUG_DUMP_JUNK_INTERMEDIATES"];

  if (v1) {
    +[VNJunkIdentifier shouldDumpDebugIntermediates]::dumpDebug = 1;
  }
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VNJunkIdentifier_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNJunkIdentifier configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNJunkIdentifier configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNJunkIdentifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __57__VNJunkIdentifier_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNJunkIdentifier;
  int v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  [v2 addObject:@"VNDetectorOption_MetalContextPriority"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNJunkIdentifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNJunkIdentifier configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->mJunkClassifierImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->mJunkDescriptorImpl.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v4);
  }
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v19 = a7;
  id v20 = a9;
  v21 = [(VNDetector *)self validatedImageBufferFromOptions:v18 error:a8];
  if (v21)
  {
    (*((void (**)(uint64_t *__return_ptr))self->mJunkDescriptorImpl.__ptr_->var0 + 8))(&v46);
    v22 = [(VNDetector *)self metalContext];
    uint64_t v44 = 0;
    unint64_t v45 = 0;
    if (+[VNImageClassifier computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:](VNImageClassifier, "computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:", v21, a4, self->mJunkDescriptorImpl.__ptr_, 0, 3, v46, x, y, width, height, v18, v22, 0, &v45, &v44, a8))
    {
      VNRecordImageTilingWarning(v19, v45, v44);
      v23 = +[VNImageClassifier classifyImageWithDescriptors:v46 usingImageClassifier:self->mJunkClassifierImpl.__ptr_ andMinConfidenceForClassification:v18 options:v22 metalContext:a8 error:0.0];
      v24 = v23;
      if (v23)
      {
        if ([v23 count])
        {
          v25 = [v24 objectAtIndexedSubscript:0];
          [v25 confidence];
          int v27 = v26;
        }
        else
        {
          int v27 = 0;
        }
        v29 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v18 error:a8];
        if (v29)
        {
          v30 = [VNClassificationObservation alloc];
          LODWORD(v31) = v27;
          v42 = [(VNClassificationObservation *)v30 initWithOriginatingRequestSpecifier:v29 identifier:@"junk" confidence:v31];
          v41 = [v18 objectForKeyedSubscript:@"VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"];
          v43 = [v18 objectForKeyedSubscript:@"VNImageClassifierProcessingOption_DebugInfo"];
          if (v41 && v43)
          {
            v40 = [v21 fileURL];
            v32 = [v40 lastPathComponent];
            v33 = [v32 stringByDeletingPathExtension];

            if (![v33 length])
            {
              v34 = [NSNumber numberWithUnsignedLongLong:-[VNJunkIdentifier processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:]::image_name_offset];
              uint64_t v35 = [v34 stringValue];

              v33 = (void *)v35;
            }
            v36 = [v33 stringByAppendingString:@".json"];
            v37 = [v41 stringByAppendingString:v36];

            v38 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v43 options:1 error:0];
            [v38 writeToFile:v37 atomically:1];
            ++-[VNJunkIdentifier processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:]::image_name_offset;
          }
          v48[0] = v42;
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
        }
        else
        {
          v28 = 0;
        }
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }

    if (v47) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v47);
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  if (v17) {
    BOOL v18 = +[VNImageClassifier computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:](VNImageClassifier, "computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:", v17, self->mJunkDescriptorImpl.__ptr_, 1, v16, a7, a8, x, y, width, height);
  }
  else {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v15 = *(void *)&a3;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  id v20 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a7];
  v21 = v20;
  if (v20)
  {
    unint64_t v22 = [v20 width];
    unint64_t v23 = [v21 height];
    (*((void (**)(ImageDescriptorProcessorAbstract *))self->mJunkDescriptorImpl.__ptr_->var0 + 19))(self->mJunkDescriptorImpl.__ptr_);
    if (v23 >= v22) {
      unint64_t v26 = v22;
    }
    else {
      unint64_t v26 = v23;
    }
    if (v24 >= v25) {
      float v24 = v25;
    }
    if (v26 < (unint64_t)v24 >> 2)
    {
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)v24 >> 2);
      int v27 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v17 error:a7];
      if (v27)
      {
        v28 = [VNClassificationObservation alloc];
        LODWORD(v29) = 1.0;
        v30 = [(VNClassificationObservation *)v28 initWithOriginatingRequestSpecifier:v27 identifier:@"junk" confidence:v29];
        v41[0] = v30;
        double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
      }
      else
      {
        double v31 = 0;
      }

      goto LABEL_19;
    }
    if (!+[VNJunkIdentifier shouldDumpDebugIntermediates])
    {
      id v35 = 0;
      id v36 = 0;
      goto LABEL_14;
    }
    uint64_t v32 = NSTemporaryDirectory();
    uint64_t v33 = [(id)v32 stringByAppendingPathComponent:@"VN_junk_classifier_debug_intermediates"];

    v38 = (void *)v33;
    v39 = [MEMORY[0x1E4F28CB8] defaultManager];
    v34 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v33 isDirectory:1];
    LOBYTE(v32) = [v39 createDirectoryAtURL:v34 withIntermediateDirectories:1 attributes:0 error:a7];

    if (v32)
    {
      id v35 = v38;
      [v17 setObject:v35 forKeyedSubscript:@"VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"];
      id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v17 setObject:v36 forKeyedSubscript:@"VNImageClassifierProcessingOption_DebugInfo"];

LABEL_14:
      [v17 setObject:&unk_1EF7A72E0 forKeyedSubscript:@"VNImageBufferOption_DownscaleCGInterpolationQuality"];
      [v17 setObject:&unk_1EF7A72F8 forKeyedSubscript:@"VNImageBufferOption_UpscaleCGInterpolationQuality"];
      v40.receiver = self;
      v40.super_class = (Class)VNJunkIdentifier;
      double v31 = -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v40, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v19, x, y, width, height);

      goto LABEL_19;
    }
  }
  double v31 = 0;
LABEL_19:

  return v31;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v23.receiver = self;
  v23.super_class = (Class)VNJunkIdentifier;
  if (!-[VNDetector completeInitializationForSession:error:](&v23, sel_completeInitializationForSession_error_, a3)) {
    return 0;
  }
  v6 = VNFrameworkBundle();
  v7 = [v6 pathForResource:@"junk-descriptor-current" ofType:@"bin"];
  v8 = [v6 pathForResource:@"junk-classifier-current" ofType:@"bin"];
  v9 = [v6 pathForResource:@"junk-classifier-labels-current" ofType:@"txt"];
  v10 = [(VNDetector *)self configurationOptions];
  v11 = [v10 objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];
  char v12 = [v11 BOOLValue];

  uint64_t v22 = 1;
  if (+[VNValidationUtilities getMTLGPUPriority:&v22 forKey:@"VNDetectorOption_MetalContextPriority" inOptions:v10 withDefaultValue:1 error:a4])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__VNJunkIdentifier_completeInitializationForSession_error___block_invoke;
    aBlock[3] = &unk_1E5B1DFD8;
    aBlock[4] = self;
    id v17 = v8;
    id v18 = v9;
    char v21 = v12;
    id v19 = v7;
    uint64_t v20 = v22;
    v13 = _Block_copy(aBlock);
    char v14 = VNExecuteBlock(v13, (uint64_t)a4);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

uint64_t __59__VNJunkIdentifier_completeInitializationForSession_error___block_invoke(uint64_t a1, void *a2)
{
  long long v21 = 0u;
  v4 = (const std::string::value_type *)[*(id *)(a1 + 40) UTF8String];
  objc_super v5 = (const char *)[*(id *)(a1 + 48) UTF8String];
  v6 = (char *)operator new(0xA0uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(void *)v6 = &unk_1EF753738;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((void *)v6 + 10) = 0;
  *((_DWORD *)v6 + 22) = 1065353216;
  *((void *)v6 + 12) = 0;
  *(_OWORD *)(v6 + 104) = 0u;
  *((_DWORD *)v6 + 30) = 1;
  *(int32x2_t *)(v6 + 124) = vdup_n_s32(0x3DCCCCCDu);
  *(void *)(v6 + 132) = 5;
  *((void *)v6 + 3) = &unk_1EF752648;
  *((_OWORD *)v6 + 9) = 0u;
  v7 = v6 + 144;
  vision::mod::ImageClassifierAbstract::initLabels((vision::mod::ImageClassifierAbstract *)(v6 + 24), v5);
  v8 = (char *)operator new(0x80uLL);
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)v8 = &unk_1EF753700;
  *(_OWORD *)(v8 + 24) = 0u;
  v9 = v8 + 24;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *((void *)v8 + 15) = 0;
  v10 = (std::__shared_weak_count *)*((void *)v6 + 19);
  *((void *)v6 + 18) = v8 + 24;
  *((void *)v6 + 19) = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100](v10);
    v9 = *(void **)v7;
  }
  v11 = (std::__shared_weak_count *)v9[1];
  void *v9 = 0;
  v9[1] = 0;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  }
  std::string::__assign_external((std::string *)(*(void *)v7 + 56), v4);
  *(unsigned char *)(*(void *)v7 + 48) = 0;
  (*(void (**)(char *, long long *))(*((void *)v6 + 3) + 32))(v6 + 24, &v21);
  *(void *)&long long v12 = v6 + 24;
  *((void *)&v12 + 1) = v6;
  v13 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 80);
  *(_OWORD *)(*(void *)(a1 + 32) + 72) = v12;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v13);
  }
  if (*((void *)&v21 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v21 + 1));
  }
  if (!*(void *)(*(void *)(a1 + 32) + 72)) {
    goto LABEL_14;
  }
  char v14 = (const char *)[*(id *)(a1 + 56) UTF8String];
  uint64_t v15 = (char *)operator new(0x58uLL);
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  *(void *)uint64_t v15 = &unk_1EF7539D8;
  long long v22 = xmmword_1A4104940;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  vision::mod::ImageDescriptorProcessorEspresso::ImageDescriptorProcessorEspresso((uint64_t)(v15 + 24), (unsigned __int8 *)&v22, v14, "model_junk_12_espresso", 0, 1);
  *((void *)v15 + 3) = &unk_1EF7529A8;
  *(void *)&long long v16 = v15 + 24;
  *((void *)&v16 + 1) = v15;
  *((_DWORD *)v15 + 9) = 998277249;
  *(void *)(v15 + 52) = 0;
  *(void *)(v15 + 44) = 0;
  *(_DWORD *)(v15 + 59) = 0;
  id v17 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 64);
  *(_OWORD *)(*(void *)(a1 + 32) + 56) = v16;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v17);
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (*(void *)(v18 + 56))
  {
    (*(void (**)(void))(**(void **)(v18 + 72) + 32))(*(void *)(v18 + 72));
    uint64_t result = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 72) + 112) = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 72) + 96) = 1;
  }
  else
  {
LABEL_14:
    if (a2)
    {
      id v20 = +[VNError errorForMemoryAllocationFailure];
      uint64_t result = 0;
      *a2 = v20;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end