@interface ScreenPostRecordingState
@end

@implementation ScreenPostRecordingState

void ___ScreenPostRecordingState_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"type", @"setScreenRecordingState");
  v3 = (const void **)MEMORY[0x263EFFB40];
  if (!*(unsigned char *)(a1 + 40)) {
    v3 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(Mutable, @"state", *v3);
  if (!AirPlayReceiverSessionSendCommandForObject(*(void *)(a1 + 32), 0, Mutable, 0, 0))
  {
    if (!Mutable) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  APSLogErrorAt();
  if (Mutable) {
LABEL_5:
  }
    CFRelease(Mutable);
LABEL_6:
  v4 = *(const void **)(a1 + 32);

  CFRelease(v4);
}

@end