@interface _MTLSharedEvent(IOGPUFamilySupport)
- (uint64_t)_encodeIOGPUKernelConditionalEventAbortCommandArgs:()IOGPUFamilySupport;
- (uint64_t)_encodeIOGPUKernelSignalEventAgentCommandArgs:()IOGPUFamilySupport value:agentMask:;
- (uint64_t)_encodeIOGPUKernelSignalEventCommandArgs:()IOGPUFamilySupport value:;
- (uint64_t)_encodeIOGPUKernelSignalEventScheduledCommandArgs:()IOGPUFamilySupport value:;
- (uint64_t)_encodeIOGPUKernelWaitEventCommandArgs:()IOGPUFamilySupport value:timeout:;
@end

@implementation _MTLSharedEvent(IOGPUFamilySupport)

- (uint64_t)_encodeIOGPUKernelSignalEventCommandArgs:()IOGPUFamilySupport value:
{
  unsigned int v4 = *(_DWORD *)(a1 + (int)*MEMORY[0x263F0ED20]);
  a3[1] = a4;
  *a3 = v4;
  return 3;
}

- (uint64_t)_encodeIOGPUKernelWaitEventCommandArgs:()IOGPUFamilySupport value:timeout:
{
  int v5 = *(_DWORD *)(a1 + (int)*MEMORY[0x263F0ED20]);
  *(void *)(a3 + 8) = a4;
  if (a5 >= 0xFFFF) {
    int v6 = 0xFFFF;
  }
  else {
    int v6 = a5;
  }
  *(_DWORD *)a3 = v5;
  *(_DWORD *)(a3 + 4) = v6;
  return 4;
}

- (uint64_t)_encodeIOGPUKernelSignalEventAgentCommandArgs:()IOGPUFamilySupport value:agentMask:
{
  *a3 = *(unsigned int *)(a1 + (int)*MEMORY[0x263F0ED20]);
  a3[1] = a4;
  a3[2] = a5;
  return 11;
}

- (uint64_t)_encodeIOGPUKernelConditionalEventAbortCommandArgs:()IOGPUFamilySupport
{
  unsigned int v3 = *(_DWORD *)(a1 + (int)*MEMORY[0x263F0ED20]);
  a3[1] = 0;
  *a3 = v3;
  return 12;
}

- (uint64_t)_encodeIOGPUKernelSignalEventScheduledCommandArgs:()IOGPUFamilySupport value:
{
  unsigned int v4 = *(_DWORD *)(a1 + (int)*MEMORY[0x263F0ED20]);
  a3[1] = a4;
  *a3 = v4;
  return 13;
}

@end