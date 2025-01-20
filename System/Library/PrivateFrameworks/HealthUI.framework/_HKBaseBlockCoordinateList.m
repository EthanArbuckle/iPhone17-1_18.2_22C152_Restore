@interface _HKBaseBlockCoordinateList
- (HKGraphSeriesDataBlockPath)blockPathEnd;
- (HKGraphSeriesDataBlockPath)blockPathStart;
- (_HKBaseBlockCoordinateList)initWithCoordinates:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4;
- (id)_coordinatesInChartableRange:(id)a3;
- (id)coordinates;
- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (int64_t)_numCoordinatesInChartableRange:(id)a3;
- (int64_t)numCoordinates;
- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6;
@end

@implementation _HKBaseBlockCoordinateList

- (_HKBaseBlockCoordinateList)initWithCoordinates:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKBaseBlockCoordinateList;
  v8 = [(_HKBaseBlockCoordinateList *)&v12 init];
  v9 = v8;
  if (v8)
  {
    int64_t resolution = a4->resolution;
    *(_OWORD *)&v8->_blockPath.index = *(_OWORD *)&a4->index;
    v8->_blockPath.int64_t resolution = resolution;
    objc_storeStrong((id *)&v8->_coordinates, a3);
  }

  return v9;
}

- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6
{
  id v11 = a6;
  id v12 = a4;
  v13 = [v12 minValue];
  v14 = [v12 maxValue];

  [v13 doubleValue];
  uint64_t v16 = v15;
  [v14 doubleValue];
  uint64_t v18 = v17;
  if (!v11)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HKGraphSeriesBlockCoordinate.m", 163, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];
  }
  coordinates = self->_coordinates;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __108___HKBaseBlockCoordinateList__enumerateCoordinatesWithTransform_chartableValueRange_roundToViewScale_block___block_invoke;
  v25[3] = &unk_1E6D54A98;
  id v26 = v13;
  id v27 = v14;
  uint64_t v30 = v18;
  uint64_t v31 = v16;
  long long v20 = *(_OWORD *)&a3->c;
  long long v32 = *(_OWORD *)&a3->a;
  long long v33 = v20;
  long long v34 = *(_OWORD *)&a3->tx;
  BOOL v35 = a5;
  v28 = self;
  id v29 = v11;
  id v21 = v11;
  id v22 = v14;
  id v23 = v13;
  [(NSArray *)coordinates enumerateObjectsUsingBlock:v25];
}

- (HKGraphSeriesDataBlockPath)blockPathStart
{
  *retstr = *(HKGraphSeriesDataBlockPath *)&self->resolution;
  return self;
}

- (HKGraphSeriesDataBlockPath)blockPathEnd
{
  *retstr = *(HKGraphSeriesDataBlockPath *)&self->resolution;
  return self;
}

- (id)coordinates
{
  return [(_HKBaseBlockCoordinateList *)self _coordinatesInChartableRange:0];
}

- (id)_coordinatesInChartableRange:(id)a3
{
  v5 = self->_coordinates;
  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v7 = a3;
    id v8 = objc_alloc_init(v6);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59___HKBaseBlockCoordinateList__coordinatesInChartableRange___block_invoke;
    v14[3] = &unk_1E6D54AC0;
    id v9 = v8;
    id v15 = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v13[0] = *MEMORY[0x1E4F1DAB8];
    v13[1] = v10;
    v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(_HKBaseBlockCoordinateList *)self _enumerateCoordinatesWithTransform:v13 chartableValueRange:v7 roundToViewScale:0 block:v14];

    id v11 = (NSArray *)v9;
    v5 = v11;
  }
  return v5;
}

- (int64_t)numCoordinates
{
  return [(NSArray *)self->_coordinates count];
}

- (int64_t)_numCoordinatesInChartableRange:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62___HKBaseBlockCoordinateList__numCoordinatesInChartableRange___block_invoke;
    v9[3] = &unk_1E6D54AE8;
    v9[4] = &v10;
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v8[0] = *MEMORY[0x1E4F1DAB8];
    v8[1] = v5;
    v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(_HKBaseBlockCoordinateList *)self _enumerateCoordinatesWithTransform:v8 chartableValueRange:v4 roundToViewScale:0 block:v9];
    int64_t v6 = v11[3];
  }
  else
  {
    int64_t v6 = [(NSArray *)self->_coordinates count];
    v11[3] = v6;
  }
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(NSArray *)self->_coordinates firstObject];
  long long v7 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a3->tx;
  id v8 = (void *)[v6 copyWithTransform:v10 roundToViewScale:v4];

  return v8;
}

- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(NSArray *)self->_coordinates lastObject];
  long long v7 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a3->tx;
  id v8 = (void *)[v6 copyWithTransform:v10 roundToViewScale:v4];

  return v8;
}

- (void).cxx_destruct
{
}

@end