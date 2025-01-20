@interface WFWorkoutGoalQuantityFieldParameter
+ (id)unitConversion;
- (BOOL)parameterStateIsValid:(id)a3;
- (WFAction)action;
- (id)currentWorkoutActivityType;
- (id)defaultSerializedRepresentation;
- (id)defaultState;
- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5;
- (id)possibleUnits;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)availableUnitsForWorkoutActivityType:(id)a3 completion:(id)a4;
- (void)setAction:(id)a3;
- (void)setPossibleUnits:(id)a3;
- (void)updateCurrentStateWithNewUnitString:(id)a3 currentState:(id)a4;
- (void)updatePossibleUnits;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFWorkoutGoalQuantityFieldParameter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_defaultSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_possibleUnits, 0);
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)setPossibleUnits:(id)a3
{
}

- (id)possibleUnits
{
  return self->_possibleUnits;
}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  v6 = (void *)MEMORY[0x263F0A830];
  id v7 = a4;
  v8 = objc_msgSend(v6, "wf_safeUnitFromString:", a3);
  v9 = NSNumber;
  [v7 doubleValue];
  double v11 = v10;

  v12 = [v9 numberWithDouble:v11];
  v13 = +[WFHealthKitHelper localizedDisplayNameForUnit:v8 value:v12];

  return v13;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkoutGoalQuantityFieldParameter *)self possibleUnits];

  if (v5)
  {
    v6 = [(WFWorkoutGoalQuantityFieldParameter *)self possibleUnits];
    id v7 = [v4 unitString];
    char v8 = [v6 containsObject:v7];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)updatePossibleUnits
{
  v3 = [(WFWorkoutGoalQuantityFieldParameter *)self action];
  id v4 = [(WFWorkoutGoalQuantityFieldParameter *)self key];
  v5 = [v3 parameterStateForKey:v4];

  v6 = [v5 unitString];
  id v7 = (void *)[v6 copy];

  char v8 = [MEMORY[0x263F0A830] unitFromString:v7];
  v9 = +[WFWorkoutGoalQuantityFieldParameter unitConversion];
  double v10 = [v9 objectForKey:v8];

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__19484;
  v22[4] = __Block_byref_object_dispose__19485;
  id v23 = 0;
  double v11 = [(WFWorkoutGoalQuantityFieldParameter *)self currentWorkoutActivityType];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke;
  v16[3] = &unk_264E58730;
  v16[4] = self;
  id v12 = v8;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  v21 = v22;
  id v14 = v7;
  id v19 = v14;
  id v15 = v5;
  id v20 = v15;
  +[WFFitnessUIHelper preferredUnitsForActivityType:v11 completion:v16];

  _Block_object_dispose(v22, 8);
}

void __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke(uint64_t a1, void *a2)
{
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke_2;
  v15[3] = &unk_264E586E0;
  id v4 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  id v17 = v5;
  uint64_t v19 = v6;
  id v18 = *(id *)(a1 + 56);
  id v7 = objc_msgSend(a2, "if_map:", v15);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke_3;
  v10[3] = &unk_264E58708;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v7;
  char v8 = *(void **)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  id v12 = v8;
  id v13 = *(id *)(a1 + 56);
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

id __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 unitString];
  if (!*(void *)(*(void *)(a1 + 32) + 184))
  {
    if (*(void *)(a1 + 40))
    {
      double v10 = *(void **)(a1 + 48);
      if (v10)
      {
        if ([v10 containsObject:v5]) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v6);
        }
      }
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 184) count] > a3)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 184) objectAtIndexedSubscript:a3];
    char v8 = v7;
    if (v7) {
      char v9 = [v7 isEqualToString:v6];
    }
    else {
      char v9 = 1;
    }
    int v11 = [*(id *)(a1 + 56) isEqualToString:v8];
    if ((v9 & 1) == 0 && v11) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v6);
    }
  }
  return v6;
}

void __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(a1 + 40));
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "updateCurrentStateWithNewUnitString:currentState:");
  }
  else
  {
    v3 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
    char v4 = [v3 containsObject:*(void *)(a1 + 56)];

    if ((v4 & 1) == 0)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) firstObject];
      [v5 updateCurrentStateWithNewUnitString:v6 currentState:*(void *)(a1 + 48)];
    }
  }
}

- (void)updateCurrentStateWithNewUnitString:(id)a3 currentState:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F86DF8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  double v10 = [v7 magnitudeState];

  id v13 = (id)[v9 initWithMagnitudeState:v10 unitString:v8];
  int v11 = [(WFWorkoutGoalQuantityFieldParameter *)self action];
  id v12 = [(WFWorkoutGoalQuantityFieldParameter *)self key];
  [v11 setParameterState:v13 forKey:v12];
}

- (id)defaultState
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(WFWorkoutGoalQuantityFieldParameter *)self definition];
  char v4 = [v3 objectForKey:*MEMORY[0x263F872E0]];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v15 = 136315906;
      id v16 = "WFEnforceClass";
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      uint64_t v22 = v5;
      id v9 = v20;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v15, 0x2Au);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  double v10 = [(WFWorkoutGoalQuantityFieldParameter *)self possibleUnits];
  int v11 = [v10 firstObject];

  if (v7) {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F86D48]) initWithValue:v7];
  }
  else {
    id v12 = 0;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x263F86DF8]) initWithMagnitudeState:v12 unitString:v11];

  return v13;
}

- (id)defaultSerializedRepresentation
{
  defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
  if (!defaultSerializedRepresentation)
  {
    char v4 = [(WFWorkoutGoalQuantityFieldParameter *)self defaultState];
    uint64_t v5 = [v4 serializedRepresentation];
    id v6 = self->_defaultSerializedRepresentation;
    self->_defaultSerializedRepresentation = v5;

    defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
  }
  return defaultSerializedRepresentation;
}

- (void)availableUnitsForWorkoutActivityType:(id)a3 completion:(id)a4
{
}

- (id)currentWorkoutActivityType
{
  v3 = [(WFWorkoutGoalQuantityFieldParameter *)self action];
  char v4 = [(WFWorkoutGoalQuantityFieldParameter *)self definition];
  uint64_t v5 = [v4 objectForKey:@"WFWorkoutGoalKey"];
  id v6 = [v3 parameterStateForKey:v5];

  id v7 = [v6 value];

  return v7;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = a4;
  id v6 = [(WFWorkoutGoalQuantityFieldParameter *)self definition];
  id v7 = [v6 objectForKey:@"WFWorkoutGoalKey"];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(WFWorkoutGoalQuantityFieldParameter *)self updatePossibleUnits];
  }
}

- (void)wasRemovedFromWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFWorkoutGoalQuantityFieldParameter;
  [(WFWorkoutGoalQuantityFieldParameter *)&v4 wasRemovedFromWorkflow];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F0A018] object:0];
}

- (void)wasAddedToWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFWorkoutGoalQuantityFieldParameter;
  [(WFWorkoutGoalQuantityFieldParameter *)&v4 wasAddedToWorkflow];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_updatePossibleUnits name:*MEMORY[0x263F0A018] object:0];
}

- (void)setAction:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_action);
    [v5 removeEventObserver:self];

    id v6 = objc_storeWeak((id *)&self->_action, obj);
    [obj addEventObserver:self];

    [(WFWorkoutGoalQuantityFieldParameter *)self updatePossibleUnits];
  }
}

+ (id)unitConversion
{
  v24[7] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F0A830] largeCalorieUnit];
  uint64_t v3 = [MEMORY[0x263F0A830] kilocalorieUnit];
  uint64_t v4 = [MEMORY[0x263F0A830] jouleUnitWithMetricPrefix:9];
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v2, v3, v4, 0);
  uint64_t v6 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  id v7 = [MEMORY[0x263F0A830] mileUnit];
  int v8 = [MEMORY[0x263F0A830] meterUnit];
  id v9 = [MEMORY[0x263F0A830] yardUnit];
  uint64_t v22 = (void *)v2;
  v23[0] = v2;
  __int16 v19 = [v5 setByRemovingObject:v2];
  v24[0] = v19;
  __int16 v21 = (void *)v3;
  v23[1] = v3;
  double v10 = [v5 setByRemovingObject:v3];
  v24[1] = v10;
  id v20 = (void *)v4;
  v23[2] = v4;
  int v11 = [v5 setByRemovingObject:v4];
  v24[2] = v11;
  id v18 = (void *)v6;
  v23[3] = v6;
  id v12 = [MEMORY[0x263EFFA08] setWithObject:v7];
  v24[3] = v12;
  v23[4] = v7;
  id v13 = [MEMORY[0x263EFFA08] setWithObject:v6];
  v24[4] = v13;
  v23[5] = v8;
  uint64_t v14 = [MEMORY[0x263EFFA08] setWithObject:v9];
  v24[5] = v14;
  v23[6] = v9;
  int v15 = [MEMORY[0x263EFFA08] setWithObject:v8];
  v24[6] = v15;
  id v17 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];

  return v17;
}

@end