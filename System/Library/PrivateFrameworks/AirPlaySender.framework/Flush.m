@interface Flush
@end

@implementation Flush

void __audioEngineCarPlay_Flush_block_invoke(uint64_t a1)
{
  long long v12 = 0u;
  memset(v11, 0, sizeof(v11));
  unsigned __int16 v10 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 216))
  {
    if (*(unsigned char *)(v2 + 236))
    {
      if (*(void *)(v2 + 184))
      {
        int32_t v3 = (int)*(double *)(v2 + 144);
        CMTime time = *(CMTime *)(a1 + 48);
        CMTimeConvertScale(&v9, &time, v3, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        *(double *)v11 = (double)v9.value;
        DWORD2(v12) = 1;
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 184);
        v5 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v5) {
          v6 = v5;
        }
        else {
          v6 = 0;
        }
        if (*v6 < 2uLL
          || (v7 = (unsigned int (*)(uint64_t, _OWORD *))v6[6]) == 0
          || v7(v4, v11)
          || APMessageRingFlush(*(void *)(*(void *)(a1 + 32) + 200), &v10))
        {
          APSLogErrorAt();
        }
        else
        {
          (*(void (**)(void, void, void, void))(*(void *)(a1 + 32) + 216))(*(void *)(*(void *)(a1 + 32) + 208), v10, (unint64_t)*(double *)v11 - *(_DWORD *)(*(void *)(a1 + 32) + 232), 0);
          kdebug_trace();
        }
      }
    }
    else if (gLogCategory_APAudioEngineCarPlay <= 50 {
           && (gLogCategory_APAudioEngineCarPlay != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t __audioHoseManagerBuffered_Flush_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (*(void *)(a1 + 32)) {
      CMBaseObjectGetDerivedStorage();
    }
    LogPrintF();
  }
  v5 = *(const void **)a3;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(void (**)(const void *, void, void))(v7 + 56);
  if (v8) {
    v8(v5, *MEMORY[0x1E4F49FD8], *MEMORY[0x1E4F1CFC8]);
  }
  *(_WORD *)(a3 + 10) = *(_WORD *)(a1 + 72);
  CMTime v9 = *(const void **)(a1 + 32);
  uint64_t v10 = *(unsigned int *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 44);
  int v12 = *(_DWORD *)(a1 + 52);
  uint64_t v27 = *(void *)(a1 + 56);
  int32_t v13 = *(_DWORD *)(a1 + 68);
  int v28 = *(_DWORD *)(a1 + 64);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(a3 + 44)) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = *(void *)(a3 + 96) != 0;
  }
  v25[0] = *MEMORY[0x1E4F49F28];
  long long v23 = v25[0];
  *(_OWORD *)((char *)v25 + 12) = *(_OWORD *)(MEMORY[0x1E4F49F28] + 12);
  long long v22 = *(_OWORD *)((char *)v25 + 12);
  *(_DWORD *)(a3 + 44) = 0;
  *(void *)(a3 + 96) = 0;
  uint64_t v16 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)(a3 + 64) = *MEMORY[0x1E4F1FA48];
  *(void *)(a3 + 80) = *(void *)(v16 + 16);
  *(void *)(a3 + 88) = 0;
  *(_WORD *)(a3 + 40) = 256;
  *(void *)(a3 + 56) = 0;
  uint64_t result = mach_absolute_time();
  *(void *)(a3 + 48) = result;
  *(_OWORD *)(a3 + 148) = v23;
  *(_OWORD *)(a3 + 160) = v22;
  *(unsigned char *)(a3 + 176) = 0;
  if (v15)
  {
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (v9) {
        CMBaseObjectGetDerivedStorage();
      }
      *(void *)CMTime time = v11;
      *(_DWORD *)&time[8] = v12;
      *(void *)&time[12] = v27;
      *(_DWORD *)&time[20] = v28;
      CMTimeGetSeconds((CMTime *)time);
      LogPrintF();
    }
    if (*(unsigned char *)(DerivedStorage + 186))
    {
      *(void *)CMTime time = v11;
      *(_DWORD *)&time[8] = v12;
      *(void *)&time[12] = v27;
      *(_DWORD *)&time[20] = v28;
      APSAudioTransportTimeMakeWithMediaTime();
      if (!v9) {
        goto LABEL_33;
      }
    }
    else
    {
      *(void *)v24 = v11;
      *(_DWORD *)&v24[8] = v12;
      *(void *)&v24[12] = v27;
      *(_DWORD *)&v24[20] = v28;
      CMTimeConvertScale((CMTime *)time, (CMTime *)v24, v13, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      APSAudioTransportTimeMakeWithRTPTime();
      if (!v9)
      {
LABEL_33:
        v18 = *(const void **)a3;
        *(_OWORD *)v24 = v25[0];
        *(_OWORD *)&v24[12] = *(_OWORD *)((char *)v25 + 12);
        APSEndpointStreamAudioHoseProtocolGetProtocolID();
        uint64_t result = CMBaseObjectGetProtocolVTable();
        if (result)
        {
          uint64_t v20 = *(void *)(result + 16);
          result += 16;
          uint64_t v19 = v20;
          if (v20)
          {
            v21 = *(uint64_t (**)(const void *, uint64_t, unsigned char *, void, const void *))(v19 + 24);
            if (v21)
            {
              *(_OWORD *)CMTime time = *(_OWORD *)v24;
              *(_OWORD *)&time[12] = *(_OWORD *)&v24[12];
              uint64_t result = v21(v18, v10, time, audioHoseManagerBuffered_hoseFlushCallbackCompletionHandler, v9);
            }
            else
            {
              uint64_t result = audioHoseManagerBuffered_hoseFlushCallbackCompletionHandler(v18, 0, MEMORY[0x1E4F49F28], 0xFFFFCE12, v9);
            }
          }
        }
        ++*(_DWORD *)(a3 + 144);
        return result;
      }
    }
    CFRetain(v9);
    goto LABEL_33;
  }
  if (gLogCategory_APAudioHoseManagerBuffered <= 50)
  {
    if (gLogCategory_APAudioHoseManagerBuffered != -1 || (uint64_t result = _LogCategory_Initialize(), result))
    {
      if (v9) {
        CMBaseObjectGetDerivedStorage();
      }
      return LogPrintF();
    }
  }
  return result;
}

@end