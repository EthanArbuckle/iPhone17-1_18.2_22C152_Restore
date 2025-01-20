@interface _MLCGPULSTM
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 biasTerms:(id)a7;
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11;
+ (void)setBiasOptimizerDataForMomentumMatrices:(id)a3 velocityMatrices:(id)a4 centerWeightMatrices:(id)a5 momentumArray:(id)a6 velocityArray:(id)a7 centerWeightArray:(id)a8 accumulatorIndex:(unint64_t)a9 matrixId:(unint64_t)a10 bias:(id)a11 device:(id)a12 deviceOps:(id)a13 deviceNumber:(unint64_t)a14 lstmNumber:(unint64_t)a15;
+ (void)setOptimizerDataForMomentumMatrices:(id)a3 velocityMatrices:(id)a4 centerWeightMatrices:(id)a5 momentumArray:(id)a6 velocityArray:(id)a7 centerWeightArray:(id)a8 accumulatorIndex:(unint64_t)a9 matrixId:(unint64_t)a10 weight:(id)a11 device:(id)a12 deviceOps:(id)a13 deviceNumber:(unint64_t)a14 lstmNumber:(unint64_t)a15 isRecurrent:(BOOL)a16;
- (_MLCGPULSTM)initWithDevice:(id)a3 descriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11;
@end

@implementation _MLCGPULSTM

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11
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
  v26 = (void *)[objc_alloc((Class)a1) initWithDevice:v25 descriptor:v24 inputWeights:v23 hiddenWeights:v22 peepholeWeights:v21 biasTerms:v20 gateActivations:v19 outputResultActivation:v18 inferenceOnly:v28];

  return v26;
}

- (_MLCGPULSTM)initWithDevice:(id)a3 descriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11
{
  uint64_t v259 = *MEMORY[0x1E4F143B8];
  id v191 = a3;
  id v17 = a4;
  id v193 = a5;
  id v190 = a6;
  id v189 = a7;
  id v205 = a8;
  id v192 = a9;
  id v186 = a10;
  v257.receiver = self;
  v257.super_class = (Class)_MLCGPULSTM;
  id v18 = v17;
  id v19 = [(_MLCGPULSTM *)&v257 init];
  id v20 = v19;
  if (!v19) {
    goto LABEL_88;
  }
  v188 = v19;
  v187 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v203 = [v17 inputSize];
  uint64_t v218 = [v17 hiddenSize];
  unint64_t v204 = [v17 layerCount];
  int v202 = [v17 isBidirectional];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v204 << v202];
  v197 = v17;
  v198 = v21;
  unint64_t v249 = v204 << v202;
  if (v204 << v202)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 3;
    do
    {
      if (v204 == v22) {
        int v24 = v202;
      }
      else {
        int v24 = 0;
      }
      if (!v22) {
        int v24 = 1;
      }
      if (v24) {
        uint64_t v25 = v203;
      }
      else {
        uint64_t v25 = v218;
      }
      v26 = [MEMORY[0x1E4F35610] createLSTMDescriptorWithInputFeatureChannels:v25 outputFeatureChannels:v218];
      [v21 setObject:v26 atIndexedSubscript:v22];

      v27 = [v21 objectAtIndexedSubscript:v22];
      [v27 setUseFloat32Weights:1];

      v254 = +[MLCConvolutionDescriptor descriptorWithKernelWidth:1 kernelHeight:1 inputFeatureChannelCount:v25 outputFeatureChannelCount:v218];
      +[MLCConvolutionDescriptor descriptorWithKernelWidth:1 kernelHeight:1 inputFeatureChannelCount:v218 outputFeatureChannelCount:v218];
      uint64_t v241 = v246 = v23;
      uint64_t v229 = v22;
      if (v205)
      {
        uint64_t v28 = 4 * v22;
        uint64_t v29 = [v205 objectAtIndexedSubscript:v23 - 3];
        uint64_t v30 = (4 * v22) | 1;
        uint64_t v31 = [v205 objectAtIndexedSubscript:v23 - 2];
        uint64_t v243 = v28 | 2;
        v250 = [v205 objectAtIndexedSubscript:v23 - 1];
        uint64_t v231 = v28 | 3;
        v32 = (void *)v29;
        uint64_t v237 = [v205 objectAtIndexedSubscript:v23];
      }
      else
      {
        uint64_t v237 = 0;
        v250 = 0;
        uint64_t v31 = 0;
        v32 = 0;
        uint64_t v30 = v23 - 2;
        uint64_t v243 = v23 - 1;
        uint64_t v231 = v23;
      }
      uint64_t v223 = v23 - 3;
      v33 = [v193 objectAtIndexedSubscript:v23 - 3];
      v34 = [v192 objectAtIndexedSubscript:0];
      v227 = v32;
      uint64_t v35 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v254 biasTerms:v32 weights:v33 neuronDescriptor:v34];

      uint64_t v225 = v30;
      v36 = [v193 objectAtIndexedSubscript:v30];
      v37 = [v192 objectAtIndexedSubscript:1];
      v239 = (void *)v31;
      uint64_t v38 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v254 biasTerms:v31 weights:v36 neuronDescriptor:v37];

      v39 = [v193 objectAtIndexedSubscript:v243];
      v40 = [v192 objectAtIndexedSubscript:2];
      v252 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v254 biasTerms:v250 weights:v39 neuronDescriptor:v40];

      v41 = [v193 objectAtIndexedSubscript:v231];
      v42 = [v192 objectAtIndexedSubscript:3];
      v43 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v254 biasTerms:v237 weights:v41 neuronDescriptor:v42];

      v44 = (void *)v237;
      v233 = (void *)v38;
      v235 = (void *)v35;
      if (!v35)
      {
        v45 = (void *)v241;
LABEL_37:
        v46 = v239;
        uint64_t v47 = v246;
        int v48 = 1;
        goto LABEL_33;
      }
      v45 = (void *)v241;
      if (!v38) {
        goto LABEL_37;
      }
      v46 = v239;
      uint64_t v47 = v246;
      int v48 = 1;
      if (!v252 || !v43) {
        goto LABEL_33;
      }
      v216 = v43;
      v49 = [v190 objectAtIndexedSubscript:v223];
      uint64_t v50 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v241 biasTerms:0 weights:v49];

      v51 = [v190 objectAtIndexedSubscript:v30];
      uint64_t v52 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v241 biasTerms:0 weights:v51];

      v53 = [v190 objectAtIndexedSubscript:v243];
      v221 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v241 biasTerms:0 weights:v53];

      v54 = (void *)v50;
      v55 = [v190 objectAtIndexedSubscript:v231];
      v219 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v241 biasTerms:0 weights:v55];

      int v48 = 1;
      if (!v50)
      {
        uint64_t v47 = v246;
        v43 = v216;
        v56 = (void *)v52;
        goto LABEL_32;
      }
      v56 = (void *)v52;
      if (!v52)
      {
        uint64_t v47 = v246;
        v43 = v216;
        goto LABEL_32;
      }
      uint64_t v47 = v246;
      v43 = v216;
      if (!v221 || !v219) {
        goto LABEL_32;
      }
      if (v189)
      {
        v213 = (void *)v52;
        v57 = [v189 objectAtIndexedSubscript:v223];
        uint64_t v58 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v254 biasTerms:0 weights:v57];

        v59 = [v189 objectAtIndexedSubscript:v225];
        v60 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v254 biasTerms:0 weights:v59];

        v61 = [v189 objectAtIndexedSubscript:v243];
        v62 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v254 biasTerms:0 weights:v61];

        v63 = (void *)v58;
        v64 = [v189 objectAtIndexedSubscript:v231];
        v65 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v254 biasTerms:0 weights:v64];

        int v48 = 1;
        if (!v63)
        {
          uint64_t v47 = v246;
          v56 = v213;
          goto LABEL_31;
        }
        v66 = v198;
        if (!v60)
        {
          uint64_t v47 = v246;
          v56 = v213;
          goto LABEL_31;
        }
        uint64_t v47 = v246;
        v56 = v213;
        if (!v62 || !v65) {
          goto LABEL_31;
        }
      }
      else
      {
        v65 = 0;
        v62 = 0;
        v60 = 0;
        v63 = 0;
        v66 = v198;
      }
      v244 = v65;
      v67 = [v66 objectAtIndexedSubscript:v229];
      [v67 setInputGateInputWeights:v235];

      v68 = [v66 objectAtIndexedSubscript:v229];
      [v68 setInputGateRecurrentWeights:v54];

      v69 = [v66 objectAtIndexedSubscript:v229];
      [v69 setInputGateMemoryWeights:v63];

      v70 = [v66 objectAtIndexedSubscript:v229];
      [v70 setForgetGateInputWeights:v233];

      v71 = [v66 objectAtIndexedSubscript:v229];
      [v71 setForgetGateRecurrentWeights:v56];

      v72 = [v66 objectAtIndexedSubscript:v229];
      [v72 setForgetGateMemoryWeights:v60];

      v73 = [v66 objectAtIndexedSubscript:v229];
      [v73 setCellGateInputWeights:v252];

      v74 = [v66 objectAtIndexedSubscript:v229];
      [v74 setCellGateRecurrentWeights:v221];

      v75 = [v66 objectAtIndexedSubscript:v229];
      [v75 setCellGateMemoryWeights:v62];

      v76 = [v66 objectAtIndexedSubscript:v229];
      [v76 setOutputGateInputWeights:v216];

      v77 = [v66 objectAtIndexedSubscript:v229];
      [v77 setOutputGateRecurrentWeights:v219];

      v78 = [v66 objectAtIndexedSubscript:v229];
      [v78 setOutputGateMemoryWeights:v65];

      uint64_t v79 = +[_MLCGPUNeuron mpsNeurontypeFrom:](_MLCGPUNeuron, "mpsNeurontypeFrom:", [v186 activationType]);
      [v66 objectAtIndexedSubscript:v229];
      v81 = v80 = v56;
      [v81 setCellToOutputNeuronType:v79];

      v56 = v80;
      [v186 a];
      int v83 = v82;
      v84 = [v66 objectAtIndexedSubscript:v229];
      LODWORD(v85) = v83;
      [v84 setCellToOutputNeuronParamA:v85];

      [v186 b];
      int v87 = v86;
      v88 = [v66 objectAtIndexedSubscript:v229];
      LODWORD(v89) = v87;
      [v88 setCellToOutputNeuronParamB:v89];

      [v186 c];
      int v91 = v90;
      v92 = [v66 objectAtIndexedSubscript:v229];
      LODWORD(v93) = v91;
      [v92 setCellToOutputNeuronParamC:v93];

      v65 = v244;
      int v48 = 0;
LABEL_31:

      v46 = v239;
      v45 = (void *)v241;
      v44 = (void *)v237;
LABEL_32:

LABEL_33:
      id v18 = v197;
      id v21 = v198;
      if (v48) {
        goto LABEL_86;
      }
      uint64_t v22 = v229 + 1;
      uint64_t v23 = v47 + 4;
    }
    while (v249 != v229 + 1);
  }
  v94 = v191;
  v95 = [v191 deviceList];
  uint64_t v96 = [v95 count];

  if (!v96)
  {
LABEL_87:
    v182 = (void *)[v187 copy];
    id v20 = v188;
    v256.receiver = v188;
    v256.super_class = (Class)_MLCGPULSTM;
    [(_MLCGPULayer *)&v256 setDeviceOps:v182];

LABEL_88:
    v181 = v20;
    goto LABEL_89;
  }
  uint64_t v98 = 0;
  uint64_t v253 = 4 * v218;
  uint64_t v201 = 4 * v218 * v218;
  v99 = (void *)MEMORY[0x1E4F1CBF0];
  *(void *)&long long v97 = 138412546;
  long long v184 = v97;
  while (1)
  {
    v200 = objc_msgSend(v99, "mutableCopy", v184);
    v100 = [v94 deviceList];
    uint64_t v196 = v98;
    v255 = [v100 objectAtIndexedSubscript:v98];

    v209 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v249];
    v101 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v249];
    v102 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v249];
    v208 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v249];
    v207 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v249];
    v206 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v249];
    if (v249)
    {
      for (uint64_t i = 0; i != v249; ++i)
      {
        v104 = (void *)[v99 mutableCopy];
        [v209 setObject:v104 atIndexedSubscript:i];

        v105 = (void *)[v99 mutableCopy];
        [v101 setObject:v105 atIndexedSubscript:i];

        v106 = (void *)[v99 mutableCopy];
        [v102 setObject:v106 atIndexedSubscript:i];

        v107 = (void *)[v99 mutableCopy];
        [v208 setObject:v107 atIndexedSubscript:i];

        v108 = (void *)[v99 mutableCopy];
        [v207 setObject:v108 atIndexedSubscript:i];

        v109 = (void *)[v99 mutableCopy];
        [v206 setObject:v109 atIndexedSubscript:i];

        id v110 = objc_alloc(MEMORY[0x1E4F35970]);
        v111 = [v21 objectAtIndexedSubscript:i];
        v112 = [v209 objectAtIndexedSubscript:i];
        v113 = (void *)[v110 initWithDevice:v255 rnnDescriptor:v111 trainableWeights:v112];

        if (v113)
        {
          v114 = [v101 objectAtIndexedSubscript:i];
          [v113 createWeightGradientMatrices:v114 dataType:268435488];

          v115 = [v102 objectAtIndexedSubscript:i];
          [v113 createWeightGradientMatrices:v115 dataType:268435488];

          [v200 addObject:v113];
        }
      }
    }
    v194 = v102;
    v199 = (void *)[v200 copy];
    v251 = +[MLCRNNGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCRNNGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:");
    v195 = v101;
    [v251 setRnnTrainableWeightGradients:v101];
    v116 = [v94 deviceList];
    unint64_t v117 = [v116 count];

    if (v117 > 1)
    {
      v118 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v251];
      [v251 setLstmMultiGPUChildOps:v118];

      v119 = [v251 lstmMultiGPUChildOps];
      GPU_AllocateResourceForMultiGPUTraining(v94, v119, MEMORY[0x1E4F1CBF0], v196);
    }
    if (!a11)
    {
      [v18 dropout];
      if (v120 > 0.0 && v204 >= 2)
      {
        [v18 dropout];
        objc_msgSend(v251, "setLstmDropout:");
        unint64_t v121 = v204 - 1;
        do
        {
          id v122 = objc_alloc(MEMORY[0x1E4F35430]);
          [v18 dropout];
          int64x2_t v247 = vdupq_n_s64(1uLL);
          *(float *)&double v124 = 1.0 - v123;
          *(int64x2_t *)buf = v247;
          *(void *)&buf[16] = 1;
          v125 = (void *)[v122 initWithDevice:v255 keepProbability:0 seed:buf maskStrideInPixels:v124];
          v126 = [v251 lstmDropoutForwardKernel];
          [v126 addObject:v125];

          id v127 = objc_alloc(MEMORY[0x1E4F35438]);
          [v18 dropout];
          *(float *)&double v129 = 1.0 - v128;
          *(int64x2_t *)buf = v247;
          *(void *)&buf[16] = 1;
          v130 = (void *)[v127 initWithDevice:v255 keepProbability:0 seed:buf maskStrideInPixels:v129];
          v131 = [v251 lstmDropoutGradientKernel];
          [v131 addObject:v130];

          --v121;
        }
        while (v121);
      }
    }
    unint64_t v132 = 0x1E4F35000uLL;
    if (v249)
    {
      uint64_t v133 = 0;
      do
      {
        if (v204 == v133) {
          int v134 = v202;
        }
        else {
          int v134 = 0;
        }
        uint64_t v240 = v133;
        if (!v133) {
          int v134 = 1;
        }
        if (v134) {
          uint64_t v135 = v203;
        }
        else {
          uint64_t v135 = v218;
        }
        uint64_t v136 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v218 columns:v135 rowBytes:4 * v135 dataType:268435488];
        uint64_t v137 = v253 * v135;
        uint64_t v138 = [v255 newBufferWithLength:v137 options:0];
        uint64_t v139 = [v255 newBufferWithLength:v137 options:0];
        uint64_t v140 = [v255 newBufferWithLength:v137 options:0];
        uint64_t v141 = [v255 newBufferWithLength:v137 options:0];
        v245 = (void *)v138;
        uint64_t v142 = [objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v138 descriptor:v136];
        v242 = (void *)v139;
        uint64_t v143 = [objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v139 descriptor:v136];
        v236 = (void *)v140;
        uint64_t v144 = [objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v140 descriptor:v136];
        v238 = (void *)v141;
        v248 = (void *)v136;
        uint64_t v145 = [objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v141 descriptor:v136];
        v146 = [v251 rnnExportedInputWeightGradientMatrices];
        v224 = (void *)v142;
        [v146 addObject:v142];

        v147 = [v251 rnnExportedInputWeightGradientMatrices];
        v234 = (void *)v143;
        [v147 addObject:v143];

        v148 = [v251 rnnExportedInputWeightGradientMatrices];
        v232 = (void *)v144;
        [v148 addObject:v144];

        v149 = [v251 rnnExportedInputWeightGradientMatrices];
        v230 = (void *)v145;
        [v149 addObject:v145];

        v150 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v218 columns:v218 rowBytes:v253 dataType:268435488];
        v151 = (void *)[v255 newBufferWithLength:v201 options:0];
        uint64_t v152 = [v255 newBufferWithLength:v201 options:0];
        uint64_t v153 = [v255 newBufferWithLength:v201 options:0];
        v154 = (void *)[v255 newBufferWithLength:v201 options:0];
        uint64_t v155 = [objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v151 descriptor:v150];
        v228 = (void *)v152;
        v156 = (void *)[objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v152 descriptor:v150];
        v226 = (void *)v153;
        v157 = (void *)[objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v153 descriptor:v150];
        uint64_t v158 = [objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v154 descriptor:v150];
        v159 = [v251 rnnExportedHiddenWeightGradientMatrices];
        v222 = (void *)v155;
        [v159 addObject:v155];

        v160 = [v251 rnnExportedHiddenWeightGradientMatrices];
        [v160 addObject:v156];

        v161 = [v251 rnnExportedHiddenWeightGradientMatrices];
        [v161 addObject:v157];

        v162 = [v251 rnnExportedHiddenWeightGradientMatrices];
        v220 = (void *)v158;
        [v162 addObject:v158];

        if (v205)
        {
          [MEMORY[0x1E4F35640] matrixDescriptorWithRows:1 columns:v218 rowBytes:v253 dataType:268435488];
          v163 = v215 = v154;
          v212 = (void *)[v255 newBufferWithLength:v253 options:0];
          v211 = (void *)[v255 newBufferWithLength:v253 options:0];
          v210 = (void *)[v255 newBufferWithLength:v253 options:0];
          v214 = v156;
          v164 = (void *)[v255 newBufferWithLength:v253 options:0];
          v165 = (void *)[objc_alloc(*(Class *)(v132 + 1560)) initWithBuffer:v212 descriptor:v163];
          v217 = v151;
          v166 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v211 descriptor:v163];
          v167 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v210 descriptor:v163];
          v168 = v157;
          v169 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v164 descriptor:v163];
          v170 = [v251 rnnExportedBiasGradientMatrices];
          [v170 addObject:v165];

          v171 = [v251 rnnExportedBiasGradientMatrices];
          [v171 addObject:v166];

          v172 = [v251 rnnExportedBiasGradientMatrices];
          [v172 addObject:v167];

          v173 = [v251 rnnExportedBiasGradientMatrices];
          [v173 addObject:v169];

          v157 = v168;
          unint64_t v132 = 0x1E4F35000;
          v151 = v217;

          v156 = v214;
          v154 = v215;
        }

        uint64_t v133 = v240 + 1;
      }
      while (v249 != v240 + 1);
    }
    [v251 setRnnTrainableWeights:v209];
    [v251 setRnnMomentumMatrices:v194];
    [v251 setRnnVelocityMatrices:v208];
    [v251 setRnnCenterWeightMatrices:v207];
    [v251 setRnnTrainableStates:v206];
    BOOL v174 = !v199 || v200 == 0;
    BOOL v175 = v174 || v251 == 0;
    BOOL v176 = !v175;
    if (v175)
    {
      v177 = +[MLCLog framework];
      id v18 = v197;
      id v21 = v198;
      if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
      {
        v180 = NSStringFromSelector(a2);
        *(_DWORD *)buf = v184;
        *(void *)&buf[4] = v180;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v255;
        _os_log_error_impl(&dword_1DD0C9000, v177, OS_LOG_TYPE_ERROR, "%@: Unable to create gpuOps for LSTM layer for device %@", buf, 0x16u);
      }
    }
    else
    {
      [v251 setLayer:v188];
      [v187 addObject:v251];
      id v18 = v197;
      objc_msgSend(v251, "setIsBidirectional:", objc_msgSend(v197, "isBidirectional"));
      objc_msgSend(v251, "setBatchFirst:", objc_msgSend(v197, "batchFirst"));
      objc_msgSend(v251, "setReturnsSequences:", objc_msgSend(v197, "returnsSequences"));
      objc_msgSend(v251, "setHiddenSize:", objc_msgSend(v197, "hiddenSize"));
      objc_msgSend(v251, "setInputSize:", objc_msgSend(v197, "inputSize"));
      objc_msgSend(v251, "setNumLayers:", objc_msgSend(v197, "layerCount"));
      [v251 setSourceOfForwardNeededForGradient:1];
      [v251 setResultOfForwardNeededForGradient:0];
      id v21 = v198;
    }

    if (!v176) {
      break;
    }
    uint64_t v98 = v196 + 1;
    v94 = v191;
    v178 = [v191 deviceList];
    unint64_t v179 = [v178 count];

    v99 = (void *)MEMORY[0x1E4F1CBF0];
    if (v196 + 1 >= v179) {
      goto LABEL_87;
    }
  }
LABEL_86:

  v181 = 0;
  id v20 = v188;
LABEL_89:

  return v181;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v106 = a1;
  id v9 = a3;
  id v108 = a4;
  id v10 = a5;
  id v107 = a6;
  v11 = [v9 deviceList];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    v119 = v10;
    float v120 = v9;
    do
    {
      objc_msgSend(v108, "objectAtIndexedSubscript:", v13, v106);
      id v127 = v128 = v13;
      if ([v127 batchFirst])
      {
        v14 = [v10 objectAtIndexedSubscript:0];
        v15 = [v14 descriptor];
        v16 = [v15 shape];
        uint64_t v17 = [v16 count];

        uint64_t v18 = 3;
        if (v17 != 4) {
          uint64_t v18 = 1;
        }
        uint64_t v125 = v18;
        uint64_t v19 = 1;
        if (v17 != 4) {
          uint64_t v19 = 2;
        }
        uint64_t v121 = 0;
        uint64_t v123 = v19;
      }
      else
      {
        uint64_t v123 = 2;
        uint64_t v125 = 0;
        uint64_t v121 = 1;
      }
      unint64_t v117 = [v10 objectAtIndexedSubscript:0];
      v115 = [v117 descriptor];
      v112 = [v115 shape];
      v109 = [v112 objectAtIndexedSubscript:v121];
      uint64_t v20 = [v109 unsignedIntegerValue];
      id v21 = [v10 objectAtIndexedSubscript:0];
      uint64_t v22 = [v21 descriptor];
      uint64_t v23 = [v22 shape];
      int v24 = [v23 objectAtIndexedSubscript:v123];
      uint64_t v25 = [v24 unsignedIntegerValue];
      v26 = v10;
      uint64_t v27 = v25;
      uint64_t v28 = [v26 objectAtIndexedSubscript:0];
      uint64_t v29 = [v28 descriptor];
      uint64_t v30 = [v29 shape];
      uint64_t v31 = [v30 objectAtIndexedSubscript:v125];
      uint64_t v32 = 4 * v20 * v27 * [v31 unsignedIntegerValue];

      v33 = [v120 deviceList];
      v34 = [v33 objectAtIndexedSubscript:v128];
      uint64_t v118 = objc_msgSend(v34, "newBufferWithLength:options:", v32, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

      uint64_t v35 = [v120 deviceList];
      v36 = [v35 objectAtIndexedSubscript:v128];
      uint64_t v116 = objc_msgSend(v36, "newBufferWithLength:options:", v32, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

      v113 = [v107 descriptor];
      id v110 = [v113 shape];
      v37 = [v110 objectAtIndexedSubscript:v121];
      uint64_t v38 = [v37 unsignedIntegerValue];
      v39 = [v107 descriptor];
      v40 = [v39 shape];
      v41 = [v40 objectAtIndexedSubscript:v123];
      uint64_t v42 = [v41 unsignedIntegerValue];
      v43 = [v119 objectAtIndexedSubscript:0];
      v44 = [v43 descriptor];
      v45 = [v44 shape];
      v46 = [v45 objectAtIndexedSubscript:v125];
      uint64_t v47 = 4 * v38 * v42 * [v46 unsignedIntegerValue];

      int v48 = (void *)v118;
      unint64_t v49 = v128;

      id v9 = v120;
      uint64_t v50 = [v120 deviceList];
      v51 = [v50 objectAtIndexedSubscript:v128];
      uint64_t v52 = objc_msgSend(v51, "newBufferWithLength:options:", v47, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

      v53 = [v120 deviceList];
      v54 = [v53 objectAtIndexedSubscript:v128];
      unint64_t v55 = +[MLCGPUHelper mtlResourceOptions];
      uint64_t v56 = v47;
      v57 = (void *)v116;
      uint64_t v58 = (void *)[v54 newBufferWithLength:v56 options:v55];

      v59 = v127;
      v60 = [v127 rnnBuffers];
      [v60 addObject:v118];

      v61 = [v127 rnnBuffers];
      [v61 addObject:v52];

      v62 = [v127 rnnBuffers];
      [v62 addObject:v58];

      v63 = [v127 rnnBuffers];
      [v63 addObject:v116];

      if ([v127 isBidirectional])
      {
        v114 = v58;
        v64 = [v119 objectAtIndexedSubscript:0];
        v65 = [v64 descriptor];
        v66 = [v65 shape];
        v67 = [v66 objectAtIndexedSubscript:v121];
        uint64_t v68 = [v67 unsignedIntegerValue];

        v69 = [v119 objectAtIndexedSubscript:0];
        v70 = [v69 descriptor];
        v71 = [v70 shape];
        [v71 objectAtIndexedSubscript:v123];
        v72 = double v124 = v52;
        uint64_t v73 = [v72 unsignedIntegerValue];

        v74 = [v119 objectAtIndexedSubscript:0];
        v75 = [v74 descriptor];
        v76 = [v75 shape];
        v77 = [v76 objectAtIndexedSubscript:v125];
        uint64_t v78 = [v77 unsignedIntegerValue];

        uint64_t v79 = [v120 deviceList];
        v80 = [v79 objectAtIndexedSubscript:v128];
        uint64_t v81 = v78 * v73;
        uint64_t v82 = 4 * v78 * v73;
        uint64_t v83 = objc_msgSend(v80, "newBufferWithLength:options:", v82 * v68, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

        v84 = [v127 rnnBuffers];
        v126 = (void *)v83;
        [v84 addObject:v83];

        id v122 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v68 columns:v78 * v73 rowBytes:v82 dataType:268435488];
        v111 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v83 descriptor:v122];
        double v85 = [v120 deviceList];
        int v86 = [v85 objectAtIndexedSubscript:v128];
        int v87 = objc_msgSend(v86, "newBufferWithLength:options:", v82 * v68, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

        v88 = [v127 rnnBuffers];
        [v88 addObject:v87];

        uint64_t v89 = v68;
        int v90 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v68 columns:v81 rowBytes:v82 dataType:268435488];
        int v91 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v87 descriptor:v90];
        v92 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v89 columns:v81 rowBytes:v82 dataType:268435488];
        id v93 = objc_alloc(MEMORY[0x1E4F35618]);
        v94 = [v127 rnnBuffers];
        v95 = [v94 objectAtIndexedSubscript:3];
        uint64_t v96 = (void *)[v93 initWithBuffer:v95 descriptor:v92];

        id v97 = objc_alloc(MEMORY[0x1E4F35688]);
        uint64_t v98 = [v120 deviceList];
        v99 = [v98 objectAtIndexedSubscript:v128];
        uint64_t v100 = v81;
        unint64_t v49 = v128;
        v101 = (void *)[v97 initWithDevice:v99 count:2 rows:v89 columns:v100 transpose:0];
        [v127 setBiDirectionalSumKernel:v101];

        uint64_t v58 = v114;
        v59 = v127;

        id v9 = v120;
        [v127 setForwardTimeGradientResult:v111];
        [v127 setReverseTimeGradientResult:v91];
        [v127 setBiDirectionalGradientResult:v96];

        int v48 = (void *)v118;
        v57 = (void *)v116;

        uint64_t v52 = v124;
      }
      v102 = objc_opt_new();
      [v59 setLayer:v102];

      unint64_t v13 = v49 + 1;
      v103 = [v9 deviceList];
      unint64_t v104 = [v103 count];

      id v10 = v119;
    }
    while (v13 < v104);
  }

  return 1;
}

+ (void)setOptimizerDataForMomentumMatrices:(id)a3 velocityMatrices:(id)a4 centerWeightMatrices:(id)a5 momentumArray:(id)a6 velocityArray:(id)a7 centerWeightArray:(id)a8 accumulatorIndex:(unint64_t)a9 matrixId:(unint64_t)a10 weight:(id)a11 device:(id)a12 deviceOps:(id)a13 deviceNumber:(unint64_t)a14 lstmNumber:(unint64_t)a15 isRecurrent:(BOOL)a16
{
  id v75 = a3;
  id v74 = a4;
  id v21 = a5;
  id v76 = a6;
  id v73 = a7;
  id v72 = a8;
  id v22 = a11;
  id v23 = a13;
  int v24 = [a12 gpuCommandBufferList];
  uint64_t v25 = [v24 objectAtIndexedSubscript:a14];

  v26 = [v23 objectAtIndexedSubscript:a14];

  v77 = [v26 gradientKernel];
  uint64_t v27 = [v26 hiddenSize];
  uint64_t v28 = [v26 inputSize];
  if (a16 || (uint64_t v29 = v28, a15 % [v26 numLayers]))
  {
    unint64_t v30 = a14;
    uint64_t v29 = [v26 hiddenSize];
  }
  else
  {
    unint64_t v30 = a14;
  }
  uint64_t v31 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v27 columns:v29 rowBytes:4 * v29 dataType:268435488];
  uint64_t v32 = [v22 optimizerData];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    uint64_t v68 = v26;
    v69 = v21;
    v34 = [v22 optimizerDeviceData];
    uint64_t v35 = [v34 objectAtIndexedSubscript:v30];
    [v35 momentumVectors];
    v37 = v36 = v22;

    id v38 = objc_alloc(MEMORY[0x1E4F35618]);
    v39 = [v37 objectAtIndexedSubscript:0];
    [v39 data];
    v40 = v71 = v25;
    v41 = (void *)[v38 initWithBuffer:v40 descriptor:v31];

    uint64_t v25 = v71;
    uint64_t v42 = [v77 objectAtIndexedSubscript:a15];
    memset(v80, 0, 24);
    [v42 encodeCopyWeightsToCommandBuffer:v71 weights:v75 matrixId:a10 matrix:v41 copyFromWeightsToMatrix:0 matrixOffset:v80];

    [v76 setObject:v41 atIndexedSubscript:a9];
    v70 = v36;
    v43 = [v36 optimizerData];
    unint64_t v44 = [v43 count];

    if (v44 >= 2)
    {
      v67 = v37;
      v45 = [v36 optimizerDeviceData];
      unint64_t v65 = v30;
      v46 = [v45 objectAtIndexedSubscript:v30];
      uint64_t v47 = [v46 velocityVectors];

      id v48 = objc_alloc(MEMORY[0x1E4F35618]);
      v66 = v47;
      unint64_t v49 = [v47 objectAtIndexedSubscript:0];
      uint64_t v50 = [v49 data];
      v51 = (void *)[v48 initWithBuffer:v50 descriptor:v31];

      if (![v74 count])
      {
        uint64_t v52 = [v77 objectAtIndexedSubscript:a15];
        [v52 createWeightGradientMatrices:v74 dataType:268435488];
      }
      v53 = [v77 objectAtIndexedSubscript:a15];
      memset(v79, 0, sizeof(v79));
      [v53 encodeCopyWeightsToCommandBuffer:v71 weights:v74 matrixId:a10 matrix:v51 copyFromWeightsToMatrix:0 matrixOffset:v79];

      [v73 setObject:v51 atIndexedSubscript:a9];
      v54 = [v36 optimizerData];
      unint64_t v55 = [v54 count];

      if (v55 >= 3)
      {
        uint64_t v56 = [v36 optimizerDeviceData];
        v57 = [v56 objectAtIndexedSubscript:v65];
        uint64_t v58 = [v57 centerWeightVectors];

        id v59 = objc_alloc(MEMORY[0x1E4F35618]);
        v60 = [v58 objectAtIndexedSubscript:0];
        v61 = [v60 data];
        v62 = (void *)[v59 initWithBuffer:v61 descriptor:v31];

        if (![v69 count])
        {
          v63 = [v77 objectAtIndexedSubscript:a15];
          [v63 createWeightGradientMatrices:v69 dataType:268435488];
        }
        v64 = [v77 objectAtIndexedSubscript:a15];
        memset(v78, 0, sizeof(v78));
        [v64 encodeCopyWeightsToCommandBuffer:v71 weights:v69 matrixId:a10 matrix:v62 copyFromWeightsToMatrix:0 matrixOffset:v78];

        [v72 setObject:v62 atIndexedSubscript:a9];
      }

      uint64_t v25 = v71;
      v37 = v67;
    }

    v26 = v68;
    id v21 = v69;
    id v22 = v70;
  }
}

+ (void)setBiasOptimizerDataForMomentumMatrices:(id)a3 velocityMatrices:(id)a4 centerWeightMatrices:(id)a5 momentumArray:(id)a6 velocityArray:(id)a7 centerWeightArray:(id)a8 accumulatorIndex:(unint64_t)a9 matrixId:(unint64_t)a10 bias:(id)a11 device:(id)a12 deviceOps:(id)a13 deviceNumber:(unint64_t)a14 lstmNumber:(unint64_t)a15
{
  id v20 = a3;
  id v21 = a4;
  id v68 = a5;
  id v22 = a6;
  id v69 = a7;
  id v67 = a8;
  id v23 = a11;
  id v24 = a13;
  uint64_t v25 = [a12 gpuCommandBufferList];
  v26 = [v25 objectAtIndexedSubscript:a14];

  uint64_t v27 = [v24 objectAtIndexedSubscript:a14];

  uint64_t v28 = [v27 gradientKernel];
  v66 = v27;
  uint64_t v29 = [v27 hiddenSize];
  unint64_t v30 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:1 columns:v29 rowBytes:4 * v29 dataType:268435488];
  uint64_t v31 = [v23 optimizerData];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    id v64 = v21;
    id v62 = v20;
    id v65 = v22;
    uint64_t v33 = [v23 optimizerDeviceData];
    v34 = [v33 objectAtIndexedSubscript:a14];
    uint64_t v35 = [v34 momentumVectors];

    id v36 = objc_alloc(MEMORY[0x1E4F35618]);
    v61 = v35;
    v37 = [v35 objectAtIndexedSubscript:0];
    id v38 = [v37 data];
    v39 = (void *)[v36 initWithBuffer:v38 descriptor:v30];

    v63 = v28;
    v40 = [v28 objectAtIndexedSubscript:a15];
    memset(v72, 0, 24);
    [v40 encodeCopyWeightsToCommandBuffer:v26 weights:v20 matrixId:a10 matrix:v39 copyFromWeightsToMatrix:0 matrixOffset:v72];

    [v22 setObject:v39 atIndexedSubscript:a9];
    v41 = [v23 optimizerData];
    unint64_t v42 = [v41 count];

    if (v42 >= 2)
    {
      v43 = [v23 optimizerDeviceData];
      unint64_t v44 = [v43 objectAtIndexedSubscript:a14];
      v45 = [v44 velocityVectors];

      id v46 = objc_alloc(MEMORY[0x1E4F35618]);
      uint64_t v47 = [v45 objectAtIndexedSubscript:0];
      id v48 = [v47 data];
      unint64_t v49 = (void *)[v46 initWithBuffer:v48 descriptor:v30];

      uint64_t v50 = [v63 objectAtIndexedSubscript:a15];
      memset(v71, 0, sizeof(v71));
      [v50 encodeCopyWeightsToCommandBuffer:v26 weights:v64 matrixId:a10 matrix:v49 copyFromWeightsToMatrix:0 matrixOffset:v71];

      [v69 setObject:v49 atIndexedSubscript:a9];
      v51 = [v23 optimizerData];
      unint64_t v52 = [v51 count];

      if (v52 >= 3)
      {
        v53 = [v23 optimizerDeviceData];
        v54 = [v53 objectAtIndexedSubscript:a14];
        unint64_t v55 = [v54 centerWeightVectors];

        id v56 = objc_alloc(MEMORY[0x1E4F35618]);
        v57 = [v55 objectAtIndexedSubscript:0];
        uint64_t v58 = [v57 data];
        id v59 = (void *)[v56 initWithBuffer:v58 descriptor:v30];

        v60 = [v63 objectAtIndexedSubscript:a15];
        memset(v70, 0, sizeof(v70));
        [v60 encodeCopyWeightsToCommandBuffer:v26 weights:v68 matrixId:a10 matrix:v59 copyFromWeightsToMatrix:0 matrixOffset:v70];

        [v67 setObject:v59 atIndexedSubscript:a9];
      }

      id v20 = v62;
    }

    id v21 = v64;
    id v22 = v65;
    uint64_t v28 = v63;
  }
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 biasTerms:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 deviceList];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = 0;
    id v74 = v13;
    id v75 = v12;
    id v72 = a1;
    id v64 = v15;
    id v65 = v14;
    id v62 = v16;
    do
    {
      uint64_t v78 = v19;
      id v20 = [v13 objectAtIndexedSubscript:v19];
      id v21 = [v20 gradientKernel];
      uint64_t v61 = [v21 count];
      uint64_t v22 = [v14 count];
      uint64_t v23 = [v15 count] + v22;
      v60 = v21;
      if (v16) {
        v23 += [v16 count];
      }
      id v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v23];
      v77 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v23];
      id v76 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v23];
      if (v61)
      {
        uint64_t v25 = 0;
        uint64_t v26 = 0;
        uint64_t v66 = 0;
        id v73 = v20;
        uint64_t v79 = v24;
        do
        {
          uint64_t v80 = v25;
          for (uint64_t i = 0; i != 4; ++i)
          {
            id v69 = [v20 rnnMomentumMatrices];
            uint64_t v28 = [v69 objectAtIndexedSubscript:v26];
            uint64_t v29 = [v20 rnnVelocityMatrices];
            unint64_t v30 = [v29 objectAtIndexedSubscript:v26];
            uint64_t v31 = [v20 rnnCenterWeightMatrices];
            uint64_t v32 = [v31 objectAtIndexedSubscript:v26];
            uint64_t v33 = [&unk_1F3876E28 objectAtIndexedSubscript:i];
            uint64_t v34 = [v33 unsignedIntegerValue];
            uint64_t v35 = [v65 objectAtIndexedSubscript:v80 + i];
            LOBYTE(v59) = 0;
            [v72 setOptimizerDataForMomentumMatrices:v28 velocityMatrices:v30 centerWeightMatrices:v32 momentumArray:v79 velocityArray:v77 centerWeightArray:v76 accumulatorIndex:v66 + i matrixId:v34 weight:v35 device:v75 deviceOps:v74 deviceNumber:v78 lstmNumber:v26 isRecurrent:v59];

            id v20 = v73;
          }
          for (uint64_t j = 0; j != 4; ++j)
          {
            v70 = [v20 rnnMomentumMatrices];
            id v67 = [v70 objectAtIndexedSubscript:v26];
            v37 = [v20 rnnVelocityMatrices];
            id v38 = [v37 objectAtIndexedSubscript:v26];
            v39 = [v20 rnnCenterWeightMatrices];
            v40 = [v39 objectAtIndexedSubscript:v26];
            v41 = [&unk_1F3876E40 objectAtIndexedSubscript:j];
            uint64_t v42 = [v41 unsignedIntegerValue];
            v43 = [v64 objectAtIndexedSubscript:v80 + j];
            LOBYTE(v59) = 1;
            [v72 setOptimizerDataForMomentumMatrices:v67 velocityMatrices:v38 centerWeightMatrices:v40 momentumArray:v79 velocityArray:v77 centerWeightArray:v76 accumulatorIndex:v66 + 4 + j matrixId:v42 weight:v43 device:v75 deviceOps:v74 deviceNumber:v78 lstmNumber:v26 isRecurrent:v59];

            id v20 = v73;
          }
          uint64_t v44 = v66 + 8;
          id v16 = v62;
          uint64_t v63 = v26;
          if (v62)
          {
            for (uint64_t k = 0; k != 4; ++k)
            {
              v71 = [v20 rnnMomentumMatrices];
              id v68 = [v71 objectAtIndexedSubscript:v63];
              id v46 = [v20 rnnVelocityMatrices];
              uint64_t v47 = [v46 objectAtIndexedSubscript:v63];
              id v48 = [v20 rnnCenterWeightMatrices];
              unint64_t v49 = [v48 objectAtIndexedSubscript:v63];
              uint64_t v50 = [&unk_1F3876E58 objectAtIndexedSubscript:k];
              uint64_t v51 = [v50 unsignedIntegerValue];
              unint64_t v52 = [v16 objectAtIndexedSubscript:v80 + k];
              id v24 = v79;
              [v72 setBiasOptimizerDataForMomentumMatrices:v68 velocityMatrices:v47 centerWeightMatrices:v49 momentumArray:v79 velocityArray:v77 centerWeightArray:v76 accumulatorIndex:v44 matrixId:v51 bias:v52 device:v75 deviceOps:v74 deviceNumber:v78 lstmNumber:v63];

              id v16 = v62;
              id v20 = v73;

              ++v44;
            }
          }
          else
          {
            id v24 = v79;
          }
          uint64_t v66 = v44;
          uint64_t v26 = v63 + 1;
          uint64_t v25 = v80 + 4;
        }
        while (v63 + 1 != v61);
      }
      v53 = (void *)[v24 copy];
      [v20 setMomentumVectors:v53];

      v54 = (void *)[v77 copy];
      [v20 setVelocityVectors:v54];

      unint64_t v55 = (void *)[v76 copy];
      [v20 setCenterWeightVectors:v55];

      uint64_t v19 = v78 + 1;
      id v12 = v75;
      id v56 = [v75 deviceList];
      unint64_t v57 = [v56 count];

      id v13 = v74;
      id v15 = v64;
      id v14 = v65;
    }
    while (v78 + 1 < v57);
  }

  return 1;
}

@end