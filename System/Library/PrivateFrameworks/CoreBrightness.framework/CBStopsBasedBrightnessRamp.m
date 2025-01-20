@interface CBStopsBasedBrightnessRamp
- (CBStopsBasedBrightnessRamp)initWithStartingBrightness:(float)a3 targetBrightness:(float)a4 rampSpeed:(float)a5 andCurrentTime:(float)a6;
- (float)currentBrightness;
- (float)target;
- (float)timeOfLastUpdate;
- (int)updateRampWithProgress:(float)a3;
- (int)updateRampWithTimestamp:(float)a3;
@end

@implementation CBStopsBasedBrightnessRamp

- (CBStopsBasedBrightnessRamp)initWithStartingBrightness:(float)a3 targetBrightness:(float)a4 rampSpeed:(float)a5 andCurrentTime:(float)a6
{
  v15 = self;
  SEL v14 = a2;
  float v13 = a3;
  float v12 = a4;
  float v11 = a5;
  float v10 = a6;
  v9.receiver = self;
  v9.super_class = (Class)CBStopsBasedBrightnessRamp;
  v15 = [(CBStopsBasedBrightnessRamp *)&v9 init];
  if (!v15) {
    return 0;
  }
  if (v13 == 0.0 || v11 == 0.0 || v13 == v12)
  {

    v15 = 0;
    return 0;
  }
  else
  {
    v15->_start = v13;
    v15->_target = v12;
    v15->_current = v13;
    v15->_rampSpeed = v11;
    float v6 = log2f(v15->_target / v15->_start);
    float v7 = fabs(v6) * v15->_rampSpeed;
    v15->_rampTime = v7;
    v15->_startTime = v10;
    v15->_timeOfLastUpdate = v10;
    return v15;
  }
}

- (float)currentBrightness
{
  return self->_current;
}

- (float)timeOfLastUpdate
{
  return self->_timeOfLastUpdate;
}

- (int)updateRampWithTimestamp:(float)a3
{
  return [(CBStopsBasedBrightnessRamp *)self updateRampWithProgress:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT((float)(a3 - self->_startTime) / self->_rampTime))];
}

- (int)updateRampWithProgress:(float)a3
{
  if (a3 >= 1.0)
  {
    self->_current = self->_target;
    return 1;
  }
  else
  {
    float v6 = a3 * self->_rampTime;
    self->_timeOfLastUpdate = self->_startTime + v6;
    float v5 = 2.0;
    if (self->_start > self->_target) {
      float v5 = 1.0 / 2.0;
    }
    float start = self->_start;
    self->_current = start * powf(v5, v6 / self->_rampSpeed);
    return 0;
  }
}

- (float)target
{
  return self->_target;
}

@end