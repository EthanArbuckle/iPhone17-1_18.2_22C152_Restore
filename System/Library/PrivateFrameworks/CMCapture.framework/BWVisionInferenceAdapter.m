@interface BWVisionInferenceAdapter
+ (void)initialize;
- (BWVisionInferenceAdapter)init;
- (VNProcessingDevice)applicationProcessingDevice;
- (VNProcessingDevice)espressoBasedRequestProcessingDevice;
- (VNProcessingDevice)graphicsProcessingDevice;
- (VNProcessingDevice)neuralProcessingDevice;
- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7;
- (void)dealloc;
@end

@implementation BWVisionInferenceAdapter

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_4(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB02A80];
  [(BWVideoFormatRequirements *)v4 setSupportedColorSpaceProperties:&unk_1EFB02A98];
  [(BWVideoFormatRequirements *)v4 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v4 setDeviceOriented:0];
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v4, "setIncludesInvalidContent:", [*(id *)(a1 + 32) includesInvalidContent]);
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
}

- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v10 = *(void *)&a4.var0;
  v87[2] = *MEMORY[0x1E4F143B8];
  unint64_t v13 = [+[BWMemoryPool sharedMemoryPool] poolIdentifier];
  if (a3 == 803)
  {
    v18 = (void *)[MEMORY[0x1E4F1CA48] array];
    objc_opt_class();
    id v19 = a5;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v19 = +[BWPhotosCurationInferenceConfiguration configuration];
    }
    id v20 = objc_alloc_init((Class)getVNClassifyImageAestheticsRequestClass());
    if (!v20) {
      goto LABEL_128;
    }
    v21 = v20;
    id v80 = a6;
    objc_msgSend(v20, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    [v21 setIoSurfaceMemoryPoolId:v13];
    [v18 addObject:v21];
    id v22 = objc_alloc_init((Class)getVNGenerateAttentionBasedSaliencyImageRequestClass());
    if (!v22) {
      goto LABEL_128;
    }
    v23 = v22;
    v77 = a7;
    objc_msgSend(v22, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    [v23 setIoSurfaceMemoryPoolId:v13];
    [v18 addObject:v23];
    id v24 = objc_alloc_init((Class)getVNClassifyJunkImageRequestClass());
    if (!v24) {
      goto LABEL_127;
    }
    v25 = v24;
    objc_msgSend(v24, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    [v25 setIoSurfaceMemoryPoolId:v13];
    [v18 addObject:v25];
    id v26 = objc_alloc_init((Class)getVNCreateSceneprintRequestClass());
    if (!v26) {
      goto LABEL_127;
    }
    v27 = v26;
    id v75 = a5;
    [v26 setReturnAllResults:1];
    objc_msgSend(v27, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    unint64_t v28 = v13;
    [v27 setIoSurfaceMemoryPoolId:v13];
    [v18 addObject:v27];
    uint64_t v29 = (unsigned __int16)v10;
    if ((unsigned __int16)v10 == 1)
    {
      id v30 = objc_alloc_init((Class)getVNCreateSceneprintRequestClass());
      if (!v30) {
        goto LABEL_127;
      }
      v31 = v30;
      objc_msgSend(v30, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
      [v31 setIoSurfaceMemoryPoolId:v28];
      [v18 addObject:v31];
    }
    else
    {
      v31 = 0;
    }
    v74 = v19;
    if ((int)[v19 semanticDevelopmentVersion] < 1)
    {
      v41 = 0;
    }
    else
    {
      id v40 = objc_alloc_init((Class)getVN5kJNH3eYuyaLxNpZr5Z7ziClass());
      if (!v40) {
        goto LABEL_127;
      }
      v41 = v40;
      objc_msgSend(v40, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
      [v41 setIoSurfaceMemoryPoolId:v28];
      [v18 addObject:v41];
    }
    if (v29 == 1)
    {
      uint64_t v86 = 0;
      if (![v21 setRevision:3737841664 error:&v86]
        || ![v23 setRevision:3737841664 error:&v86]
        || ![v27 setRevision:3737841667 error:&v86]
        || ![v31 setRevision:3737841668 error:&v86]
        || ![v25 setRevision:3737841664 error:&v86])
      {
        goto LABEL_127;
      }
      if ((int)[v74 semanticDevelopmentVersion] < 1) {
        goto LABEL_46;
      }
      v42 = v41;
      uint64_t v43 = 3737841664;
    }
    else
    {
      uint64_t v86 = 0;
      if (![v21 setRevision:3737841668 error:&v86]
        || ![v23 setRevision:3737841668 error:&v86]
        || ![v27 setRevision:3737841672 error:&v86]
        || ![v25 setRevision:3737841670 error:&v86])
      {
        goto LABEL_127;
      }
      if ((int)[v74 semanticDevelopmentVersion] < 1) {
        goto LABEL_46;
      }
      uint64_t v43 = 3737841668;
      v42 = v41;
    }
    if (([v42 setRevision:v43 error:&v86] & 1) == 0) {
      goto LABEL_127;
    }
LABEL_46:
    v39 = -[BWVisionInferenceProvider initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:]([BWVisionInferenceProvider alloc], "initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:", v75, v18, 0, 3, [MEMORY[0x1E4F1CAD0] set], v80);
    [(BWVisionInferenceProvider *)v39 bindIdealInputForRequest:v27 fromAttachedMediaUsingKey:@"PrimaryFormat"];
    [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v21 asMetadataUsingKey:@"VisionAestheticsObservation"];
    [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v23 asMetadataUsingKey:@"VisionImageSaliencyObservation"];
    [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v27 asMetadataUsingKey:@"VisionScenePrintObservation"];
    [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v31 asMetadataUsingKey:@"VisionPCAPrintObservation"];
    [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v25 asMetadataUsingKey:@"VisionJunkImageClassificationObservation"];
    [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v41 asMetadataUsingKey:0x1EFA6A180];
    int v44 = 0;
    goto LABEL_47;
  }
  if (a3 != 802)
  {
    if (a3 != 801)
    {
      v39 = 0;
      goto LABEL_124;
    }
    if ((v10 & 0xFFFFFFFF0000) != 0) {
      goto LABEL_65;
    }
    if ([a5 inferenceType] != 801) {
      a5 = +[BWLandmarksInferenceConfiguration configuration];
    }
    int v79 = [a5 constellationPointCount];
    unint64_t v14 = v13;
    int v15 = 0;
    uint64_t v16 = (unsigned __int16)v10;
    uint64_t v17 = (unsigned __int16)v10;
    switch((__int16)v10)
    {
      case 1:
        break;
      case 2:
        int v15 = 0;
        uint64_t v16 = 2;
        uint64_t v17 = 2;
        break;
      case 3:
        int v15 = 1;
        uint64_t v16 = 2;
        uint64_t v17 = 3737841664;
        break;
      case 4:
        int v15 = 0;
        uint64_t v16 = 3;
        uint64_t v17 = 3;
        break;
      default:
        goto LABEL_65;
    }
    id v49 = objc_alloc_init((Class)getVNDetectFaceRectanglesRequestClass());
    objc_msgSend(v49, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    [v49 setModelFileBackingStore:2];
    [v49 setIoSurfaceMemoryPoolId:v14];
    if (v15)
    {
      uint64_t v86 = 0;
      if (([v49 setRevision:3737841664 error:&v86] & 1) == 0) {
        goto LABEL_65;
      }
    }
    else
    {
      [v49 setRevision:v17];
    }
    if (v49)
    {
      id v50 = objc_alloc_init((Class)getVNDetectFaceLandmarksRequestClass());
      v51 = (v10 & 0xFFFE) != 0
          ? [(BWVisionInferenceAdapter *)self espressoBasedRequestProcessingDevice]: [(BWVisionInferenceAdapter *)self applicationProcessingDevice];
      [v50 setProcessingDevice:v51];
      [v50 setModelFileBackingStore:2];
      [v50 setRevision:v16];
      [v50 setIoSurfaceMemoryPoolId:v14];
      objc_msgSend(v50, "setRefineMouthRegion:", objc_msgSend(a5, "refinesMouthLandmarks"));
      objc_msgSend(v50, "setRefineLeftEyeRegion:", objc_msgSend(a5, "refinesLeftEyeLandmarks"));
      objc_msgSend(v50, "setRefineRightEyeRegion:", objc_msgSend(a5, "refinesRightEyeLandmarks"));
      objc_msgSend(v50, "setPerformBlinkDetection:", objc_msgSend(a5, "detectsBlinking"));
      objc_msgSend(v50, "setCascadeStepCount:", objc_msgSend(a5, "cascadeStepCount"));
      uint64_t v52 = v79 == 65 ? 1 : 2 * (v79 == 76);
      [v50 setConstellation:v52];
      if (v50)
      {
        v87[0] = v49;
        v87[1] = v50;
        uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
        uint64_t v54 = [MEMORY[0x1E4F1CAD0] set];
        v55 = (VNProcessingDevice *)[v50 processingDevice];
        if (self)
        {
          v56 = v55;
          BOOL v57 = [(BWVisionInferenceAdapter *)self graphicsProcessingDevice] == v55;
          if ([(BWVisionInferenceAdapter *)self neuralProcessingDevice] == v56) {
            self = (BWVisionInferenceAdapter *)3;
          }
          else {
            self = (BWVisionInferenceAdapter *)v57;
          }
        }
        v39 = [[BWVisionInferenceProvider alloc] initWithConfiguration:a5 requests:v53 executesRequestsIndividually:1 executionTarget:self preventionReasons:v54 resourceProvider:a6];
        [(BWVisionInferenceProvider *)v39 bindInputForRequest:v49 fromAttachedMediaUsingKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" withVideoFormatProvider:&__block_literal_global_1];
        if ([a5 detectLandmarksInFullSizeInput]) {
          [(BWVisionInferenceProvider *)v39 bindInputForRequest:v50 fromAttachedMediaUsingKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" withVideoFormatProvider:&__block_literal_global_22];
        }
        [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v49 asMetadataUsingKey:0x1EFA6A0A0];
        v58 = v39;
        id v59 = v50;
        uint64_t v60 = 0x1EFA6A0A0;
        goto LABEL_123;
      }
    }
LABEL_128:
    v39 = 0;
    int v44 = -31702;
    if (!a7) {
      return v39;
    }
    goto LABEL_125;
  }
  uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a5 = +[BWFaceSegmentsWithLandmarksInferenceConfiguration configuration];
  }
  if ((v10 & 0xFFFFFFFF0000) != 0)
  {
LABEL_65:
    v39 = 0;
    int v44 = -31782;
    if (!a7) {
      return v39;
    }
    goto LABEL_125;
  }
  uint64_t v33 = 3737841664;
  switch((unsigned __int16)v10)
  {
    case 1u:
      v34 = (void *)v32;
      unint64_t v35 = v13;
      id v81 = a6;
      int v37 = 0;
      int v76 = 0;
      uint64_t v33 = (unsigned __int16)v10;
      int v36 = 1;
      uint64_t v78 = 3;
      uint64_t v38 = 3737841664;
      break;
    case 3u:
      v34 = (void *)v32;
      unint64_t v35 = v13;
      id v81 = a6;
      uint64_t v38 = 3737841667;
      uint64_t v33 = 3737841665;
      int v36 = 1;
      int v37 = 1;
      uint64_t v78 = 3737841664;
      int v76 = 1;
      break;
    case 2u:
      v34 = (void *)v32;
      unint64_t v35 = v13;
      id v81 = a6;
      int v36 = 0;
      int v37 = 0;
      int v76 = 1;
      uint64_t v38 = 3;
      uint64_t v78 = 3;
      break;
    default:
      goto LABEL_65;
  }
  id v45 = objc_alloc_init((Class)getVNDetectFaceRectanglesRequestClass());
  objc_msgSend(v45, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
  [v45 setModelFileBackingStore:2];
  [v45 setIoSurfaceMemoryPoolId:v35];
  if (v36)
  {
    uint64_t v86 = 0;
    if (([v45 setRevision:v38 error:&v86] & 1) == 0) {
      goto LABEL_65;
    }
  }
  else
  {
    [v45 setRevision:v38];
  }
  if (!v45) {
    goto LABEL_128;
  }
  [v34 addObject:v45];
  unint64_t v46 = v35;
  if ([a5 skipFaceLandmarkDetection])
  {
    v77 = a7;
    id v47 = 0;
    v48 = v34;
  }
  else
  {
    id v47 = objc_alloc_init((Class)getVNDetectFaceLandmarksRequestClass());
    objc_msgSend(v47, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    [v47 setModelFileBackingStore:2];
    if (v37)
    {
      uint64_t v86 = 0;
      v48 = v34;
      if (([v47 setRevision:3737841664 error:&v86] & 1) == 0) {
        goto LABEL_65;
      }
    }
    else
    {
      [v47 setRevision:v78];
      v48 = v34;
    }
    objc_msgSend(v47, "setRefineMouthRegion:", objc_msgSend(a5, "refinesMouthLandmarks"));
    objc_msgSend(v47, "setRefineLeftEyeRegion:", objc_msgSend(a5, "refinesLeftEyeLandmarks"));
    objc_msgSend(v47, "setRefineRightEyeRegion:", objc_msgSend(a5, "refinesRightEyeLandmarks"));
    objc_msgSend(v47, "setPerformBlinkDetection:", objc_msgSend(a5, "detectsBlinking"));
    objc_msgSend(v47, "setCascadeStepCount:", objc_msgSend(a5, "cascadeStepCount"));
    int v61 = [a5 constellationPointCount];
    if (v61 == 65) {
      uint64_t v62 = 1;
    }
    else {
      uint64_t v62 = 2 * (v61 == 76);
    }
    [v47 setConstellation:v62];
    [v47 setIoSurfaceMemoryPoolId:v46];
    if (!v47) {
      goto LABEL_128;
    }
    v77 = a7;
    [v48 addObject:v47];
  }
  id v63 = objc_alloc_init((Class)getVNGenerateFaceSegmentsRequestClass());
  objc_msgSend(v63, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
  [v63 setModelFileBackingStore:2];
  [v63 setRevision:1];
  [v63 setIoSurfaceMemoryPoolId:v46];
  [v48 addObject:v63];
  if ([a5 skipSkinToneClassification])
  {
    id v64 = 0;
    goto LABEL_94;
  }
  id v64 = objc_alloc_init((Class)getVNClassifyFaceAttributesRequestClass());
  objc_msgSend(v64, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
  [v64 setModelFileBackingStore:2];
  [v64 setIoSurfaceMemoryPoolId:v46];
  uint64_t v86 = 0;
  if (![v64 setRevision:3737841664 error:&v86])
  {
LABEL_98:
    v39 = 0;
    int v44 = -31782;
    goto LABEL_47;
  }
  if (!v64)
  {
LABEL_127:
    v39 = 0;
    int v44 = -31702;
LABEL_47:
    a7 = v77;
    if (!v77) {
      return v39;
    }
    goto LABEL_125;
  }
  [v48 addObject:v64];
LABEL_94:
  if ([a5 skipFoodAndDrinkDetection])
  {
    id v65 = 0;
    goto LABEL_101;
  }
  id v65 = objc_alloc_init((Class)getVNRecognizeFoodAndDrinkRequestClass());
  objc_msgSend(v65, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
  [v65 setModelFileBackingStore:2];
  [v65 setIoSurfaceMemoryPoolId:v46];
  if (v76)
  {
    uint64_t v86 = 0;
    if (([v65 setRevision:v33 error:&v86] & 1) == 0) {
      goto LABEL_98;
    }
  }
  else
  {
    [v65 setRevision:v33];
  }
  [v48 addObject:v65];
LABEL_101:
  v66 = (VNProcessingDevice *)[v63 processingDevice];
  if (self)
  {
    v67 = v66;
    BOOL v68 = [(BWVisionInferenceAdapter *)self graphicsProcessingDevice] == v66;
    if ([(BWVisionInferenceAdapter *)self neuralProcessingDevice] == v67) {
      uint64_t v69 = 3;
    }
    else {
      uint64_t v69 = v68;
    }
  }
  else
  {
    uint64_t v69 = 0;
  }
  v70 = [BWVisionInferenceProvider alloc];
  v39 = -[BWVisionInferenceProvider initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:](v70, "initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:", a5, v48, 1, v69, [MEMORY[0x1E4F1CAD0] set], v81);
  int v71 = [a5 detectFacesInFullSizeInput];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_2;
  v84[3] = &unk_1E5C243B8;
  if (v71) {
    int v72 = 1;
  }
  else {
    int v72 = 4;
  }
  int v85 = v72;
  v84[4] = a5;
  [(BWVisionInferenceProvider *)v39 bindInputForRequest:v45 fromAttachedMediaUsingKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" withVideoFormatProvider:v84];
  if (([a5 skipFaceLandmarkDetection] & 1) == 0
    && ([a5 detectFacesInFullSizeInput] & 1) == 0
    && [a5 detectLandmarksInFullSizeInput])
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_3;
    v83[3] = &unk_1E5C243E0;
    v83[4] = a5;
    [(BWVisionInferenceProvider *)v39 bindInputForRequest:v47 fromAttachedMediaUsingKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" withVideoFormatProvider:v83];
  }
  if (([a5 detectFacesInFullSizeInput] & 1) == 0
    && ([a5 detectLandmarksInFullSizeInput] & 1) == 0)
  {
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_4;
    v82[3] = &unk_1E5C243E0;
    v82[4] = a5;
    [(BWVisionInferenceProvider *)v39 bindInputForRequest:v63 fromAttachedMediaUsingKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" withVideoFormatProvider:v82];
  }
  if (([a5 skipSkinToneClassification] & 1) == 0) {
    [(BWVisionInferenceProvider *)v39 bindInputForRequest:v64 fromAttachedMediaUsingKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" withVideoFormatProvider:&__block_literal_global_51];
  }
  [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v45 asMetadataUsingKey:@"VisionFaceDetectionObservations"];
  [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v45 asMetadataUsingKey:0x1EFA6A0A0];
  if (([a5 skipFaceLandmarkDetection] & 1) == 0) {
    [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v47 asMetadataUsingKey:0x1EFA6A0A0];
  }
  [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v63 asMetadataUsingKey:0x1EFA6A0A0];
  if (([a5 skipSkinToneClassification] & 1) == 0) {
    [(BWVisionInferenceProvider *)v39 bindOutputForRequest:v64 asMetadataUsingKey:0x1EFA6A1A0];
  }
  a7 = v77;
  if (([a5 skipFoodAndDrinkDetection] & 1) == 0)
  {
    uint64_t v60 = 0x1EFA6A0C0;
    v58 = v39;
    id v59 = v65;
LABEL_123:
    [(BWVisionInferenceProvider *)v58 bindOutputForRequest:v59 asMetadataUsingKey:v60];
  }
LABEL_124:
  int v44 = 0;
  if (a7) {
LABEL_125:
  }
    *a7 = v44;
  return v39;
}

- (VNProcessingDevice)neuralProcessingDevice
{
  return self->_neuralProcessingDevice;
}

- (VNProcessingDevice)espressoBasedRequestProcessingDevice
{
  v3 = [(BWVisionInferenceAdapter *)self graphicsProcessingDevice];
  if (!+[BWInferenceEngine isNeuralEngineSupported]) {
    return v3;
  }
  return [(BWVisionInferenceAdapter *)self neuralProcessingDevice];
}

- (VNProcessingDevice)graphicsProcessingDevice
{
  return self->_graphicsProcessingDevice;
}

- (BWVisionInferenceAdapter)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWVisionInferenceAdapter;
  v2 = [(BWVisionInferenceAdapter *)&v4 init];
  if (v2)
  {
    v2->_applicationProcessingDevice = (VNProcessingDevice *)(id)[(id)getVNProcessingDeviceClass() defaultCPUDevice];
    v2->_graphicsProcessingDevice = (VNProcessingDevice *)(id)[(id)getVNProcessingDeviceClass() defaultMetalDevice];
    if (+[BWInferenceEngine isNeuralEngineSupported]) {
      v2->_neuralProcessingDevice = (VNProcessingDevice *)(id)[(id)getVNProcessingDeviceClass() defaultANEDevice];
    }
  }
  return v2;
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", (int)(2 * llroundf((float)((int)[a2 width] / 4) * 0.5)));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", (int)(2 * llroundf((float)((int)[a2 height] / 4) * 0.5)));
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB029C0];
  [(BWVideoFormatRequirements *)v3 setSupportedColorSpaceProperties:&unk_1EFB029D8];
  [(BWVideoFormatRequirements *)v3 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v3 setDeviceOriented:0];
  [(BWInferenceVideoFormatRequirements *)v3 setIncludesInvalidContent:1];
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceAdapter;
  [(BWVisionInferenceAdapter *)&v3 dealloc];
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_20(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB029F0];
  [(BWVideoFormatRequirements *)v3 setSupportedColorSpaceProperties:&unk_1EFB02A08];
  [(BWVideoFormatRequirements *)v3 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v3 setDeviceOriented:0];
  [(BWInferenceVideoFormatRequirements *)v3 setIncludesInvalidContent:1];
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", [a2 width] / (unint64_t)*(unsigned int *)(a1 + 40));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", [a2 height] / (unint64_t)*(unsigned int *)(a1 + 40));
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB02A20];
  [(BWVideoFormatRequirements *)v4 setSupportedColorSpaceProperties:&unk_1EFB02A38];
  [(BWVideoFormatRequirements *)v4 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v4 setDeviceOriented:0];
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v4, "setIncludesInvalidContent:", [*(id *)(a1 + 32) includesInvalidContent]);
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_3(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB02A50];
  [(BWVideoFormatRequirements *)v4 setSupportedColorSpaceProperties:&unk_1EFB02A68];
  [(BWVideoFormatRequirements *)v4 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v4 setDeviceOriented:0];
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v4, "setIncludesInvalidContent:", [*(id *)(a1 + 32) includesInvalidContent]);
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_5(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB02AB0];
  [(BWVideoFormatRequirements *)v3 setSupportedColorSpaceProperties:&unk_1EFB02AC8];
  [(BWVideoFormatRequirements *)v3 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v3 setDeviceOriented:0];
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

- (VNProcessingDevice)applicationProcessingDevice
{
  return self->_applicationProcessingDevice;
}

@end