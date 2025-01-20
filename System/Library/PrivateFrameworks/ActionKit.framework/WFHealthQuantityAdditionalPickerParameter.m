@interface WFHealthQuantityAdditionalPickerParameter
- (BOOL)isHidden;
- (HKQuantityType)quantityType;
- (id)defaultSerializedRepresentation;
- (id)importQuestionBehavior;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)localizedLabelWithContext:(id)a3;
- (id)possibleStates;
- (void)setQuantityType:(id)a3;
- (void)updatePossibleStates;
@end

@implementation WFHealthQuantityAdditionalPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (id)importQuestionBehavior
{
  return (id)*MEMORY[0x263F87330];
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = a3;
  v4 = [v3 value];
  v5 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v4];

  v6 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v5];
  if (objc_opt_respondsToSelector())
  {
    v7 = objc_msgSend(v6, "hk_localizedName");
  }
  else
  {
    v8 = [v3 value];
    v7 = WFLocalizedParameterValue(v8);
  }
  return v7;
}

- (id)localizedLabelWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFHealthQuantityAdditionalPickerParameter *)self quantityType];
  v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F09E60]];

  if (v7)
  {
    v8 = @"Reason";
LABEL_7:
    v13 = WFLocalizedStringResourceWithKey(v8, v8);
    v14 = [v4 localize:v13];

    goto LABEL_8;
  }
  v9 = [v5 identifier];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F09F20]];

  if (v10)
  {
    v8 = @"Test Type";
    goto LABEL_7;
  }
  v11 = [v5 identifier];
  int v12 = [v11 isEqualToString:*MEMORY[0x263F09C18]];

  if (v12)
  {
    v8 = @"Meal Time";
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)WFHealthQuantityAdditionalPickerParameter;
  v14 = [(WFHealthQuantityAdditionalPickerParameter *)&v16 localizedLabelWithContext:v4];
LABEL_8:

  return v14;
}

- (BOOL)isHidden
{
  v2 = [(WFHealthQuantityAdditionalPickerParameter *)self possibleStates];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)updatePossibleStates
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthQuantityAdditionalPickerParameter;
  [(WFHealthQuantityAdditionalPickerParameter *)&v4 possibleStatesDidChange];
}

- (id)defaultSerializedRepresentation
{
  v2 = [(WFHealthQuantityAdditionalPickerParameter *)self quantityType];
  BOOL v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F09C18]];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F86F00];
    v6 = WFLocalizedParameterValueMarker(@"Unspecified");
    int v7 = [v5 serializedRepresentationFromValue:v6];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    int v4 = [(WFHealthQuantityAdditionalPickerParameter *)self quantityType];
    v5 = [v4 identifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F09E60]];

    if (v6)
    {
      int v7 = +[WFHealthKitHelper readableInsulinDeliveryReasonValues];
    }
    else
    {
      int v7 = 0;
    }
    v8 = [v4 identifier];
    int v9 = [v8 isEqualToString:*MEMORY[0x263F09F20]];

    if (v9)
    {
      uint64_t v10 = +[WFHealthKitHelper readableVO2MaxTestTypeValues];

      int v7 = (void *)v10;
    }
    v11 = [v4 identifier];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F09C18]];

    if (v12)
    {
      uint64_t v13 = +[WFHealthKitHelper readableBloodGlucoseMealTimeValues];

      int v7 = (void *)v13;
    }
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_9853);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = self->_possibleStates;
    self->_possibleStates = v14;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __59__WFHealthQuantityAdditionalPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  int v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (void)setQuantityType:(id)a3
{
  objc_storeStrong((id *)&self->_quantityType, a3);
  [(WFHealthQuantityAdditionalPickerParameter *)self updatePossibleStates];
}

@end