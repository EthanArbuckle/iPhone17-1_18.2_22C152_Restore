@interface AYCbCr8
@end

@implementation AYCbCr8

void __providerGetBytesAtPositionCallback_AYCbCr8_surface_block_invoke(void *a1, uint64_t a2, float a3)
{
  if (a1[6])
  {
    unint64_t v4 = 0;
    uint64_t v5 = a1[5];
    uint64_t v6 = a2 + a1[4];
    do
    {
      a3 = Convert_one_YCC_to_RGB(118, 601, (unsigned char *)(v5 + v4), (unsigned char *)(v6 + v4 + 1), a3);
      *(unsigned char *)(v5 + v4 + 3) = *(unsigned char *)(v6 + v4);
      v4 += 4;
    }
    while (v4 < a1[6]);
  }
}

@end