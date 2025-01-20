@interface AVHapticEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4;
+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 duration:(double)a5;
+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6;
+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6 duration:(double)a7;
+ (id)eventWithParameter:(unint64_t)a3 value:(float)a4 time:(double)a5;
+ (id)eventWithParameterCurve:(id)a3;
- (AVHapticEvent)initWithCoder:(id)a3;
- (AVHapticEvent)initWithEventType:(unint64_t)a3 time:(double)a4 duration:(double)a5;
- (AVHapticEvent)initWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6 duration:(double)a7;
- (AVHapticEvent)initWithParameter:(unint64_t)a3 value:(float)a4 time:(double)a5;
- (AVHapticEvent)initWithParameterCurve:(id)a3;
- (AVHapticPlayerFixedParameter)fixedParams;
- (AVHapticPlayerParameterCurve)parameterCurve;
- (double)duration;
- (double)time;
- (float)value;
- (int64_t)fixedParamCount;
- (unint64_t)eventCategory;
- (unint64_t)eventType;
- (unint64_t)paramType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVHapticEvent

- (unint64_t)eventType
{
  return self->_u._eventType;
}

- (AVHapticPlayerFixedParameter)fixedParams
{
  return self->_fixedParams;
}

- (int64_t)fixedParamCount
{
  return self->_fixedParamCount;
}

- (unint64_t)eventCategory
{
  return self->_eventCategory;
}

- (double)duration
{
  return self->_duration;
}

- (double)time
{
  return self->_time;
}

- (AVHapticEvent)initWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6 duration:(double)a7
{
  v23.receiver = self;
  v23.super_class = (Class)AVHapticEvent;
  v12 = [(AVHapticEvent *)&v23 init];
  v13 = v12;
  if (v12)
  {
    double v14 = 0.0;
    double v15 = fmax(a4, 0.0);
    if (a7 >= 0.0) {
      double v14 = a7;
    }
    v12->_time = v15;
    v12->_duration = v14;
    v12->_eventCategory = 0;
    v12->_u._eventType = a3;
    paramCurve = v12->_paramCurve;
    v12->_paramCurve = 0;

    int64_t v17 = 0;
    if (a5)
    {
      unint64_t v18 = a6 - 1;
      if (a6 >= 1)
      {
        fixedParams = v13->_fixedParams;
        if (v18 >= 7) {
          unint64_t v18 = 7;
        }
        unint64_t v20 = v18 + 1;
        do
        {
          AVHapticPlayerFixedParameter v21 = *a5++;
          *fixedParams++ = v21;
          --v20;
        }
        while (v20);
        int64_t v17 = v18 + 1;
      }
    }
    v13->_fixedParamCount = v17;
  }
  return v13;
}

- (void).cxx_destruct
{
}

+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6 duration:(double)a7
{
  v7 = [[AVHapticEvent alloc] initWithEventType:a3 time:a5 parameters:a6 count:a4 duration:a7];
  return v7;
}

- (float)value
{
  return self->_value;
}

- (AVHapticPlayerParameterCurve)parameterCurve
{
  return self->_paramCurve;
}

- (unint64_t)paramType
{
  return self->_u._eventType;
}

- (AVHapticEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"time"];
  self->_time = v5;
  self->_eventCategory = (int)[v4 decodeInt32ForKey:@"eventCategory"];
  unint64_t v6 = [(AVHapticEvent *)self eventCategory];
  if (v6)
  {
    if (v6 == 1)
    {
      self->_u._eventType = [v4 decodeIntegerForKey:@"paramType"];
      [v4 decodeFloatForKey:@"value"];
      self->_value = v17;
    }
    else if (v6 == 2)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterCurve"];
      paramCurve = self->_paramCurve;
      self->_paramCurve = v7;
    }
  }
  else
  {
    [v4 decodeDoubleForKey:@"duration"];
    self->_duration = v9;
    self->_u._eventType = [v4 decodeIntegerForKey:@"eventType"];
    uint64_t v10 = [v4 decodeIntegerForKey:@"fixedParamCount"];
    int64_t v11 = 8;
    if (v10 < 8) {
      int64_t v11 = v10;
    }
    self->_fixedParamCount = v11;
    if (v10 >= 1)
    {
      int64_t v12 = 0;
      p_value = &self->_fixedParams[0].value;
      do
      {
        double v14 = objc_msgSend(NSString, "stringWithFormat:", @"fixedParam%dType", v12);
        *((void *)p_value - 1) = [v4 decodeIntegerForKey:v14];

        double v15 = objc_msgSend(NSString, "stringWithFormat:", @"fixedParam%dValue", v12);
        [v4 decodeFloatForKey:v15];
        *(_DWORD *)p_value = v16;
        p_value += 4;

        ++v12;
      }
      while (v12 < self->_fixedParamCount);
    }
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeDouble:@"time" forKey:self->_time];
  [v13 encodeInt32:LODWORD(self->_eventCategory) forKey:@"eventCategory"];
  unint64_t v4 = [(AVHapticEvent *)self eventCategory];
  if (v4)
  {
    if (v4 == 1)
    {
      [v13 encodeInteger:self->_u._eventType forKey:@"paramType"];
      *(float *)&double v12 = self->_value;
      [v13 encodeFloat:@"value" forKey:v12];
    }
    else if (v4 == 2)
    {
      [v13 encodeObject:self->_paramCurve forKey:@"parameterCurve"];
    }
  }
  else
  {
    [v13 encodeDouble:@"duration" forKey:self->_duration];
    [v13 encodeInteger:self->_u._eventType forKey:@"eventType"];
    if (self->_fixedParamCount >= 1)
    {
      int64_t v5 = 0;
      p_value = &self->_fixedParams[0].value;
      do
      {
        uint64_t v7 = *((void *)p_value - 1);
        v8 = objc_msgSend(NSString, "stringWithFormat:", @"fixedParam%dType", v5);
        [v13 encodeInteger:v7 forKey:v8];

        int v9 = *(_DWORD *)p_value;
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"fixedParam%dValue", v5);
        LODWORD(v11) = v9;
        [v13 encodeFloat:v10 forKey:v11];

        ++v5;
        p_value += 4;
      }
      while (v5 < self->_fixedParamCount);
    }
    objc_msgSend(v13, "encodeInteger:forKey:");
  }
}

- (AVHapticEvent)initWithParameterCurve:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVHapticEvent;
  unint64_t v6 = [(AVHapticEvent *)&v9 init];
  if (v6)
  {
    [v5 time];
    v6->_time = v7;
    v6->_duration = 0.0;
    v6->_eventCategory = 2;
    v6->_u._eventType = [v5 type];
    v6->_value = 0.0;
    v6->_fixedParamCount = 0;
    objc_storeStrong((id *)&v6->_paramCurve, a3);
  }

  return v6;
}

- (AVHapticEvent)initWithParameter:(unint64_t)a3 value:(float)a4 time:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AVHapticEvent;
  v8 = [(AVHapticEvent *)&v12 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_time = fmax(a5, 0.0);
    v8->_duration = 0.0;
    v8->_eventCategory = 1;
    v8->_u._eventType = a3;
    v8->_value = a4;
    paramCurve = v8->_paramCurve;
    v8->_paramCurve = 0;
  }
  return v9;
}

- (AVHapticEvent)initWithEventType:(unint64_t)a3 time:(double)a4 duration:(double)a5
{
  v14.receiver = self;
  v14.super_class = (Class)AVHapticEvent;
  v8 = [(AVHapticEvent *)&v14 init];
  objc_super v9 = v8;
  if (v8)
  {
    double v10 = 0.0;
    double v11 = fmax(a4, 0.0);
    if (a5 >= 0.0) {
      double v10 = a5;
    }
    v8->_time = v11;
    v8->_duration = v10;
    v8->_eventCategory = 0;
    v8->_u._eventType = a3;
    paramCurve = v8->_paramCurve;
    v8->_paramCurve = 0;
    v8->_fixedParamCount = 0;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithParameterCurve:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[AVHapticEvent alloc] initWithParameterCurve:v3];

  return v4;
}

+ (id)eventWithParameter:(unint64_t)a3 value:(float)a4 time:(double)a5
{
  v8 = [AVHapticEvent alloc];
  *(float *)&double v9 = a4;
  double v10 = [(AVHapticEvent *)v8 initWithParameter:a3 value:v9 time:a5];
  return v10;
}

+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6
{
  return +[AVHapticEvent eventWithEventType:a3 time:a5 parameters:a6 count:a4 duration:0.0];
}

+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 duration:(double)a5
{
  id v5 = [[AVHapticEvent alloc] initWithEventType:a3 time:a4 duration:a5];
  return v5;
}

+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4
{
  return +[AVHapticEvent eventWithEventType:a3 time:a4 duration:0.0];
}

@end