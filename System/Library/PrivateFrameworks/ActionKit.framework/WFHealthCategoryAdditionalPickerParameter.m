@interface WFHealthCategoryAdditionalPickerParameter
- (BOOL)isHidden;
- (HKCategoryType)categoryType;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)localizedLabelWithContext:(id)a3;
- (id)possibleStates;
- (void)setCategoryType:(id)a3;
- (void)updatePossibleStates;
@end

@implementation WFHealthCategoryAdditionalPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (HKCategoryType)categoryType
{
  return self->_categoryType;
}

- (BOOL)isHidden
{
  v2 = [(WFHealthCategoryAdditionalPickerParameter *)self possibleStates];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)updatePossibleStates
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthCategoryAdditionalPickerParameter;
  [(WFHealthCategoryAdditionalPickerParameter *)&v4 possibleStatesDidChange];
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 value];
  v5 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v4];

  v6 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:v5];
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
  id v3 = a3;
  objc_super v4 = WFLocalizedStringResourceWithKey(@"Start of Cycle", @"Start of Cycle");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    objc_super v4 = [(WFHealthCategoryAdditionalPickerParameter *)self categoryType];
    v5 = [v4 identifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F09380]];

    if (v6)
    {
      v7 = +[WFHealthKitHelper readableMenstrualFlowIsStartOfCycleValues];
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_44347);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_possibleStates;
    self->_possibleStates = v8;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __59__WFHealthCategoryAdditionalPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  objc_super v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (void)setCategoryType:(id)a3
{
  objc_storeStrong((id *)&self->_categoryType, a3);
  [(WFHealthCategoryAdditionalPickerParameter *)self updatePossibleStates];
}

@end