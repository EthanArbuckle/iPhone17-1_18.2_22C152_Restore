@interface JavaUtilPriorityQueue
+ (const)__metadata;
- (BOOL)offerWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilPriorityQueue)init;
- (JavaUtilPriorityQueue)initWithInt:(int)a3;
- (JavaUtilPriorityQueue)initWithInt:(int)a3 withJavaUtilComparator:(id)a4;
- (JavaUtilPriorityQueue)initWithJavaUtilCollection:(id)a3;
- (JavaUtilPriorityQueue)initWithJavaUtilPriorityQueue:(id)a3;
- (JavaUtilPriorityQueue)initWithJavaUtilSortedSet:(id)a3;
- (id)comparator;
- (id)iterator;
- (id)newElementArrayWithInt:(int)a3;
- (id)peek;
- (id)poll;
- (int)compareWithId:(id)a3 withId:(id)a4;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
- (void)dealloc;
- (void)getFromPriorityQueueWithJavaUtilPriorityQueue:(id)a3;
- (void)getFromSortedSetWithJavaUtilSortedSet:(id)a3;
- (void)growToSizeWithInt:(int)a3;
- (void)initSizeWithJavaUtilCollection:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)removeAtWithInt:(int)a3;
- (void)siftDownWithInt:(int)a3;
- (void)siftUpWithInt:(int)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilPriorityQueue

- (JavaUtilPriorityQueue)init
{
  return self;
}

- (JavaUtilPriorityQueue)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilPriorityQueue)initWithInt:(int)a3 withJavaUtilComparator:(id)a4
{
  return self;
}

- (JavaUtilPriorityQueue)initWithJavaUtilCollection:(id)a3
{
  return self;
}

- (JavaUtilPriorityQueue)initWithJavaUtilPriorityQueue:(id)a3
{
  return self;
}

- (JavaUtilPriorityQueue)initWithJavaUtilSortedSet:(id)a3
{
  return self;
}

- (id)iterator
{
  v3 = [JavaUtilPriorityQueue_PriorityIterator alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->currentIndex_ = -1;
  v3->allowRemove_ = 0;
  return v3;
}

- (int)size
{
  return self->size_;
}

- (void)clear
{
  self->size_ = 0;
}

- (BOOL)offerWithId:(id)a3
{
  if (!a3)
  {
    v8 = new_JavaLangNullPointerException_initWithNSString_(@"o == null");
    objc_exception_throw(v8);
  }
  sub_1001C1F9C((id *)&self->super.super.super.isa, self->size_ + 1);
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)elements, self->size_, a3);
  uint64_t size = self->size_;
  self->size_ = size + 1;
  sub_1001C2048((uint64_t)self, size);
  return 1;
}

- (id)poll
{
  if ([(JavaUtilAbstractCollection *)self isEmpty]) {
    return 0;
  }
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  uint64_t size = elements->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  elementType = elements->elementType_;
  sub_1001C220C((uint64_t)self, 0);
  return elementType;
}

- (id)peek
{
  if ([(JavaUtilAbstractCollection *)self isEmpty]) {
    return 0;
  }
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  uint64_t size = elements->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  return elements->elementType_;
}

- (id)comparator
{
  return self->comparator_;
}

- (BOOL)removeWithId:(id)a3
{
  if (!a3 || self->size_ < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    elements = self->elements_;
    if (!elements) {
      JreThrowNullPointerException();
    }
    uint64_t size = elements->super.size_;
    if (v5 >= size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v5);
    }
    if ([a3 isEqual:(&elements->elementType_)[v5]]) {
      break;
    }
    if (++v5 >= self->size_) {
      return 0;
    }
  }
  sub_1001C220C((uint64_t)self, v5);
  return 1;
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    goto LABEL_7;
  }
  [a3 defaultReadObject];
  p_elements = (uint64_t *)&self->elements_;
  v6 = sub_1001C2580((int)[a3 readInt]);
  JreStrongAssign((id *)&self->elements_, v6);
  if (self->size_ >= 1)
  {
    uint64_t v7 = 0;
    while (*p_elements)
    {
      IOSObjectArray_Set(*p_elements, v7++, [a3 readObject]);
      if (v7 >= self->size_) {
        return;
      }
    }
LABEL_7:
    JreThrowNullPointerException();
  }
}

- (id)newElementArrayWithInt:(int)a3
{
  return sub_1001C2580(a3);
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3 || ([a3 defaultWriteObject], (elements = self->elements_) == 0)) {
    JreThrowNullPointerException();
  }
  [a3 writeIntWithInt:elements->super.size_];
  if (self->size_ >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = self->elements_;
      uint64_t size = v7->super.size_;
      if (v6 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      [a3 writeObjectWithId:(&v7->elementType_)[v6++]];
    }
    while (v6 < self->size_);
  }
}

- (void)getFromPriorityQueueWithJavaUtilPriorityQueue:(id)a3
{
}

- (void)getFromSortedSetWithJavaUtilSortedSet:(id)a3
{
}

- (void)removeAtWithInt:(int)a3
{
}

- (int)compareWithId:(id)a3 withId:(id)a4
{
  return sub_1001C2880((uint64_t)self, a3, (uint64_t)a4);
}

- (void)siftUpWithInt:(int)a3
{
}

- (void)siftDownWithInt:(int)a3
{
}

- (void)initSizeWithJavaUtilCollection:(id)a3
{
}

- (void)growToSizeWithInt:(int)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilPriorityQueue;
  [(JavaUtilPriorityQueue *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100421800;
}

@end