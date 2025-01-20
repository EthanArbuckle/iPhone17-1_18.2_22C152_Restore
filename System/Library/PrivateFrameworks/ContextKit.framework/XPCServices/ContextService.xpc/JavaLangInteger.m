@interface JavaLangInteger
+ (const)__metadata;
+ (id)decodeWithNSString:(id)a3;
+ (id)getIntegerWithNSString:(id)a3;
+ (id)getIntegerWithNSString:(id)a3 withInt:(int)a4;
+ (id)getIntegerWithNSString:(id)a3 withJavaLangInteger:(id)a4;
+ (id)invalidIntWithNSString:(id)a3;
+ (id)toBinaryStringWithInt:(int)a3;
+ (id)toHexStringWithInt:(int)a3;
+ (id)toOctalStringWithInt:(int)a3;
+ (id)toStringWithInt:(int)a3;
+ (id)toStringWithInt:(int)a3 withInt:(int)a4;
+ (id)valueOfWithInt:(int)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (id)valueOfWithNSString:(id)a3 withInt:(int)a4;
+ (int)bitCountWithInt:(int)a3;
+ (int)compareWithInt:(int)a3 withInt:(int)a4;
+ (int)highestOneBitWithInt:(int)a3;
+ (int)lowestOneBitWithInt:(int)a3;
+ (int)numberOfLeadingZerosWithInt:(int)a3;
+ (int)numberOfTrailingZerosWithInt:(int)a3;
+ (int)parseIntWithNSString:(id)a3;
+ (int)parseIntWithNSString:(id)a3 withInt:(int)a4;
+ (int)parseWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
+ (int)reverseBytesWithInt:(int)a3;
+ (int)reverseWithInt:(int)a3;
+ (int)rotateLeftWithInt:(int)a3 withInt:(int)a4;
+ (int)rotateRightWithInt:(int)a3 withInt:(int)a4;
+ (int)signumWithInt:(int)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaLangInteger)initWithInt:(int)a3;
- (JavaLangInteger)initWithNSString:(id)a3;
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

@implementation JavaLangInteger

- (JavaLangInteger)initWithInt:(int)a3
{
  self->value_ = a3;
  return self;
}

- (JavaLangInteger)initWithNSString:(id)a3
{
  self->value_ = JavaLangInteger_parseIntWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
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
  int v6 = *((_DWORD *)a3 + 2);
  if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (value < v6) {
    return -1;
  }
  else {
    return value != v6;
  }
}

+ (int)compareWithInt:(int)a3 withInt:(int)a4
{
  if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (a3 < a4) {
    return -1;
  }
  else {
    return a3 != a4;
  }
}

+ (id)invalidIntWithNSString:(id)a3
{
  sub_10027C530((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)decodeWithNSString:(id)a3
{
  JavaLangInteger_decodeWithNSString_(a3);
  return result;
}

- (double)doubleValue
{
  return (double)self->value_;
}

- (BOOL)isEqual:(id)a3
{
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
  return *((_DWORD *)a3 + 2) == self->value_;
}

- (float)floatValue
{
  return (float)self->value_;
}

+ (id)getIntegerWithNSString:(id)a3
{
  JavaLangInteger_getIntegerWithNSString_(a3);
  return result;
}

+ (id)getIntegerWithNSString:(id)a3 withInt:(int)a4
{
  JavaLangInteger_getIntegerWithNSString_withInt_(a3, a4);
  return result;
}

+ (id)getIntegerWithNSString:(id)a3 withJavaLangInteger:(id)a4
{
  return (id)JavaLangInteger_getIntegerWithNSString_withJavaLangInteger_(a3, (uint64_t)a4);
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

+ (int)parseIntWithNSString:(id)a3
{
  return JavaLangInteger_parseIntWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (int)parseIntWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangInteger_parseIntWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (int)parseWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
  return sub_10027CB10(a3, *(uint64_t *)&a4, a5, a6);
}

- (signed)shortValue
{
  return self->value_;
}

+ (id)toBinaryStringWithInt:(int)a3
{
  return JavaLangInteger_toBinaryStringWithInt_(a3);
}

+ (id)toHexStringWithInt:(int)a3
{
  return JavaLangInteger_toHexStringWithInt_(a3);
}

+ (id)toOctalStringWithInt:(int)a3
{
  return JavaLangInteger_toOctalStringWithInt_(a3);
}

- (NSString)description
{
  return JavaLangInteger_toStringWithInt_(self->value_);
}

+ (id)toStringWithInt:(int)a3
{
  return JavaLangInteger_toStringWithInt_(a3);
}

+ (id)toStringWithInt:(int)a3 withInt:(int)a4
{
  return JavaLangInteger_toStringWithInt_withInt_(a3, a4);
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaLangInteger_valueOfWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)valueOfWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangInteger_valueOfWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (int)highestOneBitWithInt:(int)a3
{
  return JavaLangInteger_highestOneBitWithInt_(a3);
}

+ (int)lowestOneBitWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return -a3 & a3;
}

+ (int)numberOfLeadingZerosWithInt:(int)a3
{
  return JavaLangInteger_numberOfLeadingZerosWithInt_(a3);
}

+ (int)numberOfTrailingZerosWithInt:(int)a3
{
  return JavaLangInteger_numberOfTrailingZerosWithInt_(a3);
}

+ (int)bitCountWithInt:(int)a3
{
  return JavaLangInteger_bitCountWithInt_(a3);
}

+ (int)rotateLeftWithInt:(int)a3 withInt:(int)a4
{
  char v4 = a4;
  if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return __ROR4__(a3, -v4);
}

+ (int)rotateRightWithInt:(int)a3 withInt:(int)a4
{
  char v4 = a4;
  if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return __ROR4__(a3, v4);
}

+ (int)reverseBytesWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return bswap32(a3);
}

+ (int)reverseWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return __rbit32(a3);
}

+ (int)signumWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (a3 >> 31) | (a3 > 0);
}

+ (id)valueOfWithInt:(int)a3
{
  return JavaLangInteger_valueOfWithInt_(a3);
}

- (const)objCType
{
  return "i";
}

- (void)getValue:(void *)a3
{
  *(_DWORD *)a3 = self->value_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v7[0] = xmmword_100320983;
    v7[1] = unk_100320993;
    v7[2] = xmmword_1003209A3;
    v7[3] = unk_1003209B3;
    JreStrongAssignAndConsume((id *)&qword_100562768, +[IOSByteArray newArrayWithBytes:v7 count:64]);
    id v2 = objc_msgSend((id)IOSClass_arrayType((uint64_t)+[IOSClass intClass](IOSClass, "intClass"), 1u), "getComponentType");
    objc_opt_class();
    if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    JreStrongAssign((id *)&JavaLangInteger_TYPE_, v2);
    id v3 = +[IOSObjectArray newArrayWithLength:256 type:JavaLangInteger_class_()];
    JreStrongAssignAndConsume((id *)&qword_100562770, v3);
    for (uint64_t i = -128; i != 128; ++i)
    {
      uint64_t v5 = qword_100562770;
      uint64_t v6 = [JavaLangInteger alloc];
      v6->value_ = i;
      IOSObjectArray_SetAndConsume(v5, i + 128, v6);
    }
    atomic_store(1u, (unsigned __int8 *)JavaLangInteger__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047A070;
}

@end