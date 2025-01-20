@interface VNSmartCam5CompoundRequest
+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)groupingConfiguration;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
@end

@implementation VNSmartCam5CompoundRequest

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__VNSmartCam5CompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
  aBlock[3] = &unk_1E5B1E258;
  id v33 = v5;
  id v46 = v33;
  v35 = (void (**)(void *, id, uint64_t))_Block_copy(aBlock);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v32;
  uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v10 = [v9 frameworkClass];
        if (v10 == objc_opt_class())
        {
          id v14 = v9;
          v12 = v35[2](v35, v14, [v14 imageCropAndScaleOption]);
          v15 = [v14 specifier];
          [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_GatingOriginatingRequestSpecifier" value:v15];

          v13 = [v14 documentElements];
          if ([v13 recognize])
          {
            [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingEnabled" value:MEMORY[0x1E4F1CC38]];
            v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "generateSegmentationMask"));
            [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingGenerateSegmentationMask" value:v16];
          }
          v17 = [v14 textElements];
          if ([v17 recognize])
          {
            [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingEnabled" value:MEMORY[0x1E4F1CC38]];
            v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v17, "generateSegmentationMask"));
            [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingGenerateSegmentationMask" value:v18];
          }
          v19 = [v14 machineReadableCodeElements];
          if ([v19 recognize])
          {
            [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingEnabled" value:MEMORY[0x1E4F1CC38]];
            v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "generateSegmentationMask"));
            [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingGenerateSegmentationMask" value:v20];
          }
          goto LABEL_17;
        }
        if (v10 == objc_opt_class() && [v9 resolvedRevision] == 3737841665)
        {
          id v11 = v9;
          v12 = v35[2](v35, v11, [v11 imageCropAndScaleOption]);
          [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationEnabled" value:MEMORY[0x1E4F1CC38]];
          v13 = [v11 specifier];
          [v12 setDetectorConfigurationOption:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationOriginatingRequestSpecifier" value:v13];
LABEL_17:

          continue;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v6);
  }

  if ([v33 count])
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v22 = [v33 allValues];
    id v34 = v22;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v34);
          }
          v26 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          v27 = [VNSmartCam5CompoundRequest alloc];
          id v28 = v26;
          v29 = v28;
          if (v27)
          {
            v30 = [v28 originalRequests];
            v47.receiver = v27;
            v47.super_class = (Class)VNSmartCam5CompoundRequest;
            v27 = objc_msgSendSuper2(&v47, sel_initWithOriginalRequests_, v30);

            if (v27) {
              objc_storeStrong((id *)&v27->_groupingConfiguration, v26);
            }
          }

          [v21 addObject:v27];
        }
        v22 = v34;
        uint64_t v23 = [v34 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }
      while (v23);
    }
  }
  else
  {
    id v21 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

- (void).cxx_destruct
{
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  v8 = [v37 session];
  id v42 = 0;
  v36 = v8;
  v9 = [(VNRequest *)self applicableDetectorAndOptions:&v42 forRevision:a3 loadedInSession:v8 error:a5];
  id v33 = v42;
  if (v9)
  {
    v35 = v9;
    uint64_t v10 = [v37 imageBufferAndReturnError:a5];
    v31 = (void *)v10;
    if (v10)
    {
      v44[0] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
      [v33 setObject:v11 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      v12 = NSNumber;
      if (self) {
        unint64_t v13 = [(VNSmartCam5CompoundRequestGroupingConfiguration *)self->_groupingConfiguration imageCropAndScaleOption];
      }
      else {
        unint64_t v13 = 0;
      }
      id v14 = [v12 numberWithUnsignedInteger:v13];
      [v33 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v33 setObject:v15 forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationObservationsArray"];
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend(v33, "setObject:forKeyedSubscript:");
      uint64_t v16 = [v37 qosClass];
      [(VNCompoundRequest *)self regionOfInterest];
      v17 = objc_msgSend(v9, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v16, v33, self, a5, 0);
      BOOL v32 = v17 != 0;
      if (v17)
      {
        v29 = v17;
        -[VNRequest setResults:](self, "setResults:");
        [(VNCompoundRequest *)self recordWarningsInOriginalRequests];
        -[VNSmartCam5CompoundRequest groupingConfiguration]((id *)&self->super.super.super.isa);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v30 = long long v41 = 0u;
        v18 = [v30 originalRequests];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v39 != v20) {
                objc_enumerationMutation(v18);
              }
              v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              uint64_t v23 = [v22 frameworkClass];
              uint64_t v24 = objc_opt_class();
              v25 = v15;
              if (v23 == v24 || (uint64_t v26 = objc_opt_class(), v25 = v34, v23 == v26)) {
                id v27 = v25;
              }
              else {
                id v27 = 0;
              }
              [v22 setResults:v27];
              [v37 cacheObservationsOfRequest:v22];

              v9 = v35;
              v8 = v36;
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v19);
        }

        v17 = v29;
      }
    }
    else
    {
      BOOL v32 = 0;
    }
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (id)groupingConfiguration
{
  if (a1)
  {
    a1 = (id *)a1[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNSmartCam5CompoundRequest;
  id v5 = [(VNRequest *)&v9 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  uint64_t v6 = -[VNSmartCam5CompoundRequest groupingConfiguration]((id *)&self->super.super.super.isa);
  uint64_t v7 = [v6 detectorConfigurationOptions];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = @"VNSmartCam5GatingDetectorType";
  return @"VNSmartCam5GatingDetectorType";
}

VNSmartCam5CompoundRequestGroupingConfiguration *__94__VNSmartCam5CompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v7 = [[VNSmartCam5CompoundRequestGroupingConfiguration alloc] initWithImageCropAndScaleOption:a3];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  [(VNSmartCam5CompoundRequestGroupingConfiguration *)v7 addOriginalRequest:v5];

  return v7;
}

@end