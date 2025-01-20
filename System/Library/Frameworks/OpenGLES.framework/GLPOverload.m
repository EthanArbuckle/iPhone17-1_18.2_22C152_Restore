@interface GLPOverload
@end

@implementation GLPOverload

void *__deserialize_GLPOverload_block_invoke(uint64_t a1)
{
  v2 = (void *)(*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240)
                                                                          + 8))(**(void **)(*(void *)(a1 + 32) + 240), 16, "Deserialized");
  void *v2 = 0;
  v2[1] = 0;
  v3 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 0x40000000;
  v8 = __deserialize_GLPType_block_invoke;
  v9 = &__block_descriptor_tmp_12;
  v10 = v3;
  deserialize_pointer(v3, (uint64_t)&v6, v2);
  v4 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 0x40000000;
  v8 = (void (*)(uint64_t))__deserialize_GLPOverload_block_invoke;
  v9 = &__block_descriptor_tmp_10;
  v10 = v4;
  deserialize_pointer(v4, (uint64_t)&v6, v2 + 1);
  return v2;
}

@end