@interface _HKAnnotatedHorizontalLineBlockCoordinate
- (BOOL)isEqual:(id)a3;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (_HKAnnotatedHorizontalLineBlockCoordinate)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 styleIdentifier:(int64_t)a5 userInfo:(id)a6;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (int64_t)styleIdentifier;
- (unint64_t)hash;
@end

@implementation _HKAnnotatedHorizontalLineBlockCoordinate

- (_HKAnnotatedHorizontalLineBlockCoordinate)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 styleIdentifier:(int64_t)a5 userInfo:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_HKAnnotatedHorizontalLineBlockCoordinate;
  v14 = [(_HKAnnotatedHorizontalLineBlockCoordinate *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_startPoint.CGFloat x = v11;
    v14->_startPoint.CGFloat y = v10;
    v14->_endPoint.CGFloat x = x;
    v14->_endPoint.CGFloat y = y;
    v14->_styleIdentifier = a5;
    objc_storeStrong((id *)&v14->_userInfo, a6);
  }

  return v15;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  BOOL v4 = a4;
  [(_HKAnnotatedHorizontalLineBlockCoordinate *)self startPoint];
  float64x2_t v22 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v7), *(float64x2_t *)&a3->a, v8));
  [(_HKAnnotatedHorizontalLineBlockCoordinate *)self endPoint];
  float64x2_t v11 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v9), *(float64x2_t *)&a3->a, v10));
  double v12 = v11.f64[1];
  double v13 = v22.f64[1];
  double v21 = v11.f64[0];
  if (v4)
  {
    v22.f64[0] = HKUIFloorCGPointToScreenScale(v22.f64[0], v22.f64[1]);
    double v13 = v14;
    double v21 = HKUIFloorCGPointToScreenScale(v21, v12);
    double v12 = v15;
  }
  v16 = [_HKAnnotatedHorizontalLineBlockCoordinate alloc];
  int64_t v17 = [(_HKAnnotatedHorizontalLineBlockCoordinate *)self styleIdentifier];
  v18 = [(_HKAnnotatedHorizontalLineBlockCoordinate *)self userInfo];
  v19 = -[_HKAnnotatedHorizontalLineBlockCoordinate initWithStartPoint:endPoint:styleIdentifier:userInfo:](v16, "initWithStartPoint:endPoint:styleIdentifier:userInfo:", v17, v18, v22.f64[0], v13, v21, v12);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(_HKAnnotatedHorizontalLineBlockCoordinate *)self startPoint];
    unint64_t v7 = llround(v6 / 0.0000000115);
    [v5 startPoint];
    if (v7 == llround(v8 / 0.0000000115)
      && ([(_HKAnnotatedHorizontalLineBlockCoordinate *)self endPoint],
          unint64_t v10 = llround(v9 / 0.0000000115),
          [v5 endPoint],
          v10 == llround(v11 / 0.0000000115))
      && ([(_HKAnnotatedHorizontalLineBlockCoordinate *)self startPoint],
          unint64_t v13 = llround(v12 / 0.0000000115),
          [v5 startPoint],
          v13 == llround(v14 / 0.0000000115)))
    {
      [(_HKAnnotatedHorizontalLineBlockCoordinate *)self endPoint];
      unint64_t v16 = llround(v15 / 0.0000000115);
      [v5 endPoint];
      BOOL v18 = v16 == llround(v17 / 0.0000000115);
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  [(_HKAnnotatedHorizontalLineBlockCoordinate *)self startPoint];
  unint64_t v4 = llround(v3 / 0.0000000115);
  [(_HKAnnotatedHorizontalLineBlockCoordinate *)self endPoint];
  unint64_t v6 = llround(v5 / 0.0000000115) ^ v4;
  [(_HKAnnotatedHorizontalLineBlockCoordinate *)self startPoint];
  unint64_t v8 = llround(v7 / 0.0000000115);
  [(_HKAnnotatedHorizontalLineBlockCoordinate *)self endPoint];
  return v6 ^ v8 ^ llround(v9 / 0.0000000115);
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)styleIdentifier
{
  return self->_styleIdentifier;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end