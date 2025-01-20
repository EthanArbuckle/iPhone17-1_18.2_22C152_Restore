@interface GetPresentationTimeRange
@end

@implementation GetPresentationTimeRange

double __remoteSampleCursor_GetPresentationTimeRange_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v6 = 0;
  dataPointerOut = 0;
  if (!CMBlockBufferGetDataPointer(theBuffer, 0, &v6, 0, &dataPointerOut))
  {
    v4 = dataPointerOut;
    if ((dataPointerOut & 7) == 0 && v6 > 0x197)
    {
      *((void *)dataPointerOut + 50) = 0;
      double result = 0.0;
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
      *((_DWORD *)v5 + 4) = 1935896690;
    }
  }
  return result;
}

__n128 __remoteSampleCursor_GetPresentationTimeRange_block_invoke_2(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v6 = 0;
  dataPointerOut = 0;
  if (!CMBlockBufferGetDataPointer(theBuffer, 0, &v6, 0, &dataPointerOut)
    && (dataPointerOut & 7) == 0
    && v6 > 0x197)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    __n128 result = *((__n128 *)dataPointerOut + 21);
    long long v5 = *((_OWORD *)dataPointerOut + 23);
    *(_OWORD *)(v4 + 16) = *((_OWORD *)dataPointerOut + 22);
    *(_OWORD *)(v4 + 32) = v5;
    *(__n128 *)uint64_t v4 = result;
  }
  return result;
}

@end