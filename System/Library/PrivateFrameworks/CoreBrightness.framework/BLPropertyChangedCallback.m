@interface BLPropertyChangedCallback
@end

@implementation BLPropertyChangedCallback

void *____BLPropertyChangedCallback_block_invoke(void *result)
{
  if (*(void *)(result[4] + 16)) {
    return (void *)(*(uint64_t (**)(void, void, void))(result[4] + 16))(*(void *)(result[4] + 24), result[5], result[6]);
  }
  return result;
}

@end