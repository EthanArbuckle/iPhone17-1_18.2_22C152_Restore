@interface MLCConvolutionLayer
+ (MLCConvolutionLayer)layerWithWeights:(MLCTensor *)weights biases:(MLCTensor *)biases descriptor:(MLCConvolutionDescriptor *)descriptor;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (MLCConvolutionDescriptor)descriptor;
- (MLCConvolutionLayer)initWithWeights:(id)a3 biases:(id)a4 descriptor:(id)a5;
- (MLCTensor)biases;
- (MLCTensor)weights;
- (MLCTensorParameter)biasesParameter;
- (MLCTensorParameter)weightsParameter;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (int)accumulatorPrecisionOption;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)parametersCount;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (void)allocateGradientsForParameters;
- (void)linkAssociatedTensors;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCConvolutionLayer

+ (MLCConvolutionLayer)layerWithWeights:(MLCTensor *)weights biases:(MLCTensor *)biases descriptor:(MLCConvolutionDescriptor *)descriptor
{
  v8 = descriptor;
  v9 = biases;
  v10 = weights;
  v11 = (void *)[objc_alloc((Class)a1) initWithWeights:v10 biases:v9 descriptor:v8];

  return (MLCConvolutionLayer *)v11;
}

- (MLCConvolutionLayer)initWithWeights:(id)a3 biases:(id)a4 descriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 descriptor];
  v12 = [v11 shape];
  v13 = [v12 objectAtIndexedSubscript:0];
  unint64_t v14 = [v13 unsignedIntegerValue];

  if (v14 >= 2)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCConvolutionLayer initWithWeights:biases:descriptor:](a2);
    }
LABEL_11:

    v21 = 0;
LABEL_12:
    v22 = self;
    goto LABEL_13;
  }
  v16 = [v8 data];

  if (!v16)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCConvolutionLayer initWithWeights:biases:descriptor:](a2);
    }
    goto LABEL_11;
  }
  if (v9)
  {
    v17 = [v9 descriptor];
    v18 = [v17 shape];
    v19 = [v18 objectAtIndexedSubscript:0];
    unint64_t v20 = [v19 unsignedIntegerValue];

    if (v20 >= 2)
    {
      v15 = +[MLCLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MLCConvolutionLayer initWithWeights:biases:descriptor:](a2);
      }
      goto LABEL_11;
    }
    v24 = [v9 descriptor];
    v25 = [v24 shape];
    v26 = [v25 objectAtIndexedSubscript:1];
    uint64_t v27 = [v26 unsignedIntegerValue];
    id v74 = v10;
    uint64_t v28 = [v10 outputFeatureChannelCount];
    v29 = v9;
    uint64_t v30 = v28;

    if (v27 != v30)
    {
      v36 = +[MLCLog framework];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MLCConvolutionLayer initWithWeights:biases:descriptor:].cold.7(a2);
      }

      v21 = 0;
      id v9 = v29;
      id v10 = v74;
      goto LABEL_12;
    }
    v72 = [v29 descriptor];
    v31 = [v72 shape];
    unint64_t v71 = [v31 count];
    v32 = v29;
    id v10 = v74;
    v73 = v32;
    if (v71 >= 4)
    {
      v33 = [v32 descriptor];
      v34 = [v33 shape];
      v35 = [v34 objectAtIndexedSubscript:3];
      if ((unint64_t)[v35 unsignedIntegerValue] > 1)
      {

LABEL_28:
        v42 = +[MLCLog framework];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[MLCConvolutionLayer initWithWeights:biases:descriptor:].cold.4(a2);
        }
        goto LABEL_45;
      }
      v70 = v35;
      v65 = v34;
      v67 = v33;
    }
    v37 = objc_msgSend(v32, "descriptor", v65);
    v38 = [v37 shape];
    if ((unint64_t)[v38 count] < 3)
    {
      BOOL v41 = 0;
    }
    else
    {
      v68 = [v32 descriptor];
      v39 = [v68 shape];
      [v39 objectAtIndexedSubscript:2];
      v40 = v69 = v31;
      BOOL v41 = (unint64_t)[v40 unsignedIntegerValue] > 1;

      v31 = v69;
    }

    if (v71 >= 4)
    {
    }
    if (v41) {
      goto LABEL_28;
    }
    v43 = [v8 childLayers];
    uint64_t v44 = [v43 count];
    v45 = [v73 childLayers];
    uint64_t v46 = [v45 count];

    if (v44 != v46)
    {
      v42 = +[MLCLog framework];
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
LABEL_45:

        v21 = 0;
        id v9 = v73;
        goto LABEL_12;
      }
LABEL_44:
      -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.5(a2);
      goto LABEL_45;
    }
    v47 = [v8 childLayers];
    uint64_t v48 = [v47 count];

    id v9 = v73;
    if (v48)
    {
      unint64_t v49 = 0;
      while (1)
      {
        [v8 childLayers];
        v51 = v50 = v9;
        v52 = [v51 objectAtIndexedSubscript:v49];
        v53 = [v50 childLayers];
        v54 = [v53 objectAtIndexedSubscript:v49];

        if (v52 != v54) {
          break;
        }
        ++v49;
        v55 = [v8 childLayers];
        unint64_t v56 = [v55 count];

        id v9 = v73;
        id v10 = v74;
        if (v49 >= v56) {
          goto LABEL_35;
        }
      }
      v42 = +[MLCLog framework];
      id v10 = v74;
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
LABEL_35:
  v57 = v10;
  v87.receiver = self;
  v87.super_class = (Class)MLCConvolutionLayer;
  v58 = [(MLCLayer *)&v87 initWithLabel:@"Convolution"];
  v59 = v58;
  if (v58)
  {
    v58->_accumulatorPrecisionOption = 0;
    objc_storeStrong((id *)&v58->_weights, a3);
    objc_storeStrong((id *)&v59->_descriptor, a5);
    objc_storeStrong((id *)&v59->_biases, a4);
    uint64_t v60 = +[MLCTensorParameter parameterWithTensor:v8];
    weightsParameter = v59->_weightsParameter;
    v59->_weightsParameter = (MLCTensorParameter *)v60;

    [(MLCTensor *)v59->_weights setIsLayerParameter:1];
    if (v9)
    {
      uint64_t v62 = +[MLCTensorParameter parameterWithTensor:v9];
      biasesParameter = v59->_biasesParameter;
      v59->_biasesParameter = (MLCTensorParameter *)v62;

      [(MLCTensor *)v59->_biases setIsLayerParameter:1];
    }
    else
    {
      v64 = v59->_biasesParameter;
      v59->_biasesParameter = 0;
    }
    v86.receiver = v59;
    v86.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setKernelWidth:](&v86, sel_setKernelWidth_, [v57 kernelWidth]);
    v85.receiver = v59;
    v85.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setKernelHeight:](&v85, sel_setKernelHeight_, [v57 kernelHeight]);
    v84.receiver = v59;
    v84.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setDilationRateInX:](&v84, sel_setDilationRateInX_, [v57 dilationRateInX]);
    v83.receiver = v59;
    v83.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setDilationRateInY:](&v83, sel_setDilationRateInY_, [v57 dilationRateInY]);
    v82.receiver = v59;
    v82.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setStrideInX:](&v82, sel_setStrideInX_, [v57 strideInX]);
    v81.receiver = v59;
    v81.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setStrideInY:](&v81, sel_setStrideInY_, [v57 strideInY]);
    v80.receiver = v59;
    v80.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setPaddingPolicy:](&v80, sel_setPaddingPolicy_, [v57 paddingPolicy]);
    v79.receiver = v59;
    v79.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setPaddingSizeInX:](&v79, sel_setPaddingSizeInX_, [v57 paddingSizeInX]);
    v78.receiver = v59;
    v78.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setPaddingSizeInY:](&v78, sel_setPaddingSizeInY_, [v57 paddingSizeInY]);
    v77.receiver = v59;
    v77.super_class = (Class)MLCConvolutionLayer;
    [(MLCLayer *)&v77 setIsUpdatable:1];
  }
  v22 = v59;
  v21 = v22;
  id v10 = v57;
LABEL_13:

  return v21;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(MLCConvolutionLayer *)self weights];
  v13 = [v12 parentLayers];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    v16 = [(MLCConvolutionLayer *)self biases];
    v17 = [v16 parentLayers];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      v15 = +[MLCLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MLCConvolutionLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2, self);
      }
      goto LABEL_7;
    }
    v138 = a2;
    id v139 = v10;
    v21 = [(MLCConvolutionLayer *)self biases];
    v22 = [v21 childLayers];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      v24 = [(MLCConvolutionLayer *)self weights];
      v25 = [v24 childLayers];
      uint64_t v26 = [v25 count];
      uint64_t v27 = [(MLCConvolutionLayer *)self biases];
      uint64_t v28 = [v27 childLayers];
      uint64_t v29 = [v28 count];

      if (v26 != v29)
      {
        v15 = +[MLCLog framework];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:](v138);
        }
        char v19 = 0;
        goto LABEL_46;
      }
      uint64_t v30 = [(MLCConvolutionLayer *)self weights];
      v31 = [v30 childLayers];
      uint64_t v32 = [v31 count];

      if (v32)
      {
        unint64_t v33 = 0;
        while (1)
        {
          v34 = [(MLCConvolutionLayer *)self weights];
          v35 = [v34 childLayers];
          v36 = [v35 objectAtIndexedSubscript:v33];
          v37 = [(MLCConvolutionLayer *)self biases];
          v38 = [v37 childLayers];
          v39 = [v38 objectAtIndexedSubscript:v33];

          if (v36 != v39) {
            break;
          }
          ++v33;
          v40 = [(MLCConvolutionLayer *)self weights];
          BOOL v41 = [v40 childLayers];
          unint64_t v42 = [v41 count];

          if (v33 >= v42) {
            goto LABEL_15;
          }
        }
        v15 = +[MLCLog framework];
        id v10 = v139;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:](v138);
        }
        goto LABEL_7;
      }
    }
LABEL_15:
    v43 = [(MLCConvolutionLayer *)self descriptor];
    unsigned int v133 = [v43 paddingPolicy];

    uint64_t v44 = [(MLCConvolutionLayer *)self descriptor];
    uint64_t v132 = [v44 paddingSizeInX];

    v45 = [(MLCConvolutionLayer *)self descriptor];
    uint64_t v134 = [v45 paddingSizeInY];

    int v46 = [(MLCLayer *)self paddingPolicy];
    v47 = [(MLCConvolutionLayer *)self descriptor];
    int v48 = [v47 paddingPolicy];

    int v135 = v48;
    int v136 = v46;
    if (v46 != v48)
    {
      uint64_t v49 = [(MLCLayer *)self paddingPolicy];
      v50 = [(MLCConvolutionLayer *)self descriptor];
      [v50 setPaddingPolicy:v49];

      unint64_t v51 = [(MLCLayer *)self paddingSizeInX];
      v52 = [(MLCConvolutionLayer *)self descriptor];
      [v52 setPaddingSizeInX:v51];

      unint64_t v53 = [(MLCLayer *)self paddingSizeInY];
      v54 = [(MLCConvolutionLayer *)self descriptor];
      [v54 setPaddingSizeInY:v53];
    }
    v55 = [(MLCLayer *)self fusedLayers];
    uint64_t v56 = [v55 count];

    if (v56)
    {
      v57 = [(MLCLayer *)self fusedLayers];
      v58 = [v57 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      uint64_t v60 = [(MLCLayer *)self fusedLayers];
      v61 = [v60 objectAtIndexedSubscript:0];
      if (isKindOfClass)
      {

        uint64_t v62 = [(MLCLayer *)self fusedLayers];
        unint64_t v63 = [v62 count];

        id v128 = v11;
        if (v63 < 2)
        {
          v137 = 0;
        }
        else
        {
          v64 = [(MLCLayer *)self fusedLayers];
          v65 = [v64 objectAtIndexedSubscript:1];
          v137 = [v65 descriptor];
        }
        v129 = [v9 computeEngine];
        uint64_t v126 = [(MLCConvolutionLayer *)self descriptor];
        v125 = [v61 mean];
        v75 = [v61 variance];
        v76 = [v61 beta];
        objc_super v77 = [v61 gamma];
        [v61 varianceEpsilon];
        int v79 = v78;
        [v61 momentum];
        int v81 = v80;
        objc_super v82 = [(MLCConvolutionLayer *)self weights];
        objc_super v83 = [(MLCConvolutionLayer *)self biases];
        v68 = (void *)v126;
        LODWORD(v84) = v79;
        LODWORD(v85) = v81;
        v15 = [v129 fusedConvolutionBatchNormalizationAndNeuronLayerWithDescriptor:v126 mean:v125 variance:v75 beta:v76 gamma:v77 varianceEpsilon:v137 momentum:v84 neuronDescriptor:v85 weights:v82 biasTerms:v83];

        v67 = v129;
        id v11 = v128;
      }
      else
      {
        objc_opt_class();
        char v69 = objc_opt_isKindOfClass();

        v70 = [(MLCLayer *)self fusedLayers];
        v61 = [v70 objectAtIndexedSubscript:0];
        if (v69)
        {

          unint64_t v71 = [(MLCLayer *)self fusedLayers];
          unint64_t v72 = [v71 count];

          if (v72 < 2)
          {
            v137 = 0;
          }
          else
          {
            v73 = [(MLCLayer *)self fusedLayers];
            id v74 = [v73 objectAtIndexedSubscript:1];
            v137 = [v74 descriptor];
          }
          v130 = [v9 computeEngine];
          uint64_t v92 = [(MLCConvolutionLayer *)self descriptor];
          uint64_t v93 = [v61 beta];
          v94 = [v61 gamma];
          [v61 varianceEpsilon];
          int v96 = v95;
          [v61 momentum];
          int v98 = v97;
          v99 = [(MLCConvolutionLayer *)self weights];
          v100 = [(MLCConvolutionLayer *)self biases];
          v101 = (void *)v93;
          LODWORD(v102) = v96;
          LODWORD(v103) = v98;
          v15 = [v130 fusedConvolutionInstanceNormalizationAndNeuronLayerWithDescriptor:v92 beta:v93 gamma:v94 varianceEpsilon:v137 momentum:v99 neuronDescriptor:v100 weights:v102 biasTerms:v103];

          v68 = (void *)v92;
          v67 = v130;
        }
        else
        {
          objc_opt_class();
          char v86 = objc_opt_isKindOfClass();

          objc_super v87 = [(MLCLayer *)self fusedLayers];
          v61 = [v87 objectAtIndexedSubscript:0];

          if (v86)
          {
            v88 = [(MLCLayer *)self fusedLayers];
            unint64_t v89 = [v88 count];

            if (v89 < 2)
            {
              v137 = 0;
            }
            else
            {
              v90 = [(MLCLayer *)self fusedLayers];
              v91 = [v90 objectAtIndexedSubscript:1];
              v137 = [v91 descriptor];
            }
            v67 = [v9 computeEngine];
            v68 = [(MLCConvolutionLayer *)self descriptor];
            v127 = [v61 beta];
            v108 = [v61 gamma];
            [v61 varianceEpsilon];
            int v110 = v109;
            uint64_t v131 = [v61 groupCount];
            v111 = [(MLCConvolutionLayer *)self weights];
            v112 = [(MLCConvolutionLayer *)self biases];
            LODWORD(v113) = v110;
            v15 = [v67 fusedConvolutionGroupNormalizationAndNeuronLayerWithDescriptor:v68 beta:v127 gamma:v108 varianceEpsilon:v131 momentum:v137 groupCount:v111 neuronDescriptor:v113 weights:0.0 biasTerms:v112];
          }
          else
          {
            v104 = [v9 computeEngine];
            v67 = [v61 descriptor];
            uint64_t v105 = [(MLCConvolutionLayer *)self descriptor];
            v106 = [(MLCConvolutionLayer *)self weights];
            v107 = [(MLCConvolutionLayer *)self biases];
            v137 = v104;
            v15 = [v104 fusedConvolutionAndNeuronLayerWithDescriptor:v67 convolutionDescriptor:v105 weights:v106 biasTerms:v107];

            v68 = (void *)v105;
          }
        }
      }
    }
    else
    {
      v61 = [v9 computeEngine];
      uint64_t v66 = [(MLCConvolutionLayer *)self descriptor];
      v67 = [(MLCConvolutionLayer *)self weights];
      v68 = [(MLCConvolutionLayer *)self biases];
      v137 = (void *)v66;
      v15 = [v61 convolutionLayerWithDescriptor:v66 weights:v67 biasTerms:v68];
    }

    if (v15 && [v15 count])
    {
      v114 = [v9 computeEngine];
      char v19 = [v114 compileLayerDeviceOps:v15 sourceTensors:v139 resultTensor:v11];

      v140.receiver = self;
      v140.super_class = (Class)MLCConvolutionLayer;
      [(MLCLayer *)&v140 bindDevice:v9 deviceOps:v15];
      v115 = [(MLCLayer *)self fusedLayers];
      uint64_t v116 = [v115 count];

      if (v116)
      {
        unint64_t v117 = 0;
        do
        {
          v118 = [(MLCLayer *)self fusedLayers];
          v119 = [v118 objectAtIndexedSubscript:v117];
          [v119 bindDevice:v9 deviceOps:v15];

          ++v117;
          v120 = [(MLCLayer *)self fusedLayers];
          unint64_t v121 = [v120 count];
        }
        while (v117 < v121);
      }
      if (v136 == v135)
      {
LABEL_46:
        id v10 = v139;
        goto LABEL_8;
      }
      v123 = [(MLCConvolutionLayer *)self descriptor];
      [v123 setPaddingPolicy:v133];

      v124 = [(MLCConvolutionLayer *)self descriptor];
      [v124 setPaddingSizeInX:v132];

      v122 = [(MLCConvolutionLayer *)self descriptor];
      [v122 setPaddingSizeInY:v134];
    }
    else
    {
      v122 = +[MLCLog framework];
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
        -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:](v138);
      }
      char v19 = 0;
    }
    id v10 = v139;

    goto LABEL_8;
  }
  v15 = +[MLCLog framework];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MLCConvolutionLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2, self);
  }
LABEL_7:
  char v19 = 0;
LABEL_8:

  return v19;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4 = a3;
  v5 = [(MLCConvolutionLayer *)self weightsParameter];
  v6 = [(MLCLayer *)self device];
  [v5 allocateDataForOptimizer:v4 device:v6 isVector:1];

  v7 = [(MLCConvolutionLayer *)self biases];

  if (v7)
  {
    id v8 = [(MLCConvolutionLayer *)self biasesParameter];
    id v9 = [(MLCLayer *)self device];
    [v8 allocateDataForOptimizer:v4 device:v9 isVector:1];
  }
  id v10 = [(MLCLayer *)self device];
  id v11 = [v10 computeEngine];
  v12 = [(MLCLayer *)self deviceOps];
  v13 = [(MLCConvolutionLayer *)self weights];
  uint64_t v14 = [(MLCConvolutionLayer *)self biases];
  [v11 setConvolutionLayerOptimizerDataForDeviceOps:v12 weights:v13 bias:v14];

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(MLCConvolutionLayer *)self weights];
  id v8 = [v7 descriptor];
  unint64_t v9 = [v8 tensorAllocationSizeInBytes];

  id v10 = [(MLCConvolutionLayer *)self biases];
  id v11 = [v10 descriptor];
  unint64_t v12 = [v11 tensorAllocationSizeInBytes];

  if (v4)
  {
    unint64_t v13 = v12 + v9;
    v9 += v9 * [v6 numOptimizerDataBuffers];
    v12 += v12 * [v6 numOptimizerDataBuffers];
  }
  else
  {
    unint64_t v13 = 0;
  }
  uint64_t v14 = [(MLCConvolutionLayer *)self weights];
  v15 = [v14 childLayers];
  unint64_t v16 = [v15 count];

  v17 = [(MLCConvolutionLayer *)self biases];
  uint64_t v18 = [v17 childLayers];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    unint64_t v20 = [(MLCConvolutionLayer *)self biases];
    v21 = [v20 childLayers];
    v12 /= (unint64_t)[v21 count];
  }
  return v12 + v13 + v9 / v16;
}

- (void)allocateGradientsForParameters
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(MLCConvolutionLayer *)self biases];
  uint64_t v4 = [(MLCConvolutionLayer *)self weights];
  v5 = (void *)v4;
  if (v3)
  {
    v12[0] = v4;
    id v6 = [(MLCConvolutionLayer *)self biases];
    v12[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  }
  else
  {
    uint64_t v11 = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  }

  id v8 = [(MLCLayer *)self device];
  unint64_t v9 = [v8 computeEngine];
  id v10 = [(MLCLayer *)self deviceOps];
  [v9 allocateParameterGradientsForDeviceOps:v10 parameters:v7];
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  if (a4 >= 2)
  {
    if (a4 == 3)
    {
      unint64_t v7 = [(MLCLayer *)self kernelWidth];
      unint64_t v8 = [(MLCLayer *)self dilationRateInX];
      unint64_t v9 = [(MLCLayer *)self strideInX];
      unint64_t v10 = [(MLCLayer *)self paddingSizeInX];
    }
    else
    {
      unint64_t v7 = [(MLCLayer *)self kernelHeight];
      unint64_t v8 = [(MLCLayer *)self dilationRateInY];
      unint64_t v9 = [(MLCLayer *)self strideInY];
      unint64_t v10 = [(MLCLayer *)self paddingSizeInY];
    }
    unint64_t v11 = v10;
    unint64_t v12 = [(MLCConvolutionLayer *)self descriptor];
    int v13 = [v12 isConvolutionTranspose];

    if (v13)
    {
      if ([(MLCLayer *)self paddingPolicy])
      {
        a3 = v8 * (v7 - 1) + v9 * (a3 - 1) + 1;
        if ([(MLCLayer *)self paddingPolicy] != 1) {
          a3 -= 2 * v11;
        }
      }
      else
      {
        a3 *= v9;
      }
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)MLCConvolutionLayer;
      return [(MLCLayer *)&v15 resultSizeFromSourceSize:a3 dimension:a4];
    }
  }
  return a3;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v6 = [v4 objectAtIndexedSubscript:0];
  unint64_t v7 = [v6 descriptor];
  unint64_t v8 = [v7 shape];
  unint64_t v9 = [v8 objectAtIndexedSubscript:0];
  [v5 setObject:v9 atIndexedSubscript:0];

  unint64_t v10 = NSNumber;
  unint64_t v11 = [(MLCConvolutionLayer *)self descriptor];
  unint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "outputFeatureChannelCount"));
  [v5 setObject:v12 atIndexedSubscript:1];

  int v13 = [v4 objectAtIndexedSubscript:0];
  uint64_t v14 = [v13 descriptor];
  objc_super v15 = [v14 shape];
  uint64_t v16 = [v15 count];

  v17 = [v4 objectAtIndexedSubscript:0];
  uint64_t v18 = [v17 descriptor];
  uint64_t v19 = [v18 shape];
  unint64_t v20 = [v19 objectAtIndexedSubscript:2];
  uint64_t v21 = [v20 unsignedIntegerValue];
  if (v16 == 3)
  {
    unint64_t v22 = [(MLCConvolutionLayer *)self resultSizeFromSourceSize:v21 dimension:3];

    uint64_t v23 = [NSNumber numberWithUnsignedInteger:v22];
    v24 = v5;
    v25 = v23;
    uint64_t v26 = 2;
  }
  else
  {
    unint64_t v27 = [(MLCConvolutionLayer *)self resultSizeFromSourceSize:v21 dimension:2];

    uint64_t v28 = [NSNumber numberWithUnsignedInteger:v27];
    [v5 setObject:v28 atIndexedSubscript:2];

    uint64_t v29 = [v4 objectAtIndexedSubscript:0];
    uint64_t v30 = [v29 descriptor];
    v31 = [v30 shape];
    uint64_t v32 = [v31 objectAtIndexedSubscript:3];
    unint64_t v33 = -[MLCConvolutionLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v32 unsignedIntegerValue], 3);

    uint64_t v23 = [NSNumber numberWithUnsignedInteger:v33];
    v24 = v5;
    v25 = v23;
    uint64_t v26 = 3;
  }
  [v24 setObject:v25 atIndexedSubscript:v26];

  v34 = (void *)[v5 copy];
  v35 = [v4 objectAtIndexedSubscript:0];
  v36 = [v35 descriptor];
  v37 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v34, [v36 dataType]);

  v38 = +[MLCTensor tensorWithDescriptor:v37];

  return v38;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCConvolutionLayer *)self accumulatorPrecisionOption];
  unint64_t v7 = [(MLCConvolutionLayer *)self weights];
  unint64_t v8 = [(MLCConvolutionLayer *)self biases];
  unint64_t v9 = [(MLCConvolutionLayer *)self descriptor];
  unint64_t v10 = [(MLCLayer *)self conditionalTreeNode];
  unint64_t v11 = [(MLCLayer *)self resultTensors];
  unint64_t v12 = [v3 stringWithFormat:@"%@: { accumulatorPrecisionOption=%d : weights=%@ : biasTerms=%@ : descriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)summarizedDOTDescription
{
  v3 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v3);
  id v4 = [(MLCConvolutionLayer *)self descriptor];
  unsigned int v5 = [v4 paddingPolicy];

  if (v5 >= 2)
  {
    if (v5 != 2)
    {
      unint64_t v33 = 0;
      goto LABEL_7;
    }
    unint64_t v7 = NSString;
    uint64_t v6 = [(MLCConvolutionLayer *)self descriptor];
    unint64_t v8 = MLCPaddingPolicyDebugDescription((MLCPaddingPolicy)[v6 paddingPolicy]);
    unint64_t v9 = [(MLCConvolutionLayer *)self descriptor];
    uint64_t v10 = [v9 paddingSizeInX];
    unint64_t v11 = [(MLCConvolutionLayer *)self descriptor];
    unint64_t v33 = [v7 stringWithFormat:@"%@ (%lu, %lu)", v8, v10, objc_msgSend(v11, "paddingSizeInY")];
  }
  else
  {
    uint64_t v6 = [(MLCConvolutionLayer *)self descriptor];
    unint64_t v33 = MLCPaddingPolicyDebugDescription((MLCPaddingPolicy)[v6 paddingPolicy]);
  }

LABEL_7:
  uint64_t v30 = NSString;
  NSUInteger v29 = [(MLCLayer *)self layerID];
  uint64_t v32 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v26 = MLCConvolutionTypeDebugDescription((MLCConvolutionType)[v32 convolutionType]);
  v31 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v25 = [v31 kernelWidth];
  uint64_t v28 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v24 = [v28 kernelWidth];
  unint64_t v27 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v23 = [v27 strideInX];
  unint64_t v12 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v13 = [v12 strideInY];
  uint64_t v14 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v15 = [v14 inputFeatureChannelCount];
  uint64_t v16 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v17 = [v16 outputFeatureChannelCount];
  uint64_t v18 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v19 = [v18 dilationRateInX];
  unint64_t v20 = [(MLCConvolutionLayer *)self descriptor];
  uint64_t v21 = [v30 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Convolution Type: %@<BR />Kernel: (%lu, %lu)     Stride: (%lu, %lu)<BR />Input Feature Channel Count: %lu<BR />Output Feature Channel Count: %lu<BR />Dilation: (%lu, %lu)   Padding: %@</FONT>>", v34, v29, v26, v25, v24, v23, v13, v15, v17, v19, objc_msgSend(v20, "dilationRateInY"), v33];

  return v21;
}

- (void)linkAssociatedTensors
{
  v3 = [(MLCConvolutionLayer *)self weights];
  id v4 = [v3 childLayers];
  [v4 addObject:self];

  unsigned int v5 = [(MLCConvolutionLayer *)self biases];

  if (v5)
  {
    id v7 = [(MLCConvolutionLayer *)self biases];
    uint64_t v6 = [v7 childLayers];
    [v6 addObject:self];
  }
}

- (void)unlinkAssociatedTensors
{
  v3 = [(MLCConvolutionLayer *)self weights];
  id v4 = [v3 childLayers];
  [v4 removeObject:self];

  unsigned int v5 = [(MLCConvolutionLayer *)self biases];

  if (v5)
  {
    id v7 = [(MLCConvolutionLayer *)self biases];
    uint64_t v6 = [v7 childLayers];
    [v6 removeObject:self];
  }
}

- (unint64_t)parametersCount
{
  v2 = [(MLCConvolutionLayer *)self biasesParameter];

  if (v2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (MLCConvolutionDescriptor)descriptor
{
  return self->_descriptor;
}

- (MLCTensor)weights
{
  return self->_weights;
}

- (MLCTensor)biases
{
  return self->_biases;
}

- (MLCTensorParameter)weightsParameter
{
  return self->_weightsParameter;
}

- (MLCTensorParameter)biasesParameter
{
  return self->_biasesParameter;
}

- (int)accumulatorPrecisionOption
{
  return self->_accumulatorPrecisionOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesParameter, 0);
  objc_storeStrong((id *)&self->_weightsParameter, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_weights, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: weights batch size > 1", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: missing weights", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: biasTerms batch size > 1", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: biasTerms width or height size > 1", v4, v5, v6, v7, v8);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.7(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: number of channels in biasTerms does not match output feature channels", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.4(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 biases];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: biasTerms tensor used by Convolution cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.5(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = [a2 weights];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v5, v6, "%@: weights tensor used by Convolution cannot have a parent layer=%@", v7, v8, v9, v10, v11);
}

@end