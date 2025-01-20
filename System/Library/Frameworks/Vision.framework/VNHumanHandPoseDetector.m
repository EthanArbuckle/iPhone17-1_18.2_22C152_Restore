@interface VNHumanHandPoseDetector
+ (Class)recognizedPointsObservationClass;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (id)vcpPoseRequestRuntimeOptionsForDetectorOptions:(id)a3 error:(id *)a4;
- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4;
@end

@implementation VNHumanHandPoseDetector

- (id)vcpPoseRequestRuntimeOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanHandPoseDetector;
  v7 = [(VNHumanPoseDetector *)&v15 vcpPoseRequestRuntimeOptionsForDetectorOptions:v6 error:a4];
  if (v7
    && (uint64_t v14 = 0,
        +[VNValidationUtilities getNSUIntegerValue:&v14 forKey:@"VNHumanHandPoseDetectorProcessOption_MaximumHandCount" inOptions:v6 error:a4]))
  {
    v8 = [NSNumber numberWithUnsignedInteger:v14];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    v9 = (void *)getVCPRequestMaxNumOfHandsPropertyKeySymbolLoc(void)::ptr;
    uint64_t v24 = getVCPRequestMaxNumOfHandsPropertyKeySymbolLoc(void)::ptr;
    if (!getVCPRequestMaxNumOfHandsPropertyKeySymbolLoc(void)::ptr)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = ___ZL46getVCPRequestMaxNumOfHandsPropertyKeySymbolLocv_block_invoke;
      v19 = &unk_1E5B20220;
      v20 = &v21;
      v10 = (void *)VideoProcessingLibrary();
      v11 = dlsym(v10, "VCPRequestMaxNumOfHandsPropertyKey");
      *(void *)(v20[1] + 24) = v11;
      getVCPRequestMaxNumOfHandsPropertyKeySymbolLoc(void)::ptr = *(void *)(v20[1] + 24);
      v9 = (void *)v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v9)
    {
      dlerror();
      id result = (id)abort_report_np();
      __break(1u);
      return result;
    }
    [v7 setObject:v8 forKeyedSubscript:*v9];

    id v12 = v7;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanHandPoseDetector;
  v7 = [(VNHumanPoseDetector *)&v15 vcpPoseRequestSetupOptionsForDetectorOptions:v6 error:a4];
  if (v7)
  {
    v8 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 specifyingRequestClass:objc_opt_class() error:a4];
    v9 = v8;
    if (!v8) {
      goto LABEL_11;
    }
    if ([v8 requestRevision] == 1)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      v10 = (void *)getVCPRequestRevisionPropertyKeySymbolLoc(void)::ptr;
      uint64_t v24 = getVCPRequestRevisionPropertyKeySymbolLoc(void)::ptr;
      if (!getVCPRequestRevisionPropertyKeySymbolLoc(void)::ptr)
      {
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = ___ZL41getVCPRequestRevisionPropertyKeySymbolLocv_block_invoke_19350;
        v19 = &unk_1E5B20220;
        v20 = &v21;
        v11 = (void *)VideoProcessingLibrary();
        id v12 = dlsym(v11, "VCPRequestRevisionPropertyKey");
        *(void *)(v20[1] + 24) = v12;
        getVCPRequestRevisionPropertyKeySymbolLoc(void)::ptr = *(void *)(v20[1] + 24);
        v10 = (void *)v22[3];
      }
      _Block_object_dispose(&v21, 8);
      if (!v10)
      {
        dlerror();
        id result = (id)abort_report_np();
        __break(1u);
        return result;
      }
      [v7 setObject:&unk_1EF7A72C8 forKeyedSubscript:*v10];
      id v13 = v7;
      goto LABEL_12;
    }
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:v9];
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_11:
      id v13 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  id v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanHandPoseDetector;
  if ([(VNDetector *)&v15 completeInitializationForSession:v6 error:a4])
  {
    v7 = [(VNDetector *)self configurationOptions];
    v8 = [(VNHumanHandPoseDetector *)self vcpPoseRequestSetupOptionsForDetectorOptions:v7 error:a4];
    if (v8)
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2050000000;
      v9 = (void *)getVCPHandPoseImageRequestClass(void)::softClass;
      uint64_t v20 = getVCPHandPoseImageRequestClass(void)::softClass;
      if (!getVCPHandPoseImageRequestClass(void)::softClass)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = ___ZL31getVCPHandPoseImageRequestClassv_block_invoke;
        v16[3] = &unk_1E5B20220;
        v16[4] = &v17;
        ___ZL31getVCPHandPoseImageRequestClassv_block_invoke((uint64_t)v16);
        v9 = (void *)v18[3];
      }
      v10 = v9;
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
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to setup request in VNDetectHumanHandPoseRequest"];
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

+ (Class)recognizedPointsObservationClass
{
  return (Class)objc_opt_class();
}

@end