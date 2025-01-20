@interface JavaLangByte
+ (char)parseByteWithNSString:(id)a3;
+ (char)parseByteWithNSString:(id)a3 withInt:(int)a4;
+ (const)__metadata;
+ (id)decodeWithNSString:(id)a3;
+ (id)toHexStringWithByte:(char)a3 withBoolean:(BOOL)a4;
+ (id)toStringWithByte:(char)a3;
+ (id)valueOfWithByte:(char)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (id)valueOfWithNSString:(id)a3 withInt:(int)a4;
+ (int)compareWithByte:(char)a3 withByte:(char)a4;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaLangByte)initWithByte:(char)a3;
- (JavaLangByte)initWithNSString:(id)a3;
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

@implementation JavaLangByte

- (JavaLangByte)initWithByte:(char)a3
{
  self->value_ = a3;
  return self;
}

- (JavaLangByte)initWithNSString:(id)a3
{
  self->value_ = JavaLangByte_parseByteWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  return self;
}

- (char)charValue
{
  return self->value_;
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
  int value = self->value_;
  int v6 = *((char *)a3 + 8);
  if ((atomic_load_explicit(JavaLangByte__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (value >= v6) {
    int v7 = 0;
  }
  else {
    int v7 = -1;
  }
  if (value > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

+ (int)compareWithByte:(char)a3 withByte:(char)a4
{
  int v4 = a4;
  int v5 = a3;
  if ((atomic_load_explicit(JavaLangByte__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v5 >= v4) {
    int v6 = 0;
  }
  else {
    int v6 = -1;
  }
  if (v5 > v4) {
    return 1;
  }
  else {
    return v6;
  }
}

+ (id)decodeWithNSString:(id)a3
{
  return (id)JavaLangByte_decodeWithNSString_(a3);
}

- (double)doubleValue
{
  return (double)self->value_;
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
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return *((unsigned __int8 *)a3 + 8) == self->value_;
}

- (float)floatValue
{
  return (float)self->value_;
}

- (unint64_t)hash
{
  return self->value_;
}

- (int)intValue
{
  return self->value_;
}

- (int64_t)longLongValue
{
  return self->value_;
}

+ (char)parseByteWithNSString:(id)a3
{
  return JavaLangByte_parseByteWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (char)parseByteWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangByte_parseByteWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

- (signed)shortValue
{
  return self->value_;
}

- (NSString)description
{
  return JavaLangInteger_toStringWithInt_(self->value_);
}

+ (id)toHexStringWithByte:(char)a3 withBoolean:(BOOL)a4
{
  return JavaLangByte_toHexStringWithByte_withBoolean_(a3, a4);
}

+ (id)toStringWithByte:(char)a3
{
  return JavaLangByte_toStringWithByte_(a3);
}

+ (id)valueOfWithNSString:(id)a3
{
  return (id)JavaLangByte_valueOfWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)valueOfWithNSString:(id)a3 withInt:(int)a4
{
  return (id)JavaLangByte_valueOfWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)valueOfWithByte:(char)a3
{
  return (id)JavaLangByte_valueOfWithByte_(a3);
}

- (const)objCType
{
  return "c";
}

- (void)getValue:(void *)a3
{
  *(unsigned char *)a3 = self->value_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_msgSend((id)IOSClass_arrayType((uint64_t)+[IOSClass byteClass](IOSClass, "byteClass"), 1u), "getComponentType");
    objc_opt_class();
    if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    JreStrongAssign(&JavaLangByte_TYPE_, v2);
    id v3 = +[IOSObjectArray newArrayWithLength:256 type:JavaLangByte_class_()];
    JreStrongAssignAndConsume((id *)&qword_100560880, v3);
    for (uint64_t i = -128; i != 128; ++i)
    {
      uint64_t v5 = qword_100560880;
      uint64_t v6 = [JavaLangByte alloc];
      v6->value_ = i;
      IOSObjectArray_SetAndConsume(v5, i + 128, v6);
    }
    atomic_store(1u, (unsigned __int8 *)JavaLangByte__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FE970;
}

@end