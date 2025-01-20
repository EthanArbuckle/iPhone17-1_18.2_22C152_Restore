@interface WFiTunesStoreCountryPickerParameter
- (BOOL)preferParameterValuePicker;
- (Class)singleStateClass;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFiTunesStoreCountryPickerParameter

- (void).cxx_destruct
{
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)[a3 value];
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = [MEMORY[0x263EFF960] ISOCountryCodes];
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_3864);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_possibleStates;
    self->_possibleStates = v5;

    v7 = [(NSArray *)self->_possibleStates sortedArrayUsingComparator:&__block_literal_global_170];
    v8 = self->_possibleStates;
    self->_possibleStates = v7;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

uint64_t __53__WFiTunesStoreCountryPickerParameter_possibleStates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 value];
  v6 = [v4 value];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

WFiTunesStoreCountrySubstitutableState *__53__WFiTunesStoreCountryPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF960];
  id v3 = a2;
  id v4 = [v2 currentLocale];
  v5 = [v4 displayNameForKey:*MEMORY[0x263EFF4D0] value:v3];

  if ([v5 length]) {
    v6 = [(WFVariableSubstitutableParameterState *)[WFiTunesStoreCountrySubstitutableState alloc] initWithValue:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (id)defaultSerializedRepresentation
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v3 = *MEMORY[0x263EFF4D0];
  id v4 = [v2 objectForKey:*MEMORY[0x263EFF4D0]];
  v5 = [v2 displayNameForKey:v3 value:v4];

  if ([v5 length])
  {
    v6 = +[WFStringSubstitutableState serializedRepresentationFromValue:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end