@interface _GCHapticDynamicParameter
- (_GCHapticDynamicParameter)initWithType:(unsigned int)a3 value:(double)a4;
- (double)value;
- (unsigned)type;
- (void)setValue:(double)a3;
@end

@implementation _GCHapticDynamicParameter

- (_GCHapticDynamicParameter)initWithType:(unsigned int)a3 value:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_GCHapticDynamicParameter;
  result = [(_GCHapticDynamicParameter *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_value = a4;
  }
  return result;
}

- (unsigned)type
{
  return self->_type;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

@end