@interface JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_$1
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_$1)initWithJavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_$1

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
  id v3 = [(JavaUtilIterator *)iterator next];
  v4 = [JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_UnmodifiableMapEntry alloc];
  JreStrongAssign((id *)&v4->mapEntry_, v3);
  return v4;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_$1)initWithJavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet:(id)a3
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
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet__1;
  [(JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_$1 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100429E50;
}

@end