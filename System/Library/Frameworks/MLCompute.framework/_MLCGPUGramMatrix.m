@interface _MLCGPUGramMatrix
+ (id)layerWithDevice:(id)a3 scale:(float)a4;
- (_MLCGPUGramMatrix)initWithDevice:(id)a3 scale:(float)a4;
@end

@implementation _MLCGPUGramMatrix

- (_MLCGPUGramMatrix)initWithDevice:(id)a3 scale:(float)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_MLCGPUGramMatrix;
  v7 = [(_MLCGPUGramMatrix *)&v30 init];
  v8 = v7;
  if (v7)
  {
    v28 = v7;
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
        v17 = (void *)[v16 newFunctionWithName:@"gram_matrix_forward"];

        v18 = (void *)[v14 newComputePipelineStateWithFunction:v17 error:0];
        v19 = [v6 gpuLibrary];
        v20 = [v19 objectAtIndexedSubscript:i];
        v21 = (void *)[v20 newFunctionWithName:@"gram_matrix_gradient"];

        v22 = (void *)[v14 newComputePipelineStateWithFunction:v21 error:0];
        v23 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v18 gradientKernel:v22];
        v24 = v23;
        if (v23)
        {
          [v23 setIsMPSKernel:0];
          [v24 setMetalKernelType:18];
          *(float *)&double v25 = a4;
          [v24 setGramMatrixScale:v25];
          [v24 setLayer:objc_opt_class()];
          [v24 setSourceOfForwardNeededForGradient:1];
          [v24 setResultOfForwardNeededForGradient:0];
          [v11 addObject:v24];
        }
      }
    }
    v26 = (void *)[v11 copy];
    v8 = v28;
    v29.receiver = v28;
    v29.super_class = (Class)_MLCGPUGramMatrix;
    [(_MLCGPULayer *)&v29 setDeviceOps:v26];
  }
  return v8;
}

+ (id)layerWithDevice:(id)a3 scale:(float)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  *(float *)&double v8 = a4;
  v9 = (void *)[v7 initWithDevice:v6 scale:v8];

  return v9;
}

@end