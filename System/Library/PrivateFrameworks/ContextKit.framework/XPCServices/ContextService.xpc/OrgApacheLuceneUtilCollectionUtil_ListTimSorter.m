@interface OrgApacheLuceneUtilCollectionUtil_ListTimSorter
- (OrgApacheLuceneUtilCollectionUtil_ListTimSorter)initWithJavaUtilList:(id)a3 withJavaUtilComparator:(id)a4 withInt:(int)a5;
- (int)compareSavedWithInt:(int)a3 withInt:(int)a4;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)restoreWithInt:(int)a3 withInt:(int)a4;
- (void)saveWithInt:(int)a3 withInt:(int)a4;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilCollectionUtil_ListTimSorter

- (OrgApacheLuceneUtilCollectionUtil_ListTimSorter)initWithJavaUtilList:(id)a3 withJavaUtilComparator:(id)a4 withInt:(int)a5
{
  return self;
}

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *(void *)&a4;
  id v6 = [(JavaUtilList *)self->list_ getWithInt:*(void *)&a3];
  [(JavaUtilList *)list setWithInt:v5 withId:v6];
}

- (void)saveWithInt:(int)a3 withInt:(int)a4
{
  if (a4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a4;
    do
    {
      tmp = self->tmp_;
      if (!tmp || (list = self->list_) == 0) {
        JreThrowNullPointerException();
      }
      IOSObjectArray_Set((uint64_t)tmp, v5, [(JavaUtilList *)list getWithInt:(a3 + v5)]);
      ++v5;
    }
    while (v6 != v5);
  }
}

- (void)restoreWithInt:(int)a3 withInt:(int)a4
{
  list = self->list_;
  if (!list || (tmp = self->tmp_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *(void *)&a4;
  uint64_t size = tmp->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v8 = (&tmp->elementType_)[a3];
  [(JavaUtilList *)list setWithInt:v6 withId:v8];
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  comp = self->comp_;
  if (!comp || (list = self->list_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(void *)&a4;
  id v8 = [(JavaUtilList *)list getWithInt:*(void *)&a3];
  id v9 = [(JavaUtilList *)self->list_ getWithInt:v7];
  return [(JavaUtilComparator *)comp compareWithId:v8 withId:v9];
}

- (int)compareSavedWithInt:(int)a3 withInt:(int)a4
{
  comp = self->comp_;
  if (!comp) {
    goto LABEL_9;
  }
  tmp = self->tmp_;
  if (!tmp) {
    goto LABEL_9;
  }
  uint64_t size = tmp->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  list = self->list_;
  if (!list) {
LABEL_9:
  }
    JreThrowNullPointerException();
  id v9 = (&tmp->elementType_)[a3];
  id v10 = -[JavaUtilList getWithInt:](list, "getWithInt:", *(void *)&a4, *(void *)&a4);
  return [(JavaUtilComparator *)comp compareWithId:v9 withId:v10];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilCollectionUtil_ListTimSorter;
  [(OrgApacheLuceneUtilTimSorter *)&v3 dealloc];
}

@end