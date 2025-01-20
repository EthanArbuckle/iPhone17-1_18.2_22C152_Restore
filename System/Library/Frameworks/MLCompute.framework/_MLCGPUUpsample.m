@interface _MLCGPUUpsample
+ (id)layerWithDevice:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5 sampleMode:(int)a6 alignCorners:(BOOL)a7;
- (_MLCGPUUpsample)initWithDevice:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5 sampleMode:(int)a6 alignCorners:(BOOL)a7;
@end

@implementation _MLCGPUUpsample

- (_MLCGPUUpsample)initWithDevice:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5 sampleMode:(int)a6 alignCorners:(BOOL)a7
{
  BOOL v40 = a7;
  uint64_t v7 = *(void *)&a6;
  id v11 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_MLCGPUUpsample;
  v12 = [(_MLCGPUUpsample *)&v45 init];
  v13 = v12;
  if (v12)
  {
    v39 = v12;
    v14 = [v11 deviceList];
    uint64_t v15 = [v14 count];

    v42 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v15)
    {
      uint64_t v16 = 0;
      v17 = @"resize_nearest_forward";
      if (a4 == 2.0 && a5 == 2.0) {
        v17 = @"resize_nearest2x2_forward";
      }
      v41 = v17;
      id v43 = v11;
      do
      {
        v18 = [v11 deviceList];
        v19 = [v18 objectAtIndexedSubscript:v16];

        v20 = [v11 gpuLibrary];
        v21 = [v20 objectAtIndexedSubscript:v16];
        v22 = v21;
        if (v7)
        {
          v23 = (void *)[v21 newFunctionWithName:@"resize_bilinear_forward"];

          v24 = [v11 gpuLibrary];
          v25 = [v24 objectAtIndexedSubscript:v16];
          v26 = (void *)[v25 newFunctionWithName:@"resize_bilinear_gradient"];
          BOOL v27 = 0;
        }
        else
        {
          v23 = (void *)[v21 newFunctionWithName:v41];

          v24 = [v11 gpuLibrary];
          v25 = [v24 objectAtIndexedSubscript:v16];
          v26 = (void *)[v25 newFunctionWithName:@"resize_nearest_gradient"];
          BOOL v27 = a4 == 2.0 && a5 == 2.0;
        }

        v28 = (void *)[v19 newComputePipelineStateWithFunction:v23 error:0];
        uint64_t v29 = [v19 newComputePipelineStateWithFunction:v26 error:0];
        v30 = (void *)v29;
        if (v28 && v29)
        {
          uint64_t v31 = v15;
          uint64_t v32 = v7;
          v33 = +[MLCResizeGPUDeviceOps deviceOpsWithForwardKernel:v28 gradientKernel:v29];
          v34 = v33;
          if (v33)
          {
            [v33 setIsMPSKernel:0];
            [v34 setMetalKernelType:10];
            *(float *)&double v35 = a4;
            [v34 setScaleFactorX:v35];
            *(float *)&double v36 = a5;
            [v34 setScaleFactorY:v36];
            [v34 setAlignCorners:v40];
            [v34 setIsSpecialCasedNearestForwardKernel:v27];
            [v34 setSourceOfForwardNeededForGradient:0];
            [v34 setResultOfForwardNeededForGradient:0];
            [v42 addObject:v34];
          }

          uint64_t v7 = v32;
          uint64_t v15 = v31;
          id v11 = v43;
        }

        ++v16;
      }
      while (v15 != v16);
    }
    v37 = (void *)[v42 copy];
    v13 = v39;
    v44.receiver = v39;
    v44.super_class = (Class)_MLCGPUUpsample;
    [(_MLCGPULayer *)&v44 setDeviceOps:v37];
  }
  return v13;
}

+ (id)layerWithDevice:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5 sampleMode:(int)a6 alignCorners:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  uint64_t v16 = (void *)[v13 initWithDevice:v12 scaleFactorX:v8 scaleFactorY:v7 sampleMode:v14 alignCorners:v15];

  return v16;
}

@end