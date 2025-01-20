@interface IOGCFastPathRoyaReplayInputQueueSampleSetDouble2
@end

@implementation IOGCFastPathRoyaReplayInputQueueSampleSetDouble2

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble2_block_invoke(uint64_t a1, _DWORD *a2)
{
  return a2[2] == *(_DWORD *)(a1 + 32) && a2[3] == 6 && a2[4] == *(_DWORD *)(a1 + 36);
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble2_block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 52);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 48);
  *(_DWORD *)(a2 + 12) = 6;
  *(_DWORD *)(a2 + 16) = v2;
  *(void *)(a2 + 24) = *(void *)(a1 + 32);
  *(void *)(a2 + 32) = *(void *)(a1 + 40);
  return 0;
}

@end