@interface _HKRelativeLineSeriesBlockCoordinate
- (CGPoint)end;
- (CGPoint)midpoint;
- (CGPoint)start;
- (_HKRelativeLineSeriesBlockCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 userInfo:(id)a5;
- (double)endXValue;
- (double)startXValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (id)description;
@end

@implementation _HKRelativeLineSeriesBlockCoordinate

- (_HKRelativeLineSeriesBlockCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 userInfo:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v7 = a3.y;
  CGFloat v8 = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)_HKRelativeLineSeriesBlockCoordinate;
  result = -[_HKLineSeriesBlockCoordinate initWithCoordinate:userInfo:](&v10, sel_initWithCoordinate_userInfo_, a5);
  if (result)
  {
    result->_start.CGFloat x = v8;
    result->_start.CGFloat y = v7;
    result->_end.CGFloat x = x;
    result->_end.CGFloat y = y;
  }
  return result;
}

- (CGPoint)midpoint
{
  MEMORY[0x1F4166DD8](self->_start.x, self->_start.y, self->_end.x, self->_end.y);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
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
  v21 = [(_HKLineSeriesBlockCoordinate *)self userInfo];
  v22 = objc_msgSend(v20, "initWithStart:end:userInfo:", v21, v12, v13, v16, v17);

  return v22;
}

- (double)startXValue
{
  return self->_start.x;
}

- (double)endXValue
{
  return self->_end.x;
}

- (id)description
{
  double v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_HKRelativeLineSeriesBlockCoordinate;
  v4 = [(_HKLineSeriesBlockCoordinate *)&v9 description];
  v5 = NSStringFromCGPoint(self->_start);
  v6 = NSStringFromCGPoint(self->_end);
  CGFloat v7 = [v3 stringWithFormat:@"%@ %@ %@", v4, v5, v6];

  return v7;
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

@end