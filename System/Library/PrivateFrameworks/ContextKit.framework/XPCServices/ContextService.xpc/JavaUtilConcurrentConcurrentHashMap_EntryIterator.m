@interface JavaUtilConcurrentConcurrentHashMap_EntryIterator
+ (const)__metadata;
- (JavaUtilConcurrentConcurrentHashMap_EntryIterator)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilConcurrentConcurrentHashMap:(id)a7;
- (id)next;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_EntryIterator

- (JavaUtilConcurrentConcurrentHashMap_EntryIterator)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilConcurrentConcurrentHashMap:(id)a7
{
  return self;
}

- (id)next
{
  next = self->super.super.next_;
  if (!next)
  {
    v8 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v8);
  }
  id key = next->key_;
  v5 = (void *)atomic_load((unint64_t *)&next->val_);
  JreStrongAssign((id *)&self->super.lastReturned_, next);
  -[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)self);
  v6 = new_JavaUtilConcurrentConcurrentHashMap_MapEntry_initWithId_withId_withJavaUtilConcurrentConcurrentHashMap_(key, v5, self->super.map_);
  return v6;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041FEA0;
}

@end