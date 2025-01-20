@interface JavaUtilAbstractMap_1AbstractMapKeySet_$1
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilAbstractMap_1AbstractMapKeySet_$1)initWithJavaUtilAbstractMap_1AbstractMapKeySet:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilAbstractMap_1AbstractMapKeySet_$1

- (BOOL)hasNext
{
  setIterator = self->setIterator_;
  if (!setIterator) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilIterator *)setIterator hasNext];
}

- (id)next
{
  setIterator = self->setIterator_;
  if (!setIterator || (id v3 = [(JavaUtilIterator *)setIterator next]) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 getKey];
}

- (void)remove
{
  setIterator = self->setIterator_;
  if (!setIterator) {
    JreThrowNullPointerException();
  }
  [(JavaUtilIterator *)setIterator remove];
}

- (JavaUtilAbstractMap_1AbstractMapKeySet_$1)initWithJavaUtilAbstractMap_1AbstractMapKeySet:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilAbstractMap_1AbstractMapKeySet__1;
  [(JavaUtilAbstractMap_1AbstractMapKeySet_$1 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040CAC8;
}

@end