@interface BWE5InferenceProvider
+ (void)initialize;
- (BWE5InferenceProvider)initWithType:(int)a3 networkURL:(id)a4 networkConfiguration:(id)a5 context:(id)a6 executionTarget:(int)a7 schedulerPriority:(unsigned int)a8 preventionReasons:(id)a9 resourceProvider:(id)a10 allowedCompressionDirection:(unsigned int)a11;
- (BWEspressoInferenceTensorMemoryProvider)tensorMemoryProvider;
- (BWInferenceExtractable)extractable;
- (BWInferencePropagatable)propagatable;
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
- (uint64_t)_ensureBindingsUsingStorage:(uint64_t)result;
- (uint64_t)_prepare;
- (uint64_t)_unbindUsingStorage:(uint64_t)result;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)setPropagatable:(id)a3;
- (void)setTensorMemoryProvider:(id)a3;
@end

@implementation BWE5InferenceProvider

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
  return self->_allowedCompressionDirection;
}

- (id)bindEspressoOutput:(id)a3 asMetadataUsingKeys:(id)a4
{
  v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4];
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v6];
  return v6;
}

- (id)bindEspressoOutput:(id)a3 asMetadataUsingKey:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v7 = [BWInferenceMetadataRequirement alloc];
  v10[0] = a4;
  v8 = -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:](v7, "initWithMetadataKeys:mappingOption:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1], 1);
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v8];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v8];
  return v8;
}

- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5 count:(unint64_t)a6
{
  v8 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:a4 videoFormat:a5 count:a6];
  [(NSMutableArray *)self->_outputVideoRequirements addObject:v8];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v8];
  return v8;
}

- (int)type
{
  return self->_type;
}

- (BWInferencePropagatable)propagatable
{
  return self->_propagator;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  return 0;
}

- (id)newStorage
{
  v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_inputMetadataRequirements];
  [v3 addObjectsFromArray:self->_outputMetadataRequirements];
  v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [(BWE5InferenceProvider *)self type];
    kdebug_trace();
  }
  [(NSURL *)self->_networkURL fileSystemRepresentation];
  objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"BWInference type %d", self->_type), "UTF8String");
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation()
    || e5rt_execution_stream_create())
  {
    if (*v4 == 1)
    {
      [(BWE5InferenceProvider *)self type];
      kdebug_trace();
    }
    e5rt_get_last_error_message();
    e5rt_execution_stream_operation_release();
    e5rt_execution_stream_release();
    return 0;
  }
  else
  {
    if (*v4 == 1)
    {
      [(BWE5InferenceProvider *)self type];
      kdebug_trace();
    }
    return [[BWE5InferenceStorage alloc] initWithOperation:0 stream:0 bindingNameByRequirement:self->_bindingNamesByRequirement requirementsNeedingPixelBuffers:self->_inputVideoRequirements requirementsNeedingPixelBufferPools:self->_outputVideoRequirements requirementsNeedingTensors:v3];
  }
}

- (uint64_t)_prepare
{
  if (a1 && !a1[5]) {
    a1[5] = [[BWInferenceSampleBufferPropagator alloc] initWithVideoRequirements:a1[9] cloneRequirements:a1[10] metadataRequirements:a1[12]];
  }
  return 0;
}

- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5
{
  return [(BWE5InferenceProvider *)self bindEspressoOutput:a3 asAttachedMediaUsingKey:a4 withVideoFormat:a5 count:1];
}

- (BWE5InferenceProvider)initWithType:(int)a3 networkURL:(id)a4 networkConfiguration:(id)a5 context:(id)a6 executionTarget:(int)a7 schedulerPriority:(unsigned int)a8 preventionReasons:(id)a9 resourceProvider:(id)a10 allowedCompressionDirection:(unsigned int)a11
{
  v19.receiver = self;
  v19.super_class = (Class)BWE5InferenceProvider;
  v14 = [(BWE5InferenceProvider *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v14->_executionTarget = a7;
    v14->_networkURL = (NSURL *)[a4 copy];
    int MachThreadPriorityValue = FigThreadGetMachThreadPriorityValue();
    if (MachThreadPriorityValue >= (int)FigThreadGetMachThreadPriorityValue()) {
      int v17 = 2;
    }
    else {
      int v17 = 3;
    }
    v15->_anePriority = v17;
    v15->_preventionReasons = (NSSet *)[a9 copy];
    v15->_allowedCompressionDirection = 0;
    v15->_bindingNamesByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15->_inputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15->_outputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15->_inputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15->_outputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v15;
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
  return [(BWE5InferenceProvider *)self bindEspressoInput:a3 fromAttachedMediaUsingKey:a4 withVideoFormat:a5 count:1];
}

- (void)setPropagatable:(id)a3
{
  propagator = self->_propagator;
  if (propagator != a3)
  {

    self->_propagator = (BWInferencePropagatable *)a3;
  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; executionTarget = %lu; networkURL = %@>",
                       objc_opt_class(),
                       self,
                       self->_executionTarget,
                       self->_networkURL);
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWE5InferenceProvider;
  [(BWE5InferenceProvider *)&v3 dealloc];
}

- (uint64_t)_ensureBindingsUsingStorage:(uint64_t)result
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v4 = *(void **)(result + 64);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v10 = [a2 pixelBufferForRequirement:v9];
          if (!v10) {
            return 4294935584;
          }
          v11 = (__CVBuffer *)v10;
          uint64_t v12 = [a2 bindingNameForRequirement:v9];
          if (!v12) {
            return 4294935584;
          }
          v13 = (void *)v12;
          uint64_t v38 = 0;
          [a2 operation];
          [v13 UTF8String];
          if (!e5rt_execution_stream_operation_retain_input_port())
          {
            uint64_t v37 = 0;
            CVPixelBufferGetIOSurface(v11);
            if (!e5rt_surface_object_create_from_iosurface()
              && !e5rt_io_port_bind_surface_object()
              && !e5rt_surface_object_release()
              && !e5rt_io_port_release())
            {
              continue;
            }
          }
LABEL_52:
          e5rt_get_last_error_message();
          if (v9) {
            [a2 bindingNameForRequirement:v9];
          }
          return 4294935586;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v14 = *(void **)(v3 + 72);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          uint64_t v19 = [a2 bindingNameForRequirement:v9];
          if (!v19) {
            return 4294935579;
          }
          v20 = (void *)v19;
          v21 = (void *)[a2 pixelBufferForRequirement:v9];
          if (!v21)
          {
            v21 = objc_msgSend((id)objc_msgSend(a2, "pixelBufferPoolForRequirement:", v9), "newPixelBuffer");
            [a2 setPixelBuffer:v21 forRequirement:v9];
            if (!v21) {
              return 4294935579;
            }
            CFRelease(v21);
          }
          uint64_t v38 = 0;
          [a2 operation];
          [v20 UTF8String];
          if (e5rt_execution_stream_operation_retain_output_port()) {
            goto LABEL_52;
          }
          uint64_t v37 = 0;
          CVPixelBufferGetIOSurface((CVPixelBufferRef)v21);
          if (e5rt_surface_object_create_from_iosurface()
            || e5rt_io_port_bind_surface_object()
            || e5rt_surface_object_release()
            || e5rt_io_port_release())
          {
            goto LABEL_52;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v22 = *(void **)(v3 + 96);
    result = [v22 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (result)
    {
      uint64_t v23 = result;
      uint64_t v24 = *(void *)v30;
      while (2)
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * v25);
          if (![a2 tensorPortForRequirement:v9])
          {
            uint64_t v26 = [a2 bindingNameForRequirement:v9];
            if (!v26) {
              return 4294935577;
            }
            v27 = (void *)v26;
            v28 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
            [a2 operation];
            [v27 UTF8String];
            if (e5rt_execution_stream_operation_retain_output_port())
            {
              free(v28);
              goto LABEL_52;
            }
            [a2 setTensorPort:v28 forRequirement:v9];
            uint64_t v38 = 0;
            if (e5rt_io_port_retain_tensor_desc()) {
              goto LABEL_52;
            }
            uint64_t v37 = 0;
            if (e5rt_tensor_desc_alloc_buffer_object()
              || e5rt_io_port_bind_buffer_object()
              || e5rt_buffer_object_release()
              || e5rt_tensor_desc_release())
            {
              goto LABEL_52;
            }
          }
          ++v25;
        }
        while (v23 != v25);
        result = [v22 countByEnumeratingWithState:&v29 objects:v43 count:16];
        uint64_t v23 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_unbindUsingStorage:(uint64_t)result
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v23 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v4 = *(void **)(result + 64);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = (void *)[a2 bindingNameForRequirement:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          [a2 operation];
          [v9 UTF8String];
          e5rt_execution_stream_operation_retain_input_port();
          e5rt_io_port_bind_surface_object();
          e5rt_io_port_release();
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v6);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = *(void **)(v3 + 72);
    result = [v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
    if (result)
    {
      uint64_t v11 = result;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = (void *)[a2 bindingNameForRequirement:*(void *)(*((void *)&v15 + 1) + 8 * v13)];
          [a2 operation];
          [v14 UTF8String];
          e5rt_execution_stream_operation_retain_output_port();
          e5rt_io_port_bind_surface_object();
          e5rt_io_port_release();
          ++v13;
        }
        while (v11 != v13);
        result = [v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
        uint64_t v11 = result;
      }
      while (result);
    }
  }
  return result;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  -[BWE5InferenceProvider _prepare](self);
  if (*v4 == 1) {
    kdebug_trace();
  }
  return 0;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  uint64_t v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [(BWE5InferenceProvider *)self type];
    kdebug_trace();
  }
  uint64_t v10 = -[BWE5InferenceProvider _ensureBindingsUsingStorage:]((uint64_t)self, a4);
  if (v10)
  {
    uint64_t v11 = v10;
  }
  else if (self->_executionTarget == 3 {
         && ([a4 stream], e5rt_execution_stream_set_ane_execution_priority())
  }
         || ([a4 stream],
             [a4 operation],
             e5rt_execution_stream_encode_operation())
         || ([a4 stream], e5rt_execution_stream_execute_sync())
         || ([a4 stream], e5rt_execution_stream_reset()))
  {
    e5rt_get_last_error_message();
    uint64_t v11 = 4294935586;
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (*v9 == 1)
  {
    [(BWE5InferenceProvider *)self type];
    kdebug_trace();
  }
  (*((void (**)(id, uint64_t, BWE5InferenceProvider *))a6 + 2))(a6, v11, self);
  -[BWE5InferenceProvider _unbindUsingStorage:]((uint64_t)self, a4);
  return v11;
}

- (int)prepareForExecution
{
  return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [(BWE5InferenceProvider *)self type];
    kdebug_trace();
  }
  uint64_t v10 = -[BWE5InferenceProvider _ensureBindingsUsingStorage:]((uint64_t)self, a4);
  if (v10)
  {
    uint64_t v11 = v10;
  }
  else
  {
    [a4 stream];
    [a4 operation];
    if (!e5rt_execution_stream_encode_operation())
    {
      [a4 stream];
      if (!e5rt_execution_stream_submit_async())
      {
        LODWORD(v11) = 0;
        return v11;
      }
    }
    e5rt_get_last_error_message();
    uint64_t v11 = 4294935586;
  }
  (*((void (**)(id, uint64_t, BWE5InferenceProvider *))a7 + 2))(a7, v11, self);
  return v11;
}

uint64_t __107__BWE5InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stream];
  e5rt_execution_stream_reset();
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [*(id *)(a1 + 40) type];
    kdebug_trace();
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  return -[BWE5InferenceProvider _unbindUsingStorage:](v2, v3);
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)bindEspressoInput:(id)a3 fromMetadataUsingKeys:(id)a4
{
  uint64_t v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4];
  [(NSMutableArray *)self->_inputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v6];
  return v6;
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  uint64_t v5 = [[BWInferenceCloneVideoRequirement alloc] initWithAttachedMediaKey:a4 sourceVideoRequirement:a3];
  [(NSMutableArray *)self->_cloneVideoRequirements addObject:v5];
  return v5;
}

- (id)bindEspressoOutput:(id)a3 asConsolidatedMetadataUsingKeys:(id)a4
{
  uint64_t v6 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a4 mappingOption:2];
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v6];
  [(NSMutableDictionary *)self->_bindingNamesByRequirement setObject:a3 forKeyedSubscript:v6];
  return v6;
}

- (int)executionTarget
{
  return self->_executionTarget;
}

- (NSSet)preventionReasons
{
  return self->_preventionReasons;
}

- (BWEspressoInferenceTensorMemoryProvider)tensorMemoryProvider
{
  return self->_tensorMemoryProvider;
}

- (void)setTensorMemoryProvider:(id)a3
{
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