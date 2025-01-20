@interface JavaLangTwoEnumerationsInOne
+ (const)__metadata;
- (BOOL)hasMoreElements;
- (JavaLangTwoEnumerationsInOne)initWithJavaUtilEnumeration:(id)a3 withJavaUtilEnumeration:(id)a4;
- (id)nextElement;
- (void)dealloc;
@end

@implementation JavaLangTwoEnumerationsInOne

- (JavaLangTwoEnumerationsInOne)initWithJavaUtilEnumeration:(id)a3 withJavaUtilEnumeration:(id)a4
{
  return self;
}

- (BOOL)hasMoreElements
{
  first = self->first_;
  if (!first) {
    goto LABEL_8;
  }
  if ([(JavaUtilEnumeration *)first hasMoreElements]) {
    return 1;
  }
  second = self->second_;
  if (!second) {
LABEL_8:
  }
    JreThrowNullPointerException();
  return [(JavaUtilEnumeration *)second hasMoreElements];
}

- (id)nextElement
{
  first = self->first_;
  if (!first) {
    goto LABEL_8;
  }
  if ([(JavaUtilEnumeration *)first hasMoreElements])
  {
    second = self->first_;
    goto LABEL_5;
  }
  second = self->second_;
  if (!second) {
LABEL_8:
  }
    JreThrowNullPointerException();
LABEL_5:
  return [(JavaUtilEnumeration *)second nextElement];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangTwoEnumerationsInOne;
  [(JavaLangTwoEnumerationsInOne *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040B218;
}

@end