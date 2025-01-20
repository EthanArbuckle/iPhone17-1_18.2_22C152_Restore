@interface CNMetricsUIReporter
- (id)emptyDictionaryForAction:(id)a3 andApplication:(id)a4;
- (id)eventKeyPrefix;
- (void)logActionDictionary:(id)a3;
- (void)logContactShownforApplication:(id)a3;
- (void)logSearchActionWithDictionary:(id)a3;
- (void)logSearchResultsFetchedforApplication:(id)a3 fromSuggestions:(BOOL)a4;
- (void)logSearchResultsSelectedforApplication:(id)a3 fromSuggestions:(BOOL)a4;
- (void)logSearchUsageforApplication:(id)a3;
- (void)logUnknownContactGeminiViewDifferentChannelSelected:(BOOL)a3;
@end

@implementation CNMetricsUIReporter

- (id)eventKeyPrefix
{
  return @"com.apple.contacts.ui.";
}

- (void)logContactShownforApplication:(id)a3
{
}

- (void)logSearchUsageforApplication:(id)a3
{
}

- (void)logSearchActionWithDictionary:(id)a3
{
}

- (void)logSearchResultsFetchedforApplication:(id)a3 fromSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  v13[3] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 alloc];
  v13[0] = v7;
  v12[0] = @"application";
  v12[1] = @"isSuggestion";
  v9 = [NSNumber numberWithBool:v4];
  v12[2] = @"isSelection";
  v13[1] = v9;
  v13[2] = MEMORY[0x1E4F1CC28];
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  v11 = (void *)[v8 initWithDictionary:v10];
  [(CNMetricsUIReporter *)self logSearchActionWithDictionary:v11];
}

- (void)logSearchResultsSelectedforApplication:(id)a3 fromSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  v13[3] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 alloc];
  v13[0] = v7;
  v12[0] = @"application";
  v12[1] = @"isSuggestion";
  v9 = [NSNumber numberWithBool:v4];
  v12[2] = @"isSelection";
  v13[1] = v9;
  v13[2] = MEMORY[0x1E4F1CC38];
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  v11 = (void *)[v8 initWithDictionary:v10];
  [(CNMetricsUIReporter *)self logSearchActionWithDictionary:v11];
}

- (void)logActionDictionary:(id)a3
{
}

- (id)emptyDictionaryForAction:(id)a3 andApplication:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  v12[0] = @"action";
  v12[1] = @"application";
  v13[0] = v7;
  v13[1] = v6;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  v10 = (void *)[v8 initWithDictionary:v9];

  return v10;
}

- (void)logUnknownContactGeminiViewDifferentChannelSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v9 = @"differentSIMLineSelected";
  id v6 = [NSNumber numberWithBool:v3];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = (void *)[v5 initWithDictionary:v7];

  [(CNMetricsReporter *)self sendDictionary:v8 forEvent:@"unknownNumberSIMLinePicker" andLog:0];
}

@end