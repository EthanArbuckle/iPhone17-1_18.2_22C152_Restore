@interface WFMeasurementCreateAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)currentUnit;
- (id)currentUnitTypeState;
- (id)currentValue;
- (id)parametersRequiringUserInputAlongsideParameter:(id)a3;
- (id)unitParameter;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFMeasurementCreateAction

- (id)currentUnitTypeState
{
  v2 = [(WFMeasurementCreateAction *)self parameterStateForKey:@"WFMeasurementUnitType"];
  v3 = [v2 value];

  return v3;
}

- (id)unitParameter
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(WFMeasurementCreateAction *)self parameterForKey:@"WFMeasurementUnit"];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = getWFGeneralLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315906;
      v10 = "WFEnforceClass";
      __int16 v11 = 2114;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      uint64_t v16 = v3;
      id v7 = v14;
      _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v9, 0x2Au);
    }
    id v5 = 0;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)parametersRequiringUserInputAlongsideParameter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  int v6 = [v5 isEqualToString:@"WFMeasurementUnitType"];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263EFFA08];
    v8 = [(WFMeasurementCreateAction *)self parameterForKey:@"WFMeasurementUnit"];
    int v9 = [v7 setWithObject:v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFMeasurementCreateAction;
    int v9 = [(WFMeasurementCreateAction *)&v11 parametersRequiringUserInputAlongsideParameter:v4];
  }

  return v9;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFMeasurementCreateAction;
  BOOL v7 = [(WFMeasurementCreateAction *)&v11 setParameterState:a3 forKey:v6];
  if (v7)
  {
    if ([v6 isEqualToString:@"WFMeasurementUnitType"])
    {
      v8 = [(WFMeasurementCreateAction *)self currentUnitTypeState];
      int v9 = [(WFMeasurementCreateAction *)self unitParameter];
      [v9 setUnitType:v8];
      [v9 setHidden:v8 == 0];
    }
    else if ([v6 isEqualToString:@"WFMeasurementUnit"])
    {
      [(WFMeasurementCreateAction *)self outputDetailsUpdated];
    }
  }

  return v7;
}

- (void)initializeParameters
{
  v6.receiver = self;
  v6.super_class = (Class)WFMeasurementCreateAction;
  [(WFMeasurementCreateAction *)&v6 initializeParameters];
  uint64_t v3 = [(WFMeasurementCreateAction *)self currentUnitTypeState];
  id v4 = [(WFMeasurementCreateAction *)self unitParameter];
  [v4 setUnitType:v3];

  id v5 = [(WFMeasurementCreateAction *)self unitParameter];
  [v5 setHidden:v3 == 0];
}

- (id)currentValue
{
  v2 = [(WFMeasurementCreateAction *)self parameterValueForKey:@"WFMeasurementUnit" ofClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 magnitude];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)currentUnit
{
  uint64_t v3 = [(WFMeasurementCreateAction *)self parameterValueForKey:@"WFMeasurementUnit" ofClass:objc_opt_class()];
  if (v3)
  {
    id v4 = [(WFMeasurementCreateAction *)self parameterValueForKey:@"WFMeasurementUnitType" ofClass:objc_opt_class()];
    id v5 = [MEMORY[0x263F85370] availableUnitsForUnitType:v4];
    objc_super v6 = [v3 unitString];
    BOOL v7 = [v5 objectMatchingKey:@"symbol" value:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = [(WFMeasurementCreateAction *)self currentUnit];
  id v5 = [(WFMeasurementCreateAction *)self currentValue];
  if (v4)
  {
    objc_super v6 = (void *)MEMORY[0x263F337C8];
    id v7 = objc_alloc(MEMORY[0x263F08980]);
    [v5 doubleValue];
    v8 = objc_msgSend(v7, "initWithDoubleValue:unit:", v4);
    int v9 = [v6 itemWithObject:v8];

    v10 = (void *)MEMORY[0x263F337B0];
    uint64_t v17 = v9;
    objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    id v12 = [v10 collectionWithItems:v11];
    [(WFMeasurementCreateAction *)self setOutput:v12];

    [(WFMeasurementCreateAction *)self finishRunningWithError:0];
  }
  else
  {
    int v9 = WFLocalizedString(@"Measurement failed because no unit was specified. Please pick a unit.");
    __int16 v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F870B8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19[0] = v9;
    __int16 v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v16 = [v13 errorWithDomain:v14 code:5 userInfo:v15];
    [(WFMeasurementCreateAction *)self finishRunningWithError:v16];
  }
}

@end