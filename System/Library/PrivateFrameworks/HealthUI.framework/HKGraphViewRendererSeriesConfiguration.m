@interface HKGraphViewRendererSeriesConfiguration
- (HKGraphViewRendererSeriesConfiguration)initWithRendererSeriesRows:(id)a3;
- (NSArray)seriesRows;
@end

@implementation HKGraphViewRendererSeriesConfiguration

- (HKGraphViewRendererSeriesConfiguration)initWithRendererSeriesRows:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKGraphViewRendererSeriesConfiguration;
  v6 = [(HKGraphViewRendererSeriesConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_seriesRows, a3);
  }

  return v7;
}

- (NSArray)seriesRows
{
  return self->_seriesRows;
}

- (void).cxx_destruct
{
}

@end