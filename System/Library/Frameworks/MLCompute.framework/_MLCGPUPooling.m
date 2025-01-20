@interface _MLCGPUPooling
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 paddingSizes:(unint64_t)a5[4];
- (_MLCGPUPooling)initWithDevice:(id)a3 descriptor:(id)a4 paddingSizes:(unint64_t)a5[4];
@end

@implementation _MLCGPUPooling

- (_MLCGPUPooling)initWithDevice:(id)a3 descriptor:(id)a4 paddingSizes:(unint64_t)a5[4]
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)_MLCGPUPooling;
  v10 = [(_MLCGPUPooling *)&v60 init];
  v11 = v10;
  if (v10)
  {
    aSelector = a2;
    v56 = v10;
    v58 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v12 = [v8 deviceList];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      unint64_t v15 = 0;
      *(void *)&long long v14 = 138412546;
      long long v54 = v14;
      do
      {
        v16 = objc_msgSend(v8, "deviceList", v54);
        v17 = [v16 objectAtIndexedSubscript:v15];

        int v18 = [v9 poolingType];
        if (v18 == 3)
        {
          v39 = [v8 gpuLibrary];
          v40 = [v39 objectAtIndexedSubscript:v15];
          v41 = (void *)[v40 newFunctionWithName:@"pooling_l2norm_forward"];

          v22 = (void *)[v17 newComputePipelineStateWithFunction:v41 error:0];
          v42 = [v8 gpuLibrary];
          v43 = [v42 objectAtIndexedSubscript:v15];
          v25 = (void *)[v43 newFunctionWithName:@"pooling_l2norm_gradient"];

          v26 = (void *)[v17 newComputePipelineStateWithFunction:v25 error:0];
          uint64_t v38 = 17;
        }
        else if (v18 == 2)
        {
          int v27 = [v9 countIncludesPadding];
          v28 = [v8 gpuLibrary];
          v29 = [v28 objectAtIndexedSubscript:v15];
          v30 = v29;
          if (v27) {
            v31 = @"pooling_average_include_padding_forward";
          }
          else {
            v31 = @"pooling_average_exclude_padding_forward";
          }
          v32 = (void *)[v29 newFunctionWithName:v31];

          v22 = (void *)[v17 newComputePipelineStateWithFunction:v32 error:0];
          int v33 = [v9 countIncludesPadding];
          v34 = [v8 gpuLibrary];
          v35 = [v34 objectAtIndexedSubscript:v15];
          v36 = v35;
          if (v33) {
            v37 = @"pooling_average_include_padding_gradient";
          }
          else {
            v37 = @"pooling_average_exclude_padding_gradient";
          }
          v25 = (void *)[v35 newFunctionWithName:v37];

          v26 = (void *)[v17 newComputePipelineStateWithFunction:v25 error:0];
          uint64_t v38 = 16;
        }
        else
        {
          if (v18 == 1)
          {
            v19 = [v8 gpuLibrary];
            v20 = [v19 objectAtIndexedSubscript:v15];
            v21 = (void *)[v20 newFunctionWithName:@"pooling_max_forward"];

            v22 = (void *)[v17 newComputePipelineStateWithFunction:v21 error:0];
            v23 = [v8 gpuLibrary];
            v24 = [v23 objectAtIndexedSubscript:v15];
            v25 = (void *)[v24 newFunctionWithName:@"pooling_max_gradient"];

            v26 = (void *)[v17 newComputePipelineStateWithFunction:v25 error:0];
          }
          else
          {
            v44 = +[MLCLog framework];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v50 = NSStringFromSelector(aSelector);
              int v51 = [v9 poolingType];
              *(_DWORD *)buf = v54;
              v62 = v50;
              __int16 v63 = 1024;
              int v64 = v51;
              _os_log_error_impl(&dword_1DD0C9000, v44, OS_LOG_TYPE_ERROR, "%@: Unknown pooling type %d", buf, 0x12u);
            }
            v22 = 0;
            v26 = 0;
            v25 = 0;
          }
          uint64_t v38 = 15;
        }
        v45 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v22 gradientKernel:v26];
        v46 = v45;
        if (v45)
        {
          [v45 setIsMPSKernel:0];
          [v46 setMetalKernelType:v38];
          objc_msgSend(v46, "setKernelSizeInX:", objc_msgSend(v9, "kernelWidth"));
          objc_msgSend(v46, "setKernelSizeInY:", objc_msgSend(v9, "kernelHeight"));
          objc_msgSend(v46, "setStrideInX:", objc_msgSend(v9, "strideInX"));
          objc_msgSend(v46, "setStrideInY:", objc_msgSend(v9, "strideInY"));
          objc_msgSend(v46, "setDilationRateInX:", objc_msgSend(v9, "dilationRateInX"));
          objc_msgSend(v46, "setDilationRateInY:", objc_msgSend(v9, "dilationRateInY"));
          objc_msgSend(v46, "setCountIncludesPadding:", objc_msgSend(v9, "countIncludesPadding"));
          [v46 setPaddingLeft:*a5];
          [v46 setPaddingRight:a5[1]];
          [v46 setPaddingTop:a5[2]];
          [v46 setPaddingBottom:a5[3]];
          [v46 setLayer:objc_opt_class()];
          BOOL v47 = [v9 poolingType] == 3;
          [v46 setSourceOfForwardNeededForGradient:v47];
          [v46 setResultOfForwardNeededForGradient:v47];
          [v58 addObject:v46];
        }

        ++v15;
        v48 = [v8 deviceList];
        unint64_t v49 = [v48 count];
      }
      while (v15 < v49);
    }
    v52 = (void *)[v58 copy];
    v11 = v56;
    v59.receiver = v56;
    v59.super_class = (Class)_MLCGPUPooling;
    [(_MLCGPULayer *)&v59 setDeviceOps:v52];
  }
  return v11;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return 1;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 paddingSizes:(unint64_t)a5[4]
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithDevice:v9 descriptor:v8 paddingSizes:a5];

  return v10;
}

@end