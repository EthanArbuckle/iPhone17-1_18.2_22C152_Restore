@interface MLNeuralNetworkMLComputeGraph
+ (id)graphFromCompiledArchive:(void *)a3 modelDescription:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 computeUnits:(int64_t)a7 error:(id *)a8;
- (BOOL)buildGraphsFor:(void *)a3 batchSize:(unint64_t)a4 numberOfClasses:(unint64_t)a5 error:(id *)a6;
- (BOOL)classifierOutputIsSigmoidOutput;
- (BOOL)copyWeightsFrom:(id)a3 to:(void *)a4 error:(id *)a5;
- (BOOL)layerFusedToLoss;
- (BOOL)saveUpdatedWeightsTo:(void *)a3 error:(id *)a4;
- (MLCDevice)device;
- (MLCGraph)graph;
- (MLCInferenceGraph)inferenceGraph;
- (MLCTrainingGraph)trainingGraph;
- (MLModelDescription)modelDescription;
- (MLNeuralNetworkMLComputeGraph)initWithCompiledArchive:(void *)a3 modelDescription:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 computeUnits:(int64_t)a7 error:(id *)a8;
- (NSDictionary)layersMap;
- (NSDictionary)mlcInputs;
- (NSDictionary)mlcLabels;
- (NSDictionary)outputNameToLayerMap;
- (NSString)fusedLayerInputName;
- (id)buildInferenceGraph:(id)a3 updateParams:(const void *)a4 layers:(const void *)a5 mlcTensorByName:(id)a6 outputNameToLayerMap:(id)a7 error:(id *)a8;
- (id)buildMLComputeTensorDescriptorWith:(id)a3 featureName:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 error:(id *)a7;
- (id)buildTrainingGraphFrom:(id)a3 updateParams:(const void *)a4 numberOfClasses:(unint64_t)a5 mlcTensorByName:(id)a6 error:(id *)a7;
- (id)createMultiArrayFromTensor:(id)a3 error:(id *)a4;
- (id)getBiasesForLayerNamed:(id)a3 error:(id *)a4;
- (id)getWeightsForLayerNamed:(id)a3 error:(id *)a4;
- (id)inputTensorMapWithBatchSize:(unint64_t)a3 numberOfClasses:(unint64_t)a4 error:(id *)a5;
- (id)labelTensorMapWithBatchSize:(unint64_t)a3 numberOfClasses:(unint64_t)a4 error:(id *)a5;
- (id)lossInputsFromUpdateParams:(const void *)a3;
- (int)mlcDeviceTypeForComputeUnit:(int64_t)a3;
- (unint64_t)executionOptions;
- (void)setClassifierOutputIsSigmoidOutput:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setExecutionOptions:(unint64_t)a3;
- (void)setFusedLayerInputName:(id)a3;
- (void)setGraph:(id)a3;
- (void)setInferenceGraph:(id)a3;
- (void)setLayerFusedToLoss:(BOOL)a3;
- (void)setLayersMap:(id)a3;
- (void)setMlcInputs:(id)a3;
- (void)setMlcLabels:(id)a3;
- (void)setModelDescription:(id)a3;
- (void)setTrainingGraph:(id)a3;
@end

@implementation MLNeuralNetworkMLComputeGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_fusedLayerInputName, 0);
  objc_storeStrong((id *)&self->_layersMap, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_outputNameToLayerMap, 0);
  objc_storeStrong((id *)&self->_mlcLabels, 0);
  objc_storeStrong((id *)&self->_mlcInputs, 0);
  objc_storeStrong((id *)&self->_inferenceGraph, 0);
  objc_storeStrong((id *)&self->_trainingGraph, 0);

  objc_storeStrong((id *)&self->_graph, 0);
}

- (void)setDevice:(id)a3
{
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setFusedLayerInputName:(id)a3
{
}

- (NSString)fusedLayerInputName
{
  return self->_fusedLayerInputName;
}

- (void)setLayerFusedToLoss:(BOOL)a3
{
  self->_layerFusedToLoss = a3;
}

- (BOOL)layerFusedToLoss
{
  return self->_layerFusedToLoss;
}

- (void)setLayersMap:(id)a3
{
}

- (NSDictionary)layersMap
{
  return self->_layersMap;
}

- (void)setModelDescription:(id)a3
{
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)setClassifierOutputIsSigmoidOutput:(BOOL)a3
{
  self->_classifierOutputIsSigmoidOutput = a3;
}

- (BOOL)classifierOutputIsSigmoidOutput
{
  return self->_classifierOutputIsSigmoidOutput;
}

- (void)setExecutionOptions:(unint64_t)a3
{
  self->_executionOptions = a3;
}

- (unint64_t)executionOptions
{
  return self->_executionOptions;
}

- (NSDictionary)outputNameToLayerMap
{
  return self->_outputNameToLayerMap;
}

- (void)setMlcLabels:(id)a3
{
}

- (NSDictionary)mlcLabels
{
  return self->_mlcLabels;
}

- (void)setMlcInputs:(id)a3
{
}

- (NSDictionary)mlcInputs
{
  return self->_mlcInputs;
}

- (void)setInferenceGraph:(id)a3
{
}

- (MLCInferenceGraph)inferenceGraph
{
  return self->_inferenceGraph;
}

- (void)setTrainingGraph:(id)a3
{
}

- (MLCTrainingGraph)trainingGraph
{
  return self->_trainingGraph;
}

- (void)setGraph:(id)a3
{
}

- (MLCGraph)graph
{
  return self->_graph;
}

- (id)getBiasesForLayerNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLNeuralNetworkMLComputeGraph *)self layersMap];
  v8 = [v7 objectForKeyedSubscript:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v9 = [v8 biases];
    v10 = [(MLNeuralNetworkMLComputeGraph *)self createMultiArrayFromTensor:v9 error:a4];
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:7, @"%@ layer does not contain bias terms", v6 format];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getWeightsForLayerNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLNeuralNetworkMLComputeGraph *)self layersMap];
  v8 = [v7 objectForKeyedSubscript:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v9 = [v8 weights];
    v10 = [(MLNeuralNetworkMLComputeGraph *)self createMultiArrayFromTensor:v9 error:a4];
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:7, @"%@ layer does not contain weights", v6 format];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createMultiArrayFromTensor:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 data];
  uint64_t v7 = [v6 bytes];

  v8 = [v5 descriptor];
  v9 = [v8 shape];

  v10 = [v5 descriptor];
  v11 = [v10 stride];

  v12 = [[MLMultiArray alloc] initWithDataPointer:v7 shape:v9 dataType:65568 strides:v11 deallocator:0 error:a4];

  return v12;
}

- (BOOL)saveUpdatedWeightsTo:(void *)a3 error:(id *)a4
{
  int v6 = *((_DWORD *)a3 + 11);
  if (v6 == 303 || v6 == 403 || v6 == 500) {
    uint64_t v7 = *((void *)a3 + 4) + 16;
  }
  else {
    uint64_t v7 = 0;
  }
  if (*(int *)(v7 + 8) < 1) {
    return 1;
  }
  uint64_t v8 = 0;
  uint64_t v122 = v7;
  while (1)
  {
    uint64_t v9 = *(void *)(*(void *)(v7 + 16) + 8 * v8 + 8);
    v10 = [(MLNeuralNetworkMLComputeGraph *)self layersMap];
    v11 = *(uint64_t **)(v9 + 112);
    if (*((char *)v11 + 23) < 0) {
      v11 = (uint64_t *)*v11;
    }
    v12 = [NSString stringWithUTF8String:v11];
    v13 = [v10 objectForKeyedSubscript:v12];

    int v14 = *(_DWORD *)(v9 + 140);
    if (v14 <= 159) {
      break;
    }
    if (v14 == 160)
    {
      v19 = [v13 gamma];
      v20 = [v19 data];
      if (*(_DWORD *)(v9 + 140) != 160)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 160;
        operator new();
      }
      uint64_t v30 = *(void *)(*(void *)(v9 + 128) + 16);
      if (!v30) {
        operator new();
      }
      BOOL v31 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v20 to:v30 error:a4];

      if (!v31) {
        goto LABEL_188;
      }
      v32 = [v13 beta];
      v33 = [v32 data];
      if (*(_DWORD *)(v9 + 140) != 160)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 160;
        operator new();
      }
      uint64_t v46 = *(void *)(*(void *)(v9 + 128) + 24);
      if (!v46) {
        operator new();
      }
      BOOL v47 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v33 to:v46 error:a4];

      if (!v47) {
        goto LABEL_188;
      }
      v48 = [v13 mean];
      v49 = [v48 data];
      if (*(_DWORD *)(v9 + 140) != 160)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 160;
        operator new();
      }
      uint64_t v56 = *(void *)(*(void *)(v9 + 128) + 32);
      if (!v56) {
        operator new();
      }
      BOOL v57 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v49 to:v56 error:a4];

      if (!v57) {
        goto LABEL_188;
      }
      v44 = [v13 variance];
      v45 = [v44 data];
      if (*(_DWORD *)(v9 + 140) != 160)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 160;
        operator new();
      }
      uint64_t v64 = *(void *)(*(void *)(v9 + 128) + 40);
      if (!v64) {
        operator new();
      }
LABEL_184:
      BOOL v120 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v45 to:v64 error:a4];
LABEL_185:

      if (!v120) {
        goto LABEL_188;
      }
      goto LABEL_186;
    }
    if (v14 == 420)
    {
      v21 = [v13 inputWeights];
      v22 = [v21 objectAtIndexedSubscript:0];
      v23 = [v22 data];
      if (*(_DWORD *)(v9 + 140) != 420)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        operator new();
      }
      uint64_t v38 = *(void *)(*(void *)(v9 + 128) + 48);
      if (!v38) {
        operator new();
      }
      uint64_t v39 = *(void *)(v38 + 16);
      if (!v39) {
        operator new();
      }
      BOOL v40 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v23 to:v39 error:a4];

      if (!v40) {
        goto LABEL_188;
      }
      v41 = [v13 inputWeights];
      v42 = [v41 objectAtIndexedSubscript:1];
      v43 = [v42 data];
      if (*(_DWORD *)(v9 + 140) != 420)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        operator new();
      }
      uint64_t v50 = *(void *)(*(void *)(v9 + 128) + 48);
      if (!v50) {
        operator new();
      }
      uint64_t v51 = *(void *)(v50 + 24);
      if (!v51) {
        operator new();
      }
      BOOL v52 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v43 to:v51 error:a4];

      if (!v52) {
        goto LABEL_188;
      }
      v53 = [v13 inputWeights];
      v54 = [v53 objectAtIndexedSubscript:2];
      v55 = [v54 data];
      if (*(_DWORD *)(v9 + 140) != 420)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        operator new();
      }
      uint64_t v58 = *(void *)(*(void *)(v9 + 128) + 48);
      if (!v58) {
        operator new();
      }
      uint64_t v59 = *(void *)(v58 + 32);
      if (!v59) {
        operator new();
      }
      BOOL v60 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v55 to:v59 error:a4];

      if (!v60) {
        goto LABEL_188;
      }
      v61 = [v13 inputWeights];
      v62 = [v61 objectAtIndexedSubscript:3];
      v63 = [v62 data];
      if (*(_DWORD *)(v9 + 140) != 420)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        operator new();
      }
      uint64_t v65 = *(void *)(*(void *)(v9 + 128) + 48);
      if (!v65) {
        operator new();
      }
      uint64_t v66 = *(void *)(v65 + 40);
      if (!v66) {
        operator new();
      }
      BOOL v67 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v63 to:v66 error:a4];

      if (!v67) {
        goto LABEL_188;
      }
      v68 = [v13 hiddenWeights];
      v69 = [v68 objectAtIndexedSubscript:0];
      v70 = [v69 data];
      if (*(_DWORD *)(v9 + 140) != 420)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        operator new();
      }
      uint64_t v71 = *(void *)(*(void *)(v9 + 128) + 48);
      if (!v71) {
        operator new();
      }
      uint64_t v72 = *(void *)(v71 + 48);
      if (!v72) {
        operator new();
      }
      BOOL v73 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v70 to:v72 error:a4];

      if (!v73) {
        goto LABEL_188;
      }
      v74 = [v13 hiddenWeights];
      v75 = [v74 objectAtIndexedSubscript:1];
      v76 = [v75 data];
      if (*(_DWORD *)(v9 + 140) != 420)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        operator new();
      }
      uint64_t v77 = *(void *)(*(void *)(v9 + 128) + 48);
      if (!v77) {
        operator new();
      }
      uint64_t v78 = *(void *)(v77 + 56);
      if (!v78) {
        operator new();
      }
      BOOL v79 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v76 to:v78 error:a4];

      if (!v79) {
        goto LABEL_188;
      }
      v80 = [v13 hiddenWeights];
      v81 = [v80 objectAtIndexedSubscript:2];
      v82 = [v81 data];
      if (*(_DWORD *)(v9 + 140) != 420)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        operator new();
      }
      uint64_t v83 = *(void *)(*(void *)(v9 + 128) + 48);
      if (!v83) {
        operator new();
      }
      uint64_t v84 = *(void *)(v83 + 64);
      if (!v84) {
        operator new();
      }
      BOOL v85 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v82 to:v84 error:a4];

      if (!v85) {
        goto LABEL_188;
      }
      v86 = [v13 hiddenWeights];
      v87 = [v86 objectAtIndexedSubscript:3];
      v88 = [v87 data];
      if (*(_DWORD *)(v9 + 140) != 420)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        operator new();
      }
      uint64_t v89 = *(void *)(*(void *)(v9 + 128) + 48);
      if (!v89) {
        operator new();
      }
      uint64_t v90 = *(void *)(v89 + 72);
      if (!v90) {
        operator new();
      }
      BOOL v91 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v88 to:v90 error:a4];

      if (!v91) {
        goto LABEL_188;
      }
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v93 = *(uint64_t **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v92);
        v93 = &CoreML::Specification::_UniDirectionalLSTMLayerParams_default_instance_;
      }
      v94 = (uint64_t *)v93[5];
      if (!v94) {
        v94 = &CoreML::Specification::_LSTMParams_default_instance_;
      }
      if (*((unsigned char *)v94 + 21))
      {
        v95 = [v13 biases];
        v96 = [v95 objectAtIndexedSubscript:0];
        v97 = [v96 data];
        if (*(_DWORD *)(v9 + 140) != 420)
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 420;
          operator new();
        }
        uint64_t v102 = *(void *)(*(void *)(v9 + 128) + 48);
        if (!v102) {
          operator new();
        }
        uint64_t v103 = *(void *)(v102 + 80);
        if (!v103) {
          operator new();
        }
        BOOL v104 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v97 to:v103 error:a4];

        if (!v104) {
          goto LABEL_188;
        }
        v105 = [v13 biases];
        v106 = [v105 objectAtIndexedSubscript:1];
        v107 = [v106 data];
        if (*(_DWORD *)(v9 + 140) != 420)
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 420;
          operator new();
        }
        uint64_t v108 = *(void *)(*(void *)(v9 + 128) + 48);
        if (!v108) {
          operator new();
        }
        uint64_t v109 = *(void *)(v108 + 88);
        if (!v109) {
          operator new();
        }
        BOOL v110 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v107 to:v109 error:a4];

        if (!v110) {
          goto LABEL_188;
        }
        v111 = [v13 biases];
        v112 = [v111 objectAtIndexedSubscript:2];
        v113 = [v112 data];
        if (*(_DWORD *)(v9 + 140) != 420)
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 420;
          operator new();
        }
        uint64_t v114 = *(void *)(*(void *)(v9 + 128) + 48);
        if (!v114) {
          operator new();
        }
        uint64_t v115 = *(void *)(v114 + 96);
        if (!v115) {
          operator new();
        }
        BOOL v116 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v113 to:v115 error:a4];

        if (!v116) {
          goto LABEL_188;
        }
        v44 = [v13 biases];
        v45 = [v44 objectAtIndexedSubscript:3];
        v117 = [v45 data];
        if (*(_DWORD *)(v9 + 140) != 420)
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 420;
          operator new();
        }
        uint64_t v118 = *(void *)(*(void *)(v9 + 128) + 48);
        if (!v118) {
          operator new();
        }
        uint64_t v119 = *(void *)(v118 + 104);
        if (!v119) {
          operator new();
        }
        BOOL v120 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v117 to:v119 error:a4];

        goto LABEL_185;
      }
    }
    else if (v14 == 1045 && *(_DWORD *)(v9 + 24) == 1)
    {
      v15 = [v13 weights];
      v16 = [v15 data];
      if (*(_DWORD *)(v9 + 140) != 1045)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 1045;
        operator new();
      }
      uint64_t v98 = *(void *)(*(void *)(v9 + 128) + 16);
      if (!v98) {
        operator new();
      }
      BOOL v99 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v16 to:v98 error:a4];

      if (!v99) {
        goto LABEL_188;
      }
      if (*(_DWORD *)(v9 + 140) == 1045)
      {
        v101 = *(uint64_t **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v100);
        v101 = &CoreML::Specification::_BatchedMatMulLayerParams_default_instance_;
      }
      if (*((unsigned char *)v101 + 50))
      {
        v44 = [v13 biases];
        v45 = [v44 data];
        if (*(_DWORD *)(v9 + 140) != 1045)
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 1045;
          operator new();
        }
        uint64_t v64 = *(void *)(*(void *)(v9 + 128) + 24);
        if (!v64) {
          operator new();
        }
        goto LABEL_184;
      }
    }
LABEL_186:

    ++v8;
    uint64_t v7 = v122;
    if (v8 >= *(int *)(v122 + 8)) {
      return 1;
    }
  }
  if (v14 != 100)
  {
    if (v14 == 140)
    {
      v17 = [v13 weights];
      v18 = [v17 data];
      if (*(_DWORD *)(v9 + 140) != 140)
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 140;
        operator new();
      }
      uint64_t v26 = *(void *)(*(void *)(v9 + 128) + 16);
      if (!v26) {
        operator new();
      }
      BOOL v27 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v18 to:v26 error:a4];

      if (!v27) {
        goto LABEL_188;
      }
      if (*(_DWORD *)(v9 + 140) == 140)
      {
        v29 = *(uint64_t **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v28);
        v29 = &CoreML::Specification::_InnerProductLayerParams_default_instance_;
      }
      if (*((unsigned char *)v29 + 48))
      {
        v44 = [v13 biases];
        v45 = [v44 data];
        if (*(_DWORD *)(v9 + 140) != 140)
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 140;
          operator new();
        }
        uint64_t v64 = *(void *)(*(void *)(v9 + 128) + 24);
        if (!v64) {
          operator new();
        }
        goto LABEL_184;
      }
    }
    goto LABEL_186;
  }
  v24 = [v13 weights];
  v25 = [v24 data];
  if (*(_DWORD *)(v9 + 140) != 100)
  {
    CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
    *(_DWORD *)(v9 + 140) = 100;
    operator new();
  }
  uint64_t v34 = *(void *)(*(void *)(v9 + 128) + 112);
  if (!v34) {
    operator new();
  }
  BOOL v35 = [(MLNeuralNetworkMLComputeGraph *)self copyWeightsFrom:v25 to:v34 error:a4];

  if (v35)
  {
    if (*(_DWORD *)(v9 + 140) == 100)
    {
      v37 = *(uint64_t **)(v9 + 128);
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v36);
      v37 = &CoreML::Specification::_ConvolutionLayerParams_default_instance_;
    }
    if (!*((unsigned char *)v37 + 153)) {
      goto LABEL_186;
    }
    v44 = [v13 biases];
    v45 = [v44 data];
    if (*(_DWORD *)(v9 + 140) != 100)
    {
      CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
      *(_DWORD *)(v9 + 140) = 100;
      operator new();
    }
    uint64_t v64 = *(void *)(*(void *)(v9 + 128) + 120);
    if (!v64) {
      operator new();
    }
    goto LABEL_184;
  }
LABEL_188:

  return 0;
}

- (BOOL)copyWeightsFrom:(id)a3 to:(void *)a4 error:(id *)a5
{
  uint64_t v7 = (const void *)[a3 bytes];
  uint64_t v8 = *((void *)a4 + 5);
  if (*(char *)(v8 + 23) < 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = *(unsigned __int8 *)(v8 + 23);
  }
  uint64_t v10 = *((void *)a4 + 6);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 23);
  if (*(char *)(v10 + 23) < 0) {
    uint64_t v12 = *(void *)(v10 + 8);
  }
  else {
    uint64_t v12 = *(unsigned __int8 *)(v10 + 23);
  }
  int v13 = *((_DWORD *)a4 + 4);
  uint64_t v14 = *((void *)a4 + 7);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 23);
  if (*(char *)(v14 + 23) < 0) {
    uint64_t v16 = *(void *)(v14 + 8);
  }
  else {
    uint64_t v16 = *(unsigned __int8 *)(v14 + 23);
  }
  if (v13 <= 0) {
    int v17 = 1;
  }
  else {
    int v17 = 2;
  }
  if (v9) {
    unsigned int v18 = v17;
  }
  else {
    unsigned int v18 = v13 > 0;
  }
  if (v12) {
    ++v18;
  }
  if (v16) {
    ++v18;
  }
  if (v18 > 1) {
    goto LABEL_21;
  }
  if (v13 <= 0 && v18)
  {
    if ((*(unsigned char *)(v8 + 23) & 0x80) != 0)
    {
      uint64_t v19 = *(void *)(v8 + 8);
      if (v19) {
        goto LABEL_47;
      }
    }
    else if (*(unsigned char *)(v8 + 23))
    {
      LODWORD(v19) = *(unsigned __int8 *)(v8 + 23);
      goto LABEL_47;
    }
    if ((v11 & 0x80) != 0)
    {
      uint64_t v23 = *((void *)a4 + 8);
      BOOL v21 = v23 != 0;
      BOOL v22 = a4 != &CoreML::Specification::_WeightParams_default_instance_;
      if (a4 != &CoreML::Specification::_WeightParams_default_instance_)
      {
        uint64_t v19 = *(void *)(v10 + 8);
        if (v19)
        {
          if (v23) {
            goto LABEL_47;
          }
        }
      }
    }
    else
    {
      uint64_t v20 = *((void *)a4 + 8);
      BOOL v21 = v20 != 0;
      BOOL v22 = a4 != &CoreML::Specification::_WeightParams_default_instance_;
      if (a4 != &CoreML::Specification::_WeightParams_default_instance_ && *(unsigned char *)(v10 + 23) && v20)
      {
        LODWORD(v19) = *(unsigned __int8 *)(v10 + 23);
        goto LABEL_47;
      }
    }
    if ((v15 & 0x80) == 0)
    {
      if (!*(unsigned char *)(v14 + 23)) {
        BOOL v22 = 0;
      }
      if (v22 && v21)
      {
        LODWORD(v19) = *(unsigned __int8 *)(v14 + 23);
        goto LABEL_47;
      }
LABEL_21:
      LODWORD(v19) = 0;
      goto LABEL_47;
    }
    uint64_t v19 = *(void *)(v14 + 8);
    if (!v19) {
      BOOL v22 = 0;
    }
    if (!v22 || !v21) {
      goto LABEL_21;
    }
  }
  else if (v18)
  {
    LODWORD(v19) = 4 * v13;
  }
  else
  {
    LODWORD(v19) = 0;
  }
LABEL_47:
  if ((*(unsigned char *)(v8 + 23) & 0x80) != 0)
  {
    uint64_t v24 = *(void *)(v8 + 8);
    if ((v11 & 0x80) == 0)
    {
LABEL_49:
      uint64_t v25 = *(unsigned __int8 *)(v10 + 23);
      if ((v15 & 0x80) == 0) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v24 = *(unsigned __int8 *)(v8 + 23);
    if ((v11 & 0x80) == 0) {
      goto LABEL_49;
    }
  }
  uint64_t v25 = *(void *)(v10 + 8);
  if ((v15 & 0x80) != 0) {
LABEL_50:
  }
    uint64_t v15 = *(void *)(v14 + 8);
LABEL_51:
  if (v24) {
    unsigned int v26 = v17;
  }
  else {
    unsigned int v26 = v13 > 0;
  }
  if (v25) {
    ++v26;
  }
  if (v15) {
    unsigned int v27 = v26 + 1;
  }
  else {
    unsigned int v27 = v26;
  }
  if (v27 > 1) {
    goto LABEL_60;
  }
  if (v13 <= 0 && v27)
  {
    if ((*(unsigned char *)(v8 + 23) & 0x80) != 0)
    {
      if (*(void *)(v8 + 8))
      {
LABEL_66:
        if ((long long *)v8 == &google::protobuf::internal::fixed_address_empty_string) {
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
        }
        goto LABEL_76;
      }
    }
    else if (*(unsigned char *)(v8 + 23))
    {
      goto LABEL_66;
    }
    if ((v11 & 0x80) != 0) {
      uint64_t v11 = *(void *)(v10 + 8);
    }
    if (a4 == &CoreML::Specification::_WeightParams_default_instance_ || !v11 || !*((void *)a4 + 8)) {
      goto LABEL_60;
    }
    uint64_t v8 = *((void *)a4 + 6);
    if ((long long *)v10 == &google::protobuf::internal::fixed_address_empty_string) {
      google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
    }
    goto LABEL_76;
  }
  if (!v27) {
    goto LABEL_60;
  }
  uint64_t v30 = *((void *)a4 + 3);
  if (v30) {
    uint64_t v8 = v30 + 8;
  }
  else {
    uint64_t v8 = 0;
  }
LABEL_76:
  if (v8 && v7)
  {
    memcpy((void *)v8, v7, (int)v19);
    return 1;
  }
LABEL_60:
  if (!a5) {
    return 0;
  }
  id v28 = +[MLModelErrorUtils updateErrorWithFormat:@"Error in copying updated weights from training graph"];
  BOOL result = 0;
  *a5 = v28;
  return result;
}

- (int)mlcDeviceTypeForComputeUnit:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (id)buildMLComputeTensorDescriptorWith:(id)a3 featureName:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 error:(id *)a7
{
  v47[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  int v13 = [v11 trainingInputDescriptionsByName];
  uint64_t v14 = [v13 objectForKeyedSubscript:v12];

  uint64_t v15 = [v14 type];
  if (v15 == 4)
  {
    uint64_t v24 = [v14 imageConstraint];
    uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "pixelsWide"));
    unsigned int v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "pixelsHigh"));
    unsigned int v27 = [NSNumber numberWithUnsignedInteger:a5];
    v47[0] = v27;
    id v28 = NSNumber;
    if ([v24 pixelType] == 10) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = 3;
    }
    uint64_t v30 = [v28 numberWithInt:v29];
    v47[1] = v30;
    v47[2] = v26;
    v47[3] = v25;
    BOOL v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];

    v32 = [MEMORY[0x1E4F30C88] descriptorWithShape:v31 dataType:1];

    goto LABEL_26;
  }
  if (v15 != 5)
  {
    v33 = [v14 name];
    uint64_t v34 = [v11 predictedFeatureName];
    int v35 = [v33 isEqualToString:v34];

    if (v35)
    {
      v32 = [MEMORY[0x1E4F30C88] descriptorWithWidth:1 height:1 featureChannelCount:a6 batchSize:a5];
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  uint64_t v16 = [v14 multiArrayConstraint];
  int v17 = [v16 shape];
  if (!v17
    || ([v16 shape],
        unsigned int v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 count],
        v18,
        v17,
        !v19))
  {
LABEL_16:

LABEL_17:
    v32 = 0;
    goto LABEL_26;
  }
  uint64_t v20 = [v16 shape];
  switch([v20 count])
  {
    case 1:
      BOOL v21 = [NSNumber numberWithUnsignedInteger:a5];
      v46[0] = v21;
      BOOL v22 = [v20 objectAtIndexedSubscript:0];
      v46[1] = v22;
      v46[2] = &unk_1EF11A640;
      v46[3] = &unk_1EF11A640;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
      goto LABEL_25;
    case 2:
      BOOL v21 = [NSNumber numberWithUnsignedInteger:a5];
      v45[0] = v21;
      v45[1] = &unk_1EF11A640;
      BOOL v22 = [v20 objectAtIndexedSubscript:0];
      v45[2] = v22;
      v37 = [v20 objectAtIndexedSubscript:1];
      v45[3] = v37;
      uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
      goto LABEL_23;
    case 3:
      BOOL v21 = [NSNumber numberWithUnsignedInteger:a5];
      v44[0] = v21;
      BOOL v22 = [v20 objectAtIndexedSubscript:0];
      v44[1] = v22;
      v37 = [v20 objectAtIndexedSubscript:1];
      v44[2] = v37;
      uint64_t v39 = [v20 objectAtIndexedSubscript:2];
      v44[3] = v39;
      uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
      goto LABEL_21;
    case 4:
      BOOL v21 = [NSNumber numberWithUnsignedInteger:a5];
      v43[0] = v21;
      BOOL v22 = [v20 objectAtIndexedSubscript:1];
      v43[1] = v22;
      v37 = [v20 objectAtIndexedSubscript:2];
      v43[2] = v37;
      uint64_t v39 = [v20 objectAtIndexedSubscript:3];
      v43[3] = v39;
      uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
LABEL_21:
      uint64_t v23 = (void *)v40;

      break;
    case 5:
      BOOL v21 = [NSNumber numberWithUnsignedInteger:a5];
      v42[0] = v21;
      BOOL v22 = [v20 objectAtIndexedSubscript:2];
      v42[1] = v22;
      v42[2] = &unk_1EF11A640;
      v37 = [v20 objectAtIndexedSubscript:0];
      v42[3] = v37;
      uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
LABEL_23:
      uint64_t v23 = (void *)v38;
      break;
    default:
      if (a7)
      {
        v36 = [v16 shape];
        *a7 = +[MLModelErrorUtils errorWithCode:6, @"Input data provided has unsupported shape %@d", v36 format];
      }
      goto LABEL_16;
  }

LABEL_25:
  v32 = [MEMORY[0x1E4F30C88] descriptorWithShape:v23 dataType:1];

LABEL_26:

  return v32;
}

- (BOOL)buildGraphsFor:(void *)a3 batchSize:(unint64_t)a4 numberOfClasses:(unint64_t)a5 error:(id *)a6
{
  uint64_t v10 = objc_opt_new();
  [(MLNeuralNetworkMLComputeGraph *)self setGraph:v10];

  int v11 = *((_DWORD *)a3 + 11);
  switch(v11)
  {
    case 303:
      goto LABEL_4;
    case 403:
      uint64_t v15 = *((void *)a3 + 4);
      uint64_t v13 = v15 + 16;
      uint64_t v14 = *(uint64_t **)(v15 + 72);
LABEL_6:
      if (v14) {
        uint64_t v16 = v14;
      }
      else {
        uint64_t v16 = &CoreML::Specification::_NetworkUpdateParameters_default_instance_;
      }
      goto LABEL_10;
    case 500:
LABEL_4:
      uint64_t v12 = *((void *)a3 + 4);
      uint64_t v13 = v12 + 16;
      uint64_t v14 = *(uint64_t **)(v12 + 64);
      goto LABEL_6;
  }
  uint64_t v16 = 0;
  uint64_t v13 = 0;
LABEL_10:
  v126 = [(MLNeuralNetworkMLComputeGraph *)self lossInputsFromUpdateParams:v16];
  v127 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  int v17 = [(MLNeuralNetworkMLComputeGraph *)self mlcInputs];
  v130 = (void *)[v17 mutableCopy];

  unsigned int v18 = (uint64_t *)*((void *)a3 + 2);
  if (!v18) {
    unsigned int v18 = &CoreML::Specification::_ModelDescription_default_instance_;
  }
  v125 = v18;
  v131 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  unint64_t v119 = a5;
  uint64_t v19 = *(void *)(v13 + 16);
  if (v19) {
    uint64_t v20 = (uint64_t *)(v19 + 8);
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v117 = v13;
  uint64_t v21 = *(int *)(v13 + 8);
  if (!v21)
  {
    BOOL v22 = 0;
LABEL_138:
    [(MLNeuralNetworkMLComputeGraph *)self setLayersMap:v127];
    uint64_t v98 = [(MLNeuralNetworkMLComputeGraph *)self graph];
    BOOL v99 = [(MLNeuralNetworkMLComputeGraph *)self buildTrainingGraphFrom:v98 updateParams:v16 numberOfClasses:v119 mlcTensorByName:v130 error:a6];
    [(MLNeuralNetworkMLComputeGraph *)self setTrainingGraph:v99];

    if (v99)
    {
      v100 = [(MLNeuralNetworkMLComputeGraph *)self trainingGraph];
      v101 = [(MLNeuralNetworkMLComputeGraph *)self device];
      char v102 = [v100 compileWithOptions:0 device:v101];

      if (v102)
      {
        uint64_t v103 = [(MLNeuralNetworkMLComputeGraph *)self graph];
        BOOL v104 = [(MLNeuralNetworkMLComputeGraph *)self buildInferenceGraph:v103 updateParams:v16 layers:v117 mlcTensorByName:v130 outputNameToLayerMap:v131 error:a6];
        [(MLNeuralNetworkMLComputeGraph *)self setInferenceGraph:v104];

        if (v104)
        {
          v105 = [(MLNeuralNetworkMLComputeGraph *)self inferenceGraph];
          v106 = [(MLNeuralNetworkMLComputeGraph *)self device];
          char v107 = [v105 compileWithOptions:0 device:v106];

          if (v107)
          {
            BOOL v108 = 1;
            goto LABEL_170;
          }
          if (a6)
          {
            uint64_t v109 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to compile inference graph."];
            goto LABEL_151;
          }
        }
      }
      else if (a6)
      {
        uint64_t v109 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to compile training graph."];
        goto LABEL_151;
      }
    }
LABEL_169:
    BOOL v108 = 0;
    goto LABEL_170;
  }
  BOOL v22 = 0;
  uint64_t v122 = a6;
  v123 = &v20[v21];
  BOOL v120 = v16;
  v121 = self;
  while (1)
  {
    uint64_t v23 = *v20;
    uint64_t v24 = *(unsigned int *)(*v20 + 140);
    if ((int)v24 > 300) {
      break;
    }
    if ((int)v24 <= 139)
    {
      switch(v24)
      {
        case 0x64:
          uint64_t v45 = *(void *)(v23 + 128);
          v145 = v22;
          uint64_t v26 = [MEMORY[0x1E4F30BF0] convolutionLayer:v45 error:&v145];
          unsigned int v27 = v145;
          break;
        case 0x78:
          uint64_t v38 = *(void *)(v23 + 128);
          v143 = v22;
          uint64_t v26 = [MEMORY[0x1E4F30C58] poolingLayer:v38 error:&v143];
          unsigned int v27 = v143;
          break;
        case 0x82:
          CoreML::Specification::ActivationParams::ActivationParams((CoreML::Specification::ActivationParams *)v138, *(const CoreML::Specification::ActivationParams **)(v23 + 128));
          if (v139 == 10)
          {
            uint64_t v96 = [MEMORY[0x1E4F30BC8] relu];
          }
          else
          {
            if (v139 != 15)
            {
              if (v139 == 40)
              {
                uint64_t v29 = *(uint64_t **)(*(void *)(v23 + 56) + 8);
                if (*((char *)v29 + 23) < 0) {
                  uint64_t v29 = (uint64_t *)*v29;
                }
                uint64_t v30 = [NSString stringWithUTF8String:v29];
                if ([v126 containsObject:v30]
                  && [(MLNeuralNetworkMLComputeGraph *)self layerFusedToLoss])
                {
                  BOOL v31 = *(uint64_t **)(*(void *)(v23 + 32) + 8);
                  if (*((char *)v31 + 23) < 0) {
                    BOOL v31 = (uint64_t *)*v31;
                  }
                  v32 = [NSString stringWithUTF8String:v31];
                  [(MLNeuralNetworkMLComputeGraph *)self setFusedLayerInputName:v32];

                  CoreML::Specification::ActivationParams::~ActivationParams((CoreML::Specification::ActivationParams *)v138);
                  goto LABEL_114;
                }
                uint64_t v26 = [MEMORY[0x1E4F30BC8] sigmoid];
              }
              else if (a6)
              {
                +[MLModelErrorUtils updateErrorWithFormat:@"activation: %u not supported", *(unsigned int *)(v23 + 140)];
                uint64_t v26 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v26 = 0;
              }
              goto LABEL_132;
            }
            uint64_t v96 = [MEMORY[0x1E4F30BC8] leakyRelu];
          }
          uint64_t v26 = v96;
LABEL_132:
          CoreML::Specification::ActivationParams::~ActivationParams((CoreML::Specification::ActivationParams *)v138);
          goto LABEL_66;
        default:
          goto LABEL_161;
      }
      goto LABEL_65;
    }
    if ((int)v24 <= 174)
    {
      if (v24 == 140)
      {
        uint64_t v36 = *(void *)(v23 + 128);
        v146 = v22;
        uint64_t v26 = [MEMORY[0x1E4F30C00] innerProductLayer:v36 error:&v146];
        unsigned int v27 = v146;
      }
      else
      {
        if (v24 != 160) {
          goto LABEL_161;
        }
        uint64_t v25 = *(void *)(v23 + 128);
        v137 = v22;
        uint64_t v26 = [MEMORY[0x1E4F30BD8] batchNormLayer:v25 error:&v137];
        unsigned int v27 = v137;
      }
      goto LABEL_65;
    }
    if (v24 != 175)
    {
      if (v24 != 300) {
        goto LABEL_161;
      }
      uint64_t v34 = *(void *)(v23 + 128);
      v141 = v22;
      uint64_t v26 = [MEMORY[0x1E4F30C60] reshapeLayer:v34 batchSize:a4 error:&v141];
      unsigned int v27 = v141;
      goto LABEL_65;
    }
    uint64_t v40 = *(uint64_t **)(*(void *)(v23 + 56) + 8);
    if (*((char *)v40 + 23) < 0) {
      uint64_t v40 = (uint64_t *)*v40;
    }
    v41 = [NSString stringWithUTF8String:v40];
    if ([v126 containsObject:v41])
    {
      v42 = *(uint64_t **)(*(void *)(v23 + 32) + 8);
      if (*((char *)v42 + 23) < 0) {
        v42 = (uint64_t *)*v42;
      }
      v43 = [NSString stringWithUTF8String:v42];
      [(MLNeuralNetworkMLComputeGraph *)self setFusedLayerInputName:v43];

      goto LABEL_114;
    }
    uint64_t v26 = [MEMORY[0x1E4F30C70] softmax];

LABEL_66:
    v132 = (void *)v26;
    if (!v26)
    {
      if (!a6) {
        goto LABEL_169;
      }
      BOOL v110 = *(uint64_t **)(v23 + 112);
      if (*((char *)v110 + 23) < 0) {
        BOOL v110 = (uint64_t *)*v110;
      }
      uint64_t v109 = +[MLModelErrorUtils errorWithCode:6, v22, @"Layer: %s(%d) not supported.", v110, *(unsigned int *)(v23 + 140) underlyingError format];
      goto LABEL_151;
    }
    BOOL v47 = *(uint64_t **)(v23 + 112);
    if (*((char *)v47 + 23) < 0) {
      BOOL v47 = (uint64_t *)*v47;
    }
    v48 = [NSString stringWithUTF8String:v47];
    [v127 setObject:v132 forKeyedSubscript:v48];

    v128 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v49 = *(void *)(v23 + 32);
    if (v49) {
      uint64_t v50 = v49 + 8;
    }
    else {
      uint64_t v50 = 0;
    }
    uint64_t v129 = v23;
    uint64_t v51 = *(int *)(v23 + 24);
    BOOL v52 = v22;
    if (v51)
    {
      uint64_t v53 = 8 * v51;
      while (1)
      {
        v54 = objc_msgSend(NSString, "stringWithUTF8String:");
        v55 = [v130 objectForKeyedSubscript:v54];

        if (!v55) {
          break;
        }
        [v128 addObject:v55];

        v50 += 8;
        v53 -= 8;
        if (!v53) {
          goto LABEL_76;
        }
      }
      if (a6)
      {
        v97 = +[MLModelErrorUtils updateErrorWithFormat:@"Model Layers are not in topological order."];
        goto LABEL_135;
      }
      goto LABEL_136;
    }
LABEL_76:
    uint64_t v56 = [(MLNeuralNetworkMLComputeGraph *)self graph];
    uint64_t v57 = v129;
    uint64_t v58 = [v56 nodeWithLayer:v132 sources:v128 disableUpdate:*(unsigned char *)(v129 + 120) == 0];

    if (!v58)
    {
      if (a6)
      {
        v111 = *(uint64_t **)(v129 + 112);
        if (*((char *)v111 + 23) < 0) {
          v111 = (uint64_t *)*v111;
        }
        v97 = +[MLModelErrorUtils updateErrorWithFormat:@"Cannot attach %s(%d) to the training graph.", v111, *(unsigned int *)(v129 + 140)];
LABEL_135:
        *a6 = v97;
      }
LABEL_136:

      goto LABEL_169;
    }
    uint64_t v59 = [(MLNeuralNetworkMLComputeGraph *)self graph];
    BOOL v60 = [v59 resultTensorsForLayer:v132];

    int v61 = [v60 count];
    if (*(_DWORD *)(v129 + 48) != v61)
    {
      if (a6)
      {
        v112 = *(uint64_t **)(v129 + 112);
        if (*((char *)v112 + 23) < 0) {
          v112 = (uint64_t *)*v112;
        }
        v113 = [NSString stringWithUTF8String:v112];
        *a6 = +[MLModelErrorUtils updateErrorWithFormat:@"Number of Layer outputs does not match with its training layer for layer name: %@.", v113];
      }
      goto LABEL_136;
    }
    v124 = v20;
    if (v61 >= 1)
    {
      uint64_t v62 = 0;
      uint64_t v63 = v61;
      do
      {
        uint64_t v64 = *(uint64_t **)(*(void *)(v129 + 56) + 8 * v62 + 8);
        if (*((char *)v64 + 23) < 0) {
          uint64_t v64 = (uint64_t *)*v64;
        }
        uint64_t v65 = [NSString stringWithUTF8String:v64];
        uint64_t v66 = [v60 objectAtIndexedSubscript:v62];
        [v66 setLabel:v65];

        BOOL v67 = [v60 objectAtIndexedSubscript:v62];
        [v130 setObject:v67 forKeyedSubscript:v65];

        ++v62;
      }
      while (v63 != v62);
    }
    uint64_t v68 = v125[7];
    if (v68) {
      v69 = (uint64_t *)(v68 + 8);
    }
    else {
      v69 = 0;
    }
    uint64_t v70 = *((int *)v125 + 12);
    if (v70)
    {
      uint64_t v71 = &v69[v70];
      do
      {
        uint64_t v72 = *(void *)(v57 + 56);
        if (v72) {
          BOOL v73 = (const void ***)(v72 + 8);
        }
        else {
          BOOL v73 = 0;
        }
        uint64_t v74 = *(int *)(v57 + 48);
        if (v74)
        {
          uint64_t v75 = *v69;
          uint64_t v76 = 8 * v74;
          do
          {
            uint64_t v77 = *(const void ***)(v75 + 16);
            if (*((char *)v77 + 23) < 0)
            {
              uint64_t v77 = (const void **)*v77;
              size_t v78 = *(void *)(*(void *)(v75 + 16) + 8);
            }
            else
            {
              size_t v78 = *((unsigned __int8 *)v77 + 23);
            }
            int v79 = *((char *)*v73 + 23);
            if (v79 >= 0) {
              size_t v80 = *((unsigned __int8 *)*v73 + 23);
            }
            else {
              size_t v80 = (size_t)(*v73)[1];
            }
            if (v79 >= 0) {
              v81 = *v73;
            }
            else {
              v81 = **v73;
            }
            if (v80 >= v78) {
              size_t v82 = v78;
            }
            else {
              size_t v82 = v80;
            }
            BOOL v83 = !memcmp(v77, v81, v82) && v80 == v78;
            BOOL v22 = v52;
            if (v83)
            {
              uint64_t v84 = [NSString stringWithUTF8String:v81];
              [v131 setObject:v132 forKeyedSubscript:v84];
            }
            ++v73;
            v76 -= 8;
          }
          while (v76);
        }
        ++v69;
        uint64_t v57 = v129;
      }
      while (v69 != v71);
    }

    self = v121;
    a6 = v122;
    uint64_t v16 = v120;
    uint64_t v20 = v124;
LABEL_114:
    if (++v20 == v123) {
      goto LABEL_138;
    }
  }
  if ((int)v24 <= 984)
  {
    switch(v24)
    {
      case 0x12D:
        BOOL v85 = *(uint64_t **)(*(void *)(v23 + 32) + 8);
        if (*((char *)v85 + 23) < 0) {
          BOOL v85 = (uint64_t *)*v85;
        }
        v86 = [NSString stringWithUTF8String:v85];
        v87 = (void *)MEMORY[0x1E4F30C60];
        v88 = [v130 objectForKeyedSubscript:v86];
        uint64_t v89 = v88;
        uint64_t v90 = v20;
        if (*(_DWORD *)(v23 + 140) == 301)
        {
          BOOL v91 = *(uint64_t **)(v23 + 128);
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v88);
          BOOL v91 = &CoreML::Specification::_FlattenLayerParams_default_instance_;
        }
        id v142 = v22;
        uint64_t v92 = [v87 flattenLayerWithTensor:v89 flattenParams:v91 batchSize:a4 error:&v142];
        id v93 = v142;

        BOOL v22 = v93;
        uint64_t v20 = v90;
        goto LABEL_124;
      case 0x1A4:
        uint64_t v39 = *(void *)(v23 + 128);
        v144 = v22;
        uint64_t v26 = [MEMORY[0x1E4F30C20] uniDirectionalLSTMLayer:v39 error:&v144];
        unsigned int v27 = v144;
        break;
      case 0x3D4:
        uint64_t v33 = *(void *)(v23 + 128);
        v135 = v22;
        uint64_t v26 = [MEMORY[0x1E4F30BE0] concatNDLayer:v33 error:&v135];
        unsigned int v27 = v135;
        break;
      default:
        goto LABEL_161;
    }
    goto LABEL_65;
  }
  if ((int)v24 > 1139)
  {
    if (v24 == 1140)
    {
      uint64_t v44 = *(void *)(v23 + 128);
      v140 = v22;
      uint64_t v26 = [MEMORY[0x1E4F30C60] reshapeStaticLayer:v44 batchSize:a4 error:&v140];
      unsigned int v27 = v140;
    }
    else
    {
      if (v24 != 1460)
      {
LABEL_161:
        if (!a6) {
          goto LABEL_169;
        }
        uint64_t v114 = *(uint64_t **)(v23 + 112);
        if (*((char *)v114 + 23) < 0) {
          uint64_t v114 = (uint64_t *)*v114;
        }
        uint64_t v109 = +[MLModelErrorUtils updateErrorWithFormat:@"Layer: %s(%d) not supported.", v114, v24];
        goto LABEL_151;
      }
      uint64_t v35 = *(void *)(v23 + 128);
      v136 = v22;
      uint64_t v26 = [MEMORY[0x1E4F30BC8] clampedReluLayer:v35 error:&v136];
      unsigned int v27 = v136;
    }
    goto LABEL_65;
  }
  if (v24 == 985)
  {
    uint64_t v37 = *(void *)(v23 + 128);
    v134 = v22;
    uint64_t v26 = [MEMORY[0x1E4F30C98] transposeLayer:v37 error:&v134];
    unsigned int v27 = v134;
LABEL_65:
    id v46 = v27;

    BOOL v22 = v46;
    goto LABEL_66;
  }
  if (v24 != 1045) {
    goto LABEL_161;
  }
  int v28 = *(_DWORD *)(v23 + 24);
  if (v28 == 1)
  {
    uint64_t v94 = *(void *)(v23 + 128);
    id v133 = v22;
    uint64_t v92 = [MEMORY[0x1E4F30C00] innerProductLayerWithBatchedMatMulParams:v94 error:&v133];
    id v95 = v133;

    BOOL v22 = v95;
LABEL_124:
    uint64_t v26 = v92;
    goto LABEL_66;
  }
  if (v28 == 2)
  {
    uint64_t v26 = [MEMORY[0x1E4F30C40] matrixMultiplicationLayerUsingParameters:*(void *)(v23 + 128)];
    goto LABEL_66;
  }
  if (!a6) {
    goto LABEL_169;
  }
  uint64_t v115 = *(uint64_t **)(v23 + 112);
  if (*((char *)v115 + 23) < 0) {
    uint64_t v115 = (uint64_t *)*v115;
  }
  uint64_t v109 = +[MLModelErrorUtils updateErrorWithFormat:@"Layer: %s(%d) input size is neither 1 nor 2.", v115, 1045];
LABEL_151:
  BOOL v108 = 0;
  *a6 = v109;
LABEL_170:

  return v108;
}

- (id)buildInferenceGraph:(id)a3 updateParams:(const void *)a4 layers:(const void *)a5 mlcTensorByName:(id)a6 outputNameToLayerMap:(id)a7 error:(id *)a8
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v50 = a6;
  id obj = a7;
  id v49 = a7;
  uint64_t v14 = (void *)MEMORY[0x1E4F30C10];
  BOOL v47 = v13;
  v55[0] = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  uint64_t v51 = [v14 graphWithGraphObjects:v15];

  if (v51)
  {
    BOOL v52 = [(MLNeuralNetworkMLComputeGraph *)self lossInputsFromUpdateParams:a4];
    uint64_t v16 = *((void *)a5 + 2);
    if (v16) {
      int v17 = (uint64_t *)(v16 + 8);
    }
    else {
      int v17 = 0;
    }
    uint64_t v18 = *((int *)a5 + 2);
    if (v18)
    {
      uint64_t v19 = 8 * v18;
      do
      {
        uint64_t v20 = *v17;
        int v21 = *(_DWORD *)(*v17 + 140);
        if (v21 == 130)
        {
          CoreML::Specification::ActivationParams::ActivationParams((CoreML::Specification::ActivationParams *)v53, *(const CoreML::Specification::ActivationParams **)(v20 + 128));
          if (v54 == 40)
          {
            v32 = *(uint64_t **)(*(void *)(v20 + 56) + 8);
            if (*((char *)v32 + 23) < 0) {
              v32 = (uint64_t *)*v32;
            }
            uint64_t v33 = [NSString stringWithUTF8String:v32];
            if ([v52 containsObject:v33]
              && [(MLNeuralNetworkMLComputeGraph *)self layerFusedToLoss])
            {
              uint64_t v34 = +[MLNeuralNetworkMLComputeLayer sigmoid];
              uint64_t v35 = *(uint64_t **)(*(void *)(v20 + 32) + 8);
              if (*((char *)v35 + 23) < 0) {
                uint64_t v35 = (uint64_t *)*v35;
              }
              uint64_t v36 = [NSString stringWithUTF8String:v35];
              uint64_t v37 = [v50 objectForKeyedSubscript:v36];
              uint64_t v38 = [v51 nodeWithLayer:v34 source:v37];

              uint64_t v39 = [(MLNeuralNetworkMLComputeGraph *)self modelDescription];
              uint64_t v40 = [v39 predictedFeatureName];
              [v38 setLabel:v40];

              v41 = [v38 label];
              [v49 setObject:v34 forKeyedSubscript:v41];

              [(MLNeuralNetworkMLComputeGraph *)self setClassifierOutputIsSigmoidOutput:1];
            }
          }
          CoreML::Specification::ActivationParams::~ActivationParams((CoreML::Specification::ActivationParams *)v53);
        }
        else if (v21 == 175)
        {
          BOOL v22 = *(uint64_t **)(*(void *)(v20 + 56) + 8);
          if (*((char *)v22 + 23) < 0) {
            BOOL v22 = (uint64_t *)*v22;
          }
          uint64_t v23 = [NSString stringWithUTF8String:v22];
          if ([v52 containsObject:v23])
          {
            uint64_t v24 = [MEMORY[0x1E4F30C70] softmax];
            uint64_t v25 = *(uint64_t **)(*(void *)(v20 + 32) + 8);
            if (*((char *)v25 + 23) < 0) {
              uint64_t v25 = (uint64_t *)*v25;
            }
            uint64_t v26 = [NSString stringWithUTF8String:v25];
            unsigned int v27 = [v50 objectForKeyedSubscript:v26];
            int v28 = [v51 nodeWithLayer:v24 source:v27];

            uint64_t v29 = [(MLNeuralNetworkMLComputeGraph *)self modelDescription];
            uint64_t v30 = [v29 predictedFeatureName];
            [v28 setLabel:v30];

            BOOL v31 = [v28 label];
            [v49 setObject:v24 forKeyedSubscript:v31];
          }
        }
        ++v17;
        v19 -= 8;
      }
      while (v19);
    }
    v42 = [(MLNeuralNetworkMLComputeGraph *)self mlcInputs];
    char v43 = [v51 addInputs:v42];

    if (v43)
    {
      objc_storeStrong((id *)&self->_outputNameToLayerMap, obj);
      id v44 = v51;
    }
    else if (a8)
    {
      +[MLModelErrorUtils updateErrorWithFormat:@"Failed to add inputs to inference graph"];
      id v44 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v44 = 0;
    }
  }
  else if (a8)
  {
    +[MLModelErrorUtils updateErrorWithFormat:@"Failed to create a inference graph."];
    id v44 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v44 = 0;
  }

  return v44;
}

- (id)buildTrainingGraphFrom:(id)a3 updateParams:(const void *)a4 numberOfClasses:(unint64_t)a5 mlcTensorByName:(id)a6 error:(id *)a7
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v56 = a6;
  uint64_t v58 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  uint64_t v10 = *((void *)a4 + 4);
  if (v10) {
    int v11 = (uint64_t *)(v10 + 8);
  }
  else {
    int v11 = 0;
  }
  uint64_t v12 = a4;
  uint64_t v13 = *((int *)a4 + 6);
  if (!v13)
  {
LABEL_16:
    if (![v58 count])
    {
      if (!a7) {
        goto LABEL_32;
      }
      id v28 = +[MLModelErrorUtils updateErrorWithFormat:@"Loss layer is not provided."];
LABEL_78:
      id v29 = 0;
      *a7 = v28;
      goto LABEL_79;
    }
    uint64_t v23 = (uint64_t *)*((void *)v12 + 5);
    if (!v23) {
      uint64_t v23 = &CoreML::Specification::_Optimizer_default_instance_;
    }
    int v24 = *((_DWORD *)v23 + 7);
    if (v24 == 10)
    {
      uint64_t v30 = (uint64_t *)v23[2];
      uint64_t v59 = &unk_1EF0CF738;
      unint64_t v60 = 0;
      DWORD2(v62) = 0;
      uint64_t v31 = v30[1];
      uint64_t v25 = self;
      if (v31) {
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v60, v31 & 0xFFFFFFFFFFFFFFFELL);
      }
      if (v30 == &CoreML::Specification::_SGDOptimizer_default_instance_)
      {
        long long v61 = 0uLL;
      }
      else
      {
        if (v30[2]) {
          operator new();
        }
        *(void *)&long long v61 = 0;
        if (v30[3]) {
          operator new();
        }
        *((void *)&v61 + 1) = 0;
        if (v30[4]) {
          operator new();
        }
      }
      *(void *)&long long v62 = 0;
      v32 = (uint64_t *)v61;
      if (!(void)v61) {
        v32 = &CoreML::Specification::_DoubleParameter_default_instance_;
      }
      uint64_t v33 = +[MLNeuralNetworkMLComputeLayer sgdOptimizerWithLearningRate:*((double *)v32 + 2) momentum:unk_1EB4DEC68];
      CoreML::Specification::SGDOptimizer::~SGDOptimizer((CoreML::Specification::SGDOptimizer *)&v59);
      if (!v33) {
        goto LABEL_74;
      }
    }
    else
    {
      uint64_t v25 = self;
      if (v24 != 11) {
        goto LABEL_74;
      }
      uint64_t v26 = (uint64_t *)v23[2];
      uint64_t v59 = &unk_1EF0CFB60;
      unint64_t v60 = 0;
      int v64 = 0;
      uint64_t v27 = v26[1];
      if (v27) {
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v60, v27 & 0xFFFFFFFFFFFFFFFELL);
      }
      if (v26 == &CoreML::Specification::_AdamOptimizer_default_instance_)
      {
        long long v62 = 0u;
        long long v61 = 0u;
      }
      else
      {
        if (v26[2]) {
          operator new();
        }
        *(void *)&long long v61 = 0;
        if (v26[3]) {
          operator new();
        }
        *((void *)&v61 + 1) = 0;
        if (v26[4]) {
          operator new();
        }
        *(void *)&long long v62 = 0;
        if (v26[5]) {
          operator new();
        }
        *((void *)&v62 + 1) = 0;
        if (v26[6]) {
          operator new();
        }
      }
      uint64_t v63 = 0;
      id v49 = (uint64_t *)v61;
      if (!(void)v61) {
        id v49 = &CoreML::Specification::_DoubleParameter_default_instance_;
      }
      double v50 = *((double *)v49 + 2);
      uint64_t v51 = (void)v62 ? (uint64_t *)v62 : &CoreML::Specification::_DoubleParameter_default_instance_;
      uint64_t v33 = +[MLNeuralNetworkMLComputeLayer adamOptimizerWithLearningRate:1 beta1:v50 beta2:*((double *)v51 + 2) epsilon:unk_1EB4DEC68 timeStep:unk_1EB4DEC68];
      CoreML::Specification::AdamOptimizer::~AdamOptimizer((CoreML::Specification::AdamOptimizer *)&v59);
      if (!v33)
      {
LABEL_74:
        if (!a7) {
          goto LABEL_32;
        }
        BOOL v52 = (uint64_t *)*((void *)v12 + 5);
        if (!v52) {
          BOOL v52 = &CoreML::Specification::_Optimizer_default_instance_;
        }
        id v28 = +[MLModelErrorUtils updateErrorWithFormat:@"%u optimizer type is not supported.", *((unsigned int *)v52 + 7)];
        goto LABEL_78;
      }
    }
    uint64_t v34 = (void *)MEMORY[0x1E4F30C90];
    v66[0] = v55;
    uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
    uint64_t v36 = [v34 graphWithGraphObjects:v35 lossLayer:0 optimizer:v33];

    uint64_t v37 = [(MLNeuralNetworkMLComputeGraph *)v25 fusedLayerInputName];
    LOBYTE(v35) = v37 == 0;

    if (v35)
    {
      uint64_t v39 = [v58 allKeys];
      uint64_t v38 = [v39 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v38 = [(MLNeuralNetworkMLComputeGraph *)v25 fusedLayerInputName];
    }
    uint64_t v40 = [v58 allValues];
    v41 = [v40 objectAtIndexedSubscript:0];
    v42 = [v56 objectForKeyedSubscript:v38];
    uint64_t v65 = v42;
    char v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    id v44 = (id)[v36 nodeWithLayer:v41 sources:v43];

    if (v36)
    {
      uint64_t v45 = [(MLNeuralNetworkMLComputeGraph *)v25 mlcInputs];
      id v46 = [(MLNeuralNetworkMLComputeGraph *)v25 mlcLabels];
      char v47 = [v36 addInputs:v45 lossLabels:v46];

      if (v47)
      {
        id v29 = v36;
LABEL_65:

        goto LABEL_79;
      }
      if (a7)
      {
        id v48 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to add training inputs to training graph"];
        goto LABEL_63;
      }
    }
    else if (a7)
    {
      id v48 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to create a training graph."];
LABEL_63:
      id v29 = 0;
      *a7 = v48;
      goto LABEL_65;
    }
    id v29 = 0;
    goto LABEL_65;
  }
  uint64_t v14 = 8 * v13;
  while (1)
  {
    uint64_t v15 = *v11;
    int v16 = *(_DWORD *)(*v11 + 36);
    if (v16 != 10) {
      break;
    }
    uint64_t v20 = *(uint64_t **)(*(void *)(v15 + 24) + 16);
    if (*((char *)v20 + 23) < 0) {
      uint64_t v20 = (uint64_t *)*v20;
    }
    uint64_t v18 = [NSString stringWithUTF8String:v20];
    uint64_t v19 = [MEMORY[0x1E4F30C30] categoricalCrossEntropyWithLossLayerParams:v15 numberOfClasses:a5];
LABEL_14:
    int v21 = (void *)v19;
    BOOL v22 = v18;
    if (!v19) {
      goto LABEL_29;
    }
    [v58 setObject:v19 forKeyedSubscript:v18];

    ++v11;
    v14 -= 8;
    if (!v14) {
      goto LABEL_16;
    }
  }
  if (v16 == 11)
  {
    int v17 = *(uint64_t **)(*(void *)(v15 + 24) + 16);
    if (*((char *)v17 + 23) < 0) {
      int v17 = (uint64_t *)*v17;
    }
    uint64_t v18 = [NSString stringWithUTF8String:v17];
    uint64_t v19 = [MEMORY[0x1E4F30C30] meanSquaredErrorWithLossLayerParams:v15];
    goto LABEL_14;
  }
  BOOL v22 = 0;
LABEL_29:
  if (a7)
  {
    *a7 = +[MLModelErrorUtils updateErrorWithFormat:@"%u loss layer type is not supported.", *(unsigned int *)(v15 + 36)];
  }

LABEL_32:
  id v29 = 0;
LABEL_79:

  return v29;
}

- (id)lossInputsFromUpdateParams:(const void *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = *((void *)a3 + 4);
  if (v6) {
    uint64_t v7 = (uint64_t *)(v6 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *((int *)a3 + 6);
  if (v8)
  {
    uint64_t v9 = 8 * v8;
    do
    {
      uint64_t v10 = *v7;
      int v11 = *(_DWORD *)(*v7 + 36);
      if (v11 == 10)
      {
        uint64_t v14 = *(uint64_t **)(*(void *)(v10 + 24) + 16);
        if (*((char *)v14 + 23) < 0) {
          uint64_t v14 = (uint64_t *)*v14;
        }
        uint64_t v15 = [NSString stringWithUTF8String:v14];
        [v5 addObject:v15];

        [(MLNeuralNetworkMLComputeGraph *)self setLayerFusedToLoss:1];
      }
      else if (v11 == 11)
      {
        uint64_t v12 = *(uint64_t **)(*(void *)(v10 + 24) + 16);
        if (*((char *)v12 + 23) < 0) {
          uint64_t v12 = (uint64_t *)*v12;
        }
        uint64_t v13 = [NSString stringWithUTF8String:v12];
        [v5 addObject:v13];
      }
      ++v7;
      v9 -= 8;
    }
    while (v9);
  }

  return v5;
}

- (MLNeuralNetworkMLComputeGraph)initWithCompiledArchive:(void *)a3 modelDescription:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 computeUnits:(int64_t)a7 error:(id *)a8
{
  id v14 = a4;
  std::string::basic_string[abi:ne180100]<0>(&v44, "entireSpec");
  char hasNestedArchive = IArchive::hasNestedArchive(a3, &v44);
  char v16 = hasNestedArchive;
  if ((SHIBYTE(v46) & 0x80000000) == 0)
  {
    if (hasNestedArchive) {
      goto LABEL_3;
    }
LABEL_8:
    if (a8)
    {
      +[MLModelErrorUtils IOErrorWithFormat:@"The model cannot be updated. Try recompiling the model as the archive does not exist."];
      int v21 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v21 = 0;
    }
    goto LABEL_28;
  }
  operator delete(v44);
  if ((v16 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)v31);
  std::string::basic_string[abi:ne180100]<0>(&v44, "entireSpec");
  int v17 = IArchive::nestedArchive(a3, (uint64_t)&v44);
  if (SHIBYTE(v46) < 0) {
    operator delete(v44);
  }
  uint64_t v18 = (*(uint64_t (**)(void))(**(void **)(*(void *)v17 + 32) + 16))(*(void *)(*(void *)v17 + 32));
  id v44 = &unk_1EF0DB2F8;
  uint64_t v45 = &unk_1EF0DB2C8;
  uint64_t v46 = v18;
  v47[0] = &unk_1EF0DB3A8;
  v47[1] = &v45;
  __int16 v48 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v52 = 0;
  int v51 = 0x2000;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v44;
  *(void *)uint64_t v37 = 0;
  *(void *)((char *)&v37[1] + 2) = 0;
  uint64_t v38 = 0x7FFFFFFFLL;
  uint64_t v39 = 0x647FFFFFFFLL;
  int v40 = 100;
  char v41 = 1;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v34);
  LODWORD(v39) = 0x7FFFFFFF;
  uint64_t v19 = v35 + SHIDWORD(v38);
  uint64_t v35 = v19;
  int v20 = v37[0] - v38;
  if (v37[0] <= (int)v38) {
    int v20 = 0;
  }
  else {
    uint64_t v35 = v19 - v20;
  }
  HIDWORD(v38) = v20;
  if (google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)v31, (google::protobuf::io::CodedInputStream *)&v34))
  {
    CoreML::Result::Result((CoreML::Result *)v29);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v29[0] = 5;
    std::operator+<char>();
    if (v33 < 0) {
      operator delete(__p);
    }
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v34);
  id v44 = &unk_1EF0DB2F8;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v47);
  if ((v29[0] & 0xFFFFFFEF) == 0)
  {
    [(MLNeuralNetworkMLComputeGraph *)self setModelDescription:v14];
    [(MLNeuralNetworkMLComputeGraph *)self setExecutionOptions:2];
    BOOL v22 = [(MLNeuralNetworkMLComputeGraph *)self inputTensorMapWithBatchSize:a5 numberOfClasses:a6 error:a8];
    [(MLNeuralNetworkMLComputeGraph *)self setMlcInputs:v22];

    uint64_t v23 = [(MLNeuralNetworkMLComputeGraph *)self mlcInputs];

    if (v23)
    {
      int v24 = [(MLNeuralNetworkMLComputeGraph *)self labelTensorMapWithBatchSize:a5 numberOfClasses:a6 error:a8];
      [(MLNeuralNetworkMLComputeGraph *)self setMlcLabels:v24];

      uint64_t v25 = [(MLNeuralNetworkMLComputeGraph *)self mlcLabels];

      if (v25)
      {
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F30BF8], "deviceWithType:", -[MLNeuralNetworkMLComputeGraph mlcDeviceTypeForComputeUnit:](self, "mlcDeviceTypeForComputeUnit:", a7));
        [(MLNeuralNetworkMLComputeGraph *)self setDevice:v26];

        uint64_t v27 = [(MLNeuralNetworkMLComputeGraph *)self device];

        if (v27)
        {
          if ([(MLNeuralNetworkMLComputeGraph *)self buildGraphsFor:v31 batchSize:a5 numberOfClasses:a6 error:a8])
          {
            int v21 = self;
            goto LABEL_25;
          }
        }
      }
    }
LABEL_24:
    int v21 = 0;
    goto LABEL_25;
  }
  if (!a8) {
    goto LABEL_24;
  }
  +[MLModelErrorUtils IOErrorWithFormat:@"Failed to unarchive entire spec."];
  int v21 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
  if (v30 < 0) {
    operator delete((void *)v29[1]);
  }
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)v31);
LABEL_28:

  return v21;
}

- (id)labelTensorMapWithBatchSize:(unint64_t)a3 numberOfClasses:(unint64_t)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [(MLNeuralNetworkMLComputeGraph *)self modelDescription];
  uint64_t v8 = [v7 trainingInputDescriptionsByName];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = [(MLNeuralNetworkMLComputeGraph *)self modelDescription];
        id v14 = [v13 inputDescriptionsByName];
        uint64_t v15 = [v14 objectForKeyedSubscript:v12];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          int v17 = [(MLNeuralNetworkMLComputeGraph *)self modelDescription];
          uint64_t v18 = [(MLNeuralNetworkMLComputeGraph *)self buildMLComputeTensorDescriptorWith:v17 featureName:v12 batchSize:a3 numberOfClasses:a4 error:a5];

          if (!v18) {
            goto LABEL_16;
          }
          uint64_t v19 = [MEMORY[0x1E4F30C78] tensorWithDescriptor:v18];
          int v20 = v19;
          if (!v19)
          {
            if (a5)
            {
              *a5 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to create the input tensor."];
            }

LABEL_16:
            id v22 = 0;
            int v21 = v25;
            goto LABEL_17;
          }
          [v19 setLabel:v12];
          [v25 setObject:v20 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  int v21 = v25;
  id v22 = v25;
LABEL_17:

  return v22;
}

- (id)inputTensorMapWithBatchSize:(unint64_t)a3 numberOfClasses:(unint64_t)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [(MLNeuralNetworkMLComputeGraph *)self modelDescription];
  uint64_t v10 = [v9 inputDescriptionsByName];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    id obj = v10;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = [(MLNeuralNetworkMLComputeGraph *)self modelDescription];
        BOOL v16 = [(MLNeuralNetworkMLComputeGraph *)self buildMLComputeTensorDescriptorWith:v15 featureName:v14 batchSize:a3 numberOfClasses:a4 error:a5];

        if (!v16) {
          goto LABEL_14;
        }
        int v17 = [MEMORY[0x1E4F30C78] tensorWithDescriptor:v16];
        uint64_t v18 = v17;
        if (!v17)
        {
          if (a5)
          {
            *a5 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to create the input tensor."];
          }

LABEL_14:
          id v20 = 0;
          uint64_t v19 = v23;
          goto LABEL_15;
        }
        [v17 setLabel:v14];
        [v23 setObject:v18 forKeyedSubscript:v14];
      }
      uint64_t v10 = obj;
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = v23;
  id v20 = v23;
LABEL_15:

  return v20;
}

+ (id)graphFromCompiledArchive:(void *)a3 modelDescription:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 computeUnits:(int64_t)a7 error:(id *)a8
{
  id v13 = a4;
  uint64_t v14 = [[MLNeuralNetworkMLComputeGraph alloc] initWithCompiledArchive:a3 modelDescription:v13 batchSize:a5 numberOfClasses:a6 computeUnits:a7 error:a8];

  return v14;
}

@end