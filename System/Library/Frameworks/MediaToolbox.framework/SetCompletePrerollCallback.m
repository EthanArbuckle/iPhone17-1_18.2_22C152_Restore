@interface SetCompletePrerollCallback
@end

@implementation SetCompletePrerollCallback

void *__customVideoCompositor_SetCompletePrerollCallback_block_invoke(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = result[5];
  if (*(void *)(v1 + 200) != v2 || *(void *)(v1 + 208) != result[6])
  {
    *(void *)(v1 + 200) = v2;
    *(void *)(result[4] + 208) = result[6];
  }
  return result;
}

@end