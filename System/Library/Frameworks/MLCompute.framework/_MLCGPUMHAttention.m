@interface _MLCGPUMHAttention
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (BOOL)setMHAOptimizerDataForDevice:(unint64_t)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6 momentumArray:(id)a7 velocityArray:(id)a8 centerWeightArray:(id)a9 weightIndex:(unint64_t)a10 targetIndex:(unint64_t)a11 attnBias:(BOOL)a12;
+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6;
+ (id)layerWithDevice:(id)a3 desciptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8;
- (_MLCGPUMHAttention)initWithDevice:(id)a3 desciptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8;
@end

@implementation _MLCGPUMHAttention

- (_MLCGPUMHAttention)initWithDevice:(id)a3 desciptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = v14;
  id v18 = v16;
  id v19 = a6;
  id v139 = a7;
  v145.receiver = self;
  v145.super_class = (Class)_MLCGPUMHAttention;
  v20 = [(_MLCGPUMHAttention *)&v145 init];
  v21 = v20;
  if (!v20) {
    goto LABEL_38;
  }
  aSelector = a2;
  v132 = v20;
  v131 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v22 = [v17 deviceList];
  uint64_t v23 = [v22 count];

  if (!v23)
  {
LABEL_37:
    v126 = (void *)[v131 copy];
    v21 = v132;
    v144.receiver = v132;
    v144.super_class = (Class)_MLCGPUMHAttention;
    [(_MLCGPULayer *)&v144 setDeviceOps:v126];

LABEL_38:
    v127 = v21;
    goto LABEL_39;
  }
  unint64_t v25 = 0;
  *(void *)&long long v24 = 138412546;
  long long v129 = v24;
  v140 = v19;
  id v141 = v18;
  id v134 = v15;
  v135 = v17;
  while (1)
  {
    v26 = objc_msgSend(v17, "deviceList", v129);
    uint64_t v27 = [v26 objectAtIndexedSubscript:v25];

    v28 = +[MLCMHAGPUDeviceOps deviceOps];
    objc_msgSend(v28, "setMhaHeadCount:", objc_msgSend(v15, "headCount"));
    v142 = (void *)v27;
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F357B8]) initWithDevice:v27 sourceCount:2];
    [v28 setMhaMatMulKernel:v29];

    if ([v15 hasBiases])
    {
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F356A0]) initWithDevice:v27];
      [v28 setMhaBiasAddKernel:v30];
    }
    [v15 dropout];
    if (v31 > 0.0 && !a8)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F35430]);
      [v15 dropout];
      int64x2_t v137 = vdupq_n_s64(1uLL);
      *(float *)&double v34 = 1.0 - v33;
      *(int64x2_t *)buf = v137;
      *(void *)&buf[16] = 1;
      v35 = (void *)[v32 initWithDevice:v27 keepProbability:0 seed:buf maskStrideInPixels:v34];
      [v28 setMhaDropoutForwardKernel:v35];

      id v36 = objc_alloc(MEMORY[0x1E4F35438]);
      [v15 dropout];
      *(float *)&double v38 = 1.0 - v37;
      *(int64x2_t *)buf = v137;
      *(void *)&buf[16] = 1;
      v39 = (void *)[v36 initWithDevice:v27 keepProbability:0 seed:buf maskStrideInPixels:v38];
      [v28 setMhaDropoutGradientKernel:v39];
    }
    objc_msgSend(v28, "setMhaHasZeroAttention:", objc_msgSend(v15, "addsZeroAttention"));
    objc_msgSend(v28, "setMhaHasBias:", objc_msgSend(v15, "hasBiases"));
    objc_msgSend(v28, "setMhaHasAttnBias:", objc_msgSend(v15, "hasAttentionBiases"));
    objc_msgSend(v28, "setMhaModelDimension:", objc_msgSend(v15, "modelDimension"));
    v40 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v28 setExportableState:v40];

    uint64_t v41 = 0;
    v143 = v28;
    do
    {
      v42 = [v18 objectAtIndexedSubscript:v41];
      v43 = [v42 deviceMemory];
      unint64_t v44 = [v43 count];

      if (v25 >= v44)
      {
        v45 = [v18 objectAtIndexedSubscript:v41];
        id v46 = [v45 data];
        uint64_t v47 = [v46 bytes];
        v48 = [v18 objectAtIndexedSubscript:v41];
        v49 = [v48 data];
        v50 = objc_msgSend(v142, "newBufferWithBytes:length:options:", v47, objc_msgSend(v49, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
        v51 = [v18 objectAtIndexedSubscript:v41];
        v52 = [v51 deviceMemory];
        [v52 setObject:v50 atIndexedSubscript:v25];

        id v18 = v141;
      }
      v53 = v143;
      v54 = [v143 exportableState];
      v55 = [v18 objectAtIndexedSubscript:v41];
      v56 = [v55 deviceMemory];
      v57 = [v56 objectAtIndexedSubscript:v25];
      [v54 addObject:v57];

      ++v41;
    }
    while (v41 != 4);
    v58 = v140;
    if ([v143 mhaHasBias])
    {
      for (uint64_t i = 0; i != 4; ++i)
      {
        v60 = [v58 objectAtIndexedSubscript:i];
        v61 = [v60 deviceMemory];
        unint64_t v62 = [v61 count];

        if (v25 >= v62)
        {
          v63 = [v58 objectAtIndexedSubscript:i];
          id v64 = [v63 data];
          uint64_t v65 = [v64 bytes];
          v66 = [v58 objectAtIndexedSubscript:i];
          v67 = [v66 data];
          v68 = objc_msgSend(v142, "newBufferWithBytes:length:options:", v65, objc_msgSend(v67, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
          v69 = [v140 objectAtIndexedSubscript:i];
          v70 = [v69 deviceMemory];
          [v70 setObject:v68 atIndexedSubscript:v25];

          id v18 = v141;
          v53 = v143;
          v58 = v140;
        }
        v71 = [v53 exportableState];
        v72 = [v58 objectAtIndexedSubscript:i];
        v73 = [v72 deviceMemory];
        v74 = [v73 objectAtIndexedSubscript:v25];
        [v71 addObject:v74];
      }
    }
    v75 = v139;
    if ([v53 mhaHasAttnBias])
    {
      uint64_t v76 = 0;
      char v77 = 1;
      do
      {
        char v78 = v77;
        v79 = [v75 objectAtIndexedSubscript:v76];
        v80 = [v79 deviceMemory];
        unint64_t v81 = [v80 count];

        if (v25 >= v81)
        {
          v82 = [v75 objectAtIndexedSubscript:v76];
          id v83 = [v82 data];
          uint64_t v84 = [v83 bytes];
          v85 = [v75 objectAtIndexedSubscript:v76];
          v86 = [v85 data];
          v87 = objc_msgSend(v142, "newBufferWithBytes:length:options:", v84, objc_msgSend(v86, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
          v88 = [v139 objectAtIndexedSubscript:v76];
          v89 = [v88 deviceMemory];
          [v89 setObject:v87 atIndexedSubscript:v25];

          id v18 = v141;
          v75 = v139;

          v53 = v143;
          v58 = v140;
        }
        v90 = [v53 exportableState];
        v91 = [v75 objectAtIndexedSubscript:v76];
        v92 = [v91 deviceMemory];
        v93 = [v92 objectAtIndexedSubscript:v25];
        [v90 addObject:v93];

        char v77 = 0;
        uint64_t v76 = 1;
      }
      while ((v78 & 1) != 0);
      [v53 setMhaAttentionBiasTensors:v75];
      v17 = v135;
    }
    v94 = (void *)MEMORY[0x1E4F1CA48];
    v95 = [v53 exportableState];
    v96 = objc_msgSend(v94, "arrayWithCapacity:", objc_msgSend(v95, "count"));
    [v53 setGradientState:v96];

    v97 = [v17 deviceList];
    unint64_t v98 = [v97 count];

    if (v98 >= 2)
    {
      v99 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      [v99 addObjectsFromArray:v18];
      if ([v53 mhaHasBias]) {
        [v99 addObjectsFromArray:v58];
      }
      if ([v53 mhaHasAttnBias])
      {
        v100 = [v53 mhaAttentionBiasTensors];
        [v99 addObjectsFromArray:v100];
      }
      v101 = +[MLCGPUDeviceOps deviceOps];
      v102 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v101];
      [v53 setMhaMultiGPUChildOps:v102];

      v103 = [v53 mhaMultiGPUChildOps];
      GPU_AllocateResourceForMultiGPUTraining(v17, v103, v99, v25);
    }
    v104 = [v17 gpuLibrary];
    v105 = [v104 objectAtIndexedSubscript:v25];
    uint64_t v106 = [v105 newFunctionWithName:@"mha_mask_softmax_forward"];

    v107 = [v17 gpuLibrary];
    v108 = [v107 objectAtIndexedSubscript:v25];
    uint64_t v109 = [v108 newFunctionWithName:@"mha_mask_softmax_fast_forward"];

    v110 = [v17 gpuLibrary];
    v111 = [v110 objectAtIndexedSubscript:v25];
    uint64_t v112 = [v111 newFunctionWithName:@"softmax_gradient"];

    v113 = (void *)v106;
    v114 = (void *)[v142 newComputePipelineStateWithFunction:v106 error:0];
    v138 = (void *)v109;
    v115 = v53;
    v116 = (void *)[v142 newComputePipelineStateWithFunction:v109 error:0];
    v136 = (void *)v112;
    v117 = (void *)[v142 newComputePipelineStateWithFunction:v112 error:0];
    [v115 setMhaMaskSoftmaxForwardKernel:v114];
    [v115 setMhaMaskSoftmaxFastForwardKernel:v116];
    [v115 setMhaSoftmaxGradientKernel:v117];
    v118 = (void *)[objc_alloc(MEMORY[0x1E4F35878]) initWithDevice:v142 axis:2];
    v146[0] = v118;
    v119 = (void *)[objc_alloc(MEMORY[0x1E4F35878]) initWithDevice:v142 axis:1];
    v146[1] = v119;
    v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:2];
    v121 = (void *)[v120 copy];
    [v115 setMhaReduceSumKernels:v121];

    [v115 setSourceOfForwardNeededForGradient:1];
    [v115 setResultOfForwardNeededForGradient:0];
    if (v115)
    {
      [v115 setLayer:v132];
      [v131 addObject:v115];
      id v18 = v141;
    }
    else
    {
      v122 = +[MLCLog framework];
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
      {
        v125 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = v129;
        *(void *)&buf[4] = v125;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v142;
        _os_log_error_impl(&dword_1DD0C9000, v122, OS_LOG_TYPE_ERROR, "%@: Unable to create gpuOps for MultiHeadAttention layer for device %@", buf, 0x16u);
      }
      id v18 = v141;
      v115 = v143;
    }

    if (!v115) {
      break;
    }
    ++v25;
    v17 = v135;
    v123 = [v135 deviceList];
    unint64_t v124 = [v123 count];

    id v15 = v134;
    id v19 = v140;
    if (v25 >= v124) {
      goto LABEL_37;
    }
  }

  v127 = 0;
  id v15 = v134;
  v17 = v135;
  id v19 = v140;
  v21 = v132;
LABEL_39:

  return v127;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  v196[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v163 = a4;
  id v9 = a5;
  v10 = [v9 objectAtIndexedSubscript:0];
  v11 = [v10 descriptor];
  v12 = [v11 shape];
  uint64_t v161 = 1;
  v13 = [v12 objectAtIndexedSubscript:1];
  uint64_t v162 = [v13 unsignedIntegerValue];

  id v14 = [v9 objectAtIndexedSubscript:0];
  id v15 = [v14 descriptor];
  id v16 = [v15 shape];
  v17 = [v16 objectAtIndexedSubscript:0];
  uint64_t v183 = [v17 unsignedIntegerValue];

  id v18 = [v9 objectAtIndexedSubscript:0];
  id v19 = [v18 descriptor];
  v20 = [v19 stride];
  v21 = [v9 objectAtIndexedSubscript:0];
  v22 = [v21 descriptor];
  uint64_t v23 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v22, "dimensionCount") - 1);
  uint64_t v184 = [v23 unsignedIntegerValue];

  long long v24 = [v9 objectAtIndexedSubscript:0];
  unint64_t v25 = [v24 descriptor];
  unsigned int DataType = GPU_GetDataType([v25 dataType]);

  unsigned int v160 = 1;
  if ([v9 count] != 5)
  {
    if ([v9 count] == 4)
    {
      uint64_t v27 = [v9 objectAtIndexedSubscript:3];
      v28 = [v27 descriptor];
      unsigned int v29 = [v28 isFloatingPoint];

      unsigned int v160 = v29;
      uint64_t v161 = v29 ^ 1;
    }
    else
    {
      uint64_t v161 = 0;
      unsigned int v160 = 0;
    }
  }
  unsigned int v185 = DataType;
  v30 = [v8 deviceList];
  uint64_t v31 = [v30 count];

  uint64_t v32 = v184;
  if (v31)
  {
    uint64_t v33 = 0;
    v159 = v8;
    unint64_t v34 = 0x1E4F35000uLL;
    v168 = v9;
    do
    {
      v35 = [v8 deviceList];
      uint64_t v36 = [v35 objectAtIndexedSubscript:v33];

      uint64_t v167 = v33;
      float v37 = [v163 objectAtIndexedSubscript:v33];
      [v37 setMhaHasKeyMask:v161];
      [v37 setMhaHasAttentionMask:v160];
      double v38 = objc_opt_new();
      [v37 setLayer:v38];

      unint64_t v169 = [v37 mhaHeadCount];
      unint64_t v39 = [v37 mhaModelDimension] / v169;
      v166 = (void *)v36;
      v40 = (void *)[objc_alloc(MEMORY[0x1E4F357B8]) initWithDevice:v36 sourceCount:2];
      [v40 setAlpha:1.0 / sqrt((double)v39)];
      v186 = v37;
      v165 = v40;
      [v37 setMhaMatMulKernelWithScale:v40];
      uint64_t v41 = 0;
      do
      {
        v42 = [v9 objectAtIndexedSubscript:v41];
        v43 = [v42 descriptor];
        unint64_t v44 = [v43 shape];
        v45 = [v44 objectAtIndexedSubscript:1];
        uint64_t v46 = [v45 unsignedIntegerValue];

        uint64_t v180 = v41;
        uint64_t v47 = [v9 objectAtIndexedSubscript:v41];
        v48 = [v47 descriptor];
        v49 = [v48 shape];
        v50 = [v49 objectAtIndexedSubscript:2];
        uint64_t v51 = [v50 unsignedIntegerValue];

        uint64_t v52 = [v186 mhaModelDimension];
        uint64_t v172 = v46 * v32;
        uint64_t v174 = v51 * v32;
        uint64_t v53 = objc_msgSend(*(id *)(v34 + 1600), "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", v46, v51, v183);
        v54 = [v186 mhaMatrixDescriptors];
        v178 = (void *)v53;
        [v54 addObject:v53];

        v55 = (void *)MEMORY[0x1E4F35720];
        [NSNumber numberWithUnsignedInteger:v183];
        v57 = unint64_t v56 = v34;
        v196[0] = v57;
        v58 = [NSNumber numberWithUnsignedInteger:v46];
        v196[1] = v58;
        v59 = [NSNumber numberWithUnsignedInteger:v51];
        v196[2] = v59;
        v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:3];
        v61 = [v55 descriptorWithDataType:v185 shape:v60];

        [v61 setPreferPackedRows:1];
        unint64_t v62 = [v186 mhaNDArrayDescriptors];
        v177 = v61;
        [v62 addObject:v61];

        uint64_t v63 = [*(id *)(v56 + 1600) matrixDescriptorWithRows:v52 columns:v51 rowBytes:v174 dataType:v185];
        id v64 = [v186 mhaMatrixDescriptors];
        v175 = (void *)v63;
        [v64 addObject:v63];

        uint64_t v65 = (void *)MEMORY[0x1E4F35720];
        v66 = [NSNumber numberWithUnsignedInteger:v52];
        v195[0] = v66;
        v67 = [NSNumber numberWithUnsignedInteger:v51];
        v195[1] = v67;
        v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2];
        v69 = [v65 descriptorWithDataType:v185 shape:v68];

        [v69 setPreferPackedRows:1];
        v70 = [v186 mhaNDArrayDescriptors];
        [v70 addObject:v69];

        v71 = [*(id *)(v56 + 1600) matrixDescriptorWithRows:v52 columns:v46 matrices:v183 rowBytes:v172 matrixBytes:v172 * v52 dataType:v185];
        v72 = [v186 mhaMatrixDescriptors];
        [v72 addObject:v71];

        v73 = (void *)MEMORY[0x1E4F35720];
        v74 = [NSNumber numberWithUnsignedInteger:v183];
        v194[0] = v74;
        v75 = [NSNumber numberWithUnsignedInteger:v52];
        v194[1] = v75;
        uint64_t v76 = [NSNumber numberWithUnsignedInteger:v46];
        v194[2] = v76;
        char v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:3];
        char v78 = [v73 descriptorWithDataType:v185 shape:v77];

        uint64_t v32 = v184;
        [v78 setPreferPackedRows:1];
        v79 = [v186 mhaNDArrayDescriptors];
        [v79 addObject:v78];

        if ([v186 mhaHasBias])
        {
          v80 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v52 columns:1 rowBytes:v184 dataType:v185];
          unint64_t v81 = [v186 mhaMatrixDescriptorsForBias];
          [v81 addObject:v80];

          v82 = (void *)MEMORY[0x1E4F35720];
          id v83 = [NSNumber numberWithUnsignedInteger:v52];
          v193[0] = v83;
          v193[1] = &unk_1F3876A68;
          uint64_t v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:2];
          v85 = [v82 descriptorWithDataType:v185 shape:v84];

          [v85 setPreferPackedRows:1];
          v86 = [v186 mhaNDArrayDescriptorsForBias];
          [v86 addObject:v85];
        }
        uint64_t v41 = v180 + 1;
        id v9 = v168;
        unint64_t v34 = 0x1E4F35000;
      }
      while (v180 != 2);
      v87 = v186;
      unsigned int v88 = [v186 mhaHasZeroAttention];
      uint64_t v89 = 0;
      unint64_t v90 = v169 * v183;
      unint64_t v181 = [v186 mhaHasAttnBias] + (unint64_t)v88;
      do
      {
        unint64_t v91 = [v87 mhaModelDimension] / v169;
        v92 = [v168 objectAtIndexedSubscript:v89];
        v93 = [v92 descriptor];
        v94 = [v93 shape];
        v95 = [v94 objectAtIndexedSubscript:1];
        uint64_t v96 = [v95 unsignedIntegerValue];

        unint64_t v97 = v181;
        if (!v89) {
          unint64_t v97 = 0;
        }
        unint64_t v98 = v96 + v97;
        v99 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v91 columns:v98 matrices:v90 rowBytes:v98 * v184 matrixBytes:v98 * v184 * v91 dataType:v185];
        v100 = [v186 mhaMatrixDescriptors];
        [v100 addObject:v99];

        v101 = (void *)MEMORY[0x1E4F35720];
        v102 = [NSNumber numberWithUnsignedInteger:v90];
        v192[0] = v102;
        v103 = [NSNumber numberWithUnsignedInteger:v91];
        v192[1] = v103;
        v104 = [NSNumber numberWithUnsignedInteger:v98];
        v192[2] = v104;
        v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:3];
        uint64_t v106 = [v101 descriptorWithDataType:v185 shape:v105];

        v87 = v186;
        [v106 setPreferPackedRows:1];
        v107 = [v186 mhaNDArrayDescriptors];
        [v107 addObject:v106];

        ++v89;
      }
      while (v89 != 3);
      v108 = [v186 mhaMatrixDescriptors];
      uint64_t v109 = [v108 objectAtIndexedSubscript:9];

      v110 = [v186 mhaMatrixDescriptors];
      v111 = [v110 objectAtIndexedSubscript:10];

      v182 = v109;
      v179 = v111;
      uint64_t v112 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", objc_msgSend(v109, "columns"), objc_msgSend(v111, "columns"), objc_msgSend(v109, "matrices"), objc_msgSend(v111, "columns") * v184, objc_msgSend(v109, "columns") * v184 * objc_msgSend(v111, "columns"), v185);
      v113 = [v186 mhaMatrixDescriptors];
      [v113 addObject:v112];

      v114 = (void *)MEMORY[0x1E4F35720];
      v115 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v112, "matrices"));
      v191[0] = v115;
      v116 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v112, "rows"));
      v191[1] = v116;
      v117 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v112, "columns"));
      v191[2] = v117;
      v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:3];
      v119 = [v114 descriptorWithDataType:v185 shape:v118];

      [v119 setPreferPackedRows:1];
      v120 = [v186 mhaNDArrayDescriptors];
      v176 = v119;
      [v120 addObject:v119];

      v121 = [v186 mhaMatrixDescriptors];
      v122 = [v121 objectAtIndexedSubscript:11];

      uint64_t v123 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", objc_msgSend(v122, "rows"), objc_msgSend(v112, "rows"), objc_msgSend(v112, "matrices"), objc_msgSend(v112, "rows") * v184, objc_msgSend(v122, "rows") * v184 * objc_msgSend(v112, "rows"), v185);
      unint64_t v124 = [v186 mhaMatrixDescriptors];
      v171 = (void *)v123;
      [v124 addObject:v123];

      v125 = (void *)MEMORY[0x1E4F35720];
      v126 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v112, "matrices"));
      v190[0] = v126;
      v173 = v122;
      v127 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v122, "rows"));
      v190[1] = v127;
      v128 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v112, "rows"));
      v190[2] = v128;
      long long v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:3];
      v130 = [v125 descriptorWithDataType:v185 shape:v129];

      [v130 setPreferPackedRows:1];
      v131 = [v186 mhaNDArrayDescriptors];
      v170 = v130;
      [v131 addObject:v130];

      uint64_t v132 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:rowBytes:dataType:", objc_msgSend(v186, "mhaModelDimension"), objc_msgSend(v186, "mhaModelDimension"), objc_msgSend(v186, "mhaModelDimension") * v184, v185);
      v133 = [v186 mhaMatrixDescriptors];
      v164 = (void *)v132;
      [v133 addObject:v132];

      id v134 = (void *)MEMORY[0x1E4F35720];
      v135 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v186, "mhaModelDimension"));
      v189[0] = v135;
      v136 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v186, "mhaModelDimension"));
      v189[1] = v136;
      int64x2_t v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:2];
      v138 = [v134 descriptorWithDataType:v185 shape:v137];

      [v138 setPreferPackedRows:1];
      id v139 = [v186 mhaNDArrayDescriptors];
      [v139 addObject:v138];

      v140 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", v162, objc_msgSend(v186, "mhaModelDimension"), v183, objc_msgSend(v186, "mhaModelDimension") * v184, v184 * v162 * objc_msgSend(v186, "mhaModelDimension"), v185);
      id v141 = [v186 mhaMatrixDescriptors];
      [v141 addObject:v140];

      v142 = (void *)MEMORY[0x1E4F35720];
      v143 = [NSNumber numberWithUnsignedInteger:v183];
      v188[0] = v143;
      objc_super v144 = [NSNumber numberWithUnsignedInteger:v162];
      v188[1] = v144;
      objc_super v145 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v186, "mhaModelDimension"));
      v188[2] = v145;
      v146 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:3];
      v147 = [v142 descriptorWithDataType:v185 shape:v146];

      [v147 setPreferPackedRows:1];
      uint64_t v148 = [v186 mhaNDArrayDescriptors];
      [v148 addObject:v147];

      if ([v186 mhaHasBias])
      {
        v149 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, objc_msgSend(v186, "mhaModelDimension"), objc_msgSend(v186, "mhaModelDimension") * v184, v185);
        v150 = [v186 mhaMatrixDescriptorsForBias];
        [v150 addObject:v149];

        v151 = (void *)MEMORY[0x1E4F35720];
        v187[0] = &unk_1F3876A68;
        v152 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v186, "mhaModelDimension"));
        v187[1] = v152;
        v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:2];
        v154 = [v151 descriptorWithDataType:v185 shape:v153];

        [v154 setPreferPackedRows:1];
        v155 = [v186 mhaNDArrayDescriptorsForBias];
        [v155 addObject:v154];
      }
      uint64_t v33 = v167 + 1;
      id v8 = v159;
      v156 = [v159 deviceList];
      unint64_t v157 = [v156 count];

      id v9 = v168;
      uint64_t v32 = v184;
      unint64_t v34 = 0x1E4F35000;
    }
    while (v167 + 1 < v157);
  }

  return 1;
}

+ (id)layerWithDevice:(id)a3 desciptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)[objc_alloc((Class)a1) initWithDevice:v18 desciptor:v17 weights:v16 bias:v15 attnBias:v14 inferenceOnly:v8];

  return v19;
}

+ (BOOL)setMHAOptimizerDataForDevice:(unint64_t)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6 momentumArray:(id)a7 velocityArray:(id)a8 centerWeightArray:(id)a9 weightIndex:(unint64_t)a10 targetIndex:(unint64_t)a11 attnBias:(BOOL)a12
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  id v17 = a6;
  id v83 = a7;
  id v18 = a8;
  id v19 = a9;
  v20 = [v16 objectAtIndexedSubscript:a10];
  v21 = [v20 optimizerDeviceData];
  v22 = [v21 objectAtIndexedSubscript:a3];
  uint64_t v23 = [v22 momentumVectors];

  long long v24 = [v16 objectAtIndexedSubscript:a10];
  unint64_t v25 = [v24 optimizerDeviceData];
  v26 = [v25 objectAtIndexedSubscript:a3];
  v85 = [v26 velocityVectors];

  uint64_t v27 = [v16 objectAtIndexedSubscript:a10];
  v28 = [v27 optimizerDeviceData];
  unsigned int v29 = [v28 objectAtIndexedSubscript:a3];
  unint64_t v81 = [v29 centerWeightVectors];

  v80 = v23;
  v82 = [v23 objectAtIndexedSubscript:0];
  v30 = [v16 objectAtIndexedSubscript:a10];
  uint64_t v31 = [v30 optimizerData];
  unint64_t v32 = [v31 count];

  uint64_t v33 = 0;
  uint64_t v84 = 0;
  if (v32 >= 2)
  {
    uint64_t v84 = [v85 objectAtIndexedSubscript:0];
    unint64_t v34 = [v16 objectAtIndexedSubscript:a10];
    v35 = [v34 optimizerData];
    unint64_t v36 = [v35 count];

    if (v36 < 3)
    {
      uint64_t v33 = 0;
      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
    uint64_t v33 = [v81 objectAtIndexedSubscript:0];
  }
  if (v17)
  {
LABEL_5:
    v75 = v18;
    uint64_t v76 = v19;
    float v37 = [v17 objectAtIndexedSubscript:a10];
    double v38 = [v37 optimizerDeviceData];
    unint64_t v39 = [v38 objectAtIndexedSubscript:a3];
    v40 = [v39 momentumVectors];

    uint64_t v41 = [v17 objectAtIndexedSubscript:a10];
    v42 = [v41 optimizerDeviceData];
    v43 = [v42 objectAtIndexedSubscript:a3];
    unint64_t v44 = [v43 velocityVectors];

    v45 = [v17 objectAtIndexedSubscript:a10];
    uint64_t v46 = [v45 optimizerDeviceData];
    uint64_t v47 = [v46 objectAtIndexedSubscript:a3];
    char v77 = [v47 centerWeightVectors];

    char v78 = [v40 objectAtIndexedSubscript:0];
    v48 = [v17 objectAtIndexedSubscript:a10];
    v49 = [v48 optimizerData];
    unint64_t v50 = [v49 count];

    uint64_t v51 = 0;
    uint64_t v52 = 0;
    if (v50 >= 2)
    {
      uint64_t v51 = [v44 objectAtIndexedSubscript:0];
      uint64_t v53 = [v17 objectAtIndexedSubscript:a10];
      v54 = [v53 optimizerData];
      unint64_t v55 = [v54 count];

      if (v55 < 3)
      {
        uint64_t v52 = 0;
      }
      else
      {
        uint64_t v52 = [v77 objectAtIndexedSubscript:0];
      }
    }
    v79 = (void *)v33;
    id v64 = objc_msgSend(v16, "objectAtIndexedSubscript:", a10, v44);
    uint64_t v65 = [v64 optimizerData];
    if ([v65 count])
    {
      v66 = [v17 objectAtIndexedSubscript:a10];
      [v66 optimizerData];
      v68 = v67 = v40;
      uint64_t v69 = [v68 count];

      v40 = v67;
      id v18 = v75;
      v61 = (void *)v84;
      if (v69)
      {
        v88[0] = v82;
        v88[1] = v78;
        v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
        [v83 setObject:v70 atIndexedSubscript:a11];

        if (v84 && v51)
        {
          v87[0] = v84;
          v87[1] = v51;
          v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
          [v75 setObject:v71 atIndexedSubscript:a11];
        }
        if (v79 && v52)
        {
          v86[0] = v79;
          v86[1] = v52;
          v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
          [v76 setObject:v72 atIndexedSubscript:a11];
        }
      }
    }
    else
    {

      id v18 = v75;
      v61 = (void *)v84;
    }

    id v19 = v76;
    v60 = v79;
    goto LABEL_25;
  }
LABEL_9:
  [v16 objectAtIndexedSubscript:a10];
  v57 = unint64_t v56 = (void *)v33;
  v58 = [v57 optimizerData];
  uint64_t v59 = [v58 count];

  v60 = v56;
  v61 = (void *)v84;
  if (v59)
  {
    v91[0] = v82;
    unint64_t v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];
    [v83 setObject:v62 atIndexedSubscript:a11];

    if (v84)
    {
      uint64_t v90 = v84;
      uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
      [v18 setObject:v63 atIndexedSubscript:a11];
    }
    v60 = v56;
    if (v56)
    {
      uint64_t v89 = v56;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
      [v19 setObject:v40 atIndexedSubscript:a11];
LABEL_25:
    }
  }

  return 1;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6
{
  id v10 = a3;
  id v35 = a4;
  id v11 = a5;
  id v38 = a6;
  unint64_t v36 = v10;
  v12 = [v10 deviceList];
  uint64_t v13 = [v12 count];

  unint64_t v34 = v11;
  if (v13)
  {
    unint64_t v14 = 0;
    int v15 = 1;
    id v16 = v38;
    do
    {
      id v17 = [v35 objectAtIndexedSubscript:v14];
      if (v16)
      {
        BOOL v18 = (unint64_t)[v16 count] > 3;
        LOBYTE(v37) = [v16 count] > 4 * (unint64_t)v18;
        HIDWORD(v37) = v18;
        if (v37) {
          uint64_t v19 = 6;
        }
        else {
          uint64_t v19 = 4;
        }
      }
      else
      {
        uint64_t v37 = 0;
        uint64_t v19 = 4;
      }
      v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v19];
      v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v19];
      v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v19];
      uint64_t v23 = 0;
      if (HIDWORD(v37)) {
        long long v24 = v16;
      }
      else {
        long long v24 = 0;
      }
      do
      {
        LOBYTE(v33) = 0;
        v15 &= [a1 setMHAOptimizerDataForDevice:v14 deviceOps:v17 dataForWeights:v34 dataForBias:v24 momentumArray:v20 velocityArray:v21 centerWeightArray:v22 weightIndex:v23 targetIndex:v23 attnBias:v33];
        ++v23;
      }
      while (v23 != 4);
      if (v37)
      {
        for (uint64_t i = 0; i != 2; ++i)
        {
          if (HIDWORD(v37)) {
            uint64_t v26 = i + 4;
          }
          else {
            uint64_t v26 = i;
          }
          LOBYTE(v33) = 1;
          v15 &= [a1 setMHAOptimizerDataForDevice:v14 deviceOps:v17 dataForWeights:v38 dataForBias:0 momentumArray:v20 velocityArray:v21 centerWeightArray:v22 weightIndex:v26 targetIndex:i + 4 attnBias:v33];
        }
      }
      uint64_t v27 = (void *)[v20 copy];
      [v17 setMomentumVectors:v27];

      v28 = (void *)[v21 copy];
      [v17 setVelocityVectors:v28];

      unsigned int v29 = (void *)[v22 copy];
      [v17 setCenterWeightVectors:v29];

      ++v14;
      v30 = [v36 deviceList];
      unint64_t v31 = [v30 count];

      id v16 = v38;
    }
    while (v14 < v31);
  }
  else
  {
    LOBYTE(v15) = 1;
    id v16 = v38;
  }

  return v15;
}

@end