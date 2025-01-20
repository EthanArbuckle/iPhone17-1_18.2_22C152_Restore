@interface WFFocusModesPickerParameter
- (Class)singleStateClass;
- (WFFocusModesPickerParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentationForEnumeration:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)possibleStatesForEnumeration:(id)a3;
@end

@implementation WFFocusModesPickerParameter

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F86B68], "defaultActivity", a3);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F0FCB0]);
    v5 = [v3 activityIdentifier];
    v6 = [v3 activityDisplayName];
    v7 = (void *)[v4 initWithIdentifier:v5 displayString:v6];

    v8 = (void *)[objc_alloc(MEMORY[0x263F86C20]) initWithValue:v7];
    v9 = [v8 serializedRepresentation];
  }
  else
  {
    v10 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315138;
      v13 = "-[WFFocusModesPickerParameter defaultSerializedRepresentationForEnumeration:]";
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_FAULT, "%s Could not get defaultActivity from FocusModesManager.", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F86B68], "availableModes", a3);
  id v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_15598);

  return v4;
}

id __60__WFFocusModesPickerParameter_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPlaceholder])
  {
    v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F0FCB0]);
    v5 = [v2 activityIdentifier];
    v6 = [v2 activityDisplayName];
    v7 = (void *)[v4 initWithIdentifier:v5 displayString:v6];

    v3 = (void *)[objc_alloc(MEMORY[0x263F86C20]) initWithValue:v7];
  }

  return v3;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4 = objc_msgSend(a4, "value", a3);
  v5 = [v4 displayString];

  return v5;
}

- (WFFocusModesPickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFFocusModesPickerParameter;
  v3 = [(WFFocusModesPickerParameter *)&v7 initWithDefinition:a3];
  id v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end