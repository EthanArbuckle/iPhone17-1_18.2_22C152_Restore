@interface JavaUtilCollections_UnmodifiableCollection_$1
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilCollections_UnmodifiableCollection_$1)initWithJavaUtilCollections_UnmodifiableCollection:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilCollections_UnmodifiableCollection_$1

- (BOOL)hasNext
{
  iterator = self->iterator_;
  if (!iterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilIterator *)iterator hasNext];
}

- (id)next
{
  iterator = self->iterator_;
  if (!iterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilIterator *)iterator next];
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (JavaUtilCollections_UnmodifiableCollection_$1)initWithJavaUtilCollections_UnmodifiableCollection:(id)a3
{
  v4 = (void *)*((void *)a3 + 1);
  if (!v4) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&self->iterator_, [v4 iterator]);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableCollection__1;
  [(JavaUtilCollections_UnmodifiableCollection_$1 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100428CD8;
}

@end