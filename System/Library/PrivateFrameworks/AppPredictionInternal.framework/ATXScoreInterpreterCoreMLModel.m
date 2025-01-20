@interface ATXScoreInterpreterCoreMLModel
@end

@implementation ATXScoreInterpreterCoreMLModel

void __121___ATXScoreInterpreterCoreMLModel_getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures_outputSpecification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = [_ATXScoreInterpreterCoreMLModelFeature alloc];
  if (isKindOfClass)
  {
    v8 = -[_ATXScoreInterpreterCoreMLModelFeature initWithFeatureName:multiArraySize:](v7, "initWithFeatureName:multiArraySize:", v5, [v9 count]);

    [*(id *)(a1 + 32) addObjectsFromArray:v9];
  }
  else
  {
    v8 = [(_ATXScoreInterpreterCoreMLModelFeature *)v7 initWithFeatureName:v5];

    [*(id *)(a1 + 32) addObject:v9];
  }
  [*(id *)(a1 + 40) addObject:v8];
}

void __93___ATXScoreInterpreterCoreMLModel_predictionForEvaluatedFeatures_withOutputIndexedSubscript___block_invoke(void *a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 8);
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 predictionFromFeatures:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

@end