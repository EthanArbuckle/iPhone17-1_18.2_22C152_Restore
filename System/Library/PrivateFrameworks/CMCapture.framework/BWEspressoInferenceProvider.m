@interface BWEspressoInferenceProvider
+ (void)initialize;
- (BWEspressoInferenceProvider)initWithType:(int)a3 networkURL:(id)a4 networkConfiguration:(id)a5 context:(id)a6 executionTarget:(int)a7 schedulerPriority:(unsigned int)a8 preventionReasons:(id)a9 resourceProvider:(id)a10 allowedCompressionDirection:(unsigned int)a11 concurrentSubmissionLimit:(unint64_t)a12;
- (BWEspressoInferenceTensorMemoryProvider)tensorMemoryProvider;
- (BWInferenceExtractable)extractable;
- (BWInferencePropagatable)propagatable;
- (BWInferenceSubmittable)submittable;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (NSString)description;
- (id)bindEspressoInput:(id)a3 fromAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5;
- (id)bindEspressoInput:(id)a3 fromAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5 count:(unint64_t)a6;
- (id)bindEspressoInput:(id)a3 fromMetadataUsingKeys:(id)a4;
- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5;
- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5 count:(unint64_t)a6;
- (id)bindEspressoOutput:(id)a3 asConsolidatedMetadataUsingKeys:(id)a4;
- (id)bindEspressoOutput:(id)a3 asMetadataUsingKey:(id)a4;
- (id)bindEspressoOutput:(id)a3 asMetadataUsingKeys:(id)a4;
- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4;
- (id)newStorage;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)executionTarget;
- (int)prepareForExecution;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (uint64_t)_ensureEspressoBindingsUsingStorage:(uint64_t)result;
- (uint64_t)_mapSchedulerToEspressoPriority:(uint64_t)result;
- (uint64_t)_prepareWithWorkQueue:(uint64_t)a1;
- (uint64_t)_surfacePropertiesForTensor:(uint64_t)result bindingName:(void *)a2;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)setPropagatable:(id)a3;
- (void)setTensorMemoryProvider:(id)a3;
@end

@implementation BWEspressoInferenceProvider

- (unsigned)allowedPixelBufferCompressionDirection
{
  return self->_allowedCompressionDirection;
}

- (id)bindEspressoInput:(id)a3 fromAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5 count:(unint64_t)a6
{
  v8 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:a4 videoFormat:a5 count:a6];
  [(NSMutableArray *)self->_inputVideoRequirements addObject:v8];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v8];
  return v8;
}

- (id)bindEspressoInput:(id)a3 fromAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5
{
  return [(BWEspressoInferenceProvider *)self bindEspressoInput:a3 fromAttachedMediaUsingKey:a4 withVideoFormat:a5 count:1];
}

- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5 count:(unint64_t)a6
{
  v8 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:a4 videoFormat:a5 count:a6];
  [(NSMutableArray *)self->_outputVideoRequirements addObject:v8];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v8];
  return v8;
}

- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5
{
  return [(BWEspressoInferenceProvider *)self bindEspressoOutput:a3 asAttachedMediaUsingKey:a4 withVideoFormat:a5 count:1];
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  v5 = [[BWInferenceCloneVideoRequirement alloc] initWithAttachedMediaKey:a4 sourceVideoRequirement:a3];
  [(NSMutableArray *)self->_cloneVideoRequirements addObject:v5];
  return v5;
}

- (id)bindEspressoOutput:(id)a3 asMetadataUsingKeys:(id)a4
{
  v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4];
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v6];
  return v6;
}

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

- (void)setPropagatable:(id)a3
{
  propagator = self->_propagator;
  if (propagator != a3)
  {

    self->_propagator = (BWInferencePropagatable *)a3;
  }
}

- (BWEspressoInferenceProvider)initWithType:(int)a3 networkURL:(id)a4 networkConfiguration:(id)a5 context:(id)a6 executionTarget:(int)a7 schedulerPriority:(unsigned int)a8 preventionReasons:(id)a9 resourceProvider:(id)a10 allowedCompressionDirection:(unsigned int)a11 concurrentSubmissionLimit:(unint64_t)a12
{
  v20.receiver = self;
  v20.super_class = (Class)BWEspressoInferenceProvider;
  v17 = [(BWEspressoInferenceProvider *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_type = a3;
    v17->_networkURL = (NSURL *)[a4 copy];
    v18->_networkConfiguration = (NSString *)[a5 copy];
    v18->_executionTarget = a7;
    v18->_preventionReasons = (NSSet *)[a9 copy];
    v18->_allowedCompressionDirection = a11;
    v18->_concurrentSubmissionLimit = a12;
    v18->_espressoPriority = -[BWEspressoInferenceProvider _mapSchedulerToEspressoPriority:]((uint64_t)v18);
    v18->_context = (BWEspressoInferenceContext *)a6;
    v18->_bindingNamesByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18->_inputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v18->_outputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v18->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v18->_inputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v18->_outputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v18;
}

- (uint64_t)_mapSchedulerToEspressoPriority:(uint64_t)result
{
  if (result)
  {
    if (*(_DWORD *)(result + 12) == 3)
    {
      int MachThreadPriorityValue = FigThreadGetMachThreadPriorityValue();
      if (MachThreadPriorityValue >= (int)FigThreadGetMachThreadPriorityValue()) {
        return 1;
      }
      else {
        return 0x2000;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)type
{
  return self->_type;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  return -[BWEspressoInferenceProvider _prepareWithWorkQueue:]((uint64_t)self, (uint64_t)a3);
}

- (int)executionTarget
{
  return self->_executionTarget;
}

- (uint64_t)_prepareWithWorkQueue:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*(void *)(a1 + 72)) {
    goto LABEL_28;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [(id)a1 type];
    kdebug_trace();
  }
  BWInferenceTypeDescription(*(unsigned int *)(a1 + 8));
  mach_absolute_time();
  uint64_t v5 = [*(id *)(a1 + 64) prepareForInference];
  if (v5) {
    goto LABEL_38;
  }
  uint64_t plan = [*(id *)(a1 + 64) espressoContext];
  if (!plan) {
    goto LABEL_29;
  }
  uint64_t plan = espresso_create_plan();
  *(void *)(a1 + 72) = plan;
  if (!plan) {
    goto LABEL_29;
  }
  [*(id *)(a1 + 40) fileSystemRepresentation];
  [(id)a1 executionTarget];
  LODWORD(plan) = espresso_plan_add_network();
  if (plan) {
    goto LABEL_37;
  }
  if ([+[BWMemoryPool sharedMemoryPool] poolIdentifier])
  {
    espresso_network_set_memory_pool_id();
  }
  if ([(id)a1 submittable]
    && *(_DWORD *)(a1 + 12) == 3
    && (a2 && (LODWORD(plan) = espresso_plan_set_execution_queue(), plan)
     || *(void *)(a1 + 32) >= 2uLL && (LODWORD(plan) = espresso_plan_submit_set_multiple_buffering(), plan))
    || *(_DWORD *)(a1 + 96) && (LODWORD(plan) = espresso_plan_set_priority(), plan))
  {
LABEL_37:
    uint64_t v11 = 4294935586;
    goto LABEL_30;
  }
  uint64_t v7 = [*(id *)(a1 + 64) configureIntermediateBufferSharingForPlanPrebuild:*(void *)(a1 + 72)];
  if (v7)
  {
    uint64_t v11 = v7;
LABEL_41:
    FigDebugAssert3();
    goto LABEL_42;
  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    [v8 UTF8String];
    uint64_t v5 = espresso_network_select_configuration();
    if (v5)
    {
LABEL_38:
      uint64_t v11 = v5;
LABEL_42:
      LODWORD(plan) = 0;
      goto LABEL_30;
    }
  }
  LODWORD(plan) = espresso_plan_build();
  if (plan) {
    goto LABEL_37;
  }
  uint64_t v9 = [*(id *)(a1 + 64) configureIntermediateBufferSharingForPlanPostbuild:*(void *)(a1 + 72)];
  if (v9)
  {
    uint64_t v11 = v9;
    goto LABEL_41;
  }
  if (!*(void *)(a1 + 152)) {
    *(void *)(a1 + 152) = [[BWInferenceSampleBufferPropagator alloc] initWithVideoRequirements:*(void *)(a1 + 120) cloneRequirements:*(void *)(a1 + 128) metadataRequirements:*(void *)(a1 + 144)];
  }

  *(void *)(a1 + 168) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (dword_1EB4C5510)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_28:
  LODWORD(plan) = 0;
LABEL_29:
  uint64_t v11 = 0;
LABEL_30:
  if (v11 | plan)
  {
    if (*(void *)(a1 + 72))
    {
      *(void *)(a1 + 80) = 0;
      *(void *)(a1 + 88) = 0;
      espresso_plan_destroy();
      *(void *)(a1 + 72) = 0;
    }

    *(void *)(a1 + 168) = 0;
  }
  if (*v3 == 1)
  {
    [(id)a1 type];
    kdebug_trace();
  }
  return v11;
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
  if (self->_espressoPlan) {
    espresso_plan_destroy();
  }

  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceProvider;
  [(BWEspressoInferenceProvider *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; executionTarget = %lu; networkURL = %@; network version = %@>",
                       objc_opt_class(),
                       self,
                       self->_executionTarget,
                       self->_networkURL,
                       self->_espressoNetworkVersion);
}

- (id)newStorage
{
  inputVideoRequirements = self->_inputVideoRequirements;
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v4 addObjectsFromArray:self->_outputVideoRequirements];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v5 addObjectsFromArray:self->_outputVideoRequirements];
  [v5 addObjectsFromArray:self->_inputMetadataRequirements];
  [v5 addObjectsFromArray:self->_outputMetadataRequirements];
  v6 = [BWEspressoInferenceStorage alloc];
  bindingNamesByRequirement = self->_bindingNamesByRequirement;
  return [(BWEspressoInferenceStorage *)v6 initWithBindingNameByRequirement:bindingNamesByRequirement requirementsNeedingPixelBuffers:inputVideoRequirements requirementsNeedingPixelBufferPools:v4 requirementsNeedingTensors:v5];
}

- (uint64_t)_ensureEspressoBindingsUsingStorage:(uint64_t)result
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v4 = (void *)[(id)result inputVideoRequirements];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v59;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v59 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          if (![a2 pixelBufferForRequirement:v9]) {
            return 4294935584;
          }
          v10 = (void *)[a2 bindingNameForRequirement:v9];
          if (!v10) {
            return 4294935584;
          }
          uint64_t v11 = v10;
          [v10 UTF8String];
          if (espresso_network_bind_direct_cvpixelbuffer())
          {
            [v11 UTF8String];
            if (espresso_network_bind_cvpixelbuffer()) {
              return 4294935586;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v58 objects:v65 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v12 = *(void **)(v3 + 120);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v55;
LABEL_15:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v54 + 1) + 8 * v16);
        uint64_t v18 = [a2 bindingNameForRequirement:v17];
        if (!v18) {
          return 4294935579;
        }
        v19 = (void *)v18;
        if (![a2 pixelBufferForRequirement:v17])
        {
          objc_super v20 = (const void *)objc_msgSend((id)objc_msgSend(a2, "pixelBufferPoolForRequirement:", v17), "newPixelBuffer");
          [a2 setPixelBuffer:v20 forRequirement:v17];
          if (!v20) {
            return 4294935579;
          }
          CFRelease(v20);
        }
        if ((objc_msgSend((id)objc_msgSend(v17, "videoFormat"), "deviceOriented") & 1) != 0
          || ([v19 UTF8String], espresso_network_bind_direct_cvpixelbuffer()))
        {
          if (![a2 tensorForRequirement:v17]) {
            return 4294935579;
          }
          [v19 UTF8String];
          if (espresso_network_bind_buffer()) {
            return 4294935586;
          }
          [a2 addTensorInUseRequirement:v17];
        }
        else
        {
          [a2 addPixelBufferInUseRequirement:v17];
        }
        if (v14 == ++v16)
        {
          uint64_t v21 = [v12 countByEnumeratingWithState:&v54 objects:v64 count:16];
          uint64_t v14 = v21;
          if (v21) {
            goto LABEL_15;
          }
          break;
        }
      }
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v22 = *(void **)(v3 + 136);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v51;
LABEL_33:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v51 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * v26);
        v28 = (void *)[a2 bindingNameForRequirement:v27];
        BOOL v29 = ![a2 tensorForRequirement:v27] || v28 == 0;
        if (v29 || ![v28 length]) {
          return 4294935579;
        }
        [v28 UTF8String];
        if (espresso_network_bind_buffer()) {
          return 4294935586;
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v63 count:16];
          if (v24) {
            goto LABEL_33;
          }
          break;
        }
      }
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v30 = *(void **)(v3 + 144);
    result = [v30 countByEnumeratingWithState:&v46 objects:v62 count:16];
    if (result)
    {
      uint64_t v31 = result;
      uint64_t v32 = *(void *)v47;
      CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
LABEL_46:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v46 + 1) + 8 * v34);
        v36 = (void *)[a2 bindingNameForRequirement:v35];
        uint64_t v37 = [a2 tensorForRequirement:v35];
        if (!v37 || v36 == 0) {
          return 4294935579;
        }
        v39 = (void *)v37;
        if (![v36 length]) {
          return 4294935579;
        }
        uint64_t v40 = bweis_storageLengthInBytes((uint64_t)v39);
        if (*(void *)(v3 + 160) && v40) {
          goto LABEL_72;
        }
        [v36 UTF8String];
        if (espresso_network_bind_buffer()) {
          return 4294935586;
        }
        if (*(void *)(v3 + 160))
        {
LABEL_72:
          uint64_t v41 = -[BWEspressoInferenceProvider _surfacePropertiesForTensor:bindingName:](v3, v39);
          if (!v41) {
            return 4294935576;
          }
          v42 = (__IOSurface *)[*(id *)(v3 + 160) backingMemoryForMetadataRequirement:v35 bindingName:v36 surfaceProperties:v41];
          if (v42)
          {
            CVPixelBufferRef pixelBufferOut = 0;
            CVPixelBufferCreateWithIOSurface(v33, v42, 0, &pixelBufferOut);
            if (!pixelBufferOut) {
              return 4294935576;
            }
            [v36 UTF8String];
            int v43 = espresso_network_bind_direct_cvpixelbuffer();
            v44 = pixelBufferOut;
            if (v43) {
              return 4294935586;
            }
          }
        }
        if (v31 == ++v34)
        {
          uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v62 count:16];
          result = 0;
          if (v31) {
            goto LABEL_46;
          }
          return result;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_surfacePropertiesForTensor:(uint64_t)result bindingName:(void *)a2
{
  v14[6] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = 1278226488;
    uint64_t v5 = bweis_storageTypeLengthInBytes(65552);
    switch(v5)
    {
      case 1:
        unint64_t v6 = 1;
        goto LABEL_8;
      case 4:
        uint64_t v4 = 1111970369;
        unint64_t v6 = 4;
        goto LABEL_8;
      case 2:
        uint64_t v4 = 1278226536;
        unint64_t v6 = 1;
LABEL_8:
        uint64_t v7 = a2[13];
        unint64_t v8 = (a2[12] - 1) / v6;
        uint64_t v9 = a2[11];
        unint64_t v10 = a2[10] * v6;
        unint64_t v11 = ((v10 * v5 - 1) & 0xFFFFFFFFFFFFFFC0) + 64;
        unint64_t v12 = (v9 + v9 * v8) * v7;
        v13[0] = *MEMORY[0x1E4F2EFD8];
        v14[0] = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
        v13[1] = *MEMORY[0x1E4F2EFE0];
        v14[1] = [NSNumber numberWithUnsignedLong:v11];
        v13[2] = *MEMORY[0x1E4F2F0E8];
        v14[2] = [NSNumber numberWithUnsignedLong:v12];
        v13[3] = *MEMORY[0x1E4F2F150];
        v14[3] = [NSNumber numberWithUnsignedInt:v4];
        v13[4] = *MEMORY[0x1E4F2F2C0];
        v14[4] = [NSNumber numberWithUnsignedLong:v10];
        v13[5] = *MEMORY[0x1E4F2F128];
        v14[5] = objc_msgSend(NSString, "stringWithFormat:", @"BWInference %d", *(unsigned int *)(v3 + 8));
        return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
    }
    return 0;
  }
  return result;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  uint64_t v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  int v5 = [(BWEspressoInferenceProvider *)self prepareForExecution];
  if (v5)
  {
    int v6 = v5;
  }
  else if (espresso_plan_execute_sync())
  {
    int v6 = -31710;
  }
  else
  {
    int v6 = 0;
  }
  if (*v4 == 1) {
    kdebug_trace();
  }
  return v6;
}

- (BWInferenceSubmittable)submittable
{
  if ((*((_DWORD *)self + 3) | 2) != 3) {
    return 0;
  }
  return self;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (BWInferencePropagatable)propagatable
{
  return self->_propagator;
}

- (BWEspressoInferenceTensorMemoryProvider)tensorMemoryProvider
{
  return self->_tensorMemoryProvider;
}

- (void)setTensorMemoryProvider:(id)a3
{
  tensorMemoryProvider = self->_tensorMemoryProvider;
  if (tensorMemoryProvider != a3)
  {

    self->_tensorMemoryProvider = (BWEspressoInferenceTensorMemoryProvider *)a3;
  }
}

- (int)prepareForExecution
{
  return -[BWEspressoInferenceProvider _prepareWithWorkQueue:]((uint64_t)self, 0);
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  espressoPlan = self->_espressoPlan;
  uint64_t v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!espressoPlan || espressoPlan != self->_espressoNetwork.plan) {
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [(BWEspressoInferenceProvider *)self type];
    kdebug_trace();
  }
  uint64_t v11 = -[BWEspressoInferenceProvider _ensureEspressoBindingsUsingStorage:]((uint64_t)self, a4);
  if (v11)
  {
    uint64_t v12 = v11;
  }
  else
  {
    if (espresso_plan_execute_sync())
    {
LABEL_7:
      uint64_t v12 = 4294935586;
      goto LABEL_9;
    }
    uint64_t v12 = 0;
  }
LABEL_9:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  pixelBuffersLockedDuringExecution = self->_pixelBuffersLockedDuringExecution;
  uint64_t v14 = [(NSMutableArray *)pixelBuffersLockedDuringExecution countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(pixelBuffersLockedDuringExecution);
        }
        CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*((void *)&v19 + 1) + 8 * i), 1uLL);
      }
      uint64_t v15 = [(NSMutableArray *)pixelBuffersLockedDuringExecution countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
  [(NSMutableArray *)self->_pixelBuffersLockedDuringExecution removeAllObjects];
  if (*v9 == 1)
  {
    [(BWEspressoInferenceProvider *)self type];
    kdebug_trace();
  }
  if (a6) {
    (*((void (**)(id, uint64_t, BWEspressoInferenceProvider *))a6 + 2))(a6, v12, self);
  }
  return v12;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  int v11 = [(BWInferencePropagatable *)self->_propagator allowsAsyncPropagation];
  espressoPlan = self->_espressoPlan;
  if (!espressoPlan
    || espressoPlan != self->_espressoNetwork.plan
    || (int v13 = v11, ![(BWEspressoInferenceProvider *)self submittable]))
  {
    uint64_t v14 = 4294935586;
LABEL_21:
    int v16 = 1;
    goto LABEL_10;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [(BWEspressoInferenceProvider *)self type];
    kdebug_trace();
  }
  uint64_t v14 = -[BWEspressoInferenceProvider _ensureEspressoBindingsUsingStorage:]((uint64_t)self, a4);
  if (v14) {
    goto LABEL_21;
  }
  unsigned int executionTarget = self->_executionTarget;
  int v16 = 1;
  if (executionTarget > 5) {
    goto LABEL_10;
  }
  if (((1 << executionTarget) & 0x31) != 0) {
    goto LABEL_9;
  }
  if (((1 << executionTarget) & 0xA) != 0)
  {
    if (!a6)
    {
LABEL_9:
      uint64_t v14 = 4294935586;
      goto LABEL_10;
    }
    if (espresso_plan_submit())
    {
      uint64_t v14 = 4294935586;
      if (!a7) {
        return v14;
      }
      goto LABEL_16;
    }
    uint64_t v14 = 0;
    int v16 = v13;
  }
LABEL_10:
  int v13 = v16;
  if (!a7) {
    return v14;
  }
LABEL_16:
  if (v13) {
    (*((void (**)(id, uint64_t, BWEspressoInferenceProvider *))a7 + 2))(a7, v14, self);
  }
  return v14;
}

uint64_t __113__BWEspressoInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2 && *(_DWORD *)(a2 + 4)) {
    uint64_t v3 = 4294935586;
  }
  else {
    uint64_t v3 = 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*((void *)&v10 + 1) + 8 * i), 1uLL);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [*(id *)(*(void *)(a1 + 32) + 168) removeAllObjects];
  uint64_t result = *(void *)(a1 + 40);
  if (result && *(unsigned char *)(a1 + 52)) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, v3, *(void *)(a1 + 32));
  }
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [*(id *)(a1 + 32) type];
    return kdebug_trace();
  }
  return result;
}

- (id)bindEspressoInput:(id)a3 fromMetadataUsingKeys:(id)a4
{
  uint64_t v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4];
  [(NSMutableArray *)self->_inputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v6];
  return v6;
}

- (id)bindEspressoOutput:(id)a3 asMetadataUsingKey:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [BWInferenceMetadataRequirement alloc];
  v10[0] = a4;
  unint64_t v8 = -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:](v7, "initWithMetadataKeys:mappingOption:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1], 1);
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v8];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v8];
  return v8;
}

- (id)bindEspressoOutput:(id)a3 asConsolidatedMetadataUsingKeys:(id)a4
{
  uint64_t v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4 mappingOption:2];
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v6];
  return v6;
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