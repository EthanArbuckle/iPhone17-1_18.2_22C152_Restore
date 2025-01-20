@interface VTCompressionSessionRemote
@end

@implementation VTCompressionSessionRemote

uint64_t __VTCompressionSessionRemote_Create_block_invoke(uint64_t a1, mach_port_t a2, int a3, _DWORD *a4, void *a5, uint64_t *a6)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int v28 = 0;
  memset(buffer, 0, sizeof(buffer));
  pid_t v7 = getpid();
  proc_name(v7, buffer, 0x20u);
  CFDataRef v8 = *(const __CFData **)(a1 + 40);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 224);
  unsigned int v11 = *(_DWORD *)(a1 + 64);
  unsigned int v10 = *(_DWORD *)(a1 + 68);
  unsigned int v12 = *(_DWORD *)(a1 + 72);
  if (v8)
  {
    BytePtr = CFDataGetBytePtr(v8);
    CFDataRef v14 = *(const __CFData **)(a1 + 40);
    if (v14)
    {
      unsigned int Length = CFDataGetLength(v14);
      goto LABEL_6;
    }
  }
  else
  {
    BytePtr = 0;
  }
  unsigned int Length = 0;
LABEL_6:
  CFDataRef v16 = *(const __CFData **)(a1 + 48);
  if (v16)
  {
    v17 = CFDataGetBytePtr(v16);
    CFDataRef v18 = *(const __CFData **)(a1 + 48);
    if (v18)
    {
      unsigned int v19 = CFDataGetLength(v18);
      goto LABEL_11;
    }
  }
  else
  {
    v17 = 0;
  }
  unsigned int v19 = 0;
LABEL_11:
  CFDataRef v20 = *(const __CFData **)(a1 + 56);
  if (v20)
  {
    v21 = CFDataGetBytePtr(v20);
    CFDataRef v20 = *(const __CFData **)(a1 + 56);
    if (v20) {
      LODWORD(v20) = CFDataGetLength(v20);
    }
  }
  else
  {
    v21 = 0;
  }
  LODWORD(result) = VTCompressionSessionRemoteClient_Create(a2, a3, v9, v11, v10, v12, (uint64_t)BytePtr, Length, (uint64_t)v17, v19, (uint64_t)v21, v20, (char *)buffer, a4, a5, a6, (int *)&v28);
  if (result) {
    return result;
  }
  else {
    return v28;
  }
}

uint64_t __VTCompressionSessionRemote_EstimateMotionVectors_block_invoke(uint64_t a1)
{
  uint64_t result = FigAtomicIncrement32();
  if (result == 1) {
    uint64_t result = FigSemaphoreWaitRelative();
  }
  *(void *)(*(void *)(a1 + 40) + 48) = *(void *)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 40);
  return result;
}

uint64_t __VTCompressionSessionRemote_EstimateMotionVectors_block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 40);
  if (v1)
  {
    uint64_t v2 = result;
    do
    {
      while (1)
      {
        uint64_t v3 = v1;
        uint64_t v1 = *(void *)(v1 + 48);
        if (v3 == *(void *)(v2 + 40))
        {
          v4 = *(const void **)(v3 + 32);
          if (v4)
          {
            _Block_release(v4);
            uint64_t v3 = *(void *)(v2 + 40);
          }
          uint64_t v5 = *(void *)(v2 + 32);
          uint64_t v8 = *(void *)(v5 + 40);
          v6 = (void *)(v5 + 40);
          uint64_t v7 = v8;
          if (v8 != v3)
          {
            do
            {
              uint64_t v9 = v7;
              uint64_t v7 = *(void *)(v7 + 48);
            }
            while (v7 != v3);
            v6 = (void *)(v9 + 48);
          }
          void *v6 = *(void *)(v3 + 48);
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