@interface WFArchiveFormatParameter
- (Class)singleStateClass;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFArchiveFormatParameter

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = [a3 value];
  v4 = WFArchiveFormatFileExtension();
  v5 = [@"." stringByAppendingString:v4];

  return v5;
}

- (id)possibleStates
{
  v2 = WFSupportedArchiveFormats();
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_25736);

  return v3;
}

WFArchiveFormatSubstitutableState *__42__WFArchiveFormatParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(WFVariableSubstitutableParameterState *)[WFArchiveFormatSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (id)defaultSerializedRepresentation
{
  return +[WFStringSubstitutableState serializedRepresentationFromValue:*MEMORY[0x263F33A18]];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end