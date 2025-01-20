@interface WFShowNoteAction
- (id)localizedKeywordsWithContext:(id)a3;
- (id)overrideLabelsByParameter;
- (id)serializationKeysByParameter;
@end

@implementation WFShowNoteAction

- (id)localizedKeywordsWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"show|apple", @"show|apple");
  v5 = [v3 localize:v4];

  v6 = [v5 componentsSeparatedByString:@"|"];

  return v6;
}

- (id)overrideLabelsByParameter
{
  return 0;
}

- (id)serializationKeysByParameter
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F87280];
  v5[0] = *MEMORY[0x263F87288];
  v5[1] = v2;
  v6[0] = @"WFInput";
  v6[1] = @"WFInput";
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

@end