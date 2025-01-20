@interface GLPSubroutineUniformObject
@end

@implementation GLPSubroutineUniformObject

uint64_t __deserialize_GLPSubroutineUniformObject_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, const char *))(*(void *)(*(void *)(a1 + 32) + 240) + 8))(**(void **)(*(void *)(a1 + 32) + 240), 48, "Deserialized");
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(void *)uint64_t v2 = deserialize_GLPString(*(void *)(a1 + 32));
  *(void *)(v2 + 8) = v3;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = __deserialize_GLPType_block_invoke;
  v6[3] = &__block_descriptor_tmp_12;
  v6[4] = v4;
  deserialize_pointer(v4, (uint64_t)v6, (void *)(v2 + 16));
  return v2;
}

@end