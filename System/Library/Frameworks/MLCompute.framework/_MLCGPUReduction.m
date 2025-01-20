@interface _MLCGPUReduction
+ (id)layerWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6;
- (_MLCGPUReduction)initWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6;
@end

@implementation _MLCGPUReduction

- (_MLCGPUReduction)initWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_MLCGPUReduction;
  v9 = [(_MLCGPUReduction *)&v35 init];
  v10 = v9;
  if (v9)
  {
    aSelector = a2;
    v31 = v9;
    v11 = [v8 deviceList];
    uint64_t v12 = [v11 count];

    v32 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v12)
    {
      uint64_t v13 = 0;
      if ((a4 & 0xFFFFFFFE) == 8) {
        v14 = @"reduce_forward_any_all";
      }
      else {
        v14 = @"reduce_forward";
      }
      do
      {
        v15 = [v8 deviceList];
        v16 = [v15 objectAtIndexedSubscript:v13];

        v17 = [v8 gpuLibrary];
        v18 = [v17 objectAtIndexedSubscript:v13];
        v19 = (void *)[v18 newFunctionWithName:v14];

        v20 = (void *)[v16 newComputePipelineStateWithFunction:v19 error:0];
        v21 = [v8 gpuLibrary];
        v22 = [v21 objectAtIndexedSubscript:v13];
        v23 = (void *)[v22 newFunctionWithName:@"reduce_gradient"];

        v24 = (void *)[v16 newComputePipelineStateWithFunction:v23 error:0];
        if ((a4 - 1) >= 9)
        {
          v25 = +[MLCLog framework];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v29 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            v37 = v29;
            __int16 v38 = 1024;
            int v39 = a4;
            _os_log_error_impl(&dword_1DD0C9000, v25, OS_LOG_TYPE_ERROR, "%@: unknown reduceType type = %d", buf, 0x12u);
          }
        }
        if (v20)
        {
          v26 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v20 gradientKernel:v24];
          [v26 setSourceOfForwardNeededForGradient:0];
          [v26 setResultOfForwardNeededForGradient:0];
          if ((a4 - 3) >= 2)
          {
            if (a4 == 7) {
              [v26 setSourceOfForwardNeededForGradient:1];
            }
          }
          else
          {
            [v26 setSourceOfForwardNeededForGradient:1];
            [v26 setResultOfForwardNeededForGradient:1];
          }
          if (v26) {
            [v32 addObject:v26];
          }
        }
        ++v13;
      }
      while (v12 != v13);
    }
    v27 = (void *)[v32 copy];
    v10 = v31;
    v34.receiver = v31;
    v34.super_class = (Class)_MLCGPUReduction;
    [(_MLCGPULayer *)&v34 setDeviceOps:v27];
  }
  return v10;
}

+ (id)layerWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithDevice:v11 reduceType:v7 dimensions:v10 sourceShapeCount:a6];

  return v12;
}

@end