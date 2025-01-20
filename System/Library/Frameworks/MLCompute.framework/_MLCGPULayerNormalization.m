@interface _MLCGPULayerNormalization
+ (id)layerWithDevice:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7 isFusedWithArithmeticLayer:(BOOL)a8;
- (_MLCGPULayerNormalization)initWithDevice:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7 isFusedWithArithmeticLayer:(BOOL)a8;
@end

@implementation _MLCGPULayerNormalization

- (_MLCGPULayerNormalization)initWithDevice:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7 isFusedWithArithmeticLayer:(BOOL)a8
{
  BOOL v67 = a8;
  v75[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v70 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = v16;
  if ((!v15 || v16) && (v15 || !v16))
  {
    v74.receiver = self;
    v74.super_class = (Class)_MLCGPULayerNormalization;
    v20 = [(_MLCGPULayerNormalization *)&v74 init];
    v21 = v20;
    if (v20)
    {
      v61 = v20;
      v62 = v17;
      v63 = v15;
      v65 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      v22 = [v14 deviceList];
      uint64_t v23 = [v22 count];

      if (v23)
      {
        unint64_t v24 = 0;
        if (v15) {
          BOOL v25 = v17 == 0;
        }
        else {
          BOOL v25 = 1;
        }
        int v26 = !v25;
        int v66 = v26;
        while (1)
        {
          v27 = [v14 deviceList];
          v28 = [v27 objectAtIndexedSubscript:v24];

          v29 = [v14 gpuLibrary];
          v30 = [v29 objectAtIndexedSubscript:v24];
          v31 = (void *)[v30 newFunctionWithName:@"layer_norm_forward_training"];

          v32 = (void *)[v28 newComputePipelineStateWithFunction:v31 error:0];
          v33 = [v14 gpuLibrary];
          v34 = [v33 objectAtIndexedSubscript:v24];
          uint64_t v35 = [v34 newFunctionWithName:@"layer_norm_forward_inference"];

          v71 = (void *)v35;
          v72 = (void *)[v28 newComputePipelineStateWithFunction:v35 error:0];
          v36 = [v14 gpuLibrary];
          v37 = [v36 objectAtIndexedSubscript:v24];
          v38 = (void *)[v37 newFunctionWithName:@"layer_norm_gradient"];

          v39 = (void *)[v28 newComputePipelineStateWithFunction:v38 error:0];
          v40 = [v14 gpuLibrary];
          v41 = [v40 objectAtIndexedSubscript:v24];
          v42 = (void *)[v41 newFunctionWithName:@"layer_norm_compute_beta_gamma_delta"];

          v43 = (void *)[v28 newComputePipelineStateWithFunction:v42 error:0];
          v44 = +[MLCNormalizationGPUDeviceOps deviceOpsWithForwardKernel:v32 gradientKernel:v39];
          v45 = v44;
          if (v44) {
            break;
          }
LABEL_25:

          ++v24;
          v57 = [v14 deviceList];
          unint64_t v58 = [v57 count];

          if (v24 >= v58) {
            goto LABEL_26;
          }
        }
        v68 = v32;
        v69 = v31;
        [v44 setIsMPSKernel:0];
        [v45 setMetalKernelType:4];
        v46 = [v14 deviceList];
        unint64_t v47 = [v46 count];

        if (v47 >= 2)
        {
          v48 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v45];
          [v45 setNormalizationMultiGPUChildOps:v48];

          if (!v66)
          {
            [v45 setNormalizedShape:v70];
            *(float *)&double v56 = a7;
            [v45 setVarianceEpsilon:v56];
            [v45 setIsFusedWithArithmeticLayer:v67];
            [v45 setSourceOfForwardNeededForGradient:0];
            [v45 setResultOfForwardNeededForGradient:0];
LABEL_24:
            [v65 addObject:v45];
            v32 = v68;
            v31 = v69;
            goto LABEL_25;
          }
          v49 = [v45 normalizationMultiGPUChildOps];
          v75[0] = v62;
          v75[1] = v63;
          v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
          GPU_AllocateResourceForMultiGPUTraining(v14, v49, v50, v24);
        }
        [v45 setNormalizedShape:v70];
        *(float *)&double v51 = a7;
        [v45 setVarianceEpsilon:v51];
        [v45 setIsFusedWithArithmeticLayer:v67];
        [v45 setSourceOfForwardNeededForGradient:0];
        [v45 setResultOfForwardNeededForGradient:0];
        if (v66)
        {
          v64 = v43;
          GPU_AllocateExportableGammaBetaStatesWithDevice(v28, v45, v63, v62, v24);
          v52 = [v62 data];
          v53 = objc_msgSend(v28, "newBufferWithLength:options:", objc_msgSend(v52, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

          v54 = [v63 data];
          v55 = objc_msgSend(v28, "newBufferWithLength:options:", objc_msgSend(v54, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

          [v45 setNormalizationGammaGradient:v53];
          [v45 setNormalizationBetaGradient:v55];
          [v45 setForwardStatisticsKernel:v72];
          [v45 setGradientStatisticsKernel:v64];

          v43 = v64;
        }
        goto LABEL_24;
      }
LABEL_26:
      v59 = (void *)[v65 copy];
      v21 = v61;
      v73.receiver = v61;
      v73.super_class = (Class)_MLCGPULayerNormalization;
      [(_MLCGPULayer *)&v73 setDeviceOps:v59];

      v17 = v62;
      id v15 = v63;
    }
    self = v21;
    v19 = self;
    goto LABEL_28;
  }
  v18 = +[MLCLog framework];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[_MLCGPULayerNormalization initWithDevice:normalizedShape:beta:gamma:varianceEpsilon:isFusedWithArithmeticLayer:](a2, v18);
  }

  v19 = 0;
LABEL_28:

  return v19;
}

+ (id)layerWithDevice:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7 isFusedWithArithmeticLayer:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc((Class)a1);
  *(float *)&double v19 = a7;
  v20 = (void *)[v18 initWithDevice:v17 normalizedShape:v16 beta:v15 gamma:v14 varianceEpsilon:v8 isFusedWithArithmeticLayer:v19];

  return v20;
}

- (void)initWithDevice:(const char *)a1 normalizedShape:(NSObject *)a2 beta:gamma:varianceEpsilon:isFusedWithArithmeticLayer:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: Beta and gamma tensors must both be nil or not nil", (uint8_t *)&v4, 0xCu);
}

@end