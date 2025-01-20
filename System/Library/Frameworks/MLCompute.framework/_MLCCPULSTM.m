@interface _MLCCPULSTM
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForInputWeights:(id)a5 dataForHiddenWeights:(id)a6 dataForPeepholeWeights:(id)a7 dataForBias:(id)a8;
+ (id)layerWithDevice:(id)a3 lstmDescriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 ouputResultActivation:(id)a10 inferenceOnly:(BOOL)a11;
- (_MLCCPULSTM)initWithDevice:(id)a3 lstmDescriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11;
@end

@implementation _MLCCPULSTM

- (_MLCCPULSTM)initWithDevice:(id)a3 lstmDescriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11
{
  uint64_t v11 = MEMORY[0x1F4188790](self);
  v13 = v12;
  uint64_t v121 = v14;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v117 = (void *)v11;
  v176[1] = *MEMORY[0x1E4F143B8];
  id v118 = v21;
  id v22 = v20;
  id v23 = v18;
  id v24 = v16;
  id v25 = v13;
  id v26 = a9;
  id v27 = a10;
  v28 = (void *)MEMORY[0x1E4F1CBF0];
  v122 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  bzero(v155, 0x13A0uLL);
  bzero(v142, 0x13B0uLL);
  v29 = (void *)[v28 mutableCopy];
  v30 = (void *)[v28 mutableCopy];
  id v31 = v22;
  id v129 = v23;
  id v128 = v25;
  id v133 = v30;
  id v135 = v29;
  id v127 = v24;
  id v134 = v26;
  id v132 = v27;
  v154[0] = [v31 inputSize];
  v154[1] = [v31 hiddenSize];
  uint64_t v137 = [v31 hiddenSize];
  unint64_t v32 = [v31 layerCount];
  int v33 = [v31 isBidirectional];
  if (v33)
  {
    int v157 = 1;
    uint64_t v34 = 2;
  }
  else
  {
    uint64_t v34 = 1;
  }
  uint64_t v130 = v34;
  [v31 dropout];
  int v156 = v35;
  v155[1] = [v31 layerCount];
  v36 = [v134 objectAtIndexedSubscript:0];
  setBNNSActivation((uint64_t)&v161, v36);

  v37 = [v134 objectAtIndexedSubscript:1];
  setBNNSActivation((uint64_t)&v165, v37);

  v38 = [v134 objectAtIndexedSubscript:2];
  setBNNSActivation((uint64_t)&v169, v38);

  [v134 objectAtIndexedSubscript:3];
  v39 = v136 = v31;

  setBNNSActivation((uint64_t)&v173, v39);
  setBNNSActivation((uint64_t)&v174, v132);

  setBNNSLSTMGateDesc((uint64_t)v158, v136);
  setBNNSLSTMGateDesc((uint64_t)v162, v136);
  setBNNSLSTMGateDesc((uint64_t)v166, v136);
  setBNNSLSTMGateDesc((uint64_t)v170, v136);
  addInputWeightPointersToGate((uint64_t)v158, v129, v33, v32, 0, v133, 1);
  addInputWeightPointersToGate((uint64_t)v162, v129, v33, v32, 1, v133, 1);
  addInputWeightPointersToGate((uint64_t)v166, v129, v33, v32, 2, v133, 1);
  addInputWeightPointersToGate((uint64_t)v170, v129, v33, v32, 3, v133, 1);
  if (v32 >= 2)
  {
    addInputWeightPointersToGate((uint64_t)v158, v129, v33, v32, 0, v133, 0);
    addInputWeightPointersToGate((uint64_t)v162, v129, v33, v32, 1, v133, 0);
    addInputWeightPointersToGate((uint64_t)v166, v129, v33, v32, 2, v133, 0);
    addInputWeightPointersToGate((uint64_t)v170, v129, v33, v32, 3, v133, 0);
  }
  createParameterPointersForGate(v127, 0, v32, v33, v133);
  id v40 = objc_claimAutoreleasedReturnValue();
  v158[61] = [v40 bytes];

  createParameterPointersForGate(v127, 1, v32, v33, v133);
  id v41 = objc_claimAutoreleasedReturnValue();
  v162[61] = [v41 bytes];

  createParameterPointersForGate(v127, 2, v32, v33, v133);
  id v42 = objc_claimAutoreleasedReturnValue();
  v166[61] = [v42 bytes];

  v43 = createParameterPointersForGate(v127, 3, v32, v33, v133);

  id v44 = v43;
  v170[61] = [v44 bytes];

  if (v128)
  {
    if (v32 == 1) {
      char v45 = v33;
    }
    else {
      char v45 = 1;
    }
    if (v45)
    {
      size_t v46 = 4 * v137 * v32 * v130;
      createBiDirectionalAndStackedGateWeightData(v46, v128, [v136 isBidirectional], v32, 0, v137, v135);
      id v47 = objc_claimAutoreleasedReturnValue();
      uint64_t v160 = [v47 bytes];

      createBiDirectionalAndStackedGateWeightData(v46, v128, [v136 isBidirectional], v32, 1, v137, v135);
      id v48 = objc_claimAutoreleasedReturnValue();
      uint64_t v164 = [v48 bytes];

      createBiDirectionalAndStackedGateWeightData(v46, v128, [v136 isBidirectional], v32, 2, v137, v135);
      id v49 = objc_claimAutoreleasedReturnValue();
      uint64_t v168 = [v49 bytes];

      createBiDirectionalAndStackedGateWeightData(v46, v128, [v136 isBidirectional], v32, 3, v137, v135);
      id v50 = objc_claimAutoreleasedReturnValue();
      uint64_t v172 = [v50 bytes];
    }
    else
    {
      v51 = [v128 objectAtIndexedSubscript:0];
      id v52 = [v51 data];
      uint64_t v160 = [v52 bytes];

      v53 = [v128 objectAtIndexedSubscript:1];
      id v54 = [v53 data];
      uint64_t v164 = [v54 bytes];

      v55 = [v128 objectAtIndexedSubscript:2];
      id v56 = [v55 data];
      uint64_t v168 = [v56 bytes];

      id v50 = [v128 objectAtIndexedSubscript:3];
      id v57 = [v50 data];
      uint64_t v172 = [v57 bytes];
    }
  }

  if (a11) {
    int v156 = 0;
  }
  v126 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v154 length:5040];
  memset(v141, 0, sizeof(v141));
  memset(v140, 0, sizeof(v140));
  v125 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v141 length:176];
  v124 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v140 length:176];
  size_t v58 = MEMORY[0x1E01B0C00](v154);
  v120 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_valloc(v58, 0xA5F35CCAuLL), v58, 1);
  uint64_t v59 = [v136 inputSize];
  uint64_t v60 = [v136 hiddenSize];
  unint64_t v61 = [v136 layerCount];
  char v62 = [v136 isBidirectional];
  int v63 = [v136 usesBiases];
  uint64_t v64 = 8;
  if (v63) {
    uint64_t v64 = 12;
  }
  if (v121) {
    v64 += 4;
  }
  if (v61 > 1) {
    v64 += 4;
  }
  uint64_t v116 = v64;
  v65 = (void *)MEMORY[0x1E4F1CBF0];
  v123 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v138 = (void *)[v65 mutableCopy];
  v131 = (void *)[v65 mutableCopy];
  v119 = (void *)[v65 mutableCopy];
  uint64_t v66 = 3;
  int v67 = [v136 isBidirectional];
  uint64_t v68 = 0;
  size_t v69 = (v61 << v62) * v60;
  do
  {
    v70 = (void *)[v65 mutableCopy];
    v71 = buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 1);
    [v70 setObject:v71 atIndexedSubscript:0];

    v72 = buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 1);
    [v70 setObject:v72 atIndexedSubscript:1];

    v73 = buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 1);
    [v70 setObject:v73 atIndexedSubscript:2];

    v74 = buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 1);
    [v70 setObject:v74 atIndexedSubscript:3];

    if (v61 >= 2)
    {
      v75 = buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 0);
      [v70 setObject:v75 atIndexedSubscript:4];

      v76 = buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 0);
      [v70 setObject:v76 atIndexedSubscript:5];

      v77 = buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 0);
      [v70 setObject:v77 atIndexedSubscript:6];

      v78 = buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 0);
      [v70 setObject:v78 atIndexedSubscript:7];
    }
    [v138 setObject:v70 atIndexedSubscript:v68];

    ++v68;
  }
  while (v68 != 3);
  uint64_t v79 = 0;
  v80 = (void *)MEMORY[0x1E4F1CBF0];
  do
  {
    v81 = (void *)[v80 mutableCopy];
    v82 = buildBNNSDescHiddenWeightMomentumForOneGate(v60, v61, v67);
    [v81 setObject:v82 atIndexedSubscript:0];

    v83 = buildBNNSDescHiddenWeightMomentumForOneGate(v60, v61, v67);
    [v81 setObject:v83 atIndexedSubscript:1];

    v84 = buildBNNSDescHiddenWeightMomentumForOneGate(v60, v61, v67);
    [v81 setObject:v84 atIndexedSubscript:2];

    v85 = buildBNNSDescHiddenWeightMomentumForOneGate(v60, v61, v67);
    [v81 setObject:v85 atIndexedSubscript:3];

    [v131 setObject:v81 atIndexedSubscript:v79];
    ++v79;
  }
  while (v79 != 3);
  v86 = v119;
  if ([v136 usesBiases])
  {
    uint64_t v87 = 3;
    do
    {
      v88 = createNewBNNSNDArrayForLSTM(v69, v159);
      [v119 setObject:v88 atIndexedSubscript:v87 - 3];

      v89 = createNewBNNSNDArrayForLSTM(v69, v163);
      [v119 setObject:v89 atIndexedSubscript:v87 - 2];

      v90 = createNewBNNSNDArrayForLSTM(v69, v167);
      [v119 setObject:v90 atIndexedSubscript:v87 - 1];

      v91 = createNewBNNSNDArrayForLSTM(v69, v171);
      [v119 setObject:v91 atIndexedSubscript:v87];

      v87 += 4;
      --v66;
    }
    while (v66);
  }
  v176[0] = v125;
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:1];
  v175 = v124;
  v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v175 count:1];
  v94 = +[MLCRNNCPUDeviceOps deviceOpsWithType:17 params:v126 inDeltaData:v92 outDeltaData:v93 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:v123 biasMomentumData:v119];

  v95 = v131;
  v96 = v136;
  if (v94)
  {
    [v122 addObject:v94];
    objc_msgSend(v94, "setBatchFirst:", objc_msgSend(v136, "batchFirst"));
    objc_msgSend(v94, "setHasBias:", objc_msgSend(v136, "usesBiases"));
    [v94 setHasPeephole:v121 != 0];
    id v97 = v136;
    id v98 = v134;
    id v99 = v132;
    uint64_t v100 = [v97 layerCount];
    v142[0] = [v97 inputSize];
    v142[1] = [v97 hiddenSize];
    v142[3] = v100;
    if ([v97 isBidirectional]) {
      int v144 = 1;
    }
    [v97 dropout];
    int v143 = v101;
    v102 = [v98 objectAtIndexedSubscript:0];
    setBNNSActivation((uint64_t)&v146, v102);

    v103 = [v98 objectAtIndexedSubscript:1];
    setBNNSActivation((uint64_t)&v148, v103);

    v104 = [v98 objectAtIndexedSubscript:2];
    setBNNSActivation((uint64_t)&v150, v104);

    v105 = [v98 objectAtIndexedSubscript:3];

    setBNNSActivation((uint64_t)&v152, v105);
    setBNNSActivation((uint64_t)&v153, v99);

    setBNNSLSTMGateDesc((uint64_t)&v145, v97);
    setBNNSLSTMGateDesc((uint64_t)&v147, v97);
    setBNNSLSTMGateDesc((uint64_t)&v149, v97);
    setBNNSLSTMGateDesc((uint64_t)&v151, v97);

    v106 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v142 length:5040];
    [v94 setLstmDeltaParams:v106];
    [v94 setTrainingCache:v120];
    [v94 setCombinedGateWeightsAndBias:v135];
    [v94 setParameterPointers:v133];
    objc_msgSend(v94, "setReturnsSequences:", objc_msgSend(v97, "returnsSequences"));
    objc_msgSend(v94, "setNumLayers:", objc_msgSend(v97, "layerCount"));
    objc_msgSend(v94, "setBiDirectional:", objc_msgSend(v97, "isBidirectional"));
    objc_msgSend(v94, "setInputSize:", objc_msgSend(v97, "inputSize"));
    objc_msgSend(v94, "setHiddenSize:", objc_msgSend(v97, "hiddenSize"));
    [v94 setNumParametersForSingleLSTM:v116];
    v107 = (void *)MEMORY[0x1E4F1CBF0];
    v108 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v94 setCombinedInputsBuffer:v108];

    v109 = (void *)[v107 mutableCopy];
    [v94 setCombinedOutputsBuffer:v109];

    [v94 setInputWeightsMomentumDescData:v138];
    v95 = v131;
    [v94 setHiddenWeightsMomentumDescData:v131];
    if (!a11)
    {
      v110 = (void *)MEMORY[0x1E4F1CBF0];
      v111 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      [v94 setInputWeightsDeltaPointers:v111];

      v112 = (void *)[v110 mutableCopy];
      [v94 setHiddenWeightsDeltaPointers:v112];
    }
    v96 = v136;
    v86 = v119;
  }
  v113 = (void *)[v122 copy];
  v139.receiver = v117;
  v139.super_class = (Class)_MLCCPULSTM;
  v114 = [(_MLCCPULayer *)&v139 initWithDevice:v118 deviceOps:v113];

  return v114;
}

+ (id)layerWithDevice:(id)a3 lstmDescriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 ouputResultActivation:(id)a10 inferenceOnly:(BOOL)a11
{
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  LOBYTE(v28) = a11;
  id v26 = (void *)[objc_alloc((Class)a1) initWithDevice:v25 lstmDescriptor:v24 inputWeights:v23 hiddenWeights:v22 peepholeWeights:v21 biasTerms:v20 gateActivations:v19 outputResultActivation:v18 inferenceOnly:v28];

  return v26;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v7 = a5;
  v8 = [a4 objectAtIndexedSubscript:0];
  id v9 = [v8 params];
  v10 = (uint64_t *)[v9 bytes];
  id v11 = [v8 lstmDeltaParams];
  v12 = (uint64_t *)[v11 bytes];
  v13 = [v7 objectAtIndexedSubscript:0];

  uint64_t v14 = [v13 descriptor];
  v15 = [v14 shape];

  v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v8, "batchFirst") ^ 1);
  uint64_t v17 = [v16 unsignedIntegerValue];

  if ([v8 batchFirst] && objc_msgSend(v15, "count") == 4)
  {
    id v28 = v9;
    id v18 = v12;
    uint64_t v19 = 1;
    uint64_t v20 = 3;
LABEL_11:
    id v22 = [v15 objectAtIndexedSubscript:v20];
    uint64_t v20 = [v22 unsignedIntegerValue];

    id v23 = [v15 objectAtIndexedSubscript:v19];
    uint64_t v21 = [v23 unsignedIntegerValue];

    v12 = v18;
    id v9 = v28;
    goto LABEL_13;
  }
  if ([v8 batchFirst] && objc_msgSend(v15, "count") == 3)
  {
    id v28 = v9;
    id v18 = v12;
    uint64_t v19 = 2;
    uint64_t v20 = 1;
    goto LABEL_11;
  }
  if (([v8 batchFirst] & 1) == 0)
  {
    uint64_t v20 = 0;
    if ([v15 count] != 3)
    {
      uint64_t v21 = 0;
      goto LABEL_13;
    }
    id v28 = v9;
    id v18 = v12;
    uint64_t v19 = 2;
    goto LABEL_11;
  }
  uint64_t v20 = 0;
  uint64_t v21 = 0;
LABEL_13:
  if (CPU_BuildBNNSLSTMInputAndOutput(v10, v17, v20, v21, v8)
    && CPU_BuildBNNSLSTMInputAndOutput(v12, v17, v20, v21, v8))
  {
    objc_opt_class();
    id v24 = objc_opt_new();
    [v8 setLayer:v24];

    id v25 = [v8 layer];
    [v25 setFilter:0];

    BOOL v26 = 1;
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForInputWeights:(id)a5 dataForHiddenWeights:(id)a6 dataForPeepholeWeights:(id)a7 dataForBias:(id)a8
{
  id v87 = a5;
  id v88 = a6;
  id v11 = a8;
  v12 = [a4 objectAtIndexedSubscript:0];
  if (([v12 inferenceOnly] & 1) == 0)
  {
    v13 = [v87 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 optimizerData];
    uint64_t v15 = [v14 count];

    [v12 setNumAccumulatorsPerParameter:v15];
    uint64_t v16 = [v12 numLayers];
    int v17 = [v12 biDirectional];
    if (v15)
    {
      v73 = v11;
      uint64_t v18 = 0;
      if (v17) {
        size_t v19 = 16;
      }
      else {
        size_t v19 = 8;
      }
      uint64_t v85 = 4 * v16;
      unint64_t v86 = v16;
      uint64_t v83 = v16 - 1;
      uint64_t v75 = v15;
      size_t size = 8 * ((v16 - 1) << v17);
      char v20 = v17;
      size_t v74 = v19;
      do
      {
        v82 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        for (uint64_t i = 0; i != 4; ++i)
        {
          id v22 = malloc_type_malloc(v19, 0x80040B8603338uLL);
          id v23 = [v87 objectAtIndexedSubscript:i];
          id v24 = [v23 optimizerData];
          id v25 = [v24 objectAtIndexedSubscript:v18];
          *id v22 = [v25 bytes];

          if ([v12 biDirectional])
          {
            BOOL v26 = [v87 objectAtIndexedSubscript:v85 + i];
            id v27 = [v26 optimizerData];
            id v28 = [v27 objectAtIndexedSubscript:v18];
            v22[1] = [v28 bytes];
          }
          v29 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v22 length:v19 freeWhenDone:0];
          [v82 addObject:v29];
          v30 = [v12 inputWeightsMomentumDescData];
          id v31 = [v30 objectAtIndexedSubscript:v18];
          id v32 = [v31 objectAtIndexedSubscript:i];
          uint64_t v33 = [v32 bytes];

          id v34 = v29;
          *(void *)(v33 + 136) = [v34 bytes];
        }
        size_t v35 = size;
        if (v86 >= 2)
        {
          uint64_t v80 = 0;
          uint64_t v36 = 4;
          do
          {
            v37 = malloc_type_malloc(v35, 0x80040B8603338uLL);
            uint64_t v38 = 0;
            uint64_t v78 = v36;
            uint64_t v39 = v36;
            do
            {
              id v40 = [v87 objectAtIndexedSubscript:v39];
              id v41 = [v40 optimizerData];
              id v42 = [v41 objectAtIndexedSubscript:v18];
              v37[v38 << v20] = [v42 bytes];

              if ([v12 biDirectional])
              {
                v43 = [v87 objectAtIndexedSubscript:v85 + v39];
                id v44 = [v43 optimizerData];
                char v45 = [v44 objectAtIndexedSubscript:v18];
                v37[(v38 << v20) + 1] = [v45 bytes];
              }
              v39 += 4;
              ++v38;
            }
            while (v83 != v38);
            size_t v35 = size;
            v77 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v37 length:size freeWhenDone:0];
            uint64_t v46 = v80;
            [v82 setObject:v77 atIndexedSubscript:v80 + 4];
            id v47 = [v12 inputWeightsMomentumDescData];
            id v48 = [v47 objectAtIndexedSubscript:v18];
            id v49 = [v48 objectAtIndexedSubscript:v80 + 4];
            uint64_t v50 = [v49 bytes];

            *(void *)(v50 + 136) = v37;
            uint64_t v36 = v78 + 1;
            ++v80;
          }
          while (v46 != 3);
        }
        v51 = [v12 bnnsInputWeightsMomentumPointers];
        [v51 setObject:v82 atIndexedSubscript:v18];

        ++v18;
        size_t v19 = v74;
      }
      while (v18 != v75);
      uint64_t v52 = 0;
      unint64_t v53 = v86;
      size_t v54 = 8 * (v86 << v20);
      do
      {
        uint64_t v79 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        uint64_t v84 = 0;
        do
        {
          v55 = malloc_type_malloc(v54, 0x80040B8603338uLL);
          if (v53)
          {
            uint64_t v56 = 0;
            uint64_t v57 = v84;
            do
            {
              size_t v58 = [v88 objectAtIndexedSubscript:v57];
              uint64_t v59 = [v58 optimizerData];
              uint64_t v60 = [v59 objectAtIndexedSubscript:v52];
              v55[v56 << v20] = [v60 bytes];

              if ([v12 biDirectional])
              {
                unint64_t v61 = [v88 objectAtIndexedSubscript:v85 + v57];
                char v62 = [v61 optimizerData];
                int v63 = [v62 objectAtIndexedSubscript:v52];
                v55[(v56 << v20) + 1] = [v63 bytes];
              }
              ++v56;
              v57 += 4;
              unint64_t v53 = v86;
            }
            while (v86 != v56);
          }
          v81 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v55 length:8 * (v86 << v20) freeWhenDone:0];
          uint64_t v64 = v84;
          [v79 setObject:v81 atIndexedSubscript:v84];
          v65 = [v12 hiddenWeightsMomentumDescData];
          uint64_t v66 = [v65 objectAtIndexedSubscript:v52];
          id v67 = [v66 objectAtIndexedSubscript:v84];
          uint64_t v68 = [v67 bytes];

          *(void *)(v68 + 136) = v55;
          size_t v54 = 8 * (v86 << v20);

          ++v84;
        }
        while (v64 != 3);
        size_t v69 = [v12 bnnsHiddenWeightsMomentumPointers];
        [v69 setObject:v79 atIndexedSubscript:v52];

        ++v52;
      }
      while (v52 != v75);
      id v11 = v73;
      if (v73)
      {
        uint64_t v70 = 0;
        uint64_t v71 = 3;
        do
        {
          setBiasOptimizerData(v12, v73, 0, v71 - 3, v70);
          setBiasOptimizerData(v12, v73, 1, v71 - 2, v70);
          setBiasOptimizerData(v12, v73, 2, v71 - 1, v70);
          setBiasOptimizerData(v12, v73, 3, v71, v70++);
          v71 += 4;
        }
        while (v75 != v70);
      }
    }
  }

  return 1;
}

@end