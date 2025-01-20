@interface WFAppendToNoteAction
+ (id)overrideInputParameterName;
- (BOOL)inputRequired;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionResultWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)parameterSummary;
- (id)remoteExecuteOnPlatforms;
- (id)serializationKeysByParameter;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
@end

@implementation WFAppendToNoteAction

+ (id)overrideInputParameterName
{
  return @"text";
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Appended Note", @"Appended Note");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"apple|add", @"apple|add");
  v5 = [v3 localize:v4];

  v6 = [v5 componentsSeparatedByString:@"|"];

  return v6;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"The updated note", @"The updated note");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Appends the text passed as input to the specified note.", @"Appends the text passed as input to the specified note.");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)parameterSummary
{
  id v2 = objc_alloc(MEMORY[0x263F86888]);
  id v3 = WFLocalizedStringResourceWithKey(@"Append ${text} to ${entity}", @"Append ${text} to ${entity}");
  v4 = (void *)[v2 initWithString:v3];

  return v4;
}

- (id)remoteExecuteOnPlatforms
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F871E0];
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)serializationKeysByParameter
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"entity";
  v4[1] = @"text";
  v5[0] = @"WFNote";
  v5[1] = @"WFInput";
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
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
    v9 = WFLocalizedString(@"Allow “%1$@” to append %2$@ to a note?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to append content to a note?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, 0);
  v10 = };

  return v10;
}

@end