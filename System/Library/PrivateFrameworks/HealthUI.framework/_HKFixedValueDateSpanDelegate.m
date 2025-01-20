@interface _HKFixedValueDateSpanDelegate
- (HKDateRangeDataUpdateDelegate)updateCallbackDelegate;
- (HKFixedValueDateSpanDataSource)fixedValueDateSpanDataSource;
- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4;
- (void)setFixedValueDateSpanDataSource:(id)a3;
- (void)setUpdateCallbackDelegate:(id)a3;
@end

@implementation _HKFixedValueDateSpanDelegate

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = [(_HKFixedValueDateSpanDelegate *)self fixedValueDateSpanDataSource];
  v8 = [v7 dataForDateRange:v6 timeScope:a4];

  return v8;
}

- (HKFixedValueDateSpanDataSource)fixedValueDateSpanDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fixedValueDateSpanDataSource);
  return (HKFixedValueDateSpanDataSource *)WeakRetained;
}

- (void)setFixedValueDateSpanDataSource:(id)a3
{
}

- (HKDateRangeDataUpdateDelegate)updateCallbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCallbackDelegate);
  return (HKDateRangeDataUpdateDelegate *)WeakRetained;
}

- (void)setUpdateCallbackDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCallbackDelegate);
  objc_destroyWeak((id *)&self->_fixedValueDateSpanDataSource);
}

@end