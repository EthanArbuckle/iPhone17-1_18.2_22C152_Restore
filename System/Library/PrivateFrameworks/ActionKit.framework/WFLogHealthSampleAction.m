@interface WFLogHealthSampleAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSDate)currentDate;
- (id)appIdentifier;
- (id)dateForParameterValueWithKey:(id)a3 error:(id *)a4;
- (id)generatedResourceNodes;
- (id)localizedSmartPromptUsageSentenceWithcontentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)outputContentClasses;
- (id)parametersRequiringUserInputAlongsideParameter:(id)a3;
- (void)forceUpdateSelectedUnit;
- (void)handleWithCategoryType:(id)a3;
- (void)handleWithQuantityType:(id)a3;
- (void)initializeParameters;
- (void)resourceAvailabilityChanged;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)saveObject:(id)a3 withObjectType:(id)a4 item:(id)a5;
- (void)setCurrentDate:(id)a3;
- (void)updateParameterStates;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFLogHealthSampleAction

- (void).cxx_destruct
{
}

- (void)setCurrentDate:(id)a3
{
}

- (NSDate)currentDate
{
  currentDate = self->_currentDate;
  if (!currentDate)
  {
    v4 = [MEMORY[0x263EFF910] date];
    v5 = self->_currentDate;
    self->_currentDate = v4;

    currentDate = self->_currentDate;
  }
  return currentDate;
}

- (id)localizedSmartPromptUsageSentenceWithcontentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  v9 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in a new Health sample?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (id)appIdentifier
{
  return (id)*MEMORY[0x263F85500];
}

- (void)saveObject:(id)a3 withObjectType:(id)a4 item:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F0A410];
  id v9 = a3;
  v10 = objc_msgSend(v8, "wf_shortcutsAppHealthStore");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__WFLogHealthSampleAction_saveObject_withObjectType_item___block_invoke;
  v12[3] = &unk_264E5C218;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 saveObject:v9 withCompletion:v12];
}

void __58__WFLogHealthSampleAction_saveObject_withObjectType_item___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v6 = a3;
  v5 = [v4 output];
  [v5 addItem:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)forceUpdateSelectedUnit
{
  v3 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleQuantity"];
  [v3 updatePossibleUnits];
  v4 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleAdditionalQuantity"];
  [v4 updatePossibleUnits];
  v5 = [(WFLogHealthSampleAction *)self parameterStateForKey:@"WFQuantitySampleType"];
  id v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v5 value];
    if (v8)
    {
      id v9 = (void *)v8;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __50__WFLogHealthSampleAction_forceUpdateSelectedUnit__block_invoke;
      v11[3] = &unk_264E5C1F0;
      id v12 = v3;
      id v13 = v9;
      v14 = self;
      id v10 = v9;
      +[WFHealthKitHelper validUnitsForQuantityType:v10 completion:v11];
    }
  }
}

void __50__WFLogHealthSampleAction_forceUpdateSelectedUnit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__WFLogHealthSampleAction_forceUpdateSelectedUnit__block_invoke_2;
  v5[3] = &unk_264E5D3E0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 48);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __50__WFLogHealthSampleAction_forceUpdateSelectedUnit__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) quantityType];
  int v3 = [v2 isEqual:*(void *)(v1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(v1 + 48) valueForKey:@"unitString"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v26[0] = @"WFQuantitySampleQuantity";
    v26[1] = @"WFQuantitySampleAdditionalQuantity";
    id obj = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        uint64_t v20 = v6;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
          id v10 = objc_msgSend(*(id *)(v1 + 56), "parameterStateForKey:", v9, v20);
          id v11 = [v10 unitString];
          char v12 = [v4 containsObject:v11];

          if ((v12 & 1) == 0)
          {
            id v13 = *(void **)(v1 + 56);
            id v14 = objc_alloc(MEMORY[0x263F86DF8]);
            [v10 magnitudeState];
            uint64_t v15 = v1;
            v17 = uint64_t v16 = v7;
            v18 = [v4 firstObject];
            v19 = (void *)[v14 initWithMagnitudeState:v17 unitString:v18];
            [v13 setParameterState:v19 forKey:v9];

            uint64_t v7 = v16;
            uint64_t v1 = v15;
            uint64_t v6 = v20;
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }
  }
}

- (void)updateParameterStates
{
  id v17 = [(WFLogHealthSampleAction *)self parameterStateForKey:@"WFQuantitySampleType"];
  int v3 = [v17 value];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleDate"];
  [v6 setSampleType:v5];
  uint64_t v7 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFSampleEndDate"];
  [v7 setSampleType:v5];
  id v8 = v5;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  id v11 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFCategorySampleEnumeration"];
  [v11 setCategoryType:v10];
  char v12 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFCategorySampleAdditionalEnumerationKey"];
  [v12 setCategoryType:v10];
  id v13 = v8;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v14;

  uint64_t v16 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleAdditionalEnumeration"];
  [v16 setQuantityType:v15];
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFLogHealthSampleAction;
  BOOL v7 = [(WFLogHealthSampleAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFQuantitySampleType"])
  {
    [(WFLogHealthSampleAction *)self recreateResourcesIfNeeded];
    [(WFLogHealthSampleAction *)self forceUpdateSelectedUnit];
    [(WFLogHealthSampleAction *)self updateParameterStates];
    [(WFLogHealthSampleAction *)self outputDetailsUpdated];
  }

  return v7;
}

- (void)resourceAvailabilityChanged
{
  [(WFLogHealthSampleAction *)self forceUpdateSelectedUnit];
  [(WFLogHealthSampleAction *)self updateParameterStates];
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFLogHealthSampleAction;
  [(WFLogHealthSampleAction *)&v5 wasRemovedFromWorkflow:a3];
  id v4 = [(WFLogHealthSampleAction *)self resourceManager];
  [v4 removeTarget:self selector:sel_resourceAvailabilityChanged];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFLogHealthSampleAction;
  [(WFLogHealthSampleAction *)&v5 wasAddedToWorkflow:a3];
  id v4 = [(WFLogHealthSampleAction *)self resourceManager];
  [v4 addTarget:self selector:sel_resourceAvailabilityChanged];
}

- (id)parametersRequiringUserInputAlongsideParameter:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 key];
  int v6 = [v5 isEqualToString:@"WFQuantitySampleType"];

  if (v6)
  {
    BOOL v7 = (void *)MEMORY[0x263EFFA08];
    id v8 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleQuantity"];
    objc_super v9 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleAdditionalQuantity"];
    id v10 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFCategorySampleEnumeration"];
    id v11 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFCategorySampleAdditionalEnumerationKey"];
    char v12 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleDate"];
    id v13 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFSampleEndDate"];
    id v14 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, 0);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFLogHealthSampleAction;
    id v14 = [(WFLogHealthSampleAction *)&v16 parametersRequiringUserInputAlongsideParameter:v4];
  }

  return v14;
}

- (void)initializeParameters
{
  v9.receiver = self;
  v9.super_class = (Class)WFLogHealthSampleAction;
  [(WFLogHealthSampleAction *)&v9 initializeParameters];
  int v3 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleQuantity"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  [v5 setAction:self];
  int v6 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFQuantitySampleAdditionalQuantity"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = v7;

  [v8 setAction:self];
  [(WFLogHealthSampleAction *)self updateParameterStates];
}

- (id)outputContentClasses
{
  v10[1] = *MEMORY[0x263EF8340];
  int v3 = [(WFLogHealthSampleAction *)self parameterStateForKey:@"WFQuantitySampleType"];
  id v4 = [v3 value];
  id v5 = [v4 identifier];

  if (([v5 isEqualToString:*MEMORY[0x263F09C28]] & 1) != 0
    || [v5 isEqualToString:*MEMORY[0x263F09C20]])
  {
    v10[0] = objc_opt_class();
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFLogHealthSampleAction;
    uint64_t v6 = [(WFLogHealthSampleAction *)&v9 outputContentClasses];
  }
  BOOL v7 = (void *)v6;

  return v7;
}

- (id)dateForParameterValueWithKey:(id)a3 error:(id *)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(WFLogHealthSampleAction *)self parameterValueForKey:v6 ofClass:objc_opt_class()];

  if (![v7 length])
  {
    objc_super v9 = [(WFLogHealthSampleAction *)self currentDate];
    if (!v9) {
      goto LABEL_5;
    }
LABEL_6:
    id v10 = v9;
    goto LABEL_7;
  }
  id v8 = [MEMORY[0x263F33840] datesInString:v7 error:a4];
  objc_super v9 = [v8 firstObject];

  if (v9) {
    goto LABEL_6;
  }
LABEL_5:
  if (*a4) {
    goto LABEL_6;
  }
  char v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v13 = *MEMORY[0x263F870B8];
  v17[0] = *MEMORY[0x263F08338];
  id v14 = WFLocalizedString(@"Invalid Date");
  v18[0] = v14;
  v17[1] = *MEMORY[0x263F08320];
  id v15 = WFLocalizedString(@"An invalid date was provided. Please provide a date for the sample or leave the date field blank to use the current date.");
  v18[1] = v15;
  objc_super v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  *a4 = [v12 errorWithDomain:v13 code:5 userInfo:v16];

LABEL_7:
  return v9;
}

- (void)handleWithQuantityType:(id)a3
{
  v54[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFLogHealthSampleAction *)self parameterValueForKey:@"WFQuantitySampleQuantity" ofClass:objc_opt_class()];
  id v6 = [(WFLogHealthSampleAction *)self parameterValueForKey:@"WFQuantitySampleAdditionalQuantity" ofClass:objc_opt_class()];
  BOOL v7 = dispatch_group_create();
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__46357;
  v51 = __Block_byref_object_dispose__46358;
  id v8 = [v5 unitString];
  if (v8)
  {
    objc_super v9 = (void *)MEMORY[0x263F0A830];
    id v10 = [v5 unitString];
    objc_msgSend(v9, "wf_safeUnitFromString:", v10);
    id v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v52 = 0;
  }

  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__46357;
  v45 = __Block_byref_object_dispose__46358;
  id v11 = [v6 unitString];
  if (v11)
  {
    char v12 = (void *)MEMORY[0x263F0A830];
    uint64_t v13 = [v6 unitString];
    objc_msgSend(v12, "wf_safeUnitFromString:", v13);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v46 = 0;
  }

  if (!v48[5] || !v42[5])
  {
    dispatch_group_enter(v7);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __50__WFLogHealthSampleAction_handleWithQuantityType___block_invoke;
    v37[3] = &unk_264E5C1A0;
    v39 = &v47;
    v40 = &v41;
    v38 = v7;
    +[WFHealthKitHelper validUnitsForQuantityType:v4 completion:v37];
  }
  id v36 = 0;
  id v14 = [(WFLogHealthSampleAction *)self dateForParameterValueWithKey:@"WFQuantitySampleDate" error:&v36];
  id v15 = v36;
  if (!v15)
  {
    id v35 = 0;
    id v17 = [(WFLogHealthSampleAction *)self dateForParameterValueWithKey:@"WFSampleEndDate" error:&v35];
    id v16 = v35;
    v18 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFSampleEndDate"];
    char v19 = [v18 isHidden];

    if (v19)
    {
      id v20 = v14;

      id v17 = v20;
    }
    else
    {
      if (v16)
      {
        [(WFLogHealthSampleAction *)self finishRunningWithError:v16];
        goto LABEL_19;
      }
      if ([v14 compare:v17] != -1)
      {
        long long v22 = (void *)MEMORY[0x263F087E8];
        v53[0] = *MEMORY[0x263F08338];
        v26 = WFLocalizedString(@"Invalid Date Range");
        v54[0] = v26;
        v53[1] = *MEMORY[0x263F08320];
        long long v25 = WFLocalizedString(@"Please select an end date that is after the start date.");
        v54[1] = v25;
        long long v23 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
        long long v24 = [v22 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v23];
        [(WFLogHealthSampleAction *)self finishRunningWithError:v24];

        goto LABEL_19;
      }
    }
    v21 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__WFLogHealthSampleAction_handleWithQuantityType___block_invoke_2;
    block[3] = &unk_264E5C1C8;
    v34 = &v41;
    v33 = &v47;
    block[4] = self;
    id v28 = v5;
    id v29 = v6;
    id v30 = v4;
    id v31 = v14;
    id v17 = v17;
    id v32 = v17;
    dispatch_group_notify(v7, v21, block);

LABEL_19:
    goto LABEL_20;
  }
  id v16 = v15;
  [(WFLogHealthSampleAction *)self finishRunningWithError:v15];
LABEL_20:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
}

void __50__WFLogHealthSampleAction_handleWithQuantityType___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v3 = [v9 firstObject];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [v9 firstObject];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __50__WFLogHealthSampleAction_handleWithQuantityType___block_invoke_2(uint64_t a1)
{
  v71[2] = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    v2 = [*(id *)(a1 + 40) magnitude];
    [v2 doubleValue];
    double v4 = v3;

    id v5 = [*(id *)(a1 + 48) magnitude];
    [v5 doubleValue];
    double v7 = v6;

    id v8 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    id v9 = [MEMORY[0x263F0A830] percentUnit];
    LODWORD(v8) = [v8 isEqual:v9];

    if (v8) {
      double v10 = v4 / 100.0;
    }
    else {
      double v10 = v4;
    }
    id v11 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    char v12 = [MEMORY[0x263F0A830] percentUnit];
    LODWORD(v11) = [v11 isEqual:v12];

    if (v11) {
      double v13 = v7 / 100.0;
    }
    else {
      double v13 = v7;
    }
    id v14 = [MEMORY[0x263F0A630] quantityWithUnit:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) doubleValue:v10];
    id v15 = [*(id *)(a1 + 56) identifier];
    uint64_t v16 = *MEMORY[0x263F09C28];
    if ([v15 isEqualToString:*MEMORY[0x263F09C28]])
    {

      uint64_t v17 = *MEMORY[0x263F09C20];
LABEL_13:
      v60 = [MEMORY[0x263F0A630] quantityWithUnit:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) doubleValue:v13];
      v61 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v16];
      v26 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v17];
      v27 = [MEMORY[0x263F0A648] quantitySampleWithType:v61 quantity:v14 startDate:*(void *)(a1 + 64) endDate:*(void *)(a1 + 72)];
      id v28 = [MEMORY[0x263F0A648] quantitySampleWithType:v26 quantity:v60 startDate:*(void *)(a1 + 64) endDate:*(void *)(a1 + 72)];
      [MEMORY[0x263F0A278] correlationTypeForIdentifier:*MEMORY[0x263F094C0]];
      v30 = id v29 = v14;
      id v31 = (void *)MEMORY[0x263F0A268];
      uint64_t v33 = *(void *)(a1 + 64);
      uint64_t v32 = *(void *)(a1 + 72);
      v34 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v27, v28, 0);
      uint64_t v35 = [v31 correlationWithType:v30 startDate:v33 endDate:v32 objects:v34];

      uint64_t v36 = [MEMORY[0x263F337C8] itemWithObject:v35];

      id v14 = v29;
LABEL_30:
      [*(id *)(a1 + 32) saveObject:v35 withObjectType:*(void *)(a1 + 56) item:v36];
      long long v22 = (void *)v36;
      v21 = (void *)v35;
      goto LABEL_31;
    }
    long long v24 = [*(id *)(a1 + 56) identifier];
    uint64_t v17 = *MEMORY[0x263F09C20];
    int v25 = [v24 isEqualToString:*MEMORY[0x263F09C20]];

    if (v25) {
      goto LABEL_13;
    }
    long long v22 = [*(id *)(a1 + 32) parameterValueForKey:@"WFQuantitySampleAdditionalEnumeration" ofClass:objc_opt_class()];
    if (!v22)
    {
      v21 = 0;
      uint64_t v38 = *MEMORY[0x263F09E60];
      goto LABEL_25;
    }
    v37 = [*(id *)(a1 + 56) identifier];
    uint64_t v38 = *MEMORY[0x263F09E60];
    int v39 = [v37 isEqualToString:*MEMORY[0x263F09E60]];

    if (v39)
    {
      int64_t v40 = +[WFHealthKitHelper enumFromReadableInsulinDeliveryReason:v22];
      uint64_t v68 = *MEMORY[0x263F09AA8];
      uint64_t v41 = [NSNumber numberWithInteger:v40];
      v69 = v41;
      v42 = NSDictionary;
      uint64_t v43 = &v69;
      v44 = &v68;
LABEL_23:
      v21 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];

      goto LABEL_25;
    }
    v45 = [*(id *)(a1 + 56) identifier];
    int v46 = [v45 isEqualToString:*MEMORY[0x263F09C18]];

    if (v46)
    {
      int64_t v47 = +[WFHealthKitHelper enumFromReadableBloodGlucoseMealTime:v22];
      if (v47)
      {
        uint64_t v66 = *MEMORY[0x263F09A50];
        uint64_t v41 = [NSNumber numberWithInteger:v47];
        v67 = v41;
        v42 = NSDictionary;
        uint64_t v43 = &v67;
        v44 = &v66;
        goto LABEL_23;
      }
    }
    else
    {
      v48 = [*(id *)(a1 + 56) identifier];
      int v49 = [v48 isEqualToString:*MEMORY[0x263F09F20]];

      if (v49)
      {
        int64_t v50 = +[WFHealthKitHelper enumFromReadableVO2MaxTestType:v22];
        uint64_t v64 = *MEMORY[0x263F09B08];
        uint64_t v41 = [NSNumber numberWithInteger:v50];
        v65 = v41;
        v42 = NSDictionary;
        uint64_t v43 = &v65;
        v44 = &v64;
        goto LABEL_23;
      }
    }
    v21 = 0;
LABEL_25:
    v51 = [*(id *)(a1 + 56) identifier];
    if ([v51 isEqualToString:v38])
    {
      id v52 = [v21 objectForKeyedSubscript:*MEMORY[0x263F09AA8]];

      if (!v52)
      {
        v53 = *(void **)(a1 + 32);
        v54 = (void *)MEMORY[0x263F087E8];
        uint64_t v55 = *MEMORY[0x263F870B8];
        v62[0] = *MEMORY[0x263F08338];
        v56 = WFLocalizedString(@"No Reason Selected");
        v63[0] = v56;
        v62[1] = *MEMORY[0x263F08320];
        v57 = WFLocalizedString(@"Please select an insulin delivery reason.");
        v63[1] = v57;
        v58 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
        v59 = [v54 errorWithDomain:v55 code:5 userInfo:v58];
        [v53 finishRunningWithError:v59];

        goto LABEL_31;
      }
    }
    else
    {
    }
    uint64_t v35 = [MEMORY[0x263F0A648] quantitySampleWithType:*(void *)(a1 + 56) quantity:v14 startDate:*(void *)(a1 + 64) endDate:*(void *)(a1 + 72) metadata:v21];
    uint64_t v36 = +[WFHKSampleContentItem itemWithQuantitySample:v35 unit:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

    goto LABEL_30;
  }
  v18 = *(void **)(a1 + 32);
  char v19 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = *MEMORY[0x263F870B8];
  v70[0] = *MEMORY[0x263F08338];
  id v14 = WFLocalizedString(@"No Unit Selected");
  v71[0] = v14;
  v70[1] = *MEMORY[0x263F08320];
  v21 = WFLocalizedString(@"Please select a unit of measurement for this Health sample.");
  v71[1] = v21;
  long long v22 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
  long long v23 = [v19 errorWithDomain:v20 code:5 userInfo:v22];
  [v18 finishRunningWithError:v23];

LABEL_31:
}

- (void)handleWithCategoryType:(id)a3
{
  v92[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v76 = 0;
  id v5 = [(WFLogHealthSampleAction *)self dateForParameterValueWithKey:@"WFQuantitySampleDate" error:&v76];
  id v6 = v76;
  if (!v6)
  {
    id v75 = 0;
    id v8 = [(WFLogHealthSampleAction *)self dateForParameterValueWithKey:@"WFSampleEndDate" error:&v75];
    id v7 = v75;
    id v9 = [(WFLogHealthSampleAction *)self parameterForKey:@"WFSampleEndDate"];
    char v10 = [v9 isHidden];

    if (v10) {
      goto LABEL_4;
    }
    if (v7)
    {
      [(WFLogHealthSampleAction *)self finishRunningWithError:v7];
    }
    else
    {
      if ([v5 compare:v8] == -1)
      {
LABEL_4:
        id v11 = [(WFLogHealthSampleAction *)self parameterValueForKey:@"WFCategorySampleEnumeration" ofClass:objc_opt_class()];
        char v12 = [v4 identifier];
        int v13 = [v12 isEqualToString:*MEMORY[0x263F09388]];

        if (v13)
        {
          id v14 = [MEMORY[0x263F0A150] categorySampleWithType:v4 value:0 startDate:v5 endDate:v8];
        }
        else
        {
          id v14 = 0;
        }
        id v15 = [v4 identifier];
        int v16 = [v15 isEqualToString:*MEMORY[0x263F09330]];

        if (v16)
        {
          uint64_t v17 = (void *)MEMORY[0x263F0A150];
          id v18 = v4;
          int64_t v19 = 0;
LABEL_20:
          id v31 = v5;
          uint64_t v32 = v5;
LABEL_21:
          [v17 categorySampleWithType:v18 value:v19 startDate:v31 endDate:v32];
          id v14 = v33 = v14;
LABEL_22:

          uint64_t v33 = [MEMORY[0x263F337C8] itemWithObject:v14];
          [(WFLogHealthSampleAction *)self saveObject:v14 withObjectType:v4 item:v33];
LABEL_23:

          goto LABEL_24;
        }
        uint64_t v20 = [v4 identifier];
        int v21 = [v20 isEqualToString:*MEMORY[0x263F09278]];

        if (v21)
        {
          if (!v11)
          {
            v74 = (void *)MEMORY[0x263F087E8];
            uint64_t v38 = *MEMORY[0x263F870B8];
            v89[0] = *MEMORY[0x263F08338];
            uint64_t v33 = WFLocalizedString(@"No Value Selected");
            v90[0] = v33;
            v89[1] = *MEMORY[0x263F08320];
            v69 = WFLocalizedString(@"Please select a value for this cervical mucus quality sample.");
            v90[1] = v69;
            int v39 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
            int64_t v40 = [v74 errorWithDomain:v38 code:5 userInfo:v39];
            [(WFLogHealthSampleAction *)self finishRunningWithError:v40];

            id v11 = 0;
            goto LABEL_23;
          }
          int64_t v22 = +[WFHealthKitHelper enumFromReadableCervicalMucusQuality:v11];
          goto LABEL_19;
        }
        v73 = v11;
        id v29 = [v4 identifier];
        int v30 = [v29 isEqualToString:*MEMORY[0x263F093A8]];

        if (v30)
        {
          id v11 = v73;
          if (v73)
          {
            int64_t v22 = +[WFHealthKitHelper enumFromReadableOvulationTestResult:v73];
LABEL_19:
            int64_t v19 = v22;
            uint64_t v17 = (void *)MEMORY[0x263F0A150];
            id v18 = v4;
            goto LABEL_20;
          }
          uint64_t v43 = (void *)MEMORY[0x263F087E8];
          uint64_t v70 = *MEMORY[0x263F870B8];
          v87[0] = *MEMORY[0x263F08338];
          uint64_t v33 = WFLocalizedString(@"No Value Selected");
          v88[0] = v33;
          v87[1] = *MEMORY[0x263F08320];
          v44 = WFLocalizedString(@"Please select a value for this ovulation test result sample.");
          v88[1] = v44;
          v45 = NSDictionary;
          int v46 = v88;
          int64_t v47 = v87;
LABEL_44:
          v58 = [v45 dictionaryWithObjects:v46 forKeys:v47 count:2];
          v59 = [v43 errorWithDomain:v70 code:5 userInfo:v58];
          [(WFLogHealthSampleAction *)self finishRunningWithError:v59];

          id v11 = 0;
          goto LABEL_23;
        }
        v34 = [v4 identifier];
        int v35 = [v34 isEqualToString:*MEMORY[0x263F093F0]];

        if (v35)
        {
          uint64_t v36 = +[WFHealthKitHelper BOOLFromReadableSexualActivity:v73];
          uint64_t v33 = (void *)v36;
          if (v73)
          {
            uint64_t v85 = *MEMORY[0x263F09AD8];
            uint64_t v86 = v36;
            v37 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          }
          else
          {
            v37 = (void *)MEMORY[0x263EFFA78];
          }
          uint64_t v57 = [MEMORY[0x263F0A150] categorySampleWithType:v4 value:0 startDate:v5 endDate:v5 metadata:v37];
        }
        else
        {
          uint64_t v41 = [v4 identifier];
          int v42 = [v41 isEqualToString:*MEMORY[0x263F09410]];

          if (v42)
          {
            id v11 = v73;
            if (v73)
            {
              int64_t v19 = +[WFHealthKitHelper enumFromReadableSleepAnalysis:v73];
              uint64_t v17 = (void *)MEMORY[0x263F0A150];
              id v18 = v4;
              id v31 = v5;
              uint64_t v32 = v8;
              goto LABEL_21;
            }
            uint64_t v43 = (void *)MEMORY[0x263F087E8];
            uint64_t v70 = *MEMORY[0x263F870B8];
            v83[0] = *MEMORY[0x263F08338];
            uint64_t v33 = WFLocalizedString(@"No Value Selected");
            v84[0] = v33;
            v83[1] = *MEMORY[0x263F08320];
            v44 = WFLocalizedString(@"Please select a value for this sleep analysis sample.");
            v84[1] = v44;
            v45 = NSDictionary;
            int v46 = v84;
            int64_t v47 = v83;
            goto LABEL_44;
          }
          v48 = [v4 identifier];
          int v49 = [v48 isEqualToString:*MEMORY[0x263F09380]];

          if (!v49)
          {
            [MEMORY[0x263F0A150] categorySampleWithType:v4 value:0 startDate:v5 endDate:v8];
            id v14 = v33 = v14;
            goto LABEL_41;
          }
          if (!v73)
          {
            v60 = (void *)MEMORY[0x263F087E8];
            uint64_t v71 = *MEMORY[0x263F870B8];
            v81[0] = *MEMORY[0x263F08338];
            uint64_t v33 = WFLocalizedString(@"No Value Selected");
            v82[0] = v33;
            v81[1] = *MEMORY[0x263F08320];
            v67 = WFLocalizedString(@"Please select a value for this menstruation sample.");
            v82[1] = v67;
            v61 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
            v62 = [v60 errorWithDomain:v71 code:5 userInfo:v61];
            [(WFLogHealthSampleAction *)self finishRunningWithError:v62];

            id v11 = 0;
            goto LABEL_23;
          }
          int64_t v50 = +[WFHealthKitHelper enumFromReadableMenstrualFlow:v73];
          uint64_t v33 = [(WFLogHealthSampleAction *)self parameterValueForKey:@"WFCategorySampleAdditionalEnumerationKey" ofClass:objc_opt_class()];
          uint64_t v51 = +[WFHealthKitHelper BOOLFromReadableMenstrualFlowIsStartOfCycle:v33];
          if (!v51)
          {
            uint64_t v68 = (void *)MEMORY[0x263F087E8];
            uint64_t v63 = *MEMORY[0x263F870B8];
            v79[0] = *MEMORY[0x263F08338];
            v72 = WFLocalizedString(@"No Value Selected");
            v80[0] = v72;
            v79[1] = *MEMORY[0x263F08320];
            uint64_t v64 = WFLocalizedString(@"Please select whether or not this sample was at the start of a cycle.");
            v80[1] = v64;
            v65 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
            uint64_t v66 = [v68 errorWithDomain:v63 code:5 userInfo:v65];
            [(WFLogHealthSampleAction *)self finishRunningWithError:v66];

            id v11 = v73;
            goto LABEL_23;
          }
          id v52 = (void *)v51;
          v53 = (void *)MEMORY[0x263F0A150];
          uint64_t v77 = *MEMORY[0x263F09AC0];
          uint64_t v78 = v51;
          uint64_t v54 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          int64_t v55 = v50;
          v56 = (void *)v54;
          uint64_t v57 = [v53 categorySampleWithType:v4 value:v55 startDate:v5 endDate:v5 metadata:v54];
        }
        id v14 = (void *)v57;
LABEL_41:
        id v11 = v73;
        goto LABEL_22;
      }
      long long v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F870B8];
      v91[0] = *MEMORY[0x263F08338];
      int v25 = WFLocalizedString(@"Invalid Date Range");
      v92[0] = v25;
      v91[1] = *MEMORY[0x263F08320];
      v26 = WFLocalizedString(@"Please select an end date that is after the start date.");
      v92[1] = v26;
      v27 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
      id v28 = [v23 errorWithDomain:v24 code:5 userInfo:v27];
      [(WFLogHealthSampleAction *)self finishRunningWithError:v28];
    }
LABEL_24:

    goto LABEL_25;
  }
  id v7 = v6;
  [(WFLogHealthSampleAction *)self finishRunningWithError:v6];
LABEL_25:
}

- (id)generatedResourceNodes
{
  v19[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)WFLogHealthSampleAction;
  double v3 = [(WFLogHealthSampleAction *)&v16 generatedResourceNodes];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(WFLogHealthSampleAction *)self parameterStateForKey:@"WFQuantitySampleType"];
  id v6 = [v5 value];
  if (v6)
  {
    id v7 = [WFHealthKitAccessResource alloc];
    v17[0] = *MEMORY[0x263F873F8];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    v18[0] = v9;
    v18[1] = @"Write";
    v17[1] = @"AccessType";
    void v17[2] = @"ReadableType";
    v17[3] = @"ObjectType";
    v18[2] = @"Quantity";
    void v18[3] = v6;
    char v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
    id v11 = [(WFHealthKitAccessResource *)v7 initWithDefinition:v10];
    v19[0] = v11;
    char v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];

    int v13 = objc_msgSend(v12, "if_map:", &__block_literal_global_46431);
    [v4 addObjectsFromArray:v13];
    id v14 = v4;
  }
  else
  {
    id v14 = (id)MEMORY[0x263EFFA68];
  }

  return v14;
}

id __49__WFLogHealthSampleAction_generatedResourceNodes__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86E30];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithResource:v3];

  return v4;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = [(WFLogHealthSampleAction *)self parameterValueForKey:@"WFQuantitySampleType" ofClass:objc_opt_class()];
  if (v4)
  {
    [(WFLogHealthSampleAction *)self setCurrentDate:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(WFLogHealthSampleAction *)self handleWithCategoryType:v4];
    }
    else {
      [(WFLogHealthSampleAction *)self handleWithQuantityType:v4];
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F870B8];
    v11[0] = *MEMORY[0x263F08338];
    id v7 = WFLocalizedString(@"No Type Selected");
    v12[0] = v7;
    v11[1] = *MEMORY[0x263F08320];
    id v8 = WFLocalizedString(@"Please select a type for this Health sample.");
    v12[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    char v10 = [v5 errorWithDomain:v6 code:5 userInfo:v9];
    [(WFLogHealthSampleAction *)self finishRunningWithError:v10];
  }
}

@end