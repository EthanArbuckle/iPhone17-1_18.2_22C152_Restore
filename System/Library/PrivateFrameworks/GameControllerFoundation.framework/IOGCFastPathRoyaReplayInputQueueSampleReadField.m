@interface IOGCFastPathRoyaReplayInputQueueSampleReadField
@end

@implementation IOGCFastPathRoyaReplayInputQueueSampleReadField

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int16 *)(a2 + 18);
  if (!*(_WORD *)(a2 + 18)) {
    return 3758097136;
  }
  uint64_t v5 = 0;
  for (i = (void *)(a2 + 32); *i != *(void *)(a2 + 8); i += 6)
  {
LABEL_6:
    if (++v5 >= (unint64_t)v2) {
      return 3758097136;
    }
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    unsigned int v2 = *(unsigned __int16 *)(a2 + 18);
    goto LABEL_6;
  }
  v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v8();
}

@end