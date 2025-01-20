@interface TestReorderingBoundary
@end

@implementation TestReorderingBoundary

double __remoteSampleCursor_TestReorderingBoundary_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
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
      *((void *)v5 + 1) = *(void *)(a1 + 40);
      *((_DWORD *)v5 + 4) = 1935830628;
      *((void *)v5 + 42) = *(int *)(a1 + 48);
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_TestReorderingBoundary_block_invoke_2(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v4 = 0;
  dataPointerOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, 0, &v4, 0, &dataPointerOut);
  if (!result)
  {
    uint64_t result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v4 > 0x197)
    {
      uint64_t result = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = dataPointerOut[336];
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_TestReorderingBoundary_block_invoke_86(uint64_t a1, xpc_object_t xdict)
{
  return 0;
}

@end