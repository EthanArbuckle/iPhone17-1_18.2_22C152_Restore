@interface FEFocusItemFrameReporter
@end

@implementation FEFocusItemFrameReporter

void __58___FEFocusItemFrameReporter__scheduleRepeatingFrameUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportFocusFrameForCurrentlyFocusedItem];
}

@end