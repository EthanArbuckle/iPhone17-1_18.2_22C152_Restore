@interface StepByPresentationTime
@end

@implementation StepByPresentationTime

uint64_t __remoteSampleCursor_StepByPresentationTime_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v8 = 0;
  dataPointerOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, 0, &v8, 0, &dataPointerOut);
  if (!result)
  {
    v4 = dataPointerOut;
    uint64_t result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v8 > 0x197)
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
      *((_DWORD *)v5 + 4) = 1936945268;
      long long v6 = *(_OWORD *)(a1 + 48);
      *((void *)v5 + 44) = *(void *)(a1 + 64);
      *((_OWORD *)v5 + 21) = v6;
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      uint64_t result = 0;
      v5[328] = *(_DWORD *)(*(void *)DerivedStorage + 40) > 1;
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_StepByPresentationTime_block_invoke_2(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v5 = 0;
  dataPointerOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, 0, &v5, 0, &dataPointerOut);
  if (!result)
  {
    v4 = dataPointerOut;
    uint64_t result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v5 > 0x197)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = dataPointerOut[336];
      uint64_t result = remoteSampleCursor_updateSimpleCacheViaEventLink(*(void *)(a1 + 40), (uint64_t)v4);
      if (!result) {
        return remoteSampleCursor_maybeCreateCopiedCursorViaEventLink(*(const void **)(a1 + 40), (uint64_t)v4);
      }
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_StepByPresentationTime_block_invoke_3()
{
  return FigXPCMessageSetCMTime();
}

@end