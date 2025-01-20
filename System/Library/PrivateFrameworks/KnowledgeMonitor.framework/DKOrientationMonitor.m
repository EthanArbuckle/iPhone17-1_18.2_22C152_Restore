@interface DKOrientationMonitor
@end

@implementation DKOrientationMonitor

void __30___DKOrientationMonitor_start__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) interfaceOrientation] - 1;
  if (v2 > 3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = qword_225034980[v2];
  }
  id v6 = +[_DKOrientationMonitor _eventWithValue:v3];
  if (objc_msgSend(*(id *)(a1 + 40), "historicalStateHasChanged:"))
  {
    v4 = *(void **)(*(void *)(a1 + 40) + 152);
    v5 = +[_DKOrientationMonitor _BMEventWithValue:v3];
    [v4 sendEvent:v5];
  }
  [*(id *)(a1 + 40) setCurrentEvent:v6 inferHistoricalState:1];
}

void __30___DKOrientationMonitor_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __30___DKOrientationMonitor_start__block_invoke_2;
  v11[3] = &unk_2647147D8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v4;
  uint64_t v13 = v6;
  v7 = v11;
  id v8 = v4;
  v9 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_4;
  block[3] = &unk_2647148A0;
  id v15 = v9;
  id v16 = v7;
  id v10 = v9;
  dispatch_async(v5, block);
}

@end