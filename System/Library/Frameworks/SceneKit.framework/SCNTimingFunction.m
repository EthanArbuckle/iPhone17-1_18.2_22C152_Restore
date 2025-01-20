@interface SCNTimingFunction
+ (BOOL)supportsSecureCoding;
+ (SCNTimingFunction)functionWithCAMediaTimingFunction:(CAMediaTimingFunction *)caTimingFunction;
+ (SCNTimingFunction)functionWithTimingMode:(SCNActionTimingMode)timingMode;
- (SCNTimingFunction)initWithCoder:(id)a3;
- (SCNTimingFunction)initWithTimingFunctionRef:(__C3DTimingFunction *)a3;
- (__C3DTimingFunction)c3dTimingFunction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNTimingFunction

- (SCNTimingFunction)initWithTimingFunctionRef:(__C3DTimingFunction *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTimingFunction;
  v4 = [(SCNTimingFunction *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = (__C3DTimingFunction *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_timingFunction = v5;
  }
  return v4;
}

- (void)dealloc
{
  timingFunction = self->_timingFunction;
  if (timingFunction)
  {
    CFRelease(timingFunction);
    self->_timingFunction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNTimingFunction;
  [(SCNTimingFunction *)&v4 dealloc];
}

+ (SCNTimingFunction)functionWithTimingMode:(SCNActionTimingMode)timingMode
{
  if ((unint64_t)timingMode > SCNActionTimingModeEaseInEaseOut) {
    return 0;
  }
  C3DTimingFunctionCreateWithName(*off_264008B10[timingMode]);
  if (!v3) {
    return 0;
  }
  objc_super v4 = [[SCNTimingFunction alloc] initWithTimingFunctionRef:v3];

  return v4;
}

+ (SCNTimingFunction)functionWithCAMediaTimingFunction:(CAMediaTimingFunction *)caTimingFunction
{
  if (!caTimingFunction) {
    return 0;
  }
  id v3 = C3DTimingFunctionFromCAMediaTimingFunction(caTimingFunction);
  if (!v3) {
    return 0;
  }
  objc_super v4 = [[SCNTimingFunction alloc] initWithTimingFunctionRef:v3];

  return v4;
}

- (__C3DTimingFunction)c3dTimingFunction
{
  return self->_timingFunction;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (id)C3DCopyPropertyList(self->_timingFunction, 0, 0, 0);
  [a3 encodeObject:v4 forKey:@"c3dTimingFunction"];
}

- (SCNTimingFunction)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTimingFunction;
  id v4 = [(SCNTimingFunction *)&v7 init];
  if (v4)
  {
    v5 = (const void *)[a3 decodeObjectOfClasses:SCNPlistClasses() forKey:@"c3dTimingFunction"];
    v4->_timingFunction = (__C3DTimingFunction *)C3DTimingFunctionCreateWithPropertyList(v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end