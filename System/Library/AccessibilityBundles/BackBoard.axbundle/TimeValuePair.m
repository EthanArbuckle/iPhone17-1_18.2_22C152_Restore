@interface TimeValuePair
- (double)fireTime;
- (id)value;
- (void)setFireTime:(double)a3;
- (void)setValue:(id)a3;
@end

@implementation TimeValuePair

- (double)fireTime
{
  return self->fireTime;
}

- (void)setFireTime:(double)a3
{
  self->fireTime = a3;
}

- (id)value
{
  return self->value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end