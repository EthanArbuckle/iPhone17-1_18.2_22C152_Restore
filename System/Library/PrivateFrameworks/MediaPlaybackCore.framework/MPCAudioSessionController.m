@interface MPCAudioSessionController
@end

@implementation MPCAudioSessionController

void __47___MPCAudioSessionController_setupObservations__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained snapshotSessionSettings];
    id WeakRetained = v2;
  }
}

void __47___MPCAudioSessionController_setupObservations__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained restoreSessionSettingsFromSnapshot];
    id WeakRetained = v2;
  }
}

@end