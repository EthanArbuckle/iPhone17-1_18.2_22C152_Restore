@interface JavaUtilFormatter_BigDecimalLayoutFormEnum
+ (const)__metadata;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaUtilFormatter_BigDecimalLayoutFormEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation JavaUtilFormatter_BigDecimalLayoutFormEnum

- (JavaUtilFormatter_BigDecimalLayoutFormEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaUtilFormatter_BigDecimalLayoutFormEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaUtilFormatter_BigDecimalLayoutFormEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"SCIENTIFIC", 0);
    JavaUtilFormatter_BigDecimalLayoutFormEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaUtilFormatter_BigDecimalLayoutFormEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"DECIMAL_FLOAT", 1);
    qword_100563AD0 = (uint64_t)v3;
    atomic_store(1u, (unsigned __int8 *)JavaUtilFormatter_BigDecimalLayoutFormEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F3390;
}

@end