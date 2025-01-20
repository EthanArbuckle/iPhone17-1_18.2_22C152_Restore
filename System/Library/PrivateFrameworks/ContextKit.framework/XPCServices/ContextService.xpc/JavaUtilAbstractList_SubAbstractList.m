@interface JavaUtilAbstractList_SubAbstractList
+ (const)__metadata;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (JavaUtilAbstractList_SubAbstractList)initWithJavaUtilAbstractList:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)getWithInt:(int)a3;
- (id)iterator;
- (id)listIteratorWithInt:(int)a3;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addWithInt:(int)a3 withId:(id)a4;
- (void)dealloc;
- (void)removeRangeWithInt:(int)a3 withInt:(int)a4;
- (void)sizeChangedWithBoolean:(BOOL)a3;
@end

@implementation JavaUtilAbstractList_SubAbstractList

- (JavaUtilAbstractList_SubAbstractList)initWithJavaUtilAbstractList:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  fullList = self->fullList_;
  if (!fullList) {
    JreThrowNullPointerException();
  }
  if (self->super.modCount_ != fullList->modCount_)
  {
    v6 = new_JavaUtilConcurrentModificationException_init();
LABEL_9:
    objc_exception_throw(v6);
  }
  if (a3 < 0 || self->size_ < a3)
  {
    v6 = new_JavaLangIndexOutOfBoundsException_init();
    goto LABEL_9;
  }
  [(JavaUtilAbstractList *)fullList addWithInt:(self->offset_ + a3) withId:a4];
  ++self->size_;
  self->super.modCount_ = self->fullList_->modCount_;
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  fullList = self->fullList_;
  if (!fullList) {
    goto LABEL_9;
  }
  if (self->super.modCount_ != fullList->modCount_)
  {
    v9 = new_JavaUtilConcurrentModificationException_init();
LABEL_12:
    objc_exception_throw(v9);
  }
  if (a3 < 0 || self->size_ < a3)
  {
    v9 = new_JavaLangIndexOutOfBoundsException_init();
    goto LABEL_12;
  }
  unsigned int v7 = -[JavaUtilAbstractList addAllWithInt:withJavaUtilCollection:](fullList, "addAllWithInt:withJavaUtilCollection:", (self->offset_ + a3));
  if (v7)
  {
    if (a4)
    {
      self->size_ += [a4 size];
      self->super.modCount_ = self->fullList_->modCount_;
      return v7;
    }
LABEL_9:
    JreThrowNullPointerException();
  }
  return v7;
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  fullList = self->fullList_;
  if (!fullList) {
    goto LABEL_7;
  }
  if (self->super.modCount_ != fullList->modCount_)
  {
    v8 = new_JavaUtilConcurrentModificationException_init();
    objc_exception_throw(v8);
  }
  unsigned int v6 = [(JavaUtilAbstractList *)fullList addAllWithInt:(self->size_ + self->offset_) withJavaUtilCollection:a3];
  if (v6)
  {
    if (a3)
    {
      self->size_ += [a3 size];
      self->super.modCount_ = self->fullList_->modCount_;
      return v6;
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return v6;
}

- (id)getWithInt:(int)a3
{
  fullList = self->fullList_;
  if (!fullList) {
    JreThrowNullPointerException();
  }
  if (self->super.modCount_ != fullList->modCount_)
  {
    unsigned int v7 = new_JavaUtilConcurrentModificationException_init();
LABEL_11:
    objc_exception_throw(v7);
  }
  if (a3 < 0 || self->size_ <= a3)
  {
    unsigned int v7 = new_JavaLangIndexOutOfBoundsException_init();
    goto LABEL_11;
  }
  uint64_t v4 = (self->offset_ + a3);
  v5 = self->fullList_;
  return [(JavaUtilAbstractList *)v5 getWithInt:v4];
}

- (id)iterator
{
  return [(JavaUtilAbstractList_SubAbstractList *)self listIteratorWithInt:0];
}

- (id)listIteratorWithInt:(int)a3
{
  fullList = self->fullList_;
  if (!fullList) {
    JreThrowNullPointerException();
  }
  if (self->super.modCount_ != fullList->modCount_)
  {
    v10 = new_JavaUtilConcurrentModificationException_init();
LABEL_11:
    objc_exception_throw(v10);
  }
  if (a3 < 0 || self->size_ < a3)
  {
    v10 = new_JavaLangIndexOutOfBoundsException_init();
    goto LABEL_11;
  }
  id v5 = [(JavaUtilAbstractList *)fullList listIteratorWithInt:(self->offset_ + a3)];
  int offset = self->offset_;
  int size = self->size_;
  v8 = [JavaUtilAbstractList_SubAbstractList_SubAbstractListIterator alloc];
  JreStrongAssign((id *)&v8->iterator_, v5);
  JreStrongAssign((id *)&v8->subList_, self);
  v8->start_ = offset;
  v8->end_ = size + offset;
  return v8;
}

- (id)removeWithInt:(int)a3
{
  fullList = self->fullList_;
  if (!fullList) {
    JreThrowNullPointerException();
  }
  if (self->super.modCount_ != fullList->modCount_)
  {
    unsigned int v6 = new_JavaUtilConcurrentModificationException_init();
LABEL_9:
    objc_exception_throw(v6);
  }
  if (a3 < 0 || self->size_ <= a3)
  {
    unsigned int v6 = new_JavaLangIndexOutOfBoundsException_init();
    goto LABEL_9;
  }
  id result = [(JavaUtilAbstractList *)fullList removeWithInt:(self->offset_ + a3)];
  --self->size_;
  self->super.modCount_ = self->fullList_->modCount_;
  return result;
}

- (void)removeRangeWithInt:(int)a3 withInt:(int)a4
{
  int v4 = a3 - a4;
  if (a3 != a4)
  {
    fullList = self->fullList_;
    if (!fullList) {
      JreThrowNullPointerException();
    }
    if (self->super.modCount_ != fullList->modCount_)
    {
      unsigned int v7 = new_JavaUtilConcurrentModificationException_init();
      objc_exception_throw(v7);
    }
    [(JavaUtilAbstractList *)fullList removeRangeWithInt:(self->offset_ + a3) withInt:(self->offset_ + a4)];
    self->size_ += v4;
    self->super.modCount_ = self->fullList_->modCount_;
  }
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  fullList = self->fullList_;
  if (!fullList) {
    JreThrowNullPointerException();
  }
  if (self->super.modCount_ != fullList->modCount_)
  {
    v8 = new_JavaUtilConcurrentModificationException_init();
LABEL_11:
    objc_exception_throw(v8);
  }
  if (a3 < 0 || self->size_ <= a3)
  {
    v8 = new_JavaLangIndexOutOfBoundsException_init();
    goto LABEL_11;
  }
  uint64_t v5 = (self->offset_ + a3);
  unsigned int v6 = self->fullList_;
  return [(JavaUtilAbstractList *)v6 setWithInt:v5 withId:a4];
}

- (int)size
{
  fullList = self->fullList_;
  if (!fullList) {
    JreThrowNullPointerException();
  }
  if (self->super.modCount_ != fullList->modCount_)
  {
    int v4 = new_JavaUtilConcurrentModificationException_init();
    objc_exception_throw(v4);
  }
  return self->size_;
}

- (void)sizeChangedWithBoolean:(BOOL)a3
{
  int size = self->size_;
  if (a3) {
    int v4 = size + 1;
  }
  else {
    int v4 = size - 1;
  }
  self->size_ = v4;
  fullList = self->fullList_;
  if (!fullList) {
    JreThrowNullPointerException();
  }
  self->super.modCount_ = fullList->modCount_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilAbstractList_SubAbstractList;
  [(JavaUtilAbstractList_SubAbstractList *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004751A0;
}

@end