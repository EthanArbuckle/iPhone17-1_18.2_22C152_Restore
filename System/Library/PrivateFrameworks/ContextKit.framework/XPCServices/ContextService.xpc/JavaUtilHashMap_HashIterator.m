@interface JavaUtilHashMap_HashIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilHashMap_HashIterator)initWithJavaUtilHashMap:(id)a3;
- (id)nextEntry;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilHashMap_HashIterator

- (JavaUtilHashMap_HashIterator)initWithJavaUtilHashMap:(id)a3
{
  return self;
}

- (BOOL)hasNext
{
  return self->nextEntry_ != 0;
}

- (id)nextEntry
{
  v2 = self->this$0_;
  if (v2->modCount_ != self->expectedModCount_)
  {
    v12 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_19;
  }
  p_nextEntry = &self->nextEntry_;
  nextEntry = self->nextEntry_;
  if (!nextEntry)
  {
    v12 = new_JavaUtilNoSuchElementException_init();
LABEL_19:
    objc_exception_throw(v12);
  }
  next = nextEntry->next_;
  if (!next)
  {
    table = v2->table_;
    if (!table) {
      JreThrowNullPointerException();
    }
    int nextIndex = self->nextIndex_;
    p_size = &table->super.size_;
    if (nextIndex >= table->super.size_)
    {
LABEL_12:
      next = 0;
    }
    else
    {
      while (1)
      {
        self->nextIndex_ = nextIndex + 1;
        uint64_t v10 = *p_size;
        if (nextIndex < 0 || nextIndex >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, nextIndex);
        }
        next = (JavaUtilHashMap_HashMapEntry *)(&table->elementType_)[nextIndex];
        if (next) {
          break;
        }
        int nextIndex = self->nextIndex_;
        p_size = &table->super.size_;
        if (nextIndex >= table->super.size_) {
          goto LABEL_12;
        }
      }
    }
  }
  JreStrongAssign((id *)p_nextEntry, next);
  return JreStrongAssign((id *)&self->lastEntryReturned_, nextEntry);
}

- (void)remove
{
  p_lastEntryReturned = &self->lastEntryReturned_;
  lastEntryReturned = self->lastEntryReturned_;
  if (!lastEntryReturned)
  {
    v6 = new_JavaLangIllegalStateException_init();
    goto LABEL_6;
  }
  v5 = self->this$0_;
  if (v5->modCount_ != self->expectedModCount_)
  {
    v6 = new_JavaUtilConcurrentModificationException_init();
LABEL_6:
    objc_exception_throw(v6);
  }
  [(JavaUtilHashMap *)v5 removeWithId:lastEntryReturned->key_];
  JreStrongAssign((id *)p_lastEntryReturned, 0);
  self->expectedModCount_ = self->this$0_->modCount_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashMap_HashIterator;
  [(JavaUtilHashMap_HashIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100432A58;
}

@end