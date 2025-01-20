@interface AKRatchetStateData
- (AKRatchetStateData)initWithDuration:(double)a3;
- (double)duration;
- (void)setDuration:(double)a3;
@end

@implementation AKRatchetStateData

- (AKRatchetStateData)initWithDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKRatchetStateData;
  result = [(AKRatchetStateData *)&v5 init];
  if (result) {
    result->_duration = a3;
  }
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end