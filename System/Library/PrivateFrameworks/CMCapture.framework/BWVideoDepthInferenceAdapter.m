@interface BWVideoDepthInferenceAdapter
+ (void)initialize;
- (BWVideoDepthInferenceAdapter)init;
- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7;
- (void)dealloc;
@end

@implementation BWVideoDepthInferenceAdapter

id __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v3 setBytesPerRowAlignment:64];
  v6[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a2, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
  -[BWInferenceVideoFormatRequirements setRotationDegrees:](v3, "setRotationDegrees:", [a2 rotationDegrees]);
  v5 = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:1]);
}

- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v10 = *(void *)&a4.var0;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  int v112 = 0;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = (void *)v12;
  if (a3 == 109)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v48 = a5;
    }
    else {
      id v48 = 0;
    }
    id v49 = [objc_alloc_init(BWEspressoInferenceAdapter) inferenceProviderForType:109 version:v10 & 0xFFFFFFFFFFFFLL configuration:v48 resourceProvider:a6 status:&v112];
    if (!v49 || v112)
    {
LABEL_105:
      fig_log_get_emitter();
      goto LABEL_96;
    }
    v50 = v49;
    id v93 = a6;
    v94 = v13;
    if ((unint64_t)[v48 concurrencyWidth] >= 2)
    {
      v51 = -[BWVideoDepthSampleBufferPropagator initWithVideoRequirements:cloneRequirements:]([BWVideoDepthSampleBufferPropagator alloc], "initWithVideoRequirements:cloneRequirements:", [v50 outputVideoRequirements], objc_msgSend(v50, "cloneVideoRequirements"));
      [v50 setPropagatable:v51];
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    v52 = (void *)[v50 inputVideoRequirements];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v96 objects:v120 count:16];
    if (!v53) {
      goto LABEL_99;
    }
    uint64_t v54 = v53;
    v91 = a7;
    v55 = 0;
    v56 = 0;
    uint64_t v57 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v97 != v57) {
          objc_enumerationMutation(v52);
        }
        v59 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v59, "attachedMediaKey"), "isEqualToString:", 0x1EFA6A520)) {
          v55 = v59;
        }
        if (objc_msgSend((id)objc_msgSend(v59, "attachedMediaKey"), "isEqualToString:", 0x1EFA6A600)) {
          v56 = v59;
        }
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v96 objects:v120 count:16];
    }
    while (v54);
    a7 = v91;
    if (!v55 || !v56) {
      goto LABEL_99;
    }
    [v94 addObject:v50];
    v88 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1EFA6A540, [v55 videoFormat]);
    v60 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v60, "setWidth:", (int)[v48 outputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v60, "setHeight:", [v48 outputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v60 setBytesPerRowAlignment:64];
    uint64_t v119 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v55, "videoFormat"), "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v60, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1]);
    v118 = v60;
    id v61 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1]);
    v62 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v62, "setWidth:", objc_msgSend((id)objc_msgSend(v56, "videoFormat"), "width"));
    -[BWVideoFormatRequirements setHeight:](v62, "setHeight:", objc_msgSend((id)objc_msgSend(v56, "videoFormat"), "height"));
    [(BWVideoFormatRequirements *)v62 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v62 setSupportedPixelFormats:&unk_1EFB040D0];
    v117 = v62;
    id v63 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1]);
    v64 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v64, "setWidth:", (int)[v48 outputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v64, "setHeight:", [v48 outputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v64 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v64 setSupportedPixelFormats:&unk_1EFB040E8];
    v116 = v64;
    id v65 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1]);
    v66 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:0x1EFA6A460 videoFormat:v63];
    v67 = [v48 requiresAppleDepthPostProcessing] ? @"UnscaledDepth" : @"Depth";
    v68 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:v67 videoFormat:v61];
    v69 = objc_autorelease(-[BWDisparityPostProcessingInferenceProvider initWithDisparityInputRequirement:displacementInputRequirement:stateInputRequirement:stateOutputRequirement:disparityOutputRequirement:portType:resourceProvider:configuration:]([BWDisparityPostProcessingInferenceProvider alloc], "initWithDisparityInputRequirement:displacementInputRequirement:stateInputRequirement:stateOutputRequirement:disparityOutputRequirement:portType:resourceProvider:configuration:", v88, v66, objc_autorelease([[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:0x1EFA6A560 videoFormat:v65]), objc_autorelease([[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:0x1EFA6A580 videoFormat:v65]), v68,
              [v48 portType],
              v93,
              v48));
    if (!v69)
    {
LABEL_99:
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_100;
    }
    v13 = v94;
    [v94 addObject:v69];
    if ([v48 requiresAppleDepthPostProcessing])
    {
      v70 = [[BWDisparityFilteringInferenceProvider alloc] initWithDisparityInputRequirement:v68 disparityOutputRequirement:[[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:@"Depth" videoFormat:v61] resourceProvider:v93 configuration:v48 isPreprocessing:0];
      if (!v70)
      {
LABEL_112:
        fig_log_get_emitter();
        goto LABEL_96;
      }
      [v94 addObject:v70];
    }
    v47 = [[BWDisparityFilteringInferenceProvider alloc] initWithDisparityInputRequirement:[[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:0x1EFA6A4A0 preparedByAttachedMediaKey:0x1EFA6A4A0 videoFormatProvider:&__block_literal_global_127] disparityOutputRequirement:v55 resourceProvider:v93 configuration:v48 isPreprocessing:1];
    if (v47) {
      goto LABEL_75;
    }
    goto LABEL_112;
  }
  if (a3 == 117)
  {
    v94 = (void *)v12;
    v90 = a7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v71 = a5;
    }
    else {
      id v71 = 0;
    }
    v72 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v72, "setWidth:", (int)[v71 inputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v72, "setHeight:", [v71 inputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v72 setSupportedColorSpaceProperties:&unk_1EFB04100];
    [(BWVideoFormatRequirements *)v72 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v72 setSupportedPixelFormats:&unk_1EFB04118];
    -[BWInferenceVideoFormatRequirements setRotationDegrees:](v72, "setRotationDegrees:", [v71 inputRotationAngle]);
    if ([v71 cropColorInputToPrimaryCaptureRect]) {
      [(BWInferenceVideoFormatRequirements *)v72 setCropDescriptor:objc_alloc_init(BWInferencePrimaryCaptureRectDescriptor)];
    }
    v115 = v72;
    v73 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", @"PrimaryFormat", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1]));
    uint64_t v74 = [v71 forceIntermediateDimensions];
    uint64_t v75 = [v71 inputDimensions];
    if ((int)v74 >= (int)v75
      && SHIDWORD(v74) >= SHIDWORD(v75)
      && ((int)v74 > (int)v75 || SHIDWORD(v74) > SHIDWORD(v75)))
    {
      v76 = [BWInferenceLazyVideoRequirement alloc];
      uint64_t v77 = [v71 concurrencyWidth];
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke_142;
      v95[3] = &__block_descriptor_40_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
      v95[4] = v74;
      v78 = [(BWInferenceLazyVideoRequirement *)v76 initWithAttachedMediaKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" count:v77 videoFormatProvider:v95];
      v79 = [BWInferenceVideoScalingProvider alloc];
      v114 = v73;
      v80 = -[BWInferenceVideoScalingProvider initWithInputRequirement:derivedFromRequirement:outputRequirements:enableFencing:](v79, "initWithInputRequirement:derivedFromRequirement:outputRequirements:enableFencing:", v78, 0, [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1], 1);
      [v94 addObject:v80];
    }
    v81 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v81, "setWidth:", (int)[v71 inputDimensions]);
    -[BWVideoFormatRequirements setHeight:](v81, "setHeight:", [v71 inputDimensions] >> 32);
    [(BWVideoFormatRequirements *)v81 setBytesPerRowAlignment:64];
    [(BWVideoFormatRequirements *)v81 setSupportedPixelFormats:&unk_1EFB04160];
    v113 = v81;
    v82 = -[BWOpticalFlowInferenceProvider initWithInputRequirement:outputRequirement:portType:resourceProvider:configuration:]([BWOpticalFlowInferenceProvider alloc], "initWithInputRequirement:outputRequirement:portType:resourceProvider:configuration:", v73, -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1EFA6A460, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1])), objc_msgSend(v71, "portType"), a6, v71);
    if (!v82)
    {
      fig_log_get_emitter();
LABEL_111:
      FigDebugAssert3();
      a7 = v90;
LABEL_100:
      v13 = v94;
      if (!a7) {
        return v13;
      }
      goto LABEL_97;
    }
    v83 = v82;
    v13 = v94;
    if ([v71 attachedMediaKeyForPropagatedColorInput]) {
      -[BWOpticalFlowInferenceProvider bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:](v83, "bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:", v73, [v71 attachedMediaKeyForPropagatedColorInput]);
    }
    [v94 addObject:v83];
LABEL_91:
    a7 = v90;
    if (!v90) {
      return v13;
    }
    goto LABEL_97;
  }
  if (a3 != 111)
  {
    int v112 = -31710;
    if (!a7) {
      return v13;
    }
    goto LABEL_97;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = a5;
  }
  else {
    id v14 = 0;
  }
  id v15 = [objc_alloc_init(BWEspressoInferenceAdapter) inferenceProviderForType:111 version:v10 & 0xFFFFFFFFFFFFLL configuration:a5 resourceProvider:a6 status:&v112];
  if (!v15 || v112) {
    goto LABEL_105;
  }
  v16 = v15;
  if ((unint64_t)[v14 concurrencyWidth] >= 2)
  {
    v17 = -[BWVideoDepthSampleBufferPropagator initWithVideoRequirements:cloneRequirements:]([BWVideoDepthSampleBufferPropagator alloc], "initWithVideoRequirements:cloneRequirements:", [v16 outputVideoRequirements], objc_msgSend(v16, "cloneVideoRequirements"));
    [v16 setPropagatable:v17];
  }
  [v13 addObject:v16];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  v18 = (void *)[v16 inputVideoRequirements];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v108 objects:v123 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v89 = v14;
    id v92 = a6;
    v94 = v13;
    v90 = a7;
    v21 = 0;
    v22 = 0;
    uint64_t v23 = *(void *)v109;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v109 != v23) {
          objc_enumerationMutation(v18);
        }
        v25 = *(void **)(*((void *)&v108 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(v25, "attachedMediaKey"), "isEqualToString:", @"refInput"))v22 = v25; {
        if (objc_msgSend((id)objc_msgSend(v25, "attachedMediaKey"), "isEqualToString:", @"auxInput"))v21 = v25;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v108 objects:v123 count:16];
    }
    while (v20);
    a7 = v90;
    v13 = v94;
    if (v22)
    {
      if (v21)
      {
        v26 = objc_msgSend((id)objc_msgSend(v16, "outputVideoRequirements"), "firstObject");
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        v27 = (void *)[v16 outputVideoRequirements];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v104 objects:v122 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v105;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v105 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v104 + 1) + 8 * k);
              if (objc_msgSend((id)objc_msgSend(v32, "attachedMediaKey"), "isEqualToString:", @"espressoOutput"))v26 = v32; {
            }
              }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v104 objects:v122 count:16];
          }
          while (v29);
        }
        if (v26)
        {
          [v89 inputDimensions];
          [v89 inputDimensions];
          objc_msgSend((id)objc_msgSend(v22, "videoFormat"), "width");
          objc_msgSend((id)objc_msgSend(v22, "videoFormat"), "height");
          v100[0] = MEMORY[0x1E4F143A8];
          v100[1] = 3221225472;
          v101 = __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke;
          v102 = &unk_1E5C2ADE0;
          v103 = v89;
          v33 = __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke((uint64_t)v100, 2304, 1296, 4, 1111970369, @"PrimaryFormat", (uint64_t)&unk_1EFB040A0);
          uint64_t v87 = (uint64_t)v101((uint64_t)v100, 2304, 1296, 4, 1111970369, @"SynchronizedSlaveFrame", (uint64_t)&unk_1EFB040A0);
          uint64_t v86 = (uint64_t)v101((uint64_t)v100, 2304, 1296, 4, 875704438, @"PrimaryFormat", (uint64_t)&unk_1EFB040A0);
          uint64_t v85 = (uint64_t)v101((uint64_t)v100, 2304, 1296, 4, 875704438, @"SynchronizedSlaveFrame", (uint64_t)&unk_1EFB040A0);
          int v34 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)v33 videoFormat] width];
          if (v34 >= 0) {
            int v35 = v34;
          }
          else {
            int v35 = v34 + 1;
          }
          int v36 = v35 >> 1;
          int v37 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)v33 videoFormat] height];
          if (v37 >= 0) {
            int v38 = v37;
          }
          else {
            int v38 = v37 + 1;
          }
          int v39 = v38 >> 1;
          v40 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          double v41 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v22, "videoFormat"), "width");
          double v42 = (double)v36;
          if (v41 > (double)v36) {
            double v42 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v22, "videoFormat", v42, v41), "width");
          }
          [(BWVideoFormatRequirements *)v40 setWidth:(int)v42];
          double v43 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v22, "videoFormat"), "height");
          double v44 = (double)v39;
          if (v43 > (double)v39) {
            double v44 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v22, "videoFormat", v44, v43), "height");
          }
          [(BWVideoFormatRequirements *)v40 setHeight:(int)v44];
          [(BWVideoFormatRequirements *)v40 setBytesPerRowAlignment:64];
          [(BWVideoFormatRequirements *)v40 setSupportedPixelFormats:&unk_1EFB040B8];
          v121 = v40;
          id v45 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1]);
          v46 = objc_autorelease(-[BWRectificationInferenceProvider initWithRefInputRequirement:auxInputRequirement:refKeypointsInputRequirement:auxKeypointsInputRequirement:refOutputRequirement:auxOutputRequirement:opticalFlowOutputRequirement:originalRefRequirement:originalAuxRequirement:resourceProvider:configuration:]([BWRectificationInferenceProvider alloc], "initWithRefInputRequirement:auxInputRequirement:refKeypointsInputRequirement:auxKeypointsInputRequirement:refOutputRequirement:auxOutputRequirement:opticalFlowOutputRequirement:originalRefRequirement:originalAuxRequirement:resourceProvider:configuration:", v33, v87, v86, v85, v22, v21, objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", 0x1EFA6A500, v45, [v89 concurrencyWidth])), objc_autorelease(
                      [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:&__block_literal_global_89]), [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:@"SynchronizedSlaveFrame" preparedByAttachedMediaKey:@"SynchronizedSlaveFrame" videoFormatProvider:&__block_literal_global_89], v92, v89));
          if (v46)
          {
            v13 = v94;
            [v94 addObject:v46];
            v47 = objc_autorelease(-[BWDerectificationInferenceProvider initWithInputRequirement:opticalFlowInputRequirement:outputRequirement:resourceProvider:configuration:]([BWDerectificationInferenceProvider alloc], "initWithInputRequirement:opticalFlowInputRequirement:outputRequirement:resourceProvider:configuration:", objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", @"espressoOutput", [v26 videoFormat], objc_msgSend(v89, "concurrencyWidth"))), objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", 0x1EFA6A500, v45, objc_msgSend(v89, "concurrencyWidth"))), objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](
                          [BWInferenceVideoRequirement alloc],
                          "initWithAttachedMediaKey:videoFormat:",
                          @"Depth",
                          [v26 videoFormat])),
                      v92,
                      v89));
            a7 = v90;
            if (!v47)
            {
              fig_log_get_emitter();
              goto LABEL_96;
            }
LABEL_75:
            [v13 addObject:v47];
            if (!a7) {
              return v13;
            }
            goto LABEL_97;
          }
          fig_log_get_emitter();
          goto LABEL_111;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_91;
      }
    }
  }
  fig_log_get_emitter();
LABEL_96:
  FigDebugAssert3();
  if (a7) {
LABEL_97:
  }
    *a7 = v112;
  return v13;
}

- (BWVideoDepthInferenceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoDepthInferenceAdapter;
  return [(BWVideoDepthInferenceAdapter *)&v3 init];
}

+ (void)initialize
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWVideoDepthInferenceAdapter;
  [(BWVideoDepthInferenceAdapter *)&v2 dealloc];
}

BWInferenceVideoRequirement *__104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v14 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v14 setWidth:a2 / a4];
  [(BWVideoFormatRequirements *)v14 setHeight:a3 / a4];
  [(BWVideoFormatRequirements *)v14 setBytesPerRowAlignment:64];
  v17[0] = [NSNumber numberWithUnsignedInt:a5];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1]);
  [(BWVideoFormatRequirements *)v14 setSupportedColorSpaceProperties:a7];
  v16 = v14;
  return -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", a6, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1]), objc_msgSend(*(id *)(a1 + 32), "concurrencyWidth"));
}

uint64_t __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke_101(uint64_t a1, uint64_t a2)
{
  return a2;
}

id __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke_142(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = [[BWInferenceVideoFormatRequirements alloc] initWithFormat:a2];
  unint64_t v5 = *(int *)(a1 + 32);
  if ([a2 width] <= v5) {
    uint64_t v6 = [a2 width];
  }
  else {
    uint64_t v6 = *(int *)(a1 + 32);
  }
  [(BWVideoFormatRequirements *)v4 setWidth:v6];
  unint64_t v7 = *(int *)(a1 + 36);
  if ([a2 height] <= v7) {
    uint64_t v8 = [a2 height];
  }
  else {
    uint64_t v8 = *(int *)(a1 + 36);
  }
  [(BWVideoFormatRequirements *)v4 setHeight:v8];
  [(BWVideoFormatRequirements *)v4 setSupportedColorSpaceProperties:&unk_1EFB04130];
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB04148];
  [(BWInferenceVideoFormatRequirements *)v4 setIncludesInvalidContent:0];
  v10[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1]);
}

@end