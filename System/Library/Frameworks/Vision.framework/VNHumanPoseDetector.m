@interface VNHumanPoseDetector
+ (Class)recognizedPointsObservationClass;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)needsMetalContext;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)vcpPoseRequestRuntimeOptionsForDetectorOptions:(id)a3 error:(id *)a4;
- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4;
@end

@implementation VNHumanPoseDetector

+ (Class)recognizedPointsObservationClass
{
  return (Class)objc_opt_class();
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VNHumanPoseDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __60__VNHumanPoseDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNHumanPoseDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorInitOption_ModelBackingStore"];
  [v2 addObject:@"VNDetectorOption_OriginatingRequestSpecifier"];
  [v2 addObject:@"VNHumanPoseDetectorInitOption_UseCPUOnly"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:@"VNHumanPoseDetectorInitOption_UseCPUOnly"];
  int v6 = [v5 BOOLValue];

  v10 = @"VNComputeStageMain";
  if (v6) {
    +[VNComputeDeviceUtilities allCPUComputeDevices];
  }
  else {
  v7 = +[VNComputeDeviceUtilities allComputeDevices];
  }
  v11[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

- (void).cxx_destruct
{
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v24 = [(VCPRequest *)self->_humanPoseDetector processImage:a4 withOptions:0 error:a8];
  if (v24)
  {
    v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
    if (v13)
    {
      v14 = (objc_class *)[(id)objc_opt_class() recognizedPointsObservationClass];
      v23 = a8;
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v16 = v24;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = (void *)[[v14 alloc] initWithOriginatingRequestSpecifier:v13 keypointReturningObservation:*(void *)(*((void *)&v25 + 1) + 8 * i)];
            if (!v20)
            {
              if (v23)
              {
                id *v23 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to create observation"];
              }

              id v21 = 0;
              goto LABEL_16;
            }
            [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v12 toObservation:v20];
            [v15 addObject:v20];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v21 = v15;
LABEL_16:
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v11 = *(void *)&a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  uint64_t v18 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  v19 = v18;
  if (v18)
  {
    unint64_t v20 = [v18 width];
    unint64_t v21 = [v19 height];
    v50.origin.double x = x * (double)v20;
    v50.size.double width = width * (double)v20;
    v50.origin.double y = y * (double)v21;
    v50.size.double height = height * (double)v21;
    CGRect v51 = CGRectIntegral(v50);
    double v22 = v51.origin.x;
    double v23 = v51.origin.y;
    double v24 = v51.size.width;
    double v25 = v51.size.height;
    +[VNError VNAssert:self->_humanPoseDetector != 0 log:@"Human Pose Request is not initialized"];
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__11562;
    v48[4] = __Block_byref_object_dispose__11563;
    id v49 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __117__VNHumanPoseDetector_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
    aBlock[3] = &unk_1E5B1D1A0;
    v42 = v48;
    aBlock[4] = self;
    id v26 = v17;
    id v41 = v26;
    v43 = &v44;
    long long v27 = _Block_copy(aBlock);
    [(id)objc_opt_class() runSuccessReportingBlockSynchronously:v27 detector:self qosClass:v11 error:a8];
    if (!*((unsigned char *)v45 + 24)
      || ([(VCPRequest *)self->_humanPoseDetector preferredInputSizeWithOptions:0 error:a8], double v30 = v29, v31 = v28, v32 = *MEMORY[0x1E4F1DB30], *MEMORY[0x1E4F1DB30] == v30)&& (v32 = *(double *)(MEMORY[0x1E4F1DB30] + 8), v32 == v28))
    {
      BOOL v33 = 0;
    }
    else
    {
      uint64_t v34 = [(VCPRequest *)self->_humanPoseDetector preferredPixelFormat];
      if ((v34 & 0xFFFFFFEF) == 0x34323066) {
        unint64_t v35 = ((unint64_t)v30 + 1) & 0xFFFFFFFFFFFFFFFELL;
      }
      else {
        unint64_t v35 = (unint64_t)v30;
      }
      id v39 = 0;
      v36 = (__CVBuffer *)objc_msgSend(v19, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v35, (unint64_t)v31, v34, v26, a8, &v39, v22, v23, v24, v25);
      id v37 = v39;
      *a7 = v36;
      BOOL v33 = v36 != 0;
      if (v36) {
        [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v26 cacheKey:v37 imageBuffer:v19];
      }
    }
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(v48, 8);
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

uint64_t __117__VNHumanPoseDetector_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) vcpPoseRequestRuntimeOptionsForDetectorOptions:*(void *)(a1 + 40) error:a2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 56) updateWithOptions:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40) error:a2];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

- (id)vcpPoseRequestRuntimeOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(VNDetector *)self validatedImageBufferFromOptions:v6 error:a4];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v7, "width"));
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    v10 = (void *)getVCPRequestFrameWidthPropertyKeySymbolLoc(void)::ptr;
    uint64_t v19 = getVCPRequestFrameWidthPropertyKeySymbolLoc(void)::ptr;
    if (!getVCPRequestFrameWidthPropertyKeySymbolLoc(void)::ptr)
    {
      uint64_t v11 = (void *)VideoProcessingLibrary();
      v17[3] = (uint64_t)dlsym(v11, "VCPRequestFrameWidthPropertyKey");
      getVCPRequestFrameWidthPropertyKeySymbolLoc(void)::ptr = v17[3];
      v10 = (void *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v10) {
      goto LABEL_13;
    }
    [v8 setObject:v9 forKeyedSubscript:*v10];

    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v7, "height"));
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    v13 = (void *)getVCPRequestFrameHeightPropertyKeySymbolLoc(void)::ptr;
    uint64_t v19 = getVCPRequestFrameHeightPropertyKeySymbolLoc(void)::ptr;
    if (!getVCPRequestFrameHeightPropertyKeySymbolLoc(void)::ptr)
    {
      v14 = (void *)VideoProcessingLibrary();
      v17[3] = (uint64_t)dlsym(v14, "VCPRequestFrameHeightPropertyKey");
      getVCPRequestFrameHeightPropertyKeySymbolLoc(void)::ptr = v17[3];
      v13 = (void *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v13)
    {
LABEL_13:
      dlerror();
      id result = (id)abort_report_np();
      __break(1u);
      return result;
    }
    [v8 setObject:v12 forKeyedSubscript:*v13];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned __int8 v13 = 0;
  if (+[VNValidationUtilities getBOOLValue:&v13 forKey:@"VNHumanPoseDetectorInitOption_UseCPUOnly" inOptions:v5 withDefaultValue:0 error:a4])
  {
    v7 = [NSNumber numberWithBool:v13];
    uint64_t v19 = 0;
    unint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v8 = (void *)getVCPRequestForceCPUPropertyKeySymbolLoc(void)::ptr;
    uint64_t v22 = getVCPRequestForceCPUPropertyKeySymbolLoc(void)::ptr;
    if (!getVCPRequestForceCPUPropertyKeySymbolLoc(void)::ptr)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = ___ZL41getVCPRequestForceCPUPropertyKeySymbolLocv_block_invoke;
      id v17 = &unk_1E5B20220;
      uint64_t v18 = &v19;
      v9 = (void *)VideoProcessingLibrary();
      v10 = dlsym(v9, "VCPRequestForceCPUPropertyKey");
      *(void *)(v18[1] + 24) = v10;
      getVCPRequestForceCPUPropertyKeySymbolLoc(void)::ptr = *(void *)(v18[1] + 24);
      id v8 = (void *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v8)
    {
      dlerror();
      id result = (id)abort_report_np();
      __break(1u);
      return result;
    }
    [v6 setObject:v7 forKeyedSubscript:*v8];

    id v11 = v6;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)needsMetalContext
{
  return 0;
}

@end