@interface JavaUtilIdentityHashMap_IdentityHashMapIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilIdentityHashMap_IdentityHashMapIterator)initWithJavaUtilMapEntry_Type:(id)a3 withJavaUtilIdentityHashMap:(id)a4;
- (id)next;
- (void)checkConcurrentMod;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilIdentityHashMap_IdentityHashMapIterator

- (JavaUtilIdentityHashMap_IdentityHashMapIterator)initWithJavaUtilMapEntry_Type:(id)a3 withJavaUtilIdentityHashMap:(id)a4
{
  return self;
}

- (BOOL)hasNext
{
  associatedMap = self->associatedMap_;
  if (!associatedMap) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t position = self->position_;
  while (1)
  {
    elementData = associatedMap->elementData_;
    if (!elementData) {
      goto LABEL_11;
    }
    int size = elementData->super.size_;
    if ((int)position >= size) {
      break;
    }
    if ((position & 0x80000000) != 0) {
      IOSArray_throwOutOfBoundsWithMsg(elementData->super.size_, position);
    }
    if ((&elementData->elementType_)[(int)position]) {
      break;
    }
    uint64_t position = (self->position_ + 2);
    self->position_ = position;
    associatedMap = self->associatedMap_;
    if (!associatedMap) {
      goto LABEL_11;
    }
  }
  return (int)position < size;
}

- (void)checkConcurrentMod
{
  associatedMap = self->associatedMap_;
  if (!associatedMap) {
    JreThrowNullPointerException();
  }
  if (self->expectedModCount_ != associatedMap->modCount_)
  {
    v3 = new_JavaUtilConcurrentModificationException_init();
    objc_exception_throw(v3);
  }
}

- (id)next
{
  [(JavaUtilIdentityHashMap_IdentityHashMapIterator *)self checkConcurrentMod];
  if (![(JavaUtilIdentityHashMap_IdentityHashMapIterator *)self hasNext])
  {
    v7 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v7);
  }
  associatedMap = self->associatedMap_;
  if (!associatedMap
    || (v4 = sub_10026E7CC(associatedMap, self->position_),
        int position = self->position_,
        self->position_ = position + 2,
        self->lastPosition_ = position,
        self->canRemove_ = 1,
        (type = self->type_) == 0))
  {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMapEntry_Type *)type getWithJavaUtilMapEntry:v4];
}

- (void)remove
{
  [(JavaUtilIdentityHashMap_IdentityHashMapIterator *)self checkConcurrentMod];
  if (!self->canRemove_)
  {
    v7 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v7);
  }
  self->canRemove_ = 0;
  associatedMap = self->associatedMap_;
  if (!associatedMap || (elementData = associatedMap->elementData_) == 0) {
    JreThrowNullPointerException();
  }
  int lastPosition = self->lastPosition_;
  uint64_t size = elementData->super.size_;
  if (lastPosition < 0 || lastPosition >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, lastPosition);
  }
  [(JavaUtilIdentityHashMap *)self->associatedMap_ removeWithId:(&elementData->elementType_)[lastPosition]];
  self->position_ = self->lastPosition_;
  ++self->expectedModCount_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilIdentityHashMap_IdentityHashMapIterator;
  [(JavaUtilIdentityHashMap_IdentityHashMapIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004739F8;
}

@end