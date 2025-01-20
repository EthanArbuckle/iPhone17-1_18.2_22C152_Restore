@interface WFLocalePickerParameter
+ (id)availableLocaleIdentifiers;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)localizedPlaceholder;
- (id)possibleStates;
@end

@implementation WFLocalePickerParameter

+ (id)availableLocaleIdentifiers
{
  return (id)[MEMORY[0x263EFF960] availableLocaleIdentifiers];
}

- (void).cxx_destruct
{
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF960];
  id v4 = a3;
  v5 = [v3 currentLocale];
  uint64_t v6 = *MEMORY[0x263EFF500];
  v7 = [v4 value];

  v8 = [v5 displayNameForKey:v6 value:v7];
  v9 = [MEMORY[0x263EFF960] currentLocale];
  v10 = [v8 capitalizedStringWithLocale:v9];

  return v10;
}

- (id)localizedPlaceholder
{
  return WFLocalizedString(@"Default");
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    id v4 = [(id)objc_opt_class() availableLocaleIdentifiers];
    v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_43581];
    objc_msgSend(v5, "if_map:", &__block_literal_global_169_43582);
    uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __41__WFLocalePickerParameter_possibleStates__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

uint64_t __41__WFLocalePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x263EFF960];
  id v5 = a3;
  id v6 = a2;
  v7 = [v4 currentLocale];
  uint64_t v8 = *MEMORY[0x263EFF500];
  v9 = [v7 displayNameForKey:*MEMORY[0x263EFF500] value:v6];

  v10 = [MEMORY[0x263EFF960] currentLocale];
  v11 = [v10 displayNameForKey:v8 value:v5];

  uint64_t v12 = [v9 compare:v11];
  return v12;
}

@end