@interface WFCreateNoteAction
+ (id)overrideInputParameterName;
- (BOOL)inputRequired;
- (BOOL)openWhenRunParameterIsHidden;
- (id)entityName;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeyParameterDisplayName;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)overrideLabelsByParameter;
- (id)parameterOverrides;
- (id)parameterSummary;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (unint64_t)outputDisclosureLevel;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFCreateNoteAction

- (unint64_t)outputDisclosureLevel
{
  return 0;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"apple (Create Note Keyword)", @"apple");
  v5 = [v3 localize:v4];

  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (BOOL)openWhenRunParameterIsHidden
{
  return 0;
}

- (id)parameterOverrides
{
  v21[3] = *MEMORY[0x263EF8340];
  v20[0] = *MEMORY[0x263F87278];
  id v2 = objc_alloc(MEMORY[0x263F86D68]);
  uint64_t v18 = *MEMORY[0x263F87320];
  uint64_t v19 = MEMORY[0x263EFFA88];
  id v3 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v4 = (void *)[v2 initWithDictionary:v3];
  v21[0] = v4;
  v20[1] = @"folder";
  id v5 = objc_alloc(MEMORY[0x263F86D68]);
  uint64_t v6 = *MEMORY[0x263F872D8];
  v16[0] = *MEMORY[0x263F87368];
  v16[1] = v6;
  v17[0] = @"WFNoteGroup";
  v17[1] = @"WFNoteGroupPickerParameter";
  v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v8 = (void *)[v5 initWithDictionary:v7];
  v21[1] = v8;
  v20[2] = @"contents";
  id v9 = objc_alloc(MEMORY[0x263F86D68]);
  uint64_t v14 = *MEMORY[0x263F87348];
  v15 = @"WFCreateNoteInput";
  v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v11 = (void *)[v9 initWithDictionary:v10];
  v21[2] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v12;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Creates a note using the content passed as input.", @"Creates a note using the content passed as input.");
  id v5 = [v3 localize:v4];

  return v5;
}

- (id)parameterSummary
{
  id v2 = objc_alloc(MEMORY[0x263F86888]);
  id v3 = WFLocalizedStringResourceWithKey(@"Create note with ${contents} in ${folder}", @"Create note with ${contents} in ${folder}");
  v4 = (void *)[v2 initWithString:v3];

  return v4;
}

- (id)overrideLabelsByParameter
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F87278];
  id v2 = WFLocalizedStringResourceWithKey(@"Note Name", @"Note Name");
  v6[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)entityName
{
  return WFLocalizedStringResourceWithKey(@"Note - Entity name", @"Note");
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 title];
    uint64_t v6 = [v5 spokenPhrase];

    if (v6)
    {
      id v9 = @"WFCreateNoteInput";
      v10[0] = v6;
      v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      v7 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)inputRequired
{
  return 1;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    id v9 = WFLocalizedString(@"Allow “%1$@” to save %2$@ in a note?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    id v9 = WFLocalizedString(@"Allow “%1$@” to create a note?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(@"Title");
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFCreateNoteAction;
  [(WFCreateNoteAction *)&v3 runAsynchronouslyWithInput:a3];
}

+ (id)overrideInputParameterName
{
  return @"contents";
}

@end