@interface UpdateSourcesMutability
@end

@implementation UpdateSourcesMutability

uint64_t ____UpdateSourcesMutability_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = C3DMeshSourceIsMutable(a2);
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(v4 + 200);
  if (result | ((v5 & 4) >> 2)) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)(v4 + 200) = v6 | v5 & 0xFB;
  return result;
}

@end