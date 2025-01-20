@interface FASuggestionsHelper
+ (id)filterAndTrimMessagesHandleSuggestions:(id)a3 maxSuggestions:(unint64_t)a4;
@end

@implementation FASuggestionsHelper

+ (id)filterAndTrimMessagesHandleSuggestions:(id)a3 maxSuggestions:(unint64_t)a4
{
  v5 = (void *)MEMORY[0x263F08A98];
  id v6 = a3;
  v7 = [v5 predicateWithFormat:@"iMessageHandle != nil"];
  v8 = [v6 filteredArrayUsingPredicate:v7];

  if ([v8 count] > a4)
  {
    uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", 0, a4);

    v8 = (void *)v9;
  }

  return v8;
}

@end