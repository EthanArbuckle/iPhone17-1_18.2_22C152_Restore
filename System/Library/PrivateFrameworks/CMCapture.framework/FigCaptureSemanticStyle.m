@interface FigCaptureSemanticStyle
+ (BOOL)supportsSecureCoding;
+ (FigCaptureSemanticStyle)semanticStyleWithToneBias:(float)a3 warmthBias:(float)a4;
+ (id)identityStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdentity;
- (FigCaptureSemanticStyle)initWithCoder:(id)a3;
- (FigCaptureSemanticStyle)initWithXPCEncoding:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (float)mappedToneBias;
- (float)mappedWarmthBias;
- (float)toneBias;
- (float)warmthBias;
- (id)_initWithToneBias:(float)a3 warmthBias:;
- (id)copyXPCEncoding;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FigCaptureSemanticStyle

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"toneBias:%.3f warmthBias:%.3f (mappedToneBias: %.3f, mappedWarmthBias: %.3f)", self->_toneBias, self->_warmthBias, self->_mappedToneBias, self->_mappedWarmthBias];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float toneBias = self->_toneBias;
  uint64_t v6 = [NSString stringWithUTF8String:"toneBias"];
  *(float *)&double v7 = toneBias;
  [a3 encodeFloat:v6 forKey:v7];
  float warmthBias = self->_warmthBias;
  uint64_t v9 = [NSString stringWithUTF8String:"warmthBias"];
  *(float *)&double v10 = warmthBias;
  [a3 encodeFloat:v9 forKey:v10];
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
  [(FigCaptureSemanticStyle *)self toneBias];
  float v6 = v5;
  [a3 toneBias];
  if (v6 != v7) {
    return 0;
  }
  [(FigCaptureSemanticStyle *)self warmthBias];
  float v10 = v9;
  [a3 warmthBias];
  return v10 == v11;
}

- (float)warmthBias
{
  return self->_warmthBias;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_double(v3, "toneBias", self->_toneBias);
  xpc_dictionary_set_double(v3, "warmthBias", self->_warmthBias);
  return v3;
}

- (BOOL)isIdentity
{
  return self->_toneBias == 0.0 && self->_warmthBias == 0.0;
}

- (FigCaptureSemanticStyle)initWithCoder:(id)a3
{
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "toneBias"));
  float v6 = v5;
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "warmthBias"));
  return (FigCaptureSemanticStyle *)-[FigCaptureSemanticStyle _initWithToneBias:warmthBias:](self, v6, v7);
}

+ (FigCaptureSemanticStyle)semanticStyleWithToneBias:(float)a3 warmthBias:(float)a4
{
  id v4 = -[FigCaptureSemanticStyle _initWithToneBias:warmthBias:]([FigCaptureSemanticStyle alloc], a3, a4);
  return (FigCaptureSemanticStyle *)v4;
}

- (id)_initWithToneBias:(float)a3 warmthBias:
{
  if (!result) {
    return result;
  }
  v12.receiver = result;
  v12.super_class = (Class)FigCaptureSemanticStyle;
  result = objc_msgSendSuper2(&v12, sel_init);
  if (!result) {
    return result;
  }
  if (a2 < -1.0 || a2 > 1.0)
  {
    float v11 = @"toneBias must be between -1.0 and 1.0";
    goto LABEL_29;
  }
  if (a3 < -1.0 || a3 > 1.0)
  {
    float v11 = @"warmthBias must be between -1.0 and 1.0";
LABEL_29:

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
  }
  *((float *)result + 2) = a2;
  *((float *)result + 4) = a3;
  if (a2 <= 0.0)
  {
    float v8 = 0.0;
    float v7 = 1.0;
  }
  else
  {
    float v7 = 1.3333;
    if (a2 > 0.5) {
      float v7 = 0.66667;
    }
    float v8 = 0.33333;
    if (a2 <= 0.5) {
      float v8 = 0.0;
    }
  }
  *((float *)result + 3) = v8 + (float)(v7 * a2);
  if (a3 <= -0.5)
  {
    float v9 = 0.3;
    float v10 = 1.3;
  }
  else if (a3 > 0.0)
  {
    float v10 = *(float *)"333?cnpm";
    if (a3 > 0.5) {
      float v10 = 1.3;
    }
    float v9 = -0.3;
    if (a3 <= 0.5) {
      float v9 = 0.0;
    }
  }
  else
  {
    float v9 = 0.0;
    float v10 = *(float *)"333?cnpm";
  }
  *((float *)result + 5) = v9 + (float)(v10 * a3);
  *((void *)result + 3) = (unint64_t)(float)(a3 * 10000.0) ^ (unint64_t)(float)(a2 * 10000.0);
  return result;
}

- (FigCaptureSemanticStyle)initWithXPCEncoding:(id)a3
{
  float v5 = xpc_dictionary_get_double(a3, "toneBias");
  float v6 = xpc_dictionary_get_double(a3, "warmthBias");
  return (FigCaptureSemanticStyle *)-[FigCaptureSemanticStyle _initWithToneBias:warmthBias:](self, v5, v6);
}

+ (id)identityStyle
{
  v2 = [FigCaptureSemanticStyle alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)FigCaptureSemanticStyle;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
    {
      *(void *)&v2->_float toneBias = 0;
      *(void *)&v2->_float warmthBias = 0;
      v2->_hash = 0;
    }
  }
  return v2;
}

- (NSString)description
{
  xpc_object_t v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureSemanticStyle debugDescription](self, "debugDescription")];
}

- (unint64_t)hash
{
  return self->_hash;
}

- (float)mappedToneBias
{
  return self->_mappedToneBias;
}

- (float)mappedWarmthBias
{
  return self->_mappedWarmthBias;
}

@end