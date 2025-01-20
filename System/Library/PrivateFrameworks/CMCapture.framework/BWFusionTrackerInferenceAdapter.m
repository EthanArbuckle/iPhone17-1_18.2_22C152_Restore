@interface BWFusionTrackerInferenceAdapter
- (id)_inferenceProvidersForTrackingOperation:(void *)a3 meanPixelCalculator:(void *)a4 inputVideoRequirement:(void *)a5 inOutOrderBufferRequirement:(void *)a6 configuration:(void *)a7 resourceProvider:;
- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7;
@end

@implementation BWFusionTrackerInferenceAdapter

- (id)_inferenceProvidersForTrackingOperation:(void *)a3 meanPixelCalculator:(void *)a4 inputVideoRequirement:(void *)a5 inOutOrderBufferRequirement:(void *)a6 configuration:(void *)a7 resourceProvider:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  if (a5)
  {
    v12 = *a5;
    if (*a5) {
      v13 = 0;
    }
    else {
      v13 = a5;
    }
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  uint64_t v14 = [a7 espressoContextForExecutionTarget:3];
  v48 = v13;
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a2 == 3)
  {
    v16 = (void *)[(id)getFTTapToBoxClass() networkDescriptor];
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v16, "inputImages"), "objectAtIndexedSubscript:", 1);
  }
  else
  {
    if (a2 == 2)
    {
      v15 = (void *)[(id)getFTCinematicTrackerClass() highPriorityInstanceNetworkDescriptor];
    }
    else
    {
      if (a2 != 1)
      {
        v18 = 0;
        v16 = 0;
        goto LABEL_16;
      }
      v15 = (void *)[(id)getFTCinematicTrackerClass() highPriorityExemplarNetworkDescriptor];
    }
    v16 = v15;
    uint64_t v17 = [v15 onlyImageInput];
  }
  v18 = (void *)v17;
LABEL_16:
  v19 = -[BWInferenceFusionTrackerScalingProvider initWithInputRequirement:orderBufferRequirement:descriptor:resourceProvider:meanPixelCalculator:operation:]([BWInferenceFusionTrackerScalingProvider alloc], a4, v12, v18, a7, a3, a2);
  id v20 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", [v16 name], 1);
  v21 = [BWFusionTrackerEspressoInferenceProvider alloc];
  uint64_t v22 = [a6 priority];
  LODWORD(v45) = 0;
  v23 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v21, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 150, v20, 0, v14, 3, v22, [MEMORY[0x1E4F1CAD0] set], a7, v45, 1);
  [(BWFusionTrackerEspressoInferenceProvider *)v23 setOperation:a2];
  v47 = v19;
  v24 = objc_msgSend((id)objc_msgSend(v19, "outputVideoRequirements"), "firstObject");
  id v46 = -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v23, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", [v18 name], objc_msgSend(v24, "attachedMediaKey"), objc_msgSend(v24, "videoFormat"));
  uint64_t v50 = a2;
  if (a2 == 3)
  {
    v32 = objc_msgSend((id)objc_msgSend(v16, "inputImages"), "objectAtIndexedSubscript:", 0);
    v33 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    [v32 size];
    [(BWVideoFormatRequirements *)v33 setWidth:(unint64_t)v34];
    [v32 size];
    [(BWVideoFormatRequirements *)v33 setHeight:(unint64_t)v35];
    uint64_t v61 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v33, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1]);
    [(BWVideoFormatRequirements *)v33 setBytesPerRowAlignment:64];
    v60 = v33;
    -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v23, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", [v32 name], @"PrimaryFormat", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v60, 1)));
  }
  else if (a2 == 2)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v25 = (void *)[v16 inputReferences];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v56 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v31 = [v30 destinationInputName];
          uint64_t v62 = [v30 sourceOutputName];
          -[BWEspressoInferenceProvider bindEspressoInput:fromMetadataUsingKeys:](v23, "bindEspressoInput:fromMetadataUsingKeys:", v31, [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1]);
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v27);
    }
  }
  v36 = v23;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v38 = v16;
  v39 = (void *)[v16 outputNames];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v52 != v42) {
          objc_enumerationMutation(v39);
        }
        [v37 setObject:-[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v36, "bindEspressoOutput:asMetadataUsingKey:", *(void *)(*((void *)&v51 + 1) + 8 * j), objc_msgSend(NSString, "stringWithFormat:", @"BWInferenceFusionTrackerOutput_%@_%@", objc_msgSend(v38, "name"), *(void *)(*((void *)&v51 + 1) + 8 * j))), *(void *)(*((void *)&v51 + 1) + 8 * j) forKeyedSubscript];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v41);
  }
  if (v48) {
    *v48 = -[BWEspressoInferenceProvider bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:](v36, "bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:", v46, [NSString stringWithFormat:@"%@_OrderingClone", objc_msgSend(v46, "attachedMediaKey")]);
  }
  v44 = [[BWFusionTrackerInferencePropagator alloc] initWithInputVideoRequirement:v46 outputTensorRequirements:v37 operation:v50];

  [(BWEspressoInferenceProvider *)v36 setPropagatable:v44];
  [v49 addObject:v47];

  [v49 addObject:v36];
  return v49;
}

- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v42[0] = [(id)getFTTapToBoxClass() networkDescriptor];
  v42[1] = [(id)getFTCinematicTrackerClass() highPriorityExemplarNetworkDescriptor];
  v42[2] = [(id)getFTCinematicTrackerClass() highPriorityInstanceNetworkDescriptor];
  v8 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v39;
    unint64_t v14 = 0x7FFFFFFFLL;
    unint64_t v15 = 0x7FFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v17, "inputImages"), "count") == 1) {
          v18 = (void *)[v17 onlyImageInput];
        }
        else {
          v18 = objc_msgSend((id)objc_msgSend(v17, "inputImages"), "objectAtIndexedSubscript:", 0);
        }
        v19 = v18;
        [v18 size];
        if (v20 < (double)v15)
        {
          [v19 size];
          unint64_t v15 = (unint64_t)v21;
        }
        [v19 size];
        if (v22 < (double)v14)
        {
          [v19 size];
          unint64_t v14 = (unint64_t)v23;
        }
        [v19 size];
        if (v24 > (double)v11)
        {
          [v19 size];
          unint64_t v11 = (unint64_t)v25;
        }
        [v19 size];
        if (v26 > (double)v12)
        {
          [v19 size];
          unint64_t v12 = (unint64_t)v27;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v14 = 0x7FFFFFFFLL;
    unint64_t v15 = 0x7FFFFFFFLL;
  }
  uint64_t v28 = [BWInferenceLazyVideoRequirement alloc];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __107__BWFusionTrackerInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke;
  v37[3] = &__block_descriptor_48_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
  v37[4] = 4 * v15;
  v37[5] = 4 * v14;
  v29 = [(BWInferenceLazyVideoRequirement *)v28 initWithAttachedMediaKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v37];
  v30 = -[BWInferenceFusionTrackerMeanPixelCalculator initWithCommandQueue:]([BWInferenceFusionTrackerMeanPixelCalculator alloc], "initWithCommandQueue:", objc_msgSend((id)objc_msgSend(a6, "defaultDeviceMetalContext"), "commandQueue"));
  v36 = 0;
  objc_msgSend(v34, "addObjectsFromArray:", -[BWFusionTrackerInferenceAdapter _inferenceProvidersForTrackingOperation:meanPixelCalculator:inputVideoRequirement:inOutOrderBufferRequirement:configuration:resourceProvider:](self, 3, 0, v29, &v36, a5, a6));
  objc_msgSend(v34, "addObjectsFromArray:", -[BWFusionTrackerInferenceAdapter _inferenceProvidersForTrackingOperation:meanPixelCalculator:inputVideoRequirement:inOutOrderBufferRequirement:configuration:resourceProvider:](self, 1, v30, v29, &v36, a5, a6));
  objc_msgSend(v34, "addObjectsFromArray:", -[BWFusionTrackerInferenceAdapter _inferenceProvidersForTrackingOperation:meanPixelCalculator:inputVideoRequirement:inOutOrderBufferRequirement:configuration:resourceProvider:](self, 2, v30, v29, 0, a5, a6));

  *a7 = 0;
  return v34;
}

id __107__BWFusionTrackerInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = [[BWInferenceVideoFormatRequirements alloc] initWithFormat:a2];
  float v5 = (float)(unint64_t)[a2 width] / (float)*(unint64_t *)(a1 + 32);
  unint64_t v6 = [a2 height];
  unint64_t v7 = *(void *)(a1 + 40);
  if (v5 <= (float)((float)v6 / (float)v7)) {
    float v5 = (float)v6 / (float)v7;
  }
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", vcvtps_u32_f32((float)(unint64_t)[a2 width] / v5));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", vcvtps_u32_f32((float)(unint64_t)[a2 height] / v5));
  [(BWVideoFormatRequirements *)v4 setSupportedColorSpaceProperties:&unk_1EFB03170];
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB03188];
  [(BWInferenceVideoFormatRequirements *)v4 setIncludesInvalidContent:0];
  v9[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);
}

@end