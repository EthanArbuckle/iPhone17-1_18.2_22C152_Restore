@interface GLPLayoutObject
@end

@implementation GLPLayoutObject

void *__deserialize_GLPLayoutObject_block_invoke(uint64_t a1)
{
  v2 = (void *)(*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240)
                                                                          + 8))(**(void **)(*(void *)(a1 + 32) + 240), 16, "Deserialized");
  v3 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 0x40000000;
  v8 = __deserialize_GLPLayoutPair_block_invoke;
  v9 = &__block_descriptor_tmp_4_0;
  v10 = v3;
  deserialize_pointer(v3, (uint64_t)&v6, v2);
  v4 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 0x40000000;
  v8 = __deserialize_GLPLayoutPair_block_invoke;
  v9 = &__block_descriptor_tmp_4_0;
  v10 = v4;
  deserialize_pointer(v4, (uint64_t)&v6, v2 + 1);
  return v2;
}

@end