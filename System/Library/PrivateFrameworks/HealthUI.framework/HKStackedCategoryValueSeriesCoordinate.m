@interface HKStackedCategoryValueSeriesCoordinate
- (CGPoint)end;
- (CGPoint)start;
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKStackedCategoryValueSeriesCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 pointStyle:(int64_t)a5 userInfo:(id)a6;
- (NSString)description;
- (double)endXValue;
- (double)startXValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (int64_t)pointStyle;
@end

@implementation HKStackedCategoryValueSeriesCoordinate

- (HKStackedCategoryValueSeriesCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 pointStyle:(int64_t)a5 userInfo:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKStackedCategoryValueSeriesCoordinate;
  v14 = [(HKStackedCategoryValueSeriesCoordinate *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_start.CGFloat x = v11;
    v14->_start.CGFloat y = v10;
    v14->_end.CGFloat x = x;
    v14->_end.CGFloat y = y;
    v14->_pointStyle = a5;
    objc_storeStrong((id *)&v14->_userInfo, a6);
  }

  return v15;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  double x = self->_start.x;
  double y = self->_start.y;
  double c = a3->c;
  tdouble x = a3->tx;
  double v9 = tx + y * c + a3->a * x;
  double v10 = self->_end.x;
  double v11 = self->_end.y;
  double v12 = tx + v11 * c + a3->a * v10;
  if (a4)
  {
    tdouble y = a3->ty;
    double b = a3->b;
    double d = a3->d;
    double v16 = ty + v11 * d + b * v10;
    double v9 = HKUIFloorCGPointToScreenScale(v9, ty + y * d + b * x);
    double v12 = HKUIFloorCGPointToScreenScale(v12, v16);
  }
  id v17 = objc_alloc((Class)objc_opt_class());
  int64_t pointStyle = self->_pointStyle;
  userInfo = self->_userInfo;
  return (id)objc_msgSend(v17, "initWithStart:end:pointStyle:userInfo:", pointStyle, userInfo, v9, y, v12, v11);
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
  v9.super_class = (Class)HKStackedCategoryValueSeriesCoordinate;
  v4 = [(HKStackedCategoryValueSeriesCoordinate *)&v9 description];
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

- (int64_t)pointStyle
{
  return self->_pointStyle;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end