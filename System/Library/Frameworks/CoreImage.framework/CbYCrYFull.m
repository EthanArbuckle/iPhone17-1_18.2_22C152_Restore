@interface CbYCrYFull
@end

@implementation CbYCrYFull

void *__providerGetBytesAtPositionCallback_CbYCrYFull_surface_block_invoke(void *result, uint64_t a2)
{
  unint64_t v2 = result[6];
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = result[5];
    v5 = (unsigned __int8 *)(a2 + result[4] / 2 + 2);
    do
    {
      unsigned int v6 = *(v5 - 2);
      if (((v3 + *((_DWORD *)result + 8)) & 4) != 0)
      {
        unsigned int v7 = *(v5 - 2);
        if (v3) {
          unsigned int v6 = *(v5 - 4);
        }
        else {
          unsigned int v6 = 128;
        }
      }
      else if (v3 >= v2 - 4)
      {
        unsigned int v7 = 128;
      }
      else
      {
        unsigned int v7 = *v5;
      }
      v8 = (unsigned char *)(v4 + v3);
      unsigned int v9 = *(v5 - 1);
      float v10 = (float)v6 + -128.0;
      float v11 = (float)v7 + -128.0;
      unsigned char *v8 = llroundf(fmaxf(fminf((float)(v11 * 1.4075) + (float)v9, 255.0), 0.0));
      v8[1] = llroundf(fmaxf(fminf((float)((float)v9 + (float)(v10 * -0.34549)) + (float)(v11 * -0.71695), 255.0), 0.0));
      v8[2] = llroundf(fmaxf(fminf((float)(v10 * 1.779) + (float)v9, 255.0), 0.0));
      v8[3] = -1;
      v3 += 4;
      unint64_t v2 = result[6];
      v5 += 2;
    }
    while (v3 < v2);
  }
  return result;
}

@end