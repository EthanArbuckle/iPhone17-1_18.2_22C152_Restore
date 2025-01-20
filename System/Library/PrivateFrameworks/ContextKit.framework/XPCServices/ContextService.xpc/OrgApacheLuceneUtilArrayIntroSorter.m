@interface OrgApacheLuceneUtilArrayIntroSorter
- (OrgApacheLuceneUtilArrayIntroSorter)initWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4;
- (int)comparePivotWithInt:(int)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setPivotWithInt:(int)a3;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilArrayIntroSorter

- (OrgApacheLuceneUtilArrayIntroSorter)initWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4
{
  return self;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  comparator = self->comparator_;
  if (!comparator || (arr = self->arr_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t size = arr->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  v7 = (&arr->elementType_)[a4];
  v8 = (&arr->elementType_)[a3];
  return [(JavaUtilComparator *)comparator compareWithId:v8 withId:v7];
}

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
}

- (void)setPivotWithInt:(int)a3
{
  arr = self->arr_;
  if (!arr) {
    JreThrowNullPointerException();
  }
  uint64_t size = arr->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v6 = (&arr->elementType_)[a3];
  JreStrongAssign(&self->pivot_, v6);
}

- (int)comparePivotWithInt:(int)a3
{
  comparator = self->comparator_;
  if (!comparator || (arr = self->arr_) == 0) {
    JreThrowNullPointerException();
  }
  id pivot = self->pivot_;
  uint64_t size = arr->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v7 = (&arr->elementType_)[a3];
  return [(JavaUtilComparator *)comparator compareWithId:pivot withId:v7];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilArrayIntroSorter;
  [(OrgApacheLuceneUtilArrayIntroSorter *)&v3 dealloc];
}

@end