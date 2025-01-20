@interface JavaUtilArrayDeque
+ (const)__metadata;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)delete__WithInt:(int)a3;
- (BOOL)isEmpty;
- (BOOL)offerFirstWithId:(id)a3;
- (BOOL)offerLastWithId:(id)a3;
- (BOOL)offerWithId:(id)a3;
- (BOOL)removeFirstOccurrenceWithId:(id)a3;
- (BOOL)removeLastOccurrenceWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilArrayDeque)init;
- (JavaUtilArrayDeque)initWithInt:(int)a3;
- (JavaUtilArrayDeque)initWithJavaUtilCollection:(id)a3;
- (id)clone;
- (id)copyElementsWithNSObjectArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descendingIterator;
- (id)getFirst;
- (id)getLast;
- (id)iterator;
- (id)peek;
- (id)peekFirst;
- (id)peekLast;
- (id)pollFirst;
- (id)pollLast;
- (id)removeFirst;
- (id)removeLast;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addFirstWithId:(id)a3;
- (void)addLastWithId:(id)a3;
- (void)allocateElementsWithInt:(int)a3;
- (void)clear;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilArrayDeque

- (void)allocateElementsWithInt:(int)a3
{
}

- (id)copyElementsWithNSObjectArray:(id)a3
{
  return sub_10025F7CC((uint64_t)self, a3);
}

- (JavaUtilArrayDeque)init
{
  return self;
}

- (JavaUtilArrayDeque)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilArrayDeque)initWithJavaUtilCollection:(id)a3
{
  return self;
}

- (void)addFirstWithId:(id)a3
{
  if (!a3)
  {
    v6 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v6);
  }
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  int v5 = (elements->super.size_ - 1) & (self->head_ - 1);
  self->head_ = v5;
  IOSObjectArray_Set((uint64_t)elements, v5, a3);
  if (self->head_ == self->tail_)
  {
    sub_10025F698((uint64_t)self);
  }
}

- (void)addLastWithId:(id)a3
{
  if (!a3)
  {
    v6 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v6);
  }
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)elements, self->tail_, a3);
  int v5 = (self->elements_->super.size_ - 1) & (self->tail_ + 1);
  self->tail_ = v5;
  if (v5 == self->head_)
  {
    sub_10025F698((uint64_t)self);
  }
}

- (BOOL)offerFirstWithId:(id)a3
{
  return 1;
}

- (BOOL)offerLastWithId:(id)a3
{
  return 1;
}

- (id)removeFirst
{
  id result = [(JavaUtilArrayDeque *)self pollFirst];
  if (!result)
  {
    v3 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v3);
  }
  return result;
}

- (id)removeLast
{
  id result = [(JavaUtilArrayDeque *)self pollLast];
  if (!result)
  {
    v3 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v3);
  }
  return result;
}

- (id)pollFirst
{
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  uint64_t head = self->head_;
  uint64_t size = elements->super.size_;
  if ((head & 0x80000000) != 0 || (int)head >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, head);
  }
  v6 = (&elements->elementType_)[head];
  if (v6)
  {
    IOSObjectArray_Set((uint64_t)self->elements_, head, 0);
    self->head_ = (self->elements_->super.size_ - 1) & (head + 1);
  }
  return v6;
}

- (id)pollLast
{
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  int v5 = self->tail_ - 1;
  uint64_t size = elements->super.size_;
  int v7 = (size - 1) & v5;
  if (v7 < 0 != v2 || v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (size - 1) & v5);
  }
  v9 = (&elements->elementType_)[v7];
  if (v9)
  {
    IOSObjectArray_Set((uint64_t)self->elements_, v7, 0);
    self->tail_ = v7;
  }
  return v9;
}

- (id)getFirst
{
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  int head = self->head_;
  uint64_t size = elements->super.size_;
  if (head < 0 || head >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, head);
  }
  id result = (&elements->elementType_)[head];
  if (!result)
  {
    v6 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v6);
  }
  return result;
}

- (id)getLast
{
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  int v4 = self->tail_ - 1;
  uint64_t size = elements->super.size_;
  int v6 = (size - 1) & v4;
  if (v6 < 0 != v2 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  id result = (&elements->elementType_)[v6];
  if (!result)
  {
    v9 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v9);
  }
  return result;
}

- (id)peekFirst
{
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  int head = self->head_;
  uint64_t size = elements->super.size_;
  if (head < 0 || head >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, head);
  }
  return (&elements->elementType_)[head];
}

- (id)peekLast
{
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  int v4 = self->tail_ - 1;
  uint64_t size = elements->super.size_;
  int v6 = (size - 1) & v4;
  if (v6 < 0 != v2 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (size - 1) & v4);
  }
  return (&elements->elementType_)[v6];
}

- (BOOL)removeFirstOccurrenceWithId:(id)a3
{
  if (a3)
  {
    elements = self->elements_;
    if (!elements) {
      JreThrowNullPointerException();
    }
    uint64_t size = elements->super.size_;
    int v7 = size - 1;
    int head = self->head_;
    while (1)
    {
      uint64_t v9 = head;
      if (head < 0 || head >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, head);
      }
      if (!(&elements->elementType_)[head]) {
        break;
      }
      if (objc_msgSend(a3, "isEqual:"))
      {
        sub_10026008C((uint64_t)self, v9);
        return 1;
      }
      int head = (v9 + 1) & v7;
      elements = self->elements_;
      uint64_t size = elements->super.size_;
    }
  }
  return 0;
}

- (BOOL)removeLastOccurrenceWithId:(id)a3
{
  if (a3)
  {
    elements = self->elements_;
    if (!elements) {
      JreThrowNullPointerException();
    }
    int v7 = elements->super.size_ - 1;
    int tail = self->tail_;
    while (1)
    {
      uint64_t v9 = self->elements_;
      uint64_t size = v9->super.size_;
      int tail = (tail - 1) & v7;
      if (tail < 0 != v3 || tail >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, tail);
      }
      if (!(&v9->elementType_)[tail]) {
        break;
      }
      if (objc_msgSend(a3, "isEqual:"))
      {
        sub_10026008C((uint64_t)self, tail);
        return 1;
      }
    }
  }
  return 0;
}

- (BOOL)addWithId:(id)a3
{
  return 1;
}

- (BOOL)offerWithId:(id)a3
{
  return [(JavaUtilArrayDeque *)self offerLastWithId:a3];
}

- (id)peek
{
  return [(JavaUtilArrayDeque *)self peekFirst];
}

- (BOOL)delete__WithInt:(int)a3
{
  return sub_10026008C((uint64_t)self, *(uint64_t *)&a3);
}

- (int)size
{
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  return (elements->super.size_ - 1) & (self->tail_ - self->head_);
}

- (BOOL)isEmpty
{
  return self->head_ == self->tail_;
}

- (id)iterator
{
  char v3 = [JavaUtilArrayDeque_DeqIterator alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->cursor_ = self->head_;
  v3->fence_ = self->tail_;
  v3->lastRet_ = -1;
  return v3;
}

- (id)descendingIterator
{
  char v3 = [JavaUtilArrayDeque_DescendingIterator alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->cursor_ = self->tail_;
  v3->fence_ = self->head_;
  v3->lastRet_ = -1;
  return v3;
}

- (BOOL)containsWithId:(id)a3
{
  if (!a3) {
    return 0;
  }
  elements = self->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  uint64_t size = elements->super.size_;
  int v7 = size - 1;
  int head = self->head_;
  while (1)
  {
    int v9 = head;
    if (head < 0 || head >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, head);
    }
    v10 = (&elements->elementType_)[head];
    BOOL v11 = v10 != 0;
    if (!v10 || (objc_msgSend(a3, "isEqual:") & 1) != 0) {
      break;
    }
    int head = (v9 + 1) & v7;
    elements = self->elements_;
    uint64_t size = elements->super.size_;
  }
  return v11;
}

- (BOOL)removeWithId:(id)a3
{
  return [(JavaUtilArrayDeque *)self removeFirstOccurrenceWithId:a3];
}

- (void)clear
{
  int head = self->head_;
  int tail = self->tail_;
  if (head != tail)
  {
    self->tail_ = 0;
    self->head_ = 0;
    elements = self->elements_;
    if (!elements) {
      JreThrowNullPointerException();
    }
    int v6 = elements->super.size_ - 1;
    do
    {
      IOSObjectArray_Set((uint64_t)self->elements_, head, 0);
      int head = (head + 1) & v6;
    }
    while (head != tail);
  }
}

- (id)toArray
{
  char v3 = +[IOSObjectArray arrayWithLength:[(JavaUtilArrayDeque *)self size] type:NSObject_class_()];
  return sub_10025F7CC((uint64_t)self, v3);
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  int v5 = [(JavaUtilArrayDeque *)self size];
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v6 = v5;
  if (*((_DWORD *)a3 + 2) < v5)
  {
    a3 = JavaLangReflectArray_newInstanceWithIOSClass_withInt_(objc_msgSend(objc_msgSend(a3, "getClass"), "getComponentType"), v5);
    objc_opt_class();
    if (!a3)
    {
      sub_10025F7CC((uint64_t)self, 0);
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  sub_10025F7CC((uint64_t)self, a3);
  if (*((_DWORD *)a3 + 2) > v6) {
    IOSObjectArray_Set((uint64_t)a3, v6, 0);
  }
  return a3;
}

- (id)clone
{
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilArrayDeque;
  char v3 = [(JavaUtilArrayDeque *)&v7 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_5;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  elements = self->elements_;
  if (!elements) {
LABEL_5:
  }
    JreThrowNullPointerException();
  int v5 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(elements, elements->super.size_);
  JreStrongAssign(v3 + 1, v5);
  return v3;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3
    || ([a3 defaultWriteObject],
        objc_msgSend(a3, "writeIntWithInt:", -[JavaUtilArrayDeque size](self, "size")),
        (elements = self->elements_) == 0))
  {
    JreThrowNullPointerException();
  }
  int head = self->head_;
  if (head != self->tail_)
  {
    int v7 = elements->super.size_ - 1;
    do
    {
      v8 = self->elements_;
      int v9 = head;
      uint64_t size = v8->super.size_;
      if (head < 0 || head >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, head);
      }
      [a3 writeObjectWithId:(&v8->elementType_)[head]];
      int head = (v9 + 1) & v7;
    }
    while (head != self->tail_);
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    goto LABEL_7;
  }
  [a3 defaultReadObject];
  int v5 = [a3 readInt];
  sub_10025F5D0((uint64_t)self, v5);
  self->head_ = 0;
  self->tail_ = v5;
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    while (1)
    {
      elements = self->elements_;
      if (!elements) {
        break;
      }
      IOSObjectArray_Set((uint64_t)elements, v6++, [a3 readObject]);
      if (v7 == v6) {
        return;
      }
    }
LABEL_7:
    JreThrowNullPointerException();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilArrayDeque;
  [(JavaUtilArrayDeque *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilArrayDeque *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046C140;
}

@end