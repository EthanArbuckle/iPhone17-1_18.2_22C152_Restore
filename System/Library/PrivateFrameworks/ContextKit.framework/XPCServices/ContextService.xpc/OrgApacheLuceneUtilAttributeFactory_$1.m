@interface OrgApacheLuceneUtilAttributeFactory_$1
- (OrgApacheLuceneUtilAttributeFactory_$1)initWithOrgLukhnosPortmobileInvokeMethodHandle:(id)a3 withOrgApacheLuceneUtilAttributeFactory:(id)a4 withIOSClass:(id)a5;
- (id)createInstance;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAttributeFactory_$1

- (id)createInstance
{
  v2 = self->val$constr_;
  if (!v2) {
    JreThrowNullPointerException();
  }
  id v3 = [(OrgLukhnosPortmobileInvokeMethodHandle *)v2 invokeExact];
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v3;
}

- (OrgApacheLuceneUtilAttributeFactory_$1)initWithOrgLukhnosPortmobileInvokeMethodHandle:(id)a3 withOrgApacheLuceneUtilAttributeFactory:(id)a4 withIOSClass:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAttributeFactory__1;
  [(OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory *)&v3 dealloc];
}

@end