@interface _HKLineSeriesBlockCoordinate
- (CGPoint)coordinate;
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (NSString)description;
- (_HKLineSeriesBlockCoordinate)initWithCoordinate:(CGPoint)a3 userInfo:(id)a4;
- (double)maxYValue;
- (double)minYValue;
- (double)startXValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation _HKLineSeriesBlockCoordinate

- (_HKLineSeriesBlockCoordinate)initWithCoordinate:(CGPoint)a3 userInfo:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKLineSeriesBlockCoordinate;
  v9 = [(_HKLineSeriesBlockCoordinate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_coordinate.CGFloat x = x;
    v9->_coordinate.CGFloat y = y;
    objc_storeStrong((id *)&v9->_userInfo, a4);
  }

  return v10;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  float64x2_t v5 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->_coordinate.y), *(float64x2_t *)&a3->a, self->_coordinate.x));
  double v6 = v5.f64[1];
  if (a4)
  {
    double v11 = HKUIFloorCGPointToScreenScale(v5.f64[0], v5.f64[1]);
    double v6 = v7;
  }
  else
  {
    double v11 = v5.f64[0];
  }
  id v8 = objc_alloc((Class)objc_opt_class());
  userInfo = self->_userInfo;
  return (id)objc_msgSend(v8, "initWithCoordinate:userInfo:", userInfo, v11, v6);
}

- (double)minYValue
{
  return self->_coordinate.y;
}

- (double)maxYValue
{
  return self->_coordinate.y;
}

- (double)startXValue
{
  return self->_coordinate.x;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_HKLineSeriesBlockCoordinate;
  v4 = [(_HKLineSeriesBlockCoordinate *)&v8 description];
  float64x2_t v5 = NSStringFromCGPoint(self->_coordinate);
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (CGPoint)coordinate
{
  double x = self->_coordinate.x;
  double y = self->_coordinate.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end