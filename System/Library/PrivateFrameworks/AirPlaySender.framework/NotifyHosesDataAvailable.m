@interface NotifyHosesDataAvailable
@end

@implementation NotifyHosesDataAvailable

uint64_t __audioHoseManagerBuffered_NotifyHosesDataAvailable_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (*(void *)(a1 + 32)) {
      CMBaseObjectGetDerivedStorage();
    }
    LogPrintF();
  }
  uint64_t v5 = *a3;
  APSEndpointStreamAudioHoseProtocolGetProtocolID();
  uint64_t result = CMBaseObjectGetProtocolVTable();
  if (result)
  {
    uint64_t v8 = *(void *)(result + 16);
    result += 16;
    uint64_t v7 = v8;
    if (v8)
    {
      v9 = *(uint64_t (**)(uint64_t))(v7 + 40);
      if (v9)
      {
        return v9(v5);
      }
    }
  }
  return result;
}

@end