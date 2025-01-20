@interface CHHapticParameterAttributesImpl
- (CHHapticParameterAttributesImpl)init;
- (CHHapticParameterAttributesImpl)initWithMinValue:(float)a3 maxValue:(float)a4 defaultValue:(float)a5;
- (float)defaultValue;
- (float)maxValue;
- (float)minValue;
@end

@implementation CHHapticParameterAttributesImpl

- (CHHapticParameterAttributesImpl)initWithMinValue:(float)a3 maxValue:(float)a4 defaultValue:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CHHapticParameterAttributesImpl;
  result = [(CHHapticParameterAttributesImpl *)&v9 init];
  if (result)
  {
    result->_minValue = a3;
    result->_maxValue = a4;
    result->_defaultValue = a5;
  }
  return result;
}

- (float)minValue
{
  return self->_minValue;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (CHHapticParameterAttributesImpl)init
{
  return 0;
}

- (float)defaultValue
{
  return self->_defaultValue;
}

@end