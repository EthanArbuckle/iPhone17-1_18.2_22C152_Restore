@interface UTDynamicGetFirstTag
@end

@implementation UTDynamicGetFirstTag

void ___UTDynamicGetFirstTag_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v8 = [[NSString alloc] initWithBytes:*(void *)a5 length:*(unsigned int *)(a5 + 8) encoding:4];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *a6 = 1;
}

@end