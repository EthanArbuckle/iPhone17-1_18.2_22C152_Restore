@interface UpdateHosesPrimed
@end

@implementation UpdateHosesPrimed

uint64_t __audioHoseManagerBuffered_UpdateHosesPrimed_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  if (gLogCategory_APAudioHoseManagerBuffered <= 50)
  {
    if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), result))
    {
      if (*(void *)(v4 + 72)) {
        CMBaseObjectGetDerivedStorage();
      }
      result = LogPrintF();
    }
  }
  if (!*(_DWORD *)(a3 + 92))
  {
    if (*(unsigned char *)(*(void *)(v4 + 80) + 300))
    {
      audioHoseManagerBuffered_getBufferLevelTimeEstimateForHoseStartup(*(void *)(v4 + 88), (__n128 *)a3, &time1);
      CMTime time2 = *(CMTime *)(*(void *)(v4 + 80) + 288);
      BOOL v5 = CMTimeCompare(&time1, &time2) >= 0;
    }
    else
    {
      BOOL v5 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(v4 + 32) + 8) + 24) = v5;
    if (*(void *)(*(void *)(v4 + 80) + 320)) {
      char v6 = *(unsigned char *)(a3 + 176);
    }
    else {
      char v6 = 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = v6;
    if (*(unsigned char *)(v4 + 104))
    {
      BOOL v7 = 0;
    }
    else
    {
      uint64_t v8 = *(void *)(v4 + 80);
      uint64_t v9 = 344;
      if (!*(unsigned char *)(v8 + 328)) {
        uint64_t v9 = 336;
      }
      BOOL v7 = *(void *)(v4 + 96) - *(void *)(a3 + 48) >= *(void *)(v8 + v9);
    }
    *(unsigned char *)(*(void *)(*(void *)(v4 + 48) + 8) + 24) = v7;
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (*(void *)(v4 + 88))
      {
        CMBaseObjectGetDerivedStorage();
        uint64_t v10 = *(void *)(v4 + 88);
      }
      else
      {
        uint64_t v10 = 0;
      }
      audioHoseManagerBuffered_hoseBufferedToStartHighWaterMark(v10, a3);
      LogPrintF();
    }
    result = audioHoseManagerBuffered_hoseBufferedToStartHighWaterMark(*(void *)(v4 + 88), a3);
    if (result && *(unsigned char *)(*(void *)(*(void *)(v4 + 40) + 8) + 24)
      || *(unsigned char *)(*(void *)(*(void *)(v4 + 32) + 8) + 24)
      && *(unsigned char *)(*(void *)(*(void *)(v4 + 40) + 8) + 24)
      || *(unsigned char *)(*(void *)(*(void *)(v4 + 48) + 8) + 24))
    {
      *(_DWORD *)(a3 + 92) = 1;
      if (gLogCategory_APAudioHoseManagerBuffered <= 50)
      {
        if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), result))
        {
          if (*(void *)(v4 + 72)) {
            CMBaseObjectGetDerivedStorage();
          }
          audioHoseManagerBuffered_getBufferLevelTimeEstimateForHoseStartup(*(void *)(v4 + 88), (__n128 *)a3, &time);
          CMTimeGetSeconds(&time);
          CMTime time2 = *(CMTime *)(*(void *)(v4 + 80) + 48);
          CMTimeGetSeconds(&time2);
          UpTicksToMilliseconds();
          if (!*(unsigned char *)(v4 + 104)) {
            UpTicksToMilliseconds();
          }
          CMTime time2 = *(CMTime *)(a3 + 64);
          CMTimeGetSeconds(&time2);
          CMTime time2 = *(CMTime *)(*(void *)(v4 + 80) + 288);
          CMTimeGetSeconds(&time2);
          result = LogPrintF();
        }
      }
    }
  }
  if ((*(_DWORD *)(a3 + 92) - 1) <= 2) {
    ++*(_DWORD *)(*(void *)(*(void *)(v4 + 56) + 8) + 24);
  }
  unint64_t v11 = *(void *)(v4 + 96) - *(void *)(a3 + 48);
  uint64_t v12 = *(void *)(*(void *)(v4 + 64) + 8);
  if (v11 < *(void *)(v12 + 24)) {
    *(void *)(v12 + 24) = v11;
  }
  return result;
}

@end