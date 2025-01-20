@interface HKGraphSeriesDataSource
- (BOOL)hasAllBlocksAvailableBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4;
- (BOOL)hasAvailableBlocksBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4;
- (BOOL)hasPendingQueriesBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4;
- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5;
- (HKGraphSeriesDataSource)init;
- (HKGraphSeriesDataSourceDelegate)delegate;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
- (int64_t)maximumZoom;
- (int64_t)minimumZoom;
- (void)setDelegate:(id)a3;
- (void)setMaximumZoom:(int64_t)a3;
- (void)setMinimumZoom:(int64_t)a3;
@end

@implementation HKGraphSeriesDataSource

- (HKGraphSeriesDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKGraphSeriesDataSource;
  result = [(HKGraphSeriesDataSource *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_minimumZoom = xmmword_1E0F05E20;
  }
  return result;
}

- (BOOL)hasPendingQueriesBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  return 0;
}

- (BOOL)hasAvailableBlocksBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  return 1;
}

- (BOOL)hasAllBlocksAvailableBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  return 1;
}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  id v14 = a4;
  int64_t v10 = [(HKGraphSeriesDataSource *)self minimumZoom];
  if (v10 > a5) {
    a5 = v10;
  }
  int64_t v11 = [(HKGraphSeriesDataSource *)self maximumZoom];
  if (a5 >= v11) {
    int64_t v12 = v11;
  }
  else {
    int64_t v12 = a5;
  }
  HKGraphSeriesDataBlockPathContainingDate(v14, v12, a6, retstr);

  return result;
}

- (HKGraphSeriesDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKGraphSeriesDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)minimumZoom
{
  return self->_minimumZoom;
}

- (void)setMinimumZoom:(int64_t)a3
{
  self->_minimumZoom = a3;
}

- (int64_t)maximumZoom
{
  return self->_maximumZoom;
}

- (void)setMaximumZoom:(int64_t)a3
{
  self->_maximumZoom = a3;
}

- (void).cxx_destruct
{
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  return 0;
}

@end