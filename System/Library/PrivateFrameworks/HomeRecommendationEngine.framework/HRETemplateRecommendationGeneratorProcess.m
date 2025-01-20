@interface HRETemplateRecommendationGeneratorProcess
- (BOOL)shouldGenerateRecommendations;
- (NSArray)activeTemplates;
- (NSArray)homeTriggerBuilders;
- (NSArray)rooms;
- (id)_actionsForDerivingForTemplate:(id)a3 recommendation:(id)a4;
- (id)_createInitialRecommendations:(id)a3 withRecommendation:(id)a4;
- (id)_defineActionsWithActionMap:(id)a3 withActionableObjects:(id)a4;
- (id)_defineProfileActionsForActionableObjects:(id)a3 withActionMap:(id)a4;
- (id)_existingActionSetForTemplate:(id)a3 recommendation:(id)a4;
- (id)_filterRecommendations:(id)a3 fromTemplate:(id)a4;
- (id)_filterSplitRecommendations:(id)a3 characteristicTypePriority:(id)a4;
- (id)_filterToAllowedObjects:(id)a3 withSourceObjects:(id)a4 withTrigger:(id)a5 template:(id)a6;
- (id)_initialRecommendationsForTemplate:(id)a3;
- (id)_splitRecommendationsBySplitStrategy:(id)a3;
- (id)_triggerWithSameConfigurationAsTrigger:(id)a3;
- (id)additionalIncludedObjectsInObjects:(id)a3 withTypes:(id)a4;
- (id)characteristicActionsForObject:(id)a3 actionMap:(id)a4;
- (id)definiteActionsForCharacteristicActionMap:(id)a3 object:(id)a4;
- (id)generateRecommendations;
- (id)matterCommandActionsForActionableObjects:(id)a3 withActionMap:(id)a4;
- (id)recommendationsWithTemplate:(id)a3;
- (int64_t)_diffScoreForTriggerComparison:(id)a3;
- (void)setActiveTemplates:(id)a3;
- (void)setHomeTriggerBuilders:(id)a3;
- (void)setRooms:(id)a3;
@end

@implementation HRETemplateRecommendationGeneratorProcess

- (id)matterCommandActionsForActionableObjects:(id)a3 withActionMap:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268944258);
  uint64_t v5 = sub_237B92880();
  sub_237B7057C(0, &qword_268943F10);
  uint64_t v6 = sub_237B92830();
  v7 = self;
  HRETemplateRecommendationGeneratorProcess.matterCommandActions(for:with:)(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268944268);
  sub_237B75B40();
  v8 = (void *)sub_237B928C0();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)additionalIncludedObjectsInObjects:(id)a3 withTypes:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268944258);
  unint64_t v5 = sub_237B92880();
  unint64_t v6 = sub_237B928D0();
  v7 = self;
  if (sub_237B927A0())
  {
    sub_237B75454(v5, v7, v6);
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v8 = (void *)sub_237B92870();
  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)shouldGenerateRecommendations
{
  v6.receiver = self;
  v6.super_class = (Class)HRETemplateRecommendationGeneratorProcess;
  if (![(HREStandardAsyncRecommendationGenerationProcess *)&v6 shouldGenerateRecommendations])return 0; {
  v3 = [(HRETemplateRecommendationGeneratorProcess *)self activeTemplates];
  }
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)generateRecommendations
{
  v3 = objc_alloc_init(HRERecommendationEmptyTriggerBuilderContext);
  BOOL v4 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
  unint64_t v5 = [v4 triggers];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__HRETemplateRecommendationGeneratorProcess_generateRecommendations__block_invoke;
  v14[3] = &unk_264CF3E60;
  v14[4] = self;
  v15 = v3;
  objc_super v6 = v3;
  v7 = objc_msgSend(v5, "na_map:", v14);
  [(HRETemplateRecommendationGeneratorProcess *)self setHomeTriggerBuilders:v7];

  v8 = (void *)MEMORY[0x263EFFA08];
  v9 = [(HRETemplateRecommendationGeneratorProcess *)self activeTemplates];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__HRETemplateRecommendationGeneratorProcess_generateRecommendations__block_invoke_2;
  v13[3] = &unk_264CF3E88;
  v13[4] = self;
  v10 = objc_msgSend(v9, "na_flatMap:", v13);
  v11 = [v8 setWithArray:v10];

  return v11;
}

id __68__HRETemplateRecommendationGeneratorProcess_generateRecommendations__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F47C48];
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_super v6 = [v4 home];
  v7 = [v3 triggerBuilderForTrigger:v5 inHome:v6 context:*(void *)(a1 + 40) assertsFailure:0];

  return v7;
}

id __68__HRETemplateRecommendationGeneratorProcess_generateRecommendations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) recommendationsWithTemplate:a2];
  v3 = [v2 allObjects];

  return v3;
}

- (id)recommendationsWithTemplate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HREStandardAsyncRecommendationGenerationProcess *)self options];
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v6 rules];
  v10 = objc_msgSend(v9, "hre_filteredToClass:", objc_opt_class());
  v11 = [v10 allObjects];

  v12 = objc_msgSend(v11, "na_filter:", &__block_literal_global_50);
  v13 = [(HREStandardAsyncRecommendationGenerationProcess *)self homeRecommendableObjects];
  LODWORD(v9) = +[HRERecommendableObjectUtilities recommendableObjects:v13 matchAllRules:v12];

  v14 = 0;
  if (v9)
  {
    v31 = v8;
    v15 = [(HREStandardAsyncRecommendationGenerationProcess *)self homeRecommendableObjects];
    v16 = [v6 involvedAccessoryTypes];
    v17 = +[HRERecommendableObjectUtilities filterRecommendableObjects:v15 toMatchTypes:v16];

    v18 = [(HREStandardAsyncRecommendationGenerationProcess *)self homeRecommendableObjects];
    v19 = [v18 allObjects];
    v20 = [v6 involvedAccessoryTypes];
    v21 = [(HRETemplateRecommendationGeneratorProcess *)self additionalIncludedObjectsInObjects:v19 withTypes:v20];

    v22 = [v17 setByAddingObjectsFromArray:v21];

    if (![v22 count])
    {
      v14 = 0;
LABEL_16:

      id v8 = v31;
      goto LABEL_17;
    }
    v23 = [(HREStandardAsyncRecommendationGenerationProcess *)self sourceRecommendableObjects];
    v24 = objc_msgSend(v23, "na_filter:", &__block_literal_global_55_0);

    v25 = [(HREStandardAsyncRecommendationGenerationProcess *)self sourceRecommendableObjects];
    if ([v25 count])
    {
      v14 = (void *)[v24 count];

      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
    }
    if ([v24 count] && !objc_msgSend(v22, "intersectsSet:", v24))
    {
      v14 = 0;
    }
    else
    {
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      v41[3] = 0;
      v26 = [(HRETemplateRecommendationGeneratorProcess *)self _initialRecommendationsForTemplate:v6];
      uint64_t v27 = (v5 >> 7) & 1;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_3;
      v33[3] = &unk_264CF3F18;
      id v34 = v22;
      id v35 = v11;
      id v28 = v6;
      id v36 = v28;
      v37 = self;
      char v40 = v27;
      id v38 = v31;
      v39 = v41;
      v29 = objc_msgSend(v26, "na_filter:", v33);

      v14 = [(HRETemplateRecommendationGeneratorProcess *)self _filterRecommendations:v29 fromTemplate:v28];

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_7;
      v32[3] = &unk_264CF3F40;
      v32[4] = v41;
      objc_msgSend(v14, "na_each:", v32);

      _Block_object_dispose(v41, 8);
    }
    goto LABEL_15;
  }
LABEL_17:

  return v14;
}

BOOL __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

uint64_t __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26EAC92A0]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  unint64_t v5 = v4;
  if (v4 && (objc_msgSend(v4, "hf_isMatterOnlyAccessory") & 1) != 0) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = objc_msgSend(v2, "hre_isVisible");
  }

  return v6;
}

uint64_t __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  unint64_t v5 = [v3 roomsToFilterHomeObjects];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [v3 roomsToFilterHomeObjects];
    uint64_t v8 = +[HRERecommendableObjectUtilities filterRecommendableObjects:v4 toRooms:v7];

    id v4 = (id)v8;
  }
  if (+[HRERecommendableObjectUtilities recommendableObjects:v4 matchAllRules:*(void *)(a1 + 40)])
  {
    objc_opt_class();
    id v9 = *(id *)(a1 + 48);
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    if (!v11)
    {
      v29 = [*(id *)(a1 + 56) sourceRecommendableObjects];
      uint64_t v30 = [v29 count];

      if (!v30)
      {
        id v66 = 0;
        goto LABEL_22;
      }
      id v14 = [*(id *)(a1 + 56) sourceRecommendableObjects];
      uint64_t v24 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v14);
LABEL_20:
      id v66 = v11;

      id v4 = (id)v24;
LABEL_22:
      id v31 = v3;
      v32 = &unk_26EABB4C0;
      if ([v31 conformsToProtocol:v32]) {
        v33 = v31;
      }
      else {
        v33 = 0;
      }
      id v34 = v33;

      id v67 = v3;
      if (v34)
      {
        id v35 = [*(id *)(a1 + 56) _existingActionSetForTemplate:*(void *)(a1 + 48) recommendation:v34];
        objc_opt_class();
        id v36 = v31;
        if (objc_opt_isKindOfClass()) {
          v37 = v36;
        }
        else {
          v37 = 0;
        }
        id v38 = v37;

        if (v38 && v35)
        {
          v39 = [v38 mutableActionSetBuilders];
          [v39 removeAllObjects];

          char v40 = [v38 mutableActionSetBuilders];
          [v40 addObject:v35];

          [v38 setSelectedActionSetBuilder:v35];
        }
        v41 = [*(id *)(a1 + 64) actionMap];
        if (v41)
        {
          v42 = [*(id *)(a1 + 56) _defineActionsWithActionMap:v41 withActionableObjects:v4];
          [v34 addActions:v42 allowEditingExistingActions:*(unsigned __int8 *)(a1 + 80)];
        }
        [*(id *)(a1 + 56) _actionsForDerivingForTemplate:*(void *)(a1 + 48) recommendation:v34];
        v44 = v43 = v34;
        if ([v44 count])
        {
          v76[0] = MEMORY[0x263EF8330];
          v76[1] = 3221225472;
          v76[2] = __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_5;
          v76[3] = &unk_264CF3DD0;
          id v77 = *(id *)(a1 + 48);
          v45 = objc_msgSend(v4, "na_filter:", v76);
          v46 = +[HREDerivedActionUtilities derivedActionsForActionableObjects:v45 fromActions:v44];
          v72[0] = MEMORY[0x263EF8330];
          v72[1] = 3221225472;
          v72[2] = __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_6;
          v72[3] = &unk_264CF3EF0;
          id v73 = *(id *)(a1 + 64);
          id v74 = v43;
          char v75 = *(unsigned char *)(a1 + 80);
          objc_msgSend(v46, "na_each:", v72);
        }
        id v3 = v67;
        id v34 = v43;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v65 = v34;
        id v47 = v31;
        v48 = [v47 triggerBuilders];
        v49 = (void *)[v48 copy];

        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v50 = v49;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v68 objects:v78 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v69;
          do
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v69 != v53) {
                objc_enumerationMutation(v50);
              }
              uint64_t v55 = *(void *)(*((void *)&v68 + 1) + 8 * i);
              v56 = [*(id *)(a1 + 56) _triggerWithSameConfigurationAsTrigger:v55];
              v57 = v56;
              if (v56)
              {
                [v56 setEnabled:1];
                [v47 replaceTriggerBuilder:v55 withTriggerBuilder:v57 allowEditingExistingActions:*(unsigned __int8 *)(a1 + 80)];
              }
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v68 objects:v78 count:16];
          }
          while (v52);
        }

        id v3 = v67;
        id v34 = v65;
      }
      int v58 = [v31 containsRecommendableContent];
      int v59 = [v31 containsMeaningfulChanges];
      if (([*(id *)(a1 + 56) options] & 0x40) != 0) {
        int v60 = v58;
      }
      else {
        int v60 = v58 & v59;
      }
      id v11 = v66;
      if (v58 && (v59 & 1) == 0) {
        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      }
      v61 = [*(id *)(a1 + 56) sourceRecommendableObjects];
      if ([v61 count])
      {
        v62 = [*(id *)(a1 + 56) sourceRecommendableObjects];
        int v63 = [v31 includesObjects:v62];
      }
      else
      {
        int v63 = 1;
      }

      uint64_t v28 = v60 & v63;
      goto LABEL_60;
    }
    objc_opt_class();
    id v12 = v3;
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    v15 = [v11 triggerBuilderForRecommendation:v14 withObjects:v4];
    if (v15)
    {
      v16 = [*(id *)(a1 + 56) sourceRecommendableObjects];
      uint64_t v17 = [v16 count];

      if (!v17)
      {
LABEL_16:
        uint64_t v24 = (uint64_t)v4;
        [v15 setEnabled:1];
        v25 = [v14 mutableTriggerBuilders];
        [v25 addObject:v15];

        v26 = [v14 mutableTriggerBuilders];
        objc_msgSend(v26, "na_each:", &__block_literal_global_179);

        uint64_t v27 = [v11 iconDescriptorForRecommendation:v14 withObjects:v24];
        [v14 setIconDescriptor:v27];

        id v4 = v15;
        goto LABEL_20;
      }
      v18 = [*(id *)(a1 + 56) sourceRecommendableObjects];
      int v19 = [v4 intersectsSet:v18];

      if (v19)
      {
        v20 = *(void **)(a1 + 56);
        v21 = [v20 sourceRecommendableObjects];
        uint64_t v22 = [v20 _filterToAllowedObjects:v4 withSourceObjects:v21 withTrigger:v15 template:v11];

        uint64_t v23 = [v11 triggerBuilderForRecommendation:v14 withObjects:v22];

        if (v23)
        {
          id v4 = (id)v22;
          v15 = (void *)v23;
          goto LABEL_16;
        }
        v15 = 0;
        id v4 = (id)v22;
      }
    }

    uint64_t v28 = 0;
LABEL_60:

    goto LABEL_61;
  }
  uint64_t v28 = 0;
LABEL_61:

  return v28;
}

void __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v2 = [v4 name];

  if (!v2)
  {
    id v3 = [v4 naturalLanguageNameOfType:0];
    [v4 setName:v3];
  }
}

uint64_t __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 involvedAccessoryTypes];
  unint64_t v5 = objc_msgSend(v3, "hre_matchingTypes");

  uint64_t v6 = [v4 intersectsSet:v5];
  return v6;
}

void __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) allowedVariance];
  int v4 = [v3 anyRulePassesForAction:v5];

  if (v4) {
    [*(id *)(a1 + 40) addAction:v5 allowEditingExistingActions:*(unsigned __int8 *)(a1 + 48)];
  }
}

uint64_t __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setNumberOfEnabledRecommendationsForTemplate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

- (id)_initialRecommendationsForTemplate:(id)a3
{
  id v4 = a3;
  id v5 = [(HREStandardAsyncRecommendationGenerationProcess *)self sourceRecommendableObjects];
  uint64_t v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_209);

  v7 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
  uint64_t v8 = [v4 createStarterRecommendationInHome:v7];

  uint64_t v9 = [v4 splitStrategy];
  v10 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
  id v11 = [v8 splitUsingSplitStrategy:v9 inHome:v10];

  if ([v6 count])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke_2;
    v18[3] = &unk_264CF3F88;
    id v19 = v6;
    uint64_t v12 = objc_msgSend(v11, "na_filter:", v18);

    id v11 = (void *)v12;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke_3;
  v16[3] = &unk_264CF3FB0;
  v16[4] = self;
  id v17 = v4;
  id v13 = v4;
  id v14 = objc_msgSend(v11, "na_flatMap:", v16);

  return v14;
}

uint64_t __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_parentRoom");
}

uint64_t __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 room];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 room];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v8 = [v3 zone];

    if (!v8)
    {
      uint64_t v7 = 1;
      goto LABEL_6;
    }
    uint64_t v9 = *(void **)(a1 + 32);
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = [v3 zone];
    id v11 = [v6 rooms];
    uint64_t v12 = [v10 setWithArray:v11];
    uint64_t v7 = [v9 intersectsSet:v12];
  }
LABEL_6:

  return v7;
}

uint64_t __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createInitialRecommendations:*(void *)(a1 + 40) withRecommendation:a2];
}

- (id)_createInitialRecommendations:(id)a3 withRecommendation:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    if (![v10 allowMultipleEventsFeature])
    {
      id v14 = [v10 triggerCharacteristicValues];
      v16 = [MEMORY[0x263EFFA08] setWithArray:v14];
      id v17 = objc_msgSend(v16, "na_map:", &__block_literal_global_214);

      if ([v17 count])
      {
        v18 = [v7 room];
        id v19 = [v7 zone];
        v20 = [(HREStandardAsyncRecommendationGenerationProcess *)self homeRecommendableObjects];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_2;
        v33[3] = &unk_264CF3918;
        id v34 = v18;
        id v35 = v19;
        id v21 = v19;
        id v22 = v18;
        uint64_t v23 = objc_msgSend(v20, "na_filter:", v33);

        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_3;
        uint64_t v30 = &unk_264CF3FF8;
        id v31 = v8;
        id v32 = v17;
        uint64_t v24 = objc_msgSend(v23, "na_flatMap:", &v27);
        v15 = objc_msgSend(v7, "splitUsingSplitCharacteristics:", v24, v27, v28, v29, v30);
      }
      else
      {
        v25 = (void *)MEMORY[0x263EFFA08];
        id v36 = v7;
        id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
        v15 = [v25 setWithArray:v22];
      }

      goto LABEL_13;
    }
    id v11 = (void *)MEMORY[0x263EFFA08];
    id v37 = v7;
    uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
    id v13 = &v37;
  }
  else
  {
    id v11 = (void *)MEMORY[0x263EFFA08];
    v38[0] = v7;
    uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
    id v13 = (id *)v38;
  }
  id v14 = [v12 arrayWithObjects:v13 count:1];
  v15 = [v11 setWithArray:v14];
LABEL_13:

  return v15;
}

uint64_t __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type];
}

uint64_t __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    id v5 = objc_msgSend(v3, "hre_parentRoom");
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    if (!v7)
    {
      uint64_t v6 = v4 != 0;
      goto LABEL_6;
    }
    id v5 = [v7 rooms];
    id v8 = objc_msgSend(v4, "hre_parentRoom");
    uint64_t v6 = [v5 containsObject:v8];
  }
LABEL_6:

  return v6;
}

id __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hre_matchingTypes");
  id v5 = [*(id *)(a1 + 32) involvedAccessoryTypes];
  char v6 = [v4 intersectsSet:v5];

  if (v6)
  {
    id v7 = objc_msgSend(v3, "hre_characteristics");
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_4;
    v10[3] = &unk_264CF37F8;
    id v11 = *(id *)(a1 + 40);
    id v8 = objc_msgSend(v7, "na_filter:", v10);
  }
  else
  {
    id v8 = [MEMORY[0x263EFFA08] set];
  }

  return v8;
}

uint64_t __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 characteristicType];
  if ([v4 containsObject:v5])
  {
    char v6 = [v3 service];
    uint64_t v7 = objc_msgSend(v6, "hf_isVisible");
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_defineActionsWithActionMap:(id)a3 withActionableObjects:(id)a4
{
  v24[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"HREServiceTypeAll"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __95__HRETemplateRecommendationGeneratorProcess__defineActionsWithActionMap_withActionableObjects___block_invoke;
  v20[3] = &unk_264CF4020;
  id v21 = v6;
  id v22 = v8;
  uint64_t v23 = self;
  id v9 = v8;
  id v10 = v6;
  id v11 = objc_msgSend(v7, "na_flatMap:", v20);
  uint64_t v12 = [(HRETemplateRecommendationGeneratorProcess *)self _defineProfileActionsForActionableObjects:v7 withActionMap:v10];
  id v13 = [v7 allObjects];

  id v14 = [(HRETemplateRecommendationGeneratorProcess *)self matterCommandActionsForActionableObjects:v13 withActionMap:v10];

  v15 = (void *)MEMORY[0x263EFFA08];
  v24[0] = v11;
  v24[1] = v12;
  v24[2] = v14;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  id v17 = [v15 setWithArray:v16];
  v18 = objc_msgSend(v17, "na_setByFlattening");

  return v18;
}

id __95__HRETemplateRecommendationGeneratorProcess__defineActionsWithActionMap_withActionableObjects___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hre_primaryType");
  if (v4)
  {
    id v5 = +[HRERecommendableObjectUtilities actionMapFromActionMap:*(void *)(a1 + 32) forRecommendableObject:v3];
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      id v9 = v6;
    }
    else
    {
      id v9 = +[HRECharacteristicActionMap emptyMap];
    }
    if (*(void *)(a1 + 40))
    {
      v14[0] = *(void *)(a1 + 40);
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      uint64_t v12 = [v9 mergeWithActionMaps:v11];

      id v9 = (id)v12;
    }
    id v10 = [*(id *)(a1 + 48) characteristicActionsForObject:v3 actionMap:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_defineProfileActionsForActionableObjects:(id)a3 withActionMap:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = a4;
  id v9 = [v7 set];
  objc_opt_class();
  id v10 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);
  id v11 = [v8 objectForKeyedSubscript:v10];

  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = objc_msgSend(v6, "na_flatMap:", &__block_literal_global_221);
    if ([v14 count])
    {
      v15 = [v14 anyObject];
      id v11 = [v13 flattenedMapEvaluatedForObject:v15];

      id v16 = objc_alloc(MEMORY[0x263F47BA8]);
      id v17 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
      v18 = (void *)[v16 initWithHome:v17];

      [v18 setMediaProfiles:v14];
      objc_msgSend(v18, "setTargetPlayState:", objc_msgSend(v11, "targetPlaybackState"));
      id v19 = [v11 targetVolume];
      [v18 setTargetVolume:v19];

      v20 = [v11 playbackArchive];
      [v18 setPlaybackArchive:v20];

      [v9 addObject:v18];
    }
  }

  return v9;
}

id __101__HRETemplateRecommendationGeneratorProcess__defineProfileActionsForActionableObjects_withActionMap___block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_containedProfiles");
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_224);

  return v3;
}

id __101__HRETemplateRecommendationGeneratorProcess__defineProfileActionsForActionableObjects_withActionMap___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)_actionsForDerivingForTemplate:(id)a3 recommendation:(id)a4
{
  id v6 = a4;
  id v7 = [(HRETemplateRecommendationGeneratorProcess *)self _existingActionSetForTemplate:a3 recommendation:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x263EFFA08];
    id v10 = [v7 actions];
    id v11 = [v9 setWithArray:v10];
  }
  else
  {
    objc_opt_class();
    id v10 = v6;
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      id v14 = [v13 triggerBuilders];
      id v11 = objc_msgSend(v14, "na_flatMap:", &__block_literal_global_229);
    }
    else
    {
      id v11 = [MEMORY[0x263EFFA08] set];
      id v10 = 0;
    }
  }

  return v11;
}

id __91__HRETemplateRecommendationGeneratorProcess__actionsForDerivingForTemplate_recommendation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 triggerActionSets];
  id v3 = [v2 anonymousActionSetBuilder];
  id v4 = [v3 actionBuilders];
  id v5 = [v4 fromSet];

  return v5;
}

- (id)_existingActionSetForTemplate:(id)a3 recommendation:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 actionSetType];
    id v10 = [v8 actionSetName];
    id v11 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
    uint64_t v12 = [v11 actionSets];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __90__HRETemplateRecommendationGeneratorProcess__existingActionSetForTemplate_recommendation___block_invoke;
    uint64_t v23 = &unk_264CF4048;
    id v13 = v10;
    id v24 = v13;
    id v14 = v9;
    id v25 = v14;
    v15 = objc_msgSend(v12, "na_firstObjectPassingTest:", &v20);

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263F47AD0]);
      id v17 = [(HREStandardAsyncRecommendationGenerationProcess *)self home];
      v18 = (void *)[v16 initWithExistingObject:v15 inHome:v17];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __90__HRETemplateRecommendationGeneratorProcess__existingActionSetForTemplate_recommendation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 name];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else if (*(void *)(a1 + 40))
  {
    id v6 = [v3 actionSetType];
    uint64_t v5 = [v6 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_filterToAllowedObjects:(id)a3 withSourceObjects:(id)a4 withTrigger:(id)a5 template:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = [v11 actionMap];
  id v14 = [v11 rules];

  v15 = objc_msgSend(v14, "hre_filteredToClass:", objc_opt_class());
  id v16 = (void *)[v15 mutableCopy];

  objc_opt_class();
  id v17 = v10;
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke;
  v42[3] = &unk_264CF3DD0;
  id v20 = v19;
  id v43 = v20;
  char v21 = objc_msgSend(v9, "na_any:", v42);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_2;
  v40[3] = &unk_264CF3DD0;
  id v22 = v13;
  id v41 = v22;
  char v23 = objc_msgSend(v9, "na_any:", v40);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  void v38[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_3;
  v38[3] = &unk_264CF3A70;
  id v24 = v16;
  id v39 = v24;
  objc_msgSend(v9, "na_each:", v38);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_5;
  v31[3] = &unk_264CF4098;
  id v32 = v24;
  id v33 = v22;
  char v36 = v23;
  char v37 = v21;
  id v34 = v20;
  id v35 = v9;
  id v25 = v9;
  id v26 = v20;
  id v27 = v22;
  id v28 = v24;
  v29 = objc_msgSend(v12, "na_filter:", v31);

  return v29;
}

uint64_t __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 characteristics];
  uint64_t v5 = objc_msgSend(v3, "hre_characteristics");

  uint64_t v6 = [v4 intersectsSet:v5];
  return v6;
}

BOOL __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HRERecommendableObjectUtilities recommendableObject:a2 involvedInActionMap:*(void *)(a1 + 32)];
}

void __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_4;
  v7[3] = &unk_264CF4070;
  id v8 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_filter:", v7);
  [*(id *)(a1 + 32) minusSet:v6];
}

uint64_t __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 passesWithObject:*(void *)(a1 + 32)];
}

uint64_t __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_6;
  v15[3] = &unk_264CF4070;
  id v5 = v3;
  id v16 = v5;
  uint64_t v6 = objc_msgSend(v4, "na_filter:", v15);
  [*(id *)(a1 + 32) minusSet:v6];
  uint64_t v7 = [v6 count];
  if (+[HRERecommendableObjectUtilities recommendableObject:v5 involvedInActionMap:*(void *)(a1 + 40)])
  {
    BOOL v8 = *(unsigned char *)(a1 + 64) == 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  id v9 = [*(id *)(a1 + 48) characteristics];
  id v10 = objc_msgSend(v5, "hre_characteristics");
  if ([v9 intersectsSet:v10]) {
    BOOL v11 = *(unsigned char *)(a1 + 65) == 0;
  }
  else {
    BOOL v11 = 0;
  }

  char v12 = [*(id *)(a1 + 56) containsObject:v5];
  uint64_t v13 = 1;
  if (!v7 && (v12 & 1) == 0) {
    uint64_t v13 = v8 | v11;
  }

  return v13;
}

uint64_t __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 passesWithObject:*(void *)(a1 + 32)];
}

- (id)_triggerWithSameConfigurationAsTrigger:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v18 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF980] array];
  if (qword_268944BF0 != -1) {
    dispatch_once(&qword_268944BF0, &__block_literal_global_241);
  }
  id v5 = (id)qword_268944BF8;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [(HRETemplateRecommendationGeneratorProcess *)self homeTriggerBuilders];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v10 isShortcutOwned] & 1) == 0)
        {
          BOOL v11 = [v3 compareToObject:v10];
          char v12 = [v11 filteredIgnoringKeys:v5];
          if ([v12 hasNoDifferencesHigherThanPriority:0])
          {
            [v18 addObject:v10];
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __84__HRETemplateRecommendationGeneratorProcess__triggerWithSameConfigurationAsTrigger___block_invoke_3;
  v19[3] = &unk_264CF40C0;
  char v21 = &v22;
  v19[4] = self;
  id v13 = v4;
  id v20 = v13;
  [v13 enumerateObjectsUsingBlock:v19];
  uint64_t v14 = v23[3];
  if (v14 >= [v18 count] || v23[3] < 0)
  {
    v15 = 0;
  }
  else
  {
    v15 = objc_msgSend(v18, "objectAtIndexedSubscript:");
  }

  _Block_object_dispose(&v22, 8);

  return v15;
}

void __84__HRETemplateRecommendationGeneratorProcess__triggerWithSameConfigurationAsTrigger___block_invoke_2()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F47918];
  v5[0] = *MEMORY[0x263F47920];
  v5[1] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)qword_268944BF8;
  qword_268944BF8 = v3;
}

void __84__HRETemplateRecommendationGeneratorProcess__triggerWithSameConfigurationAsTrigger___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(void *)(v8 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_7;
  }
  id v13 = v7;
  if ([v7 hasNoDifferencesHigherThanPriority:0])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
    id v7 = v13;
    goto LABEL_8;
  }
  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v11 = [v9 _diffScoreForTriggerComparison:v10];

  BOOL v12 = [*(id *)(a1 + 32) _diffScoreForTriggerComparison:v13] < v11;
  id v7 = v13;
  if (v12)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
LABEL_7:
    *(void *)(v8 + 24) = a3;
  }
LABEL_8:
}

- (id)_filterRecommendations:(id)a3 fromTemplate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263EFF9D8];
    BOOL v12 = [v10 characteristicTypePriority];
    id v13 = [v11 orderedSetWithArray:v12];

    if ([v10 characteristicPerServiceRule])
    {
      uint64_t v14 = objc_msgSend(v7, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_246);
      v15 = (void *)MEMORY[0x263EFFA08];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_2;
      v29[3] = &unk_264CF4108;
      v29[4] = self;
      id v30 = v13;
      id v16 = objc_msgSend(v14, "na_flatMap:", v29);
      uint64_t v17 = [v15 setWithArray:v16];

      id v7 = (void *)v17;
    }
    if ([v10 enforcePriority])
    {
      v18 = [(HRETemplateRecommendationGeneratorProcess *)self _splitRecommendationsBySplitStrategy:v7];
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_3;
      long long v26 = &unk_264CF4130;
      long long v27 = self;
      id v28 = v13;
      uint64_t v19 = objc_msgSend(v18, "na_flatMap:", &v23);

      id v7 = (void *)v19;
    }
    if (objc_msgSend(v10, "singleRecommendationPerSplit", v23, v24, v25, v26, v27))
    {
      id v20 = [(HRETemplateRecommendationGeneratorProcess *)self _splitRecommendationsBySplitStrategy:v7];
      uint64_t v21 = objc_msgSend(v20, "na_map:", &__block_literal_global_252);

      id v7 = (void *)v21;
    }
  }

  return v7;
}

id __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 splitCharacteristic];
  uint64_t v3 = [v2 service];
  id v4 = [v3 uniqueIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  return v7;
}

id __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F08C38];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend(v5, "hmf_zeroUUID");
  char v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [*(id *)(a1 + 32) _filterSplitRecommendations:v6 characteristicTypePriority:*(void *)(a1 + 40)];

    id v6 = (id)v10;
  }
  uint64_t v11 = [v6 allObjects];

  return v11;
}

uint64_t __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _filterSplitRecommendations:a2 characteristicTypePriority:*(void *)(a1 + 40)];
}

id __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_254);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 anyObject];
  }
  id v6 = v5;

  return v6;
}

uint64_t __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 containsMeaningfulChanges] ^ 1;
}

- (id)_splitRecommendationsBySplitStrategy:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_256);
  id v5 = [v4 allValues];
  id v6 = [v3 setWithArray:v5];

  return v6;
}

id __82__HRETemplateRecommendationGeneratorProcess__splitRecommendationsBySplitStrategy___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 room];
  id v4 = [v3 uniqueIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [v2 zone];
    id v6 = [v7 uniqueIdentifier];
  }

  return v6;
}

- (id)_filterSplitRecommendations:(id)a3 characteristicTypePriority:(id)a4
{
  id v6 = a3;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke;
  v21[3] = &unk_264CF3F88;
  v21[4] = self;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "na_filter:", v21);
  char v9 = objc_msgSend(v6, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_258);
  uint64_t v10 = [v7 array];

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke_3;
  uint64_t v19 = &unk_264CF4198;
  id v11 = v9;
  id v20 = v11;
  BOOL v12 = objc_msgSend(v10, "na_firstObjectPassingTest:", &v16);

  if (v12)
  {
    id v13 = objc_msgSend(v11, "objectForKeyedSubscript:", v12, v16, v17, v18, v19);
    id v14 = [v13 setByAddingObjectsFromSet:v8];
  }
  else
  {
    id v14 = v6;
  }

  return v14;
}

void *__100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 selectedTriggerBuilder];
  id v8 = v7;
  if (v7)
  {
    char v9 = [v7 trigger];

    if (v9)
    {
      uint64_t v10 = (void *)MEMORY[0x263F47C48];
      id v11 = [v8 trigger];
      BOOL v12 = [*(id *)(a1 + 32) home];
      id v13 = [v8 context];
      id v14 = [v10 triggerBuilderForTrigger:v11 inHome:v12 context:v13 assertsFailure:0];

      if (v14)
      {
        v15 = [v6 compareForMatchingToTrigger:v14];
        char v9 = (void *)[v15 hasNoDifferencesHigherThanPriority:0];
      }
      else
      {
        char v9 = 0;
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

id __100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 splitCharacteristic];
  id v3 = [v2 characteristicType];

  return v3;
}

BOOL __100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)_diffScoreForTriggerComparison:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 differences];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F47920]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 containedObjectResult];
  char v9 = [v8 differences];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F47908]];

  id v11 = [v8 differences];
  BOOL v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F47910]];

  id v13 = [v3 differences];
  id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F47918]];

  int64_t v15 = v14 != 0;
  if (v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v16 = [v10 containedObjectResults];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          v15 += [*(id *)(*((void *)&v31 + 1) + 8 * v20++) hasNoDifferencesHigherThanPriority:0] ^ 1;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v18);
    }
  }
  if (v12)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v21 = objc_msgSend(v12, "containedObjectResults", 0);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          v15 += [*(id *)(*((void *)&v27 + 1) + 8 * v25++) hasNoDifferencesHigherThanPriority:0] ^ 1;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }
  return v15;
}

- (id)characteristicActionsForObject:(id)a3 actionMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HRECharacteristicActionMap emptyMap];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v7 characteristicTypeValues],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    BOOL v12 = [v7 flattenedMapEvaluatedForObject:v6];
    id v13 = [(HRETemplateRecommendationGeneratorProcess *)self definiteActionsForCharacteristicActionMap:v12 object:v6];
  }
  else
  {
    id v13 = [MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
  }

  return v13;
}

- (id)definiteActionsForCharacteristicActionMap:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a4, "hre_characteristics");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __94__HRETemplateRecommendationGeneratorProcess_definiteActionsForCharacteristicActionMap_object___block_invoke;
  v11[3] = &unk_264CF41C0;
  id v12 = v6;
  id v13 = self;
  id v8 = v6;
  char v9 = objc_msgSend(v7, "na_map:", v11);

  return v9;
}

id __94__HRETemplateRecommendationGeneratorProcess_definiteActionsForCharacteristicActionMap_object___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) characteristicTypeValues];
  id v5 = [v3 characteristicType];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F47B18]);
    id v8 = [*(id *)(a1 + 40) home];
    char v9 = (void *)[v7 initWithHome:v8];

    [v9 setCharacteristic:v3];
    [v9 setTargetValue:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSArray)rooms
{
  return self->_rooms;
}

- (void)setRooms:(id)a3
{
}

- (NSArray)activeTemplates
{
  return self->_activeTemplates;
}

- (void)setActiveTemplates:(id)a3
{
}

- (NSArray)homeTriggerBuilders
{
  return self->_homeTriggerBuilders;
}

- (void)setHomeTriggerBuilders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeTriggerBuilders, 0);
  objc_storeStrong((id *)&self->_activeTemplates, 0);

  objc_storeStrong((id *)&self->_rooms, 0);
}

@end