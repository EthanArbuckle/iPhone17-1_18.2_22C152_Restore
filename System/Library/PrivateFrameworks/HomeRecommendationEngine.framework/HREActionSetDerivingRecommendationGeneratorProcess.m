@interface HREActionSetDerivingRecommendationGeneratorProcess
- (BOOL)shouldGenerateRecommendations;
- (NSDictionary)sourceCharacteristics;
- (id)_createRecommendationWithActionSet:(id)a3 trigger:(id)a4;
- (id)_recommendationForActionSet:(id)a3 trigger:(id)a4;
- (id)generateRecommendations;
- (void)setSourceCharacteristics:(id)a3;
@end

@implementation HREActionSetDerivingRecommendationGeneratorProcess

- (id)generateRecommendations
{
  v3 = objc_opt_new();
  if ([(HREStandardAsyncRecommendationGenerationProcess *)self options])
  {
    v4 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
    v5 = [v4 actionSets];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __77__HREActionSetDerivingRecommendationGeneratorProcess_generateRecommendations__block_invoke;
    v12[3] = &unk_264CF3A98;
    id v13 = v3;
    v14 = self;
    objc_msgSend(v5, "na_each:", v12);
  }
  if (([(HREStandardAsyncRecommendationGenerationProcess *)self options] & 2) != 0)
  {
    v6 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
    v7 = [v6 triggers];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __77__HREActionSetDerivingRecommendationGeneratorProcess_generateRecommendations__block_invoke_2;
    v9[3] = &unk_264CF3AC0;
    id v10 = v3;
    v11 = self;
    objc_msgSend(v7, "na_each:", v9);
  }

  return v3;
}

void __77__HREActionSetDerivingRecommendationGeneratorProcess_generateRecommendations__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _recommendationForActionSet:a2 trigger:0];
  objc_msgSend(v2, "na_safeAddObject:", v3);
}

void __77__HREActionSetDerivingRecommendationGeneratorProcess_generateRecommendations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _recommendationForActionSet:0 trigger:a2];
  objc_msgSend(v2, "na_safeAddObject:", v3);
}

- (BOOL)shouldGenerateRecommendations
{
  return 1;
}

- (id)_recommendationForActionSet:(id)a3 trigger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "hf_triggerType"))
  {
    id v16 = 0;
  }
  else
  {
    v9 = [(HREActionSetDerivingRecommendationGeneratorProcess *)self _createRecommendationWithActionSet:v6 trigger:v8];
    id v10 = v9;
    if (v9)
    {
      v11 = [v9 actions];
      v12 = [(HREStandardAsyncRecommendationGenerationProcess *)self sourceRecommendableObjects];
      id v13 = +[HRERecommendableObjectUtilities filterRecommendableObjects:v12 excludingObjectsInActions:v11];

      if ([v13 count])
      {
        v14 = +[HREDerivedActionUtilities derivedActionsForActionableObjects:v13 fromActions:v11];
        [v10 addActions:v14];

        if ([v10 containsMeaningfulChanges]) {
          v15 = v10;
        }
        else {
          v15 = 0;
        }
        id v16 = v15;
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }

  return v16;
}

- (id)_createRecommendationWithActionSet:(id)a3 trigger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[HREIdentifierBuilder alloc] initWithBaseIdentifier:@"derived"];
  if (!v7)
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_7;
    }
    id v19 = objc_alloc(MEMORY[0x263F47AD0]);
    v20 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
    v14 = (HRERecommendationEmptyTriggerBuilderContext *)[v19 initWithExistingObject:v6 inHome:v20];

    v21 = [v6 uniqueIdentifier];
    v22 = [v21 UUIDString];
    [(HREIdentifierBuilder *)v8 setObject:v22 forKey:@"actionSet"];

    v23 = [HREActionSetRecommendation alloc];
    v24 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
    v11 = [(HRERecommendation *)v23 initWithHome:v24];

    v25 = [(HREActionSetRecommendation *)v11 mutableActionSetBuilders];
    [v25 addObject:v14];

    [(HREActionSetRecommendation *)v11 setSelectedActionSetBuilder:v14];
LABEL_6:

LABEL_7:
    v26 = [(HRERecommendation *)v11 defaultAnalyticsData];
    [v26 setObject:@"derived" forKeyedSubscript:*MEMORY[0x263F478B0]];

    [(HRERecommendation *)v11 setIdentifierBuilder:v8];
    goto LABEL_9;
  }
  v9 = [HRETriggerRecommendation alloc];
  id v10 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
  v11 = [(HRERecommendation *)v9 initWithHome:v10];

  v12 = [v7 uniqueIdentifier];
  id v13 = [v12 UUIDString];
  [(HREIdentifierBuilder *)v8 setObject:v13 forKey:@"trigger"];

  v14 = objc_alloc_init(HRERecommendationEmptyTriggerBuilderContext);
  v15 = (void *)MEMORY[0x263F47C48];
  id v16 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
  v17 = [v15 triggerBuilderForTrigger:v7 inHome:v16 context:v14 assertsFailure:0];

  if (v17)
  {
    v18 = [(HREActionSetRecommendation *)v11 mutableTriggerBuilders];
    [v18 addObject:v17];

    goto LABEL_6;
  }

  v11 = 0;
LABEL_9:

  return v11;
}

- (NSDictionary)sourceCharacteristics
{
  return self->_sourceCharacteristics;
}

- (void)setSourceCharacteristics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end