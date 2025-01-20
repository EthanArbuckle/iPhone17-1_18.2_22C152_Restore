@interface HKFixedValueDateSpanDataSource
- (BOOL)_insideRange:(id)a3 trendSpan:(id)a4;
- (HKChartSummaryTrendModel)trendModel;
- (HKFixedValueDateSpanDataSource)initWithTrendModel:(id)a3 preferredUnitBlock:(id)a4 fixedValueScalingBlock:(id)a5;
- (_HKFixedValueDateSpanDelegate)sourceDelegate;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4;
- (id)fixedValueScalingBlock;
- (id)preferredUnitBlock;
- (void)_setPreferredUnitForBlock:(id)a3 unit:(id)a4;
- (void)setSourceDelegate:(id)a3;
- (void)trendModelChanged;
@end

@implementation HKFixedValueDateSpanDataSource

- (HKFixedValueDateSpanDataSource)initWithTrendModel:(id)a3 preferredUnitBlock:(id)a4 fixedValueScalingBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_alloc_init(_HKFixedValueDateSpanDelegate);
  v20.receiver = self;
  v20.super_class = (Class)HKFixedValueDateSpanDataSource;
  v13 = [(HKDateRangeDataSource *)&v20 initWithSourceDelegate:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_trendModel, a3);
    v15 = _Block_copy(v10);
    id preferredUnitBlock = v14->_preferredUnitBlock;
    v14->_id preferredUnitBlock = v15;

    v17 = _Block_copy(v11);
    id fixedValueScalingBlock = v14->_fixedValueScalingBlock;
    v14->_id fixedValueScalingBlock = v17;

    objc_storeStrong((id *)&v14->_sourceDelegate, v12);
    [(_HKFixedValueDateSpanDelegate *)v12 setFixedValueDateSpanDataSource:v14];
    [v9 addObserver:v14];
  }

  return v14;
}

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v7 = [(HKFixedValueDateSpanDataSource *)self trendModel];
  v8 = [v7 timeScopeTrends];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    uint64_t v31 = *(void *)v45;
    int64_t v32 = a4;
    do
    {
      uint64_t v12 = 0;
      uint64_t v33 = v10;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v44 + 1) + 8 * v12);
        if ([v13 timeScope] == a4)
        {
          uint64_t v35 = v12;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v38 = [v13 trendSpans];
          uint64_t v14 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            char v39 = 0;
            uint64_t v16 = *(void *)v41;
            v37 = v13;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v41 != v16) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * i);
                v19 = [v13 trendSpans];
                uint64_t v20 = [v19 count];

                if ([(HKFixedValueDateSpanDataSource *)self _insideRange:v6 trendSpan:v18])
                {
                  uint64_t v21 = 1;
                  if ((v39 + (_BYTE)i)) {
                    uint64_t v21 = 2;
                  }
                  if (v20 == 1) {
                    uint64_t v22 = 0;
                  }
                  else {
                    uint64_t v22 = v21;
                  }
                  v23 = [HKFixedValueDateSpanChartPoint alloc];
                  [v13 localizableTrendDescription];
                  v25 = uint64_t v24 = v15;
                  [(HKFixedValueDateSpanDataSource *)self fixedValueScalingBlock];
                  v26 = self;
                  v28 = id v27 = v6;
                  v29 = [(HKFixedValueDateSpanChartPoint *)v23 initWithTrendSpan:v18 styleIdentifier:v22 localizableTrendDescription:v25 fixedValueScalingBlock:v28];

                  id v6 = v27;
                  self = v26;

                  uint64_t v15 = v24;
                  v13 = v37;
                  [v36 addObject:v29];
                }
              }
              uint64_t v15 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
              v39 += i;
            }
            while (v15);
          }

          uint64_t v11 = v31;
          a4 = v32;
          uint64_t v10 = v33;
          uint64_t v12 = v35;
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v10);
  }

  return v36;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HKFixedValueDateSpanDataSource;
  HKGraphSeriesDataBlockPath v10 = *a3;
  v5 = [(HKDateRangeDataSource *)&v11 cachedBlockForPath:&v10 context:a4];
  id v6 = [(HKFixedValueDateSpanDataSource *)self preferredUnitBlock];

  if (v6)
  {
    v7 = [(HKFixedValueDateSpanDataSource *)self preferredUnitBlock];
    v8 = v7[2]();

    if (v8) {
      [(HKFixedValueDateSpanDataSource *)self _setPreferredUnitForBlock:v5 unit:v8];
    }
  }
  return v5;
}

- (void)_setPreferredUnitForBlock:(id)a3 unit:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(a3, "chartPoints", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 setPreferredUnit:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)trendModelChanged
{
  id v3 = [(HKFixedValueDateSpanDataSource *)self sourceDelegate];
  v2 = [v3 updateCallbackDelegate];
  [v2 dateRangeDataUpdated];
}

- (BOOL)_insideRange:(id)a3 trendSpan:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 startDate];
  uint64_t v8 = [v6 endDate];

  uint64_t v9 = [v5 trendDateInterval];
  uint64_t v10 = [v9 startDate];

  objc_super v11 = [v5 trendDateInterval];

  long long v12 = [v11 endDate];

  if (objc_msgSend(v8, "hk_isBeforeDate:", v10)) {
    LOBYTE(v13) = 0;
  }
  else {
    int v13 = objc_msgSend(v7, "hk_isAfterDate:", v12) ^ 1;
  }

  return v13;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (id)preferredUnitBlock
{
  return self->_preferredUnitBlock;
}

- (id)fixedValueScalingBlock
{
  return self->_fixedValueScalingBlock;
}

- (_HKFixedValueDateSpanDelegate)sourceDelegate
{
  return self->_sourceDelegate;
}

- (void)setSourceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDelegate, 0);
  objc_storeStrong(&self->_fixedValueScalingBlock, 0);
  objc_storeStrong(&self->_preferredUnitBlock, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
}

@end