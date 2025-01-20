@interface MPSGraphStochasticGradientDescentOptimizer
- (MPSGraphStochasticGradientDescentOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7;
@end

@implementation MPSGraphStochasticGradientDescentOptimizer

- (MPSGraphStochasticGradientDescentOptimizer)initWithGraph:(id)a3 learningRateTensor:(id)a4 trainableVariables:(id)a5 variablesToGradientTensorMap:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)MPSGraphStochasticGradientDescentOptimizer;
  v17 = [(MPSGraphOptimizer *)&v32 initWithGraph:v12 learningRateTensor:v13 trainableVariables:v14 variablesToGradientTensorMap:v15 name:v16];
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  trainableVariables = v17->super._trainableVariables;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __132__MPSGraphStochasticGradientDescentOptimizer_initWithGraph_learningRateTensor_trainableVariables_variablesToGradientTensorMap_name___block_invoke;
  v28[3] = &unk_1E4FC15D0;
  v20 = v17;
  v29 = v20;
  id v21 = v15;
  id v30 = v21;
  id v22 = v18;
  id v31 = v22;
  [(NSArray *)trainableVariables enumerateObjectsUsingBlock:v28];
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v22];
  variablesToUpdateOpMap = v20->super._variablesToUpdateOpMap;
  v20->super._variablesToUpdateOpMap = (NSDictionary *)v23;

  v25 = v31;
  v26 = v20;

  return v26;
}

void __132__MPSGraphStochasticGradientDescentOptimizer_initWithGraph_learningRateTensor_trainableVariables_variablesToGradientTensorMap_name___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  uint64_t v6 = *(void *)(v4 + 16);
  id v9 = v3;
  v7 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  v8 = [v5 applyStochasticGradientDescentWithLearningRateTensor:v6 variable:v9 gradientTensor:v7 name:*(void *)(*(void *)(a1 + 32) + 48)];

  [*(id *)(a1 + 48) setObject:v8 forKey:v9];
}

@end