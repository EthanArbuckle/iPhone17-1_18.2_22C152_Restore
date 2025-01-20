@interface _MLCGPUBatchNormalization
+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 beta:(id)a5 gamma:(id)a6;
+ (id)layerWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11;
+ (id)layerWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10;
- (_MLCGPUBatchNormalization)initWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11;
- (_MLCGPUBatchNormalization)initWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10;
@end

@implementation _MLCGPUBatchNormalization

- (_MLCGPUBatchNormalization)initWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  return -[_MLCGPUBatchNormalization initWithDevice:fusedWithNeuronDescriptor:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:](self, "initWithDevice:fusedWithNeuronDescriptor:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:", a3, 0, a4, a5, a6, a7, a8);
}

- (_MLCGPUBatchNormalization)initWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11
{
  id v18 = a3;
  id v19 = a4;
  id v85 = a6;
  id v84 = a7;
  id v91 = a8;
  id v90 = a9;
  v100.receiver = self;
  v100.super_class = (Class)_MLCGPUBatchNormalization;
  v20 = [(_MLCGPUBatchNormalization *)&v100 init];
  v21 = v20;
  if (v20)
  {
    v83 = v20;
    v89 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v22 = [v18 deviceList];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      unint64_t v24 = 0;
      if (v19) {
        int v25 = 8;
      }
      else {
        int v25 = 7;
      }
      if (v91) {
        BOOL v26 = v90 == 0;
      }
      else {
        BOOL v26 = 1;
      }
      int v27 = !v26;
      int v87 = v27;
      unsigned int v88 = v25;
      if (v85) {
        BOOL v28 = v84 == 0;
      }
      else {
        BOOL v28 = 1;
      }
      int v29 = !v28;
      int v86 = v29;
      v94 = v18;
      id v95 = v19;
      do
      {
        v30 = [v18 deviceList];
        v31 = [v30 objectAtIndexedSubscript:v24];

        v32 = [v18 gpuLibrary];
        v33 = [v32 objectAtIndexedSubscript:v24];
        v34 = (void *)[v33 newFunctionWithName:@"batch_norm_compute_mean"];

        v97 = (void *)[v31 newComputePipelineStateWithFunction:v34 error:0];
        v35 = [v18 gpuLibrary];
        v36 = [v35 objectAtIndexedSubscript:v24];
        v37 = (void *)[v36 newFunctionWithName:@"batch_norm_compute_variance"];

        uint64_t v96 = [v31 newComputePipelineStateWithFunction:v37 error:0];
        v38 = [v18 gpuLibrary];
        v39 = [v38 objectAtIndexedSubscript:v24];
        v40 = (void *)[v39 newFunctionWithName:@"batch_norm_forward_training"];

        v98 = (void *)[v31 newComputePipelineStateWithFunction:v40 error:0];
        v41 = [v18 gpuLibrary];
        v42 = [v41 objectAtIndexedSubscript:v24];
        v43 = (void *)[v42 newFunctionWithName:@"batch_norm_forward_inference"];

        v44 = (void *)[v31 newComputePipelineStateWithFunction:v43 error:0];
        v45 = [v18 gpuLibrary];
        v46 = [v45 objectAtIndexedSubscript:v24];
        v47 = (void *)[v46 newFunctionWithName:@"batch_norm_compute_delta_beta_gamma"];

        v48 = (void *)[v31 newComputePipelineStateWithFunction:v47 error:0];
        v49 = [v18 gpuLibrary];
        v50 = [v49 objectAtIndexedSubscript:v24];
        v51 = (void *)[v50 newFunctionWithName:@"sum_delta_beta_gamma"];

        v52 = (void *)[v31 newComputePipelineStateWithFunction:v51 error:0];
        v53 = [v18 gpuLibrary];
        v54 = [v53 objectAtIndexedSubscript:v24];
        v55 = (void *)[v54 newFunctionWithName:@"batch_norm_gradient"];

        v56 = (void *)[v31 newComputePipelineStateWithFunction:v55 error:0];
        v57 = [v18 gpuLibrary];
        v58 = [v57 objectAtIndexedSubscript:v24];
        v59 = (void *)[v58 newFunctionWithName:@"batch_norm_recompute_result"];

        v60 = (void *)v96;
        v61 = (void *)[v31 newComputePipelineStateWithFunction:v59 error:0];
        v62 = +[MLCNormalizationGPUDeviceOps deviceOpsWithForwardKernel:v98 gradientKernel:v56];
        v63 = v62;
        if (v62)
        {
          [v62 setIsMPSKernel:0];
          [v63 setMetalKernelType:v88];
          [v63 setBatchNormMeanKernel:v97];
          [v63 setBatchNormVarianceKernel:v96];
          v92 = v48;
          [v63 setBatchNormBetaGammaDeltaKernel:v48];
          [v63 setNormalizationSumBetaGammaDeltaKernel:v52];
          v93 = v44;
          [v63 setForwardStatisticsKernel:v44];
          [v63 setNormalizationRecomputeResultKernel:v61];
          [v63 setSourceOfForwardNeededForGradient:0];
          v64 = v52;
          if (v95)
          {
            BOOL isAppleFamily = GPU_isAppleFamily(v31);
            uint64_t v66 = isAppleFamily ^ 1;
          }
          else
          {
            BOOL isAppleFamily = 0;
            uint64_t v66 = 0;
          }
          [v63 setResultOfForwardNeededForGradient:isAppleFamily];
          [v63 setRecomputeResultTensor:v66];
          v67 = [v94 deviceList];
          unint64_t v68 = [v67 count];

          BOOL v70 = v68 >= 2;
          id v71 = v95;
          if (v70)
          {
            v72 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v63];
            [v63 setNormalizationMultiGPUChildOps:v72];

            v73 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            v74 = v73;
            if (v91)
            {
              [v73 setObject:v91 atIndexedSubscript:0];
              uint64_t v75 = 1;
            }
            else
            {
              uint64_t v75 = 0;
            }
            if (v90) {
              [v74 setObject:v90 atIndexedSubscript:v75];
            }
            v76 = [v63 normalizationMultiGPUChildOps];
            v77 = (void *)[v74 copy];
            GPU_AllocateResourceForMultiGPUTraining(v94, v76, v77, v24);

            id v71 = v95;
          }
          *(float *)&double v69 = a10;
          [v63 setVarianceEpsilon:v69];
          *(float *)&double v78 = a11;
          [v63 setMomentum:v78];
          if (v87) {
            GPU_AllocateExportableGammaBetaStatesWithDevice(v31, v63, v91, v90, v24);
          }
          v60 = (void *)v96;
          if (v86) {
            GPU_AllocateExportableRunningMeanVariancetatesWithDevice(v31, v63, v85, v84, v24);
          }
          v52 = v64;
          if (v71) {
            [v63 setNeuronDescriptor:v71];
          }
          [v89 addObject:v63];
          v48 = v92;
          v44 = v93;
        }

        ++v24;
        id v18 = v94;
        v79 = [v94 deviceList];
        unint64_t v80 = [v79 count];

        id v19 = v95;
      }
      while (v24 < v80);
    }
    v81 = (void *)[v89 copy];
    v21 = v83;
    v99.receiver = v83;
    v99.super_class = (Class)_MLCGPUBatchNormalization;
    [(_MLCGPULayer *)&v99 setDeviceOps:v81];
  }
  return v21;
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
  BOOL v26 = (void *)[v23 initWithDevice:v22 numOfFeatureChannels:a4 mean:v21 variance:v20 beta:v19 gamma:v18 varianceEpsilon:v24 momentum:v25];

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
  int v29 = (void *)[v26 initWithDevice:v25 fusedWithNeuronDescriptor:v24 numOfFeatureChannels:a5 mean:v23 variance:v22 beta:v21 gamma:v27 varianceEpsilon:v28 momentum:v20];

  return v29;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 beta:(id)a5 gamma:(id)a6
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v53 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v12 = [v54 deviceList];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        unint64_t v14 = 0;
        v51 = v11;
        id v52 = v9;
        do
        {
          v55 = objc_msgSend(v53, "objectAtIndexedSubscript:", v14, v51);
          v15 = [v9 optimizerData];
          if ([v15 count])
          {
            v16 = [v11 optimizerData];
            uint64_t v17 = [v16 count];

            if (!v17) {
              goto LABEL_9;
            }
            v15 = [v9 optimizerDeviceData];
            id v18 = [v15 objectAtIndexedSubscript:v14];
            id v19 = [v18 momentumVectors];
            id v20 = [v19 objectAtIndexedSubscript:0];
            v58[0] = v20;
            id v21 = [v11 optimizerDeviceData];
            id v22 = [v21 objectAtIndexedSubscript:v14];
            id v23 = [v22 momentumVectors];
            id v24 = [v23 objectAtIndexedSubscript:0];
            v58[1] = v24;
            id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
            [v55 setMomentumVectors:v25];

            id v9 = v52;
            v11 = v51;
          }
LABEL_9:
          id v26 = [v9 optimizerData];
          if ((unint64_t)[v26 count] >= 2)
          {
            double v27 = [v11 optimizerData];
            unint64_t v28 = [v27 count];

            if (v28 < 2) {
              goto LABEL_13;
            }
            id v26 = [v9 optimizerDeviceData];
            int v29 = [v26 objectAtIndexedSubscript:v14];
            v30 = [v29 velocityVectors];
            v31 = [v30 objectAtIndexedSubscript:0];
            v57[0] = v31;
            v32 = [v11 optimizerDeviceData];
            v33 = [v32 objectAtIndexedSubscript:v14];
            v34 = [v33 velocityVectors];
            v35 = [v34 objectAtIndexedSubscript:0];
            v57[1] = v35;
            v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
            [v55 setVelocityVectors:v36];

            v11 = v51;
            id v9 = v52;
          }
LABEL_13:
          v37 = [v9 optimizerData];
          if ((unint64_t)[v37 count] < 3) {
            goto LABEL_16;
          }
          v38 = [v11 optimizerData];
          unint64_t v39 = [v38 count];

          if (v39 >= 3)
          {
            v37 = [v9 optimizerDeviceData];
            v40 = [v37 objectAtIndexedSubscript:v14];
            v41 = [v40 centerWeightVectors];
            v42 = [v41 objectAtIndexedSubscript:0];
            v56[0] = v42;
            v43 = [v11 optimizerDeviceData];
            v44 = [v43 objectAtIndexedSubscript:v14];
            v45 = [v44 centerWeightVectors];
            v46 = [v45 objectAtIndexedSubscript:0];
            v56[1] = v46;
            v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
            [v55 setCenterWeightVectors:v47];

            v11 = v51;
            id v9 = v52;

LABEL_16:
          }

          ++v14;
          v48 = [v54 deviceList];
          unint64_t v49 = [v48 count];
        }
        while (v14 < v49);
      }
    }
  }

  return 1;
}

@end