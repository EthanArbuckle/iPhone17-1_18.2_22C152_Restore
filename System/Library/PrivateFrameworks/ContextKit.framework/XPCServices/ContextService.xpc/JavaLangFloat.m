@interface JavaLangFloat
+ (BOOL)isInfiniteWithFloat:(float)a3;
+ (BOOL)isNaNWithFloat:(float)a3;
+ (const)__metadata;
+ (float)intBitsToFloatWithInt:(int)a3;
+ (float)parseFloatWithNSString:(id)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (int)floatToRawIntBitsWithFloat:(float)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInfinite;
- (BOOL)isNaN;
- (JavaLangFloat)initWithDouble:(double)a3;
- (JavaLangFloat)initWithFloat:(float)a3;
- (JavaLangFloat)initWithNSString:(id)a3;
- (NSString)description;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (int)compareToWithId:(id)a3;
- (int)intValue;
- (int64_t)longLongValue;
- (signed)shortValue;
- (unint64_t)hash;
- (void)getValue:(void *)a3;
@end

@implementation JavaLangFloat

- (JavaLangFloat)initWithFloat:(float)a3
{
  self->value_ = a3;
  return self;
}

- (JavaLangFloat)initWithDouble:(double)a3
{
  float v3 = a3;
  self->value_ = v3;
  return self;
}

- (JavaLangFloat)initWithNSString:(id)a3
{
  JavaLangFloat_parseFloatWithNSString_(a3);
  self->value_ = v4;
  return self;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  float value = self->value_;
  float v6 = *((float *)a3 + 2);
  return JavaLangFloat_compareWithFloat_withFloat_(value, v6);
}

- (char)charValue
{
  float value = self->value_;
  int v3 = (int)value;
  if (value < 0.0) {
    char v4 = 0;
  }
  else {
    char v4 = -1;
  }
  if (v3 == 0x80000000) {
    LOBYTE(v3) = v4;
  }
  return v3;
}

- (double)doubleValue
{
  return self->value_;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v5 = JavaLangFloat_floatToIntBitsWithFloat_(self->value_);
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v5 == JavaLangFloat_floatToIntBitsWithFloat_(*((float *)a3 + 2));
}

+ (int)floatToRawIntBitsWithFloat:(float)a3
{
  if ((atomic_load_explicit(JavaLangFloat__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return LODWORD(a3);
}

- (float)floatValue
{
  return self->value_;
}

- (unint64_t)hash
{
  return (int)JavaLangFloat_floatToIntBitsWithFloat_(self->value_);
}

+ (float)intBitsToFloatWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangFloat__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return *(float *)&a3;
}

- (int)intValue
{
  float value = self->value_;
  if (value < 0.0) {
    int v3 = 0x80000000;
  }
  else {
    int v3 = 0x7FFFFFFF;
  }
  if ((int)value == 0x80000000) {
    return v3;
  }
  else {
    return (int)value;
  }
}

- (BOOL)isInfinite
{
  float value = self->value_;
  if ((atomic_load_explicit(JavaLangFloat__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return fabsf(value) == INFINITY;
}

+ (BOOL)isInfiniteWithFloat:(float)a3
{
  if ((atomic_load_explicit(JavaLangFloat__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return fabsf(a3) == INFINITY;
}

- (BOOL)isNaN
{
  if ((atomic_load_explicit(JavaLangFloat__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

+ (BOOL)isNaNWithFloat:(float)a3
{
  if ((atomic_load_explicit(JavaLangFloat__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

- (int64_t)longLongValue
{
  float value = self->value_;
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (value < 0.0) {
    int64_t v3 = 0x8000000000000000;
  }
  if ((uint64_t)value == 0x8000000000000000) {
    return v3;
  }
  else {
    return (uint64_t)value;
  }
}

+ (float)parseFloatWithNSString:(id)a3
{
  JavaLangFloat_parseFloatWithNSString_(a3);
  return result;
}

- (signed)shortValue
{
  float value = self->value_;
  int v3 = (int)value;
  if (value < 0.0) {
    __int16 v4 = 0;
  }
  else {
    __int16 v4 = -1;
  }
  if (v3 == 0x80000000) {
    LOWORD(v3) = v4;
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)JavaLangFloat_toStringWithFloat_(self->value_);
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaLangFloat_valueOfWithNSString_(a3);
}

- (const)objCType
{
  return "f";
}

- (void)getValue:(void *)a3
{
  *(float *)a3 = self->value_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_msgSend((id)IOSClass_arrayType((uint64_t)+[IOSClass floatClass](IOSClass, "floatClass"), 1u), "getComponentType");
    objc_opt_class();
    if (v2)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    JreStrongAssign(&JavaLangFloat_TYPE_, v2);
    atomic_store(1u, (unsigned __int8 *)JavaLangFloat__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100472480;
}

@end