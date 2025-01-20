@interface ApplyVolumeFade
@end

@implementation ApplyVolumeFade

uint64_t __audioHoseManagerBuffered_ApplyVolumeFade_block_invoke(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = result;
  if (*((unsigned char *)a3 + 8))
  {
    if (gLogCategory_APAudioHoseManagerBuffered <= 50)
    {
      if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), result))
      {
        if (*(void *)(v4 + 32)) {
          CMBaseObjectGetDerivedStorage();
        }
        return LogPrintF();
      }
    }
  }
  else
  {
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (*(void *)(v4 + 32)) {
        CMBaseObjectGetDerivedStorage();
      }
      APSGetVolumeFadeTypeName();
      CMTime time = *(CMTime *)(v4 + 44);
      CMTimeGetSeconds(&time);
      LogPrintF();
    }
    uint64_t v5 = *a3;
    uint64_t v6 = *(unsigned int *)(v4 + 40);
    *(_OWORD *)&v10.value = *(_OWORD *)(v4 + 44);
    v10.epoch = *(void *)(v4 + 60);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    result = CMBaseObjectGetProtocolVTable();
    if (result)
    {
      uint64_t v8 = *(void *)(result + 16);
      result += 16;
      uint64_t v7 = v8;
      if (v8)
      {
        v9 = *(uint64_t (**)(uint64_t, uint64_t, CMTime *))(v7 + 72);
        if (v9)
        {
          CMTime time = v10;
          return v9(v5, v6, &time);
        }
      }
    }
  }
  return result;
}

@end