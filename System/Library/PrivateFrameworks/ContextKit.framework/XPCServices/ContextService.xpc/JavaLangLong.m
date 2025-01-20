@interface JavaLangLong
+ (const)__metadata;
+ (id)decodeWithNSString:(id)a3;
+ (id)getLongWithNSString:(id)a3;
+ (id)getLongWithNSString:(id)a3 withJavaLangLong:(id)a4;
+ (id)getLongWithNSString:(id)a3 withLong:(int64_t)a4;
+ (id)invalidLongWithNSString:(id)a3;
+ (id)toBinaryStringWithLong:(int64_t)a3;
+ (id)toHexStringWithLong:(int64_t)a3;
+ (id)toOctalStringWithLong:(int64_t)a3;
+ (id)toStringWithLong:(int64_t)a3;
+ (id)toStringWithLong:(int64_t)a3 withInt:(int)a4;
+ (id)valueOfWithLong:(int64_t)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (id)valueOfWithNSString:(id)a3 withInt:(int)a4;
+ (int)bitCountWithLong:(int64_t)a3;
+ (int)compareWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (int)numberOfLeadingZerosWithLong:(int64_t)a3;
+ (int)numberOfTrailingZerosWithLong:(int64_t)a3;
+ (int)signumWithLong:(int64_t)a3;
+ (int64_t)highestOneBitWithLong:(int64_t)a3;
+ (int64_t)lowestOneBitWithLong:(int64_t)a3;
+ (int64_t)parseLongWithNSString:(id)a3;
+ (int64_t)parseLongWithNSString:(id)a3 withInt:(int)a4;
+ (int64_t)parsePositiveLongWithNSString:(id)a3;
+ (int64_t)parsePositiveLongWithNSString:(id)a3 withInt:(int)a4;
+ (int64_t)parseWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
+ (int64_t)reverseBytesWithLong:(int64_t)a3;
+ (int64_t)reverseWithLong:(int64_t)a3;
+ (int64_t)rotateLeftWithLong:(int64_t)a3 withInt:(int)a4;
+ (int64_t)rotateRightWithLong:(int64_t)a3 withInt:(int)a4;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaLangLong)initWithLong:(int64_t)a3;
- (JavaLangLong)initWithNSString:(id)a3;
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

@implementation JavaLangLong

- (JavaLangLong)initWithLong:(int64_t)a3
{
  self->value_ = a3;
  return self;
}

- (JavaLangLong)initWithNSString:(id)a3
{
  self->value_ = JavaLangLong_parseLongWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
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
  int64_t value = self->value_;
  int64_t v6 = *((void *)a3 + 1);
  if ((atomic_load_explicit(JavaLangLong__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (value < v6) {
    return -1;
  }
  else {
    return value != v6;
  }
}

+ (int)compareWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if ((atomic_load_explicit(JavaLangLong__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (a3 < a4) {
    return -1;
  }
  else {
    return a3 != a4;
  }
}

+ (id)invalidLongWithNSString:(id)a3
{
  sub_1002057B4((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)decodeWithNSString:(id)a3
{
  JavaLangLong_decodeWithNSString_(a3);
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
  return *((void *)a3 + 1) == self->value_;
}

- (float)floatValue
{
  return (float)self->value_;
}

+ (id)getLongWithNSString:(id)a3
{
  JavaLangLong_getLongWithNSString_(a3);
  return result;
}

+ (id)getLongWithNSString:(id)a3 withLong:(int64_t)a4
{
  JavaLangLong_getLongWithNSString_withLong_(a3, a4);
  return result;
}

+ (id)getLongWithNSString:(id)a3 withJavaLangLong:(id)a4
{
  return (id)JavaLangLong_getLongWithNSString_withJavaLangLong_(a3, (uint64_t)a4);
}

- (unint64_t)hash
{
  return (uint64_t)(self->value_ & 0xFFFFFFFF00000000 ^ (self->value_ << 32)) >> 32;
}

- (int)intValue
{
  return self->value_;
}

- (int64_t)longLongValue
{
  return self->value_;
}

+ (int64_t)parseLongWithNSString:(id)a3
{
  return JavaLangLong_parseLongWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (int64_t)parseLongWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangLong_parseLongWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (int64_t)parseWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
  return sub_100205DA4(a3, *(uint64_t *)&a4, a5, a6);
}

+ (int64_t)parsePositiveLongWithNSString:(id)a3
{
  return JavaLangLong_parsePositiveLongWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (int64_t)parsePositiveLongWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangLong_parsePositiveLongWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

- (signed)shortValue
{
  return self->value_;
}

+ (id)toBinaryStringWithLong:(int64_t)a3
{
  return JavaLangLong_toBinaryStringWithLong_(a3);
}

+ (id)toHexStringWithLong:(int64_t)a3
{
  return JavaLangLong_toHexStringWithLong_(a3);
}

+ (id)toOctalStringWithLong:(int64_t)a3
{
  return JavaLangLong_toOctalStringWithLong_(a3);
}

- (NSString)description
{
  return (NSString *)JavaLangLong_toStringWithLong_(self->value_);
}

+ (id)toStringWithLong:(int64_t)a3
{
  return (id)JavaLangLong_toStringWithLong_(a3);
}

+ (id)toStringWithLong:(int64_t)a3 withInt:(int)a4
{
  return (id)JavaLangLong_toStringWithLong_withInt_(a3, a4);
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaLangLong_valueOfWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)valueOfWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangLong_valueOfWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (int64_t)highestOneBitWithLong:(int64_t)a3
{
  return JavaLangLong_highestOneBitWithLong_(a3);
}

+ (int64_t)lowestOneBitWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(JavaLangLong__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return -a3 & a3;
}

+ (int)numberOfLeadingZerosWithLong:(int64_t)a3
{
  return JavaLangLong_numberOfLeadingZerosWithLong_(a3);
}

+ (int)numberOfTrailingZerosWithLong:(int64_t)a3
{
  return JavaLangLong_numberOfTrailingZerosWithLong_(a3);
}

+ (int)bitCountWithLong:(int64_t)a3
{
  return JavaLangLong_bitCountWithLong_(a3);
}

+ (int64_t)rotateLeftWithLong:(int64_t)a3 withInt:(int)a4
{
  char v4 = a4;
  if ((atomic_load_explicit(JavaLangLong__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return __ROR8__(a3, -v4);
}

+ (int64_t)rotateRightWithLong:(int64_t)a3 withInt:(int)a4
{
  char v4 = a4;
  if ((atomic_load_explicit(JavaLangLong__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return __ROR8__(a3, v4);
}

+ (int64_t)reverseBytesWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(JavaLangLong__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return bswap64(a3);
}

+ (int64_t)reverseWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(JavaLangLong__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return __rbit64(a3);
}

+ (int)signumWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(JavaLangLong__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (a3 < 0) {
    return -1;
  }
  else {
    return a3 != 0;
  }
}

+ (id)valueOfWithLong:(int64_t)a3
{
  return JavaLangLong_valueOfWithLong_(a3);
}

- (const)objCType
{
  return "q";
}

- (void)getValue:(void *)a3
{
  *(void *)a3 = self->value_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_msgSend((id)IOSClass_arrayType((uint64_t)+[IOSClass longClass](IOSClass, "longClass"), 1u), "getComponentType");
    objc_opt_class();
    if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    JreStrongAssign(&JavaLangLong_TYPE_, v2);
    id v3 = +[IOSObjectArray newArrayWithLength:256 type:JavaLangLong_class_()];
    JreStrongAssignAndConsume((id *)&qword_100560E60, v3);
    for (uint64_t i = -128; i != 128; ++i)
    {
      uint64_t v5 = qword_100560E60;
      uint64_t v6 = [JavaLangLong alloc];
      v6->value_ = i;
      IOSObjectArray_SetAndConsume(v5, i + 128, v6);
    }
    atomic_store(1u, (unsigned __int8 *)JavaLangLong__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100443520;
}

@end