@interface VTMultiPassStorageRemote
@end

@implementation VTMultiPassStorageRemote

uint64_t __VTMultiPassStorageRemote_Create_block_invoke(uint64_t a1, mach_port_name_t a2, int a3, _DWORD *a4, void *a5, void *a6)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int v22 = 0;
  memset(buffer, 0, sizeof(buffer));
  pid_t v12 = getpid();
  proc_name(v12, buffer, 0x20u);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 224);
  if (v13) {
    int v15 = strlen(*(const char **)(a1 + 40)) + 1;
  }
  else {
    int v15 = 0;
  }
  CFDataRef v16 = *(const __CFData **)(a1 + 48);
  if (v16)
  {
    BytePtr = CFDataGetBytePtr(v16);
    CFDataRef v18 = *(const __CFData **)(a1 + 48);
    if (v18)
    {
      int Length = CFDataGetLength(v18);
      goto LABEL_9;
    }
  }
  else
  {
    BytePtr = 0;
  }
  int Length = 0;
LABEL_9:
  long long v20 = *(_OWORD *)(a1 + 72);
  v23[0] = *(_OWORD *)(a1 + 56);
  v23[1] = v20;
  v23[2] = *(_OWORD *)(a1 + 88);
  LODWORD(result) = VTCompressionSessionRemoteClient_MultiPassStorageCreate(a2, a3, v14, v13, v15, v23, (uint64_t)BytePtr, Length, (char *)buffer, a4, a5, a6, &v22);
  if (result) {
    return result;
  }
  else {
    return v22;
  }
}

@end