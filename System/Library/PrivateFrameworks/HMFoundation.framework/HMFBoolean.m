@interface HMFBoolean
+ (BOOL)supportsSecureCoding;
+ (HMFBoolean)BOOLeanWithBool:(BOOL)a3;
+ (HMFBoolean)allocWithZone:(_NSZone *)a3;
+ (id)numberWithChar:(char)a3;
+ (id)numberWithDouble:(double)a3;
+ (id)numberWithFloat:(float)a3;
+ (id)numberWithInt:(int)a3;
+ (id)numberWithInteger:(int64_t)a3;
+ (id)numberWithLong:(int64_t)a3;
+ (id)numberWithLongLong:(int64_t)a3;
+ (id)numberWithShort:(signed __int16)a3;
+ (id)numberWithUnsignedChar:(unsigned __int8)a3;
+ (id)numberWithUnsignedInt:(unsigned int)a3;
+ (id)numberWithUnsignedInteger:(unint64_t)a3;
+ (id)numberWithUnsignedLong:(unint64_t)a3;
+ (id)numberWithUnsignedLongLong:(unint64_t)a3;
+ (id)numberWithUnsignedShort:(unsigned __int16)a3;
- (BOOL)BOOLValue;
- (Class)classForCoder;
- (HMFBoolean)initWithBool:(BOOL)a3;
- (char)charValue;
- (const)objCType;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
- (void)getValue:(void *)a3 size:(unint64_t)a4;
@end

@implementation HMFBoolean

+ (HMFBoolean)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    return (HMFBoolean *)+[HMFBoolean allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___HMFBoolean;
    return (HMFBoolean *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

+ (HMFBoolean)BOOLeanWithBool:(BOOL)a3
{
  v3 = objc_opt_new();
  return (HMFBoolean *)v3;
}

+ (id)numberWithChar:(char)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithUnsignedChar:(unsigned __int8)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithShort:(signed __int16)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithUnsignedShort:(unsigned __int16)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithInt:(int)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithUnsignedInt:(unsigned int)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithLong:(int64_t)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithUnsignedLong:(unint64_t)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithLongLong:(int64_t)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithUnsignedLongLong:(unint64_t)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithFloat:(float)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0.0];
}

+ (id)numberWithDouble:(double)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0.0];
}

+ (id)numberWithInteger:(int64_t)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

+ (id)numberWithUnsignedInteger:(unint64_t)a3
{
  return (id)[a1 BOOLeanWithBool:a3 != 0];
}

- (HMFBoolean)initWithBool:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMFBoolean;
  return [(HMFBoolean *)&v4 init];
}

- (id)description
{
  if ([(HMFBoolean *)self BOOLValue]) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return v2;
}

- (unint64_t)hash
{
  return CFHashBytes();
}

- (int64_t)compare:(id)a3
{
  objc_super v4 = (HMFBoolean *)a3;
  if (self == v4)
  {
    int64_t v7 = 0;
  }
  else
  {
    int v5 = [(HMFBoolean *)self BOOLValue];
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        _HMFPreconditionFailure(@"[otherNumber isKindOfClass:NSNumber.class]");
      }
      int v6 = [(HMFBoolean *)v4 BOOLValue];
    }
    else
    {
      int v6 = 0;
    }
    uint64_t v8 = 1;
    if (!v5) {
      uint64_t v8 = -1;
    }
    if (v6 == v5) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = v8;
    }
  }

  return v7;
}

- (void)getValue:(void *)a3
{
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  if (!a3) {
    _HMFPreconditionFailure(@"value");
  }
  if (a4 != 1) {
    _HMFPreconditionFailure(@"size == 1");
  }
  *(unsigned char *)a3 = [(HMFBoolean *)self BOOLValue];
}

- (const)objCType
{
  return "c";
}

- (char)charValue
{
  return [(HMFBoolean *)self BOOLValue];
}

- (BOOL)BOOLValue
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  int v5 = NSStringFromSelector(a2);
  int v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMFBoolean BOOLValue](self, "BOOLValue"), @"HMF.value");
}

@end