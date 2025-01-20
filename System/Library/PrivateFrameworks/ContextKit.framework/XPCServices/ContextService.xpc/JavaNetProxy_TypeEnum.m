@interface JavaNetProxy_TypeEnum
+ (const)__metadata;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaNetProxy_TypeEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation JavaNetProxy_TypeEnum

- (JavaNetProxy_TypeEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaNetProxy_TypeEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaNetProxy_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"DIRECT", 0);
    JavaNetProxy_TypeEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaNetProxy_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"HTTP", 1);
    qword_100563D68 = (uint64_t)v3;
    v4 = [JavaNetProxy_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"SOCKS", 2);
    qword_100563D70 = (uint64_t)v4;
    atomic_store(1u, (unsigned __int8 *)JavaNetProxy_TypeEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100419EB0;
}

@end