@interface WFUnitTypePickerParameter
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFUnitTypePickerParameter

- (void).cxx_destruct
{
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = (void *)MEMORY[0x263F85370];
  v4 = [a3 value];
  v5 = [v3 localizedStringForUnitType:v4];

  return v5;
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = [MEMORY[0x263F85370] availableUnitTypes];
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_7535);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_possibleStates;
    self->_possibleStates = v5;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __43__WFUnitTypePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

@end