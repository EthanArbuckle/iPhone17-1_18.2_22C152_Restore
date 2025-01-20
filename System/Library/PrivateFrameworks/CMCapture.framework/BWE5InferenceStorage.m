@interface BWE5InferenceStorage
+ (void)initialize;
- (BWE5InferenceStorage)initWithOperation:(e5rt_execution_stream_operation *)a3 stream:(e5rt_execution_stream *)a4 bindingNameByRequirement:(id)a5 requirementsNeedingPixelBuffers:(id)a6 requirementsNeedingPixelBufferPools:(id)a7 requirementsNeedingTensors:(id)a8;
- (e5rt_execution_stream)stream;
- (e5rt_execution_stream_operation)operation;
- (e5rt_io_port)tensorPortForRequirement:(id)a3;
- (id)bindingNameForRequirement:(id)a3;
- (id)newMetadataDictionarySatisfyingRequirement:(id)a3;
- (void)_newPackedFloat32SurfaceForRequirement:(BOOL *)a3 elementCount:;
- (void)clear;
- (void)dealloc;
- (void)setTensorPort:(e5rt_io_port *)a3 forRequirement:(id)a4;
@end

@implementation BWE5InferenceStorage

- (void)clear
{
  v2.receiver = self;
  v2.super_class = (Class)BWE5InferenceStorage;
  [(BWInferenceProviderStorage *)&v2 clear];
}

+ (void)initialize
{
}

- (BWE5InferenceStorage)initWithOperation:(e5rt_execution_stream_operation *)a3 stream:(e5rt_execution_stream *)a4 bindingNameByRequirement:(id)a5 requirementsNeedingPixelBuffers:(id)a6 requirementsNeedingPixelBufferPools:(id)a7 requirementsNeedingTensors:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)BWE5InferenceStorage;
  v12 = [(BWInferenceProviderStorage *)&v17 initWithRequirementsNeedingPixelBuffers:a6 requirementsNeedingPixelBufferPools:a7];
  v13 = v12;
  if (v12)
  {
    v12->_operation = a3;
    v12->_stream = a4;
    v12->_bindingNameByRequirement = (NSDictionary *)[a5 copy];
    uint64_t v14 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    uint64_t v15 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:259];
    v13->_tensorPortByRequirement = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v14, v15, objc_msgSend(a8, "count"));
  }
  return v13;
}

- (void)dealloc
{
  e5rt_execution_stream_operation_release();
  e5rt_execution_stream_release();
  v3 = [(NSMapTable *)self->_tensorPortByRequirement objectEnumerator];
  v4 = v3;
  while ([(NSEnumerator *)v3 nextObject])
  {
    e5rt_io_port_release();
    v3 = v4;
  }

  v5.receiver = self;
  v5.super_class = (Class)BWE5InferenceStorage;
  [(BWInferenceProviderStorage *)&v5 dealloc];
}

- (id)bindingNameForRequirement:(id)a3
{
  return [(NSDictionary *)self->_bindingNameByRequirement objectForKeyedSubscript:a3];
}

- (e5rt_io_port)tensorPortForRequirement:(id)a3
{
  return (e5rt_io_port **)[(NSMapTable *)self->_tensorPortByRequirement objectForKey:a3];
}

- (void)setTensorPort:(e5rt_io_port *)a3 forRequirement:(id)a4
{
  if ([(NSMapTable *)self->_tensorPortByRequirement objectForKey:a4]) {
    e5rt_io_port_release();
  }
  tensorPortByRequirement = self->_tensorPortByRequirement;
  [(NSMapTable *)tensorPortByRequirement setObject:a3 forKey:a4];
}

- (void)_newPackedFloat32SurfaceForRequirement:(BOOL *)a3 elementCount:
{
  if (result)
  {
    BOOL v4 = ![result tensorPortForRequirement:a2]
      || e5rt_io_port_retain_tensor_desc()
      || e5rt_io_port_retain_buffer_object()
      || e5rt_tensor_desc_get_rank();
    if (a3) {
      *a3 = v4;
    }
    return 0;
  }
  return result;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = (void *)[a3 metadataKeys];
  unint64_t v28 = 0;
  v7 = (__IOSurface *)-[BWE5InferenceStorage _newPackedFloat32SurfaceForRequirement:elementCount:](self, (uint64_t)a3, (BOOL *)&v28);
  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v5;
  }
  v8 = v7;
  BaseAddress = IOSurfaceGetBaseAddress(v7);
  int v10 = [a3 mappingOption];
  int v11 = v10;
  if (!v10 || v10 == 2)
  {
    unint64_t v19 = [v6 count];
    if (v19 >= v28) {
      unint64_t v20 = v28;
    }
    else {
      unint64_t v20 = v19;
    }
    if (!v20) {
      goto LABEL_22;
    }
    for (uint64_t i = 0; i != v20; ++i)
    {
      uint64_t v22 = [v6 objectAtIndexedSubscript:i];
      LODWORD(v23) = BaseAddress[i];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v23), v22);
    }
    if (v11 != 2 || v28 <= v20) {
      goto LABEL_22;
    }
    uint64_t v24 = [v6 objectAtIndexedSubscript:v20 - 1];
    uint64_t v25 = [v5 objectForKeyedSubscript:v24];
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v25, 0);
    while (v20 < v28)
    {
      LODWORD(v26) = BaseAddress[v20];
      objc_msgSend(v13, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v26));
      ++v20;
    }
    objc_super v17 = v5;
    v18 = v13;
    uint64_t v16 = v24;
    goto LABEL_21;
  }
  if (v10 == 1)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v13 = (void *)[v12 initWithCapacity:v28];
    if (v28)
    {
      for (unint64_t j = 0; j < v28; ++j)
      {
        LODWORD(v14) = BaseAddress[j];
        objc_msgSend(v13, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v14));
      }
    }
    uint64_t v16 = [v6 firstObject];
    objc_super v17 = v5;
    v18 = v13;
LABEL_21:
    [v17 setObject:v18 forKeyedSubscript:v16];
  }
LABEL_22:
  CFRelease(v8);
  return v5;
}

- (e5rt_execution_stream_operation)operation
{
  return self->_operation;
}

- (e5rt_execution_stream)stream
{
  return self->_stream;
}

@end