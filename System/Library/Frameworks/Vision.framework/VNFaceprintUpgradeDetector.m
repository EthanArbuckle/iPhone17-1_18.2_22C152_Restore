@interface VNFaceprintUpgradeDetector
+ (BOOL)isSupportedUpgradeFromPreviousEspressoprint:(id)a3 toNewLowResolutionEspressoprint:(id)a4;
+ (Class)espressoprintClass;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNFaceprintUpgradeDetector

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v12 = *(void *)&a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v37[2] = *MEMORY[0x1E4F143B8];
  id v19 = a5;
  v36.receiver = self;
  v36.super_class = (Class)VNFaceprintUpgradeDetector;
  v20 = -[VNEspressoprintUpgradeDetector processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:](&v36, sel_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler_, a4, v19, v12, a7, a8, a9, x, y, width, height);
  LOBYTE(a9) = v20 == 0;

  if (a9)
  {
    v33 = 0;
  }
  else
  {
    v21 = +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", [(id)objc_opt_class() espressoprintClass], @"VNEspressoprintUpgradeDetectorProcessOption_ToEspressoprint", v19, a8);
    v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 elementCount];
      v24 = [VNFaceprint alloc];
      [(VNEspressoprintUpgradeDetector *)self highResolutionNewEspressoprint];
      [v22 confidence];
      int v26 = v25;
      uint64_t v27 = [v22 requestRevision];
      LODWORD(v28) = v26;
      v29 = [(VNFaceprint *)v24 initWithData:v35 elementCount:v23 elementType:1 lengthInBytes:4 * v23 confidence:v27 requestRevision:v28];
      if (v29)
      {
        v30 = NSNumber;
        [(VNEspressoprintUpgradeDetector *)self highResolutionNewEspressoprintSigma];
        LODWORD(v31) = *v35;
        v32 = [v30 numberWithFloat:v31];
        v37[0] = v29;
        v37[1] = v32;
        v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      }
      else if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot allocate faceprint"];
        v33 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
    }
    else
    {
      v33 = 0;
    }
  }

  return v33;
}

+ (BOOL)isSupportedUpgradeFromPreviousEspressoprint:(id)a3 toNewLowResolutionEspressoprint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::onceToken != -1) {
    dispatch_once(&+[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::onceToken, &__block_literal_global_32241);
  }
  uint64_t v7 = [v6 requestRevision];
  v8 = (void *)+[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::versionsUpgradeTable;
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "requestRevision"));
  v10 = [v8 objectForKey:v9];
  uint64_t v11 = [v10 unsignedIntegerValue];
  if (v7 == 3737841668) {
    uint64_t v7 = 3737841669;
  }

  return v7 == v11;
}

void __106__VNFaceprintUpgradeDetector_isSupportedUpgradeFromPreviousEspressoprint_toNewLowResolutionEspressoprint___block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = &unk_1EF7A7820;
  v3[0] = &unk_1EF7A7838;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)+[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::versionsUpgradeTable;
  +[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::versionsUpgradeTable = v0;
}

+ (Class)espressoprintClass
{
  return (Class)objc_opt_class();
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return &stru_1EF75C0C0;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"fc_md1_from_anfr_3_1_md2_to_4_md2.espresso";
}

@end