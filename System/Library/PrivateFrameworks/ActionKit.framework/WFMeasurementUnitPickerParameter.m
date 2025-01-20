@interface WFMeasurementUnitPickerParameter
- (BOOL)isHidden;
- (Class)singleStateClass;
- (WFAction)action;
- (id)currentUnitType;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)setAction:(id)a3;
@end

@implementation WFMeasurementUnitPickerParameter

- (void).cxx_destruct
{
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (id)defaultSerializedRepresentation
{
  v2 = [(WFMeasurementUnitPickerParameter *)self currentUnitType];
  if (v2)
  {
    v3 = [MEMORY[0x263F85370] defaultUnitForUnitType:v2];
    v4 = +[WFNSUnitSubstitutableState serializedRepresentationFromValue:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = [a3 value];
  id v4 = objc_alloc_init(MEMORY[0x263F08988]);
  [v4 setUnitStyle:3];
  v5 = [v4 stringFromUnit:v3];
  v6 = [v5 localizedLowercaseString];

  return v6;
}

- (id)possibleStates
{
  v2 = [(WFMeasurementUnitPickerParameter *)self currentUnitType];
  v3 = [MEMORY[0x263F85370] availableUnitsForUnitType:v2];
  id v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_38921);

  return v4;
}

WFNSUnitSubstitutableState *__50__WFMeasurementUnitPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(WFVariableSubstitutableParameterState *)[WFNSUnitSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (BOOL)isHidden
{
  id v2 = [(WFMeasurementUnitPickerParameter *)self currentUnitType];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)currentUnitType
{
  BOOL v3 = [(WFMeasurementUnitPickerParameter *)self action];
  id v4 = [(WFMeasurementUnitPickerParameter *)self definition];
  v5 = [v4 objectForKey:@"WFMeasurementUnitTypeKey"];
  v6 = [v3 parameterStateForKey:v5];

  v7 = [v6 value];

  return v7;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = a4;
  v6 = [(WFMeasurementUnitPickerParameter *)self definition];
  v7 = [v6 objectForKey:@"WFMeasurementUnitTypeKey"];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(WFMeasurementUnitPickerParameter *)self attributesDidChange];
    [(WFMeasurementUnitPickerParameter *)self possibleStatesDidChange];
    [(WFMeasurementUnitPickerParameter *)self defaultSerializedRepresentationDidChange];
  }
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
  }
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end