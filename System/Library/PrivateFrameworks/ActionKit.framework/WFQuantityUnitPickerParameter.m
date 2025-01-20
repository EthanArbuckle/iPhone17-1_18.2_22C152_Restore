@interface WFQuantityUnitPickerParameter
- (Class)singleStateClass;
- (HKQuantityType)quantityType;
- (OS_dispatch_group)possibleStateLoadingGroup;
- (WFQuantityUnitPickerParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (void)setQuantityType:(id)a3;
- (void)updatePossibleStates;
@end

@implementation WFQuantityUnitPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStateLoadingGroup, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (OS_dispatch_group)possibleStateLoadingGroup
{
  return self->_possibleStateLoadingGroup;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v4 = [a3 value];
  v5 = [(WFQuantityUnitPickerParameter *)self quantityType];
  v6 = [v5 identifier];
  v7 = +[WFHealthKitHelper localizedDisplayNameForUnit:v4 quantityTypeIdentifier:v6];

  return v7;
}

- (id)possibleStates
{
  possibleStateLoadingGroup = self->_possibleStateLoadingGroup;
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  dispatch_group_wait(possibleStateLoadingGroup, v4);
  possibleStates = self->_possibleStates;
  return possibleStates;
}

- (void)updatePossibleStates
{
  v3 = [(WFQuantityUnitPickerParameter *)self quantityType];
  if (v3)
  {
    dispatch_group_enter((dispatch_group_t)self->_possibleStateLoadingGroup);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke;
    v5[3] = &unk_264E5E238;
    id v6 = v3;
    v7 = self;
    +[WFHealthKitHelper validUnitsForQuantityType:v6 completion:v5];
  }
  else
  {
    possibleStates = self->_possibleStates;
    self->_possibleStates = 0;

    [(WFQuantityUnitPickerParameter *)self possibleStatesDidChange];
    [(WFQuantityUnitPickerParameter *)self defaultSerializedRepresentationDidChange];
  }
}

void __53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) quantityType];
  LOBYTE(v4) = [v4 isEqual:v5];

  if (v4)
  {
    uint64_t v6 = objc_msgSend(v3, "if_map:", &__block_literal_global_14690);
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void **)(v7 + 216);
    *(void *)(v7 + 216) = v6;

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 232));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke_3;
    block[3] = &unk_264E5EE70;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 232));
  }
}

uint64_t __53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) possibleStatesDidChange];
  v2 = *(void **)(a1 + 32);
  return [v2 defaultSerializedRepresentationDidChange];
}

WFHKUnitSubstitutableState *__53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(WFVariableSubstitutableParameterState *)[WFHKUnitSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (id)defaultSerializedRepresentation
{
  id v2 = [(WFQuantityUnitPickerParameter *)self possibleStates];
  id v3 = [v2 firstObject];
  dispatch_time_t v4 = [v3 serializedRepresentation];

  return v4;
}

- (void)setQuantityType:(id)a3
{
  v5 = (HKQuantityType *)a3;
  quantityType = self->_quantityType;
  v8 = v5;
  if (quantityType == v5)
  {
    objc_storeStrong((id *)&self->_quantityType, a3);
  }
  else
  {
    char v7 = [(HKQuantityType *)quantityType isEqual:v5];
    objc_storeStrong((id *)&self->_quantityType, a3);
    if ((v7 & 1) == 0) {
      [(WFQuantityUnitPickerParameter *)self updatePossibleStates];
    }
  }
}

- (WFQuantityUnitPickerParameter)initWithDefinition:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFQuantityUnitPickerParameter;
  v5 = [(WFQuantityUnitPickerParameter *)&v18 initWithDefinition:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"QuantityTypeIdentifier"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v20 = "WFEnforceClass";
        __int16 v21 = 2114;
        id v22 = v8;
        __int16 v23 = 2114;
        v24 = v11;
        __int16 v25 = 2114;
        uint64_t v26 = v7;
        id v12 = v11;
        _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v9 = 0;
    }
    else
    {
      id v9 = v8;
    }

    if (v9)
    {
      v13 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v9];
    }
    else
    {
      v13 = 0;
    }
    objc_storeStrong((id *)&v5->_quantityType, v13);
    if (v9) {

    }
    dispatch_group_t v14 = dispatch_group_create();
    possibleStateLoadingGroup = v5->_possibleStateLoadingGroup;
    v5->_possibleStateLoadingGroup = (OS_dispatch_group *)v14;

    [(WFQuantityUnitPickerParameter *)v5 updatePossibleStates];
    v16 = v5;
  }
  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end