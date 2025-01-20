@interface IOGCFastPathRoyaReplayInputQueueSampleGetDouble
@end

@implementation IOGCFastPathRoyaReplayInputQueueSampleGetDouble

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble_block_invoke(uint64_t a1, _DWORD *a2)
{
  return a2[2] == *(_DWORD *)(a1 + 32) && a2[3] == 5 && a2[4] == *(_DWORD *)(a1 + 36);
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble_block_invoke_2(uint64_t a1, uint64_t a2)
{
  **(void **)(a1 + 32) = *(void *)(a2 + 24);
  return 0;
}

@end