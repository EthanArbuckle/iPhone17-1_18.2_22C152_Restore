@interface StepInPresentationOrderAndReportStepsTaken
@end

@implementation StepInPresentationOrderAndReportStepsTaken

uint64_t __remoteSampleCursor_StepInPresentationOrderAndReportStepsTaken_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v7 = 0;
  dataPointerOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, 0, &v7, 0, &dataPointerOut);
  if (!result)
  {
    v4 = dataPointerOut;
    uint64_t result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v7 > 0x197)
    {
      *((void *)dataPointerOut + 50) = 0;
      *((_OWORD *)v4 + 23) = 0u;
      *((_OWORD *)v4 + 24) = 0u;
      *((_OWORD *)v4 + 21) = 0u;
      *((_OWORD *)v4 + 22) = 0u;
      *((_OWORD *)v4 + 19) = 0u;
      *((_OWORD *)v4 + 20) = 0u;
      *((_OWORD *)v4 + 17) = 0u;
      *((_OWORD *)v4 + 18) = 0u;
      *((_OWORD *)v4 + 15) = 0u;
      *((_OWORD *)v4 + 16) = 0u;
      *((_OWORD *)v4 + 13) = 0u;
      *((_OWORD *)v4 + 14) = 0u;
      *((_OWORD *)v4 + 11) = 0u;
      *((_OWORD *)v4 + 12) = 0u;
      *((_OWORD *)v4 + 9) = 0u;
      *((_OWORD *)v4 + 10) = 0u;
      *((_OWORD *)v4 + 7) = 0u;
      *((_OWORD *)v4 + 8) = 0u;
      *((_OWORD *)v4 + 5) = 0u;
      *((_OWORD *)v4 + 6) = 0u;
      *((_OWORD *)v4 + 3) = 0u;
      *((_OWORD *)v4 + 4) = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_OWORD *)v4 + 2) = 0u;
      *(_OWORD *)v4 = 0u;
      v5 = dataPointerOut;
      *(void *)dataPointerOut = *(void *)(a1 + 32);
      *((void *)v5 + 1) = 0;
      *((_DWORD *)v5 + 4) = 1936731000;
      *((void *)v5 + 42) = *(void *)(a1 + 40);
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      uint64_t result = 0;
      v5[328] = *(_DWORD *)(*(void *)DerivedStorage + 40) > 1;
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_StepInPresentationOrderAndReportStepsTaken_block_invoke_2(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v6 = 0;
  dataPointerOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, 0, &v6, 0, &dataPointerOut);
  if (!result)
  {
    v4 = dataPointerOut;
    uint64_t result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v6 > 0x197)
    {
      v5 = *(void **)(a1 + 32);
      if (v5) {
        void *v5 = *((void *)dataPointerOut + 42);
      }
      uint64_t result = remoteSampleCursor_updateSimpleCacheViaEventLink(*(void *)(a1 + 40), (uint64_t)v4);
      if (!result) {
        return remoteSampleCursor_maybeCreateCopiedCursorViaEventLink(*(const void **)(a1 + 40), (uint64_t)v4);
      }
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_StepInPresentationOrderAndReportStepsTaken_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v5[0] = *MEMORY[0x1E4F1FA20];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  xpc_dictionary_set_int64(xdict, "SampleCursorStepCount", *(void *)(a1 + 32));
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 16);
  if (result)
  {
    uint64_t result = FigPartialSampleTableGetDecodeTimeRange(result, v5, 0);
    if (!result) {
      return FigXPCMessageSetCMTimeRange();
    }
  }
  return result;
}

@end