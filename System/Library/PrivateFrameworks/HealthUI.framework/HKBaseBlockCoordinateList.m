@interface HKBaseBlockCoordinateList
@end

@implementation HKBaseBlockCoordinateList

void __108___HKBaseBlockCoordinateList__enumerateCoordinatesWithTransform_chartableValueRange_roundToViewScale_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (*(void *)(a1 + 32))
  {
    [v5 startXValue];
    BOOL v8 = v7 > *(double *)(a1 + 64);
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    [v6 endXValue];
    LODWORD(v9) = v10 < *(double *)(a1 + 72);
  }
  if (((v8 | v9) & 1) == 0)
  {
    id v11 = v6;
    long long v12 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)&v21.a = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&v21.c = v12;
    *(_OWORD *)&v21.tx = *(_OWORD *)(a1 + 112);
    v13 = v11;
    if (!CGAffineTransformIsIdentity(&v21))
    {
      uint64_t v14 = *(unsigned __int8 *)(a1 + 128);
      long long v15 = *(_OWORD *)(a1 + 96);
      *(_OWORD *)&v21.a = *(_OWORD *)(a1 + 80);
      *(_OWORD *)&v21.c = v15;
      *(_OWORD *)&v21.tx = *(_OWORD *)(a1 + 112);
      v13 = (void *)[v11 copyWithTransform:&v21 roundToViewScale:v14];
    }
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 32);
    long long v18 = *(_OWORD *)(*(void *)(a1 + 48) + 16);
    uint64_t v19 = v17;
    uint64_t v20 = a3;
    (*(void (**)(uint64_t, void *, long long *, id))(v16 + 16))(v16, v13, &v18, v11);
  }
}

uint64_t __59___HKBaseBlockCoordinateList__coordinatesInChartableRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __62___HKBaseBlockCoordinateList__numCoordinatesInChartableRange___block_invoke(uint64_t result)
{
  return result;
}

@end