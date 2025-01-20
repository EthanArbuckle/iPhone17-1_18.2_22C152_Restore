@interface C3DShapeBoundariesSort
@end

@implementation C3DShapeBoundariesSort

__n128 __C3DShapeBoundariesSort_block_invoke_2(uint64_t a1, long long *a2, long long *a3)
{
  uint64_t v3 = *((void *)a3 + 6);
  long long v5 = a3[1];
  __n128 result = (__n128)a3[2];
  long long v6 = *a3;
  long long v8 = a2[1];
  long long v7 = a2[2];
  long long v9 = *a2;
  *((void *)a3 + 6) = *((void *)a2 + 6);
  a3[1] = v8;
  a3[2] = v7;
  *a3 = v9;
  *a2 = v6;
  a2[1] = v5;
  a2[2] = (__int128)result;
  *((void *)a2 + 6) = v3;
  return result;
}

@end