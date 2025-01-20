@interface HKCacheBackedChartSeriesDataSource
- (BOOL)hasAllBlocksAvailableBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4;
- (BOOL)hasAvailableBlocksBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4;
- (BOOL)hasPendingQueriesBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4;
- (HKCacheBackedChartSeriesDataSource)init;
- (HKChartCache)chartCache;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
- (void)_resetCachedPaths;
- (void)blocksRequestedFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4 priorityDelegate:(id)a5;
- (void)chartCacheDidUpdate:(id)a3;
- (void)invalidateCache;
- (void)setChartCache:(id)a3;
@end

@implementation HKCacheBackedChartSeriesDataSource

- (HKCacheBackedChartSeriesDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKCacheBackedChartSeriesDataSource;
  v2 = [(HKGraphSeriesDataSource *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HKCacheBackedChartSeriesDataSource *)v2 _resetCachedPaths];
  }
  return v3;
}

- (void)setChartCache:(id)a3
{
  v4 = (HKChartCache *)a3;
  [(HKChartCache *)self->_chartCache removeObserver:self];
  chartCache = self->_chartCache;
  self->_chartCache = v4;
  v6 = v4;

  [(HKChartCache *)self->_chartCache addObserver:self];
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  chartCache = self->_chartCache;
  v6 = (void *)MEMORY[0x1E4F29238];
  HKGraphSeriesDataBlockPath v14 = *a3;
  id v7 = a4;
  v8 = [v6 valueWithHKGraphSeriesDataBlockPath:&v14];
  v9 = -[HKChartCache cachedResultsForIdentifier:](chartCache, "cachedResultsForIdentifier:", v8, *(_OWORD *)&v14.index, v14.resolution);

  v10 = [(HKChartCache *)self->_chartCache dataSourceRespectingType];
  v11 = [v10 mappingFunctionForContext:v7];

  if (v11)
  {
    uint64_t v12 = ((void (**)(void, void *))v11)[2](v11, v9);

    v9 = (void *)v12;
  }

  return v9;
}

- (void)blocksRequestedFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4 priorityDelegate:(id)a5
{
  id v8 = a5;
  HKGraphSeriesDataBlockPath v18 = *a3;
  HKGraphSeriesDataBlockPath lastStartPath = self->_lastStartPath;
  BOOL v9 = HKGraphSeriesDataBlockPathEqualToPath(&v18, &lastStartPath);
  HKGraphSeriesDataBlockPath v18 = *a4;
  HKGraphSeriesDataBlockPath lastStartPath = self->_lastEndPath;
  BOOL v10 = HKGraphSeriesDataBlockPathEqualToPath(&v18, &lastStartPath);
  if (!v9 || !v10)
  {
    long long v11 = *(_OWORD *)&a3->index;
    self->_lastStartPath.resolution = a3->resolution;
    *(_OWORD *)&self->_lastStartPath.int64_t index = v11;
    long long v12 = *(_OWORD *)&a4->index;
    self->_lastEndPath.resolution = a4->resolution;
    *(_OWORD *)&self->_lastEndPath.int64_t index = v12;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int64_t index = a3->index;
    if (a3->index <= a4->index)
    {
      do
      {
        v18.int64_t index = index;
        *(_OWORD *)&v18.zoom = *(_OWORD *)&a3->zoom;
        v15 = [MEMORY[0x1E4F29238] valueWithHKGraphSeriesDataBlockPath:&v18];
        [v13 addObject:v15];
      }
      while (index++ < a4->index);
    }
    [(HKChartCache *)self->_chartCache fetchResultsForIdentifiers:v13 priorityDelegate:v8];
  }
}

- (BOOL)hasPendingQueriesBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  int64_t index = a3->index;
  if (a3->index > a4->index) {
    return 0;
  }
  do
  {
    int64_t v12 = index;
    long long v13 = *(_OWORD *)&a3->zoom;
    BOOL v9 = [MEMORY[0x1E4F29238] valueWithHKGraphSeriesDataBlockPath:&v12];
    unint64_t v10 = [(HKChartCache *)self->_chartCache stateForIdentifier:v9];

    BOOL result = v10 == 1;
    if (v10 == 1) {
      break;
    }
  }
  while (index++ < a4->index);
  return result;
}

- (BOOL)hasAvailableBlocksBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  int64_t index = a3->index;
  if (a3->index > a4->index) {
    return 0;
  }
  do
  {
    int64_t v12 = index;
    long long v13 = *(_OWORD *)&a3->zoom;
    BOOL v9 = [MEMORY[0x1E4F29238] valueWithHKGraphSeriesDataBlockPath:&v12];
    unint64_t v10 = [(HKChartCache *)self->_chartCache stateForIdentifier:v9];

    BOOL result = v10 == 2;
    if (v10 == 2) {
      break;
    }
  }
  while (index++ < a4->index);
  return result;
}

- (BOOL)hasAllBlocksAvailableBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  id v7 = [(HKChartCache *)self->_chartCache dataSource];

  if (!v7) {
    return 1;
  }
  int64_t index = a3->index;
  if (a3->index > a4->index) {
    return 1;
  }
  do
  {
    int64_t v13 = index;
    long long v14 = *(_OWORD *)&a3->zoom;
    unint64_t v10 = [MEMORY[0x1E4F29238] valueWithHKGraphSeriesDataBlockPath:&v13];
    unint64_t v11 = [(HKChartCache *)self->_chartCache stateForIdentifier:v10];

    BOOL result = v11 == 2;
    if (v11 != 2) {
      break;
    }
  }
  while (index++ < a4->index);
  return result;
}

- (void)invalidateCache
{
}

- (void)chartCacheDidUpdate:(id)a3
{
  [(HKCacheBackedChartSeriesDataSource *)self _resetCachedPaths];
  id v4 = [(HKGraphSeriesDataSource *)self delegate];
  [v4 dataSourceDidUpdateCache:self];
}

- (void)_resetCachedPaths
{
  *(_OWORD *)&self->_lastStartPath.int64_t index = HKGraphSeriesDataBlockPathNone;
  self->_lastStartPath.resolution = 0;
  *(_OWORD *)&self->_lastEndPath.int64_t index = HKGraphSeriesDataBlockPathNone;
  self->_lastEndPath.resolution = 0;
}

- (HKChartCache)chartCache
{
  return self->_chartCache;
}

- (void).cxx_destruct
{
}

@end