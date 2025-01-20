@interface _MLCGPUSelect
+ (id)layerWithDevice:(id)a3;
- (_MLCGPUSelect)initWithDevice:(id)a3;
@end

@implementation _MLCGPUSelect

- (_MLCGPUSelect)initWithDevice:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_MLCGPUSelect;
  v5 = [(_MLCGPUSelect *)&v27 init];
  v6 = v5;
  if (v5)
  {
    v25 = v5;
    v7 = [v4 deviceList];
    uint64_t v8 = [v7 count];

    v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        v11 = [v4 deviceList];
        v12 = [v11 objectAtIndexedSubscript:i];

        v13 = [v4 gpuLibrary];
        v14 = [v13 objectAtIndexedSubscript:i];
        v15 = (void *)[v14 newFunctionWithName:@"select_forward"];

        v16 = (void *)[v12 newComputePipelineStateWithFunction:v15 error:0];
        v17 = [v4 gpuLibrary];
        v18 = [v17 objectAtIndexedSubscript:i];
        v19 = (void *)[v18 newFunctionWithName:@"select_gradient"];

        v20 = (void *)[v12 newComputePipelineStateWithFunction:v19 error:0];
        v21 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v16 gradientKernel:v20];
        v22 = v21;
        if (v21)
        {
          [v21 setIsMPSKernel:0];
          [v22 setMetalKernelType:11];
          [v22 setSourceOfForwardNeededForGradient:0];
          [v22 setResultOfForwardNeededForGradient:0];
          [v22 setLayer:objc_opt_class()];
          [v9 addObject:v22];
        }
      }
    }
    v23 = (void *)[v9 copy];
    v6 = v25;
    v26.receiver = v25;
    v26.super_class = (Class)_MLCGPUSelect;
    [(_MLCGPULayer *)&v26 setDeviceOps:v23];
  }
  return v6;
}

+ (id)layerWithDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDevice:v4];

  return v5;
}

@end