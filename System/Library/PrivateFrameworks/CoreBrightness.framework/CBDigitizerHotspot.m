@interface CBDigitizerHotspot
- (BOOL)isClearedAt:(float)a3;
- (CBDigitizerHotspot)init;
- (float)center_X;
- (float)center_Y;
- (float)touchReleaseTime;
- (float)touchTriggerDelay;
- (id)description;
- (int)orientation;
- (int64_t)triggered;
- (void)setCenter_X:(float)a3;
- (void)setCenter_Y:(float)a3;
- (void)setOrientation:(int)a3;
- (void)setTouchReleaseTime:(float)a3;
- (void)setTouchTriggerDelay:(float)a3;
- (void)setTriggered:(int64_t)a3;
@end

@implementation CBDigitizerHotspot

- (BOOL)isClearedAt:(float)a3
{
  BOOL v4 = 0;
  if (self->_triggered == 2) {
    return (float)(a3 - self->_touchReleaseTime) > self->_touchTriggerDelay;
  }
  return v4;
}

- (int)orientation
{
  return self->_orientation;
}

- (float)center_Y
{
  return self->_center_Y;
}

- (float)center_X
{
  return self->_center_X;
}

- (int64_t)triggered
{
  return self->_triggered;
}

- (CBDigitizerHotspot)init
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CBDigitizerHotspot;
  v5 = [(CBDigitizerHotspot *)&v3 init];
  if (v5)
  {
    v5->_touchReleaseTime = 0.0;
    v5->_touchTriggerDelay = 5.0;
  }
  return v5;
}

- (id)description
{
  v7 = self;
  SEL v6 = a2;
  id v5 = (id)NSString;
  SEL v4 = (&kTouchStateStr)[[(CBDigitizerHotspot *)self triggered]];
  [(CBDigitizerHotspot *)v7 touchReleaseTime];
  return (id)[v5 stringWithFormat:@"state=%s touchReleased=%.2f", v4, v2];
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (void)setCenter_X:(float)a3
{
  self->_center_X = a3;
}

- (void)setCenter_Y:(float)a3
{
  self->_center_Y = a3;
}

- (void)setTriggered:(int64_t)a3
{
  self->_triggered = a3;
}

- (float)touchTriggerDelay
{
  return self->_touchTriggerDelay;
}

- (void)setTouchTriggerDelay:(float)a3
{
  self->_touchTriggerDelay = a3;
}

- (float)touchReleaseTime
{
  return self->_touchReleaseTime;
}

- (void)setTouchReleaseTime:(float)a3
{
  self->_touchReleaseTime = a3;
}

@end