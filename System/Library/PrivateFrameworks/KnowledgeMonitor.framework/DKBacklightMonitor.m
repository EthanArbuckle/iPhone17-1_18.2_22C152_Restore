@interface DKBacklightMonitor
@end

@implementation DKBacklightMonitor

void __42___DKBacklightMonitor_setShutdownHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [MEMORY[0x263EFF910] now];
  [WeakRetained donateToBiome:0 startDate:v2];
}

void __41___DKBacklightMonitor_obtainCurrentValue__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentEvent];

  if (!v2)
  {
    uint64_t state64 = 0;
    notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 144), &state64);
    v3 = *(void **)(a1 + 32);
    v4 = [NSNumber numberWithUnsignedLongLong:state64];
    v5 = +[_DKBacklightMonitor _eventWithState:v4];
    [v3 setCurrentEvent:v5 inferHistoricalState:1];
  }
}

void __28___DKBacklightMonitor_start__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)os_transaction_create();
    v6 = (void *)MEMORY[0x22A629AA0]();
    uint64_t state64 = 0;
    if (!notify_get_state(a2, &state64))
    {
      v7 = [NSNumber numberWithUnsignedLongLong:state64];
      v8 = +[_DKBacklightMonitor _eventWithState:v7];

      [WeakRetained setCurrentEvent:v8 inferHistoricalState:1];
      v9 = *(void **)(a1 + 32);
      uint64_t v10 = state64;
      v11 = [v8 startDate];
      [v9 donateToBiome:v10 startDate:v11];
    }
  }
}

@end