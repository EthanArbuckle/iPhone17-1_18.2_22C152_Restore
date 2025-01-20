@interface GLPTwoThings
@end

@implementation GLPTwoThings

uint64_t __deserialize_GLPTwoThings_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 16, "Deserialized");
  deserialize_GLPNameTableEntry(*(void *)(a1 + 32), v2);
  deserialize_GLPNameTableEntry(*(void *)(a1 + 32), v2 + 8);
  return v2;
}

@end