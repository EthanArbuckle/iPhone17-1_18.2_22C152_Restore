@interface YCbYCr
@end

@implementation YCbYCr

void __providerGetBytesAtPositionCallback_YCbYCr_surface_block_invoke(void *a1, uint64_t a2, float a3)
{
  unint64_t v3 = a1[6];
  if (v3)
  {
    unint64_t v5 = 0;
    uint64_t v6 = a1[5];
    v7 = (char *)(a2 + a1[4] / 2);
    do
    {
      char v8 = v7[1];
      if (((v5 + *((_DWORD *)a1 + 8)) & 4) != 0)
      {
        char v9 = v7[1];
        if (v5) {
          char v8 = *(v7 - 1);
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
        char v9 = v7[3];
      }
      char v10 = *v7;
      v7 += 2;
      v11[0] = v10;
      v11[1] = v8;
      v11[2] = v9;
      a3 = Convert_one_YCC_to_RGB(118, 601, (unsigned char *)(v6 + v5), v11, a3);
      *(unsigned char *)(v6 + v5 + 3) = -1;
      v5 += 4;
      unint64_t v3 = a1[6];
    }
    while (v5 < v3);
  }
}

@end