@interface _MLCGPUTranspose
+ (id)layerWithDevice:(id)a3 shape:(id)a4;
- (_MLCGPUTranspose)initWithDevice:(id)a3 shape:(id)a4;
@end

@implementation _MLCGPUTranspose

- (_MLCGPUTranspose)initWithDevice:(id)a3 shape:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)_MLCGPUTranspose;
  v8 = [(_MLCGPUTranspose *)&v37 init];
  v9 = v8;
  if (v8)
  {
    v34 = v8;
    v35 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v10 = [v6 deviceList];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      unint64_t v12 = 0;
      do
      {
        v13 = [v6 deviceList];
        v14 = [v13 objectAtIndexedSubscript:v12];

        v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        if ([v7 count])
        {
          unint64_t v16 = 0;
          do
          {
            if ([v7 count])
            {
              unint64_t v17 = 0;
              do
              {
                v18 = [v7 objectAtIndexedSubscript:v17];
                uint64_t v19 = [v18 unsignedIntegerValue];

                if (v16 == v19)
                {
                  v20 = [NSNumber numberWithUnsignedInteger:v17];
                  [v15 setObject:v20 atIndexedSubscript:v16];
                }
                ++v17;
              }
              while (v17 < [v7 count]);
            }
            ++v16;
          }
          while (v16 < [v7 count]);
        }
        if ([v7 count] == 2)
        {
          v21 = [v6 gpuLibrary];
          v22 = [v21 objectAtIndexedSubscript:v12];
          v23 = v22;
          v24 = @"transpose_two_dims";
        }
        else
        {
          uint64_t v25 = [v7 count];
          v21 = [v6 gpuLibrary];
          v22 = [v21 objectAtIndexedSubscript:v12];
          v23 = v22;
          if (v25 == 3) {
            v24 = @"transpose_three_dims";
          }
          else {
            v24 = @"transpose_four_dims";
          }
        }
        v26 = (void *)[v22 newFunctionWithName:v24];

        v27 = (void *)[v14 newComputePipelineStateWithFunction:v26 error:0];
        v28 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v27];
        if (v28)
        {
          v29 = (void *)[v7 mutableCopy];
          [v28 setTransposeShape:v29];

          [v28 setTransposeGradientShape:v15];
          [v28 setIsMPSKernel:0];
          [v28 setMetalKernelType:12];
          [v28 setSourceOfForwardNeededForGradient:0];
          [v28 setResultOfForwardNeededForGradient:0];
          [v35 addObject:v28];
        }

        ++v12;
        v30 = [v6 deviceList];
        unint64_t v31 = [v30 count];
      }
      while (v12 < v31);
    }
    v32 = (void *)[v35 copy];
    v9 = v34;
    v36.receiver = v34;
    v36.super_class = (Class)_MLCGPUTranspose;
    [(_MLCGPULayer *)&v36 setDeviceOps:v32];
  }
  return v9;
}

+ (id)layerWithDevice:(id)a3 shape:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithDevice:v7 shape:v6];

  return v8;
}

@end