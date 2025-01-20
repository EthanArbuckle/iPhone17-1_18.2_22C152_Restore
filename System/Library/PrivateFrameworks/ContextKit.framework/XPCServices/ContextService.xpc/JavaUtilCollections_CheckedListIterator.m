@interface JavaUtilCollections_CheckedListIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (BOOL)hasPrevious;
- (JavaUtilCollections_CheckedListIterator)initWithJavaUtilListIterator:(id)a3 withIOSClass:(id)a4;
- (id)next;
- (id)previous;
- (int)nextIndex;
- (int)previousIndex;
- (void)addWithId:(id)a3;
- (void)dealloc;
- (void)remove;
- (void)setWithId:(id)a3;
@end

@implementation JavaUtilCollections_CheckedListIterator

- (JavaUtilCollections_CheckedListIterator)initWithJavaUtilListIterator:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (BOOL)hasNext
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)i hasNext];
}

- (id)next
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)i next];
}

- (void)remove
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  [(JavaUtilListIterator *)i remove];
}

- (BOOL)hasPrevious
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)i hasPrevious];
}

- (id)previous
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)i previous];
}

- (int)nextIndex
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)i nextIndex];
}

- (int)previousIndex
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilListIterator *)i previousIndex];
}

- (void)setWithId:(id)a3
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  JavaUtilCollections_checkTypeWithId_withIOSClass_(a3, self->type_);
  [(JavaUtilListIterator *)i setWithId:a3];
}

- (void)addWithId:(id)a3
{
  i = self->i_;
  if (!i) {
    JreThrowNullPointerException();
  }
  JavaUtilCollections_checkTypeWithId_withIOSClass_(a3, self->type_);
  [(JavaUtilListIterator *)i addWithId:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_CheckedListIterator;
  [(JavaUtilCollections_CheckedListIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042B1E0;
}

@end