@interface DKLowPowerModeMonitor
@end

@implementation DKLowPowerModeMonitor

void __44___DKLowPowerModeMonitor_updateLowPowerMode__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v3 = [v2 isLowPowerModeEnabled];

  uint64_t v4 = [*(id *)(a1 + 32) lowPowerModeStatus];
  if (!v4
    || (v5 = (void *)v4,
        [*(id *)(a1 + 32) lowPowerModeStatus],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 BOOLValue],
        v6,
        v5,
        v3 != v7))
  {
    id v11 = +[_DKLowPowerModeMonitor _eventWithLowPowerModeState:v3];
    [*(id *)(a1 + 32) setCurrentEvent:v11 inferHistoricalState:1];
    +[_DKLowPowerModeMonitor setLowPowerMode:v3];
    v8 = [NSNumber numberWithBool:v3];
    [*(id *)(a1 + 32) setLowPowerModeStatus:v8];

    v9 = *(void **)(*(void *)(a1 + 32) + 144);
    v10 = [(id)objc_opt_class() _BMEventWithLowPowerModeState:v3];
    [v9 sendEvent:v10];
  }
}

@end