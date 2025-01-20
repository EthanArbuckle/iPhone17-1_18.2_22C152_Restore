@interface VTDecompressionSessionRemote
@end

@implementation VTDecompressionSessionRemote

uint64_t __VTDecompressionSessionRemote_Create_block_invoke(void *a1, mach_port_t a2, int a3, _DWORD *a4, void *a5, void *a6)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int v23 = 0;
  memset(buffer, 0, sizeof(buffer));
  pid_t v10 = getpid();
  proc_name(v10, buffer, 0x20u);
  uint64_t v11 = a1[5];
  uint64_t v12 = *(void *)(a1[4] + 240);
  uint64_t v14 = a1[6];
  CFDataRef v13 = (const __CFData *)a1[7];
  if (v13)
  {
    BytePtr = CFDataGetBytePtr(v13);
    CFDataRef v16 = (const __CFData *)a1[7];
    if (v16)
    {
      unsigned int Length = CFDataGetLength(v16);
      goto LABEL_6;
    }
  }
  else
  {
    BytePtr = 0;
  }
  unsigned int Length = 0;
LABEL_6:
  CFDataRef v18 = (const __CFData *)a1[8];
  if (v18)
  {
    v19 = CFDataGetBytePtr(v18);
    CFDataRef v18 = (const __CFData *)a1[8];
    if (v18) {
      LODWORD(v18) = CFDataGetLength(v18);
    }
  }
  else
  {
    v19 = 0;
  }
  LODWORD(result) = VTDecompressionSessionRemoteClient_Create(a2, a3, v12, v11, v14, (uint64_t)BytePtr, Length, (uint64_t)v19, (int)v18, (char *)buffer, a4, a5, a6, (int *)&v23);
  if (result) {
    return result;
  }
  else {
    return v23;
  }
}

uint64_t __VTDecompressionSessionRemote_GetMinOutputPresentationTimeStampOfFramesBeingDecoded_block_invoke(void *a1)
{
  uint64_t result = VTDecompressionSessionRemoteClient_GetMinOutputPresentationTimeStampOfFramesBeingDecoded(*(_DWORD *)(a1[6] + 24), *(void *)(a1[5] + 8) + 24);
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __VTDecompressionSessionRemote_GetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded_block_invoke(void *a1)
{
  uint64_t result = VTDecompressionSessionRemoteClient_GetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded(*(_DWORD *)(a1[8] + 24), *(void *)(a1[5] + 8) + 24, *(void *)(a1[6] + 8) + 24, (_DWORD *)(*(void *)(a1[7] + 8) + 24));
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __VTDecompressionSessionRemote_DecodeTile_block_invoke(uint64_t a1)
{
  uint64_t result = FigAtomicIncrement32();
  if (result == 1) {
    uint64_t result = FigSemaphoreWaitRelative();
  }
  *(void *)(*(void *)(a1 + 40) + 72) = *(void *)(*(void *)(a1 + 32) + 32);
  *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 40);
  return result;
}

uint64_t __VTDecompressionSessionRemote_DecodeTile_block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 32);
  if (v1)
  {
    uint64_t v2 = result;
    do
    {
      while (1)
      {
        uint64_t v3 = v1;
        uint64_t v1 = *(void *)(v1 + 72);
        if (v3 == *(void *)(v2 + 40))
        {
          v4 = *(const void **)(v3 + 40);
          if (v4)
          {
            CFRelease(v4);
            uint64_t v3 = *(void *)(v2 + 40);
          }
          uint64_t v5 = *(void *)(v2 + 32);
          uint64_t v8 = *(void *)(v5 + 32);
          v6 = (void *)(v5 + 32);
          uint64_t v7 = v8;
          if (v8 != v3)
          {
            do
            {
              uint64_t v9 = v7;
              uint64_t v7 = *(void *)(v7 + 72);
            }
            while (v7 != v3);
            v6 = (void *)(v9 + 72);
          }
          void *v6 = *(void *)(v3 + 72);
          free(*(void **)(v2 + 40));
          uint64_t result = FigAtomicDecrement32();
          if (!result) {
            break;
          }
        }
        if (!v1) {
          return result;
        }
      }
      uint64_t result = FigSemaphoreSignal();
    }
    while (v1);
  }
  return result;
}

@end