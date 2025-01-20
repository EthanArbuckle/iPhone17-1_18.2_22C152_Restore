@interface SingularHoseIsLocal
@end

@implementation SingularHoseIsLocal

uint64_t __audioHoseManagerBuffered_SingularHoseIsLocal_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a3 + 8);
  return result;
}

@end