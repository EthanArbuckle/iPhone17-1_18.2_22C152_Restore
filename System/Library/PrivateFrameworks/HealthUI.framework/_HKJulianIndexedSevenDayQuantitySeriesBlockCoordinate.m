@interface _HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate
- (CGPoint)end;
- (CGPoint)start;
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (NSString)description;
- (_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 userInfo:(id)a5;
- (double)endXValue;
- (double)startXValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation _HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate

- (_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 userInfo:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v8 = a3.y;
  CGFloat v9 = a3.x;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate;
  v12 = [(_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_start.CGFloat x = v9;
    v12->_start.CGFloat y = v8;
    v12->_end.CGFloat x = x;
    v12->_end.CGFloat y = y;
    objc_storeStrong((id *)&v12->_userInfo, a5);
  }

  return v13;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  double x = self->_start.x;
  double y = self->_start.y;
  double b = a3->b;
  double c = a3->c;
  double d = a3->d;
  tdouble x = a3->tx;
  tdouble y = a3->ty;
  double v12 = tx + y * c + a3->a * x;
  double v13 = ty + y * d + b * x;
  double v14 = self->_end.x;
  double v15 = self->_end.y;
  double v16 = tx + c * v15 + a3->a * v14;
  double v17 = ty + d * v15 + b * v14;
  if (a4)
  {
    double v12 = HKUIFloorCGPointToScreenScale(v12, v13);
    double v13 = v18;
    double v16 = HKUIFloorCGPointToScreenScale(v16, v17);
    double v17 = v19;
  }
  id v20 = objc_alloc((Class)objc_opt_class());
  userInfo = self->_userInfo;
  return (id)objc_msgSend(v20, "initWithStart:end:userInfo:", userInfo, v12, v13, v16, v17);
}

- (double)startXValue
{
  return self->_start.x;
}

- (double)endXValue
{
  return self->_end.x;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate;
  v4 = [(_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate *)&v9 description];
  v5 = NSStringFromCGPoint(self->_start);
  v6 = NSStringFromCGPoint(self->_end);
  v7 = [v3 stringWithFormat:@"%@ %@ %@", v4, v5, v6];

  return (NSString *)v7;
}

- (CGPoint)start
{
  double x = self->_start.x;
  double y = self->_start.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)end
{
  double x = self->_end.x;
  double y = self->_end.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end