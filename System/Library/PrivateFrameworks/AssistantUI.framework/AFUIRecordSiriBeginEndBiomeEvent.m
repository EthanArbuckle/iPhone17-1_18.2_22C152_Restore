@interface AFUIRecordSiriBeginEndBiomeEvent
@end

@implementation AFUIRecordSiriBeginEndBiomeEvent

void ___AFUIRecordSiriBeginEndBiomeEvent_block_invoke(uint64_t a1)
{
  id v16 = [MEMORY[0x263EFF910] date];
  v15 = [MEMORY[0x263F2A9B8] siriUIStream];
  v2 = [v15 source];
  id v3 = objc_alloc(MEMORY[0x263F2A968]);
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SESSIONID"];
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"UUID"];
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"VIEWMODE"];
  uint64_t v7 = [v6 stringValue];
  v8 = (void *)v7;
  v9 = &stru_26D61DD68;
  if (v7) {
    v10 = (__CFString *)v7;
  }
  else {
    v10 = &stru_26D61DD68;
  }
  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F753E8]];
  v12 = (void *)v11;
  if (v11) {
    v9 = (__CFString *)v11;
  }
  uint64_t v13 = [*(id *)(a1 + 40) hasSuffix:@"end"] ^ 1;
  [v16 timeIntervalSinceReferenceDate];
  v14 = objc_msgSend(v3, "initWithSessionID:UUID:viewMode:dismissalReason:starting:absoluteTimeStamp:", v4, v5, v10, v9, v13);

  if (v14) {
    [v2 sendEvent:v14];
  }
}

@end