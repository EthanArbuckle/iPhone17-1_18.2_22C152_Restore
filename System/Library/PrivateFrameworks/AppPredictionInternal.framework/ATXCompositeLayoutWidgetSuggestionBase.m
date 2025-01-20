@interface ATXCompositeLayoutWidgetSuggestionBase
@end

@implementation ATXCompositeLayoutWidgetSuggestionBase

void __81___ATXCompositeLayoutWidgetSuggestionBase_addSuggestion_asMainSuggestion_dryRun___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = (void *)a1[4];
  id v7 = a2;
  v8 = [v6 objectForKeyedSubscript:v7];
  unint64_t v9 = [v8 unsignedIntegerValue];

  id v10 = [*(id *)(a1[5] + 64) objectForKeyedSubscript:v7];

  if ([v10 count] < v9)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __71___ATXCompositeLayoutWidgetSuggestionBase__existingSuggestionsInLayout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

@end