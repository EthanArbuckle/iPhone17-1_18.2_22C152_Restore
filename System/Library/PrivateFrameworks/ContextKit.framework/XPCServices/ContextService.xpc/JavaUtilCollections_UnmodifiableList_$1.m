@interface JavaUtilCollections_UnmodifiableList_$1
+ (const)__metadata;
- (BOOL)hasNext;
- (BOOL)hasPrevious;
- (JavaUtilCollections_UnmodifiableList_$1)initWithJavaUtilCollections_UnmodifiableList:(id)a3 withInt:(int)a4;
- (id)next;
- (id)previous;
- (int)nextIndex;
- (int)previousIndex;
- (void)addWithId:(id)a3;
- (void)dealloc;
- (void)remove;
- (void)setWithId:(id)a3;
@end

@implementation JavaUtilCollections_UnmodifiableList_$1

- (void)addWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)hasNext
{
  iterator = self->iterator_;
  if (!iterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)iterator hasNext];
}

- (BOOL)hasPrevious
{
  iterator = self->iterator_;
  if (!iterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)iterator hasPrevious];
}

- (id)next
{
  iterator = self->iterator_;
  if (!iterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)iterator next];
}

- (int)nextIndex
{
  iterator = self->iterator_;
  if (!iterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)iterator nextIndex];
}

- (id)previous
{
  iterator = self->iterator_;
  if (!iterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)iterator previous];
}

- (int)previousIndex
{
  iterator = self->iterator_;
  if (!iterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)iterator previousIndex];
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (void)setWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (JavaUtilCollections_UnmodifiableList_$1)initWithJavaUtilCollections_UnmodifiableList:(id)a3 withInt:(int)a4
{
  self->val$location_ = a4;
  v5 = (void *)*((void *)a3 + 2);
  if (!v5) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&self->iterator_, [v5 listIteratorWithInt:*(void *)&a4]);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableList__1;
  [(JavaUtilCollections_UnmodifiableList_$1 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100429460;
}

@end