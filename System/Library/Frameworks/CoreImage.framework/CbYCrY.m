@interface CbYCrY
@end

@implementation CbYCrY

void __providerGetBytesAtPositionCallback_CbYCrY_surface_block_invoke(void *a1, uint64_t a2, float a3)
{
  unint64_t v3 = a1[6];
  if (v3)
  {
    unint64_t v5 = 0;
    uint64_t v6 = a1[5];
    v7 = (char *)(a2 + a1[4] / 2 + 2);
    do
    {
      char v8 = *(v7 - 2);
      if (((v5 + *((_DWORD *)a1 + 8)) & 4) != 0)
      {
        char v9 = *(v7 - 2);
        if (v5) {
          char v8 = *(v7 - 4);
        }
        else {
          char v8 = 0x80;
        }
      }
      else if (v5 >= v3 - 4)
      {
        char v9 = 0x80;
      }
      else
      {
        char v9 = *v7;
      }
      v10[0] = *(v7 - 1);
      v10[1] = v8;
      v10[2] = v9;
      a3 = Convert_one_YCC_to_RGB(118, 601, (unsigned char *)(v6 + v5), v10, a3);
      *(unsigned char *)(v6 + v5 + 3) = -1;
      v5 += 4;
      unint64_t v3 = a1[6];
      v7 += 2;
    }
    while (v5 < v3);
  }
}

@end