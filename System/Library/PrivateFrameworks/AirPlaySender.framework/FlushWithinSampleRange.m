@interface FlushWithinSampleRange
@end

@implementation FlushWithinSampleRange

uint64_t __audioHoseManagerBuffered_FlushWithinSampleRange_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  __int16 v5 = *(_WORD *)(a1 + 100);
  if ((__int16)(*(_WORD *)(a3 + 10) - v5) >= 1) {
    *(_WORD *)(a3 + 10) = v5;
  }
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (*(void *)(a1 + 32)) {
      CMBaseObjectGetDerivedStorage();
    }
    *(_OWORD *)time = *(_OWORD *)(a3 + 64);
    *(void *)&time[16] = *(void *)(a3 + 80);
    CMTimeGetSeconds((CMTime *)time);
    LogPrintF();
  }
  v6 = *(const void **)(a1 + 32);
  uint64_t v7 = *(unsigned int *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 44);
  int v9 = *(_DWORD *)(a1 + 52);
  uint64_t v30 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned int *)(a1 + 68);
  int v31 = *(_DWORD *)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 72);
  int v20 = *(_DWORD *)(a1 + 80);
  uint64_t v28 = *(void *)(a1 + 84);
  int32_t newTimescale = *(_DWORD *)(a1 + 96);
  int v29 = *(_DWORD *)(a1 + 92);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMTime v25 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  v24[0] = *MEMORY[0x1E4F49F28];
  long long v12 = v24[0];
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)(MEMORY[0x1E4F49F28] + 12);
  v23[0] = v12;
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v24 + 12);
  *(_OWORD *)time = *(_OWORD *)(a3 + 16);
  *(void *)&time[16] = *(void *)(a3 + 32);
  *(void *)rhs = v8;
  *(void *)&rhs[12] = v30;
  *(_DWORD *)&rhs[8] = v9;
  *(_DWORD *)&rhs[20] = v31;
  CMTimeSubtract(&v25, (CMTime *)time, (CMTime *)rhs);
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (v6) {
      CMBaseObjectGetDerivedStorage();
    }
    *(_OWORD *)time = *(_OWORD *)(a3 + 64);
    *(void *)&time[16] = *(void *)(a3 + 80);
    CMTimeGetSeconds((CMTime *)time);
    LogPrintF();
  }
  *(_OWORD *)rhs = *(_OWORD *)(a3 + 64);
  *(void *)&rhs[16] = *(void *)(a3 + 80);
  *(CMTime *)v22 = v25;
  CMTimeSubtract((CMTime *)time, (CMTime *)rhs, (CMTime *)v22);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)time;
  *(void *)(a3 + 80) = *(void *)&time[16];
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (v6) {
      CMBaseObjectGetDerivedStorage();
    }
    *(CMTime *)time = v25;
    CMTimeGetSeconds((CMTime *)time);
    *(_OWORD *)time = *(_OWORD *)(a3 + 64);
    *(void *)&time[16] = *(void *)(a3 + 80);
    CMTimeGetSeconds((CMTime *)time);
    LogPrintF();
  }
  *(_WORD *)(a3 + 40) = 256;
  *(void *)(a3 + 56) = 0;
  *(void *)(a3 + 48) = mach_absolute_time();
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (v6) {
      CMBaseObjectGetDerivedStorage();
    }
    *(void *)time = v8;
    *(void *)&time[12] = v30;
    *(_DWORD *)&time[8] = v9;
    *(_DWORD *)&time[20] = v31;
    CMTimeGetSeconds((CMTime *)time);
    *(void *)time = v19;
    *(void *)&time[12] = v28;
    *(_DWORD *)&time[8] = v20;
    *(_DWORD *)&time[20] = v29;
    CMTimeGetSeconds((CMTime *)time);
    LogPrintF();
  }
  if (!*(unsigned char *)(DerivedStorage + 186))
  {
    *(void *)rhs = v8;
    *(void *)&rhs[12] = v30;
    *(_DWORD *)&rhs[8] = v9;
    *(_DWORD *)&rhs[20] = v31;
    CMTimeConvertScale((CMTime *)time, (CMTime *)rhs, newTimescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    APSAudioTransportTimeMakeWithRTPTime();
    *(void *)rhs = v19;
    *(void *)&rhs[12] = v28;
    *(_DWORD *)&rhs[8] = v20;
    *(_DWORD *)&rhs[20] = v29;
    CMTimeConvertScale((CMTime *)time, (CMTime *)rhs, newTimescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    APSAudioTransportTimeMakeWithRTPTime();
    if (!v6) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  *(void *)time = v8;
  *(void *)&time[12] = v30;
  *(_DWORD *)&time[8] = v9;
  *(_DWORD *)&time[20] = v31;
  APSAudioTransportTimeMakeWithMediaTime();
  *(void *)time = v19;
  *(void *)&time[12] = v28;
  *(_DWORD *)&time[8] = v20;
  *(_DWORD *)&time[20] = v29;
  APSAudioTransportTimeMakeWithMediaTime();
  if (v6) {
LABEL_33:
  }
    CFRetain(v6);
LABEL_34:
  v13 = *(const void **)a3;
  *(_OWORD *)v22 = v24[0];
  *(_OWORD *)&v22[12] = *(_OWORD *)((char *)v24 + 12);
  *(_OWORD *)v21 = v23[0];
  *(_OWORD *)&v21[12] = *(_OWORD *)((char *)v23 + 12);
  APSEndpointStreamAudioHoseProtocolGetProtocolID();
  uint64_t ProtocolVTable = CMBaseObjectGetProtocolVTable();
  if (ProtocolVTable)
  {
    uint64_t v15 = *(void *)(ProtocolVTable + 16);
    if (v15)
    {
      v16 = *(void (**)(const void *, uint64_t, unsigned char *, uint64_t, unsigned char *, uint64_t (*)(const void *, int, _OWORD *, int, _OWORD *, unsigned int, const void *), const void *))(v15 + 32);
      if (v16)
      {
        *(_OWORD *)time = *(_OWORD *)v22;
        *(_OWORD *)&time[12] = *(_OWORD *)&v22[12];
        *(_OWORD *)rhs = *(_OWORD *)v21;
        *(_OWORD *)&rhs[12] = *(_OWORD *)&v21[12];
        v16(v13, v7, time, v10, rhs, audioHoseManagerBuffered_hoseFlushWithinSampleRangeCallbackCompletionHandler, v6);
      }
      else
      {
        audioHoseManagerBuffered_hoseFlushWithinSampleRangeCallbackCompletionHandler(v13, 0, MEMORY[0x1E4F49F28], 0, MEMORY[0x1E4F49F28], 0xFFFFCE12, v6);
      }
    }
  }
  ++*(_DWORD *)(a3 + 144);
  uint64_t result = APMessageRingBufferedGetByteCountAtIndex(*(void *)(DerivedStorage + 200), (unsigned __int16)(*(_WORD *)(a3 + 10) + 1), (int *)(a3 + 88));
  if (result) {
    return APSLogErrorAt();
  }
  return result;
}

@end