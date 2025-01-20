@interface MPSGraphOptimizer
- (MPSGraphOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7;
- (MPSGraphOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 trainableVariables:(id)a6 name:(id)a7;
- (MPSGraphTensor)learningRateTensor;
- (NSArray)updateOperations;
- (NSDictionary)variablesToGradientTensorMap;
- (NSDictionary)variablesToUpdateOpMap;
@end

@implementation MPSGraphOptimizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_variablesToUpdateOpMap, 0);
  objc_storeStrong((id *)&self->_variablesToGradientTensorMap, 0);
  objc_storeStrong((id *)&self->_trainableVariables, 0);
  objc_storeStrong((id *)&self->_learningRateTensor, 0);

  objc_storeStrong((id *)&self->_graph, 0);
}

- (MPSGraphOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MPSGraphOptimizer;
  v18 = [(MPSGraphOptimizer *)&v25 init];
  objc_storeStrong((id *)&v18->_graph, a3);
  objc_storeStrong((id *)&v18->_learningRateTensor, a4);
  objc_storeStrong((id *)&v18->_variablesToGradientTensorMap, a6);
  variablesToUpdateOpMap = v18->_variablesToUpdateOpMap;
  v18->_variablesToUpdateOpMap = 0;

  uint64_t v20 = [v15 copy];
  trainableVariables = v18->_trainableVariables;
  v18->_trainableVariables = (NSArray *)v20;

  if (v17)
  {
    objc_storeStrong((id *)&v18->_name, v17);
  }
  else
  {
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    objc_storeStrong((id *)&v18->_name, v24);
  }
  return v18;
}

- (MPSGraphOptimizer)initWithGraph:(id)a3 lossTensor:(id)a4 learningRateTensor:(id)a5 trainableVariables:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __89__MPSGraphOptimizer_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name___block_invoke;
  v28[3] = &unk_1E4FC1558;
  id v18 = v17;
  id v29 = v18;
  [v15 enumerateObjectsUsingBlock:v28];
  v19 = [v12 gradientForPrimaryTensor:v13 withTensors:v18 name:v16];
  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__MPSGraphOptimizer_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name___block_invoke_2;
  v25[3] = &unk_1E4FC1580;
  id v21 = v20;
  id v26 = v21;
  id v22 = v19;
  id v27 = v22;
  [v18 enumerateObjectsUsingBlock:v25];
  v23 = [(MPSGraphOptimizer *)self initWithGraph:v12 learningRateTensor:v14 trainableVariables:v15 variablesToGradientTensorMap:v21 name:v16];

  return v23;
}

void __89__MPSGraphOptimizer_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 outputTensors];
  v3 = [v4 objectAtIndexedSubscript:0];
  [v2 addObject:v3];
}

void __89__MPSGraphOptimizer_initWithGraph_lossTensor_learningRateTensor_trainableVariables_name___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  v5 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  v6 = [v7 operation];
  [v4 setObject:v5 forKey:v6];
}

- (NSArray)updateOperations
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  trainableVariables = self->_trainableVariables;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __37__MPSGraphOptimizer_updateOperations__block_invoke;
  v11 = &unk_1E4FC15A8;
  id v5 = v3;
  id v12 = v5;
  id v13 = self;
  [(NSArray *)trainableVariables enumerateObjectsUsingBlock:&v8];
  v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v5, v8, v9, v10, v11);

  return (NSArray *)v6;
}

void __37__MPSGraphOptimizer_updateOperations__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:a2];
  objc_msgSend(v2, "addObject:");
}

- (NSDictionary)variablesToGradientTensorMap
{
  return self->_variablesToGradientTensorMap;
}

- (NSDictionary)variablesToUpdateOpMap
{
  return self->_variablesToUpdateOpMap;
}

- (MPSGraphTensor)learningRateTensor
{
  return self->_learningRateTensor;
}

@end