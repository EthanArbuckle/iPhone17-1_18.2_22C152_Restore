@interface ReplicatePattern
@end

@implementation ReplicatePattern

uint64_t __ripc_ReplicatePattern_block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 96);
  }
  else {
    uint64_t v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= v2 == *(void *)(result + 40);
  return result;
}

@end