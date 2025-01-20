@interface INIntent
@end

@implementation INIntent

void __49__INIntent_IntentUtilities__atx_nonNilParameters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
}

uint64_t __54__INIntent_IntentUtilities__atx_parameterValueForKey___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"identifier"];
  uint64_t v3 = [v2 isEqualToString:@"navigationLink"];

  return v3;
}

@end