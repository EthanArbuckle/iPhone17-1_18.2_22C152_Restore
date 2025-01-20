@interface SetActionAtEnd
@end

@implementation SetActionAtEnd

uint64_t __fpic_SetActionAtEnd_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 992) = *(void *)(result + 40);
  return result;
}

@end