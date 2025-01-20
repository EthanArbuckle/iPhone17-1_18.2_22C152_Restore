@interface BWVisionInferenceProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWInferenceExtractable)extractable;
- (BWInferenceSubmittable)submittable;
- (BWInferenceVideoRequirement)primaryInputVideoRequirement;
- (BWVisionInferenceProvider)initWithConfiguration:(id)a3 requests:(id)a4 executesRequestsIndividually:(BOOL)a5 executionTarget:(int)a6 preventionReasons:(id)a7 resourceProvider:(id)a8;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)bindIdealInputForRequest:(id)a3 fromAttachedMediaUsingKey:(id)a4;
- (id)bindInputForRequest:(id)a3 fromAttachedMediaUsingKey:(id)a4 preparedByAttachedMediaKey:(id)a5 withVideoFormatProvider:(id)a6;
- (id)bindInputForRequest:(id)a3 fromMetadataUsingKeys:(id)a4;
- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4;
- (id)bindOutputForRequest:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5;
- (id)bindOutputForRequest:(id)a3 asConsolidatedMetadataUsingKeys:(id)a4;
- (id)bindOutputForRequest:(id)a3 asMetadataUsingKey:(id)a4;
- (id)bindOutputForRequest:(id)a3 asMetadataUsingKeys:(id)a4;
- (id)newStorage;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)executionTarget;
- (int)prepareForExecution;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)type;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)_tapToRadarVisionTimeOutError:(uint64_t)a3 performingRequests:(uint64_t)a4 settingsID:;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
- (void)setPrimaryInputVideoRequirement:(id)a3;
@end

@implementation BWVisionInferenceProvider

- (NSArray)outputVideoRequirements
{
  return &self->_outputVideoRequirements->super;
}

- (NSArray)inputVideoRequirements
{
  return &self->_inputVideoRequirements->super;
}

- (NSArray)cloneVideoRequirements
{
  return &self->_cloneVideoRequirements->super;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (id)bindOutputForRequest:(id)a3 asMetadataUsingKey:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v7 = [BWInferenceMetadataRequirement alloc];
  v10[0] = a4;
  v8 = -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:](v7, "initWithMetadataKeys:mappingOption:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1], 1);
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v8];
  [(NSMutableDictionary *)self->_requestIndexByRequirement setObject:[(NSMapTable *)self->_requestIndexByRequest objectForKey:a3] forKeyedSubscript:v8];
  return v8;
}

- (id)bindInputForRequest:(id)a3 fromAttachedMediaUsingKey:(id)a4 preparedByAttachedMediaKey:(id)a5 withVideoFormatProvider:(id)a6
{
  v8 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:a4 preparedByAttachedMediaKey:a4 videoFormatProvider:a6];
  [(NSMutableArray *)self->_inputVideoRequirements addObject:v8];
  if (![(BWVisionInferenceProvider *)self primaryInputVideoRequirement]
    && [(NSString *)[(BWInferenceMediaRequirement *)v8 attachedMediaKey] isEqualToString:@"PrimaryFormat"])
  {
    [(BWVisionInferenceProvider *)self setPrimaryInputVideoRequirement:v8];
  }
  [(NSMutableDictionary *)self->_requestIndexByRequirement setObject:[(NSMapTable *)self->_requestIndexByRequest objectForKey:a3] forKeyedSubscript:v8];
  return v8;
}

- (BWInferenceVideoRequirement)primaryInputVideoRequirement
{
  return self->_primaryInputVideoRequirement;
}

- (void)setPrimaryInputVideoRequirement:(id)a3
{
}

- (BWVisionInferenceProvider)initWithConfiguration:(id)a3 requests:(id)a4 executesRequestsIndividually:(BOOL)a5 executionTarget:(int)a6 preventionReasons:(id)a7 resourceProvider:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  v22.receiver = self;
  v22.super_class = (Class)BWVisionInferenceProvider;
  v14 = [(BWVisionInferenceProvider *)&v22 init];
  if (v14)
  {
    v14->_configuration = (BWVisionInferenceConfiguration *)a3;
    objc_opt_class();
    id v15 = (objc_opt_isKindOfClass() & 1) != 0 ? a3 : 0;
    v14->_executesRequestsIndividually = a5;
    v14->_type = [a3 inferenceType];
    v14->_executionTarget = v10;
    uint64_t v16 = [a7 copy];
    *(int64x2_t *)&v14->_indexOfRequestForMergedFaceDetection = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v14->_preventionReasons = (NSSet *)v16;
    v14->_indexOfRequestForMaximumNumberOfFaces = 0x7FFFFFFFFFFFFFFFLL;
    v14->_maximumNumberOfFaces = [v15 maximumNumberOfFaces];
    v14->_clampToLargestMaximumNumberOfFaces = [v15 clampToLargestMaximumNumberOfFaces];
    v14->_considerISPRectsIfVisionFails = [v15 considerISPRectsIfVisionFails];
    v14->_alwaysExecuteForRedEyeReduction = [v15 alwaysExecuteForRedEyeReduction];
    v14->_prototypeRequests = (NSArray *)[a4 copy];
    v14->_context = (BWVisionInferenceContext *)(id)[a8 visionContextForExecutionTarget:v10];
    v14->_requestIndexByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14->_inputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14->_outputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14->_inputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14->_outputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14->_requestIndexByRequest = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(a4, "count"));
    if ([a4 count])
    {
      unint64_t v17 = 0;
      while (1)
      {
        uint64_t v18 = [a4 objectAtIndexedSubscript:v17];
        -[NSMapTable setObject:forKey:](v14->_requestIndexByRequest, "setObject:forKey:", [NSNumber numberWithUnsignedInteger:v17], v18);
        getVNDetectFaceRectanglesRequestClass();
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        getVNRecognizeFoodAndDrinkRequestClass();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        p_indexOfRequestForMergedFoodAndDrinkRecognition = &v14->_indexOfRequestForMergedFoodAndDrinkRecognition;
        if (isKindOfClass) {
          goto LABEL_10;
        }
LABEL_11:
        if (++v17 >= [a4 count]) {
          return v14;
        }
      }
      v14->_indexOfRequestForMaximumNumberOfFaces = v17;
      p_indexOfRequestForMergedFoodAndDrinkRecognition = &v14->_indexOfRequestForMergedFaceDetection;
LABEL_10:
      unint64_t *p_indexOfRequestForMergedFoodAndDrinkRecognition = v17;
      goto LABEL_11;
    }
  }
  return v14;
}

- (BWInferenceSubmittable)submittable
{
  return 0;
}

- (int)prepareForExecution
{
  v9[22] = *MEMORY[0x1E4F143B8];
  v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  BWInferenceTypeDescription(self->_type);
  mach_absolute_time();
  int v4 = [(BWVisionInferenceContext *)self->_context prepareForInference];
  if (v4)
  {
    int v7 = v4;
  }
  else
  {
    v5 = [(BWVisionInferenceContext *)self->_context sequenceRequestHandler];
    if (v5)
    {
      v9[0] = 0;
      if ([(VNSequenceRequestHandler *)v5 prepareForPerformingRequests:self->_prototypeRequests error:v9])
      {
        if (dword_1EB4C5530)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        int v7 = 0;
      }
      else
      {
        int v7 = -31710;
      }
    }
    else
    {
      int v7 = -31702;
    }
  }
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v7;
}

- (id)newStorage
{
  v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_inputVideoRequirements];
  [v3 addObjectsFromArray:self->_outputVideoRequirements];
  int v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v4 addObjectsFromArray:self->_outputVideoRequirements];
  v5 = [BWVisionInferenceStorage alloc];
  return [(BWVisionInferenceStorage *)v5 initWithRequirementsNeedingPixelBuffers:v3 requirementsNeedingPixelBufferPools:v4];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceProvider;
  [(BWVisionInferenceProvider *)&v3 dealloc];
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  uint64_t v11 = [(NSMutableArray *)outputVideoRequirements countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(outputVideoRequirements);
        }
        id v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v16 = (const void *)[a4 newSampleBufferSatisfyingRequirement:v15 withPropagationSampleBuffer:a6];
        BWSampleBufferSetAttachedMedia(a6, [v15 attachedMediaKey], (uint64_t)v16);
        if (v16) {
          CFRelease(v16);
        }
      }
      uint64_t v12 = [(NSMutableArray *)outputVideoRequirements countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v12);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  cloneVideoRequirements = self->_cloneVideoRequirements;
  uint64_t v18 = [(NSMutableArray *)cloneVideoRequirements countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(cloneVideoRequirements);
        }
        objc_super v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v23 = (const void *)[a4 newSampleBufferSatisfyingCloneRequirement:v22];
        BWSampleBufferSetAttachedMedia(a6, [v22 attachedMediaKey], (uint64_t)v23);
        if (v23) {
          CFRelease(v23);
        }
      }
      uint64_t v19 = [(NSMutableArray *)cloneVideoRequirements countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v19);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  outputMetadataRequirements = self->_outputMetadataRequirements;
  uint64_t v25 = [(NSMutableArray *)outputMetadataRequirements countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(outputMetadataRequirements);
        }
        v29 = (void *)[a4 newMetadataDictionarySatisfyingRequirement:*(void *)(*((void *)&v30 + 1) + 8 * k)];
        [a3 addEntriesFromDictionary:v29];
      }
      uint64_t v26 = [(NSMutableArray *)outputMetadataRequirements countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v26);
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (void)_tapToRadarVisionTimeOutError:(uint64_t)a3 performingRequests:(uint64_t)a4 settingsID:
{
  if (a1)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
    uint64_t v8 = [NSString stringWithFormat:@"[Vision] %@ encountered Vision time out with err:%d while processing %@", v7, objc_msgSend(a2, "code"), a3];
    uint64_t v9 = [NSString stringWithFormat:@"Encountered Vision time out for captureID:%lld with err:%@, while performing requests %@. {Please embellish with any details about the scene, subject, or other such information}", a4, a2, a3];
    FigCapturePromptOpenTapToRadar(@"Vision time out detected. Please file a radar.", v8, v9, 3, 6, 6, 0.0);
  }
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (![(BWVisionInferenceProvider *)self primaryInputVideoRequirement])
  {
    FigDebugAssert3();
    id v23 = 0;
    uint64_t v74 = 4294935585;
    goto LABEL_124;
  }
  uint64_t v11 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v11 || (uint64_t v12 = v11, (v13 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F53248]]) == 0))
  {
    FigDebugAssert3();
    id v23 = 0;
    uint64_t v74 = 4294935582;
    goto LABEL_124;
  }
  unsigned int v84 = [v13 intValue];
  v14 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
  id v15 = objc_msgSend(v14, "captureStreamSettingsForPortType:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  v76 = v14;
  v77 = v12;
  id v78 = a6;
  BOOL v86 = [v14 captureType] == 2
     && ([v15 captureFlags] & 0x10000) != 0
     && self->_alwaysExecuteForRedEyeReduction;
  v112 = 0;
  v83 = [(BWVisionInferenceContext *)self->_context sequenceRequestHandler];
  id v16 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_prototypeRequests copyItems:1];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  requestIndexByRequirement = self->_requestIndexByRequirement;
  uint64_t v18 = [(NSMutableDictionary *)requestIndexByRequirement countByEnumeratingWithState:&v108 objects:v118 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v109 != v20) {
          objc_enumerationMutation(requestIndexByRequirement);
        }
        objc_msgSend(a4, "setRequest:forRequirement:", objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestIndexByRequirement, "objectForKeyedSubscript:", *(void *)(*((void *)&v108 + 1) + 8 * i)), "unsignedIntegerValue")), *(void *)(*((void *)&v108 + 1) + 8 * i));
      }
      uint64_t v19 = [(NSMutableDictionary *)requestIndexByRequirement countByEnumeratingWithState:&v108 objects:v118 count:16];
    }
    while (v19);
  }
  if (!self->_executesRequestsIndividually)
  {
    if ([(BWVisionInferenceConfiguration *)self->_configuration shouldPreventRequestForSampleBuffer])
    {
      v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      uint64_t v25 = [v16 countByEnumeratingWithState:&v92 objects:v114 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v93;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v93 != v27) {
              objc_enumerationMutation(v16);
            }
            v29 = *(void **)(*((void *)&v92 + 1) + 8 * j);
            long long v30 = [(BWVisionInferenceConfiguration *)self->_configuration shouldPreventRequestForSampleBuffer];
            if (v30[2](v30, (id)[v29 copy], a3))
            {
              [v24 addObject:v29];
              [a4 removeRequest:v29];
            }
          }
          uint64_t v26 = [v16 countByEnumeratingWithState:&v92 objects:v114 count:16];
        }
        while (v26);
      }
      [v16 removeObjectsInArray:v24];
    }
    if ([(BWVisionInferenceConfiguration *)self->_configuration reuseUpstreamFaceObservations])
    {
      uint64_t AttachedInference = BWInferenceGetAttachedInference(a3, 802, 0x1EFA6A0A0);
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      uint64_t v32 = [v16 countByEnumeratingWithState:&v88 objects:v113 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v89;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v89 != v34) {
              objc_enumerationMutation(v16);
            }
            long long v36 = *(void **)(*((void *)&v88 + 1) + 8 * k);
            if ([v36 conformsToProtocol:&unk_1EFB70028]) {
              [v36 setInputFaceObservations:AttachedInference];
            }
          }
          uint64_t v33 = [v16 countByEnumeratingWithState:&v88 objects:v113 count:16];
        }
        while (v33);
      }
    }
    long long v37 = [(BWVisionInferenceProvider *)self primaryInputVideoRequirement];
    uint64_t v38 = [a4 pixelBufferForRequirement:v37];
    if (!v38)
    {
      id v23 = 0;
      uint64_t v74 = 4294935584;
      goto LABEL_120;
    }
    uint64_t v39 = v38;
    if ([(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)v37 videoFormat] deviceOriented])
    {
      uint64_t v40 = 1;
    }
    else
    {
      uint64_t v40 = v84;
    }
    BOOL v41 = [(VNSequenceRequestHandler *)v83 performRequests:v16 onCVPixelBuffer:v39 orientation:v40 error:&v112];
    if ([(BWVisionInferenceConfiguration *)self->_configuration suppressTimeOutFailure]
      && objc_msgSend((id)objc_msgSend(v112, "domain"), "isEqualToString:", getVNErrorDomain())
      && [v112 code] == 20)
    {
      -[BWVisionInferenceProvider _tapToRadarVisionTimeOutError:performingRequests:settingsID:]((uint64_t)self, v112, (uint64_t)v16, [v76 settingsID]);
    }
    else if (!v41)
    {
      FigDebugAssert3();
      id v23 = 0;
      uint64_t v74 = 4294935586;
      goto LABEL_120;
    }
    id v23 = 0;
LABEL_119:
    uint64_t v74 = 0;
LABEL_120:
    a6 = v78;
    goto LABEL_123;
  }
  objc_super v22 = (void *)[MEMORY[0x1E4F28E60] indexSet];
  if (self->_indexOfRequestForMergedFaceDetection == 0x7FFFFFFFFFFFFFFFLL
    || self->_indexOfRequestForMergedFoodAndDrinkRecognition == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v82 = 0;
    id v23 = 0;
  }
  else
  {
    id v23 = (id)objc_msgSend(v16, "objectAtIndexedSubscript:");
    int v82 = 1;
  }
  uint64_t v42 = [v16 count];
  if (!v42) {
    goto LABEL_119;
  }
  unint64_t v43 = v42;
  v79 = v23;
  v80 = v22;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v85 = v42;
  v81 = a3;
  while (1)
  {
    v46 = (void *)[v16 objectAtIndexedSubscript:v44];
    if ([v22 containsIndex:v44]) {
      goto LABEL_117;
    }
    id v47 = (id)[v45 results];
    v87 = v46;
    if (self->_considerISPRectsIfVisionFails)
    {
      getVNDetectFaceRectanglesRequestClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![v47 count])
      {
        v48 = (void *)BWFaceDetectionObservationsFromISPDetectedFacesMetadata(v77);
        if ([v48 count]) {
          id v47 = v48;
        }
        v46 = v87;
      }
    }
    if (self->_clampToLargestMaximumNumberOfFaces)
    {
      getVNDetectFaceRectanglesRequestClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (getVNDetectFaceLandmarksRequestClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (getVNGenerateFaceSegmentsRequestClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if ([v47 count] > self->_maximumNumberOfFaces)
        {
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          uint64_t v49 = [v47 countByEnumeratingWithState:&v104 objects:v117 count:16];
          if (v49)
          {
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v105;
            while (1)
            {
              if (*(void *)v105 != v51) {
                objc_enumerationMutation(v47);
              }
              if (!--v50)
              {
                uint64_t v50 = [v47 countByEnumeratingWithState:&v104 objects:v117 count:16];
                if (!v50) {
                  break;
                }
              }
            }
          }
          v52 = (void *)[v47 sortedArrayUsingComparator:&__block_literal_global_114];
          id v47 = (id)objc_msgSend((id)objc_msgSend(v52, "subarrayWithRange:", objc_msgSend(v52, "count") - self->_maximumNumberOfFaces), "copy");
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          uint64_t v53 = [v47 countByEnumeratingWithState:&v100 objects:v116 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v101;
            while (1)
            {
              if (*(void *)v101 != v55) {
                objc_enumerationMutation(v47);
              }
              if (!--v54)
              {
                uint64_t v54 = [v47 countByEnumeratingWithState:&v100 objects:v116 count:16];
                if (!v54) {
                  break;
                }
              }
            }
          }
          unint64_t v43 = v85;
          v46 = v87;
        }
      }
    }
    if (v45 && ![v47 count]
      || (!self->_maximumNumberOfFaces ? (char v56 = 1) : (char v56 = v86),
          (v56 & 1) == 0
       && !self->_clampToLargestMaximumNumberOfFaces
       && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", self->_indexOfRequestForMaximumNumberOfFaces), "results"), "count") > self->_maximumNumberOfFaces))
    {
LABEL_118:
      uint64_t v74 = 0;
      goto LABEL_122;
    }
    if ([(BWVisionInferenceConfiguration *)self->_configuration shouldPreventRequestForSampleBuffer])
    {
      v57 = [(BWVisionInferenceConfiguration *)self->_configuration shouldPreventRequestForSampleBuffer];
      id v58 = (id)[v87 copy];
      v59 = (unsigned int (*)(void *, id, opaqueCMSampleBuffer *))v57[2];
      v60 = v57;
      v46 = v87;
      if (v59(v60, v58, a3))
      {
        [a4 removeRequest:v87];
        goto LABEL_117;
      }
    }
    if ([v46 conformsToProtocol:&unk_1EFB70028]) {
      [v46 setInputFaceObservations:v47];
    }
    v61 = [(BWVisionInferenceProvider *)self primaryInputVideoRequirement];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    inputVideoRequirements = self->_inputVideoRequirements;
    uint64_t v63 = [(NSMutableArray *)inputVideoRequirements countByEnumeratingWithState:&v96 objects:v115 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v97;
      do
      {
        for (uint64_t m = 0; m != v64; ++m)
        {
          if (*(void *)v97 != v65) {
            objc_enumerationMutation(inputVideoRequirements);
          }
          v67 = *(BWInferenceVideoRequirement **)(*((void *)&v96 + 1) + 8 * m);
          if (v44 == (int)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestIndexByRequirement, "objectForKeyedSubscript:", v67), "intValue"))v61 = v67; {
        }
          }
        uint64_t v64 = [(NSMutableArray *)inputVideoRequirements countByEnumeratingWithState:&v96 objects:v115 count:16];
      }
      while (v64);
    }
    uint64_t v68 = [a4 pixelBufferForRequirement:v61];
    if (!v68) {
      break;
    }
    uint64_t v69 = v68;
    if ([(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)v61 videoFormat] deviceOriented])
    {
      uint64_t v70 = 1;
    }
    else
    {
      uint64_t v70 = v84;
    }
    v71 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:v87];
    uint64_t v72 = (uint64_t)v71;
    if (v82)
    {
      objc_super v22 = v80;
      a3 = v81;
      if (v44 == self->_indexOfRequestForMergedFaceDetection && v79)
      {
        [v71 addObject:v79];
        [v80 addIndex:self->_indexOfRequestForMergedFoodAndDrinkRecognition];

        v79 = 0;
      }
    }
    else
    {
      objc_super v22 = v80;
      a3 = v81;
    }
    BOOL v73 = [(VNSequenceRequestHandler *)v83 performRequests:v72 onCVPixelBuffer:v69 orientation:v70 error:&v112];
    if ([(BWVisionInferenceConfiguration *)self->_configuration suppressTimeOutFailure]
      && objc_msgSend((id)objc_msgSend(v112, "domain"), "isEqualToString:", getVNErrorDomain())
      && [v112 code] == 20)
    {
      -[BWVisionInferenceProvider _tapToRadarVisionTimeOutError:performingRequests:settingsID:]((uint64_t)self, v112, v72, [v76 settingsID]);
      unint64_t v43 = v85;
      uint64_t v44 = v85;
    }
    else
    {
      unint64_t v43 = v85;
      if (!v73)
      {
        uint64_t v74 = 4294935586;
        goto LABEL_122;
      }
    }
    uint64_t v45 = v87;
LABEL_117:
    if (++v44 >= v43) {
      goto LABEL_118;
    }
  }
  uint64_t v74 = 4294935584;
LABEL_122:
  a6 = v78;
  id v23 = v79;
LABEL_123:
  uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_124:
  if (*v10 == 1) {
    kdebug_trace();
  }

  if (a6) {
    (*((void (**)(id, uint64_t, BWVisionInferenceProvider *))a6 + 2))(a6, v74, self);
  }
  return v74;
}

uint64_t __100__BWVisionInferenceProvider_executeOnSampleBuffer_usingStorage_withExecutionTime_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v4 = bwvip_boundingBoxArea(a2);
  float v5 = bwvip_boundingBoxArea(a3);
  if (v4 >= v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = -1;
  }
  if (v4 > v5) {
    return 1;
  }
  else {
    return v6;
  }
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  float v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  int v6 = [(BWVisionInferenceContext *)self->_context prepareForInference];
  if (v6)
  {
    int v17 = v6;
  }
  else
  {
    uint64_t v7 = [(BWVisionInferenceContext *)self->_context sequenceRequestHandler];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
      uint64_t v10 = v9;
      if (v3)
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        prototypeRequests = self->_prototypeRequests;
        uint64_t v12 = [(NSArray *)prototypeRequests countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(prototypeRequests);
              }
              uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              getVNDetectFaceRectanglesRequestClass();
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v10 addObject:v16];
              }
            }
            uint64_t v13 = [(NSArray *)prototypeRequests countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v13);
        }
      }
      else
      {
        [v9 addObjectsFromArray:self->_prototypeRequests];
      }
      uint64_t v19 = 0;
      if ([(VNSequenceRequestHandler *)v8 prepareForPerformingRequests:v10 error:&v19])int v17 = 0; {
      else
      }
        int v17 = -31710;
    }
    else
    {
      int v17 = -31702;
    }
  }
  if (*v5 == 1) {
    kdebug_trace();
  }
  return v17;
}

- (id)bindIdealInputForRequest:(id)a3 fromAttachedMediaUsingKey:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "supportedImageSizeSet"), "firstObject");
  uint64_t v8 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", objc_msgSend((id)objc_msgSend(v7, "pixelsWideRange"), "idealDimension"));
  -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", objc_msgSend((id)objc_msgSend(v7, "pixelsHighRange"), "idealDimension"));
  v13[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "idealImageFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1]);
  BOOL v9 = ([v7 isOrientationAgnostic] & 1) == 0 && objc_msgSend(v7, "idealOrientation") == 1;
  [(BWInferenceVideoFormatRequirements *)v8 setDeviceOriented:v9];
  [(BWVideoFormatRequirements *)v8 setSupportedColorSpaceProperties:&unk_1EFB045B0];
  [(BWVideoFormatRequirements *)v8 setBytesPerRowAlignment:64];
  uint64_t v12 = v8;
  uint64_t v10 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", a4, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1]));
  [(NSMutableArray *)self->_inputVideoRequirements addObject:v10];
  if (![(BWVisionInferenceProvider *)self primaryInputVideoRequirement]
    && [(NSString *)[(BWInferenceMediaRequirement *)v10 attachedMediaKey] isEqualToString:@"PrimaryFormat"])
  {
    [(BWVisionInferenceProvider *)self setPrimaryInputVideoRequirement:v10];
  }
  [(NSMutableDictionary *)self->_requestIndexByRequirement setObject:[(NSMapTable *)self->_requestIndexByRequest objectForKey:a3] forKeyedSubscript:v10];
  return v10;
}

- (id)bindInputForRequest:(id)a3 fromMetadataUsingKeys:(id)a4
{
  int v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4];
  [(NSMutableArray *)self->_inputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_requestIndexByRequirement setObject:[(NSMapTable *)self->_requestIndexByRequest objectForKey:a3] forKeyedSubscript:v6];
  return v6;
}

- (id)bindOutputForRequest:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5
{
  uint64_t v7 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:a4 videoFormat:a5];
  [(NSMutableArray *)self->_outputVideoRequirements addObject:v7];
  [(NSMutableDictionary *)self->_requestIndexByRequirement setObject:[(NSMapTable *)self->_requestIndexByRequest objectForKey:a3] forKeyedSubscript:v7];
  return v7;
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  float v5 = [[BWInferenceCloneVideoRequirement alloc] initWithAttachedMediaKey:a4 sourceVideoRequirement:a3];
  [(NSMutableArray *)self->_cloneVideoRequirements addObject:v5];
  return v5;
}

- (id)bindOutputForRequest:(id)a3 asMetadataUsingKeys:(id)a4
{
  int v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4];
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_requestIndexByRequirement setObject:[(NSMapTable *)self->_requestIndexByRequest objectForKey:a3] forKeyedSubscript:v6];
  return v6;
}

- (id)bindOutputForRequest:(id)a3 asConsolidatedMetadataUsingKeys:(id)a4
{
  int v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4 mappingOption:2];
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_requestIndexByRequirement setObject:[(NSMapTable *)self->_requestIndexByRequest objectForKey:a3] forKeyedSubscript:v6];
  return v6;
}

- (int)type
{
  return self->_type;
}

- (int)executionTarget
{
  return self->_executionTarget;
}

- (NSSet)preventionReasons
{
  return self->_preventionReasons;
}

- (NSArray)inputMetadataRequirements
{
  return &self->_inputMetadataRequirements->super;
}

- (NSArray)outputMetadataRequirements
{
  return &self->_outputMetadataRequirements->super;
}

@end