@interface OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3 withIOSClass:(id)a4;
- (id)createAttributeInstanceWithIOSClass:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory

- (OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (id)createAttributeInstanceWithIOSClass:(id)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  if ([a3 isAssignableFrom:self->clazz_])
  {
    return [(OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory *)self createInstance];
  }
  delegate = self->delegate_;
  if (!delegate) {
LABEL_10:
  }
    JreThrowNullPointerException();
  return [(OrgApacheLuceneUtilAttributeFactory *)delegate createAttributeInstanceWithIOSClass:a3];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3 {
         && (id v5 = [a3 getClass],
  }
             v5 == [(OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory *)self getClass]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    delegate = self->delegate_;
    if (!delegate) {
      JreThrowNullPointerException();
    }
    unsigned int v6 = [(OrgApacheLuceneUtilAttributeFactory *)delegate isEqual:*((void *)a3 + 1)];
    if (v6) {
      LOBYTE(v6) = self->clazz_ == (IOSClass *)*((void *)a3 + 2);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  delegate = self->delegate_;
  if (!delegate
    || (unsigned int v4 = [(OrgApacheLuceneUtilAttributeFactory *)delegate hash], (clazz = self->clazz_) == 0))
  {
    JreThrowNullPointerException();
  }
  return (int)([(IOSClass *)clazz hash] - v4 + 32 * v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory;
  [(OrgApacheLuceneUtilAttributeFactory_StaticImplementationAttributeFactory *)&v3 dealloc];
}

@end