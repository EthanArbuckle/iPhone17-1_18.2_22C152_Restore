@interface VNImageAnalyzerCompoundRequestGroupingConfigurations
- (VNImageAnalyzerCompoundRequestGroupingConfigurations)initWithDetectorModel:(unint64_t)a3;
- (unint64_t)detectorModel;
- (void)groupingConfigurationForRequest:(uint64_t)a3 kind:;
@end

@implementation VNImageAnalyzerCompoundRequestGroupingConfigurations

- (void).cxx_destruct
{
}

- (VNImageAnalyzerCompoundRequestGroupingConfigurations)initWithDetectorModel:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VNImageAnalyzerCompoundRequestGroupingConfigurations;
  v4 = [(VNImageAnalyzerCompoundRequestGroupingConfigurations *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_detectorModel = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupingConfigurations = v5->_groupingConfigurations;
    v5->_groupingConfigurations = v6;
  }
  return v5;
}

- (unint64_t)detectorModel
{
  return self->_detectorModel;
}

- (void)groupingConfigurationForRequest:(uint64_t)a3 kind:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    [v5 regionOfInterest];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v15 = [v6 frameworkClass];
    uint64_t v16 = [v6 resolvedRevision];
    unint64_t v17 = +[VNImageAnalyzerMultiDetector modelForRequestClass:v15 revision:v16];
    id v37 = 0;
    v18 = (void *)[v6 applicableDetectorClassAndOptions:&v37 forRevision:v16 error:0];
    id v19 = v37;
    +[VNError VNAssert:v18 != 0 log:@"detector class could not be resolved"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = ((uint64_t (*)(void *, char *))[v6 methodForSelector:sel_imageCropAndScaleOption])(v6, sel_imageCropAndScaleOption);
    }
    else {
      uint64_t v20 = 2;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 useImageAnalyzerScaling]) {
        uint64_t v21 = 73;
      }
      else {
        uint64_t v21 = 86;
      }
    }
    else
    {
      uint64_t v21 = 86;
    }
    v22 = [v18 computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v19 error:0];
    +[VNError VNAssert:v22 != 0 log:@"main stage compute device could not be resolved"];
    v23 = (void *)[[NSString alloc] initWithFormat:@"[%g,%g,%g,%g]:%@:%u:%u:%c", v8, v10, v12, v14, v22, v17, v20, v21];
    v24 = [*(id *)(a1 + 8) objectForKeyedSubscript:v23];
    if (!v24)
    {
      v25 = [VNImageAnalyzerCompoundRequestGroupingConfiguration alloc];
      if (v25)
      {
        uint64_t v26 = *(void *)(a1 + 16);
        v38.receiver = v25;
        v38.super_class = (Class)VNImageAnalyzerCompoundRequestGroupingConfiguration;
        v27 = objc_msgSendSuper2(&v38, sel_init);
        v24 = v27;
        if (v27)
        {
          v27[5] = v26;
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v29 = (void *)v24[1];
          v24[1] = v28;

          id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v31 = (void *)v24[2];
          v24[2] = v30;

          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v33 = (void *)v24[3];
          v24[3] = v32;

          id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v35 = (void *)v24[4];
          v24[4] = v34;
        }
      }
      else
      {
        v24 = 0;
      }
      [*(id *)(a1 + 8) setObject:v24 forKeyedSubscript:v23];
    }
    [v24 addOriginalRequest:v6 forKind:a3];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end