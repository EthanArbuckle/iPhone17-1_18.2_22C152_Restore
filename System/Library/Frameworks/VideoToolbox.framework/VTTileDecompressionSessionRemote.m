@interface VTTileDecompressionSessionRemote
@end

@implementation VTTileDecompressionSessionRemote

uint64_t __VTTileDecompressionSessionRemote_Create_block_invoke(void *a1, mach_port_t a2, int a3, _DWORD *a4, void *a5, void *a6)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v21 = 0;
  memset(buffer, 0, sizeof(buffer));
  pid_t v12 = getpid();
  proc_name(v12, buffer, 0x20u);
  uint64_t v13 = a1[5];
  uint64_t v14 = *(void *)(a1[4] + 240);
  uint64_t v16 = a1[6];
  CFDataRef v15 = (const __CFData *)a1[7];
  if (v15)
  {
    BytePtr = CFDataGetBytePtr(v15);
    CFDataRef v18 = (const __CFData *)a1[7];
    if (v18)
    {
      unsigned int Length = CFDataGetLength(v18);
      goto LABEL_6;
    }
  }
  else
  {
    BytePtr = 0;
  }
  unsigned int Length = 0;
LABEL_6:
  LODWORD(result) = VTDecompressionSessionRemoteClient_TileCreate(a2, a3, v14, v13, v16, (uint64_t)BytePtr, Length, (char *)buffer, a4, a5, a6, (int *)&v21);
  if (result) {
    return result;
  }
  else {
    return v21;
  }
}

@end