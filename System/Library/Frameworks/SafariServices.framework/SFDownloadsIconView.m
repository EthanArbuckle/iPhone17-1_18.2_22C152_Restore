@interface SFDownloadsIconView
@end

@implementation SFDownloadsIconView

void __29___SFDownloadsIconView_pulse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishedPulsing];
}

@end