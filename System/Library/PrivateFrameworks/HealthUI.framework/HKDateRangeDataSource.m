@interface HKDateRangeDataSource
- (HKDateRangeDataSource)initWithSourceDelegate:(id)a3;
- (HKDateRangeDataSourceDelegate)sourceDelegate;
- (NSMutableDictionary)pathToDataBlock;
- (id)_fetchAndCacheDataForPath:(HKGraphSeriesDataBlockPath *)a3;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
- (void)blocksRequestedFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4 priorityDelegate:(id)a5;
- (void)dateRangeDataUpdated;
- (void)setPathToDataBlock:(id)a3;
@end

@implementation HKDateRangeDataSource

- (HKDateRangeDataSource)initWithSourceDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKDateRangeDataSource;
  v6 = [(HKGraphSeriesDataSource *)&v12 init];
  v7 = v6;
  if (v6)
  {
    p_sourceDelegate = (id *)&v6->_sourceDelegate;
    objc_storeStrong((id *)&v6->_sourceDelegate, a3);
    if (*p_sourceDelegate) {
      [*p_sourceDelegate setUpdateDelegate:v7];
    }
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pathToDataBlock = v7->_pathToDataBlock;
    v7->_pathToDataBlock = v9;
  }
  return v7;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  HKGraphSeriesDataBlockPath v9 = *a3;
  v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithHKGraphSeriesDataBlockPath:", &v9, a4);
  v7 = [(NSMutableDictionary *)self->_pathToDataBlock objectForKeyedSubscript:v6];
  if (!v7)
  {
    HKGraphSeriesDataBlockPath v9 = *a3;
    v7 = [(HKDateRangeDataSource *)self _fetchAndCacheDataForPath:&v9];
    [(NSMutableDictionary *)self->_pathToDataBlock setObject:v7 forKeyedSubscript:v6];
  }

  return v7;
}

- (void)blocksRequestedFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4 priorityDelegate:(id)a5
{
  int64_t index = a3->index;
  if (a3->index <= a4->index)
  {
    do
    {
      int64_t v11 = index;
      long long v12 = *(_OWORD *)&a3->zoom;
      id v9 = -[HKDateRangeDataSource cachedBlockForPath:context:](self, "cachedBlockForPath:context:", &v11, 0, a5);
    }
    while (index++ < a4->index);
  }
}

- (id)_fetchAndCacheDataForPath:(HKGraphSeriesDataBlockPath *)a3
{
  HKGraphSeriesDataBlockPath v12 = *a3;
  id v5 = HKGraphSeriesDataBlockPathMinimumX(&v12.index);
  HKGraphSeriesDataBlockPath v12 = *a3;
  v6 = HKGraphSeriesDataBlockPathMaximumX((uint64_t)&v12);
  int64_t zoom = a3->zoom;
  v8 = +[HKValueRange valueRangeWithMinValue:v5 maxValue:v6];
  id v9 = [(HKDateRangeDataSourceDelegate *)self->_sourceDelegate dataForDateRange:v8 timeScope:zoom];
  v10 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v10 setChartPoints:v9];

  return v10;
}

- (void)dateRangeDataUpdated
{
  [(NSMutableDictionary *)self->_pathToDataBlock removeAllObjects];
  id v3 = [(HKGraphSeriesDataSource *)self delegate];
  [v3 dataSourceDidUpdateCache:self];
}

- (HKDateRangeDataSourceDelegate)sourceDelegate
{
  return self->_sourceDelegate;
}

- (NSMutableDictionary)pathToDataBlock
{
  return self->_pathToDataBlock;
}

- (void)setPathToDataBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathToDataBlock, 0);
  objc_storeStrong((id *)&self->_sourceDelegate, 0);
}

@end