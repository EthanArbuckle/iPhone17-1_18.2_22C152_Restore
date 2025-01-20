@interface _MLCGPUGather
+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4;
- (_MLCGPUGather)initWithDevice:(id)a3 dimension:(unint64_t)a4;
@end

@implementation _MLCGPUGather

- (_MLCGPUGather)initWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_MLCGPUGather;
  v6 = [(_MLCGPUGather *)&v29 init];
  v7 = v6;
  if (v6)
  {
    v26 = v6;
    v8 = [v5 deviceList];
    uint64_t v9 = [v8 count];

    v10 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        v12 = [v5 deviceList];
        v13 = [v12 objectAtIndexedSubscript:i];

        v14 = [v5 gpuLibrary];
        v15 = [v14 objectAtIndexedSubscript:i];
        v16 = (void *)[v15 newFunctionWithName:@"gather_forward"];

        v17 = (void *)[v13 newComputePipelineStateWithFunction:v16 error:0];
        v18 = [v5 gpuLibrary];
        v19 = [v18 objectAtIndexedSubscript:i];
        v20 = (void *)[v19 newFunctionWithName:@"scatter_forward"];

        v21 = (void *)[v13 newComputePipelineStateWithFunction:v20 error:0];
        v22 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v17 gradientKernel:v21];
        v23 = v22;
        if (v22)
        {
          [v22 setIsMPSKernel:0];
          [v23 setMetalKernelType:14];
          [v23 setScatterGatherDimension:a4];
          [v23 setScatterReduceType:1];
          [v23 setLayer:objc_opt_class()];
          [v10 addObject:v23];
        }
      }
    }
    v24 = (void *)[v10 copy];
    v7 = v26;
    v28.receiver = v26;
    v28.super_class = (Class)_MLCGPUGather;
    [(_MLCGPULayer *)&v28 setDeviceOps:v24];
  }
  return v7;
}

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6 dimension:a4];

  return v7;
}

@end