@interface APCarPlayControlServerInvalidate
@end

@implementation APCarPlayControlServerInvalidate

uint64_t ___APCarPlayControlServerInvalidate_block_invoke(uint64_t a1, const void *a2)
{
  return APCarPlayControlServerRemoveInterface(*(void *)(a1 + 32), a2);
}

@end