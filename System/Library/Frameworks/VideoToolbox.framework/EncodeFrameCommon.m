@interface EncodeFrameCommon
@end

@implementation EncodeFrameCommon

uint64_t __vtCompressionSessionRemote_EncodeFrameCommon_block_invoke(uint64_t a1)
{
  uint64_t result = FigAtomicIncrement32();
  if (result == 1) {
    uint64_t result = FigSemaphoreWaitRelative();
  }
  *(void *)(*(void *)(a1 + 40) + 48) = *(void *)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 40);
  return result;
}

uint64_t __vtCompressionSessionRemote_EncodeFrameCommon_block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 40);
  if (v1)
  {
    uint64_t v2 = result;
    do
    {
      while (1)
      {
        uint64_t v3 = v1;
        uint64_t v1 = *(void *)(v1 + 48);
        if (v3 == *(void *)(v2 + 40))
        {
          v4 = *(const void **)(v3 + 32);
          if (v4)
          {
            _Block_release(v4);
            uint64_t v3 = *(void *)(v2 + 40);
          }
          uint64_t v5 = *(void *)(v2 + 32);
          uint64_t v8 = *(void *)(v5 + 40);
          v6 = (void *)(v5 + 40);
          uint64_t v7 = v8;
          if (v8 != v3)
          {
            do
            {
              uint64_t v9 = v7;
              uint64_t v7 = *(void *)(v7 + 48);
            }
            while (v7 != v3);
            v6 = (void *)(v9 + 48);
          }
          void *v6 = *(void *)(v3 + 48);
          free(*(void **)(v2 + 40));
          uint64_t result = FigAtomicDecrement32();
          if (!result) {
            break;
          }
        }
        if (!v1) {
          return result;
        }
      }
      uint64_t result = FigSemaphoreSignal();
    }
    while (v1);
  }
  return result;
}

@end