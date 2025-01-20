@interface SFSafariViewControllerPrewarmingRequestThrottler
@end

@implementation SFSafariViewControllerPrewarmingRequestThrottler

void __71___SFSafariViewControllerPrewarmingRequestThrottler__startRequestTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _stopRequestTimer];
    [v2 _performNextRequest];
    id WeakRetained = v2;
  }
}

@end