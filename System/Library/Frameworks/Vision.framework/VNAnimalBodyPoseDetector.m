@interface VNAnimalBodyPoseDetector
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNAnimalBodyPoseDetector

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VNAnimalBodyPoseDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __65__VNAnimalBodyPoseDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNAnimalBodyPoseDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorInitOption_ModelBackingStore"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void).cxx_destruct
{
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v23 = [(VCPPetsPoseImageRequest *)self->_animalBodyPoseDetector processImage:a4 withOptions:0 error:a8];
  if (v23)
  {
    v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
    if (v13)
    {
      v22 = a8;
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v23, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v23;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = [(VNRecognizedPointsObservation *)[VNAnimalBodyPoseObservation alloc] initWithOriginatingRequestSpecifier:v13 keypointReturningObservation:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            if (!v19)
            {
              if (v22)
              {
                id *v22 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to create observation"];
              }

              id v20 = 0;
              goto LABEL_16;
            }
            [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v12 toObservation:v19];
            [v14 addObject:v19];
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      id v20 = v14;
LABEL_16:
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  uint64_t v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  v18 = v17;
  if (v17)
  {
    unint64_t v19 = [v17 width];
    unint64_t v20 = [v18 height];
    v30.origin.double x = x * (double)v19;
    v30.size.double width = width * (double)v19;
    v30.origin.double y = y * (double)v20;
    v30.size.double height = height * (double)v20;
    CGRect v31 = CGRectIntegral(v30);
    double v21 = v31.origin.x;
    double v22 = v31.origin.y;
    double v23 = v31.size.width;
    double v24 = v31.size.height;
    +[VNError VNAssert:self->_animalBodyPoseDetector != 0 log:@"VCP Animal Pose Detector must be initialized"];
    id v29 = 0;
    long long v25 = (__CVBuffer *)objc_msgSend(v18, "createCroppedBufferWithMaxSideLengthOf:cropRect:pixelFormat:options:error:pixelBufferRepsCacheKey:", 580, 1111970369, v16, a8, &v29, v21, v22, v23, v24);
    id v26 = v29;
    *a7 = v25;
    BOOL v27 = v25 != 0;
    if (v25) {
      [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v16 cacheKey:v26 imageBuffer:v18];
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNAnimalBodyPoseDetector;
  if (![(VNDetector *)&v13 completeInitializationForSession:v6 error:a4]) {
    goto LABEL_8;
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v7 = (void *)getVCPPetsPoseImageRequestClass(void)::softClass;
  uint64_t v18 = getVCPPetsPoseImageRequestClass(void)::softClass;
  if (!getVCPPetsPoseImageRequestClass(void)::softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___ZL31getVCPPetsPoseImageRequestClassv_block_invoke;
    v14[3] = &unk_1E5B20220;
    v14[4] = &v15;
    ___ZL31getVCPPetsPoseImageRequestClassv_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  v8 = v7;
  _Block_object_dispose(&v15, 8);
  v9 = (VCPPetsPoseImageRequest *)[[v8 alloc] initWithOptions:0];
  animalBodyPoseDetector = self->_animalBodyPoseDetector;
  self->_animalBodyPoseDetector = v9;

  if (!self->_animalBodyPoseDetector)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to initialize VCP Animal Pose Detector"];
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

@end