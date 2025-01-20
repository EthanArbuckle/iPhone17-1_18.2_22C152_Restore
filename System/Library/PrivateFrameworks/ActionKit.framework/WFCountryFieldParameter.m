@interface WFCountryFieldParameter
- (id)currentCountry;
- (id)defaultSerializedRepresentation;
- (id)textContentType;
@end

@implementation WFCountryFieldParameter

- (id)textContentType
{
  return (id)*MEMORY[0x263F85970];
}

- (id)defaultSerializedRepresentation
{
  uint64_t v4 = [(WFCountryFieldParameter *)self stateClass];
  if (v4 != objc_opt_class())
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"WFCountryFieldParameter.m" lineNumber:21 description:@"-stateClass expected to be WFVariableStringParameterState"];
  }
  v5 = [(WFCountryFieldParameter *)self currentCountry];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F86FC8]);
    v7 = (void *)[objc_alloc(MEMORY[0x263F86FC0]) initWithString:v5];
    v8 = (void *)[v6 initWithVariableString:v7];

    v9 = [v8 serializedRepresentation];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFCountryFieldParameter;
    v9 = [(WFCountryFieldParameter *)&v12 defaultSerializedRepresentation];
  }

  return v9;
}

- (id)currentCountry
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v3 = *MEMORY[0x263EFF4D0];
  uint64_t v4 = [v2 objectForKey:*MEMORY[0x263EFF4D0]];
  v5 = [v2 displayNameForKey:v3 value:v4];

  return v5;
}

@end