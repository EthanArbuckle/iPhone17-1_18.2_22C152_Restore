@interface _MLCGPUInstanceNormalization
+ (id)layerWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11;
+ (id)layerWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10;
- (_MLCGPUInstanceNormalization)initWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11;
@end

@implementation _MLCGPUInstanceNormalization

- (_MLCGPUInstanceNormalization)initWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11
{
  id v18 = a3;
  id v19 = a4;
  id v87 = a6;
  id v86 = a7;
  id v85 = a8;
  id v20 = a9;
  v92.receiver = self;
  v92.super_class = (Class)_MLCGPUInstanceNormalization;
  v21 = [(_MLCGPUInstanceNormalization *)&v92 init];
  v22 = v21;
  if (v21)
  {
    v83 = v20;
    id v84 = v19;
    v77 = v21;
    v82 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v23 = [v18 deviceList];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      unint64_t v25 = 0;
      if (v19) {
        int v26 = 6;
      }
      else {
        int v26 = 5;
      }
      if (v85) {
        BOOL v27 = v83 == 0;
      }
      else {
        BOOL v27 = 1;
      }
      int v28 = !v27;
      int v80 = v28;
      unsigned int v81 = v26;
      if (v87) {
        BOOL v29 = v86 == 0;
      }
      else {
        BOOL v29 = 1;
      }
      int v30 = !v29;
      int v79 = v30;
      do
      {
        v31 = [v18 deviceList];
        v32 = [v31 objectAtIndexedSubscript:v25];

        v33 = [v18 gpuLibrary];
        v34 = [v33 objectAtIndexedSubscript:v25];
        v35 = (void *)[v34 newFunctionWithName:@"instance_norm_forward_training"];

        v90 = (void *)[v32 newComputePipelineStateWithFunction:v35 error:0];
        v36 = [v18 gpuLibrary];
        v37 = [v36 objectAtIndexedSubscript:v25];
        v38 = (void *)[v37 newFunctionWithName:@"instance_norm_forward_inference"];

        v89 = (void *)[v32 newComputePipelineStateWithFunction:v38 error:0];
        v39 = [v18 gpuLibrary];
        v40 = [v39 objectAtIndexedSubscript:v25];
        v41 = (void *)[v40 newFunctionWithName:@"instance_norm_gradient"];

        v42 = (void *)[v32 newComputePipelineStateWithFunction:v41 error:0];
        v43 = [v18 gpuLibrary];
        v44 = [v43 objectAtIndexedSubscript:v25];
        v45 = (void *)[v44 newFunctionWithName:@"sum_delta_beta_gamma"];

        v46 = (void *)[v32 newComputePipelineStateWithFunction:v45 error:0];
        v47 = [v18 gpuLibrary];
        v48 = [v47 objectAtIndexedSubscript:v25];
        v49 = (void *)[v48 newFunctionWithName:@"instance_norm_compute_moving_mean_variance"];

        v50 = (void *)[v32 newComputePipelineStateWithFunction:v49 error:0];
        v51 = [v18 gpuLibrary];
        v52 = [v51 objectAtIndexedSubscript:v25];
        v53 = (void *)[v52 newFunctionWithName:@"instance_norm_recompute_result"];

        v54 = (void *)[v32 newComputePipelineStateWithFunction:v53 error:0];
        v55 = +[MLCNormalizationGPUDeviceOps deviceOpsWithForwardKernel:v90 gradientKernel:v42];
        v56 = v55;
        if (v55)
        {
          v88 = v50;
          [v55 setIsMPSKernel:0];
          [v56 setMetalKernelType:v81];
          v57 = [v18 deviceList];
          unint64_t v58 = [v57 count];

          if (v58 >= 2)
          {
            v60 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v56];
            [v56 setNormalizationMultiGPUChildOps:v60];

            v61 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            v62 = v61;
            if (v87)
            {
              [v61 setObject:v87 atIndexedSubscript:0];
              uint64_t v63 = 1;
            }
            else
            {
              uint64_t v63 = 0;
            }
            v78 = v46;
            if (v86)
            {
              uint64_t v64 = v63 + 1;
              objc_msgSend(v62, "setObject:atIndexedSubscript:");
              uint64_t v63 = v64;
            }
            if (v85)
            {
              uint64_t v65 = v63 + 1;
              objc_msgSend(v62, "setObject:atIndexedSubscript:");
              uint64_t v63 = v65;
            }
            if (v83) {
              [v62 setObject:v83 atIndexedSubscript:v63];
            }
            v66 = [v56 normalizationMultiGPUChildOps];
            v67 = (void *)[v62 copy];
            GPU_AllocateResourceForMultiGPUTraining(v18, v66, v67, v25);

            v46 = v78;
          }
          *(float *)&double v59 = a10;
          [v56 setVarianceEpsilon:v59];
          *(float *)&double v68 = a11;
          [v56 setMomentum:v68];
          if (v80)
          {
            GPU_AllocateExportableGammaBetaStatesWithDevice(v32, v56, v85, v83, v25);
            [v56 setForwardStatisticsKernel:v89];
          }
          if (v79)
          {
            [v56 setInstanceNormMovingMeanVarianceKernel:v88];
            GPU_AllocateExportableRunningMeanVariancetatesWithDevice(v32, v56, v87, v86, v25);
          }
          [v56 setNormalizationRecomputeResultKernel:v54];
          [v56 setNormalizationSumBetaGammaDeltaKernel:v46];
          [v56 setSourceOfForwardNeededForGradient:0];
          if (v84)
          {
            BOOL isAppleFamily = GPU_isAppleFamily(v32);
            v70 = v46;
            uint64_t v71 = isAppleFamily ^ 1;
            [v56 setResultOfForwardNeededForGradient:isAppleFamily];
            uint64_t v72 = v71;
            v46 = v70;
            [v56 setRecomputeResultTensor:v72];
            [v56 setNeuronDescriptor:v84];
          }
          else
          {
            [v56 setResultOfForwardNeededForGradient:0];
            [v56 setRecomputeResultTensor:0];
          }
          v50 = v88;
          [v82 addObject:v56];
        }

        ++v25;
        v73 = [v18 deviceList];
        unint64_t v74 = [v73 count];
      }
      while (v25 < v74);
    }
    v75 = (void *)[v82 copy];
    v22 = v77;
    v91.receiver = v77;
    v91.super_class = (Class)_MLCGPUInstanceNormalization;
    [(_MLCGPULayer *)&v91 setDeviceOps:v75];

    id v20 = v83;
    id v19 = v84;
  }

  return v22;
}

+ (id)layerWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = objc_alloc((Class)a1);
  *(float *)&double v24 = a9;
  *(float *)&double v25 = a10;
  int v26 = (void *)[v23 initWithDevice:v22 fusedWithNeuronDescriptor:0 numOfFeatureChannels:a4 mean:v21 variance:v20 beta:v19 gamma:v24 varianceEpsilon:v25 momentum:v18];

  return v26;
}

+ (id)layerWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11
{
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a4;
  id v25 = a3;
  id v26 = objc_alloc((Class)a1);
  *(float *)&double v27 = a10;
  *(float *)&double v28 = a11;
  BOOL v29 = (void *)[v26 initWithDevice:v25 fusedWithNeuronDescriptor:v24 numOfFeatureChannels:a5 mean:v23 variance:v22 beta:v21 gamma:v27 varianceEpsilon:v28 momentum:v20];

  return v29;
}

@end