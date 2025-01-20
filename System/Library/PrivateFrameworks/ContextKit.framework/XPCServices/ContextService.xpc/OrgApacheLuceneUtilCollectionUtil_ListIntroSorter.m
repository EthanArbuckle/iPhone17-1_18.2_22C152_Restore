@interface OrgApacheLuceneUtilCollectionUtil_ListIntroSorter
- (OrgApacheLuceneUtilCollectionUtil_ListIntroSorter)initWithJavaUtilList:(id)a3 withJavaUtilComparator:(id)a4;
- (int)comparePivotWithInt:(int)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setPivotWithInt:(int)a3;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilCollectionUtil_ListIntroSorter

- (OrgApacheLuceneUtilCollectionUtil_ListIntroSorter)initWithJavaUtilList:(id)a3 withJavaUtilComparator:(id)a4
{
  return self;
}

- (void)setPivotWithInt:(int)a3
{
  if (!self->list_) {
    JreThrowNullPointerException();
  }
  p_pivot = &self->pivot_;
  id v4 = [(JavaUtilList *)self->list_ getWithInt:*(void *)&a3];
  JreStrongAssign(p_pivot, v4);
}

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
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

- (int)comparePivotWithInt:(int)a3
{
  comp = self->comp_;
  if (!comp || !self->list_) {
    JreThrowNullPointerException();
  }
  id pivot = self->pivot_;
  id v5 = [(JavaUtilList *)self->list_ getWithInt:*(void *)&a3];
  return [(JavaUtilComparator *)comp compareWithId:pivot withId:v5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilCollectionUtil_ListIntroSorter;
  [(OrgApacheLuceneUtilCollectionUtil_ListIntroSorter *)&v3 dealloc];
}

@end