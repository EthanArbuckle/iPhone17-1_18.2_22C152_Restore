@interface OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory_$1
- (OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory_$1)initWithOrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory:(id)a3;
- (id)computeValueWithIOSClass:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory_$1

- (id)computeValueWithIOSClass:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v3 = [a3 asSubclass:OrgApacheLuceneUtilAttribute_class_()];
  id v4 = sub_1000CE184(v3);
  return OrgApacheLuceneUtilAttributeFactory_findAttributeImplCtorWithIOSClass_((uint64_t)v4);
}

- (OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory_$1)initWithOrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAttributeFactory_DefaultAttributeFactory__1;
  [(OrgLukhnosPortmobileLangClassValue *)&v3 dealloc];
}

@end