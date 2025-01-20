@interface HKMinMaxCoordinate
- (BOOL)isVisibleInChartRect:(CGRect)a3;
- (CGPoint)max;
- (CGPoint)min;
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKMinMaxCoordinate)initWithChartPoint:(id)a3 xAxisTransform:(id)a4 yAxisTransform:(id)a5;
- (HKMinMaxCoordinate)initWithMin:(CGPoint)a3 max:(CGPoint)a4 userInfo:(id)a5;
- (NSString)description;
- (double)distanceToPoint:(CGPoint)a3;
- (double)startXValue;
- (double)yAxisDifferenceToPoint:(CGPoint)a3;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation HKMinMaxCoordinate

- (HKMinMaxCoordinate)initWithMin:(CGPoint)a3 max:(CGPoint)a4 userInfo:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v8 = a3.y;
  CGFloat v9 = a3.x;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKMinMaxCoordinate;
  v12 = [(HKMinMaxCoordinate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_min.CGFloat x = v9;
    v12->_min.CGFloat y = v8;
    v12->_max.CGFloat x = x;
    v12->_max.CGFloat y = y;
    objc_storeStrong((id *)&v12->_userInfo, a5);
  }

  return v13;
}

- (HKMinMaxCoordinate)initWithChartPoint:(id)a3 xAxisTransform:(id)a4 yAxisTransform:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 xValueAsGenericType];
  [v9 coordinateForValue:v11];
  double v13 = v12;

  v14 = [v10 minYValue];
  [v8 coordinateForValue:v14];
  double v16 = v15;

  v17 = [v10 maxYValue];
  [v8 coordinateForValue:v17];
  double v19 = v18;

  v20 = [v10 userInfo];

  v21 = -[HKMinMaxCoordinate initWithMin:max:userInfo:](self, "initWithMin:max:userInfo:", v20, v13, v16, v13, v19);
  return v21;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  double x = self->_min.x;
  double y = self->_min.y;
  double b = a3->b;
  double c = a3->c;
  double d = a3->d;
  tdouble x = a3->tx;
  tdouble y = a3->ty;
  double v12 = tx + y * c + a3->a * x;
  double v13 = ty + y * d + b * x;
  double v14 = self->_max.x;
  double v15 = self->_max.y;
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
  return (id)objc_msgSend(v20, "initWithMin:max:userInfo:", userInfo, v12, v13, v16, v17);
}

- (double)startXValue
{
  return self->_min.x;
}

- (double)distanceToPoint:(CGPoint)a3
{
  [(HKMinMaxCoordinate *)self min];
  UIDistanceBetweenPoints();
  double v5 = v4;
  [(HKMinMaxCoordinate *)self max];
  UIDistanceBetweenPoints();
  if (v5 < result) {
    return v5;
  }
  return result;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3
{
  double y = a3.y;
  [(HKMinMaxCoordinate *)self min];
  double v6 = v5;
  double v7 = v5 - y;
  [(HKMinMaxCoordinate *)self max];
  double result = v8 - y;
  if (vabdd_f64(v8, y) >= vabdd_f64(v6, y)) {
    return v7;
  }
  return result;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HKMinMaxCoordinate;
  double v4 = [(HKMinMaxCoordinate *)&v9 description];
  double v5 = NSStringFromCGPoint(self->_min);
  double v6 = NSStringFromCGPoint(self->_max);
  double v7 = objc_msgSend(v3, "stringWithFormat:", @"%@ { min(%@), max(%@} }"), v4, v5, v6;

  return (NSString *)v7;
}

- (BOOL)isVisibleInChartRect:(CGRect)a3
{
  v4.origin.double x = self->_min.x;
  v4.origin.double y = self->_min.y;
  v4.size.height = self->_max.y - v4.origin.y;
  v4.size.width = 1.0;
  return CGRectIntersectsRect(v4, a3);
}

- (CGPoint)min
{
  double x = self->_min.x;
  double y = self->_min.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)max
{
  double x = self->_max.x;
  double y = self->_max.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end