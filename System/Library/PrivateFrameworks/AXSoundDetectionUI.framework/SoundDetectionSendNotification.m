@interface SoundDetectionSendNotification
@end

@implementation SoundDetectionSendNotification

id ___SoundDetectionSendNotification_block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"NotifiedDetector";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

void ___SoundDetectionSendNotification_block_invoke_182(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ___SoundDetectionSendNotificationForCustomDetector_block_invoke_cold_1();
    }
  }
  else
  {
    v4 = [MEMORY[0x263F2A9B8] soundDetection];
    v5 = [v4 source];

    id v6 = objc_alloc(MEMORY[0x263F2A988]);
    double Current = CFAbsoluteTimeGetCurrent();
    v8 = bmTypeForSoundDetectionType();
    v9 = (void *)[v6 initWithAbsoluteTimestamp:v8 type:0 customName:Current];

    [v5 sendEvent:v9];
  }
}

@end