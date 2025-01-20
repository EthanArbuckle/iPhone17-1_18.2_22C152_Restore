@interface MLCActivationDescriptor
+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType;
+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a;
+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a b:(float)b;
+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a b:(float)b c:(float)c;
+ (double)defaultParametersForType:(int)a3;
- (BOOL)isEqual:(id)a3;
- (MLCActivationDescriptor)initWithType:(int)a3 a:(float)a4 b:(float)a5 c:(float)a6;
- (MLCActivationType)activationType;
- (float)a;
- (float)b;
- (float)c;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLCActivationDescriptor

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCActivationDescriptor *)self activationType];
  [(MLCActivationDescriptor *)self a];
  double v8 = v7;
  [(MLCActivationDescriptor *)self b];
  double v10 = v9;
  [(MLCActivationDescriptor *)self c];
  v12 = [v3 stringWithFormat:@"%@: { activationType=%d : a=%f : b=%f : c=%f}", v5, v6, *(void *)&v8, *(void *)&v10, v11];

  return v12;
}

+ (double)defaultParametersForType:(int)a3
{
  __asm { FMOV            V0.4S, #1.0 }
  switch(a3)
  {
    case 1:
      *(void *)&_Q0 = 0x3F80000000000000;
      break;
    case 2:
      *(void *)&_Q0 = 1065353216;
      break;
    case 4:
      *(void *)&_Q0 = 0x3F0000003E4CCCCDLL;
      break;
    case 14:
    case 15:
      *(void *)&_Q0 = 0x3F8000003F000000;
      break;
    default:
      return *(double *)&_Q0;
  }
  return *(double *)&_Q0;
}

+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType
{
  uint64_t v3 = *(void *)&activationType;
  objc_msgSend(a1, "defaultParametersForType:");
  long long v11 = v5;
  id v6 = objc_alloc((Class)a1);
  LODWORD(v8) = DWORD2(v11);
  LODWORD(v7) = DWORD1(v11);
  float v9 = (void *)[v6 initWithType:v3 a:*(double *)&v11 b:v7 c:v8];

  return (MLCActivationDescriptor *)v9;
}

+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a
{
  uint64_t v5 = *(void *)&activationType;
  objc_msgSend(a1, "defaultParametersForType:");
  long long v13 = v7;
  id v8 = objc_alloc((Class)a1);
  LODWORD(v10) = DWORD2(v13);
  LODWORD(v9) = DWORD1(v13);
  long long v11 = objc_msgSend(v8, "initWithType:a:b:c:", v5, COERCE_DOUBLE(__PAIR64__(DWORD1(v13), LODWORD(a))), v9, v10);

  return (MLCActivationDescriptor *)v11;
}

+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a b:(float)b
{
  uint64_t v7 = *(void *)&activationType;
  objc_msgSend(a1, "defaultParametersForType:");
  long long v15 = v9;
  id v10 = objc_alloc((Class)a1);
  LODWORD(v11) = DWORD2(v15);
  *(float *)&double v12 = b;
  long long v13 = objc_msgSend(v10, "initWithType:a:b:c:", v7, COERCE_DOUBLE(__PAIR64__(DWORD1(v15), LODWORD(a))), v12, v11);

  return (MLCActivationDescriptor *)v13;
}

+ (MLCActivationDescriptor)descriptorWithType:(MLCActivationType)activationType a:(float)a b:(float)b c:(float)c
{
  uint64_t v9 = *(void *)&activationType;
  id v10 = objc_alloc((Class)a1);
  *(float *)&double v11 = a;
  *(float *)&double v12 = b;
  *(float *)&double v13 = c;
  v14 = (void *)[v10 initWithType:v9 a:v11 b:v12 c:v13];

  return (MLCActivationDescriptor *)v14;
}

- (MLCActivationDescriptor)initWithType:(int)a3 a:(float)a4 b:(float)a5 c:(float)a6
{
  id v6 = self;
  if (a3 == 21)
  {
    id v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MLCActivationDescriptor initWithType:a:b:c:](a2, v8);
    }

    uint64_t v9 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MLCActivationDescriptor;
    v14 = [(MLCActivationDescriptor *)&v16 init];
    if (v14)
    {
      v14->_activationType = a3;
      v14->_a = a4;
      v14->_b = a5;
      v14->_c = a6;
    }
    id v6 = v14;
    uint64_t v9 = v6;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 activationType];
    if (v6 == [(MLCActivationDescriptor *)self activationType]
      && ([v5 a], float v8 = v7, -[MLCActivationDescriptor a](self, "a"), v8 == v9)
      && ([v5 b], float v11 = v10, -[MLCActivationDescriptor b](self, "b"), v11 == v12))
    {
      [v5 c];
      float v14 = v13;
      [(MLCActivationDescriptor *)self c];
      BOOL v16 = v14 == v15;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v19 = 0;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[MLCActivationDescriptor activationType](self, "activationType"));
  char v4 = [v3 hash];
  id v5 = NSNumber;
  [(MLCActivationDescriptor *)self a];
  int v6 = objc_msgSend(v5, "numberWithFloat:");
  [v6 hash];
  float v7 = NSNumber;
  [(MLCActivationDescriptor *)self b];
  float v8 = objc_msgSend(v7, "numberWithFloat:");
  [v8 hash];
  float v9 = NSNumber;
  [(MLCActivationDescriptor *)self c];
  float v10 = objc_msgSend(v9, "numberWithFloat:");
  [v10 hash];
  hashCombine(&v19, v11, v12, v13, v14, v15, v16, v17, v4);

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(MLCActivationDescriptor *)self activationType];
  [(MLCActivationDescriptor *)self a];
  int v7 = v6;
  [(MLCActivationDescriptor *)self b];
  int v9 = v8;
  [(MLCActivationDescriptor *)self c];
  LODWORD(v10) = LODWORD(v11);
  LODWORD(v11) = v7;
  LODWORD(v12) = v9;

  return (id)[v4 initWithType:v5 a:v11 b:v12 c:v10];
}

- (MLCActivationType)activationType
{
  return self->_activationType;
}

- (float)a
{
  return self->_a;
}

- (float)b
{
  return self->_b;
}

- (float)c
{
  return self->_c;
}

- (void)initWithType:(const char *)a1 a:(NSObject *)a2 b:c:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(a1);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = 21;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: Requested activation type: (%d) not supported", (uint8_t *)&v4, 0x12u);
}

@end