@interface WFNetworkPickerParameter
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (id)possibleStatesForLocalization;
@end

@implementation WFNetworkPickerParameter

- (void).cxx_destruct
{
}

- (id)possibleStatesForLocalization
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F86F00]) initWithValue:@"Wi-Fi"];
  v6[0] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x263F86F00]) initWithValue:@"Cellular"];
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)defaultSerializedRepresentation
{
  return (id)[MEMORY[0x263F86F00] serializedRepresentationFromValue:@"Wi-Fi"];
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = [a3 value];
  if ([v3 isEqualToString:@"Wi-Fi"])
  {
    v4 = [MEMORY[0x263F85258] currentDevice];
    v5 = [v4 localizedWiFiDisplayName];
  }
  else
  {
    v5 = WFLocalizedString(@"Cellular");
  }

  return v5;
}

- (id)possibleStates
{
  v11[1] = *MEMORY[0x263EF8340];
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v11[0] = @"Wi-Fi";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v5 = [MEMORY[0x263F85258] currentDevice];
    v6 = [v5 capabilities];

    if ([v6 containsObject:*MEMORY[0x263F85658]])
    {
      uint64_t v7 = [v4 arrayByAddingObject:@"Cellular"];

      v4 = (void *)v7;
    }
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_45612);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_possibleStates;
    self->_possibleStates = v8;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __42__WFNetworkPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

@end