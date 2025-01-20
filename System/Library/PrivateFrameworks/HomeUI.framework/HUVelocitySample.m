@interface HUVelocitySample
+ (id)sampleWithStart:(CGPoint)a3 end:(CGPoint)a4 startTime:(double)a5 endTime:(double)a6;
- (BOOL)isSampleDistinctFromPoint:(CGPoint)a3;
- (CGPoint)end;
- (CGPoint)start;
- (CGVector)translation;
- (CGVector)velocity;
- (double)dt;
- (double)endTime;
- (double)startTime;
- (void)setEnd:(CGPoint)a3;
- (void)setEndTime:(double)a3;
- (void)setStart:(CGPoint)a3;
- (void)setStartTime:(double)a3;
@end

@implementation HUVelocitySample

+ (id)sampleWithStart:(CGPoint)a3 end:(CGPoint)a4 startTime:(double)a5 endTime:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  v12 = objc_opt_new();
  objc_msgSend(v12, "setStart:", v11, v10);
  objc_msgSend(v12, "setEnd:", x, y);
  [v12 setStartTime:a5];
  [v12 setEndTime:a6];

  return v12;
}

- (CGVector)translation
{
  double v2 = self->_end.x - self->_start.x;
  double v3 = self->_end.y - self->_start.y;
  result.ddouble y = v3;
  result.ddouble x = v2;
  return result;
}

- (double)dt
{
  return self->_endTime - self->_startTime;
}

- (CGVector)velocity
{
  [(HUVelocitySample *)self dt];
  double v3 = 0.0;
  double v4 = 0.0;
  if (v5 >= 0.00000011920929)
  {
    [(HUVelocitySample *)self translation];
    double v7 = v6;
    [(HUVelocitySample *)self dt];
    double v3 = v7 / v8;
    [(HUVelocitySample *)self translation];
    double v10 = v9;
    [(HUVelocitySample *)self dt];
    double v4 = v10 / v11;
  }
  double v12 = v3;
  result.ddouble y = v4;
  result.ddouble x = v12;
  return result;
}

- (BOOL)isSampleDistinctFromPoint:(CGPoint)a3
{
  BOOL v3 = vabdd_f64(a3.x, self->_end.x) >= 5.0;
  return vabdd_f64(a3.y, self->_end.y) >= 5.0 || v3;
}

- (CGPoint)start
{
  double x = self->_start.x;
  double y = self->_start.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStart:(CGPoint)a3
{
  self->_start = a3;
}

- (CGPoint)end
{
  double x = self->_end.x;
  double y = self->_end.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEnd:(CGPoint)a3
{
  self->_end = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

@end