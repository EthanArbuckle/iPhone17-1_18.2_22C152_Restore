@interface QLPXVelocityNumberFilter
+ (id)gestureVelocityFilter;
- (QLPXVelocityNumberFilter)initWithInput:(double)a3;
- (double)updatedOutput;
@end

@implementation QLPXVelocityNumberFilter

+ (id)gestureVelocityFilter
{
  v2 = objc_alloc_init((Class)a1);
  v2[14] = 0x3F80624DE0000000;
  v2[15] = 0x3FE8000000000000;

  return v2;
}

- (QLPXVelocityNumberFilter)initWithInput:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLPXVelocityNumberFilter;
  result = [(QLPXNumberFilter *)&v4 initWithInput:a3];
  if (result) {
    result->_minimumSampleInterval = 0.00000011920929;
  }
  return result;
}

- (double)updatedOutput
{
  [(QLPXNumberFilter *)self input];
  double v4 = v3;
  [(QLPXNumberFilter *)self currentTime];
  double lastTime = self->_lastTime;
  if (v5 < lastTime + self->_minimumSampleInterval) {
    return self->_filteredVelocity;
  }
  double velocity = self->_velocity;
  double v9 = (v4 - self->_lastValue) / (v5 - lastTime);
  double v7 = velocity * self->_previousVelocityWeight + (1.0 - self->_previousVelocityWeight) * v9;
  self->_lastValue = v4;
  self->_double lastTime = v5;
  self->_double velocity = v9;
  self->_previousVelocity = velocity;
  self->_filteredVelocity = v7;
  return v7;
}

@end