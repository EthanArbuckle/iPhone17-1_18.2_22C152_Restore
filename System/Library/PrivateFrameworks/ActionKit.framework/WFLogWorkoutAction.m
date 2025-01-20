@interface WFLogWorkoutAction
- (HKWorkoutBuilder)builder;
- (id)appIdentifier;
- (id)disabledOnPlatforms;
- (id)localizedSmartPromptUsageSentenceWithcontentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (unint64_t)currentState;
- (void)addSamples:(id)a3;
- (void)beginCollection:(id)a3;
- (void)endCollection:(id)a3;
- (void)finishWorkout:(id)a3;
- (void)logWorkoutContinue:(id)a3;
- (void)resourceAvailabilityChanged;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setBuilder:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFLogWorkoutAction

- (void).cxx_destruct
{
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setBuilder:(id)a3
{
}

- (HKWorkoutBuilder)builder
{
  return self->_builder;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFLogWorkoutAction;
  v2 = [(WFLogWorkoutAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (void)finishWorkout:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WFLogWorkoutAction *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__WFLogWorkoutAction_finishWorkout___block_invoke;
  v7[3] = &unk_264E5DED8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__WFLogWorkoutAction_finishWorkout___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) builder];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__WFLogWorkoutAction_finishWorkout___block_invoke_2;
  v3[3] = &unk_264E5DF00;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 finishWorkoutWithCompletion:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __36__WFLogWorkoutAction_finishWorkout___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11)
  {
    v7 = [WeakRetained output];
    id v8 = [*(id *)(a1 + 32) distanceUnit];
    v9 = [*(id *)(a1 + 32) calorieUnit];
    v10 = +[WFHKWorkoutContentItem itemWithWorkout:v11 distanceUnit:v8 caloriesUnit:v9];
    [v7 addItem:v10];
  }
  [WeakRetained finishRunningWithError:v5];
}

- (void)endCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(WFLogWorkoutAction *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__WFLogWorkoutAction_endCollection___block_invoke;
  v7[3] = &unk_264E5DED8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__WFLogWorkoutAction_endCollection___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) builder];
  v3 = [*(id *)(a1 + 40) endDate];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__WFLogWorkoutAction_endCollection___block_invoke_2;
  v4[3] = &unk_264E5DEB0;
  objc_copyWeak(&v6, &location);
  id v5 = *(id *)(a1 + 40);
  [v2 endCollectionWithEndDate:v3 completion:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __36__WFLogWorkoutAction_endCollection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v6) {
    [WeakRetained finishRunningWithError:v6];
  }
  else {
    [WeakRetained logWorkoutContinue:*(void *)(a1 + 32)];
  }
}

- (void)addSamples:(id)a3
{
  id v4 = a3;
  id v5 = [(WFLogWorkoutAction *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__WFLogWorkoutAction_addSamples___block_invoke;
  v7[3] = &unk_264E5DED8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __33__WFLogWorkoutAction_addSamples___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = [*v2 builder];
  id v4 = [*(id *)(a1 + 40) caloriesSample];
  v11[0] = v4;
  id v5 = [*(id *)(a1 + 40) distanceSample];
  v11[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__WFLogWorkoutAction_addSamples___block_invoke_2;
  v7[3] = &unk_264E5DEB0;
  objc_copyWeak(&v9, &location);
  id v8 = *(id *)(a1 + 40);
  [v3 addSamples:v6 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__WFLogWorkoutAction_addSamples___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v6) {
    [WeakRetained finishRunningWithError:v6];
  }
  else {
    [WeakRetained logWorkoutContinue:*(void *)(a1 + 32)];
  }
}

- (void)beginCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(WFLogWorkoutAction *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__WFLogWorkoutAction_beginCollection___block_invoke;
  v7[3] = &unk_264E5DED8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__WFLogWorkoutAction_beginCollection___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) builder];
  v3 = [*(id *)(a1 + 40) startDate];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__WFLogWorkoutAction_beginCollection___block_invoke_2;
  v4[3] = &unk_264E5DEB0;
  objc_copyWeak(&v6, &location);
  id v5 = *(id *)(a1 + 40);
  [v2 beginCollectionWithStartDate:v3 completion:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__WFLogWorkoutAction_beginCollection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v6) {
    [WeakRetained finishRunningWithError:v6];
  }
  else {
    [WeakRetained logWorkoutContinue:*(void *)(a1 + 32)];
  }
}

- (void)logWorkoutContinue:(id)a3
{
  id v4 = a3;
  switch([(WFLogWorkoutAction *)self currentState])
  {
    case 0uLL:
      [(WFLogWorkoutAction *)self setCurrentState:1];
      [(WFLogWorkoutAction *)self beginCollection:v4];
      break;
    case 1uLL:
      [(WFLogWorkoutAction *)self setCurrentState:2];
      [(WFLogWorkoutAction *)self addSamples:v4];
      break;
    case 2uLL:
      [(WFLogWorkoutAction *)self setCurrentState:3];
      [(WFLogWorkoutAction *)self endCollection:v4];
      break;
    case 3uLL:
      [(WFLogWorkoutAction *)self setCurrentState:4];
      [(WFLogWorkoutAction *)self finishWorkout:v4];
      break;
    default:
      [(WFLogWorkoutAction *)self setCurrentState:0];
      break;
  }
}

- (id)localizedSmartPromptUsageSentenceWithcontentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  id v9 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in a new Workout?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (id)appIdentifier
{
  return (id)*MEMORY[0x263F85500];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v34[2] = *MEMORY[0x263EF8340];
  id v4 = [(WFLogWorkoutAction *)self parameterValueForKey:@"WFWorkoutReadableActivityType" ofClass:objc_opt_class()];
  id v5 = [(WFLogWorkoutAction *)self parameterValueForKey:@"WFWorkoutDate" ofClass:objc_opt_class()];
  id v6 = [(WFLogWorkoutAction *)self parameterValueForKey:@"WFWorkoutDuration" ofClass:objc_opt_class()];
  id v7 = [(WFLogWorkoutAction *)self parameterValueForKey:@"WFWorkoutCaloriesQuantity" ofClass:objc_opt_class()];
  id v8 = [(WFLogWorkoutAction *)self parameterValueForKey:@"WFWorkoutDistanceQuantity" ofClass:objc_opt_class()];
  unint64_t v9 = +[WFHealthKitHelper workoutActivityTypeFromReadableWorkoutActivityType:v4];
  if (+[WFHealthKitHelper readableWorkoutActivityTypeIsValid:v4])
  {
    v10 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09BC0]];
    id v11 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DE0]];
    [(WFLogWorkoutAction *)self setCurrentState:0];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_3;
    v24[3] = &unk_264E5DE88;
    v31 = &__block_literal_global_52527;
    id v25 = v11;
    id v26 = v8;
    id v27 = v6;
    id v28 = v10;
    unint64_t v32 = v9;
    v29 = self;
    id v30 = v5;
    id v12 = v10;
    id v13 = v11;
    __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke((uint64_t)v13, v12, v7, v24);

    v14 = v31;
  }
  else
  {
    v23 = v4;
    v15 = v8;
    v16 = v7;
    v17 = v6;
    v18 = v5;
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F870B8];
    v33[0] = *MEMORY[0x263F08338];
    WFLocalizedString(@"No Workout Type Selected");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v34[0] = v13;
    v33[1] = *MEMORY[0x263F08320];
    WFLocalizedString(@"Please select a type of activity for this workout.");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v34[1] = v12;
    v14 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    v21 = v19;
    id v5 = v18;
    id v6 = v17;
    id v7 = v16;
    id v8 = v15;
    id v4 = v23;
    v22 = [v21 errorWithDomain:v20 code:5 userInfo:v14];
    [(WFLogWorkoutAction *)self finishRunningWithError:v22];
  }
}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_4;
  v17[3] = &unk_264E5DE60;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v20 = v5;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 64);
  id v13 = *(void **)(a1 + 72);
  id v21 = v10;
  uint64_t v22 = v12;
  uint64_t v25 = v11;
  id v23 = v6;
  id v24 = v13;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v7 + 16);
  id v15 = v6;
  id v16 = v5;
  v14(v7, v8, v9, v17);
}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    uint64_t v10 = [v7 unitString];
    if (!v10) {
      goto LABEL_6;
    }
    uint64_t v11 = (void *)v10;
    uint64_t v12 = (void *)MEMORY[0x263F0A830];
    id v13 = [v7 unitString];
    v14 = objc_msgSend(v12, "wf_safeUnitFromString:", v13);

    if (v14)
    {
      id v15 = (void *)MEMORY[0x263F0A630];
      id v16 = [v7 magnitude];
      [v16 doubleValue];
      v17 = objc_msgSend(v15, "quantityWithUnit:doubleValue:", v14);
      ((void (**)(void, void *, void *))v9)[2](v9, v17, v14);
    }
    else
    {
LABEL_6:
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_2;
      v18[3] = &unk_264E5DDE8;
      id v20 = v9;
      id v19 = v7;
      +[WFHealthKitHelper validUnitsForQuantityType:v6 completion:v18];

      v14 = v20;
    }
  }
  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = [a2 firstObject];
  v3 = (void *)MEMORY[0x263F0A630];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) magnitude];
  [v5 doubleValue];
  id v6 = objc_msgSend(v3, "quantityWithUnit:doubleValue:", v7);
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v7);
}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_5;
  aBlock[3] = &unk_264E5DE10;
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 56);
  id v7 = v5;
  uint64_t v25 = *(void *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 72);
  id v21 = v7;
  uint64_t v22 = v8;
  id v23 = v9;
  id v10 = v6;
  id v24 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  if ([*(id *)(a1 + 80) length])
  {
    uint64_t v12 = [MEMORY[0x263F337C8] itemWithObject:*(void *)(a1 + 80)];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_6;
    v14[3] = &unk_264E5DE38;
    v14[4] = *(void *)(a1 + 64);
    id v15 = v11;
    [v12 getObjectRepresentation:v14 forClass:objc_opt_class()];
  }
  else
  {
    id v13 = [MEMORY[0x263EFF910] date];
    (*((void (**)(void *, void *))v11 + 2))(v11, v13);
  }
}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F86AD8];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 unitString];
  uint64_t v7 = [v3 calendarUnitFromUnitString:v6];

  uint64_t v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v9 = [*(id *)(a1 + 32) magnitude];
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", v7, objc_msgSend(v9, "integerValue"), v5, 0);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = [MEMORY[0x263F0A648] quantitySampleWithType:*(void *)(a1 + 40) quantity:*(void *)(a1 + 48) startDate:v5 endDate:v17];
  uint64_t v11 = [MEMORY[0x263F0A648] quantitySampleWithType:*(void *)(a1 + 56) quantity:*(void *)(a1 + 64) startDate:v5 endDate:v17];
  uint64_t v12 = objc_opt_new();
  [v12 setActivityType:*(void *)(a1 + 96)];
  id v13 = objc_alloc(MEMORY[0x263F0A908]);
  v14 = objc_msgSend(MEMORY[0x263F0A410], "wf_shortcutsAppHealthStore");
  id v15 = (void *)[v13 initWithHealthStore:v14 configuration:v12 device:0];
  [*(id *)(a1 + 72) setBuilder:v15];

  id v16 = [[WFLogWorkoutActionWorkout alloc] initWithStartDate:v5 endDate:v17 caloriesSample:v10 calorieUnit:*(void *)(a1 + 80) distanceSample:v11 distanceUnit:*(void *)(a1 + 88)];
  [*(id *)(a1 + 72) logWorkoutContinue:v16];
}

uint64_t __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
}

- (void)resourceAvailabilityChanged
{
  v3 = [(WFLogWorkoutAction *)self parameterForKey:@"WFWorkoutCaloriesQuantity"];
  [v3 updatePossibleUnits];

  id v4 = [(WFLogWorkoutAction *)self parameterForKey:@"WFWorkoutDistanceQuantity"];
  [v4 updatePossibleUnits];
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFLogWorkoutAction;
  [(WFLogWorkoutAction *)&v5 wasRemovedFromWorkflow:a3];
  id v4 = [(WFLogWorkoutAction *)self resourceManager];
  [v4 removeTarget:self selector:sel_resourceAvailabilityChanged];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFLogWorkoutAction;
  [(WFLogWorkoutAction *)&v5 wasAddedToWorkflow:a3];
  id v4 = [(WFLogWorkoutAction *)self resourceManager];
  [v4 addTarget:self selector:sel_resourceAvailabilityChanged];

  [(WFLogWorkoutAction *)self resourceAvailabilityChanged];
}

@end