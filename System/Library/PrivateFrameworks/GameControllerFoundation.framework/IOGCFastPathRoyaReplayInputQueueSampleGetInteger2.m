@interface IOGCFastPathRoyaReplayInputQueueSampleGetInteger2
@end

@implementation IOGCFastPathRoyaReplayInputQueueSampleGetInteger2

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger2_block_invoke(uint64_t a1, _DWORD *a2)
{
  return a2[2] == *(_DWORD *)(a1 + 32) && a2[3] == 3 && a2[4] == *(_DWORD *)(a1 + 36);
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger2_block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 40);
  **(void **)(a1 + 32) = *(void *)(a2 + 24);
  void *v2 = *(void *)(a2 + 32);
  return 0;
}

@end