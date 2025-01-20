@interface FigCaptureSmartStyle
+ (BOOL)supportsSecureCoding;
+ (FigCaptureSmartStyle)styleWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6;
+ (id)createFromDictionary:(id)a3;
+ (id)identityStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdentity;
- (FigCaptureSmartStyle)initWithCoder:(id)a3;
- (FigCaptureSmartStyle)initWithXPCEncoding:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)cast;
- (NSString)debugDescription;
- (NSString)description;
- (float)_initWithCast:(float)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:;
- (float)colorBias;
- (float)intensity;
- (float)toneBias;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FigCaptureSmartStyle

+ (FigCaptureSmartStyle)styleWithCast:(id)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:(float)a6
{
  v6 = -[FigCaptureSmartStyle _initWithCast:intensity:toneBias:colorBias:]([FigCaptureSmartStyle alloc], a3, a4, a5, a6);
  return (FigCaptureSmartStyle *)v6;
}

- (float)_initWithCast:(float)a3 intensity:(float)a4 toneBias:(float)a5 colorBias:
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)FigCaptureSmartStyle;
  v9 = (float *)objc_msgSendSuper2(&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = @"intensity must be between 0.0 and 1.0";
    if (a3 >= 0.0 && a4 <= 1.0)
    {
      if (a4 < -1.0)
      {
        v11 = @"toneBias must be between -1.0 and 1.0";
      }
      else
      {
        v11 = @"colorBias must be between -1.0 and 1.0";
        if (a5 >= -1.0 && a5 <= 1.0)
        {
          *((void *)v9 + 1) = [a2 copy];
          v10[4] = a3;
          v10[5] = a4;
          v10[6] = a5;
          *((void *)v10 + 4) = (unint64_t)(float)(a4 * 10000.0) ^ (unint64_t)(float)(a3 * 10000.0) ^ (unint64_t)(float)(a5 * 10000.0);
          return v10;
        }
      }
    }

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
  }
  return v10;
}

+ (id)identityStyle
{
  v2 = [FigCaptureSmartStyle alloc];
  if (v2)
  {
    v3 = FigSmartStyleCastTypeStandard;
    v6.receiver = v2;
    v6.super_class = (Class)FigCaptureSmartStyle;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4)
    {
      v4[1] = [(__CFString *)v3 copy];
      v4[2] = 1065353216;
      *((_DWORD *)v4 + 6) = 0;
      v4[4] = 10000;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSmartStyle;
  [(FigCaptureSmartStyle *)&v3 dealloc];
}

- (FigCaptureSmartStyle)initWithXPCEncoding:(id)a3
{
  v5 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a3, "cast"));
  float v6 = xpc_dictionary_get_double(a3, "intensity");
  float v7 = xpc_dictionary_get_double(a3, "toneBias");
  float v8 = xpc_dictionary_get_double(a3, "colorBias");
  return (FigCaptureSmartStyle *)-[FigCaptureSmartStyle _initWithCast:intensity:toneBias:colorBias:](self, v5, v6, v7, v8);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cast", [(NSString *)self->_cast UTF8String]);
  xpc_dictionary_set_double(v3, "intensity", self->_intensity);
  xpc_dictionary_set_double(v3, "toneBias", self->_toneBias);
  xpc_dictionary_set_double(v3, "colorBias", self->_colorBias);
  return v3;
}

- (FigCaptureSmartStyle)initWithCoder:(id)a3
{
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(NSString, "stringWithUTF8String:", "cast"));
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "intensity"));
  float v7 = v6;
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "toneBias"));
  float v9 = v8;
  objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "colorBias"));
  return (FigCaptureSmartStyle *)-[FigCaptureSmartStyle _initWithCast:intensity:toneBias:colorBias:](self, v5, v7, v9, v10);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_cast, objc_msgSend(NSString, "stringWithUTF8String:", "cast"));
  float intensity = self->_intensity;
  uint64_t v6 = [NSString stringWithUTF8String:"intensity"];
  *(float *)&double v7 = intensity;
  [a3 encodeFloat:v6 forKey:v7];
  float toneBias = self->_toneBias;
  uint64_t v9 = [NSString stringWithUTF8String:"toneBias"];
  *(float *)&double v10 = toneBias;
  [a3 encodeFloat:v9 forKey:v10];
  float colorBias = self->_colorBias;
  uint64_t v12 = [NSString stringWithUTF8String:"colorBias"];
  *(float *)&double v13 = colorBias;
  [a3 encodeFloat:v12 forKey:v13];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
LABEL_6:
      LOBYTE(v5) = 0;
      return v5;
    }
    BOOL v5 = -[NSString isEqualToString:](-[FigCaptureSmartStyle cast](self, "cast"), "isEqualToString:", [a3 cast]);
    if (v5)
    {
      [(FigCaptureSmartStyle *)self intensity];
      float v7 = v6;
      [a3 intensity];
      if (v7 != v8) {
        goto LABEL_6;
      }
      [(FigCaptureSmartStyle *)self toneBias];
      float v10 = v9;
      [a3 toneBias];
      if (v10 != v11) {
        goto LABEL_6;
      }
      [(FigCaptureSmartStyle *)self colorBias];
      float v13 = v12;
      [a3 colorBias];
      LOBYTE(v5) = v13 == v14;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [FigCaptureSmartStyle alloc];
  BOOL v5 = [(FigCaptureSmartStyle *)self cast];
  [(FigCaptureSmartStyle *)self intensity];
  float v7 = v6;
  [(FigCaptureSmartStyle *)self toneBias];
  float v9 = v8;
  [(FigCaptureSmartStyle *)self colorBias];
  return -[FigCaptureSmartStyle _initWithCast:intensity:toneBias:colorBias:](v4, v5, v7, v9, v10);
}

- (BOOL)isIdentity
{
  BOOL v3 = [(NSString *)self->_cast isEqualToString:FigSmartStyleCastTypeStandard];
  if (v3) {
    LOBYTE(v3) = self->_toneBias == 0.0 && self->_colorBias == 0.0;
  }
  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = [NSString stringWithUTF8String:"cast"];
  v8[0] = (id)[(NSString *)self->_cast copy];
  v7[1] = [NSString stringWithUTF8String:"intensity"];
  *(float *)&double v3 = self->_intensity;
  v8[1] = [NSNumber numberWithFloat:v3];
  v7[2] = [NSString stringWithUTF8String:"toneBias"];
  *(float *)&double v4 = self->_toneBias;
  v8[2] = [NSNumber numberWithFloat:v4];
  v7[3] = [NSString stringWithUTF8String:"colorBias"];
  *(float *)&double v5 = self->_colorBias;
  v8[3] = [NSNumber numberWithFloat:v5];
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
}

+ (id)createFromDictionary:(id)a3
{
  uint64_t v5 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(NSString, "stringWithUTF8String:", "cast"));
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(NSString, "stringWithUTF8String:", "intensity"));
  if (!v7) {
    return 0;
  }
  float v8 = (void *)v7;
  uint64_t v9 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(NSString, "stringWithUTF8String:", "toneBias"));
  if (!v9) {
    return 0;
  }
  float v10 = (void *)v9;
  uint64_t v11 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(NSString, "stringWithUTF8String:", "colorBias"));
  if (!v11) {
    return 0;
  }
  float v12 = (void *)v11;
  [v8 floatValue];
  int v14 = v13;
  [v10 floatValue];
  int v16 = v15;
  [v12 floatValue];
  LODWORD(v17) = LODWORD(v18);
  LODWORD(v18) = v14;
  LODWORD(v19) = v16;
  return (id)[a1 styleWithCast:v6 intensity:v18 toneBias:v19 colorBias:v17];
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"cast:%@ intensity:%.3f toneBias:%.3f colorBias:%.3f", self->_cast, self->_intensity, self->_toneBias, self->_colorBias];
}

- (NSString)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureSmartStyle debugDescription](self, "debugDescription")];
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

@end