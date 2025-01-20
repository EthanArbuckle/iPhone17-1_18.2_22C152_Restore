@interface VNHumanBodyPoseDetector
+ (Class)recognizedPointsObservationClass;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (id)_vcpRequestRevisionForOptions:(id)a3;
- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4;
@end

@implementation VNHumanBodyPoseDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = [v6 specifiesRequestClass:objc_opt_class()];
  if (a4) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    *a4 = +[VNError errorForUnsupportedRequestSpecifier:v6];
  }
  uint64_t v9 = [v6 requestRevision];
  if (v9 == 1)
  {
    v16 = @"VNComputeStageMain";
    v12 = +[VNComputeDeviceUtilities allComputeDevices];
    v17[0] = v12;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

    goto LABEL_14;
  }
  if (v9 == 3737841664)
  {
    v14 = @"VNComputeStageMain";
    v10 = +[VNComputeDeviceUtilities allNeuralEngineComputeDevices];
    v15 = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];

    goto LABEL_14;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:v6];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_13:
    v11 = 0;
  }
LABEL_14:

  return v11;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VNHumanBodyPoseDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __64__VNHumanBodyPoseDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNHumanBodyPoseDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (Class)recognizedPointsObservationClass
{
  return (Class)objc_opt_class();
}

- (id)_vcpRequestRevisionForOptions:(id)a3
{
  char v7 = 1;
  uint64_t v6 = 0;
  BOOL v3 = +[VNValidationUtilities getBOOLValue:&v7 forKey:@"VNHumanBodyPoseDetectorProcessOption_HolisticDetection" inOptions:a3 withDefaultValue:1 error:&v6];
  v4 = &unk_1EF7A7250;
  if (!v7) {
    v4 = &unk_1EF7A7268;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanBodyPoseDetector;
  char v7 = [(VNHumanPoseDetector *)&v15 vcpPoseRequestSetupOptionsForDetectorOptions:v6 error:a4];
  if (!v7)
  {
    id v13 = 0;
    goto LABEL_13;
  }
  char v8 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 specifyingRequestClass:objc_opt_class() error:a4];
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v10 = [v8 requestRevision];
  if (v10 == 1)
  {
    v11 = getVCPRequestRevisionPropertyKey();
    [v7 setObject:&unk_1EF7A7280 forKeyedSubscript:v11];
    goto LABEL_8;
  }
  if (v10 != 3737841664)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:v9];
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    id v13 = 0;
    goto LABEL_12;
  }
  v11 = [(VNHumanBodyPoseDetector *)self _vcpRequestRevisionForOptions:v6];
  v12 = getVCPRequestRevisionPropertyKey();
  [v7 setObject:v11 forKeyedSubscript:v12];

LABEL_8:
  id v13 = v7;
LABEL_12:

LABEL_13:

  return v13;
}

- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  char v7 = [(VNDetector *)self configurationOptions];
  char v8 = [(VNHumanBodyPoseDetector *)self _vcpRequestRevisionForOptions:v7];

  uint64_t v9 = [(VNHumanBodyPoseDetector *)self _vcpRequestRevisionForOptions:v6];
  if ([v8 isEqualToNumber:&unk_1EF7A7268]
    && ([v9 isEqualToNumber:&unk_1EF7A7250] & 1) != 0)
  {
    BOOL v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)VNHumanBodyPoseDetector;
    BOOL v10 = [(VNDetector *)&v12 shouldBeReplacedByDetectorOfClass:a3 withConfiguration:v6];
  }

  return v10;
}

- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  char v7 = [(VNDetector *)self configurationOptions];
  char v8 = [(VNHumanBodyPoseDetector *)self _vcpRequestRevisionForOptions:v7];

  uint64_t v9 = [(VNHumanBodyPoseDetector *)self _vcpRequestRevisionForOptions:v6];
  if ([v8 isEqualToNumber:v9])
  {
    v12.receiver = self;
    v12.super_class = (Class)VNHumanBodyPoseDetector;
    BOOL v10 = [(VNDetector *)&v12 canBehaveAsDetectorOfClass:a3 withConfiguration:v6];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanBodyPoseDetector;
  if ([(VNDetector *)&v15 completeInitializationForSession:v6 error:a4])
  {
    char v7 = [(VNDetector *)self configurationOptions];
    char v8 = [(VNHumanBodyPoseDetector *)self vcpPoseRequestSetupOptionsForDetectorOptions:v7 error:a4];
    if (v8)
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2050000000;
      uint64_t v9 = (void *)getVCPHumanPoseImageRequestClass(void)::softClass;
      uint64_t v20 = getVCPHumanPoseImageRequestClass(void)::softClass;
      if (!getVCPHumanPoseImageRequestClass(void)::softClass)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = ___ZL32getVCPHumanPoseImageRequestClassv_block_invoke;
        v16[3] = &unk_1E5B20220;
        v16[4] = &v17;
        ___ZL32getVCPHumanPoseImageRequestClassv_block_invoke((uint64_t)v16);
        uint64_t v9 = (void *)v18[3];
      }
      BOOL v10 = v9;
      _Block_object_dispose(&v17, 8);
      v11 = (VCPRequest *)[[v10 alloc] initWithOptions:v8];
      humanPoseDetector = self->super._humanPoseDetector;
      self->super._humanPoseDetector = v11;

      if (self->super._humanPoseDetector)
      {
        BOOL v13 = 1;
LABEL_11:

        goto LABEL_12;
      }
      if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to setup request in VNDetectHumanBodyPoseRequest"];
        BOOL v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    BOOL v13 = 0;
    goto LABEL_11;
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

@end