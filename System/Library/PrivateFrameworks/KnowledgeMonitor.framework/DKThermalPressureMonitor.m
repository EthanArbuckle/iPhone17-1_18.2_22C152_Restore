@interface DKThermalPressureMonitor
@end

@implementation DKThermalPressureMonitor

void __34___DKThermalPressureMonitor_start__block_invoke(uint64_t a1)
{
  v2 = (const char *)*MEMORY[0x263EF8920];
  v3 = *(int **)(a1 + 32);
  v4 = v3 + 37;
  v5 = [v3 queue];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __34___DKThermalPressureMonitor_start__block_invoke_2;
  handler[3] = &unk_264714B68;
  handler[4] = *(void *)(a1 + 32);
  notify_register_dispatch(v2, v4, v5, handler);

  v6 = *(int **)(a1 + 32);
  v7 = v6 + 39;
  v8 = [v6 queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34___DKThermalPressureMonitor_start__block_invoke_3;
  v9[3] = &unk_264714B68;
  v9[4] = *(void *)(a1 + 32);
  notify_register_dispatch("com.apple.system.peakpowerpressurelevel", v7, v8, v9);
}

uint64_t __34___DKThermalPressureMonitor_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) getThermalPressureLevelWithToken:a2];
}

uint64_t __34___DKThermalPressureMonitor_start__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) getPeakPowerPressureLevelWithToken:a2];
}

@end