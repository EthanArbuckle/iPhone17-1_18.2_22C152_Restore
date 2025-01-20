@interface JavaLangAnnotationRetentionPolicyEnum
+ (const)__metadata;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaLangAnnotationRetentionPolicyEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation JavaLangAnnotationRetentionPolicyEnum

- (JavaLangAnnotationRetentionPolicyEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaLangAnnotationRetentionPolicyEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaLangAnnotationRetentionPolicyEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"SOURCE", 0);
    JavaLangAnnotationRetentionPolicyEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaLangAnnotationRetentionPolicyEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"CLASS", 1);
    qword_100563AF0 = (uint64_t)v3;
    v4 = [JavaLangAnnotationRetentionPolicyEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"RUNTIME", 2);
    qword_100563AF8 = (uint64_t)v4;
    atomic_store(1u, (unsigned __int8 *)JavaLangAnnotationRetentionPolicyEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FB040;
}

@end