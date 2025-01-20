@interface AddHandlers
@end

@implementation AddHandlers

void __AddHandlers_block_invoke_2(id a1, MTLCommandBuffer *a2)
{
  v3 = a2;
  if ([(MTLCommandBuffer *)v3 status] == (char *)&dword_4 + 1)
  {
    v2 = GTMTLReplay_dictionaryFromCommandBuffer(v3);
    GTMTLReplay_handleCommandBufferError((uint64_t)v2);
  }
  if (GTMTLReplayDefaults_logCommandBufferHandlers()) {
    LogCommandBuffer(@"Completed", v3);
  }
}

void __AddHandlers_block_invoke(id a1, MTLCommandBuffer *a2)
{
}

@end