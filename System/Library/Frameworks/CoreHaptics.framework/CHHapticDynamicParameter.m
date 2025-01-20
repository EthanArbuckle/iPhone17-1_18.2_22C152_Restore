@interface CHHapticDynamicParameter
- (CHHapticDynamicParameter)init;
- (CHHapticDynamicParameter)initWithParameterID:(CHHapticDynamicParameterID)parameterID value:(float)value relativeTime:(NSTimeInterval)time;
- (CHHapticDynamicParameterID)parameterID;
- (NSTimeInterval)relativeTime;
- (float)value;
- (void)setRelativeTime:(NSTimeInterval)relativeTime;
- (void)setValue:(float)value;
@end

@implementation CHHapticDynamicParameter

- (CHHapticDynamicParameter)init
{
  return 0;
}

- (CHHapticDynamicParameter)initWithParameterID:(CHHapticDynamicParameterID)parameterID value:(float)value relativeTime:(NSTimeInterval)time
{
  v9 = parameterID;
  v13.receiver = self;
  v13.super_class = (Class)CHHapticDynamicParameter;
  v10 = [(CHHapticDynamicParameter *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_param, parameterID);
    v11->_value = value;
    v11->_time = time;
  }

  return v11;
}

- (CHHapticDynamicParameterID)parameterID
{
  return (CHHapticDynamicParameterID)objc_getProperty(self, a2, 8, 1);
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)value
{
  self->_value = value;
}

- (NSTimeInterval)relativeTime
{
  return self->_time;
}

- (void)setRelativeTime:(NSTimeInterval)relativeTime
{
  self->_time = relativeTime;
}

- (void).cxx_destruct
{
}

@end