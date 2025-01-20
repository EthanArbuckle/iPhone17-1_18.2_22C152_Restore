@interface AGXG17FamilyLateEvalEvent
- (unsigned)_encodeIOGPUKernelWaitEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5;
@end

@implementation AGXG17FamilyLateEvalEvent

- (unsigned)_encodeIOGPUKernelWaitEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  unsigned int v5 = *(_DWORD *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F4B148]);
  a3->var2 = a4;
  a3->var0 = v5;
  a3->var1 = a5;
  return 65540;
}

@end