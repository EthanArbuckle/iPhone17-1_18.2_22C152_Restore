@interface TUIPredictionView
@end

@implementation TUIPredictionView

uint64_t __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedIndex:*(void *)(a1 + 40)];
}

void __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 40) safeValueForKey:@"delegate"];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v4 safeValueForKey:@"candidate"];
    [v2 predictionView:*(void *)(a1 + 40) didSelectCandidate:v3];
  }
}

uint64_t __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
}

@end