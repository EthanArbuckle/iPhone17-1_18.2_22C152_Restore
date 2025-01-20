@interface HKCompoundBlockCoordinateList
@end

@implementation HKCompoundBlockCoordinateList

uint64_t __112___HKCompoundBlockCoordinateList__enumerateCoordinatesWithTransform_chartableValueRange_roundToViewScale_block___block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t))(v7 + 16);
  long long v9 = a3[1];
  v11[0] = *a3;
  v11[1] = v9;
  uint64_t result = v8(v7, a2, v11, a4);
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

void __80___HKCompoundBlockCoordinateList_firstCoordinateWithTransform_roundToViewScale___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 56);
  v11[0] = *(_OWORD *)(a1 + 40);
  v11[1] = v7;
  _OWORD v11[2] = *(_OWORD *)(a1 + 72);
  uint64_t v8 = [a2 firstCoordinateWithTransform:v11 roundToViewScale:v6];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __79___HKCompoundBlockCoordinateList_lastCoordinateWithTransform_roundToViewScale___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 56);
  v11[0] = *(_OWORD *)(a1 + 40);
  v11[1] = v7;
  _OWORD v11[2] = *(_OWORD *)(a1 + 72);
  uint64_t v8 = [a2 lastCoordinateWithTransform:v11 roundToViewScale:v6];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

@end