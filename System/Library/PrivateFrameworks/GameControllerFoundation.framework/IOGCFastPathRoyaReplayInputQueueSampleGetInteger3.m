@interface IOGCFastPathRoyaReplayInputQueueSampleGetInteger3
@end

@implementation IOGCFastPathRoyaReplayInputQueueSampleGetInteger3

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger3_block_invoke(uint64_t a1, _DWORD *a2)
{
  return a2[2] == *(_DWORD *)(a1 + 32) && a2[3] == 4 && a2[4] == *(_DWORD *)(a1 + 36);
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger3_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 40);
  **(void **)(a1 + 32) = a2[3];
  void *v2 = a2[4];
  **(void **)(a1 + 48) = a2[5];
  return 0;
}

@end