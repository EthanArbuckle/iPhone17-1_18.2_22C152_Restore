@interface AVSemanticStyle
+ (AVSemanticStyle)semanticStyleWithToneBias:(float)a3 warmthBias:(float)a4;
+ (id)identityStyle;
- (BOOL)isEqual:(id)a3;
- (float)sceneBias;
- (float)subjectBias;
- (float)toneBias;
- (float)warmthBias;
- (id)_initWithToneBias:(float)a3 warmthBias:(float)a4;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
@end

@implementation AVSemanticStyle

- (float)warmthBias
{
  return self->_warmthBias;
}

- (float)toneBias
{
  return self->_toneBias;
}

+ (AVSemanticStyle)semanticStyleWithToneBias:(float)a3 warmthBias:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v7 = a3;
  *(float *)&double v8 = a4;
  v9 = (void *)[v6 _initWithToneBias:v7 warmthBias:v8];

  return (AVSemanticStyle *)v9;
}

- (id)_initWithToneBias:(float)a3 warmthBias:(float)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AVSemanticStyle;
  id result = [(AVSemanticStyle *)&v12 init];
  if (result)
  {
    if (a3 < -1.0 || a3 > 1.0)
    {
      double v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    }
    else
    {
      if (a4 >= -1.0 && a4 <= 1.0)
      {
        *((float *)result + 2) = a3;
        *((float *)result + 3) = a4;
        *((void *)result + 2) = (unint64_t)(float)(a4 * 10000.0) ^ (unint64_t)(float)(a3 * 10000.0);
        return result;
      }
      double v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    }
    v11 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v11);
    }
    NSLog(&cfstr_SuppressingExc.isa, v11);
    return 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(AVSemanticStyle *)self toneBias];
  float v6 = v5;
  [a3 toneBias];
  if (v6 != v7) {
    return 0;
  }
  [(AVSemanticStyle *)self warmthBias];
  float v10 = v9;
  [a3 warmthBias];
  return v10 == v11;
}

+ (id)identityStyle
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithToneBias:0.0 warmthBias:0.0];

  return v2;
}

- (float)sceneBias
{
  return self->_toneBias;
}

- (id)debugDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"toneBias:%.3f warmthBias:%.3f", self->_toneBias, self->_warmthBias);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVSemanticStyle debugDescription](self, "debugDescription")];
}

- (unint64_t)hash
{
  return self->_hash;
}

- (float)subjectBias
{
  return self->_subjectBias;
}

@end