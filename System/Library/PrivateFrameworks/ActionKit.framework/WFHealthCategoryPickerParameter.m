@interface WFHealthCategoryPickerParameter
- (BOOL)isHidden;
- (HKCategoryType)categoryType;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (void)setCategoryType:(id)a3;
- (void)updatePossibleStates;
@end

@implementation WFHealthCategoryPickerParameter

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
  v2 = [(WFHealthCategoryPickerParameter *)self possibleStates];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)updatePossibleStates
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthCategoryPickerParameter;
  [(WFHealthCategoryPickerParameter *)&v4 possibleStatesDidChange];
}

- (id)localizedLabelForPossibleState:(id)a3
{
  BOOL v3 = [a3 value];
  objc_super v4 = WFLocalizedParameterValue(v3);

  return v4;
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    objc_super v4 = [(WFHealthCategoryPickerParameter *)self categoryType];
    v5 = [v4 identifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F09278]];

    if (v6)
    {
      uint64_t v7 = +[WFHealthKitHelper readableCervicalMucusQualityValues];
    }
    else
    {
      v8 = [(WFHealthCategoryPickerParameter *)self categoryType];
      v9 = [v8 identifier];
      int v10 = [v9 isEqualToString:*MEMORY[0x263F09380]];

      if (v10)
      {
        uint64_t v7 = +[WFHealthKitHelper readableMenstrualFlowValues];
      }
      else
      {
        v11 = [(WFHealthCategoryPickerParameter *)self categoryType];
        v12 = [v11 identifier];
        int v13 = [v12 isEqualToString:*MEMORY[0x263F093A8]];

        if (v13)
        {
          uint64_t v7 = +[WFHealthKitHelper readableOvulationTestResultValues];
        }
        else
        {
          v14 = [(WFHealthCategoryPickerParameter *)self categoryType];
          v15 = [v14 identifier];
          int v16 = [v15 isEqualToString:*MEMORY[0x263F09410]];

          if (v16)
          {
            uint64_t v7 = +[WFHealthKitHelper readableSleepAnalysisValues];
          }
          else
          {
            v17 = [(WFHealthCategoryPickerParameter *)self categoryType];
            v18 = [v17 identifier];
            int v19 = [v18 isEqualToString:*MEMORY[0x263F093F0]];

            if (!v19)
            {
              v20 = 0;
              goto LABEL_13;
            }
            uint64_t v7 = +[WFHealthKitHelper readableSexualActivityValues];
          }
        }
      }
    }
    v20 = (void *)v7;
LABEL_13:
    objc_msgSend(v20, "if_compactMap:", &__block_literal_global_40853);
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v22 = self->_possibleStates;
    self->_possibleStates = v21;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __49__WFHealthCategoryPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  objc_super v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (void)setCategoryType:(id)a3
{
  objc_storeStrong((id *)&self->_categoryType, a3);
  [(WFHealthCategoryPickerParameter *)self updatePossibleStates];
}

@end