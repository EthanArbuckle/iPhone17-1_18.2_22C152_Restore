@interface _HKCompoundBlockCoordinateList
- (HKGraphSeriesDataBlockPath)blockPathEnd;
- (HKGraphSeriesDataBlockPath)blockPathStart;
- (_HKCompoundBlockCoordinateList)initWithSubCoordinates:(id)a3 chartableValueRange:(id)a4;
- (id)_coordinatesInChartableRange:(id)a3;
- (id)coordinates;
- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (int64_t)_numCoordinatesInChartableRange:(id)a3;
- (int64_t)numCoordinates;
- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6;
- (void)enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4 block:(id)a5;
@end

@implementation _HKCompoundBlockCoordinateList

- (_HKCompoundBlockCoordinateList)initWithSubCoordinates:(id)a3 chartableValueRange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKCompoundBlockCoordinateList;
  v9 = [(_HKCompoundBlockCoordinateList *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subCoordinates, a3);
    objc_storeStrong((id *)&v10->_chartableValueRange, a4);
  }

  return v10;
}

- (void)enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4 block:(id)a5
{
  BOOL v6 = a4;
  chartableValueRange = self->_chartableValueRange;
  long long v8 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a3->tx;
  [(_HKCompoundBlockCoordinateList *)self _enumerateCoordinatesWithTransform:v9 chartableValueRange:chartableValueRange roundToViewScale:v6 block:a5];
}

- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_subCoordinates;
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __112___HKCompoundBlockCoordinateList__enumerateCoordinatesWithTransform_chartableValueRange_roundToViewScale_block___block_invoke;
      v19[3] = &unk_1E6D54A48;
      id v20 = v11;
      v21 = &v22;
      long long v16 = *(_OWORD *)&a3->c;
      v18[0] = *(_OWORD *)&a3->a;
      v18[1] = v16;
      v18[2] = *(_OWORD *)&a3->tx;
      [v15 _enumerateCoordinatesWithTransform:v18 chartableValueRange:v10 roundToViewScale:v7 block:v19];
      LOBYTE(v15) = *((unsigned char *)v23 + 24) == 0;

      _Block_object_dispose(&v22, 8);
      if ((v15 & 1) == 0) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_coordinatesInChartableRange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = self->_subCoordinates;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_coordinatesInChartableRange:", v4, (void)v13);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)coordinates
{
  return [(_HKCompoundBlockCoordinateList *)self _coordinatesInChartableRange:self->_chartableValueRange];
}

- (int64_t)numCoordinates
{
  return [(_HKCompoundBlockCoordinateList *)self _numCoordinatesInChartableRange:self->_chartableValueRange];
}

- (int64_t)_numCoordinatesInChartableRange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_subCoordinates;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_numCoordinatesInChartableRange:", v4, (void)v12);
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (HKGraphSeriesDataBlockPath)blockPathStart
{
  id v4 = [(NSArray *)self->_subCoordinates firstObject];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 blockPathStart];
    id v4 = v6;
  }
  else
  {
    retstr->index = 0;
    retstr->zoom = 0;
    retstr->resolution = 0;
  }

  return result;
}

- (HKGraphSeriesDataBlockPath)blockPathEnd
{
  id v4 = [(NSArray *)self->_subCoordinates lastObject];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 blockPathEnd];
    id v4 = v6;
  }
  else
  {
    retstr->index = 0;
    retstr->zoom = 0;
    retstr->resolution = 0;
  }

  return result;
}

- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__15;
  uint64_t v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  subCoordinates = self->_subCoordinates;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  long long v11 = *(_OWORD *)&a3->tx;
  long long v5 = *(_OWORD *)&a3->a;
  long long v10 = *(_OWORD *)&a3->c;
  v8[2] = __80___HKCompoundBlockCoordinateList_firstCoordinateWithTransform_roundToViewScale___block_invoke;
  v8[3] = &unk_1E6D54A70;
  v8[4] = &v13;
  long long v9 = v5;
  BOOL v12 = a4;
  [(NSArray *)subCoordinates enumerateObjectsUsingBlock:v8];
  id v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__15;
  uint64_t v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  subCoordinates = self->_subCoordinates;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  long long v11 = *(_OWORD *)&a3->tx;
  long long v5 = *(_OWORD *)&a3->a;
  long long v10 = *(_OWORD *)&a3->c;
  v8[2] = __79___HKCompoundBlockCoordinateList_lastCoordinateWithTransform_roundToViewScale___block_invoke;
  v8[3] = &unk_1E6D54A70;
  v8[4] = &v13;
  long long v9 = v5;
  BOOL v12 = a4;
  [(NSArray *)subCoordinates enumerateObjectsWithOptions:2 usingBlock:v8];
  id v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartableValueRange, 0);
  objc_storeStrong((id *)&self->_subCoordinates, 0);
}

@end