@interface MOEffectiveInteger
- (MOEffectiveInteger)initWithValue:(int64_t)a3 defaultValue:(int64_t)a4;
- (int64_t)defaultValue;
- (int64_t)value;
@end

@implementation MOEffectiveInteger

- (MOEffectiveInteger)initWithValue:(int64_t)a3 defaultValue:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MOEffectiveInteger;
  result = [(MOEffectiveInteger *)&v7 init];
  if (result)
  {
    result->_value = a3;
    result->_defaultValue = a4;
  }
  return result;
}

- (int64_t)value
{
  return self->_value;
}

- (int64_t)defaultValue
{
  return self->_defaultValue;
}

@end