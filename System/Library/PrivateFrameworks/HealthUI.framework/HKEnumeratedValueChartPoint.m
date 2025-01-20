@interface HKEnumeratedValueChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (NSArray)indices;
- (NSDate)xValue;
- (id)allYValues;
- (id)yValue;
- (void)setIndices:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setXValue:(id)a3;
@end

@implementation HKEnumeratedValueChartPoint

- (id)yValue
{
  return [(NSArray *)self->_indices lastObject];
}

- (id)allYValues
{
  return self->_indices;
}

- (NSArray)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
  objc_storeStrong((id *)&self->_indices, 0);
}

@end