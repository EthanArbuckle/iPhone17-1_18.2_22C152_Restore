@interface JavaUtilHashtable_HashIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilHashtable_HashIterator)initWithJavaUtilHashtable:(id)a3;
- (id)nextEntry;
- (id)nextEntryNotFailFast;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilHashtable_HashIterator

- (JavaUtilHashtable_HashIterator)initWithJavaUtilHashtable:(id)a3
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
        next = (JavaUtilHashtable_HashtableEntry *)(&table->elementType_)[nextIndex];
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

- (id)nextEntryNotFailFast
{
  p_nextEntry = &self->nextEntry_;
  nextEntry = self->nextEntry_;
  if (!nextEntry)
  {
    v11 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v11);
  }
  next = nextEntry->next_;
  if (!next)
  {
    table = self->this$0_->table_;
    if (!table) {
      JreThrowNullPointerException();
    }
    int nextIndex = self->nextIndex_;
    p_size = &table->super.size_;
    if (nextIndex >= table->super.size_)
    {
LABEL_11:
      next = 0;
    }
    else
    {
      while (1)
      {
        self->nextIndex_ = nextIndex + 1;
        uint64_t v9 = *p_size;
        if (nextIndex < 0 || nextIndex >= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg(v9, nextIndex);
        }
        next = (JavaUtilHashtable_HashtableEntry *)(&table->elementType_)[nextIndex];
        if (next) {
          break;
        }
        int nextIndex = self->nextIndex_;
        p_size = &table->super.size_;
        if (nextIndex >= table->super.size_) {
          goto LABEL_11;
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
  [(JavaUtilHashtable *)v5 removeWithId:lastEntryReturned->key_];
  JreStrongAssign((id *)p_lastEntryReturned, 0);
  self->expectedModCount_ = self->this$0_->modCount_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashtable_HashIterator;
  [(JavaUtilHashtable_HashIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100441E20;
}

@end