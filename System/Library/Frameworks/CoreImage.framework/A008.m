@interface A008
@end

@implementation A008

void *__providerGetBytesAtPositionCallback_A008_surface_block_invoke(void *result, uint64_t a2)
{
  if (result[6])
  {
    unint64_t v2 = 0;
    uint64_t v3 = result[5];
    v4 = (char *)(a2 + result[4] / 4);
    do
    {
      uint64_t v5 = v3 + v2;
      *(_WORD *)uint64_t v5 = 0;
      *(unsigned char *)(v5 + 2) = 0;
      char v6 = *v4++;
      *(unsigned char *)(v5 + 3) = v6;
      v2 += 4;
    }
    while (v2 < result[6]);
  }
  return result;
}

@end