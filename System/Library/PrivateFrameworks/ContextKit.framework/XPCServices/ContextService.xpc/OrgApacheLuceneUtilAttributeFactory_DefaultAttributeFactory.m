@interface OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory
- (OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory)init;
- (id)createAttributeInstanceWithIOSClass:(id)a3;
- (id)findImplClassWithIOSClass:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory

- (OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory)init
{
  return self;
}

- (id)createAttributeInstanceWithIOSClass:(id)a3
{
  constructors = self->constructors_;
  if (!constructors
    || (id v4 = [(OrgLukhnosPortmobileLangClassValue *)constructors getWithIOSClass:a3]) == 0)
  {
    JreThrowNullPointerException();
  }
  id v5 = [v4 invokeExact];
  objc_opt_class();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v5;
}

- (id)findImplClassWithIOSClass:(id)a3
{
  return sub_1000CE184(a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory;
  [(OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory *)&v3 dealloc];
}

@end