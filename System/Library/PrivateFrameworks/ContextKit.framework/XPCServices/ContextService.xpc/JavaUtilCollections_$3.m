@interface JavaUtilCollections_$3
+ (const)__metadata;
- (BOOL)hasMoreElements;
- (JavaUtilCollections_$3)initWithJavaUtilCollection:(id)a3;
- (id)nextElement;
- (void)dealloc;
@end

@implementation JavaUtilCollections_$3

- (BOOL)hasMoreElements
{
  it = self->it_;
  if (!it) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilIterator *)it hasNext];
}

- (id)nextElement
{
  it = self->it_;
  if (!it) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilIterator *)it next];
}

- (JavaUtilCollections_$3)initWithJavaUtilCollection:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections__3;
  [(JavaUtilCollections_$3 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042CB20;
}

@end