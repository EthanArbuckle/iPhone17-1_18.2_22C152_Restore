@interface HKGraphSeriesConfiguration
- (HKDisplayType)displayType;
- (HKGraphSeries)graphSeries;
- (UIColor)tintColor;
- (void)setDisplayType:(id)a3;
- (void)setGraphSeries:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation HKGraphSeriesConfiguration

- (HKGraphSeries)graphSeries
{
  return self->_graphSeries;
}

- (void)setGraphSeries:(id)a3
{
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_graphSeries, 0);
}

@end