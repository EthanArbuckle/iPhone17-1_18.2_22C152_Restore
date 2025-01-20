@interface CFRunLoopCopyMode
@end

@implementation CFRunLoopCopyMode

uint64_t ____CFRunLoopCopyMode_block_invoke(uint64_t result)
{
  **(unsigned char **)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

@end