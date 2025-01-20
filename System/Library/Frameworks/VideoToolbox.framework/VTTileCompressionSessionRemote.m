@interface VTTileCompressionSessionRemote
@end

@implementation VTTileCompressionSessionRemote

uint64_t __VTTileCompressionSessionRemote_Create_block_invoke(uint64_t a1, mach_port_t a2, int a3, _DWORD *a4, void *a5, void *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v22 = 0;
  memset(buffer, 0, sizeof(buffer));
  pid_t v11 = getpid();
  proc_name(v11, buffer, 0x20u);
  CFDataRef v12 = *(const __CFData **)(a1 + 40);
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 224);
  unsigned int v14 = *(_DWORD *)(a1 + 64);
  if (v12)
  {
    BytePtr = CFDataGetBytePtr(v12);
    CFDataRef v16 = *(const __CFData **)(a1 + 40);
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
  CFDataRef v18 = *(const __CFData **)(a1 + 48);
  if (v18)
  {
    v19 = CFDataGetBytePtr(v18);
    CFDataRef v18 = *(const __CFData **)(a1 + 48);
    if (v18) {
      LODWORD(v18) = CFDataGetLength(v18);
    }
  }
  else
  {
    v19 = 0;
  }
  LODWORD(result) = VTCompressionSessionRemoteClient_TileCreate(a2, a3, v13, *(void *)(a1 + 56), v14, (uint64_t)BytePtr, Length, (uint64_t)v19, (int)v18, (char *)buffer, a4, a5, a6, (int *)&v22);
  if (result) {
    return result;
  }
  else {
    return v22;
  }
}

uint64_t __VTTileCompressionSessionRemote_EncodeTile_block_invoke(uint64_t a1)
{
  uint64_t result = FigAtomicIncrement32();
  if (result == 1) {
    uint64_t result = FigSemaphoreWaitRelative();
  }
  *(void *)(*(void *)(a1 + 40) + 48) = *(void *)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 40);
  return result;
}

uint64_t __VTTileCompressionSessionRemote_EncodeTile_block_invoke_2(uint64_t result)
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
          uint64_t v4 = *(void *)(v2 + 32);
          uint64_t v7 = *(void *)(v4 + 40);
          v5 = (void *)(v4 + 40);
          uint64_t v6 = v7;
          if (v7 != v3)
          {
            do
            {
              uint64_t v8 = v6;
              uint64_t v6 = *(void *)(v6 + 48);
            }
            while (v6 != v3);
            v5 = (void *)(v8 + 48);
          }
          void *v5 = v1;
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