@interface JavaLangThread_StateEnum
+ (const)__metadata;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaLangThread_StateEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation JavaLangThread_StateEnum

- (JavaLangThread_StateEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaLangThread_StateEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaLangThread_StateEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"NEW", 0);
    JavaLangThread_StateEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaLangThread_StateEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"RUNNABLE", 1);
    qword_100564AC8 = (uint64_t)v3;
    v4 = [JavaLangThread_StateEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"BLOCKED", 2);
    qword_100564AD0 = (uint64_t)v4;
    v5 = [JavaLangThread_StateEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"WAITING", 3);
    qword_100564AD8 = (uint64_t)v5;
    v6 = [JavaLangThread_StateEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"TIMED_WAITING", 4);
    qword_100564AE0 = (uint64_t)v6;
    v7 = [JavaLangThread_StateEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v7, @"TERMINATED", 5);
    qword_100564AE8 = (uint64_t)v7;
    atomic_store(1u, (unsigned __int8 *)JavaLangThread_StateEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047F008;
}

@end