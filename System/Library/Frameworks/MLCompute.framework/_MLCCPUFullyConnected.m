@interface _MLCCPUFullyConnected
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 fusedBatchNormAndNeuron:(BOOL)a7;
+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 fusedBatchNormAndNeuronLayers:(BOOL)a8 mean:(id)a9 variance:(id)a10 beta:(id)a11 gamma:(id)a12 varianceEpsilon:(float)a13 momentum:(float)a14 opType:(int)a15;
+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 opType:(int)a8;
- (_MLCCPUFullyConnected)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 fusedBatchNormAndNeuronLayers:(BOOL)a8 mean:(id)a9 variance:(id)a10 beta:(id)a11 gamma:(id)a12 varianceEpsilon:(float)a13 momentum:(float)a14 opType:(int)a15;
@end

@implementation _MLCCPUFullyConnected

- (_MLCCPUFullyConnected)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 fusedBatchNormAndNeuronLayers:(BOOL)a8 mean:(id)a9 variance:(id)a10 beta:(id)a11 gamma:(id)a12 varianceEpsilon:(float)a13 momentum:(float)a14 opType:(int)a15
{
  BOOL v121 = a8;
  v156[1] = *MEMORY[0x1E4F143B8];
  id v123 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v124 = a7;
  id v24 = a9;
  id v125 = a10;
  id v126 = a11;
  id v25 = a12;
  unsigned int v120 = a15;
  v26 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if ((a15 - 32) > 6) {
    unsigned int v27 = 0;
  }
  else {
    unsigned int v27 = dword_1DD1F0BC0[a15 - 32];
  }
  int v28 = 65552;
  bzero(v134, 0x2F0uLL);
  id v29 = v23;
  id v30 = v21;
  id v128 = v22;
  int v135 = 0x20000;
  uint64_t v136 = [v29 inputFeatureChannelCount];
  uint64_t v137 = [v29 outputFeatureChannelCount];
  uint64_t v138 = 1;
  uint64_t v139 = [v29 inputFeatureChannelCount];
  id v31 = [v30 data];
  uint64_t v140 = [v31 bytes];

  v129 = v30;
  v32 = [v30 descriptor];
  int v33 = [v32 dataType];

  if (v33 == 1)
  {
    int v34 = 65568;
  }
  else
  {
    int v34 = 65552;
    if (v33 != 3)
    {
      v35 = +[MLCLog framework];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[_MLCCPUFullyConnected initWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:](v30);
      }
      v36 = self;
      v37 = v124;
      v38 = v126;
      v39 = v128;
LABEL_16:
      v43 = v123;

      v44 = v129;
      v127 = 0;
      goto LABEL_59;
    }
  }
  int v141 = v34;
  uint64_t v142 = 1065353216;
  v39 = v128;
  if (v128)
  {
    int v143 = 0x10000;
    uint64_t v144 = [v29 outputFeatureChannelCount];
    uint64_t v145 = 1;
    id v40 = [v128 data];
    uint64_t v146 = [v40 bytes];

    v41 = [v128 descriptor];
    int v42 = [v41 dataType];

    if (v42 == 1)
    {
      int v28 = 65568;
    }
    else if (v42 != 3)
    {
      v35 = +[MLCLog framework];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[_MLCCPUFullyConnected initWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:](v128);
      }
      v36 = self;
      v37 = v124;
      v38 = v126;
      goto LABEL_16;
    }
    int v147 = v28;
    uint64_t v148 = 1065353216;
  }

  uint64_t v45 = [v29 outputFeatureChannelCount];
  size_t v46 = v45;
  if (v121)
  {
    bzero(v132, 0x468uLL);
    v47 = [NSNumber numberWithUnsignedInteger:v46];
    v156[0] = v47;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:1];
    int v49 = CPU_BuildBNNSNormalizationParams(v27, (uint64_t)v132, v48, v24, v125, v126, v25, a13, a14);

    v36 = self;
    v43 = v123;
    v37 = v124;
    if (v49)
    {
      if (!v124)
      {
LABEL_24:
        size_t count = v46;
        id v105 = v24;
        v127 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v132 length:1128];
        goto LABEL_36;
      }
      if (setBNNSActivation((uint64_t)&v133, v124))
      {
        unsigned int v120 = 11;
        goto LABEL_24;
      }
    }
    v127 = 0;
LABEL_33:
    v38 = v126;
    v44 = v129;
    goto LABEL_59;
  }
  v37 = v124;
  if (v124)
  {
    v127 = 0;
    if ((setBNNSActivation((uint64_t)v149, v124) & 1) == 0)
    {
      v36 = self;
      v43 = v123;
      goto LABEL_33;
    }
    size_t count = v46;
    id v105 = v24;
    int v50 = 10;
    goto LABEL_35;
  }
  id v105 = v24;
  size_t count = v45;
  if (a15 == 41)
  {
    v127 = 0;
    v149[0] = 21;
    int v50 = 41;
    goto LABEL_35;
  }
  if (a15 == 40)
  {
    v127 = 0;
    v149[0] = 11;
    int v50 = 40;
LABEL_35:
    unsigned int v120 = v50;
    goto LABEL_36;
  }
  v127 = 0;
LABEL_36:
  v51 = v129;
  v119 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v134 length:752];
  memset(v132, 0, 176);
  memset(v131, 0, sizeof(v131));
  v118 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v132 length:176];
  v117 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v131 length:176];
  uint64_t v52 = [v29 inputFeatureChannelCount];
  size_t v53 = [v29 outputFeatureChannelCount] * v52;
  uint64_t v54 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v53, 4uLL, 0x100004052888210uLL), 4 * v53, 1);
  v55 = [v129 descriptor];
  v111 = (void *)v54;
  v116 = +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v29, v54, 1, [v55 dataType]);

  v56 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v58 = [v129 descriptor];
    v59 = +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v29, 0, 1, [v58 dataType]);
    [v56 setObject:v59 atIndexedSubscript:i];
  }
  v115 = v56;
  if (v128)
  {
    uint64_t v60 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(objc_msgSend(v29, "outputFeatureChannelCount"), 4uLL, 0x100004052888210uLL), 4 * objc_msgSend(v29, "outputFeatureChannelCount"), 1);
    v61 = [v128 descriptor];
    v110 = (void *)v60;
    v114 = +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v29, v60, [v61 dataType]);

    v62 = v126;
    v104 = v26;
    id v63 = v25;
    uint64_t v64 = 0;
    v65 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    do
    {
      v66 = [v128 descriptor];
      v67 = +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v29, 0, [v66 dataType]);
      [v65 setObject:v67 atIndexedSubscript:v64];

      ++v64;
    }
    while (v64 != 3);
    id v25 = v63;
    v51 = v129;
    v68 = v65;
    v26 = v104;
  }
  else
  {
    v114 = 0;
    v110 = 0;
    v68 = 0;
    v62 = v126;
  }
  v113 = v68;
  if (v121)
  {
    v102 = v25;
    v69 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(count, 4uLL, 0x100004052888210uLL), 4 * count, 1);
    v112 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(count, 4uLL, 0x100004052888210uLL), 4 * count, 1);
    v70 = [NSNumber numberWithUnsignedInteger:count];
    v155 = v70;
    v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v155 count:1];
    v72 = [v62 descriptor];
    v109 = v69;
    v108 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v71, v69, [v72 dataType], 0);

    v73 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v62)
    {
      for (uint64_t j = 0; j != 3; ++j)
      {
        v75 = [NSNumber numberWithUnsignedInteger:count];
        v154 = v75;
        v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v154 count:1];
        v77 = [v62 descriptor];
        v78 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v76, 0, [v77 dataType], 0);
        [v73 setObject:v78 atIndexedSubscript:j];
      }
    }
    v107 = v73;
    v79 = [NSNumber numberWithUnsignedInteger:count];
    v153 = v79;
    unint64_t v80 = 0x1E4F1C000uLL;
    v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v153 count:1];
    id v25 = v102;
    v82 = [v102 descriptor];
    v106 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v81, v112, [v82 dataType], 0);

    uint64_t v83 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    v84 = (void *)v83;
    if (v102)
    {
      id v101 = v29;
      uint64_t v85 = 0;
      v86 = (void *)v83;
      do
      {
        v87 = [NSNumber numberWithUnsignedInteger:count];
        v152 = v87;
        v88 = [*(id *)(v80 + 2424) arrayWithObjects:&v152 count:1];
        v89 = [v102 descriptor];
        v90 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v88, 0, [v89 dataType], 0);
        [v86 setObject:v90 atIndexedSubscript:v85];

        unint64_t v80 = 0x1E4F1C000;
        ++v85;
      }
      while (v85 != 3);
      id v25 = v102;
      v39 = v128;
      v51 = v129;
      v84 = v86;
      id v29 = v101;
    }
    else
    {
      v39 = v128;
      v51 = v129;
    }
  }
  else
  {
    v108 = 0;
    v109 = 0;
    v106 = 0;
    v107 = 0;
    v112 = 0;
    v84 = 0;
    v39 = v128;
    unint64_t v80 = 0x1E4F1C000;
  }
  v151 = v118;
  v91 = [*(id *)(v80 + 2424) arrayWithObjects:&v151 count:1];
  v150 = v117;
  v92 = [*(id *)(v80 + 2424) arrayWithObjects:&v150 count:1];
  v93 = +[MLCCPUDeviceOps deviceOpsWithType:v120 params:v119 inDeltaData:v91 outDeltaData:v92 weightsDeltaData:v116 biasDeltaData:v114 weightsMomentumData:v115 biasMomentumData:v113];

  if (v93)
  {
    [v26 addObject:v93];
    [v93 setWeightsDeltaDataBytes:v111];
    [v93 setBiasDeltaDataBytes:v110];
    v94 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v93 setWeightsMomentumDataBytes:v94];

    if (v39)
    {
      v95 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      [v93 setBiasMomentumDataBytes:v95];
    }
    if (v121)
    {
      [v93 setFusedPrimitiveParams:v127];
      [v93 setBetaDeltaData:v108];
      [v93 setBetaMomentumData:v107];
      [v93 setGammaMomentumData:v84];
      v96 = (void *)MEMORY[0x1E4F1CBF0];
      v97 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      [v93 setBetaMomentumDataBytes:v97];

      [v93 setGammaDeltaData:v106];
      [v93 setBetaDeltaDataBytes:v109];
      [v93 setGammaDeltaDataBytes:v112];
      v98 = (void *)[v96 mutableCopy];
      [v93 setGammaMomentumDataBytes:v98];

      [v93 setMovingMean:v105];
      [v93 setMovingVariance:v125];
    }
  }
  v99 = (void *)[v26 copy];
  v130.receiver = self;
  v130.super_class = (Class)_MLCCPUFullyConnected;
  v43 = v123;
  v36 = [(_MLCCPULayer *)&v130 initWithDevice:v123 deviceOps:v99];

  v127 = v36;
  v37 = v124;
  v44 = v51;
  id v24 = v105;
  v38 = v126;
LABEL_59:

  return v127;
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 opType:(int)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  LODWORD(v21) = a8;
  v19 = (void *)[objc_alloc((Class)a1) initWithDevice:v18 weights:v17 biasTerms:v16 convolutionDescriptor:v15 neuronDescriptor:v14 fusedBatchNormAndNeuronLayers:0 mean:0.0 variance:0.0 beta:0 gamma:0 varianceEpsilon:0 momentum:0 opType:v21];

  return v19;
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 fusedBatchNormAndNeuronLayers:(BOOL)a8 mean:(id)a9 variance:(id)a10 beta:(id)a11 gamma:(id)a12 varianceEpsilon:(float)a13 momentum:(float)a14 opType:(int)a15
{
  id v23 = a12;
  id v24 = a11;
  id v25 = a10;
  id v26 = a9;
  id v27 = a7;
  id v28 = a6;
  id v29 = a5;
  id v30 = a4;
  id v31 = a3;
  id v32 = objc_alloc((Class)a1);
  LODWORD(v37) = a15;
  *(float *)&double v33 = a13;
  *(float *)&double v34 = a14;
  v35 = (void *)[v32 initWithDevice:v31 weights:v30 biasTerms:v29 convolutionDescriptor:v28 neuronDescriptor:v27 fusedBatchNormAndNeuronLayers:1 mean:v33 variance:v34 beta:v26 gamma:v25 varianceEpsilon:v24 momentum:v23 opType:v37];

  return v35;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return [a1 compileWithDevice:a3 deviceOps:a4 sourceTensors:a5 resultTensor:a6 fusedBatchNormAndNeuron:0];
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 fusedBatchNormAndNeuron:(BOOL)a7
{
  BOOL v101 = a7;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  v104 = [a4 objectAtIndexedSubscript:0];
  id v102 = [v104 params];
  v108 = (void *)[v102 bytes];
  id v11 = v9;
  id v103 = v10;
  v12 = [v11 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  id v14 = [v13 shape];
  uint64_t v15 = [v14 count];

  id v16 = [v11 objectAtIndexedSubscript:0];
  id v17 = [v16 descriptor];
  id v18 = [v17 shape];
  uint64_t v19 = v15 - 1;
  v20 = [v18 objectAtIndexedSubscript:v15 - 1];
  uint64_t v21 = [v20 unsignedIntegerValue];

  id v22 = [v11 objectAtIndexedSubscript:0];
  id v23 = [v22 descriptor];
  id v24 = [v23 stride];
  id v25 = [v24 objectAtIndexedSubscript:v15 - 1];
  uint64_t v26 = [v25 unsignedIntegerValue];

  uint64_t v105 = v26;
  if (v15 == 4)
  {
    id v27 = [v11 objectAtIndexedSubscript:0];
    id v28 = [v27 descriptor];
    id v29 = [v28 shape];
    id v30 = [v29 objectAtIndexedSubscript:3];
    uint64_t v31 = [v30 unsignedIntegerValue];
    BOOL v32 = v31 == 1;
    if (v31 != 1)
    {
LABEL_5:

      goto LABEL_8;
    }
    uint64_t v100 = v21;
    [v11 objectAtIndexedSubscript:0];
    v34 = double v33 = v11;
    v35 = [v34 descriptor];
    v36 = [v35 shape];
    uint64_t v37 = [v36 objectAtIndexedSubscript:2];
    uint64_t v106 = [v37 unsignedIntegerValue];

    if (v106 == 1)
    {
      id v27 = [v33 objectAtIndexedSubscript:0];
      id v28 = [v27 descriptor];
      id v29 = [v28 shape];
      id v30 = [v29 objectAtIndexedSubscript:1];
      uint64_t v21 = [v30 unsignedIntegerValue];
      id v11 = v33;
      uint64_t v26 = v105;
      BOOL v32 = 1;
      goto LABEL_5;
    }
    BOOL v32 = 0;
    id v11 = v33;
    uint64_t v26 = v105;
    uint64_t v21 = v100;
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_8:
  v38 = [NSNumber numberWithUnsignedInteger:v21];
  *(void *)&filter_params.flags = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&filter_params count:1];
  id v40 = [NSNumber numberWithUnsignedInteger:v26];
  layer_params[0] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:layer_params count:1];
  v107 = v11;
  int v42 = [v11 objectAtIndexedSubscript:0];
  v43 = [v42 descriptor];
  CPU_BuildBNNSNDArrayDescriptor((uint64_t)v108, v39, v41, 0, [v43 dataType], v32, 0);

  v44 = [v103 descriptor];
  uint64_t v45 = [v44 shape];
  size_t v46 = [v45 objectAtIndexedSubscript:v19];
  uint64_t v47 = [v46 unsignedIntegerValue];

  int v48 = v32;
  if (v32)
  {
    int v49 = [v103 descriptor];
    int v50 = [v49 shape];
    v51 = [v50 objectAtIndexedSubscript:1];
    uint64_t v47 = [v51 unsignedIntegerValue];
  }
  uint64_t v52 = v103;
  size_t v53 = [NSNumber numberWithUnsignedInteger:v47];
  *(void *)filter_type = v53;
  uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:filter_type count:1];
  v55 = [NSNumber numberWithUnsignedInteger:v105];
  v112 = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
  v57 = [v103 descriptor];
  CPU_BuildBNNSNDArrayDescriptor((uint64_t)v108 + 352, v54, v56, 0, [v57 dataType], v48, 0);

  memset(&filter_params, 0, sizeof(filter_params));
  filter_params.flags = 1;
  v58 = [v107 objectAtIndexedSubscript:0];
  v59 = [v107 objectAtIndexedSubscript:0];
  uint64_t v60 = [v59 descriptor];
  v61 = [v60 shape];
  v62 = [v61 objectAtIndexedSubscript:0];
  uint64_t v63 = adjustBatchSizeForFC(v58, [v62 unsignedIntegerValue]);

  if (!v101)
  {
    v72 = (void *)MEMORY[0x1E01B0C90](v108, &filter_params, v63);
    uint64_t v64 = v104;
    if (v72)
    {
      v71 = v107;
      v74 = [v107 objectAtIndexedSubscript:0];
      v75 = [v74 descriptor];
      v76 = [v75 shape];
      uint64_t v77 = [v76 count];

      if (v77 == 4)
      {
        v78 = [v107 objectAtIndexedSubscript:0];
        v79 = [v78 descriptor];
        unint64_t v80 = [v79 shape];
        v81 = [v80 objectAtIndexedSubscript:3];
        if ([v81 unsignedIntegerValue] == 1)
        {
          v82 = [v107 objectAtIndexedSubscript:0];
          uint64_t v83 = [v82 descriptor];
          v84 = [v83 shape];
          uint64_t v85 = [v84 objectAtIndexedSubscript:2];
          uint64_t v109 = [v85 unsignedIntegerValue];

          uint64_t v64 = v104;
          v71 = v107;

          uint64_t v52 = v103;
          if (v109 == 1)
          {
            v86 = [v107 objectAtIndexedSubscript:0];
            [v104 setSourceStride:CPU_SetBatchStride(v86)];

            [v104 setResultStride:CPU_SetBatchStride(v103)];
LABEL_23:
            id v66 = v102;
LABEL_24:
            objc_opt_class();
            v97 = objc_opt_new();
            [v64 setLayer:v97];

            v98 = [v64 layer];
            [v98 setFilter:v72];

            BOOL v87 = 1;
            goto LABEL_25;
          }
        }
        else
        {

          uint64_t v52 = v103;
        }
      }
      v88 = [v71 objectAtIndexedSubscript:0];
      v89 = [v88 descriptor];
      v90 = [v89 shape];
      uint64_t v91 = v77 - 1;
      v92 = [v90 objectAtIndexedSubscript:v77 - 1];
      objc_msgSend(v64, "setSourceStride:", objc_msgSend(v92, "unsignedIntegerValue"));

      v93 = [v52 descriptor];
      v94 = [v93 shape];
      uint64_t v95 = v91;
      v71 = v107;
      v96 = [v94 objectAtIndexedSubscript:v95];
      objc_msgSend(v64, "setResultStride:", objc_msgSend(v96, "unsignedIntegerValue"));

      goto LABEL_23;
    }
    v71 = v107;
    goto LABEL_23;
  }
  uint64_t v64 = v104;
  v65 = [v104 fusedPrimitiveParams];

  id v66 = v65;
  v67 = (void *)[v66 bytes];
  if (CPU_BuildBNNSNormalizationInputOutputParams((uint64_t)v67, v107, v103, 0))
  {
    v68 = [v103 descriptor];
    v69 = [v68 shape];
    v70 = [v69 objectAtIndexedSubscript:1];
    v67[3] = [v70 unsignedIntegerValue];

    v71 = v107;
    *(void *)filter_type = 0x200000001;
    layer_params[0] = v108;
    layer_params[1] = v67;
    v72 = BNNSFilterCreateFusedLayer(2uLL, filter_type, (const void **)layer_params, &filter_params);
    if (v72)
    {
      v73 = [v107 objectAtIndexedSubscript:0];
      [v104 setSourceStride:CPU_SetBatchStride(v73)];

      [v104 setResultStride:CPU_SetBatchStride(v103)];
      [v104 setIsFusedBNNSFilter:1];
    }
    goto LABEL_24;
  }
  BOOL v87 = 0;
  v71 = v107;
LABEL_25:

  return v87;
}

- (void)initWithDevice:(void *)a1 weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:.cold.1(void *a1)
{
  v1 = [a1 descriptor];
  [v1 dataType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%s: Unsupported weights data type (%d)", v4, v5, v6, v7, 2u);
}

- (void)initWithDevice:(void *)a1 weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:.cold.2(void *a1)
{
  v1 = [a1 descriptor];
  [v1 dataType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%s: Unsupported biasTerms data type (%d)", v4, v5, v6, v7, 2u);
}

@end