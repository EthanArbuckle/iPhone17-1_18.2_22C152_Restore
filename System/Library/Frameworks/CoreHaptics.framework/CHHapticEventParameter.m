@interface CHHapticEventParameter
- (CHHapticEventParameter)init;
- (CHHapticEventParameter)initWithParameterID:(CHHapticEventParameterID)parameterID value:(float)value;
- (CHHapticEventParameterID)parameterID;
- (float)value;
- (void)setValue:(float)value;
@end

@implementation CHHapticEventParameter

- (void).cxx_destruct
{
}

- (float)value
{
  return self->_value;
}

- (CHHapticEventParameterID)parameterID
{
  return (CHHapticEventParameterID)objc_getProperty(self, a2, 16, 1);
}

- (CHHapticEventParameter)initWithParameterID:(CHHapticEventParameterID)parameterID value:(float)value
{
  v7 = parameterID;
  v11.receiver = self;
  v11.super_class = (Class)CHHapticEventParameter;
  v8 = [(CHHapticEventParameter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_param, parameterID);
    v9->_value = value;
  }

  return v9;
}

- (CHHapticEventParameter)init
{
  return 0;
}

- (void)setValue:(float)value
{
  self->_value = value;
}

@end