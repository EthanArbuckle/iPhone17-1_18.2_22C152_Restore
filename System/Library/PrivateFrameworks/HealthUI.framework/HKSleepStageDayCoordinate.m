@interface HKSleepStageDayCoordinate
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKSleepStageDayCoordinate)initWithXValueStart:(double)a3 xValueEnd:(double)a4 sleepStage:(int64_t)a5 userInfo:(id)a6;
- (double)endXValue;
- (double)startXValue;
- (double)xValueEnd;
- (double)xValueStart;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (int64_t)sleepStage;
@end

@implementation HKSleepStageDayCoordinate

- (HKSleepStageDayCoordinate)initWithXValueStart:(double)a3 xValueEnd:(double)a4 sleepStage:(int64_t)a5 userInfo:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HKSleepStageDayCoordinate;
  v12 = [(HKSleepStageDayCoordinate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_xValueStart = a3;
    v12->_xValueEnd = a4;
    v12->_sleepStage = a5;
    objc_storeStrong((id *)&v12->_userInfo, a6);
  }

  return v13;
}

- (double)startXValue
{
  return self->_xValueStart;
}

- (double)endXValue
{
  return self->_xValueEnd;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  double xValueStart = self->_xValueStart;
  double xValueEnd = self->_xValueEnd;
  double tx = a3->tx;
  CGFloat v8 = a3->c * 0.0;
  double v9 = tx + v8 + a3->a * xValueStart;
  double v10 = tx + v8 + a3->a * xValueEnd;
  if (a4)
  {
    double ty = a3->ty;
    double b = a3->b;
    CGFloat v13 = a3->d * 0.0;
    double v14 = ty + v13 + b * xValueEnd;
    double v9 = HKUIFloorCGPointToScreenScale(v9, ty + v13 + b * xValueStart);
    double v10 = HKUIFloorCGPointToScreenScale(v10, v14);
  }
  objc_super v15 = [HKSleepStageDayCoordinate alloc];
  int64_t sleepStage = self->_sleepStage;
  userInfo = self->_userInfo;
  return [(HKSleepStageDayCoordinate *)v15 initWithXValueStart:sleepStage xValueEnd:userInfo sleepStage:v9 userInfo:v10];
}

- (double)xValueStart
{
  return self->_xValueStart;
}

- (double)xValueEnd
{
  return self->_xValueEnd;
}

- (int64_t)sleepStage
{
  return self->_sleepStage;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end