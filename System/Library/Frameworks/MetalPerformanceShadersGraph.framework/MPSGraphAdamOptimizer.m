@interface MPSGraphAdamOptimizer
- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 momentumTensors:(id)a5 velocityTensors:(id)a6 maximumVelocityTensors:(id)a7 beta1:(float)a8 beta2:(float)a9 epsilon:(float)a10 iterations:(unint64_t)a11 trainableVariables:(id)a12 variablesToGradientTensorMap:(id)a13 name:(id)a14;
- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7;
- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 beta1:(float)a6 beta2:(float)a7 epsilon:(float)a8 iterations:(unint64_t)a9 trainableVariables:(id)a10 name:(id)a11;
- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 momentumTensors:(id)a6 velocityTensors:(id)a7 maximumVelocityTensors:(id)a8 beta1:(float)a9 beta2:(float)a10 epsilon:(float)a11 iterations:(unint64_t)a12 trainableVariables:(id)a13 name:(id)a14;
- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 trainableVariables:(id)a6 name:(id)a7;
@end

@implementation MPSGraphAdamOptimizer

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 momentumTensors:(id)a5 velocityTensors:(id)a6 maximumVelocityTensors:(id)a7 beta1:(float)a8 beta2:(float)a9 epsilon:(float)a10 iterations:(unint64_t)a11 trainableVariables:(id)a12 variablesToGradientTensorMap:(id)a13 name:(id)a14
{
  id v23 = a3;
  id v24 = a4;
  id v83 = a5;
  id v82 = a6;
  id v81 = a7;
  v95.receiver = self;
  v95.super_class = (Class)MPSGraphAdamOptimizer;
  id v78 = a12;
  v79 = v23;
  v85 = v24;
  id v80 = a13;
  id v77 = a14;
  v25 = -[MPSGraphOptimizer initWithGraph:learningRateTensor:trainableVariables:variablesToGradientTensorMap:name:](&v95, sel_initWithGraph_learningRateTensor_trainableVariables_variablesToGradientTensorMap_name_, v23, v24, v78, v80);
  uint64_t v26 = [(MPSGraph *)v25->super._graph constantWithScalar:&unk_1EC9F1EB0 shape:268435488 dataType:a8];
  beta1Tensor = v25->_beta1Tensor;
  v25->_beta1Tensor = (MPSGraphTensor *)v26;

  uint64_t v28 = [(MPSGraph *)v25->super._graph constantWithScalar:&unk_1EC9F1EC8 shape:268435488 dataType:a9];
  beta2Tensor = v25->_beta2Tensor;
  v25->_beta2Tensor = (MPSGraphTensor *)v28;

  uint64_t v30 = [(MPSGraph *)v25->super._graph constantWithScalar:&unk_1EC9F1EE0 shape:268435488 dataType:a10];
  epsilonTensor = v25->_epsilonTensor;
  v25->_epsilonTensor = (MPSGraphTensor *)v30;

  graph = v25->super._graph;
  v33 = +[MPSGraphVariableInitializer initializerWithConstant:(double)a11];
  v34 = [v33 initializedDataWithNumberOfValues:1 dataType:268435488];
  v35 = [(NSString *)v25->super._name stringByAppendingFormat:@"/iterations"];
  v36 = [(MPSGraph *)graph variableWithData:v34 shape:&unk_1EC9F1EF8 dataType:268435488 name:v35];
  uint64_t v37 = [v36 operation];
  iterationsVariable = v25->_iterationsVariable;
  v25->_iterationsVariable = (MPSGraphVariableOp *)v37;

  v76 = [MEMORY[0x1E4F1CA60] dictionary];
  v39 = [(MPSGraphOperation *)v25->_iterationsVariable outputTensors];
  uint64_t v40 = [v39 objectAtIndexedSubscript:0];

  v75 = (void *)v40;
  uint64_t v41 = [(MPSGraph *)v25->super._graph constantWithScalar:&unk_1EC9F1F10 shape:268435488 dataType:1.0];
  v42 = v25->super._graph;
  v74 = (void *)v41;
  v43 = [(NSString *)v25->super._name stringByAppendingString:@"/iterations_add1"];
  uint64_t v44 = [(MPSGraph *)v42 additionWithPrimaryTensor:v40 secondaryTensor:v41 name:v43];

  v45 = v25->super._graph;
  v73 = (void *)v44;
  v46 = [(NSString *)v25->super._name stringByAppendingString:@"/iterations_add1_assign"];
  v72 = [(MPSGraph *)v45 assignVariable:v40 withValueOfTensor:v44 name:v46];

  v47 = [(NSString *)v25->super._name stringByAppendingString:@"/learningRateUpdate"];
  v48 = v25->super._graph;
  v49 = v25->_beta1Tensor;
  v71 = v47;
  v50 = [v47 stringByAppendingString:@"/beta1Power"];
  v84 = [(MPSGraph *)v48 powerWithPrimaryTensor:v49 secondaryTensor:v40 name:v50];

  v51 = v25->super._graph;
  v52 = v25->_beta2Tensor;
  v53 = [v47 stringByAppendingString:@"/beta2Power"];
  uint64_t v54 = [(MPSGraph *)v51 powerWithPrimaryTensor:v52 secondaryTensor:v40 name:v53];

  v70 = (void *)v54;
  v55 = [(MPSGraph *)v25->super._graph currentLearningRateWithLearningRateTensor:v24 beta1Tensor:v25->_beta1Tensor beta2Tensor:v25->_beta2Tensor beta1PowerTensor:v84 beta2PowerTensor:v54 name:v47];
  trainableVariables = v25->super._trainableVariables;
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __197__MPSGraphAdamOptimizer_initWithGraph_learningRateTensor_momentumTensors_velocityTensors_maximumVelocityTensors_beta1_beta2_epsilon_iterations_trainableVariables_variablesToGradientTensorMap_name___block_invoke;
  v86[3] = &unk_1E4FC1620;
  id v57 = v80;
  id v87 = v57;
  v58 = v25;
  v88 = v58;
  id v59 = v83;
  id v89 = v59;
  id v60 = v82;
  id v90 = v60;
  id v61 = v81;
  id v91 = v61;
  id v62 = v55;
  id v92 = v62;
  id v63 = v72;
  id v93 = v63;
  id v64 = v76;
  id v94 = v64;
  [(NSArray *)trainableVariables enumerateObjectsUsingBlock:v86];
  uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v64];
  variablesToUpdateOpMap = v58->super._variablesToUpdateOpMap;
  v58->super._variablesToUpdateOpMap = (NSDictionary *)v65;

  v67 = v94;
  v68 = v58;

  return v68;
}

void __197__MPSGraphAdamOptimizer_initWithGraph_learningRateTensor_momentumTensors_velocityTensors_maximumVelocityTensors_beta1_beta2_epsilon_iterations_trainableVariables_variablesToGradientTensorMap_name___block_invoke(uint64_t a1, void *a2)
{
  id v48 = a2;
  v45 = [*(id *)(a1 + 32) objectForKeyedSubscript:v48];
  v3 = [v48 shape];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 1;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __197__MPSGraphAdamOptimizer_initWithGraph_learningRateTensor_momentumTensors_velocityTensors_maximumVelocityTensors_beta1_beta2_epsilon_iterations_trainableVariables_variablesToGradientTensorMap_name___block_invoke_2;
  v49[3] = &unk_1E4FC15F8;
  v49[4] = &v50;
  v43 = v3;
  [v3 enumerateObjectsUsingBlock:v49];
  v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v5 = +[MPSGraphVariableInitializer initializerWithZeros];
  v6 = [v5 initializedDataWithNumberOfValues:v51[3] dataType:268435488];
  v7 = [v48 shape];
  v8 = *(void **)(*(void *)(a1 + 40) + 48);
  v9 = [v48 name];
  v10 = [v8 stringByAppendingFormat:@"/%@/momentum", v9];
  v47 = [v4 variableWithData:v6 shape:v7 dataType:268435488 name:v10];

  v11 = *(void **)(a1 + 48);
  if (v11) {
    [v11 addObject:v47];
  }
  v12 = *(void **)(*(void *)(a1 + 40) + 8);
  v13 = +[MPSGraphVariableInitializer initializerWithZeros];
  v14 = [v13 initializedDataWithNumberOfValues:v51[3] dataType:268435488];
  v15 = [v48 shape];
  v16 = *(void **)(*(void *)(a1 + 40) + 48);
  v17 = [v48 name];
  v18 = [v16 stringByAppendingFormat:@"/%@/velocity", v17];
  v46 = [v12 variableWithData:v14 shape:v15 dataType:268435488 name:v18];

  v19 = *(void **)(a1 + 56);
  if (v19) {
    [v19 addObject:v46];
  }
  if (*(void *)(a1 + 64))
  {
    v20 = *(void **)(*(void *)(a1 + 40) + 8);
    v21 = +[MPSGraphVariableInitializer initializerWithZeros];
    v22 = [v21 initializedDataWithNumberOfValues:v51[3] dataType:268435488];
    id v23 = [v48 shape];
    id v24 = *(void **)(*(void *)(a1 + 40) + 48);
    v25 = [v48 name];
    uint64_t v26 = [v24 stringByAppendingFormat:@"/%@/maxVelocity", v25];
    uint64_t v27 = [v20 variableWithData:v22 shape:v23 dataType:268435488 name:v26];

    [*(id *)(a1 + 64) addObject:v27];
    uint64_t v28 = (void *)v27;
  }
  else
  {
    uint64_t v28 = 0;
  }
  v29 = *(void **)(a1 + 40);
  uint64_t v30 = (void *)v29[1];
  uint64_t v31 = v29[7];
  uint64_t v32 = *(void *)(a1 + 72);
  uint64_t v33 = v29[8];
  uint64_t v34 = v29[9];
  v42 = v28;
  uint64_t v41 = [v47 operation];
  uint64_t v44 = [v46 operation];
  uint64_t v35 = *(void *)(a1 + 64);
  if (v35)
  {
    v36 = [v28 operation];
  }
  else
  {
    v36 = 0;
  }
  uint64_t v37 = *(void **)(*(void *)(a1 + 40) + 48);
  v38 = [v48 name];
  v39 = [v37 stringByAppendingFormat:@"/%@/adamUpdate", v38];
  uint64_t v40 = [v30 applyAdamWithCurrentLearningRateTensor:v32 beta1Tensor:v31 beta2Tensor:v33 epsilonTensor:v34 variable:v48 momentumVariable:v41 velocityVariable:v44 maximumVelocityVariable:v36 gradientTensor:v45 name:v39];

  if (v35) {
  [v40[4] addObject:*(void *)(a1 + 80)];
  }
  [*(id *)(a1 + 88) setObject:v40 forKey:v48];

  _Block_object_dispose(&v50, 8);
}

void __197__MPSGraphAdamOptimizer_initWithGraph_learningRateTensor_momentumTensors_velocityTensors_maximumVelocityTensors_beta1_beta2_epsilon_iterations_trainableVariables_variablesToGradientTensorMap_name___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) *= [v3 integerValue];
}

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 momentumTensors:(id)a6 velocityTensors:(id)a7 maximumVelocityTensors:(id)a8 beta1:(float)a9 beta2:(float)a10 epsilon:(float)a11 iterations:(unint64_t)a12 trainableVariables:(id)a13 name:(id)a14
{
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  id v27 = a7;
  id v28 = a8;
  id v29 = a13;
  id v30 = a14;
  v37.receiver = self;
  v37.super_class = (Class)MPSGraphAdamOptimizer;
  uint64_t v31 = [(MPSGraphOptimizer *)&v37 initWithGraph:v23 lossTensor:v24 learningRateTensor:v25 trainableVariables:v29 name:v30];
  *(float *)&double v32 = a9;
  *(float *)&double v33 = a10;
  *(float *)&double v34 = a11;
  uint64_t v35 = [(MPSGraphAdamOptimizer *)v31 initWithGraph:v23 learningRateTensor:v25 momentumTensors:v26 velocityTensors:v27 maximumVelocityTensors:v28 beta1:a12 beta2:v32 epsilon:v33 iterations:v34 trainableVariables:v31->super._trainableVariables variablesToGradientTensorMap:v31->super._variablesToGradientTensorMap name:v30];

  return v35;
}

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 beta1:(float)a6 beta2:(float)a7 epsilon:(float)a8 iterations:(unint64_t)a9 trainableVariables:(id)a10 name:(id)a11
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a10;
  id v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)MPSGraphAdamOptimizer;
  id v25 = [(MPSGraphOptimizer *)&v31 initWithGraph:v20 lossTensor:v21 learningRateTensor:v22 trainableVariables:v23 name:v24];
  *(float *)&double v26 = a6;
  *(float *)&double v27 = a7;
  *(float *)&double v28 = a8;
  id v29 = [(MPSGraphAdamOptimizer *)v25 initWithGraph:v20 learningRateTensor:v22 momentumTensors:0 velocityTensors:0 maximumVelocityTensors:0 beta1:a9 beta2:v26 epsilon:v27 iterations:v28 trainableVariables:v25->super._trainableVariables variablesToGradientTensorMap:v25->super._variablesToGradientTensorMap name:v24];

  return v29;
}

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7
{
  LODWORD(v7) = 1063675494;
  LODWORD(v8) = 1065336439;
  LODWORD(v9) = 869711765;
  return [(MPSGraphAdamOptimizer *)self initWithGraph:a3 learningRateTensor:a4 momentumTensors:0 velocityTensors:0 maximumVelocityTensors:0 beta1:0 beta2:v7 epsilon:v8 iterations:v9 trainableVariables:a5 variablesToGradientTensorMap:a6 name:a7];
}

- (MPSGraphAdamOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 trainableVariables:(id)a6 name:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)MPSGraphAdamOptimizer;
  return [(MPSGraphOptimizer *)&v8 initWithGraph:a3 lossTensor:a4 learningRateTensor:a5 trainableVariables:a6 name:a7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationsVariable, 0);
  objc_storeStrong((id *)&self->_epsilonTensor, 0);
  objc_storeStrong((id *)&self->_beta2Tensor, 0);

  objc_storeStrong((id *)&self->_beta1Tensor, 0);
}

@end