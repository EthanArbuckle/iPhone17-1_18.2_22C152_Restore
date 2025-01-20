@interface _MLCGPUPadding
+ (id)layerWithDevice:(id)a3 paddingType:(int)a4 paddingLeft:(unint64_t)a5 paddingRight:(unint64_t)a6 paddingTop:(unint64_t)a7 paddingBottom:(unint64_t)a8 constantValue:(float)a9 dataType:(int)a10;
- (_MLCGPUPadding)initWithDevice:(id)a3 paddingType:(int)a4 paddingLeft:(unint64_t)a5 paddingRight:(unint64_t)a6 paddingTop:(unint64_t)a7 paddingBottom:(unint64_t)a8 constantValue:(float)a9 dataType:(int)a10;
@end

@implementation _MLCGPUPadding

- (_MLCGPUPadding)initWithDevice:(id)a3 paddingType:(int)a4 paddingLeft:(unint64_t)a5 paddingRight:(unint64_t)a6 paddingTop:(unint64_t)a7 paddingBottom:(unint64_t)a8 constantValue:(float)a9 dataType:(int)a10
{
  uint64_t v11 = *(void *)&a4;
  id v13 = a3;
  v44.receiver = self;
  v44.super_class = (Class)_MLCGPUPadding;
  v14 = [(_MLCGPUPadding *)&v44 init];
  v15 = v14;
  if (v14)
  {
    v37 = v14;
    v16 = [v13 deviceList];
    uint64_t v17 = [v16 count];

    v42 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v17)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        v19 = [v13 deviceList];
        v20 = [v19 objectAtIndexedSubscript:i];

        v21 = [v13 gpuLibrary];
        v22 = [v21 objectAtIndexedSubscript:i];
        v23 = (void *)[v22 newFunctionWithName:@"padding_forward"];

        v24 = (void *)[v20 newComputePipelineStateWithFunction:v23 error:0];
        if (v11 != 3 && v11)
        {
          v25 = [v13 gpuLibrary];
          v26 = [v25 objectAtIndexedSubscript:i];
          v27 = v26;
          v28 = @"padding_gradient_reflect_symmetric";
        }
        else
        {
          v25 = [v13 gpuLibrary];
          v26 = [v25 objectAtIndexedSubscript:i];
          v27 = v26;
          v28 = @"padding_gradient";
        }
        v29 = (void *)[v26 newFunctionWithName:v28];

        uint64_t v30 = [v20 newComputePipelineStateWithFunction:v29 error:0];
        v31 = (void *)v30;
        if (v24 && v30)
        {
          v32 = +[MLCPaddingGPUDeviceOps deviceOpsWithForwardKernel:v24 gradientKernel:v30];
          v33 = v32;
          if (v32)
          {
            [v32 setIsMPSKernel:0];
            [v33 setMetalKernelType:2];
            [v33 setPaddingType:v11];
            if (v11 == 3)
            {
              *(float *)&double v34 = a9;
              [v33 setPaddingValue:v34];
            }
            [v33 setPaddingLeft:a5];
            [v33 setPaddingRight:a6];
            [v33 setPaddingTop:a7];
            [v33 setPaddingBottom:a8];
            [v33 setSourceOfForwardNeededForGradient:0];
            [v33 setResultOfForwardNeededForGradient:0];
            [v42 addObject:v33];
          }
        }
      }
    }
    v35 = (void *)[v42 copy];
    v15 = v37;
    v43.receiver = v37;
    v43.super_class = (Class)_MLCGPUPadding;
    [(_MLCGPULayer *)&v43 setDeviceOps:v35];
  }
  return v15;
}

+ (id)layerWithDevice:(id)a3 paddingType:(int)a4 paddingLeft:(unint64_t)a5 paddingRight:(unint64_t)a6 paddingTop:(unint64_t)a7 paddingBottom:(unint64_t)a8 constantValue:(float)a9 dataType:(int)a10
{
  uint64_t v15 = *(void *)&a4;
  id v17 = a3;
  id v18 = objc_alloc((Class)a1);
  LODWORD(v22) = a10;
  *(float *)&double v19 = a9;
  v20 = (void *)[v18 initWithDevice:v17 paddingType:v15 paddingLeft:a5 paddingRight:a6 paddingTop:a7 paddingBottom:a8 constantValue:v19 dataType:v22];

  return v20;
}

@end