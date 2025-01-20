@interface IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp
@end

@implementation IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp_block_invoke(_DWORD *a1, _DWORD *a2)
{
  return a2[2] == a1[8] && a2[3] == 1 && a2[4] == a1[9] && a2[5] == a1[10];
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp_block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 48);
  *(_DWORD *)(a2 + 12) = 1;
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 52);
  *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 56);
  *(void *)(a2 + 24) = *(void *)(a1 + 32);
  *(void *)(a2 + 32) = *(void *)(a1 + 40);
  return 0;
}

@end