@interface _MLCGPUSoftmax
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5;
- (_MLCGPUSoftmax)initWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5;
@end

@implementation _MLCGPUSoftmax

- (_MLCGPUSoftmax)initWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5
{
  id v6 = a3;
  v44.receiver = self;
  v44.super_class = (Class)_MLCGPUSoftmax;
  v7 = [(_MLCGPUSoftmax *)&v44 init];
  v8 = v7;
  if (v7)
  {
    v37 = v7;
    v9 = [v6 deviceList];
    uint64_t v10 = [v9 count];

    v39 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v10)
    {
      uint64_t v11 = 0;
      id v40 = v6;
      uint64_t v41 = v10;
      do
      {
        v12 = [v6 deviceList];
        v13 = [v12 objectAtIndexedSubscript:v11];

        v14 = [v6 gpuLibrary];
        v15 = [v14 objectAtIndexedSubscript:v11];
        v16 = v15;
        if (a4)
        {
          uint64_t v17 = [v15 newFunctionWithName:@"log_softmax_forward_fast"];

          v18 = [v6 gpuLibrary];
          v19 = [v18 objectAtIndexedSubscript:v11];
          v20 = (void *)[v19 newFunctionWithName:@"log_softmax_forward"];

          v21 = [v6 gpuLibrary];
          v22 = [v21 objectAtIndexedSubscript:v11];
          v23 = v22;
          v24 = @"log_softmax_gradient";
        }
        else
        {
          uint64_t v17 = [v15 newFunctionWithName:@"softmax_forward_fast"];

          v25 = [v6 gpuLibrary];
          v26 = [v25 objectAtIndexedSubscript:v11];
          v20 = (void *)[v26 newFunctionWithName:@"softmax_forward"];

          v21 = [v6 gpuLibrary];
          v22 = [v21 objectAtIndexedSubscript:v11];
          v23 = v22;
          v24 = @"softmax_gradient";
        }
        v27 = (void *)[v22 newFunctionWithName:v24];

        v28 = (void *)[v13 newComputePipelineStateWithFunction:v20 error:0];
        v29 = (void *)v17;
        v30 = (void *)[v13 newComputePipelineStateWithFunction:v17 error:0];
        uint64_t v31 = [v13 newComputePipelineStateWithFunction:v27 error:0];
        v32 = (void *)v31;
        if (v28 && v31)
        {
          v33 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v28 gradientKernel:v31];
          v34 = v33;
          if (v33)
          {
            [v33 setIsMPSKernel:0];
            [v34 setMetalKernelType:3];
            [v34 setSoftmaxAxis:a5];
            [v34 setForwardStatisticsKernel:v30];
            [v34 setSourceOfForwardNeededForGradient:0];
            [v34 setResultOfForwardNeededForGradient:1];
            [v34 setLayer:objc_opt_class()];
            [v39 addObject:v34];
          }

          id v6 = v40;
          uint64_t v10 = v41;
        }

        ++v11;
      }
      while (v10 != v11);
    }
    v35 = (void *)[v39 copy];
    v8 = v37;
    v43.receiver = v37;
    v43.super_class = (Class)_MLCGPUSoftmax;
    [(_MLCGPULayer *)&v43 setDeviceOps:v35];
  }
  return v8;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithDevice:v8 operation:v6 dimension:a5];

  return v9;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return 1;
}

@end