@interface CHHapticParameterCurve
- (CHHapticDynamicParameterID)parameterID;
- (CHHapticParameterCurve)init;
- (CHHapticParameterCurve)initWithParameterID:(CHHapticDynamicParameterID)parameterID controlPoints:(NSArray *)controlPoints relativeTime:(NSTimeInterval)relativeTime;
- (NSArray)controlPoints;
- (NSTimeInterval)relativeTime;
- (void)setRelativeTime:(NSTimeInterval)relativeTime;
@end

@implementation CHHapticParameterCurve

- (CHHapticParameterCurve)init
{
  return 0;
}

- (CHHapticParameterCurve)initWithParameterID:(CHHapticDynamicParameterID)parameterID controlPoints:(NSArray *)controlPoints relativeTime:(NSTimeInterval)relativeTime
{
  v9 = parameterID;
  v10 = controlPoints;
  v16.receiver = self;
  v16.super_class = (Class)CHHapticParameterCurve;
  v11 = [(CHHapticParameterCurve *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_param, parameterID);
    uint64_t v13 = [(NSArray *)v10 copy];
    v14 = v12->_controlPoints;
    v12->_controlPoints = (NSArray *)v13;

    v12->_time = relativeTime;
  }

  return v12;
}

- (NSArray)controlPoints
{
  return self->_controlPoints;
}

- (CHHapticDynamicParameterID)parameterID
{
  return (CHHapticDynamicParameterID)objc_getProperty(self, a2, 8, 1);
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
  objc_storeStrong((id *)&self->_controlPoints, 0);

  objc_storeStrong((id *)&self->_param, 0);
}

@end