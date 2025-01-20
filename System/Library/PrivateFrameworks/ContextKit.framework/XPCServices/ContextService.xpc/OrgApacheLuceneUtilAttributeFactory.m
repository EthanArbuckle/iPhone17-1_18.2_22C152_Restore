@interface OrgApacheLuceneUtilAttributeFactory
+ (id)findAttributeImplCtorWithIOSClass:(id)a3;
+ (id)getStaticImplementationWithOrgApacheLuceneUtilAttributeFactory:(id)a3 withIOSClass:(id)a4;
+ (void)initialize;
+ (void)rethrowWithJavaLangThrowable:(id)a3;
@end

@implementation OrgApacheLuceneUtilAttributeFactory

+ (id)findAttributeImplCtorWithIOSClass:(id)a3
{
  return OrgApacheLuceneUtilAttributeFactory_findAttributeImplCtorWithIOSClass_((uint64_t)a3);
}

+ (id)getStaticImplementationWithOrgApacheLuceneUtilAttributeFactory:(id)a3 withIOSClass:(id)a4
{
  return OrgApacheLuceneUtilAttributeFactory_getStaticImplementationWithOrgApacheLuceneUtilAttributeFactory_withIOSClass_(a3, a4);
}

+ (void)rethrowWithJavaLangThrowable:(id)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgLukhnosPortmobileInvokeMethodHandles_publicLookup();
    JreStrongAssign((id *)&qword_1005602F8, v2);
    v3 = OrgLukhnosPortmobileInvokeMethodType_methodTypeWithIOSClass_(+[IOSClass voidClass]);
    JreStrongAssign((id *)&qword_100560300, v3);
    v4 = (void *)OrgApacheLuceneUtilAttributeImpl_class_();
    v5 = OrgLukhnosPortmobileInvokeMethodType_methodTypeWithIOSClass_(v4);
    JreStrongAssign((id *)&qword_100560308, v5);
    v6 = [OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory alloc];
    sub_1000CE068((id *)&v6->super.super.isa);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilAttributeFactory_DEFAULT_ATTRIBUTE_FACTORY_, v6);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilAttributeFactory__initialized);
  }
}

@end