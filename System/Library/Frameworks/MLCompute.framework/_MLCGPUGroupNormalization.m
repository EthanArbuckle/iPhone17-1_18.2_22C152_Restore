@interface _MLCGPUGroupNormalization
+ (id)layerWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8;
- (_MLCGPUGroupNormalization)initWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8;
@end

@implementation _MLCGPUGroupNormalization

- (_MLCGPUGroupNormalization)initWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v51 = a6;
  id v50 = a7;
  v56.receiver = self;
  v56.super_class = (Class)_MLCGPUGroupNormalization;
  v13 = [(_MLCGPUGroupNormalization *)&v56 init];
  v14 = v13;
  if (v13)
  {
    v48 = v13;
    v53 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v15 = [v12 deviceList];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      unint64_t v17 = 0;
      if (v51) {
        BOOL v18 = v50 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      int v19 = !v18;
      int v54 = v19;
      while (1)
      {
        v20 = [v12 deviceList];
        v21 = [v20 objectAtIndexedSubscript:v17];

        v22 = [v12 gpuLibrary];
        v23 = [v22 objectAtIndexedSubscript:v17];
        v24 = (void *)[v23 newFunctionWithName:@"group_norm_forward_training"];

        v25 = (void *)[v21 newComputePipelineStateWithFunction:v24 error:0];
        v26 = [v12 gpuLibrary];
        v27 = [v26 objectAtIndexedSubscript:v17];
        v28 = (void *)[v27 newFunctionWithName:@"group_norm_gradient"];

        v29 = (void *)[v21 newComputePipelineStateWithFunction:v28 error:0];
        v30 = [v12 gpuLibrary];
        v31 = [v30 objectAtIndexedSubscript:v17];
        v32 = (void *)[v31 newFunctionWithName:@"sum_delta_beta_gamma"];

        v33 = (void *)[v21 newComputePipelineStateWithFunction:v32 error:0];
        v34 = +[MLCNormalizationGPUDeviceOps deviceOpsWithForwardKernel:v25 gradientKernel:v29];
        v35 = v34;
        if (v34) {
          break;
        }
LABEL_18:

        ++v17;
        v44 = [v12 deviceList];
        unint64_t v45 = [v44 count];

        if (v17 >= v45) {
          goto LABEL_19;
        }
      }
      [v34 setIsMPSKernel:0];
      [v35 setMetalKernelType:9];
      v36 = [v12 deviceList];
      unint64_t v37 = [v36 count];

      if (v37 >= 2)
      {
        v39 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v35];
        [v35 setNormalizationMultiGPUChildOps:v39];

        if (!v54)
        {
          *(float *)&double v40 = a8;
          [v35 setVarianceEpsilon:v40];
          [v35 setGroupCount:a5];
          [v35 setNormalizationSumBetaGammaDeltaKernel:v33];
          [v35 setSourceOfForwardNeededForGradient:0];
          [v35 setResultOfForwardNeededForGradient:0];
LABEL_17:
          [v53 addObject:v35];
          goto LABEL_18;
        }
        [v35 normalizationMultiGPUChildOps];
        v41 = v49 = v25;
        v57[0] = v50;
        v57[1] = v51;
        v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
        v43 = (void *)[v42 copy];
        GPU_AllocateResourceForMultiGPUTraining(v12, v41, v43, v17);

        v25 = v49;
      }
      *(float *)&double v38 = a8;
      [v35 setVarianceEpsilon:v38];
      [v35 setGroupCount:a5];
      [v35 setNormalizationSumBetaGammaDeltaKernel:v33];
      [v35 setSourceOfForwardNeededForGradient:0];
      [v35 setResultOfForwardNeededForGradient:0];
      if (v54) {
        GPU_AllocateExportableGammaBetaStatesWithDevice(v21, v35, v51, v50, v17);
      }
      goto LABEL_17;
    }
LABEL_19:
    v46 = (void *)[v53 copy];
    v14 = v48;
    v55.receiver = v48;
    v55.super_class = (Class)_MLCGPUGroupNormalization;
    [(_MLCGPULayer *)&v55 setDeviceOps:v46];
  }
  return v14;
}

+ (id)layerWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  id v17 = objc_alloc((Class)a1);
  *(float *)&double v18 = a8;
  int v19 = (void *)[v17 initWithDevice:v16 numOfFeatureChannels:a4 groupCount:a5 beta:v15 gamma:v14 varianceEpsilon:v18];

  return v19;
}

@end