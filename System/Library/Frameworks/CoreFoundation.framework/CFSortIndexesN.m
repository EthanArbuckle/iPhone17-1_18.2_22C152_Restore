@interface CFSortIndexesN
@end

@implementation CFSortIndexesN

uint64_t ____CFSortIndexesN_block_invoke(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = 7;
  if (a1[5] - 1 > a2) {
    uint64_t v2 = 6;
  }
  return __CFSimpleMergeSort(a1[8] + 8 * a1[6] * a2, a1[v2], *(void *)(a1[9] + 8 * a2), a1[4]);
}

uint64_t *____CFSortIndexesN_block_invoke_2(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[6];
  }
  uint64_t v4 = 6;
  if (a2 - (a2 | 0xFFFFFFFFFFFFFFFELL) == a1[7]) {
    uint64_t v4 = 8;
  }
  uint64_t v5 = a1[5] + 8 * v2 * a2;
  return __CFSortIndexesNMerge((uint64_t *)(v5 - 8 * ((a2 << 63 >> 63) & v2)), v2, (uint64_t *)(v5 + 8 * v3), a1[v4], *(void **)(a1[9] + 8 * a2), a2 & 1, a1[4]);
}

uint64_t *____CFSortIndexesN_block_invoke_3(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(uint64_t **)(v2 + ((8 * a2) | 8));
  uint64_t v4 = 1;
  if ((a2 & 1) == 0) {
    uint64_t v4 = 2;
  }
  uint64_t v5 = v4 + a2;
  v6 = *(uint64_t **)(v2 + 8 * v5);
  uint64_t v7 = 8;
  if (v5 + 1 == a1[6]) {
    uint64_t v7 = 7;
  }
  return __CFSortIndexesNMerge(v3, a1[8], v6, a1[v7], (void *)(a1[9] + 8 * a1[8] * a2 + 8 * a1[8]), a2 & 1, a1[4]);
}

@end