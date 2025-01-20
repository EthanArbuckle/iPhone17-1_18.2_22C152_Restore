@interface HDValueHistogramCollectionCalculator
- (HDValueHistogramCollectionCalculator)initWithQuantityType:(id)a3 quantityRanges:(id)a4 intervalCollection:(id)a5;
- (HKQuantityType)quantityType;
- (NSArray)quantityRanges;
- (_HKDateIntervalCollection)intervalCollection;
- (id)_currentHistogram;
- (id)result;
- (void)addSampleValue:(double)a3 startTime:(double)a4;
@end

@implementation HDValueHistogramCollectionCalculator

- (HDValueHistogramCollectionCalculator)initWithQuantityType:(id)a3 quantityRanges:(id)a4 intervalCollection:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)HDValueHistogramCollectionCalculator;
  v13 = [(HDValueHistogramCollectionCalculator *)&v30 init];
  if (v13)
  {
    if (([MEMORY[0x1E4F2B380] areRangesDisjoint:v11] & 1) == 0)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:v13 file:@"HDValueHistogramCollectionCalculator.m" lineNumber:130 description:@"Quantity ranges must be disjoint"];
    }
    objc_storeStrong((id *)&v13->_quantityType, a3);
    objc_storeStrong((id *)&v13->_quantityRanges, a4);
    uint64_t v14 = [v10 canonicalUnit];
    canonicalUnit = v13->_canonicalUnit;
    v13->_canonicalUnit = (HKUnit *)v14;

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __95__HDValueHistogramCollectionCalculator_initWithQuantityType_quantityRanges_intervalCollection___block_invoke;
    v28[3] = &unk_1E63006A0;
    v16 = v13;
    v29 = v16;
    uint64_t v17 = objc_msgSend(v11, "hk_map:", v28);
    valueRangesInCanonicalUnit = v16->_valueRangesInCanonicalUnit;
    v16->_valueRangesInCanonicalUnit = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_intervalCollection, a5);
    currentInterval = v16->_currentInterval;
    v16->_currentInterval = 0;

    currentIntervalIndex = v16->_currentIntervalIndex;
    v16->_currentIntervalIndex = 0;

    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v13->_quantityRanges, "count"));
    currentIntervalCountsByValueRange = v16->_currentIntervalCountsByValueRange;
    v16->_currentIntervalCountsByValueRange = (NSMutableArray *)v21;

    if ([(NSArray *)v13->_quantityRanges count])
    {
      unint64_t v23 = 0;
      do
      {
        [(NSMutableArray *)v16->_currentIntervalCountsByValueRange addObject:&unk_1F17ECC78];
        ++v23;
      }
      while (v23 < [(NSArray *)v13->_quantityRanges count]);
    }
    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    finalizedHistogramsByDateIntervalIndex = v16->_finalizedHistogramsByDateIntervalIndex;
    v16->_finalizedHistogramsByDateIntervalIndex = (NSMutableDictionary *)v24;
  }
  return v13;
}

uint64_t __95__HDValueHistogramCollectionCalculator_initWithQuantityType_quantityRanges_intervalCollection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 valueRangeWithUnit:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)addSampleValue:(double)a3 startTime:(double)a4
{
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
  uint64_t v25 = 0;
  v8 = [(_HKDateIntervalCollection *)self->_intervalCollection dateIntervalContainingDate:v7 index:&v25];
  if ([(NSArray *)self->_valueRangesInCanonicalUnit count])
  {
    uint64_t v9 = 0;
    while (1)
    {
      id v10 = [(NSArray *)self->_valueRangesInCanonicalUnit objectAtIndexedSubscript:v9];
      if ([v10 contains:a3]) {
        break;
      }

      if (++v9 >= [(NSArray *)self->_valueRangesInCanonicalUnit count]) {
        goto LABEL_5;
      }
    }
    if (v10)
    {
      currentInterval = self->_currentInterval;
      if (!currentInterval)
      {
        objc_storeStrong((id *)&self->_currentInterval, v8);
        id v12 = [NSNumber numberWithInteger:v25];
        currentIntervalIndex = self->_currentIntervalIndex;
        self->_currentIntervalIndex = v12;

        currentInterval = self->_currentInterval;
      }
      if (([v8 isEqual:currentInterval] & 1) == 0)
      {
        uint64_t v14 = [v8 startDate];
        v15 = [(NSDateInterval *)self->_currentInterval startDate];
        uint64_t v16 = [v14 compare:v15];

        if (v16 != 1)
        {
          uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2 object:self file:@"HDValueHistogramCollectionCalculator.m" lineNumber:174 description:@"Samples must be added in ascending order by start date"];
        }
        uint64_t v17 = -[HDValueHistogramCollectionCalculator _currentHistogram]((id *)&self->super.isa);
        [(NSMutableDictionary *)self->_finalizedHistogramsByDateIntervalIndex setObject:v17 forKeyedSubscript:self->_currentIntervalIndex];

        objc_storeStrong((id *)&self->_currentInterval, v8);
        v18 = [NSNumber numberWithInteger:v25];
        v19 = self->_currentIntervalIndex;
        self->_currentIntervalIndex = v18;

        if ([(NSMutableArray *)self->_currentIntervalCountsByValueRange count])
        {
          unint64_t v20 = 0;
          do
            [(NSMutableArray *)self->_currentIntervalCountsByValueRange setObject:&unk_1F17ECC78 atIndexedSubscript:v20++];
          while (v20 < [(NSMutableArray *)self->_currentIntervalCountsByValueRange count]);
        }
      }
      uint64_t v21 = NSNumber;
      v22 = [(NSMutableArray *)self->_currentIntervalCountsByValueRange objectAtIndexedSubscript:v9];
      unint64_t v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "integerValue") + 1);
      [(NSMutableArray *)self->_currentIntervalCountsByValueRange setObject:v23 atIndexedSubscript:v9];
    }
  }
  else
  {
LABEL_5:
    id v10 = 0;
  }
}

- (id)_currentHistogram
{
  v1 = a1;
  if (a1)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[2], "count"));
    if ([v1[2] count])
    {
      unint64_t v3 = 0;
      do
      {
        v4 = [v1[2] objectAtIndexedSubscript:v3];
        v5 = [v1[6] objectAtIndexedSubscript:v3];
        uint64_t v6 = [v5 integerValue];

        v7 = (void *)[objc_alloc(MEMORY[0x1E4F2B6D8]) initWithQuantityRange:v4 count:v6];
        [v2 addObject:v7];

        ++v3;
      }
      while (v3 < [v1[2] count]);
    }
    v1 = (id *)[objc_alloc(MEMORY[0x1E4F2B6C0]) initWithSegments:v2 dateInterval:v1[7]];
  }

  return v1;
}

- (id)result
{
  unint64_t v3 = -[HDValueHistogramCollectionCalculator _currentHistogram]((id *)&self->super.isa);
  v4 = (void *)[(NSMutableDictionary *)self->_finalizedHistogramsByDateIntervalIndex mutableCopy];
  if ([v3 totalSampleCount] >= 1) {
    [v4 setObject:v3 forKeyedSubscript:self->_currentIntervalIndex];
  }
  id v5 = objc_alloc(MEMORY[0x1E4F2B6C8]);
  quantityRanges = self->_quantityRanges;
  v7 = [(_HKDateIntervalCollection *)self->_intervalCollection anchorDate];
  v8 = [(_HKDateIntervalCollection *)self->_intervalCollection intervalComponents];
  uint64_t v9 = (void *)[v5 initWithQuantityRanges:quantityRanges valueHistogramsByDateIntervalIndex:v4 anchorDate:v7 intervalComponents:v8];

  return v9;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (NSArray)quantityRanges
{
  return self->_quantityRanges;
}

- (_HKDateIntervalCollection)intervalCollection
{
  return self->_intervalCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizedHistogramsByDateIntervalIndex, 0);
  objc_storeStrong((id *)&self->_currentIntervalIndex, 0);
  objc_storeStrong((id *)&self->_currentInterval, 0);
  objc_storeStrong((id *)&self->_currentIntervalCountsByValueRange, 0);
  objc_storeStrong((id *)&self->_valueRangesInCanonicalUnit, 0);
  objc_storeStrong((id *)&self->_canonicalUnit, 0);
  objc_storeStrong((id *)&self->_intervalCollection, 0);
  objc_storeStrong((id *)&self->_quantityRanges, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end