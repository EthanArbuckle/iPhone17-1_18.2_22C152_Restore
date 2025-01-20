@interface MOEffectiveBool
- (BOOL)defaultValue;
- (BOOL)value;
- (MOEffectiveBool)initWithValue:(BOOL)a3 defaultValue:(BOOL)a4;
@end

@implementation MOEffectiveBool

- (MOEffectiveBool)initWithValue:(BOOL)a3 defaultValue:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MOEffectiveBool;
  result = [(MOEffectiveBool *)&v7 init];
  if (result)
  {
    result->_value = a3;
    result->_defaultValue = a4;
  }
  return result;
}

- (BOOL)value
{
  return self->_value;
}

- (BOOL)defaultValue
{
  return self->_defaultValue;
}

@end