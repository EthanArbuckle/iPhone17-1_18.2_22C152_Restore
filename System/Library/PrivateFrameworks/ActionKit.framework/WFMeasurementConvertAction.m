@interface WFMeasurementConvertAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)currentUnitType;
- (id)parametersRequiringUserInputAlongsideParameter:(id)a3;
- (id)unitParameter;
- (id)unitWithSymbol:(id)a3;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFMeasurementConvertAction

- (id)unitWithSymbol:(id)a3
{
  id v4 = a3;
  v5 = [(WFMeasurementConvertAction *)self currentUnitType];
  v6 = [MEMORY[0x263F85370] availableUnitsForUnitType:v5];
  v7 = [v6 objectMatchingKey:@"symbol" value:v4];

  return v7;
}

- (id)currentUnitType
{
  v2 = [(WFMeasurementConvertAction *)self parameterStateForKey:@"WFMeasurementUnitType"];
  v3 = [v2 value];

  return v3;
}

- (id)unitParameter
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(WFMeasurementConvertAction *)self parameterForKey:@"WFMeasurementUnit"];
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

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFMeasurementConvertAction;
  BOOL v7 = [(WFMeasurementConvertAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFMeasurementUnit"]) {
    [(WFMeasurementConvertAction *)self outputDetailsUpdated];
  }

  return v7;
}

- (id)parametersRequiringUserInputAlongsideParameter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  int v6 = [v5 isEqualToString:@"WFMeasurementUnitType"];

  if (v6)
  {
    BOOL v7 = (void *)MEMORY[0x263EFFA08];
    v8 = [(WFMeasurementConvertAction *)self parameterForKey:@"WFMeasurementUnit"];
    objc_super v9 = [v7 setWithObject:v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFMeasurementConvertAction;
    objc_super v9 = [(WFMeasurementConvertAction *)&v11 parametersRequiringUserInputAlongsideParameter:v4];
  }

  return v9;
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFMeasurementConvertAction;
  [(WFMeasurementConvertAction *)&v4 initializeParameters];
  uint64_t v3 = [(WFMeasurementConvertAction *)self unitParameter];
  [v3 setAction:self];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFMeasurementConvertAction *)self parameterValueForKey:@"WFMeasurementUnit" ofClass:objc_opt_class()];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__WFMeasurementConvertAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_264E5B758;
    id v14 = v5;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__WFMeasurementConvertAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_264E5E840;
    v12[4] = self;
    [v4 transformObjectRepresentationsForClass:v6 usingBlock:v13 completionHandler:v12];
    BOOL v7 = v14;
  }
  else
  {
    BOOL v7 = WFLocalizedString(@"Please provide a unit to convert to.");
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08438];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = v7;
    v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_super v11 = [v8 errorWithDomain:v9 code:22 userInfo:v10];
    [(WFMeasurementConvertAction *)self finishRunningWithError:v11];
  }
}

void __57__WFMeasurementConvertAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = *(void *)(a1 + 32);
  __int16 v13 = a5;
  if ([v9 canBeConvertedToUnit:v12])
  {
    id v14 = (void *)MEMORY[0x263F337C8];
    uint64_t v15 = [v9 measurementByConvertingToUnit:*(void *)(a1 + 32)];
    uint64_t v16 = [v14 itemWithObject:v15 named:v10];

    v13[2](v13, v16, v11);
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x263F08988]);
    [v17 setUnitStyle:3];
    v18 = [v9 unit];
    [v17 stringFromUnit:v18];
    v19 = id v28 = v10;

    v20 = [v17 stringFromUnit:*(void *)(a1 + 32)];
    v21 = NSString;
    v22 = WFLocalizedString(@"A measurement with unit %1$@ can not be converted to %2$@.");
    v23 = objc_msgSend(v21, "stringWithFormat:", v22, v19, v20);

    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08438];
    uint64_t v29 = *MEMORY[0x263F08320];
    v30[0] = v23;
    v26 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v27 = [v24 errorWithDomain:v25 code:22 userInfo:v26];
    v13[2](v13, 0, v27);

    id v10 = v28;
  }
}

void __57__WFMeasurementConvertAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end