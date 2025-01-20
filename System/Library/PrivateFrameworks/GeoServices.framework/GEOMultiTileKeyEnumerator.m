@interface GEOMultiTileKeyEnumerator
@end

@implementation GEOMultiTileKeyEnumerator

uint64_t __67___GEOMultiTileKeyEnumerator_continueEnumeratingTileKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a3) {
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

@end