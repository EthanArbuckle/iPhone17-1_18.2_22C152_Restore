@interface VTMotionEstimationSessionRemote
@end

@implementation VTMotionEstimationSessionRemote

uint64_t __VTMotionEstimationSessionRemote_Create_block_invoke(uint64_t a1, mach_port_t a2, int a3, _DWORD *a4, void *a5, void *a6)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v21 = 0;
  memset(buffer, 0, sizeof(buffer));
  pid_t v12 = getpid();
  proc_name(v12, buffer, 0x20u);
  CFDataRef v13 = *(const __CFData **)(a1 + 40);
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 224);
  unsigned int v15 = *(_DWORD *)(a1 + 48);
  unsigned int v16 = *(_DWORD *)(a1 + 52);
  if (v13)
  {
    BytePtr = CFDataGetBytePtr(v13);
    CFDataRef v18 = *(const __CFData **)(a1 + 40);
    if (v18)
    {
      int Length = CFDataGetLength(v18);
      goto LABEL_6;
    }
  }
  else
  {
    BytePtr = 0;
  }
  int Length = 0;
LABEL_6:
  LODWORD(result) = VTCompressionSessionRemoteClient_MotionEstimationCreate(a2, a3, v14, v15, v16, (uint64_t)BytePtr, Length, (char *)buffer, a4, a5, a6, &v21);
  if (result) {
    return result;
  }
  else {
    return v21;
  }
}

@end