@interface AVCaptureSmartStyle
+ (AVCaptureSmartStyle)styleWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6;
+ (id)identityStyle;
- (BOOL)isEqual:(id)a3;
- (NSString)cast;
- (float)colorBias;
- (float)intensity;
- (float)toneBias;
- (id)_initWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6;
- (id)debugDescription;
- (id)description;
- (int64_t)version;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVCaptureSmartStyle

+ (AVCaptureSmartStyle)styleWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6
{
  id v10 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  *(float *)&double v13 = a6;
  v14 = (void *)[v10 _initWithCast:a3 intensity:v11 toneBias:v12 colorBias:v13];

  return (AVCaptureSmartStyle *)v14;
}

- (id)_initWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6
{
  v16.receiver = self;
  v16.super_class = (Class)AVCaptureSmartStyle;
  id v10 = [(AVCaptureSmartStyle *)&v16 init];
  if (v10)
  {
    if (a5 < -1.0 || a5 > 1.0)
    {
      double v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    }
    else if (a4 < 0.0 || a4 > 1.0)
    {
      double v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    }
    else
    {
      if (a6 >= -1.0 && a6 <= 1.0)
      {
        v10->_cast = (NSString *)[a3 copy];
        v10->_intensity = a4;
        v10->_toneBias = a5;
        v10->_colorBias = a6;
        v10->_hash = (unint64_t)(float)(a4 * 10000.0) ^ (unint64_t)(float)(a5 * 10000.0) ^ (unint64_t)(float)(a6 * 10000.0) ^ 0x2710;
        v10->_version = 1;
        return v10;
      }
      double v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    }
    v14 = (void *)[v12 exceptionWithName:v13 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return 0;
  }
  return v10;
}

+ (id)identityStyle
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithCast:AVSmartStyleCastTypeStandard[0] intensity:0.0 toneBias:0.0 colorBias:0.0];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_7:
      LOBYTE(v5) = 0;
      return v5;
    }
    BOOL v5 = -[NSString isEqualToString:](-[AVCaptureSmartStyle cast](self, "cast"), "isEqualToString:", [a3 cast]);
    if (v5)
    {
      [(AVCaptureSmartStyle *)self intensity];
      float v7 = v6;
      [a3 intensity];
      if (v7 != v8) {
        goto LABEL_7;
      }
      [(AVCaptureSmartStyle *)self toneBias];
      float v10 = v9;
      [a3 toneBias];
      if (v10 != v11) {
        goto LABEL_7;
      }
      [(AVCaptureSmartStyle *)self colorBias];
      float v13 = v12;
      [a3 colorBias];
      if (v13 != v14) {
        goto LABEL_7;
      }
      int64_t v15 = [(AVCaptureSmartStyle *)self version];
      LOBYTE(v5) = v15 == [a3 version];
    }
  }
  return v5;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"cast:%@ intensity:%.3f toneBias:%.3f colorBias:%.3f version:%ld", self->_cast, self->_intensity, self->_toneBias, self->_colorBias, self->_version];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureSmartStyle debugDescription](self, "debugDescription")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSmartStyle;
  [(AVCaptureSmartStyle *)&v3 dealloc];
}

- (NSString)cast
{
  return self->_cast;
}

- (float)intensity
{
  return self->_intensity;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (float)colorBias
{
  return self->_colorBias;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (int64_t)version
{
  return self->_version;
}

@end