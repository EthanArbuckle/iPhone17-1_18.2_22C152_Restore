@interface GetNeighboringUnits
@end

@implementation GetNeighboringUnits

void *___GetNeighboringUnits_block_invoke(void *result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = result[7];
  uint64_t v4 = *(void *)(*(void *)(result[5] + 8) + 24);
  if (v3 == a2)
  {
    *(void *)(*(void *)(result[4] + 8) + 24) = v4;
  }
  else if (v4 == v3)
  {
    *(void *)(*(void *)(result[6] + 8) + 24) = a2;
    *a3 = 1;
  }
  *(void *)(*(void *)(result[5] + 8) + 24) = a2;
  return result;
}

@end