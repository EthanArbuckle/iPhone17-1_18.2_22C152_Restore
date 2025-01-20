@interface JavaLangShort
+ (const)__metadata;
+ (id)decodeWithNSString:(id)a3;
+ (id)toStringWithShort:(signed __int16)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (id)valueOfWithNSString:(id)a3 withInt:(int)a4;
+ (id)valueOfWithShort:(signed __int16)a3;
+ (int)compareWithShort:(signed __int16)a3 withShort:(signed __int16)a4;
+ (signed)parseShortWithNSString:(id)a3;
+ (signed)parseShortWithNSString:(id)a3 withInt:(int)a4;
+ (signed)reverseBytesWithShort:(signed __int16)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaLangShort)initWithNSString:(id)a3;
- (JavaLangShort)initWithShort:(signed __int16)a3;
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

@implementation JavaLangShort

- (JavaLangShort)initWithNSString:(id)a3
{
  self->value_ = JavaLangShort_parseShortWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  return self;
}

- (JavaLangShort)initWithShort:(signed __int16)a3
{
  self->value_ = a3;
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
  int v6 = *((__int16 *)a3 + 4);
  if ((atomic_load_explicit(JavaLangShort__initialized, memory_order_acquire) & 1) == 0) {
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

+ (int)compareWithShort:(signed __int16)a3 withShort:(signed __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  if ((atomic_load_explicit(JavaLangShort__initialized, memory_order_acquire) & 1) == 0) {
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
  return JavaLangShort_decodeWithNSString_(a3);
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
  return *((unsigned __int16 *)a3 + 4) == (unsigned __int16)self->value_;
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

+ (signed)parseShortWithNSString:(id)a3
{
  return JavaLangShort_parseShortWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (signed)parseShortWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangShort_parseShortWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

- (signed)shortValue
{
  return self->value_;
}

- (NSString)description
{
  return JavaLangInteger_toStringWithInt_(self->value_);
}

+ (id)toStringWithShort:(signed __int16)a3
{
  return JavaLangShort_toStringWithShort_(a3);
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaLangShort_valueOfWithNSString_(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)valueOfWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangShort_valueOfWithNSString_withInt_(a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (signed)reverseBytesWithShort:(signed __int16)a3
{
  return JavaLangShort_reverseBytesWithShort_(a3);
}

+ (id)valueOfWithShort:(signed __int16)a3
{
  return JavaLangShort_valueOfWithShort_(a3);
}

- (const)objCType
{
  return "s";
}

- (void)getValue:(void *)a3
{
  *(_WORD *)a3 = self->value_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_msgSend((id)IOSClass_arrayType((uint64_t)+[IOSClass shortClass](IOSClass, "shortClass"), 1u), "getComponentType");
    objc_opt_class();
    if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    JreStrongAssign(&JavaLangShort_TYPE_, v2);
    id v3 = +[IOSObjectArray newArrayWithLength:256 type:JavaLangShort_class_()];
    JreStrongAssignAndConsume((id *)&qword_100561168, v3);
    for (uint64_t i = -128; i != 128; ++i)
    {
      uint64_t v5 = qword_100561168;
      uint64_t v6 = [JavaLangShort alloc];
      v6->value_ = i;
      IOSObjectArray_SetAndConsume(v5, i + 128, v6);
    }
    atomic_store(1u, (unsigned __int8 *)JavaLangShort__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045D3C8;
}

@end