@interface NOCOPY
@end

@implementation NOCOPY

uint64_t __NOCOPY_SETTER_IMPL_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    return [a2 setObject:v2 forKey:v3];
  }
  else {
    return [a2 removeObjectForKey:v3];
  }
}

@end