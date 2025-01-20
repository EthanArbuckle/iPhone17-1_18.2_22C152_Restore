@interface JavaLangDouble
+ (BOOL)isInfiniteWithDouble:(double)a3;
+ (BOOL)isNaNWithDouble:(double)a3;
+ (const)__metadata;
+ (double)longBitsToDoubleWithLong:(int64_t)a3;
+ (double)parseDoubleWithNSString:(id)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (int64_t)doubleToRawLongBitsWithDouble:(double)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInfinite;
- (BOOL)isNaN;
- (JavaLangDouble)initWithDouble:(double)a3;
- (JavaLangDouble)initWithNSString:(id)a3;
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

@implementation JavaLangDouble

- (JavaLangDouble)initWithDouble:(double)a3
{
  self->value_ = a3;
  return self;
}

- (JavaLangDouble)initWithNSString:(id)a3
{
  self->value_ = JavaLangDouble_parseDoubleWithNSString_(a3);
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
  double value = self->value_;
  double v6 = *((double *)a3 + 1);
  return JavaLangDouble_compareWithDouble_withDouble_(value, v6);
}

- (char)charValue
{
  double value = self->value_;
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

+ (int64_t)doubleToRawLongBitsWithDouble:(double)a3
{
  if ((atomic_load_explicit(JavaLangDouble__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return *(void *)&a3;
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
  uint64_t v5 = JavaLangDouble_doubleToLongBitsWithDouble_(self->value_);
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v5 == JavaLangDouble_doubleToLongBitsWithDouble_(*((double *)a3 + 1));
}

- (float)floatValue
{
  return self->value_;
}

- (unint64_t)hash
{
  uint64_t v2 = JavaLangDouble_doubleToLongBitsWithDouble_(self->value_);
  return (uint64_t)(v2 & 0xFFFFFFFF00000000 ^ (v2 << 32)) >> 32;
}

- (int)intValue
{
  double value = self->value_;
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
  double value = self->value_;
  if ((atomic_load_explicit(JavaLangDouble__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return fabs(value) == INFINITY;
}

+ (BOOL)isInfiniteWithDouble:(double)a3
{
  if ((atomic_load_explicit(JavaLangDouble__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return fabs(a3) == INFINITY;
}

- (BOOL)isNaN
{
  if ((atomic_load_explicit(JavaLangDouble__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

+ (BOOL)isNaNWithDouble:(double)a3
{
  if ((atomic_load_explicit(JavaLangDouble__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

+ (double)longBitsToDoubleWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(JavaLangDouble__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return *(double *)&a3;
}

- (int64_t)longLongValue
{
  double value = self->value_;
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

+ (double)parseDoubleWithNSString:(id)a3
{
  return JavaLangDouble_parseDoubleWithNSString_(a3);
}

- (signed)shortValue
{
  double value = self->value_;
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
  return (NSString *)JavaLangDouble_toStringWithDouble_(self->value_);
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaLangDouble_valueOfWithNSString_(a3);
}

- (const)objCType
{
  return "d";
}

- (void)getValue:(void *)a3
{
  *(double *)a3 = self->value_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_msgSend((id)IOSClass_arrayType((uint64_t)+[IOSClass doubleClass](IOSClass, "doubleClass"), 1u), "getComponentType");
    objc_opt_class();
    if (v2)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    JreStrongAssign(&JavaLangDouble_TYPE_, v2);
    atomic_store(1u, (unsigned __int8 *)JavaLangDouble__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100463D70;
}

@end