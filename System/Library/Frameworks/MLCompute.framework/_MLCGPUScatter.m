@interface _MLCGPUScatter
+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5;
- (_MLCGPUScatter)initWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5;
@end

@implementation _MLCGPUScatter

- (_MLCGPUScatter)initWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_MLCGPUScatter;
  v7 = [(_MLCGPUScatter *)&v31 init];
  v8 = v7;
  if (v7)
  {
    v27 = v7;
    v9 = [v6 deviceList];
    uint64_t v10 = [v9 count];

    v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v13 = [v6 deviceList];
        v14 = [v13 objectAtIndexedSubscript:i];

        v15 = [v6 gpuLibrary];
        v16 = [v15 objectAtIndexedSubscript:i];
        v17 = (void *)[v16 newFunctionWithName:@"scatter_forward"];

        v18 = (void *)[v14 newComputePipelineStateWithFunction:v17 error:0];
        v19 = [v6 gpuLibrary];
        v20 = [v19 objectAtIndexedSubscript:i];
        v21 = (void *)[v20 newFunctionWithName:@"gather_forward"];

        v22 = (void *)[v14 newComputePipelineStateWithFunction:v21 error:0];
        v23 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v18 gradientKernel:v22];
        v24 = v23;
        if (v23)
        {
          [v23 setIsMPSKernel:0];
          [v24 setMetalKernelType:13];
          [v24 setScatterGatherDimension:a4];
          [v24 setScatterReduceType:a5];
          [v24 setLayer:objc_opt_class()];
          [v24 setSourceOfForwardNeededForGradient:1];
          [v24 setResultOfForwardNeededForGradient:0];
          [v11 addObject:v24];
        }
      }
    }
    v25 = (void *)[v11 copy];
    v8 = v27;
    v30.receiver = v27;
    v30.super_class = (Class)_MLCGPUScatter;
    [(_MLCGPULayer *)&v30 setDeviceOps:v25];
  }
  return v8;
}

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithDevice:v8 dimension:a4 reduceType:v5];

  return v9;
}

@end