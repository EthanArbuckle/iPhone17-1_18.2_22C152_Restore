@interface JavaMathRoundingModeEnum
+ (const)__metadata;
+ (id)valueOfWithInt:(int)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaMathRoundingModeEnum)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5;
@end

@implementation JavaMathRoundingModeEnum

- (JavaMathRoundingModeEnum)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5
{
  *(&self->super.ordinal_ + 1) = a3;
  return self;
}

+ (id)valueOfWithInt:(int)a3
{
  return (id)JavaMathRoundingModeEnum_valueOfWithInt_(a3);
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaMathRoundingModeEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaMathRoundingModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"UP", 0);
    *(&v2->super.ordinal_ + 1) = 0;
    JavaMathRoundingModeEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaMathRoundingModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"DOWN", 1);
    *(&v3->super.ordinal_ + 1) = 1;
    qword_100563C98 = (uint64_t)v3;
    v4 = [JavaMathRoundingModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"CEILING", 2);
    *(&v4->super.ordinal_ + 1) = 2;
    qword_100563CA0 = (uint64_t)v4;
    v5 = [JavaMathRoundingModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"FLOOR", 3);
    *(&v5->super.ordinal_ + 1) = 3;
    qword_100563CA8 = (uint64_t)v5;
    v6 = [JavaMathRoundingModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"HALF_UP", 4);
    *(&v6->super.ordinal_ + 1) = 4;
    qword_100563CB0 = (uint64_t)v6;
    v7 = [JavaMathRoundingModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v7, @"HALF_DOWN", 5);
    *(&v7->super.ordinal_ + 1) = 5;
    qword_100563CB8 = (uint64_t)v7;
    v8 = [JavaMathRoundingModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v8, @"HALF_EVEN", 6);
    *(&v8->super.ordinal_ + 1) = 6;
    qword_100563CC0 = (uint64_t)v8;
    v9 = [JavaMathRoundingModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v9, @"UNNECESSARY", 7);
    *(&v9->super.ordinal_ + 1) = 7;
    qword_100563CC8 = (uint64_t)v9;
    atomic_store(1u, (unsigned __int8 *)JavaMathRoundingModeEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100414570;
}

@end