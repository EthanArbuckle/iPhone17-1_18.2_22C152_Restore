@interface HFTimerConnectionProvider
@end

@implementation HFTimerConnectionProvider

void __59___HFTimerConnectionProvider_timerManagerServiceConnection__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }
}

@end